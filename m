Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30A0517718
	for <lists+amd-gfx@lfdr.de>; Mon,  2 May 2022 21:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A0310EBB1;
	Mon,  2 May 2022 19:04:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DE210EBB1
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 May 2022 19:04:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gz47O3HurjWZGS0Atxj/BYehJ9355zhr40nTdl1pOi3EX3fWzIpkrKNmz/SutLC1zlhP5s0+iuMkhRS1XUcfc+y8jYeHF5gtPh7iEP0nA0XWreZ/kGlT9jEUbowuHQeXENpE8BXTSRX03/zWUcdbOTtHOz24XiJyjnyOJQpkbnx/HIa4/OcDlsDGlYry9sL1oUll2KHofZn99VPJJWqEoAeajPKT28Av7mRl/xI6ywFqTEi+j0EAdW3+BeByVHzs1lUl+wmoL2brx1szBBT5avCMFHWAv2H44sJ2F2sfOzYYnHYAynlsYbJDU4n1ivNqy2M50NyN55xzRq72TRNJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0eZ0q2e4FnTS449EpgYbGTxC34bQnN4k+39N+9KsOE=;
 b=k3pGAbjyBK+XuHBdfYvMSpcEhmhj1nt1qXNs5ZuhIedeL1EyZlyMZ+/UOa5eYP5+z/M9Bhbzygqh4S4WWgXHyBQtrSMWK5KTV9BMmFRxWzNal6ZJadc1cNZjyR1dkVJPHv0mKg1Ghj5Mi7xpUbbSSD4FBwvVsVBdmmVkgnv1Rcg8h6nvftDjfzwyHvc8qEDPD9i9Oa3G8xULhy6KB+TC+FNZHzgPx3OdQCGLzJliiDpWKStZypDiqWQr6+AZOEelxQEIlWHS931BLf+aOfgAVCRNUZu7t8Zn/cwAynSH00wcS9KWYXL3wdtulj16GqNpEx4x0kDBTE6CY/GDm70Qbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0eZ0q2e4FnTS449EpgYbGTxC34bQnN4k+39N+9KsOE=;
 b=pigr/p0Y/lRVKqoAZ9LRMHv6Umc1JiW8YBmtuS4C6alMX4GFT3VPvR933tzOoObVyWgBOScXlB7mw6XO71OddVCD7Re8dA5h0fmNW6A2XKi6zZceg/k8/QR5MBeLU2qHGbRjhvB34XhhGFdGXyMZCKHf2mFwduiwmjY4DQStgL4=
Received: from MW4PR04CA0113.namprd04.prod.outlook.com (2603:10b6:303:83::28)
 by DM6PR12MB3769.namprd12.prod.outlook.com (2603:10b6:5:14a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 19:03:58 +0000
Received: from CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::5d) by MW4PR04CA0113.outlook.office365.com
 (2603:10b6:303:83::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Mon, 2 May 2022 19:03:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT006.mail.protection.outlook.com (10.13.174.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Mon, 2 May 2022 19:03:58 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 2 May
 2022 14:03:54 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: add sdma v6_0_0 pkt header v3
Date: Mon, 2 May 2022 15:03:41 -0400
Message-ID: <20220502190343.783897-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8892eecc-b185-47a2-91b7-08da2c6e8326
X-MS-TrafficTypeDiagnostic: DM6PR12MB3769:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB376993B6F7C77BB718DA3076F7C19@DM6PR12MB3769.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x/anYTeL9LMOont9AGZ9S1+gO7LYRnXehVlhWkvvoluJPVxvOC8L3VtWXEuZZzHSLOoKW/aeXoYDBoFq13npzPQ0d8ygGSoCzszlJ7i4lFpwl+UACvTZDqL9y0YcM5oAmcnUJ2ecCIz1uSmNHW4G1LSqio5Cw1rjVYwkHzyye38uNADhpCb+m34bHMlLe3S1iHce0LQx4s+TIY99dMCXciWbbS/CJCjf349fcK+ZxVodgXFjPjINWPoiQe6chtbFE4eBntyGHdrFnX4atup2Lwueg3OpyiKETOIND2R4y6BdKhh8O0jH4pivjyiVEKiznlvVKxSkjKdJEcGYayN73Qp5FQmfC3TQOxAJ1sKIBeGWercB1CmqWmi3kpacMPhkmgsH50SNCjhYDRhQbfGNu+2N8AXGRtgDzUI7uHOnCg+L/U4s4WiJev00t8ipBTHOAQuJEDxXy7V8XseSR5u8mdch2uzcNoCI3/7gt7W8sm9SO1ldA6Dn4yPFvlUMOEwMzun8p/thfuC+Mdwog9wBmrPmcPBrfE2ZH/+MHgbgl107js3NPH39bWMxKW4rPDmxW0wOtCwVfI3+ukilQAlU4gS0qKp8rPUcdxS1TL93cThDrJreHKLBNPo3lWgRAYlNMtygHGl7ehkvSJYZj16h1b588XxEcJYXy2xaubvgmjFDYS5bbHF0IsNm1OYGL0h0f+h4H/KnEsq50kQy9yiRlQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(81166007)(4326008)(8936002)(70206006)(83380400001)(336012)(8676002)(426003)(70586007)(47076005)(508600001)(40460700003)(7696005)(82310400005)(26005)(54906003)(6666004)(1076003)(16526019)(6916009)(186003)(86362001)(316002)(2616005)(356005)(36756003)(2906002)(36860700001)(30864003)(5660300002)(36900700001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 19:03:58.2839 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8892eecc-b185-47a2-91b7-08da2c6e8326
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3769
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Hawking Zhang <Hawking.Zhang@amd.com>

v1: add sdma v6_0_0 pkt definitions (Hawking)
v2: add gcr control field definition (Likun)
v3: correct some definitions (Likun)

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h | 5664 +++++++++++++++++
 1 file changed, 5664 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h
new file mode 100644
index 000000000000..6af23e7888ca
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0_0_pkt_open.h
@@ -0,0 +1,5664 @@
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
+#ifndef __SDMA_V6_0_0_PKT_OPEN_H_
+#define __SDMA_V6_0_0_PKT_OPEN_H_
+
+#define SDMA_OP_NOP  0
+#define SDMA_OP_COPY  1
+#define SDMA_OP_WRITE  2
+#define SDMA_OP_INDIRECT  4
+#define SDMA_OP_FENCE  5
+#define SDMA_OP_TRAP  6
+#define SDMA_OP_SEM  7
+#define SDMA_OP_POLL_REGMEM  8
+#define SDMA_OP_COND_EXE  9
+#define SDMA_OP_ATOMIC  10
+#define SDMA_OP_CONST_FILL  11
+#define SDMA_OP_PTEPDE  12
+#define SDMA_OP_TIMESTAMP  13
+#define SDMA_OP_SRBM_WRITE  14
+#define SDMA_OP_PRE_EXE  15
+#define SDMA_OP_GPUVM_INV  16
+#define SDMA_OP_GCR_REQ  17
+#define SDMA_OP_DUMMY_TRAP  32
+#define SDMA_SUBOP_TIMESTAMP_SET  0
+#define SDMA_SUBOP_TIMESTAMP_GET  1
+#define SDMA_SUBOP_TIMESTAMP_GET_GLOBAL  2
+#define SDMA_SUBOP_COPY_LINEAR  0
+#define SDMA_SUBOP_COPY_LINEAR_SUB_WIND  4
+#define SDMA_SUBOP_COPY_TILED  1
+#define SDMA_SUBOP_COPY_TILED_SUB_WIND  5
+#define SDMA_SUBOP_COPY_T2T_SUB_WIND  6
+#define SDMA_SUBOP_COPY_SOA  3
+#define SDMA_SUBOP_COPY_DIRTY_PAGE  7
+#define SDMA_SUBOP_COPY_LINEAR_PHY  8
+#define SDMA_SUBOP_COPY_LINEAR_SUB_WIND_LARGE  36
+#define SDMA_SUBOP_COPY_LINEAR_BC  16
+#define SDMA_SUBOP_COPY_TILED_BC  17
+#define SDMA_SUBOP_COPY_LINEAR_SUB_WIND_BC  20
+#define SDMA_SUBOP_COPY_TILED_SUB_WIND_BC  21
+#define SDMA_SUBOP_COPY_T2T_SUB_WIND_BC  22
+#define SDMA_SUBOP_WRITE_LINEAR  0
+#define SDMA_SUBOP_WRITE_TILED  1
+#define SDMA_SUBOP_WRITE_TILED_BC  17
+#define SDMA_SUBOP_PTEPDE_GEN  0
+#define SDMA_SUBOP_PTEPDE_COPY  1
+#define SDMA_SUBOP_PTEPDE_RMW  2
+#define SDMA_SUBOP_PTEPDE_COPY_BACKWARDS  3
+#define SDMA_SUBOP_MEM_INCR  1
+#define SDMA_SUBOP_DATA_FILL_MULTI  1
+#define SDMA_SUBOP_POLL_REG_WRITE_MEM  1
+#define SDMA_SUBOP_POLL_DBIT_WRITE_MEM  2
+#define SDMA_SUBOP_POLL_MEM_VERIFY  3
+#define SDMA_SUBOP_VM_INVALIDATION  4
+#define HEADER_AGENT_DISPATCH  4
+#define HEADER_BARRIER  5
+#define SDMA_OP_AQL_COPY  0
+#define SDMA_OP_AQL_BARRIER_OR  0
+
+#define SDMA_GCR_RANGE_IS_PA		(1 << 18)
+#define SDMA_GCR_SEQ(x)			(((x) & 0x3) << 16)
+#define SDMA_GCR_GL2_WB			(1 << 15)
+#define SDMA_GCR_GL2_INV		(1 << 14)
+#define SDMA_GCR_GL2_DISCARD		(1 << 13)
+#define SDMA_GCR_GL2_RANGE(x)		(((x) & 0x3) << 11)
+#define SDMA_GCR_GL2_US			(1 << 10)
+#define SDMA_GCR_GL1_INV		(1 << 9)
+#define SDMA_GCR_GLV_INV		(1 << 8)
+#define SDMA_GCR_GLK_INV		(1 << 7)
+#define SDMA_GCR_GLK_WB			(1 << 6)
+#define SDMA_GCR_GLM_INV		(1 << 5)
+#define SDMA_GCR_GLM_WB			(1 << 4)
+#define SDMA_GCR_GL1_RANGE(x)		(((x) & 0x3) << 2)
+#define SDMA_GCR_GLI_INV(x)		(((x) & 0x3) << 0)
+/*
+** Definitions for SDMA_PKT_COPY_LINEAR packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_LINEAR_HEADER_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_HEADER_op_shift  0
+#define SDMA_PKT_COPY_LINEAR_HEADER_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_HEADER_op_mask) << SDMA_PKT_COPY_LINEAR_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_LINEAR_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_LINEAR_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_HEADER_sub_op_mask) << SDMA_PKT_COPY_LINEAR_HEADER_sub_op_shift)
+
+/*define for encrypt field*/
+#define SDMA_PKT_COPY_LINEAR_HEADER_encrypt_offset 0
+#define SDMA_PKT_COPY_LINEAR_HEADER_encrypt_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_HEADER_encrypt_shift  16
+#define SDMA_PKT_COPY_LINEAR_HEADER_ENCRYPT(x) (((x) & SDMA_PKT_COPY_LINEAR_HEADER_encrypt_mask) << SDMA_PKT_COPY_LINEAR_HEADER_encrypt_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_LINEAR_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_LINEAR_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_LINEAR_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_LINEAR_HEADER_tmz_mask) << SDMA_PKT_COPY_LINEAR_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_LINEAR_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_LINEAR_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_HEADER_cpv_shift  19
+#define SDMA_PKT_COPY_LINEAR_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_LINEAR_HEADER_cpv_mask) << SDMA_PKT_COPY_LINEAR_HEADER_cpv_shift)
+
+/*define for backwards field*/
+#define SDMA_PKT_COPY_LINEAR_HEADER_backwards_offset 0
+#define SDMA_PKT_COPY_LINEAR_HEADER_backwards_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_HEADER_backwards_shift  25
+#define SDMA_PKT_COPY_LINEAR_HEADER_BACKWARDS(x) (((x) & SDMA_PKT_COPY_LINEAR_HEADER_backwards_mask) << SDMA_PKT_COPY_LINEAR_HEADER_backwards_shift)
+
+/*define for broadcast field*/
+#define SDMA_PKT_COPY_LINEAR_HEADER_broadcast_offset 0
+#define SDMA_PKT_COPY_LINEAR_HEADER_broadcast_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_HEADER_broadcast_shift  27
+#define SDMA_PKT_COPY_LINEAR_HEADER_BROADCAST(x) (((x) & SDMA_PKT_COPY_LINEAR_HEADER_broadcast_mask) << SDMA_PKT_COPY_LINEAR_HEADER_broadcast_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_LINEAR_COUNT_count_offset 1
+#define SDMA_PKT_COPY_LINEAR_COUNT_count_mask   0x3FFFFFFF
+#define SDMA_PKT_COPY_LINEAR_COUNT_count_shift  0
+#define SDMA_PKT_COPY_LINEAR_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_LINEAR_COUNT_count_mask) << SDMA_PKT_COPY_LINEAR_COUNT_count_shift)
+
+/*define for PARAMETER word*/
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_dst_sw_offset 2
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_dst_sw_shift  16
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_DST_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_PARAMETER_dst_sw_mask) << SDMA_PKT_COPY_LINEAR_PARAMETER_dst_sw_shift)
+
+/*define for dst_cache_policy field*/
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_offset 2
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_shift  18
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_DST_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_mask) << SDMA_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_src_sw_offset 2
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_src_sw_shift  24
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_SRC_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_PARAMETER_src_sw_mask) << SDMA_PKT_COPY_LINEAR_PARAMETER_src_sw_shift)
+
+/*define for src_cache_policy field*/
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_offset 2
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_shift  26
+#define SDMA_PKT_COPY_LINEAR_PARAMETER_SRC_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_mask) << SDMA_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_offset 3
+#define SDMA_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_offset 4
+#define SDMA_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_offset 5
+#define SDMA_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_offset 6
+#define SDMA_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_LINEAR_BC packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_LINEAR_BC_HEADER_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_BC_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_BC_HEADER_op_shift  0
+#define SDMA_PKT_COPY_LINEAR_BC_HEADER_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_HEADER_op_mask) << SDMA_PKT_COPY_LINEAR_BC_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_LINEAR_BC_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_BC_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_BC_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_LINEAR_BC_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_HEADER_sub_op_mask) << SDMA_PKT_COPY_LINEAR_BC_HEADER_sub_op_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_LINEAR_BC_COUNT_count_offset 1
+#define SDMA_PKT_COPY_LINEAR_BC_COUNT_count_mask   0x003FFFFF
+#define SDMA_PKT_COPY_LINEAR_BC_COUNT_count_shift  0
+#define SDMA_PKT_COPY_LINEAR_BC_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_COUNT_count_mask) << SDMA_PKT_COPY_LINEAR_BC_COUNT_count_shift)
+
+/*define for PARAMETER word*/
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_sw_offset 2
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_sw_shift  16
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_DST_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_sw_mask) << SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_sw_shift)
+
+/*define for dst_ha field*/
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_ha_offset 2
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_ha_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_ha_shift  19
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_DST_HA(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_ha_mask) << SDMA_PKT_COPY_LINEAR_BC_PARAMETER_dst_ha_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_sw_offset 2
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_sw_shift  24
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_SRC_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_sw_mask) << SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_sw_shift)
+
+/*define for src_ha field*/
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_ha_offset 2
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_ha_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_ha_shift  27
+#define SDMA_PKT_COPY_LINEAR_BC_PARAMETER_SRC_HA(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_ha_mask) << SDMA_PKT_COPY_LINEAR_BC_PARAMETER_src_ha_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_LO_src_addr_31_0_offset 3
+#define SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_HI_src_addr_63_32_offset 4
+#define SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_BC_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_LO_dst_addr_31_0_offset 5
+#define SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_HI_dst_addr_63_32_offset 6
+#define SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_BC_DST_ADDR_HI_dst_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_DIRTY_PAGE packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_op_offset 0
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_op_shift  0
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_OP(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_HEADER_op_mask) << SDMA_PKT_COPY_DIRTY_PAGE_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_HEADER_sub_op_mask) << SDMA_PKT_COPY_DIRTY_PAGE_HEADER_sub_op_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_HEADER_tmz_mask) << SDMA_PKT_COPY_DIRTY_PAGE_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_cpv_shift  19
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_HEADER_cpv_mask) << SDMA_PKT_COPY_DIRTY_PAGE_HEADER_cpv_shift)
+
+/*define for all field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_all_offset 0
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_all_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_all_shift  31
+#define SDMA_PKT_COPY_DIRTY_PAGE_HEADER_ALL(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_HEADER_all_mask) << SDMA_PKT_COPY_DIRTY_PAGE_HEADER_all_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_COUNT_count_offset 1
+#define SDMA_PKT_COPY_DIRTY_PAGE_COUNT_count_mask   0x003FFFFF
+#define SDMA_PKT_COPY_DIRTY_PAGE_COUNT_count_shift  0
+#define SDMA_PKT_COPY_DIRTY_PAGE_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_COUNT_count_mask) << SDMA_PKT_COPY_DIRTY_PAGE_COUNT_count_shift)
+
+/*define for PARAMETER word*/
+/*define for dst_mtype field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_mtype_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_mtype_mask   0x00000007
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_mtype_shift  3
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_DST_MTYPE(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_mtype_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_mtype_shift)
+
+/*define for dst_l2_policy field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_l2_policy_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_l2_policy_mask   0x00000003
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_l2_policy_shift  6
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_DST_L2_POLICY(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_l2_policy_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_l2_policy_shift)
+
+/*define for dst_llc field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_llc_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_llc_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_llc_shift  8
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_DST_LLC(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_llc_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_llc_shift)
+
+/*define for src_mtype field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_mtype_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_mtype_mask   0x00000007
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_mtype_shift  11
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_SRC_MTYPE(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_mtype_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_mtype_shift)
+
+/*define for src_l2_policy field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_l2_policy_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_l2_policy_mask   0x00000003
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_l2_policy_shift  14
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_SRC_L2_POLICY(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_l2_policy_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_l2_policy_shift)
+
+/*define for src_llc field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_llc_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_llc_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_llc_shift  16
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_SRC_LLC(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_llc_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_llc_shift)
+
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sw_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sw_shift  17
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_DST_SW(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sw_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sw_shift)
+
+/*define for dst_gcc field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gcc_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gcc_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gcc_shift  19
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_DST_GCC(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gcc_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gcc_shift)
+
+/*define for dst_sys field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sys_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sys_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sys_shift  20
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_DST_SYS(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sys_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_sys_shift)
+
+/*define for dst_snoop field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_snoop_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_snoop_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_snoop_shift  22
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_DST_SNOOP(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_snoop_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_snoop_shift)
+
+/*define for dst_gpa field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gpa_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gpa_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gpa_shift  23
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_DST_GPA(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gpa_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_dst_gpa_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sw_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sw_shift  24
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_SRC_SW(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sw_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sw_shift)
+
+/*define for src_sys field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sys_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sys_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sys_shift  28
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_SRC_SYS(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sys_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_sys_shift)
+
+/*define for src_snoop field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_snoop_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_snoop_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_snoop_shift  30
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_SRC_SNOOP(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_snoop_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_snoop_shift)
+
+/*define for src_gpa field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_gpa_offset 2
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_gpa_mask   0x00000001
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_gpa_shift  31
+#define SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_SRC_GPA(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_gpa_mask) << SDMA_PKT_COPY_DIRTY_PAGE_PARAMETER_src_gpa_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_LO_src_addr_31_0_offset 3
+#define SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_HI_src_addr_63_32_offset 4
+#define SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_DIRTY_PAGE_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_LO_dst_addr_31_0_offset 5
+#define SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_HI_dst_addr_63_32_offset 6
+#define SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_DIRTY_PAGE_DST_ADDR_HI_dst_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_PHYSICAL_LINEAR packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_op_offset 0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_op_shift  0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_OP(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_op_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_sub_op_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_sub_op_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_tmz_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_cpv_shift  19
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_cpv_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_HEADER_cpv_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_count_offset 1
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_count_mask   0x003FFFFF
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_count_shift  0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_count_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_count_shift)
+
+/*define for addr_pair_num field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_addr_pair_num_offset 1
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_addr_pair_num_mask   0x000000FF
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_addr_pair_num_shift  24
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_ADDR_PAIR_NUM(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_addr_pair_num_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_COUNT_addr_pair_num_shift)
+
+/*define for PARAMETER word*/
+/*define for dst_mtype field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_mtype_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_mtype_mask   0x00000007
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_mtype_shift  3
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_MTYPE(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_mtype_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_mtype_shift)
+
+/*define for dst_l2_policy field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_l2_policy_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_l2_policy_mask   0x00000003
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_l2_policy_shift  6
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_L2_POLICY(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_l2_policy_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_l2_policy_shift)
+
+/*define for dst_llc field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_llc_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_llc_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_llc_shift  8
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_LLC(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_llc_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_llc_shift)
+
+/*define for src_mtype field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_mtype_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_mtype_mask   0x00000007
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_mtype_shift  11
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_SRC_MTYPE(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_mtype_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_mtype_shift)
+
+/*define for src_l2_policy field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_l2_policy_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_l2_policy_mask   0x00000003
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_l2_policy_shift  14
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_SRC_L2_POLICY(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_l2_policy_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_l2_policy_shift)
+
+/*define for src_llc field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_llc_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_llc_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_llc_shift  16
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_SRC_LLC(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_llc_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_llc_shift)
+
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sw_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sw_shift  17
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_SW(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sw_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sw_shift)
+
+/*define for dst_gcc field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gcc_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gcc_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gcc_shift  19
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_GCC(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gcc_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gcc_shift)
+
+/*define for dst_sys field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sys_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sys_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sys_shift  20
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_SYS(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sys_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_sys_shift)
+
+/*define for dst_log field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_log_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_log_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_log_shift  21
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_LOG(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_log_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_log_shift)
+
+/*define for dst_snoop field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_snoop_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_snoop_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_snoop_shift  22
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_SNOOP(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_snoop_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_snoop_shift)
+
+/*define for dst_gpa field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gpa_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gpa_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gpa_shift  23
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_DST_GPA(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gpa_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_dst_gpa_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sw_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sw_shift  24
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_SRC_SW(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sw_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sw_shift)
+
+/*define for src_gcc field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gcc_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gcc_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gcc_shift  27
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_SRC_GCC(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gcc_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gcc_shift)
+
+/*define for src_sys field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sys_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sys_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sys_shift  28
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_SRC_SYS(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sys_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_sys_shift)
+
+/*define for src_snoop field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_snoop_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_snoop_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_snoop_shift  30
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_SRC_SNOOP(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_snoop_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_snoop_shift)
+
+/*define for src_gpa field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gpa_offset 2
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gpa_mask   0x00000001
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gpa_shift  31
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_SRC_GPA(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gpa_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_PARAMETER_src_gpa_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_LO_src_addr_31_0_offset 3
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_HI_src_addr_63_32_offset 4
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_LO_dst_addr_31_0_offset 5
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_HI_dst_addr_63_32_offset 6
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_PHYSICAL_LINEAR_DST_ADDR_HI_dst_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_BROADCAST_LINEAR packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_op_offset 0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_op_shift  0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_OP(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_op_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_sub_op_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_sub_op_shift)
+
+/*define for encrypt field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_encrypt_offset 0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_encrypt_mask   0x00000001
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_encrypt_shift  16
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_ENCRYPT(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_encrypt_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_encrypt_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_tmz_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_cpv_shift  19
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_cpv_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_cpv_shift)
+
+/*define for broadcast field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_broadcast_offset 0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_broadcast_mask   0x00000001
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_broadcast_shift  27
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_BROADCAST(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_broadcast_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_HEADER_broadcast_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_COUNT_count_offset 1
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_COUNT_count_mask   0x3FFFFFFF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_COUNT_count_shift  0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_COUNT_count_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_COUNT_count_shift)
+
+/*define for PARAMETER word*/
+/*define for dst2_sw field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_sw_offset 2
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_sw_mask   0x00000003
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_sw_shift  8
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_DST2_SW(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_sw_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_sw_shift)
+
+/*define for dst2_cache_policy field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_cache_policy_offset 2
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_cache_policy_shift  10
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_DST2_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_cache_policy_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst2_cache_policy_shift)
+
+/*define for dst1_sw field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_sw_offset 2
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_sw_mask   0x00000003
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_sw_shift  16
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_DST1_SW(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_sw_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_sw_shift)
+
+/*define for dst1_cache_policy field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_cache_policy_offset 2
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_cache_policy_shift  18
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_DST1_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_cache_policy_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_dst1_cache_policy_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_sw_offset 2
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_sw_shift  24
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_SRC_SW(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_sw_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_sw_shift)
+
+/*define for src_cache_policy field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_cache_policy_offset 2
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_cache_policy_shift  26
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_SRC_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_cache_policy_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_PARAMETER_src_cache_policy_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_LO_src_addr_31_0_offset 3
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_HI_src_addr_63_32_offset 4
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DST1_ADDR_LO word*/
+/*define for dst1_addr_31_0 field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_LO_dst1_addr_31_0_offset 5
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_LO_dst1_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_LO_dst1_addr_31_0_shift  0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_LO_DST1_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_LO_dst1_addr_31_0_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_LO_dst1_addr_31_0_shift)
+
+/*define for DST1_ADDR_HI word*/
+/*define for dst1_addr_63_32 field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_HI_dst1_addr_63_32_offset 6
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_HI_dst1_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_HI_dst1_addr_63_32_shift  0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_HI_DST1_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_HI_dst1_addr_63_32_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_DST1_ADDR_HI_dst1_addr_63_32_shift)
+
+/*define for DST2_ADDR_LO word*/
+/*define for dst2_addr_31_0 field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_LO_dst2_addr_31_0_offset 7
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_LO_dst2_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_LO_dst2_addr_31_0_shift  0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_LO_DST2_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_LO_dst2_addr_31_0_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_LO_dst2_addr_31_0_shift)
+
+/*define for DST2_ADDR_HI word*/
+/*define for dst2_addr_63_32 field*/
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_HI_dst2_addr_63_32_offset 8
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_HI_dst2_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_HI_dst2_addr_63_32_shift  0
+#define SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_HI_DST2_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_HI_dst2_addr_63_32_mask) << SDMA_PKT_COPY_BROADCAST_LINEAR_DST2_ADDR_HI_dst2_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_LINEAR_SUBWIN packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_op_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_op_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_sub_op_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_sub_op_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_tmz_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_cpv_shift  19
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_cpv_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_cpv_shift)
+
+/*define for elementsize field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_elementsize_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_elementsize_mask   0x00000007
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_elementsize_shift  29
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_ELEMENTSIZE(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_elementsize_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_HEADER_elementsize_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_LO_src_addr_31_0_offset 1
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_HI_src_addr_63_32_offset 2
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for src_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_x_offset 3
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_SRC_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_x_shift)
+
+/*define for src_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_y_offset 3
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_y_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_SRC_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_3_src_y_shift)
+
+/*define for DW_4 word*/
+/*define for src_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_z_offset 4
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_SRC_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_z_shift)
+
+/*define for src_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_pitch_offset 4
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_pitch_mask   0x0007FFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_pitch_shift  13
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_SRC_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_4_src_pitch_shift)
+
+/*define for DW_5 word*/
+/*define for src_slice_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_5_src_slice_pitch_offset 5
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_5_src_slice_pitch_mask   0x0FFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_5_src_slice_pitch_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_5_SRC_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_5_src_slice_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_5_src_slice_pitch_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_LO_dst_addr_31_0_offset 6
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_HI_dst_addr_63_32_offset 7
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DW_8 word*/
+/*define for dst_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_x_offset 8
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_DST_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_x_shift)
+
+/*define for dst_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_y_offset 8
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_y_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_DST_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_8_dst_y_shift)
+
+/*define for DW_9 word*/
+/*define for dst_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_z_offset 9
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_DST_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_z_shift)
+
+/*define for dst_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_pitch_offset 9
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_pitch_mask   0x0007FFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_pitch_shift  13
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_DST_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_9_dst_pitch_shift)
+
+/*define for DW_10 word*/
+/*define for dst_slice_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_10_dst_slice_pitch_offset 10
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_10_dst_slice_pitch_mask   0x0FFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_10_dst_slice_pitch_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_10_DST_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_10_dst_slice_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_10_dst_slice_pitch_shift)
+
+/*define for DW_11 word*/
+/*define for rect_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_x_offset 11
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_RECT_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_x_shift)
+
+/*define for rect_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_y_offset 11
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_y_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_RECT_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_11_rect_y_shift)
+
+/*define for DW_12 word*/
+/*define for rect_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_rect_z_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_rect_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_rect_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_RECT_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_rect_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_rect_z_shift)
+
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_sw_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_sw_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_DST_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_sw_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_sw_shift)
+
+/*define for dst_cache_policy field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_cache_policy_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_cache_policy_shift  18
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_DST_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_cache_policy_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_dst_cache_policy_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_sw_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_sw_shift  24
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_SRC_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_sw_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_sw_shift)
+
+/*define for src_cache_policy field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_cache_policy_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_cache_policy_shift  26
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_SRC_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_cache_policy_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_DW_12_src_cache_policy_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_op_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_op_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_sub_op_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_sub_op_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_tmz_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_cpv_shift  19
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_cpv_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_HEADER_cpv_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_LO_src_addr_31_0_offset 1
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_HI_src_addr_63_32_offset 2
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for src_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_3_src_x_offset 3
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_3_src_x_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_3_src_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_3_SRC_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_3_src_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_3_src_x_shift)
+
+/*define for DW_4 word*/
+/*define for src_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_4_src_y_offset 4
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_4_src_y_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_4_src_y_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_4_SRC_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_4_src_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_4_src_y_shift)
+
+/*define for DW_5 word*/
+/*define for src_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_5_src_z_offset 5
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_5_src_z_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_5_src_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_5_SRC_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_5_src_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_5_src_z_shift)
+
+/*define for DW_6 word*/
+/*define for src_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_6_src_pitch_offset 6
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_6_src_pitch_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_6_src_pitch_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_6_SRC_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_6_src_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_6_src_pitch_shift)
+
+/*define for DW_7 word*/
+/*define for src_slice_pitch_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_7_src_slice_pitch_31_0_offset 7
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_7_src_slice_pitch_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_7_src_slice_pitch_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_7_SRC_SLICE_PITCH_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_7_src_slice_pitch_31_0_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_7_src_slice_pitch_31_0_shift)
+
+/*define for DW_8 word*/
+/*define for src_slice_pitch_47_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_8_src_slice_pitch_47_32_offset 8
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_8_src_slice_pitch_47_32_mask   0x0000FFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_8_src_slice_pitch_47_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_8_SRC_SLICE_PITCH_47_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_8_src_slice_pitch_47_32_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_8_src_slice_pitch_47_32_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_LO_dst_addr_31_0_offset 9
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_HI_dst_addr_63_32_offset 10
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DW_11 word*/
+/*define for dst_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_11_dst_x_offset 11
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_11_dst_x_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_11_dst_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_11_DST_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_11_dst_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_11_dst_x_shift)
+
+/*define for DW_12 word*/
+/*define for dst_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_12_dst_y_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_12_dst_y_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_12_dst_y_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_12_DST_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_12_dst_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_12_dst_y_shift)
+
+/*define for DW_13 word*/
+/*define for dst_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_13_dst_z_offset 13
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_13_dst_z_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_13_dst_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_13_DST_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_13_dst_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_13_dst_z_shift)
+
+/*define for DW_14 word*/
+/*define for dst_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_14_dst_pitch_offset 14
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_14_dst_pitch_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_14_dst_pitch_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_14_DST_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_14_dst_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_14_dst_pitch_shift)
+
+/*define for DW_15 word*/
+/*define for dst_slice_pitch_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_15_dst_slice_pitch_31_0_offset 15
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_15_dst_slice_pitch_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_15_dst_slice_pitch_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_15_DST_SLICE_PITCH_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_15_dst_slice_pitch_31_0_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_15_dst_slice_pitch_31_0_shift)
+
+/*define for DW_16 word*/
+/*define for dst_slice_pitch_47_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_slice_pitch_47_32_offset 16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_slice_pitch_47_32_mask   0x0000FFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_slice_pitch_47_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_DST_SLICE_PITCH_47_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_slice_pitch_47_32_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_slice_pitch_47_32_shift)
+
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_sw_offset 16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_sw_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_DST_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_sw_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_sw_shift)
+
+/*define for dst_policy field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_policy_offset 16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_policy_mask   0x00000007
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_policy_shift  18
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_DST_POLICY(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_policy_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_dst_policy_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_sw_offset 16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_sw_shift  24
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_SRC_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_sw_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_sw_shift)
+
+/*define for src_policy field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_policy_offset 16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_policy_mask   0x00000007
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_policy_shift  26
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_SRC_POLICY(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_policy_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_16_src_policy_shift)
+
+/*define for DW_17 word*/
+/*define for rect_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_17_rect_x_offset 17
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_17_rect_x_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_17_rect_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_17_RECT_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_17_rect_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_17_rect_x_shift)
+
+/*define for DW_18 word*/
+/*define for rect_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_18_rect_y_offset 18
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_18_rect_y_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_18_rect_y_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_18_RECT_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_18_rect_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_18_rect_y_shift)
+
+/*define for DW_19 word*/
+/*define for rect_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_19_rect_z_offset 19
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_19_rect_z_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_19_rect_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_19_RECT_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_19_rect_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_LARGE_DW_19_rect_z_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_LINEAR_SUBWIN_BC packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_op_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_op_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_sub_op_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_sub_op_shift)
+
+/*define for elementsize field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_elementsize_offset 0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_elementsize_mask   0x00000007
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_elementsize_shift  29
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_ELEMENTSIZE(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_elementsize_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_HEADER_elementsize_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_LO_src_addr_31_0_offset 1
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_HI_src_addr_63_32_offset 2
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for src_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_x_offset 3
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_SRC_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_x_shift)
+
+/*define for src_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_y_offset 3
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_y_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_SRC_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_3_src_y_shift)
+
+/*define for DW_4 word*/
+/*define for src_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_z_offset 4
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_z_mask   0x000007FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_SRC_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_z_shift)
+
+/*define for src_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_pitch_offset 4
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_pitch_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_pitch_shift  13
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_SRC_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_4_src_pitch_shift)
+
+/*define for DW_5 word*/
+/*define for src_slice_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_5_src_slice_pitch_offset 5
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_5_src_slice_pitch_mask   0x0FFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_5_src_slice_pitch_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_5_SRC_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_5_src_slice_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_5_src_slice_pitch_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_LO_dst_addr_31_0_offset 6
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_HI_dst_addr_63_32_offset 7
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DW_8 word*/
+/*define for dst_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_x_offset 8
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_DST_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_x_shift)
+
+/*define for dst_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_y_offset 8
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_y_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_DST_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_8_dst_y_shift)
+
+/*define for DW_9 word*/
+/*define for dst_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_z_offset 9
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_z_mask   0x000007FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_DST_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_z_shift)
+
+/*define for dst_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_pitch_offset 9
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_pitch_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_pitch_shift  13
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_DST_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_9_dst_pitch_shift)
+
+/*define for DW_10 word*/
+/*define for dst_slice_pitch field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_10_dst_slice_pitch_offset 10
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_10_dst_slice_pitch_mask   0x0FFFFFFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_10_dst_slice_pitch_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_10_DST_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_10_dst_slice_pitch_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_10_dst_slice_pitch_shift)
+
+/*define for DW_11 word*/
+/*define for rect_x field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_x_offset 11
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_x_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_RECT_X(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_x_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_x_shift)
+
+/*define for rect_y field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_y_offset 11
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_y_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_RECT_Y(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_y_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_11_rect_y_shift)
+
+/*define for DW_12 word*/
+/*define for rect_z field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_rect_z_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_rect_z_mask   0x000007FF
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_rect_z_shift  0
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_RECT_Z(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_rect_z_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_rect_z_shift)
+
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_sw_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_sw_shift  16
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_DST_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_sw_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_sw_shift)
+
+/*define for dst_ha field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_ha_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_ha_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_ha_shift  19
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_DST_HA(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_ha_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_dst_ha_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_sw_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_sw_shift  24
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_SRC_SW(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_sw_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_sw_shift)
+
+/*define for src_ha field*/
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_ha_offset 12
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_ha_mask   0x00000001
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_ha_shift  27
+#define SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_SRC_HA(x) (((x) & SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_ha_mask) << SDMA_PKT_COPY_LINEAR_SUBWIN_BC_DW_12_src_ha_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_TILED packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_TILED_HEADER_op_offset 0
+#define SDMA_PKT_COPY_TILED_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_TILED_HEADER_op_shift  0
+#define SDMA_PKT_COPY_TILED_HEADER_OP(x) (((x) & SDMA_PKT_COPY_TILED_HEADER_op_mask) << SDMA_PKT_COPY_TILED_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_TILED_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_TILED_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_TILED_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_TILED_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_TILED_HEADER_sub_op_mask) << SDMA_PKT_COPY_TILED_HEADER_sub_op_shift)
+
+/*define for encrypt field*/
+#define SDMA_PKT_COPY_TILED_HEADER_encrypt_offset 0
+#define SDMA_PKT_COPY_TILED_HEADER_encrypt_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_HEADER_encrypt_shift  16
+#define SDMA_PKT_COPY_TILED_HEADER_ENCRYPT(x) (((x) & SDMA_PKT_COPY_TILED_HEADER_encrypt_mask) << SDMA_PKT_COPY_TILED_HEADER_encrypt_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_TILED_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_TILED_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_TILED_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_TILED_HEADER_tmz_mask) << SDMA_PKT_COPY_TILED_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_TILED_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_TILED_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_HEADER_cpv_shift  19
+#define SDMA_PKT_COPY_TILED_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_TILED_HEADER_cpv_mask) << SDMA_PKT_COPY_TILED_HEADER_cpv_shift)
+
+/*define for detile field*/
+#define SDMA_PKT_COPY_TILED_HEADER_detile_offset 0
+#define SDMA_PKT_COPY_TILED_HEADER_detile_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_HEADER_detile_shift  31
+#define SDMA_PKT_COPY_TILED_HEADER_DETILE(x) (((x) & SDMA_PKT_COPY_TILED_HEADER_detile_mask) << SDMA_PKT_COPY_TILED_HEADER_detile_shift)
+
+/*define for TILED_ADDR_LO word*/
+/*define for tiled_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_TILED_ADDR_LO_tiled_addr_31_0_offset 1
+#define SDMA_PKT_COPY_TILED_TILED_ADDR_LO_tiled_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_TILED_ADDR_LO_tiled_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_TILED_ADDR_LO_TILED_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_TILED_ADDR_LO_tiled_addr_31_0_mask) << SDMA_PKT_COPY_TILED_TILED_ADDR_LO_tiled_addr_31_0_shift)
+
+/*define for TILED_ADDR_HI word*/
+/*define for tiled_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_TILED_ADDR_HI_tiled_addr_63_32_offset 2
+#define SDMA_PKT_COPY_TILED_TILED_ADDR_HI_tiled_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_TILED_ADDR_HI_tiled_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_TILED_ADDR_HI_TILED_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_TILED_ADDR_HI_tiled_addr_63_32_mask) << SDMA_PKT_COPY_TILED_TILED_ADDR_HI_tiled_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for width field*/
+#define SDMA_PKT_COPY_TILED_DW_3_width_offset 3
+#define SDMA_PKT_COPY_TILED_DW_3_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_DW_3_width_shift  0
+#define SDMA_PKT_COPY_TILED_DW_3_WIDTH(x) (((x) & SDMA_PKT_COPY_TILED_DW_3_width_mask) << SDMA_PKT_COPY_TILED_DW_3_width_shift)
+
+/*define for DW_4 word*/
+/*define for height field*/
+#define SDMA_PKT_COPY_TILED_DW_4_height_offset 4
+#define SDMA_PKT_COPY_TILED_DW_4_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_DW_4_height_shift  0
+#define SDMA_PKT_COPY_TILED_DW_4_HEIGHT(x) (((x) & SDMA_PKT_COPY_TILED_DW_4_height_mask) << SDMA_PKT_COPY_TILED_DW_4_height_shift)
+
+/*define for depth field*/
+#define SDMA_PKT_COPY_TILED_DW_4_depth_offset 4
+#define SDMA_PKT_COPY_TILED_DW_4_depth_mask   0x00001FFF
+#define SDMA_PKT_COPY_TILED_DW_4_depth_shift  16
+#define SDMA_PKT_COPY_TILED_DW_4_DEPTH(x) (((x) & SDMA_PKT_COPY_TILED_DW_4_depth_mask) << SDMA_PKT_COPY_TILED_DW_4_depth_shift)
+
+/*define for DW_5 word*/
+/*define for element_size field*/
+#define SDMA_PKT_COPY_TILED_DW_5_element_size_offset 5
+#define SDMA_PKT_COPY_TILED_DW_5_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_DW_5_element_size_shift  0
+#define SDMA_PKT_COPY_TILED_DW_5_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_TILED_DW_5_element_size_mask) << SDMA_PKT_COPY_TILED_DW_5_element_size_shift)
+
+/*define for swizzle_mode field*/
+#define SDMA_PKT_COPY_TILED_DW_5_swizzle_mode_offset 5
+#define SDMA_PKT_COPY_TILED_DW_5_swizzle_mode_mask   0x0000001F
+#define SDMA_PKT_COPY_TILED_DW_5_swizzle_mode_shift  3
+#define SDMA_PKT_COPY_TILED_DW_5_SWIZZLE_MODE(x) (((x) & SDMA_PKT_COPY_TILED_DW_5_swizzle_mode_mask) << SDMA_PKT_COPY_TILED_DW_5_swizzle_mode_shift)
+
+/*define for dimension field*/
+#define SDMA_PKT_COPY_TILED_DW_5_dimension_offset 5
+#define SDMA_PKT_COPY_TILED_DW_5_dimension_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_DW_5_dimension_shift  9
+#define SDMA_PKT_COPY_TILED_DW_5_DIMENSION(x) (((x) & SDMA_PKT_COPY_TILED_DW_5_dimension_mask) << SDMA_PKT_COPY_TILED_DW_5_dimension_shift)
+
+/*define for mip_max field*/
+#define SDMA_PKT_COPY_TILED_DW_5_mip_max_offset 5
+#define SDMA_PKT_COPY_TILED_DW_5_mip_max_mask   0x0000000F
+#define SDMA_PKT_COPY_TILED_DW_5_mip_max_shift  16
+#define SDMA_PKT_COPY_TILED_DW_5_MIP_MAX(x) (((x) & SDMA_PKT_COPY_TILED_DW_5_mip_max_mask) << SDMA_PKT_COPY_TILED_DW_5_mip_max_shift)
+
+/*define for DW_6 word*/
+/*define for x field*/
+#define SDMA_PKT_COPY_TILED_DW_6_x_offset 6
+#define SDMA_PKT_COPY_TILED_DW_6_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_DW_6_x_shift  0
+#define SDMA_PKT_COPY_TILED_DW_6_X(x) (((x) & SDMA_PKT_COPY_TILED_DW_6_x_mask) << SDMA_PKT_COPY_TILED_DW_6_x_shift)
+
+/*define for y field*/
+#define SDMA_PKT_COPY_TILED_DW_6_y_offset 6
+#define SDMA_PKT_COPY_TILED_DW_6_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_DW_6_y_shift  16
+#define SDMA_PKT_COPY_TILED_DW_6_Y(x) (((x) & SDMA_PKT_COPY_TILED_DW_6_y_mask) << SDMA_PKT_COPY_TILED_DW_6_y_shift)
+
+/*define for DW_7 word*/
+/*define for z field*/
+#define SDMA_PKT_COPY_TILED_DW_7_z_offset 7
+#define SDMA_PKT_COPY_TILED_DW_7_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_TILED_DW_7_z_shift  0
+#define SDMA_PKT_COPY_TILED_DW_7_Z(x) (((x) & SDMA_PKT_COPY_TILED_DW_7_z_mask) << SDMA_PKT_COPY_TILED_DW_7_z_shift)
+
+/*define for linear_sw field*/
+#define SDMA_PKT_COPY_TILED_DW_7_linear_sw_offset 7
+#define SDMA_PKT_COPY_TILED_DW_7_linear_sw_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_DW_7_linear_sw_shift  16
+#define SDMA_PKT_COPY_TILED_DW_7_LINEAR_SW(x) (((x) & SDMA_PKT_COPY_TILED_DW_7_linear_sw_mask) << SDMA_PKT_COPY_TILED_DW_7_linear_sw_shift)
+
+/*define for linear_cache_policy field*/
+#define SDMA_PKT_COPY_TILED_DW_7_linear_cache_policy_offset 7
+#define SDMA_PKT_COPY_TILED_DW_7_linear_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_DW_7_linear_cache_policy_shift  18
+#define SDMA_PKT_COPY_TILED_DW_7_LINEAR_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_TILED_DW_7_linear_cache_policy_mask) << SDMA_PKT_COPY_TILED_DW_7_linear_cache_policy_shift)
+
+/*define for tile_sw field*/
+#define SDMA_PKT_COPY_TILED_DW_7_tile_sw_offset 7
+#define SDMA_PKT_COPY_TILED_DW_7_tile_sw_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_DW_7_tile_sw_shift  24
+#define SDMA_PKT_COPY_TILED_DW_7_TILE_SW(x) (((x) & SDMA_PKT_COPY_TILED_DW_7_tile_sw_mask) << SDMA_PKT_COPY_TILED_DW_7_tile_sw_shift)
+
+/*define for tile_cache_policy field*/
+#define SDMA_PKT_COPY_TILED_DW_7_tile_cache_policy_offset 7
+#define SDMA_PKT_COPY_TILED_DW_7_tile_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_DW_7_tile_cache_policy_shift  26
+#define SDMA_PKT_COPY_TILED_DW_7_TILE_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_TILED_DW_7_tile_cache_policy_mask) << SDMA_PKT_COPY_TILED_DW_7_tile_cache_policy_shift)
+
+/*define for LINEAR_ADDR_LO word*/
+/*define for linear_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_LINEAR_ADDR_LO_linear_addr_31_0_offset 8
+#define SDMA_PKT_COPY_TILED_LINEAR_ADDR_LO_linear_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_LINEAR_ADDR_LO_linear_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_LINEAR_ADDR_LO_LINEAR_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_LINEAR_ADDR_LO_linear_addr_31_0_mask) << SDMA_PKT_COPY_TILED_LINEAR_ADDR_LO_linear_addr_31_0_shift)
+
+/*define for LINEAR_ADDR_HI word*/
+/*define for linear_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_LINEAR_ADDR_HI_linear_addr_63_32_offset 9
+#define SDMA_PKT_COPY_TILED_LINEAR_ADDR_HI_linear_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_LINEAR_ADDR_HI_linear_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_LINEAR_ADDR_HI_LINEAR_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_LINEAR_ADDR_HI_linear_addr_63_32_mask) << SDMA_PKT_COPY_TILED_LINEAR_ADDR_HI_linear_addr_63_32_shift)
+
+/*define for LINEAR_PITCH word*/
+/*define for linear_pitch field*/
+#define SDMA_PKT_COPY_TILED_LINEAR_PITCH_linear_pitch_offset 10
+#define SDMA_PKT_COPY_TILED_LINEAR_PITCH_linear_pitch_mask   0x0007FFFF
+#define SDMA_PKT_COPY_TILED_LINEAR_PITCH_linear_pitch_shift  0
+#define SDMA_PKT_COPY_TILED_LINEAR_PITCH_LINEAR_PITCH(x) (((x) & SDMA_PKT_COPY_TILED_LINEAR_PITCH_linear_pitch_mask) << SDMA_PKT_COPY_TILED_LINEAR_PITCH_linear_pitch_shift)
+
+/*define for LINEAR_SLICE_PITCH word*/
+/*define for linear_slice_pitch field*/
+#define SDMA_PKT_COPY_TILED_LINEAR_SLICE_PITCH_linear_slice_pitch_offset 11
+#define SDMA_PKT_COPY_TILED_LINEAR_SLICE_PITCH_linear_slice_pitch_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_LINEAR_SLICE_PITCH_linear_slice_pitch_shift  0
+#define SDMA_PKT_COPY_TILED_LINEAR_SLICE_PITCH_LINEAR_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_TILED_LINEAR_SLICE_PITCH_linear_slice_pitch_mask) << SDMA_PKT_COPY_TILED_LINEAR_SLICE_PITCH_linear_slice_pitch_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_TILED_COUNT_count_offset 12
+#define SDMA_PKT_COPY_TILED_COUNT_count_mask   0x3FFFFFFF
+#define SDMA_PKT_COPY_TILED_COUNT_count_shift  0
+#define SDMA_PKT_COPY_TILED_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_TILED_COUNT_count_mask) << SDMA_PKT_COPY_TILED_COUNT_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_TILED_BC packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_TILED_BC_HEADER_op_offset 0
+#define SDMA_PKT_COPY_TILED_BC_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_TILED_BC_HEADER_op_shift  0
+#define SDMA_PKT_COPY_TILED_BC_HEADER_OP(x) (((x) & SDMA_PKT_COPY_TILED_BC_HEADER_op_mask) << SDMA_PKT_COPY_TILED_BC_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_TILED_BC_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_TILED_BC_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_TILED_BC_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_TILED_BC_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_TILED_BC_HEADER_sub_op_mask) << SDMA_PKT_COPY_TILED_BC_HEADER_sub_op_shift)
+
+/*define for detile field*/
+#define SDMA_PKT_COPY_TILED_BC_HEADER_detile_offset 0
+#define SDMA_PKT_COPY_TILED_BC_HEADER_detile_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_BC_HEADER_detile_shift  31
+#define SDMA_PKT_COPY_TILED_BC_HEADER_DETILE(x) (((x) & SDMA_PKT_COPY_TILED_BC_HEADER_detile_mask) << SDMA_PKT_COPY_TILED_BC_HEADER_detile_shift)
+
+/*define for TILED_ADDR_LO word*/
+/*define for tiled_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_BC_TILED_ADDR_LO_tiled_addr_31_0_offset 1
+#define SDMA_PKT_COPY_TILED_BC_TILED_ADDR_LO_tiled_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_BC_TILED_ADDR_LO_tiled_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_BC_TILED_ADDR_LO_TILED_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_BC_TILED_ADDR_LO_tiled_addr_31_0_mask) << SDMA_PKT_COPY_TILED_BC_TILED_ADDR_LO_tiled_addr_31_0_shift)
+
+/*define for TILED_ADDR_HI word*/
+/*define for tiled_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_BC_TILED_ADDR_HI_tiled_addr_63_32_offset 2
+#define SDMA_PKT_COPY_TILED_BC_TILED_ADDR_HI_tiled_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_BC_TILED_ADDR_HI_tiled_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_BC_TILED_ADDR_HI_TILED_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_BC_TILED_ADDR_HI_tiled_addr_63_32_mask) << SDMA_PKT_COPY_TILED_BC_TILED_ADDR_HI_tiled_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for width field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_3_width_offset 3
+#define SDMA_PKT_COPY_TILED_BC_DW_3_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_BC_DW_3_width_shift  0
+#define SDMA_PKT_COPY_TILED_BC_DW_3_WIDTH(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_3_width_mask) << SDMA_PKT_COPY_TILED_BC_DW_3_width_shift)
+
+/*define for DW_4 word*/
+/*define for height field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_4_height_offset 4
+#define SDMA_PKT_COPY_TILED_BC_DW_4_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_BC_DW_4_height_shift  0
+#define SDMA_PKT_COPY_TILED_BC_DW_4_HEIGHT(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_4_height_mask) << SDMA_PKT_COPY_TILED_BC_DW_4_height_shift)
+
+/*define for depth field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_4_depth_offset 4
+#define SDMA_PKT_COPY_TILED_BC_DW_4_depth_mask   0x000007FF
+#define SDMA_PKT_COPY_TILED_BC_DW_4_depth_shift  16
+#define SDMA_PKT_COPY_TILED_BC_DW_4_DEPTH(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_4_depth_mask) << SDMA_PKT_COPY_TILED_BC_DW_4_depth_shift)
+
+/*define for DW_5 word*/
+/*define for element_size field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_element_size_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_BC_DW_5_element_size_shift  0
+#define SDMA_PKT_COPY_TILED_BC_DW_5_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_element_size_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_element_size_shift)
+
+/*define for array_mode field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_array_mode_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_array_mode_mask   0x0000000F
+#define SDMA_PKT_COPY_TILED_BC_DW_5_array_mode_shift  3
+#define SDMA_PKT_COPY_TILED_BC_DW_5_ARRAY_MODE(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_array_mode_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_array_mode_shift)
+
+/*define for mit_mode field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_mit_mode_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_mit_mode_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_BC_DW_5_mit_mode_shift  8
+#define SDMA_PKT_COPY_TILED_BC_DW_5_MIT_MODE(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_mit_mode_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_mit_mode_shift)
+
+/*define for tilesplit_size field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_tilesplit_size_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_tilesplit_size_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_BC_DW_5_tilesplit_size_shift  11
+#define SDMA_PKT_COPY_TILED_BC_DW_5_TILESPLIT_SIZE(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_tilesplit_size_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_tilesplit_size_shift)
+
+/*define for bank_w field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_bank_w_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_bank_w_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_BC_DW_5_bank_w_shift  15
+#define SDMA_PKT_COPY_TILED_BC_DW_5_BANK_W(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_bank_w_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_bank_w_shift)
+
+/*define for bank_h field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_bank_h_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_bank_h_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_BC_DW_5_bank_h_shift  18
+#define SDMA_PKT_COPY_TILED_BC_DW_5_BANK_H(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_bank_h_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_bank_h_shift)
+
+/*define for num_bank field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_num_bank_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_num_bank_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_BC_DW_5_num_bank_shift  21
+#define SDMA_PKT_COPY_TILED_BC_DW_5_NUM_BANK(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_num_bank_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_num_bank_shift)
+
+/*define for mat_aspt field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_mat_aspt_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_mat_aspt_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_BC_DW_5_mat_aspt_shift  24
+#define SDMA_PKT_COPY_TILED_BC_DW_5_MAT_ASPT(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_mat_aspt_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_mat_aspt_shift)
+
+/*define for pipe_config field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_5_pipe_config_offset 5
+#define SDMA_PKT_COPY_TILED_BC_DW_5_pipe_config_mask   0x0000001F
+#define SDMA_PKT_COPY_TILED_BC_DW_5_pipe_config_shift  26
+#define SDMA_PKT_COPY_TILED_BC_DW_5_PIPE_CONFIG(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_5_pipe_config_mask) << SDMA_PKT_COPY_TILED_BC_DW_5_pipe_config_shift)
+
+/*define for DW_6 word*/
+/*define for x field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_6_x_offset 6
+#define SDMA_PKT_COPY_TILED_BC_DW_6_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_BC_DW_6_x_shift  0
+#define SDMA_PKT_COPY_TILED_BC_DW_6_X(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_6_x_mask) << SDMA_PKT_COPY_TILED_BC_DW_6_x_shift)
+
+/*define for y field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_6_y_offset 6
+#define SDMA_PKT_COPY_TILED_BC_DW_6_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_BC_DW_6_y_shift  16
+#define SDMA_PKT_COPY_TILED_BC_DW_6_Y(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_6_y_mask) << SDMA_PKT_COPY_TILED_BC_DW_6_y_shift)
+
+/*define for DW_7 word*/
+/*define for z field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_7_z_offset 7
+#define SDMA_PKT_COPY_TILED_BC_DW_7_z_mask   0x000007FF
+#define SDMA_PKT_COPY_TILED_BC_DW_7_z_shift  0
+#define SDMA_PKT_COPY_TILED_BC_DW_7_Z(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_7_z_mask) << SDMA_PKT_COPY_TILED_BC_DW_7_z_shift)
+
+/*define for linear_sw field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_7_linear_sw_offset 7
+#define SDMA_PKT_COPY_TILED_BC_DW_7_linear_sw_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_BC_DW_7_linear_sw_shift  16
+#define SDMA_PKT_COPY_TILED_BC_DW_7_LINEAR_SW(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_7_linear_sw_mask) << SDMA_PKT_COPY_TILED_BC_DW_7_linear_sw_shift)
+
+/*define for tile_sw field*/
+#define SDMA_PKT_COPY_TILED_BC_DW_7_tile_sw_offset 7
+#define SDMA_PKT_COPY_TILED_BC_DW_7_tile_sw_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_BC_DW_7_tile_sw_shift  24
+#define SDMA_PKT_COPY_TILED_BC_DW_7_TILE_SW(x) (((x) & SDMA_PKT_COPY_TILED_BC_DW_7_tile_sw_mask) << SDMA_PKT_COPY_TILED_BC_DW_7_tile_sw_shift)
+
+/*define for LINEAR_ADDR_LO word*/
+/*define for linear_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_LO_linear_addr_31_0_offset 8
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_LO_linear_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_LO_linear_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_LO_LINEAR_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_LO_linear_addr_31_0_mask) << SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_LO_linear_addr_31_0_shift)
+
+/*define for LINEAR_ADDR_HI word*/
+/*define for linear_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_HI_linear_addr_63_32_offset 9
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_HI_linear_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_HI_linear_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_HI_LINEAR_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_HI_linear_addr_63_32_mask) << SDMA_PKT_COPY_TILED_BC_LINEAR_ADDR_HI_linear_addr_63_32_shift)
+
+/*define for LINEAR_PITCH word*/
+/*define for linear_pitch field*/
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_PITCH_linear_pitch_offset 10
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_PITCH_linear_pitch_mask   0x0007FFFF
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_PITCH_linear_pitch_shift  0
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_PITCH_LINEAR_PITCH(x) (((x) & SDMA_PKT_COPY_TILED_BC_LINEAR_PITCH_linear_pitch_mask) << SDMA_PKT_COPY_TILED_BC_LINEAR_PITCH_linear_pitch_shift)
+
+/*define for LINEAR_SLICE_PITCH word*/
+/*define for linear_slice_pitch field*/
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_SLICE_PITCH_linear_slice_pitch_offset 11
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_SLICE_PITCH_linear_slice_pitch_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_SLICE_PITCH_linear_slice_pitch_shift  0
+#define SDMA_PKT_COPY_TILED_BC_LINEAR_SLICE_PITCH_LINEAR_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_TILED_BC_LINEAR_SLICE_PITCH_linear_slice_pitch_mask) << SDMA_PKT_COPY_TILED_BC_LINEAR_SLICE_PITCH_linear_slice_pitch_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_TILED_BC_COUNT_count_offset 12
+#define SDMA_PKT_COPY_TILED_BC_COUNT_count_mask   0x000FFFFF
+#define SDMA_PKT_COPY_TILED_BC_COUNT_count_shift  2
+#define SDMA_PKT_COPY_TILED_BC_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_TILED_BC_COUNT_count_mask) << SDMA_PKT_COPY_TILED_BC_COUNT_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_L2T_BROADCAST packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_op_offset 0
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_op_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_OP(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_HEADER_op_mask) << SDMA_PKT_COPY_L2T_BROADCAST_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_HEADER_sub_op_mask) << SDMA_PKT_COPY_L2T_BROADCAST_HEADER_sub_op_shift)
+
+/*define for encrypt field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_encrypt_offset 0
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_encrypt_mask   0x00000001
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_encrypt_shift  16
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_ENCRYPT(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_HEADER_encrypt_mask) << SDMA_PKT_COPY_L2T_BROADCAST_HEADER_encrypt_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_HEADER_tmz_mask) << SDMA_PKT_COPY_L2T_BROADCAST_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_cpv_shift  19
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_HEADER_cpv_mask) << SDMA_PKT_COPY_L2T_BROADCAST_HEADER_cpv_shift)
+
+/*define for videocopy field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_videocopy_offset 0
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_videocopy_mask   0x00000001
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_videocopy_shift  26
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_VIDEOCOPY(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_HEADER_videocopy_mask) << SDMA_PKT_COPY_L2T_BROADCAST_HEADER_videocopy_shift)
+
+/*define for broadcast field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_broadcast_offset 0
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_broadcast_mask   0x00000001
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_broadcast_shift  27
+#define SDMA_PKT_COPY_L2T_BROADCAST_HEADER_BROADCAST(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_HEADER_broadcast_mask) << SDMA_PKT_COPY_L2T_BROADCAST_HEADER_broadcast_shift)
+
+/*define for TILED_ADDR_LO_0 word*/
+/*define for tiled_addr0_31_0 field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_0_tiled_addr0_31_0_offset 1
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_0_tiled_addr0_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_0_tiled_addr0_31_0_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_0_TILED_ADDR0_31_0(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_0_tiled_addr0_31_0_mask) << SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_0_tiled_addr0_31_0_shift)
+
+/*define for TILED_ADDR_HI_0 word*/
+/*define for tiled_addr0_63_32 field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_0_tiled_addr0_63_32_offset 2
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_0_tiled_addr0_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_0_tiled_addr0_63_32_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_0_TILED_ADDR0_63_32(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_0_tiled_addr0_63_32_mask) << SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_0_tiled_addr0_63_32_shift)
+
+/*define for TILED_ADDR_LO_1 word*/
+/*define for tiled_addr1_31_0 field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_1_tiled_addr1_31_0_offset 3
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_1_tiled_addr1_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_1_tiled_addr1_31_0_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_1_TILED_ADDR1_31_0(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_1_tiled_addr1_31_0_mask) << SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_LO_1_tiled_addr1_31_0_shift)
+
+/*define for TILED_ADDR_HI_1 word*/
+/*define for tiled_addr1_63_32 field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_1_tiled_addr1_63_32_offset 4
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_1_tiled_addr1_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_1_tiled_addr1_63_32_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_1_TILED_ADDR1_63_32(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_1_tiled_addr1_63_32_mask) << SDMA_PKT_COPY_L2T_BROADCAST_TILED_ADDR_HI_1_tiled_addr1_63_32_shift)
+
+/*define for DW_5 word*/
+/*define for width field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_5_width_offset 5
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_5_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_5_width_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_5_WIDTH(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_5_width_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_5_width_shift)
+
+/*define for DW_6 word*/
+/*define for height field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_6_height_offset 6
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_6_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_6_height_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_6_HEIGHT(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_6_height_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_6_height_shift)
+
+/*define for depth field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_6_depth_offset 6
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_6_depth_mask   0x00001FFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_6_depth_shift  16
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_6_DEPTH(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_6_depth_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_6_depth_shift)
+
+/*define for DW_7 word*/
+/*define for element_size field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_element_size_offset 7
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_element_size_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_7_element_size_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_7_element_size_shift)
+
+/*define for swizzle_mode field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_swizzle_mode_offset 7
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_swizzle_mode_mask   0x0000001F
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_swizzle_mode_shift  3
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_SWIZZLE_MODE(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_7_swizzle_mode_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_7_swizzle_mode_shift)
+
+/*define for dimension field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_dimension_offset 7
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_dimension_mask   0x00000003
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_dimension_shift  9
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_DIMENSION(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_7_dimension_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_7_dimension_shift)
+
+/*define for mip_max field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_mip_max_offset 7
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_mip_max_mask   0x0000000F
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_mip_max_shift  16
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_7_MIP_MAX(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_7_mip_max_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_7_mip_max_shift)
+
+/*define for DW_8 word*/
+/*define for x field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_8_x_offset 8
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_8_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_8_x_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_8_X(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_8_x_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_8_x_shift)
+
+/*define for y field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_8_y_offset 8
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_8_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_8_y_shift  16
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_8_Y(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_8_y_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_8_y_shift)
+
+/*define for DW_9 word*/
+/*define for z field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_9_z_offset 9
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_9_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_9_z_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_9_Z(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_9_z_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_9_z_shift)
+
+/*define for DW_10 word*/
+/*define for dst2_sw field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_sw_offset 10
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_sw_mask   0x00000003
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_sw_shift  8
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_DST2_SW(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_sw_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_sw_shift)
+
+/*define for dst2_cache_policy field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_cache_policy_offset 10
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_cache_policy_shift  10
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_DST2_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_cache_policy_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_10_dst2_cache_policy_shift)
+
+/*define for linear_sw field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_sw_offset 10
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_sw_mask   0x00000003
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_sw_shift  16
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_LINEAR_SW(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_sw_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_sw_shift)
+
+/*define for linear_cache_policy field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_cache_policy_offset 10
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_cache_policy_shift  18
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_LINEAR_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_cache_policy_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_10_linear_cache_policy_shift)
+
+/*define for tile_sw field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_sw_offset 10
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_sw_mask   0x00000003
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_sw_shift  24
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_TILE_SW(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_sw_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_sw_shift)
+
+/*define for tile_cache_policy field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_cache_policy_offset 10
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_cache_policy_shift  26
+#define SDMA_PKT_COPY_L2T_BROADCAST_DW_10_TILE_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_cache_policy_mask) << SDMA_PKT_COPY_L2T_BROADCAST_DW_10_tile_cache_policy_shift)
+
+/*define for LINEAR_ADDR_LO word*/
+/*define for linear_addr_31_0 field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_LO_linear_addr_31_0_offset 11
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_LO_linear_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_LO_linear_addr_31_0_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_LO_LINEAR_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_LO_linear_addr_31_0_mask) << SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_LO_linear_addr_31_0_shift)
+
+/*define for LINEAR_ADDR_HI word*/
+/*define for linear_addr_63_32 field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_HI_linear_addr_63_32_offset 12
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_HI_linear_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_HI_linear_addr_63_32_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_HI_LINEAR_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_HI_linear_addr_63_32_mask) << SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_ADDR_HI_linear_addr_63_32_shift)
+
+/*define for LINEAR_PITCH word*/
+/*define for linear_pitch field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_PITCH_linear_pitch_offset 13
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_PITCH_linear_pitch_mask   0x0007FFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_PITCH_linear_pitch_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_PITCH_LINEAR_PITCH(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_PITCH_linear_pitch_mask) << SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_PITCH_linear_pitch_shift)
+
+/*define for LINEAR_SLICE_PITCH word*/
+/*define for linear_slice_pitch field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_SLICE_PITCH_linear_slice_pitch_offset 14
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_SLICE_PITCH_linear_slice_pitch_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_SLICE_PITCH_linear_slice_pitch_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_SLICE_PITCH_LINEAR_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_SLICE_PITCH_linear_slice_pitch_mask) << SDMA_PKT_COPY_L2T_BROADCAST_LINEAR_SLICE_PITCH_linear_slice_pitch_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_L2T_BROADCAST_COUNT_count_offset 15
+#define SDMA_PKT_COPY_L2T_BROADCAST_COUNT_count_mask   0x3FFFFFFF
+#define SDMA_PKT_COPY_L2T_BROADCAST_COUNT_count_shift  0
+#define SDMA_PKT_COPY_L2T_BROADCAST_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_L2T_BROADCAST_COUNT_count_mask) << SDMA_PKT_COPY_L2T_BROADCAST_COUNT_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_T2T packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_T2T_HEADER_op_offset 0
+#define SDMA_PKT_COPY_T2T_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_T2T_HEADER_op_shift  0
+#define SDMA_PKT_COPY_T2T_HEADER_OP(x) (((x) & SDMA_PKT_COPY_T2T_HEADER_op_mask) << SDMA_PKT_COPY_T2T_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_T2T_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_T2T_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_T2T_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_T2T_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_T2T_HEADER_sub_op_mask) << SDMA_PKT_COPY_T2T_HEADER_sub_op_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_T2T_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_T2T_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_T2T_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_T2T_HEADER_tmz_mask) << SDMA_PKT_COPY_T2T_HEADER_tmz_shift)
+
+/*define for dcc field*/
+#define SDMA_PKT_COPY_T2T_HEADER_dcc_offset 0
+#define SDMA_PKT_COPY_T2T_HEADER_dcc_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_HEADER_dcc_shift  19
+#define SDMA_PKT_COPY_T2T_HEADER_DCC(x) (((x) & SDMA_PKT_COPY_T2T_HEADER_dcc_mask) << SDMA_PKT_COPY_T2T_HEADER_dcc_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_T2T_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_T2T_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_HEADER_cpv_shift  28
+#define SDMA_PKT_COPY_T2T_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_T2T_HEADER_cpv_mask) << SDMA_PKT_COPY_T2T_HEADER_cpv_shift)
+
+/*define for dcc_dir field*/
+#define SDMA_PKT_COPY_T2T_HEADER_dcc_dir_offset 0
+#define SDMA_PKT_COPY_T2T_HEADER_dcc_dir_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_HEADER_dcc_dir_shift  31
+#define SDMA_PKT_COPY_T2T_HEADER_DCC_DIR(x) (((x) & SDMA_PKT_COPY_T2T_HEADER_dcc_dir_mask) << SDMA_PKT_COPY_T2T_HEADER_dcc_dir_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_T2T_SRC_ADDR_LO_src_addr_31_0_offset 1
+#define SDMA_PKT_COPY_T2T_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_T2T_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_T2T_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_T2T_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_T2T_SRC_ADDR_HI_src_addr_63_32_offset 2
+#define SDMA_PKT_COPY_T2T_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_T2T_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_T2T_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_T2T_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for src_x field*/
+#define SDMA_PKT_COPY_T2T_DW_3_src_x_offset 3
+#define SDMA_PKT_COPY_T2T_DW_3_src_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_3_src_x_shift  0
+#define SDMA_PKT_COPY_T2T_DW_3_SRC_X(x) (((x) & SDMA_PKT_COPY_T2T_DW_3_src_x_mask) << SDMA_PKT_COPY_T2T_DW_3_src_x_shift)
+
+/*define for src_y field*/
+#define SDMA_PKT_COPY_T2T_DW_3_src_y_offset 3
+#define SDMA_PKT_COPY_T2T_DW_3_src_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_3_src_y_shift  16
+#define SDMA_PKT_COPY_T2T_DW_3_SRC_Y(x) (((x) & SDMA_PKT_COPY_T2T_DW_3_src_y_mask) << SDMA_PKT_COPY_T2T_DW_3_src_y_shift)
+
+/*define for DW_4 word*/
+/*define for src_z field*/
+#define SDMA_PKT_COPY_T2T_DW_4_src_z_offset 4
+#define SDMA_PKT_COPY_T2T_DW_4_src_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_T2T_DW_4_src_z_shift  0
+#define SDMA_PKT_COPY_T2T_DW_4_SRC_Z(x) (((x) & SDMA_PKT_COPY_T2T_DW_4_src_z_mask) << SDMA_PKT_COPY_T2T_DW_4_src_z_shift)
+
+/*define for src_width field*/
+#define SDMA_PKT_COPY_T2T_DW_4_src_width_offset 4
+#define SDMA_PKT_COPY_T2T_DW_4_src_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_4_src_width_shift  16
+#define SDMA_PKT_COPY_T2T_DW_4_SRC_WIDTH(x) (((x) & SDMA_PKT_COPY_T2T_DW_4_src_width_mask) << SDMA_PKT_COPY_T2T_DW_4_src_width_shift)
+
+/*define for DW_5 word*/
+/*define for src_height field*/
+#define SDMA_PKT_COPY_T2T_DW_5_src_height_offset 5
+#define SDMA_PKT_COPY_T2T_DW_5_src_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_5_src_height_shift  0
+#define SDMA_PKT_COPY_T2T_DW_5_SRC_HEIGHT(x) (((x) & SDMA_PKT_COPY_T2T_DW_5_src_height_mask) << SDMA_PKT_COPY_T2T_DW_5_src_height_shift)
+
+/*define for src_depth field*/
+#define SDMA_PKT_COPY_T2T_DW_5_src_depth_offset 5
+#define SDMA_PKT_COPY_T2T_DW_5_src_depth_mask   0x00001FFF
+#define SDMA_PKT_COPY_T2T_DW_5_src_depth_shift  16
+#define SDMA_PKT_COPY_T2T_DW_5_SRC_DEPTH(x) (((x) & SDMA_PKT_COPY_T2T_DW_5_src_depth_mask) << SDMA_PKT_COPY_T2T_DW_5_src_depth_shift)
+
+/*define for DW_6 word*/
+/*define for src_element_size field*/
+#define SDMA_PKT_COPY_T2T_DW_6_src_element_size_offset 6
+#define SDMA_PKT_COPY_T2T_DW_6_src_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_DW_6_src_element_size_shift  0
+#define SDMA_PKT_COPY_T2T_DW_6_SRC_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_T2T_DW_6_src_element_size_mask) << SDMA_PKT_COPY_T2T_DW_6_src_element_size_shift)
+
+/*define for src_swizzle_mode field*/
+#define SDMA_PKT_COPY_T2T_DW_6_src_swizzle_mode_offset 6
+#define SDMA_PKT_COPY_T2T_DW_6_src_swizzle_mode_mask   0x0000001F
+#define SDMA_PKT_COPY_T2T_DW_6_src_swizzle_mode_shift  3
+#define SDMA_PKT_COPY_T2T_DW_6_SRC_SWIZZLE_MODE(x) (((x) & SDMA_PKT_COPY_T2T_DW_6_src_swizzle_mode_mask) << SDMA_PKT_COPY_T2T_DW_6_src_swizzle_mode_shift)
+
+/*define for src_dimension field*/
+#define SDMA_PKT_COPY_T2T_DW_6_src_dimension_offset 6
+#define SDMA_PKT_COPY_T2T_DW_6_src_dimension_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_DW_6_src_dimension_shift  9
+#define SDMA_PKT_COPY_T2T_DW_6_SRC_DIMENSION(x) (((x) & SDMA_PKT_COPY_T2T_DW_6_src_dimension_mask) << SDMA_PKT_COPY_T2T_DW_6_src_dimension_shift)
+
+/*define for src_mip_max field*/
+#define SDMA_PKT_COPY_T2T_DW_6_src_mip_max_offset 6
+#define SDMA_PKT_COPY_T2T_DW_6_src_mip_max_mask   0x0000000F
+#define SDMA_PKT_COPY_T2T_DW_6_src_mip_max_shift  16
+#define SDMA_PKT_COPY_T2T_DW_6_SRC_MIP_MAX(x) (((x) & SDMA_PKT_COPY_T2T_DW_6_src_mip_max_mask) << SDMA_PKT_COPY_T2T_DW_6_src_mip_max_shift)
+
+/*define for src_mip_id field*/
+#define SDMA_PKT_COPY_T2T_DW_6_src_mip_id_offset 6
+#define SDMA_PKT_COPY_T2T_DW_6_src_mip_id_mask   0x0000000F
+#define SDMA_PKT_COPY_T2T_DW_6_src_mip_id_shift  20
+#define SDMA_PKT_COPY_T2T_DW_6_SRC_MIP_ID(x) (((x) & SDMA_PKT_COPY_T2T_DW_6_src_mip_id_mask) << SDMA_PKT_COPY_T2T_DW_6_src_mip_id_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_T2T_DST_ADDR_LO_dst_addr_31_0_offset 7
+#define SDMA_PKT_COPY_T2T_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_T2T_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_T2T_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_T2T_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_T2T_DST_ADDR_HI_dst_addr_63_32_offset 8
+#define SDMA_PKT_COPY_T2T_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_T2T_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_T2T_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_T2T_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DW_9 word*/
+/*define for dst_x field*/
+#define SDMA_PKT_COPY_T2T_DW_9_dst_x_offset 9
+#define SDMA_PKT_COPY_T2T_DW_9_dst_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_9_dst_x_shift  0
+#define SDMA_PKT_COPY_T2T_DW_9_DST_X(x) (((x) & SDMA_PKT_COPY_T2T_DW_9_dst_x_mask) << SDMA_PKT_COPY_T2T_DW_9_dst_x_shift)
+
+/*define for dst_y field*/
+#define SDMA_PKT_COPY_T2T_DW_9_dst_y_offset 9
+#define SDMA_PKT_COPY_T2T_DW_9_dst_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_9_dst_y_shift  16
+#define SDMA_PKT_COPY_T2T_DW_9_DST_Y(x) (((x) & SDMA_PKT_COPY_T2T_DW_9_dst_y_mask) << SDMA_PKT_COPY_T2T_DW_9_dst_y_shift)
+
+/*define for DW_10 word*/
+/*define for dst_z field*/
+#define SDMA_PKT_COPY_T2T_DW_10_dst_z_offset 10
+#define SDMA_PKT_COPY_T2T_DW_10_dst_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_T2T_DW_10_dst_z_shift  0
+#define SDMA_PKT_COPY_T2T_DW_10_DST_Z(x) (((x) & SDMA_PKT_COPY_T2T_DW_10_dst_z_mask) << SDMA_PKT_COPY_T2T_DW_10_dst_z_shift)
+
+/*define for dst_width field*/
+#define SDMA_PKT_COPY_T2T_DW_10_dst_width_offset 10
+#define SDMA_PKT_COPY_T2T_DW_10_dst_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_10_dst_width_shift  16
+#define SDMA_PKT_COPY_T2T_DW_10_DST_WIDTH(x) (((x) & SDMA_PKT_COPY_T2T_DW_10_dst_width_mask) << SDMA_PKT_COPY_T2T_DW_10_dst_width_shift)
+
+/*define for DW_11 word*/
+/*define for dst_height field*/
+#define SDMA_PKT_COPY_T2T_DW_11_dst_height_offset 11
+#define SDMA_PKT_COPY_T2T_DW_11_dst_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_11_dst_height_shift  0
+#define SDMA_PKT_COPY_T2T_DW_11_DST_HEIGHT(x) (((x) & SDMA_PKT_COPY_T2T_DW_11_dst_height_mask) << SDMA_PKT_COPY_T2T_DW_11_dst_height_shift)
+
+/*define for dst_depth field*/
+#define SDMA_PKT_COPY_T2T_DW_11_dst_depth_offset 11
+#define SDMA_PKT_COPY_T2T_DW_11_dst_depth_mask   0x00001FFF
+#define SDMA_PKT_COPY_T2T_DW_11_dst_depth_shift  16
+#define SDMA_PKT_COPY_T2T_DW_11_DST_DEPTH(x) (((x) & SDMA_PKT_COPY_T2T_DW_11_dst_depth_mask) << SDMA_PKT_COPY_T2T_DW_11_dst_depth_shift)
+
+/*define for DW_12 word*/
+/*define for dst_element_size field*/
+#define SDMA_PKT_COPY_T2T_DW_12_dst_element_size_offset 12
+#define SDMA_PKT_COPY_T2T_DW_12_dst_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_DW_12_dst_element_size_shift  0
+#define SDMA_PKT_COPY_T2T_DW_12_DST_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_T2T_DW_12_dst_element_size_mask) << SDMA_PKT_COPY_T2T_DW_12_dst_element_size_shift)
+
+/*define for dst_swizzle_mode field*/
+#define SDMA_PKT_COPY_T2T_DW_12_dst_swizzle_mode_offset 12
+#define SDMA_PKT_COPY_T2T_DW_12_dst_swizzle_mode_mask   0x0000001F
+#define SDMA_PKT_COPY_T2T_DW_12_dst_swizzle_mode_shift  3
+#define SDMA_PKT_COPY_T2T_DW_12_DST_SWIZZLE_MODE(x) (((x) & SDMA_PKT_COPY_T2T_DW_12_dst_swizzle_mode_mask) << SDMA_PKT_COPY_T2T_DW_12_dst_swizzle_mode_shift)
+
+/*define for dst_dimension field*/
+#define SDMA_PKT_COPY_T2T_DW_12_dst_dimension_offset 12
+#define SDMA_PKT_COPY_T2T_DW_12_dst_dimension_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_DW_12_dst_dimension_shift  9
+#define SDMA_PKT_COPY_T2T_DW_12_DST_DIMENSION(x) (((x) & SDMA_PKT_COPY_T2T_DW_12_dst_dimension_mask) << SDMA_PKT_COPY_T2T_DW_12_dst_dimension_shift)
+
+/*define for dst_mip_max field*/
+#define SDMA_PKT_COPY_T2T_DW_12_dst_mip_max_offset 12
+#define SDMA_PKT_COPY_T2T_DW_12_dst_mip_max_mask   0x0000000F
+#define SDMA_PKT_COPY_T2T_DW_12_dst_mip_max_shift  16
+#define SDMA_PKT_COPY_T2T_DW_12_DST_MIP_MAX(x) (((x) & SDMA_PKT_COPY_T2T_DW_12_dst_mip_max_mask) << SDMA_PKT_COPY_T2T_DW_12_dst_mip_max_shift)
+
+/*define for dst_mip_id field*/
+#define SDMA_PKT_COPY_T2T_DW_12_dst_mip_id_offset 12
+#define SDMA_PKT_COPY_T2T_DW_12_dst_mip_id_mask   0x0000000F
+#define SDMA_PKT_COPY_T2T_DW_12_dst_mip_id_shift  20
+#define SDMA_PKT_COPY_T2T_DW_12_DST_MIP_ID(x) (((x) & SDMA_PKT_COPY_T2T_DW_12_dst_mip_id_mask) << SDMA_PKT_COPY_T2T_DW_12_dst_mip_id_shift)
+
+/*define for DW_13 word*/
+/*define for rect_x field*/
+#define SDMA_PKT_COPY_T2T_DW_13_rect_x_offset 13
+#define SDMA_PKT_COPY_T2T_DW_13_rect_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_13_rect_x_shift  0
+#define SDMA_PKT_COPY_T2T_DW_13_RECT_X(x) (((x) & SDMA_PKT_COPY_T2T_DW_13_rect_x_mask) << SDMA_PKT_COPY_T2T_DW_13_rect_x_shift)
+
+/*define for rect_y field*/
+#define SDMA_PKT_COPY_T2T_DW_13_rect_y_offset 13
+#define SDMA_PKT_COPY_T2T_DW_13_rect_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_DW_13_rect_y_shift  16
+#define SDMA_PKT_COPY_T2T_DW_13_RECT_Y(x) (((x) & SDMA_PKT_COPY_T2T_DW_13_rect_y_mask) << SDMA_PKT_COPY_T2T_DW_13_rect_y_shift)
+
+/*define for DW_14 word*/
+/*define for rect_z field*/
+#define SDMA_PKT_COPY_T2T_DW_14_rect_z_offset 14
+#define SDMA_PKT_COPY_T2T_DW_14_rect_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_T2T_DW_14_rect_z_shift  0
+#define SDMA_PKT_COPY_T2T_DW_14_RECT_Z(x) (((x) & SDMA_PKT_COPY_T2T_DW_14_rect_z_mask) << SDMA_PKT_COPY_T2T_DW_14_rect_z_shift)
+
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_T2T_DW_14_dst_sw_offset 14
+#define SDMA_PKT_COPY_T2T_DW_14_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_DW_14_dst_sw_shift  16
+#define SDMA_PKT_COPY_T2T_DW_14_DST_SW(x) (((x) & SDMA_PKT_COPY_T2T_DW_14_dst_sw_mask) << SDMA_PKT_COPY_T2T_DW_14_dst_sw_shift)
+
+/*define for dst_cache_policy field*/
+#define SDMA_PKT_COPY_T2T_DW_14_dst_cache_policy_offset 14
+#define SDMA_PKT_COPY_T2T_DW_14_dst_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_DW_14_dst_cache_policy_shift  18
+#define SDMA_PKT_COPY_T2T_DW_14_DST_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_T2T_DW_14_dst_cache_policy_mask) << SDMA_PKT_COPY_T2T_DW_14_dst_cache_policy_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_T2T_DW_14_src_sw_offset 14
+#define SDMA_PKT_COPY_T2T_DW_14_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_DW_14_src_sw_shift  24
+#define SDMA_PKT_COPY_T2T_DW_14_SRC_SW(x) (((x) & SDMA_PKT_COPY_T2T_DW_14_src_sw_mask) << SDMA_PKT_COPY_T2T_DW_14_src_sw_shift)
+
+/*define for src_cache_policy field*/
+#define SDMA_PKT_COPY_T2T_DW_14_src_cache_policy_offset 14
+#define SDMA_PKT_COPY_T2T_DW_14_src_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_DW_14_src_cache_policy_shift  26
+#define SDMA_PKT_COPY_T2T_DW_14_SRC_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_T2T_DW_14_src_cache_policy_mask) << SDMA_PKT_COPY_T2T_DW_14_src_cache_policy_shift)
+
+/*define for META_ADDR_LO word*/
+/*define for meta_addr_31_0 field*/
+#define SDMA_PKT_COPY_T2T_META_ADDR_LO_meta_addr_31_0_offset 15
+#define SDMA_PKT_COPY_T2T_META_ADDR_LO_meta_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_META_ADDR_LO_meta_addr_31_0_shift  0
+#define SDMA_PKT_COPY_T2T_META_ADDR_LO_META_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_T2T_META_ADDR_LO_meta_addr_31_0_mask) << SDMA_PKT_COPY_T2T_META_ADDR_LO_meta_addr_31_0_shift)
+
+/*define for META_ADDR_HI word*/
+/*define for meta_addr_63_32 field*/
+#define SDMA_PKT_COPY_T2T_META_ADDR_HI_meta_addr_63_32_offset 16
+#define SDMA_PKT_COPY_T2T_META_ADDR_HI_meta_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_META_ADDR_HI_meta_addr_63_32_shift  0
+#define SDMA_PKT_COPY_T2T_META_ADDR_HI_META_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_T2T_META_ADDR_HI_meta_addr_63_32_mask) << SDMA_PKT_COPY_T2T_META_ADDR_HI_meta_addr_63_32_shift)
+
+/*define for META_CONFIG word*/
+/*define for data_format field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_data_format_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_data_format_mask   0x0000007F
+#define SDMA_PKT_COPY_T2T_META_CONFIG_data_format_shift  0
+#define SDMA_PKT_COPY_T2T_META_CONFIG_DATA_FORMAT(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_data_format_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_data_format_shift)
+
+/*define for color_transform_disable field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_color_transform_disable_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_color_transform_disable_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_META_CONFIG_color_transform_disable_shift  7
+#define SDMA_PKT_COPY_T2T_META_CONFIG_COLOR_TRANSFORM_DISABLE(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_color_transform_disable_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_color_transform_disable_shift)
+
+/*define for alpha_is_on_msb field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_alpha_is_on_msb_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_alpha_is_on_msb_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_META_CONFIG_alpha_is_on_msb_shift  8
+#define SDMA_PKT_COPY_T2T_META_CONFIG_ALPHA_IS_ON_MSB(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_alpha_is_on_msb_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_alpha_is_on_msb_shift)
+
+/*define for number_type field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_number_type_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_number_type_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_META_CONFIG_number_type_shift  9
+#define SDMA_PKT_COPY_T2T_META_CONFIG_NUMBER_TYPE(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_number_type_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_number_type_shift)
+
+/*define for surface_type field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_surface_type_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_surface_type_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_META_CONFIG_surface_type_shift  12
+#define SDMA_PKT_COPY_T2T_META_CONFIG_SURFACE_TYPE(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_surface_type_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_surface_type_shift)
+
+/*define for meta_llc field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_meta_llc_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_meta_llc_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_META_CONFIG_meta_llc_shift  14
+#define SDMA_PKT_COPY_T2T_META_CONFIG_META_LLC(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_meta_llc_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_meta_llc_shift)
+
+/*define for max_comp_block_size field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_max_comp_block_size_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_max_comp_block_size_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_META_CONFIG_max_comp_block_size_shift  24
+#define SDMA_PKT_COPY_T2T_META_CONFIG_MAX_COMP_BLOCK_SIZE(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_max_comp_block_size_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_max_comp_block_size_shift)
+
+/*define for max_uncomp_block_size field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_max_uncomp_block_size_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_max_uncomp_block_size_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_META_CONFIG_max_uncomp_block_size_shift  26
+#define SDMA_PKT_COPY_T2T_META_CONFIG_MAX_UNCOMP_BLOCK_SIZE(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_max_uncomp_block_size_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_max_uncomp_block_size_shift)
+
+/*define for write_compress_enable field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_write_compress_enable_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_write_compress_enable_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_META_CONFIG_write_compress_enable_shift  28
+#define SDMA_PKT_COPY_T2T_META_CONFIG_WRITE_COMPRESS_ENABLE(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_write_compress_enable_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_write_compress_enable_shift)
+
+/*define for meta_tmz field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_meta_tmz_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_meta_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_META_CONFIG_meta_tmz_shift  29
+#define SDMA_PKT_COPY_T2T_META_CONFIG_META_TMZ(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_meta_tmz_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_meta_tmz_shift)
+
+/*define for pipe_aligned field*/
+#define SDMA_PKT_COPY_T2T_META_CONFIG_pipe_aligned_offset 17
+#define SDMA_PKT_COPY_T2T_META_CONFIG_pipe_aligned_mask   0x00000001
+#define SDMA_PKT_COPY_T2T_META_CONFIG_pipe_aligned_shift  31
+#define SDMA_PKT_COPY_T2T_META_CONFIG_PIPE_ALIGNED(x) (((x) & SDMA_PKT_COPY_T2T_META_CONFIG_pipe_aligned_mask) << SDMA_PKT_COPY_T2T_META_CONFIG_pipe_aligned_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_T2T_BC packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_T2T_BC_HEADER_op_offset 0
+#define SDMA_PKT_COPY_T2T_BC_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_T2T_BC_HEADER_op_shift  0
+#define SDMA_PKT_COPY_T2T_BC_HEADER_OP(x) (((x) & SDMA_PKT_COPY_T2T_BC_HEADER_op_mask) << SDMA_PKT_COPY_T2T_BC_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_T2T_BC_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_T2T_BC_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_T2T_BC_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_T2T_BC_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_T2T_BC_HEADER_sub_op_mask) << SDMA_PKT_COPY_T2T_BC_HEADER_sub_op_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_COPY_T2T_BC_SRC_ADDR_LO_src_addr_31_0_offset 1
+#define SDMA_PKT_COPY_T2T_BC_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_BC_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_COPY_T2T_BC_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_T2T_BC_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_COPY_T2T_BC_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_COPY_T2T_BC_SRC_ADDR_HI_src_addr_63_32_offset 2
+#define SDMA_PKT_COPY_T2T_BC_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_BC_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_COPY_T2T_BC_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_T2T_BC_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_COPY_T2T_BC_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for src_x field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_3_src_x_offset 3
+#define SDMA_PKT_COPY_T2T_BC_DW_3_src_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_3_src_x_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_3_SRC_X(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_3_src_x_mask) << SDMA_PKT_COPY_T2T_BC_DW_3_src_x_shift)
+
+/*define for src_y field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_3_src_y_offset 3
+#define SDMA_PKT_COPY_T2T_BC_DW_3_src_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_3_src_y_shift  16
+#define SDMA_PKT_COPY_T2T_BC_DW_3_SRC_Y(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_3_src_y_mask) << SDMA_PKT_COPY_T2T_BC_DW_3_src_y_shift)
+
+/*define for DW_4 word*/
+/*define for src_z field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_4_src_z_offset 4
+#define SDMA_PKT_COPY_T2T_BC_DW_4_src_z_mask   0x000007FF
+#define SDMA_PKT_COPY_T2T_BC_DW_4_src_z_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_4_SRC_Z(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_4_src_z_mask) << SDMA_PKT_COPY_T2T_BC_DW_4_src_z_shift)
+
+/*define for src_width field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_4_src_width_offset 4
+#define SDMA_PKT_COPY_T2T_BC_DW_4_src_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_4_src_width_shift  16
+#define SDMA_PKT_COPY_T2T_BC_DW_4_SRC_WIDTH(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_4_src_width_mask) << SDMA_PKT_COPY_T2T_BC_DW_4_src_width_shift)
+
+/*define for DW_5 word*/
+/*define for src_height field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_5_src_height_offset 5
+#define SDMA_PKT_COPY_T2T_BC_DW_5_src_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_5_src_height_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_5_SRC_HEIGHT(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_5_src_height_mask) << SDMA_PKT_COPY_T2T_BC_DW_5_src_height_shift)
+
+/*define for src_depth field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_5_src_depth_offset 5
+#define SDMA_PKT_COPY_T2T_BC_DW_5_src_depth_mask   0x000007FF
+#define SDMA_PKT_COPY_T2T_BC_DW_5_src_depth_shift  16
+#define SDMA_PKT_COPY_T2T_BC_DW_5_SRC_DEPTH(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_5_src_depth_mask) << SDMA_PKT_COPY_T2T_BC_DW_5_src_depth_shift)
+
+/*define for DW_6 word*/
+/*define for src_element_size field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_element_size_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_element_size_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_element_size_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_element_size_shift)
+
+/*define for src_array_mode field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_array_mode_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_array_mode_mask   0x0000000F
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_array_mode_shift  3
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_ARRAY_MODE(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_array_mode_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_array_mode_shift)
+
+/*define for src_mit_mode field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_mit_mode_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_mit_mode_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_mit_mode_shift  8
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_MIT_MODE(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_mit_mode_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_mit_mode_shift)
+
+/*define for src_tilesplit_size field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_tilesplit_size_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_tilesplit_size_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_tilesplit_size_shift  11
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_TILESPLIT_SIZE(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_tilesplit_size_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_tilesplit_size_shift)
+
+/*define for src_bank_w field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_w_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_w_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_w_shift  15
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_BANK_W(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_w_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_w_shift)
+
+/*define for src_bank_h field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_h_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_h_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_h_shift  18
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_BANK_H(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_h_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_bank_h_shift)
+
+/*define for src_num_bank field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_num_bank_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_num_bank_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_num_bank_shift  21
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_NUM_BANK(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_num_bank_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_num_bank_shift)
+
+/*define for src_mat_aspt field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_mat_aspt_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_mat_aspt_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_mat_aspt_shift  24
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_MAT_ASPT(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_mat_aspt_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_mat_aspt_shift)
+
+/*define for src_pipe_config field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_pipe_config_offset 6
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_pipe_config_mask   0x0000001F
+#define SDMA_PKT_COPY_T2T_BC_DW_6_src_pipe_config_shift  26
+#define SDMA_PKT_COPY_T2T_BC_DW_6_SRC_PIPE_CONFIG(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_6_src_pipe_config_mask) << SDMA_PKT_COPY_T2T_BC_DW_6_src_pipe_config_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_COPY_T2T_BC_DST_ADDR_LO_dst_addr_31_0_offset 7
+#define SDMA_PKT_COPY_T2T_BC_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_BC_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_T2T_BC_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_COPY_T2T_BC_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_COPY_T2T_BC_DST_ADDR_HI_dst_addr_63_32_offset 8
+#define SDMA_PKT_COPY_T2T_BC_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_T2T_BC_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_T2T_BC_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_COPY_T2T_BC_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DW_9 word*/
+/*define for dst_x field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_9_dst_x_offset 9
+#define SDMA_PKT_COPY_T2T_BC_DW_9_dst_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_9_dst_x_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_9_DST_X(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_9_dst_x_mask) << SDMA_PKT_COPY_T2T_BC_DW_9_dst_x_shift)
+
+/*define for dst_y field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_9_dst_y_offset 9
+#define SDMA_PKT_COPY_T2T_BC_DW_9_dst_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_9_dst_y_shift  16
+#define SDMA_PKT_COPY_T2T_BC_DW_9_DST_Y(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_9_dst_y_mask) << SDMA_PKT_COPY_T2T_BC_DW_9_dst_y_shift)
+
+/*define for DW_10 word*/
+/*define for dst_z field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_10_dst_z_offset 10
+#define SDMA_PKT_COPY_T2T_BC_DW_10_dst_z_mask   0x000007FF
+#define SDMA_PKT_COPY_T2T_BC_DW_10_dst_z_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_10_DST_Z(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_10_dst_z_mask) << SDMA_PKT_COPY_T2T_BC_DW_10_dst_z_shift)
+
+/*define for dst_width field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_10_dst_width_offset 10
+#define SDMA_PKT_COPY_T2T_BC_DW_10_dst_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_10_dst_width_shift  16
+#define SDMA_PKT_COPY_T2T_BC_DW_10_DST_WIDTH(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_10_dst_width_mask) << SDMA_PKT_COPY_T2T_BC_DW_10_dst_width_shift)
+
+/*define for DW_11 word*/
+/*define for dst_height field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_11_dst_height_offset 11
+#define SDMA_PKT_COPY_T2T_BC_DW_11_dst_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_11_dst_height_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_11_DST_HEIGHT(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_11_dst_height_mask) << SDMA_PKT_COPY_T2T_BC_DW_11_dst_height_shift)
+
+/*define for dst_depth field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_11_dst_depth_offset 11
+#define SDMA_PKT_COPY_T2T_BC_DW_11_dst_depth_mask   0x00000FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_11_dst_depth_shift  16
+#define SDMA_PKT_COPY_T2T_BC_DW_11_DST_DEPTH(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_11_dst_depth_mask) << SDMA_PKT_COPY_T2T_BC_DW_11_dst_depth_shift)
+
+/*define for DW_12 word*/
+/*define for dst_element_size field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_element_size_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_element_size_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_element_size_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_element_size_shift)
+
+/*define for dst_array_mode field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_array_mode_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_array_mode_mask   0x0000000F
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_array_mode_shift  3
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_ARRAY_MODE(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_array_mode_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_array_mode_shift)
+
+/*define for dst_mit_mode field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_mit_mode_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_mit_mode_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_mit_mode_shift  8
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_MIT_MODE(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_mit_mode_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_mit_mode_shift)
+
+/*define for dst_tilesplit_size field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_tilesplit_size_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_tilesplit_size_mask   0x00000007
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_tilesplit_size_shift  11
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_TILESPLIT_SIZE(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_tilesplit_size_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_tilesplit_size_shift)
+
+/*define for dst_bank_w field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_w_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_w_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_w_shift  15
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_BANK_W(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_w_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_w_shift)
+
+/*define for dst_bank_h field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_h_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_h_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_h_shift  18
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_BANK_H(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_h_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_bank_h_shift)
+
+/*define for dst_num_bank field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_num_bank_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_num_bank_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_num_bank_shift  21
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_NUM_BANK(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_num_bank_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_num_bank_shift)
+
+/*define for dst_mat_aspt field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_mat_aspt_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_mat_aspt_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_mat_aspt_shift  24
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_MAT_ASPT(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_mat_aspt_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_mat_aspt_shift)
+
+/*define for dst_pipe_config field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_pipe_config_offset 12
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_pipe_config_mask   0x0000001F
+#define SDMA_PKT_COPY_T2T_BC_DW_12_dst_pipe_config_shift  26
+#define SDMA_PKT_COPY_T2T_BC_DW_12_DST_PIPE_CONFIG(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_12_dst_pipe_config_mask) << SDMA_PKT_COPY_T2T_BC_DW_12_dst_pipe_config_shift)
+
+/*define for DW_13 word*/
+/*define for rect_x field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_13_rect_x_offset 13
+#define SDMA_PKT_COPY_T2T_BC_DW_13_rect_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_13_rect_x_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_13_RECT_X(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_13_rect_x_mask) << SDMA_PKT_COPY_T2T_BC_DW_13_rect_x_shift)
+
+/*define for rect_y field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_13_rect_y_offset 13
+#define SDMA_PKT_COPY_T2T_BC_DW_13_rect_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_T2T_BC_DW_13_rect_y_shift  16
+#define SDMA_PKT_COPY_T2T_BC_DW_13_RECT_Y(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_13_rect_y_mask) << SDMA_PKT_COPY_T2T_BC_DW_13_rect_y_shift)
+
+/*define for DW_14 word*/
+/*define for rect_z field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_14_rect_z_offset 14
+#define SDMA_PKT_COPY_T2T_BC_DW_14_rect_z_mask   0x000007FF
+#define SDMA_PKT_COPY_T2T_BC_DW_14_rect_z_shift  0
+#define SDMA_PKT_COPY_T2T_BC_DW_14_RECT_Z(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_14_rect_z_mask) << SDMA_PKT_COPY_T2T_BC_DW_14_rect_z_shift)
+
+/*define for dst_sw field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_14_dst_sw_offset 14
+#define SDMA_PKT_COPY_T2T_BC_DW_14_dst_sw_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_14_dst_sw_shift  16
+#define SDMA_PKT_COPY_T2T_BC_DW_14_DST_SW(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_14_dst_sw_mask) << SDMA_PKT_COPY_T2T_BC_DW_14_dst_sw_shift)
+
+/*define for src_sw field*/
+#define SDMA_PKT_COPY_T2T_BC_DW_14_src_sw_offset 14
+#define SDMA_PKT_COPY_T2T_BC_DW_14_src_sw_mask   0x00000003
+#define SDMA_PKT_COPY_T2T_BC_DW_14_src_sw_shift  24
+#define SDMA_PKT_COPY_T2T_BC_DW_14_SRC_SW(x) (((x) & SDMA_PKT_COPY_T2T_BC_DW_14_src_sw_mask) << SDMA_PKT_COPY_T2T_BC_DW_14_src_sw_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_TILED_SUBWIN packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_op_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_op_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_OP(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_HEADER_op_mask) << SDMA_PKT_COPY_TILED_SUBWIN_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_HEADER_sub_op_mask) << SDMA_PKT_COPY_TILED_SUBWIN_HEADER_sub_op_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_HEADER_tmz_mask) << SDMA_PKT_COPY_TILED_SUBWIN_HEADER_tmz_shift)
+
+/*define for dcc field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_dcc_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_dcc_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_dcc_shift  19
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_DCC(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_HEADER_dcc_mask) << SDMA_PKT_COPY_TILED_SUBWIN_HEADER_dcc_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_cpv_shift  28
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_HEADER_cpv_mask) << SDMA_PKT_COPY_TILED_SUBWIN_HEADER_cpv_shift)
+
+/*define for detile field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_detile_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_detile_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_detile_shift  31
+#define SDMA_PKT_COPY_TILED_SUBWIN_HEADER_DETILE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_HEADER_detile_mask) << SDMA_PKT_COPY_TILED_SUBWIN_HEADER_detile_shift)
+
+/*define for TILED_ADDR_LO word*/
+/*define for tiled_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_LO_tiled_addr_31_0_offset 1
+#define SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_LO_tiled_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_LO_tiled_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_LO_TILED_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_LO_tiled_addr_31_0_mask) << SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_LO_tiled_addr_31_0_shift)
+
+/*define for TILED_ADDR_HI word*/
+/*define for tiled_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_HI_tiled_addr_63_32_offset 2
+#define SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_HI_tiled_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_HI_tiled_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_HI_TILED_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_HI_tiled_addr_63_32_mask) << SDMA_PKT_COPY_TILED_SUBWIN_TILED_ADDR_HI_tiled_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for tiled_x field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_x_offset 3
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_x_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_3_TILED_X(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_x_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_x_shift)
+
+/*define for tiled_y field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_y_offset 3
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_y_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_3_TILED_Y(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_y_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_3_tiled_y_shift)
+
+/*define for DW_4 word*/
+/*define for tiled_z field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_4_tiled_z_offset 4
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_4_tiled_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_4_tiled_z_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_4_TILED_Z(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_4_tiled_z_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_4_tiled_z_shift)
+
+/*define for width field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_4_width_offset 4
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_4_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_4_width_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_4_WIDTH(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_4_width_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_4_width_shift)
+
+/*define for DW_5 word*/
+/*define for height field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_5_height_offset 5
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_5_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_5_height_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_5_HEIGHT(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_5_height_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_5_height_shift)
+
+/*define for depth field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_5_depth_offset 5
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_5_depth_mask   0x00001FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_5_depth_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_5_DEPTH(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_5_depth_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_5_depth_shift)
+
+/*define for DW_6 word*/
+/*define for element_size field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_element_size_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_element_size_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_6_element_size_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_6_element_size_shift)
+
+/*define for swizzle_mode field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_swizzle_mode_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_swizzle_mode_mask   0x0000001F
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_swizzle_mode_shift  3
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_SWIZZLE_MODE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_6_swizzle_mode_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_6_swizzle_mode_shift)
+
+/*define for dimension field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_dimension_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_dimension_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_dimension_shift  9
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_DIMENSION(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_6_dimension_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_6_dimension_shift)
+
+/*define for mip_max field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_max_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_max_mask   0x0000000F
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_max_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_MIP_MAX(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_max_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_max_shift)
+
+/*define for mip_id field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_id_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_id_mask   0x0000000F
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_id_shift  20
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_6_MIP_ID(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_id_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_6_mip_id_shift)
+
+/*define for LINEAR_ADDR_LO word*/
+/*define for linear_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_LO_linear_addr_31_0_offset 7
+#define SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_LO_linear_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_LO_linear_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_LO_LINEAR_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_LO_linear_addr_31_0_mask) << SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_LO_linear_addr_31_0_shift)
+
+/*define for LINEAR_ADDR_HI word*/
+/*define for linear_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_HI_linear_addr_63_32_offset 8
+#define SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_HI_linear_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_HI_linear_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_HI_LINEAR_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_HI_linear_addr_63_32_mask) << SDMA_PKT_COPY_TILED_SUBWIN_LINEAR_ADDR_HI_linear_addr_63_32_shift)
+
+/*define for DW_9 word*/
+/*define for linear_x field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_x_offset 9
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_x_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_9_LINEAR_X(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_x_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_x_shift)
+
+/*define for linear_y field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_y_offset 9
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_y_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_9_LINEAR_Y(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_y_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_9_linear_y_shift)
+
+/*define for DW_10 word*/
+/*define for linear_z field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_z_offset 10
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_z_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_10_LINEAR_Z(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_z_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_z_shift)
+
+/*define for linear_pitch field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_pitch_offset 10
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_pitch_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_pitch_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_10_LINEAR_PITCH(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_pitch_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_10_linear_pitch_shift)
+
+/*define for DW_11 word*/
+/*define for linear_slice_pitch field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_11_linear_slice_pitch_offset 11
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_11_linear_slice_pitch_mask   0x0FFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_11_linear_slice_pitch_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_11_LINEAR_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_11_linear_slice_pitch_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_11_linear_slice_pitch_shift)
+
+/*define for DW_12 word*/
+/*define for rect_x field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_x_offset 12
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_x_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_12_RECT_X(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_x_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_x_shift)
+
+/*define for rect_y field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_y_offset 12
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_y_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_12_RECT_Y(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_y_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_12_rect_y_shift)
+
+/*define for DW_13 word*/
+/*define for rect_z field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_rect_z_offset 13
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_rect_z_mask   0x00001FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_rect_z_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_RECT_Z(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_13_rect_z_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_13_rect_z_shift)
+
+/*define for linear_sw field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_sw_offset 13
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_sw_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_sw_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_LINEAR_SW(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_sw_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_sw_shift)
+
+/*define for linear_cache_policy field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_cache_policy_offset 13
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_cache_policy_shift  18
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_LINEAR_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_cache_policy_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_13_linear_cache_policy_shift)
+
+/*define for tile_sw field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_sw_offset 13
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_sw_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_sw_shift  24
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_TILE_SW(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_sw_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_sw_shift)
+
+/*define for tile_cache_policy field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_cache_policy_offset 13
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_cache_policy_shift  26
+#define SDMA_PKT_COPY_TILED_SUBWIN_DW_13_TILE_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_cache_policy_mask) << SDMA_PKT_COPY_TILED_SUBWIN_DW_13_tile_cache_policy_shift)
+
+/*define for META_ADDR_LO word*/
+/*define for meta_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_LO_meta_addr_31_0_offset 14
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_LO_meta_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_LO_meta_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_LO_META_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_LO_meta_addr_31_0_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_LO_meta_addr_31_0_shift)
+
+/*define for META_ADDR_HI word*/
+/*define for meta_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_HI_meta_addr_63_32_offset 15
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_HI_meta_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_HI_meta_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_HI_META_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_HI_meta_addr_63_32_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_ADDR_HI_meta_addr_63_32_shift)
+
+/*define for META_CONFIG word*/
+/*define for data_format field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_data_format_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_data_format_mask   0x0000007F
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_data_format_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_DATA_FORMAT(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_data_format_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_data_format_shift)
+
+/*define for color_transform_disable field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_color_transform_disable_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_color_transform_disable_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_color_transform_disable_shift  7
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_COLOR_TRANSFORM_DISABLE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_color_transform_disable_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_color_transform_disable_shift)
+
+/*define for alpha_is_on_msb field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_alpha_is_on_msb_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_alpha_is_on_msb_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_alpha_is_on_msb_shift  8
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_ALPHA_IS_ON_MSB(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_alpha_is_on_msb_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_alpha_is_on_msb_shift)
+
+/*define for number_type field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_number_type_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_number_type_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_number_type_shift  9
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_NUMBER_TYPE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_number_type_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_number_type_shift)
+
+/*define for surface_type field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_surface_type_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_surface_type_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_surface_type_shift  12
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_SURFACE_TYPE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_surface_type_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_surface_type_shift)
+
+/*define for meta_llc field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_llc_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_llc_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_llc_shift  14
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_META_LLC(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_llc_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_llc_shift)
+
+/*define for max_comp_block_size field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_comp_block_size_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_comp_block_size_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_comp_block_size_shift  24
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_MAX_COMP_BLOCK_SIZE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_comp_block_size_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_comp_block_size_shift)
+
+/*define for max_uncomp_block_size field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_uncomp_block_size_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_uncomp_block_size_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_uncomp_block_size_shift  26
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_MAX_UNCOMP_BLOCK_SIZE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_uncomp_block_size_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_max_uncomp_block_size_shift)
+
+/*define for write_compress_enable field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_write_compress_enable_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_write_compress_enable_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_write_compress_enable_shift  28
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_WRITE_COMPRESS_ENABLE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_write_compress_enable_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_write_compress_enable_shift)
+
+/*define for meta_tmz field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_tmz_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_tmz_shift  29
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_META_TMZ(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_tmz_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_meta_tmz_shift)
+
+/*define for pipe_aligned field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_pipe_aligned_offset 16
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_pipe_aligned_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_pipe_aligned_shift  31
+#define SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_PIPE_ALIGNED(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_pipe_aligned_mask) << SDMA_PKT_COPY_TILED_SUBWIN_META_CONFIG_pipe_aligned_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_TILED_SUBWIN_BC packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_op_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_op_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_OP(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_op_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_sub_op_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_sub_op_shift)
+
+/*define for detile field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_detile_offset 0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_detile_mask   0x00000001
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_detile_shift  31
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_DETILE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_detile_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_HEADER_detile_shift)
+
+/*define for TILED_ADDR_LO word*/
+/*define for tiled_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_LO_tiled_addr_31_0_offset 1
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_LO_tiled_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_LO_tiled_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_LO_TILED_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_LO_tiled_addr_31_0_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_LO_tiled_addr_31_0_shift)
+
+/*define for TILED_ADDR_HI word*/
+/*define for tiled_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_HI_tiled_addr_63_32_offset 2
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_HI_tiled_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_HI_tiled_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_HI_TILED_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_HI_tiled_addr_63_32_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_TILED_ADDR_HI_tiled_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for tiled_x field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_x_offset 3
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_x_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_TILED_X(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_x_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_x_shift)
+
+/*define for tiled_y field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_y_offset 3
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_y_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_TILED_Y(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_y_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_3_tiled_y_shift)
+
+/*define for DW_4 word*/
+/*define for tiled_z field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_tiled_z_offset 4
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_tiled_z_mask   0x000007FF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_tiled_z_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_TILED_Z(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_tiled_z_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_tiled_z_shift)
+
+/*define for width field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_width_offset 4
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_width_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_width_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_WIDTH(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_width_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_4_width_shift)
+
+/*define for DW_5 word*/
+/*define for height field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_height_offset 5
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_height_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_height_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_HEIGHT(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_height_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_height_shift)
+
+/*define for depth field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_depth_offset 5
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_depth_mask   0x000007FF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_depth_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_DEPTH(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_depth_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_5_depth_shift)
+
+/*define for DW_6 word*/
+/*define for element_size field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_element_size_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_element_size_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_element_size_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_ELEMENT_SIZE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_element_size_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_element_size_shift)
+
+/*define for array_mode field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_array_mode_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_array_mode_mask   0x0000000F
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_array_mode_shift  3
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_ARRAY_MODE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_array_mode_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_array_mode_shift)
+
+/*define for mit_mode field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mit_mode_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mit_mode_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mit_mode_shift  8
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_MIT_MODE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mit_mode_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mit_mode_shift)
+
+/*define for tilesplit_size field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_tilesplit_size_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_tilesplit_size_mask   0x00000007
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_tilesplit_size_shift  11
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_TILESPLIT_SIZE(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_tilesplit_size_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_tilesplit_size_shift)
+
+/*define for bank_w field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_w_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_w_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_w_shift  15
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_BANK_W(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_w_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_w_shift)
+
+/*define for bank_h field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_h_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_h_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_h_shift  18
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_BANK_H(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_h_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_bank_h_shift)
+
+/*define for num_bank field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_num_bank_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_num_bank_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_num_bank_shift  21
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_NUM_BANK(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_num_bank_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_num_bank_shift)
+
+/*define for mat_aspt field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mat_aspt_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mat_aspt_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mat_aspt_shift  24
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_MAT_ASPT(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mat_aspt_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_mat_aspt_shift)
+
+/*define for pipe_config field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_pipe_config_offset 6
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_pipe_config_mask   0x0000001F
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_pipe_config_shift  26
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_PIPE_CONFIG(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_pipe_config_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_6_pipe_config_shift)
+
+/*define for LINEAR_ADDR_LO word*/
+/*define for linear_addr_31_0 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_LO_linear_addr_31_0_offset 7
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_LO_linear_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_LO_linear_addr_31_0_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_LO_LINEAR_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_LO_linear_addr_31_0_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_LO_linear_addr_31_0_shift)
+
+/*define for LINEAR_ADDR_HI word*/
+/*define for linear_addr_63_32 field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_HI_linear_addr_63_32_offset 8
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_HI_linear_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_HI_linear_addr_63_32_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_HI_LINEAR_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_HI_linear_addr_63_32_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_LINEAR_ADDR_HI_linear_addr_63_32_shift)
+
+/*define for DW_9 word*/
+/*define for linear_x field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_x_offset 9
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_x_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_LINEAR_X(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_x_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_x_shift)
+
+/*define for linear_y field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_y_offset 9
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_y_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_LINEAR_Y(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_y_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_9_linear_y_shift)
+
+/*define for DW_10 word*/
+/*define for linear_z field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_z_offset 10
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_z_mask   0x000007FF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_z_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_LINEAR_Z(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_z_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_z_shift)
+
+/*define for linear_pitch field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_pitch_offset 10
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_pitch_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_pitch_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_LINEAR_PITCH(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_pitch_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_10_linear_pitch_shift)
+
+/*define for DW_11 word*/
+/*define for linear_slice_pitch field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_11_linear_slice_pitch_offset 11
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_11_linear_slice_pitch_mask   0x0FFFFFFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_11_linear_slice_pitch_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_11_LINEAR_SLICE_PITCH(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_11_linear_slice_pitch_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_11_linear_slice_pitch_shift)
+
+/*define for DW_12 word*/
+/*define for rect_x field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_x_offset 12
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_x_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_x_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_RECT_X(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_x_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_x_shift)
+
+/*define for rect_y field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_y_offset 12
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_y_mask   0x00003FFF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_y_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_RECT_Y(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_y_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_12_rect_y_shift)
+
+/*define for DW_13 word*/
+/*define for rect_z field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_rect_z_offset 13
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_rect_z_mask   0x000007FF
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_rect_z_shift  0
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_RECT_Z(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_rect_z_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_rect_z_shift)
+
+/*define for linear_sw field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_linear_sw_offset 13
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_linear_sw_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_linear_sw_shift  16
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_LINEAR_SW(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_linear_sw_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_linear_sw_shift)
+
+/*define for tile_sw field*/
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_tile_sw_offset 13
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_tile_sw_mask   0x00000003
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_tile_sw_shift  24
+#define SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_TILE_SW(x) (((x) & SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_tile_sw_mask) << SDMA_PKT_COPY_TILED_SUBWIN_BC_DW_13_tile_sw_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COPY_STRUCT packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COPY_STRUCT_HEADER_op_offset 0
+#define SDMA_PKT_COPY_STRUCT_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COPY_STRUCT_HEADER_op_shift  0
+#define SDMA_PKT_COPY_STRUCT_HEADER_OP(x) (((x) & SDMA_PKT_COPY_STRUCT_HEADER_op_mask) << SDMA_PKT_COPY_STRUCT_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COPY_STRUCT_HEADER_sub_op_offset 0
+#define SDMA_PKT_COPY_STRUCT_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COPY_STRUCT_HEADER_sub_op_shift  8
+#define SDMA_PKT_COPY_STRUCT_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COPY_STRUCT_HEADER_sub_op_mask) << SDMA_PKT_COPY_STRUCT_HEADER_sub_op_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_COPY_STRUCT_HEADER_tmz_offset 0
+#define SDMA_PKT_COPY_STRUCT_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_COPY_STRUCT_HEADER_tmz_shift  18
+#define SDMA_PKT_COPY_STRUCT_HEADER_TMZ(x) (((x) & SDMA_PKT_COPY_STRUCT_HEADER_tmz_mask) << SDMA_PKT_COPY_STRUCT_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COPY_STRUCT_HEADER_cpv_offset 0
+#define SDMA_PKT_COPY_STRUCT_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COPY_STRUCT_HEADER_cpv_shift  28
+#define SDMA_PKT_COPY_STRUCT_HEADER_CPV(x) (((x) & SDMA_PKT_COPY_STRUCT_HEADER_cpv_mask) << SDMA_PKT_COPY_STRUCT_HEADER_cpv_shift)
+
+/*define for detile field*/
+#define SDMA_PKT_COPY_STRUCT_HEADER_detile_offset 0
+#define SDMA_PKT_COPY_STRUCT_HEADER_detile_mask   0x00000001
+#define SDMA_PKT_COPY_STRUCT_HEADER_detile_shift  31
+#define SDMA_PKT_COPY_STRUCT_HEADER_DETILE(x) (((x) & SDMA_PKT_COPY_STRUCT_HEADER_detile_mask) << SDMA_PKT_COPY_STRUCT_HEADER_detile_shift)
+
+/*define for SB_ADDR_LO word*/
+/*define for sb_addr_31_0 field*/
+#define SDMA_PKT_COPY_STRUCT_SB_ADDR_LO_sb_addr_31_0_offset 1
+#define SDMA_PKT_COPY_STRUCT_SB_ADDR_LO_sb_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_STRUCT_SB_ADDR_LO_sb_addr_31_0_shift  0
+#define SDMA_PKT_COPY_STRUCT_SB_ADDR_LO_SB_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_STRUCT_SB_ADDR_LO_sb_addr_31_0_mask) << SDMA_PKT_COPY_STRUCT_SB_ADDR_LO_sb_addr_31_0_shift)
+
+/*define for SB_ADDR_HI word*/
+/*define for sb_addr_63_32 field*/
+#define SDMA_PKT_COPY_STRUCT_SB_ADDR_HI_sb_addr_63_32_offset 2
+#define SDMA_PKT_COPY_STRUCT_SB_ADDR_HI_sb_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_STRUCT_SB_ADDR_HI_sb_addr_63_32_shift  0
+#define SDMA_PKT_COPY_STRUCT_SB_ADDR_HI_SB_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_STRUCT_SB_ADDR_HI_sb_addr_63_32_mask) << SDMA_PKT_COPY_STRUCT_SB_ADDR_HI_sb_addr_63_32_shift)
+
+/*define for START_INDEX word*/
+/*define for start_index field*/
+#define SDMA_PKT_COPY_STRUCT_START_INDEX_start_index_offset 3
+#define SDMA_PKT_COPY_STRUCT_START_INDEX_start_index_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_STRUCT_START_INDEX_start_index_shift  0
+#define SDMA_PKT_COPY_STRUCT_START_INDEX_START_INDEX(x) (((x) & SDMA_PKT_COPY_STRUCT_START_INDEX_start_index_mask) << SDMA_PKT_COPY_STRUCT_START_INDEX_start_index_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_COPY_STRUCT_COUNT_count_offset 4
+#define SDMA_PKT_COPY_STRUCT_COUNT_count_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_STRUCT_COUNT_count_shift  0
+#define SDMA_PKT_COPY_STRUCT_COUNT_COUNT(x) (((x) & SDMA_PKT_COPY_STRUCT_COUNT_count_mask) << SDMA_PKT_COPY_STRUCT_COUNT_count_shift)
+
+/*define for DW_5 word*/
+/*define for stride field*/
+#define SDMA_PKT_COPY_STRUCT_DW_5_stride_offset 5
+#define SDMA_PKT_COPY_STRUCT_DW_5_stride_mask   0x000007FF
+#define SDMA_PKT_COPY_STRUCT_DW_5_stride_shift  0
+#define SDMA_PKT_COPY_STRUCT_DW_5_STRIDE(x) (((x) & SDMA_PKT_COPY_STRUCT_DW_5_stride_mask) << SDMA_PKT_COPY_STRUCT_DW_5_stride_shift)
+
+/*define for linear_sw field*/
+#define SDMA_PKT_COPY_STRUCT_DW_5_linear_sw_offset 5
+#define SDMA_PKT_COPY_STRUCT_DW_5_linear_sw_mask   0x00000003
+#define SDMA_PKT_COPY_STRUCT_DW_5_linear_sw_shift  16
+#define SDMA_PKT_COPY_STRUCT_DW_5_LINEAR_SW(x) (((x) & SDMA_PKT_COPY_STRUCT_DW_5_linear_sw_mask) << SDMA_PKT_COPY_STRUCT_DW_5_linear_sw_shift)
+
+/*define for linear_cache_policy field*/
+#define SDMA_PKT_COPY_STRUCT_DW_5_linear_cache_policy_offset 5
+#define SDMA_PKT_COPY_STRUCT_DW_5_linear_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_STRUCT_DW_5_linear_cache_policy_shift  18
+#define SDMA_PKT_COPY_STRUCT_DW_5_LINEAR_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_STRUCT_DW_5_linear_cache_policy_mask) << SDMA_PKT_COPY_STRUCT_DW_5_linear_cache_policy_shift)
+
+/*define for struct_sw field*/
+#define SDMA_PKT_COPY_STRUCT_DW_5_struct_sw_offset 5
+#define SDMA_PKT_COPY_STRUCT_DW_5_struct_sw_mask   0x00000003
+#define SDMA_PKT_COPY_STRUCT_DW_5_struct_sw_shift  24
+#define SDMA_PKT_COPY_STRUCT_DW_5_STRUCT_SW(x) (((x) & SDMA_PKT_COPY_STRUCT_DW_5_struct_sw_mask) << SDMA_PKT_COPY_STRUCT_DW_5_struct_sw_shift)
+
+/*define for struct_cache_policy field*/
+#define SDMA_PKT_COPY_STRUCT_DW_5_struct_cache_policy_offset 5
+#define SDMA_PKT_COPY_STRUCT_DW_5_struct_cache_policy_mask   0x00000007
+#define SDMA_PKT_COPY_STRUCT_DW_5_struct_cache_policy_shift  26
+#define SDMA_PKT_COPY_STRUCT_DW_5_STRUCT_CACHE_POLICY(x) (((x) & SDMA_PKT_COPY_STRUCT_DW_5_struct_cache_policy_mask) << SDMA_PKT_COPY_STRUCT_DW_5_struct_cache_policy_shift)
+
+/*define for LINEAR_ADDR_LO word*/
+/*define for linear_addr_31_0 field*/
+#define SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_LO_linear_addr_31_0_offset 6
+#define SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_LO_linear_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_LO_linear_addr_31_0_shift  0
+#define SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_LO_LINEAR_ADDR_31_0(x) (((x) & SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_LO_linear_addr_31_0_mask) << SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_LO_linear_addr_31_0_shift)
+
+/*define for LINEAR_ADDR_HI word*/
+/*define for linear_addr_63_32 field*/
+#define SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_HI_linear_addr_63_32_offset 7
+#define SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_HI_linear_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_HI_linear_addr_63_32_shift  0
+#define SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_HI_LINEAR_ADDR_63_32(x) (((x) & SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_HI_linear_addr_63_32_mask) << SDMA_PKT_COPY_STRUCT_LINEAR_ADDR_HI_linear_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_WRITE_UNTILED packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_WRITE_UNTILED_HEADER_op_offset 0
+#define SDMA_PKT_WRITE_UNTILED_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_WRITE_UNTILED_HEADER_op_shift  0
+#define SDMA_PKT_WRITE_UNTILED_HEADER_OP(x) (((x) & SDMA_PKT_WRITE_UNTILED_HEADER_op_mask) << SDMA_PKT_WRITE_UNTILED_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_WRITE_UNTILED_HEADER_sub_op_offset 0
+#define SDMA_PKT_WRITE_UNTILED_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_WRITE_UNTILED_HEADER_sub_op_shift  8
+#define SDMA_PKT_WRITE_UNTILED_HEADER_SUB_OP(x) (((x) & SDMA_PKT_WRITE_UNTILED_HEADER_sub_op_mask) << SDMA_PKT_WRITE_UNTILED_HEADER_sub_op_shift)
+
+/*define for encrypt field*/
+#define SDMA_PKT_WRITE_UNTILED_HEADER_encrypt_offset 0
+#define SDMA_PKT_WRITE_UNTILED_HEADER_encrypt_mask   0x00000001
+#define SDMA_PKT_WRITE_UNTILED_HEADER_encrypt_shift  16
+#define SDMA_PKT_WRITE_UNTILED_HEADER_ENCRYPT(x) (((x) & SDMA_PKT_WRITE_UNTILED_HEADER_encrypt_mask) << SDMA_PKT_WRITE_UNTILED_HEADER_encrypt_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_WRITE_UNTILED_HEADER_tmz_offset 0
+#define SDMA_PKT_WRITE_UNTILED_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_WRITE_UNTILED_HEADER_tmz_shift  18
+#define SDMA_PKT_WRITE_UNTILED_HEADER_TMZ(x) (((x) & SDMA_PKT_WRITE_UNTILED_HEADER_tmz_mask) << SDMA_PKT_WRITE_UNTILED_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_WRITE_UNTILED_HEADER_cpv_offset 0
+#define SDMA_PKT_WRITE_UNTILED_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_WRITE_UNTILED_HEADER_cpv_shift  28
+#define SDMA_PKT_WRITE_UNTILED_HEADER_CPV(x) (((x) & SDMA_PKT_WRITE_UNTILED_HEADER_cpv_mask) << SDMA_PKT_WRITE_UNTILED_HEADER_cpv_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_WRITE_UNTILED_DST_ADDR_LO_dst_addr_31_0_offset 1
+#define SDMA_PKT_WRITE_UNTILED_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_UNTILED_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_WRITE_UNTILED_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_WRITE_UNTILED_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_WRITE_UNTILED_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_WRITE_UNTILED_DST_ADDR_HI_dst_addr_63_32_offset 2
+#define SDMA_PKT_WRITE_UNTILED_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_UNTILED_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_WRITE_UNTILED_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_WRITE_UNTILED_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_WRITE_UNTILED_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for count field*/
+#define SDMA_PKT_WRITE_UNTILED_DW_3_count_offset 3
+#define SDMA_PKT_WRITE_UNTILED_DW_3_count_mask   0x000FFFFF
+#define SDMA_PKT_WRITE_UNTILED_DW_3_count_shift  0
+#define SDMA_PKT_WRITE_UNTILED_DW_3_COUNT(x) (((x) & SDMA_PKT_WRITE_UNTILED_DW_3_count_mask) << SDMA_PKT_WRITE_UNTILED_DW_3_count_shift)
+
+/*define for sw field*/
+#define SDMA_PKT_WRITE_UNTILED_DW_3_sw_offset 3
+#define SDMA_PKT_WRITE_UNTILED_DW_3_sw_mask   0x00000003
+#define SDMA_PKT_WRITE_UNTILED_DW_3_sw_shift  24
+#define SDMA_PKT_WRITE_UNTILED_DW_3_SW(x) (((x) & SDMA_PKT_WRITE_UNTILED_DW_3_sw_mask) << SDMA_PKT_WRITE_UNTILED_DW_3_sw_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_WRITE_UNTILED_DW_3_cache_policy_offset 3
+#define SDMA_PKT_WRITE_UNTILED_DW_3_cache_policy_mask   0x00000007
+#define SDMA_PKT_WRITE_UNTILED_DW_3_cache_policy_shift  26
+#define SDMA_PKT_WRITE_UNTILED_DW_3_CACHE_POLICY(x) (((x) & SDMA_PKT_WRITE_UNTILED_DW_3_cache_policy_mask) << SDMA_PKT_WRITE_UNTILED_DW_3_cache_policy_shift)
+
+/*define for DATA0 word*/
+/*define for data0 field*/
+#define SDMA_PKT_WRITE_UNTILED_DATA0_data0_offset 4
+#define SDMA_PKT_WRITE_UNTILED_DATA0_data0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_UNTILED_DATA0_data0_shift  0
+#define SDMA_PKT_WRITE_UNTILED_DATA0_DATA0(x) (((x) & SDMA_PKT_WRITE_UNTILED_DATA0_data0_mask) << SDMA_PKT_WRITE_UNTILED_DATA0_data0_shift)
+
+
+/*
+** Definitions for SDMA_PKT_WRITE_TILED packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_WRITE_TILED_HEADER_op_offset 0
+#define SDMA_PKT_WRITE_TILED_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_WRITE_TILED_HEADER_op_shift  0
+#define SDMA_PKT_WRITE_TILED_HEADER_OP(x) (((x) & SDMA_PKT_WRITE_TILED_HEADER_op_mask) << SDMA_PKT_WRITE_TILED_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_WRITE_TILED_HEADER_sub_op_offset 0
+#define SDMA_PKT_WRITE_TILED_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_WRITE_TILED_HEADER_sub_op_shift  8
+#define SDMA_PKT_WRITE_TILED_HEADER_SUB_OP(x) (((x) & SDMA_PKT_WRITE_TILED_HEADER_sub_op_mask) << SDMA_PKT_WRITE_TILED_HEADER_sub_op_shift)
+
+/*define for encrypt field*/
+#define SDMA_PKT_WRITE_TILED_HEADER_encrypt_offset 0
+#define SDMA_PKT_WRITE_TILED_HEADER_encrypt_mask   0x00000001
+#define SDMA_PKT_WRITE_TILED_HEADER_encrypt_shift  16
+#define SDMA_PKT_WRITE_TILED_HEADER_ENCRYPT(x) (((x) & SDMA_PKT_WRITE_TILED_HEADER_encrypt_mask) << SDMA_PKT_WRITE_TILED_HEADER_encrypt_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_WRITE_TILED_HEADER_tmz_offset 0
+#define SDMA_PKT_WRITE_TILED_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_WRITE_TILED_HEADER_tmz_shift  18
+#define SDMA_PKT_WRITE_TILED_HEADER_TMZ(x) (((x) & SDMA_PKT_WRITE_TILED_HEADER_tmz_mask) << SDMA_PKT_WRITE_TILED_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_WRITE_TILED_HEADER_cpv_offset 0
+#define SDMA_PKT_WRITE_TILED_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_WRITE_TILED_HEADER_cpv_shift  28
+#define SDMA_PKT_WRITE_TILED_HEADER_CPV(x) (((x) & SDMA_PKT_WRITE_TILED_HEADER_cpv_mask) << SDMA_PKT_WRITE_TILED_HEADER_cpv_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_WRITE_TILED_DST_ADDR_LO_dst_addr_31_0_offset 1
+#define SDMA_PKT_WRITE_TILED_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_TILED_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_WRITE_TILED_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_WRITE_TILED_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_WRITE_TILED_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_WRITE_TILED_DST_ADDR_HI_dst_addr_63_32_offset 2
+#define SDMA_PKT_WRITE_TILED_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_TILED_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_WRITE_TILED_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_WRITE_TILED_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_WRITE_TILED_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for width field*/
+#define SDMA_PKT_WRITE_TILED_DW_3_width_offset 3
+#define SDMA_PKT_WRITE_TILED_DW_3_width_mask   0x00003FFF
+#define SDMA_PKT_WRITE_TILED_DW_3_width_shift  0
+#define SDMA_PKT_WRITE_TILED_DW_3_WIDTH(x) (((x) & SDMA_PKT_WRITE_TILED_DW_3_width_mask) << SDMA_PKT_WRITE_TILED_DW_3_width_shift)
+
+/*define for DW_4 word*/
+/*define for height field*/
+#define SDMA_PKT_WRITE_TILED_DW_4_height_offset 4
+#define SDMA_PKT_WRITE_TILED_DW_4_height_mask   0x00003FFF
+#define SDMA_PKT_WRITE_TILED_DW_4_height_shift  0
+#define SDMA_PKT_WRITE_TILED_DW_4_HEIGHT(x) (((x) & SDMA_PKT_WRITE_TILED_DW_4_height_mask) << SDMA_PKT_WRITE_TILED_DW_4_height_shift)
+
+/*define for depth field*/
+#define SDMA_PKT_WRITE_TILED_DW_4_depth_offset 4
+#define SDMA_PKT_WRITE_TILED_DW_4_depth_mask   0x00001FFF
+#define SDMA_PKT_WRITE_TILED_DW_4_depth_shift  16
+#define SDMA_PKT_WRITE_TILED_DW_4_DEPTH(x) (((x) & SDMA_PKT_WRITE_TILED_DW_4_depth_mask) << SDMA_PKT_WRITE_TILED_DW_4_depth_shift)
+
+/*define for DW_5 word*/
+/*define for element_size field*/
+#define SDMA_PKT_WRITE_TILED_DW_5_element_size_offset 5
+#define SDMA_PKT_WRITE_TILED_DW_5_element_size_mask   0x00000007
+#define SDMA_PKT_WRITE_TILED_DW_5_element_size_shift  0
+#define SDMA_PKT_WRITE_TILED_DW_5_ELEMENT_SIZE(x) (((x) & SDMA_PKT_WRITE_TILED_DW_5_element_size_mask) << SDMA_PKT_WRITE_TILED_DW_5_element_size_shift)
+
+/*define for swizzle_mode field*/
+#define SDMA_PKT_WRITE_TILED_DW_5_swizzle_mode_offset 5
+#define SDMA_PKT_WRITE_TILED_DW_5_swizzle_mode_mask   0x0000001F
+#define SDMA_PKT_WRITE_TILED_DW_5_swizzle_mode_shift  3
+#define SDMA_PKT_WRITE_TILED_DW_5_SWIZZLE_MODE(x) (((x) & SDMA_PKT_WRITE_TILED_DW_5_swizzle_mode_mask) << SDMA_PKT_WRITE_TILED_DW_5_swizzle_mode_shift)
+
+/*define for dimension field*/
+#define SDMA_PKT_WRITE_TILED_DW_5_dimension_offset 5
+#define SDMA_PKT_WRITE_TILED_DW_5_dimension_mask   0x00000003
+#define SDMA_PKT_WRITE_TILED_DW_5_dimension_shift  9
+#define SDMA_PKT_WRITE_TILED_DW_5_DIMENSION(x) (((x) & SDMA_PKT_WRITE_TILED_DW_5_dimension_mask) << SDMA_PKT_WRITE_TILED_DW_5_dimension_shift)
+
+/*define for mip_max field*/
+#define SDMA_PKT_WRITE_TILED_DW_5_mip_max_offset 5
+#define SDMA_PKT_WRITE_TILED_DW_5_mip_max_mask   0x0000000F
+#define SDMA_PKT_WRITE_TILED_DW_5_mip_max_shift  16
+#define SDMA_PKT_WRITE_TILED_DW_5_MIP_MAX(x) (((x) & SDMA_PKT_WRITE_TILED_DW_5_mip_max_mask) << SDMA_PKT_WRITE_TILED_DW_5_mip_max_shift)
+
+/*define for DW_6 word*/
+/*define for x field*/
+#define SDMA_PKT_WRITE_TILED_DW_6_x_offset 6
+#define SDMA_PKT_WRITE_TILED_DW_6_x_mask   0x00003FFF
+#define SDMA_PKT_WRITE_TILED_DW_6_x_shift  0
+#define SDMA_PKT_WRITE_TILED_DW_6_X(x) (((x) & SDMA_PKT_WRITE_TILED_DW_6_x_mask) << SDMA_PKT_WRITE_TILED_DW_6_x_shift)
+
+/*define for y field*/
+#define SDMA_PKT_WRITE_TILED_DW_6_y_offset 6
+#define SDMA_PKT_WRITE_TILED_DW_6_y_mask   0x00003FFF
+#define SDMA_PKT_WRITE_TILED_DW_6_y_shift  16
+#define SDMA_PKT_WRITE_TILED_DW_6_Y(x) (((x) & SDMA_PKT_WRITE_TILED_DW_6_y_mask) << SDMA_PKT_WRITE_TILED_DW_6_y_shift)
+
+/*define for DW_7 word*/
+/*define for z field*/
+#define SDMA_PKT_WRITE_TILED_DW_7_z_offset 7
+#define SDMA_PKT_WRITE_TILED_DW_7_z_mask   0x00001FFF
+#define SDMA_PKT_WRITE_TILED_DW_7_z_shift  0
+#define SDMA_PKT_WRITE_TILED_DW_7_Z(x) (((x) & SDMA_PKT_WRITE_TILED_DW_7_z_mask) << SDMA_PKT_WRITE_TILED_DW_7_z_shift)
+
+/*define for sw field*/
+#define SDMA_PKT_WRITE_TILED_DW_7_sw_offset 7
+#define SDMA_PKT_WRITE_TILED_DW_7_sw_mask   0x00000003
+#define SDMA_PKT_WRITE_TILED_DW_7_sw_shift  24
+#define SDMA_PKT_WRITE_TILED_DW_7_SW(x) (((x) & SDMA_PKT_WRITE_TILED_DW_7_sw_mask) << SDMA_PKT_WRITE_TILED_DW_7_sw_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_WRITE_TILED_DW_7_cache_policy_offset 7
+#define SDMA_PKT_WRITE_TILED_DW_7_cache_policy_mask   0x00000007
+#define SDMA_PKT_WRITE_TILED_DW_7_cache_policy_shift  26
+#define SDMA_PKT_WRITE_TILED_DW_7_CACHE_POLICY(x) (((x) & SDMA_PKT_WRITE_TILED_DW_7_cache_policy_mask) << SDMA_PKT_WRITE_TILED_DW_7_cache_policy_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_WRITE_TILED_COUNT_count_offset 8
+#define SDMA_PKT_WRITE_TILED_COUNT_count_mask   0x000FFFFF
+#define SDMA_PKT_WRITE_TILED_COUNT_count_shift  0
+#define SDMA_PKT_WRITE_TILED_COUNT_COUNT(x) (((x) & SDMA_PKT_WRITE_TILED_COUNT_count_mask) << SDMA_PKT_WRITE_TILED_COUNT_count_shift)
+
+/*define for DATA0 word*/
+/*define for data0 field*/
+#define SDMA_PKT_WRITE_TILED_DATA0_data0_offset 9
+#define SDMA_PKT_WRITE_TILED_DATA0_data0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_TILED_DATA0_data0_shift  0
+#define SDMA_PKT_WRITE_TILED_DATA0_DATA0(x) (((x) & SDMA_PKT_WRITE_TILED_DATA0_data0_mask) << SDMA_PKT_WRITE_TILED_DATA0_data0_shift)
+
+
+/*
+** Definitions for SDMA_PKT_WRITE_TILED_BC packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_WRITE_TILED_BC_HEADER_op_offset 0
+#define SDMA_PKT_WRITE_TILED_BC_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_WRITE_TILED_BC_HEADER_op_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_HEADER_OP(x) (((x) & SDMA_PKT_WRITE_TILED_BC_HEADER_op_mask) << SDMA_PKT_WRITE_TILED_BC_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_WRITE_TILED_BC_HEADER_sub_op_offset 0
+#define SDMA_PKT_WRITE_TILED_BC_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_WRITE_TILED_BC_HEADER_sub_op_shift  8
+#define SDMA_PKT_WRITE_TILED_BC_HEADER_SUB_OP(x) (((x) & SDMA_PKT_WRITE_TILED_BC_HEADER_sub_op_mask) << SDMA_PKT_WRITE_TILED_BC_HEADER_sub_op_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_WRITE_TILED_BC_DST_ADDR_LO_dst_addr_31_0_offset 1
+#define SDMA_PKT_WRITE_TILED_BC_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_TILED_BC_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_WRITE_TILED_BC_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_WRITE_TILED_BC_DST_ADDR_HI_dst_addr_63_32_offset 2
+#define SDMA_PKT_WRITE_TILED_BC_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_TILED_BC_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_WRITE_TILED_BC_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DW_3 word*/
+/*define for width field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_3_width_offset 3
+#define SDMA_PKT_WRITE_TILED_BC_DW_3_width_mask   0x00003FFF
+#define SDMA_PKT_WRITE_TILED_BC_DW_3_width_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_DW_3_WIDTH(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_3_width_mask) << SDMA_PKT_WRITE_TILED_BC_DW_3_width_shift)
+
+/*define for DW_4 word*/
+/*define for height field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_4_height_offset 4
+#define SDMA_PKT_WRITE_TILED_BC_DW_4_height_mask   0x00003FFF
+#define SDMA_PKT_WRITE_TILED_BC_DW_4_height_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_DW_4_HEIGHT(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_4_height_mask) << SDMA_PKT_WRITE_TILED_BC_DW_4_height_shift)
+
+/*define for depth field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_4_depth_offset 4
+#define SDMA_PKT_WRITE_TILED_BC_DW_4_depth_mask   0x000007FF
+#define SDMA_PKT_WRITE_TILED_BC_DW_4_depth_shift  16
+#define SDMA_PKT_WRITE_TILED_BC_DW_4_DEPTH(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_4_depth_mask) << SDMA_PKT_WRITE_TILED_BC_DW_4_depth_shift)
+
+/*define for DW_5 word*/
+/*define for element_size field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_element_size_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_element_size_mask   0x00000007
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_element_size_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_ELEMENT_SIZE(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_element_size_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_element_size_shift)
+
+/*define for array_mode field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_array_mode_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_array_mode_mask   0x0000000F
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_array_mode_shift  3
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_ARRAY_MODE(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_array_mode_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_array_mode_shift)
+
+/*define for mit_mode field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_mit_mode_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_mit_mode_mask   0x00000007
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_mit_mode_shift  8
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_MIT_MODE(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_mit_mode_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_mit_mode_shift)
+
+/*define for tilesplit_size field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_tilesplit_size_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_tilesplit_size_mask   0x00000007
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_tilesplit_size_shift  11
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_TILESPLIT_SIZE(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_tilesplit_size_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_tilesplit_size_shift)
+
+/*define for bank_w field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_bank_w_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_bank_w_mask   0x00000003
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_bank_w_shift  15
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_BANK_W(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_bank_w_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_bank_w_shift)
+
+/*define for bank_h field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_bank_h_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_bank_h_mask   0x00000003
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_bank_h_shift  18
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_BANK_H(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_bank_h_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_bank_h_shift)
+
+/*define for num_bank field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_num_bank_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_num_bank_mask   0x00000003
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_num_bank_shift  21
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_NUM_BANK(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_num_bank_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_num_bank_shift)
+
+/*define for mat_aspt field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_mat_aspt_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_mat_aspt_mask   0x00000003
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_mat_aspt_shift  24
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_MAT_ASPT(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_mat_aspt_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_mat_aspt_shift)
+
+/*define for pipe_config field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_pipe_config_offset 5
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_pipe_config_mask   0x0000001F
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_pipe_config_shift  26
+#define SDMA_PKT_WRITE_TILED_BC_DW_5_PIPE_CONFIG(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_5_pipe_config_mask) << SDMA_PKT_WRITE_TILED_BC_DW_5_pipe_config_shift)
+
+/*define for DW_6 word*/
+/*define for x field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_6_x_offset 6
+#define SDMA_PKT_WRITE_TILED_BC_DW_6_x_mask   0x00003FFF
+#define SDMA_PKT_WRITE_TILED_BC_DW_6_x_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_DW_6_X(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_6_x_mask) << SDMA_PKT_WRITE_TILED_BC_DW_6_x_shift)
+
+/*define for y field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_6_y_offset 6
+#define SDMA_PKT_WRITE_TILED_BC_DW_6_y_mask   0x00003FFF
+#define SDMA_PKT_WRITE_TILED_BC_DW_6_y_shift  16
+#define SDMA_PKT_WRITE_TILED_BC_DW_6_Y(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_6_y_mask) << SDMA_PKT_WRITE_TILED_BC_DW_6_y_shift)
+
+/*define for DW_7 word*/
+/*define for z field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_7_z_offset 7
+#define SDMA_PKT_WRITE_TILED_BC_DW_7_z_mask   0x000007FF
+#define SDMA_PKT_WRITE_TILED_BC_DW_7_z_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_DW_7_Z(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_7_z_mask) << SDMA_PKT_WRITE_TILED_BC_DW_7_z_shift)
+
+/*define for sw field*/
+#define SDMA_PKT_WRITE_TILED_BC_DW_7_sw_offset 7
+#define SDMA_PKT_WRITE_TILED_BC_DW_7_sw_mask   0x00000003
+#define SDMA_PKT_WRITE_TILED_BC_DW_7_sw_shift  24
+#define SDMA_PKT_WRITE_TILED_BC_DW_7_SW(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DW_7_sw_mask) << SDMA_PKT_WRITE_TILED_BC_DW_7_sw_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_WRITE_TILED_BC_COUNT_count_offset 8
+#define SDMA_PKT_WRITE_TILED_BC_COUNT_count_mask   0x000FFFFF
+#define SDMA_PKT_WRITE_TILED_BC_COUNT_count_shift  2
+#define SDMA_PKT_WRITE_TILED_BC_COUNT_COUNT(x) (((x) & SDMA_PKT_WRITE_TILED_BC_COUNT_count_mask) << SDMA_PKT_WRITE_TILED_BC_COUNT_count_shift)
+
+/*define for DATA0 word*/
+/*define for data0 field*/
+#define SDMA_PKT_WRITE_TILED_BC_DATA0_data0_offset 9
+#define SDMA_PKT_WRITE_TILED_BC_DATA0_data0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_TILED_BC_DATA0_data0_shift  0
+#define SDMA_PKT_WRITE_TILED_BC_DATA0_DATA0(x) (((x) & SDMA_PKT_WRITE_TILED_BC_DATA0_data0_mask) << SDMA_PKT_WRITE_TILED_BC_DATA0_data0_shift)
+
+
+/*
+** Definitions for SDMA_PKT_PTEPDE_COPY packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_PTEPDE_COPY_HEADER_op_offset 0
+#define SDMA_PKT_PTEPDE_COPY_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_PTEPDE_COPY_HEADER_op_shift  0
+#define SDMA_PKT_PTEPDE_COPY_HEADER_OP(x) (((x) & SDMA_PKT_PTEPDE_COPY_HEADER_op_mask) << SDMA_PKT_PTEPDE_COPY_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_PTEPDE_COPY_HEADER_sub_op_offset 0
+#define SDMA_PKT_PTEPDE_COPY_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_PTEPDE_COPY_HEADER_sub_op_shift  8
+#define SDMA_PKT_PTEPDE_COPY_HEADER_SUB_OP(x) (((x) & SDMA_PKT_PTEPDE_COPY_HEADER_sub_op_mask) << SDMA_PKT_PTEPDE_COPY_HEADER_sub_op_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_PTEPDE_COPY_HEADER_tmz_offset 0
+#define SDMA_PKT_PTEPDE_COPY_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_PTEPDE_COPY_HEADER_tmz_shift  18
+#define SDMA_PKT_PTEPDE_COPY_HEADER_TMZ(x) (((x) & SDMA_PKT_PTEPDE_COPY_HEADER_tmz_mask) << SDMA_PKT_PTEPDE_COPY_HEADER_tmz_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_PTEPDE_COPY_HEADER_cpv_offset 0
+#define SDMA_PKT_PTEPDE_COPY_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_PTEPDE_COPY_HEADER_cpv_shift  28
+#define SDMA_PKT_PTEPDE_COPY_HEADER_CPV(x) (((x) & SDMA_PKT_PTEPDE_COPY_HEADER_cpv_mask) << SDMA_PKT_PTEPDE_COPY_HEADER_cpv_shift)
+
+/*define for ptepde_op field*/
+#define SDMA_PKT_PTEPDE_COPY_HEADER_ptepde_op_offset 0
+#define SDMA_PKT_PTEPDE_COPY_HEADER_ptepde_op_mask   0x00000001
+#define SDMA_PKT_PTEPDE_COPY_HEADER_ptepde_op_shift  31
+#define SDMA_PKT_PTEPDE_COPY_HEADER_PTEPDE_OP(x) (((x) & SDMA_PKT_PTEPDE_COPY_HEADER_ptepde_op_mask) << SDMA_PKT_PTEPDE_COPY_HEADER_ptepde_op_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_PTEPDE_COPY_SRC_ADDR_LO_src_addr_31_0_offset 1
+#define SDMA_PKT_PTEPDE_COPY_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_PTEPDE_COPY_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_PTEPDE_COPY_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_PTEPDE_COPY_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_PTEPDE_COPY_SRC_ADDR_HI_src_addr_63_32_offset 2
+#define SDMA_PKT_PTEPDE_COPY_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_PTEPDE_COPY_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_PTEPDE_COPY_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_PTEPDE_COPY_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_PTEPDE_COPY_DST_ADDR_LO_dst_addr_31_0_offset 3
+#define SDMA_PKT_PTEPDE_COPY_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_PTEPDE_COPY_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_PTEPDE_COPY_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_PTEPDE_COPY_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_PTEPDE_COPY_DST_ADDR_HI_dst_addr_63_32_offset 4
+#define SDMA_PKT_PTEPDE_COPY_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_PTEPDE_COPY_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_PTEPDE_COPY_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_PTEPDE_COPY_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for MASK_DW0 word*/
+/*define for mask_dw0 field*/
+#define SDMA_PKT_PTEPDE_COPY_MASK_DW0_mask_dw0_offset 5
+#define SDMA_PKT_PTEPDE_COPY_MASK_DW0_mask_dw0_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_MASK_DW0_mask_dw0_shift  0
+#define SDMA_PKT_PTEPDE_COPY_MASK_DW0_MASK_DW0(x) (((x) & SDMA_PKT_PTEPDE_COPY_MASK_DW0_mask_dw0_mask) << SDMA_PKT_PTEPDE_COPY_MASK_DW0_mask_dw0_shift)
+
+/*define for MASK_DW1 word*/
+/*define for mask_dw1 field*/
+#define SDMA_PKT_PTEPDE_COPY_MASK_DW1_mask_dw1_offset 6
+#define SDMA_PKT_PTEPDE_COPY_MASK_DW1_mask_dw1_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_MASK_DW1_mask_dw1_shift  0
+#define SDMA_PKT_PTEPDE_COPY_MASK_DW1_MASK_DW1(x) (((x) & SDMA_PKT_PTEPDE_COPY_MASK_DW1_mask_dw1_mask) << SDMA_PKT_PTEPDE_COPY_MASK_DW1_mask_dw1_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_PTEPDE_COPY_COUNT_count_offset 7
+#define SDMA_PKT_PTEPDE_COPY_COUNT_count_mask   0x0007FFFF
+#define SDMA_PKT_PTEPDE_COPY_COUNT_count_shift  0
+#define SDMA_PKT_PTEPDE_COPY_COUNT_COUNT(x) (((x) & SDMA_PKT_PTEPDE_COPY_COUNT_count_mask) << SDMA_PKT_PTEPDE_COPY_COUNT_count_shift)
+
+/*define for dst_cache_policy field*/
+#define SDMA_PKT_PTEPDE_COPY_COUNT_dst_cache_policy_offset 7
+#define SDMA_PKT_PTEPDE_COPY_COUNT_dst_cache_policy_mask   0x00000007
+#define SDMA_PKT_PTEPDE_COPY_COUNT_dst_cache_policy_shift  22
+#define SDMA_PKT_PTEPDE_COPY_COUNT_DST_CACHE_POLICY(x) (((x) & SDMA_PKT_PTEPDE_COPY_COUNT_dst_cache_policy_mask) << SDMA_PKT_PTEPDE_COPY_COUNT_dst_cache_policy_shift)
+
+/*define for src_cache_policy field*/
+#define SDMA_PKT_PTEPDE_COPY_COUNT_src_cache_policy_offset 7
+#define SDMA_PKT_PTEPDE_COPY_COUNT_src_cache_policy_mask   0x00000007
+#define SDMA_PKT_PTEPDE_COPY_COUNT_src_cache_policy_shift  29
+#define SDMA_PKT_PTEPDE_COPY_COUNT_SRC_CACHE_POLICY(x) (((x) & SDMA_PKT_PTEPDE_COPY_COUNT_src_cache_policy_mask) << SDMA_PKT_PTEPDE_COPY_COUNT_src_cache_policy_shift)
+
+
+/*
+** Definitions for SDMA_PKT_PTEPDE_COPY_BACKWARDS packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_op_offset 0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_op_shift  0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_OP(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_op_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_sub_op_offset 0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_sub_op_shift  8
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_SUB_OP(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_sub_op_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_sub_op_shift)
+
+/*define for pte_size field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_pte_size_offset 0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_pte_size_mask   0x00000003
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_pte_size_shift  28
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_PTE_SIZE(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_pte_size_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_pte_size_shift)
+
+/*define for direction field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_direction_offset 0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_direction_mask   0x00000001
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_direction_shift  30
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_DIRECTION(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_direction_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_direction_shift)
+
+/*define for ptepde_op field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_ptepde_op_offset 0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_ptepde_op_mask   0x00000001
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_ptepde_op_shift  31
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_PTEPDE_OP(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_ptepde_op_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_HEADER_ptepde_op_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_LO_src_addr_31_0_offset 1
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_HI_src_addr_63_32_offset 2
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_LO_dst_addr_31_0_offset 3
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_HI_dst_addr_63_32_offset 4
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for MASK_BIT_FOR_DW word*/
+/*define for mask_first_xfer field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_first_xfer_offset 5
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_first_xfer_mask   0x000000FF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_first_xfer_shift  0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_MASK_FIRST_XFER(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_first_xfer_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_first_xfer_shift)
+
+/*define for mask_last_xfer field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_last_xfer_offset 5
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_last_xfer_mask   0x000000FF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_last_xfer_shift  8
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_MASK_LAST_XFER(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_last_xfer_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_MASK_BIT_FOR_DW_mask_last_xfer_shift)
+
+/*define for COUNT_IN_32B_XFER word*/
+/*define for count field*/
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_COUNT_IN_32B_XFER_count_offset 6
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_COUNT_IN_32B_XFER_count_mask   0x0001FFFF
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_COUNT_IN_32B_XFER_count_shift  0
+#define SDMA_PKT_PTEPDE_COPY_BACKWARDS_COUNT_IN_32B_XFER_COUNT(x) (((x) & SDMA_PKT_PTEPDE_COPY_BACKWARDS_COUNT_IN_32B_XFER_count_mask) << SDMA_PKT_PTEPDE_COPY_BACKWARDS_COUNT_IN_32B_XFER_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_PTEPDE_RMW packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_op_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_PTEPDE_RMW_HEADER_op_shift  0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_OP(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_op_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_sub_op_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_PTEPDE_RMW_HEADER_sub_op_shift  8
+#define SDMA_PKT_PTEPDE_RMW_HEADER_SUB_OP(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_sub_op_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_sub_op_shift)
+
+/*define for mtype field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_mtype_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_mtype_mask   0x00000007
+#define SDMA_PKT_PTEPDE_RMW_HEADER_mtype_shift  16
+#define SDMA_PKT_PTEPDE_RMW_HEADER_MTYPE(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_mtype_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_mtype_shift)
+
+/*define for gcc field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_gcc_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_gcc_mask   0x00000001
+#define SDMA_PKT_PTEPDE_RMW_HEADER_gcc_shift  19
+#define SDMA_PKT_PTEPDE_RMW_HEADER_GCC(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_gcc_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_gcc_shift)
+
+/*define for sys field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_sys_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_sys_mask   0x00000001
+#define SDMA_PKT_PTEPDE_RMW_HEADER_sys_shift  20
+#define SDMA_PKT_PTEPDE_RMW_HEADER_SYS(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_sys_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_sys_shift)
+
+/*define for snp field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_snp_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_snp_mask   0x00000001
+#define SDMA_PKT_PTEPDE_RMW_HEADER_snp_shift  22
+#define SDMA_PKT_PTEPDE_RMW_HEADER_SNP(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_snp_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_snp_shift)
+
+/*define for gpa field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_gpa_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_gpa_mask   0x00000001
+#define SDMA_PKT_PTEPDE_RMW_HEADER_gpa_shift  23
+#define SDMA_PKT_PTEPDE_RMW_HEADER_GPA(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_gpa_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_gpa_shift)
+
+/*define for l2_policy field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_l2_policy_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_l2_policy_mask   0x00000003
+#define SDMA_PKT_PTEPDE_RMW_HEADER_l2_policy_shift  24
+#define SDMA_PKT_PTEPDE_RMW_HEADER_L2_POLICY(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_l2_policy_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_l2_policy_shift)
+
+/*define for llc_policy field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_llc_policy_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_llc_policy_mask   0x00000001
+#define SDMA_PKT_PTEPDE_RMW_HEADER_llc_policy_shift  26
+#define SDMA_PKT_PTEPDE_RMW_HEADER_LLC_POLICY(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_llc_policy_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_llc_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_PTEPDE_RMW_HEADER_cpv_offset 0
+#define SDMA_PKT_PTEPDE_RMW_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_PTEPDE_RMW_HEADER_cpv_shift  28
+#define SDMA_PKT_PTEPDE_RMW_HEADER_CPV(x) (((x) & SDMA_PKT_PTEPDE_RMW_HEADER_cpv_mask) << SDMA_PKT_PTEPDE_RMW_HEADER_cpv_shift)
+
+/*define for ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_PTEPDE_RMW_ADDR_LO_addr_31_0_offset 1
+#define SDMA_PKT_PTEPDE_RMW_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_RMW_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_PTEPDE_RMW_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_PTEPDE_RMW_ADDR_LO_addr_31_0_mask) << SDMA_PKT_PTEPDE_RMW_ADDR_LO_addr_31_0_shift)
+
+/*define for ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_PTEPDE_RMW_ADDR_HI_addr_63_32_offset 2
+#define SDMA_PKT_PTEPDE_RMW_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_RMW_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_PTEPDE_RMW_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_PTEPDE_RMW_ADDR_HI_addr_63_32_mask) << SDMA_PKT_PTEPDE_RMW_ADDR_HI_addr_63_32_shift)
+
+/*define for MASK_LO word*/
+/*define for mask_31_0 field*/
+#define SDMA_PKT_PTEPDE_RMW_MASK_LO_mask_31_0_offset 3
+#define SDMA_PKT_PTEPDE_RMW_MASK_LO_mask_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_RMW_MASK_LO_mask_31_0_shift  0
+#define SDMA_PKT_PTEPDE_RMW_MASK_LO_MASK_31_0(x) (((x) & SDMA_PKT_PTEPDE_RMW_MASK_LO_mask_31_0_mask) << SDMA_PKT_PTEPDE_RMW_MASK_LO_mask_31_0_shift)
+
+/*define for MASK_HI word*/
+/*define for mask_63_32 field*/
+#define SDMA_PKT_PTEPDE_RMW_MASK_HI_mask_63_32_offset 4
+#define SDMA_PKT_PTEPDE_RMW_MASK_HI_mask_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_RMW_MASK_HI_mask_63_32_shift  0
+#define SDMA_PKT_PTEPDE_RMW_MASK_HI_MASK_63_32(x) (((x) & SDMA_PKT_PTEPDE_RMW_MASK_HI_mask_63_32_mask) << SDMA_PKT_PTEPDE_RMW_MASK_HI_mask_63_32_shift)
+
+/*define for VALUE_LO word*/
+/*define for value_31_0 field*/
+#define SDMA_PKT_PTEPDE_RMW_VALUE_LO_value_31_0_offset 5
+#define SDMA_PKT_PTEPDE_RMW_VALUE_LO_value_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_RMW_VALUE_LO_value_31_0_shift  0
+#define SDMA_PKT_PTEPDE_RMW_VALUE_LO_VALUE_31_0(x) (((x) & SDMA_PKT_PTEPDE_RMW_VALUE_LO_value_31_0_mask) << SDMA_PKT_PTEPDE_RMW_VALUE_LO_value_31_0_shift)
+
+/*define for VALUE_HI word*/
+/*define for value_63_32 field*/
+#define SDMA_PKT_PTEPDE_RMW_VALUE_HI_value_63_32_offset 6
+#define SDMA_PKT_PTEPDE_RMW_VALUE_HI_value_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_RMW_VALUE_HI_value_63_32_shift  0
+#define SDMA_PKT_PTEPDE_RMW_VALUE_HI_VALUE_63_32(x) (((x) & SDMA_PKT_PTEPDE_RMW_VALUE_HI_value_63_32_mask) << SDMA_PKT_PTEPDE_RMW_VALUE_HI_value_63_32_shift)
+
+/*define for COUNT word*/
+/*define for num_of_pte field*/
+#define SDMA_PKT_PTEPDE_RMW_COUNT_num_of_pte_offset 7
+#define SDMA_PKT_PTEPDE_RMW_COUNT_num_of_pte_mask   0xFFFFFFFF
+#define SDMA_PKT_PTEPDE_RMW_COUNT_num_of_pte_shift  0
+#define SDMA_PKT_PTEPDE_RMW_COUNT_NUM_OF_PTE(x) (((x) & SDMA_PKT_PTEPDE_RMW_COUNT_num_of_pte_mask) << SDMA_PKT_PTEPDE_RMW_COUNT_num_of_pte_shift)
+
+
+/*
+** Definitions for SDMA_PKT_REGISTER_RMW packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_REGISTER_RMW_HEADER_op_offset 0
+#define SDMA_PKT_REGISTER_RMW_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_REGISTER_RMW_HEADER_op_shift  0
+#define SDMA_PKT_REGISTER_RMW_HEADER_OP(x) (((x) & SDMA_PKT_REGISTER_RMW_HEADER_op_mask) << SDMA_PKT_REGISTER_RMW_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_REGISTER_RMW_HEADER_sub_op_offset 0
+#define SDMA_PKT_REGISTER_RMW_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_REGISTER_RMW_HEADER_sub_op_shift  8
+#define SDMA_PKT_REGISTER_RMW_HEADER_SUB_OP(x) (((x) & SDMA_PKT_REGISTER_RMW_HEADER_sub_op_mask) << SDMA_PKT_REGISTER_RMW_HEADER_sub_op_shift)
+
+/*define for ADDR word*/
+/*define for addr field*/
+#define SDMA_PKT_REGISTER_RMW_ADDR_addr_offset 1
+#define SDMA_PKT_REGISTER_RMW_ADDR_addr_mask   0x000FFFFF
+#define SDMA_PKT_REGISTER_RMW_ADDR_addr_shift  0
+#define SDMA_PKT_REGISTER_RMW_ADDR_ADDR(x) (((x) & SDMA_PKT_REGISTER_RMW_ADDR_addr_mask) << SDMA_PKT_REGISTER_RMW_ADDR_addr_shift)
+
+/*define for aperture_id field*/
+#define SDMA_PKT_REGISTER_RMW_ADDR_aperture_id_offset 1
+#define SDMA_PKT_REGISTER_RMW_ADDR_aperture_id_mask   0x00000FFF
+#define SDMA_PKT_REGISTER_RMW_ADDR_aperture_id_shift  20
+#define SDMA_PKT_REGISTER_RMW_ADDR_APERTURE_ID(x) (((x) & SDMA_PKT_REGISTER_RMW_ADDR_aperture_id_mask) << SDMA_PKT_REGISTER_RMW_ADDR_aperture_id_shift)
+
+/*define for MASK word*/
+/*define for mask field*/
+#define SDMA_PKT_REGISTER_RMW_MASK_mask_offset 2
+#define SDMA_PKT_REGISTER_RMW_MASK_mask_mask   0xFFFFFFFF
+#define SDMA_PKT_REGISTER_RMW_MASK_mask_shift  0
+#define SDMA_PKT_REGISTER_RMW_MASK_MASK(x) (((x) & SDMA_PKT_REGISTER_RMW_MASK_mask_mask) << SDMA_PKT_REGISTER_RMW_MASK_mask_shift)
+
+/*define for VALUE word*/
+/*define for value field*/
+#define SDMA_PKT_REGISTER_RMW_VALUE_value_offset 3
+#define SDMA_PKT_REGISTER_RMW_VALUE_value_mask   0xFFFFFFFF
+#define SDMA_PKT_REGISTER_RMW_VALUE_value_shift  0
+#define SDMA_PKT_REGISTER_RMW_VALUE_VALUE(x) (((x) & SDMA_PKT_REGISTER_RMW_VALUE_value_mask) << SDMA_PKT_REGISTER_RMW_VALUE_value_shift)
+
+/*define for MISC word*/
+/*define for stride field*/
+#define SDMA_PKT_REGISTER_RMW_MISC_stride_offset 4
+#define SDMA_PKT_REGISTER_RMW_MISC_stride_mask   0x000FFFFF
+#define SDMA_PKT_REGISTER_RMW_MISC_stride_shift  0
+#define SDMA_PKT_REGISTER_RMW_MISC_STRIDE(x) (((x) & SDMA_PKT_REGISTER_RMW_MISC_stride_mask) << SDMA_PKT_REGISTER_RMW_MISC_stride_shift)
+
+/*define for num_of_reg field*/
+#define SDMA_PKT_REGISTER_RMW_MISC_num_of_reg_offset 4
+#define SDMA_PKT_REGISTER_RMW_MISC_num_of_reg_mask   0x00000FFF
+#define SDMA_PKT_REGISTER_RMW_MISC_num_of_reg_shift  20
+#define SDMA_PKT_REGISTER_RMW_MISC_NUM_OF_REG(x) (((x) & SDMA_PKT_REGISTER_RMW_MISC_num_of_reg_mask) << SDMA_PKT_REGISTER_RMW_MISC_num_of_reg_shift)
+
+
+/*
+** Definitions for SDMA_PKT_WRITE_INCR packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_WRITE_INCR_HEADER_op_offset 0
+#define SDMA_PKT_WRITE_INCR_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_WRITE_INCR_HEADER_op_shift  0
+#define SDMA_PKT_WRITE_INCR_HEADER_OP(x) (((x) & SDMA_PKT_WRITE_INCR_HEADER_op_mask) << SDMA_PKT_WRITE_INCR_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_WRITE_INCR_HEADER_sub_op_offset 0
+#define SDMA_PKT_WRITE_INCR_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_WRITE_INCR_HEADER_sub_op_shift  8
+#define SDMA_PKT_WRITE_INCR_HEADER_SUB_OP(x) (((x) & SDMA_PKT_WRITE_INCR_HEADER_sub_op_mask) << SDMA_PKT_WRITE_INCR_HEADER_sub_op_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_WRITE_INCR_HEADER_cache_policy_offset 0
+#define SDMA_PKT_WRITE_INCR_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_WRITE_INCR_HEADER_cache_policy_shift  24
+#define SDMA_PKT_WRITE_INCR_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_WRITE_INCR_HEADER_cache_policy_mask) << SDMA_PKT_WRITE_INCR_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_WRITE_INCR_HEADER_cpv_offset 0
+#define SDMA_PKT_WRITE_INCR_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_WRITE_INCR_HEADER_cpv_shift  28
+#define SDMA_PKT_WRITE_INCR_HEADER_CPV(x) (((x) & SDMA_PKT_WRITE_INCR_HEADER_cpv_mask) << SDMA_PKT_WRITE_INCR_HEADER_cpv_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_WRITE_INCR_DST_ADDR_LO_dst_addr_31_0_offset 1
+#define SDMA_PKT_WRITE_INCR_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_INCR_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_WRITE_INCR_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_WRITE_INCR_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_WRITE_INCR_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_WRITE_INCR_DST_ADDR_HI_dst_addr_63_32_offset 2
+#define SDMA_PKT_WRITE_INCR_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_INCR_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_WRITE_INCR_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_WRITE_INCR_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_WRITE_INCR_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for MASK_DW0 word*/
+/*define for mask_dw0 field*/
+#define SDMA_PKT_WRITE_INCR_MASK_DW0_mask_dw0_offset 3
+#define SDMA_PKT_WRITE_INCR_MASK_DW0_mask_dw0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_INCR_MASK_DW0_mask_dw0_shift  0
+#define SDMA_PKT_WRITE_INCR_MASK_DW0_MASK_DW0(x) (((x) & SDMA_PKT_WRITE_INCR_MASK_DW0_mask_dw0_mask) << SDMA_PKT_WRITE_INCR_MASK_DW0_mask_dw0_shift)
+
+/*define for MASK_DW1 word*/
+/*define for mask_dw1 field*/
+#define SDMA_PKT_WRITE_INCR_MASK_DW1_mask_dw1_offset 4
+#define SDMA_PKT_WRITE_INCR_MASK_DW1_mask_dw1_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_INCR_MASK_DW1_mask_dw1_shift  0
+#define SDMA_PKT_WRITE_INCR_MASK_DW1_MASK_DW1(x) (((x) & SDMA_PKT_WRITE_INCR_MASK_DW1_mask_dw1_mask) << SDMA_PKT_WRITE_INCR_MASK_DW1_mask_dw1_shift)
+
+/*define for INIT_DW0 word*/
+/*define for init_dw0 field*/
+#define SDMA_PKT_WRITE_INCR_INIT_DW0_init_dw0_offset 5
+#define SDMA_PKT_WRITE_INCR_INIT_DW0_init_dw0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_INCR_INIT_DW0_init_dw0_shift  0
+#define SDMA_PKT_WRITE_INCR_INIT_DW0_INIT_DW0(x) (((x) & SDMA_PKT_WRITE_INCR_INIT_DW0_init_dw0_mask) << SDMA_PKT_WRITE_INCR_INIT_DW0_init_dw0_shift)
+
+/*define for INIT_DW1 word*/
+/*define for init_dw1 field*/
+#define SDMA_PKT_WRITE_INCR_INIT_DW1_init_dw1_offset 6
+#define SDMA_PKT_WRITE_INCR_INIT_DW1_init_dw1_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_INCR_INIT_DW1_init_dw1_shift  0
+#define SDMA_PKT_WRITE_INCR_INIT_DW1_INIT_DW1(x) (((x) & SDMA_PKT_WRITE_INCR_INIT_DW1_init_dw1_mask) << SDMA_PKT_WRITE_INCR_INIT_DW1_init_dw1_shift)
+
+/*define for INCR_DW0 word*/
+/*define for incr_dw0 field*/
+#define SDMA_PKT_WRITE_INCR_INCR_DW0_incr_dw0_offset 7
+#define SDMA_PKT_WRITE_INCR_INCR_DW0_incr_dw0_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_INCR_INCR_DW0_incr_dw0_shift  0
+#define SDMA_PKT_WRITE_INCR_INCR_DW0_INCR_DW0(x) (((x) & SDMA_PKT_WRITE_INCR_INCR_DW0_incr_dw0_mask) << SDMA_PKT_WRITE_INCR_INCR_DW0_incr_dw0_shift)
+
+/*define for INCR_DW1 word*/
+/*define for incr_dw1 field*/
+#define SDMA_PKT_WRITE_INCR_INCR_DW1_incr_dw1_offset 8
+#define SDMA_PKT_WRITE_INCR_INCR_DW1_incr_dw1_mask   0xFFFFFFFF
+#define SDMA_PKT_WRITE_INCR_INCR_DW1_incr_dw1_shift  0
+#define SDMA_PKT_WRITE_INCR_INCR_DW1_INCR_DW1(x) (((x) & SDMA_PKT_WRITE_INCR_INCR_DW1_incr_dw1_mask) << SDMA_PKT_WRITE_INCR_INCR_DW1_incr_dw1_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_WRITE_INCR_COUNT_count_offset 9
+#define SDMA_PKT_WRITE_INCR_COUNT_count_mask   0x0007FFFF
+#define SDMA_PKT_WRITE_INCR_COUNT_count_shift  0
+#define SDMA_PKT_WRITE_INCR_COUNT_COUNT(x) (((x) & SDMA_PKT_WRITE_INCR_COUNT_count_mask) << SDMA_PKT_WRITE_INCR_COUNT_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_INDIRECT packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_INDIRECT_HEADER_op_offset 0
+#define SDMA_PKT_INDIRECT_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_INDIRECT_HEADER_op_shift  0
+#define SDMA_PKT_INDIRECT_HEADER_OP(x) (((x) & SDMA_PKT_INDIRECT_HEADER_op_mask) << SDMA_PKT_INDIRECT_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_INDIRECT_HEADER_sub_op_offset 0
+#define SDMA_PKT_INDIRECT_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_INDIRECT_HEADER_sub_op_shift  8
+#define SDMA_PKT_INDIRECT_HEADER_SUB_OP(x) (((x) & SDMA_PKT_INDIRECT_HEADER_sub_op_mask) << SDMA_PKT_INDIRECT_HEADER_sub_op_shift)
+
+/*define for vmid field*/
+#define SDMA_PKT_INDIRECT_HEADER_vmid_offset 0
+#define SDMA_PKT_INDIRECT_HEADER_vmid_mask   0x0000000F
+#define SDMA_PKT_INDIRECT_HEADER_vmid_shift  16
+#define SDMA_PKT_INDIRECT_HEADER_VMID(x) (((x) & SDMA_PKT_INDIRECT_HEADER_vmid_mask) << SDMA_PKT_INDIRECT_HEADER_vmid_shift)
+
+/*define for priv field*/
+#define SDMA_PKT_INDIRECT_HEADER_priv_offset 0
+#define SDMA_PKT_INDIRECT_HEADER_priv_mask   0x00000001
+#define SDMA_PKT_INDIRECT_HEADER_priv_shift  31
+#define SDMA_PKT_INDIRECT_HEADER_PRIV(x) (((x) & SDMA_PKT_INDIRECT_HEADER_priv_mask) << SDMA_PKT_INDIRECT_HEADER_priv_shift)
+
+/*define for BASE_LO word*/
+/*define for ib_base_31_0 field*/
+#define SDMA_PKT_INDIRECT_BASE_LO_ib_base_31_0_offset 1
+#define SDMA_PKT_INDIRECT_BASE_LO_ib_base_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_INDIRECT_BASE_LO_ib_base_31_0_shift  0
+#define SDMA_PKT_INDIRECT_BASE_LO_IB_BASE_31_0(x) (((x) & SDMA_PKT_INDIRECT_BASE_LO_ib_base_31_0_mask) << SDMA_PKT_INDIRECT_BASE_LO_ib_base_31_0_shift)
+
+/*define for BASE_HI word*/
+/*define for ib_base_63_32 field*/
+#define SDMA_PKT_INDIRECT_BASE_HI_ib_base_63_32_offset 2
+#define SDMA_PKT_INDIRECT_BASE_HI_ib_base_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_INDIRECT_BASE_HI_ib_base_63_32_shift  0
+#define SDMA_PKT_INDIRECT_BASE_HI_IB_BASE_63_32(x) (((x) & SDMA_PKT_INDIRECT_BASE_HI_ib_base_63_32_mask) << SDMA_PKT_INDIRECT_BASE_HI_ib_base_63_32_shift)
+
+/*define for IB_SIZE word*/
+/*define for ib_size field*/
+#define SDMA_PKT_INDIRECT_IB_SIZE_ib_size_offset 3
+#define SDMA_PKT_INDIRECT_IB_SIZE_ib_size_mask   0x000FFFFF
+#define SDMA_PKT_INDIRECT_IB_SIZE_ib_size_shift  0
+#define SDMA_PKT_INDIRECT_IB_SIZE_IB_SIZE(x) (((x) & SDMA_PKT_INDIRECT_IB_SIZE_ib_size_mask) << SDMA_PKT_INDIRECT_IB_SIZE_ib_size_shift)
+
+/*define for CSA_ADDR_LO word*/
+/*define for csa_addr_31_0 field*/
+#define SDMA_PKT_INDIRECT_CSA_ADDR_LO_csa_addr_31_0_offset 4
+#define SDMA_PKT_INDIRECT_CSA_ADDR_LO_csa_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_INDIRECT_CSA_ADDR_LO_csa_addr_31_0_shift  0
+#define SDMA_PKT_INDIRECT_CSA_ADDR_LO_CSA_ADDR_31_0(x) (((x) & SDMA_PKT_INDIRECT_CSA_ADDR_LO_csa_addr_31_0_mask) << SDMA_PKT_INDIRECT_CSA_ADDR_LO_csa_addr_31_0_shift)
+
+/*define for CSA_ADDR_HI word*/
+/*define for csa_addr_63_32 field*/
+#define SDMA_PKT_INDIRECT_CSA_ADDR_HI_csa_addr_63_32_offset 5
+#define SDMA_PKT_INDIRECT_CSA_ADDR_HI_csa_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_INDIRECT_CSA_ADDR_HI_csa_addr_63_32_shift  0
+#define SDMA_PKT_INDIRECT_CSA_ADDR_HI_CSA_ADDR_63_32(x) (((x) & SDMA_PKT_INDIRECT_CSA_ADDR_HI_csa_addr_63_32_mask) << SDMA_PKT_INDIRECT_CSA_ADDR_HI_csa_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_SEMAPHORE packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_SEMAPHORE_HEADER_op_offset 0
+#define SDMA_PKT_SEMAPHORE_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_SEMAPHORE_HEADER_op_shift  0
+#define SDMA_PKT_SEMAPHORE_HEADER_OP(x) (((x) & SDMA_PKT_SEMAPHORE_HEADER_op_mask) << SDMA_PKT_SEMAPHORE_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_SEMAPHORE_HEADER_sub_op_offset 0
+#define SDMA_PKT_SEMAPHORE_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_SEMAPHORE_HEADER_sub_op_shift  8
+#define SDMA_PKT_SEMAPHORE_HEADER_SUB_OP(x) (((x) & SDMA_PKT_SEMAPHORE_HEADER_sub_op_mask) << SDMA_PKT_SEMAPHORE_HEADER_sub_op_shift)
+
+/*define for write_one field*/
+#define SDMA_PKT_SEMAPHORE_HEADER_write_one_offset 0
+#define SDMA_PKT_SEMAPHORE_HEADER_write_one_mask   0x00000001
+#define SDMA_PKT_SEMAPHORE_HEADER_write_one_shift  29
+#define SDMA_PKT_SEMAPHORE_HEADER_WRITE_ONE(x) (((x) & SDMA_PKT_SEMAPHORE_HEADER_write_one_mask) << SDMA_PKT_SEMAPHORE_HEADER_write_one_shift)
+
+/*define for signal field*/
+#define SDMA_PKT_SEMAPHORE_HEADER_signal_offset 0
+#define SDMA_PKT_SEMAPHORE_HEADER_signal_mask   0x00000001
+#define SDMA_PKT_SEMAPHORE_HEADER_signal_shift  30
+#define SDMA_PKT_SEMAPHORE_HEADER_SIGNAL(x) (((x) & SDMA_PKT_SEMAPHORE_HEADER_signal_mask) << SDMA_PKT_SEMAPHORE_HEADER_signal_shift)
+
+/*define for mailbox field*/
+#define SDMA_PKT_SEMAPHORE_HEADER_mailbox_offset 0
+#define SDMA_PKT_SEMAPHORE_HEADER_mailbox_mask   0x00000001
+#define SDMA_PKT_SEMAPHORE_HEADER_mailbox_shift  31
+#define SDMA_PKT_SEMAPHORE_HEADER_MAILBOX(x) (((x) & SDMA_PKT_SEMAPHORE_HEADER_mailbox_mask) << SDMA_PKT_SEMAPHORE_HEADER_mailbox_shift)
+
+/*define for ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_SEMAPHORE_ADDR_LO_addr_31_0_offset 1
+#define SDMA_PKT_SEMAPHORE_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_SEMAPHORE_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_SEMAPHORE_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_SEMAPHORE_ADDR_LO_addr_31_0_mask) << SDMA_PKT_SEMAPHORE_ADDR_LO_addr_31_0_shift)
+
+/*define for ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_SEMAPHORE_ADDR_HI_addr_63_32_offset 2
+#define SDMA_PKT_SEMAPHORE_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_SEMAPHORE_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_SEMAPHORE_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_SEMAPHORE_ADDR_HI_addr_63_32_mask) << SDMA_PKT_SEMAPHORE_ADDR_HI_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_MEM_INCR packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_MEM_INCR_HEADER_op_offset 0
+#define SDMA_PKT_MEM_INCR_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_MEM_INCR_HEADER_op_shift  0
+#define SDMA_PKT_MEM_INCR_HEADER_OP(x) (((x) & SDMA_PKT_MEM_INCR_HEADER_op_mask) << SDMA_PKT_MEM_INCR_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_MEM_INCR_HEADER_sub_op_offset 0
+#define SDMA_PKT_MEM_INCR_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_MEM_INCR_HEADER_sub_op_shift  8
+#define SDMA_PKT_MEM_INCR_HEADER_SUB_OP(x) (((x) & SDMA_PKT_MEM_INCR_HEADER_sub_op_mask) << SDMA_PKT_MEM_INCR_HEADER_sub_op_shift)
+
+/*define for l2_policy field*/
+#define SDMA_PKT_MEM_INCR_HEADER_l2_policy_offset 0
+#define SDMA_PKT_MEM_INCR_HEADER_l2_policy_mask   0x00000003
+#define SDMA_PKT_MEM_INCR_HEADER_l2_policy_shift  24
+#define SDMA_PKT_MEM_INCR_HEADER_L2_POLICY(x) (((x) & SDMA_PKT_MEM_INCR_HEADER_l2_policy_mask) << SDMA_PKT_MEM_INCR_HEADER_l2_policy_shift)
+
+/*define for llc_policy field*/
+#define SDMA_PKT_MEM_INCR_HEADER_llc_policy_offset 0
+#define SDMA_PKT_MEM_INCR_HEADER_llc_policy_mask   0x00000001
+#define SDMA_PKT_MEM_INCR_HEADER_llc_policy_shift  26
+#define SDMA_PKT_MEM_INCR_HEADER_LLC_POLICY(x) (((x) & SDMA_PKT_MEM_INCR_HEADER_llc_policy_mask) << SDMA_PKT_MEM_INCR_HEADER_llc_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_MEM_INCR_HEADER_cpv_offset 0
+#define SDMA_PKT_MEM_INCR_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_MEM_INCR_HEADER_cpv_shift  28
+#define SDMA_PKT_MEM_INCR_HEADER_CPV(x) (((x) & SDMA_PKT_MEM_INCR_HEADER_cpv_mask) << SDMA_PKT_MEM_INCR_HEADER_cpv_shift)
+
+/*define for ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_MEM_INCR_ADDR_LO_addr_31_0_offset 1
+#define SDMA_PKT_MEM_INCR_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_MEM_INCR_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_MEM_INCR_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_MEM_INCR_ADDR_LO_addr_31_0_mask) << SDMA_PKT_MEM_INCR_ADDR_LO_addr_31_0_shift)
+
+/*define for ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_MEM_INCR_ADDR_HI_addr_63_32_offset 2
+#define SDMA_PKT_MEM_INCR_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_MEM_INCR_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_MEM_INCR_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_MEM_INCR_ADDR_HI_addr_63_32_mask) << SDMA_PKT_MEM_INCR_ADDR_HI_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_VM_INVALIDATION packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_VM_INVALIDATION_HEADER_op_offset 0
+#define SDMA_PKT_VM_INVALIDATION_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_VM_INVALIDATION_HEADER_op_shift  0
+#define SDMA_PKT_VM_INVALIDATION_HEADER_OP(x) (((x) & SDMA_PKT_VM_INVALIDATION_HEADER_op_mask) << SDMA_PKT_VM_INVALIDATION_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_VM_INVALIDATION_HEADER_sub_op_offset 0
+#define SDMA_PKT_VM_INVALIDATION_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_VM_INVALIDATION_HEADER_sub_op_shift  8
+#define SDMA_PKT_VM_INVALIDATION_HEADER_SUB_OP(x) (((x) & SDMA_PKT_VM_INVALIDATION_HEADER_sub_op_mask) << SDMA_PKT_VM_INVALIDATION_HEADER_sub_op_shift)
+
+/*define for gfx_eng_id field*/
+#define SDMA_PKT_VM_INVALIDATION_HEADER_gfx_eng_id_offset 0
+#define SDMA_PKT_VM_INVALIDATION_HEADER_gfx_eng_id_mask   0x0000001F
+#define SDMA_PKT_VM_INVALIDATION_HEADER_gfx_eng_id_shift  16
+#define SDMA_PKT_VM_INVALIDATION_HEADER_GFX_ENG_ID(x) (((x) & SDMA_PKT_VM_INVALIDATION_HEADER_gfx_eng_id_mask) << SDMA_PKT_VM_INVALIDATION_HEADER_gfx_eng_id_shift)
+
+/*define for mm_eng_id field*/
+#define SDMA_PKT_VM_INVALIDATION_HEADER_mm_eng_id_offset 0
+#define SDMA_PKT_VM_INVALIDATION_HEADER_mm_eng_id_mask   0x0000001F
+#define SDMA_PKT_VM_INVALIDATION_HEADER_mm_eng_id_shift  24
+#define SDMA_PKT_VM_INVALIDATION_HEADER_MM_ENG_ID(x) (((x) & SDMA_PKT_VM_INVALIDATION_HEADER_mm_eng_id_mask) << SDMA_PKT_VM_INVALIDATION_HEADER_mm_eng_id_shift)
+
+/*define for INVALIDATEREQ word*/
+/*define for invalidatereq field*/
+#define SDMA_PKT_VM_INVALIDATION_INVALIDATEREQ_invalidatereq_offset 1
+#define SDMA_PKT_VM_INVALIDATION_INVALIDATEREQ_invalidatereq_mask   0xFFFFFFFF
+#define SDMA_PKT_VM_INVALIDATION_INVALIDATEREQ_invalidatereq_shift  0
+#define SDMA_PKT_VM_INVALIDATION_INVALIDATEREQ_INVALIDATEREQ(x) (((x) & SDMA_PKT_VM_INVALIDATION_INVALIDATEREQ_invalidatereq_mask) << SDMA_PKT_VM_INVALIDATION_INVALIDATEREQ_invalidatereq_shift)
+
+/*define for ADDRESSRANGELO word*/
+/*define for addressrangelo field*/
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGELO_addressrangelo_offset 2
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGELO_addressrangelo_mask   0xFFFFFFFF
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGELO_addressrangelo_shift  0
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGELO_ADDRESSRANGELO(x) (((x) & SDMA_PKT_VM_INVALIDATION_ADDRESSRANGELO_addressrangelo_mask) << SDMA_PKT_VM_INVALIDATION_ADDRESSRANGELO_addressrangelo_shift)
+
+/*define for ADDRESSRANGEHI word*/
+/*define for invalidateack field*/
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_invalidateack_offset 3
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_invalidateack_mask   0x0000FFFF
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_invalidateack_shift  0
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_INVALIDATEACK(x) (((x) & SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_invalidateack_mask) << SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_invalidateack_shift)
+
+/*define for addressrangehi field*/
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_addressrangehi_offset 3
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_addressrangehi_mask   0x0000001F
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_addressrangehi_shift  16
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_ADDRESSRANGEHI(x) (((x) & SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_addressrangehi_mask) << SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_addressrangehi_shift)
+
+/*define for reserved field*/
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_reserved_offset 3
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_reserved_mask   0x000001FF
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_reserved_shift  23
+#define SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_RESERVED(x) (((x) & SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_reserved_mask) << SDMA_PKT_VM_INVALIDATION_ADDRESSRANGEHI_reserved_shift)
+
+
+/*
+** Definitions for SDMA_PKT_FENCE packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_FENCE_HEADER_op_offset 0
+#define SDMA_PKT_FENCE_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_FENCE_HEADER_op_shift  0
+#define SDMA_PKT_FENCE_HEADER_OP(x) (((x) & SDMA_PKT_FENCE_HEADER_op_mask) << SDMA_PKT_FENCE_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_FENCE_HEADER_sub_op_offset 0
+#define SDMA_PKT_FENCE_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_FENCE_HEADER_sub_op_shift  8
+#define SDMA_PKT_FENCE_HEADER_SUB_OP(x) (((x) & SDMA_PKT_FENCE_HEADER_sub_op_mask) << SDMA_PKT_FENCE_HEADER_sub_op_shift)
+
+/*define for mtype field*/
+#define SDMA_PKT_FENCE_HEADER_mtype_offset 0
+#define SDMA_PKT_FENCE_HEADER_mtype_mask   0x00000007
+#define SDMA_PKT_FENCE_HEADER_mtype_shift  16
+#define SDMA_PKT_FENCE_HEADER_MTYPE(x) (((x) & SDMA_PKT_FENCE_HEADER_mtype_mask) << SDMA_PKT_FENCE_HEADER_mtype_shift)
+
+/*define for gcc field*/
+#define SDMA_PKT_FENCE_HEADER_gcc_offset 0
+#define SDMA_PKT_FENCE_HEADER_gcc_mask   0x00000001
+#define SDMA_PKT_FENCE_HEADER_gcc_shift  19
+#define SDMA_PKT_FENCE_HEADER_GCC(x) (((x) & SDMA_PKT_FENCE_HEADER_gcc_mask) << SDMA_PKT_FENCE_HEADER_gcc_shift)
+
+/*define for sys field*/
+#define SDMA_PKT_FENCE_HEADER_sys_offset 0
+#define SDMA_PKT_FENCE_HEADER_sys_mask   0x00000001
+#define SDMA_PKT_FENCE_HEADER_sys_shift  20
+#define SDMA_PKT_FENCE_HEADER_SYS(x) (((x) & SDMA_PKT_FENCE_HEADER_sys_mask) << SDMA_PKT_FENCE_HEADER_sys_shift)
+
+/*define for snp field*/
+#define SDMA_PKT_FENCE_HEADER_snp_offset 0
+#define SDMA_PKT_FENCE_HEADER_snp_mask   0x00000001
+#define SDMA_PKT_FENCE_HEADER_snp_shift  22
+#define SDMA_PKT_FENCE_HEADER_SNP(x) (((x) & SDMA_PKT_FENCE_HEADER_snp_mask) << SDMA_PKT_FENCE_HEADER_snp_shift)
+
+/*define for gpa field*/
+#define SDMA_PKT_FENCE_HEADER_gpa_offset 0
+#define SDMA_PKT_FENCE_HEADER_gpa_mask   0x00000001
+#define SDMA_PKT_FENCE_HEADER_gpa_shift  23
+#define SDMA_PKT_FENCE_HEADER_GPA(x) (((x) & SDMA_PKT_FENCE_HEADER_gpa_mask) << SDMA_PKT_FENCE_HEADER_gpa_shift)
+
+/*define for l2_policy field*/
+#define SDMA_PKT_FENCE_HEADER_l2_policy_offset 0
+#define SDMA_PKT_FENCE_HEADER_l2_policy_mask   0x00000003
+#define SDMA_PKT_FENCE_HEADER_l2_policy_shift  24
+#define SDMA_PKT_FENCE_HEADER_L2_POLICY(x) (((x) & SDMA_PKT_FENCE_HEADER_l2_policy_mask) << SDMA_PKT_FENCE_HEADER_l2_policy_shift)
+
+/*define for llc_policy field*/
+#define SDMA_PKT_FENCE_HEADER_llc_policy_offset 0
+#define SDMA_PKT_FENCE_HEADER_llc_policy_mask   0x00000001
+#define SDMA_PKT_FENCE_HEADER_llc_policy_shift  26
+#define SDMA_PKT_FENCE_HEADER_LLC_POLICY(x) (((x) & SDMA_PKT_FENCE_HEADER_llc_policy_mask) << SDMA_PKT_FENCE_HEADER_llc_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_FENCE_HEADER_cpv_offset 0
+#define SDMA_PKT_FENCE_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_FENCE_HEADER_cpv_shift  28
+#define SDMA_PKT_FENCE_HEADER_CPV(x) (((x) & SDMA_PKT_FENCE_HEADER_cpv_mask) << SDMA_PKT_FENCE_HEADER_cpv_shift)
+
+/*define for ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_FENCE_ADDR_LO_addr_31_0_offset 1
+#define SDMA_PKT_FENCE_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_FENCE_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_FENCE_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_FENCE_ADDR_LO_addr_31_0_mask) << SDMA_PKT_FENCE_ADDR_LO_addr_31_0_shift)
+
+/*define for ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_FENCE_ADDR_HI_addr_63_32_offset 2
+#define SDMA_PKT_FENCE_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_FENCE_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_FENCE_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_FENCE_ADDR_HI_addr_63_32_mask) << SDMA_PKT_FENCE_ADDR_HI_addr_63_32_shift)
+
+/*define for DATA word*/
+/*define for data field*/
+#define SDMA_PKT_FENCE_DATA_data_offset 3
+#define SDMA_PKT_FENCE_DATA_data_mask   0xFFFFFFFF
+#define SDMA_PKT_FENCE_DATA_data_shift  0
+#define SDMA_PKT_FENCE_DATA_DATA(x) (((x) & SDMA_PKT_FENCE_DATA_data_mask) << SDMA_PKT_FENCE_DATA_data_shift)
+
+
+/*
+** Definitions for SDMA_PKT_SRBM_WRITE packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_SRBM_WRITE_HEADER_op_offset 0
+#define SDMA_PKT_SRBM_WRITE_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_SRBM_WRITE_HEADER_op_shift  0
+#define SDMA_PKT_SRBM_WRITE_HEADER_OP(x) (((x) & SDMA_PKT_SRBM_WRITE_HEADER_op_mask) << SDMA_PKT_SRBM_WRITE_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_SRBM_WRITE_HEADER_sub_op_offset 0
+#define SDMA_PKT_SRBM_WRITE_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_SRBM_WRITE_HEADER_sub_op_shift  8
+#define SDMA_PKT_SRBM_WRITE_HEADER_SUB_OP(x) (((x) & SDMA_PKT_SRBM_WRITE_HEADER_sub_op_mask) << SDMA_PKT_SRBM_WRITE_HEADER_sub_op_shift)
+
+/*define for byte_en field*/
+#define SDMA_PKT_SRBM_WRITE_HEADER_byte_en_offset 0
+#define SDMA_PKT_SRBM_WRITE_HEADER_byte_en_mask   0x0000000F
+#define SDMA_PKT_SRBM_WRITE_HEADER_byte_en_shift  28
+#define SDMA_PKT_SRBM_WRITE_HEADER_BYTE_EN(x) (((x) & SDMA_PKT_SRBM_WRITE_HEADER_byte_en_mask) << SDMA_PKT_SRBM_WRITE_HEADER_byte_en_shift)
+
+/*define for ADDR word*/
+/*define for addr field*/
+#define SDMA_PKT_SRBM_WRITE_ADDR_addr_offset 1
+#define SDMA_PKT_SRBM_WRITE_ADDR_addr_mask   0x0003FFFF
+#define SDMA_PKT_SRBM_WRITE_ADDR_addr_shift  0
+#define SDMA_PKT_SRBM_WRITE_ADDR_ADDR(x) (((x) & SDMA_PKT_SRBM_WRITE_ADDR_addr_mask) << SDMA_PKT_SRBM_WRITE_ADDR_addr_shift)
+
+/*define for apertureid field*/
+#define SDMA_PKT_SRBM_WRITE_ADDR_apertureid_offset 1
+#define SDMA_PKT_SRBM_WRITE_ADDR_apertureid_mask   0x00000FFF
+#define SDMA_PKT_SRBM_WRITE_ADDR_apertureid_shift  20
+#define SDMA_PKT_SRBM_WRITE_ADDR_APERTUREID(x) (((x) & SDMA_PKT_SRBM_WRITE_ADDR_apertureid_mask) << SDMA_PKT_SRBM_WRITE_ADDR_apertureid_shift)
+
+/*define for DATA word*/
+/*define for data field*/
+#define SDMA_PKT_SRBM_WRITE_DATA_data_offset 2
+#define SDMA_PKT_SRBM_WRITE_DATA_data_mask   0xFFFFFFFF
+#define SDMA_PKT_SRBM_WRITE_DATA_data_shift  0
+#define SDMA_PKT_SRBM_WRITE_DATA_DATA(x) (((x) & SDMA_PKT_SRBM_WRITE_DATA_data_mask) << SDMA_PKT_SRBM_WRITE_DATA_data_shift)
+
+
+/*
+** Definitions for SDMA_PKT_PRE_EXE packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_PRE_EXE_HEADER_op_offset 0
+#define SDMA_PKT_PRE_EXE_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_PRE_EXE_HEADER_op_shift  0
+#define SDMA_PKT_PRE_EXE_HEADER_OP(x) (((x) & SDMA_PKT_PRE_EXE_HEADER_op_mask) << SDMA_PKT_PRE_EXE_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_PRE_EXE_HEADER_sub_op_offset 0
+#define SDMA_PKT_PRE_EXE_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_PRE_EXE_HEADER_sub_op_shift  8
+#define SDMA_PKT_PRE_EXE_HEADER_SUB_OP(x) (((x) & SDMA_PKT_PRE_EXE_HEADER_sub_op_mask) << SDMA_PKT_PRE_EXE_HEADER_sub_op_shift)
+
+/*define for dev_sel field*/
+#define SDMA_PKT_PRE_EXE_HEADER_dev_sel_offset 0
+#define SDMA_PKT_PRE_EXE_HEADER_dev_sel_mask   0x000000FF
+#define SDMA_PKT_PRE_EXE_HEADER_dev_sel_shift  16
+#define SDMA_PKT_PRE_EXE_HEADER_DEV_SEL(x) (((x) & SDMA_PKT_PRE_EXE_HEADER_dev_sel_mask) << SDMA_PKT_PRE_EXE_HEADER_dev_sel_shift)
+
+/*define for EXEC_COUNT word*/
+/*define for exec_count field*/
+#define SDMA_PKT_PRE_EXE_EXEC_COUNT_exec_count_offset 1
+#define SDMA_PKT_PRE_EXE_EXEC_COUNT_exec_count_mask   0x00003FFF
+#define SDMA_PKT_PRE_EXE_EXEC_COUNT_exec_count_shift  0
+#define SDMA_PKT_PRE_EXE_EXEC_COUNT_EXEC_COUNT(x) (((x) & SDMA_PKT_PRE_EXE_EXEC_COUNT_exec_count_mask) << SDMA_PKT_PRE_EXE_EXEC_COUNT_exec_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_COND_EXE packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_COND_EXE_HEADER_op_offset 0
+#define SDMA_PKT_COND_EXE_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_COND_EXE_HEADER_op_shift  0
+#define SDMA_PKT_COND_EXE_HEADER_OP(x) (((x) & SDMA_PKT_COND_EXE_HEADER_op_mask) << SDMA_PKT_COND_EXE_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_COND_EXE_HEADER_sub_op_offset 0
+#define SDMA_PKT_COND_EXE_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_COND_EXE_HEADER_sub_op_shift  8
+#define SDMA_PKT_COND_EXE_HEADER_SUB_OP(x) (((x) & SDMA_PKT_COND_EXE_HEADER_sub_op_mask) << SDMA_PKT_COND_EXE_HEADER_sub_op_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_COND_EXE_HEADER_cache_policy_offset 0
+#define SDMA_PKT_COND_EXE_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_COND_EXE_HEADER_cache_policy_shift  24
+#define SDMA_PKT_COND_EXE_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_COND_EXE_HEADER_cache_policy_mask) << SDMA_PKT_COND_EXE_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_COND_EXE_HEADER_cpv_offset 0
+#define SDMA_PKT_COND_EXE_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_COND_EXE_HEADER_cpv_shift  28
+#define SDMA_PKT_COND_EXE_HEADER_CPV(x) (((x) & SDMA_PKT_COND_EXE_HEADER_cpv_mask) << SDMA_PKT_COND_EXE_HEADER_cpv_shift)
+
+/*define for ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_COND_EXE_ADDR_LO_addr_31_0_offset 1
+#define SDMA_PKT_COND_EXE_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_COND_EXE_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_COND_EXE_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_COND_EXE_ADDR_LO_addr_31_0_mask) << SDMA_PKT_COND_EXE_ADDR_LO_addr_31_0_shift)
+
+/*define for ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_COND_EXE_ADDR_HI_addr_63_32_offset 2
+#define SDMA_PKT_COND_EXE_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_COND_EXE_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_COND_EXE_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_COND_EXE_ADDR_HI_addr_63_32_mask) << SDMA_PKT_COND_EXE_ADDR_HI_addr_63_32_shift)
+
+/*define for REFERENCE word*/
+/*define for reference field*/
+#define SDMA_PKT_COND_EXE_REFERENCE_reference_offset 3
+#define SDMA_PKT_COND_EXE_REFERENCE_reference_mask   0xFFFFFFFF
+#define SDMA_PKT_COND_EXE_REFERENCE_reference_shift  0
+#define SDMA_PKT_COND_EXE_REFERENCE_REFERENCE(x) (((x) & SDMA_PKT_COND_EXE_REFERENCE_reference_mask) << SDMA_PKT_COND_EXE_REFERENCE_reference_shift)
+
+/*define for EXEC_COUNT word*/
+/*define for exec_count field*/
+#define SDMA_PKT_COND_EXE_EXEC_COUNT_exec_count_offset 4
+#define SDMA_PKT_COND_EXE_EXEC_COUNT_exec_count_mask   0x00003FFF
+#define SDMA_PKT_COND_EXE_EXEC_COUNT_exec_count_shift  0
+#define SDMA_PKT_COND_EXE_EXEC_COUNT_EXEC_COUNT(x) (((x) & SDMA_PKT_COND_EXE_EXEC_COUNT_exec_count_mask) << SDMA_PKT_COND_EXE_EXEC_COUNT_exec_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_CONSTANT_FILL packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_CONSTANT_FILL_HEADER_op_offset 0
+#define SDMA_PKT_CONSTANT_FILL_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_CONSTANT_FILL_HEADER_op_shift  0
+#define SDMA_PKT_CONSTANT_FILL_HEADER_OP(x) (((x) & SDMA_PKT_CONSTANT_FILL_HEADER_op_mask) << SDMA_PKT_CONSTANT_FILL_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_CONSTANT_FILL_HEADER_sub_op_offset 0
+#define SDMA_PKT_CONSTANT_FILL_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_CONSTANT_FILL_HEADER_sub_op_shift  8
+#define SDMA_PKT_CONSTANT_FILL_HEADER_SUB_OP(x) (((x) & SDMA_PKT_CONSTANT_FILL_HEADER_sub_op_mask) << SDMA_PKT_CONSTANT_FILL_HEADER_sub_op_shift)
+
+/*define for sw field*/
+#define SDMA_PKT_CONSTANT_FILL_HEADER_sw_offset 0
+#define SDMA_PKT_CONSTANT_FILL_HEADER_sw_mask   0x00000003
+#define SDMA_PKT_CONSTANT_FILL_HEADER_sw_shift  16
+#define SDMA_PKT_CONSTANT_FILL_HEADER_SW(x) (((x) & SDMA_PKT_CONSTANT_FILL_HEADER_sw_mask) << SDMA_PKT_CONSTANT_FILL_HEADER_sw_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_CONSTANT_FILL_HEADER_cache_policy_offset 0
+#define SDMA_PKT_CONSTANT_FILL_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_CONSTANT_FILL_HEADER_cache_policy_shift  24
+#define SDMA_PKT_CONSTANT_FILL_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_CONSTANT_FILL_HEADER_cache_policy_mask) << SDMA_PKT_CONSTANT_FILL_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_CONSTANT_FILL_HEADER_cpv_offset 0
+#define SDMA_PKT_CONSTANT_FILL_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_CONSTANT_FILL_HEADER_cpv_shift  28
+#define SDMA_PKT_CONSTANT_FILL_HEADER_CPV(x) (((x) & SDMA_PKT_CONSTANT_FILL_HEADER_cpv_mask) << SDMA_PKT_CONSTANT_FILL_HEADER_cpv_shift)
+
+/*define for fillsize field*/
+#define SDMA_PKT_CONSTANT_FILL_HEADER_fillsize_offset 0
+#define SDMA_PKT_CONSTANT_FILL_HEADER_fillsize_mask   0x00000003
+#define SDMA_PKT_CONSTANT_FILL_HEADER_fillsize_shift  30
+#define SDMA_PKT_CONSTANT_FILL_HEADER_FILLSIZE(x) (((x) & SDMA_PKT_CONSTANT_FILL_HEADER_fillsize_mask) << SDMA_PKT_CONSTANT_FILL_HEADER_fillsize_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_CONSTANT_FILL_DST_ADDR_LO_dst_addr_31_0_offset 1
+#define SDMA_PKT_CONSTANT_FILL_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_CONSTANT_FILL_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_CONSTANT_FILL_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_CONSTANT_FILL_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_CONSTANT_FILL_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_CONSTANT_FILL_DST_ADDR_HI_dst_addr_63_32_offset 2
+#define SDMA_PKT_CONSTANT_FILL_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_CONSTANT_FILL_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_CONSTANT_FILL_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_CONSTANT_FILL_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_CONSTANT_FILL_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for DATA word*/
+/*define for src_data_31_0 field*/
+#define SDMA_PKT_CONSTANT_FILL_DATA_src_data_31_0_offset 3
+#define SDMA_PKT_CONSTANT_FILL_DATA_src_data_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_CONSTANT_FILL_DATA_src_data_31_0_shift  0
+#define SDMA_PKT_CONSTANT_FILL_DATA_SRC_DATA_31_0(x) (((x) & SDMA_PKT_CONSTANT_FILL_DATA_src_data_31_0_mask) << SDMA_PKT_CONSTANT_FILL_DATA_src_data_31_0_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_CONSTANT_FILL_COUNT_count_offset 4
+#define SDMA_PKT_CONSTANT_FILL_COUNT_count_mask   0x3FFFFFFF
+#define SDMA_PKT_CONSTANT_FILL_COUNT_count_shift  0
+#define SDMA_PKT_CONSTANT_FILL_COUNT_COUNT(x) (((x) & SDMA_PKT_CONSTANT_FILL_COUNT_count_mask) << SDMA_PKT_CONSTANT_FILL_COUNT_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_DATA_FILL_MULTI packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_op_offset 0
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_op_shift  0
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_OP(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_HEADER_op_mask) << SDMA_PKT_DATA_FILL_MULTI_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_sub_op_offset 0
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_sub_op_shift  8
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_SUB_OP(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_HEADER_sub_op_mask) << SDMA_PKT_DATA_FILL_MULTI_HEADER_sub_op_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_cache_policy_offset 0
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_cache_policy_shift  24
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_HEADER_cache_policy_mask) << SDMA_PKT_DATA_FILL_MULTI_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_cpv_offset 0
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_cpv_shift  28
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_CPV(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_HEADER_cpv_mask) << SDMA_PKT_DATA_FILL_MULTI_HEADER_cpv_shift)
+
+/*define for memlog_clr field*/
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_memlog_clr_offset 0
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_memlog_clr_mask   0x00000001
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_memlog_clr_shift  31
+#define SDMA_PKT_DATA_FILL_MULTI_HEADER_MEMLOG_CLR(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_HEADER_memlog_clr_mask) << SDMA_PKT_DATA_FILL_MULTI_HEADER_memlog_clr_shift)
+
+/*define for BYTE_STRIDE word*/
+/*define for byte_stride field*/
+#define SDMA_PKT_DATA_FILL_MULTI_BYTE_STRIDE_byte_stride_offset 1
+#define SDMA_PKT_DATA_FILL_MULTI_BYTE_STRIDE_byte_stride_mask   0xFFFFFFFF
+#define SDMA_PKT_DATA_FILL_MULTI_BYTE_STRIDE_byte_stride_shift  0
+#define SDMA_PKT_DATA_FILL_MULTI_BYTE_STRIDE_BYTE_STRIDE(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_BYTE_STRIDE_byte_stride_mask) << SDMA_PKT_DATA_FILL_MULTI_BYTE_STRIDE_byte_stride_shift)
+
+/*define for DMA_COUNT word*/
+/*define for dma_count field*/
+#define SDMA_PKT_DATA_FILL_MULTI_DMA_COUNT_dma_count_offset 2
+#define SDMA_PKT_DATA_FILL_MULTI_DMA_COUNT_dma_count_mask   0xFFFFFFFF
+#define SDMA_PKT_DATA_FILL_MULTI_DMA_COUNT_dma_count_shift  0
+#define SDMA_PKT_DATA_FILL_MULTI_DMA_COUNT_DMA_COUNT(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_DMA_COUNT_dma_count_mask) << SDMA_PKT_DATA_FILL_MULTI_DMA_COUNT_dma_count_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_LO_dst_addr_31_0_offset 3
+#define SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_HI_dst_addr_63_32_offset 4
+#define SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_PKT_DATA_FILL_MULTI_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for BYTE_COUNT word*/
+/*define for count field*/
+#define SDMA_PKT_DATA_FILL_MULTI_BYTE_COUNT_count_offset 5
+#define SDMA_PKT_DATA_FILL_MULTI_BYTE_COUNT_count_mask   0x03FFFFFF
+#define SDMA_PKT_DATA_FILL_MULTI_BYTE_COUNT_count_shift  0
+#define SDMA_PKT_DATA_FILL_MULTI_BYTE_COUNT_COUNT(x) (((x) & SDMA_PKT_DATA_FILL_MULTI_BYTE_COUNT_count_mask) << SDMA_PKT_DATA_FILL_MULTI_BYTE_COUNT_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_POLL_REGMEM packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_POLL_REGMEM_HEADER_op_offset 0
+#define SDMA_PKT_POLL_REGMEM_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_POLL_REGMEM_HEADER_op_shift  0
+#define SDMA_PKT_POLL_REGMEM_HEADER_OP(x) (((x) & SDMA_PKT_POLL_REGMEM_HEADER_op_mask) << SDMA_PKT_POLL_REGMEM_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_POLL_REGMEM_HEADER_sub_op_offset 0
+#define SDMA_PKT_POLL_REGMEM_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_POLL_REGMEM_HEADER_sub_op_shift  8
+#define SDMA_PKT_POLL_REGMEM_HEADER_SUB_OP(x) (((x) & SDMA_PKT_POLL_REGMEM_HEADER_sub_op_mask) << SDMA_PKT_POLL_REGMEM_HEADER_sub_op_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_POLL_REGMEM_HEADER_cache_policy_offset 0
+#define SDMA_PKT_POLL_REGMEM_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_POLL_REGMEM_HEADER_cache_policy_shift  20
+#define SDMA_PKT_POLL_REGMEM_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_POLL_REGMEM_HEADER_cache_policy_mask) << SDMA_PKT_POLL_REGMEM_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_POLL_REGMEM_HEADER_cpv_offset 0
+#define SDMA_PKT_POLL_REGMEM_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_POLL_REGMEM_HEADER_cpv_shift  24
+#define SDMA_PKT_POLL_REGMEM_HEADER_CPV(x) (((x) & SDMA_PKT_POLL_REGMEM_HEADER_cpv_mask) << SDMA_PKT_POLL_REGMEM_HEADER_cpv_shift)
+
+/*define for hdp_flush field*/
+#define SDMA_PKT_POLL_REGMEM_HEADER_hdp_flush_offset 0
+#define SDMA_PKT_POLL_REGMEM_HEADER_hdp_flush_mask   0x00000001
+#define SDMA_PKT_POLL_REGMEM_HEADER_hdp_flush_shift  26
+#define SDMA_PKT_POLL_REGMEM_HEADER_HDP_FLUSH(x) (((x) & SDMA_PKT_POLL_REGMEM_HEADER_hdp_flush_mask) << SDMA_PKT_POLL_REGMEM_HEADER_hdp_flush_shift)
+
+/*define for func field*/
+#define SDMA_PKT_POLL_REGMEM_HEADER_func_offset 0
+#define SDMA_PKT_POLL_REGMEM_HEADER_func_mask   0x00000007
+#define SDMA_PKT_POLL_REGMEM_HEADER_func_shift  28
+#define SDMA_PKT_POLL_REGMEM_HEADER_FUNC(x) (((x) & SDMA_PKT_POLL_REGMEM_HEADER_func_mask) << SDMA_PKT_POLL_REGMEM_HEADER_func_shift)
+
+/*define for mem_poll field*/
+#define SDMA_PKT_POLL_REGMEM_HEADER_mem_poll_offset 0
+#define SDMA_PKT_POLL_REGMEM_HEADER_mem_poll_mask   0x00000001
+#define SDMA_PKT_POLL_REGMEM_HEADER_mem_poll_shift  31
+#define SDMA_PKT_POLL_REGMEM_HEADER_MEM_POLL(x) (((x) & SDMA_PKT_POLL_REGMEM_HEADER_mem_poll_mask) << SDMA_PKT_POLL_REGMEM_HEADER_mem_poll_shift)
+
+/*define for ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_POLL_REGMEM_ADDR_LO_addr_31_0_offset 1
+#define SDMA_PKT_POLL_REGMEM_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_REGMEM_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_POLL_REGMEM_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_POLL_REGMEM_ADDR_LO_addr_31_0_mask) << SDMA_PKT_POLL_REGMEM_ADDR_LO_addr_31_0_shift)
+
+/*define for ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_POLL_REGMEM_ADDR_HI_addr_63_32_offset 2
+#define SDMA_PKT_POLL_REGMEM_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_REGMEM_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_POLL_REGMEM_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_POLL_REGMEM_ADDR_HI_addr_63_32_mask) << SDMA_PKT_POLL_REGMEM_ADDR_HI_addr_63_32_shift)
+
+/*define for VALUE word*/
+/*define for value field*/
+#define SDMA_PKT_POLL_REGMEM_VALUE_value_offset 3
+#define SDMA_PKT_POLL_REGMEM_VALUE_value_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_REGMEM_VALUE_value_shift  0
+#define SDMA_PKT_POLL_REGMEM_VALUE_VALUE(x) (((x) & SDMA_PKT_POLL_REGMEM_VALUE_value_mask) << SDMA_PKT_POLL_REGMEM_VALUE_value_shift)
+
+/*define for MASK word*/
+/*define for mask field*/
+#define SDMA_PKT_POLL_REGMEM_MASK_mask_offset 4
+#define SDMA_PKT_POLL_REGMEM_MASK_mask_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_REGMEM_MASK_mask_shift  0
+#define SDMA_PKT_POLL_REGMEM_MASK_MASK(x) (((x) & SDMA_PKT_POLL_REGMEM_MASK_mask_mask) << SDMA_PKT_POLL_REGMEM_MASK_mask_shift)
+
+/*define for DW5 word*/
+/*define for interval field*/
+#define SDMA_PKT_POLL_REGMEM_DW5_interval_offset 5
+#define SDMA_PKT_POLL_REGMEM_DW5_interval_mask   0x0000FFFF
+#define SDMA_PKT_POLL_REGMEM_DW5_interval_shift  0
+#define SDMA_PKT_POLL_REGMEM_DW5_INTERVAL(x) (((x) & SDMA_PKT_POLL_REGMEM_DW5_interval_mask) << SDMA_PKT_POLL_REGMEM_DW5_interval_shift)
+
+/*define for retry_count field*/
+#define SDMA_PKT_POLL_REGMEM_DW5_retry_count_offset 5
+#define SDMA_PKT_POLL_REGMEM_DW5_retry_count_mask   0x00000FFF
+#define SDMA_PKT_POLL_REGMEM_DW5_retry_count_shift  16
+#define SDMA_PKT_POLL_REGMEM_DW5_RETRY_COUNT(x) (((x) & SDMA_PKT_POLL_REGMEM_DW5_retry_count_mask) << SDMA_PKT_POLL_REGMEM_DW5_retry_count_shift)
+
+
+/*
+** Definitions for SDMA_PKT_POLL_REG_WRITE_MEM packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_op_offset 0
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_op_shift  0
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_OP(x) (((x) & SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_op_mask) << SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_sub_op_offset 0
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_sub_op_shift  8
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_SUB_OP(x) (((x) & SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_sub_op_mask) << SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_sub_op_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cache_policy_offset 0
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cache_policy_shift  24
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cache_policy_mask) << SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cpv_offset 0
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cpv_shift  28
+#define SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_CPV(x) (((x) & SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cpv_mask) << SDMA_PKT_POLL_REG_WRITE_MEM_HEADER_cpv_shift)
+
+/*define for SRC_ADDR word*/
+/*define for addr_31_2 field*/
+#define SDMA_PKT_POLL_REG_WRITE_MEM_SRC_ADDR_addr_31_2_offset 1
+#define SDMA_PKT_POLL_REG_WRITE_MEM_SRC_ADDR_addr_31_2_mask   0x3FFFFFFF
+#define SDMA_PKT_POLL_REG_WRITE_MEM_SRC_ADDR_addr_31_2_shift  2
+#define SDMA_PKT_POLL_REG_WRITE_MEM_SRC_ADDR_ADDR_31_2(x) (((x) & SDMA_PKT_POLL_REG_WRITE_MEM_SRC_ADDR_addr_31_2_mask) << SDMA_PKT_POLL_REG_WRITE_MEM_SRC_ADDR_addr_31_2_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_LO_addr_31_0_offset 2
+#define SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_LO_addr_31_0_mask) << SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_LO_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_HI_addr_63_32_offset 3
+#define SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_HI_addr_63_32_mask) << SDMA_PKT_POLL_REG_WRITE_MEM_DST_ADDR_HI_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_POLL_DBIT_WRITE_MEM packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_op_offset 0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_op_shift  0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_OP(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_op_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_sub_op_offset 0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_sub_op_shift  8
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_SUB_OP(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_sub_op_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_sub_op_shift)
+
+/*define for ea field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_ea_offset 0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_ea_mask   0x00000003
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_ea_shift  16
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_EA(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_ea_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_ea_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cache_policy_offset 0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cache_policy_shift  24
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cache_policy_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cpv_offset 0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cpv_shift  28
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_CPV(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cpv_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_HEADER_cpv_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_LO_addr_31_0_offset 1
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_LO_addr_31_0_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_LO_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_HI_addr_63_32_offset 2
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_HI_addr_63_32_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_DST_ADDR_HI_addr_63_32_shift)
+
+/*define for START_PAGE word*/
+/*define for addr_31_4 field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_START_PAGE_addr_31_4_offset 3
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_START_PAGE_addr_31_4_mask   0x0FFFFFFF
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_START_PAGE_addr_31_4_shift  4
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_START_PAGE_ADDR_31_4(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_START_PAGE_addr_31_4_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_START_PAGE_addr_31_4_shift)
+
+/*define for PAGE_NUM word*/
+/*define for page_num_31_0 field*/
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_PAGE_NUM_page_num_31_0_offset 4
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_PAGE_NUM_page_num_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_PAGE_NUM_page_num_31_0_shift  0
+#define SDMA_PKT_POLL_DBIT_WRITE_MEM_PAGE_NUM_PAGE_NUM_31_0(x) (((x) & SDMA_PKT_POLL_DBIT_WRITE_MEM_PAGE_NUM_page_num_31_0_mask) << SDMA_PKT_POLL_DBIT_WRITE_MEM_PAGE_NUM_page_num_31_0_shift)
+
+
+/*
+** Definitions for SDMA_PKT_POLL_MEM_VERIFY packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_op_offset 0
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_op_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_OP(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_HEADER_op_mask) << SDMA_PKT_POLL_MEM_VERIFY_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_sub_op_offset 0
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_sub_op_shift  8
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_SUB_OP(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_HEADER_sub_op_mask) << SDMA_PKT_POLL_MEM_VERIFY_HEADER_sub_op_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_cache_policy_offset 0
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_cache_policy_shift  24
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_HEADER_cache_policy_mask) << SDMA_PKT_POLL_MEM_VERIFY_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_cpv_offset 0
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_cpv_shift  28
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_CPV(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_HEADER_cpv_mask) << SDMA_PKT_POLL_MEM_VERIFY_HEADER_cpv_shift)
+
+/*define for mode field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_mode_offset 0
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_mode_mask   0x00000001
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_mode_shift  31
+#define SDMA_PKT_POLL_MEM_VERIFY_HEADER_MODE(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_HEADER_mode_mask) << SDMA_PKT_POLL_MEM_VERIFY_HEADER_mode_shift)
+
+/*define for PATTERN word*/
+/*define for pattern field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_PATTERN_pattern_offset 1
+#define SDMA_PKT_POLL_MEM_VERIFY_PATTERN_pattern_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_PATTERN_pattern_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_PATTERN_PATTERN(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_PATTERN_pattern_mask) << SDMA_PKT_POLL_MEM_VERIFY_PATTERN_pattern_shift)
+
+/*define for CMP0_ADDR_START_LO word*/
+/*define for cmp0_start_31_0 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_LO_cmp0_start_31_0_offset 2
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_LO_cmp0_start_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_LO_cmp0_start_31_0_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_LO_CMP0_START_31_0(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_LO_cmp0_start_31_0_mask) << SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_LO_cmp0_start_31_0_shift)
+
+/*define for CMP0_ADDR_START_HI word*/
+/*define for cmp0_start_63_32 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_HI_cmp0_start_63_32_offset 3
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_HI_cmp0_start_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_HI_cmp0_start_63_32_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_HI_CMP0_START_63_32(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_HI_cmp0_start_63_32_mask) << SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_START_HI_cmp0_start_63_32_shift)
+
+/*define for CMP0_ADDR_END_LO word*/
+/*define for cmp0_end_31_0 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_LO_cmp0_end_31_0_offset 4
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_LO_cmp0_end_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_LO_cmp0_end_31_0_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_LO_CMP0_END_31_0(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_LO_cmp0_end_31_0_mask) << SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_LO_cmp0_end_31_0_shift)
+
+/*define for CMP0_ADDR_END_HI word*/
+/*define for cmp0_end_63_32 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_HI_cmp0_end_63_32_offset 5
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_HI_cmp0_end_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_HI_cmp0_end_63_32_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_HI_CMP0_END_63_32(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_HI_cmp0_end_63_32_mask) << SDMA_PKT_POLL_MEM_VERIFY_CMP0_ADDR_END_HI_cmp0_end_63_32_shift)
+
+/*define for CMP1_ADDR_START_LO word*/
+/*define for cmp1_start_31_0 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_LO_cmp1_start_31_0_offset 6
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_LO_cmp1_start_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_LO_cmp1_start_31_0_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_LO_CMP1_START_31_0(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_LO_cmp1_start_31_0_mask) << SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_LO_cmp1_start_31_0_shift)
+
+/*define for CMP1_ADDR_START_HI word*/
+/*define for cmp1_start_63_32 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_HI_cmp1_start_63_32_offset 7
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_HI_cmp1_start_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_HI_cmp1_start_63_32_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_HI_CMP1_START_63_32(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_HI_cmp1_start_63_32_mask) << SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_START_HI_cmp1_start_63_32_shift)
+
+/*define for CMP1_ADDR_END_LO word*/
+/*define for cmp1_end_31_0 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_LO_cmp1_end_31_0_offset 8
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_LO_cmp1_end_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_LO_cmp1_end_31_0_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_LO_CMP1_END_31_0(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_LO_cmp1_end_31_0_mask) << SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_LO_cmp1_end_31_0_shift)
+
+/*define for CMP1_ADDR_END_HI word*/
+/*define for cmp1_end_63_32 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_HI_cmp1_end_63_32_offset 9
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_HI_cmp1_end_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_HI_cmp1_end_63_32_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_HI_CMP1_END_63_32(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_HI_cmp1_end_63_32_mask) << SDMA_PKT_POLL_MEM_VERIFY_CMP1_ADDR_END_HI_cmp1_end_63_32_shift)
+
+/*define for REC_ADDR_LO word*/
+/*define for rec_31_0 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_LO_rec_31_0_offset 10
+#define SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_LO_rec_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_LO_rec_31_0_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_LO_REC_31_0(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_LO_rec_31_0_mask) << SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_LO_rec_31_0_shift)
+
+/*define for REC_ADDR_HI word*/
+/*define for rec_63_32 field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_HI_rec_63_32_offset 11
+#define SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_HI_rec_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_HI_rec_63_32_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_HI_REC_63_32(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_HI_rec_63_32_mask) << SDMA_PKT_POLL_MEM_VERIFY_REC_ADDR_HI_rec_63_32_shift)
+
+/*define for RESERVED word*/
+/*define for reserved field*/
+#define SDMA_PKT_POLL_MEM_VERIFY_RESERVED_reserved_offset 12
+#define SDMA_PKT_POLL_MEM_VERIFY_RESERVED_reserved_mask   0xFFFFFFFF
+#define SDMA_PKT_POLL_MEM_VERIFY_RESERVED_reserved_shift  0
+#define SDMA_PKT_POLL_MEM_VERIFY_RESERVED_RESERVED(x) (((x) & SDMA_PKT_POLL_MEM_VERIFY_RESERVED_reserved_mask) << SDMA_PKT_POLL_MEM_VERIFY_RESERVED_reserved_shift)
+
+
+/*
+** Definitions for SDMA_PKT_ATOMIC packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_ATOMIC_HEADER_op_offset 0
+#define SDMA_PKT_ATOMIC_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_ATOMIC_HEADER_op_shift  0
+#define SDMA_PKT_ATOMIC_HEADER_OP(x) (((x) & SDMA_PKT_ATOMIC_HEADER_op_mask) << SDMA_PKT_ATOMIC_HEADER_op_shift)
+
+/*define for loop field*/
+#define SDMA_PKT_ATOMIC_HEADER_loop_offset 0
+#define SDMA_PKT_ATOMIC_HEADER_loop_mask   0x00000001
+#define SDMA_PKT_ATOMIC_HEADER_loop_shift  16
+#define SDMA_PKT_ATOMIC_HEADER_LOOP(x) (((x) & SDMA_PKT_ATOMIC_HEADER_loop_mask) << SDMA_PKT_ATOMIC_HEADER_loop_shift)
+
+/*define for tmz field*/
+#define SDMA_PKT_ATOMIC_HEADER_tmz_offset 0
+#define SDMA_PKT_ATOMIC_HEADER_tmz_mask   0x00000001
+#define SDMA_PKT_ATOMIC_HEADER_tmz_shift  18
+#define SDMA_PKT_ATOMIC_HEADER_TMZ(x) (((x) & SDMA_PKT_ATOMIC_HEADER_tmz_mask) << SDMA_PKT_ATOMIC_HEADER_tmz_shift)
+
+/*define for cache_policy field*/
+#define SDMA_PKT_ATOMIC_HEADER_cache_policy_offset 0
+#define SDMA_PKT_ATOMIC_HEADER_cache_policy_mask   0x00000007
+#define SDMA_PKT_ATOMIC_HEADER_cache_policy_shift  20
+#define SDMA_PKT_ATOMIC_HEADER_CACHE_POLICY(x) (((x) & SDMA_PKT_ATOMIC_HEADER_cache_policy_mask) << SDMA_PKT_ATOMIC_HEADER_cache_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_ATOMIC_HEADER_cpv_offset 0
+#define SDMA_PKT_ATOMIC_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_ATOMIC_HEADER_cpv_shift  24
+#define SDMA_PKT_ATOMIC_HEADER_CPV(x) (((x) & SDMA_PKT_ATOMIC_HEADER_cpv_mask) << SDMA_PKT_ATOMIC_HEADER_cpv_shift)
+
+/*define for atomic_op field*/
+#define SDMA_PKT_ATOMIC_HEADER_atomic_op_offset 0
+#define SDMA_PKT_ATOMIC_HEADER_atomic_op_mask   0x0000007F
+#define SDMA_PKT_ATOMIC_HEADER_atomic_op_shift  25
+#define SDMA_PKT_ATOMIC_HEADER_ATOMIC_OP(x) (((x) & SDMA_PKT_ATOMIC_HEADER_atomic_op_mask) << SDMA_PKT_ATOMIC_HEADER_atomic_op_shift)
+
+/*define for ADDR_LO word*/
+/*define for addr_31_0 field*/
+#define SDMA_PKT_ATOMIC_ADDR_LO_addr_31_0_offset 1
+#define SDMA_PKT_ATOMIC_ADDR_LO_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_ATOMIC_ADDR_LO_addr_31_0_shift  0
+#define SDMA_PKT_ATOMIC_ADDR_LO_ADDR_31_0(x) (((x) & SDMA_PKT_ATOMIC_ADDR_LO_addr_31_0_mask) << SDMA_PKT_ATOMIC_ADDR_LO_addr_31_0_shift)
+
+/*define for ADDR_HI word*/
+/*define for addr_63_32 field*/
+#define SDMA_PKT_ATOMIC_ADDR_HI_addr_63_32_offset 2
+#define SDMA_PKT_ATOMIC_ADDR_HI_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_ATOMIC_ADDR_HI_addr_63_32_shift  0
+#define SDMA_PKT_ATOMIC_ADDR_HI_ADDR_63_32(x) (((x) & SDMA_PKT_ATOMIC_ADDR_HI_addr_63_32_mask) << SDMA_PKT_ATOMIC_ADDR_HI_addr_63_32_shift)
+
+/*define for SRC_DATA_LO word*/
+/*define for src_data_31_0 field*/
+#define SDMA_PKT_ATOMIC_SRC_DATA_LO_src_data_31_0_offset 3
+#define SDMA_PKT_ATOMIC_SRC_DATA_LO_src_data_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_ATOMIC_SRC_DATA_LO_src_data_31_0_shift  0
+#define SDMA_PKT_ATOMIC_SRC_DATA_LO_SRC_DATA_31_0(x) (((x) & SDMA_PKT_ATOMIC_SRC_DATA_LO_src_data_31_0_mask) << SDMA_PKT_ATOMIC_SRC_DATA_LO_src_data_31_0_shift)
+
+/*define for SRC_DATA_HI word*/
+/*define for src_data_63_32 field*/
+#define SDMA_PKT_ATOMIC_SRC_DATA_HI_src_data_63_32_offset 4
+#define SDMA_PKT_ATOMIC_SRC_DATA_HI_src_data_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_ATOMIC_SRC_DATA_HI_src_data_63_32_shift  0
+#define SDMA_PKT_ATOMIC_SRC_DATA_HI_SRC_DATA_63_32(x) (((x) & SDMA_PKT_ATOMIC_SRC_DATA_HI_src_data_63_32_mask) << SDMA_PKT_ATOMIC_SRC_DATA_HI_src_data_63_32_shift)
+
+/*define for CMP_DATA_LO word*/
+/*define for cmp_data_31_0 field*/
+#define SDMA_PKT_ATOMIC_CMP_DATA_LO_cmp_data_31_0_offset 5
+#define SDMA_PKT_ATOMIC_CMP_DATA_LO_cmp_data_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_ATOMIC_CMP_DATA_LO_cmp_data_31_0_shift  0
+#define SDMA_PKT_ATOMIC_CMP_DATA_LO_CMP_DATA_31_0(x) (((x) & SDMA_PKT_ATOMIC_CMP_DATA_LO_cmp_data_31_0_mask) << SDMA_PKT_ATOMIC_CMP_DATA_LO_cmp_data_31_0_shift)
+
+/*define for CMP_DATA_HI word*/
+/*define for cmp_data_63_32 field*/
+#define SDMA_PKT_ATOMIC_CMP_DATA_HI_cmp_data_63_32_offset 6
+#define SDMA_PKT_ATOMIC_CMP_DATA_HI_cmp_data_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_ATOMIC_CMP_DATA_HI_cmp_data_63_32_shift  0
+#define SDMA_PKT_ATOMIC_CMP_DATA_HI_CMP_DATA_63_32(x) (((x) & SDMA_PKT_ATOMIC_CMP_DATA_HI_cmp_data_63_32_mask) << SDMA_PKT_ATOMIC_CMP_DATA_HI_cmp_data_63_32_shift)
+
+/*define for LOOP_INTERVAL word*/
+/*define for loop_interval field*/
+#define SDMA_PKT_ATOMIC_LOOP_INTERVAL_loop_interval_offset 7
+#define SDMA_PKT_ATOMIC_LOOP_INTERVAL_loop_interval_mask   0x00001FFF
+#define SDMA_PKT_ATOMIC_LOOP_INTERVAL_loop_interval_shift  0
+#define SDMA_PKT_ATOMIC_LOOP_INTERVAL_LOOP_INTERVAL(x) (((x) & SDMA_PKT_ATOMIC_LOOP_INTERVAL_loop_interval_mask) << SDMA_PKT_ATOMIC_LOOP_INTERVAL_loop_interval_shift)
+
+
+/*
+** Definitions for SDMA_PKT_TIMESTAMP_SET packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_TIMESTAMP_SET_HEADER_op_offset 0
+#define SDMA_PKT_TIMESTAMP_SET_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_TIMESTAMP_SET_HEADER_op_shift  0
+#define SDMA_PKT_TIMESTAMP_SET_HEADER_OP(x) (((x) & SDMA_PKT_TIMESTAMP_SET_HEADER_op_mask) << SDMA_PKT_TIMESTAMP_SET_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_TIMESTAMP_SET_HEADER_sub_op_offset 0
+#define SDMA_PKT_TIMESTAMP_SET_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_TIMESTAMP_SET_HEADER_sub_op_shift  8
+#define SDMA_PKT_TIMESTAMP_SET_HEADER_SUB_OP(x) (((x) & SDMA_PKT_TIMESTAMP_SET_HEADER_sub_op_mask) << SDMA_PKT_TIMESTAMP_SET_HEADER_sub_op_shift)
+
+/*define for INIT_DATA_LO word*/
+/*define for init_data_31_0 field*/
+#define SDMA_PKT_TIMESTAMP_SET_INIT_DATA_LO_init_data_31_0_offset 1
+#define SDMA_PKT_TIMESTAMP_SET_INIT_DATA_LO_init_data_31_0_mask   0xFFFFFFFF
+#define SDMA_PKT_TIMESTAMP_SET_INIT_DATA_LO_init_data_31_0_shift  0
+#define SDMA_PKT_TIMESTAMP_SET_INIT_DATA_LO_INIT_DATA_31_0(x) (((x) & SDMA_PKT_TIMESTAMP_SET_INIT_DATA_LO_init_data_31_0_mask) << SDMA_PKT_TIMESTAMP_SET_INIT_DATA_LO_init_data_31_0_shift)
+
+/*define for INIT_DATA_HI word*/
+/*define for init_data_63_32 field*/
+#define SDMA_PKT_TIMESTAMP_SET_INIT_DATA_HI_init_data_63_32_offset 2
+#define SDMA_PKT_TIMESTAMP_SET_INIT_DATA_HI_init_data_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_TIMESTAMP_SET_INIT_DATA_HI_init_data_63_32_shift  0
+#define SDMA_PKT_TIMESTAMP_SET_INIT_DATA_HI_INIT_DATA_63_32(x) (((x) & SDMA_PKT_TIMESTAMP_SET_INIT_DATA_HI_init_data_63_32_mask) << SDMA_PKT_TIMESTAMP_SET_INIT_DATA_HI_init_data_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_TIMESTAMP_GET packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_op_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_op_shift  0
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_OP(x) (((x) & SDMA_PKT_TIMESTAMP_GET_HEADER_op_mask) << SDMA_PKT_TIMESTAMP_GET_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_sub_op_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_sub_op_shift  8
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_SUB_OP(x) (((x) & SDMA_PKT_TIMESTAMP_GET_HEADER_sub_op_mask) << SDMA_PKT_TIMESTAMP_GET_HEADER_sub_op_shift)
+
+/*define for l2_policy field*/
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_l2_policy_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_l2_policy_mask   0x00000003
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_l2_policy_shift  24
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_L2_POLICY(x) (((x) & SDMA_PKT_TIMESTAMP_GET_HEADER_l2_policy_mask) << SDMA_PKT_TIMESTAMP_GET_HEADER_l2_policy_shift)
+
+/*define for llc_policy field*/
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_llc_policy_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_llc_policy_mask   0x00000001
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_llc_policy_shift  26
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_LLC_POLICY(x) (((x) & SDMA_PKT_TIMESTAMP_GET_HEADER_llc_policy_mask) << SDMA_PKT_TIMESTAMP_GET_HEADER_llc_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_cpv_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_cpv_shift  28
+#define SDMA_PKT_TIMESTAMP_GET_HEADER_CPV(x) (((x) & SDMA_PKT_TIMESTAMP_GET_HEADER_cpv_mask) << SDMA_PKT_TIMESTAMP_GET_HEADER_cpv_shift)
+
+/*define for WRITE_ADDR_LO word*/
+/*define for write_addr_31_3 field*/
+#define SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_LO_write_addr_31_3_offset 1
+#define SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_LO_write_addr_31_3_mask   0x1FFFFFFF
+#define SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_LO_write_addr_31_3_shift  3
+#define SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_LO_WRITE_ADDR_31_3(x) (((x) & SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_LO_write_addr_31_3_mask) << SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_LO_write_addr_31_3_shift)
+
+/*define for WRITE_ADDR_HI word*/
+/*define for write_addr_63_32 field*/
+#define SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_HI_write_addr_63_32_offset 2
+#define SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_HI_write_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_HI_write_addr_63_32_shift  0
+#define SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_HI_WRITE_ADDR_63_32(x) (((x) & SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_HI_write_addr_63_32_mask) << SDMA_PKT_TIMESTAMP_GET_WRITE_ADDR_HI_write_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_TIMESTAMP_GET_GLOBAL packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_op_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_op_shift  0
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_OP(x) (((x) & SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_op_mask) << SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_sub_op_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_sub_op_shift  8
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_SUB_OP(x) (((x) & SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_sub_op_mask) << SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_sub_op_shift)
+
+/*define for l2_policy field*/
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_l2_policy_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_l2_policy_mask   0x00000003
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_l2_policy_shift  24
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_L2_POLICY(x) (((x) & SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_l2_policy_mask) << SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_l2_policy_shift)
+
+/*define for llc_policy field*/
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_llc_policy_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_llc_policy_mask   0x00000001
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_llc_policy_shift  26
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_LLC_POLICY(x) (((x) & SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_llc_policy_mask) << SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_llc_policy_shift)
+
+/*define for cpv field*/
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_cpv_offset 0
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_cpv_mask   0x00000001
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_cpv_shift  28
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_CPV(x) (((x) & SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_cpv_mask) << SDMA_PKT_TIMESTAMP_GET_GLOBAL_HEADER_cpv_shift)
+
+/*define for WRITE_ADDR_LO word*/
+/*define for write_addr_31_3 field*/
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_LO_write_addr_31_3_offset 1
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_LO_write_addr_31_3_mask   0x1FFFFFFF
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_LO_write_addr_31_3_shift  3
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_LO_WRITE_ADDR_31_3(x) (((x) & SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_LO_write_addr_31_3_mask) << SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_LO_write_addr_31_3_shift)
+
+/*define for WRITE_ADDR_HI word*/
+/*define for write_addr_63_32 field*/
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_HI_write_addr_63_32_offset 2
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_HI_write_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_HI_write_addr_63_32_shift  0
+#define SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_HI_WRITE_ADDR_63_32(x) (((x) & SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_HI_write_addr_63_32_mask) << SDMA_PKT_TIMESTAMP_GET_GLOBAL_WRITE_ADDR_HI_write_addr_63_32_shift)
+
+
+/*
+** Definitions for SDMA_PKT_TRAP packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_TRAP_HEADER_op_offset 0
+#define SDMA_PKT_TRAP_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_TRAP_HEADER_op_shift  0
+#define SDMA_PKT_TRAP_HEADER_OP(x) (((x) & SDMA_PKT_TRAP_HEADER_op_mask) << SDMA_PKT_TRAP_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_TRAP_HEADER_sub_op_offset 0
+#define SDMA_PKT_TRAP_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_TRAP_HEADER_sub_op_shift  8
+#define SDMA_PKT_TRAP_HEADER_SUB_OP(x) (((x) & SDMA_PKT_TRAP_HEADER_sub_op_mask) << SDMA_PKT_TRAP_HEADER_sub_op_shift)
+
+/*define for INT_CONTEXT word*/
+/*define for int_context field*/
+#define SDMA_PKT_TRAP_INT_CONTEXT_int_context_offset 1
+#define SDMA_PKT_TRAP_INT_CONTEXT_int_context_mask   0x0FFFFFFF
+#define SDMA_PKT_TRAP_INT_CONTEXT_int_context_shift  0
+#define SDMA_PKT_TRAP_INT_CONTEXT_INT_CONTEXT(x) (((x) & SDMA_PKT_TRAP_INT_CONTEXT_int_context_mask) << SDMA_PKT_TRAP_INT_CONTEXT_int_context_shift)
+
+
+/*
+** Definitions for SDMA_PKT_DUMMY_TRAP packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_DUMMY_TRAP_HEADER_op_offset 0
+#define SDMA_PKT_DUMMY_TRAP_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_DUMMY_TRAP_HEADER_op_shift  0
+#define SDMA_PKT_DUMMY_TRAP_HEADER_OP(x) (((x) & SDMA_PKT_DUMMY_TRAP_HEADER_op_mask) << SDMA_PKT_DUMMY_TRAP_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_DUMMY_TRAP_HEADER_sub_op_offset 0
+#define SDMA_PKT_DUMMY_TRAP_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_DUMMY_TRAP_HEADER_sub_op_shift  8
+#define SDMA_PKT_DUMMY_TRAP_HEADER_SUB_OP(x) (((x) & SDMA_PKT_DUMMY_TRAP_HEADER_sub_op_mask) << SDMA_PKT_DUMMY_TRAP_HEADER_sub_op_shift)
+
+/*define for INT_CONTEXT word*/
+/*define for int_context field*/
+#define SDMA_PKT_DUMMY_TRAP_INT_CONTEXT_int_context_offset 1
+#define SDMA_PKT_DUMMY_TRAP_INT_CONTEXT_int_context_mask   0x0FFFFFFF
+#define SDMA_PKT_DUMMY_TRAP_INT_CONTEXT_int_context_shift  0
+#define SDMA_PKT_DUMMY_TRAP_INT_CONTEXT_INT_CONTEXT(x) (((x) & SDMA_PKT_DUMMY_TRAP_INT_CONTEXT_int_context_mask) << SDMA_PKT_DUMMY_TRAP_INT_CONTEXT_int_context_shift)
+
+
+/*
+** Definitions for SDMA_PKT_GPUVM_INV packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_GPUVM_INV_HEADER_op_offset 0
+#define SDMA_PKT_GPUVM_INV_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_GPUVM_INV_HEADER_op_shift  0
+#define SDMA_PKT_GPUVM_INV_HEADER_OP(x) (((x) & SDMA_PKT_GPUVM_INV_HEADER_op_mask) << SDMA_PKT_GPUVM_INV_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_GPUVM_INV_HEADER_sub_op_offset 0
+#define SDMA_PKT_GPUVM_INV_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_GPUVM_INV_HEADER_sub_op_shift  8
+#define SDMA_PKT_GPUVM_INV_HEADER_SUB_OP(x) (((x) & SDMA_PKT_GPUVM_INV_HEADER_sub_op_mask) << SDMA_PKT_GPUVM_INV_HEADER_sub_op_shift)
+
+/*define for PAYLOAD1 word*/
+/*define for per_vmid_inv_req field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_per_vmid_inv_req_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_per_vmid_inv_req_mask   0x0000FFFF
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_per_vmid_inv_req_shift  0
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_PER_VMID_INV_REQ(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_per_vmid_inv_req_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_per_vmid_inv_req_shift)
+
+/*define for flush_type field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_flush_type_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_flush_type_mask   0x00000007
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_flush_type_shift  16
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_FLUSH_TYPE(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_flush_type_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_flush_type_shift)
+
+/*define for l2_ptes field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_ptes_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_ptes_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_ptes_shift  19
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_L2_PTES(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_ptes_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_ptes_shift)
+
+/*define for l2_pde0 field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde0_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde0_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde0_shift  20
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_L2_PDE0(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde0_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde0_shift)
+
+/*define for l2_pde1 field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde1_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde1_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde1_shift  21
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_L2_PDE1(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde1_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde1_shift)
+
+/*define for l2_pde2 field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde2_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde2_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde2_shift  22
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_L2_PDE2(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde2_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_l2_pde2_shift)
+
+/*define for l1_ptes field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l1_ptes_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l1_ptes_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_l1_ptes_shift  23
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_L1_PTES(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_l1_ptes_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_l1_ptes_shift)
+
+/*define for clr_protection_fault_status_addr field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_clr_protection_fault_status_addr_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_clr_protection_fault_status_addr_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_clr_protection_fault_status_addr_shift  24
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_CLR_PROTECTION_FAULT_STATUS_ADDR(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_clr_protection_fault_status_addr_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_clr_protection_fault_status_addr_shift)
+
+/*define for log_request field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_log_request_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_log_request_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_log_request_shift  25
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_LOG_REQUEST(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_log_request_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_log_request_shift)
+
+/*define for four_kilobytes field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_four_kilobytes_offset 1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_four_kilobytes_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_four_kilobytes_shift  26
+#define SDMA_PKT_GPUVM_INV_PAYLOAD1_FOUR_KILOBYTES(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD1_four_kilobytes_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD1_four_kilobytes_shift)
+
+/*define for PAYLOAD2 word*/
+/*define for s field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD2_s_offset 2
+#define SDMA_PKT_GPUVM_INV_PAYLOAD2_s_mask   0x00000001
+#define SDMA_PKT_GPUVM_INV_PAYLOAD2_s_shift  0
+#define SDMA_PKT_GPUVM_INV_PAYLOAD2_S(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD2_s_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD2_s_shift)
+
+/*define for page_va_42_12 field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD2_page_va_42_12_offset 2
+#define SDMA_PKT_GPUVM_INV_PAYLOAD2_page_va_42_12_mask   0x7FFFFFFF
+#define SDMA_PKT_GPUVM_INV_PAYLOAD2_page_va_42_12_shift  1
+#define SDMA_PKT_GPUVM_INV_PAYLOAD2_PAGE_VA_42_12(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD2_page_va_42_12_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD2_page_va_42_12_shift)
+
+/*define for PAYLOAD3 word*/
+/*define for page_va_47_43 field*/
+#define SDMA_PKT_GPUVM_INV_PAYLOAD3_page_va_47_43_offset 3
+#define SDMA_PKT_GPUVM_INV_PAYLOAD3_page_va_47_43_mask   0x0000003F
+#define SDMA_PKT_GPUVM_INV_PAYLOAD3_page_va_47_43_shift  0
+#define SDMA_PKT_GPUVM_INV_PAYLOAD3_PAGE_VA_47_43(x) (((x) & SDMA_PKT_GPUVM_INV_PAYLOAD3_page_va_47_43_mask) << SDMA_PKT_GPUVM_INV_PAYLOAD3_page_va_47_43_shift)
+
+
+/*
+** Definitions for SDMA_PKT_GCR_REQ packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_GCR_REQ_HEADER_op_offset 0
+#define SDMA_PKT_GCR_REQ_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_GCR_REQ_HEADER_op_shift  0
+#define SDMA_PKT_GCR_REQ_HEADER_OP(x) (((x) & SDMA_PKT_GCR_REQ_HEADER_op_mask) << SDMA_PKT_GCR_REQ_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_GCR_REQ_HEADER_sub_op_offset 0
+#define SDMA_PKT_GCR_REQ_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_GCR_REQ_HEADER_sub_op_shift  8
+#define SDMA_PKT_GCR_REQ_HEADER_SUB_OP(x) (((x) & SDMA_PKT_GCR_REQ_HEADER_sub_op_mask) << SDMA_PKT_GCR_REQ_HEADER_sub_op_shift)
+
+/*define for PAYLOAD1 word*/
+/*define for base_va_31_7 field*/
+#define SDMA_PKT_GCR_REQ_PAYLOAD1_base_va_31_7_offset 1
+#define SDMA_PKT_GCR_REQ_PAYLOAD1_base_va_31_7_mask   0x01FFFFFF
+#define SDMA_PKT_GCR_REQ_PAYLOAD1_base_va_31_7_shift  7
+#define SDMA_PKT_GCR_REQ_PAYLOAD1_BASE_VA_31_7(x) (((x) & SDMA_PKT_GCR_REQ_PAYLOAD1_base_va_31_7_mask) << SDMA_PKT_GCR_REQ_PAYLOAD1_base_va_31_7_shift)
+
+/*define for PAYLOAD2 word*/
+/*define for base_va_47_32 field*/
+#define SDMA_PKT_GCR_REQ_PAYLOAD2_base_va_47_32_offset 2
+#define SDMA_PKT_GCR_REQ_PAYLOAD2_base_va_47_32_mask   0x0000FFFF
+#define SDMA_PKT_GCR_REQ_PAYLOAD2_base_va_47_32_shift  0
+#define SDMA_PKT_GCR_REQ_PAYLOAD2_BASE_VA_47_32(x) (((x) & SDMA_PKT_GCR_REQ_PAYLOAD2_base_va_47_32_mask) << SDMA_PKT_GCR_REQ_PAYLOAD2_base_va_47_32_shift)
+
+/*define for gcr_control_15_0 field*/
+#define SDMA_PKT_GCR_REQ_PAYLOAD2_gcr_control_15_0_offset 2
+#define SDMA_PKT_GCR_REQ_PAYLOAD2_gcr_control_15_0_mask   0x0000FFFF
+#define SDMA_PKT_GCR_REQ_PAYLOAD2_gcr_control_15_0_shift  16
+#define SDMA_PKT_GCR_REQ_PAYLOAD2_GCR_CONTROL_15_0(x) (((x) & SDMA_PKT_GCR_REQ_PAYLOAD2_gcr_control_15_0_mask) << SDMA_PKT_GCR_REQ_PAYLOAD2_gcr_control_15_0_shift)
+
+/*define for PAYLOAD3 word*/
+/*define for gcr_control_18_16 field*/
+#define SDMA_PKT_GCR_REQ_PAYLOAD3_gcr_control_18_16_offset 3
+#define SDMA_PKT_GCR_REQ_PAYLOAD3_gcr_control_18_16_mask   0x00000007
+#define SDMA_PKT_GCR_REQ_PAYLOAD3_gcr_control_18_16_shift  0
+#define SDMA_PKT_GCR_REQ_PAYLOAD3_GCR_CONTROL_18_16(x) (((x) & SDMA_PKT_GCR_REQ_PAYLOAD3_gcr_control_18_16_mask) << SDMA_PKT_GCR_REQ_PAYLOAD3_gcr_control_18_16_shift)
+
+/*define for limit_va_31_7 field*/
+#define SDMA_PKT_GCR_REQ_PAYLOAD3_limit_va_31_7_offset 3
+#define SDMA_PKT_GCR_REQ_PAYLOAD3_limit_va_31_7_mask   0x01FFFFFF
+#define SDMA_PKT_GCR_REQ_PAYLOAD3_limit_va_31_7_shift  7
+#define SDMA_PKT_GCR_REQ_PAYLOAD3_LIMIT_VA_31_7(x) (((x) & SDMA_PKT_GCR_REQ_PAYLOAD3_limit_va_31_7_mask) << SDMA_PKT_GCR_REQ_PAYLOAD3_limit_va_31_7_shift)
+
+/*define for PAYLOAD4 word*/
+/*define for limit_va_47_32 field*/
+#define SDMA_PKT_GCR_REQ_PAYLOAD4_limit_va_47_32_offset 4
+#define SDMA_PKT_GCR_REQ_PAYLOAD4_limit_va_47_32_mask   0x0000FFFF
+#define SDMA_PKT_GCR_REQ_PAYLOAD4_limit_va_47_32_shift  0
+#define SDMA_PKT_GCR_REQ_PAYLOAD4_LIMIT_VA_47_32(x) (((x) & SDMA_PKT_GCR_REQ_PAYLOAD4_limit_va_47_32_mask) << SDMA_PKT_GCR_REQ_PAYLOAD4_limit_va_47_32_shift)
+
+/*define for vmid field*/
+#define SDMA_PKT_GCR_REQ_PAYLOAD4_vmid_offset 4
+#define SDMA_PKT_GCR_REQ_PAYLOAD4_vmid_mask   0x0000000F
+#define SDMA_PKT_GCR_REQ_PAYLOAD4_vmid_shift  24
+#define SDMA_PKT_GCR_REQ_PAYLOAD4_VMID(x) (((x) & SDMA_PKT_GCR_REQ_PAYLOAD4_vmid_mask) << SDMA_PKT_GCR_REQ_PAYLOAD4_vmid_shift)
+
+
+/*
+** Definitions for SDMA_PKT_NOP packet
+*/
+
+/*define for HEADER word*/
+/*define for op field*/
+#define SDMA_PKT_NOP_HEADER_op_offset 0
+#define SDMA_PKT_NOP_HEADER_op_mask   0x000000FF
+#define SDMA_PKT_NOP_HEADER_op_shift  0
+#define SDMA_PKT_NOP_HEADER_OP(x) (((x) & SDMA_PKT_NOP_HEADER_op_mask) << SDMA_PKT_NOP_HEADER_op_shift)
+
+/*define for sub_op field*/
+#define SDMA_PKT_NOP_HEADER_sub_op_offset 0
+#define SDMA_PKT_NOP_HEADER_sub_op_mask   0x000000FF
+#define SDMA_PKT_NOP_HEADER_sub_op_shift  8
+#define SDMA_PKT_NOP_HEADER_SUB_OP(x) (((x) & SDMA_PKT_NOP_HEADER_sub_op_mask) << SDMA_PKT_NOP_HEADER_sub_op_shift)
+
+/*define for count field*/
+#define SDMA_PKT_NOP_HEADER_count_offset 0
+#define SDMA_PKT_NOP_HEADER_count_mask   0x00003FFF
+#define SDMA_PKT_NOP_HEADER_count_shift  16
+#define SDMA_PKT_NOP_HEADER_COUNT(x) (((x) & SDMA_PKT_NOP_HEADER_count_mask) << SDMA_PKT_NOP_HEADER_count_shift)
+
+/*define for DATA0 word*/
+/*define for data0 field*/
+#define SDMA_PKT_NOP_DATA0_data0_offset 1
+#define SDMA_PKT_NOP_DATA0_data0_mask   0xFFFFFFFF
+#define SDMA_PKT_NOP_DATA0_data0_shift  0
+#define SDMA_PKT_NOP_DATA0_DATA0(x) (((x) & SDMA_PKT_NOP_DATA0_data0_mask) << SDMA_PKT_NOP_DATA0_data0_shift)
+
+
+/*
+** Definitions for SDMA_AQL_PKT_HEADER packet
+*/
+
+/*define for HEADER word*/
+/*define for format field*/
+#define SDMA_AQL_PKT_HEADER_HEADER_format_offset 0
+#define SDMA_AQL_PKT_HEADER_HEADER_format_mask   0x000000FF
+#define SDMA_AQL_PKT_HEADER_HEADER_format_shift  0
+#define SDMA_AQL_PKT_HEADER_HEADER_FORMAT(x) (((x) & SDMA_AQL_PKT_HEADER_HEADER_format_mask) << SDMA_AQL_PKT_HEADER_HEADER_format_shift)
+
+/*define for barrier field*/
+#define SDMA_AQL_PKT_HEADER_HEADER_barrier_offset 0
+#define SDMA_AQL_PKT_HEADER_HEADER_barrier_mask   0x00000001
+#define SDMA_AQL_PKT_HEADER_HEADER_barrier_shift  8
+#define SDMA_AQL_PKT_HEADER_HEADER_BARRIER(x) (((x) & SDMA_AQL_PKT_HEADER_HEADER_barrier_mask) << SDMA_AQL_PKT_HEADER_HEADER_barrier_shift)
+
+/*define for acquire_fence_scope field*/
+#define SDMA_AQL_PKT_HEADER_HEADER_acquire_fence_scope_offset 0
+#define SDMA_AQL_PKT_HEADER_HEADER_acquire_fence_scope_mask   0x00000003
+#define SDMA_AQL_PKT_HEADER_HEADER_acquire_fence_scope_shift  9
+#define SDMA_AQL_PKT_HEADER_HEADER_ACQUIRE_FENCE_SCOPE(x) (((x) & SDMA_AQL_PKT_HEADER_HEADER_acquire_fence_scope_mask) << SDMA_AQL_PKT_HEADER_HEADER_acquire_fence_scope_shift)
+
+/*define for release_fence_scope field*/
+#define SDMA_AQL_PKT_HEADER_HEADER_release_fence_scope_offset 0
+#define SDMA_AQL_PKT_HEADER_HEADER_release_fence_scope_mask   0x00000003
+#define SDMA_AQL_PKT_HEADER_HEADER_release_fence_scope_shift  11
+#define SDMA_AQL_PKT_HEADER_HEADER_RELEASE_FENCE_SCOPE(x) (((x) & SDMA_AQL_PKT_HEADER_HEADER_release_fence_scope_mask) << SDMA_AQL_PKT_HEADER_HEADER_release_fence_scope_shift)
+
+/*define for reserved field*/
+#define SDMA_AQL_PKT_HEADER_HEADER_reserved_offset 0
+#define SDMA_AQL_PKT_HEADER_HEADER_reserved_mask   0x00000007
+#define SDMA_AQL_PKT_HEADER_HEADER_reserved_shift  13
+#define SDMA_AQL_PKT_HEADER_HEADER_RESERVED(x) (((x) & SDMA_AQL_PKT_HEADER_HEADER_reserved_mask) << SDMA_AQL_PKT_HEADER_HEADER_reserved_shift)
+
+/*define for op field*/
+#define SDMA_AQL_PKT_HEADER_HEADER_op_offset 0
+#define SDMA_AQL_PKT_HEADER_HEADER_op_mask   0x0000000F
+#define SDMA_AQL_PKT_HEADER_HEADER_op_shift  16
+#define SDMA_AQL_PKT_HEADER_HEADER_OP(x) (((x) & SDMA_AQL_PKT_HEADER_HEADER_op_mask) << SDMA_AQL_PKT_HEADER_HEADER_op_shift)
+
+/*define for subop field*/
+#define SDMA_AQL_PKT_HEADER_HEADER_subop_offset 0
+#define SDMA_AQL_PKT_HEADER_HEADER_subop_mask   0x00000007
+#define SDMA_AQL_PKT_HEADER_HEADER_subop_shift  20
+#define SDMA_AQL_PKT_HEADER_HEADER_SUBOP(x) (((x) & SDMA_AQL_PKT_HEADER_HEADER_subop_mask) << SDMA_AQL_PKT_HEADER_HEADER_subop_shift)
+
+/*define for cpv field*/
+#define SDMA_AQL_PKT_HEADER_HEADER_cpv_offset 0
+#define SDMA_AQL_PKT_HEADER_HEADER_cpv_mask   0x00000001
+#define SDMA_AQL_PKT_HEADER_HEADER_cpv_shift  28
+#define SDMA_AQL_PKT_HEADER_HEADER_CPV(x) (((x) & SDMA_AQL_PKT_HEADER_HEADER_cpv_mask) << SDMA_AQL_PKT_HEADER_HEADER_cpv_shift)
+
+
+/*
+** Definitions for SDMA_AQL_PKT_COPY_LINEAR packet
+*/
+
+/*define for HEADER word*/
+/*define for format field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_format_offset 0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_format_mask   0x000000FF
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_format_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_FORMAT(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_HEADER_format_mask) << SDMA_AQL_PKT_COPY_LINEAR_HEADER_format_shift)
+
+/*define for barrier field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_barrier_offset 0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_barrier_mask   0x00000001
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_barrier_shift  8
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_BARRIER(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_HEADER_barrier_mask) << SDMA_AQL_PKT_COPY_LINEAR_HEADER_barrier_shift)
+
+/*define for acquire_fence_scope field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_acquire_fence_scope_offset 0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_acquire_fence_scope_mask   0x00000003
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_acquire_fence_scope_shift  9
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_ACQUIRE_FENCE_SCOPE(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_HEADER_acquire_fence_scope_mask) << SDMA_AQL_PKT_COPY_LINEAR_HEADER_acquire_fence_scope_shift)
+
+/*define for release_fence_scope field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_release_fence_scope_offset 0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_release_fence_scope_mask   0x00000003
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_release_fence_scope_shift  11
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_RELEASE_FENCE_SCOPE(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_HEADER_release_fence_scope_mask) << SDMA_AQL_PKT_COPY_LINEAR_HEADER_release_fence_scope_shift)
+
+/*define for reserved field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_reserved_offset 0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_reserved_mask   0x00000007
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_reserved_shift  13
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_RESERVED(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_HEADER_reserved_mask) << SDMA_AQL_PKT_COPY_LINEAR_HEADER_reserved_shift)
+
+/*define for op field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_op_offset 0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_op_mask   0x0000000F
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_op_shift  16
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_OP(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_HEADER_op_mask) << SDMA_AQL_PKT_COPY_LINEAR_HEADER_op_shift)
+
+/*define for subop field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_subop_offset 0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_subop_mask   0x00000007
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_subop_shift  20
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_SUBOP(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_HEADER_subop_mask) << SDMA_AQL_PKT_COPY_LINEAR_HEADER_subop_shift)
+
+/*define for cpv field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_cpv_offset 0
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_cpv_mask   0x00000001
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_cpv_shift  28
+#define SDMA_AQL_PKT_COPY_LINEAR_HEADER_CPV(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_HEADER_cpv_mask) << SDMA_AQL_PKT_COPY_LINEAR_HEADER_cpv_shift)
+
+/*define for RESERVED_DW1 word*/
+/*define for reserved_dw1 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW1_reserved_dw1_offset 1
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW1_reserved_dw1_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW1_reserved_dw1_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW1_RESERVED_DW1(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW1_reserved_dw1_mask) << SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW1_reserved_dw1_shift)
+
+/*define for RETURN_ADDR_LO word*/
+/*define for return_addr_31_0 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_LO_return_addr_31_0_offset 2
+#define SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_LO_return_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_LO_return_addr_31_0_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_LO_RETURN_ADDR_31_0(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_LO_return_addr_31_0_mask) << SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_LO_return_addr_31_0_shift)
+
+/*define for RETURN_ADDR_HI word*/
+/*define for return_addr_63_32 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_HI_return_addr_63_32_offset 3
+#define SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_HI_return_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_HI_return_addr_63_32_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_HI_RETURN_ADDR_63_32(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_HI_return_addr_63_32_mask) << SDMA_AQL_PKT_COPY_LINEAR_RETURN_ADDR_HI_return_addr_63_32_shift)
+
+/*define for COUNT word*/
+/*define for count field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_COUNT_count_offset 4
+#define SDMA_AQL_PKT_COPY_LINEAR_COUNT_count_mask   0x003FFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_COUNT_count_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_COUNT_COUNT(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_COUNT_count_mask) << SDMA_AQL_PKT_COPY_LINEAR_COUNT_count_shift)
+
+/*define for PARAMETER word*/
+/*define for dst_sw field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_sw_offset 5
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_sw_mask   0x00000003
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_sw_shift  16
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_DST_SW(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_sw_mask) << SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_sw_shift)
+
+/*define for dst_cache_policy field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_offset 5
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_mask   0x00000007
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_shift  18
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_DST_CACHE_POLICY(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_mask) << SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_dst_cache_policy_shift)
+
+/*define for src_sw field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_sw_offset 5
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_sw_mask   0x00000003
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_sw_shift  24
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_SRC_SW(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_sw_mask) << SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_sw_shift)
+
+/*define for src_cache_policy field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_offset 5
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_mask   0x00000007
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_shift  26
+#define SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_SRC_CACHE_POLICY(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_mask) << SDMA_AQL_PKT_COPY_LINEAR_PARAMETER_src_cache_policy_shift)
+
+/*define for SRC_ADDR_LO word*/
+/*define for src_addr_31_0 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_offset 6
+#define SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_LO_SRC_ADDR_31_0(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_mask) << SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_LO_src_addr_31_0_shift)
+
+/*define for SRC_ADDR_HI word*/
+/*define for src_addr_63_32 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_offset 7
+#define SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_HI_SRC_ADDR_63_32(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_mask) << SDMA_AQL_PKT_COPY_LINEAR_SRC_ADDR_HI_src_addr_63_32_shift)
+
+/*define for DST_ADDR_LO word*/
+/*define for dst_addr_31_0 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_offset 8
+#define SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_LO_DST_ADDR_31_0(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_mask) << SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_LO_dst_addr_31_0_shift)
+
+/*define for DST_ADDR_HI word*/
+/*define for dst_addr_63_32 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_offset 9
+#define SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_HI_DST_ADDR_63_32(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_mask) << SDMA_AQL_PKT_COPY_LINEAR_DST_ADDR_HI_dst_addr_63_32_shift)
+
+/*define for RESERVED_DW10 word*/
+/*define for reserved_dw10 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW10_reserved_dw10_offset 10
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW10_reserved_dw10_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW10_reserved_dw10_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW10_RESERVED_DW10(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW10_reserved_dw10_mask) << SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW10_reserved_dw10_shift)
+
+/*define for RESERVED_DW11 word*/
+/*define for reserved_dw11 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW11_reserved_dw11_offset 11
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW11_reserved_dw11_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW11_reserved_dw11_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW11_RESERVED_DW11(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW11_reserved_dw11_mask) << SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW11_reserved_dw11_shift)
+
+/*define for RESERVED_DW12 word*/
+/*define for reserved_dw12 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW12_reserved_dw12_offset 12
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW12_reserved_dw12_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW12_reserved_dw12_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW12_RESERVED_DW12(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW12_reserved_dw12_mask) << SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW12_reserved_dw12_shift)
+
+/*define for RESERVED_DW13 word*/
+/*define for reserved_dw13 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW13_reserved_dw13_offset 13
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW13_reserved_dw13_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW13_reserved_dw13_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW13_RESERVED_DW13(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW13_reserved_dw13_mask) << SDMA_AQL_PKT_COPY_LINEAR_RESERVED_DW13_reserved_dw13_shift)
+
+/*define for COMPLETION_SIGNAL_LO word*/
+/*define for completion_signal_31_0 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_LO_completion_signal_31_0_offset 14
+#define SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_LO_completion_signal_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_LO_completion_signal_31_0_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_LO_COMPLETION_SIGNAL_31_0(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_LO_completion_signal_31_0_mask) << SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_LO_completion_signal_31_0_shift)
+
+/*define for COMPLETION_SIGNAL_HI word*/
+/*define for completion_signal_63_32 field*/
+#define SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_HI_completion_signal_63_32_offset 15
+#define SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_HI_completion_signal_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_HI_completion_signal_63_32_shift  0
+#define SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_HI_COMPLETION_SIGNAL_63_32(x) (((x) & SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_HI_completion_signal_63_32_mask) << SDMA_AQL_PKT_COPY_LINEAR_COMPLETION_SIGNAL_HI_completion_signal_63_32_shift)
+
+
+/*
+** Definitions for SDMA_AQL_PKT_BARRIER_OR packet
+*/
+
+/*define for HEADER word*/
+/*define for format field*/
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_format_offset 0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_format_mask   0x000000FF
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_format_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_FORMAT(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_HEADER_format_mask) << SDMA_AQL_PKT_BARRIER_OR_HEADER_format_shift)
+
+/*define for barrier field*/
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_barrier_offset 0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_barrier_mask   0x00000001
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_barrier_shift  8
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_BARRIER(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_HEADER_barrier_mask) << SDMA_AQL_PKT_BARRIER_OR_HEADER_barrier_shift)
+
+/*define for acquire_fence_scope field*/
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_acquire_fence_scope_offset 0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_acquire_fence_scope_mask   0x00000003
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_acquire_fence_scope_shift  9
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_ACQUIRE_FENCE_SCOPE(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_HEADER_acquire_fence_scope_mask) << SDMA_AQL_PKT_BARRIER_OR_HEADER_acquire_fence_scope_shift)
+
+/*define for release_fence_scope field*/
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_release_fence_scope_offset 0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_release_fence_scope_mask   0x00000003
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_release_fence_scope_shift  11
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_RELEASE_FENCE_SCOPE(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_HEADER_release_fence_scope_mask) << SDMA_AQL_PKT_BARRIER_OR_HEADER_release_fence_scope_shift)
+
+/*define for reserved field*/
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_reserved_offset 0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_reserved_mask   0x00000007
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_reserved_shift  13
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_RESERVED(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_HEADER_reserved_mask) << SDMA_AQL_PKT_BARRIER_OR_HEADER_reserved_shift)
+
+/*define for op field*/
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_op_offset 0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_op_mask   0x0000000F
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_op_shift  16
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_OP(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_HEADER_op_mask) << SDMA_AQL_PKT_BARRIER_OR_HEADER_op_shift)
+
+/*define for subop field*/
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_subop_offset 0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_subop_mask   0x00000007
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_subop_shift  20
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_SUBOP(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_HEADER_subop_mask) << SDMA_AQL_PKT_BARRIER_OR_HEADER_subop_shift)
+
+/*define for cpv field*/
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_cpv_offset 0
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_cpv_mask   0x00000001
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_cpv_shift  28
+#define SDMA_AQL_PKT_BARRIER_OR_HEADER_CPV(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_HEADER_cpv_mask) << SDMA_AQL_PKT_BARRIER_OR_HEADER_cpv_shift)
+
+/*define for RESERVED_DW1 word*/
+/*define for reserved_dw1 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW1_reserved_dw1_offset 1
+#define SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW1_reserved_dw1_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW1_reserved_dw1_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW1_RESERVED_DW1(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW1_reserved_dw1_mask) << SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW1_reserved_dw1_shift)
+
+/*define for DEPENDENT_ADDR_0_LO word*/
+/*define for dependent_addr_0_31_0 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_LO_dependent_addr_0_31_0_offset 2
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_LO_dependent_addr_0_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_LO_dependent_addr_0_31_0_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_LO_DEPENDENT_ADDR_0_31_0(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_LO_dependent_addr_0_31_0_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_LO_dependent_addr_0_31_0_shift)
+
+/*define for DEPENDENT_ADDR_0_HI word*/
+/*define for dependent_addr_0_63_32 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_HI_dependent_addr_0_63_32_offset 3
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_HI_dependent_addr_0_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_HI_dependent_addr_0_63_32_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_HI_DEPENDENT_ADDR_0_63_32(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_HI_dependent_addr_0_63_32_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_0_HI_dependent_addr_0_63_32_shift)
+
+/*define for DEPENDENT_ADDR_1_LO word*/
+/*define for dependent_addr_1_31_0 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_LO_dependent_addr_1_31_0_offset 4
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_LO_dependent_addr_1_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_LO_dependent_addr_1_31_0_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_LO_DEPENDENT_ADDR_1_31_0(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_LO_dependent_addr_1_31_0_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_LO_dependent_addr_1_31_0_shift)
+
+/*define for DEPENDENT_ADDR_1_HI word*/
+/*define for dependent_addr_1_63_32 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_HI_dependent_addr_1_63_32_offset 5
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_HI_dependent_addr_1_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_HI_dependent_addr_1_63_32_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_HI_DEPENDENT_ADDR_1_63_32(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_HI_dependent_addr_1_63_32_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_1_HI_dependent_addr_1_63_32_shift)
+
+/*define for DEPENDENT_ADDR_2_LO word*/
+/*define for dependent_addr_2_31_0 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_LO_dependent_addr_2_31_0_offset 6
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_LO_dependent_addr_2_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_LO_dependent_addr_2_31_0_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_LO_DEPENDENT_ADDR_2_31_0(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_LO_dependent_addr_2_31_0_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_LO_dependent_addr_2_31_0_shift)
+
+/*define for DEPENDENT_ADDR_2_HI word*/
+/*define for dependent_addr_2_63_32 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_HI_dependent_addr_2_63_32_offset 7
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_HI_dependent_addr_2_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_HI_dependent_addr_2_63_32_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_HI_DEPENDENT_ADDR_2_63_32(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_HI_dependent_addr_2_63_32_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_2_HI_dependent_addr_2_63_32_shift)
+
+/*define for DEPENDENT_ADDR_3_LO word*/
+/*define for dependent_addr_3_31_0 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_LO_dependent_addr_3_31_0_offset 8
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_LO_dependent_addr_3_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_LO_dependent_addr_3_31_0_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_LO_DEPENDENT_ADDR_3_31_0(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_LO_dependent_addr_3_31_0_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_LO_dependent_addr_3_31_0_shift)
+
+/*define for DEPENDENT_ADDR_3_HI word*/
+/*define for dependent_addr_3_63_32 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_HI_dependent_addr_3_63_32_offset 9
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_HI_dependent_addr_3_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_HI_dependent_addr_3_63_32_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_HI_DEPENDENT_ADDR_3_63_32(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_HI_dependent_addr_3_63_32_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_3_HI_dependent_addr_3_63_32_shift)
+
+/*define for DEPENDENT_ADDR_4_LO word*/
+/*define for dependent_addr_4_31_0 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_LO_dependent_addr_4_31_0_offset 10
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_LO_dependent_addr_4_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_LO_dependent_addr_4_31_0_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_LO_DEPENDENT_ADDR_4_31_0(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_LO_dependent_addr_4_31_0_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_LO_dependent_addr_4_31_0_shift)
+
+/*define for DEPENDENT_ADDR_4_HI word*/
+/*define for dependent_addr_4_63_32 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_HI_dependent_addr_4_63_32_offset 11
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_HI_dependent_addr_4_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_HI_dependent_addr_4_63_32_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_HI_DEPENDENT_ADDR_4_63_32(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_HI_dependent_addr_4_63_32_mask) << SDMA_AQL_PKT_BARRIER_OR_DEPENDENT_ADDR_4_HI_dependent_addr_4_63_32_shift)
+
+/*define for CACHE_POLICY word*/
+/*define for cache_policy0 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy0_offset 12
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy0_mask   0x00000007
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy0_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_CACHE_POLICY0(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy0_mask) << SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy0_shift)
+
+/*define for cache_policy1 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy1_offset 12
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy1_mask   0x00000007
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy1_shift  5
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_CACHE_POLICY1(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy1_mask) << SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy1_shift)
+
+/*define for cache_policy2 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy2_offset 12
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy2_mask   0x00000007
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy2_shift  10
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_CACHE_POLICY2(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy2_mask) << SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy2_shift)
+
+/*define for cache_policy3 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy3_offset 12
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy3_mask   0x00000007
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy3_shift  15
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_CACHE_POLICY3(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy3_mask) << SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy3_shift)
+
+/*define for cache_policy4 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy4_offset 12
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy4_mask   0x00000007
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy4_shift  20
+#define SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_CACHE_POLICY4(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy4_mask) << SDMA_AQL_PKT_BARRIER_OR_CACHE_POLICY_cache_policy4_shift)
+
+/*define for RESERVED_DW13 word*/
+/*define for reserved_dw13 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW13_reserved_dw13_offset 13
+#define SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW13_reserved_dw13_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW13_reserved_dw13_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW13_RESERVED_DW13(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW13_reserved_dw13_mask) << SDMA_AQL_PKT_BARRIER_OR_RESERVED_DW13_reserved_dw13_shift)
+
+/*define for COMPLETION_SIGNAL_LO word*/
+/*define for completion_signal_31_0 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_LO_completion_signal_31_0_offset 14
+#define SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_LO_completion_signal_31_0_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_LO_completion_signal_31_0_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_LO_COMPLETION_SIGNAL_31_0(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_LO_completion_signal_31_0_mask) << SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_LO_completion_signal_31_0_shift)
+
+/*define for COMPLETION_SIGNAL_HI word*/
+/*define for completion_signal_63_32 field*/
+#define SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_HI_completion_signal_63_32_offset 15
+#define SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_HI_completion_signal_63_32_mask   0xFFFFFFFF
+#define SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_HI_completion_signal_63_32_shift  0
+#define SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_HI_COMPLETION_SIGNAL_63_32(x) (((x) & SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_HI_completion_signal_63_32_mask) << SDMA_AQL_PKT_BARRIER_OR_COMPLETION_SIGNAL_HI_completion_signal_63_32_shift)
+
+
+#endif /* __SDMA_V6_0_0_PKT_OPEN_H_ */
-- 
2.35.1


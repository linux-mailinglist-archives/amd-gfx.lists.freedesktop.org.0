Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4424D760036
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jul 2023 22:05:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4DDA10E353;
	Mon, 24 Jul 2023 20:05:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060.outbound.protection.outlook.com [40.107.212.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5910210E353
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jul 2023 20:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxtoBNUucw/yMpe0KKWW2hSLskENJ3/CKgDmauwyxTRTd42njWEV1d8qHWse5R7yXYes+Liofje1QQwftvnTXt8TOd0pzxN3ihb3YQGd9baAgv3chxl3aIf88oGkhx4XbBzVtdsrnQIwlSSbF5WPYEYNCmRwWUidcPHxy6jTUabB38gDoM9U3Uw6+LIVyV2CYD6dq+HdUMp1u+Oq6I5KjWMDr9ThwDmykZomLGAddPl5OQvT6Ql/owvVYYTU7MY22s4mxr6Bi/3p8oplaynXlCM6x8zidpKA9Bu09CT6a2ph6BBb7zjnjNKyLhM1565NpuL28hBepz77SpJ1KKo2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7AFKR/Lvd+ZtJ9GUHrmWJQDpNrxd8LiefAu6FtRqDA=;
 b=fONg0ZGoOPdZgttjwfwLvZotoUnh31mqaCLyiXjnvJYIaVu7MW7JfrQ32lpDOlngxaevG28eLAEyjgpODaHi7c66Y2VwG0MNNERdQ3W4mp/7QdRJw8eKZdXkxBVa13FsmyMkT1m3+ejQkoGQBHYnn+2TkCKVNYAXtTDtSN+SKi2nj1bjo2tamx8PAnlXb2nsiectAa3zxfX7Wu0OdIGHRRtRSXU3Wmzs/St0TjAL2i4qpN5W52PH6oEJQtFEuAZx8v0EzxQJc0wiqeURYLhlGG+ti7bxF+X+qAB9E8PS+2SPAJVpcIz3y9PTWNj+Oss3q6V+hhelWJfAWC0lmzbl8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7AFKR/Lvd+ZtJ9GUHrmWJQDpNrxd8LiefAu6FtRqDA=;
 b=PiPQK7N0l3NkGpn+td+rBZ1425Biar2sPGWqn6G712dtEDwskj1zyJqEiH/ZXNcZBNctrvNsLFjHxjNou+qMFXVJS9BqaprwTsy2Q8MrUZ7rwtCAyMfRpXvTOYxrpZyfMh7svud3id1FaZjHsvVI0+I4Y8e7WCxvacBMB53Qw7k=
Received: from DS7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::26) by
 CY5PR12MB6455.namprd12.prod.outlook.com (2603:10b6:930:35::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Mon, 24 Jul 2023 20:05:28 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2e:cafe::91) by DS7P222CA0017.outlook.office365.com
 (2603:10b6:8:2e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33 via Frontend
 Transport; Mon, 24 Jul 2023 20:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6631.22 via Frontend Transport; Mon, 24 Jul 2023 20:05:28 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 24 Jul
 2023 15:05:27 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amdgpu: add ih 6.1 registers
Date: Mon, 24 Jul 2023 16:05:11 -0400
Message-ID: <20230724200513.764387-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT046:EE_|CY5PR12MB6455:EE_
X-MS-Office365-Filtering-Correlation-Id: c230f721-0911-458b-b589-08db8c8153c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /Ri6rwxWxIkUvb9y+7j9BASEvlR7fBH7b29cebE5fqme+k2fYz6ltLqo2yg1LUgXgutuqYOwYk0pQv3j+0qu5B9si/6Gfj39tQd8AjhI5baU+TMEfjK5WePDgGlrQbChcpAQ6PYoBPs3G4VTXrAGlUaVbRJaFmFPl9XE2UG1/DkYIbv7eWUCs+ziB/bAbMPFDR8S6YlbyfMFcikVEdQ73Y2ztyFfrFrFspK6iTaSJMW1aTaALbk1JZ8V3J97Y4MBfrMrQJqPGP5mvDSkmdI6JnkEVuM3En9wLKpjCmPJjiKMF+9KjBGD/9CpWh/6mptDpbGNDqpZFGNrIE3pGR2KOqeo6g+E4DRCZo3JOxvrvtSdvPtMtEO/3EldgCg5UMa6XDm9baBlLcfZEKI4LYeJjNO5hhGznXE+oDOLfp1uGqG6mldTQ6TouMj2DjtDy9nxSig//9pVFyQKjuZEuJQr1xs8U5Jrd+UGdexHj26u1CAK12rzOog1OuB7STz3gDOOkXXif+4+K2uuafWvVtYTcHrsYFhw24+ekPiEWAFxzveaAXu5DhWFzbbKKcnMb7FrW5EQiOXWpoXTIOOaN1IJ8tz7x1sSNO1Qxl4NYDnUcAStw2bxA1sScRgsGWdptX021oXtSZWnb/yyKpv2zjvDQfO0Wi9RObS2RS80LYmoFRTRvbqDrdPTNpfTnrzPAvocn4FSpXf1S/DP0yxp6kWZn1CcBZpeNwqKx8p9h+yKscQqhy7N+/gracvkB6nm2kiPRzDszKGngcN7Xx95I1CYzA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(82310400008)(36840700001)(40470700004)(46966006)(40480700001)(82740400003)(26005)(81166007)(356005)(2616005)(426003)(186003)(16526019)(83380400001)(1076003)(336012)(47076005)(36860700001)(8676002)(30864003)(40460700003)(8936002)(5660300002)(2906002)(36756003)(478600001)(7696005)(6666004)(316002)(86362001)(70206006)(41300700001)(70586007)(54906003)(6916009)(4326008)(66899021)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:05:28.6280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c230f721-0911-458b-b589-08db8c8153c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6455
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
Cc: Alex Deucher <alexander.deucher@amd.com>, benl <ben.li@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: benl <ben.li@amd.com>

Add new registers.

v2: updates (Alex)

Signed-off-by: Ben Li <ben.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../asic_reg/oss/osssys_6_1_0_offset.h        |  279 +++++
 .../asic_reg/oss/osssys_6_1_0_sh_mask.h       | 1019 +++++++++++++++++
 2 files changed, 1298 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_offset.h
 create mode 100644 drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_sh_mask.h

diff --git a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_offset.h b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_offset.h
new file mode 100644
index 0000000000000..a5e7ba5d99caf
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_offset.h
@@ -0,0 +1,279 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef _osssys_6_1_0_OFFSET_HEADER
+#define _osssys_6_1_0_OFFSET_HEADER
+
+
+
+// addressBlock: osssys_osssysdec
+// base address: 0x4280
+#define regIH_VMID_0_LUT                                                                                0x0000
+#define regIH_VMID_0_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_1_LUT                                                                                0x0001
+#define regIH_VMID_1_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_2_LUT                                                                                0x0002
+#define regIH_VMID_2_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_3_LUT                                                                                0x0003
+#define regIH_VMID_3_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_4_LUT                                                                                0x0004
+#define regIH_VMID_4_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_5_LUT                                                                                0x0005
+#define regIH_VMID_5_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_6_LUT                                                                                0x0006
+#define regIH_VMID_6_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_7_LUT                                                                                0x0007
+#define regIH_VMID_7_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_8_LUT                                                                                0x0008
+#define regIH_VMID_8_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_9_LUT                                                                                0x0009
+#define regIH_VMID_9_LUT_BASE_IDX                                                                       0
+#define regIH_VMID_10_LUT                                                                               0x000a
+#define regIH_VMID_10_LUT_BASE_IDX                                                                      0
+#define regIH_VMID_11_LUT                                                                               0x000b
+#define regIH_VMID_11_LUT_BASE_IDX                                                                      0
+#define regIH_VMID_12_LUT                                                                               0x000c
+#define regIH_VMID_12_LUT_BASE_IDX                                                                      0
+#define regIH_VMID_13_LUT                                                                               0x000d
+#define regIH_VMID_13_LUT_BASE_IDX                                                                      0
+#define regIH_VMID_14_LUT                                                                               0x000e
+#define regIH_VMID_14_LUT_BASE_IDX                                                                      0
+#define regIH_VMID_15_LUT                                                                               0x000f
+#define regIH_VMID_15_LUT_BASE_IDX                                                                      0
+#define regIH_VMID_0_LUT_MM                                                                             0x0010
+#define regIH_VMID_0_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_1_LUT_MM                                                                             0x0011
+#define regIH_VMID_1_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_2_LUT_MM                                                                             0x0012
+#define regIH_VMID_2_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_3_LUT_MM                                                                             0x0013
+#define regIH_VMID_3_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_4_LUT_MM                                                                             0x0014
+#define regIH_VMID_4_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_5_LUT_MM                                                                             0x0015
+#define regIH_VMID_5_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_6_LUT_MM                                                                             0x0016
+#define regIH_VMID_6_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_7_LUT_MM                                                                             0x0017
+#define regIH_VMID_7_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_8_LUT_MM                                                                             0x0018
+#define regIH_VMID_8_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_9_LUT_MM                                                                             0x0019
+#define regIH_VMID_9_LUT_MM_BASE_IDX                                                                    0
+#define regIH_VMID_10_LUT_MM                                                                            0x001a
+#define regIH_VMID_10_LUT_MM_BASE_IDX                                                                   0
+#define regIH_VMID_11_LUT_MM                                                                            0x001b
+#define regIH_VMID_11_LUT_MM_BASE_IDX                                                                   0
+#define regIH_VMID_12_LUT_MM                                                                            0x001c
+#define regIH_VMID_12_LUT_MM_BASE_IDX                                                                   0
+#define regIH_VMID_13_LUT_MM                                                                            0x001d
+#define regIH_VMID_13_LUT_MM_BASE_IDX                                                                   0
+#define regIH_VMID_14_LUT_MM                                                                            0x001e
+#define regIH_VMID_14_LUT_MM_BASE_IDX                                                                   0
+#define regIH_VMID_15_LUT_MM                                                                            0x001f
+#define regIH_VMID_15_LUT_MM_BASE_IDX                                                                   0
+#define regIH_COOKIE_0                                                                                  0x0020
+#define regIH_COOKIE_0_BASE_IDX                                                                         0
+#define regIH_COOKIE_1                                                                                  0x0021
+#define regIH_COOKIE_1_BASE_IDX                                                                         0
+#define regIH_COOKIE_2                                                                                  0x0022
+#define regIH_COOKIE_2_BASE_IDX                                                                         0
+#define regIH_COOKIE_3                                                                                  0x0023
+#define regIH_COOKIE_3_BASE_IDX                                                                         0
+#define regIH_COOKIE_4                                                                                  0x0024
+#define regIH_COOKIE_4_BASE_IDX                                                                         0
+#define regIH_COOKIE_5                                                                                  0x0025
+#define regIH_COOKIE_5_BASE_IDX                                                                         0
+#define regIH_COOKIE_6                                                                                  0x0026
+#define regIH_COOKIE_6_BASE_IDX                                                                         0
+#define regIH_COOKIE_7                                                                                  0x0027
+#define regIH_COOKIE_7_BASE_IDX                                                                         0
+#define regIH_REGISTER_LAST_PART0                                                                       0x003f
+#define regIH_REGISTER_LAST_PART0_BASE_IDX                                                              0
+#define regIH_RB_CNTL                                                                                   0x0080
+#define regIH_RB_CNTL_BASE_IDX                                                                          0
+#define regIH_RB_RPTR                                                                                   0x0081
+#define regIH_RB_RPTR_BASE_IDX                                                                          0
+#define regIH_RB_WPTR                                                                                   0x0082
+#define regIH_RB_WPTR_BASE_IDX                                                                          0
+#define regIH_RB_BASE                                                                                   0x0083
+#define regIH_RB_BASE_BASE_IDX                                                                          0
+#define regIH_RB_BASE_HI                                                                                0x0084
+#define regIH_RB_BASE_HI_BASE_IDX                                                                       0
+#define regIH_RB_WPTR_ADDR_HI                                                                           0x0085
+#define regIH_RB_WPTR_ADDR_HI_BASE_IDX                                                                  0
+#define regIH_RB_WPTR_ADDR_LO                                                                           0x0086
+#define regIH_RB_WPTR_ADDR_LO_BASE_IDX                                                                  0
+#define regIH_DOORBELL_RPTR                                                                             0x0087
+#define regIH_DOORBELL_RPTR_BASE_IDX                                                                    0
+#define regIH_DOORBELL_RETRY_CAM                                                                        0x0088
+#define regIH_DOORBELL_RETRY_CAM_BASE_IDX                                                               0
+#define regIH_RB_CNTL_RING1                                                                             0x008c
+#define regIH_RB_CNTL_RING1_BASE_IDX                                                                    0
+#define regIH_RB_RPTR_RING1                                                                             0x008d
+#define regIH_RB_RPTR_RING1_BASE_IDX                                                                    0
+#define regIH_RB_WPTR_RING1                                                                             0x008e
+#define regIH_RB_WPTR_RING1_BASE_IDX                                                                    0
+#define regIH_RB_BASE_RING1                                                                             0x008f
+#define regIH_RB_BASE_RING1_BASE_IDX                                                                    0
+#define regIH_RB_BASE_HI_RING1                                                                          0x0090
+#define regIH_RB_BASE_HI_RING1_BASE_IDX                                                                 0
+#define regIH_DOORBELL_RPTR_RING1                                                                       0x0093
+#define regIH_DOORBELL_RPTR_RING1_BASE_IDX                                                              0
+#define regIH_RETRY_CAM_ACK                                                                             0x00a4
+#define regIH_RETRY_CAM_ACK_BASE_IDX                                                                    0
+#define regIH_VERSION                                                                                   0x00a5
+#define regIH_VERSION_BASE_IDX                                                                          0
+#define regIH_CNTL                                                                                      0x00a8
+#define regIH_CNTL_BASE_IDX                                                                             0
+#define regIH_CLK_CTRL                                                                                  0x00a9
+#define regIH_CLK_CTRL_BASE_IDX                                                                         0
+#define regIH_STORM_CLIENT_LIST_CNTL                                                                    0x00aa
+#define regIH_STORM_CLIENT_LIST_CNTL_BASE_IDX                                                           0
+#define regIH_LIMIT_INT_RATE_CNTL                                                                       0x00ab
+#define regIH_LIMIT_INT_RATE_CNTL_BASE_IDX                                                              0
+#define regIH_RETRY_INT_CAM_CNTL                                                                        0x00ac
+#define regIH_RETRY_INT_CAM_CNTL_BASE_IDX                                                               0
+#define regIH_MEM_POWER_CTRL                                                                            0x00ad
+#define regIH_MEM_POWER_CTRL_BASE_IDX                                                                   0
+#define regIH_MEM_POWER_CTRL2                                                                           0x00ae
+#define regIH_MEM_POWER_CTRL2_BASE_IDX                                                                  0
+#define regIH_CNTL2                                                                                     0x00c1
+#define regIH_CNTL2_BASE_IDX                                                                            0
+#define regIH_STATUS                                                                                    0x00c2
+#define regIH_STATUS_BASE_IDX                                                                           0
+#define regIH_PERFMON_CNTL                                                                              0x00c3
+#define regIH_PERFMON_CNTL_BASE_IDX                                                                     0
+#define regIH_PERFCOUNTER0_RESULT                                                                       0x00c4
+#define regIH_PERFCOUNTER0_RESULT_BASE_IDX                                                              0
+#define regIH_PERFCOUNTER1_RESULT                                                                       0x00c5
+#define regIH_PERFCOUNTER1_RESULT_BASE_IDX                                                              0
+#define regIH_DSM_MATCH_VALUE_BIT_31_0                                                                  0x00c7
+#define regIH_DSM_MATCH_VALUE_BIT_31_0_BASE_IDX                                                         0
+#define regIH_DSM_MATCH_VALUE_BIT_63_32                                                                 0x00c8
+#define regIH_DSM_MATCH_VALUE_BIT_63_32_BASE_IDX                                                        0
+#define regIH_DSM_MATCH_VALUE_BIT_95_64                                                                 0x00c9
+#define regIH_DSM_MATCH_VALUE_BIT_95_64_BASE_IDX                                                        0
+#define regIH_DSM_MATCH_FIELD_CONTROL                                                                   0x00ca
+#define regIH_DSM_MATCH_FIELD_CONTROL_BASE_IDX                                                          0
+#define regIH_DSM_MATCH_DATA_CONTROL                                                                    0x00cb
+#define regIH_DSM_MATCH_DATA_CONTROL_BASE_IDX                                                           0
+#define regIH_DSM_MATCH_FCN_ID                                                                          0x00cc
+#define regIH_DSM_MATCH_FCN_ID_BASE_IDX                                                                 0
+#define regIH_VF_RB_STATUS                                                                              0x00ce
+#define regIH_VF_RB_STATUS_BASE_IDX                                                                     0
+#define regIH_VF_RB_STATUS2                                                                             0x00cf
+#define regIH_VF_RB_STATUS2_BASE_IDX                                                                    0
+#define regIH_VF_RB1_STATUS                                                                             0x00d0
+#define regIH_VF_RB1_STATUS_BASE_IDX                                                                    0
+#define regIH_VF_RB1_STATUS2                                                                            0x00d1
+#define regIH_VF_RB1_STATUS2_BASE_IDX                                                                   0
+#define regIH_RB_STATUS                                                                                 0x00d4
+#define regIH_RB_STATUS_BASE_IDX                                                                        0
+#define regIH_INT_FLOOD_CNTL                                                                            0x00d5
+#define regIH_INT_FLOOD_CNTL_BASE_IDX                                                                   0
+#define regIH_RB0_INT_FLOOD_STATUS                                                                      0x00d6
+#define regIH_RB0_INT_FLOOD_STATUS_BASE_IDX                                                             0
+#define regIH_RB1_INT_FLOOD_STATUS                                                                      0x00d7
+#define regIH_RB1_INT_FLOOD_STATUS_BASE_IDX                                                             0
+#define regIH_INT_FLOOD_STATUS                                                                          0x00d9
+#define regIH_INT_FLOOD_STATUS_BASE_IDX                                                                 0
+#define regIH_INT_FLAGS                                                                                 0x00dc
+#define regIH_INT_FLAGS_BASE_IDX                                                                        0
+#define regIH_LAST_INT_INFO0                                                                            0x00dd
+#define regIH_LAST_INT_INFO0_BASE_IDX                                                                   0
+#define regIH_LAST_INT_INFO1                                                                            0x00de
+#define regIH_LAST_INT_INFO1_BASE_IDX                                                                   0
+#define regIH_LAST_INT_INFO2                                                                            0x00df
+#define regIH_LAST_INT_INFO2_BASE_IDX                                                                   0
+#define regIH_SCRATCH                                                                                   0x00e0
+#define regIH_SCRATCH_BASE_IDX                                                                          0
+#define regIH_CLIENT_CREDIT_ERROR                                                                       0x00e1
+#define regIH_CLIENT_CREDIT_ERROR_BASE_IDX                                                              0
+#define regIH_GPU_IOV_VIOLATION_LOG                                                                     0x00e2
+#define regIH_GPU_IOV_VIOLATION_LOG_BASE_IDX                                                            0
+#define regIH_GPU_IOV_VIOLATION_LOG2                                                                    0x00e3
+#define regIH_GPU_IOV_VIOLATION_LOG2_BASE_IDX                                                           0
+#define regIH_COOKIE_REC_VIOLATION_LOG                                                                  0x00e4
+#define regIH_COOKIE_REC_VIOLATION_LOG_BASE_IDX                                                         0
+#define regIH_CREDIT_STATUS                                                                             0x00e5
+#define regIH_CREDIT_STATUS_BASE_IDX                                                                    0
+#define regIH_MMHUB_ERROR                                                                               0x00e6
+#define regIH_MMHUB_ERROR_BASE_IDX                                                                      0
+#define regIH_VF_RB_STATUS3                                                                             0x00ea
+#define regIH_VF_RB_STATUS3_BASE_IDX                                                                    0
+#define regIH_VF_RB_STATUS4                                                                             0x00eb
+#define regIH_VF_RB_STATUS4_BASE_IDX                                                                    0
+#define regIH_VF_RB1_STATUS3                                                                            0x00ec
+#define regIH_VF_RB1_STATUS3_BASE_IDX                                                                   0
+#define regIH_MSI_STORM_CTRL                                                                            0x00f1
+#define regIH_MSI_STORM_CTRL_BASE_IDX                                                                   0
+#define regIH_MSI_STORM_CLIENT_INDEX                                                                    0x00f2
+#define regIH_MSI_STORM_CLIENT_INDEX_BASE_IDX                                                           0
+#define regIH_MSI_STORM_CLIENT_DATA                                                                     0x00f3
+#define regIH_MSI_STORM_CLIENT_DATA_BASE_IDX                                                            0
+#define regIH_REGISTER_LAST_PART2                                                                       0x00ff
+#define regIH_REGISTER_LAST_PART2_BASE_IDX                                                              0
+#define regSEM_MAILBOX                                                                                  0x010a
+#define regSEM_MAILBOX_BASE_IDX                                                                         0
+#define regSEM_MAILBOX_CLEAR                                                                            0x010b
+#define regSEM_MAILBOX_CLEAR_BASE_IDX                                                                   0
+#define regSEM_REGISTER_LAST_PART2                                                                      0x017f
+#define regSEM_REGISTER_LAST_PART2_BASE_IDX                                                             0
+#define regIH_ACTIVE_FCN_ID                                                                             0x0180
+#define regIH_ACTIVE_FCN_ID_BASE_IDX                                                                    0
+#define regIH_VIRT_RESET_REQ                                                                            0x0181
+#define regIH_VIRT_RESET_REQ_BASE_IDX                                                                   0
+#define regIH_CLIENT_CFG                                                                                0x0184
+#define regIH_CLIENT_CFG_BASE_IDX                                                                       0
+#define regIH_RING1_CLIENT_CFG_INDEX                                                                    0x0185
+#define regIH_RING1_CLIENT_CFG_INDEX_BASE_IDX                                                           0
+#define regIH_RING1_CLIENT_CFG_DATA                                                                     0x0186
+#define regIH_RING1_CLIENT_CFG_DATA_BASE_IDX                                                            0
+#define regIH_CLIENT_CFG_INDEX                                                                          0x0188
+#define regIH_CLIENT_CFG_INDEX_BASE_IDX                                                                 0
+#define regIH_CLIENT_CFG_DATA                                                                           0x0189
+#define regIH_CLIENT_CFG_DATA_BASE_IDX                                                                  0
+#define regIH_CLIENT_CFG_DATA2                                                                          0x018a
+#define regIH_CLIENT_CFG_DATA2_BASE_IDX                                                                 0
+#define regIH_CID_REMAP_INDEX                                                                           0x018b
+#define regIH_CID_REMAP_INDEX_BASE_IDX                                                                  0
+#define regIH_CID_REMAP_DATA                                                                            0x018c
+#define regIH_CID_REMAP_DATA_BASE_IDX                                                                   0
+#define regIH_CHICKEN                                                                                   0x018d
+#define regIH_CHICKEN_BASE_IDX                                                                          0
+#define regIH_MMHUB_CNTL                                                                                0x018e
+#define regIH_MMHUB_CNTL_BASE_IDX                                                                       0
+#define regIH_INT_DROP_CNTL                                                                             0x018f
+#define regIH_INT_DROP_CNTL_BASE_IDX                                                                    0
+#define regIH_INT_DROP_MATCH_VALUE0                                                                     0x0190
+#define regIH_INT_DROP_MATCH_VALUE0_BASE_IDX                                                            0
+#define regIH_INT_DROP_MATCH_VALUE1                                                                     0x0191
+#define regIH_INT_DROP_MATCH_VALUE1_BASE_IDX                                                            0
+#define regIH_INT_DROP_MATCH_MASK0                                                                      0x0192
+#define regIH_INT_DROP_MATCH_MASK0_BASE_IDX                                                             0
+#define regIH_INT_DROP_MATCH_MASK1                                                                      0x0193
+#define regIH_INT_DROP_MATCH_MASK1_BASE_IDX                                                             0
+#define regIH_REGISTER_LAST_PART1                                                                       0x019f
+#define regIH_REGISTER_LAST_PART1_BASE_IDX                                                              0
+
+#endif
diff --git a/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_sh_mask.h
new file mode 100644
index 0000000000000..15d5689dde65b
--- /dev/null
+++ b/drivers/gpu/drm/amd/include/asic_reg/oss/osssys_6_1_0_sh_mask.h
@@ -0,0 +1,1019 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
+#ifndef _osssys_6_1_0_SH_MASK_HEADER
+#define _osssys_6_1_0_SH_MASK_HEADER
+
+
+// addressBlock: osssys_osssysdec
+//IH_VMID_0_LUT
+#define IH_VMID_0_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_0_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_1_LUT
+#define IH_VMID_1_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_1_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_2_LUT
+#define IH_VMID_2_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_2_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_3_LUT
+#define IH_VMID_3_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_3_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_4_LUT
+#define IH_VMID_4_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_4_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_5_LUT
+#define IH_VMID_5_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_5_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_6_LUT
+#define IH_VMID_6_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_6_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_7_LUT
+#define IH_VMID_7_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_7_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_8_LUT
+#define IH_VMID_8_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_8_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_9_LUT
+#define IH_VMID_9_LUT__PASID__SHIFT                                                                           0x0
+#define IH_VMID_9_LUT__PASID_MASK                                                                             0x0000FFFFL
+//IH_VMID_10_LUT
+#define IH_VMID_10_LUT__PASID__SHIFT                                                                          0x0
+#define IH_VMID_10_LUT__PASID_MASK                                                                            0x0000FFFFL
+//IH_VMID_11_LUT
+#define IH_VMID_11_LUT__PASID__SHIFT                                                                          0x0
+#define IH_VMID_11_LUT__PASID_MASK                                                                            0x0000FFFFL
+//IH_VMID_12_LUT
+#define IH_VMID_12_LUT__PASID__SHIFT                                                                          0x0
+#define IH_VMID_12_LUT__PASID_MASK                                                                            0x0000FFFFL
+//IH_VMID_13_LUT
+#define IH_VMID_13_LUT__PASID__SHIFT                                                                          0x0
+#define IH_VMID_13_LUT__PASID_MASK                                                                            0x0000FFFFL
+//IH_VMID_14_LUT
+#define IH_VMID_14_LUT__PASID__SHIFT                                                                          0x0
+#define IH_VMID_14_LUT__PASID_MASK                                                                            0x0000FFFFL
+//IH_VMID_15_LUT
+#define IH_VMID_15_LUT__PASID__SHIFT                                                                          0x0
+#define IH_VMID_15_LUT__PASID_MASK                                                                            0x0000FFFFL
+//IH_VMID_0_LUT_MM
+#define IH_VMID_0_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_0_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_1_LUT_MM
+#define IH_VMID_1_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_1_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_2_LUT_MM
+#define IH_VMID_2_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_2_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_3_LUT_MM
+#define IH_VMID_3_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_3_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_4_LUT_MM
+#define IH_VMID_4_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_4_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_5_LUT_MM
+#define IH_VMID_5_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_5_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_6_LUT_MM
+#define IH_VMID_6_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_6_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_7_LUT_MM
+#define IH_VMID_7_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_7_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_8_LUT_MM
+#define IH_VMID_8_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_8_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_9_LUT_MM
+#define IH_VMID_9_LUT_MM__PASID__SHIFT                                                                        0x0
+#define IH_VMID_9_LUT_MM__PASID_MASK                                                                          0x0000FFFFL
+//IH_VMID_10_LUT_MM
+#define IH_VMID_10_LUT_MM__PASID__SHIFT                                                                       0x0
+#define IH_VMID_10_LUT_MM__PASID_MASK                                                                         0x0000FFFFL
+//IH_VMID_11_LUT_MM
+#define IH_VMID_11_LUT_MM__PASID__SHIFT                                                                       0x0
+#define IH_VMID_11_LUT_MM__PASID_MASK                                                                         0x0000FFFFL
+//IH_VMID_12_LUT_MM
+#define IH_VMID_12_LUT_MM__PASID__SHIFT                                                                       0x0
+#define IH_VMID_12_LUT_MM__PASID_MASK                                                                         0x0000FFFFL
+//IH_VMID_13_LUT_MM
+#define IH_VMID_13_LUT_MM__PASID__SHIFT                                                                       0x0
+#define IH_VMID_13_LUT_MM__PASID_MASK                                                                         0x0000FFFFL
+//IH_VMID_14_LUT_MM
+#define IH_VMID_14_LUT_MM__PASID__SHIFT                                                                       0x0
+#define IH_VMID_14_LUT_MM__PASID_MASK                                                                         0x0000FFFFL
+//IH_VMID_15_LUT_MM
+#define IH_VMID_15_LUT_MM__PASID__SHIFT                                                                       0x0
+#define IH_VMID_15_LUT_MM__PASID_MASK                                                                         0x0000FFFFL
+//IH_COOKIE_0
+#define IH_COOKIE_0__CLIENT_ID__SHIFT                                                                         0x0
+#define IH_COOKIE_0__SOURCE_ID__SHIFT                                                                         0x8
+#define IH_COOKIE_0__RING_ID__SHIFT                                                                           0x10
+#define IH_COOKIE_0__VM_ID__SHIFT                                                                             0x18
+#define IH_COOKIE_0__RESERVED__SHIFT                                                                          0x1c
+#define IH_COOKIE_0__VMID_TYPE__SHIFT                                                                         0x1f
+#define IH_COOKIE_0__CLIENT_ID_MASK                                                                           0x000000FFL
+#define IH_COOKIE_0__SOURCE_ID_MASK                                                                           0x0000FF00L
+#define IH_COOKIE_0__RING_ID_MASK                                                                             0x00FF0000L
+#define IH_COOKIE_0__VM_ID_MASK                                                                               0x0F000000L
+#define IH_COOKIE_0__RESERVED_MASK                                                                            0x70000000L
+#define IH_COOKIE_0__VMID_TYPE_MASK                                                                           0x80000000L
+//IH_COOKIE_1
+#define IH_COOKIE_1__TIMESTAMP_31_0__SHIFT                                                                    0x0
+#define IH_COOKIE_1__TIMESTAMP_31_0_MASK                                                                      0xFFFFFFFFL
+//IH_COOKIE_2
+#define IH_COOKIE_2__TIMESTAMP_47_32__SHIFT                                                                   0x0
+#define IH_COOKIE_2__RESERVED__SHIFT                                                                          0x10
+#define IH_COOKIE_2__TIMESTAMP_SRC__SHIFT                                                                     0x1f
+#define IH_COOKIE_2__TIMESTAMP_47_32_MASK                                                                     0x0000FFFFL
+#define IH_COOKIE_2__RESERVED_MASK                                                                            0x7FFF0000L
+#define IH_COOKIE_2__TIMESTAMP_SRC_MASK                                                                       0x80000000L
+//IH_COOKIE_3
+#define IH_COOKIE_3__PAS_ID__SHIFT                                                                            0x0
+#define IH_COOKIE_3__RESERVED__SHIFT                                                                          0x10
+#define IH_COOKIE_3__PASID_SRC__SHIFT                                                                         0x1f
+#define IH_COOKIE_3__PAS_ID_MASK                                                                              0x0000FFFFL
+#define IH_COOKIE_3__RESERVED_MASK                                                                            0x7FFF0000L
+#define IH_COOKIE_3__PASID_SRC_MASK                                                                           0x80000000L
+//IH_COOKIE_4
+#define IH_COOKIE_4__CONTEXT_ID_31_0__SHIFT                                                                   0x0
+#define IH_COOKIE_4__CONTEXT_ID_31_0_MASK                                                                     0xFFFFFFFFL
+//IH_COOKIE_5
+#define IH_COOKIE_5__CONTEXT_ID_63_32__SHIFT                                                                  0x0
+#define IH_COOKIE_5__CONTEXT_ID_63_32_MASK                                                                    0xFFFFFFFFL
+//IH_COOKIE_6
+#define IH_COOKIE_6__CONTEXT_ID_95_64__SHIFT                                                                  0x0
+#define IH_COOKIE_6__CONTEXT_ID_95_64_MASK                                                                    0xFFFFFFFFL
+//IH_COOKIE_7
+#define IH_COOKIE_7__CONTEXT_ID_128_96__SHIFT                                                                 0x0
+#define IH_COOKIE_7__CONTEXT_ID_128_96_MASK                                                                   0xFFFFFFFFL
+//IH_REGISTER_LAST_PART0
+#define IH_REGISTER_LAST_PART0__RESERVED__SHIFT                                                               0x0
+#define IH_REGISTER_LAST_PART0__RESERVED_MASK                                                                 0xFFFFFFFFL
+//IH_RB_CNTL
+#define IH_RB_CNTL__RB_ENABLE__SHIFT                                                                          0x0
+#define IH_RB_CNTL__RB_SIZE__SHIFT                                                                            0x1
+#define IH_RB_CNTL__WPTR_WRITEBACK_ENABLE__SHIFT                                                              0x8
+#define IH_RB_CNTL__RB_FULL_DRAIN_ENABLE__SHIFT                                                               0x9
+#define IH_RB_CNTL__FULL_DRAIN_CLEAR__SHIFT                                                                   0xa
+#define IH_RB_CNTL__PAGE_RB_CLEAR__SHIFT                                                                      0xb
+#define IH_RB_CNTL__RB_USED_INT_THRESHOLD__SHIFT                                                              0xc
+#define IH_RB_CNTL__WPTR_OVERFLOW_ENABLE__SHIFT                                                               0x10
+#define IH_RB_CNTL__ENABLE_INTR__SHIFT                                                                        0x11
+#define IH_RB_CNTL__MC_SWAP__SHIFT                                                                            0x12
+#define IH_RB_CNTL__MC_SNOOP__SHIFT                                                                           0x14
+#define IH_RB_CNTL__RPTR_REARM__SHIFT                                                                         0x15
+#define IH_RB_CNTL__MC_RO__SHIFT                                                                              0x16
+#define IH_RB_CNTL__MC_VMID__SHIFT                                                                            0x18
+#define IH_RB_CNTL__MC_SPACE__SHIFT                                                                           0x1c
+#define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR__SHIFT                                                                0x1f
+#define IH_RB_CNTL__RB_ENABLE_MASK                                                                            0x00000001L
+#define IH_RB_CNTL__RB_SIZE_MASK                                                                              0x0000003EL
+#define IH_RB_CNTL__WPTR_WRITEBACK_ENABLE_MASK                                                                0x00000100L
+#define IH_RB_CNTL__RB_FULL_DRAIN_ENABLE_MASK                                                                 0x00000200L
+#define IH_RB_CNTL__FULL_DRAIN_CLEAR_MASK                                                                     0x00000400L
+#define IH_RB_CNTL__PAGE_RB_CLEAR_MASK                                                                        0x00000800L
+#define IH_RB_CNTL__RB_USED_INT_THRESHOLD_MASK                                                                0x0000F000L
+#define IH_RB_CNTL__WPTR_OVERFLOW_ENABLE_MASK                                                                 0x00010000L
+#define IH_RB_CNTL__ENABLE_INTR_MASK                                                                          0x00020000L
+#define IH_RB_CNTL__MC_SWAP_MASK                                                                              0x000C0000L
+#define IH_RB_CNTL__MC_SNOOP_MASK                                                                             0x00100000L
+#define IH_RB_CNTL__RPTR_REARM_MASK                                                                           0x00200000L
+#define IH_RB_CNTL__MC_RO_MASK                                                                                0x00400000L
+#define IH_RB_CNTL__MC_VMID_MASK                                                                              0x0F000000L
+#define IH_RB_CNTL__MC_SPACE_MASK                                                                             0x70000000L
+#define IH_RB_CNTL__WPTR_OVERFLOW_CLEAR_MASK                                                                  0x80000000L
+//IH_RB_RPTR
+#define IH_RB_RPTR__OFFSET__SHIFT                                                                             0x2
+#define IH_RB_RPTR__OFFSET_MASK                                                                               0x0003FFFCL
+//IH_RB_WPTR
+#define IH_RB_WPTR__RB_OVERFLOW__SHIFT                                                                        0x0
+#define IH_RB_WPTR__OFFSET__SHIFT                                                                             0x2
+#define IH_RB_WPTR__RB_LEFT_NONE__SHIFT                                                                       0x12
+#define IH_RB_WPTR__RB_MAY_OVERFLOW__SHIFT                                                                    0x13
+#define IH_RB_WPTR__RB_OVERFLOW_MASK                                                                          0x00000001L
+#define IH_RB_WPTR__OFFSET_MASK                                                                               0x0003FFFCL
+#define IH_RB_WPTR__RB_LEFT_NONE_MASK                                                                         0x00040000L
+#define IH_RB_WPTR__RB_MAY_OVERFLOW_MASK                                                                      0x00080000L
+//IH_RB_BASE
+#define IH_RB_BASE__ADDR__SHIFT                                                                               0x0
+#define IH_RB_BASE__ADDR_MASK                                                                                 0xFFFFFFFFL
+//IH_RB_BASE_HI
+#define IH_RB_BASE_HI__ADDR__SHIFT                                                                            0x0
+#define IH_RB_BASE_HI__ADDR_MASK                                                                              0x000000FFL
+//IH_RB_WPTR_ADDR_HI
+#define IH_RB_WPTR_ADDR_HI__ADDR__SHIFT                                                                       0x0
+#define IH_RB_WPTR_ADDR_HI__ADDR_MASK                                                                         0x0000FFFFL
+//IH_RB_WPTR_ADDR_LO
+#define IH_RB_WPTR_ADDR_LO__ADDR__SHIFT                                                                       0x2
+#define IH_RB_WPTR_ADDR_LO__ADDR_MASK                                                                         0xFFFFFFFCL
+//IH_DOORBELL_RPTR
+#define IH_DOORBELL_RPTR__OFFSET__SHIFT                                                                       0x0
+#define IH_DOORBELL_RPTR__ENABLE__SHIFT                                                                       0x1c
+#define IH_DOORBELL_RPTR__OFFSET_MASK                                                                         0x03FFFFFFL
+#define IH_DOORBELL_RPTR__ENABLE_MASK                                                                         0x10000000L
+//IH_DOORBELL_RETRY_CAM
+#define IH_DOORBELL_RETRY_CAM__OFFSET__SHIFT                                                                  0x0
+#define IH_DOORBELL_RETRY_CAM__ENABLE__SHIFT                                                                  0x1c
+#define IH_DOORBELL_RETRY_CAM__OFFSET_MASK                                                                    0x03FFFFFFL
+#define IH_DOORBELL_RETRY_CAM__ENABLE_MASK                                                                    0x10000000L
+//IH_RB_CNTL_RING1
+#define IH_RB_CNTL_RING1__RB_ENABLE__SHIFT                                                                    0x0
+#define IH_RB_CNTL_RING1__RB_SIZE__SHIFT                                                                      0x1
+#define IH_RB_CNTL_RING1__RB_FULL_DRAIN_ENABLE__SHIFT                                                         0x9
+#define IH_RB_CNTL_RING1__FULL_DRAIN_CLEAR__SHIFT                                                             0xa
+#define IH_RB_CNTL_RING1__PAGE_RB_CLEAR__SHIFT                                                                0xb
+#define IH_RB_CNTL_RING1__RB_USED_INT_THRESHOLD__SHIFT                                                        0xc
+#define IH_RB_CNTL_RING1__WPTR_OVERFLOW_ENABLE__SHIFT                                                         0x10
+#define IH_RB_CNTL_RING1__MC_SWAP__SHIFT                                                                      0x12
+#define IH_RB_CNTL_RING1__MC_SNOOP__SHIFT                                                                     0x14
+#define IH_RB_CNTL_RING1__MC_RO__SHIFT                                                                        0x16
+#define IH_RB_CNTL_RING1__MC_VMID__SHIFT                                                                      0x18
+#define IH_RB_CNTL_RING1__MC_SPACE__SHIFT                                                                     0x1c
+#define IH_RB_CNTL_RING1__WPTR_OVERFLOW_CLEAR__SHIFT                                                          0x1f
+#define IH_RB_CNTL_RING1__RB_ENABLE_MASK                                                                      0x00000001L
+#define IH_RB_CNTL_RING1__RB_SIZE_MASK                                                                        0x0000003EL
+#define IH_RB_CNTL_RING1__RB_FULL_DRAIN_ENABLE_MASK                                                           0x00000200L
+#define IH_RB_CNTL_RING1__FULL_DRAIN_CLEAR_MASK                                                               0x00000400L
+#define IH_RB_CNTL_RING1__PAGE_RB_CLEAR_MASK                                                                  0x00000800L
+#define IH_RB_CNTL_RING1__RB_USED_INT_THRESHOLD_MASK                                                          0x0000F000L
+#define IH_RB_CNTL_RING1__WPTR_OVERFLOW_ENABLE_MASK                                                           0x00010000L
+#define IH_RB_CNTL_RING1__MC_SWAP_MASK                                                                        0x000C0000L
+#define IH_RB_CNTL_RING1__MC_SNOOP_MASK                                                                       0x00100000L
+#define IH_RB_CNTL_RING1__MC_RO_MASK                                                                          0x00400000L
+#define IH_RB_CNTL_RING1__MC_VMID_MASK                                                                        0x0F000000L
+#define IH_RB_CNTL_RING1__MC_SPACE_MASK                                                                       0x70000000L
+#define IH_RB_CNTL_RING1__WPTR_OVERFLOW_CLEAR_MASK                                                            0x80000000L
+//IH_RB_RPTR_RING1
+#define IH_RB_RPTR_RING1__OFFSET__SHIFT                                                                       0x2
+#define IH_RB_RPTR_RING1__OFFSET_MASK                                                                         0x0003FFFCL
+//IH_RB_WPTR_RING1
+#define IH_RB_WPTR_RING1__RB_OVERFLOW__SHIFT                                                                  0x0
+#define IH_RB_WPTR_RING1__OFFSET__SHIFT                                                                       0x2
+#define IH_RB_WPTR_RING1__RB_LEFT_NONE__SHIFT                                                                 0x12
+#define IH_RB_WPTR_RING1__RB_MAY_OVERFLOW__SHIFT                                                              0x13
+#define IH_RB_WPTR_RING1__RB_OVERFLOW_MASK                                                                    0x00000001L
+#define IH_RB_WPTR_RING1__OFFSET_MASK                                                                         0x0003FFFCL
+#define IH_RB_WPTR_RING1__RB_LEFT_NONE_MASK                                                                   0x00040000L
+#define IH_RB_WPTR_RING1__RB_MAY_OVERFLOW_MASK                                                                0x00080000L
+//IH_RB_BASE_RING1
+#define IH_RB_BASE_RING1__ADDR__SHIFT                                                                         0x0
+#define IH_RB_BASE_RING1__ADDR_MASK                                                                           0xFFFFFFFFL
+//IH_RB_BASE_HI_RING1
+#define IH_RB_BASE_HI_RING1__ADDR__SHIFT                                                                      0x0
+#define IH_RB_BASE_HI_RING1__ADDR_MASK                                                                        0x000000FFL
+//IH_DOORBELL_RPTR_RING1
+#define IH_DOORBELL_RPTR_RING1__OFFSET__SHIFT                                                                 0x0
+#define IH_DOORBELL_RPTR_RING1__ENABLE__SHIFT                                                                 0x1c
+#define IH_DOORBELL_RPTR_RING1__OFFSET_MASK                                                                   0x03FFFFFFL
+#define IH_DOORBELL_RPTR_RING1__ENABLE_MASK                                                                   0x10000000L
+//IH_RETRY_CAM_ACK
+#define IH_RETRY_CAM_ACK__INDEX__SHIFT                                                                        0x0
+#define IH_RETRY_CAM_ACK__INDEX_MASK                                                                          0x000003FFL
+//IH_VERSION
+#define IH_VERSION__MINVER__SHIFT                                                                             0x0
+#define IH_VERSION__MAJVER__SHIFT                                                                             0x8
+#define IH_VERSION__REV__SHIFT                                                                                0x10
+#define IH_VERSION__MINVER_MASK                                                                               0x0000007FL
+#define IH_VERSION__MAJVER_MASK                                                                               0x00007F00L
+#define IH_VERSION__REV_MASK                                                                                  0x003F0000L
+//IH_CNTL
+#define IH_CNTL__WPTR_WRITEBACK_TIMER__SHIFT                                                                  0x0
+#define IH_CNTL__IH_IDLE_HYSTERESIS_CNTL__SHIFT                                                               0x6
+#define IH_CNTL__IH_FIFO_HIGHWATER__SHIFT                                                                     0x8
+#define IH_CNTL__MC_WR_CLEAN_CNT__SHIFT                                                                       0x14
+#define IH_CNTL__WPTR_WRITEBACK_TIMER_MASK                                                                    0x0000001FL
+#define IH_CNTL__IH_IDLE_HYSTERESIS_CNTL_MASK                                                                 0x000000C0L
+#define IH_CNTL__IH_FIFO_HIGHWATER_MASK                                                                       0x00007F00L
+#define IH_CNTL__MC_WR_CLEAN_CNT_MASK                                                                         0x01F00000L
+//IH_CLK_CTRL
+#define IH_CLK_CTRL__IH_PASID_LUT_MEM_CLK_SOFT_OVERRIDE__SHIFT                                                0x17
+#define IH_CLK_CTRL__MSI_STORM_COUNTER_CLK_SOFT_OVERRIDE__SHIFT                                               0x18
+#define IH_CLK_CTRL__IH_RETRY_INT_CAM_MEM_CLK_SOFT_OVERRIDE__SHIFT                                            0x19
+#define IH_CLK_CTRL__IH_BUFFER_MEM_CLK_SOFT_OVERRIDE__SHIFT                                                   0x1a
+#define IH_CLK_CTRL__DBUS_MUX_CLK_SOFT_OVERRIDE__SHIFT                                                        0x1b
+#define IH_CLK_CTRL__OSSSYS_SHARE_CLK_SOFT_OVERRIDE__SHIFT                                                    0x1c
+#define IH_CLK_CTRL__LIMIT_SMN_CLK_SOFT_OVERRIDE__SHIFT                                                       0x1d
+#define IH_CLK_CTRL__DYN_CLK_SOFT_OVERRIDE__SHIFT                                                             0x1e
+#define IH_CLK_CTRL__REG_CLK_SOFT_OVERRIDE__SHIFT                                                             0x1f
+#define IH_CLK_CTRL__IH_PASID_LUT_MEM_CLK_SOFT_OVERRIDE_MASK                                                  0x00800000L
+#define IH_CLK_CTRL__MSI_STORM_COUNTER_CLK_SOFT_OVERRIDE_MASK                                                 0x01000000L
+#define IH_CLK_CTRL__IH_RETRY_INT_CAM_MEM_CLK_SOFT_OVERRIDE_MASK                                              0x02000000L
+#define IH_CLK_CTRL__IH_BUFFER_MEM_CLK_SOFT_OVERRIDE_MASK                                                     0x04000000L
+#define IH_CLK_CTRL__DBUS_MUX_CLK_SOFT_OVERRIDE_MASK                                                          0x08000000L
+#define IH_CLK_CTRL__OSSSYS_SHARE_CLK_SOFT_OVERRIDE_MASK                                                      0x10000000L
+#define IH_CLK_CTRL__LIMIT_SMN_CLK_SOFT_OVERRIDE_MASK                                                         0x20000000L
+#define IH_CLK_CTRL__DYN_CLK_SOFT_OVERRIDE_MASK                                                               0x40000000L
+#define IH_CLK_CTRL__REG_CLK_SOFT_OVERRIDE_MASK                                                               0x80000000L
+//IH_STORM_CLIENT_LIST_CNTL
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT1_IS_STORM_CLIENT__SHIFT                                             0x1
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT2_IS_STORM_CLIENT__SHIFT                                             0x2
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT3_IS_STORM_CLIENT__SHIFT                                             0x3
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT4_IS_STORM_CLIENT__SHIFT                                             0x4
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT5_IS_STORM_CLIENT__SHIFT                                             0x5
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT6_IS_STORM_CLIENT__SHIFT                                             0x6
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT7_IS_STORM_CLIENT__SHIFT                                             0x7
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT8_IS_STORM_CLIENT__SHIFT                                             0x8
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT9_IS_STORM_CLIENT__SHIFT                                             0x9
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT10_IS_STORM_CLIENT__SHIFT                                            0xa
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT11_IS_STORM_CLIENT__SHIFT                                            0xb
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT12_IS_STORM_CLIENT__SHIFT                                            0xc
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT13_IS_STORM_CLIENT__SHIFT                                            0xd
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT14_IS_STORM_CLIENT__SHIFT                                            0xe
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT15_IS_STORM_CLIENT__SHIFT                                            0xf
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT16_IS_STORM_CLIENT__SHIFT                                            0x10
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT17_IS_STORM_CLIENT__SHIFT                                            0x11
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT18_IS_STORM_CLIENT__SHIFT                                            0x12
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT19_IS_STORM_CLIENT__SHIFT                                            0x13
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT20_IS_STORM_CLIENT__SHIFT                                            0x14
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT21_IS_STORM_CLIENT__SHIFT                                            0x15
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT22_IS_STORM_CLIENT__SHIFT                                            0x16
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT23_IS_STORM_CLIENT__SHIFT                                            0x17
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT24_IS_STORM_CLIENT__SHIFT                                            0x18
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT25_IS_STORM_CLIENT__SHIFT                                            0x19
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT26_IS_STORM_CLIENT__SHIFT                                            0x1a
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT27_IS_STORM_CLIENT__SHIFT                                            0x1b
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT28_IS_STORM_CLIENT__SHIFT                                            0x1c
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT29_IS_STORM_CLIENT__SHIFT                                            0x1d
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT30_IS_STORM_CLIENT__SHIFT                                            0x1e
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT31_IS_STORM_CLIENT__SHIFT                                            0x1f
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT1_IS_STORM_CLIENT_MASK                                               0x00000002L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT2_IS_STORM_CLIENT_MASK                                               0x00000004L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT3_IS_STORM_CLIENT_MASK                                               0x00000008L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT4_IS_STORM_CLIENT_MASK                                               0x00000010L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT5_IS_STORM_CLIENT_MASK                                               0x00000020L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT6_IS_STORM_CLIENT_MASK                                               0x00000040L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT7_IS_STORM_CLIENT_MASK                                               0x00000080L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT8_IS_STORM_CLIENT_MASK                                               0x00000100L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT9_IS_STORM_CLIENT_MASK                                               0x00000200L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT10_IS_STORM_CLIENT_MASK                                              0x00000400L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT11_IS_STORM_CLIENT_MASK                                              0x00000800L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT12_IS_STORM_CLIENT_MASK                                              0x00001000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT13_IS_STORM_CLIENT_MASK                                              0x00002000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT14_IS_STORM_CLIENT_MASK                                              0x00004000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT15_IS_STORM_CLIENT_MASK                                              0x00008000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT16_IS_STORM_CLIENT_MASK                                              0x00010000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT17_IS_STORM_CLIENT_MASK                                              0x00020000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT18_IS_STORM_CLIENT_MASK                                              0x00040000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT19_IS_STORM_CLIENT_MASK                                              0x00080000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT20_IS_STORM_CLIENT_MASK                                              0x00100000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT21_IS_STORM_CLIENT_MASK                                              0x00200000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT22_IS_STORM_CLIENT_MASK                                              0x00400000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT23_IS_STORM_CLIENT_MASK                                              0x00800000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT24_IS_STORM_CLIENT_MASK                                              0x01000000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT25_IS_STORM_CLIENT_MASK                                              0x02000000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT26_IS_STORM_CLIENT_MASK                                              0x04000000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT27_IS_STORM_CLIENT_MASK                                              0x08000000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT28_IS_STORM_CLIENT_MASK                                              0x10000000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT29_IS_STORM_CLIENT_MASK                                              0x20000000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT30_IS_STORM_CLIENT_MASK                                              0x40000000L
+#define IH_STORM_CLIENT_LIST_CNTL__CLIENT31_IS_STORM_CLIENT_MASK                                              0x80000000L
+//IH_LIMIT_INT_RATE_CNTL
+#define IH_LIMIT_INT_RATE_CNTL__LIMIT_ENABLE__SHIFT                                                           0x0
+#define IH_LIMIT_INT_RATE_CNTL__PERF_INTERVAL__SHIFT                                                          0x1
+#define IH_LIMIT_INT_RATE_CNTL__PERF_THRESHOLD__SHIFT                                                         0x5
+#define IH_LIMIT_INT_RATE_CNTL__RETURN_DELAY__SHIFT                                                           0x11
+#define IH_LIMIT_INT_RATE_CNTL__PERF_RESULT__SHIFT                                                            0x15
+#define IH_LIMIT_INT_RATE_CNTL__LIMIT_ENABLE_MASK                                                             0x00000001L
+#define IH_LIMIT_INT_RATE_CNTL__PERF_INTERVAL_MASK                                                            0x0000001EL
+#define IH_LIMIT_INT_RATE_CNTL__PERF_THRESHOLD_MASK                                                           0x0000FFE0L
+#define IH_LIMIT_INT_RATE_CNTL__RETURN_DELAY_MASK                                                             0x001E0000L
+#define IH_LIMIT_INT_RATE_CNTL__PERF_RESULT_MASK                                                              0xFFE00000L
+//IH_RETRY_INT_CAM_CNTL
+#define IH_RETRY_INT_CAM_CNTL__CAM_SIZE__SHIFT                                                                0x0
+#define IH_RETRY_INT_CAM_CNTL__BACK_PRESSURE_SKID_VALUE__SHIFT                                                0x8
+#define IH_RETRY_INT_CAM_CNTL__PER_VF_ENTRY_SIZE__SHIFT                                                       0x14
+#define IH_RETRY_INT_CAM_CNTL__CAM_SIZE_MASK                                                                  0x0000001FL
+#define IH_RETRY_INT_CAM_CNTL__BACK_PRESSURE_SKID_VALUE_MASK                                                  0x00003F00L
+#define IH_RETRY_INT_CAM_CNTL__PER_VF_ENTRY_SIZE_MASK                                                         0x00300000L
+//IH_MEM_POWER_CTRL
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_CTRL_EN__SHIFT                                                 0x0
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_LS_EN__SHIFT                                                   0x1
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_DS_EN__SHIFT                                                   0x2
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_SD_EN__SHIFT                                                   0x3
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_IDLE_HYSTERESIS__SHIFT                                               0x4
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_UP_RECOVER_DELAY__SHIFT                                        0x8
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_DOWN_ENTER_DELAY__SHIFT                                        0xe
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_CTRL_EN__SHIFT                                          0x10
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_LS_EN__SHIFT                                            0x11
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_DS_EN__SHIFT                                            0x12
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_SD_EN__SHIFT                                            0x13
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_IDLE_HYSTERESIS__SHIFT                                        0x14
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_UP_RECOVER_DELAY__SHIFT                                 0x18
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_DOWN_ENTER_DELAY__SHIFT                                 0x1e
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_CTRL_EN_MASK                                                   0x00000001L
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_LS_EN_MASK                                                     0x00000002L
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_DS_EN_MASK                                                     0x00000004L
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_SD_EN_MASK                                                     0x00000008L
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_IDLE_HYSTERESIS_MASK                                                 0x00000070L
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_UP_RECOVER_DELAY_MASK                                          0x00003F00L
+#define IH_MEM_POWER_CTRL__IH_BUFFER_MEM_POWER_DOWN_ENTER_DELAY_MASK                                          0x0000C000L
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_CTRL_EN_MASK                                            0x00010000L
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_LS_EN_MASK                                              0x00020000L
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_DS_EN_MASK                                              0x00040000L
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_SD_EN_MASK                                              0x00080000L
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_IDLE_HYSTERESIS_MASK                                          0x00700000L
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_UP_RECOVER_DELAY_MASK                                   0x3F000000L
+#define IH_MEM_POWER_CTRL__IH_RETRY_INT_CAM_MEM_POWER_DOWN_ENTER_DELAY_MASK                                   0xC0000000L
+//IH_MEM_POWER_CTRL2
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_CTRL_EN__SHIFT                                             0x0
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_LS_EN__SHIFT                                               0x1
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_DS_EN__SHIFT                                               0x2
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_SD_EN__SHIFT                                               0x3
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_IDLE_HYSTERESIS__SHIFT                                           0x4
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_UP_RECOVER_DELAY__SHIFT                                    0x8
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_DOWN_ENTER_DELAY__SHIFT                                    0xe
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_CTRL_EN_MASK                                               0x00000001L
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_LS_EN_MASK                                                 0x00000002L
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_DS_EN_MASK                                                 0x00000004L
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_SD_EN_MASK                                                 0x00000008L
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_IDLE_HYSTERESIS_MASK                                             0x00000070L
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_UP_RECOVER_DELAY_MASK                                      0x00003F00L
+#define IH_MEM_POWER_CTRL2__IH_PASID_LUT_MEM_POWER_DOWN_ENTER_DELAY_MASK                                      0x0000C000L
+//IH_CNTL2
+#define IH_CNTL2__SELF_IV_FORCE_WPTR_UPDATE_TIMEOUT__SHIFT                                                    0x0
+#define IH_CNTL2__SELF_IV_FORCE_WPTR_UPDATE_ENABLE__SHIFT                                                     0x8
+#define IH_CNTL2__SELF_IV_FORCE_WPTR_UPDATE_TIMEOUT_MASK                                                      0x0000001FL
+#define IH_CNTL2__SELF_IV_FORCE_WPTR_UPDATE_ENABLE_MASK                                                       0x00000100L
+//IH_STATUS
+#define IH_STATUS__IDLE__SHIFT                                                                                0x0
+#define IH_STATUS__INPUT_IDLE__SHIFT                                                                          0x1
+#define IH_STATUS__BUFFER_IDLE__SHIFT                                                                         0x2
+#define IH_STATUS__RB_FULL__SHIFT                                                                             0x3
+#define IH_STATUS__RB_FULL_DRAIN__SHIFT                                                                       0x4
+#define IH_STATUS__RB_OVERFLOW__SHIFT                                                                         0x5
+#define IH_STATUS__MC_WR_IDLE__SHIFT                                                                          0x6
+#define IH_STATUS__MC_WR_STALL__SHIFT                                                                         0x7
+#define IH_STATUS__MC_WR_CLEAN_PENDING__SHIFT                                                                 0x8
+#define IH_STATUS__MC_WR_CLEAN_STALL__SHIFT                                                                   0x9
+#define IH_STATUS__BIF_INTERRUPT_LINE__SHIFT                                                                  0xa
+#define IH_STATUS__SWITCH_READY__SHIFT                                                                        0xb
+#define IH_STATUS__RB1_FULL__SHIFT                                                                            0xc
+#define IH_STATUS__RB1_FULL_DRAIN__SHIFT                                                                      0xd
+#define IH_STATUS__RB1_OVERFLOW__SHIFT                                                                        0xe
+#define IH_STATUS__SELF_INT_GEN_IDLE__SHIFT                                                                   0x12
+#define IH_STATUS__RETRY_INT_CAM_IDLE__SHIFT                                                                  0x13
+#define IH_STATUS__ZSTATES_FENCE__SHIFT                                                                       0x14
+#define IH_STATUS__IH_BUFFER_MEM_POWER_GATED__SHIFT                                                           0x15
+#define IH_STATUS__IH_RETRY_INT_CAM_MEM_POWER_GATED__SHIFT                                                    0x16
+#define IH_STATUS__IH_PASID_LUT_MEM_POWER_GATED__SHIFT                                                        0x17
+#define IH_STATUS__IDLE_MASK                                                                                  0x00000001L
+#define IH_STATUS__INPUT_IDLE_MASK                                                                            0x00000002L
+#define IH_STATUS__BUFFER_IDLE_MASK                                                                           0x00000004L
+#define IH_STATUS__RB_FULL_MASK                                                                               0x00000008L
+#define IH_STATUS__RB_FULL_DRAIN_MASK                                                                         0x00000010L
+#define IH_STATUS__RB_OVERFLOW_MASK                                                                           0x00000020L
+#define IH_STATUS__MC_WR_IDLE_MASK                                                                            0x00000040L
+#define IH_STATUS__MC_WR_STALL_MASK                                                                           0x00000080L
+#define IH_STATUS__MC_WR_CLEAN_PENDING_MASK                                                                   0x00000100L
+#define IH_STATUS__MC_WR_CLEAN_STALL_MASK                                                                     0x00000200L
+#define IH_STATUS__BIF_INTERRUPT_LINE_MASK                                                                    0x00000400L
+#define IH_STATUS__SWITCH_READY_MASK                                                                          0x00000800L
+#define IH_STATUS__RB1_FULL_MASK                                                                              0x00001000L
+#define IH_STATUS__RB1_FULL_DRAIN_MASK                                                                        0x00002000L
+#define IH_STATUS__RB1_OVERFLOW_MASK                                                                          0x00004000L
+#define IH_STATUS__SELF_INT_GEN_IDLE_MASK                                                                     0x00040000L
+#define IH_STATUS__RETRY_INT_CAM_IDLE_MASK                                                                    0x00080000L
+#define IH_STATUS__ZSTATES_FENCE_MASK                                                                         0x00100000L
+#define IH_STATUS__IH_BUFFER_MEM_POWER_GATED_MASK                                                             0x00200000L
+#define IH_STATUS__IH_RETRY_INT_CAM_MEM_POWER_GATED_MASK                                                      0x00400000L
+#define IH_STATUS__IH_PASID_LUT_MEM_POWER_GATED_MASK                                                          0x00800000L
+//IH_PERFMON_CNTL
+#define IH_PERFMON_CNTL__ENABLE0__SHIFT                                                                       0x0
+#define IH_PERFMON_CNTL__CLEAR0__SHIFT                                                                        0x1
+#define IH_PERFMON_CNTL__PERF_SEL0__SHIFT                                                                     0x2
+#define IH_PERFMON_CNTL__ENABLE1__SHIFT                                                                       0x10
+#define IH_PERFMON_CNTL__CLEAR1__SHIFT                                                                        0x11
+#define IH_PERFMON_CNTL__PERF_SEL1__SHIFT                                                                     0x12
+#define IH_PERFMON_CNTL__ENABLE0_MASK                                                                         0x00000001L
+#define IH_PERFMON_CNTL__CLEAR0_MASK                                                                          0x00000002L
+#define IH_PERFMON_CNTL__PERF_SEL0_MASK                                                                       0x00000FFCL
+#define IH_PERFMON_CNTL__ENABLE1_MASK                                                                         0x00010000L
+#define IH_PERFMON_CNTL__CLEAR1_MASK                                                                          0x00020000L
+#define IH_PERFMON_CNTL__PERF_SEL1_MASK                                                                       0x0FFC0000L
+//IH_PERFCOUNTER0_RESULT
+#define IH_PERFCOUNTER0_RESULT__PERF_COUNT__SHIFT                                                             0x0
+#define IH_PERFCOUNTER0_RESULT__PERF_COUNT_MASK                                                               0xFFFFFFFFL
+//IH_PERFCOUNTER1_RESULT
+#define IH_PERFCOUNTER1_RESULT__PERF_COUNT__SHIFT                                                             0x0
+#define IH_PERFCOUNTER1_RESULT__PERF_COUNT_MASK                                                               0xFFFFFFFFL
+//IH_DSM_MATCH_VALUE_BIT_31_0
+#define IH_DSM_MATCH_VALUE_BIT_31_0__VALUE__SHIFT                                                             0x0
+#define IH_DSM_MATCH_VALUE_BIT_31_0__VALUE_MASK                                                               0xFFFFFFFFL
+//IH_DSM_MATCH_VALUE_BIT_63_32
+#define IH_DSM_MATCH_VALUE_BIT_63_32__VALUE__SHIFT                                                            0x0
+#define IH_DSM_MATCH_VALUE_BIT_63_32__VALUE_MASK                                                              0xFFFFFFFFL
+//IH_DSM_MATCH_VALUE_BIT_95_64
+#define IH_DSM_MATCH_VALUE_BIT_95_64__VALUE__SHIFT                                                            0x0
+#define IH_DSM_MATCH_VALUE_BIT_95_64__VALUE_MASK                                                              0xFFFFFFFFL
+//IH_DSM_MATCH_FIELD_CONTROL
+#define IH_DSM_MATCH_FIELD_CONTROL__SRC_EN__SHIFT                                                             0x0
+#define IH_DSM_MATCH_FIELD_CONTROL__FCNID_EN__SHIFT                                                           0x1
+#define IH_DSM_MATCH_FIELD_CONTROL__TIMESTAMP_EN__SHIFT                                                       0x2
+#define IH_DSM_MATCH_FIELD_CONTROL__RINGID_EN__SHIFT                                                          0x3
+#define IH_DSM_MATCH_FIELD_CONTROL__VMID_EN__SHIFT                                                            0x4
+#define IH_DSM_MATCH_FIELD_CONTROL__PASID_EN__SHIFT                                                           0x5
+#define IH_DSM_MATCH_FIELD_CONTROL__CLIENT_ID_EN__SHIFT                                                       0x6
+#define IH_DSM_MATCH_FIELD_CONTROL__SRC_EN_MASK                                                               0x00000001L
+#define IH_DSM_MATCH_FIELD_CONTROL__FCNID_EN_MASK                                                             0x00000002L
+#define IH_DSM_MATCH_FIELD_CONTROL__TIMESTAMP_EN_MASK                                                         0x00000004L
+#define IH_DSM_MATCH_FIELD_CONTROL__RINGID_EN_MASK                                                            0x00000008L
+#define IH_DSM_MATCH_FIELD_CONTROL__VMID_EN_MASK                                                              0x00000010L
+#define IH_DSM_MATCH_FIELD_CONTROL__PASID_EN_MASK                                                             0x00000020L
+#define IH_DSM_MATCH_FIELD_CONTROL__CLIENT_ID_EN_MASK                                                         0x00000040L
+//IH_DSM_MATCH_DATA_CONTROL
+#define IH_DSM_MATCH_DATA_CONTROL__VALUE__SHIFT                                                               0x0
+#define IH_DSM_MATCH_DATA_CONTROL__VALUE_MASK                                                                 0x0FFFFFFFL
+//IH_DSM_MATCH_FCN_ID
+#define IH_DSM_MATCH_FCN_ID__VF_ID__SHIFT                                                                     0x0
+#define IH_DSM_MATCH_FCN_ID__PF_VF__SHIFT                                                                     0x7
+#define IH_DSM_MATCH_FCN_ID__VF_ID_MASK                                                                       0x0000000FL
+#define IH_DSM_MATCH_FCN_ID__PF_VF_MASK                                                                       0x00000080L
+//IH_VF_RB_STATUS
+#define IH_VF_RB_STATUS__RB_FULL_DRAIN_VF__SHIFT                                                              0x0
+#define IH_VF_RB_STATUS__RB_FULL_DRAIN_VF_MASK                                                                0x0000FFFFL
+//IH_VF_RB_STATUS2
+#define IH_VF_RB_STATUS2__RB_FULL_VF__SHIFT                                                                   0x0
+#define IH_VF_RB_STATUS2__RB_FULL_VF_MASK                                                                     0x0000FFFFL
+//IH_VF_RB1_STATUS
+#define IH_VF_RB1_STATUS__RB_FULL_DRAIN_VF__SHIFT                                                             0x0
+#define IH_VF_RB1_STATUS__RB_FULL_DRAIN_VF_MASK                                                               0x0000FFFFL
+//IH_VF_RB1_STATUS2
+#define IH_VF_RB1_STATUS2__RB_FULL_VF__SHIFT                                                                  0x0
+#define IH_VF_RB1_STATUS2__RB_FULL_VF_MASK                                                                    0x0000FFFFL
+//IH_RB_STATUS
+#define IH_RB_STATUS__RB_FULL__SHIFT                                                                          0x0
+#define IH_RB_STATUS__RB_FULL_DRAIN__SHIFT                                                                    0x1
+#define IH_RB_STATUS__RB_OVERFLOW__SHIFT                                                                      0x2
+#define IH_RB_STATUS__RB1_FULL__SHIFT                                                                         0x4
+#define IH_RB_STATUS__RB1_FULL_DRAIN__SHIFT                                                                   0x5
+#define IH_RB_STATUS__RB1_OVERFLOW__SHIFT                                                                     0x6
+#define IH_RB_STATUS__RB_FULL_MASK                                                                            0x00000001L
+#define IH_RB_STATUS__RB_FULL_DRAIN_MASK                                                                      0x00000002L
+#define IH_RB_STATUS__RB_OVERFLOW_MASK                                                                        0x00000004L
+#define IH_RB_STATUS__RB1_FULL_MASK                                                                           0x00000010L
+#define IH_RB_STATUS__RB1_FULL_DRAIN_MASK                                                                     0x00000020L
+#define IH_RB_STATUS__RB1_OVERFLOW_MASK                                                                       0x00000040L
+//IH_INT_FLOOD_CNTL
+#define IH_INT_FLOOD_CNTL__HIGHWATER__SHIFT                                                                   0x0
+#define IH_INT_FLOOD_CNTL__FLOOD_CNTL_ENABLE__SHIFT                                                           0x3
+#define IH_INT_FLOOD_CNTL__CLEAR_INT_FLOOD_STATUS__SHIFT                                                      0x4
+#define IH_INT_FLOOD_CNTL__HIGHWATER_MASK                                                                     0x00000007L
+#define IH_INT_FLOOD_CNTL__FLOOD_CNTL_ENABLE_MASK                                                             0x00000008L
+#define IH_INT_FLOOD_CNTL__CLEAR_INT_FLOOD_STATUS_MASK                                                        0x00000010L
+//IH_RB0_INT_FLOOD_STATUS
+#define IH_RB0_INT_FLOOD_STATUS__RB_INT_DROPPED_VF__SHIFT                                                     0x0
+#define IH_RB0_INT_FLOOD_STATUS__RB_INT_DROPPED__SHIFT                                                        0x1f
+#define IH_RB0_INT_FLOOD_STATUS__RB_INT_DROPPED_VF_MASK                                                       0x0000FFFFL
+#define IH_RB0_INT_FLOOD_STATUS__RB_INT_DROPPED_MASK                                                          0x80000000L
+//IH_RB1_INT_FLOOD_STATUS
+#define IH_RB1_INT_FLOOD_STATUS__RB_INT_DROPPED_VF__SHIFT                                                     0x0
+#define IH_RB1_INT_FLOOD_STATUS__RB_INT_DROPPED__SHIFT                                                        0x1f
+#define IH_RB1_INT_FLOOD_STATUS__RB_INT_DROPPED_VF_MASK                                                       0x0000FFFFL
+#define IH_RB1_INT_FLOOD_STATUS__RB_INT_DROPPED_MASK                                                          0x80000000L
+//IH_INT_FLOOD_STATUS
+#define IH_INT_FLOOD_STATUS__INT_DROP_CNT__SHIFT                                                              0x0
+#define IH_INT_FLOOD_STATUS__FIRST_DROP_INT_CLIENT_ID__SHIFT                                                  0x8
+#define IH_INT_FLOOD_STATUS__FIRST_DROP_INT_SOURCE_ID__SHIFT                                                  0x10
+#define IH_INT_FLOOD_STATUS__FIRST_DROP_INT_VF_ID__SHIFT                                                      0x18
+#define IH_INT_FLOOD_STATUS__FIRST_DROP_INT_VF__SHIFT                                                         0x1d
+#define IH_INT_FLOOD_STATUS__INT_DROPPED__SHIFT                                                               0x1e
+#define IH_INT_FLOOD_STATUS__INT_DROP_CNT_MASK                                                                0x000000FFL
+#define IH_INT_FLOOD_STATUS__FIRST_DROP_INT_CLIENT_ID_MASK                                                    0x0000FF00L
+#define IH_INT_FLOOD_STATUS__FIRST_DROP_INT_SOURCE_ID_MASK                                                    0x00FF0000L
+#define IH_INT_FLOOD_STATUS__FIRST_DROP_INT_VF_ID_MASK                                                        0x0F000000L
+#define IH_INT_FLOOD_STATUS__FIRST_DROP_INT_VF_MASK                                                           0x20000000L
+#define IH_INT_FLOOD_STATUS__INT_DROPPED_MASK                                                                 0x40000000L
+//IH_INT_FLAGS
+#define IH_INT_FLAGS__CLIENT_0_FLAG__SHIFT                                                                    0x0
+#define IH_INT_FLAGS__CLIENT_1_FLAG__SHIFT                                                                    0x1
+#define IH_INT_FLAGS__CLIENT_2_FLAG__SHIFT                                                                    0x2
+#define IH_INT_FLAGS__CLIENT_3_FLAG__SHIFT                                                                    0x3
+#define IH_INT_FLAGS__CLIENT_4_FLAG__SHIFT                                                                    0x4
+#define IH_INT_FLAGS__CLIENT_5_FLAG__SHIFT                                                                    0x5
+#define IH_INT_FLAGS__CLIENT_6_FLAG__SHIFT                                                                    0x6
+#define IH_INT_FLAGS__CLIENT_7_FLAG__SHIFT                                                                    0x7
+#define IH_INT_FLAGS__CLIENT_8_FLAG__SHIFT                                                                    0x8
+#define IH_INT_FLAGS__CLIENT_9_FLAG__SHIFT                                                                    0x9
+#define IH_INT_FLAGS__CLIENT_10_FLAG__SHIFT                                                                   0xa
+#define IH_INT_FLAGS__CLIENT_11_FLAG__SHIFT                                                                   0xb
+#define IH_INT_FLAGS__CLIENT_12_FLAG__SHIFT                                                                   0xc
+#define IH_INT_FLAGS__CLIENT_13_FLAG__SHIFT                                                                   0xd
+#define IH_INT_FLAGS__CLIENT_14_FLAG__SHIFT                                                                   0xe
+#define IH_INT_FLAGS__CLIENT_15_FLAG__SHIFT                                                                   0xf
+#define IH_INT_FLAGS__CLIENT_16_FLAG__SHIFT                                                                   0x10
+#define IH_INT_FLAGS__CLIENT_17_FLAG__SHIFT                                                                   0x11
+#define IH_INT_FLAGS__CLIENT_18_FLAG__SHIFT                                                                   0x12
+#define IH_INT_FLAGS__CLIENT_19_FLAG__SHIFT                                                                   0x13
+#define IH_INT_FLAGS__CLIENT_20_FLAG__SHIFT                                                                   0x14
+#define IH_INT_FLAGS__CLIENT_21_FLAG__SHIFT                                                                   0x15
+#define IH_INT_FLAGS__CLIENT_22_FLAG__SHIFT                                                                   0x16
+#define IH_INT_FLAGS__CLIENT_23_FLAG__SHIFT                                                                   0x17
+#define IH_INT_FLAGS__CLIENT_24_FLAG__SHIFT                                                                   0x18
+#define IH_INT_FLAGS__CLIENT_25_FLAG__SHIFT                                                                   0x19
+#define IH_INT_FLAGS__CLIENT_26_FLAG__SHIFT                                                                   0x1a
+#define IH_INT_FLAGS__CLIENT_27_FLAG__SHIFT                                                                   0x1b
+#define IH_INT_FLAGS__CLIENT_28_FLAG__SHIFT                                                                   0x1c
+#define IH_INT_FLAGS__CLIENT_29_FLAG__SHIFT                                                                   0x1d
+#define IH_INT_FLAGS__CLIENT_30_FLAG__SHIFT                                                                   0x1e
+#define IH_INT_FLAGS__CLIENT_31_FLAG__SHIFT                                                                   0x1f
+#define IH_INT_FLAGS__CLIENT_0_FLAG_MASK                                                                      0x00000001L
+#define IH_INT_FLAGS__CLIENT_1_FLAG_MASK                                                                      0x00000002L
+#define IH_INT_FLAGS__CLIENT_2_FLAG_MASK                                                                      0x00000004L
+#define IH_INT_FLAGS__CLIENT_3_FLAG_MASK                                                                      0x00000008L
+#define IH_INT_FLAGS__CLIENT_4_FLAG_MASK                                                                      0x00000010L
+#define IH_INT_FLAGS__CLIENT_5_FLAG_MASK                                                                      0x00000020L
+#define IH_INT_FLAGS__CLIENT_6_FLAG_MASK                                                                      0x00000040L
+#define IH_INT_FLAGS__CLIENT_7_FLAG_MASK                                                                      0x00000080L
+#define IH_INT_FLAGS__CLIENT_8_FLAG_MASK                                                                      0x00000100L
+#define IH_INT_FLAGS__CLIENT_9_FLAG_MASK                                                                      0x00000200L
+#define IH_INT_FLAGS__CLIENT_10_FLAG_MASK                                                                     0x00000400L
+#define IH_INT_FLAGS__CLIENT_11_FLAG_MASK                                                                     0x00000800L
+#define IH_INT_FLAGS__CLIENT_12_FLAG_MASK                                                                     0x00001000L
+#define IH_INT_FLAGS__CLIENT_13_FLAG_MASK                                                                     0x00002000L
+#define IH_INT_FLAGS__CLIENT_14_FLAG_MASK                                                                     0x00004000L
+#define IH_INT_FLAGS__CLIENT_15_FLAG_MASK                                                                     0x00008000L
+#define IH_INT_FLAGS__CLIENT_16_FLAG_MASK                                                                     0x00010000L
+#define IH_INT_FLAGS__CLIENT_17_FLAG_MASK                                                                     0x00020000L
+#define IH_INT_FLAGS__CLIENT_18_FLAG_MASK                                                                     0x00040000L
+#define IH_INT_FLAGS__CLIENT_19_FLAG_MASK                                                                     0x00080000L
+#define IH_INT_FLAGS__CLIENT_20_FLAG_MASK                                                                     0x00100000L
+#define IH_INT_FLAGS__CLIENT_21_FLAG_MASK                                                                     0x00200000L
+#define IH_INT_FLAGS__CLIENT_22_FLAG_MASK                                                                     0x00400000L
+#define IH_INT_FLAGS__CLIENT_23_FLAG_MASK                                                                     0x00800000L
+#define IH_INT_FLAGS__CLIENT_24_FLAG_MASK                                                                     0x01000000L
+#define IH_INT_FLAGS__CLIENT_25_FLAG_MASK                                                                     0x02000000L
+#define IH_INT_FLAGS__CLIENT_26_FLAG_MASK                                                                     0x04000000L
+#define IH_INT_FLAGS__CLIENT_27_FLAG_MASK                                                                     0x08000000L
+#define IH_INT_FLAGS__CLIENT_28_FLAG_MASK                                                                     0x10000000L
+#define IH_INT_FLAGS__CLIENT_29_FLAG_MASK                                                                     0x20000000L
+#define IH_INT_FLAGS__CLIENT_30_FLAG_MASK                                                                     0x40000000L
+#define IH_INT_FLAGS__CLIENT_31_FLAG_MASK                                                                     0x80000000L
+//IH_LAST_INT_INFO0
+#define IH_LAST_INT_INFO0__CLIENT_ID__SHIFT                                                                   0x0
+#define IH_LAST_INT_INFO0__SOURCE_ID__SHIFT                                                                   0x8
+#define IH_LAST_INT_INFO0__RING_ID__SHIFT                                                                     0x10
+#define IH_LAST_INT_INFO0__VM_ID__SHIFT                                                                       0x18
+#define IH_LAST_INT_INFO0__VMID_TYPE__SHIFT                                                                   0x1f
+#define IH_LAST_INT_INFO0__CLIENT_ID_MASK                                                                     0x000000FFL
+#define IH_LAST_INT_INFO0__SOURCE_ID_MASK                                                                     0x0000FF00L
+#define IH_LAST_INT_INFO0__RING_ID_MASK                                                                       0x00FF0000L
+#define IH_LAST_INT_INFO0__VM_ID_MASK                                                                         0x0F000000L
+#define IH_LAST_INT_INFO0__VMID_TYPE_MASK                                                                     0x80000000L
+//IH_LAST_INT_INFO1
+#define IH_LAST_INT_INFO1__CONTEXT_ID__SHIFT                                                                  0x0
+#define IH_LAST_INT_INFO1__CONTEXT_ID_MASK                                                                    0xFFFFFFFFL
+//IH_LAST_INT_INFO2
+#define IH_LAST_INT_INFO2__PAS_ID__SHIFT                                                                      0x0
+#define IH_LAST_INT_INFO2__VF_ID__SHIFT                                                                       0x10
+#define IH_LAST_INT_INFO2__VF__SHIFT                                                                          0x17
+#define IH_LAST_INT_INFO2__PAS_ID_MASK                                                                        0x0000FFFFL
+#define IH_LAST_INT_INFO2__VF_ID_MASK                                                                         0x000F0000L
+#define IH_LAST_INT_INFO2__VF_MASK                                                                            0x00800000L
+//IH_SCRATCH
+#define IH_SCRATCH__DATA__SHIFT                                                                               0x0
+#define IH_SCRATCH__DATA_MASK                                                                                 0xFFFFFFFFL
+//IH_CLIENT_CREDIT_ERROR
+#define IH_CLIENT_CREDIT_ERROR__CLEAR__SHIFT                                                                  0x0
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_1_ERROR__SHIFT                                                         0x1
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_2_ERROR__SHIFT                                                         0x2
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_3_ERROR__SHIFT                                                         0x3
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_4_ERROR__SHIFT                                                         0x4
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_5_ERROR__SHIFT                                                         0x5
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_6_ERROR__SHIFT                                                         0x6
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_7_ERROR__SHIFT                                                         0x7
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_8_ERROR__SHIFT                                                         0x8
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_9_ERROR__SHIFT                                                         0x9
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_10_ERROR__SHIFT                                                        0xa
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_11_ERROR__SHIFT                                                        0xb
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_12_ERROR__SHIFT                                                        0xc
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_13_ERROR__SHIFT                                                        0xd
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_14_ERROR__SHIFT                                                        0xe
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_15_ERROR__SHIFT                                                        0xf
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_16_ERROR__SHIFT                                                        0x10
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_17_ERROR__SHIFT                                                        0x11
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_18_ERROR__SHIFT                                                        0x12
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_19_ERROR__SHIFT                                                        0x13
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_20_ERROR__SHIFT                                                        0x14
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_21_ERROR__SHIFT                                                        0x15
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_22_ERROR__SHIFT                                                        0x16
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_23_ERROR__SHIFT                                                        0x17
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_24_ERROR__SHIFT                                                        0x18
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_25_ERROR__SHIFT                                                        0x19
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_26_ERROR__SHIFT                                                        0x1a
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_27_ERROR__SHIFT                                                        0x1b
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_28_ERROR__SHIFT                                                        0x1c
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_29_ERROR__SHIFT                                                        0x1d
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_30_ERROR__SHIFT                                                        0x1e
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_31_ERROR__SHIFT                                                        0x1f
+#define IH_CLIENT_CREDIT_ERROR__CLEAR_MASK                                                                    0x00000001L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_1_ERROR_MASK                                                           0x00000002L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_2_ERROR_MASK                                                           0x00000004L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_3_ERROR_MASK                                                           0x00000008L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_4_ERROR_MASK                                                           0x00000010L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_5_ERROR_MASK                                                           0x00000020L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_6_ERROR_MASK                                                           0x00000040L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_7_ERROR_MASK                                                           0x00000080L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_8_ERROR_MASK                                                           0x00000100L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_9_ERROR_MASK                                                           0x00000200L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_10_ERROR_MASK                                                          0x00000400L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_11_ERROR_MASK                                                          0x00000800L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_12_ERROR_MASK                                                          0x00001000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_13_ERROR_MASK                                                          0x00002000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_14_ERROR_MASK                                                          0x00004000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_15_ERROR_MASK                                                          0x00008000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_16_ERROR_MASK                                                          0x00010000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_17_ERROR_MASK                                                          0x00020000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_18_ERROR_MASK                                                          0x00040000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_19_ERROR_MASK                                                          0x00080000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_20_ERROR_MASK                                                          0x00100000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_21_ERROR_MASK                                                          0x00200000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_22_ERROR_MASK                                                          0x00400000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_23_ERROR_MASK                                                          0x00800000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_24_ERROR_MASK                                                          0x01000000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_25_ERROR_MASK                                                          0x02000000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_26_ERROR_MASK                                                          0x04000000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_27_ERROR_MASK                                                          0x08000000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_28_ERROR_MASK                                                          0x10000000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_29_ERROR_MASK                                                          0x20000000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_30_ERROR_MASK                                                          0x40000000L
+#define IH_CLIENT_CREDIT_ERROR__CLIENT_31_ERROR_MASK                                                          0x80000000L
+//IH_GPU_IOV_VIOLATION_LOG
+#define IH_GPU_IOV_VIOLATION_LOG__VIOLATION_STATUS__SHIFT                                                     0x0
+#define IH_GPU_IOV_VIOLATION_LOG__MULTIPLE_VIOLATION_STATUS__SHIFT                                            0x1
+#define IH_GPU_IOV_VIOLATION_LOG__ADDRESS__SHIFT                                                              0x2
+#define IH_GPU_IOV_VIOLATION_LOG__OPCODE__SHIFT                                                               0x16
+#define IH_GPU_IOV_VIOLATION_LOG__VF__SHIFT                                                                   0x17
+#define IH_GPU_IOV_VIOLATION_LOG__VF_ID__SHIFT                                                                0x18
+#define IH_GPU_IOV_VIOLATION_LOG__VIOLATION_STATUS_MASK                                                       0x00000001L
+#define IH_GPU_IOV_VIOLATION_LOG__MULTIPLE_VIOLATION_STATUS_MASK                                              0x00000002L
+#define IH_GPU_IOV_VIOLATION_LOG__ADDRESS_MASK                                                                0x000FFFFCL
+#define IH_GPU_IOV_VIOLATION_LOG__OPCODE_MASK                                                                 0x00400000L
+#define IH_GPU_IOV_VIOLATION_LOG__VF_MASK                                                                     0x00800000L
+#define IH_GPU_IOV_VIOLATION_LOG__VF_ID_MASK                                                                  0x0F000000L
+//IH_GPU_IOV_VIOLATION_LOG2
+#define IH_GPU_IOV_VIOLATION_LOG2__INITIATOR_ID__SHIFT                                                        0x0
+#define IH_GPU_IOV_VIOLATION_LOG2__INITIATOR_ID_MASK                                                          0x000003FFL
+//IH_COOKIE_REC_VIOLATION_LOG
+#define IH_COOKIE_REC_VIOLATION_LOG__VIOLATION_STATUS__SHIFT                                                  0x0
+#define IH_COOKIE_REC_VIOLATION_LOG__CLIENT_ID__SHIFT                                                         0x8
+#define IH_COOKIE_REC_VIOLATION_LOG__INITIATOR_ID__SHIFT                                                      0x10
+#define IH_COOKIE_REC_VIOLATION_LOG__VIOLATION_STATUS_MASK                                                    0x00000001L
+#define IH_COOKIE_REC_VIOLATION_LOG__CLIENT_ID_MASK                                                           0x0000FF00L
+#define IH_COOKIE_REC_VIOLATION_LOG__INITIATOR_ID_MASK                                                        0x03FF0000L
+//IH_CREDIT_STATUS
+#define IH_CREDIT_STATUS__CLIENT_1_CREDIT_RETURNED__SHIFT                                                     0x1
+#define IH_CREDIT_STATUS__CLIENT_2_CREDIT_RETURNED__SHIFT                                                     0x2
+#define IH_CREDIT_STATUS__CLIENT_3_CREDIT_RETURNED__SHIFT                                                     0x3
+#define IH_CREDIT_STATUS__CLIENT_4_CREDIT_RETURNED__SHIFT                                                     0x4
+#define IH_CREDIT_STATUS__CLIENT_5_CREDIT_RETURNED__SHIFT                                                     0x5
+#define IH_CREDIT_STATUS__CLIENT_6_CREDIT_RETURNED__SHIFT                                                     0x6
+#define IH_CREDIT_STATUS__CLIENT_7_CREDIT_RETURNED__SHIFT                                                     0x7
+#define IH_CREDIT_STATUS__CLIENT_8_CREDIT_RETURNED__SHIFT                                                     0x8
+#define IH_CREDIT_STATUS__CLIENT_9_CREDIT_RETURNED__SHIFT                                                     0x9
+#define IH_CREDIT_STATUS__CLIENT_10_CREDIT_RETURNED__SHIFT                                                    0xa
+#define IH_CREDIT_STATUS__CLIENT_11_CREDIT_RETURNED__SHIFT                                                    0xb
+#define IH_CREDIT_STATUS__CLIENT_12_CREDIT_RETURNED__SHIFT                                                    0xc
+#define IH_CREDIT_STATUS__CLIENT_13_CREDIT_RETURNED__SHIFT                                                    0xd
+#define IH_CREDIT_STATUS__CLIENT_14_CREDIT_RETURNED__SHIFT                                                    0xe
+#define IH_CREDIT_STATUS__CLIENT_15_CREDIT_RETURNED__SHIFT                                                    0xf
+#define IH_CREDIT_STATUS__CLIENT_16_CREDIT_RETURNED__SHIFT                                                    0x10
+#define IH_CREDIT_STATUS__CLIENT_17_CREDIT_RETURNED__SHIFT                                                    0x11
+#define IH_CREDIT_STATUS__CLIENT_18_CREDIT_RETURNED__SHIFT                                                    0x12
+#define IH_CREDIT_STATUS__CLIENT_19_CREDIT_RETURNED__SHIFT                                                    0x13
+#define IH_CREDIT_STATUS__CLIENT_20_CREDIT_RETURNED__SHIFT                                                    0x14
+#define IH_CREDIT_STATUS__CLIENT_21_CREDIT_RETURNED__SHIFT                                                    0x15
+#define IH_CREDIT_STATUS__CLIENT_22_CREDIT_RETURNED__SHIFT                                                    0x16
+#define IH_CREDIT_STATUS__CLIENT_23_CREDIT_RETURNED__SHIFT                                                    0x17
+#define IH_CREDIT_STATUS__CLIENT_24_CREDIT_RETURNED__SHIFT                                                    0x18
+#define IH_CREDIT_STATUS__CLIENT_25_CREDIT_RETURNED__SHIFT                                                    0x19
+#define IH_CREDIT_STATUS__CLIENT_26_CREDIT_RETURNED__SHIFT                                                    0x1a
+#define IH_CREDIT_STATUS__CLIENT_27_CREDIT_RETURNED__SHIFT                                                    0x1b
+#define IH_CREDIT_STATUS__CLIENT_28_CREDIT_RETURNED__SHIFT                                                    0x1c
+#define IH_CREDIT_STATUS__CLIENT_29_CREDIT_RETURNED__SHIFT                                                    0x1d
+#define IH_CREDIT_STATUS__CLIENT_30_CREDIT_RETURNED__SHIFT                                                    0x1e
+#define IH_CREDIT_STATUS__CLIENT_31_CREDIT_RETURNED__SHIFT                                                    0x1f
+#define IH_CREDIT_STATUS__CLIENT_1_CREDIT_RETURNED_MASK                                                       0x00000002L
+#define IH_CREDIT_STATUS__CLIENT_2_CREDIT_RETURNED_MASK                                                       0x00000004L
+#define IH_CREDIT_STATUS__CLIENT_3_CREDIT_RETURNED_MASK                                                       0x00000008L
+#define IH_CREDIT_STATUS__CLIENT_4_CREDIT_RETURNED_MASK                                                       0x00000010L
+#define IH_CREDIT_STATUS__CLIENT_5_CREDIT_RETURNED_MASK                                                       0x00000020L
+#define IH_CREDIT_STATUS__CLIENT_6_CREDIT_RETURNED_MASK                                                       0x00000040L
+#define IH_CREDIT_STATUS__CLIENT_7_CREDIT_RETURNED_MASK                                                       0x00000080L
+#define IH_CREDIT_STATUS__CLIENT_8_CREDIT_RETURNED_MASK                                                       0x00000100L
+#define IH_CREDIT_STATUS__CLIENT_9_CREDIT_RETURNED_MASK                                                       0x00000200L
+#define IH_CREDIT_STATUS__CLIENT_10_CREDIT_RETURNED_MASK                                                      0x00000400L
+#define IH_CREDIT_STATUS__CLIENT_11_CREDIT_RETURNED_MASK                                                      0x00000800L
+#define IH_CREDIT_STATUS__CLIENT_12_CREDIT_RETURNED_MASK                                                      0x00001000L
+#define IH_CREDIT_STATUS__CLIENT_13_CREDIT_RETURNED_MASK                                                      0x00002000L
+#define IH_CREDIT_STATUS__CLIENT_14_CREDIT_RETURNED_MASK                                                      0x00004000L
+#define IH_CREDIT_STATUS__CLIENT_15_CREDIT_RETURNED_MASK                                                      0x00008000L
+#define IH_CREDIT_STATUS__CLIENT_16_CREDIT_RETURNED_MASK                                                      0x00010000L
+#define IH_CREDIT_STATUS__CLIENT_17_CREDIT_RETURNED_MASK                                                      0x00020000L
+#define IH_CREDIT_STATUS__CLIENT_18_CREDIT_RETURNED_MASK                                                      0x00040000L
+#define IH_CREDIT_STATUS__CLIENT_19_CREDIT_RETURNED_MASK                                                      0x00080000L
+#define IH_CREDIT_STATUS__CLIENT_20_CREDIT_RETURNED_MASK                                                      0x00100000L
+#define IH_CREDIT_STATUS__CLIENT_21_CREDIT_RETURNED_MASK                                                      0x00200000L
+#define IH_CREDIT_STATUS__CLIENT_22_CREDIT_RETURNED_MASK                                                      0x00400000L
+#define IH_CREDIT_STATUS__CLIENT_23_CREDIT_RETURNED_MASK                                                      0x00800000L
+#define IH_CREDIT_STATUS__CLIENT_24_CREDIT_RETURNED_MASK                                                      0x01000000L
+#define IH_CREDIT_STATUS__CLIENT_25_CREDIT_RETURNED_MASK                                                      0x02000000L
+#define IH_CREDIT_STATUS__CLIENT_26_CREDIT_RETURNED_MASK                                                      0x04000000L
+#define IH_CREDIT_STATUS__CLIENT_27_CREDIT_RETURNED_MASK                                                      0x08000000L
+#define IH_CREDIT_STATUS__CLIENT_28_CREDIT_RETURNED_MASK                                                      0x10000000L
+#define IH_CREDIT_STATUS__CLIENT_29_CREDIT_RETURNED_MASK                                                      0x20000000L
+#define IH_CREDIT_STATUS__CLIENT_30_CREDIT_RETURNED_MASK                                                      0x40000000L
+#define IH_CREDIT_STATUS__CLIENT_31_CREDIT_RETURNED_MASK                                                      0x80000000L
+//IH_MMHUB_ERROR
+#define IH_MMHUB_ERROR__IH_BRESP_01__SHIFT                                                                    0x1
+#define IH_MMHUB_ERROR__IH_BRESP_10__SHIFT                                                                    0x2
+#define IH_MMHUB_ERROR__IH_BRESP_11__SHIFT                                                                    0x3
+#define IH_MMHUB_ERROR__IH_BUSER_NACK_01__SHIFT                                                               0x5
+#define IH_MMHUB_ERROR__IH_BUSER_NACK_10__SHIFT                                                               0x6
+#define IH_MMHUB_ERROR__IH_BUSER_NACK_11__SHIFT                                                               0x7
+#define IH_MMHUB_ERROR__IH_BRESP_01_MASK                                                                      0x00000002L
+#define IH_MMHUB_ERROR__IH_BRESP_10_MASK                                                                      0x00000004L
+#define IH_MMHUB_ERROR__IH_BRESP_11_MASK                                                                      0x00000008L
+#define IH_MMHUB_ERROR__IH_BUSER_NACK_01_MASK                                                                 0x00000020L
+#define IH_MMHUB_ERROR__IH_BUSER_NACK_10_MASK                                                                 0x00000040L
+#define IH_MMHUB_ERROR__IH_BUSER_NACK_11_MASK                                                                 0x00000080L
+//IH_VF_RB_STATUS3
+#define IH_VF_RB_STATUS3__RB_OVERFLOW_VF__SHIFT                                                               0x0
+#define IH_VF_RB_STATUS3__RB_OVERFLOW_VF_MASK                                                                 0x0000FFFFL
+//IH_VF_RB_STATUS4
+#define IH_VF_RB_STATUS4__BIF_INTERRUPT_LINE_VF__SHIFT                                                        0x0
+#define IH_VF_RB_STATUS4__BIF_INTERRUPT_LINE_VF_MASK                                                          0x0000FFFFL
+//IH_VF_RB1_STATUS3
+#define IH_VF_RB1_STATUS3__RB_OVERFLOW_VF__SHIFT                                                              0x0
+#define IH_VF_RB1_STATUS3__RB_OVERFLOW_VF_MASK                                                                0x0000FFFFL
+//IH_MSI_STORM_CTRL
+#define IH_MSI_STORM_CTRL__DELAY__SHIFT                                                                       0x0
+#define IH_MSI_STORM_CTRL__DELAY_MASK                                                                         0x00000FFFL
+//IH_MSI_STORM_CLIENT_INDEX
+#define IH_MSI_STORM_CLIENT_INDEX__INDEX__SHIFT                                                               0x0
+#define IH_MSI_STORM_CLIENT_INDEX__INDEX_MASK                                                                 0x00000007L
+//IH_MSI_STORM_CLIENT_DATA
+#define IH_MSI_STORM_CLIENT_DATA__CLIENT_ID__SHIFT                                                            0x0
+#define IH_MSI_STORM_CLIENT_DATA__SOURCE_ID__SHIFT                                                            0x8
+#define IH_MSI_STORM_CLIENT_DATA__SOURCE_ID_MATCH_ENABLE__SHIFT                                               0x10
+#define IH_MSI_STORM_CLIENT_DATA__UTCL2_PAGE_FAULT_MATCH_ENABLE__SHIFT                                        0x11
+#define IH_MSI_STORM_CLIENT_DATA__ENTRY_VALID__SHIFT                                                          0x1f
+#define IH_MSI_STORM_CLIENT_DATA__CLIENT_ID_MASK                                                              0x000000FFL
+#define IH_MSI_STORM_CLIENT_DATA__SOURCE_ID_MASK                                                              0x0000FF00L
+#define IH_MSI_STORM_CLIENT_DATA__SOURCE_ID_MATCH_ENABLE_MASK                                                 0x00010000L
+#define IH_MSI_STORM_CLIENT_DATA__UTCL2_PAGE_FAULT_MATCH_ENABLE_MASK                                          0x00020000L
+#define IH_MSI_STORM_CLIENT_DATA__ENTRY_VALID_MASK                                                            0x80000000L
+//IH_REGISTER_LAST_PART2
+#define IH_REGISTER_LAST_PART2__RESERVED__SHIFT                                                               0x0
+#define IH_REGISTER_LAST_PART2__RESERVED_MASK                                                                 0xFFFFFFFFL
+//SEM_MAILBOX
+#define SEM_MAILBOX__HOSTPORT__SHIFT                                                                          0x0
+#define SEM_MAILBOX__RESERVED__SHIFT                                                                          0x10
+#define SEM_MAILBOX__HOSTPORT_MASK                                                                            0x0000FFFFL
+#define SEM_MAILBOX__RESERVED_MASK                                                                            0xFFFF0000L
+//SEM_MAILBOX_CLEAR
+#define SEM_MAILBOX_CLEAR__CLEAR__SHIFT                                                                       0x0
+#define SEM_MAILBOX_CLEAR__RESERVED__SHIFT                                                                    0x10
+#define SEM_MAILBOX_CLEAR__CLEAR_MASK                                                                         0x0000FFFFL
+#define SEM_MAILBOX_CLEAR__RESERVED_MASK                                                                      0xFFFF0000L
+//SEM_REGISTER_LAST_PART2
+#define SEM_REGISTER_LAST_PART2__RESERVED__SHIFT                                                              0x0
+#define SEM_REGISTER_LAST_PART2__RESERVED_MASK                                                                0xFFFFFFFFL
+//IH_ACTIVE_FCN_ID
+#define IH_ACTIVE_FCN_ID__VF_ID__SHIFT                                                                        0x0
+#define IH_ACTIVE_FCN_ID__RESERVED__SHIFT                                                                     0x4
+#define IH_ACTIVE_FCN_ID__PF_VF__SHIFT                                                                        0x1f
+#define IH_ACTIVE_FCN_ID__VF_ID_MASK                                                                          0x0000000FL
+#define IH_ACTIVE_FCN_ID__RESERVED_MASK                                                                       0x7FFFFFF0L
+#define IH_ACTIVE_FCN_ID__PF_VF_MASK                                                                          0x80000000L
+//IH_VIRT_RESET_REQ
+#define IH_VIRT_RESET_REQ__VF__SHIFT                                                                          0x0
+#define IH_VIRT_RESET_REQ__PF__SHIFT                                                                          0x1f
+#define IH_VIRT_RESET_REQ__VF_MASK                                                                            0x0000FFFFL
+#define IH_VIRT_RESET_REQ__PF_MASK                                                                            0x80000000L
+//IH_CLIENT_CFG
+#define IH_CLIENT_CFG__TOTAL_CLIENT_NUM__SHIFT                                                                0x0
+#define IH_CLIENT_CFG__TOTAL_CLIENT_NUM_MASK                                                                  0x0000003FL
+//IH_RING1_CLIENT_CFG_INDEX
+#define IH_RING1_CLIENT_CFG_INDEX__INDEX__SHIFT                                                               0x0
+#define IH_RING1_CLIENT_CFG_INDEX__INDEX_MASK                                                                 0x00000007L
+//IH_RING1_CLIENT_CFG_DATA
+#define IH_RING1_CLIENT_CFG_DATA__CLIENT_ID__SHIFT                                                            0x0
+#define IH_RING1_CLIENT_CFG_DATA__SOURCE_ID__SHIFT                                                            0x8
+#define IH_RING1_CLIENT_CFG_DATA__SOURCE_ID_MATCH_ENABLE__SHIFT                                               0x10
+#define IH_RING1_CLIENT_CFG_DATA__CLIENT_ID_MASK                                                              0x000000FFL
+#define IH_RING1_CLIENT_CFG_DATA__SOURCE_ID_MASK                                                              0x0000FF00L
+#define IH_RING1_CLIENT_CFG_DATA__SOURCE_ID_MATCH_ENABLE_MASK                                                 0x00010000L
+//IH_CLIENT_CFG_INDEX
+#define IH_CLIENT_CFG_INDEX__INDEX__SHIFT                                                                     0x0
+#define IH_CLIENT_CFG_INDEX__INDEX_MASK                                                                       0x0000001FL
+//IH_CLIENT_CFG_DATA
+#define IH_CLIENT_CFG_DATA__CLIENT_TYPE__SHIFT                                                                0x12
+#define IH_CLIENT_CFG_DATA__VF_RB_SELECT__SHIFT                                                               0x16
+#define IH_CLIENT_CFG_DATA__OVERWRITE_RING_ID_WITH_ACTIVE_FCN_ID__SHIFT                                       0x18
+#define IH_CLIENT_CFG_DATA__INTERFACE_TYPE__SHIFT                                                             0x19
+#define IH_CLIENT_CFG_DATA__CLIENT_TYPE_MASK                                                                  0x000C0000L
+#define IH_CLIENT_CFG_DATA__VF_RB_SELECT_MASK                                                                 0x00C00000L
+#define IH_CLIENT_CFG_DATA__OVERWRITE_RING_ID_WITH_ACTIVE_FCN_ID_MASK                                         0x01000000L
+#define IH_CLIENT_CFG_DATA__INTERFACE_TYPE_MASK                                                               0x02000000L
+//IH_CLIENT_CFG_DATA2
+#define IH_CLIENT_CFG_DATA2__CREDIT_RETURN_ADDR__SHIFT                                                        0x0
+#define IH_CLIENT_CFG_DATA2__CREDIT_RETURN_ADDR_MASK                                                          0xFFFFFFFFL
+//IH_CID_REMAP_INDEX
+#define IH_CID_REMAP_INDEX__INDEX__SHIFT                                                                      0x0
+#define IH_CID_REMAP_INDEX__INDEX_MASK                                                                        0x00000003L
+//IH_CID_REMAP_DATA
+#define IH_CID_REMAP_DATA__CLIENT_ID__SHIFT                                                                   0x0
+#define IH_CID_REMAP_DATA__INITIATOR_ID__SHIFT                                                                0x8
+#define IH_CID_REMAP_DATA__CLIENT_ID_REMAP__SHIFT                                                             0x18
+#define IH_CID_REMAP_DATA__CLIENT_ID_MASK                                                                     0x000000FFL
+#define IH_CID_REMAP_DATA__INITIATOR_ID_MASK                                                                  0x0003FF00L
+#define IH_CID_REMAP_DATA__CLIENT_ID_REMAP_MASK                                                               0xFF000000L
+//IH_CHICKEN
+#define IH_CHICKEN__ACTIVE_FCN_ID_PROT_ENABLE__SHIFT                                                          0x0
+#define IH_CHICKEN__DBGU_TRIGGER_ENABLE__SHIFT                                                                0x1
+#define IH_CHICKEN__CROSS_TRIGGER_ENABLE__SHIFT                                                               0x2
+#define IH_CHICKEN__MC_SPACE_FBPA_ENABLE__SHIFT                                                               0x3
+#define IH_CHICKEN__MC_SPACE_GPA_ENABLE__SHIFT                                                                0x4
+#define IH_CHICKEN__REG_FIREWALL_ENABLE__SHIFT                                                                0x5
+#define IH_CHICKEN__ACTIVE_FCN_ID_PROT_ENABLE_MASK                                                            0x00000001L
+#define IH_CHICKEN__DBGU_TRIGGER_ENABLE_MASK                                                                  0x00000002L
+#define IH_CHICKEN__CROSS_TRIGGER_ENABLE_MASK                                                                 0x00000004L
+#define IH_CHICKEN__MC_SPACE_FBPA_ENABLE_MASK                                                                 0x00000008L
+#define IH_CHICKEN__MC_SPACE_GPA_ENABLE_MASK                                                                  0x00000010L
+#define IH_CHICKEN__REG_FIREWALL_ENABLE_MASK                                                                  0x00000020L
+//IH_MMHUB_CNTL
+#define IH_MMHUB_CNTL__UNITID__SHIFT                                                                          0x0
+#define IH_MMHUB_CNTL__IV_TLVL__SHIFT                                                                         0x8
+#define IH_MMHUB_CNTL__WPTR_WB_TLVL__SHIFT                                                                    0xc
+#define IH_MMHUB_CNTL__UNITID_MASK                                                                            0x0000003FL
+#define IH_MMHUB_CNTL__IV_TLVL_MASK                                                                           0x00000F00L
+#define IH_MMHUB_CNTL__WPTR_WB_TLVL_MASK                                                                      0x0000F000L
+//IH_INT_DROP_CNTL
+#define IH_INT_DROP_CNTL__INT_DROP_EN__SHIFT                                                                  0x0
+#define IH_INT_DROP_CNTL__CLIENT_ID_MATCH_EN__SHIFT                                                           0x1
+#define IH_INT_DROP_CNTL__SOURCE_ID_MATCH_EN__SHIFT                                                           0x2
+#define IH_INT_DROP_CNTL__VF_ID_MATCH_EN__SHIFT                                                               0x3
+#define IH_INT_DROP_CNTL__VF_MATCH_EN__SHIFT                                                                  0x4
+#define IH_INT_DROP_CNTL__CONTEXT_ID_MATCH_EN__SHIFT                                                          0x5
+#define IH_INT_DROP_CNTL__INT_DROP_MODE__SHIFT                                                                0x6
+#define IH_INT_DROP_CNTL__UTCL2_RETRY_INT_DROP_EN__SHIFT                                                      0x8
+#define IH_INT_DROP_CNTL__INT_DROPPED__SHIFT                                                                  0x10
+#define IH_INT_DROP_CNTL__INT_DROP_EN_MASK                                                                    0x00000001L
+#define IH_INT_DROP_CNTL__CLIENT_ID_MATCH_EN_MASK                                                             0x00000002L
+#define IH_INT_DROP_CNTL__SOURCE_ID_MATCH_EN_MASK                                                             0x00000004L
+#define IH_INT_DROP_CNTL__VF_ID_MATCH_EN_MASK                                                                 0x00000008L
+#define IH_INT_DROP_CNTL__VF_MATCH_EN_MASK                                                                    0x00000010L
+#define IH_INT_DROP_CNTL__CONTEXT_ID_MATCH_EN_MASK                                                            0x00000020L
+#define IH_INT_DROP_CNTL__INT_DROP_MODE_MASK                                                                  0x000000C0L
+#define IH_INT_DROP_CNTL__UTCL2_RETRY_INT_DROP_EN_MASK                                                        0x00000100L
+#define IH_INT_DROP_CNTL__INT_DROPPED_MASK                                                                    0x00010000L
+//IH_INT_DROP_MATCH_VALUE0
+#define IH_INT_DROP_MATCH_VALUE0__CLIENT_ID_MATCH_VALUE__SHIFT                                                0x0
+#define IH_INT_DROP_MATCH_VALUE0__SOURCE_ID_MATCH_VALUE__SHIFT                                                0x8
+#define IH_INT_DROP_MATCH_VALUE0__VF_ID_MATCH_VALUE__SHIFT                                                    0x10
+#define IH_INT_DROP_MATCH_VALUE0__VF_MATCH_VALUE__SHIFT                                                       0x17
+#define IH_INT_DROP_MATCH_VALUE0__CONTEXT_ID_39_32_MATCH_VALUE__SHIFT                                         0x18
+#define IH_INT_DROP_MATCH_VALUE0__CLIENT_ID_MATCH_VALUE_MASK                                                  0x000000FFL
+#define IH_INT_DROP_MATCH_VALUE0__SOURCE_ID_MATCH_VALUE_MASK                                                  0x0000FF00L
+#define IH_INT_DROP_MATCH_VALUE0__VF_ID_MATCH_VALUE_MASK                                                      0x001F0000L
+#define IH_INT_DROP_MATCH_VALUE0__VF_MATCH_VALUE_MASK                                                         0x00800000L
+#define IH_INT_DROP_MATCH_VALUE0__CONTEXT_ID_39_32_MATCH_VALUE_MASK                                           0xFF000000L
+//IH_INT_DROP_MATCH_VALUE1
+#define IH_INT_DROP_MATCH_VALUE1__CONTEXT_ID_31_0_MATCH_VALUE__SHIFT                                          0x0
+#define IH_INT_DROP_MATCH_VALUE1__CONTEXT_ID_31_0_MATCH_VALUE_MASK                                            0xFFFFFFFFL
+//IH_INT_DROP_MATCH_MASK0
+#define IH_INT_DROP_MATCH_MASK0__CLIENT_ID_MATCH_MASK__SHIFT                                                  0x0
+#define IH_INT_DROP_MATCH_MASK0__SOURCE_ID_MATCH_MASK__SHIFT                                                  0x8
+#define IH_INT_DROP_MATCH_MASK0__VF_ID_MATCH_MASK__SHIFT                                                      0x10
+#define IH_INT_DROP_MATCH_MASK0__VF_MATCH_MASK__SHIFT                                                         0x17
+#define IH_INT_DROP_MATCH_MASK0__CONTEXT_ID_39_32_MATCH_MASK__SHIFT                                           0x18
+#define IH_INT_DROP_MATCH_MASK0__CLIENT_ID_MATCH_MASK_MASK                                                    0x000000FFL
+#define IH_INT_DROP_MATCH_MASK0__SOURCE_ID_MATCH_MASK_MASK                                                    0x0000FF00L
+#define IH_INT_DROP_MATCH_MASK0__VF_ID_MATCH_MASK_MASK                                                        0x001F0000L
+#define IH_INT_DROP_MATCH_MASK0__VF_MATCH_MASK_MASK                                                           0x00800000L
+#define IH_INT_DROP_MATCH_MASK0__CONTEXT_ID_39_32_MATCH_MASK_MASK                                             0xFF000000L
+//IH_INT_DROP_MATCH_MASK1
+#define IH_INT_DROP_MATCH_MASK1__CONTEXT_ID_31_0_MATCH_MASK__SHIFT                                            0x0
+#define IH_INT_DROP_MATCH_MASK1__CONTEXT_ID_31_0_MATCH_MASK_MASK                                              0xFFFFFFFFL
+//IH_REGISTER_LAST_PART1
+#define IH_REGISTER_LAST_PART1__RESERVED__SHIFT                                                               0x0
+#define IH_REGISTER_LAST_PART1__RESERVED_MASK                                                                 0xFFFFFFFFL
+
+#endif
-- 
2.41.0


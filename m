Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8BF3BCB03
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Jul 2021 12:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5297689EB4;
	Tue,  6 Jul 2021 10:54:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC10389EB4
 for <amd-gfx@lists.freedesktop.org>; Tue,  6 Jul 2021 10:54:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSRy7+0KuxjYWMvSZib6Y6rapUU5xFGgOmdeEukf/DoM/y/zxsH4V7MynjAsj96FaC7Ielhgh5eIjJk/1MEFIpwZf+Tk+oYsuVUyX2XRaBF8ZaqngZC3+HqyO/qYeuQpmQjlPDVf2UxmJz8vbt1NYbmSCSogjBnAWSzs0m+iKGseURwJdwY1UAPXueYilQ80OkcgiBx7yemaCR1aHQMhjzkinjxofo/+5Vt6R4JSEZGWeu080PyUIQSqKe5N77Z8SUs3ke4311MC0ssZVGdzi9nJX0a62f4uWaT8vpaaeY1GfIbIxplZ0G/gKxgg8M74L9uX+KhWzUZli0Az20KScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gasti0+zxTBcTPlEP++/BoP+SdHMh7+45p4SxuKlRTM=;
 b=h6hKZM2ZM7lwqthE/At8gbgOueRzjymz+N6G6rwmJuEIMp1/VvH8IozGoqlFapzPO9AcqGAfKqsfJRv7iFsDk3KimCTZpL3TSsYU9MjHYK7LUF+oaU/erspMczIIh7LF14sMgvFRM2CIPz36ZpS/M5VXb4xXtBBPMkQpJufp+mIiKNgOea8biKOnwXYn5Wnk2WZQKd7JYwKHAp6ukvhdDIgmCMtuugIT+r6ROOdDx3bTJwrhMMeAJm8gVqooOC9F8AbV4ribRzO2VfyBJPHMktZC3dqnRg2OQHrwTnGXdFguV9jjdQebC+INkyWxOuj6bkapunQX6uuw4j/S5kkZbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gasti0+zxTBcTPlEP++/BoP+SdHMh7+45p4SxuKlRTM=;
 b=BZ02eX5TdEnZ4H3yrdr8e9xAeAwekBPDIjctheAk5Ps8gXtRo+BwgfJc249WnU+3qyJzOgJQSx3KMQfI4Oh0dTCYsBMyBqb4rqFspr9Rf5QtQxNhzzMMfIdffoVjq69zaoC16sp+Uugw5Ejhd/F1Q1biHyFKywAQ3xiU5pjBd14=
Received: from MW4PR03CA0097.namprd03.prod.outlook.com (2603:10b6:303:b7::12)
 by CY4PR12MB1542.namprd12.prod.outlook.com (2603:10b6:910:8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 10:54:09 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b7:cafe::ff) by MW4PR03CA0097.outlook.office365.com
 (2603:10b6:303:b7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Tue, 6 Jul 2021 10:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 10:54:09 +0000
Received: from code-machine.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 6 Jul 2021
 05:54:05 -0500
From: Xiaomeng Hou <Xiaomeng.Hou@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/pm: drop smu_v13_0_1.c|h files for yellow carp
Date: Tue, 6 Jul 2021 18:53:47 +0800
Message-ID: <20210706105347.32338-1-Xiaomeng.Hou@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eed05c0e-7b06-4f16-3236-08d9406c61f6
X-MS-TrafficTypeDiagnostic: CY4PR12MB1542:
X-Microsoft-Antispam-PRVS: <CY4PR12MB15421729B7F48A08B295AF789F1B9@CY4PR12MB1542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rtY+gvZe8EoUMPlVxWUeBxhpqapwvUvbMx7yf332LABUr9eWcP5PxPvbfACwojhBw9jMlXyApPHBChw1B5tIeEGGEg0GNcvENqRLh916wcikLsHN8Dotp6IYvQWMwJ7Kczo7MoGC4sOks2O9uLkF+59F7IMJ5y0r6kERoycy1NRs0DXr0EHoT6t7w+pePFXYZgzHk6OzyKR+aFA0K7ZOpb9v3NDMJ97WnqqAX23MCV9fypysLV93e4DllDbv6XO5lwqIZeBNhW/cH3p6YLRySP0HOPs/rgOTnTfbn57JD+u2oThHWs8ADarogQQC2bLLm2pj+PD5UyV+24wGgKfe8KUbDdaWOuUoNG9du5MS4apw06sPQkBYjaBrEII9v/jLw9dV1NO6brHDrcKGypmWegUu0IKemd7bD2rXMR7kwDa7tgFlyiVwGWzCU1MJB2ycxMTYW5rboMGTF+dXRs6S0hOUMNbCrQbvjNToHsutZOvaUpVS3Yom8zUQABqHPEHjoLUmcXTYMOhKUiylYJXCL5wzpTav/8r4FFTrHDf2Fx8y23BQBebj5gjlArreuhffdVgbG2S4I10HusPfgq8PMHj5c8fUb2GOo4mB2S/KH/H25i/oSh1M5SGa81aWuXgVA6n1yUK0ua6a4sOY4gsIoCSXc6ZV8QtLO2QDXwL1xjFHir+KjvDyxgEOCkCqN65YTNURgI8Nr3lIdPKuN7Qoc813SMaNW6Otsh9sI/hitSg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(336012)(81166007)(426003)(6666004)(7696005)(5660300002)(70586007)(82740400003)(83380400001)(86362001)(8676002)(2616005)(4326008)(70206006)(26005)(2906002)(1076003)(356005)(478600001)(316002)(19627235002)(30864003)(82310400003)(6916009)(8936002)(47076005)(36860700001)(54906003)(186003)(16526019)(36756003)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 10:54:09.2127 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eed05c0e-7b06-4f16-3236-08d9406c61f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1542
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
Cc: Lijo.Lazar@amd.com, Xiaomeng Hou <Xiaomeng.Hou@amd.com>, Aaron.Liu@amd.com,
 Kevin1.Wang@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Since there's nothing special in smu implementation for yellow carp,
it's better to reuse the common smu_v13_0 interfaces and drop the
specific smu_v13_0_1.c|h files.

v2: remove the duplicate register offset and shift mask header files as
well.

Signed-off-by: Xiaomeng Hou <Xiaomeng.Hou@amd.com>
---
 .../include/asic_reg/mp/mp_13_0_1_offset.h    | 355 ------------
 .../include/asic_reg/mp/mp_13_0_1_sh_mask.h   | 531 ------------------
 drivers/gpu/drm/amd/pm/inc/smu_v13_0.h        |   1 +
 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h      |  57 --
 drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile   |   2 +-
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    |  24 +
 .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c  | 311 ----------
 .../drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c  |  39 +-
 8 files changed, 57 insertions(+), 1263 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h
 delete mode 100644 drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h
 delete mode 100644 drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h
 delete mode 100644 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c

diff --git a/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h b/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h
deleted file mode 100644
index dfacc6b5d89d..000000000000
--- a/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_offset.h
+++ /dev/null
@@ -1,355 +0,0 @@
-/*
- * Copyright 2020 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- *
- */
-#ifndef _mp_13_0_1_OFFSET_HEADER
-#define _mp_13_0_1_OFFSET_HEADER
-
-
-
-// addressBlock: mp_SmuMp0_SmnDec
-// base address: 0x0
-#define regMP0_SMN_C2PMSG_32                                                                            0x0060
-#define regMP0_SMN_C2PMSG_32_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_33                                                                            0x0061
-#define regMP0_SMN_C2PMSG_33_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_34                                                                            0x0062
-#define regMP0_SMN_C2PMSG_34_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_35                                                                            0x0063
-#define regMP0_SMN_C2PMSG_35_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_36                                                                            0x0064
-#define regMP0_SMN_C2PMSG_36_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_37                                                                            0x0065
-#define regMP0_SMN_C2PMSG_37_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_38                                                                            0x0066
-#define regMP0_SMN_C2PMSG_38_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_39                                                                            0x0067
-#define regMP0_SMN_C2PMSG_39_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_40                                                                            0x0068
-#define regMP0_SMN_C2PMSG_40_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_41                                                                            0x0069
-#define regMP0_SMN_C2PMSG_41_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_42                                                                            0x006a
-#define regMP0_SMN_C2PMSG_42_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_43                                                                            0x006b
-#define regMP0_SMN_C2PMSG_43_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_44                                                                            0x006c
-#define regMP0_SMN_C2PMSG_44_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_45                                                                            0x006d
-#define regMP0_SMN_C2PMSG_45_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_46                                                                            0x006e
-#define regMP0_SMN_C2PMSG_46_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_47                                                                            0x006f
-#define regMP0_SMN_C2PMSG_47_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_48                                                                            0x0070
-#define regMP0_SMN_C2PMSG_48_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_49                                                                            0x0071
-#define regMP0_SMN_C2PMSG_49_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_50                                                                            0x0072
-#define regMP0_SMN_C2PMSG_50_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_51                                                                            0x0073
-#define regMP0_SMN_C2PMSG_51_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_52                                                                            0x0074
-#define regMP0_SMN_C2PMSG_52_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_53                                                                            0x0075
-#define regMP0_SMN_C2PMSG_53_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_54                                                                            0x0076
-#define regMP0_SMN_C2PMSG_54_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_55                                                                            0x0077
-#define regMP0_SMN_C2PMSG_55_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_56                                                                            0x0078
-#define regMP0_SMN_C2PMSG_56_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_57                                                                            0x0079
-#define regMP0_SMN_C2PMSG_57_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_58                                                                            0x007a
-#define regMP0_SMN_C2PMSG_58_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_59                                                                            0x007b
-#define regMP0_SMN_C2PMSG_59_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_60                                                                            0x007c
-#define regMP0_SMN_C2PMSG_60_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_61                                                                            0x007d
-#define regMP0_SMN_C2PMSG_61_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_62                                                                            0x007e
-#define regMP0_SMN_C2PMSG_62_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_63                                                                            0x007f
-#define regMP0_SMN_C2PMSG_63_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_64                                                                            0x0080
-#define regMP0_SMN_C2PMSG_64_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_65                                                                            0x0081
-#define regMP0_SMN_C2PMSG_65_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_66                                                                            0x0082
-#define regMP0_SMN_C2PMSG_66_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_67                                                                            0x0083
-#define regMP0_SMN_C2PMSG_67_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_68                                                                            0x0084
-#define regMP0_SMN_C2PMSG_68_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_69                                                                            0x0085
-#define regMP0_SMN_C2PMSG_69_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_70                                                                            0x0086
-#define regMP0_SMN_C2PMSG_70_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_71                                                                            0x0087
-#define regMP0_SMN_C2PMSG_71_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_72                                                                            0x0088
-#define regMP0_SMN_C2PMSG_72_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_73                                                                            0x0089
-#define regMP0_SMN_C2PMSG_73_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_74                                                                            0x008a
-#define regMP0_SMN_C2PMSG_74_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_75                                                                            0x008b
-#define regMP0_SMN_C2PMSG_75_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_76                                                                            0x008c
-#define regMP0_SMN_C2PMSG_76_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_77                                                                            0x008d
-#define regMP0_SMN_C2PMSG_77_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_78                                                                            0x008e
-#define regMP0_SMN_C2PMSG_78_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_79                                                                            0x008f
-#define regMP0_SMN_C2PMSG_79_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_80                                                                            0x0090
-#define regMP0_SMN_C2PMSG_80_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_81                                                                            0x0091
-#define regMP0_SMN_C2PMSG_81_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_82                                                                            0x0092
-#define regMP0_SMN_C2PMSG_82_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_83                                                                            0x0093
-#define regMP0_SMN_C2PMSG_83_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_84                                                                            0x0094
-#define regMP0_SMN_C2PMSG_84_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_85                                                                            0x0095
-#define regMP0_SMN_C2PMSG_85_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_86                                                                            0x0096
-#define regMP0_SMN_C2PMSG_86_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_87                                                                            0x0097
-#define regMP0_SMN_C2PMSG_87_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_88                                                                            0x0098
-#define regMP0_SMN_C2PMSG_88_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_89                                                                            0x0099
-#define regMP0_SMN_C2PMSG_89_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_90                                                                            0x009a
-#define regMP0_SMN_C2PMSG_90_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_91                                                                            0x009b
-#define regMP0_SMN_C2PMSG_91_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_92                                                                            0x009c
-#define regMP0_SMN_C2PMSG_92_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_93                                                                            0x009d
-#define regMP0_SMN_C2PMSG_93_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_94                                                                            0x009e
-#define regMP0_SMN_C2PMSG_94_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_95                                                                            0x009f
-#define regMP0_SMN_C2PMSG_95_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_96                                                                            0x00a0
-#define regMP0_SMN_C2PMSG_96_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_97                                                                            0x00a1
-#define regMP0_SMN_C2PMSG_97_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_98                                                                            0x00a2
-#define regMP0_SMN_C2PMSG_98_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_99                                                                            0x00a3
-#define regMP0_SMN_C2PMSG_99_BASE_IDX                                                                   0
-#define regMP0_SMN_C2PMSG_100                                                                           0x00a4
-#define regMP0_SMN_C2PMSG_100_BASE_IDX                                                                  0
-#define regMP0_SMN_C2PMSG_101                                                                           0x00a5
-#define regMP0_SMN_C2PMSG_101_BASE_IDX                                                                  0
-#define regMP0_SMN_C2PMSG_102                                                                           0x00a6
-#define regMP0_SMN_C2PMSG_102_BASE_IDX                                                                  0
-#define regMP0_SMN_C2PMSG_103                                                                           0x00a7
-#define regMP0_SMN_C2PMSG_103_BASE_IDX                                                                  0
-#define regMP0_SMN_IH_CREDIT                                                                            0x00c1
-#define regMP0_SMN_IH_CREDIT_BASE_IDX                                                                   0
-#define regMP0_SMN_IH_SW_INT                                                                            0x00c2
-#define regMP0_SMN_IH_SW_INT_BASE_IDX                                                                   0
-#define regMP0_SMN_IH_SW_INT_CTRL                                                                       0x00c3
-#define regMP0_SMN_IH_SW_INT_CTRL_BASE_IDX                                                              0
-
-
-// addressBlock: mp_SmuMp1_SmnDec
-// base address: 0x0
-#define regMP1_SMN_C2PMSG_32                                                                            0x0260
-#define regMP1_SMN_C2PMSG_32_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_33                                                                            0x0261
-#define regMP1_SMN_C2PMSG_33_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_34                                                                            0x0262
-#define regMP1_SMN_C2PMSG_34_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_35                                                                            0x0263
-#define regMP1_SMN_C2PMSG_35_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_36                                                                            0x0264
-#define regMP1_SMN_C2PMSG_36_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_37                                                                            0x0265
-#define regMP1_SMN_C2PMSG_37_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_38                                                                            0x0266
-#define regMP1_SMN_C2PMSG_38_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_39                                                                            0x0267
-#define regMP1_SMN_C2PMSG_39_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_40                                                                            0x0268
-#define regMP1_SMN_C2PMSG_40_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_41                                                                            0x0269
-#define regMP1_SMN_C2PMSG_41_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_42                                                                            0x026a
-#define regMP1_SMN_C2PMSG_42_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_43                                                                            0x026b
-#define regMP1_SMN_C2PMSG_43_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_44                                                                            0x026c
-#define regMP1_SMN_C2PMSG_44_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_45                                                                            0x026d
-#define regMP1_SMN_C2PMSG_45_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_46                                                                            0x026e
-#define regMP1_SMN_C2PMSG_46_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_47                                                                            0x026f
-#define regMP1_SMN_C2PMSG_47_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_48                                                                            0x0270
-#define regMP1_SMN_C2PMSG_48_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_49                                                                            0x0271
-#define regMP1_SMN_C2PMSG_49_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_50                                                                            0x0272
-#define regMP1_SMN_C2PMSG_50_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_51                                                                            0x0273
-#define regMP1_SMN_C2PMSG_51_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_52                                                                            0x0274
-#define regMP1_SMN_C2PMSG_52_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_53                                                                            0x0275
-#define regMP1_SMN_C2PMSG_53_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_54                                                                            0x0276
-#define regMP1_SMN_C2PMSG_54_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_55                                                                            0x0277
-#define regMP1_SMN_C2PMSG_55_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_56                                                                            0x0278
-#define regMP1_SMN_C2PMSG_56_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_57                                                                            0x0279
-#define regMP1_SMN_C2PMSG_57_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_58                                                                            0x027a
-#define regMP1_SMN_C2PMSG_58_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_59                                                                            0x027b
-#define regMP1_SMN_C2PMSG_59_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_60                                                                            0x027c
-#define regMP1_SMN_C2PMSG_60_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_61                                                                            0x027d
-#define regMP1_SMN_C2PMSG_61_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_62                                                                            0x027e
-#define regMP1_SMN_C2PMSG_62_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_63                                                                            0x027f
-#define regMP1_SMN_C2PMSG_63_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_64                                                                            0x0280
-#define regMP1_SMN_C2PMSG_64_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_65                                                                            0x0281
-#define regMP1_SMN_C2PMSG_65_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_66                                                                            0x0282
-#define regMP1_SMN_C2PMSG_66_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_67                                                                            0x0283
-#define regMP1_SMN_C2PMSG_67_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_68                                                                            0x0284
-#define regMP1_SMN_C2PMSG_68_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_69                                                                            0x0285
-#define regMP1_SMN_C2PMSG_69_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_70                                                                            0x0286
-#define regMP1_SMN_C2PMSG_70_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_71                                                                            0x0287
-#define regMP1_SMN_C2PMSG_71_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_72                                                                            0x0288
-#define regMP1_SMN_C2PMSG_72_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_73                                                                            0x0289
-#define regMP1_SMN_C2PMSG_73_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_74                                                                            0x028a
-#define regMP1_SMN_C2PMSG_74_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_75                                                                            0x028b
-#define regMP1_SMN_C2PMSG_75_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_76                                                                            0x028c
-#define regMP1_SMN_C2PMSG_76_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_77                                                                            0x028d
-#define regMP1_SMN_C2PMSG_77_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_78                                                                            0x028e
-#define regMP1_SMN_C2PMSG_78_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_79                                                                            0x028f
-#define regMP1_SMN_C2PMSG_79_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_80                                                                            0x0290
-#define regMP1_SMN_C2PMSG_80_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_81                                                                            0x0291
-#define regMP1_SMN_C2PMSG_81_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_82                                                                            0x0292
-#define regMP1_SMN_C2PMSG_82_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_83                                                                            0x0293
-#define regMP1_SMN_C2PMSG_83_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_84                                                                            0x0294
-#define regMP1_SMN_C2PMSG_84_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_85                                                                            0x0295
-#define regMP1_SMN_C2PMSG_85_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_86                                                                            0x0296
-#define regMP1_SMN_C2PMSG_86_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_87                                                                            0x0297
-#define regMP1_SMN_C2PMSG_87_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_88                                                                            0x0298
-#define regMP1_SMN_C2PMSG_88_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_89                                                                            0x0299
-#define regMP1_SMN_C2PMSG_89_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_90                                                                            0x029a
-#define regMP1_SMN_C2PMSG_90_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_91                                                                            0x029b
-#define regMP1_SMN_C2PMSG_91_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_92                                                                            0x029c
-#define regMP1_SMN_C2PMSG_92_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_93                                                                            0x029d
-#define regMP1_SMN_C2PMSG_93_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_94                                                                            0x029e
-#define regMP1_SMN_C2PMSG_94_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_95                                                                            0x029f
-#define regMP1_SMN_C2PMSG_95_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_96                                                                            0x02a0
-#define regMP1_SMN_C2PMSG_96_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_97                                                                            0x02a1
-#define regMP1_SMN_C2PMSG_97_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_98                                                                            0x02a2
-#define regMP1_SMN_C2PMSG_98_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_99                                                                            0x02a3
-#define regMP1_SMN_C2PMSG_99_BASE_IDX                                                                   0
-#define regMP1_SMN_C2PMSG_100                                                                           0x02a4
-#define regMP1_SMN_C2PMSG_100_BASE_IDX                                                                  0
-#define regMP1_SMN_C2PMSG_101                                                                           0x02a5
-#define regMP1_SMN_C2PMSG_101_BASE_IDX                                                                  0
-#define regMP1_SMN_C2PMSG_102                                                                           0x02a6
-#define regMP1_SMN_C2PMSG_102_BASE_IDX                                                                  0
-#define regMP1_SMN_C2PMSG_103                                                                           0x02a7
-#define regMP1_SMN_C2PMSG_103_BASE_IDX                                                                  0
-#define regMP1_SMN_IH_CREDIT                                                                            0x02c1
-#define regMP1_SMN_IH_CREDIT_BASE_IDX                                                                   0
-#define regMP1_SMN_IH_SW_INT                                                                            0x02c2
-#define regMP1_SMN_IH_SW_INT_BASE_IDX                                                                   0
-#define regMP1_SMN_IH_SW_INT_CTRL                                                                       0x02c3
-#define regMP1_SMN_IH_SW_INT_CTRL_BASE_IDX                                                              0
-#define regMP1_SMN_FPS_CNT                                                                              0x02c4
-#define regMP1_SMN_FPS_CNT_BASE_IDX                                                                     0
-#define regMP1_SMN_EXT_SCRATCH0                                                                         0x0340
-#define regMP1_SMN_EXT_SCRATCH0_BASE_IDX                                                                0
-#define regMP1_SMN_EXT_SCRATCH1                                                                         0x0341
-#define regMP1_SMN_EXT_SCRATCH1_BASE_IDX                                                                0
-#define regMP1_SMN_EXT_SCRATCH2                                                                         0x0342
-#define regMP1_SMN_EXT_SCRATCH2_BASE_IDX                                                                0
-#define regMP1_SMN_EXT_SCRATCH3                                                                         0x0343
-#define regMP1_SMN_EXT_SCRATCH3_BASE_IDX                                                                0
-#define regMP1_SMN_EXT_SCRATCH4                                                                         0x0344
-#define regMP1_SMN_EXT_SCRATCH4_BASE_IDX                                                                0
-#define regMP1_SMN_EXT_SCRATCH5                                                                         0x0345
-#define regMP1_SMN_EXT_SCRATCH5_BASE_IDX                                                                0
-#define regMP1_SMN_EXT_SCRATCH6                                                                         0x0346
-#define regMP1_SMN_EXT_SCRATCH6_BASE_IDX                                                                0
-#define regMP1_SMN_EXT_SCRATCH7                                                                         0x0347
-#define regMP1_SMN_EXT_SCRATCH7_BASE_IDX                                                                0
-
-
-#endif
diff --git a/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h b/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h
deleted file mode 100644
index 2d5e8b58e693..000000000000
--- a/drivers/gpu/drm/amd/include/asic_reg/mp/mp_13_0_1_sh_mask.h
+++ /dev/null
@@ -1,531 +0,0 @@
-/*
- * Copyright 2020 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- *
- */
-#ifndef _mp_13_0_1_SH_MASK_HEADER
-#define _mp_13_0_1_SH_MASK_HEADER
-
-
-// addressBlock: mp_SmuMp0_SmnDec
-//MP0_SMN_C2PMSG_32
-#define MP0_SMN_C2PMSG_32__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_32__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_33
-#define MP0_SMN_C2PMSG_33__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_33__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_34
-#define MP0_SMN_C2PMSG_34__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_34__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_35
-#define MP0_SMN_C2PMSG_35__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_35__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_36
-#define MP0_SMN_C2PMSG_36__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_36__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_37
-#define MP0_SMN_C2PMSG_37__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_37__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_38
-#define MP0_SMN_C2PMSG_38__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_38__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_39
-#define MP0_SMN_C2PMSG_39__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_39__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_40
-#define MP0_SMN_C2PMSG_40__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_40__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_41
-#define MP0_SMN_C2PMSG_41__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_41__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_42
-#define MP0_SMN_C2PMSG_42__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_42__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_43
-#define MP0_SMN_C2PMSG_43__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_43__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_44
-#define MP0_SMN_C2PMSG_44__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_44__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_45
-#define MP0_SMN_C2PMSG_45__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_45__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_46
-#define MP0_SMN_C2PMSG_46__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_46__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_47
-#define MP0_SMN_C2PMSG_47__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_47__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_48
-#define MP0_SMN_C2PMSG_48__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_48__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_49
-#define MP0_SMN_C2PMSG_49__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_49__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_50
-#define MP0_SMN_C2PMSG_50__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_50__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_51
-#define MP0_SMN_C2PMSG_51__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_51__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_52
-#define MP0_SMN_C2PMSG_52__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_52__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_53
-#define MP0_SMN_C2PMSG_53__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_53__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_54
-#define MP0_SMN_C2PMSG_54__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_54__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_55
-#define MP0_SMN_C2PMSG_55__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_55__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_56
-#define MP0_SMN_C2PMSG_56__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_56__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_57
-#define MP0_SMN_C2PMSG_57__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_57__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_58
-#define MP0_SMN_C2PMSG_58__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_58__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_59
-#define MP0_SMN_C2PMSG_59__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_59__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_60
-#define MP0_SMN_C2PMSG_60__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_60__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_61
-#define MP0_SMN_C2PMSG_61__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_61__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_62
-#define MP0_SMN_C2PMSG_62__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_62__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_63
-#define MP0_SMN_C2PMSG_63__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_63__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_64
-#define MP0_SMN_C2PMSG_64__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_64__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_65
-#define MP0_SMN_C2PMSG_65__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_65__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_66
-#define MP0_SMN_C2PMSG_66__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_66__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_67
-#define MP0_SMN_C2PMSG_67__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_67__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_68
-#define MP0_SMN_C2PMSG_68__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_68__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_69
-#define MP0_SMN_C2PMSG_69__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_69__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_70
-#define MP0_SMN_C2PMSG_70__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_70__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_71
-#define MP0_SMN_C2PMSG_71__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_71__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_72
-#define MP0_SMN_C2PMSG_72__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_72__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_73
-#define MP0_SMN_C2PMSG_73__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_73__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_74
-#define MP0_SMN_C2PMSG_74__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_74__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_75
-#define MP0_SMN_C2PMSG_75__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_75__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_76
-#define MP0_SMN_C2PMSG_76__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_76__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_77
-#define MP0_SMN_C2PMSG_77__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_77__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_78
-#define MP0_SMN_C2PMSG_78__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_78__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_79
-#define MP0_SMN_C2PMSG_79__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_79__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_80
-#define MP0_SMN_C2PMSG_80__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_80__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_81
-#define MP0_SMN_C2PMSG_81__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_81__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_82
-#define MP0_SMN_C2PMSG_82__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_82__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_83
-#define MP0_SMN_C2PMSG_83__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_83__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_84
-#define MP0_SMN_C2PMSG_84__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_84__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_85
-#define MP0_SMN_C2PMSG_85__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_85__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_86
-#define MP0_SMN_C2PMSG_86__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_86__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_87
-#define MP0_SMN_C2PMSG_87__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_87__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_88
-#define MP0_SMN_C2PMSG_88__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_88__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_89
-#define MP0_SMN_C2PMSG_89__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_89__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_90
-#define MP0_SMN_C2PMSG_90__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_90__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_91
-#define MP0_SMN_C2PMSG_91__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_91__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_92
-#define MP0_SMN_C2PMSG_92__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_92__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_93
-#define MP0_SMN_C2PMSG_93__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_93__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_94
-#define MP0_SMN_C2PMSG_94__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_94__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_95
-#define MP0_SMN_C2PMSG_95__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_95__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_96
-#define MP0_SMN_C2PMSG_96__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_96__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_97
-#define MP0_SMN_C2PMSG_97__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_97__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_98
-#define MP0_SMN_C2PMSG_98__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_98__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_99
-#define MP0_SMN_C2PMSG_99__CONTENT__SHIFT                                                                     0x0
-#define MP0_SMN_C2PMSG_99__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP0_SMN_C2PMSG_100
-#define MP0_SMN_C2PMSG_100__CONTENT__SHIFT                                                                    0x0
-#define MP0_SMN_C2PMSG_100__CONTENT_MASK                                                                      0xFFFFFFFFL
-//MP0_SMN_C2PMSG_101
-#define MP0_SMN_C2PMSG_101__CONTENT__SHIFT                                                                    0x0
-#define MP0_SMN_C2PMSG_101__CONTENT_MASK                                                                      0xFFFFFFFFL
-//MP0_SMN_C2PMSG_102
-#define MP0_SMN_C2PMSG_102__CONTENT__SHIFT                                                                    0x0
-#define MP0_SMN_C2PMSG_102__CONTENT_MASK                                                                      0xFFFFFFFFL
-//MP0_SMN_C2PMSG_103
-#define MP0_SMN_C2PMSG_103__CONTENT__SHIFT                                                                    0x0
-#define MP0_SMN_C2PMSG_103__CONTENT_MASK                                                                      0xFFFFFFFFL
-//MP0_SMN_IH_CREDIT
-#define MP0_SMN_IH_CREDIT__CREDIT_VALUE__SHIFT                                                                0x0
-#define MP0_SMN_IH_CREDIT__CLIENT_ID__SHIFT                                                                   0x10
-#define MP0_SMN_IH_CREDIT__CREDIT_VALUE_MASK                                                                  0x00000003L
-#define MP0_SMN_IH_CREDIT__CLIENT_ID_MASK                                                                     0x00FF0000L
-//MP0_SMN_IH_SW_INT
-#define MP0_SMN_IH_SW_INT__ID__SHIFT                                                                          0x0
-#define MP0_SMN_IH_SW_INT__VALID__SHIFT                                                                       0x8
-#define MP0_SMN_IH_SW_INT__ID_MASK                                                                            0x000000FFL
-#define MP0_SMN_IH_SW_INT__VALID_MASK                                                                         0x00000100L
-//MP0_SMN_IH_SW_INT_CTRL
-#define MP0_SMN_IH_SW_INT_CTRL__INT_MASK__SHIFT                                                               0x0
-#define MP0_SMN_IH_SW_INT_CTRL__INT_ACK__SHIFT                                                                0x8
-#define MP0_SMN_IH_SW_INT_CTRL__INT_MASK_MASK                                                                 0x00000001L
-#define MP0_SMN_IH_SW_INT_CTRL__INT_ACK_MASK                                                                  0x00000100L
-
-
-// addressBlock: mp_SmuMp1Pub_CruDec
-//MP1_FIRMWARE_FLAGS
-#define MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED__SHIFT                                                         0x0
-#define MP1_FIRMWARE_FLAGS__RESERVED__SHIFT                                                                   0x1
-#define MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED_MASK                                                           0x00000001L
-#define MP1_FIRMWARE_FLAGS__RESERVED_MASK                                                                     0xFFFFFFFEL
-
-
-// addressBlock: mp_SmuMp1_SmnDec
-//MP1_SMN_C2PMSG_32
-#define MP1_SMN_C2PMSG_32__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_32__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_33
-#define MP1_SMN_C2PMSG_33__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_33__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_34
-#define MP1_SMN_C2PMSG_34__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_34__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_35
-#define MP1_SMN_C2PMSG_35__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_35__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_36
-#define MP1_SMN_C2PMSG_36__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_36__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_37
-#define MP1_SMN_C2PMSG_37__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_37__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_38
-#define MP1_SMN_C2PMSG_38__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_38__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_39
-#define MP1_SMN_C2PMSG_39__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_39__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_40
-#define MP1_SMN_C2PMSG_40__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_40__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_41
-#define MP1_SMN_C2PMSG_41__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_41__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_42
-#define MP1_SMN_C2PMSG_42__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_42__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_43
-#define MP1_SMN_C2PMSG_43__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_43__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_44
-#define MP1_SMN_C2PMSG_44__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_44__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_45
-#define MP1_SMN_C2PMSG_45__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_45__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_46
-#define MP1_SMN_C2PMSG_46__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_46__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_47
-#define MP1_SMN_C2PMSG_47__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_47__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_48
-#define MP1_SMN_C2PMSG_48__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_48__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_49
-#define MP1_SMN_C2PMSG_49__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_49__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_50
-#define MP1_SMN_C2PMSG_50__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_50__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_51
-#define MP1_SMN_C2PMSG_51__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_51__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_52
-#define MP1_SMN_C2PMSG_52__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_52__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_53
-#define MP1_SMN_C2PMSG_53__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_53__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_54
-#define MP1_SMN_C2PMSG_54__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_54__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_55
-#define MP1_SMN_C2PMSG_55__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_55__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_56
-#define MP1_SMN_C2PMSG_56__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_56__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_57
-#define MP1_SMN_C2PMSG_57__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_57__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_58
-#define MP1_SMN_C2PMSG_58__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_58__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_59
-#define MP1_SMN_C2PMSG_59__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_59__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_60
-#define MP1_SMN_C2PMSG_60__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_60__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_61
-#define MP1_SMN_C2PMSG_61__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_61__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_62
-#define MP1_SMN_C2PMSG_62__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_62__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_63
-#define MP1_SMN_C2PMSG_63__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_63__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_64
-#define MP1_SMN_C2PMSG_64__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_64__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_65
-#define MP1_SMN_C2PMSG_65__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_65__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_66
-#define MP1_SMN_C2PMSG_66__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_66__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_67
-#define MP1_SMN_C2PMSG_67__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_67__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_68
-#define MP1_SMN_C2PMSG_68__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_68__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_69
-#define MP1_SMN_C2PMSG_69__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_69__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_70
-#define MP1_SMN_C2PMSG_70__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_70__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_71
-#define MP1_SMN_C2PMSG_71__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_71__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_72
-#define MP1_SMN_C2PMSG_72__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_72__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_73
-#define MP1_SMN_C2PMSG_73__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_73__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_74
-#define MP1_SMN_C2PMSG_74__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_74__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_75
-#define MP1_SMN_C2PMSG_75__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_75__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_76
-#define MP1_SMN_C2PMSG_76__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_76__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_77
-#define MP1_SMN_C2PMSG_77__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_77__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_78
-#define MP1_SMN_C2PMSG_78__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_78__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_79
-#define MP1_SMN_C2PMSG_79__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_79__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_80
-#define MP1_SMN_C2PMSG_80__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_80__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_81
-#define MP1_SMN_C2PMSG_81__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_81__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_82
-#define MP1_SMN_C2PMSG_82__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_82__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_83
-#define MP1_SMN_C2PMSG_83__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_83__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_84
-#define MP1_SMN_C2PMSG_84__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_84__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_85
-#define MP1_SMN_C2PMSG_85__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_85__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_86
-#define MP1_SMN_C2PMSG_86__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_86__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_87
-#define MP1_SMN_C2PMSG_87__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_87__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_88
-#define MP1_SMN_C2PMSG_88__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_88__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_89
-#define MP1_SMN_C2PMSG_89__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_89__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_90
-#define MP1_SMN_C2PMSG_90__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_90__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_91
-#define MP1_SMN_C2PMSG_91__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_91__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_92
-#define MP1_SMN_C2PMSG_92__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_92__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_93
-#define MP1_SMN_C2PMSG_93__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_93__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_94
-#define MP1_SMN_C2PMSG_94__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_94__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_95
-#define MP1_SMN_C2PMSG_95__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_95__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_96
-#define MP1_SMN_C2PMSG_96__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_96__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_97
-#define MP1_SMN_C2PMSG_97__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_97__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_98
-#define MP1_SMN_C2PMSG_98__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_98__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_99
-#define MP1_SMN_C2PMSG_99__CONTENT__SHIFT                                                                     0x0
-#define MP1_SMN_C2PMSG_99__CONTENT_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_C2PMSG_100
-#define MP1_SMN_C2PMSG_100__CONTENT__SHIFT                                                                    0x0
-#define MP1_SMN_C2PMSG_100__CONTENT_MASK                                                                      0xFFFFFFFFL
-//MP1_SMN_C2PMSG_101
-#define MP1_SMN_C2PMSG_101__CONTENT__SHIFT                                                                    0x0
-#define MP1_SMN_C2PMSG_101__CONTENT_MASK                                                                      0xFFFFFFFFL
-//MP1_SMN_C2PMSG_102
-#define MP1_SMN_C2PMSG_102__CONTENT__SHIFT                                                                    0x0
-#define MP1_SMN_C2PMSG_102__CONTENT_MASK                                                                      0xFFFFFFFFL
-//MP1_SMN_C2PMSG_103
-#define MP1_SMN_C2PMSG_103__CONTENT__SHIFT                                                                    0x0
-#define MP1_SMN_C2PMSG_103__CONTENT_MASK                                                                      0xFFFFFFFFL
-//MP1_SMN_IH_CREDIT
-#define MP1_SMN_IH_CREDIT__CREDIT_VALUE__SHIFT                                                                0x0
-#define MP1_SMN_IH_CREDIT__CLIENT_ID__SHIFT                                                                   0x10
-#define MP1_SMN_IH_CREDIT__CREDIT_VALUE_MASK                                                                  0x00000003L
-#define MP1_SMN_IH_CREDIT__CLIENT_ID_MASK                                                                     0x00FF0000L
-//MP1_SMN_IH_SW_INT
-#define MP1_SMN_IH_SW_INT__ID__SHIFT                                                                          0x0
-#define MP1_SMN_IH_SW_INT__VALID__SHIFT                                                                       0x8
-#define MP1_SMN_IH_SW_INT__ID_MASK                                                                            0x000000FFL
-#define MP1_SMN_IH_SW_INT__VALID_MASK                                                                         0x00000100L
-//MP1_SMN_IH_SW_INT_CTRL
-#define MP1_SMN_IH_SW_INT_CTRL__INT_MASK__SHIFT                                                               0x0
-#define MP1_SMN_IH_SW_INT_CTRL__INT_ACK__SHIFT                                                                0x8
-#define MP1_SMN_IH_SW_INT_CTRL__INT_MASK_MASK                                                                 0x00000001L
-#define MP1_SMN_IH_SW_INT_CTRL__INT_ACK_MASK                                                                  0x00000100L
-//MP1_SMN_FPS_CNT
-#define MP1_SMN_FPS_CNT__COUNT__SHIFT                                                                         0x0
-#define MP1_SMN_FPS_CNT__COUNT_MASK                                                                           0xFFFFFFFFL
-//MP1_SMN_EXT_SCRATCH0
-#define MP1_SMN_EXT_SCRATCH0__DATA__SHIFT                                                                     0x0
-#define MP1_SMN_EXT_SCRATCH0__DATA_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_EXT_SCRATCH1
-#define MP1_SMN_EXT_SCRATCH1__DATA__SHIFT                                                                     0x0
-#define MP1_SMN_EXT_SCRATCH1__DATA_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_EXT_SCRATCH2
-#define MP1_SMN_EXT_SCRATCH2__DATA__SHIFT                                                                     0x0
-#define MP1_SMN_EXT_SCRATCH2__DATA_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_EXT_SCRATCH3
-#define MP1_SMN_EXT_SCRATCH3__DATA__SHIFT                                                                     0x0
-#define MP1_SMN_EXT_SCRATCH3__DATA_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_EXT_SCRATCH4
-#define MP1_SMN_EXT_SCRATCH4__DATA__SHIFT                                                                     0x0
-#define MP1_SMN_EXT_SCRATCH4__DATA_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_EXT_SCRATCH5
-#define MP1_SMN_EXT_SCRATCH5__DATA__SHIFT                                                                     0x0
-#define MP1_SMN_EXT_SCRATCH5__DATA_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_EXT_SCRATCH6
-#define MP1_SMN_EXT_SCRATCH6__DATA__SHIFT                                                                     0x0
-#define MP1_SMN_EXT_SCRATCH6__DATA_MASK                                                                       0xFFFFFFFFL
-//MP1_SMN_EXT_SCRATCH7
-#define MP1_SMN_EXT_SCRATCH7__DATA__SHIFT                                                                     0x0
-#define MP1_SMN_EXT_SCRATCH7__DATA_MASK                                                                       0xFFFFFFFFL
-
-
-#endif
diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h b/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
index 6119a36b2cba..3fea2430dec0 100644
--- a/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
+++ b/drivers/gpu/drm/amd/pm/inc/smu_v13_0.h
@@ -26,6 +26,7 @@
 #include "amdgpu_smu.h"
 
 #define SMU13_DRIVER_IF_VERSION_INV 0xFFFFFFFF
+#define SMU13_DRIVER_IF_VERSION_YELLOW_CARP 0x03
 #define SMU13_DRIVER_IF_VERSION_ALDE 0x07
 
 /* MP Apertures */
diff --git a/drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h b/drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h
deleted file mode 100644
index b6c976a4d578..000000000000
--- a/drivers/gpu/drm/amd/pm/inc/smu_v13_0_1.h
+++ /dev/null
@@ -1,57 +0,0 @@
-/*
- * Copyright 2020 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- */
-#ifndef __SMU_V13_0_1_H__
-#define __SMU_V13_0_1_H__
-
-#include "amdgpu_smu.h"
-
-#define SMU13_0_1_DRIVER_IF_VERSION_INV 0xFFFFFFFF
-#define SMU13_0_1_DRIVER_IF_VERSION_YELLOW_CARP 0x3
-
-/* MP Apertures */
-#define MP0_Public			0x03800000
-#define MP0_SRAM			0x03900000
-#define MP1_Public			0x03b00000
-#define MP1_SRAM			0x03c00004
-
-/* address block */
-#define smnMP1_FIRMWARE_FLAGS		0x3010024
-
-
-#if defined(SWSMU_CODE_LAYER_L2) || defined(SWSMU_CODE_LAYER_L3)
-
-int smu_v13_0_1_check_fw_status(struct smu_context *smu);
-
-int smu_v13_0_1_check_fw_version(struct smu_context *smu);
-
-int smu_v13_0_1_fini_smc_tables(struct smu_context *smu);
-
-int smu_v13_0_1_get_vbios_bootup_values(struct smu_context *smu);
-
-int smu_v13_0_1_set_default_dpm_tables(struct smu_context *smu);
-
-int smu_v13_0_1_set_driver_table_location(struct smu_context *smu);
-
-int smu_v13_0_1_gfx_off_control(struct smu_context *smu, bool enable);
-#endif
-#endif
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
index 9b3a8503f5cd..d4c4c495762c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
@@ -23,7 +23,7 @@
 # Makefile for the 'smu manager' sub-component of powerplay.
 # It provides the smu management services for the driver.
 
-SMU13_MGR = smu_v13_0.o aldebaran_ppt.o smu_v13_0_1.o yellow_carp_ppt.o
+SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o
 
 AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
 
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index a3dc7194aaf8..a421ba85bd6d 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -210,6 +210,9 @@ int smu_v13_0_check_fw_version(struct smu_context *smu)
 	case CHIP_ALDEBARAN:
 		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_ALDE;
 		break;
+	case CHIP_YELLOW_CARP:
+		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_YELLOW_CARP;
+		break;
 	default:
 		dev_err(smu->adev->dev, "smu unsupported asic type:%d.\n", smu->adev->asic_type);
 		smu->smc_driver_if_version = SMU13_DRIVER_IF_VERSION_INV;
@@ -694,6 +697,27 @@ int smu_v13_0_set_allowed_mask(struct smu_context *smu)
 	return ret;
 }
 
+int smu_v13_0_gfx_off_control(struct smu_context *smu, bool enable)
+{
+	int ret = 0;
+	struct amdgpu_device *adev = smu->adev;
+
+	switch (adev->asic_type) {
+	case CHIP_YELLOW_CARP:
+		if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
+			return 0;
+		if (enable)
+			ret = smu_cmn_send_smc_msg(smu, SMU_MSG_AllowGfxOff, NULL);
+		else
+			ret = smu_cmn_send_smc_msg(smu, SMU_MSG_DisallowGfxOff, NULL);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 int smu_v13_0_system_features_control(struct smu_context *smu,
 				      bool en)
 {
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c
deleted file mode 100644
index 61917b49f2bf..000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_1.c
+++ /dev/null
@@ -1,311 +0,0 @@
-/*
- * Copyright 2020 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-
-//#include <linux/reboot.h>
-
-#define SWSMU_CODE_LAYER_L3
-
-#include "amdgpu.h"
-#include "amdgpu_smu.h"
-#include "smu_v13_0_1.h"
-#include "soc15_common.h"
-#include "smu_cmn.h"
-#include "atomfirmware.h"
-#include "amdgpu_atomfirmware.h"
-#include "amdgpu_atombios.h"
-#include "atom.h"
-
-#include "asic_reg/mp/mp_13_0_1_offset.h"
-#include "asic_reg/mp/mp_13_0_1_sh_mask.h"
-
-/*
- * DO NOT use these for err/warn/info/debug messages.
- * Use dev_err, dev_warn, dev_info and dev_dbg instead.
- * They are more MGPU friendly.
- */
-#undef pr_err
-#undef pr_warn
-#undef pr_info
-#undef pr_debug
-
-int smu_v13_0_1_check_fw_status(struct smu_context *smu)
-{
-	struct amdgpu_device *adev = smu->adev;
-	uint32_t mp1_fw_flags;
-
-	mp1_fw_flags = RREG32_PCIE(MP1_Public |
-				   (smnMP1_FIRMWARE_FLAGS & 0xffffffff));
-
-	if ((mp1_fw_flags & MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED_MASK) >>
-	    MP1_FIRMWARE_FLAGS__INTERRUPTS_ENABLED__SHIFT)
-		return 0;
-
-	return -EIO;
-}
-
-int smu_v13_0_1_check_fw_version(struct smu_context *smu)
-{
-	uint32_t if_version = 0xff, smu_version = 0xff;
-	uint16_t smu_major;
-	uint8_t smu_minor, smu_debug;
-	int ret = 0;
-
-	ret = smu_cmn_get_smc_version(smu, &if_version, &smu_version);
-	if (ret)
-		return ret;
-
-	smu_major = (smu_version >> 16) & 0xffff;
-	smu_minor = (smu_version >> 8) & 0xff;
-	smu_debug = (smu_version >> 0) & 0xff;
-
-	switch (smu->adev->asic_type) {
-	case CHIP_YELLOW_CARP:
-		smu->smc_driver_if_version = SMU13_0_1_DRIVER_IF_VERSION_YELLOW_CARP;
-		break;
-
-	default:
-		dev_err(smu->adev->dev, "smu unsupported asic type:%d.\n", smu->adev->asic_type);
-		smu->smc_driver_if_version = SMU13_0_1_DRIVER_IF_VERSION_INV;
-		break;
-	}
-
-	dev_info(smu->adev->dev, "smu fw reported version = 0x%08x (%d.%d.%d)\n",
-			 smu_version, smu_major, smu_minor, smu_debug);
-
-	/*
-	 * 1. if_version mismatch is not critical as our fw is designed
-	 * to be backward compatible.
-	 * 2. New fw usually brings some optimizations. But that's visible
-	 * only on the paired driver.
-	 * Considering above, we just leave user a warning message instead
-	 * of halt driver loading.
-	 */
-	if (if_version != smu->smc_driver_if_version) {
-		dev_info(smu->adev->dev, "smu driver if version = 0x%08x, smu fw if version = 0x%08x, "
-			 "smu fw version = 0x%08x (%d.%d.%d)\n",
-			 smu->smc_driver_if_version, if_version,
-			 smu_version, smu_major, smu_minor, smu_debug);
-		dev_warn(smu->adev->dev, "SMU driver if version not matched\n");
-	}
-
-	return ret;
-}
-
-int smu_v13_0_1_fini_smc_tables(struct smu_context *smu)
-{
-	struct smu_table_context *smu_table = &smu->smu_table;
-
-	kfree(smu_table->clocks_table);
-	smu_table->clocks_table = NULL;
-
-	kfree(smu_table->metrics_table);
-	smu_table->metrics_table = NULL;
-
-	kfree(smu_table->watermarks_table);
-	smu_table->watermarks_table = NULL;
-
-	return 0;
-}
-
-static int smu_v13_0_1_atom_get_smu_clockinfo(struct amdgpu_device *adev,
-						uint8_t clk_id,
-						uint8_t syspll_id,
-						uint32_t *clk_freq)
-{
-	struct atom_get_smu_clock_info_parameters_v3_1 input = {0};
-	struct atom_get_smu_clock_info_output_parameters_v3_1 *output;
-	int ret, index;
-
-	input.clk_id = clk_id;
-	input.syspll_id = syspll_id;
-	input.command = GET_SMU_CLOCK_INFO_V3_1_GET_CLOCK_FREQ;
-	index = get_index_into_master_table(atom_master_list_of_command_functions_v2_1,
-					    getsmuclockinfo);
-
-	ret = amdgpu_atom_execute_table(adev->mode_info.atom_context, index,
-					(uint32_t *)&input);
-	if (ret)
-		return -EINVAL;
-
-	output = (struct atom_get_smu_clock_info_output_parameters_v3_1 *)&input;
-	*clk_freq = le32_to_cpu(output->atom_smu_outputclkfreq.smu_clock_freq_hz) / 10000;
-
-	return 0;
-}
-
-int smu_v13_0_1_get_vbios_bootup_values(struct smu_context *smu)
-{
-	int ret, index;
-	uint16_t size;
-	uint8_t frev, crev;
-	struct atom_common_table_header *header;
-	struct atom_firmware_info_v3_4 *v_3_4;
-	struct atom_firmware_info_v3_3 *v_3_3;
-	struct atom_firmware_info_v3_1 *v_3_1;
-
-	index = get_index_into_master_table(atom_master_list_of_data_tables_v2_1,
-					    firmwareinfo);
-
-	ret = amdgpu_atombios_get_data_table(smu->adev, index, &size, &frev, &crev,
-					     (uint8_t **)&header);
-	if (ret)
-		return ret;
-
-	if (header->format_revision != 3) {
-		dev_err(smu->adev->dev, "unknown atom_firmware_info version! for smu13\n");
-		return -EINVAL;
-	}
-
-	switch (header->content_revision) {
-	case 0:
-	case 1:
-	case 2:
-		v_3_1 = (struct atom_firmware_info_v3_1 *)header;
-		smu->smu_table.boot_values.revision = v_3_1->firmware_revision;
-		smu->smu_table.boot_values.gfxclk = v_3_1->bootup_sclk_in10khz;
-		smu->smu_table.boot_values.uclk = v_3_1->bootup_mclk_in10khz;
-		smu->smu_table.boot_values.socclk = 0;
-		smu->smu_table.boot_values.dcefclk = 0;
-		smu->smu_table.boot_values.vddc = v_3_1->bootup_vddc_mv;
-		smu->smu_table.boot_values.vddci = v_3_1->bootup_vddci_mv;
-		smu->smu_table.boot_values.mvddc = v_3_1->bootup_mvddc_mv;
-		smu->smu_table.boot_values.vdd_gfx = v_3_1->bootup_vddgfx_mv;
-		smu->smu_table.boot_values.cooling_id = v_3_1->coolingsolution_id;
-		break;
-	case 3:
-		v_3_3 = (struct atom_firmware_info_v3_3 *)header;
-		smu->smu_table.boot_values.revision = v_3_3->firmware_revision;
-		smu->smu_table.boot_values.gfxclk = v_3_3->bootup_sclk_in10khz;
-		smu->smu_table.boot_values.uclk = v_3_3->bootup_mclk_in10khz;
-		smu->smu_table.boot_values.socclk = 0;
-		smu->smu_table.boot_values.dcefclk = 0;
-		smu->smu_table.boot_values.vddc = v_3_3->bootup_vddc_mv;
-		smu->smu_table.boot_values.vddci = v_3_3->bootup_vddci_mv;
-		smu->smu_table.boot_values.mvddc = v_3_3->bootup_mvddc_mv;
-		smu->smu_table.boot_values.vdd_gfx = v_3_3->bootup_vddgfx_mv;
-		smu->smu_table.boot_values.cooling_id = v_3_3->coolingsolution_id;
-		break;
-	case 4:
-	default:
-		v_3_4 = (struct atom_firmware_info_v3_4 *)header;
-		smu->smu_table.boot_values.revision = v_3_4->firmware_revision;
-		smu->smu_table.boot_values.gfxclk = v_3_4->bootup_sclk_in10khz;
-		smu->smu_table.boot_values.uclk = v_3_4->bootup_mclk_in10khz;
-		smu->smu_table.boot_values.socclk = 0;
-		smu->smu_table.boot_values.dcefclk = 0;
-		smu->smu_table.boot_values.vddc = v_3_4->bootup_vddc_mv;
-		smu->smu_table.boot_values.vddci = v_3_4->bootup_vddci_mv;
-		smu->smu_table.boot_values.mvddc = v_3_4->bootup_mvddc_mv;
-		smu->smu_table.boot_values.vdd_gfx = v_3_4->bootup_vddgfx_mv;
-		smu->smu_table.boot_values.cooling_id = v_3_4->coolingsolution_id;
-		break;
-	}
-
-	smu->smu_table.boot_values.format_revision = header->format_revision;
-	smu->smu_table.boot_values.content_revision = header->content_revision;
-
-	smu_v13_0_1_atom_get_smu_clockinfo(smu->adev,
-					(uint8_t)SMU11_SYSPLL0_SOCCLK_ID,
-					(uint8_t)0,
-					&smu->smu_table.boot_values.socclk);
-
-	smu_v13_0_1_atom_get_smu_clockinfo(smu->adev,
-					(uint8_t)SMU11_SYSPLL0_DCEFCLK_ID,
-					(uint8_t)0,
-					&smu->smu_table.boot_values.dcefclk);
-
-	smu_v13_0_1_atom_get_smu_clockinfo(smu->adev,
-					(uint8_t)SMU11_SYSPLL0_ECLK_ID,
-					(uint8_t)0,
-					&smu->smu_table.boot_values.eclk);
-
-	smu_v13_0_1_atom_get_smu_clockinfo(smu->adev,
-					(uint8_t)SMU11_SYSPLL0_VCLK_ID,
-					(uint8_t)0,
-					&smu->smu_table.boot_values.vclk);
-
-	smu_v13_0_1_atom_get_smu_clockinfo(smu->adev,
-					(uint8_t)SMU11_SYSPLL0_DCLK_ID,
-					(uint8_t)0,
-					&smu->smu_table.boot_values.dclk);
-
-	if ((smu->smu_table.boot_values.format_revision == 3) &&
-	    (smu->smu_table.boot_values.content_revision >= 2))
-		smu_v13_0_1_atom_get_smu_clockinfo(smu->adev,
-						(uint8_t)SMU11_SYSPLL1_0_FCLK_ID,
-						(uint8_t)SMU11_SYSPLL1_2_ID,
-						&smu->smu_table.boot_values.fclk);
-
-	return 0;
-}
-
-int smu_v13_0_1_set_default_dpm_tables(struct smu_context *smu)
-{
-	struct smu_table_context *smu_table = &smu->smu_table;
-
-	return smu_cmn_update_table(smu, SMU_TABLE_DPMCLOCKS, 0, smu_table->clocks_table, false);
-}
-
-int smu_v13_0_1_set_driver_table_location(struct smu_context *smu)
-{
-	struct smu_table *driver_table = &smu->smu_table.driver_table;
-	int ret = 0;
-
-	if (!driver_table->mc_address)
-		return 0;
-
-	ret = smu_cmn_send_smc_msg_with_param(smu,
-			SMU_MSG_SetDriverDramAddrHigh,
-			upper_32_bits(driver_table->mc_address),
-			NULL);
-
-	if (ret)
-		return ret;
-
-	ret = smu_cmn_send_smc_msg_with_param(smu,
-			SMU_MSG_SetDriverDramAddrLow,
-			lower_32_bits(driver_table->mc_address),
-			NULL);
-
-	return ret;
-}
-
-int smu_v13_0_1_gfx_off_control(struct smu_context *smu, bool enable)
-{
-	int ret = 0;
-	struct amdgpu_device *adev = smu->adev;
-
-	switch (adev->asic_type) {
-	case CHIP_YELLOW_CARP:
-		if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
-			return 0;
-		if (enable)
-			ret = smu_cmn_send_smc_msg(smu, SMU_MSG_AllowGfxOff, NULL);
-		else
-			ret = smu_cmn_send_smc_msg(smu, SMU_MSG_DisallowGfxOff, NULL);
-		break;
-	default:
-		break;
-	}
-
-	return ret;
-}
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
index 7664334d8144..a28352149daa 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
@@ -25,7 +25,7 @@
 
 #include "amdgpu.h"
 #include "amdgpu_smu.h"
-#include "smu_v13_0_1.h"
+#include "smu_v13_0.h"
 #include "smu13_driver_if_yellow_carp.h"
 #include "yellow_carp_ppt.h"
 #include "smu_v13_0_1_ppsmc.h"
@@ -186,6 +186,22 @@ static int yellow_carp_init_smc_tables(struct smu_context *smu)
 	return -ENOMEM;
 }
 
+static int yellow_carp_fini_smc_tables(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+
+	kfree(smu_table->clocks_table);
+	smu_table->clocks_table = NULL;
+
+	kfree(smu_table->metrics_table);
+	smu_table->metrics_table = NULL;
+
+	kfree(smu_table->watermarks_table);
+	smu_table->watermarks_table = NULL;
+
+	return 0;
+}
+
 static int yellow_carp_system_features_control(struct smu_context *smu, bool en)
 {
 	struct smu_feature *feature = &smu->smu_feature;
@@ -658,6 +674,13 @@ static ssize_t yellow_carp_get_gpu_metrics(struct smu_context *smu,
 	return sizeof(struct gpu_metrics_v2_1);
 }
 
+static int yellow_carp_set_default_dpm_tables(struct smu_context *smu)
+{
+	struct smu_table_context *smu_table = &smu->smu_table;
+
+	return smu_cmn_update_table(smu, SMU_TABLE_DPMCLOCKS, 0, smu_table->clocks_table, false);
+}
+
 static int yellow_carp_od_edit_dpm_table(struct smu_context *smu, enum PP_OD_DPM_TABLE_COMMAND type,
 					long input[], uint32_t size)
 {
@@ -1202,17 +1225,17 @@ static int yellow_carp_set_fine_grain_gfx_freq_parameters(struct smu_context *sm
 }
 
 static const struct pptable_funcs yellow_carp_ppt_funcs = {
-	.check_fw_status = smu_v13_0_1_check_fw_status,
-	.check_fw_version = smu_v13_0_1_check_fw_version,
+	.check_fw_status = smu_v13_0_check_fw_status,
+	.check_fw_version = smu_v13_0_check_fw_version,
 	.init_smc_tables = yellow_carp_init_smc_tables,
-	.fini_smc_tables = smu_v13_0_1_fini_smc_tables,
-	.get_vbios_bootup_values = smu_v13_0_1_get_vbios_bootup_values,
+	.fini_smc_tables = yellow_carp_fini_smc_tables,
+	.get_vbios_bootup_values = smu_v13_0_get_vbios_bootup_values,
 	.system_features_control = yellow_carp_system_features_control,
 	.send_smc_msg_with_param = smu_cmn_send_smc_msg_with_param,
 	.send_smc_msg = smu_cmn_send_smc_msg,
 	.dpm_set_vcn_enable = yellow_carp_dpm_set_vcn_enable,
 	.dpm_set_jpeg_enable = yellow_carp_dpm_set_jpeg_enable,
-	.set_default_dpm_table = smu_v13_0_1_set_default_dpm_tables,
+	.set_default_dpm_table = yellow_carp_set_default_dpm_tables,
 	.read_sensor = yellow_carp_read_sensor,
 	.is_dpm_running = yellow_carp_is_dpm_running,
 	.set_watermarks_table = yellow_carp_set_watermarks_table,
@@ -1221,8 +1244,8 @@ static const struct pptable_funcs yellow_carp_ppt_funcs = {
 	.get_gpu_metrics = yellow_carp_get_gpu_metrics,
 	.get_enabled_mask = smu_cmn_get_enabled_32_bits_mask,
 	.get_pp_feature_mask = smu_cmn_get_pp_feature_mask,
-	.set_driver_table_location = smu_v13_0_1_set_driver_table_location,
-	.gfx_off_control = smu_v13_0_1_gfx_off_control,
+	.set_driver_table_location = smu_v13_0_set_driver_table_location,
+	.gfx_off_control = smu_v13_0_gfx_off_control,
 	.post_init = yellow_carp_post_smu_init,
 	.mode2_reset = yellow_carp_mode2_reset,
 	.get_dpm_ultimate_freq = yellow_carp_get_dpm_ultimate_freq,
-- 
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

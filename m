Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D159492D95D
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jul 2024 21:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7917C10E8B9;
	Wed, 10 Jul 2024 19:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HSm6kK49";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FFE10E8B9
 for <amd-gfx@lists.freedesktop.org>; Wed, 10 Jul 2024 19:39:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/rtlTj/Ie8pOekyms8/XlKOwelKI0BBqdJLsWiblMnTqL2+tDTGsll3vCgnkrp8jKwEbk1MJZAwv3eAlsGfszPUGE4fej8inYKVHmCsIbN7ckU9yC6VUl/ATCBdEJk6OcT8REOr0NfIETnNfQvplxb8TDKSdaesYnoCUJ11Uu2PTZLQmSO5xF51wLt1W9o1GVpV2/lSRN2tXV89Jq2xLpr20ueJ1jC6KV2JUVRSiPdKBfJ4R9qVtE96NDNSQr9N2SLw4rryuGsfIWs7SsirBM2Zqinr/2yXc2D7/EcaVc30iU4HAam/TXtJc1ycQuSbsSdurr62/I+KD6R/GUrX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjPy+x0gEqnAS48X/cCS6bGi4mFv8EYtWs/KZZZzb4o=;
 b=Y/voW4bebifNsnVpN1OXb+qW+V5M2bf2DnJs9fLVjzUBX3VjZ66VHAC7pBA1fT4lJ0HeLTHRVrUp0m/mxFjx1UUwvCzac8qf2cwtLyBaywc+drjyx07tR7Xqj/gn6ag6ecCQCFSI6zJzhbsRDhjpRn0OanobSQhzyX26UtFxokxWpmMxFtgA4UClto3xC6HEhS5mg7RGBAXMtz8kM9J8FBO9tIqeKgKij1qoyen1F+HwsvH3UdpH3XHDEH9nLkcdhBmUoB264kHnMfNLwJvuBrkOKQKedOOFgpISRRv6GRKWtytqPg9Uh2Ai9Gne63kUvgFqbLb18FCuTDUUGXCJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjPy+x0gEqnAS48X/cCS6bGi4mFv8EYtWs/KZZZzb4o=;
 b=HSm6kK49A1d1prSoZYR/kdvLlr1PLTewUvD9vvCSWDTZWlcD05KtnevMGP3TD9Va1SUuuHB876hGoZiIN8pnGYBRiTUoU1z0lUrxp7/R8zE1bgCwvPtAoiwQp32c9GOeQ6R6i6CDuERgeYT+keclDZEU5jIkIvsA8ebH9W3lVc8=
Received: from BLAPR03CA0153.namprd03.prod.outlook.com (2603:10b6:208:32f::19)
 by PH0PR12MB8149.namprd12.prod.outlook.com (2603:10b6:510:297::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 19:39:20 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:32f:cafe::d8) by BLAPR03CA0153.outlook.office365.com
 (2603:10b6:208:32f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20 via Frontend
 Transport; Wed, 10 Jul 2024 19:39:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Wed, 10 Jul 2024 19:39:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 10 Jul
 2024 14:39:16 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 10 Jul 2024 14:39:10 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, Chaitanya Dhere <chaitanya.dhere@amd.com>, "Aurabindo
 Pillai" <aurabindo.pillai@amd.com>
Subject: [PATCH 26/50] drm/amd/display: DML2.1 resynchronization
Date: Wed, 10 Jul 2024 15:36:43 -0400
Message-ID: <20240710193707.43754-27-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710193707.43754-1-Jerry.Zuo@amd.com>
References: <20240710193707.43754-1-Jerry.Zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jerry.Zuo@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|PH0PR12MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa8c3ec-5eda-408b-dcfe-08dca117fe7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GBipfjceTbU1WMrUSOO16fLbqNyKzdPHIWXWyp+TDpuXfbCiK5SdDUSeOCwE?=
 =?us-ascii?Q?uOHjzggkAv1qobyYKFgCElsjR6U5jlobzyHnpcAEUZgJPjF38mC8EkfGZ40x?=
 =?us-ascii?Q?oorZi3wX0R2/PW9jPCvuVeTQY69xtzt4qvDyhqDbNXMvaJyO7fvypLqvg1yn?=
 =?us-ascii?Q?kPtUTbC/H2E2nmeK/w2xu0b+rD1ZgccSzrn6RiHQBdkKg/+pmnl9d9xkcgc4?=
 =?us-ascii?Q?8IouhptYFKWLRqYGa9N6699/hG4hNH/HtY4x/gceLkxccbnEafOHY8lNviss?=
 =?us-ascii?Q?vzVD6BG0IaSdCqPHPnKEN6u0zCgzUHUPvLhChLyYlJLfehP2Ba6G2RboM+Ex?=
 =?us-ascii?Q?v/fBMoVUOfjgfLuokjnqugBXpCki5PCWI4MStQ3QcZSmmW5BW7VESuGrqiMo?=
 =?us-ascii?Q?+G8kb7QcOzAZk6qI/2c0n7UtqWP+sRd+CXtCSHqY0MT/YOm1o8oPDA4xH5q2?=
 =?us-ascii?Q?S9+7TCaSMKmSC0t51nwD9hJcma5f3dmUezd63o3r5FNbURc2ugIT29lOGfDy?=
 =?us-ascii?Q?tfTnH1i1xuKDY+I0Cr+Y9zigyK7lxTfwNkn5Vw4wUX6lb+Xnyy3pPwpq48Gd?=
 =?us-ascii?Q?NL1dQER9q31IoaNG07EsCBaId6Jq5xVH7vvm5RxDn0Or9Zs6df8qef9a0ha9?=
 =?us-ascii?Q?2gu9AQ/ROGz5UVSq6/J0lRQnuqffR8Y4esK68uKxJC7WcaAUg8Gu3wQqlPrK?=
 =?us-ascii?Q?Ff6Gy/FcI4cKf+TJU5z7BE7lMHmELTXE/8cSN85SkouIemP+yALGFXGLjDzO?=
 =?us-ascii?Q?zoHsA70bGa8CjT0pzbiekGCCJxUTikVSzYqxe2aQTE0sodM3RZZnoks/DZ+O?=
 =?us-ascii?Q?cx4g8qbOMha8ZfLSjwMU+XeY4JDJ4rznPGrDQ1hbN0zINIU+WVzQGC+fXtcL?=
 =?us-ascii?Q?3ptxd7sPRl5jLt6hJLQa/rgShLs49ILQnfyrTCirOwijZM2bcL9BwA/JxhNn?=
 =?us-ascii?Q?Yu8jt/0p3E1FsopOSjkgREhD86DnZHtQDVJUr78dAi4N2yC9X77wCSYTVqOT?=
 =?us-ascii?Q?SjxRFjWVxT5Q2wRvkCsaWLUp2KQwOq3NjQZ89v8sgQfBxAzNADzc1mM3VfZX?=
 =?us-ascii?Q?GPf5NmQ6qg7flzpFr8aFXhTQ2AE1Rrn9clDY2Wiw9Yxnv8pM7WGry4r5VLFG?=
 =?us-ascii?Q?0UcpPOotC8zoPF7EaL0lmSi4KgvzZNO4KbNx5peP0j3msEK2lyrV5v3Ygv5H?=
 =?us-ascii?Q?QMCd0JUXXbXDaHJjgGSIQgivhRBbHexbO8QI+fo+Yy75e+AWqpzUwX/SPwkx?=
 =?us-ascii?Q?FkrIh0hNzHn9PpUrUIe2jAVQCW1uEVx2ce+POOF3SlyFnHEhh9UMYQYiGR7n?=
 =?us-ascii?Q?nexRZXH9p9g41VJWpX5dPRq70cNtP6v9gYoo6gh4yYvo8ozzZjcZ6XKnA25X?=
 =?us-ascii?Q?2yjB+3c/MVj826+ioMScr9hrQL4VueRgDy7oQ3gKPwNq8fGUhk/ZNnYvmjD6?=
 =?us-ascii?Q?5E9HsI+GcWLnfhlwlponK8l5guWwI2Gi?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 19:39:20.2311 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa8c3ec-5eda-408b-dcfe-08dca117fe7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8149
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Chaitanya Dhere <chaitanya.dhere@amd.com>

July update for DML2.1 library from hardware team targeting DCN401

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Chaitanya Dhere <chaitanya.dhere@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  |    3 -
 .../dml21/inc/bounding_boxes/dcn4_soc_bb.h    |   13 +-
 .../amd/display/dc/dml2/dml21/inc/dml_top.h   |    1 -
 .../dml2/dml21/inc/dml_top_dchub_registers.h  |    1 -
 .../dml21/inc/dml_top_display_cfg_types.h     |    2 +-
 .../dc/dml2/dml21/inc/dml_top_policy_types.h  |    1 -
 .../dml21/inc/dml_top_soc_parameter_types.h   |    6 +-
 .../display/dc/dml2/dml21/inc/dml_top_types.h |    2 +
 .../dml2/dml21/src/dml2_core/dml2_core_dcn4.c |   45 +-
 .../dml2/dml21/src/dml2_core/dml2_core_dcn4.h |    1 -
 .../src/dml2_core/dml2_core_dcn4_calcs.c      |  182 ++-
 .../src/dml2_core/dml2_core_dcn4_calcs.h      |    2 +-
 .../dml21/src/dml2_core/dml2_core_factory.c   |    1 -
 .../dml21/src/dml2_core/dml2_core_factory.h   |    1 -
 .../dml21/src/dml2_core/dml2_core_shared.c    |   40 +-
 .../dml21/src/dml2_core/dml2_core_shared.h    |    1 -
 .../src/dml2_core/dml2_core_shared_types.h    |    6 +-
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c |    3 +-
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h |    1 -
 .../dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |    1 -
 .../dml21/src/dml2_dpmm/dml2_dpmm_factory.h   |    1 -
 .../dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c   |    1 -
 .../dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h   |    1 -
 .../dml21/src/dml2_mcg/dml2_mcg_factory.c     |    1 -
 .../dml21/src/dml2_mcg/dml2_mcg_factory.h     |    1 -
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c   |    1 -
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h   |    1 -
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c   | 1250 -----------------
 .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h   |   25 -
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  567 +++++---
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h  |    1 -
 .../dml21/src/dml2_pmo/dml2_pmo_factory.c     |    6 +-
 .../dml21/src/dml2_pmo/dml2_pmo_factory.h     |    1 -
 .../lib_float_math.c                          |    1 -
 .../lib_float_math.h                          |    1 -
 .../src/dml2_top/dml2_top_optimization.c      |    1 -
 .../src/dml2_top/dml2_top_optimization.h      |    1 -
 .../dc/dml2/dml21/src/dml2_top/dml_top.c      |   30 +-
 .../dml2/dml21/src/dml2_top/dml_top_mcache.c  |    1 -
 .../dml2/dml21/src/dml2_top/dml_top_mcache.h  |    1 -
 .../dc/dml2/dml21/src/inc/dml2_debug.c        |    1 -
 .../dc/dml2/dml21/src/inc/dml2_debug.h        |    1 -
 .../src/inc/dml2_internal_shared_types.h      |   27 +-
 43 files changed, 566 insertions(+), 1669 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 904a2d419638..b61332330b21 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -119,7 +119,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o := $(dml2_c
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o := $(dml2_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o := $(dml2_ccflags)
@@ -142,7 +141,6 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o := $
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.o := $(dml2_rcflags)
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.o := $(dml2_rcflags)
@@ -164,7 +162,6 @@ DML21 += src/dml2_dpmm/dml2_dpmm_factory.o
 DML21 += src/dml2_mcg/dml2_mcg_dcn4.o
 DML21 += src/dml2_mcg/dml2_mcg_factory.o
 DML21 += src/dml2_pmo/dml2_pmo_dcn3.o
-DML21 += src/dml2_pmo/dml2_pmo_dcn4.o
 DML21 += src/dml2_pmo/dml2_pmo_factory.o
 DML21 += src/dml2_pmo/dml2_pmo_dcn4_fams2.o
 DML21 += src/dml2_standalone_libraries/lib_float_math.o
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
index fe07fcc3d0d5..5af94f06c667 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
@@ -344,6 +344,9 @@ static const struct dml2_ip_capabilities dml2_dcn401_max_ip_caps = {
 	.config_return_buffer_segment_size_in_kbytes = 64,
 	.meta_fifo_size_in_kentries = 22,
 	.compressed_buffer_segment_size_in_kbytes = 64,
+	.max_flip_time_us = 80,
+	.max_flip_time_lines = 32,
+	.hostvm_mode = 0,
 	.subvp_drr_scheduling_margin_us = 100,
 	.subvp_prefetch_end_to_mall_start_us = 15,
 	.subvp_fw_processing_delay = 15,
@@ -351,14 +354,18 @@ static const struct dml2_ip_capabilities dml2_dcn401_max_ip_caps = {
 
 	.fams2 = {
 		.max_allow_delay_us = 100 * 1000,
-		.scheduling_delay_us = 50,
+		.scheduling_delay_us = 125,
 		.vertical_interrupt_ack_delay_us = 18,
 		.allow_programming_delay_us = 18,
 		.min_allow_width_us = 20,
 		.subvp_df_throttle_delay_us = 100,
-		.subvp_programming_delay_us = 18,
+		.subvp_programming_delay_us = 200,
 		.subvp_prefetch_to_mall_delay_us = 18,
-		.drr_programming_delay_us = 18,
+		.drr_programming_delay_us = 35,
+
+		.lock_timeout_us = 5000,
+		.recovery_timeout_us = 5000,
+		.flip_programming_delay_us = 300,
 	},
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h
index a25f4e5977cf..a64ec4dcf11a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML_TOP_H__
 #define __DML_TOP_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h
index 8247289ce7d3..83fc15bf13cf 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __dml2_TOP_DCHUB_REGISTERS_H__
 #define __dml2_TOP_DCHUB_REGISTERS_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
index daae77f2672b..fe153f4edaf5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML_TOP_DISPLAY_CFG_TYPES_H__
 #define __DML_TOP_DISPLAY_CFG_TYPES_H__
 
@@ -478,6 +477,7 @@ struct dml2_display_cfg {
 		bool max_outstanding_when_urgent_expected_disable;
 		bool enable_subvp_implicit_pmo; //enables PMO to switch pipe uclk strategy to subvp, and generate phantom programming
 		unsigned int best_effort_min_active_latency_hiding_us;
+		bool all_streams_blanked;
 	} overrides;
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_policy_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_policy_types.h
index 2f444f448770..8f624a912e78 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_policy_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_policy_types.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML_TOP_POLICY_TYPES_H__
 #define __DML_TOP_POLICY_TYPES_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
index 065b2afab6fb..99d775adc3e0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML_TOP_SOC_PARAMETER_TYPES_H__
 #define __DML_TOP_SOC_PARAMETER_TYPES_H__
 
@@ -173,6 +172,7 @@ struct dml2_ip_capabilities {
 	unsigned int meta_fifo_size_in_kentries;
 	unsigned int compressed_buffer_segment_size_in_kbytes;
 	unsigned int max_flip_time_us;
+	unsigned int max_flip_time_lines;
 	unsigned int hostvm_mode;
 	unsigned int subvp_drr_scheduling_margin_us;
 	unsigned int subvp_prefetch_end_to_mall_start_us;
@@ -190,6 +190,10 @@ struct dml2_ip_capabilities {
 		unsigned int subvp_programming_delay_us;
 		unsigned int subvp_prefetch_to_mall_delay_us;
 		unsigned int drr_programming_delay_us;
+
+		unsigned int lock_timeout_us;
+		unsigned int recovery_timeout_us;
+		unsigned int flip_programming_delay_us;
 	} fams2;
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
index 8aa77bb190ea..c47a07f473e5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
@@ -262,6 +262,7 @@ union dml2_global_sync_programming {
 		unsigned int vupdate_offset_pixels;
 		unsigned int vupdate_vupdate_width_pixels;
 		unsigned int vready_offset_pixels;
+		unsigned int pstate_keepout_start_lines;
 	} dcn4;
 };
 
@@ -411,6 +412,7 @@ struct dml2_display_cfg_programming {
 
 	/* indicates this configuration requires FW to support */
 	bool fams2_required;
+	struct dmub_cmd_fams2_global_config fams2_global_config;
 
 	struct {
 		bool supported_in_blank; // Changing to configurations where this is false requires stutter to be disabled during the transition
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
index 04edcde423a9..b7a6f7f4c342 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_internal_shared_types.h"
 #include "dml2_core_shared_types.h"
 #include "dml2_core_dcn4.h"
@@ -70,6 +69,7 @@ struct dml2_core_ip_params core_dcn4_ip_caps_base = {
 	.max_num_dp2p0_streams = 4,
 	.imall_supported = 1,
 	.max_flip_time_us = 80,
+	.max_flip_time_lines = 32,
 	.words_per_channel = 16,
 
 	.subvp_fw_processing_delay_us = 15,
@@ -169,6 +169,7 @@ static void patch_ip_caps_with_explicit_ip_params(struct dml2_ip_capabilities *i
 	ip_caps->meta_fifo_size_in_kentries = ip_params->meta_fifo_size_in_kentries;
 	ip_caps->compressed_buffer_segment_size_in_kbytes = ip_params->compressed_buffer_segment_size_in_kbytes;
 	ip_caps->max_flip_time_us = ip_params->max_flip_time_us;
+	ip_caps->max_flip_time_lines = ip_params->max_flip_time_lines;
 	ip_caps->hostvm_mode = ip_params->hostvm_mode;
 
 	// FIXME_STAGE2: cleanup after adding all dv override to ip_caps
@@ -192,6 +193,7 @@ static void patch_ip_params_with_ip_caps(struct dml2_core_ip_params *ip_params,
 	ip_params->meta_fifo_size_in_kentries = ip_caps->meta_fifo_size_in_kentries;
 	ip_params->compressed_buffer_segment_size_in_kbytes = ip_caps->compressed_buffer_segment_size_in_kbytes;
 	ip_params->max_flip_time_us = ip_caps->max_flip_time_us;
+	ip_params->max_flip_time_lines = ip_caps->max_flip_time_lines;
 	ip_params->hostvm_mode = ip_caps->hostvm_mode;
 }
 
@@ -222,6 +224,7 @@ bool core_dcn4_initialize(struct dml2_core_initialize_in_out *in_out)
 	}
 
 	memcpy(&core->clean_me_up.mode_lib.soc, in_out->soc_bb, sizeof(struct dml2_soc_bb));
+	memcpy(&core->clean_me_up.mode_lib.ip_caps, in_out->ip_caps, sizeof(struct dml2_ip_capabilities));
 
 	return true;
 }
@@ -246,10 +249,12 @@ static void create_phantom_plane_from_main_plane(struct dml2_plane_parameters *p
 	phantom->stream_index = phantom_stream_index;
 	phantom->overrides.refresh_from_mall = dml2_refresh_from_mall_mode_override_force_disable;
 	phantom->overrides.legacy_svp_config = dml2_svp_mode_override_phantom_pipe_no_data_return;
-	phantom->composition.viewport.plane0.height = (long int unsigned) math_ceil2(
-		(double)phantom->composition.viewport.plane0.height * (double)phantom_stream->timing.v_active /	(double)main_stream->timing.v_active, 16.0);
-	phantom->composition.viewport.plane1.height = (long int unsigned) math_ceil2(
-		(double)phantom->composition.viewport.plane1.height * (double)phantom_stream->timing.v_active /	(double)main_stream->timing.v_active, 16.0);
+	phantom->composition.viewport.plane0.height = (long int unsigned) math_min2(math_ceil2(
+		(double)main->composition.scaler_info.plane0.v_ratio * (double)phantom_stream->timing.v_active, 16.0),
+		(double)main->composition.viewport.plane0.height);
+	phantom->composition.viewport.plane1.height = (long int unsigned) math_min2(math_ceil2(
+		(double)main->composition.scaler_info.plane1.v_ratio * (double)phantom_stream->timing.v_active, 16.0),
+		(double)main->composition.viewport.plane1.height);
 	phantom->immediate_flip = false;
 	phantom->dynamic_meta_data.enable = false;
 	phantom->cursor.num_cursors = 0;
@@ -344,6 +349,8 @@ static void pack_mode_programming_params_with_implicit_subvp(struct dml2_core_in
 	// Check if FAMS2 is required
 	if (display_cfg->stage3.performed && display_cfg->stage3.success) {
 		programming->fams2_required = display_cfg->stage3.fams2_required;
+
+		dml2_core_calcs_get_global_fams2_programming(&core->clean_me_up.mode_lib, display_cfg, &programming->fams2_global_config);
 	}
 
 	// Only loop over all the main streams (the implicit svp streams will be packed as part of the main stream)
@@ -641,20 +648,20 @@ bool core_dcn4_mode_programming(struct dml2_core_mode_programming_in_out *in_out
 			for (plane_index = 0; plane_index < in_out->programming->display_config.num_planes; plane_index++) {
 				in_out->programming->plane_programming[plane_index].num_dpps_required = core->clean_me_up.mode_lib.mp.NoOfDPP[plane_index];
 
-			if (in_out->programming->display_config.plane_descriptors->overrides.legacy_svp_config == dml2_svp_mode_override_main_pipe)
-				in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
-			else if (in_out->programming->display_config.plane_descriptors->overrides.legacy_svp_config == dml2_svp_mode_override_phantom_pipe)
-				in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
-			else if (in_out->programming->display_config.plane_descriptors->overrides.legacy_svp_config == dml2_svp_mode_override_phantom_pipe_no_data_return)
-				in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
-			else {
-				if (core->clean_me_up.mode_lib.mp.MaxActiveDRAMClockChangeLatencySupported[plane_index] >= core->clean_me_up.mode_lib.soc.power_management_parameters.dram_clk_change_blackout_us)
-					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_vactive;
-				else if (core->clean_me_up.mode_lib.mp.TWait[plane_index] >= core->clean_me_up.mode_lib.soc.power_management_parameters.dram_clk_change_blackout_us)
-					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_vblank;
-				else
-					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_not_supported;
-			}
+				if (in_out->programming->display_config.plane_descriptors[plane_index].overrides.legacy_svp_config == dml2_svp_mode_override_main_pipe)
+					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
+				else if (in_out->programming->display_config.plane_descriptors[plane_index].overrides.legacy_svp_config == dml2_svp_mode_override_phantom_pipe)
+					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
+				else if (in_out->programming->display_config.plane_descriptors[plane_index].overrides.legacy_svp_config == dml2_svp_mode_override_phantom_pipe_no_data_return)
+					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
+				else {
+					if (core->clean_me_up.mode_lib.mp.MaxActiveDRAMClockChangeLatencySupported[plane_index] >= core->clean_me_up.mode_lib.soc.power_management_parameters.dram_clk_change_blackout_us)
+						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_vactive;
+					else if (core->clean_me_up.mode_lib.mp.TWait[plane_index] >= core->clean_me_up.mode_lib.soc.power_management_parameters.dram_clk_change_blackout_us)
+						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_vblank;
+					else
+						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_not_supported;
+				}
 
 				dml2_core_calcs_get_mall_allocation(&core->clean_me_up.mode_lib, &in_out->programming->plane_programming[plane_index].surface_size_mall_bytes, dml_internal_pipe_index);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h
index 235280c6dcf5..e62b2d3eeee6 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_CORE_DCN4_H__
 #define __DML2_CORE_DCN4_H__
 bool core_dcn4_initialize(struct dml2_core_initialize_in_out *in_out);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 6f4026e396e0..45e43a915fd6 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -10,10 +10,7 @@
 #include "dml_top_types.h"
 #include "dml2_core_shared.h"
 
-#define DML_VM_PTE_ADL_PATCH_EN
 //#define DML_TVM_UPDATE_EN
-#define DML_TDLUT_ROW_BYTES_FIX_EN
-#define DML_REG_LIMIT_CLAMP_EN
 #define DML2_MAX_FMT_420_BUFFER_WIDTH 4096
 #define DML_MAX_NUM_OF_SLICES_PER_DSC 4
 
@@ -235,6 +232,7 @@ dml_get_per_pipe_var_func(vstartup_calculated, unsigned int, mode_lib->mp.VStart
 dml_get_per_pipe_var_func(vupdate_offset, unsigned int, mode_lib->mp.VUpdateOffsetPix);
 dml_get_per_pipe_var_func(vupdate_width, unsigned int, mode_lib->mp.VUpdateWidthPix);
 dml_get_per_pipe_var_func(vready_offset, unsigned int, mode_lib->mp.VReadyOffsetPix);
+dml_get_per_pipe_var_func(pstate_keepout_dst_lines, unsigned int, mode_lib->mp.pstate_keepout_dst_lines);
 dml_get_per_pipe_var_func(det_stored_buffer_size_l_bytes, unsigned int, mode_lib->mp.DETBufferSizeY);
 dml_get_per_pipe_var_func(det_stored_buffer_size_c_bytes, unsigned int, mode_lib->mp.DETBufferSizeC);
 dml_get_per_pipe_var_func(det_buffer_size_kbytes, unsigned int, mode_lib->mp.DETBufferSizeInKByte);
@@ -2343,16 +2341,16 @@ static void calculate_mcache_row_bytes(
 		}
 
 		if (p->gpuvm_enable) {
-			meta_per_mvmpg_per_channel = (float)vmpg_bytes / 256 / p->num_chans;
+			meta_per_mvmpg_per_channel = (float)vmpg_bytes / (float)256 / p->num_chans;
 
 			//but using the est_blk_per_vmpg between 2 and 4, to be not as pessimestic
 			if (p->surf_vert && vmpg_bytes > blk_bytes) {
-				meta_per_mvmpg_per_channel = (float)est_blk_per_vmpg * blk_bytes / 256 / p->num_chans;
+				meta_per_mvmpg_per_channel = (float)est_blk_per_vmpg * blk_bytes / (float)256 / p->num_chans;
 			}
 
 			*p->dcc_dram_bw_nom_overhead_factor = 1 + math_max2(1.0 / 256.0, math_ceil2(meta_per_mvmpg_per_channel, p->mem_word_bytes) / (256 * meta_per_mvmpg_per_channel)); // dcc_dr_oh_nom
 		} else {
-			meta_per_mvmpg_per_channel = (float) blk_bytes / 256 / p->num_chans;
+			meta_per_mvmpg_per_channel = (float) blk_bytes / (float)256 / p->num_chans;
 
 			if (!p->surf_vert)
 				*p->dcc_dram_bw_nom_overhead_factor = 1 + 1.0 / 256.0;
@@ -3841,7 +3839,7 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 	*p->compbuf_reserved_space_64b = 2 * p->pixel_chunk_size_kbytes * 1024 / 64;
 	if (*p->UnboundedRequestEnabled) {
 		*p->compbuf_reserved_space_64b = (unsigned int)math_ceil2(math_max2(*p->compbuf_reserved_space_64b,
-			(double)(p->rob_buffer_size_kbytes * 1024 / 64) - (double)(RoundedUpSwathSizeBytesY[SurfaceDoingUnboundedRequest] * TTUFIFODEPTH / 64)), 1.0);
+			(double)(p->rob_buffer_size_kbytes * 1024 / 64) - (double)(RoundedUpSwathSizeBytesY[SurfaceDoingUnboundedRequest] * TTUFIFODEPTH / (p->mrq_present ? MAXIMUMCOMPRESSION : 1) / 64)), 1.0);
 #ifdef __DML_VBA_DEBUG__
 		dml2_printf("DML::%s: RoundedUpSwathSizeBytesY[%d] = %u\n", __func__, SurfaceDoingUnboundedRequest, RoundedUpSwathSizeBytesY[SurfaceDoingUnboundedRequest]);
 		dml2_printf("DML::%s: rob_buffer_size_kbytes = %u\n", __func__, p->rob_buffer_size_kbytes);
@@ -3852,21 +3850,20 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 #endif
 
 	*p->hw_debug5 = false;
-	if (!p->mrq_present) {
-		for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
-			if (!(*p->UnboundedRequestEnabled)
-				&& p->display_cfg->plane_descriptors[k].surface.dcc.enable
-				&& ((p->rob_buffer_size_kbytes * 1024 + *p->CompressedBufferSizeInkByte * MAXIMUMCOMPRESSION * 1024) > TTUFIFODEPTH * (RoundedUpSwathSizeBytesY[k] + RoundedUpSwathSizeBytesC[k])))
-				*p->hw_debug5 = true;
-#ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u UnboundedRequestEnabled = %u\n", __func__, k, *p->UnboundedRequestEnabled);
-			dml2_printf("DML::%s: k=%u MAXIMUMCOMPRESSION = %lu\n", __func__, k, MAXIMUMCOMPRESSION);
-			dml2_printf("DML::%s: k=%u TTUFIFODEPTH = %lu\n", __func__, k, TTUFIFODEPTH);
-			dml2_printf("DML::%s: k=%u CompressedBufferSizeInkByte = %u\n", __func__, k, *p->CompressedBufferSizeInkByte);
-			dml2_printf("DML::%s: k=%u RoundedUpSwathSizeBytesC = %u\n", __func__, k, RoundedUpSwathSizeBytesC[k]);
-			dml2_printf("DML::%s: k=%u hw_debug5 = %u\n", __func__, k, *p->hw_debug5);
+	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
+		if (!(p->mrq_present) && (!p->UnboundedRequestEnabled) && (TotalActiveDPP == 1)
+			&& p->display_cfg->plane_descriptors[k].surface.dcc.enable
+			&& ((p->rob_buffer_size_kbytes * 1024 * (p->mrq_present ? MAXIMUMCOMPRESSION : 1)
+				+ *p->CompressedBufferSizeInkByte * MAXIMUMCOMPRESSION * 1024) > TTUFIFODEPTH * (RoundedUpSwathSizeBytesY[k] + RoundedUpSwathSizeBytesC[k])))
+			*p->hw_debug5 = true;
+#ifdef __DML_VBA_DEBUG__
+		dml2_printf("DML::%s: k=%u UnboundedRequestEnabled = %u\n", __func__, k, *p->UnboundedRequestEnabled);
+		dml2_printf("DML::%s: k=%u MAXIMUMCOMPRESSION = %lu\n", __func__, k, MAXIMUMCOMPRESSION);
+		dml2_printf("DML::%s: k=%u TTUFIFODEPTH = %lu\n", __func__, k, TTUFIFODEPTH);
+		dml2_printf("DML::%s: k=%u CompressedBufferSizeInkByte = %u\n", __func__, k, *p->CompressedBufferSizeInkByte);
+		dml2_printf("DML::%s: k=%u RoundedUpSwathSizeBytesC = %u\n", __func__, k, RoundedUpSwathSizeBytesC[k]);
+		dml2_printf("DML::%s: k=%u hw_debug5 = %u\n", __func__, k, *p->hw_debug5);
 #endif
-		}
 	}
 }
 
@@ -4616,7 +4613,7 @@ static void calculate_tdlut_setting(
 		*p->tdlut_bytes_per_group = tdlut_bytes_per_line * tdlut_mpc_width;
 		//the delivery cycles is DispClk cycles per line * number of lines * number of slices
 		tdlut_delivery_cycles = (unsigned int)math_ceil2(tdlut_mpc_width/2.0, 1) * tdlut_mpc_width * tdlut_mpc_width;
-		tdlut_drain_rate = tdlut_bytes_per_line * p->dispclk_mhz / 9.0;
+		tdlut_drain_rate = tdlut_bytes_per_line * p->dispclk_mhz / math_ceil2(tdlut_mpc_width/2.0, 1);
 	} else {
 		//tdlut_addressing_mode = tdlut_simple_linear, 3dlut width should be 4*1229=4916 elements
 		*p->tdlut_bytes_per_frame = (unsigned int)math_ceil2(tdlut_width * tdlut_bpe, 256);
@@ -4980,11 +4977,14 @@ static void CalculateExtraLatency(
 
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: qos_type=%u\n", __func__, qos_type);
+	dml2_printf("DML::%s: hostvm_mode=%u\n", __func__, hostvm_mode);
+	dml2_printf("DML::%s: Tex_trips=%u\n", __func__, Tex_trips);
 	dml2_printf("DML::%s: max_oustanding_when_urgent_expected=%u\n", __func__, max_oustanding_when_urgent_expected);
 	dml2_printf("DML::%s: FabricClock=%f\n", __func__, FabricClock);
 	dml2_printf("DML::%s: DCFCLK=%f\n", __func__, DCFCLK);
 	dml2_printf("DML::%s: ReturnBW=%f\n", __func__, ReturnBW);
 	dml2_printf("DML::%s: RoundTripPingLatencyCycles=%u\n", __func__, RoundTripPingLatencyCycles);
+	dml2_printf("DML::%s: ReorderingBytes=%u\n", __func__, ReorderingBytes);
 	dml2_printf("DML::%s: Tarb=%f\n", __func__, Tarb);
 	dml2_printf("DML::%s: ExtraLatency=%f\n", __func__, *ExtraLatency);
 	dml2_printf("DML::%s: ExtraLatency_sr=%f\n", __func__, *ExtraLatency_sr);
@@ -5258,10 +5258,8 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->max_Tsw = (math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) * s->LineTime);
 
 	s->prefetch_sw_bytes = p->PrefetchSourceLinesY * p->swath_width_luma_ub * p->myPipe->BytePerPixelY + p->PrefetchSourceLinesC * p->swath_width_chroma_ub * p->myPipe->BytePerPixelC;
-#ifdef DML_TDLUT_ROW_BYTES_FIX_EN
 	s->prefetch_bw_pr = s->prefetch_bw_pr * p->mall_prefetch_sdp_overhead_factor;
 	s->prefetch_sw_bytes = s->prefetch_sw_bytes * p->mall_prefetch_sdp_overhead_factor;
-#endif
 	s->prefetch_bw_oto = math_max2(s->prefetch_bw_pr, s->prefetch_sw_bytes / s->max_Tsw);
 
 	s->min_Lsw_oto = math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) / __DML2_CALCS_MAX_VRATIO_PRE_OTO__;
@@ -5274,16 +5272,10 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	if (p->setup_for_tdlut)
 		vm_bytes = vm_bytes + p->tdlut_pte_bytes_per_frame + (p->display_cfg->gpuvm_enable ? extra_tdpe_bytes : 0);
 
-#ifdef DML_TDLUT_ROW_BYTES_FIX_EN
 	tdlut_row_bytes = (unsigned long) math_ceil2(p->tdlut_bytes_per_frame/2.0, 1.0);
-#else
-	tdlut_row_bytes = p->tdlut_pte_bytes_per_frame;
-#endif
-#ifdef DML_REG_LIMIT_CLAMP_EN
 	s->prefetch_bw_oto = math_max3(s->prefetch_bw_oto,
 					p->vm_bytes * p->HostVMInefficiencyFactor / (31 * s->LineTime) - *p->Tno_bw,
 					(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / (15 * s->LineTime));
-#endif
 	s->Lsw_oto = math_ceil2(4.0 * math_max2(s->prefetch_sw_bytes / s->prefetch_bw_oto / s->LineTime, s->min_Lsw_oto), 1.0) / 4.0;
 
 	if (p->display_cfg->gpuvm_enable == true) {
@@ -5542,11 +5534,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 				s->prefetch_bw_equ = s->prefetch_bw4;
 			}
 
-#ifdef DML_REG_LIMIT_CLAMP_EN
 			s->prefetch_bw_equ = math_max3(s->prefetch_bw_equ,
 							p->vm_bytes * p->HostVMInefficiencyFactor / (31 * s->LineTime) - *p->Tno_bw,
 							(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / (15 * s->LineTime));
-#endif
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: Case1OK: %u\n", __func__, Case1OK);
 			dml2_printf("DML::%s: Case2OK: %u\n", __func__, Case2OK);
@@ -6169,6 +6159,7 @@ static void CalculateFlipSchedule(
 	unsigned int dpte_row_height_chroma,
 	bool use_one_row_for_frame_flip,
 	unsigned int max_flip_time_us,
+	unsigned int max_flip_time_lines,
 	unsigned int per_pipe_flip_bytes,
 	unsigned int meta_row_bytes,
 	unsigned int meta_row_height,
@@ -6189,6 +6180,7 @@ static void CalculateFlipSchedule(
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: GPUVMEnable = %u\n", __func__, GPUVMEnable);
 	dml2_printf("DML::%s: ip.max_flip_time_us = %d\n", __func__, max_flip_time_us);
+	dml2_printf("DML::%s: ip.max_flip_time_lines = %d\n", __func__, max_flip_time_lines);
 	dml2_printf("DML::%s: BandwidthAvailableForImmediateFlip = %f\n", __func__, BandwidthAvailableForImmediateFlip);
 	dml2_printf("DML::%s: TotImmediateFlipBytes = %u\n", __func__, TotImmediateFlipBytes);
 	dml2_printf("DML::%s: use_lb_flip_bw = %u\n", __func__, use_lb_flip_bw);
@@ -6239,7 +6231,8 @@ static void CalculateFlipSchedule(
 
 		if (use_lb_flip_bw) {
 			// For mode check, calculation the flip bw requirement with worst case flip time
-			l->max_flip_time = math_min2(l->min_row_time, math_max2(Tvm_trips_flip_rounded + 2 * Tr0_trips_flip_rounded, (double)max_flip_time_us));
+			l->max_flip_time = math_min2(math_min2(l->min_row_time, (double)max_flip_time_lines * LineTime / VRatio),
+				math_max2(Tvm_trips_flip_rounded + 2 * Tr0_trips_flip_rounded, (double)max_flip_time_us));
 
 			//The lower bound on flip bandwidth
 			// Note: The get_urgent_bandwidth_required already consider dpte_row_bw and meta_row_bw in bandwidth calculation, so leave final_flip_bw = 0 if iflip not required
@@ -6541,7 +6534,8 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 
 		p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_unsupported;
 		if (uclk_pstate_change_strategy == dml2_uclk_pstate_change_strategy_auto) {
-			if (s->ActiveDRAMClockChangeLatencyMargin[k] > 0 && reserved_vblank_time_us >= p->mmSOCParameters.DRAMClockChangeLatency)
+			if (p->display_cfg->overrides.all_streams_blanked ||
+					(s->ActiveDRAMClockChangeLatencyMargin[k] > 0 && reserved_vblank_time_us >= p->mmSOCParameters.DRAMClockChangeLatency))
 				p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_vblank_and_vactive;
 			else if (s->ActiveDRAMClockChangeLatencyMargin[k] > 0)
 				p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_vactive;
@@ -6921,6 +6915,28 @@ static double get_g6_temp_read_blackout_us(
 	return (double)blackout_us;
 }
 
+static void calculate_pstate_keepout_dst_lines(
+		const struct dml2_display_cfg *display_cfg,
+		const struct dml2_core_internal_watermarks *watermarks,
+		unsigned int pstate_keepout_dst_lines[])
+{
+	const struct dml2_stream_parameters *stream_descriptor;
+	unsigned int i;
+
+	for (i = 0; i < display_cfg->num_planes; i++) {
+		if (!dml_is_phantom_pipe(&display_cfg->plane_descriptors[i])) {
+			stream_descriptor = &display_cfg->stream_descriptors[display_cfg->plane_descriptors[i].stream_index];
+
+			pstate_keepout_dst_lines[i] =
+					(unsigned int)math_ceil(watermarks->DRAMClockChangeWatermark / ((double)stream_descriptor->timing.h_total * 1000.0 / (double)stream_descriptor->timing.pixel_clock_khz));
+
+			if (pstate_keepout_dst_lines[i] > stream_descriptor->timing.v_total - 1) {
+				pstate_keepout_dst_lines[i] = stream_descriptor->timing.v_total - 1;
+			}
+		}
+	}
+}
+
 static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out_params)
 {
 	struct dml2_core_internal_display_mode_lib *mode_lib = in_out_params->mode_lib;
@@ -7126,7 +7142,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	mode_lib->ms.support.WritebackLatencySupport = true;
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
 		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true &&
-			(mode_lib->ms.WriteBandwidth[k] > mode_lib->ip.writeback_interface_buffer_size_kbytes * 1024.0 / mode_lib->soc.qos_parameters.writeback.base_latency_us)) {
+			(mode_lib->ms.WriteBandwidth[k] > mode_lib->ip.writeback_interface_buffer_size_kbytes * 1024 / mode_lib->soc.qos_parameters.writeback.base_latency_us)) {
 			mode_lib->ms.support.WritebackLatencySupport = false;
 		}
 	}
@@ -7466,6 +7482,10 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			&mode_lib->ms.OutputRate[k],
 			&mode_lib->ms.RequiredSlots[k]);
 
+		if (s->OutputBpp[k] == 0.0) {
+			s->OutputBpp[k] = mode_lib->ms.OutputBpp[k];
+		}
+
 		if (mode_lib->ms.RequiresDSC[k] == false) {
 			mode_lib->ms.ODMMode[k] = s->ODMModeNoDSC;
 			mode_lib->ms.RequiredDISPCLKPerSurface[k] = s->RequiredDISPCLKPerSurfaceNoDSC;
@@ -7819,7 +7839,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		mode_lib->ms.DSCDelay[k] = DSCDelayRequirement(mode_lib->ms.RequiresDSC[k],
 			mode_lib->ms.ODMMode[k],
 			mode_lib->ip.maximum_dsc_bits_per_component,
-			mode_lib->ms.OutputBpp[k],
+			s->OutputBpp[k],
 			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active,
 			display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
 			mode_lib->ms.support.NumberOfDSCSlices[k],
@@ -8247,7 +8267,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
@@ -8501,10 +8521,15 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 		min_return_bw_for_latency = mode_lib->ms.support.urg_bandwidth_available_min_latency[dml2_core_internal_soc_state_sys_active];
 
+		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn3)
+			s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+											mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+											mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_vm_only_bytes));
+
 		CalculateExtraLatency(
 			display_cfg,
 			mode_lib->ip.rob_buffer_size_kbytes,
-			0, //mode_lib->soc.round_trip_ping_latency_dcfclk_cycles,
+			mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles,
 			s->ReorderingBytes,
 			mode_lib->ms.DCFCLK,
 			mode_lib->ms.FabricClock,
@@ -8845,6 +8870,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 							mode_lib->ms.dpte_row_height_chroma[k],
 							mode_lib->ms.use_one_row_for_frame_flip[k],
 							mode_lib->ip.max_flip_time_us,
+							mode_lib->ip.max_flip_time_lines,
 							s->per_pipe_flip_bytes[k],
 							mode_lib->ms.meta_row_bytes[k],
 							s->meta_row_height_luma[k],
@@ -8979,6 +9005,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		CalculateWatermarks_params->VActiveLatencyHidingUs = mode_lib->ms.VActiveLatencyHidingUs;
 
 		CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(&mode_lib->scratch, CalculateWatermarks_params);
+
+		calculate_pstate_keepout_dst_lines(display_cfg, &mode_lib->ms.support.watermarks, s->dummy_integer_array[0]);
 	}
 
 	// End of Prefetch Check
@@ -9373,11 +9401,9 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 			} else {
 				dpte_groups_per_row_luma_ub = (unsigned int)(math_ceil2((double)p->dpte_row_width_luma_ub[k] / (double)dpte_group_width_luma, 1.0));
 			}
-#ifdef DML_VM_PTE_ADL_PATCH_EN
 			if (dpte_groups_per_row_luma_ub <= 2) {
 				dpte_groups_per_row_luma_ub = dpte_groups_per_row_luma_ub + 1;
 			}
-#endif
 			dml2_printf("DML::%s: k=%u, use_one_row_for_frame = %u\n", __func__, k, p->use_one_row_for_frame[k]);
 			dml2_printf("DML::%s: k=%u, dpte_group_bytes = %u\n", __func__, k, p->dpte_group_bytes[k]);
 			dml2_printf("DML::%s: k=%u, PTERequestSizeY = %u\n", __func__, k, p->PTERequestSizeY[k]);
@@ -9406,11 +9432,9 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 				} else {
 					dpte_groups_per_row_chroma_ub = (unsigned int)(math_ceil2((double)p->dpte_row_width_chroma_ub[k] / (double)dpte_group_width_chroma, 1.0));
 				}
-#ifdef DML_VM_PTE_ADL_PATCH_EN
 				if (dpte_groups_per_row_chroma_ub <= 2) {
 					dpte_groups_per_row_chroma_ub = dpte_groups_per_row_chroma_ub + 1;
 				}
-#endif
 				dml2_printf("DML::%s: k=%u, dpte_row_width_chroma_ub = %u\n", __func__, k, p->dpte_row_width_chroma_ub[k]);
 				dml2_printf("DML::%s: k=%u, dpte_group_width_chroma = %u\n", __func__, k, dpte_group_width_chroma);
 				dml2_printf("DML::%s: k=%u, dpte_groups_per_row_chroma_ub = %u\n", __func__, k, dpte_groups_per_row_chroma_ub);
@@ -9535,17 +9559,16 @@ static void CalculateVMGroupAndRequestTimes(
 
 			line_time = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / pixel_clock_mhz;
 
-#ifdef DML_VM_PTE_ADL_PATCH_EN
-			if (num_group_per_lower_vm_stage_flip <= 2) {
-				num_group_per_lower_vm_stage_flip = num_group_per_lower_vm_stage_flip + 1;
-			}
+			if (num_group_per_lower_vm_stage_pref > 0)
+				TimePerVMGroupVBlank[k] = dst_y_per_vm_vblank[k] * line_time / num_group_per_lower_vm_stage_pref;
+			else
+				TimePerVMGroupVBlank[k] = 0;
+
+			if (num_group_per_lower_vm_stage_flip > 0)
+				TimePerVMGroupFlip[k] = dst_y_per_vm_flip[k] * line_time / num_group_per_lower_vm_stage_flip;
+			else
+				TimePerVMGroupFlip[k] = 0;
 
-			if (num_group_per_lower_vm_stage_pref <= 2) {
-				num_group_per_lower_vm_stage_pref = num_group_per_lower_vm_stage_pref + 1;
-			}
-#endif
-			TimePerVMGroupVBlank[k] = dst_y_per_vm_vblank[k] * line_time / num_group_per_lower_vm_stage_pref;
-			TimePerVMGroupFlip[k] = dst_y_per_vm_flip[k] * line_time / num_group_per_lower_vm_stage_flip;
 			if (num_req_per_lower_vm_stage_pref > 0)
 				TimePerVMRequestVBlank[k] = dst_y_per_vm_vblank[k] * line_time / num_req_per_lower_vm_stage_pref;
 			else
@@ -9599,10 +9622,6 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	bool FoundCriticalSurface = false;
 	double LastZ8StutterPeriod = 0;
 
-	unsigned int SwathSizeCriticalSurface;
-	unsigned int LastChunkOfSwathSize;
-	unsigned int MissingPartOfLastSwathOfDETSize;
-
 	memset(l, 0, sizeof(struct dml2_core_calcs_CalculateStutterEfficiency_locals));
 
 	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
@@ -9777,7 +9796,7 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	l->StutterBurstTime = l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer
 		/ (p->ReturnBW * (p->hw_debug5 ? 1 : l->AverageDCCCompressionRate)) +
 		(*p->StutterPeriod * p->TotalDataReadBandwidth - l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer)
-		/ math_max2(p->DCFCLK * 64, p->ReturnBW * (p->hw_debug5 ? 1 : l->AverageDCCCompressionRate)) +
+		/ math_min2(p->DCFCLK * 64, p->ReturnBW * (p->hw_debug5 ? 1 : l->AverageDCCCompressionRate)) +
 		*p->StutterPeriod * l->TotalRowReadBandwidth / p->ReturnBW;
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: Part 1 = %f\n", __func__, l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer / p->ReturnBW / (p->hw_debug5 ? 1 : l->AverageDCCCompressionRate));
@@ -9871,19 +9890,11 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	dml2_printf("DML::%s: Z8NumberOfStutterBurstsPerFrame = %u\n", __func__, *p->Z8NumberOfStutterBurstsPerFrame);
 #endif
 
-	SwathSizeCriticalSurface = (unsigned int)(l->BytePerPixelYCriticalSurface * l->SwathHeightYCriticalSurface * math_ceil2(l->SwathWidthYCriticalSurface, l->BlockWidth256BytesYCriticalSurface));
-	LastChunkOfSwathSize = SwathSizeCriticalSurface % (p->PixelChunkSizeInKByte * 1024);
-	MissingPartOfLastSwathOfDETSize = (unsigned int)(math_ceil2(l->DETBufferSizeYCriticalSurface, SwathSizeCriticalSurface) - l->DETBufferSizeYCriticalSurface);
-
-	*p->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = !(!p->UnboundedRequestEnabled && (p->NumberOfActiveSurfaces == 1) && l->SinglePlaneCriticalSurface && l->SinglePipeCriticalSurface && (LastChunkOfSwathSize > 0) &&
-		(LastChunkOfSwathSize <= 4096) && (MissingPartOfLastSwathOfDETSize > 0) && (MissingPartOfLastSwathOfDETSize <= LastChunkOfSwathSize));
+	*p->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = !(!p->UnboundedRequestEnabled && (p->NumberOfActiveSurfaces == 1) && l->SinglePlaneCriticalSurface && l->SinglePipeCriticalSurface);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: SwathSizeCriticalSurface = %u\n", __func__, SwathSizeCriticalSurface);
 	dml2_printf("DML::%s: DETBufferSizeYCriticalSurface = %u\n", __func__, l->DETBufferSizeYCriticalSurface);
 	dml2_printf("DML::%s: PixelChunkSizeInKByte = %u\n", __func__, p->PixelChunkSizeInKByte);
-	dml2_printf("DML::%s: LastChunkOfSwathSize = %u\n", __func__, LastChunkOfSwathSize);
-	dml2_printf("DML::%s: MissingPartOfLastSwathOfDETSize = %u\n", __func__, MissingPartOfLastSwathOfDETSize);
 	dml2_printf("DML::%s: DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = %u\n", __func__, *p->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
 #endif
 }
@@ -10462,11 +10473,16 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		calculate_tdlut_setting(&mode_lib->scratch, calculate_tdlut_setting_params);
 	}
 
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn3)
+		s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+										mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+										mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_vm_only_bytes));
+
 	CalculateExtraLatency(
 		display_cfg,
 		mode_lib->ip.rob_buffer_size_kbytes,
-		0, //mode_lib->soc.round_trip_ping_latency_dcfclk_cycles,
-		s->ReorderBytes,
+		mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles,
+		s->ReorderingBytes,
 		mode_lib->mp.Dcfclk,
 		mode_lib->mp.FabricClock,
 		mode_lib->ip.pixel_chunk_size_kbytes,
@@ -10994,6 +11010,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 					mode_lib->mp.dpte_row_height_chroma[k],
 					mode_lib->mp.use_one_row_for_frame_flip[k],
 					mode_lib->ip.max_flip_time_us,
+					mode_lib->ip.max_flip_time_lines,
 					s->per_pipe_flip_bytes[k],
 					mode_lib->mp.meta_row_bytes[k],
 					mode_lib->mp.meta_row_height[k],
@@ -11203,6 +11220,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			}
 		}
 
+		calculate_pstate_keepout_dst_lines(display_cfg, &mode_lib->mp.Watermark, mode_lib->mp.pstate_keepout_dst_lines);
+
 		dml2_printf("DML::%s: DEBUG stream_index = %0d\n", __func__, display_cfg->plane_descriptors[0].stream_index);
 		dml2_printf("DML::%s: DEBUG PixelClock = %d kHz\n", __func__, (display_cfg->stream_descriptors[display_cfg->plane_descriptors[0].stream_index].timing.pixel_clock_khz));
 
@@ -12190,6 +12209,7 @@ void dml2_core_calcs_get_global_sync_programming(const struct dml2_core_internal
 	out->dcn4.vstartup_lines = dml_get_vstartup_calculated(mode_lib, pipe_index);
 	out->dcn4.vupdate_offset_pixels = dml_get_vupdate_offset(mode_lib, pipe_index);
 	out->dcn4.vupdate_vupdate_width_pixels = dml_get_vupdate_width(mode_lib, pipe_index);
+	out->dcn4.pstate_keepout_start_lines = dml_get_pstate_keepout_dst_lines(mode_lib, pipe_index);
 }
 
 void dml2_core_calcs_get_stream_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_per_stream_programming *out, int pipe_index)
@@ -12197,6 +12217,18 @@ void dml2_core_calcs_get_stream_programming(const struct dml2_core_internal_disp
 	dml2_core_calcs_get_global_sync_programming(mode_lib, &out->global_sync, pipe_index);
 }
 
+void dml2_core_calcs_get_global_fams2_programming(const struct dml2_core_internal_display_mode_lib *mode_lib,
+		const struct display_configuation_with_meta *display_cfg,
+		struct dmub_cmd_fams2_global_config *fams2_global_config)
+{
+	fams2_global_config->max_allow_delay_us = mode_lib->ip_caps.fams2.max_allow_delay_us;
+	fams2_global_config->lock_wait_time_us = mode_lib->ip_caps.fams2.lock_timeout_us;
+	fams2_global_config->recovery_timeout_us = mode_lib->ip_caps.fams2.recovery_timeout_us;
+	fams2_global_config->hwfq_flip_programming_delay_us = mode_lib->ip_caps.fams2.flip_programming_delay_us;
+
+	fams2_global_config->num_streams = display_cfg->display_config.num_streams;
+}
+
 void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_internal_display_mode_lib *mode_lib,
 		const struct display_configuation_with_meta *display_cfg,
 		struct dmub_fams2_stream_static_state *fams2_programming,
@@ -12209,6 +12241,11 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 
 	unsigned int i;
 
+	if (display_cfg->display_config.overrides.all_streams_blanked) {
+		/* stream is blanked, so do nothing */
+		return;
+	}
+
 	/* from display configuration */
 	fams2_programming->htotal = (uint16_t)stream_descriptor->timing.h_total;
 	fams2_programming->vtotal = (uint16_t)stream_descriptor->timing.v_total;
@@ -12368,6 +12405,7 @@ void dml2_core_calcs_get_stream_support_info(const struct dml2_display_cfg *disp
 {
 	double phantom_processing_delay_pix;
 	unsigned int phantom_processing_delay_lines;
+	unsigned int phantom_min_v_active_lines;
 	unsigned int phantom_v_active_lines;
 	unsigned int phantom_v_startup_lines;
 	unsigned int phantom_v_blank_lines;
@@ -12384,7 +12422,9 @@ void dml2_core_calcs_get_stream_support_info(const struct dml2_display_cfg *disp
 		phantom_processing_delay_lines++;
 
 	phantom_v_startup_lines = dml_get_plane_max_vstartup_lines(mode_lib, plane_index);
-	phantom_v_active_lines = phantom_processing_delay_lines + dml_get_plane_subviewport_lines_needed_in_mall(mode_lib, plane_index) + mode_lib->ip.subvp_swath_height_margin_lines;
+	phantom_min_v_active_lines = (unsigned int)math_ceil((double)dml_get_plane_subviewport_lines_needed_in_mall(mode_lib, plane_index) /
+			display_cfg->plane_descriptors[plane_index].composition.scaler_info.plane0.v_ratio);
+	phantom_v_active_lines = phantom_processing_delay_lines + phantom_min_v_active_lines + mode_lib->ip.subvp_swath_height_margin_lines;
 
 	// phantom_vblank = max(vbp(vstartup) + vactive + vfp(always 1) + vsync(can be 1), main_vblank)
 	phantom_v_blank_lines = phantom_v_startup_lines + 1 + 1;
@@ -12396,8 +12436,8 @@ void dml2_core_calcs_get_stream_support_info(const struct dml2_display_cfg *disp
 	// phantom_vtotal = vactive + vblank
 	out->phantom_v_total = phantom_v_active_lines + phantom_v_blank_lines;
 
-	out->phantom_min_v_active = dml_get_plane_subviewport_lines_needed_in_mall(mode_lib, plane_index);
-	out->phantom_v_startup = dml_get_plane_max_vstartup_lines(mode_lib, plane_index);
+	out->phantom_min_v_active = phantom_min_v_active_lines;
+	out->phantom_v_startup = phantom_v_startup_lines;
 
 	out->vblank_reserved_time_us = display_cfg->plane_descriptors[plane_index].overrides.reserved_vblank_time_ns / 1000;
 #if defined(__DML_VBA_DEBUG__)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h
index b280ab573fbb..df2d1550a14b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_CORE_DCN4_CALCS_H__
 #define __DML2_CORE_DCN4_CALCS_H__
 
@@ -30,6 +29,7 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 void dml2_core_calcs_get_stream_support_info(const struct dml2_display_cfg *display_cfg, const struct dml2_core_internal_display_mode_lib *mode_lib, struct core_stream_support_info *out, int plane_index);
 void dml2_core_calcs_get_mall_allocation(struct dml2_core_internal_display_mode_lib *mode_lib, unsigned int *out, int pipe_index);
 void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, const struct display_configuation_with_meta *display_cfg, struct dmub_fams2_stream_static_state *fams2_programming, enum dml2_uclk_pstate_support_method pstate_method, int plane_index);
+void dml2_core_calcs_get_global_fams2_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, const struct display_configuation_with_meta *display_cfg, struct dmub_cmd_fams2_global_config *fams2_global_config);
 
 void dml2_core_calcs_get_dpte_row_height(unsigned int *dpte_row_height, struct dml2_core_internal_display_mode_lib *mode_lib, bool is_plane1, enum dml2_source_format_class SourcePixelFormat, enum dml2_swizzle_mode SurfaceTiling, enum dml2_rotation_angle ScanDirection, unsigned int pitch, unsigned int GPUVMMinPageSizeKBytes);
 void dml2_core_calcs_cursor_dlg_reg(struct dml2_cursor_dlg_regs *cursor_dlg_regs, const struct dml2_get_cursor_dlg_reg *p);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
index f56abe9ab919..640087e862f8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_core_factory.h"
 #include "dml2_core_dcn4.h"
 #include "dml2_external_lib_deps.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.h
index 53636a8f52aa..411c514fe65c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_CORE_FACTORY_H__
 #define __DML2_CORE_FACTORY_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
index 679b20031903..6d7701a97d3f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c
@@ -2242,11 +2242,15 @@ bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_ou
 		}
 
 		double min_return_bw_for_latency = mode_lib->ms.support.urg_bandwidth_available_min_latency[dml2_core_internal_soc_state_sys_active];
+		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn3)
+			s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+											mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+											mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_vm_only_bytes));
 
 		CalculateExtraLatency(
 			display_cfg,
 			mode_lib->ip.rob_buffer_size_kbytes,
-			0, //mode_lib->soc.round_trip_ping_latency_dcfclk_cycles,
+			mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles,
 			s->ReorderingBytes,
 			mode_lib->ms.DCFCLK,
 			mode_lib->ms.FabricClock,
@@ -5050,7 +5054,7 @@ static void calculate_mcache_row_bytes(
 		unsigned int meta_per_mvmpg_per_channel_ub = 0;
 
 		if (p->gpuvm_enable) {
-			meta_per_mvmpg_per_channel = (float)vmpg_bytes / 256 / p->num_chans;
+			meta_per_mvmpg_per_channel = (float)vmpg_bytes / (float)256 / p->num_chans;
 
 			//but using the est_blk_per_vmpg between 2 and 4, to be not as pessimestic
 			if (p->surf_vert && vmpg_bytes > blk_bytes) {
@@ -5059,7 +5063,7 @@ static void calculate_mcache_row_bytes(
 
 			*p->dcc_dram_bw_nom_overhead_factor = 1 + math_max2(1.0 / 256.0, math_ceil2(meta_per_mvmpg_per_channel, p->mem_word_bytes) / (256 * meta_per_mvmpg_per_channel)); // dcc_dr_oh_nom
 		} else {
-			meta_per_mvmpg_per_channel = (float)blk_bytes / 256 / p->num_chans;
+			meta_per_mvmpg_per_channel = (float)blk_bytes / (float)256 / p->num_chans;
 
 			if (!p->surf_vert)
 				*p->dcc_dram_bw_nom_overhead_factor = 1 + 1.0 / 256.0;
@@ -7165,7 +7169,7 @@ static void calculate_tdlut_setting(
 		*p->tdlut_bytes_per_group = tdlut_bytes_per_line * tdlut_mpc_width;
 		//the delivery cycles is DispClk cycles per line * number of lines * number of slices
 		tdlut_delivery_cycles = (unsigned int)math_ceil2(tdlut_mpc_width / 2.0, 1) * tdlut_mpc_width * tdlut_mpc_width;
-		tdlut_drain_rate = tdlut_bytes_per_line * p->dispclk_mhz / 9.0;
+		tdlut_drain_rate = tdlut_bytes_per_line * p->dispclk_mhz /  math_ceil2(tdlut_mpc_width/2.0, 1);
 	} else {
 		//tdlut_addressing_mode = tdlut_simple_linear, 3dlut width should be 4*1229=4916 elements
 		*p->tdlut_bytes_per_frame = (unsigned int)math_ceil2(tdlut_width * tdlut_bpe, 256);
@@ -7501,11 +7505,14 @@ static void CalculateExtraLatency(
 
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: qos_type=%u\n", __func__, qos_type);
+	dml2_printf("DML::%s: hostvm_mode=%u\n", __func__, hostvm_mode);
+	dml2_printf("DML::%s: Tex_trips=%u\n", __func__, Tex_trips);
 	dml2_printf("DML::%s: max_oustanding_when_urgent_expected=%u\n", __func__, max_oustanding_when_urgent_expected);
 	dml2_printf("DML::%s: FabricClock=%f\n", __func__, FabricClock);
 	dml2_printf("DML::%s: DCFCLK=%f\n", __func__, DCFCLK);
 	dml2_printf("DML::%s: ReturnBW=%f\n", __func__, ReturnBW);
 	dml2_printf("DML::%s: RoundTripPingLatencyCycles=%u\n", __func__, RoundTripPingLatencyCycles);
+	dml2_printf("DML::%s: ReorderingBytes=%u\n", __func__, ReorderingBytes);
 	dml2_printf("DML::%s: Tarb=%f\n", __func__, Tarb);
 	dml2_printf("DML::%s: ExtraLatency=%f\n", __func__, *ExtraLatency);
 	dml2_printf("DML::%s: ExtraLatency_sr=%f\n", __func__, *ExtraLatency_sr);
@@ -7739,7 +7746,6 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->max_Tsw = (math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) * s->LineTime);
 
 	s->prefetch_sw_bytes = p->PrefetchSourceLinesY * p->swath_width_luma_ub * p->myPipe->BytePerPixelY + p->PrefetchSourceLinesC * p->swath_width_chroma_ub * p->myPipe->BytePerPixelC;
-
 	s->prefetch_bw_pr = s->prefetch_bw_pr * p->mall_prefetch_sdp_overhead_factor;
 	s->prefetch_sw_bytes = s->prefetch_sw_bytes * p->mall_prefetch_sdp_overhead_factor;
 	s->prefetch_bw_oto = math_max2(s->prefetch_bw_pr, s->prefetch_sw_bytes / s->max_Tsw);
@@ -9304,6 +9310,10 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 				dpte_groups_per_row_luma_ub = (unsigned int)(math_ceil2((double)p->dpte_row_width_luma_ub[k] / (double)dpte_group_width_luma, 1.0));
 			}
 
+			if (dpte_groups_per_row_luma_ub <= 2) {
+				dpte_groups_per_row_luma_ub = dpte_groups_per_row_luma_ub + 1;
+			}
+
 			dml2_printf("DML::%s: k=%u, use_one_row_for_frame = %u\n", __func__, k, p->use_one_row_for_frame[k]);
 			dml2_printf("DML::%s: k=%u, dpte_group_bytes = %u\n", __func__, k, p->dpte_group_bytes[k]);
 			dml2_printf("DML::%s: k=%u, PTERequestSizeY = %u\n", __func__, k, p->PTERequestSizeY[k]);
@@ -9332,6 +9342,9 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 				} else {
 					dpte_groups_per_row_chroma_ub = (unsigned int)(math_ceil2((double)p->dpte_row_width_chroma_ub[k] / (double)dpte_group_width_chroma, 1.0));
 				}
+				if (dpte_groups_per_row_chroma_ub <= 2) {
+					dpte_groups_per_row_chroma_ub = dpte_groups_per_row_chroma_ub + 1;
+				}
 				dml2_printf("DML::%s: k=%u, dpte_row_width_chroma_ub = %u\n", __func__, k, p->dpte_row_width_chroma_ub[k]);
 				dml2_printf("DML::%s: k=%u, dpte_group_width_chroma = %u\n", __func__, k, dpte_group_width_chroma);
 				dml2_printf("DML::%s: k=%u, dpte_groups_per_row_chroma_ub = %u\n", __func__, k, dpte_groups_per_row_chroma_ub);
@@ -9451,6 +9464,14 @@ static void CalculateVMGroupAndRequestTimes(
 
 			double line_time = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / pixel_clock_mhz;
 
+			if (num_group_per_lower_vm_stage_flip <= 2) {
+				num_group_per_lower_vm_stage_flip = num_group_per_lower_vm_stage_flip + 1;
+			}
+
+			if (num_group_per_lower_vm_stage_pref <= 2) {
+				num_group_per_lower_vm_stage_pref = num_group_per_lower_vm_stage_pref + 1;
+			}
+
 			TimePerVMGroupVBlank[k] = dst_y_per_vm_vblank[k] * line_time / num_group_per_lower_vm_stage_pref;
 			TimePerVMGroupFlip[k] = dst_y_per_vm_flip[k] * line_time / num_group_per_lower_vm_stage_flip;
 			TimePerVMRequestVBlank[k] = dst_y_per_vm_vblank[k] * line_time / num_req_per_lower_vm_stage_pref;
@@ -10388,11 +10409,16 @@ bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_e
 		calculate_tdlut_setting(&mode_lib->scratch, calculate_tdlut_setting_params);
 	}
 
+	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn3)
+		s->ReorderingBytes = (unsigned int)(mode_lib->soc.clk_table.dram_config.channel_count * math_max3(mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+										mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+										mode_lib->soc.qos_parameters.qos_params.dcn3.urgent_out_of_order_return_per_channel_vm_only_bytes));
+
 	CalculateExtraLatency(
 		display_cfg,
 		mode_lib->ip.rob_buffer_size_kbytes,
-		0, //mode_lib->soc.round_trip_ping_latency_dcfclk_cycles,
-		s->ReorderBytes,
+		mode_lib->soc.qos_parameters.qos_params.dcn3.loaded_round_trip_latency_fclk_cycles,
+		s->ReorderingBytes,
 		mode_lib->mp.Dcfclk,
 		mode_lib->mp.FabricClock,
 		mode_lib->ip.pixel_chunk_size_kbytes,
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
index d76bda907ec8..f3356b072b59 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_CORE_SHARED_H__
 #define __DML2_CORE_SHARED_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index 1343b744eeb3..02498c0e3282 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_CORE_SHARED_TYPES_H__
 #define __DML2_CORE_SHARED_TYPES_H__
 
@@ -70,6 +69,7 @@ struct dml2_core_ip_params {
 	unsigned int words_per_channel;
 	bool imall_supported;
 	unsigned int max_flip_time_us;
+	unsigned int max_flip_time_lines;
 	unsigned int subvp_swath_height_margin_lines;
 	unsigned int subvp_fw_processing_delay_us;
 	unsigned int subvp_pstate_allow_width_us;
@@ -782,6 +782,7 @@ struct dml2_core_internal_mode_program {
 	unsigned int VUpdateOffsetPix[DML2_MAX_PLANES];
 	unsigned int VUpdateWidthPix[DML2_MAX_PLANES];
 	unsigned int VReadyOffsetPix[DML2_MAX_PLANES];
+	unsigned int pstate_keepout_dst_lines[DML2_MAX_PLANES];
 
 	// Latency and Support
 	double MaxActiveFCLKChangeLatencySupported;
@@ -975,7 +976,7 @@ struct dml2_core_calcs_mode_programming_locals {
 
 	unsigned int DSCFormatFactor;
 	struct dml2_core_internal_DmlPipe SurfaceParameters[DML2_MAX_PLANES];
-	unsigned int ReorderBytes;
+	unsigned int ReorderingBytes;
 	double HostVMInefficiencyFactor;
 	double HostVMInefficiencyFactorPrefetch;
 	unsigned int TotalDCCActiveDPP;
@@ -2010,6 +2011,7 @@ struct dml2_core_internal_scratch {
 struct dml2_core_internal_display_mode_lib {
 	struct dml2_core_ip_params ip;
 	struct dml2_soc_bb soc;
+	struct dml2_ip_capabilities ip_caps;
 
 	//@brief Mode Support and Mode programming struct
 	// Used to hold input; intermediate and output of the calculations
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
index c94c4f32c957..0d847bccd5d2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_dpmm_dcn4.h"
 #include "dml2_internal_shared_types.h"
 #include "dml_top_types.h"
@@ -181,7 +180,7 @@ static bool add_margin_and_round_to_dfs_grainularity(double clock_khz, double ma
 
 	clock_khz *= 1.0 + margin;
 
-	divider = (unsigned int)((int)DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
+	divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
 
 	/* we want to floor here to get higher clock than required rather than lower */
 	if (divider < DFS_DIVIDER_RANGE_2_START) {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h
index 3afb69dfd040..b165c58dfd11 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_DPMM_DCN4_H__
 #define __DML2_DPMM_DCN4_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
index 2c983daf2dad..dfd01440737d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_dpmm_factory.h"
 #include "dml2_dpmm_dcn4.h"
 #include "dml2_external_lib_deps.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h
index 80b44b4c2e68..20ba2e446f1d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_DPMM_FACTORY_H__
 #define __DML2_DPMM_FACTORY_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c
index 5d8887ac766d..f4b1a7d02d42 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_mcg_dcn4.h"
 #include "dml_top_soc_parameter_types.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h
index 19d178651435..02da6f45cbf7 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_MCG_DCN4_H__
 #define __DML2_MCG_DCN4_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c
index 55085b85f8ed..c60b8fe90819 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_mcg_factory.h"
 #include "dml2_mcg_dcn4.h"
 #include "dml2_external_lib_deps.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h
index 5dfdfed04e22..ad307deca3b0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_MCG_FACTORY_H__
 #define __DML2_MCG_FACTORY_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
index 671f9ac2627c..717536d7bb30 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_pmo_factory.h"
 #include "dml2_pmo_dcn3.h"
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h
index cc350f88d4d2..f00bd9e72a86 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_PMO_DCN3_H__
 #define __DML2_PMO_DCN3_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
deleted file mode 100644
index 8952dd7e36cb..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
+++ /dev/null
@@ -1,1250 +0,0 @@
-// SPDX-License-Identifier: MIT
-//
-// Copyright 2024 Advanced Micro Devices, Inc.
-
-
-#include "dml2_pmo_factory.h"
-#include "dml2_pmo_dcn4.h"
-
-static const int MIN_VACTIVE_MARGIN_US = 100; // We need more than non-zero margin because DET buffer granularity can alter vactive latency hiding
-static const int SUBVP_DRR_MARGIN_US = 100;
-
-static const enum dml2_pmo_pstate_strategy full_strategy_list_1_display[][4] = {
-	// VActive Preferred
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Then SVP
-	{ dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Then VBlank
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Finally DRR
-	{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-};
-
-static const int full_strategy_list_1_display_size = sizeof(full_strategy_list_1_display) / (sizeof(enum dml2_pmo_pstate_strategy) * 4);
-
-static const enum dml2_pmo_pstate_strategy full_strategy_list_2_display[][4] = {
-	// VActive only is preferred
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Then VActive + VBlank
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Then VBlank only
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Then SVP + VBlank
-	{ dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Then SVP + SVP
-	{ dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Finally DRR + DRR
-	{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-};
-
-static const int full_strategy_list_2_display_size = sizeof(full_strategy_list_2_display) / (sizeof(enum dml2_pmo_pstate_strategy) * 4);
-
-static const enum dml2_pmo_pstate_strategy full_strategy_list_3_display[][4] = {
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na }, // All VActive
-
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na },  // VActive + 1 VBlank
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na },
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
-
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na },	// VActive + 2 VBlank
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
-//	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
-
-//	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na }, // VActive + 3 VBlank
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na },
-
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na }, // All VBlank
-
-	{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na }, // All DRR
-};
-
-static const int full_strategy_list_3_display_size = sizeof(full_strategy_list_3_display) / (sizeof(enum dml2_pmo_pstate_strategy) * 4);
-
-static const enum dml2_pmo_pstate_strategy full_strategy_list_4_display[][4] = {
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive }, // All VActive
-
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive },  // VActive + 1 VBlank
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive },
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive },
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank },
-
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive },	// VActive + 2 VBlank
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive },
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank },
-//	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive },
-//	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank },
-//	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank },
-
-//	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank }, // VActive + 3 VBlank
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank },
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank },
-//	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive },
-
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank }, // All Vblank
-
-	{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr }, // All DRR
-};
-
-static const int full_strategy_list_4_display_size = sizeof(full_strategy_list_4_display) / (sizeof(enum dml2_pmo_pstate_strategy) * 4);
-
-static bool increase_odm_combine_factor(enum dml2_odm_mode *odm_mode, int odms_calculated)
-{
-	bool result = true;
-
-	if (*odm_mode == dml2_odm_mode_auto) {
-		switch (odms_calculated) {
-		case 1:
-			*odm_mode = dml2_odm_mode_bypass;
-			break;
-		case 2:
-			*odm_mode = dml2_odm_mode_combine_2to1;
-			break;
-		case 3:
-			*odm_mode = dml2_odm_mode_combine_3to1;
-			break;
-		case 4:
-			*odm_mode = dml2_odm_mode_combine_4to1;
-			break;
-		default:
-			result = false;
-			break;
-		}
-	}
-
-	if (result) {
-		if (*odm_mode == dml2_odm_mode_bypass) {
-			*odm_mode = dml2_odm_mode_combine_2to1;
-		} else if (*odm_mode == dml2_odm_mode_combine_2to1) {
-			*odm_mode = dml2_odm_mode_combine_3to1;
-		} else if (*odm_mode == dml2_odm_mode_combine_3to1) {
-			*odm_mode = dml2_odm_mode_combine_4to1;
-		} else {
-			result = false;
-		}
-	}
-
-	return result;
-}
-
-static bool increase_mpc_combine_factor(unsigned int *mpc_combine_factor, unsigned int limit)
-{
-	if (*mpc_combine_factor < limit) {
-		(*mpc_combine_factor)++;
-		return true;
-	}
-
-	return false;
-}
-
-static int count_planes_with_stream_index(const struct dml2_display_cfg *display_cfg, unsigned int stream_index)
-{
-	unsigned int i;
-	int count;
-
-	count = 0;
-	for (i = 0; i < display_cfg->num_planes; i++) {
-		if (display_cfg->plane_descriptors[i].stream_index == stream_index)
-			count++;
-	}
-
-	return count;
-}
-
-static bool optimize_dcc_mcache_no_odm(struct dml2_pmo_optimize_dcc_mcache_in_out *in_out,
-	int free_pipes)
-{
-	struct dml2_pmo_instance *pmo = in_out->instance;
-
-	unsigned int i;
-	bool result = true;
-
-	for (i = 0; i < in_out->optimized_display_cfg->num_planes; i++) {
-		// For pipes that failed dcc mcache check, we want to increase the pipe count.
-		// The logic for doing this depends on how many pipes is already being used,
-		// and whether it's mpcc or odm combine.
-		if (!in_out->dcc_mcache_supported[i]) {
-			// For the general case of "n displays", we can only optimize streams with an ODM combine factor of 1
-			if (in_out->cfg_support_info->stream_support_info[in_out->optimized_display_cfg->plane_descriptors[i].stream_index].odms_used == 1) {
-				in_out->optimized_display_cfg->plane_descriptors[i].overrides.mpcc_combine_factor =
-					in_out->cfg_support_info->plane_support_info[i].dpps_used;
-				// For each plane that is not passing mcache validation, just add another pipe to it, up to the limit.
-				if (free_pipes > 0) {
-					if (!increase_mpc_combine_factor(&in_out->optimized_display_cfg->plane_descriptors[i].overrides.mpcc_combine_factor,
-						pmo->mpc_combine_limit)) {
-						// We've reached max pipes allocatable to a single plane, so we fail.
-						result = false;
-						break;
-					} else {
-						// Successfully added another pipe to this failing plane.
-						free_pipes--;
-					}
-				} else {
-					// No free pipes to add.
-					result = false;
-					break;
-				}
-			} else {
-				// If the stream of this plane needs ODM combine, no further optimization can be done.
-				result = false;
-				break;
-			}
-		}
-	}
-
-	return result;
-}
-
-bool pmo_dcn4_optimize_dcc_mcache(struct dml2_pmo_optimize_dcc_mcache_in_out *in_out)
-{
-	struct dml2_pmo_instance *pmo = in_out->instance;
-
-	unsigned int i, used_pipes, free_pipes, planes_on_stream;
-	bool result;
-
-	if (in_out->display_config != in_out->optimized_display_cfg) {
-		memcpy(in_out->optimized_display_cfg, in_out->display_config, sizeof(struct dml2_display_cfg));
-	}
-
-	//Count number of free pipes, and check if any odm combine is in use.
-	used_pipes = 0;
-	for (i = 0; i < in_out->optimized_display_cfg->num_planes; i++) {
-		used_pipes += in_out->cfg_support_info->plane_support_info[i].dpps_used;
-	}
-	free_pipes = pmo->ip_caps->pipe_count - used_pipes;
-
-	// Optimization loop
-	// The goal here is to add more pipes to any planes
-	// which are failing mcache admissibility
-	result = true;
-
-	// The optimization logic depends on whether ODM combine is enabled, and the stream count.
-	if (in_out->optimized_display_cfg->num_streams > 1) {
-		// If there are multiple streams, we are limited to only be able to optimize mcache failures on planes
-		// which are not ODM combined.
-
-		result = optimize_dcc_mcache_no_odm(in_out, free_pipes);
-	} else if (in_out->optimized_display_cfg->num_streams == 1) {
-		// In single stream cases, we still optimize mcache failures when there's ODM combine with some
-		// additional logic.
-
-		if (in_out->cfg_support_info->stream_support_info[0].odms_used > 1) {
-			// If ODM combine is enabled, then the logic is to increase ODM combine factor.
-
-			// Optimization for streams with > 1 ODM combine factor is only supported for single display.
-			planes_on_stream = count_planes_with_stream_index(in_out->optimized_display_cfg, 0);
-
-			for (i = 0; i < in_out->optimized_display_cfg->num_planes; i++) {
-				// For pipes that failed dcc mcache check, we want to increase the pipe count.
-				// The logic for doing this depends on how many pipes is already being used,
-				// and whether it's mpcc or odm combine.
-				if (!in_out->dcc_mcache_supported[i]) {
-					// Increasing ODM combine factor on a stream requires a free pipe for each plane on the stream.
-					if (free_pipes >= planes_on_stream) {
-						if (!increase_odm_combine_factor(&in_out->optimized_display_cfg->stream_descriptors[i].overrides.odm_mode,
-							in_out->cfg_support_info->plane_support_info[i].dpps_used)) {
-							result = false;
-						} else {
-							free_pipes -= planes_on_stream;
-							break;
-						}
-					} else {
-						result = false;
-						break;
-					}
-				}
-			}
-		} else {
-			// If ODM combine is not enabled, then we can actually use the same logic as before.
-
-			result = optimize_dcc_mcache_no_odm(in_out, free_pipes);
-		}
-	} else {
-		result = true;
-	}
-
-	return result;
-}
-
-bool pmo_dcn4_initialize(struct dml2_pmo_initialize_in_out *in_out)
-{
-	struct dml2_pmo_instance *pmo = in_out->instance;
-
-	pmo->soc_bb = in_out->soc_bb;
-	pmo->ip_caps = in_out->ip_caps;
-	pmo->mpc_combine_limit = 2;
-	pmo->odm_combine_limit = 4;
-	pmo->mcg_clock_table_size = in_out->mcg_clock_table_size;
-
-	pmo->fams_params.v1.subvp.fw_processing_delay_us = 10;
-	pmo->fams_params.v1.subvp.prefetch_end_to_mall_start_us = 50;
-	pmo->fams_params.v1.subvp.refresh_rate_limit_max = 175;
-	pmo->fams_params.v1.subvp.refresh_rate_limit_min = 0;
-
-	pmo->options = in_out->options;
-
-	return true;
-}
-
-static bool is_h_timing_divisible_by(const struct dml2_timing_cfg *timing, unsigned char denominator)
-{
-	/*
-	 * Htotal, Hblank start/end, and Hsync start/end all must be divisible
-	 * in order for the horizontal timing params to be considered divisible
-	 * by 2. Hsync start is always 0.
-	 */
-	unsigned long h_blank_start = timing->h_total - timing->h_front_porch;
-
-	return (timing->h_total % denominator == 0) &&
-			(h_blank_start % denominator == 0) &&
-			(timing->h_blank_end % denominator == 0) &&
-			(timing->h_sync_width % denominator == 0);
-}
-
-static bool is_dp_encoder(enum dml2_output_encoder_class encoder_type)
-{
-	switch (encoder_type) {
-	case dml2_dp:
-	case dml2_edp:
-	case dml2_dp2p0:
-	case dml2_none:
-		return true;
-	case dml2_hdmi:
-	case dml2_hdmifrl:
-	default:
-		return false;
-	}
-}
-
-bool pmo_dcn4_init_for_vmin(struct dml2_pmo_init_for_vmin_in_out *in_out)
-{
-	unsigned int i;
-	const struct dml2_display_cfg *display_config =
-			&in_out->base_display_config->display_config;
-	const struct dml2_core_mode_support_result *mode_support_result =
-			&in_out->base_display_config->mode_support_result;
-
-	if (in_out->instance->options->disable_dyn_odm ||
-			(in_out->instance->options->disable_dyn_odm_for_multi_stream && display_config->num_streams > 1))
-		return false;
-
-	for (i = 0; i < display_config->num_planes; i++)
-		/*
-		 * vmin optimization is required to be seamlessly switched off
-		 * at any time when the new configuration is no longer
-		 * supported. However switching from ODM combine to MPC combine
-		 * is not always seamless. When there not enough free pipes, we
-		 * will have to use the same secondary OPP heads as secondary
-		 * DPP pipes in MPC combine in new state. This transition is
-		 * expected to cause glitches. To avoid the transition, we only
-		 * allow vmin optimization if the stream's base configuration
-		 * doesn't require MPC combine. This condition checks if MPC
-		 * combine is enabled. If so do not optimize the stream.
-		 */
-		if (mode_support_result->cfg_support_info.plane_support_info[i].dpps_used > 1 &&
-				mode_support_result->cfg_support_info.stream_support_info[display_config->plane_descriptors[i].stream_index].odms_used == 1)
-			in_out->base_display_config->stage4.unoptimizable_streams[display_config->plane_descriptors[i].stream_index] = true;
-
-	for (i = 0; i < display_config->num_streams; i++) {
-		if (display_config->stream_descriptors[i].overrides.disable_dynamic_odm)
-			in_out->base_display_config->stage4.unoptimizable_streams[i] = true;
-		else if (in_out->base_display_config->stage3.stream_svp_meta[i].valid &&
-				in_out->instance->options->disable_dyn_odm_for_stream_with_svp)
-			in_out->base_display_config->stage4.unoptimizable_streams[i] = true;
-		/*
-		 * ODM Combine requires horizontal timing divisible by 2 so each
-		 * ODM segment has the same size.
-		 */
-		else if (!is_h_timing_divisible_by(&display_config->stream_descriptors[i].timing, 2))
-			in_out->base_display_config->stage4.unoptimizable_streams[i] = true;
-		/*
-		 * Our hardware support seamless ODM transitions for DP encoders
-		 * only.
-		 */
-		else if (!is_dp_encoder(display_config->stream_descriptors[i].output.output_encoder))
-			in_out->base_display_config->stage4.unoptimizable_streams[i] = true;
-	}
-
-	return true;
-}
-
-bool pmo_dcn4_test_for_vmin(struct dml2_pmo_test_for_vmin_in_out *in_out)
-{
-	bool is_vmin = true;
-
-	if (in_out->vmin_limits->dispclk_khz > 0 &&
-		in_out->display_config->mode_support_result.global.dispclk_khz > in_out->vmin_limits->dispclk_khz)
-		is_vmin = false;
-
-	return is_vmin;
-}
-
-static int find_highest_odm_load_stream_index(
-		const struct dml2_display_cfg *display_config,
-		const struct dml2_core_mode_support_result *mode_support_result)
-{
-	unsigned int i;
-	int odm_load, highest_odm_load = -1, highest_odm_load_index = -1;
-
-	for (i = 0; i < display_config->num_streams; i++) {
-		odm_load = display_config->stream_descriptors[i].timing.pixel_clock_khz
-				/ mode_support_result->cfg_support_info.stream_support_info[i].odms_used;
-		if (odm_load > highest_odm_load) {
-			highest_odm_load_index = i;
-			highest_odm_load = odm_load;
-		}
-	}
-
-	return highest_odm_load_index;
-}
-
-bool pmo_dcn4_optimize_for_vmin(struct dml2_pmo_optimize_for_vmin_in_out *in_out)
-{
-	int stream_index;
-	const struct dml2_display_cfg *display_config =
-			&in_out->base_display_config->display_config;
-	const struct dml2_core_mode_support_result *mode_support_result =
-			&in_out->base_display_config->mode_support_result;
-	unsigned int odms_used;
-	struct dml2_stream_parameters *stream_descriptor;
-	bool optimizable = false;
-
-	/*
-	 * highest odm load stream must be optimizable to continue as dispclk is
-	 * bounded by it.
-	 */
-	stream_index = find_highest_odm_load_stream_index(display_config,
-			mode_support_result);
-
-	if (stream_index < 0 ||
-			in_out->base_display_config->stage4.unoptimizable_streams[stream_index])
-		return false;
-
-	odms_used = mode_support_result->cfg_support_info.stream_support_info[stream_index].odms_used;
-	if ((int)odms_used >= in_out->instance->odm_combine_limit)
-		return false;
-
-	memcpy(in_out->optimized_display_config,
-			in_out->base_display_config,
-			sizeof(struct display_configuation_with_meta));
-
-	stream_descriptor = &in_out->optimized_display_config->display_config.stream_descriptors[stream_index];
-	while (!optimizable && increase_odm_combine_factor(
-			&stream_descriptor->overrides.odm_mode,
-			odms_used)) {
-		switch (stream_descriptor->overrides.odm_mode) {
-		case dml2_odm_mode_combine_2to1:
-			optimizable = true;
-			break;
-		case dml2_odm_mode_combine_3to1:
-			/*
-			 * In ODM Combine 3:1 OTG_valid_pixel rate is 1/4 of
-			 * actual pixel rate. Therefore horizontal timing must
-			 * be divisible by 4.
-			 */
-			if (is_h_timing_divisible_by(&display_config->stream_descriptors[stream_index].timing, 4)) {
-				if (mode_support_result->cfg_support_info.stream_support_info[stream_index].dsc_enable) {
-					/*
-					 * DSC h slice count must be divisible
-					 * by 3.
-					 */
-					if (mode_support_result->cfg_support_info.stream_support_info[stream_index].num_dsc_slices % 3 == 0)
-						optimizable = true;
-				} else {
-					optimizable = true;
-				}
-			}
-			break;
-		case dml2_odm_mode_combine_4to1:
-			/*
-			 * In ODM Combine 4:1 OTG_valid_pixel rate is 1/4 of
-			 * actual pixel rate. Therefore horizontal timing must
-			 * be divisible by 4.
-			 */
-			if (is_h_timing_divisible_by(&display_config->stream_descriptors[stream_index].timing, 4)) {
-				if (mode_support_result->cfg_support_info.stream_support_info[stream_index].dsc_enable) {
-					/*
-					 * DSC h slice count must be divisible
-					 * by 4.
-					 */
-					if (mode_support_result->cfg_support_info.stream_support_info[stream_index].num_dsc_slices % 4 == 0)
-						optimizable = true;
-				} else {
-					optimizable = true;
-				}
-			}
-			break;
-		case dml2_odm_mode_auto:
-		case dml2_odm_mode_bypass:
-		case dml2_odm_mode_split_1to2:
-		case dml2_odm_mode_mso_1to2:
-		case dml2_odm_mode_mso_1to4:
-		default:
-			break;
-		}
-	}
-
-	return optimizable;
-}
-
-static bool are_timings_trivially_synchronizable(const struct display_configuation_with_meta *display_config, int mask)
-{
-	unsigned char i;
-	bool identical = true;
-	bool contains_drr = false;
-	unsigned char remap_array[DML2_MAX_PLANES];
-	unsigned char remap_array_size = 0;
-
-	// Create a remap array to enable simple iteration through only masked stream indicies
-	for (i = 0; i < display_config->display_config.num_streams; i++) {
-		if (mask & (0x1 << i)) {
-			remap_array[remap_array_size++] = i;
-		}
-	}
-
-	// 0 or 1 display is always trivially synchronizable
-	if (remap_array_size <= 1)
-		return true;
-
-	for (i = 1; i < remap_array_size; i++) {
-		if (memcmp(&display_config->display_config.stream_descriptors[remap_array[i - 1]].timing,
-			&display_config->display_config.stream_descriptors[remap_array[i]].timing,
-			sizeof(struct dml2_timing_cfg))) {
-			identical = false;
-			break;
-		}
-	}
-
-	for (i = 0; i < remap_array_size; i++) {
-		if (display_config->display_config.stream_descriptors[remap_array[i]].timing.drr_config.enabled) {
-			contains_drr = true;
-			break;
-		}
-	}
-
-	return !contains_drr && identical;
-}
-
-static void set_bit_in_bitfield(unsigned int *bit_field, unsigned int bit_offset)
-{
-	*bit_field = *bit_field | (0x1 << bit_offset);
-}
-
-static bool is_bit_set_in_bitfield(unsigned int bit_field, unsigned int bit_offset)
-{
-	if (bit_field & (0x1 << bit_offset))
-		return true;
-
-	return false;
-}
-
-static bool are_all_timings_drr_enabled(const struct display_configuation_with_meta *display_config, int mask)
-{
-	unsigned char i;
-	for (i = 0; i < DML2_MAX_PLANES; i++) {
-		if (is_bit_set_in_bitfield(mask, i)) {
-			if (!display_config->display_config.stream_descriptors[i].timing.drr_config.enabled)
-				return false;
-		}
-	}
-
-	return true;
-}
-
-static void insert_into_candidate_list(const enum dml2_pmo_pstate_strategy *per_stream_pstate_strategy, int stream_count, struct dml2_pmo_scratch *scratch)
-{
-	int stream_index;
-
-	scratch->pmo_dcn4.allow_state_increase_for_strategy[scratch->pmo_dcn4.num_pstate_candidates] = true;
-
-	for (stream_index = 0; stream_index < stream_count; stream_index++) {
-		scratch->pmo_dcn4.per_stream_pstate_strategy[scratch->pmo_dcn4.num_pstate_candidates][stream_index] = per_stream_pstate_strategy[stream_index];
-
-		if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_vblank)
-			scratch->pmo_dcn4.allow_state_increase_for_strategy[scratch->pmo_dcn4.num_pstate_candidates] = false;
-	}
-
-	scratch->pmo_dcn4.num_pstate_candidates++;
-}
-
-static bool all_planes_match_strategy(const struct display_configuation_with_meta *display_cfg, int plane_mask, enum dml2_pmo_pstate_strategy strategy)
-{
-	unsigned char i;
-	enum dml2_uclk_pstate_change_strategy matching_strategy = (enum dml2_uclk_pstate_change_strategy) dml2_pmo_pstate_strategy_na;
-
-	if (strategy == dml2_pmo_pstate_strategy_vactive)
-		matching_strategy = dml2_uclk_pstate_change_strategy_force_vactive;
-	else if (strategy == dml2_pmo_pstate_strategy_vblank)
-		matching_strategy = dml2_uclk_pstate_change_strategy_force_vblank;
-	else if (strategy == dml2_pmo_pstate_strategy_fw_svp)
-		matching_strategy = dml2_uclk_pstate_change_strategy_force_mall_svp;
-	else if (strategy == dml2_pmo_pstate_strategy_fw_drr)
-		matching_strategy = dml2_uclk_pstate_change_strategy_force_drr;
-
-	for (i = 0; i < DML2_MAX_PLANES; i++) {
-		if (is_bit_set_in_bitfield(plane_mask, i)) {
-			if (display_cfg->display_config.plane_descriptors[i].overrides.uclk_pstate_change_strategy != dml2_uclk_pstate_change_strategy_auto &&
-				display_cfg->display_config.plane_descriptors[i].overrides.uclk_pstate_change_strategy != matching_strategy)
-				return false;
-		}
-	}
-
-	return true;
-}
-
-static bool subvp_subvp_schedulable(struct dml2_pmo_instance *pmo, const struct display_configuation_with_meta *display_cfg,
-	unsigned char *svp_stream_indicies, char svp_stream_count)
-{
-	struct dml2_pmo_scratch *s = &pmo->scratch;
-	int i;
-	int microschedule_lines, time_us, refresh_hz;
-	int max_microschedule_us = 0;
-	int vactive1_us, vactive2_us, vblank1_us, vblank2_us;
-
-	const struct dml2_timing_cfg *svp_timing1 = 0;
-	const struct dml2_implicit_svp_meta *svp_meta1 = 0;
-
-	const struct dml2_timing_cfg *svp_timing2 = 0;
-
-	if (svp_stream_count <= 1)
-		return true;
-	else if (svp_stream_count > 2)
-		return false;
-
-	/* Loop to calculate the maximum microschedule time between the two SubVP pipes,
-	 * and also to store the two main SubVP pipe pointers in subvp_pipes[2].
-	 */
-	for (i = 0; i < svp_stream_count; i++) {
-		svp_timing1 = &display_cfg->display_config.stream_descriptors[svp_stream_indicies[i]].timing;
-		svp_meta1 = &s->pmo_dcn4.stream_svp_meta[svp_stream_indicies[i]];
-
-		microschedule_lines = svp_meta1->v_active;
-
-		// Round up when calculating microschedule time (+ 1 at the end)
-		time_us = (int)((microschedule_lines * svp_timing1->h_total) / (double)(svp_timing1->pixel_clock_khz * 1000) * 1000000 +
-			pmo->fams_params.v1.subvp.prefetch_end_to_mall_start_us +	pmo->fams_params.v1.subvp.fw_processing_delay_us + 1);
-
-		if (time_us > max_microschedule_us)
-			max_microschedule_us = time_us;
-
-		refresh_hz = (int)((double)(svp_timing1->pixel_clock_khz * 1000) / (svp_timing1->v_total * svp_timing1->h_total));
-
-		if (refresh_hz < pmo->fams_params.v1.subvp.refresh_rate_limit_min ||
-			refresh_hz > pmo->fams_params.v1.subvp.refresh_rate_limit_max) {
-			return false;
-		}
-	}
-
-	svp_timing1 = &display_cfg->display_config.stream_descriptors[svp_stream_indicies[0]].timing;
-	svp_meta1 = &s->pmo_dcn4.stream_svp_meta[svp_stream_indicies[0]];
-
-	vactive1_us = (int)((svp_timing1->v_active * svp_timing1->h_total) / (double)(svp_timing1->pixel_clock_khz * 1000) * 1000000);
-
-	vblank1_us = (int)(((svp_timing1->v_total - svp_timing1->v_active) * svp_timing1->h_total) / (double)(svp_timing1->pixel_clock_khz * 1000) * 1000000);
-
-	svp_timing2 = &display_cfg->display_config.stream_descriptors[svp_stream_indicies[1]].timing;
-
-	vactive2_us = (int)((svp_timing2->v_active * svp_timing2->h_total) / (double)(svp_timing2->pixel_clock_khz * 1000) * 1000000);
-
-	vblank2_us = (int)(((svp_timing2->v_total - svp_timing2->v_active) * svp_timing2->h_total) / (double)(svp_timing2->pixel_clock_khz * 1000) * 1000000);
-
-	if ((vactive1_us - vblank2_us) / 2 > max_microschedule_us &&
-		(vactive2_us - vblank1_us) / 2 > max_microschedule_us)
-		return true;
-
-	return false;
-}
-
-static bool validate_svp_cofunctionality(struct dml2_pmo_instance *pmo,
-	const struct display_configuation_with_meta *display_cfg, int svp_stream_mask)
-{
-	bool result = false;
-	unsigned char stream_index;
-
-	unsigned char svp_stream_indicies[2] = { 0 };
-	unsigned char svp_stream_count = 0;
-
-	// Find the SVP streams, store only the first 2, but count all of them
-	for (stream_index = 0; stream_index < display_cfg->display_config.num_streams; stream_index++) {
-		if (is_bit_set_in_bitfield(svp_stream_mask, stream_index)) {
-			if (svp_stream_count < 2)
-				svp_stream_indicies[svp_stream_count] = stream_index;
-
-			svp_stream_count++;
-		}
-	}
-
-	if (svp_stream_count == 1) {
-		result = true; // 1 SVP is always co_functional
-	} else if (svp_stream_count == 2) {
-		result = subvp_subvp_schedulable(pmo, display_cfg, svp_stream_indicies, svp_stream_count);
-	}
-
-	return result;
-}
-
-static bool validate_drr_cofunctionality(struct dml2_pmo_instance *pmo,
-	const struct display_configuation_with_meta *display_cfg, int drr_stream_mask)
-{
-	unsigned char stream_index;
-	int drr_stream_count = 0;
-
-	// Find the SVP streams and count all of them
-	for (stream_index = 0; stream_index < display_cfg->display_config.num_streams; stream_index++) {
-		if (is_bit_set_in_bitfield(drr_stream_mask, stream_index)) {
-			drr_stream_count++;
-		}
-	}
-
-	return drr_stream_count <= 4;
-}
-
-static bool validate_svp_drr_cofunctionality(struct dml2_pmo_instance *pmo,
-	const struct display_configuation_with_meta *display_cfg, int svp_stream_mask, int drr_stream_mask)
-{
-	unsigned char stream_index;
-	int drr_stream_count = 0;
-	int svp_stream_count = 0;
-
-	int prefetch_us = 0;
-	int mall_region_us = 0;
-	int drr_frame_us = 0;	// nominal frame time
-	int subvp_active_us = 0;
-	int stretched_drr_us = 0;
-	int drr_stretched_vblank_us = 0;
-	int max_vblank_mallregion = 0;
-
-	const struct dml2_timing_cfg *svp_timing = 0;
-	const struct dml2_timing_cfg *drr_timing = 0;
-	const struct dml2_implicit_svp_meta *svp_meta = 0;
-
-	bool schedulable = false;
-
-	// Find the SVP streams and count all of them
-	for (stream_index = 0; stream_index < display_cfg->display_config.num_streams; stream_index++) {
-		if (is_bit_set_in_bitfield(svp_stream_mask, stream_index)) {
-			svp_timing = &display_cfg->display_config.stream_descriptors[stream_index].timing;
-			svp_meta = &pmo->scratch.pmo_dcn4.stream_svp_meta[stream_index];
-			svp_stream_count++;
-		}
-		if (is_bit_set_in_bitfield(drr_stream_mask, stream_index)) {
-			drr_timing = &display_cfg->display_config.stream_descriptors[stream_index].timing;
-			drr_stream_count++;
-		}
-	}
-
-	if (svp_stream_count == 1 && drr_stream_count == 1 && svp_timing != drr_timing) {
-		prefetch_us = (int)((svp_meta->v_total - svp_meta->v_front_porch)
-			* svp_timing->h_total /	(double)(svp_timing->pixel_clock_khz * 1000) * 1000000 +
-			pmo->fams_params.v1.subvp.prefetch_end_to_mall_start_us);
-
-		subvp_active_us = (int)(svp_timing->v_active * svp_timing->h_total /
-			(double)(svp_timing->pixel_clock_khz * 1000) * 1000000);
-
-		drr_frame_us = (int)(drr_timing->v_total * drr_timing->h_total /
-			(double)(drr_timing->pixel_clock_khz * 1000) * 1000000);
-
-		// P-State allow width and FW delays already included phantom_timing->v_addressable
-		mall_region_us = (int)(svp_meta->v_active * svp_timing->h_total /
-			(double)(svp_timing->pixel_clock_khz * 1000) * 1000000);
-
-		stretched_drr_us = drr_frame_us + mall_region_us + SUBVP_DRR_MARGIN_US;
-
-		drr_stretched_vblank_us = (int)((drr_timing->v_total - drr_timing->v_active) * drr_timing->h_total /
-			(double)(drr_timing->pixel_clock_khz * 1000) * 1000000 + (stretched_drr_us - drr_frame_us));
-
-		max_vblank_mallregion = drr_stretched_vblank_us > mall_region_us ? drr_stretched_vblank_us : mall_region_us;
-
-		/* We consider SubVP + DRR schedulable if the stretched frame duration of the DRR display (i.e. the
-		 * highest refresh rate + margin that can support UCLK P-State switch) passes the static analysis
-		 * for VBLANK: (VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
-		 * and the max of (VBLANK blanking time, MALL region)).
-		 */
-		if (stretched_drr_us < (1 / (double)drr_timing->drr_config.min_refresh_uhz) * 1000000 * 1000000 &&
-			subvp_active_us - prefetch_us - stretched_drr_us - max_vblank_mallregion > 0)
-			schedulable = true;
-	}
-
-	return schedulable;
-}
-
-static bool validate_svp_vblank_cofunctionality(struct dml2_pmo_instance *pmo,
-	const struct display_configuation_with_meta *display_cfg, int svp_stream_mask, int vblank_stream_mask)
-{
-	unsigned char stream_index;
-	int vblank_stream_count = 0;
-	int svp_stream_count = 0;
-
-	const struct dml2_timing_cfg *svp_timing = 0;
-	const struct dml2_timing_cfg *vblank_timing = 0;
-	const struct dml2_implicit_svp_meta *svp_meta = 0;
-
-	int prefetch_us = 0;
-	int mall_region_us = 0;
-	int vblank_frame_us = 0;
-	int subvp_active_us = 0;
-	int vblank_blank_us = 0;
-	int max_vblank_mallregion = 0;
-
-	bool schedulable = false;
-
-	// Find the SVP streams and count all of them
-	for (stream_index = 0; stream_index < display_cfg->display_config.num_streams; stream_index++) {
-		if (is_bit_set_in_bitfield(svp_stream_mask, stream_index)) {
-			svp_timing = &display_cfg->display_config.stream_descriptors[stream_index].timing;
-			svp_meta = &pmo->scratch.pmo_dcn4.stream_svp_meta[stream_index];
-			svp_stream_count++;
-		}
-		if (is_bit_set_in_bitfield(vblank_stream_mask, stream_index)) {
-			vblank_timing = &display_cfg->display_config.stream_descriptors[stream_index].timing;
-			vblank_stream_count++;
-		}
-	}
-
-	if (svp_stream_count == 1 && vblank_stream_count > 0) {
-		// Prefetch time is equal to VACTIVE + BP + VSYNC of the phantom pipe
-		// Also include the prefetch end to mallstart delay time
-		prefetch_us = (int)((svp_meta->v_total - svp_meta->v_front_porch) * svp_timing->h_total
-			/ (double)(svp_timing->pixel_clock_khz * 1000) * 1000000 +
-			pmo->fams_params.v1.subvp.prefetch_end_to_mall_start_us);
-
-		// P-State allow width and FW delays already included phantom_timing->v_addressable
-		mall_region_us = (int)(svp_meta->v_active * svp_timing->h_total /
-			(double)(svp_timing->pixel_clock_khz * 1000) * 1000000);
-
-		vblank_frame_us = (int)(vblank_timing->v_total * vblank_timing->h_total /
-			(double)(vblank_timing->pixel_clock_khz * 1000) * 1000000);
-
-		vblank_blank_us = (int)((vblank_timing->v_total - vblank_timing->v_active) * vblank_timing->h_total /
-			(double)(vblank_timing->pixel_clock_khz * 1000) * 1000000);
-
-		subvp_active_us = (int)(svp_timing->v_active * svp_timing->h_total /
-			(double)(svp_timing->pixel_clock_khz * 1000) * 1000000);
-
-		max_vblank_mallregion = vblank_blank_us > mall_region_us ? vblank_blank_us : mall_region_us;
-
-		// Schedulable if VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
-		// and the max of (VBLANK blanking time, MALL region)
-		// TODO: Possibly add some margin (i.e. the below conditions should be [...] > X instead of [...] > 0)
-		if (subvp_active_us - prefetch_us - vblank_frame_us - max_vblank_mallregion > 0)
-			schedulable = true;
-	}
-	return schedulable;
-}
-
-static bool validate_drr_vblank_cofunctionality(struct dml2_pmo_instance *pmo,
-	const struct display_configuation_with_meta *display_cfg, int drr_stream_mask, int vblank_stream_mask)
-{
-	return false;
-}
-
-static bool validate_pstate_support_strategy_cofunctionality(struct dml2_pmo_instance *pmo,
-	const struct display_configuation_with_meta *display_cfg, const enum dml2_pmo_pstate_strategy per_stream_pstate_strategy[4])
-{
-	struct dml2_pmo_scratch *s = &pmo->scratch;
-
-	unsigned char stream_index = 0;
-
-	unsigned int svp_count = 0;
-	unsigned int svp_stream_mask = 0;
-	unsigned int drr_count = 0;
-	unsigned int drr_stream_mask = 0;
-	unsigned int vactive_count = 0;
-	unsigned int vactive_stream_mask = 0;
-	unsigned int vblank_count = 0;
-	unsigned int vblank_stream_mask = 0;
-
-	bool strategy_matches_forced_requirements = true;
-
-	bool admissible = false;
-
-	// Tabulate everything
-	for (stream_index = 0; stream_index < display_cfg->display_config.num_streams; stream_index++) {
-
-		if (!all_planes_match_strategy(display_cfg, s->pmo_dcn4.stream_plane_mask[stream_index],
-			per_stream_pstate_strategy[stream_index])) {
-			strategy_matches_forced_requirements = false;
-			break;
-		}
-
-		if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_fw_svp) {
-			svp_count++;
-			set_bit_in_bitfield(&svp_stream_mask, stream_index);
-		} else if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
-			drr_count++;
-			set_bit_in_bitfield(&drr_stream_mask, stream_index);
-		} else if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_vactive) {
-			vactive_count++;
-			set_bit_in_bitfield(&vactive_stream_mask, stream_index);
-		} else if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_vblank) {
-			vblank_count++;
-			set_bit_in_bitfield(&vblank_stream_mask, stream_index);
-		}
-	}
-
-	if (!strategy_matches_forced_requirements)
-		return false;
-
-	// Check for trivial synchronization for vblank
-	if (vblank_count > 0 && (pmo->options->disable_vblank || !are_timings_trivially_synchronizable(display_cfg, vblank_stream_mask)))
-		return false;
-
-	if (svp_count > 0 && pmo->options->disable_svp)
-		return false;
-
-	if (drr_count > 0 && (pmo->options->disable_drr_var || !are_all_timings_drr_enabled(display_cfg, drr_stream_mask)))
-		return false;
-
-	// Validate for FAMS admissibiliy
-	if (svp_count == 0 && drr_count == 0) {
-		// No FAMS
-		admissible = true;
-	} else {
-		admissible = false;
-		if (svp_count > 0 && drr_count == 0 && vactive_count == 0 && vblank_count == 0) {
-			// All SVP
-			admissible = validate_svp_cofunctionality(pmo, display_cfg, svp_stream_mask);
-		} else if (svp_count == 0 && drr_count > 0 && vactive_count == 0 && vblank_count == 0) {
-			// All DRR
-			admissible = validate_drr_cofunctionality(pmo, display_cfg, drr_stream_mask);
-		} else if (svp_count > 0 && drr_count > 0 && vactive_count == 0 && vblank_count == 0) {
-			// SVP + DRR
-			admissible = validate_svp_drr_cofunctionality(pmo, display_cfg, svp_stream_mask, drr_stream_mask);
-		} else if (svp_count > 0 && drr_count == 0 && vactive_count == 0 && vblank_count > 0) {
-			// SVP + VBlank
-			admissible = validate_svp_vblank_cofunctionality(pmo, display_cfg, svp_stream_mask, vblank_stream_mask);
-		} else if (svp_count == 0 && drr_count > 0 && vactive_count == 0 && vblank_count > 0) {
-			// DRR + VBlank
-			admissible = validate_drr_vblank_cofunctionality(pmo, display_cfg, drr_stream_mask, vblank_stream_mask);
-		}
-	}
-
-	return admissible;
-}
-
-static int get_vactive_pstate_margin(const struct display_configuation_with_meta *display_cfg, int plane_mask)
-{
-	unsigned char i;
-	int min_vactive_margin_us = 0xFFFFFFF;
-
-	for (i = 0; i < DML2_MAX_PLANES; i++) {
-		if (is_bit_set_in_bitfield(plane_mask, i)) {
-			if (display_cfg->mode_support_result.cfg_support_info.plane_support_info[i].dram_change_latency_hiding_margin_in_active < min_vactive_margin_us)
-				min_vactive_margin_us = display_cfg->mode_support_result.cfg_support_info.plane_support_info[i].dram_change_latency_hiding_margin_in_active;
-		}
-	}
-
-	return min_vactive_margin_us;
-}
-
-bool pmo_dcn4_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in_out *in_out)
-{
-	struct dml2_pmo_instance *pmo = in_out->instance;
-	struct dml2_optimization_stage3_state *state = &in_out->base_display_config->stage3;
-	struct dml2_pmo_scratch *s = &pmo->scratch;
-
-	struct display_configuation_with_meta *display_config;
-	const struct dml2_plane_parameters *plane_descriptor;
-	const enum dml2_pmo_pstate_strategy (*strategy_list)[4] = 0;
-	unsigned int strategy_list_size = 0;
-	unsigned int plane_index, stream_index, i;
-
-	state->performed = true;
-
-	display_config = in_out->base_display_config;
-	display_config->display_config.overrides.enable_subvp_implicit_pmo = true;
-
-	memset(s, 0, sizeof(struct dml2_pmo_scratch));
-
-	pmo->scratch.pmo_dcn4.min_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
-	pmo->scratch.pmo_dcn4.max_latency_index = pmo->mcg_clock_table_size - 1;
-	pmo->scratch.pmo_dcn4.cur_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
-
-	// First build the stream plane mask (array of bitfields indexed by stream, indicating plane mapping)
-	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
-		plane_descriptor = &display_config->display_config.plane_descriptors[plane_index];
-
-		set_bit_in_bitfield(&s->pmo_dcn4.stream_plane_mask[plane_descriptor->stream_index], plane_index);
-
-		state->pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_vactive;
-	}
-
-	// Figure out which streams can do vactive, and also build up implicit SVP meta
-	for (stream_index = 0; stream_index < display_config->display_config.num_streams; stream_index++) {
-		if (get_vactive_pstate_margin(display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) >=
-			MIN_VACTIVE_MARGIN_US)
-			set_bit_in_bitfield(&s->pmo_dcn4.stream_vactive_capability_mask, stream_index);
-
-		s->pmo_dcn4.stream_svp_meta[stream_index].valid = true;
-		s->pmo_dcn4.stream_svp_meta[stream_index].v_active =
-			display_config->mode_support_result.cfg_support_info.stream_support_info[stream_index].phantom_v_active;
-		s->pmo_dcn4.stream_svp_meta[stream_index].v_total =
-			display_config->mode_support_result.cfg_support_info.stream_support_info[stream_index].phantom_v_total;
-		s->pmo_dcn4.stream_svp_meta[stream_index].v_front_porch = 1;
-	}
-
-	switch (display_config->display_config.num_streams) {
-	case 1:
-		strategy_list = full_strategy_list_1_display;
-		strategy_list_size = full_strategy_list_1_display_size;
-		break;
-	case 2:
-		strategy_list = full_strategy_list_2_display;
-		strategy_list_size = full_strategy_list_2_display_size;
-		break;
-	case 3:
-		strategy_list = full_strategy_list_3_display;
-		strategy_list_size = full_strategy_list_3_display_size;
-		break;
-	case 4:
-		strategy_list = full_strategy_list_4_display;
-		strategy_list_size = full_strategy_list_4_display_size;
-		break;
-	default:
-		strategy_list_size = 0;
-		break;
-	}
-
-	if (strategy_list_size == 0)
-		return false;
-
-	s->pmo_dcn4.num_pstate_candidates = 0;
-
-	for (i = 0; i < strategy_list_size && i < DML2_PMO_PSTATE_CANDIDATE_LIST_SIZE; i++) {
-		if (validate_pstate_support_strategy_cofunctionality(pmo, display_config, strategy_list[i])) {
-			insert_into_candidate_list(strategy_list[i], display_config->display_config.num_streams, s);
-		}
-	}
-
-	if (s->pmo_dcn4.num_pstate_candidates > 0) {
-		// There's this funny case...
-		// If the first entry in the candidate list is all vactive, then we can consider it "tested", so the current index is 0
-		// Otherwise the current index should be -1 because we run the optimization at least once
-		s->pmo_dcn4.cur_pstate_candidate = 0;
-		for (i = 0; i < display_config->display_config.num_streams; i++) {
-			if (s->pmo_dcn4.per_stream_pstate_strategy[0][i] != dml2_pmo_pstate_strategy_vactive) {
-				s->pmo_dcn4.cur_pstate_candidate = -1;
-				break;
-			}
-		}
-		return true;
-	} else {
-		return false;
-	}
-}
-
-static void reset_display_configuration(struct display_configuation_with_meta *display_config)
-{
-	unsigned int plane_index;
-	unsigned int stream_index;
-	struct dml2_plane_parameters *plane;
-
-	for (stream_index = 0; stream_index < display_config->display_config.num_streams; stream_index++) {
-		display_config->stage3.stream_svp_meta[stream_index].valid = false;
-	}
-
-	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
-		plane = &display_config->display_config.plane_descriptors[plane_index];
-
-		// Unset SubVP
-		plane->overrides.legacy_svp_config = dml2_svp_mode_override_auto;
-
-		// Remove reserve time
-		plane->overrides.reserved_vblank_time_ns = 0;
-
-		// Reset strategy to auto
-		plane->overrides.uclk_pstate_change_strategy = dml2_uclk_pstate_change_strategy_auto;
-
-		display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_not_supported;
-	}
-}
-
-static void setup_planes_for_drr_by_mask(struct display_configuation_with_meta *display_config, int plane_mask)
-{
-	unsigned char plane_index;
-	struct dml2_plane_parameters *plane;
-
-	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
-		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
-			plane = &display_config->display_config.plane_descriptors[plane_index];
-
-			// Setup DRR
-			plane->overrides.uclk_pstate_change_strategy = dml2_uclk_pstate_change_strategy_force_drr;
-
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_fw_drr;
-		}
-	}
-}
-
-static void setup_planes_for_svp_by_mask(struct display_configuation_with_meta *display_config, int plane_mask)
-{
-	unsigned char plane_index;
-	int stream_index = -1;
-
-	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
-		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
-			stream_index = (char)display_config->display_config.plane_descriptors[plane_index].stream_index;
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_fw_subvp_phantom;
-		}
-	}
-
-	if (stream_index >= 0) {
-		display_config->stage3.stream_svp_meta[stream_index].valid = true;
-		display_config->stage3.stream_svp_meta[stream_index].v_active =
-			display_config->mode_support_result.cfg_support_info.stream_support_info[stream_index].phantom_v_active;
-		display_config->stage3.stream_svp_meta[stream_index].v_total =
-			display_config->mode_support_result.cfg_support_info.stream_support_info[stream_index].phantom_v_total;
-		display_config->stage3.stream_svp_meta[stream_index].v_front_porch = 1;
-	}
-}
-
-static void setup_planes_for_vblank_by_mask(struct display_configuation_with_meta *display_config, int plane_mask)
-{
-	unsigned char plane_index;
-	struct dml2_plane_parameters *plane;
-
-	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
-		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
-			plane = &display_config->display_config.plane_descriptors[plane_index];
-
-			// Setup reserve time
-			plane->overrides.reserved_vblank_time_ns = 400 * 1000;
-
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_vblank;
-		}
-	}
-}
-
-static void setup_planes_for_vactive_by_mask(struct display_configuation_with_meta *display_config, int plane_mask)
-{
-	unsigned char plane_index;
-
-	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
-		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_vactive;
-		}
-	}
-}
-
-static bool setup_display_config(struct display_configuation_with_meta *display_config, struct dml2_pmo_scratch *scratch, int strategy_index)
-{
-	bool success = true;
-	unsigned char stream_index;
-
-	reset_display_configuration(display_config);
-
-	for (stream_index = 0; stream_index < display_config->display_config.num_streams; stream_index++) {
-		if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_na) {
-			success = false;
-			break;
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_vblank) {
-			setup_planes_for_vblank_by_mask(display_config, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_fw_svp) {
-			setup_planes_for_svp_by_mask(display_config, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
-			setup_planes_for_drr_by_mask(display_config, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_vactive) {
-			setup_planes_for_vactive_by_mask(display_config, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		}
-	}
-
-	return success;
-}
-
-static int get_minimum_reserved_time_us_for_planes(struct display_configuation_with_meta *display_config, int plane_mask)
-{
-	int min_time_us = 0xFFFFFF;
-	unsigned char plane_index = 0;
-
-	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
-		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
-			if (min_time_us > (display_config->display_config.plane_descriptors[plane_index].overrides.reserved_vblank_time_ns / 1000))
-				min_time_us = display_config->display_config.plane_descriptors[plane_index].overrides.reserved_vblank_time_ns / 1000;
-		}
-	}
-	return min_time_us;
-}
-
-bool pmo_dcn4_test_for_pstate_support(struct dml2_pmo_test_for_pstate_support_in_out *in_out)
-{
-	bool p_state_supported = true;
-	unsigned int stream_index;
-	struct dml2_pmo_scratch *s = &in_out->instance->scratch;
-
-	if (s->pmo_dcn4.cur_pstate_candidate < 0)
-		return false;
-
-	for (stream_index = 0; stream_index < in_out->base_display_config->display_config.num_streams; stream_index++) {
-
-		if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_vactive) {
-			if (get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < MIN_VACTIVE_MARGIN_US) {
-				p_state_supported = false;
-				break;
-			}
-		} else if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_vblank) {
-			if (get_minimum_reserved_time_us_for_planes(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) <
-				in_out->instance->soc_bb->power_management_parameters.dram_clk_change_blackout_us) {
-				p_state_supported = false;
-				break;
-			}
-		} else if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_fw_svp) {
-			if (in_out->base_display_config->stage3.stream_svp_meta[stream_index].valid == false) {
-				p_state_supported = false;
-				break;
-			}
-		} else if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
-			if (!all_planes_match_strategy(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index], dml2_pmo_pstate_strategy_fw_drr)) {
-				p_state_supported = false;
-				break;
-			}
-		} else if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_na) {
-			p_state_supported = false;
-			break;
-		}
-	}
-
-	return p_state_supported;
-}
-
-bool pmo_dcn4_optimize_for_pstate_support(struct dml2_pmo_optimize_for_pstate_support_in_out *in_out)
-{
-	bool success = false;
-	struct dml2_pmo_scratch *s = &in_out->instance->scratch;
-
-	memcpy(in_out->optimized_display_config, in_out->base_display_config, sizeof(struct display_configuation_with_meta));
-
-	if (in_out->last_candidate_failed) {
-		if (s->pmo_dcn4.allow_state_increase_for_strategy[s->pmo_dcn4.cur_pstate_candidate] &&
-			s->pmo_dcn4.cur_latency_index < s->pmo_dcn4.max_latency_index) {
-			s->pmo_dcn4.cur_latency_index++;
-
-			success = true;
-		}
-	}
-
-	if (!success) {
-		s->pmo_dcn4.cur_latency_index = s->pmo_dcn4.min_latency_index;
-		s->pmo_dcn4.cur_pstate_candidate++;
-
-		if (s->pmo_dcn4.cur_pstate_candidate < s->pmo_dcn4.num_pstate_candidates) {
-			success = true;
-		}
-	}
-
-	if (success) {
-		in_out->optimized_display_config->stage3.min_clk_index_for_latency = s->pmo_dcn4.cur_latency_index;
-		setup_display_config(in_out->optimized_display_config, &in_out->instance->scratch, in_out->instance->scratch.pmo_dcn4.cur_pstate_candidate);
-	}
-
-	return success;
-}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h
deleted file mode 100644
index 09cacc933d21..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h
+++ /dev/null
@@ -1,25 +0,0 @@
-// SPDX-License-Identifier: MIT
-//
-// Copyright 2024 Advanced Micro Devices, Inc.
-
-
-#ifndef __DML2_PMO_DCN4_H__
-#define __DML2_PMO_DCN4_H__
-
-#include "dml2_internal_shared_types.h"
-
-bool pmo_dcn4_initialize(struct dml2_pmo_initialize_in_out *in_out);
-
-bool pmo_dcn4_optimize_dcc_mcache(struct dml2_pmo_optimize_dcc_mcache_in_out *in_out);
-
-bool pmo_dcn4_init_for_vmin(struct dml2_pmo_init_for_vmin_in_out *in_out);
-bool pmo_dcn4_test_for_vmin(struct dml2_pmo_test_for_vmin_in_out *in_out);
-bool pmo_dcn4_optimize_for_vmin(struct dml2_pmo_optimize_for_vmin_in_out *in_out);
-
-bool pmo_dcn4_init_for_pstate_support(struct dml2_pmo_init_for_pstate_support_in_out *in_out);
-bool pmo_dcn4_test_for_pstate_support(struct dml2_pmo_test_for_pstate_support_in_out *in_out);
-bool pmo_dcn4_optimize_for_pstate_support(struct dml2_pmo_optimize_for_pstate_support_in_out *in_out);
-
-bool pmo_dcn4_unit_test(void);
-
-#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
index 60a9faf81d3d..fa445067782e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
@@ -1,122 +1,181 @@
-/*
-* Copyright 2022 Advanced Micro Devices, Inc.
-*
-* Permission is hereby granted, free of charge, to any person obtaining a
-* copy of this software and associated documentation files (the "Software"),
-* to deal in the Software without restriction, including without limitation
-* the rights to use, copy, modify, merge, publish, distribute, sublicense,
-* and/or sell copies of the Software, and to permit persons to whom the
-* Software is furnished to do so, subject to the following conditions:
-*
-* The above copyright notice and this permission notice shall be included in
-* all copies or substantial portions of the Software.
-*
-* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
-* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
-* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-* OTHER DEALINGS IN THE SOFTWARE.
-*
-* Authors: AMD
-*
-*/
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
 
 #include "dml2_pmo_factory.h"
-#include "dml2_pmo_dcn4.h"
 #include "dml2_debug.h"
 #include "lib_float_math.h"
 #include "dml2_pmo_dcn4_fams2.h"
 
 static const double MIN_VACTIVE_MARGIN_PCT = 0.25; // We need more than non-zero margin because DET buffer granularity can alter vactive latency hiding
 
-static const enum dml2_pmo_pstate_strategy base_strategy_list_1_display[][PMO_DCN4_MAX_DISPLAYS] = {
+static const struct dml2_pmo_pstate_strategy base_strategy_list_1_display[] = {
 	// VActive Preferred
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
 
 	// Then SVP
-	{ dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
 
 	// Then VBlank
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Finally DRR
-	{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = false,
+	},
+
+	// Then DRR
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
+
+	// Finally VBlank, but allow base clocks for latency to increase
+	/*
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
+	*/
 };
 
-static const int base_strategy_list_1_display_size = sizeof(base_strategy_list_1_display) / (sizeof(enum dml2_pmo_pstate_strategy) * PMO_DCN4_MAX_DISPLAYS);
+static const int base_strategy_list_1_display_size = sizeof(base_strategy_list_1_display) / sizeof(struct dml2_pmo_pstate_strategy);
 
-static const enum dml2_pmo_pstate_strategy base_strategy_list_2_display[][PMO_DCN4_MAX_DISPLAYS] = {
+static const struct dml2_pmo_pstate_strategy base_strategy_list_2_display[] = {
 	// VActive only is preferred
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
 
 	// Then VActive + VBlank
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = false,
+	},
 
 	// Then VBlank only
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = false,
+	},
 
 	// Then SVP + VBlank
-	{ dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = false,
+	},
 
 	// Then SVP + DRR
-	{ dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
 
 	// Then SVP + SVP
-	{ dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
 
 	// Then DRR + VActive
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Then DRR + VBlank
-	//{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
-
-	// Finally DRR + DRR
-	{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
+
+	// Then DRR + DRR
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
+
+	// Finally VBlank, but allow base clocks for latency to increase
+	/*
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
+	*/
 };
 
-static const int base_strategy_list_2_display_size = sizeof(base_strategy_list_2_display) / (sizeof(enum dml2_pmo_pstate_strategy) * PMO_DCN4_MAX_DISPLAYS);
-
-static const enum dml2_pmo_pstate_strategy base_strategy_list_3_display[][PMO_DCN4_MAX_DISPLAYS] = {
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na }, // All VActive
-
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },  // VActive + 1 VBlank
-
-	//{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na },	// VActive + 2 VBlank
-
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na }, // All VBlank
-
-	//{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na }, // VBlank + 1 DRR
-
-	//{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na }, // VBlank + 2 DRR
-
-	{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na }, // All DRR
+static const int base_strategy_list_2_display_size = sizeof(base_strategy_list_2_display) / sizeof(struct dml2_pmo_pstate_strategy);
+
+static const struct dml2_pmo_pstate_strategy base_strategy_list_3_display[] = {
+	// All VActive
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
+
+	// VActive + 1 VBlank
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = false,
+	},
+
+	// All VBlank
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = false,
+	},
+
+	// All DRR
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
+
+	// All VBlank, with state increase allowed
+	/*
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
+		.allow_state_increase = true,
+	},
+	*/
 };
 
-static const int base_strategy_list_3_display_size = sizeof(base_strategy_list_3_display) / (sizeof(enum dml2_pmo_pstate_strategy) * PMO_DCN4_MAX_DISPLAYS);
-
-static const enum dml2_pmo_pstate_strategy base_strategy_list_4_display[][PMO_DCN4_MAX_DISPLAYS] = {
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive }, // All VActive
-
-	{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank },  // VActive + 1 VBlank
-
-	//{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank },  // VActive + 2 VBlank
-
-	//{ dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank },  // VActive + 3 VBlank
-
-	{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank }, // All Vblank
-
-	//{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_fw_drr }, // VBlank + 1 DRR
-
-	//{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr }, // VBlank + 2 DRR
-
-	//{ dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr }, // VBlank + 3 DRR
-
-	{ dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr }, // All DRR
+static const int base_strategy_list_3_display_size = sizeof(base_strategy_list_3_display) / sizeof(struct dml2_pmo_pstate_strategy);
+
+static const struct dml2_pmo_pstate_strategy base_strategy_list_4_display[] = {
+	// All VActive
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive },
+		.allow_state_increase = true,
+	},
+
+	// VActive + 1 VBlank
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank },
+		.allow_state_increase = false,
+	},
+
+	// All Vblank
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank },
+		.allow_state_increase = false,
+	},
+
+	// All DRR
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr },
+		.allow_state_increase = true,
+	},
+
+	// All VBlank, with state increase allowed
+	/*
+	{
+		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank },
+		.allow_state_increase = true,
+	},
+	*/
 };
 
-static const int base_strategy_list_4_display_size = sizeof(base_strategy_list_4_display) / (sizeof(enum dml2_pmo_pstate_strategy) * PMO_DCN4_MAX_DISPLAYS);
+static const int base_strategy_list_4_display_size = sizeof(base_strategy_list_4_display) / sizeof(struct dml2_pmo_pstate_strategy);
 
 
 static bool increase_odm_combine_factor(enum dml2_odm_mode *odm_mode, int odms_calculated)
@@ -296,9 +355,9 @@ bool pmo_dcn4_fams2_optimize_dcc_mcache(struct dml2_pmo_optimize_dcc_mcache_in_o
 	return result;
 }
 
-static enum dml2_pmo_pstate_strategy convert_strategy_to_drr_variant(const enum dml2_pmo_pstate_strategy base_strategy)
+static enum dml2_pmo_pstate_method convert_strategy_to_drr_variant(const enum dml2_pmo_pstate_method base_strategy)
 {
-	enum dml2_pmo_pstate_strategy variant_strategy = 0;
+	enum dml2_pmo_pstate_method variant_strategy = 0;
 
 	switch (base_strategy) {
 	case dml2_pmo_pstate_strategy_vactive:
@@ -327,11 +386,9 @@ static enum dml2_pmo_pstate_strategy convert_strategy_to_drr_variant(const enum
 	return variant_strategy;
 }
 
-static enum dml2_pmo_pstate_strategy(*get_expanded_strategy_list(
-	struct dml2_pmo_init_data *init_data,
-	int stream_count))[PMO_DCN4_MAX_DISPLAYS]
+static struct dml2_pmo_pstate_strategy *get_expanded_strategy_list(struct dml2_pmo_init_data *init_data, int stream_count)
 {
-	enum dml2_pmo_pstate_strategy(*expanded_strategy_list)[PMO_DCN4_MAX_DISPLAYS] = NULL;
+	struct dml2_pmo_pstate_strategy *expanded_strategy_list = NULL;
 
 	switch (stream_count) {
 	case 1:
@@ -361,23 +418,23 @@ static unsigned int get_num_expanded_strategies(
 }
 
 static void insert_strategy_into_expanded_list(
-	const enum dml2_pmo_pstate_strategy per_stream_pstate_strategy[PMO_DCN4_MAX_DISPLAYS],
+	const struct dml2_pmo_pstate_strategy *per_stream_pstate_strategy,
 	int stream_count,
 	struct dml2_pmo_init_data *init_data)
 {
-	enum dml2_pmo_pstate_strategy(*expanded_strategy_list)[PMO_DCN4_MAX_DISPLAYS] = NULL;
+	struct dml2_pmo_pstate_strategy *expanded_strategy_list = NULL;
 
 	expanded_strategy_list = get_expanded_strategy_list(init_data, stream_count);
 
 	if (expanded_strategy_list) {
-		memcpy(&expanded_strategy_list[init_data->pmo_dcn4.num_expanded_strategies_per_list[stream_count - 1]++],
-			per_stream_pstate_strategy,
-			sizeof(enum dml2_pmo_pstate_strategy) * PMO_DCN4_MAX_DISPLAYS);
+		memcpy(&expanded_strategy_list[init_data->pmo_dcn4.num_expanded_strategies_per_list[stream_count - 1]], per_stream_pstate_strategy, sizeof(struct dml2_pmo_pstate_strategy));
+
+		init_data->pmo_dcn4.num_expanded_strategies_per_list[stream_count - 1]++;
 	}
 }
 
 static void expand_base_strategy(struct dml2_pmo_instance *pmo,
-	const enum dml2_pmo_pstate_strategy base_strategy_list[PMO_DCN4_MAX_DISPLAYS],
+	const struct dml2_pmo_pstate_strategy *base_strategy,
 	unsigned int stream_count)
 {
 	bool skip_to_next_stream;
@@ -386,19 +443,21 @@ static void expand_base_strategy(struct dml2_pmo_instance *pmo,
 	unsigned int i, j;
 	unsigned int num_streams_per_method[PMO_DCN4_MAX_DISPLAYS] = { 0 };
 	unsigned int stream_iteration_indices[PMO_DCN4_MAX_DISPLAYS] = { 0 };
-	enum dml2_pmo_pstate_strategy cur_strategy_list[PMO_DCN4_MAX_DISPLAYS] = { 0 };
+	struct dml2_pmo_pstate_strategy cur_strategy_list = { 0 };
 
 	/* determine number of displays per method */
 	for (i = 0; i < stream_count; i++) {
 		/* increment the count of the earliest index with the same method */
 		for (j = 0; j < stream_count; j++) {
-			if (base_strategy_list[i] == base_strategy_list[j]) {
+			if (base_strategy->per_stream_pstate_method[i] == base_strategy->per_stream_pstate_method[j]) {
 				num_streams_per_method[j] = num_streams_per_method[j] + 1;
 				break;
 			}
 		}
 	}
 
+	cur_strategy_list.allow_state_increase = base_strategy->allow_state_increase;
+
 	i = 0;
 	/* uses a while loop instead of recursion to build permutations of base strategy */
 	while (stream_iteration_indices[0] < stream_count) {
@@ -409,12 +468,12 @@ static void expand_base_strategy(struct dml2_pmo_instance *pmo,
 		/* determine what to do for this iteration */
 		if (stream_iteration_indices[i] < stream_count && num_streams_per_method[stream_iteration_indices[i]] != 0) {
 			/* decrement count and assign method */
-			cur_strategy_list[i] = base_strategy_list[stream_iteration_indices[i]];
+			cur_strategy_list.per_stream_pstate_method[i] = base_strategy->per_stream_pstate_method[stream_iteration_indices[i]];
 			num_streams_per_method[stream_iteration_indices[i]] -= 1;
 
 			if (i >= stream_count - 1) {
 				/* insert into strategy list */
-				insert_strategy_into_expanded_list(cur_strategy_list, stream_count, &pmo->init_data);
+				insert_strategy_into_expanded_list(&cur_strategy_list, stream_count, &pmo->init_data);
 				expanded_strategy_added = true;
 			} else {
 				/* skip to next stream */
@@ -450,55 +509,122 @@ static void expand_base_strategy(struct dml2_pmo_instance *pmo,
 	}
 }
 
-static void expand_variant_strategy(struct dml2_pmo_instance *pmo,
-		const enum dml2_pmo_pstate_strategy base_strategy_list[PMO_DCN4_MAX_DISPLAYS],
+
+static bool is_variant_method_valid(const struct dml2_pmo_pstate_strategy *base_strategy,
+		const struct dml2_pmo_pstate_strategy *variant_strategy,
+		unsigned int num_streams_per_base_method[PMO_DCN4_MAX_DISPLAYS],
+		unsigned int num_streams_per_variant_method[PMO_DCN4_MAX_DISPLAYS],
 		unsigned int stream_count)
 {
+	bool valid = true;
 	unsigned int i;
 
-	bool variant_found = false;
-	enum dml2_pmo_pstate_strategy cur_strategy_list[PMO_DCN4_MAX_DISPLAYS] = { 0 };
+	/* check all restrictions are met */
+	for (i = 0; i < stream_count; i++) {
+		/* vblank + vblank_drr variants are invalid */
+		if (base_strategy->per_stream_pstate_method[i] == dml2_pmo_pstate_strategy_vblank &&
+				((num_streams_per_base_method[i] > 0 && num_streams_per_variant_method[i] > 0) ||
+				num_streams_per_variant_method[i] > 1)) {
+			valid = false;
+			break;
+		}
+	}
 
-	/* setup variant list as base to start */
-	memcpy(cur_strategy_list, base_strategy_list, sizeof(enum dml2_pmo_pstate_strategy) * PMO_DCN4_MAX_DISPLAYS);
+	return valid;
+}
 
+static void expand_variant_strategy(struct dml2_pmo_instance *pmo,
+		const struct dml2_pmo_pstate_strategy *base_strategy,
+		unsigned int stream_count)
+{
+	bool variant_found;
+	unsigned int i, j;
+	unsigned int method_index;
+	unsigned int stream_index;
+	unsigned int num_streams_per_method[PMO_DCN4_MAX_DISPLAYS] = { 0 };
+	unsigned int num_streams_per_base_method[PMO_DCN4_MAX_DISPLAYS] = { 0 };
+	unsigned int num_streams_per_variant_method[PMO_DCN4_MAX_DISPLAYS] = { 0 };
+	enum dml2_pmo_pstate_method per_stream_variant_method[DML2_MAX_PLANES];
+	struct dml2_pmo_pstate_strategy variant_strategy = { 0 };
+
+	/* determine number of displays per method */
 	for (i = 0; i < stream_count; i++) {
-		cur_strategy_list[i] = convert_strategy_to_drr_variant(base_strategy_list[i]);
+		/* increment the count of the earliest index with the same method */
+		for (j = 0; j < stream_count; j++) {
+			if (base_strategy->per_stream_pstate_method[i] == base_strategy->per_stream_pstate_method[j]) {
+				num_streams_per_method[j] = num_streams_per_method[j] + 1;
+				break;
+			}
+		}
+
+		per_stream_variant_method[i] = convert_strategy_to_drr_variant(base_strategy->per_stream_pstate_method[i]);
+	}
+	memcpy(num_streams_per_base_method, num_streams_per_method, sizeof(unsigned int) * PMO_DCN4_MAX_DISPLAYS);
+
+	memcpy(&variant_strategy, base_strategy, sizeof(struct dml2_pmo_pstate_strategy));
+
+	method_index = 0;
+	/* uses a while loop instead of recursion to build permutations of base strategy */
+	while (num_streams_per_base_method[0] > 0 || method_index != 0) {
+		if (method_index == stream_count) {
+			/* construct variant strategy */
+			variant_found = false;
+			stream_index = 0;
+
+			for (i = 0; i < stream_count; i++) {
+				for (j = 0; j < num_streams_per_base_method[i]; j++) {
+					variant_strategy.per_stream_pstate_method[stream_index++] = base_strategy->per_stream_pstate_method[i];
+				}
 
-		if (cur_strategy_list[i] != base_strategy_list[i]) {
-			variant_found = true;
+				for (j = 0; j < num_streams_per_variant_method[i]; j++) {
+					variant_strategy.per_stream_pstate_method[stream_index++] = per_stream_variant_method[i];
+					if (base_strategy->per_stream_pstate_method[i] != per_stream_variant_method[i]) {
+						variant_found = true;
+					}
+				}
+			}
+
+			if (variant_found && is_variant_method_valid(base_strategy, &variant_strategy, num_streams_per_base_method, num_streams_per_variant_method, stream_count)) {
+				expand_base_strategy(pmo, &variant_strategy, stream_count);
+			}
+
+			/* rollback to earliest method with bases remaining */
+			for (method_index = stream_count - 1; method_index > 0; method_index--) {
+				if (num_streams_per_base_method[method_index]) {
+					/* bases remaining */
+					break;
+				} else {
+					/* reset counters */
+					num_streams_per_base_method[method_index] = num_streams_per_method[method_index];
+					num_streams_per_variant_method[method_index] = 0;
+				}
+			}
 		}
 
-		if (i == stream_count - 1 && variant_found) {
-			insert_strategy_into_expanded_list(cur_strategy_list, stream_count, &pmo->init_data);
+		if (num_streams_per_base_method[method_index]) {
+			num_streams_per_base_method[method_index]--;
+			num_streams_per_variant_method[method_index]++;
+
+			method_index++;
+		} else if (method_index != 0) {
+			method_index++;
 		}
 	}
 }
 
 static void expand_base_strategies(
 	struct dml2_pmo_instance *pmo,
-	const enum dml2_pmo_pstate_strategy(*base_strategies_list)[PMO_DCN4_MAX_DISPLAYS],
+	const struct dml2_pmo_pstate_strategy *base_strategies_list,
 	const unsigned int num_base_strategies,
 	unsigned int stream_count)
 {
 	unsigned int i;
-	unsigned int num_pre_variant_strategies;
-	enum dml2_pmo_pstate_strategy(*expanded_strategy_list)[PMO_DCN4_MAX_DISPLAYS];
 
 	/* expand every explicit base strategy (except all DRR) */
-	for (i = 0; i < num_base_strategies - 1; i++) {
-		expand_base_strategy(pmo, base_strategies_list[i], stream_count);
+	for (i = 0; i < num_base_strategies; i++) {
+		expand_base_strategy(pmo, &base_strategies_list[i], stream_count);
+		expand_variant_strategy(pmo, &base_strategies_list[i], stream_count);
 	}
-
-	/* expand base strategies to DRR variants */
-	num_pre_variant_strategies = get_num_expanded_strategies(&pmo->init_data, stream_count);
-	expanded_strategy_list = get_expanded_strategy_list(&pmo->init_data, stream_count);
-	for (i = 0; i < num_pre_variant_strategies; i++) {
-		expand_variant_strategy(pmo, expanded_strategy_list[i], stream_count);
-	}
-
-	/* add back all DRR */
-	insert_strategy_into_expanded_list(base_strategies_list[num_base_strategies - 1], stream_count, &pmo->init_data);
 }
 
 bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
@@ -591,8 +717,6 @@ bool pmo_dcn4_fams2_init_for_vmin(struct dml2_pmo_init_for_vmin_in_out *in_out)
 			&in_out->base_display_config->display_config;
 	const struct dml2_core_mode_support_result *mode_support_result =
 			&in_out->base_display_config->mode_support_result;
-	struct dml2_optimization_stage4_state *state =
-			&in_out->base_display_config->stage4;
 
 	if (in_out->instance->options->disable_dyn_odm ||
 			(in_out->instance->options->disable_dyn_odm_for_multi_stream && display_config->num_streams > 1))
@@ -613,30 +737,28 @@ bool pmo_dcn4_fams2_init_for_vmin(struct dml2_pmo_init_for_vmin_in_out *in_out)
 		 */
 		if (mode_support_result->cfg_support_info.plane_support_info[i].dpps_used > 1 &&
 				mode_support_result->cfg_support_info.stream_support_info[display_config->plane_descriptors[i].stream_index].odms_used == 1)
-			state->unoptimizable_streams[display_config->plane_descriptors[i].stream_index] = true;
+			in_out->base_display_config->stage4.unoptimizable_streams[display_config->plane_descriptors[i].stream_index] = true;
 
 	for (i = 0; i < display_config->num_streams; i++) {
 		if (display_config->stream_descriptors[i].overrides.disable_dynamic_odm)
-			state->unoptimizable_streams[i] = true;
+			in_out->base_display_config->stage4.unoptimizable_streams[i] = true;
 		else if (in_out->base_display_config->stage3.stream_svp_meta[i].valid &&
 				in_out->instance->options->disable_dyn_odm_for_stream_with_svp)
-			state->unoptimizable_streams[i] = true;
+			in_out->base_display_config->stage4.unoptimizable_streams[i] = true;
 		/*
 		 * ODM Combine requires horizontal timing divisible by 2 so each
 		 * ODM segment has the same size.
 		 */
 		else if (!is_h_timing_divisible_by(&display_config->stream_descriptors[i].timing, 2))
-			state->unoptimizable_streams[i] = true;
+			in_out->base_display_config->stage4.unoptimizable_streams[i] = true;
 		/*
 		 * Our hardware support seamless ODM transitions for DP encoders
 		 * only.
 		 */
 		else if (!is_dp_encoder(display_config->stream_descriptors[i].output.output_encoder))
-			state->unoptimizable_streams[i] = true;
+			in_out->base_display_config->stage4.unoptimizable_streams[i] = true;
 	}
 
-	state->performed = true;
-
 	return true;
 }
 
@@ -787,6 +909,7 @@ static void build_synchronized_timing_groups(
 	/* clear all group masks */
 	memset(s->pmo_dcn4.synchronized_timing_group_masks, 0, sizeof(s->pmo_dcn4.synchronized_timing_group_masks));
 	memset(s->pmo_dcn4.group_is_drr_enabled, 0, sizeof(s->pmo_dcn4.group_is_drr_enabled));
+	memset(s->pmo_dcn4.group_is_drr_active, 0, sizeof(s->pmo_dcn4.group_is_drr_active));
 	memset(s->pmo_dcn4.group_line_time_us, 0, sizeof(s->pmo_dcn4.group_line_time_us));
 	s->pmo_dcn4.num_timing_groups = 0;
 
@@ -808,6 +931,8 @@ static void build_synchronized_timing_groups(
 		/* if drr is in use, timing is not sychnronizable */
 		if (master_timing->drr_config.enabled) {
 			s->pmo_dcn4.group_is_drr_enabled[timing_group_idx] = true;
+			s->pmo_dcn4.group_is_drr_active[timing_group_idx] = !master_timing->drr_config.disallowed &&
+					(master_timing->drr_config.drr_active_fixed || master_timing->drr_config.drr_active_variable);
 			continue;
 		}
 
@@ -933,8 +1058,7 @@ static bool all_timings_support_svp(const struct dml2_pmo_instance *pmo,
 
 			/* check recout height covers entire otg vactive, and single plane */
 			if (num_planes_per_stream[plane_descriptor->stream_index] > 1 ||
-					!plane_descriptor->composition.rect_out_height_spans_vactive ||
-					plane_descriptor->composition.rotation_angle != dml2_rotation_0) {
+					!plane_descriptor->composition.rect_out_height_spans_vactive) {
 				return false;
 			}
 		}
@@ -970,35 +1094,24 @@ static bool all_timings_support_svp(const struct dml2_pmo_instance *pmo,
 	return true;
 }
 
-static void insert_into_candidate_list(const enum dml2_pmo_pstate_strategy *per_stream_pstate_strategy, int stream_count, struct dml2_pmo_scratch *scratch)
+static void insert_into_candidate_list(const struct dml2_pmo_pstate_strategy *pstate_strategy, int stream_count, struct dml2_pmo_scratch *scratch)
 {
-	int stream_index;
-
-	scratch->pmo_dcn4.allow_state_increase_for_strategy[scratch->pmo_dcn4.num_pstate_candidates] = true;
-
-	for (stream_index = 0; stream_index < stream_count; stream_index++) {
-		scratch->pmo_dcn4.per_stream_pstate_strategy[scratch->pmo_dcn4.num_pstate_candidates][stream_index] = per_stream_pstate_strategy[stream_index];
-
-		if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_vblank ||
-				per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr)
-			scratch->pmo_dcn4.allow_state_increase_for_strategy[scratch->pmo_dcn4.num_pstate_candidates] = false;
-	}
-
+	scratch->pmo_dcn4.pstate_strategy_candidates[scratch->pmo_dcn4.num_pstate_candidates] = *pstate_strategy;
 	scratch->pmo_dcn4.num_pstate_candidates++;
 }
 
-static bool all_planes_match_strategy(const struct display_configuation_with_meta *display_cfg, int plane_mask, enum dml2_pmo_pstate_strategy strategy)
+static bool all_planes_match_method(const struct display_configuation_with_meta *display_cfg, int plane_mask, enum dml2_pmo_pstate_method method)
 {
 	unsigned char i;
 	enum dml2_uclk_pstate_change_strategy matching_strategy = (enum dml2_uclk_pstate_change_strategy) dml2_pmo_pstate_strategy_na;
 
-	if (strategy == dml2_pmo_pstate_strategy_vactive || strategy == dml2_pmo_pstate_strategy_fw_vactive_drr)
+	if (method == dml2_pmo_pstate_strategy_vactive || method == dml2_pmo_pstate_strategy_fw_vactive_drr)
 		matching_strategy = dml2_uclk_pstate_change_strategy_force_vactive;
-	else if (strategy == dml2_pmo_pstate_strategy_vblank || strategy == dml2_pmo_pstate_strategy_fw_vblank_drr)
+	else if (method == dml2_pmo_pstate_strategy_vblank || method == dml2_pmo_pstate_strategy_fw_vblank_drr)
 		matching_strategy = dml2_uclk_pstate_change_strategy_force_vblank;
-	else if (strategy == dml2_pmo_pstate_strategy_fw_svp)
+	else if (method == dml2_pmo_pstate_strategy_fw_svp)
 		matching_strategy = dml2_uclk_pstate_change_strategy_force_mall_svp;
-	else if (strategy == dml2_pmo_pstate_strategy_fw_drr)
+	else if (method == dml2_pmo_pstate_strategy_fw_drr)
 		matching_strategy = dml2_uclk_pstate_change_strategy_force_drr;
 
 	for (i = 0; i < DML2_MAX_PLANES; i++) {
@@ -1030,12 +1143,12 @@ static void build_method_scheduling_params(
 
 static struct dml2_fams2_per_method_common_meta *get_per_method_common_meta(
 	struct dml2_pmo_instance *pmo,
-	enum dml2_pmo_pstate_strategy stream_pstate_strategy,
+	enum dml2_pmo_pstate_method stream_pstate_method,
 	int stream_idx)
 {
 	struct dml2_fams2_per_method_common_meta *stream_method_fams2_meta = NULL;
 
-	switch (stream_pstate_strategy) {
+	switch (stream_pstate_method) {
 	case dml2_pmo_pstate_strategy_vactive:
 	case dml2_pmo_pstate_strategy_fw_vactive_drr:
 		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_vactive.common;
@@ -1066,7 +1179,7 @@ static struct dml2_fams2_per_method_common_meta *get_per_method_common_meta(
 static bool is_timing_group_schedulable(
 		struct dml2_pmo_instance *pmo,
 		const struct display_configuation_with_meta *display_cfg,
-		const enum dml2_pmo_pstate_strategy per_stream_pstate_strategy[PMO_DCN4_MAX_DISPLAYS],
+		const struct dml2_pmo_pstate_strategy *pstate_strategy,
 		const unsigned int timing_group_idx,
 		struct dml2_fams2_per_method_common_meta *group_fams2_meta)
 {
@@ -1085,18 +1198,13 @@ static bool is_timing_group_schedulable(
 	}
 
 	/* init allow start and end lines for timing group */
-	stream_method_fams2_meta = get_per_method_common_meta(pmo, per_stream_pstate_strategy[base_stream_idx], base_stream_idx);
-	if (!stream_method_fams2_meta)
-		return false;
-
+	stream_method_fams2_meta = get_per_method_common_meta(pmo, pstate_strategy->per_stream_pstate_method[base_stream_idx], base_stream_idx);
 	group_fams2_meta->allow_start_otg_vline = stream_method_fams2_meta->allow_start_otg_vline;
 	group_fams2_meta->allow_end_otg_vline = stream_method_fams2_meta->allow_end_otg_vline;
 	group_fams2_meta->period_us = stream_method_fams2_meta->period_us;
 	for (i = base_stream_idx + 1; i < display_cfg->display_config.num_streams; i++) {
 		if (is_bit_set_in_bitfield(pmo->scratch.pmo_dcn4.synchronized_timing_group_masks[timing_group_idx], i)) {
-			stream_method_fams2_meta = get_per_method_common_meta(pmo, per_stream_pstate_strategy[i], i);
-			if (!stream_method_fams2_meta)
-				continue;
+			stream_method_fams2_meta = get_per_method_common_meta(pmo, pstate_strategy->per_stream_pstate_method[i], i);
 
 			if (group_fams2_meta->allow_start_otg_vline < stream_method_fams2_meta->allow_start_otg_vline) {
 				/* set group allow start to larger otg vline */
@@ -1126,7 +1234,7 @@ static bool is_timing_group_schedulable(
 static bool is_config_schedulable(
 	struct dml2_pmo_instance *pmo,
 	const struct display_configuation_with_meta *display_cfg,
-	const enum dml2_pmo_pstate_strategy per_stream_pstate_strategy[PMO_DCN4_MAX_DISPLAYS])
+	const struct dml2_pmo_pstate_strategy *pstate_strategy)
 {
 	unsigned int i, j;
 	bool schedulable;
@@ -1149,7 +1257,7 @@ static bool is_config_schedulable(
 	for (i = 0; i < s->pmo_dcn4.num_timing_groups; i++) {
 		s->pmo_dcn4.sorted_group_gtl_disallow_index[i] = i;
 		s->pmo_dcn4.sorted_group_gtl_period_index[i] = i;
-		if (!is_timing_group_schedulable(pmo, display_cfg, per_stream_pstate_strategy, i, &s->pmo_dcn4.group_common_fams2_meta[i])) {
+		if (!is_timing_group_schedulable(pmo, display_cfg, pstate_strategy, i, &s->pmo_dcn4.group_common_fams2_meta[i])) {
 			/* synchronized timing group was not schedulable */
 			schedulable = false;
 			break;
@@ -1251,7 +1359,7 @@ static bool is_config_schedulable(
 		unsigned int sorted_ip1 = s->pmo_dcn4.sorted_group_gtl_period_index[i + 1];
 
 		if (s->pmo_dcn4.group_common_fams2_meta[sorted_i].allow_time_us < s->pmo_dcn4.group_common_fams2_meta[sorted_ip1].period_us ||
-				s->pmo_dcn4.group_is_drr_enabled[sorted_ip1]) {
+				(s->pmo_dcn4.group_is_drr_enabled[sorted_ip1] && s->pmo_dcn4.group_is_drr_active[sorted_ip1])) {
 			schedulable = false;
 			break;
 		}
@@ -1263,8 +1371,8 @@ static bool is_config_schedulable(
 
 	/* STAGE 4: When using HW exclusive modes, check disallow alignments are within allowed threshold */
 	if (s->pmo_dcn4.num_timing_groups == 2 &&
-			!is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, per_stream_pstate_strategy[0]) &&
-			!is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, per_stream_pstate_strategy[1])) {
+			!is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, pstate_strategy->per_stream_pstate_method[0]) &&
+			!is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, pstate_strategy->per_stream_pstate_method[1])) {
 		double period_ratio;
 		double max_shift_us;
 		double shift_per_period;
@@ -1293,44 +1401,45 @@ static bool is_config_schedulable(
 }
 
 static bool stream_matches_drr_policy(struct dml2_pmo_instance *pmo,
-		const struct display_configuation_with_meta *display_cfg,
-		const enum dml2_pmo_pstate_strategy stream_pstate_strategy,
-		unsigned int stream_index)
+	const struct display_configuation_with_meta *display_cfg,
+	const enum dml2_pmo_pstate_method stream_pstate_method,
+	unsigned int stream_index)
 {
 	const struct dml2_stream_parameters *stream_descriptor = &display_cfg->display_config.stream_descriptors[stream_index];
 	bool strategy_matches_drr_requirements = true;
 
 	/* check if strategy is compatible with stream drr capability and strategy */
-	if (is_bit_set_in_bitfield(PMO_NO_DRR_STRATEGY_MASK, stream_pstate_strategy) &&
+	if (is_bit_set_in_bitfield(PMO_NO_DRR_STRATEGY_MASK, stream_pstate_method) &&
 			display_cfg->display_config.num_streams > 1 &&
 			stream_descriptor->timing.drr_config.enabled &&
 			(stream_descriptor->timing.drr_config.drr_active_fixed || stream_descriptor->timing.drr_config.drr_active_variable)) {
 		/* DRR is active, so config may become unschedulable */
 		strategy_matches_drr_requirements = false;
-	} else if (is_bit_set_in_bitfield(PMO_NO_DRR_STRATEGY_MASK, stream_pstate_strategy) &&
-			is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, stream_pstate_strategy) &&
+	} else if (is_bit_set_in_bitfield(PMO_NO_DRR_STRATEGY_MASK, stream_pstate_method) &&
+			is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, stream_pstate_method) &&
 			stream_descriptor->timing.drr_config.enabled &&
 			stream_descriptor->timing.drr_config.drr_active_variable) {
 		/* DRR is variable, fw exclusive methods require DRR to be clamped */
 		strategy_matches_drr_requirements = false;
-	} else if (is_bit_set_in_bitfield(PMO_DRR_VAR_STRATEGY_MASK, stream_pstate_strategy) &&
+	} else if (is_bit_set_in_bitfield(PMO_DRR_VAR_STRATEGY_MASK, stream_pstate_method) &&
 			pmo->options->disable_drr_var_when_var_active &&
 			stream_descriptor->timing.drr_config.enabled &&
 			stream_descriptor->timing.drr_config.drr_active_variable) {
 		/* DRR variable is active, but policy blocks DRR for p-state when this happens */
 		strategy_matches_drr_requirements = false;
-	} else if (is_bit_set_in_bitfield(PMO_DRR_VAR_STRATEGY_MASK, stream_pstate_strategy) &&
+	} else if (is_bit_set_in_bitfield(PMO_DRR_VAR_STRATEGY_MASK, stream_pstate_method) &&
 			(pmo->options->disable_drr_var ||
 			!stream_descriptor->timing.drr_config.enabled ||
 			stream_descriptor->timing.drr_config.disallowed)) {
 		/* DRR variable strategies are disallowed due to settings or policy */
 		strategy_matches_drr_requirements = false;
-	} else if (is_bit_set_in_bitfield(PMO_DRR_CLAMPED_STRATEGY_MASK, stream_pstate_strategy) &&
+	} else if (is_bit_set_in_bitfield(PMO_DRR_CLAMPED_STRATEGY_MASK, stream_pstate_method) &&
 			(pmo->options->disable_drr_clamped ||
-			!stream_descriptor->timing.drr_config.enabled)) {
+			!stream_descriptor->timing.drr_config.enabled ||
+			(!stream_descriptor->timing.drr_config.drr_active_fixed && !stream_descriptor->timing.drr_config.drr_active_variable))) {
 		/* DRR fixed strategies are disallowed due to settings or policy */
 		strategy_matches_drr_requirements = false;
-	} else if (is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, stream_pstate_strategy) &&
+	} else if (is_bit_set_in_bitfield(PMO_FW_STRATEGY_MASK, stream_pstate_method) &&
 			pmo->options->disable_fams2) {
 		/* FW modes require FAMS2 */
 		strategy_matches_drr_requirements = false;
@@ -1341,7 +1450,7 @@ static bool stream_matches_drr_policy(struct dml2_pmo_instance *pmo,
 
 static bool validate_pstate_support_strategy_cofunctionality(struct dml2_pmo_instance *pmo,
 		const struct display_configuation_with_meta *display_cfg,
-		const enum dml2_pmo_pstate_strategy per_stream_pstate_strategy[PMO_DCN4_MAX_DISPLAYS])
+		const struct dml2_pmo_pstate_strategy *pstate_strategy)
 {
 	struct dml2_pmo_scratch *s = &pmo->scratch;
 
@@ -1362,28 +1471,28 @@ static bool validate_pstate_support_strategy_cofunctionality(struct dml2_pmo_ins
 	// Tabulate everything
 	for (stream_index = 0; stream_index < display_cfg->display_config.num_streams; stream_index++) {
 
-		if (!all_planes_match_strategy(display_cfg, s->pmo_dcn4.stream_plane_mask[stream_index],
-			per_stream_pstate_strategy[stream_index])) {
+		if (!all_planes_match_method(display_cfg, s->pmo_dcn4.stream_plane_mask[stream_index],
+			pstate_strategy->per_stream_pstate_method[stream_index])) {
 			strategy_matches_forced_requirements = false;
 			break;
 		}
 
 		strategy_matches_drr_requirements &=
-				stream_matches_drr_policy(pmo, display_cfg, per_stream_pstate_strategy[stream_index], stream_index);
+			stream_matches_drr_policy(pmo, display_cfg, pstate_strategy->per_stream_pstate_method[stream_index], stream_index);
 
-		if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_fw_svp ||
-				per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
+		if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp ||
+			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
 			svp_count++;
 			set_bit_in_bitfield(&svp_stream_mask, stream_index);
-		} else if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
+		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
 			drr_count++;
 			set_bit_in_bitfield(&drr_stream_mask, stream_index);
-		} else if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_vactive ||
-				per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
+		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vactive ||
+			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
 			vactive_count++;
 			set_bit_in_bitfield(&vactive_stream_mask, stream_index);
-		} else if (per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_vblank ||
-				per_stream_pstate_strategy[stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
+		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vblank ||
+			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
 			vblank_count++;
 			set_bit_in_bitfield(&vblank_stream_mask, stream_index);
 		}
@@ -1392,7 +1501,7 @@ static bool validate_pstate_support_strategy_cofunctionality(struct dml2_pmo_ins
 	if (!strategy_matches_forced_requirements || !strategy_matches_drr_requirements)
 		return false;
 
-	if (vactive_count > 0 && (pmo->options->disable_vblank || !all_timings_support_vactive(pmo, display_cfg, vactive_stream_mask)))
+	if (vactive_count > 0 && !all_timings_support_vactive(pmo, display_cfg, vactive_stream_mask))
 		return false;
 
 	if (vblank_count > 0 && (pmo->options->disable_vblank || !all_timings_support_vblank(pmo, display_cfg, vblank_stream_mask)))
@@ -1404,7 +1513,7 @@ static bool validate_pstate_support_strategy_cofunctionality(struct dml2_pmo_ins
 	if (svp_count > 0 && (pmo->options->disable_svp || !all_timings_support_svp(pmo, display_cfg, svp_stream_mask)))
 		return false;
 
-	return is_config_schedulable(pmo, display_cfg, per_stream_pstate_strategy);
+	return is_config_schedulable(pmo, display_cfg, pstate_strategy);
 }
 
 static int get_vactive_pstate_margin(const struct display_configuation_with_meta *display_cfg, int plane_mask)
@@ -1460,6 +1569,7 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 			(stream_fams2_meta->nom_vtotal * timing->h_total);
 	stream_fams2_meta->nom_frame_time_us =
 			(double)stream_fams2_meta->nom_vtotal * stream_fams2_meta->otg_vline_time_us;
+	stream_fams2_meta->vblank_start = timing->v_blank_end + timing->v_active;
 
 	if (stream_descriptor->timing.drr_config.enabled == true) {
 		if (stream_descriptor->timing.drr_config.min_refresh_uhz != 0.0) {
@@ -1513,7 +1623,7 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 		stream_fams2_meta->method_vactive.common.allow_start_otg_vline =
 			timing->v_blank_end + stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines;
 		stream_fams2_meta->method_vactive.common.allow_end_otg_vline =
-			timing->v_blank_end + timing->v_active -
+			stream_fams2_meta->vblank_start -
 			stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
 	} else {
 		stream_fams2_meta->method_vactive.common.allow_start_otg_vline = 0;
@@ -1523,8 +1633,7 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 	build_method_scheduling_params(&stream_fams2_meta->method_vactive.common, stream_fams2_meta);
 
 	/* vblank */
-	stream_fams2_meta->method_vblank.common.allow_start_otg_vline =
-			timing->v_blank_end + timing->v_active;
+	stream_fams2_meta->method_vblank.common.allow_start_otg_vline = stream_fams2_meta->vblank_start;
 	stream_fams2_meta->method_vblank.common.allow_end_otg_vline =
 			stream_fams2_meta->method_vblank.common.allow_start_otg_vline + 1;
 	stream_fams2_meta->method_vblank.common.period_us = stream_fams2_meta->nom_frame_time_us;
@@ -1558,8 +1667,7 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 			stream_fams2_meta->method_subvp.prefetch_to_mall_delay_otg_vlines +
 			stream_fams2_meta->allow_to_target_delay_otg_vlines;
 	stream_fams2_meta->method_subvp.common.allow_end_otg_vline =
-			stream_fams2_meta->nom_vtotal -
-			timing->v_front_porch -
+			stream_fams2_meta->vblank_start -
 			stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
 	stream_fams2_meta->method_subvp.common.period_us = stream_fams2_meta->nom_frame_time_us;
 	build_method_scheduling_params(&stream_fams2_meta->method_subvp.common, stream_fams2_meta);
@@ -1568,20 +1676,21 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 	stream_fams2_meta->method_drr.programming_delay_otg_vlines =
 			(unsigned int)math_ceil(ip_caps->fams2.drr_programming_delay_us / stream_fams2_meta->otg_vline_time_us);
 	stream_fams2_meta->method_drr.common.allow_start_otg_vline =
-			stream_fams2_meta->nom_vtotal +
+			stream_fams2_meta->vblank_start +
 			stream_fams2_meta->allow_to_target_delay_otg_vlines;
 	stream_fams2_meta->method_drr.common.period_us = stream_fams2_meta->nom_frame_time_us;
 	if (display_config->display_config.num_streams <= 1) {
 		/* only need to stretch vblank for blackout time */
 		stream_fams2_meta->method_drr.stretched_vtotal =
-				stream_fams2_meta->method_drr.common.allow_start_otg_vline +
+				stream_fams2_meta->nom_vtotal +
+				stream_fams2_meta->allow_to_target_delay_otg_vlines +
 				stream_fams2_meta->min_allow_width_otg_vlines +
 				stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
 	} else {
 		/* multi display needs to always be schedulable */
 		stream_fams2_meta->method_drr.stretched_vtotal =
-				stream_fams2_meta->method_drr.common.allow_start_otg_vline +
-				stream_fams2_meta->nom_vtotal +
+				stream_fams2_meta->nom_vtotal * 2 +
+				stream_fams2_meta->allow_to_target_delay_otg_vlines +
 				stream_fams2_meta->min_allow_width_otg_vlines +
 				stream_fams2_meta->dram_clk_change_blackout_otg_vlines;
 	}
@@ -1614,7 +1723,7 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 
 	struct display_configuation_with_meta *display_config;
 	const struct dml2_plane_parameters *plane_descriptor;
-	const enum dml2_pmo_pstate_strategy(*strategy_list)[PMO_DCN4_MAX_DISPLAYS] = NULL;
+	const struct dml2_pmo_pstate_strategy *strategy_list = NULL;
 	unsigned int strategy_list_size = 0;
 	unsigned char plane_index, stream_index, i;
 
@@ -1626,6 +1735,10 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 
 	memset(s, 0, sizeof(struct dml2_pmo_scratch));
 
+	if (display_config->display_config.overrides.all_streams_blanked) {
+		return true;
+	}
+
 	pmo->scratch.pmo_dcn4.min_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
 	pmo->scratch.pmo_dcn4.max_latency_index = pmo->mcg_clock_table_size;
 	pmo->scratch.pmo_dcn4.cur_latency_index = in_out->base_display_config->stage1.min_clk_index_for_latency;
@@ -1663,8 +1776,8 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 	s->pmo_dcn4.num_pstate_candidates = 0;
 
 	for (i = 0; i < strategy_list_size && s->pmo_dcn4.num_pstate_candidates < DML2_PMO_PSTATE_CANDIDATE_LIST_SIZE; i++) {
-		if (validate_pstate_support_strategy_cofunctionality(pmo, display_config, strategy_list[i])) {
-			insert_into_candidate_list(strategy_list[i], display_config->display_config.num_streams, s);
+		if (validate_pstate_support_strategy_cofunctionality(pmo, display_config, &strategy_list[i])) {
+			insert_into_candidate_list(&strategy_list[i], display_config->display_config.num_streams, s);
 		}
 	}
 
@@ -1860,26 +1973,26 @@ static bool setup_display_config(struct display_configuation_with_meta *display_
 
 	for (stream_index = 0; stream_index < display_config->display_config.num_streams; stream_index++) {
 
-		if (pmo->scratch.pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_na) {
+		if (pmo->scratch.pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_na) {
 			success = false;
 			break;
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_vactive) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vactive) {
 			setup_planes_for_vactive_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_vblank) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vblank) {
 			setup_planes_for_vblank_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_fw_svp) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp) {
 			fams2_required = true;
 			setup_planes_for_svp_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
 			fams2_required = true;
 			setup_planes_for_vactive_drr_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
 			fams2_required = true;
 			setup_planes_for_vblank_drr_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
 			fams2_required = true;
 			setup_planes_for_svp_drr_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.per_stream_pstate_strategy[strategy_index][stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
 			fams2_required = true;
 			setup_planes_for_drr_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
 		}
@@ -1920,6 +2033,10 @@ bool pmo_dcn4_fams2_test_for_pstate_support(struct dml2_pmo_test_for_pstate_supp
 	int MIN_VACTIVE_MARGIN_DRR = 0;
 	int REQUIRED_RESERVED_TIME = 0;
 
+	if (in_out->base_display_config->display_config.overrides.all_streams_blanked) {
+		return true;
+	}
+
 	MIN_VACTIVE_MARGIN_VBLANK = INT_MIN;
 	MIN_VACTIVE_MARGIN_DRR = INT_MIN;
 	REQUIRED_RESERVED_TIME = (int)in_out->instance->soc_bb->power_management_parameters.dram_clk_change_blackout_us;
@@ -1930,34 +2047,34 @@ bool pmo_dcn4_fams2_test_for_pstate_support(struct dml2_pmo_test_for_pstate_supp
 	for (stream_index = 0; stream_index < in_out->base_display_config->display_config.num_streams; stream_index++) {
 		struct dml2_fams2_meta *stream_fams2_meta = &s->pmo_dcn4.stream_fams2_meta[stream_index];
 
-		if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_vactive ||
-				s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
+		if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vactive ||
+				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
 			if (get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < (MIN_VACTIVE_MARGIN_PCT * in_out->instance->soc_bb->power_management_parameters.dram_clk_change_blackout_us) ||
 					get_vactive_det_fill_latency_delay_us(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) > stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_us) {
 				p_state_supported = false;
 				break;
 			}
-		} else if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_vblank ||
-				s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
+		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vblank ||
+				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
 			if (get_minimum_reserved_time_us_for_planes(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) <
 				REQUIRED_RESERVED_TIME ||
 				get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < MIN_VACTIVE_MARGIN_VBLANK) {
 				p_state_supported = false;
 				break;
 			}
-		} else if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_fw_svp ||
-				s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
+		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp ||
+				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
 			if (in_out->base_display_config->stage3.stream_svp_meta[stream_index].valid == false) {
 				p_state_supported = false;
 				break;
 			}
-		} else if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
-			if (!all_planes_match_strategy(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index], dml2_pmo_pstate_strategy_fw_drr) ||
+		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
+			if (!all_planes_match_method(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index], dml2_pmo_pstate_strategy_fw_drr) ||
 				get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < MIN_VACTIVE_MARGIN_DRR) {
 				p_state_supported = false;
 				break;
 			}
-		} else if (s->pmo_dcn4.per_stream_pstate_strategy[s->pmo_dcn4.cur_pstate_candidate][stream_index] == dml2_pmo_pstate_strategy_na) {
+		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_na) {
 			p_state_supported = false;
 			break;
 		}
@@ -1974,8 +2091,8 @@ bool pmo_dcn4_fams2_optimize_for_pstate_support(struct dml2_pmo_optimize_for_pst
 	memcpy(in_out->optimized_display_config, in_out->base_display_config, sizeof(struct display_configuation_with_meta));
 
 	if (in_out->last_candidate_failed) {
-		if (s->pmo_dcn4.allow_state_increase_for_strategy[s->pmo_dcn4.cur_pstate_candidate] &&
-			s->pmo_dcn4.cur_latency_index < s->pmo_dcn4.max_latency_index) {
+		if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].allow_state_increase &&
+			s->pmo_dcn4.cur_latency_index < s->pmo_dcn4.max_latency_index - 1) {
 			s->pmo_dcn4.cur_latency_index++;
 
 			success = true;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h
index 75175d93add4..0c25bd3e9ac0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_PMO_FAMS2_DCN4_H__
 #define __DML2_PMO_FAMS2_DCN4_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
index e0b9ece7901d..95f716e2641f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
@@ -2,10 +2,8 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_pmo_factory.h"
 #include "dml2_pmo_dcn4_fams2.h"
-#include "dml2_pmo_dcn4.h"
 #include "dml2_pmo_dcn3.h"
 #include "dml2_external_lib_deps.h"
 
@@ -35,8 +33,8 @@ bool dml2_pmo_create(enum dml2_project_id project_id, struct dml2_pmo_instance *
 
 	switch (project_id) {
 	case dml2_project_dcn4x_stage1:
-		out->initialize = pmo_dcn4_initialize;
-		out->optimize_dcc_mcache = pmo_dcn4_optimize_dcc_mcache;
+		out->initialize = pmo_dcn4_fams2_initialize;
+		out->optimize_dcc_mcache = pmo_dcn4_fams2_optimize_dcc_mcache;
 		result = true;
 		break;
 	case dml2_project_dcn4x_stage2:
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h
index 9d3dc5e94be1..7218de1824cc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_PMO_FACTORY_H__
 #define __DML2_PMO_FACTORY_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
index defe13436a2c..4822dbcc86bb 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "lib_float_math.h"
 
 #define ASSERT(condition)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h
index 537cf6fd4c15..e13b0c5939b0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __LIB_FLOAT_MATH_H__
 #define __LIB_FLOAT_MATH_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c
index 1b6dbfaa7ae8..dc8af4dd0410 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_top_optimization.h"
 #include "dml2_internal_shared_types.h"
 #include "dml_top_mcache.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h
index 1536afcbf73a..9f22ab33eab1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_TOP_OPTIMIZATION_H__
 #define __DML2_TOP_OPTIMIZATION_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
index b25e9230adea..30d07cd1065f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_internal_shared_types.h"
 #include "dml_top.h"
 #include "dml2_mcg_factory.h"
@@ -28,6 +27,7 @@ bool dml2_initialize_instance(struct dml2_initialize_instance_in_out *in_out)
 	bool result = false;
 
 	memset(l, 0, sizeof(struct dml2_initialize_instance_locals));
+	memset(dml, 0, sizeof(struct dml2_instance));
 
 	memcpy(&dml->ip_caps, &in_out->ip_caps, sizeof(struct dml2_ip_capabilities));
 	memcpy(&dml->soc_bbox, &in_out->soc_bb, sizeof(struct dml2_soc_bb));
@@ -96,14 +96,12 @@ bool dml2_check_mode_supported(struct dml2_check_mode_supported_in_out *in_out)
 {
 	struct dml2_instance *dml = (struct dml2_instance *)in_out->dml2_instance;
 	struct dml2_check_mode_supported_locals *l = &dml->scratch.check_mode_supported_locals;
-	/* Borrow the build_mode_programming_locals programming struct for DPMM call. */
-	struct dml2_display_cfg_programming *dpmm_programming = dml->scratch.build_mode_programming_locals.mode_programming_params.programming;
+	struct dml2_display_cfg_programming *dpmm_programming = &dml->dpmm_instance.dpmm_scratch.programming;
 
 	bool result = false;
 	bool mcache_success = false;
 
-	if (dpmm_programming)
-		memset(dpmm_programming, 0, sizeof(struct dml2_display_cfg_programming));
+	memset(dpmm_programming, 0, sizeof(struct dml2_display_cfg_programming));
 
 	setup_unoptimized_display_config_with_meta(dml, &l->base_display_config_with_meta, in_out->display_config);
 
@@ -130,7 +128,7 @@ bool dml2_check_mode_supported(struct dml2_check_mode_supported_in_out *in_out)
 	/*
 	 * Call DPMM to map all requirements to minimum clock state
 	 */
-	if (result && dpmm_programming) {
+	if (result) {
 		l->dppm_map_mode_params.min_clk_table = &dml->min_clk_table;
 		l->dppm_map_mode_params.display_cfg = &l->base_display_config_with_meta;
 		l->dppm_map_mode_params.programming = dpmm_programming;
@@ -140,9 +138,8 @@ bool dml2_check_mode_supported(struct dml2_check_mode_supported_in_out *in_out)
 	}
 
 	in_out->is_supported = mcache_success;
-	result = result && in_out->is_supported;
 
-	return result;
+	return true;
 }
 
 bool dml2_build_mode_programming(struct dml2_build_mode_programming_in_out *in_out)
@@ -268,24 +265,15 @@ bool dml2_build_mode_programming(struct dml2_build_mode_programming_in_out *in_o
 
 	vmin_success = dml2_top_optimization_perform_optimization_phase(&l->optimization_phase_locals, &l->vmin_phase);
 
-	if (l->optimized_display_config_with_meta.stage4.performed) {
-		/*
-		 * when performed is true, optimization has applied to
-		 * optimized_display_config_with_meta and it has passed mode
-		 * support. However it may or may not pass the test function to
-		 * reach actual Vmin. As long as voltage is optimized even if it
-		 * doesn't reach Vmin level, there is still power benefit so in
-		 * this case we will still copy this optimization into base
-		 * display config.
-		 */
+	if (vmin_success) {
 		memcpy(&l->base_display_config_with_meta, &l->optimized_display_config_with_meta, sizeof(struct display_configuation_with_meta));
-		l->base_display_config_with_meta.stage4.success = vmin_success;
+		l->base_display_config_with_meta.stage4.success = true;
 	}
 
 	/*
 	* Phase 5: Optimize for Stutter
 	*/
-	memset(&l->stutter_phase, 0, sizeof(struct optimization_phase_params));
+	memset(&l->vmin_phase, 0, sizeof(struct optimization_phase_params));
 	l->stutter_phase.dml = dml;
 	l->stutter_phase.display_config = &l->base_display_config_with_meta;
 	l->stutter_phase.init_function = dml2_top_optimization_init_function_stutter;
@@ -298,7 +286,7 @@ bool dml2_build_mode_programming(struct dml2_build_mode_programming_in_out *in_o
 
 	if (stutter_success) {
 		memcpy(&l->base_display_config_with_meta, &l->optimized_display_config_with_meta, sizeof(struct display_configuation_with_meta));
-		l->base_display_config_with_meta.stage5.success = true;
+		l->base_display_config_with_meta.stage4.success = true;
 	}
 
 	/*
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
index 7afd417071a5..e69f8ce97e24 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_debug.h"
 
 #include "dml_top_mcache.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
index bb12e4c30690..7b1f6f7143d0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML_TOP_MCACHE_H__
 #define __DML_TOP_MCACHE_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
index de7d8a6a2d3d..e9b8e10695ae 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #include "dml2_debug.h"
 
 int dml2_printf(const char *format, ...)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
index 0403238df107..d51a1b6c62f2 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_DEBUG_H__
 #define __DML2_DEBUG_H__
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
index 5632cdacb7f4..aeac9f159fa5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
@@ -2,7 +2,6 @@
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
 
-
 #ifndef __DML2_INTERNAL_SHARED_TYPES_H__
 #define __DML2_INTERNAL_SHARED_TYPES_H__
 
@@ -107,10 +106,16 @@ struct dml2_dpmm_map_watermarks_params_in_out {
 	struct dml2_display_cfg_programming *programming;
 };
 
+struct dml2_dpmm_scratch {
+	struct dml2_display_cfg_programming programming;
+};
+
 struct dml2_dpmm_instance {
 	bool (*map_mode_to_soc_dpm)(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_out *in_out);
 	bool (*map_watermarks)(struct dml2_dpmm_map_watermarks_params_in_out *in_out);
 	bool (*unit_test)(void);
+
+	struct dml2_dpmm_scratch dpmm_scratch;
 };
 
 /*
@@ -266,6 +271,7 @@ struct dml2_fams2_meta {
 	unsigned int contention_delay_otg_vlines;
 	unsigned int min_allow_width_otg_vlines;
 	unsigned int nom_vtotal;
+	unsigned int vblank_start;
 	double nom_refresh_rate_hz;
 	double nom_frame_time_us;
 	unsigned int max_vtotal;
@@ -594,7 +600,7 @@ struct dml2_pmo_optimize_for_stutter_in_out {
 	struct display_configuation_with_meta *optimized_display_config;
 };
 
-enum dml2_pmo_pstate_strategy {
+enum dml2_pmo_pstate_method {
 	dml2_pmo_pstate_strategy_na = 0,
 	/* hw exclusive modes */
 	dml2_pmo_pstate_strategy_vactive = 1,
@@ -612,6 +618,11 @@ enum dml2_pmo_pstate_strategy {
 	dml2_pmo_pstate_strategy_reserved_fw_drr_var = 22,
 };
 
+struct dml2_pmo_pstate_strategy {
+	enum dml2_pmo_pstate_method per_stream_pstate_method[DML2_MAX_PLANES];
+	bool allow_state_increase;
+};
+
 #define PMO_NO_DRR_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw - dml2_pmo_pstate_strategy_na + 1)) - 1) << dml2_pmo_pstate_strategy_na)
 #define PMO_DRR_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_var - dml2_pmo_pstate_strategy_fw_vactive_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_vactive_drr)
 #define PMO_DRR_CLAMPED_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_clamped - dml2_pmo_pstate_strategy_fw_vactive_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_vactive_drr)
@@ -634,8 +645,7 @@ struct dml2_pmo_scratch {
 			int stream_mask;
 		} pmo_dcn3;
 		struct {
-			enum dml2_pmo_pstate_strategy per_stream_pstate_strategy[DML2_MAX_PLANES][DML2_PMO_PSTATE_CANDIDATE_LIST_SIZE];
-			bool allow_state_increase_for_strategy[DML2_PMO_PSTATE_CANDIDATE_LIST_SIZE];
+			struct dml2_pmo_pstate_strategy pstate_strategy_candidates[DML2_PMO_PSTATE_CANDIDATE_LIST_SIZE];
 			int num_pstate_candidates;
 			int cur_pstate_candidate;
 
@@ -661,6 +671,7 @@ struct dml2_pmo_scratch {
 			unsigned int num_timing_groups;
 			unsigned int synchronized_timing_group_masks[DML2_MAX_PLANES];
 			bool group_is_drr_enabled[DML2_MAX_PLANES];
+			bool group_is_drr_active[DML2_MAX_PLANES];
 			double group_line_time_us[DML2_MAX_PLANES];
 
 			/* scheduling check locals */
@@ -676,10 +687,10 @@ struct dml2_pmo_init_data {
 	union {
 		struct {
 			/* populated once during initialization */
-			enum dml2_pmo_pstate_strategy expanded_strategy_list_1_display[PMO_DCN4_MAX_BASE_STRATEGIES * 2][PMO_DCN4_MAX_DISPLAYS];
-			enum dml2_pmo_pstate_strategy expanded_strategy_list_2_display[PMO_DCN4_MAX_BASE_STRATEGIES * 2 * 2][PMO_DCN4_MAX_DISPLAYS];
-			enum dml2_pmo_pstate_strategy expanded_strategy_list_3_display[PMO_DCN4_MAX_BASE_STRATEGIES * 6 * 2][PMO_DCN4_MAX_DISPLAYS];
-			enum dml2_pmo_pstate_strategy expanded_strategy_list_4_display[PMO_DCN4_MAX_BASE_STRATEGIES * 24 * 2][PMO_DCN4_MAX_DISPLAYS];
+			struct dml2_pmo_pstate_strategy expanded_strategy_list_1_display[PMO_DCN4_MAX_BASE_STRATEGIES * 2];
+			struct dml2_pmo_pstate_strategy expanded_strategy_list_2_display[PMO_DCN4_MAX_BASE_STRATEGIES * 4 * 4];
+			struct dml2_pmo_pstate_strategy expanded_strategy_list_3_display[PMO_DCN4_MAX_BASE_STRATEGIES * 6 * 6 * 6];
+			struct dml2_pmo_pstate_strategy expanded_strategy_list_4_display[PMO_DCN4_MAX_BASE_STRATEGIES * 8 * 8 * 8 * 8];
 			unsigned int num_expanded_strategies_per_list[PMO_DCN4_MAX_DISPLAYS];
 		} pmo_dcn4;
 	};
-- 
2.34.1


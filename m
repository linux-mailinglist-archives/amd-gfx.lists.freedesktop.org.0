Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2D9953D80
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2024 00:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D3C10E53E;
	Thu, 15 Aug 2024 22:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rqIan6IR";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DB710E53E
 for <amd-gfx@lists.freedesktop.org>; Thu, 15 Aug 2024 22:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chgrDv0xbH+8AiiDYXtawe8JYRoHTKnVdAvMOkpAetUNypRb2nMjGc6Mwx4fvQa8NUm7rImKw3zZTiaLTjt8g0bPA047R8I6DGMWM9PdznNH7Qy1Qs7BWDdRKLTdYmg8NKwHEo9DnVoYp1a8C8cM/mCkj2SU9A1QW5QUV1hRma9bND3howpUl7E7IVjxR61tb5/PAGyzOlLeNVX5Gn0Id6r4u7bzS21l9qqGu+bB1LwzmYMtdYNusHVFLPl0XNZ5P9Dk+RI+WrQRCGvHTE0sj5C1PC5RPUAFjQv/e+gNrlgd8rK9iQj40392SbHRjEZIT7KmUIMDnG0FMXHrh+lvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYyy961xeY1+p06p34fL6kpY1IeyEaU8m4MLucBlxmA=;
 b=J1vVDvw3PYplHwvQLbJvQIldoochWMAwtyZ+DRFSpyn4+19TgK4RrHaJKF0/I3+QhePnEEJT+PkoGYZIOWRVGT1mCIla8RHc7SNxGad1Rh5F+NUl6cuHCG07gJHbarpGv9O8iiK1I4P08Ydnxw/FvPMSh7tn3YiFffSyIB8uUQc+0wKt8Bt36s2euUR7/wdBbCgOB8zP3RJF5I+S6q9lQJ0GOTwzUlimdZNvXz4xCZH/vhUO0p9p7TKeoo3/iwfRsI2G1Q1nnCL3XeAyuwa0voWA/fh/UEaZmGWpw/HFva/hrZr3/NQVUlhUceGxIowlA9ExRF/T3EcU4bbAL1dY/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYyy961xeY1+p06p34fL6kpY1IeyEaU8m4MLucBlxmA=;
 b=rqIan6IR+4NZRPWqOZbg40JgnJzNJd6+IuNoKd+jJsRJPxSDT3T3H/RZPmWmNv5kkuUuG9OnLPk6E8oL7WC2OlkB8gv4+YAPPNhlUFKFnNJ1j1OzSSns2P8c0OMzDhuczrKVtyx+bhcTDOGQs1D13NNRgRi7JHYLPrZ4hSmfdlc=
Received: from MN2PR08CA0026.namprd08.prod.outlook.com (2603:10b6:208:239::31)
 by IA1PR12MB6234.namprd12.prod.outlook.com (2603:10b6:208:3e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 22:45:51 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::32) by MN2PR08CA0026.outlook.office365.com
 (2603:10b6:208:239::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Thu, 15 Aug 2024 22:45:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 15 Aug 2024 22:45:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Aug
 2024 17:45:50 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Aug
 2024 17:45:50 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 15 Aug 2024 17:45:49 -0500
From: <Roman.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Sunpeng.Li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <Aurabindo.Pillai@amd.com>, <roman.li@amd.com>,
 <wayne.lin@amd.com>, <agustin.gutierrez@amd.com>, <chiahsuan.chung@amd.com>,
 <jerry.zuo@amd.com>, <zaeem.mohamed@amd.com>, Austin Zheng
 <Austin.Zheng@amd.com>, Dillon Varone <dillon.varone@amd.com>
Subject: [PATCH 11/13] drm/amd/display: DML2.1 Reintegration for Various Fixes
Date: Thu, 15 Aug 2024 18:45:23 -0400
Message-ID: <20240815224525.3077505-12-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240815224525.3077505-1-Roman.Li@amd.com>
References: <20240815224525.3077505-1-Roman.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Roman.Li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|IA1PR12MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7b6d6b-ff56-4555-82aa-08dcbd7c037e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UPmw1EafIG565dXC5Im7hjOKCyIm4gdeL8N2e8ixG7xwfB5rStajGEtrIoQZ?=
 =?us-ascii?Q?zm71+fJhsKYDoafxZ3lO52tNZC0V+vSndKnSazF9ug9di0BpfKAIPA+7/6gU?=
 =?us-ascii?Q?pqrMQKWaiPsQN0d8tkFvndNfCo327O0GkNFmGyJllATAc3MZVc8w0VsntIFr?=
 =?us-ascii?Q?Di1ODInYVS38hKR/6X30HNDh4fxqlod22ca213GgpaJgYrsVHWZc10SmjCxY?=
 =?us-ascii?Q?+gbzhWFF0D5Vu6F4VbRFcIdidJN647iALc4aulATMA/2MUipvlYGiVbPJar6?=
 =?us-ascii?Q?zUGSOcxPuVsNwOgSMpOaHYzfwxsr95Bfh60E9n4oKfVEIcM3bljToHyHqkxb?=
 =?us-ascii?Q?tbu1p8r8SjPSDWQU5h3ZBFldS48poUAIOyFTFAwFqBYbJzHPxucjuh/eEOxZ?=
 =?us-ascii?Q?hFD1QR8I8oNnbpvlMdYIoRMXfxYUXA2dik8WlgQnTPA/7rNlb7UK567XZOe5?=
 =?us-ascii?Q?ZlPkTFmLs8Jq1+dlADIMJNOTxybn65gic44Pj51puqSSbPy9E7GZmgd6i46u?=
 =?us-ascii?Q?I+MnhKPLFWzunPkae7WUQ4+kZpBiJMA/hL+DCTmlsMuuzeN2sTcBNXFjBC8F?=
 =?us-ascii?Q?uhHedXkQoPCzgR/5AOkxoCdUBxAlUr8FpoDKPqZFY4bGaQxNazivRWVItuxN?=
 =?us-ascii?Q?OWFsn4z/0CiPvq7CSzu5JHyrAoSMWuM3AdpgTIRW2psEYwZVVJE/tgx8ocmE?=
 =?us-ascii?Q?8jPQtvosUN/GEtLVi8NBoeG8gIlIWL4o5SNU3paV8zowX+nfuMmI3atrJq3w?=
 =?us-ascii?Q?+BEEjTaKBUpVDXGuD1UXgQF14aeJVajAQerzm4FDAn/gCEusAw1HUi8mQSFC?=
 =?us-ascii?Q?sQsvjoZqk6NgvPqRUIjx7NtPNXrHFPL0wj2gi9/aAXDFNZvRf/q2+ZVGo8an?=
 =?us-ascii?Q?alWwpsMAS2QlRaH0toFlsCS8sxpDdaDf401D8LTdzX0nRznmccJnUTxIC7nY?=
 =?us-ascii?Q?mz5YH07GD6PVCvhR/2Gb97BG42X0+GAsFDUzXbF4k2R8A4mIcaj2hba305rc?=
 =?us-ascii?Q?cEn780jmwSQpbCOfxL+6KlmaorgutVgFxq0NoHR3vnzodgeTgBmwOS/np5Zi?=
 =?us-ascii?Q?sWVr2+5ixSbtKvX+HszyJZ2CoeHzjeOHE8OW9F9iAxaBHNJGDW8vB4xfy6VU?=
 =?us-ascii?Q?bXeMvK9Bw0b1CmnFNK+E+vGmIKRpNPkaXz1+Ew9dwI5dR1a/MwUGxSm/MTKW?=
 =?us-ascii?Q?Ylu2sR04J4kK++irmgpgRUUfDQZYkcqFAvAAMS6ZEhLOv6xQYe2mI/9IbMRe?=
 =?us-ascii?Q?saGdE9VnckI1fRwDDqkPbminVFEQtZP9Ew7BQB0xDRHUDHrglrWE8aB6SlWG?=
 =?us-ascii?Q?ioYU+oqSD2moUMSG3oTHQgKMw03TEVD1x43XLq0g9IdNR9AsVrM6ZiiQ73GD?=
 =?us-ascii?Q?F/Hw/ql28N6jIXpUsiijpEyXp/ub15L3YSweJAZYJOQ4phwwtKecA2765Uht?=
 =?us-ascii?Q?45UFw8LeSwUqbMox8qfmurTZo2vd95M4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:45:51.1359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7b6d6b-ff56-4555-82aa-08dcbd7c037e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6234
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

From: Austin Zheng <Austin.Zheng@amd.com>

[Why and How]
DML2.1 reintegration for several fixes and updates to the DML
code.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: Roman Li <roman.li@amd
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  |   3 -
 .../dml21/inc/bounding_boxes/dcn4_soc_bb.h    |   2 +-
 .../dml21/inc/dml_top_soc_parameter_types.h   |   1 +
 .../dml2/dml21/src/dml2_core/dml2_core_dcn4.c |   1 -
 .../src/dml2_core/dml2_core_dcn4_calcs.c      | 478 +++++++------
 .../dml21/src/dml2_core/dml2_core_factory.c   |   2 +-
 .../dml21/src/dml2_core/dml2_core_shared.h    |  37 -
 .../src/dml2_core/dml2_core_shared_types.h    |  22 +-
 .../dml21/src/dml2_core/dml2_core_utils.c     | 631 ++++++++++++++++++
 .../dml21/src/dml2_core/dml2_core_utils.h     |  39 ++
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c |  54 +-
 .../dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |   2 +-
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  20 +-
 .../dml21/src/dml2_pmo/dml2_pmo_factory.c     |   2 +-
 14 files changed, 1009 insertions(+), 285 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index e954182c70a3..d2e158e69df4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -111,7 +111,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimization := $(dml2_
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o := $(dml2_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o := $(dml2_ccflags)
@@ -133,7 +132,6 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.o :
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o := $(dml2_rcflags)
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_shared.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.o := $(dml2_rcflags)
@@ -154,7 +152,6 @@ DML21 += src/inc/dml2_debug.o
 DML21 += src/dml2_core/dml2_core_dcn4.o
 DML21 += src/dml2_core/dml2_core_factory.o
 DML21 += src/dml2_core/dml2_core_dcn4_calcs.o
-DML21 += src/dml2_core/dml2_core_shared.o
 DML21 += src/dml2_dpmm/dml2_dpmm_dcn4.o
 DML21 += src/dml2_dpmm/dml2_dpmm_factory.o
 DML21 += src/dml2_mcg/dml2_mcg_dcn4.o
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
index 898b1dd69edd..8ef7977841de 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
@@ -355,7 +355,7 @@ static const struct dml2_ip_capabilities dml2_dcn401_max_ip_caps = {
 	.fams2 = {
 		.max_allow_delay_us = 100 * 1000,
 		.scheduling_delay_us = 125,
-		.vertical_interrupt_ack_delay_us = 18,
+		.vertical_interrupt_ack_delay_us = 40,
 		.allow_programming_delay_us = 18,
 		.min_allow_width_us = 20,
 		.subvp_df_throttle_delay_us = 100,
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
index 4a46b21c3e55..ebd8abe894a9 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
@@ -151,6 +151,7 @@ struct dml2_soc_bb {
 	double phy_downspread_percent;
 	double dcn_downspread_percent;
 	double dispclk_dppclk_vco_speed_mhz;
+	bool no_dfs;
 	bool do_urgent_latency_adjustment;
 	unsigned int mem_word_bytes;
 	unsigned int num_dcc_mcaches;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
index 9375c6ae1147..698307f3ca39 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
@@ -273,7 +273,6 @@ static void pack_mode_programming_params_with_implicit_subvp(struct dml2_core_in
 		programming->fams2_required = display_cfg->stage3.fams2_required;
 
 		dml2_core_calcs_get_global_fams2_programming(&core->clean_me_up.mode_lib, display_cfg, &programming->fams2_global_config);
-		programming->fams2_global_config.features.bits.enable = display_cfg->stage3.fams2_required;
 	}
 
 	// Only loop over all the main streams (the implicit svp streams will be packed as part of the main stream)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index c3c4d8d9525c..e2c45e498664 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -8,32 +8,55 @@
 #include "dml2_debug.h"
 #include "lib_float_math.h"
 #include "dml_top_types.h"
-#include "dml2_core_shared.h"
 
-//#define DML_TVM_UPDATE_EN
 #define DML2_MAX_FMT_420_BUFFER_WIDTH 4096
 #define DML_MAX_NUM_OF_SLICES_PER_DSC 4
 
-static void dml2_print_dml_mode_support_info(const struct dml2_core_internal_mode_support_info *support, bool fail_only)
+const char *dml2_core_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type)
+{
+	switch (bw_type) {
+	case (dml2_core_internal_bw_sdp):
+		return("dml2_core_internal_bw_sdp");
+	case (dml2_core_internal_bw_dram):
+		return("dml2_core_internal_bw_dram");
+	case (dml2_core_internal_bw_max):
+		return("dml2_core_internal_bw_max");
+	default:
+		return("dml2_core_internal_bw_unknown");
+	}
+}
+
+const char *dml2_core_internal_soc_state_type_str(enum dml2_core_internal_soc_state_type dml2_core_internal_soc_state_type)
+{
+	switch (dml2_core_internal_soc_state_type) {
+	case (dml2_core_internal_soc_state_sys_idle):
+		return("dml2_core_internal_soc_state_sys_idle");
+	case (dml2_core_internal_soc_state_sys_active):
+		return("dml2_core_internal_soc_state_sys_active");
+	case (dml2_core_internal_soc_state_svp_prefetch):
+		return("dml2_core_internal_soc_state_svp_prefetch");
+	case dml2_core_internal_soc_state_max:
+	default:
+		return("dml2_core_internal_soc_state_unknown");
+	}
+}
+
+static double dml2_core_div_rem(double dividend, unsigned int divisor, unsigned int *remainder)
+{
+	*remainder = ((dividend / divisor) - (int)(dividend / divisor) > 0);
+	return dividend / divisor;
+}
+
+static void dml2_print_mode_support_info(const struct dml2_core_internal_mode_support_info *support, bool fail_only)
 {
 	dml2_printf("DML: ===================================== \n");
 	dml2_printf("DML: DML_MODE_SUPPORT_INFO_ST\n");
-	if (!fail_only || support->ImmediateFlipSupport == 0)
-		dml2_printf("DML: support: ImmediateFlipSupport = %d\n", support->ImmediateFlipSupport);
-	if (!fail_only || support->WritebackLatencySupport == 0)
-		dml2_printf("DML: support: WritebackLatencySupport = %d\n", support->WritebackLatencySupport);
 	if (!fail_only || support->ScaleRatioAndTapsSupport == 0)
 		dml2_printf("DML: support: ScaleRatioAndTapsSupport = %d\n", support->ScaleRatioAndTapsSupport);
 	if (!fail_only || support->SourceFormatPixelAndScanSupport == 0)
 		dml2_printf("DML: support: SourceFormatPixelAndScanSupport = %d\n", support->SourceFormatPixelAndScanSupport);
-	if (!fail_only || support->P2IWith420 == 1)
-		dml2_printf("DML: support: P2IWith420 = %d\n", support->P2IWith420);
-	if (!fail_only || support->DSCOnlyIfNecessaryWithBPP == 1)
-		dml2_printf("DML: support: DSCOnlyIfNecessaryWithBPP = %d\n", support->DSCOnlyIfNecessaryWithBPP);
-	if (!fail_only || support->DSC422NativeNotSupported == 1)
-		dml2_printf("DML: support: DSC422NativeNotSupported = %d\n", support->DSC422NativeNotSupported);
-	if (!fail_only || support->DSCSlicesODMModeSupported == 0)
-		dml2_printf("DML: support: DSCSlicesODMModeSupported = %d\n", support->DSCSlicesODMModeSupported);
+	if (!fail_only || support->ViewportSizeSupport == 0)
+		dml2_printf("DML: support: ViewportSizeSupport = %d\n", support->ViewportSizeSupport);
 	if (!fail_only || support->LinkRateDoesNotMatchDPVersion == 1)
 		dml2_printf("DML: support: LinkRateDoesNotMatchDPVersion = %d\n", support->LinkRateDoesNotMatchDPVersion);
 	if (!fail_only || support->LinkRateForMultistreamNotIndicated == 1)
@@ -42,74 +65,87 @@ static void dml2_print_dml_mode_support_info(const struct dml2_core_internal_mod
 		dml2_printf("DML: support: BPPForMultistreamNotIndicated = %d\n", support->BPPForMultistreamNotIndicated);
 	if (!fail_only || support->MultistreamWithHDMIOreDP == 1)
 		dml2_printf("DML: support: MultistreamWithHDMIOreDP = %d\n", support->MultistreamWithHDMIOreDP);
+	if (!fail_only || support->ExceededMultistreamSlots == 1)
+		dml2_printf("DML: support: ExceededMultistreamSlots = %d\n", support->ExceededMultistreamSlots);
 	if (!fail_only || support->MSOOrODMSplitWithNonDPLink == 1)
 		dml2_printf("DML: support: MSOOrODMSplitWithNonDPLink = %d\n", support->MSOOrODMSplitWithNonDPLink);
 	if (!fail_only || support->NotEnoughLanesForMSO == 1)
 		dml2_printf("DML: support: NotEnoughLanesForMSO = %d\n", support->NotEnoughLanesForMSO);
-	if (!fail_only || support->NumberOfOTGSupport == 0)
-		dml2_printf("DML: support: NumberOfOTGSupport = %d\n", support->NumberOfOTGSupport);
-	if (!fail_only || support->NumberOfHDMIFRLSupport == 0)
-		dml2_printf("DML: support: NumberOfHDMIFRLSupport = %d\n", support->NumberOfHDMIFRLSupport);
-	if (!fail_only || support->NumberOfDP2p0Support == 0)
-		dml2_printf("DML: support: NumberOfDP2p0Support = %d\n", support->NumberOfDP2p0Support);
-	if (!fail_only || support->WritebackScaleRatioAndTapsSupport == 0)
-		dml2_printf("DML: support: WritebackScaleRatioAndTapsSupport = %d\n", support->WritebackScaleRatioAndTapsSupport);
-	if (!fail_only || support->CursorSupport == 0)
-		dml2_printf("DML: support: CursorSupport = %d\n", support->CursorSupport);
-	if (!fail_only || support->PitchSupport == 0)
-		dml2_printf("DML: support: PitchSupport = %d\n", support->PitchSupport);
-	if (!fail_only || support->ViewportExceedsSurface == 1)
-		dml2_printf("DML: support: ViewportExceedsSurface = %d\n", support->ViewportExceedsSurface);
-	if (!fail_only || support->ExceededMALLSize == 1)
-		dml2_printf("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
-	if (!fail_only || support->EnoughWritebackUnits == 0)
-		dml2_printf("DML: support: EnoughWritebackUnits = %d\n", support->EnoughWritebackUnits);
-	if (!fail_only || support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe == 1)
-		dml2_printf("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = %d\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
-	if (!fail_only || support->InvalidCombinationOfMALLUseForPStateAndStaticScreen == 1)
-		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = %d\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
-	if (!fail_only || support->InvalidCombinationOfMALLUseForPState == 1)
-		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPState = %d\n", support->InvalidCombinationOfMALLUseForPState);
-	if (!fail_only || support->ExceededMultistreamSlots == 1)
-		dml2_printf("DML: support: ExceededMultistreamSlots = %d\n", support->ExceededMultistreamSlots);
+	if (!fail_only || support->P2IWith420 == 1)
+		dml2_printf("DML: support: P2IWith420 = %d\n", support->P2IWith420);
+	if (!fail_only || support->DSC422NativeNotSupported == 1)
+		dml2_printf("DML: support: DSC422NativeNotSupported = %d\n", support->DSC422NativeNotSupported);
+	if (!fail_only || support->DSCSlicesODMModeSupported == 0)
+		dml2_printf("DML: support: DSCSlicesODMModeSupported = %d\n", support->DSCSlicesODMModeSupported);
 	if (!fail_only || support->NotEnoughDSCUnits == 1)
 		dml2_printf("DML: support: NotEnoughDSCUnits = %d\n", support->NotEnoughDSCUnits);
 	if (!fail_only || support->NotEnoughDSCSlices == 1)
 		dml2_printf("DML: support: NotEnoughDSCSlices = %d\n", support->NotEnoughDSCSlices);
-	if (!fail_only || support->PixelsPerLinePerDSCUnitSupport == 0)
-		dml2_printf("DML: support: PixelsPerLinePerDSCUnitSupport = %d\n", support->PixelsPerLinePerDSCUnitSupport);
+	if (!fail_only || support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe == 1)
+		dml2_printf("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = %d\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
+	if (!fail_only || support->InvalidCombinationOfMALLUseForPStateAndStaticScreen == 1)
+		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = %d\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
 	if (!fail_only || support->DSCCLKRequiredMoreThanSupported == 1)
 		dml2_printf("DML: support: DSCCLKRequiredMoreThanSupported = %d\n", support->DSCCLKRequiredMoreThanSupported);
+	if (!fail_only || support->PixelsPerLinePerDSCUnitSupport == 0)
+		dml2_printf("DML: support: PixelsPerLinePerDSCUnitSupport = %d\n", support->PixelsPerLinePerDSCUnitSupport);
 	if (!fail_only || support->DTBCLKRequiredMoreThanSupported == 1)
 		dml2_printf("DML: support: DTBCLKRequiredMoreThanSupported = %d\n", support->DTBCLKRequiredMoreThanSupported);
-	if (!fail_only || support->LinkCapacitySupport == 0)
-		dml2_printf("DML: support: LinkCapacitySupport = %d\n", support->LinkCapacitySupport);
+	if (!fail_only || support->InvalidCombinationOfMALLUseForPState == 1)
+		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPState = %d\n", support->InvalidCombinationOfMALLUseForPState);
 	if (!fail_only || support->ROBSupport == 0)
 		dml2_printf("DML: support: ROBSupport = %d\n", support->ROBSupport);
 	if (!fail_only || support->OutstandingRequestsSupport == 0)
 		dml2_printf("DML: support: OutstandingRequestsSupport = %d\n", support->OutstandingRequestsSupport);
 	if (!fail_only || support->OutstandingRequestsUrgencyAvoidance == 0)
 		dml2_printf("DML: support: OutstandingRequestsUrgencyAvoidance = %d\n", support->OutstandingRequestsUrgencyAvoidance);
-	if (!fail_only || support->PTEBufferSizeNotExceeded == 0)
-		dml2_printf("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
-	if (!fail_only || support->AvgBandwidthSupport == 0)
-		dml2_printf("DML: support: AvgBandwidthSupport = %d\n", support->AvgBandwidthSupport);
-	if (!fail_only || support->EnoughUrgentLatencyHidingSupport == 0)
-		dml2_printf("DML: support: EnoughUrgentLatencyHidingSupport = %d\n", support->EnoughUrgentLatencyHidingSupport);
+	if (!fail_only || support->DISPCLK_DPPCLK_Support == 0)
+		dml2_printf("DML: support: DISPCLK_DPPCLK_Support = %d\n", support->DISPCLK_DPPCLK_Support);
+	if (!fail_only || support->TotalAvailablePipesSupport == 0)
+		dml2_printf("DML: support: TotalAvailablePipesSupport = %d\n", support->TotalAvailablePipesSupport);
+	if (!fail_only || support->NumberOfOTGSupport == 0)
+		dml2_printf("DML: support: NumberOfOTGSupport = %d\n", support->NumberOfOTGSupport);
+	if (!fail_only || support->NumberOfHDMIFRLSupport == 0)
+		dml2_printf("DML: support: NumberOfHDMIFRLSupport = %d\n", support->NumberOfHDMIFRLSupport);
+	if (!fail_only || support->NumberOfDP2p0Support == 0)
+		dml2_printf("DML: support: NumberOfDP2p0Support = %d\n", support->NumberOfDP2p0Support);
+	if (!fail_only || support->EnoughWritebackUnits == 0)
+		dml2_printf("DML: support: EnoughWritebackUnits = %d\n", support->EnoughWritebackUnits);
+	if (!fail_only || support->WritebackScaleRatioAndTapsSupport == 0)
+		dml2_printf("DML: support: WritebackScaleRatioAndTapsSupport = %d\n", support->WritebackScaleRatioAndTapsSupport);
+	if (!fail_only || support->WritebackLatencySupport == 0)
+		dml2_printf("DML: support: WritebackLatencySupport = %d\n", support->WritebackLatencySupport);
+	if (!fail_only || support->CursorSupport == 0)
+		dml2_printf("DML: support: CursorSupport = %d\n", support->CursorSupport);
+	if (!fail_only || support->PitchSupport == 0)
+		dml2_printf("DML: support: PitchSupport = %d\n", support->PitchSupport);
+	if (!fail_only || support->ViewportExceedsSurface == 1)
+		dml2_printf("DML: support: ViewportExceedsSurface = %d\n", support->ViewportExceedsSurface);
 	if (!fail_only || support->PrefetchSupported == 0)
 		dml2_printf("DML: support: PrefetchSupported = %d\n", support->PrefetchSupported);
+	if (!fail_only || support->EnoughUrgentLatencyHidingSupport == 0)
+		dml2_printf("DML: support: EnoughUrgentLatencyHidingSupport = %d\n", support->EnoughUrgentLatencyHidingSupport);
+	if (!fail_only || support->AvgBandwidthSupport == 0)
+		dml2_printf("DML: support: AvgBandwidthSupport = %d\n", support->AvgBandwidthSupport);
 	if (!fail_only || support->DynamicMetadataSupported == 0)
 		dml2_printf("DML: support: DynamicMetadataSupported = %d\n", support->DynamicMetadataSupported);
 	if (!fail_only || support->VRatioInPrefetchSupported == 0)
 		dml2_printf("DML: support: VRatioInPrefetchSupported = %d\n", support->VRatioInPrefetchSupported);
-	if (!fail_only || support->DISPCLK_DPPCLK_Support == 0)
-		dml2_printf("DML: support: DISPCLK_DPPCLK_Support = %d\n", support->DISPCLK_DPPCLK_Support);
-	if (!fail_only || support->TotalAvailablePipesSupport == 0)
-		dml2_printf("DML: support: TotalAvailablePipesSupport = %d\n", support->TotalAvailablePipesSupport);
+	if (!fail_only || support->PTEBufferSizeNotExceeded == 1)
+		dml2_printf("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
+	if (!fail_only || support->DCCMetaBufferSizeNotExceeded == 1)
+		dml2_printf("DML: support: DCCMetaBufferSizeNotExceeded = %d\n", support->DCCMetaBufferSizeNotExceeded);
+	if (!fail_only || support->ExceededMALLSize == 1)
+		dml2_printf("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
+	if (!fail_only || support->g6_temp_read_support == 0)
+		dml2_printf("DML: support: g6_temp_read_support = %d\n", support->g6_temp_read_support);
+	if (!fail_only || support->ImmediateFlipSupport == 0)
+		dml2_printf("DML: support: ImmediateFlipSupport = %d\n", support->ImmediateFlipSupport);
+	if (!fail_only || support->LinkCapacitySupport == 0)
+		dml2_printf("DML: support: LinkCapacitySupport = %d\n", support->LinkCapacitySupport);
+
 	if (!fail_only || support->ModeSupport == 0)
 		dml2_printf("DML: support: ModeSupport = %d\n", support->ModeSupport);
-	if (!fail_only || support->ViewportSizeSupport == 0)
-		dml2_printf("DML: support: ViewportSizeSupport = %d\n", support->ViewportSizeSupport);
 	dml2_printf("DML: ===================================== \n");
 }
 
@@ -2849,16 +2885,9 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 	s->HostVMDynamicLevels = CalculateHostVMDynamicLevels(p->display_cfg->gpuvm_enable, p->display_cfg->hostvm_enable, p->HostVMMinPageSize, p->display_cfg->hostvm_max_non_cached_page_table_levels);
 
 	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
-		if (p->display_cfg->hostvm_enable == true) {
+		if (p->display_cfg->gpuvm_enable == true) {
 			p->vm_group_bytes[k] = 512;
 			p->dpte_group_bytes[k] = 512;
-		} else if (p->display_cfg->gpuvm_enable == true) {
-			p->vm_group_bytes[k] = 2048;
-			if (p->display_cfg->plane_descriptors[k].overrides.gpuvm_min_page_size_kbytes >= 64 && dml_is_vertical_rotation(p->myPipe[k].RotationAngle)) {
-				p->dpte_group_bytes[k] = 512;
-			} else {
-				p->dpte_group_bytes[k] = 2048;
-			}
 		} else {
 			p->vm_group_bytes[k] = 0;
 			p->dpte_group_bytes[k] = 0;
@@ -4556,15 +4585,6 @@ static void calculate_tdlut_setting(
 		return;
 	}
 
-
-	if (!p->setup_for_tdlut) {
-		*p->tdlut_groups_per_2row_ub = 0;
-		*p->tdlut_opt_time = 0;
-		*p->tdlut_drain_time = 0;
-		*p->tdlut_bytes_per_group = 0;
-		return;
-	}
-
 	if (p->tdlut_mpc_width_flag) {
 		tdlut_mpc_width = 33;
 		tdlut_bytes_per_group_simple = 39*256;
@@ -4624,7 +4644,7 @@ static void calculate_tdlut_setting(
 
 	//the tdlut is fetched during the 2 row times of prefetch.
 	if (p->setup_for_tdlut) {
-		*p->tdlut_groups_per_2row_ub = (unsigned int)math_ceil2(*p->tdlut_bytes_per_frame / *p->tdlut_bytes_per_group, 1);
+		*p->tdlut_groups_per_2row_ub = (unsigned int)math_ceil2((double) *p->tdlut_bytes_per_frame / *p->tdlut_bytes_per_group, 1);
 		*p->tdlut_opt_time = (*p->tdlut_bytes_per_frame - p->cursor_buffer_size * 1024) / tdlut_drain_rate;
 		*p->tdlut_drain_time = p->cursor_buffer_size * 1024 / tdlut_drain_rate;
 	}
@@ -4637,7 +4657,7 @@ static void calculate_tdlut_setting(
 
 	dml2_printf("DML::%s: dispclk_mhz = %f\n", __func__, p->dispclk_mhz);
 	dml2_printf("DML::%s: tdlut_width = %u\n", __func__, tdlut_width);
-	dml2_printf("DML::%s: tdlut_addressing_mode = %u\n", __func__, p->tdlut_addressing_mode);
+	dml2_printf("DML::%s: tdlut_addressing_mode = %s\n", __func__, (p->tdlut_addressing_mode == dml2_tdlut_sw_linear) ? "sw_linear" : "simple_linear");
 	dml2_printf("DML::%s: tdlut_pitch_bytes = %u\n", __func__, tdlut_pitch_bytes);
 	dml2_printf("DML::%s: tdlut_footprint_bytes = %u\n", __func__, tdlut_footprint_bytes);
 	dml2_printf("DML::%s: tdlut_bytes_per_frame = %u\n", __func__, *p->tdlut_bytes_per_frame);
@@ -4703,11 +4723,12 @@ static void CalculateTarb(
 static double CalculateTWait(
 	long reserved_vblank_time_ns,
 	double UrgentLatency,
-	double Ttrip)
+	double Ttrip,
+	double g6_temp_read_blackout_us)
 {
 	double TWait;
 	double t_urg_trip = math_max2(UrgentLatency, Ttrip);
-	TWait = reserved_vblank_time_ns/1000.0 + t_urg_trip;
+	TWait = math_max2(reserved_vblank_time_ns/1000.0, g6_temp_read_blackout_us) + t_urg_trip;
 
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: reserved_vblank_time_ns = %d\n", __func__, reserved_vblank_time_ns);
@@ -4855,13 +4876,23 @@ static double get_urgent_bandwidth_required(
 		}
 
 		if (!exclude_this_plane) {
-			surface_required_bw[k] = math_max4(NumberOfDPP[k] * prefetch_vmrow_bw[k],
-					l->per_plane_flip_bw[k] + ReadBandwidthLuma[k] * l->adj_factor_p0 + ReadBandwidthChroma[k] * l->adj_factor_p1 + cursor_bw[k] * l->adj_factor_cur,
-					l->per_plane_flip_bw[k] + NumberOfDPP[k] * (PrefetchBandwidthLuma[k] * l->adj_factor_p0_pre + PrefetchBandwidthChroma[k] * l->adj_factor_p1_pre) + prefetch_cursor_bw[k] * l->adj_factor_cur_pre,
-					(ReadBandwidthLuma[k] + excess_vactive_fill_bw_l[k]) * l->tmp_nom_adj_factor_p0 + (ReadBandwidthChroma[k] + excess_vactive_fill_bw_c[k]) * l->tmp_nom_adj_factor_p1 + dpte_row_bw[k] + meta_row_bw[k]);
+			l->vm_row_bw = NumberOfDPP[k] * prefetch_vmrow_bw[k];
+			l->flip_and_active_bw = l->per_plane_flip_bw[k] + ReadBandwidthLuma[k] * l->adj_factor_p0 + ReadBandwidthChroma[k] * l->adj_factor_p1 + cursor_bw[k] * l->adj_factor_cur;
+			l->flip_and_prefetch_bw = l->per_plane_flip_bw[k] + NumberOfDPP[k] * (PrefetchBandwidthLuma[k] * l->adj_factor_p0_pre + PrefetchBandwidthChroma[k] * l->adj_factor_p1_pre) + prefetch_cursor_bw[k] * l->adj_factor_cur_pre;
+			l->active_and_excess_bw = (ReadBandwidthLuma[k] + excess_vactive_fill_bw_l[k]) * l->tmp_nom_adj_factor_p0 + (ReadBandwidthChroma[k] + excess_vactive_fill_bw_c[k]) * l->tmp_nom_adj_factor_p1 + dpte_row_bw[k] + meta_row_bw[k];
+			surface_required_bw[k] = math_max4(l->vm_row_bw, l->flip_and_active_bw, l->flip_and_prefetch_bw, l->active_and_excess_bw);
 
 			/* export peak required bandwidth for the surface */
 			surface_peak_required_bw[k] = math_max2(surface_required_bw[k], surface_peak_required_bw[k]);
+
+#ifdef __DML_VBA_DEBUG__
+			dml2_printf("DML::%s: k=%d, max1: vm_row_bw=%f\n", __func__, k, l->vm_row_bw);
+			dml2_printf("DML::%s: k=%d, max2: flip_and_active_bw=%f\n", __func__, k, l->flip_and_active_bw);
+			dml2_printf("DML::%s: k=%d, max3: flip_and_prefetch_bw=%f\n", __func__, k, l->flip_and_prefetch_bw);
+			dml2_printf("DML::%s: k=%d, max4: active_and_excess_bw=%f\n", __func__, k, l->active_and_excess_bw);
+			dml2_printf("DML::%s: k=%d, surface_required_bw=%f\n", __func__, k, surface_required_bw[k]);
+			dml2_printf("DML::%s: k=%d, surface_peak_required_bw=%f\n", __func__, k, surface_peak_required_bw[k]);
+#endif
 		} else {
 			surface_required_bw[k] = 0.0;
 		}
@@ -4870,6 +4901,8 @@ static double get_urgent_bandwidth_required(
 
 #ifdef __DML_VBA_DEBUG__
 		dml2_printf("DML::%s: k=%d, NumberOfDPP=%d\n", __func__, k, NumberOfDPP[k]);
+		dml2_printf("DML::%s: k=%d, use_qual_row_bw=%d\n", __func__, k, use_qual_row_bw);
+		dml2_printf("DML::%s: k=%d, immediate_flip=%d\n", __func__, k, display_cfg->plane_descriptors[k].immediate_flip);
 		dml2_printf("DML::%s: k=%d, mall_svp_prefetch_factor=%f\n", __func__, k, l->mall_svp_prefetch_factor);
 		dml2_printf("DML::%s: k=%d, adj_factor_p0=%f\n", __func__, k, l->adj_factor_p0);
 		dml2_printf("DML::%s: k=%d, adj_factor_p1=%f\n", __func__, k, l->adj_factor_p1);
@@ -4883,6 +4916,8 @@ static double get_urgent_bandwidth_required(
 		dml2_printf("DML::%s: k=%d, prefetch_vmrow_bw=%f\n", __func__, k, prefetch_vmrow_bw[k]);
 		dml2_printf("DML::%s: k=%d, ReadBandwidthLuma=%f\n", __func__, k, ReadBandwidthLuma[k]);
 		dml2_printf("DML::%s: k=%d, ReadBandwidthChroma=%f\n", __func__, k, ReadBandwidthChroma[k]);
+		dml2_printf("DML::%s: k=%d, excess_vactive_fill_bw_l=%f\n", __func__, k, excess_vactive_fill_bw_l[k]);
+		dml2_printf("DML::%s: k=%d, excess_vactive_fill_bw_c=%f\n", __func__, k, excess_vactive_fill_bw_c[k]);
 		dml2_printf("DML::%s: k=%d, cursor_bw=%f\n", __func__, k, cursor_bw[k]);
 
 		dml2_printf("DML::%s: k=%d, meta_row_bw=%f\n", __func__, k, meta_row_bw[k]);
@@ -5037,7 +5072,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->bytes_pp = 0.0;
 	s->dep_bytes = 0.0;
 	s->min_Lsw_oto = 0.0;
+	s->min_Lsw_equ = 0.0;
 	s->Tsw_est1 = 0.0;
+	s->Tsw_est2 = 0.0;
 	s->Tsw_est3 = 0.0;
 	s->cursor_prefetch_bytes = 0;
 	*p->prefetch_cursor_bw = 0;
@@ -5059,7 +5096,6 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	dml2_printf("DML::%s: GPUVMPageTableLevels = %u\n", __func__, p->display_cfg->gpuvm_max_page_table_levels);
 	dml2_printf("DML::%s: DCCEnable = %u\n", __func__, p->myPipe->DCCEnable);
 	dml2_printf("DML::%s: VStartup = %u\n", __func__, p->VStartup);
-	dml2_printf("DML::%s: MaxVStartup = %u\n", __func__, p->MaxVStartup);
 	dml2_printf("DML::%s: HostVMEnable = %u\n", __func__, p->display_cfg->hostvm_enable);
 	dml2_printf("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, p->HostVMInefficiencyFactor);
 	dml2_printf("DML::%s: TWait = %f\n", __func__, p->TWait);
@@ -5092,21 +5128,15 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 
 	s->LineTime = p->myPipe->HTotal / p->myPipe->PixelClock;
 	s->trip_to_mem = p->Ttrip;
-#ifdef DML_TVM_UPDATE_EN
 	*p->Tvm_trips = p->ExtraLatencyPrefetch + math_max2(s->trip_to_mem * (p->display_cfg->gpuvm_max_page_table_levels * (s->HostVMDynamicLevelsTrips + 1)), p->Turg);
 	if (dcc_mrq_enable)
 		*p->Tvm_trips_flip = *p->Tvm_trips;
 	else
 		*p->Tvm_trips_flip = *p->Tvm_trips - s->trip_to_mem;
-#else
-	*p->Tvm_trips = p->ExtraLatencyPrefetch + s->trip_to_mem * (p->display_cfg->gpuvm_max_page_table_levels * (s->HostVMDynamicLevelsTrips + 1));
-	*p->Tvm_trips_flip = *p->Tvm_trips - s->trip_to_mem;
-#endif
 
 	*p->Tr0_trips_flip = s->trip_to_mem * (s->HostVMDynamicLevelsTrips + 1);
 	*p->Tr0_trips = math_max2(*p->Tr0_trips_flip, p->tdlut_opt_time / 2);
 
-#ifdef DML_TVM_UPDATE_EN
 	if (p->DynamicMetadataVMEnabled == true) {
 		*p->Tdmdl_vm = s->TWait_p + *p->Tvm_trips;
 		*p->Tdmdl = *p->Tdmdl_vm + p->Ttrip;
@@ -5114,15 +5144,6 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		*p->Tdmdl_vm = 0;
 		*p->Tdmdl = s->TWait_p + p->ExtraLatencyPrefetch + p->Ttrip; // Tex
 	}
-#else
-	if (p->DynamicMetadataVMEnabled == true) {
-		*p->Tdmdl_vm = s->TWait_p + *p->Tvm_trips;
-		*p->Tdmdl = *p->Tdmdl_vm + p->Ttrip;
-	} else {
-		*p->Tdmdl_vm = 0;
-		*p->Tdmdl = p->TWait + p->ExtraLatencyPrefetch; // Tex
-	}
-#endif
 
 	if (p->DynamicMetadataEnable == true) {
 		if (p->VStartup * s->LineTime < *p->TSetup + *p->Tdmdl + s->Tdmbf + s->Tdmec + s->Tdmsks) {
@@ -5186,7 +5207,6 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	dml2_printf("DML::%s: DSTYAfterScaler = %u (final)\n", __func__, *p->DSTYAfterScaler);
 #endif
 
-	s->NoTimeToPrefetch = false;
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: Tr0_trips = %f\n", __func__, *p->Tr0_trips);
 	dml2_printf("DML::%s: Tvm_trips = %f\n", __func__, *p->Tvm_trips);
@@ -5199,14 +5219,10 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		s->Tvm_trips_rounded = math_ceil2(4.0 * *p->Tvm_trips / s->LineTime, 1.0) / 4.0 * s->LineTime;
 		*p->Tvm_trips_flip_rounded = math_ceil2(4.0 * *p->Tvm_trips_flip / s->LineTime, 1.0) / 4.0 * s->LineTime;
 	} else {
-#ifdef DML_TVM_UPDATE_EN
 		if (p->DynamicMetadataEnable || dcc_mrq_enable || p->setup_for_tdlut)
 			s->Tvm_trips_rounded = math_max2(s->LineTime * math_ceil2(4.0*math_max3(p->ExtraLatencyPrefetch, p->Turg, s->trip_to_mem)/s->LineTime, 1)/4, s->LineTime/4.0);
 		else
-		s->Tvm_trips_rounded = s->LineTime / 4.0;
-#else
-		s->Tvm_trips_rounded = s->LineTime / 4.0;
-#endif
+			s->Tvm_trips_rounded = s->LineTime / 4.0;
 		*p->Tvm_trips_flip_rounded = s->LineTime / 4.0;
 	}
 
@@ -5235,16 +5251,10 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		*p->Tno_bw = 0;
 	}
 
-#ifdef DML_TVM_UPDATE_EN
 	if (p->mrq_present || p->display_cfg->gpuvm_max_page_table_levels >= 3)
 		*p->Tno_bw_flip = *p->Tno_bw;
 	else
 		*p->Tno_bw_flip = 0; //because there is no 3DLUT for iFlip
-#else
-	*p->Tno_bw_flip = 0;
-	if (p->display_cfg->gpuvm_enable == true)
-		*p->Tno_bw_flip = *p->Tno_bw;
-#endif
 
 	if (dml_is_420(p->myPipe->SourcePixelFormat)) {
 		s->bytes_pp = p->myPipe->BytePerPixelY + p->myPipe->BytePerPixelC / 4.0;
@@ -5266,6 +5276,10 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->min_Lsw_oto = math_max2(s->min_Lsw_oto, 2.0);
 	s->min_Lsw_oto = math_max2(s->min_Lsw_oto, p->tdlut_drain_time / s->LineTime);
 
+	s->min_Lsw_equ = math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) / __DML2_CALCS_MAX_VRATIO_PRE_EQU__;
+	s->min_Lsw_equ = math_max2(s->min_Lsw_equ, 2.0);
+	s->min_Lsw_equ = math_max2(s->min_Lsw_equ, p->tdlut_drain_time / s->LineTime);
+
 	vm_bytes = p->vm_bytes; // vm_bytes is dpde0_bytes_per_frame_ub_l + dpde0_bytes_per_frame_ub_c + 2*extra_dpde_bytes;
 	extra_tdpe_bytes = (unsigned int)math_max2(0, (p->display_cfg->gpuvm_max_page_table_levels - 1) * 128);
 
@@ -5289,11 +5303,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML::%s: Tvm_oto max2 = %f\n", __func__, s->LineTime / 4.0);
 #endif
 	} else {
-#ifdef DML_TVM_UPDATE_EN
 		s->Tvm_oto = s->Tvm_trips_rounded;
-#else
-		s->Tvm_oto = s->LineTime / 4.0;
-#endif
 	}
 
 	if ((p->display_cfg->gpuvm_enable == true || p->setup_for_tdlut || dcc_mrq_enable)) {
@@ -5317,19 +5327,16 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	Lo = (unsigned int)(*p->DSTYAfterScaler + (double)*p->DSTXAfterScaler / (double)p->myPipe->HTotal);
 
 	//Tpre_equ in line time
-#ifdef DML_TVM_UPDATE_EN
 	if (p->DynamicMetadataVMEnabled && p->DynamicMetadataEnable)
 		s->dst_y_prefetch_equ = p->VStartup - (*p->TSetup + math_max2(p->TCalc, *p->Tvm_trips) + s->TWait_p) / s->LineTime - Lo;
 	else
 		s->dst_y_prefetch_equ = p->VStartup - (*p->TSetup + math_max2(p->TCalc, p->ExtraLatencyPrefetch) + s->TWait_p) / s->LineTime - Lo;
-#else
-	s->dst_y_prefetch_equ = p->VStartup - (*p->TSetup + math_max2(s->TWait_p + p->TCalc, *p->Tdmdl - p->Ttrip)) / s->LineTime - Lo;
-#endif
 	s->dst_y_prefetch_equ = math_min2(s->dst_y_prefetch_equ, 63.75); // limit to the reg limit of U6.2 for DST_Y_PREFETCH
 
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: HTotal = %u\n", __func__, p->myPipe->HTotal);
 	dml2_printf("DML::%s: min_Lsw_oto = %f\n", __func__, s->min_Lsw_oto);
+	dml2_printf("DML::%s: min_Lsw_equ = %f\n", __func__, s->min_Lsw_equ);
 	dml2_printf("DML::%s: Tno_bw = %f\n", __func__, *p->Tno_bw);
 	dml2_printf("DML::%s: Tno_bw_flip = %f\n", __func__, *p->Tno_bw_flip);
 	dml2_printf("DML::%s: ExtraLatencyPrefetch = %f\n", __func__, p->ExtraLatencyPrefetch);
@@ -5367,6 +5374,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->dst_y_prefetch_equ = math_floor2(4.0 * (s->dst_y_prefetch_equ + 0.125), 1) / 4.0;
 	s->Tpre_rounded = s->dst_y_prefetch_equ * s->LineTime;
 
+#ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: dst_y_prefetch_equ: %f (after round)\n", __func__, s->dst_y_prefetch_equ);
 	dml2_printf("DML::%s: LineTime: %f\n", __func__, s->LineTime);
 	dml2_printf("DML::%s: VStartup: %u\n", __func__, p->VStartup);
@@ -5387,18 +5395,12 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	dml2_printf("DML::%s: Ttrip: %fus\n", __func__, p->Ttrip);
 	dml2_printf("DML::%s: DSTXAfterScaler: %u pixels - number of pixel clocks pipeline and buffer delay after scaler \n", __func__, *p->DSTXAfterScaler);
 	dml2_printf("DML::%s: DSTYAfterScaler: %u lines - number of lines of pipeline and buffer delay after scaler \n", __func__, *p->DSTYAfterScaler);
-
-	s->dep_bytes = math_max2(vm_bytes * p->HostVMInefficiencyFactor, p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes);
-
-	dml2_printf("DML::%s: dep_bytes: %f\n", __func__, s->dep_bytes);
-	dml2_printf("DML::%s: prefetch_sw_bytes: %f\n", __func__, s->prefetch_sw_bytes);
 	dml2_printf("DML::%s: vm_bytes: %f (hvm inefficiency scaled)\n", __func__, vm_bytes*p->HostVMInefficiencyFactor);
 	dml2_printf("DML::%s: row_bytes: %f (hvm inefficiency scaled, 1 row)\n", __func__, p->PixelPTEBytesPerRow*p->HostVMInefficiencyFactor+p->meta_row_bytes+tdlut_row_bytes);
-
-	if (s->prefetch_sw_bytes < s->dep_bytes) {
-		s->prefetch_sw_bytes = 2 * s->dep_bytes;
-		dml2_printf("DML::%s: bump prefetch_sw_bytes to %f\n", __func__, s->prefetch_sw_bytes);
-	}
+	dml2_printf("DML::%s: Tno_bw: %f\n", __func__, *p->Tno_bw);
+	dml2_printf("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, Tpre, s->Tpre_rounded, (s->Tpre_rounded - Tpre));
+	dml2_printf("DML::%s: Tvm_trips=%f Tvm_trips_rounded: %f, delta=%f\n", __func__, *p->Tvm_trips, s->Tvm_trips_rounded, (s->Tvm_trips_rounded - *p->Tvm_trips));
+#endif
 
 	*p->dst_y_per_vm_vblank = 0;
 	*p->dst_y_per_row_vblank = 0;
@@ -5411,7 +5413,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	// Tvm_trips_rounded is Tvm_trips ceiling to 1/4 line time
 	// Tr0_trips_rounded is Tr0_trips ceiling to 1/4 line time
 	// So that means prefetch bw calculated can be higher since the total time availabe for prefetch is less
-	if (s->dst_y_prefetch_equ > 1) {
+	bool min_Lsw_equ_ok = s->Tpre_rounded >= s->Tvm_trips_rounded + 2.0*s->Tr0_trips_rounded + s->min_Lsw_equ*s->LineTime;
+
+	if (s->dst_y_prefetch_equ > 1 && min_Lsw_equ_ok) {
 		s->prefetch_bw1 = 0.;
 		s->prefetch_bw2 = 0.;
 		s->prefetch_bw3 = 0.;
@@ -5428,28 +5432,35 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			s->prefetch_bw1 = 0;
 
 		dml2_printf("DML::%s: prefetch_bw1: %f\n", __func__, s->prefetch_bw1);
-		if ((p->VStartup == p->MaxVStartup) && (s->Tsw_est1 / s->LineTime < s->min_Lsw_oto) && (s->Tpre_rounded - s->min_Lsw_oto * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw > 0)) {
+		if ((s->Tsw_est1 < s->min_Lsw_equ * s->LineTime) && (s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw > 0)) {
 			s->prefetch_bw1 = (vm_bytes * p->HostVMInefficiencyFactor + 2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)) /
-				(s->Tpre_rounded - s->min_Lsw_oto * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw);
+				(s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw);
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: vm and 2 rows bytes = %f\n", __func__, (vm_bytes * p->HostVMInefficiencyFactor + 2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)));
 			dml2_printf("DML::%s: Tpre_rounded = %f\n", __func__, s->Tpre_rounded);
-			dml2_printf("DML::%s: minus term = %f\n", __func__, s->min_Lsw_oto * s->LineTime + 0.75 * s->LineTime + *p->Tno_bw);
-			dml2_printf("DML::%s: min_Lsw_oto = %f\n", __func__, s->min_Lsw_oto);
+			dml2_printf("DML::%s: minus term = %f\n", __func__, s->min_Lsw_equ * s->LineTime + 0.75 * s->LineTime + *p->Tno_bw);
+			dml2_printf("DML::%s: min_Lsw_equ = %f\n", __func__, s->min_Lsw_equ);
 			dml2_printf("DML::%s: LineTime = %f\n", __func__, s->LineTime);
 			dml2_printf("DML::%s: Tno_bw = %f\n", __func__, *p->Tno_bw);
-			dml2_printf("DML::%s: Time to fetch vm and 2 rows = %f\n", __func__, (s->Tpre_rounded - s->min_Lsw_oto * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw));
+			dml2_printf("DML::%s: Time to fetch vm and 2 rows = %f\n", __func__, (s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw));
 			dml2_printf("DML::%s: prefetch_bw1: %f (updated)\n", __func__, s->prefetch_bw1);
 #endif
 		}
 
 		// prefetch_bw2: VM + SW
-		if (s->Tpre_rounded - *p->Tno_bw - 2 * s->Tr0_trips_rounded > 0)
+		if (s->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded > 0) {
 			s->prefetch_bw2 = (vm_bytes * p->HostVMInefficiencyFactor + s->prefetch_sw_bytes) /
-			(s->Tpre_rounded - *p->Tno_bw - 2 * s->Tr0_trips_rounded);
-		else
+			(s->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded);
+			s->Tsw_est2 = s->prefetch_sw_bytes / s->prefetch_bw2;
+		} else
 			s->prefetch_bw2 = 0;
 
+		dml2_printf("DML::%s: prefetch_bw2: %f\n", __func__, s->prefetch_bw2);
+		if ((s->Tsw_est2 < s->min_Lsw_equ * s->LineTime) && ((s->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded - s->min_Lsw_equ * s->LineTime - 0.25 * s->LineTime) > 0)) {
+			s->prefetch_bw2 = vm_bytes * p->HostVMInefficiencyFactor / (s->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded - s->min_Lsw_equ * s->LineTime - 0.25 * s->LineTime);
+			dml2_printf("DML::%s: prefetch_bw2: %f (updated)\n", __func__, s->prefetch_bw2);
+		}
+
 		// prefetch_bw3: 2*R0 + SW
 		if (s->Tpre_rounded - s->Tvm_trips_rounded > 0) {
 			s->prefetch_bw3 = (2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) + s->prefetch_sw_bytes) /
@@ -5459,8 +5470,8 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			s->prefetch_bw3 = 0;
 
 		dml2_printf("DML::%s: prefetch_bw3: %f\n", __func__, s->prefetch_bw3);
-		if (p->VStartup == p->MaxVStartup && (s->Tsw_est3 / s->LineTime < s->min_Lsw_oto) && ((s->Tpre_rounded - s->min_Lsw_oto * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded) > 0)) {
-			s->prefetch_bw3 = (2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)) / (s->Tpre_rounded - s->min_Lsw_oto * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded);
+		if ((s->Tsw_est3 < s->min_Lsw_equ * s->LineTime) && ((s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded) > 0)) {
+			s->prefetch_bw3 = (2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)) / (s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded);
 			dml2_printf("DML::%s: prefetch_bw3: %f (updated)\n", __func__, s->prefetch_bw3);
 		}
 
@@ -5476,6 +5487,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML::%s: Tvm_trips=%f Tvm_trips_rounded: %f, delta=%f\n", __func__, *p->Tvm_trips, s->Tvm_trips_rounded, (s->Tvm_trips_rounded - *p->Tvm_trips));
 		dml2_printf("DML::%s: Tr0_trips=%f Tr0_trips_rounded: %f, delta=%f\n", __func__, *p->Tr0_trips, s->Tr0_trips_rounded, (s->Tr0_trips_rounded - *p->Tr0_trips));
 		dml2_printf("DML::%s: Tsw_est1: %f\n", __func__, s->Tsw_est1);
+		dml2_printf("DML::%s: Tsw_est2: %f\n", __func__, s->Tsw_est2);
 		dml2_printf("DML::%s: Tsw_est3: %f\n", __func__, s->Tsw_est3);
 		dml2_printf("DML::%s: prefetch_bw1: %f (final)\n", __func__, s->prefetch_bw1);
 		dml2_printf("DML::%s: prefetch_bw2: %f (final)\n", __func__, s->prefetch_bw2);
@@ -5496,9 +5508,18 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			// here is to make sure equ bw wont be more agressive than the latency-based requirement.
 			// check vm time >= vm_trips
 			// check r0 time >= r0_trips
+
+			double total_row_bytes = (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes);
+
+			dml2_printf("DML::%s: Tvm_trips_rounded = %f\n", __func__, s->Tvm_trips_rounded);
+			dml2_printf("DML::%s: Tr0_trips_rounded = %f\n", __func__, s->Tr0_trips_rounded);
+
 			if (s->prefetch_bw1 > 0) {
-				if (*p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw1 >= s->Tvm_trips_rounded &&
-					(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / s->prefetch_bw1 >= s->Tr0_trips_rounded) {
+				double vm_transfer_time = *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw1;
+				double row_transfer_time = total_row_bytes / s->prefetch_bw1;
+				dml2_printf("DML::%s: Case1: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
+				dml2_printf("DML::%s: Case1: row_transfer_time = %f\n", __func__, row_transfer_time);
+				if (vm_transfer_time >= s->Tvm_trips_rounded && row_transfer_time >= s->Tr0_trips_rounded) {
 					Case1OK = true;
 				}
 			}
@@ -5508,8 +5529,11 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			// check vm time >= vm_trips
 			// check r0 time < r0_trips
 			if (s->prefetch_bw2 > 0) {
-				if (*p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw2 >= s->Tvm_trips_rounded &&
-					(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / s->prefetch_bw2 < s->Tr0_trips_rounded) {
+				double vm_transfer_time = *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw2;
+				double row_transfer_time = total_row_bytes / s->prefetch_bw2;
+				dml2_printf("DML::%s: Case2: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
+				dml2_printf("DML::%s: Case2: row_transfer_time = %f\n", __func__, row_transfer_time);
+				if (vm_transfer_time >= s->Tvm_trips_rounded && row_transfer_time < s->Tr0_trips_rounded) {
 					Case2OK = true;
 				}
 			}
@@ -5518,8 +5542,11 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			// check vm time < vm_trips
 			// check r0 time >= r0_trips
 			if (s->prefetch_bw3 > 0) {
-				if (*p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw3 < s->Tvm_trips_rounded &&
-					(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / s->prefetch_bw3 >= s->Tr0_trips_rounded) {
+				double vm_transfer_time = *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw3;
+				double row_transfer_time = total_row_bytes / s->prefetch_bw3;
+				dml2_printf("DML::%s: Case3: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
+				dml2_printf("DML::%s: Case3: row_transfer_time = %f\n", __func__, row_transfer_time);
+				if (vm_transfer_time < s->Tvm_trips_rounded && row_transfer_time >= s->Tr0_trips_rounded) {
 					Case3OK = true;
 				}
 			}
@@ -5585,13 +5612,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			s->TimeForFetchingVM = s->Tvm_equ;
 			s->TimeForFetchingRowInVBlank = s->Tr0_equ;
 
-			if (p->VStartup == p->MaxVStartup) {
-				*p->dst_y_per_vm_vblank = math_floor2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
-				*p->dst_y_per_row_vblank = math_floor2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
-			} else {
-				*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
-				*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
-			}
+		*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
+		*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
+
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: Using equ bw scheduling for prefetch\n", __func__);
 #endif
@@ -5635,7 +5658,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 						(double)p->MaxNumSwathY * p->SwathHeightY / (s->LinesToRequestPrefetchPixelData - (p->VInitPreFillY - 3.0) / 2.0));
 				} else {
 					s->NoTimeToPrefetch = true;
-					dml2_printf("DML::%s: MyErr set. LinesToRequestPrefetchPixelData=%f VinitPreFillY=%u\n", __func__, s->LinesToRequestPrefetchPixelData, p->VInitPreFillY);
+					dml2_printf("DML::%s: No time to prefetch!. LinesToRequestPrefetchPixelData=%f VinitPreFillY=%u\n", __func__, s->LinesToRequestPrefetchPixelData, p->VInitPreFillY);
 					*p->VRatioPrefetchY = 0;
 				}
 #ifdef __DML_VBA_DEBUG__
@@ -5658,7 +5681,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 					*p->VRatioPrefetchC = math_max2(*p->VRatioPrefetchC, (double)p->MaxNumSwathC * p->SwathHeightC / (s->LinesToRequestPrefetchPixelData - (p->VInitPreFillC - 3.0) / 2.0));
 				} else {
 					s->NoTimeToPrefetch = true;
-					dml2_printf("DML::%s: MyErr set. LinesToRequestPrefetchPixelData=%f VInitPreFillC=%u\n", __func__, s->LinesToRequestPrefetchPixelData, p->VInitPreFillC);
+					dml2_printf("DML::%s: No time to prefetch!. LinesToRequestPrefetchPixelData=%f VInitPreFillC=%u\n", __func__, s->LinesToRequestPrefetchPixelData, p->VInitPreFillC);
 					*p->VRatioPrefetchC = 0;
 				}
 #ifdef __DML_VBA_DEBUG__
@@ -5680,14 +5703,13 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 #endif
 		} else {
 			s->NoTimeToPrefetch = true;
-			dml2_printf("DML::%s: MyErr set, LinesToRequestPrefetchPixelData: %f, should be >= %d\n", __func__, s->LinesToRequestPrefetchPixelData, min_lsw_required);
-			dml2_printf("DML::%s: MyErr set, prefetch_bw_equ: %f, should be > 0\n", __func__, s->prefetch_bw_equ);
+			dml2_printf("DML::%s: No time to prefetch!, LinesToRequestPrefetchPixelData: %f, should be >= %d\n", __func__, s->LinesToRequestPrefetchPixelData, min_lsw_required);
+			dml2_printf("DML::%s: No time to prefetch!, prefetch_bw_equ: %f, should be > 0\n", __func__, s->prefetch_bw_equ);
 			*p->VRatioPrefetchY = 0;
 			*p->VRatioPrefetchC = 0;
 			*p->RequiredPrefetchPixelDataBWLuma = 0;
 			*p->RequiredPrefetchPixelDataBWChroma = 0;
 		}
-
 		dml2_printf("DML: Tpre: %fus - sum of time to request 2 x data pte, swaths\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime + 2.0 * s->TimeForFetchingRowInVBlank + s->TimeForFetchingVM);
 		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
 		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
@@ -5698,7 +5720,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
 
 	} else {
-		dml2_printf("DML::%s: MyErr set, dst_y_prefetch_equ = %f (should be > 1)\n", __func__, s->dst_y_prefetch_equ);
+		dml2_printf("DML::%s: No time to prefetch! dst_y_prefetch_equ = %f (should be > 1)\n", __func__, s->dst_y_prefetch_equ);
+		dml2_printf("DML::%s: No time to prefetch! min_Lsw_equ_ok = %d, Tpre_rounded (%f) should be >= Tvm_trips_rounded (%f)  + 2.0*Tr0_trips_rounded (%f) + min_Tsw_equ (%f)\n",
+				__func__, min_Lsw_equ_ok, s->Tpre_rounded, s->Tvm_trips_rounded, 2.0*s->Tr0_trips_rounded, s->min_Lsw_equ*s->LineTime);
 		s->NoTimeToPrefetch = true;
 		s->TimeForFetchingVM = 0;
 		s->TimeForFetchingRowInVBlank = 0;
@@ -5730,7 +5754,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		} else {
 			prefetch_vm_bw = 0;
 			s->NoTimeToPrefetch = true;
-			dml2_printf("DML::%s: MyErr set. dst_y_per_vm_vblank=%f (should be > 0)\n", __func__, *p->dst_y_per_vm_vblank);
+			dml2_printf("DML::%s: No time to prefetch!. dst_y_per_vm_vblank=%f (should be > 0)\n", __func__, *p->dst_y_per_vm_vblank);
 		}
 
 		if (p->PixelPTEBytesPerRow == 0 && tdlut_row_bytes == 0) {
@@ -5746,7 +5770,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		} else {
 			prefetch_row_bw = 0;
 			s->NoTimeToPrefetch = true;
-			dml2_printf("DML::%s: MyErr set. dst_y_per_row_vblank=%f (should be > 0)\n", __func__, *p->dst_y_per_row_vblank);
+			dml2_printf("DML::%s: No time to prefetch!. dst_y_per_row_vblank=%f (should be > 0)\n", __func__, *p->dst_y_per_row_vblank);
 		}
 
 		*p->prefetch_vmrow_bw = math_max2(prefetch_vm_bw, prefetch_row_bw);
@@ -5763,11 +5787,16 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		*p->VRatioPrefetchC = 0;
 		*p->RequiredPrefetchPixelDataBWLuma = 0;
 		*p->RequiredPrefetchPixelDataBWChroma = 0;
+		*p->prefetch_vmrow_bw = 0;
 	}
 
 	dml2_printf("DML::%s: dst_y_per_vm_vblank = %f (final)\n", __func__, *p->dst_y_per_vm_vblank);
 	dml2_printf("DML::%s: dst_y_per_row_vblank = %f (final)\n", __func__, *p->dst_y_per_row_vblank);
+	dml2_printf("DML::%s: prefetch_vmrow_bw = %f (final)\n", __func__, *p->prefetch_vmrow_bw);
+	dml2_printf("DML::%s: RequiredPrefetchPixelDataBWLuma = %f (final)\n", __func__, *p->RequiredPrefetchPixelDataBWLuma);
+	dml2_printf("DML::%s: RequiredPrefetchPixelDataBWChroma = %f (final)\n", __func__, *p->RequiredPrefetchPixelDataBWChroma);
 	dml2_printf("DML::%s: NoTimeToPrefetch=%d\n", __func__, s->NoTimeToPrefetch);
+
 	return s->NoTimeToPrefetch;
 }
 
@@ -6174,7 +6203,7 @@ static void CalculateFlipSchedule(
 {
 	struct dml2_core_shared_CalculateFlipSchedule_locals *l = &s->CalculateFlipSchedule_locals;
 
-	l->dual_plane = dml2_core_shared_is_420(SourcePixelFormat) || SourcePixelFormat == dml2_rgbe_alpha;
+	l->dual_plane = dml_is_420(SourcePixelFormat) || SourcePixelFormat == dml2_rgbe_alpha;
 	l->dpte_row_bytes = DPTEBytesPerRow;
 
 #ifdef __DML_VBA_DEBUG__
@@ -6250,7 +6279,7 @@ static void CalculateFlipSchedule(
 #ifdef __DML_VBA_DEBUG__
 				dml2_printf("DML::%s: max_flip_time = %f\n", __func__, l->max_flip_time);
 				dml2_printf("DML::%s: total vm bytes (hvm ineff scaled) = %f\n", __func__, l->hvm_scaled_vm_bytes);
-				dml2_printf("DML::%s: total row bytes (hvm ineff scaled) = %f\n", __func__, l->hvm_scaled_row_bytes);
+				dml2_printf("DML::%s: total row bytes (%d row, hvm ineff scaled) = %f\n", __func__, l->num_rows, l->hvm_scaled_row_bytes);
 				dml2_printf("DML::%s: total vm+row bytes (hvm ineff scaled) = %f\n", __func__, l->hvm_scaled_vm_row_bytes);
 				dml2_printf("DML::%s: lb_flip_bw for vm and row = %f\n", __func__, l->hvm_scaled_vm_row_bytes / (l->max_flip_time - Tno_bw_flip));
 				dml2_printf("DML::%s: lb_flip_bw for vm = %f\n", __func__, l->hvm_scaled_vm_bytes / (l->max_flip_time - Tno_bw_flip - 2 * Tr0_trips_flip_rounded));
@@ -6261,6 +6290,7 @@ static void CalculateFlipSchedule(
 					dml2_printf("DML::%s: mode_support est Tr0_flip = %f (bw-based)\n", __func__, l->hvm_scaled_row_bytes / l->lb_flip_bw / l->num_rows);
 					dml2_printf("DML::%s: mode_support est dst_y_per_vm_flip = %f (bw-based)\n", __func__, Tno_bw_flip + l->hvm_scaled_vm_bytes / l->lb_flip_bw / LineTime);
 					dml2_printf("DML::%s: mode_support est dst_y_per_row_flip = %f (bw-based)\n", __func__, l->hvm_scaled_row_bytes / l->lb_flip_bw / LineTime / l->num_rows);
+					dml2_printf("DML::%s: Tvm_trips_flip_rounded + 2*Tr0_trips_flip_rounded = %f\n", __func__, (Tvm_trips_flip_rounded + 2 * Tr0_trips_flip_rounded));
 				}
 #endif
 				l->lb_flip_bw = math_max3(l->lb_flip_bw,
@@ -6277,7 +6307,7 @@ static void CalculateFlipSchedule(
 
 			*dst_y_per_vm_flip = 1; // not used
 			*dst_y_per_row_flip = 1; // not used
-			*ImmediateFlipSupportedForPipe = true;
+			*ImmediateFlipSupportedForPipe = l->min_row_time >= (Tvm_trips_flip_rounded + 2 * Tr0_trips_flip_rounded);
 		} else {
 			if (iflip_enable) {
 				l->ImmediateFlipBW = (double)per_pipe_flip_bytes * BandwidthAvailableForImmediateFlip / (double)TotImmediateFlipBytes; // flip_bw(i)
@@ -6343,6 +6373,7 @@ static void CalculateFlipSchedule(
 		dml2_printf("DML::%s: dst_y_per_row_flip = %f (should be < 16)\n", __func__, *dst_y_per_row_flip);
 		dml2_printf("DML::%s: Tvm_flip = %f (final)\n", __func__, l->Tvm_flip);
 		dml2_printf("DML::%s: Tr0_flip = %f (final)\n", __func__, l->Tr0_flip);
+		dml2_printf("DML::%s: Tvm_flip + 2*Tr0_flip = %f (should be <= min_row_time=%f)\n", __func__, l->Tvm_flip + 2 * l->Tr0_flip, l->min_row_time);
 	}
 	dml2_printf("DML::%s: final_flip_bw = %f\n", __func__, *final_flip_bw);
 	dml2_printf("DML::%s: ImmediateFlipSupportedForPipe = %u\n", __func__, *ImmediateFlipSupportedForPipe);
@@ -6373,6 +6404,12 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	p->Watermark->StutterEnterPlusExitWatermark = p->mmSOCParameters.SREnterPlusExitTime + p->mmSOCParameters.ExtraLatency_sr + 10 / p->DCFClkDeepSleep;
 	p->Watermark->Z8StutterExitWatermark = p->mmSOCParameters.SRExitZ8Time + p->mmSOCParameters.ExtraLatency_sr + 10 / p->DCFClkDeepSleep;
 	p->Watermark->Z8StutterEnterPlusExitWatermark = p->mmSOCParameters.SREnterPlusExitZ8Time + p->mmSOCParameters.ExtraLatency_sr + 10 / p->DCFClkDeepSleep;
+	if (p->mmSOCParameters.qos_type == dml2_qos_param_type_dcn4x) {
+		p->Watermark->StutterExitWatermark += p->mmSOCParameters.max_urgent_latency_us + p->mmSOCParameters.df_response_time_us;
+		p->Watermark->StutterEnterPlusExitWatermark += p->mmSOCParameters.max_urgent_latency_us + p->mmSOCParameters.df_response_time_us;
+		p->Watermark->Z8StutterExitWatermark += p->mmSOCParameters.max_urgent_latency_us + p->mmSOCParameters.df_response_time_us;
+		p->Watermark->Z8StutterEnterPlusExitWatermark += p->mmSOCParameters.max_urgent_latency_us + p->mmSOCParameters.df_response_time_us;
+	}
 	p->Watermark->g6_temp_read_watermark_us = p->mmSOCParameters.g6_temp_read_blackout_us + p->Watermark->UrgentWatermark;
 
 #ifdef __DML_VBA_DEBUG__
@@ -6579,13 +6616,13 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 			s->src_y_ahead_c = (unsigned int)(math_floor2(p->DETBufferSizeC[k] / p->BytePerPixelDETC[k] / p->SwathWidthC[k], p->SwathHeightC[k]) + s->LBLatencyHidingSourceLinesC[k]);
 			s->sub_vp_lines_c = s->src_y_pstate_c + s->src_y_ahead_c + p->meta_row_height_c[k];
 
-			if (dml2_core_shared_is_420(p->display_cfg->plane_descriptors[k].pixel_format))
+			if (dml_is_420(p->display_cfg->plane_descriptors[k].pixel_format))
 				p->SubViewportLinesNeededInMALL[k] = (unsigned int)(math_max2(s->sub_vp_lines_l, 2 * s->sub_vp_lines_c));
 			else
 				p->SubViewportLinesNeededInMALL[k] = (unsigned int)(math_max2(s->sub_vp_lines_l, s->sub_vp_lines_c));
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, meta_row_height_c = %u\n", __func__, p->meta_row_height_c[k]);
+			dml2_printf("DML::%s: k=%u, meta_row_height_c = %u\n", __func__, k, p->meta_row_height_c[k]);
 			dml2_printf("DML::%s: k=%u, src_y_pstate_c = %u\n", __func__, k, s->src_y_pstate_c);
 			dml2_printf("DML::%s: k=%u, src_y_ahead_c = %u\n", __func__, k, s->src_y_ahead_c);
 			dml2_printf("DML::%s: k=%u, sub_vp_lines_c = %u\n", __func__, k, s->sub_vp_lines_c);
@@ -6915,6 +6952,21 @@ static double get_g6_temp_read_blackout_us(
 	return (double)blackout_us;
 }
 
+static double get_max_urgent_latency_us(
+	struct dml2_dcn4x_soc_qos_params *dcn4x,
+	double uclk_freq_mhz,
+	double FabricClock,
+	unsigned int min_clk_index)
+{
+	double latency;
+	latency = dcn4x->per_uclk_dpm_params[min_clk_index].maximum_latency_when_urgent_uclk_cycles / uclk_freq_mhz
+		* (1 + dcn4x->umc_max_latency_margin / 100.0)
+		+ dcn4x->mall_overhead_fclk_cycles / FabricClock
+		+ dcn4x->max_round_trip_to_furthest_cs_fclk_cycles / FabricClock
+		* (1 + dcn4x->fabric_max_transport_latency_margin / 100.0);
+	return latency;
+}
+
 static void calculate_pstate_keepout_dst_lines(
 		const struct dml2_display_cfg *display_cfg,
 		const struct dml2_core_internal_watermarks *watermarks,
@@ -6997,7 +7049,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: max_dscclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dscclk_freq_mhz);
 	dml2_printf("DML::%s: max_dppclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dppclk_freq_mhz);
 	dml2_printf("DML::%s: MaxFabricClock = %f\n", __func__, mode_lib->ms.MaxFabricClock);
-	dml2_printf("DML::%s: max_dscclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dscclk_freq_mhz);
 	dml2_printf("DML::%s: ip.compressed_buffer_segment_size_in_kbytes = %u\n", __func__, mode_lib->ip.compressed_buffer_segment_size_in_kbytes);
 	dml2_printf("DML::%s: ip.dcn_mrq_present = %u\n", __func__, mode_lib->ip.dcn_mrq_present);
 
@@ -7223,12 +7274,12 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		}
 #endif
 */
-		mode_lib->ms.MaximumSwathWidthInLineBufferLuma = lb_buffer_size_bits_luma * math_max2(display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio, 1.0) / 57 /*FIXME_STAGE2 was: LBBitPerPixel*/ /
+		mode_lib->ms.MaximumSwathWidthInLineBufferLuma = lb_buffer_size_bits_luma * math_max2(display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio, 1.0) / 57 /
 			(display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_taps + math_max2(math_ceil2(display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio, 1.0) - 2, 0.0));
 		if (mode_lib->ms.BytePerPixelC[k] == 0.0) {
 			mode_lib->ms.MaximumSwathWidthInLineBufferChroma = 0;
 		} else {
-			mode_lib->ms.MaximumSwathWidthInLineBufferChroma = lb_buffer_size_bits_chroma * math_max2(display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio, 1.0) / 57 /*FIXME_STAGE2 was: LBBitPerPixel*/ /
+			mode_lib->ms.MaximumSwathWidthInLineBufferChroma = lb_buffer_size_bits_chroma * math_max2(display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio, 1.0) / 57 /
 				(display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_taps + math_max2(math_ceil2(display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio, 1.0) - 2, 0.0));
 		}
 
@@ -7310,7 +7361,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	mode_lib->ms.support.ViewportExceedsSurface = false;
 	if (!display_cfg->overrides.hw.surface_viewport_size_check_disable) {
 		for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
-			if (display_cfg->plane_descriptors[k].composition.viewport.plane0.width > display_cfg->plane_descriptors[k].surface.plane0.width || display_cfg->plane_descriptors[k].composition.viewport.plane0.height > display_cfg->plane_descriptors[k].surface.plane0.height) {
+			if (display_cfg->plane_descriptors[k].composition.viewport.plane0.width > display_cfg->plane_descriptors[k].surface.plane0.width ||
+				display_cfg->plane_descriptors[k].composition.viewport.plane0.height > display_cfg->plane_descriptors[k].surface.plane0.height) {
 				mode_lib->ms.support.ViewportExceedsSurface = true;
 #if defined(__DML_VBA_DEBUG__)
 				dml2_printf("DML::%s: k=%u ViewportWidth = %d\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.width);
@@ -7319,11 +7371,11 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				dml2_printf("DML::%s: k=%u SurfaceHeightY = %d\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane0.height);
 				dml2_printf("DML::%s: k=%u ViewportExceedsSurface = %d\n", __func__, k, mode_lib->ms.support.ViewportExceedsSurface);
 #endif
-				if (dml_is_420(display_cfg->plane_descriptors[k].pixel_format) || display_cfg->plane_descriptors[k].pixel_format == dml2_rgbe_alpha) {
-					if (display_cfg->plane_descriptors[k].composition.viewport.plane1.width > display_cfg->plane_descriptors[k].surface.plane1.width ||
-						display_cfg->plane_descriptors[k].composition.viewport.plane1.height > display_cfg->plane_descriptors[k].surface.plane1.height) {
-						mode_lib->ms.support.ViewportExceedsSurface = true;
-					}
+			}
+			if (dml_is_420(display_cfg->plane_descriptors[k].pixel_format) || display_cfg->plane_descriptors[k].pixel_format == dml2_rgbe_alpha) {
+				if (display_cfg->plane_descriptors[k].composition.viewport.plane1.width > display_cfg->plane_descriptors[k].surface.plane1.width ||
+					display_cfg->plane_descriptors[k].composition.viewport.plane1.height > display_cfg->plane_descriptors[k].surface.plane1.height) {
+					mode_lib->ms.support.ViewportExceedsSurface = true;
 				}
 			}
 		}
@@ -7599,7 +7651,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_taps,
 					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
 					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_width,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width,
 					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
 					mode_lib->ip.writeback_line_buffer_buffer_size));
 		}
@@ -7684,8 +7736,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_420 && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.interlaced == 1 && mode_lib->ip.ptoi_supported == true)
 				mode_lib->ms.support.P2IWith420 = true;
 
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_enable_if_necessary && s->OutputBpp[k] != 0)
-				mode_lib->ms.support.DSCOnlyIfNecessaryWithBPP = true;
 			if ((display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_enable || display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_enable_if_necessary) && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format == dml2_n422 && !mode_lib->ip.dsc422_native_support)
 				mode_lib->ms.support.DSC422NativeNotSupported = true;
 
@@ -8483,7 +8533,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	{
 		mode_lib->ms.TimeCalc = 24 / mode_lib->ms.dcfclk_deepsleep;
 
-
 		calculate_hostvm_inefficiency_factor(
 				&s->HostVMInefficiencyFactor,
 				&s->HostVMInefficiencyFactorPrefetch,
@@ -8568,7 +8617,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				mode_lib->ms.TWait[k] = CalculateTWait(
 					display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns,
 					mode_lib->ms.UrgLatency,
-					mode_lib->ms.TripToMemory);
+					mode_lib->ms.TripToMemory,
+					!dml_is_phantom_pipe(&display_cfg->plane_descriptors[k]) && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.drr_config.enabled ?
+					get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->ms.uclk_freq_mhz * 1000), in_out_params->min_clk_index) : 0.0);
 
 				myPipe->Dppclk = mode_lib->ms.RequiredDPPCLK[k];
 				myPipe->Dispclk = mode_lib->ms.RequiredDISPCLK;
@@ -8615,7 +8666,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				CalculatePrefetchSchedule_params->OutputFormat = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format;
 				CalculatePrefetchSchedule_params->MaxInterDCNTileRepeaters = mode_lib->ip.max_inter_dcn_tile_repeaters;
 				CalculatePrefetchSchedule_params->VStartup = s->MaximumVStartup[k];
-				CalculatePrefetchSchedule_params->MaxVStartup = s->MaximumVStartup[k];
 				CalculatePrefetchSchedule_params->HostVMMinPageSize = mode_lib->soc.hostvm_min_page_size_kbytes;
 				CalculatePrefetchSchedule_params->DynamicMetadataEnable = display_cfg->plane_descriptors[k].dynamic_meta_data.enable;
 				CalculatePrefetchSchedule_params->DynamicMetadataVMEnabled = mode_lib->ip.dynamic_metadata_vm_enabled;
@@ -8697,8 +8747,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 					dml2_printf("DML::%s: k=%d, dst_y_prefetch=%f (should not be < 2)\n", __func__, k, mode_lib->ms.dst_y_prefetch[k]);
 					dml2_printf("DML::%s: k=%d, LinesForVM=%f (should not be >= 32)\n", __func__, k, mode_lib->ms.LinesForVM[k]);
 					dml2_printf("DML::%s: k=%d, LinesForDPTERow=%f (should not be >= 16)\n", __func__, k, mode_lib->ms.LinesForDPTERow[k]);
-					dml2_printf("DML::%s: k=%d, NoTimeForPrefetch=%d\n", __func__, k, mode_lib->ms.NoTimeForPrefetch[k]);
 					dml2_printf("DML::%s: k=%d, DSTYAfterScaler=%d (should be <= 8)\n", __func__, k, s->DSTYAfterScaler[k]);
+					dml2_printf("DML::%s: k=%d, NoTimeForPrefetch=%d\n", __func__, k, mode_lib->ms.NoTimeForPrefetch[k]);
 				}
 			}
 
@@ -8711,20 +8761,15 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 			mode_lib->ms.support.VRatioInPrefetchSupported = true;
 			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-				if (mode_lib->ms.VRatioPreY[k] > __DML2_CALCS_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__ ||
-					mode_lib->ms.VRatioPreC[k] > __DML2_CALCS_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__) {
+				if (mode_lib->ms.VRatioPreY[k] > __DML2_CALCS_MAX_VRATIO_PRE__ ||
+					mode_lib->ms.VRatioPreC[k] > __DML2_CALCS_MAX_VRATIO_PRE__) {
 					mode_lib->ms.support.VRatioInPrefetchSupported = false;
+					dml2_printf("DML::%s: k=%d VRatioPreY = %f (should be <= %f)\n", __func__, k, mode_lib->ms.VRatioPreY[k], __DML2_CALCS_MAX_VRATIO_PRE__);
+					dml2_printf("DML::%s: k=%d VRatioPreC = %f (should be <= %f)\n", __func__, k, mode_lib->ms.VRatioPreC[k], __DML2_CALCS_MAX_VRATIO_PRE__);
 					dml2_printf("DML::%s: VRatioInPrefetchSupported = %u\n", __func__, mode_lib->ms.support.VRatioInPrefetchSupported);
 				}
 			}
 
-			s->AnyLinesForVMOrRowTooLarge = false;
-			for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-				if (mode_lib->ms.LinesForDPTERow[k] >= 16 || mode_lib->ms.LinesForVM[k] >= 32) {
-					s->AnyLinesForVMOrRowTooLarge = true;
-				}
-			}
-
 			// Only do urg vs prefetch bandwidth check, flip schedule check, power saving feature support check IF the Prefetch Schedule Check is ok
 			if (mode_lib->ms.support.PrefetchSupported) {
 				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
@@ -8961,6 +9006,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		s->mSOCParameters.USRRetrainingLatency = 0;
 		s->mSOCParameters.SMNLatency = 0;
 		s->mSOCParameters.g6_temp_read_blackout_us = get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->ms.uclk_freq_mhz * 1000), in_out_params->min_clk_index);
+		s->mSOCParameters.max_urgent_latency_us = get_max_urgent_latency_us(&mode_lib->soc.qos_parameters.qos_params.dcn4x, mode_lib->ms.uclk_freq_mhz, mode_lib->ms.FabricClock, in_out_params->min_clk_index);
+		s->mSOCParameters.df_response_time_us = mode_lib->soc.qos_parameters.qos_params.dcn4x.df_qos_response_time_fclk_cycles / mode_lib->ms.FabricClock;
+		s->mSOCParameters.qos_type = mode_lib->soc.qos_parameters.qos_type;
 
 		CalculateWatermarks_params->display_cfg = display_cfg;
 		CalculateWatermarks_params->USRRetrainingRequired = false;
@@ -8980,7 +9028,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		CalculateWatermarks_params->DETBufferSizeC = mode_lib->ms.DETBufferSizeC;
 		CalculateWatermarks_params->SwathHeightY = mode_lib->ms.SwathHeightY;
 		CalculateWatermarks_params->SwathHeightC = mode_lib->ms.SwathHeightC;
-		//CalculateWatermarks_params->LBBitPerPixel = 57; // FIXME_STAGE2, need a new ip param?
 		CalculateWatermarks_params->SwathWidthY = mode_lib->ms.SwathWidthY;
 		CalculateWatermarks_params->SwathWidthC = mode_lib->ms.SwathWidthC;
 		CalculateWatermarks_params->DPPPerSurface = mode_lib->ms.NoOfDPP;
@@ -9011,22 +9058,15 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 		calculate_pstate_keepout_dst_lines(display_cfg, &mode_lib->ms.support.watermarks, s->dummy_integer_array[0]);
 	}
-
+	dml2_printf("DML::%s: Done prefetch calculation\n", __func__);
 	// End of Prefetch Check
 
-	dml2_printf("DML::%s: Done prefetch calculation\n", __func__);
+	mode_lib->ms.support.max_urgent_latency_us = s->mSOCParameters.max_urgent_latency_us;
 
 	//Re-ordering Buffer Support Check
-	mode_lib->ms.support.max_urgent_latency_us
-		= mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_urgent_uclk_cycles / mode_lib->ms.uclk_freq_mhz
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin / 100.0);
-
 	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
 		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
-			/ mode_lib->ms.support.non_urg_bandwidth_required_flip[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= mode_lib->ms.support.max_urgent_latency_us) {
+			/ mode_lib->ms.support.non_urg_bandwidth_required_flip[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= s->mSOCParameters.max_urgent_latency_us) {
 			mode_lib->ms.support.ROBSupport = true;
 		} else {
 			mode_lib->ms.support.ROBSupport = false;
@@ -9055,15 +9095,12 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.dram_change_vactive_det_fill_delay_us);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.max_urgent_latency_us);
+	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, s->mSOCParameters.max_urgent_latency_us);
 	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
 #endif
 
 	/*Mode Support, Voltage State and SOC Configuration*/
 	{
-		// s->dram_clock_change_support = 1;
-		// s->f_clock_change_support = 1;
-
 		if (mode_lib->ms.support.ScaleRatioAndTapsSupport
 			&& mode_lib->ms.support.SourceFormatPixelAndScanSupport
 			&& mode_lib->ms.support.ViewportSizeSupport
@@ -9074,9 +9111,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			&& !mode_lib->ms.support.ExceededMultistreamSlots
 			&& !mode_lib->ms.support.MSOOrODMSplitWithNonDPLink
 			&& !mode_lib->ms.support.NotEnoughLanesForMSO
-			//&& mode_lib->ms.support.LinkCapacitySupport == true // FIXME_STAGE2
 			&& !mode_lib->ms.support.P2IWith420
-			&& !mode_lib->ms.support.DSCOnlyIfNecessaryWithBPP
 			&& !mode_lib->ms.support.DSC422NativeNotSupported
 			&& mode_lib->ms.support.DSCSlicesODMModeSupported
 			&& !mode_lib->ms.support.NotEnoughDSCUnits
@@ -9144,7 +9179,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 #if defined(__DML_VBA_DEBUG__)
 	if (!mode_lib->ms.support.ModeSupport)
-		dml2_print_dml_mode_support_info(&mode_lib->ms.support, true);
+		dml2_print_mode_support_info(&mode_lib->ms.support, true);
 
 	dml2_printf("DML::%s: --- DONE --- \n", __func__);
 #endif
@@ -9163,6 +9198,10 @@ unsigned int dml2_core_calcs_mode_support_ex(struct dml2_core_calcs_mode_support
 		*in_out_params->out_evaluation_info = in_out_params->mode_lib->ms.support;
 
 	dml2_printf("DML::%s: is_mode_support = %u (min_clk_index=%d)\n", __func__, result, in_out_params->min_clk_index);
+
+	for (unsigned int k = 0; k < in_out_params->in_display_cfg->num_planes; k++)
+	    dml2_printf("DML::%s: plane_%d: reserved_vblank_time_ns = %u\n", __func__, k, in_out_params->in_display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
+
 	dml2_printf("DML::%s: ------------- DONE ----------\n", __func__);
 
 	return result;
@@ -10697,7 +10736,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			mode_lib->mp.TWait[k] = CalculateTWait(
 				display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns,
 				mode_lib->mp.UrgentLatency,
-				mode_lib->mp.TripToMemory);
+				mode_lib->mp.TripToMemory,
+				!dml_is_phantom_pipe(&display_cfg->plane_descriptors[k]) && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.drr_config.enabled ?
+				get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->ms.uclk_freq_mhz * 1000), in_out_params->min_clk_index) : 0.0);
 
 			myPipe->Dppclk = mode_lib->mp.Dppclk[k];
 			myPipe->Dispclk = mode_lib->mp.Dispclk;
@@ -10743,7 +10784,6 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			CalculatePrefetchSchedule_params->OutputFormat = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format;
 			CalculatePrefetchSchedule_params->MaxInterDCNTileRepeaters = mode_lib->ip.max_inter_dcn_tile_repeaters;
 			CalculatePrefetchSchedule_params->VStartup = s->MaxVStartupLines[k];
-			CalculatePrefetchSchedule_params->MaxVStartup = s->MaxVStartupLines[k];
 			CalculatePrefetchSchedule_params->HostVMMinPageSize = mode_lib->soc.hostvm_min_page_size_kbytes;
 			CalculatePrefetchSchedule_params->DynamicMetadataEnable = display_cfg->plane_descriptors[k].dynamic_meta_data.enable;
 			CalculatePrefetchSchedule_params->DynamicMetadataVMEnabled = mode_lib->ip.dynamic_metadata_vm_enabled;
@@ -10829,9 +10869,13 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			if (mode_lib->mp.dst_y_prefetch[k] < 2)
 				s->DestinationLineTimesForPrefetchLessThan2 = true;
 
-			if (mode_lib->mp.VRatioPrefetchY[k] > __DML2_CALCS_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__ ||
-				mode_lib->mp.VRatioPrefetchC[k] > __DML2_CALCS_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__)
+			if (mode_lib->mp.VRatioPrefetchY[k] > __DML2_CALCS_MAX_VRATIO_PRE__ ||
+				mode_lib->mp.VRatioPrefetchC[k] > __DML2_CALCS_MAX_VRATIO_PRE__) {
 				s->VRatioPrefetchMoreThanMax = true;
+				dml2_printf("DML::%s: k=%d, VRatioPrefetchY=%f (should not be < %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchY[k], __DML2_CALCS_MAX_VRATIO_PRE__);
+				dml2_printf("DML::%s: k=%d, VRatioPrefetchC=%f (should not be < %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchC[k], __DML2_CALCS_MAX_VRATIO_PRE__);
+				dml2_printf("DML::%s: VRatioPrefetchMoreThanMax = %u\n", __func__, s->VRatioPrefetchMoreThanMax);
+			}
 
 			if (mode_lib->mp.NotEnoughUrgentLatencyHiding[k]) {
 				dml2_printf("DML::%s: k=%u, NotEnoughUrgentLatencyHiding = %u\n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHiding[k]);
@@ -11165,6 +11209,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		s->mmSOCParameters.USRRetrainingLatency = 0;
 		s->mmSOCParameters.SMNLatency = 0;
 		s->mmSOCParameters.g6_temp_read_blackout_us = get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->mp.uclk_freq_mhz * 1000), in_out_params->min_clk_index);
+		s->mmSOCParameters.max_urgent_latency_us = get_max_urgent_latency_us(&mode_lib->soc.qos_parameters.qos_params.dcn4x, mode_lib->ms.uclk_freq_mhz, mode_lib->ms.FabricClock, in_out_params->min_clk_index);
+		s->mmSOCParameters.df_response_time_us = mode_lib->soc.qos_parameters.qos_params.dcn4x.df_qos_response_time_fclk_cycles / mode_lib->ms.FabricClock;
+		s->mmSOCParameters.qos_type = mode_lib->soc.qos_parameters.qos_type;
 
 		CalculateWatermarks_params->display_cfg = display_cfg;
 		CalculateWatermarks_params->USRRetrainingRequired = false;
@@ -11184,7 +11231,6 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		CalculateWatermarks_params->DETBufferSizeC = mode_lib->mp.DETBufferSizeC;
 		CalculateWatermarks_params->SwathHeightY = mode_lib->mp.SwathHeightY;
 		CalculateWatermarks_params->SwathHeightC = mode_lib->mp.SwathHeightC;
-		//CalculateWatermarks_params->LBBitPerPixel = 57; //FIXME_STAGE2
 		CalculateWatermarks_params->SwathWidthY = mode_lib->mp.SwathWidthY;
 		CalculateWatermarks_params->SwathWidthC = mode_lib->mp.SwathWidthC;
 		CalculateWatermarks_params->BytePerPixelDETY = mode_lib->mp.BytePerPixelInDETY;
@@ -11515,9 +11561,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 
 bool dml2_core_calcs_mode_programming_ex(struct dml2_core_calcs_mode_programming_ex *in_out_params)
 {
+	dml2_printf("DML::%s: ------------- START ----------\n", __func__);
 	bool result = dml_core_mode_programming(in_out_params);
 
-	dml2_printf("DML::%s: ------------- START ----------\n", __func__);
 	dml2_printf("DML::%s: result = %0d\n", __func__, result);
 	dml2_printf("DML::%s: ------------- DONE ----------\n", __func__);
 	return result;
@@ -12427,7 +12473,7 @@ void dml2_core_calcs_get_stream_support_info(const struct dml2_display_cfg *disp
 	phantom_processing_delay_pix = (double)((mode_lib->ip.subvp_fw_processing_delay_us + mode_lib->ip.subvp_pstate_allow_width_us) *
 		((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[plane_index].stream_index].timing.pixel_clock_khz / 1000));
 	phantom_processing_delay_lines = (unsigned int)(phantom_processing_delay_pix / (double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[plane_index].stream_index].timing.h_total);
-	dml2_core_shared_div_rem(phantom_processing_delay_pix,
+	dml2_core_div_rem(phantom_processing_delay_pix,
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[plane_index].stream_index].timing.h_total,
 				&rem);
 	if (rem)
@@ -12470,7 +12516,7 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 	out->informative.mode_support_info.ScaleRatioAndTapsSupport = mode_lib->ms.support.ScaleRatioAndTapsSupport;
 	out->informative.mode_support_info.SourceFormatPixelAndScanSupport = mode_lib->ms.support.SourceFormatPixelAndScanSupport;
 	out->informative.mode_support_info.P2IWith420 = mode_lib->ms.support.P2IWith420;
-	out->informative.mode_support_info.DSCOnlyIfNecessaryWithBPP = mode_lib->ms.support.DSCOnlyIfNecessaryWithBPP;
+	out->informative.mode_support_info.DSCOnlyIfNecessaryWithBPP = false;
 	out->informative.mode_support_info.DSC422NativeNotSupported = mode_lib->ms.support.DSC422NativeNotSupported;
 	out->informative.mode_support_info.LinkRateDoesNotMatchDPVersion = mode_lib->ms.support.LinkRateDoesNotMatchDPVersion;
 	out->informative.mode_support_info.LinkRateForMultistreamNotIndicated = mode_lib->ms.support.LinkRateForMultistreamNotIndicated;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
index 640087e862f8..28394de02885 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
@@ -10,7 +10,7 @@ bool dml2_core_create(enum dml2_project_id project_id, struct dml2_core_instance
 {
 	bool result = false;
 
-	if (!out)
+	if (out == 0)
 		return false;
 
 	memset(out, 0, sizeof(struct dml2_core_instance));
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
deleted file mode 100644
index f3356b072b59..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
+++ /dev/null
@@ -1,37 +0,0 @@
-// SPDX-License-Identifier: MIT
-//
-// Copyright 2024 Advanced Micro Devices, Inc.
-
-#ifndef __DML2_CORE_SHARED_H__
-#define __DML2_CORE_SHARED_H__
-
-#define __DML_VBA_DEBUG__
-#define __DML2_CALCS_MAX_VRATIO_PRE_OTO__ 4.0 //<brief Prefetch schedule max vratio for one to one scheduling calculation for prefetch
-#define __DML2_CALCS_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__ 6.0 //<brief Prefetch schedule max vratio when enhance prefetch schedule acceleration is enabled and vstartup is earliest possible already
-#define __DML2_CALCS_DPP_INVALID__ 0
-#define __DML2_CALCS_DCFCLK_FACTOR__ 1.15 //<brief fudge factor for min dcfclk calclation
-#define __DML2_CALCS_PIPE_NO_PLANE__ 99
-
-#include "dml2_core_shared_types.h"
-#include "dml2_internal_shared_types.h"
-
-double dml2_core_shared_div_rem(double dividend, unsigned int divisor, unsigned int *remainder);
-
-const char *dml2_core_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type);
-const char *dml2_core_internal_soc_state_type_str(enum dml2_core_internal_soc_state_type dml2_core_internal_soc_state_type);
-bool dml2_core_shared_is_420(enum dml2_source_format_class source_format);
-
-bool dml2_core_shared_mode_support(struct dml2_core_calcs_mode_support_ex *in_out_params);
-bool dml2_core_shared_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params);
-void dml2_core_shared_get_watermarks(const struct dml2_display_cfg *display_cfg, const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_dchub_watermark_regs *out);
-void dml2_core_shared_get_arb_params(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_display_arb_regs *out);
-void dml2_core_shared_get_pipe_regs(const struct dml2_display_cfg *display_cfg,	struct dml2_core_internal_display_mode_lib *mode_lib,	struct dml2_dchub_per_pipe_register_set *out, int pipe_index);
-void dml2_core_shared_get_stream_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_per_stream_programming *out, int pipe_index);
-void dml2_core_shared_get_mcache_allocation(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_mcache_surface_allocation *out, int plane_idx);
-void dml2_core_shared_get_mall_allocation(struct dml2_core_internal_display_mode_lib *mode_lib, unsigned int *out, int pipe_index);
-void dml2_core_shared_get_plane_support_info(const struct dml2_display_cfg *display_cfg, const struct dml2_core_internal_display_mode_lib *mode_lib, struct core_plane_support_info *out, int plane_idx);
-void dml2_core_shared_get_stream_support_info(const struct dml2_display_cfg *display_cfg, const struct dml2_core_internal_display_mode_lib *mode_lib, struct core_stream_support_info *out, int plane_index);
-void dml2_core_shared_get_informative(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_display_cfg_programming *out);
-void dml2_core_shared_cursor_dlg_reg(struct dml2_cursor_dlg_regs *cursor_dlg_regs, const struct dml2_get_cursor_dlg_reg *p);
-
-#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index 317008eff61b..13961c2eb634 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -9,6 +9,15 @@
 #include "dml_top_display_cfg_types.h"
 #include "dml_top_types.h"
 
+#define __DML_VBA_DEBUG__
+#define __DML2_CALCS_MAX_VRATIO_PRE_OTO__ 4.0 //<brief max vratio for one-to-one prefetch bw scheduling
+#define __DML2_CALCS_MAX_VRATIO_PRE_EQU__ 6.0 //<brief max vratio for equalized prefetch bw scheduling
+#define __DML2_CALCS_MAX_VRATIO_PRE__ 8.0 //<brief max prefetch vratio register limit
+
+#define __DML2_CALCS_DPP_INVALID__ 0
+#define __DML2_CALCS_DCFCLK_FACTOR__ 1.15 //<brief fudge factor for min dcfclk calclation
+#define __DML2_CALCS_PIPE_NO_PLANE__ 99
+
 struct dml2_core_ip_params {
 	unsigned int vblank_nom_default_us;
 	unsigned int remote_iommu_outstanding_translations;
@@ -853,6 +862,9 @@ struct dml2_core_internal_SOCParametersList {
 	double USRRetrainingLatency;
 	double SMNLatency;
 	double g6_temp_read_blackout_us;
+	double max_urgent_latency_us;
+	double df_response_time_us;
+	enum dml2_qos_param_type qos_type;
 };
 
 struct dml2_core_calcs_mode_support_locals {
@@ -914,9 +926,7 @@ struct dml2_core_calcs_mode_support_locals {
 
 	double HostVMInefficiencyFactor;
 	double HostVMInefficiencyFactorPrefetch;
-	unsigned int NextMaxVStartup;
 	unsigned int MaxVStartup;
-	bool AnyLinesForVMOrRowTooLarge;
 	double PixelClockBackEndFactor;
 	unsigned int NumDSCUnitRequired;
 
@@ -1197,11 +1207,14 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_locals {
 	double Tdmec;
 	double Tdmsks;
 	double prefetch_sw_bytes;
+	double total_row_bytes;
 	double prefetch_bw_pr;
 	double bytes_pp;
 	double dep_bytes;
 	double min_Lsw_oto;
+	double min_Lsw_equ;
 	double Tsw_est1;
+	double Tsw_est2;
 	double Tsw_est3;
 	double prefetch_bw1;
 	double prefetch_bw2;
@@ -1333,6 +1346,10 @@ struct dml2_core_shared_get_urgent_bandwidth_required_locals {
 	double tmp_nom_adj_factor_p1;
 	double tmp_pref_adj_factor_p0;
 	double tmp_pref_adj_factor_p1;
+	double vm_row_bw;
+	double flip_and_active_bw;
+	double flip_and_prefetch_bw;
+	double active_and_excess_bw;
 };
 
 struct dml2_core_shared_calculate_peak_bandwidth_required_locals {
@@ -1689,7 +1706,6 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_params {
 	enum dml2_output_format_class OutputFormat;
 	unsigned int MaxInterDCNTileRepeaters;
 	unsigned int VStartup;
-	unsigned int MaxVStartup;
 	unsigned int HostVMMinPageSize;
 	bool DynamicMetadataEnable;
 	bool DynamicMetadataVMEnabled;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
new file mode 100644
index 000000000000..ab229e1598ae
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
@@ -0,0 +1,631 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include "dml2_core_utils.h"
+
+double dml2_core_utils_div_rem(double dividend, unsigned int divisor, unsigned int *remainder)
+{
+	*remainder = ((dividend / divisor) - (int)(dividend / divisor) > 0);
+	return dividend / divisor;
+
+}
+
+const char *dml2_core_utils_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type)
+{
+	switch (bw_type) {
+	case (dml2_core_internal_bw_sdp):
+		return("dml2_core_internal_bw_sdp");
+	case (dml2_core_internal_bw_dram):
+		return("dml2_core_internal_bw_dram");
+	case (dml2_core_internal_bw_max):
+		return("dml2_core_internal_bw_max");
+	default:
+		return("dml2_core_internal_bw_unknown");
+	}
+}
+
+bool dml2_core_utils_is_420(enum dml2_source_format_class source_format)
+{
+	bool val = false;
+
+	switch (source_format) {
+	case dml2_444_8:
+		val = 0;
+		break;
+	case dml2_444_16:
+		val = 0;
+		break;
+	case dml2_444_32:
+		val = 0;
+		break;
+	case dml2_444_64:
+		val = 0;
+		break;
+	case dml2_420_8:
+		val = 1;
+		break;
+	case dml2_420_10:
+		val = 1;
+		break;
+	case dml2_420_12:
+		val = 1;
+		break;
+	case dml2_rgbe_alpha:
+		val = 0;
+		break;
+	case dml2_rgbe:
+		val = 0;
+		break;
+	case dml2_mono_8:
+		val = 0;
+		break;
+	case dml2_mono_16:
+		val = 0;
+		break;
+	default:
+		DML2_ASSERT(0);
+		break;
+	}
+	return val;
+}
+
+void dml2_core_utils_print_mode_support_info(const struct dml2_core_internal_mode_support_info *support, bool fail_only)
+{
+	dml2_printf("DML: ===================================== \n");
+	dml2_printf("DML: DML_MODE_SUPPORT_INFO_ST\n");
+	if (!fail_only || support->ScaleRatioAndTapsSupport == 0)
+		dml2_printf("DML: support: ScaleRatioAndTapsSupport = %d\n", support->ScaleRatioAndTapsSupport);
+	if (!fail_only || support->SourceFormatPixelAndScanSupport == 0)
+		dml2_printf("DML: support: SourceFormatPixelAndScanSupport = %d\n", support->SourceFormatPixelAndScanSupport);
+	if (!fail_only || support->ViewportSizeSupport == 0)
+		dml2_printf("DML: support: ViewportSizeSupport = %d\n", support->ViewportSizeSupport);
+	if (!fail_only || support->LinkRateDoesNotMatchDPVersion == 1)
+		dml2_printf("DML: support: LinkRateDoesNotMatchDPVersion = %d\n", support->LinkRateDoesNotMatchDPVersion);
+	if (!fail_only || support->LinkRateForMultistreamNotIndicated == 1)
+		dml2_printf("DML: support: LinkRateForMultistreamNotIndicated = %d\n", support->LinkRateForMultistreamNotIndicated);
+	if (!fail_only || support->BPPForMultistreamNotIndicated == 1)
+		dml2_printf("DML: support: BPPForMultistreamNotIndicated = %d\n", support->BPPForMultistreamNotIndicated);
+	if (!fail_only || support->MultistreamWithHDMIOreDP == 1)
+		dml2_printf("DML: support: MultistreamWithHDMIOreDP = %d\n", support->MultistreamWithHDMIOreDP);
+	if (!fail_only || support->ExceededMultistreamSlots == 1)
+		dml2_printf("DML: support: ExceededMultistreamSlots = %d\n", support->ExceededMultistreamSlots);
+	if (!fail_only || support->MSOOrODMSplitWithNonDPLink == 1)
+		dml2_printf("DML: support: MSOOrODMSplitWithNonDPLink = %d\n", support->MSOOrODMSplitWithNonDPLink);
+	if (!fail_only || support->NotEnoughLanesForMSO == 1)
+		dml2_printf("DML: support: NotEnoughLanesForMSO = %d\n", support->NotEnoughLanesForMSO);
+	if (!fail_only || support->P2IWith420 == 1)
+		dml2_printf("DML: support: P2IWith420 = %d\n", support->P2IWith420);
+	if (!fail_only || support->DSC422NativeNotSupported == 1)
+		dml2_printf("DML: support: DSC422NativeNotSupported = %d\n", support->DSC422NativeNotSupported);
+	if (!fail_only || support->DSCSlicesODMModeSupported == 0)
+		dml2_printf("DML: support: DSCSlicesODMModeSupported = %d\n", support->DSCSlicesODMModeSupported);
+	if (!fail_only || support->NotEnoughDSCUnits == 1)
+		dml2_printf("DML: support: NotEnoughDSCUnits = %d\n", support->NotEnoughDSCUnits);
+	if (!fail_only || support->NotEnoughDSCSlices == 1)
+		dml2_printf("DML: support: NotEnoughDSCSlices = %d\n", support->NotEnoughDSCSlices);
+	if (!fail_only || support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe == 1)
+		dml2_printf("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = %d\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
+	if (!fail_only || support->InvalidCombinationOfMALLUseForPStateAndStaticScreen == 1)
+		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = %d\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
+	if (!fail_only || support->DSCCLKRequiredMoreThanSupported == 1)
+		dml2_printf("DML: support: DSCCLKRequiredMoreThanSupported = %d\n", support->DSCCLKRequiredMoreThanSupported);
+	if (!fail_only || support->PixelsPerLinePerDSCUnitSupport == 0)
+		dml2_printf("DML: support: PixelsPerLinePerDSCUnitSupport = %d\n", support->PixelsPerLinePerDSCUnitSupport);
+	if (!fail_only || support->DTBCLKRequiredMoreThanSupported == 1)
+		dml2_printf("DML: support: DTBCLKRequiredMoreThanSupported = %d\n", support->DTBCLKRequiredMoreThanSupported);
+	if (!fail_only || support->InvalidCombinationOfMALLUseForPState == 1)
+		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPState = %d\n", support->InvalidCombinationOfMALLUseForPState);
+	if (!fail_only || support->ROBSupport == 0)
+		dml2_printf("DML: support: ROBSupport = %d\n", support->ROBSupport);
+	if (!fail_only || support->OutstandingRequestsSupport == 0)
+		dml2_printf("DML: support: OutstandingRequestsSupport = %d\n", support->OutstandingRequestsSupport);
+	if (!fail_only || support->OutstandingRequestsUrgencyAvoidance == 0)
+		dml2_printf("DML: support: OutstandingRequestsUrgencyAvoidance = %d\n", support->OutstandingRequestsUrgencyAvoidance);
+	if (!fail_only || support->DISPCLK_DPPCLK_Support == 0)
+		dml2_printf("DML: support: DISPCLK_DPPCLK_Support = %d\n", support->DISPCLK_DPPCLK_Support);
+	if (!fail_only || support->TotalAvailablePipesSupport == 0)
+		dml2_printf("DML: support: TotalAvailablePipesSupport = %d\n", support->TotalAvailablePipesSupport);
+	if (!fail_only || support->NumberOfOTGSupport == 0)
+		dml2_printf("DML: support: NumberOfOTGSupport = %d\n", support->NumberOfOTGSupport);
+	if (!fail_only || support->NumberOfHDMIFRLSupport == 0)
+		dml2_printf("DML: support: NumberOfHDMIFRLSupport = %d\n", support->NumberOfHDMIFRLSupport);
+	if (!fail_only || support->NumberOfDP2p0Support == 0)
+		dml2_printf("DML: support: NumberOfDP2p0Support = %d\n", support->NumberOfDP2p0Support);
+	if (!fail_only || support->EnoughWritebackUnits == 0)
+		dml2_printf("DML: support: EnoughWritebackUnits = %d\n", support->EnoughWritebackUnits);
+	if (!fail_only || support->WritebackScaleRatioAndTapsSupport == 0)
+		dml2_printf("DML: support: WritebackScaleRatioAndTapsSupport = %d\n", support->WritebackScaleRatioAndTapsSupport);
+	if (!fail_only || support->WritebackLatencySupport == 0)
+		dml2_printf("DML: support: WritebackLatencySupport = %d\n", support->WritebackLatencySupport);
+	if (!fail_only || support->CursorSupport == 0)
+		dml2_printf("DML: support: CursorSupport = %d\n", support->CursorSupport);
+	if (!fail_only || support->PitchSupport == 0)
+		dml2_printf("DML: support: PitchSupport = %d\n", support->PitchSupport);
+	if (!fail_only || support->ViewportExceedsSurface == 1)
+		dml2_printf("DML: support: ViewportExceedsSurface = %d\n", support->ViewportExceedsSurface);
+	if (!fail_only || support->PrefetchSupported == 0)
+		dml2_printf("DML: support: PrefetchSupported = %d\n", support->PrefetchSupported);
+	if (!fail_only || support->EnoughUrgentLatencyHidingSupport == 0)
+		dml2_printf("DML: support: EnoughUrgentLatencyHidingSupport = %d\n", support->EnoughUrgentLatencyHidingSupport);
+	if (!fail_only || support->AvgBandwidthSupport == 0)
+		dml2_printf("DML: support: AvgBandwidthSupport = %d\n", support->AvgBandwidthSupport);
+	if (!fail_only || support->DynamicMetadataSupported == 0)
+		dml2_printf("DML: support: DynamicMetadataSupported = %d\n", support->DynamicMetadataSupported);
+	if (!fail_only || support->VRatioInPrefetchSupported == 0)
+		dml2_printf("DML: support: VRatioInPrefetchSupported = %d\n", support->VRatioInPrefetchSupported);
+	if (!fail_only || support->PTEBufferSizeNotExceeded == 1)
+		dml2_printf("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
+	if (!fail_only || support->DCCMetaBufferSizeNotExceeded == 1)
+		dml2_printf("DML: support: DCCMetaBufferSizeNotExceeded = %d\n", support->DCCMetaBufferSizeNotExceeded);
+	if (!fail_only || support->ExceededMALLSize == 1)
+		dml2_printf("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
+	if (!fail_only || support->g6_temp_read_support == 0)
+		dml2_printf("DML: support: g6_temp_read_support = %d\n", support->g6_temp_read_support);
+	if (!fail_only || support->ImmediateFlipSupport == 0)
+		dml2_printf("DML: support: ImmediateFlipSupport = %d\n", support->ImmediateFlipSupport);
+	if (!fail_only || support->LinkCapacitySupport == 0)
+		dml2_printf("DML: support: LinkCapacitySupport = %d\n", support->LinkCapacitySupport);
+
+	if (!fail_only || support->ModeSupport == 0)
+		dml2_printf("DML: support: ModeSupport = %d\n", support->ModeSupport);
+	dml2_printf("DML: ===================================== \n");
+}
+
+const char *dml2_core_utils_internal_soc_state_type_str(enum dml2_core_internal_soc_state_type dml2_core_internal_soc_state_type)
+{
+	switch (dml2_core_internal_soc_state_type) {
+	case (dml2_core_internal_soc_state_sys_idle):
+		return("dml2_core_internal_soc_state_sys_idle");
+	case (dml2_core_internal_soc_state_sys_active):
+		return("dml2_core_internal_soc_state_sys_active");
+	case (dml2_core_internal_soc_state_svp_prefetch):
+		return("dml2_core_internal_soc_state_svp_prefetch");
+	case dml2_core_internal_soc_state_max:
+	default:
+		return("dml2_core_internal_soc_state_unknown");
+	}
+}
+
+
+void dml2_core_utils_get_stream_output_bpp(double *out_bpp, const struct dml2_display_cfg *display_cfg)
+{
+	for (unsigned int k = 0; k < display_cfg->num_planes; k++) {
+		double bpc = (double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.bpc;
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_disable) {
+			switch (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].output.output_format) {
+			case dml2_444:
+				out_bpp[k] = bpc * 3;
+				break;
+			case dml2_s422:
+				out_bpp[k] = bpc * 2;
+				break;
+			case dml2_n422:
+				out_bpp[k] = bpc * 2;
+				break;
+			case dml2_420:
+			default:
+				out_bpp[k] = bpc * 1.5;
+				break;
+			}
+		} else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable == dml2_dsc_enable) {
+			out_bpp[k] = (double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.dsc_compressed_bpp_x16 / 16;
+		} else {
+			out_bpp[k] = 0;
+		}
+#ifdef __DML_VBA_DEBUG__
+		dml2_printf("DML::%s: k=%d bpc=%f\n", __func__, k, bpc);
+		dml2_printf("DML::%s: k=%d dsc.enable=%d\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable);
+		dml2_printf("DML::%s: k=%d out_bpp=%f\n", __func__, k, out_bpp[k]);
+#endif
+	}
+}
+
+unsigned int dml2_core_utils_round_to_multiple(unsigned int num, unsigned int multiple, bool up)
+{
+	unsigned int remainder;
+
+	if (multiple == 0)
+		return num;
+
+	remainder = num % multiple;
+	if (remainder == 0)
+		return num;
+
+	if (up)
+		return (num + multiple - remainder);
+	else
+		return (num - remainder);
+}
+
+unsigned int dml2_core_util_get_num_active_pipes(int unsigned num_planes, const struct core_display_cfg_support_info *cfg_support_info)
+{
+	unsigned int num_active_pipes = 0;
+
+	for (unsigned int k = 0; k < num_planes; k++) {
+		num_active_pipes = num_active_pipes + (unsigned int)cfg_support_info->plane_support_info[k].dpps_used;
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml2_printf("DML::%s: num_active_pipes = %d\n", __func__, num_active_pipes);
+#endif
+	return num_active_pipes;
+}
+
+void dml2_core_utils_pipe_plane_mapping(const struct core_display_cfg_support_info *cfg_support_info, unsigned int *pipe_plane)
+{
+	unsigned int pipe_idx = 0;
+
+	for (unsigned int k = 0; k < DML2_MAX_PLANES; ++k) {
+		pipe_plane[k] = __DML2_CALCS_PIPE_NO_PLANE__;
+	}
+
+	for (unsigned int plane_idx = 0; plane_idx < DML2_MAX_PLANES; plane_idx++) {
+		for (int i = 0; i < cfg_support_info->plane_support_info[plane_idx].dpps_used; i++) {
+			pipe_plane[pipe_idx] = plane_idx;
+			pipe_idx++;
+		}
+	}
+}
+
+bool dml2_core_utils_is_phantom_pipe(const struct dml2_plane_parameters *plane_cfg)
+{
+	bool is_phantom = false;
+
+	if (plane_cfg->overrides.legacy_svp_config == dml2_svp_mode_override_phantom_pipe ||
+		plane_cfg->overrides.legacy_svp_config == dml2_svp_mode_override_phantom_pipe_no_data_return) {
+		is_phantom = true;
+	}
+
+	return is_phantom;
+}
+
+unsigned int dml2_core_utils_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode)
+{
+	switch (sw_mode) {
+	case (dml2_sw_linear):
+		return 256; break;
+	case (dml2_sw_256b_2d):
+		return 256; break;
+	case (dml2_sw_4kb_2d):
+		return 4096; break;
+	case (dml2_sw_64kb_2d):
+		return 65536; break;
+	case (dml2_sw_256kb_2d):
+		return 262144; break;
+	case (dml2_gfx11_sw_linear):
+		return 256; break;
+	case (dml2_gfx11_sw_64kb_d):
+		return 65536; break;
+	case (dml2_gfx11_sw_64kb_d_t):
+		return 65536; break;
+	case (dml2_gfx11_sw_64kb_d_x):
+		return 65536; break;
+	case (dml2_gfx11_sw_64kb_r_x):
+		return 65536; break;
+	case (dml2_gfx11_sw_256kb_d_x):
+		return 262144; break;
+	case (dml2_gfx11_sw_256kb_r_x):
+		return 262144; break;
+	default:
+		DML2_ASSERT(0);
+		return 256;
+	};
+}
+
+
+bool dml2_core_utils_is_vertical_rotation(enum dml2_rotation_angle Scan)
+{
+	bool is_vert = false;
+	if (Scan == dml2_rotation_90 || Scan == dml2_rotation_270) {
+		is_vert = true;
+	} else {
+		is_vert = false;
+	}
+	return is_vert;
+}
+
+
+int unsigned dml2_core_utils_get_gfx_version(enum dml2_swizzle_mode sw_mode)
+{
+	int unsigned version = 0;
+
+	if (sw_mode == dml2_sw_linear ||
+		sw_mode == dml2_sw_256b_2d ||
+		sw_mode == dml2_sw_4kb_2d ||
+		sw_mode == dml2_sw_64kb_2d ||
+		sw_mode == dml2_sw_256kb_2d) {
+		version = 12;
+	} else if (sw_mode == dml2_gfx11_sw_linear ||
+		sw_mode == dml2_gfx11_sw_64kb_d ||
+		sw_mode == dml2_gfx11_sw_64kb_d_t ||
+		sw_mode == dml2_gfx11_sw_64kb_d_x ||
+		sw_mode == dml2_gfx11_sw_64kb_r_x ||
+		sw_mode == dml2_gfx11_sw_256kb_d_x ||
+		sw_mode == dml2_gfx11_sw_256kb_r_x) {
+		version = 11;
+	} else {
+		dml2_printf("ERROR: Invalid sw_mode setting! val=%u\n", sw_mode);
+		DML2_ASSERT(0);
+	}
+
+	return version;
+}
+
+unsigned int dml2_core_utils_get_qos_param_index(unsigned long uclk_freq_khz, const struct dml2_dcn4_uclk_dpm_dependent_qos_params *per_uclk_dpm_params)
+{
+	unsigned int i;
+	unsigned int index = 0;
+
+	for (i = 0; i < DML_MAX_CLK_TABLE_SIZE; i++) {
+		dml2_printf("DML::%s: per_uclk_dpm_params[%d].minimum_uclk_khz = %d\n", __func__, i, per_uclk_dpm_params[i].minimum_uclk_khz);
+
+		if (i == 0)
+			index = 0;
+		else
+			index = i - 1;
+
+		if (uclk_freq_khz < per_uclk_dpm_params[i].minimum_uclk_khz ||
+			per_uclk_dpm_params[i].minimum_uclk_khz == 0) {
+			break;
+		}
+	}
+#if defined(__DML_VBA_DEBUG__)
+	dml2_printf("DML::%s: uclk_freq_khz = %d\n", __func__, uclk_freq_khz);
+	dml2_printf("DML::%s: index = %d\n", __func__, index);
+#endif
+	return index;
+}
+
+unsigned int dml2_core_utils_get_active_min_uclk_dpm_index(unsigned long uclk_freq_khz, const struct dml2_soc_state_table *clk_table)
+{
+	unsigned int i;
+	bool clk_entry_found = 0;
+
+	for (i = 0; i < clk_table->uclk.num_clk_values; i++) {
+		dml2_printf("DML::%s: clk_table.uclk.clk_values_khz[%d] = %d\n", __func__, i, clk_table->uclk.clk_values_khz[i]);
+
+		if (uclk_freq_khz == clk_table->uclk.clk_values_khz[i]) {
+			clk_entry_found = 1;
+			break;
+		}
+	}
+
+	dml2_assert(clk_entry_found);
+#if defined(__DML_VBA_DEBUG__)
+	dml2_printf("DML::%s: uclk_freq_khz = %ld\n", __func__, uclk_freq_khz);
+	dml2_printf("DML::%s: index = %d\n", __func__, i);
+#endif
+	return i;
+}
+
+bool dml2_core_utils_is_dual_plane(enum dml2_source_format_class source_format)
+{
+	bool ret_val = 0;
+
+	if ((source_format == dml2_420_12) || (source_format == dml2_420_8) || (source_format == dml2_420_10) || (source_format == dml2_rgbe_alpha))
+		ret_val = 1;
+
+	return ret_val;
+}
+
+unsigned int dml2_core_utils_log_and_substract_if_non_zero(unsigned int a, unsigned int subtrahend)
+{
+	if (a == 0)
+		return 0;
+
+	return (math_log2_approx(a) - subtrahend);
+}
+
+static void create_phantom_stream_from_main_stream(struct dml2_stream_parameters *phantom, const struct dml2_stream_parameters *main,
+	const struct dml2_implicit_svp_meta *meta)
+{
+	memcpy(phantom, main, sizeof(struct dml2_stream_parameters));
+
+	phantom->timing.v_total = meta->v_total;
+	phantom->timing.v_active = meta->v_active;
+	phantom->timing.v_front_porch = meta->v_front_porch;
+	phantom->timing.vblank_nom = phantom->timing.v_total - phantom->timing.v_active;
+	phantom->timing.drr_config.enabled = false;
+}
+
+static void create_phantom_plane_from_main_plane(struct dml2_plane_parameters *phantom, const struct dml2_plane_parameters *main,
+	const struct dml2_stream_parameters *phantom_stream, int phantom_stream_index, const struct dml2_stream_parameters *main_stream)
+{
+	memcpy(phantom, main, sizeof(struct dml2_plane_parameters));
+
+	phantom->stream_index = phantom_stream_index;
+	phantom->overrides.refresh_from_mall = dml2_refresh_from_mall_mode_override_force_disable;
+	phantom->overrides.legacy_svp_config = dml2_svp_mode_override_phantom_pipe_no_data_return;
+	phantom->composition.viewport.plane0.height = (long int unsigned) math_min2(math_ceil2(
+		(double)main->composition.scaler_info.plane0.v_ratio * (double)phantom_stream->timing.v_active, 16.0),
+		(double)main->composition.viewport.plane0.height);
+	phantom->composition.viewport.plane1.height = (long int unsigned) math_min2(math_ceil2(
+		(double)main->composition.scaler_info.plane1.v_ratio * (double)phantom_stream->timing.v_active, 16.0),
+		(double)main->composition.viewport.plane1.height);
+	phantom->immediate_flip = false;
+	phantom->dynamic_meta_data.enable = false;
+	phantom->cursor.num_cursors = 0;
+	phantom->cursor.cursor_width = 0;
+	phantom->tdlut.setup_for_tdlut = false;
+}
+
+void dml2_core_utils_expand_implict_subvp(const struct display_configuation_with_meta *display_cfg, struct dml2_display_cfg *svp_expanded_display_cfg,
+	struct dml2_core_scratch *scratch)
+{
+	unsigned int stream_index, plane_index;
+	const struct dml2_plane_parameters *main_plane;
+	const struct dml2_stream_parameters *main_stream;
+	const struct dml2_stream_parameters *phantom_stream;
+
+	memcpy(svp_expanded_display_cfg, &display_cfg->display_config, sizeof(struct dml2_display_cfg));
+	memset(scratch->main_stream_index_from_svp_stream_index, 0, sizeof(int) * DML2_MAX_PLANES);
+	memset(scratch->svp_stream_index_from_main_stream_index, 0, sizeof(int) * DML2_MAX_PLANES);
+	memset(scratch->main_plane_index_to_phantom_plane_index, 0, sizeof(int) * DML2_MAX_PLANES);
+
+	if (!display_cfg->display_config.overrides.enable_subvp_implicit_pmo)
+		return;
+
+	/* disable unbounded requesting for all planes until stage 3 has been performed */
+	if (!display_cfg->stage3.performed) {
+		svp_expanded_display_cfg->overrides.hw.force_unbounded_requesting.enable = true;
+		svp_expanded_display_cfg->overrides.hw.force_unbounded_requesting.value = false;
+	}
+	// Create the phantom streams
+	for (stream_index = 0; stream_index < display_cfg->display_config.num_streams; stream_index++) {
+		main_stream = &display_cfg->display_config.stream_descriptors[stream_index];
+		scratch->main_stream_index_from_svp_stream_index[stream_index] = stream_index;
+		scratch->svp_stream_index_from_main_stream_index[stream_index] = stream_index;
+
+		if (display_cfg->stage3.stream_svp_meta[stream_index].valid) {
+			// Create the phantom stream
+			create_phantom_stream_from_main_stream(&svp_expanded_display_cfg->stream_descriptors[svp_expanded_display_cfg->num_streams],
+				main_stream, &display_cfg->stage3.stream_svp_meta[stream_index]);
+
+			// Associate this phantom stream to the main stream
+			scratch->main_stream_index_from_svp_stream_index[svp_expanded_display_cfg->num_streams] = stream_index;
+			scratch->svp_stream_index_from_main_stream_index[stream_index] = svp_expanded_display_cfg->num_streams;
+
+			// Increment num streams
+			svp_expanded_display_cfg->num_streams++;
+		}
+	}
+
+	// Create the phantom planes
+	for (plane_index = 0; plane_index < display_cfg->display_config.num_planes; plane_index++) {
+		main_plane = &display_cfg->display_config.plane_descriptors[plane_index];
+
+		if (display_cfg->stage3.stream_svp_meta[main_plane->stream_index].valid) {
+			main_stream = &display_cfg->display_config.stream_descriptors[main_plane->stream_index];
+			phantom_stream = &svp_expanded_display_cfg->stream_descriptors[scratch->svp_stream_index_from_main_stream_index[main_plane->stream_index]];
+			create_phantom_plane_from_main_plane(&svp_expanded_display_cfg->plane_descriptors[svp_expanded_display_cfg->num_planes],
+				main_plane, phantom_stream, scratch->svp_stream_index_from_main_stream_index[main_plane->stream_index], main_stream);
+
+			// Associate this phantom plane to the main plane
+			scratch->phantom_plane_index_to_main_plane_index[svp_expanded_display_cfg->num_planes] = plane_index;
+			scratch->main_plane_index_to_phantom_plane_index[plane_index] = svp_expanded_display_cfg->num_planes;
+
+			// Increment num planes
+			svp_expanded_display_cfg->num_planes++;
+
+			// Adjust the main plane settings
+			svp_expanded_display_cfg->plane_descriptors[plane_index].overrides.legacy_svp_config = dml2_svp_mode_override_main_pipe;
+		}
+	}
+}
+
+bool dml2_core_utils_is_stream_encoder_required(const struct dml2_stream_parameters *stream_descriptor)
+{
+	switch (stream_descriptor->output.output_encoder) {
+	case dml2_dp:
+	case dml2_dp2p0:
+	case dml2_edp:
+	case dml2_hdmi:
+	case dml2_hdmifrl:
+		return true;
+	case dml2_none:
+	default:
+		return false;
+	}
+}
+bool dml2_core_utils_is_encoder_dsc_capable(const struct dml2_stream_parameters *stream_descriptor)
+{
+	switch (stream_descriptor->output.output_encoder) {
+	case dml2_dp:
+	case dml2_dp2p0:
+	case dml2_edp:
+	case dml2_hdmifrl:
+		return true;
+	case dml2_hdmi:
+	case dml2_none:
+	default:
+		return false;
+	}
+}
+
+
+bool dml2_core_utils_is_dio_dp_encoder(const struct dml2_stream_parameters *stream_descriptor)
+{
+	switch (stream_descriptor->output.output_encoder) {
+	case dml2_dp:
+	case dml2_edp:
+		return true;
+	case dml2_dp2p0:
+	case dml2_hdmi:
+	case dml2_hdmifrl:
+	case dml2_none:
+	default:
+		return false;
+	}
+}
+
+bool dml2_core_utils_is_hpo_dp_encoder(const struct dml2_stream_parameters *stream_descriptor)
+{
+	switch (stream_descriptor->output.output_encoder) {
+	case dml2_dp2p0:
+		return true;
+	case dml2_dp:
+	case dml2_edp:
+	case dml2_hdmi:
+	case dml2_hdmifrl:
+	case dml2_none:
+	default:
+		return false;
+	}
+}
+
+bool dml2_core_utils_is_dp_encoder(const struct dml2_stream_parameters *stream_descriptor)
+{
+	return dml2_core_utils_is_dio_dp_encoder(stream_descriptor)
+			|| dml2_core_utils_is_hpo_dp_encoder(stream_descriptor);
+}
+
+
+bool dml2_core_utils_is_dp_8b_10b_link_rate(enum dml2_output_link_dp_rate rate)
+{
+	switch (rate) {
+	case dml2_dp_rate_hbr:
+	case dml2_dp_rate_hbr2:
+	case dml2_dp_rate_hbr3:
+		return true;
+	case dml2_dp_rate_na:
+	case dml2_dp_rate_uhbr10:
+	case dml2_dp_rate_uhbr13p5:
+	case dml2_dp_rate_uhbr20:
+	default:
+		return false;
+	}
+}
+
+bool dml2_core_utils_is_dp_128b_132b_link_rate(enum dml2_output_link_dp_rate rate)
+{
+	switch (rate) {
+	case dml2_dp_rate_uhbr10:
+	case dml2_dp_rate_uhbr13p5:
+	case dml2_dp_rate_uhbr20:
+		return true;
+	case dml2_dp_rate_hbr:
+	case dml2_dp_rate_hbr2:
+	case dml2_dp_rate_hbr3:
+	case dml2_dp_rate_na:
+	default:
+		return false;
+	}
+}
+
+bool dml2_core_utils_is_odm_split(enum dml2_odm_mode odm_mode)
+{
+	switch (odm_mode) {
+	case dml2_odm_mode_split_1to2:
+	case dml2_odm_mode_mso_1to2:
+	case dml2_odm_mode_mso_1to4:
+		return true;
+	case dml2_odm_mode_auto:
+	case dml2_odm_mode_bypass:
+	case dml2_odm_mode_combine_2to1:
+	case dml2_odm_mode_combine_3to1:
+	case dml2_odm_mode_combine_4to1:
+	default:
+		return false;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h
new file mode 100644
index 000000000000..a5cc6a07167a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#ifndef __DML2_CORE_UTILS_H__
+#define __DML2_CORE_UTILS_H__
+#include "dml2_internal_shared_types.h"
+#include "dml2_debug.h"
+#include "lib_float_math.h"
+
+double dml2_core_utils_div_rem(double dividend, unsigned int divisor, unsigned int *remainder);
+const char *dml2_core_utils_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type);
+bool dml2_core_utils_is_420(enum dml2_source_format_class source_format);
+void dml2_core_utils_print_mode_support_info(const struct dml2_core_internal_mode_support_info *support, bool fail_only);
+const char *dml2_core_utils_internal_soc_state_type_str(enum dml2_core_internal_soc_state_type dml2_core_internal_soc_state_type);
+void dml2_core_utils_get_stream_output_bpp(double *out_bpp, const struct dml2_display_cfg *display_cfg);
+unsigned int dml2_core_utils_round_to_multiple(unsigned int num, unsigned int multiple, bool up);
+unsigned int dml2_core_util_get_num_active_pipes(int unsigned num_planes, const struct core_display_cfg_support_info *cfg_support_info);
+void dml2_core_utils_pipe_plane_mapping(const struct core_display_cfg_support_info *cfg_support_info, unsigned int *pipe_plane);
+bool dml2_core_utils_is_phantom_pipe(const struct dml2_plane_parameters *plane_cfg);
+unsigned int dml2_core_utils_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode);
+bool dml2_core_utils_is_vertical_rotation(enum dml2_rotation_angle Scan);
+int unsigned dml2_core_utils_get_gfx_version(enum dml2_swizzle_mode sw_mode);
+unsigned int dml2_core_utils_get_qos_param_index(unsigned long uclk_freq_khz, const struct dml2_dcn4_uclk_dpm_dependent_qos_params *per_uclk_dpm_params);
+unsigned int dml2_core_utils_get_active_min_uclk_dpm_index(unsigned long uclk_freq_khz, const struct dml2_soc_state_table *clk_table);
+bool dml2_core_utils_is_dual_plane(enum dml2_source_format_class source_format);
+unsigned int dml2_core_utils_log_and_substract_if_non_zero(unsigned int a, unsigned int subtrahend);
+void dml2_core_utils_expand_implict_subvp(const struct display_configuation_with_meta *display_cfg, struct dml2_display_cfg *svp_expanded_display_cfg,
+	struct dml2_core_scratch *scratch);
+bool dml2_core_utils_is_stream_encoder_required(const struct dml2_stream_parameters *stream_descriptor);
+bool dml2_core_utils_is_encoder_dsc_capable(const struct dml2_stream_parameters *stream_descriptor);
+bool dml2_core_utils_is_dp_encoder(const struct dml2_stream_parameters *stream_descriptor);
+bool dml2_core_utils_is_dio_dp_encoder(const struct dml2_stream_parameters *stream_descriptor);
+bool dml2_core_utils_is_hpo_dp_encoder(const struct dml2_stream_parameters *stream_descriptor);
+bool dml2_core_utils_is_dp_8b_10b_link_rate(enum dml2_output_link_dp_rate rate);
+bool dml2_core_utils_is_dp_128b_132b_link_rate(enum dml2_output_link_dp_rate rate);
+bool dml2_core_utils_is_odm_split(enum dml2_odm_mode odm_mode);
+
+#endif /* __DML2_CORE_UTILS_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
index f19f6ebaae13..8869ea089312 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
@@ -203,6 +203,26 @@ static bool add_margin_and_round_to_dfs_grainularity(double clock_khz, double ma
 	return true;
 }
 
+static bool round_to_non_dfs_granularity(unsigned long dispclk_khz, unsigned long dpprefclk_khz, unsigned long dtbrefclk_khz,
+	unsigned long *rounded_dispclk_khz, unsigned long *rounded_dpprefclk_khz, unsigned long *rounded_dtbrefclk_khz)
+{
+	unsigned long pll_frequency_khz;
+
+	pll_frequency_khz = (unsigned long) math_max2(600000, math_ceil2(math_max3(dispclk_khz, dpprefclk_khz, dtbrefclk_khz), 1000));
+
+	*rounded_dispclk_khz = pll_frequency_khz / (unsigned long) math_min2(pll_frequency_khz / dispclk_khz, 32);
+
+	*rounded_dpprefclk_khz = pll_frequency_khz / (unsigned long) math_min2(pll_frequency_khz / dpprefclk_khz, 32);
+
+	if (dtbrefclk_khz > 0) {
+		*rounded_dtbrefclk_khz = pll_frequency_khz / (unsigned long) math_min2(pll_frequency_khz / dtbrefclk_khz, 32);
+	} else {
+		*rounded_dtbrefclk_khz = 0;
+	}
+
+	return true;
+}
+
 static bool round_up_and_copy_to_next_dpm(unsigned long min_value, unsigned long *rounded_value, const struct dml2_clk_table *clock_table)
 {
 	bool result = false;
@@ -555,31 +575,39 @@ static bool map_mode_to_soc_dpm(struct dml2_dpmm_map_mode_to_soc_dpm_params_in_o
 	// but still the required dispclk can be more than the maximum dispclk speed:
 	dispclk_khz = math_max2(dispclk_khz, mode_support_result->global.dispclk_khz * (1 + in_out->soc_bb->dcn_downspread_percent / 100.0));
 
-	add_margin_and_round_to_dfs_grainularity(dispclk_khz, 0.0,
-		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dispclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dispclk_did);
-
 	// DPP Ref is always set to max of all DPP clocks
 	for (i = 0; i < DML2_MAX_DCN_PIPES; i++) {
 		if (in_out->programming->min_clocks.dcn4x.dpprefclk_khz < mode_support_result->per_plane[i].dppclk_khz)
 			in_out->programming->min_clocks.dcn4x.dpprefclk_khz = mode_support_result->per_plane[i].dppclk_khz;
 	}
-
-	add_margin_and_round_to_dfs_grainularity(in_out->programming->min_clocks.dcn4x.dpprefclk_khz, in_out->soc_bb->dcn_downspread_percent / 100.0,
-		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dpprefclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dpprefclk_did);
-
-	for (i = 0; i < DML2_MAX_DCN_PIPES; i++) {
-		in_out->programming->plane_programming[i].min_clocks.dcn4x.dppclk_khz = (unsigned long)(in_out->programming->min_clocks.dcn4x.dpprefclk_khz / 255.0
-			* math_ceil2(in_out->display_cfg->mode_support_result.per_plane[i].dppclk_khz * (1.0 + in_out->soc_bb->dcn_downspread_percent / 100.0) * 255.0 / in_out->programming->min_clocks.dcn4x.dpprefclk_khz, 1.0));
-	}
+	in_out->programming->min_clocks.dcn4x.dpprefclk_khz = (unsigned long) (in_out->programming->min_clocks.dcn4x.dpprefclk_khz * (1 + in_out->soc_bb->dcn_downspread_percent / 100.0));
 
 	// DTB Ref is always set to max of all DTB clocks
 	for (i = 0; i < DML2_MAX_DCN_PIPES; i++) {
 		if (in_out->programming->min_clocks.dcn4x.dtbrefclk_khz < mode_support_result->per_stream[i].dtbclk_khz)
 			in_out->programming->min_clocks.dcn4x.dtbrefclk_khz = mode_support_result->per_stream[i].dtbclk_khz;
 	}
+	in_out->programming->min_clocks.dcn4x.dtbrefclk_khz = (unsigned long)(in_out->programming->min_clocks.dcn4x.dtbrefclk_khz * (1 + in_out->soc_bb->dcn_downspread_percent / 100.0));
+
+	if (in_out->soc_bb->no_dfs) {
+		round_to_non_dfs_granularity((unsigned long)dispclk_khz, in_out->programming->min_clocks.dcn4x.dpprefclk_khz, in_out->programming->min_clocks.dcn4x.dtbrefclk_khz,
+			&in_out->programming->min_clocks.dcn4x.dispclk_khz, &in_out->programming->min_clocks.dcn4x.dpprefclk_khz, &in_out->programming->min_clocks.dcn4x.dtbrefclk_khz);
+	} else {
+		add_margin_and_round_to_dfs_grainularity(dispclk_khz, 0.0,
+			(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dispclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dispclk_did);
+
+		add_margin_and_round_to_dfs_grainularity(in_out->programming->min_clocks.dcn4x.dpprefclk_khz, 0.0,
+			(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dpprefclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dpprefclk_did);
+
+		add_margin_and_round_to_dfs_grainularity(in_out->programming->min_clocks.dcn4x.dtbrefclk_khz, 0.0,
+			(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dtbrefclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dtbrefclk_did);
+	}
 
-	add_margin_and_round_to_dfs_grainularity(in_out->programming->min_clocks.dcn4x.dtbrefclk_khz, in_out->soc_bb->dcn_downspread_percent / 100.0,
-		(unsigned long)(in_out->soc_bb->dispclk_dppclk_vco_speed_mhz * 1000), &in_out->programming->min_clocks.dcn4x.dtbrefclk_khz, &in_out->programming->min_clocks.dcn4x.divider_ids.dtbrefclk_did);
+
+	for (i = 0; i < DML2_MAX_DCN_PIPES; i++) {
+		in_out->programming->plane_programming[i].min_clocks.dcn4x.dppclk_khz = (unsigned long)(in_out->programming->min_clocks.dcn4x.dpprefclk_khz / 255.0
+			* math_ceil2(in_out->display_cfg->mode_support_result.per_plane[i].dppclk_khz * (1.0 + in_out->soc_bb->dcn_downspread_percent / 100.0) * 255.0 / in_out->programming->min_clocks.dcn4x.dpprefclk_khz, 1.0));
+	}
 
 	in_out->programming->min_clocks.dcn4x.deepsleep_dcfclk_khz = mode_support_result->global.dcfclk_deepsleep_khz;
 	in_out->programming->min_clocks.dcn4x.socclk_khz = mode_support_result->global.socclk_khz;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
index dfd01440737d..3861bc6c9621 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
@@ -20,7 +20,7 @@ bool dml2_dpmm_create(enum dml2_project_id project_id, struct dml2_dpmm_instance
 {
 	bool result = false;
 
-	if (!out)
+	if (out == 0)
 		return false;
 
 	memset(out, 0, sizeof(struct dml2_dpmm_instance));
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
index 68b333b68933..30767f330fd4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
@@ -718,7 +718,7 @@ bool pmo_dcn4_fams2_init_for_vmin(struct dml2_pmo_init_for_vmin_in_out *in_out)
 	const struct dml2_core_mode_support_result *mode_support_result =
 			&in_out->base_display_config->mode_support_result;
 	struct dml2_optimization_stage4_state *state =
-			&in_out->base_display_config->stage4;
+				&in_out->base_display_config->stage4;
 
 	if (in_out->instance->options->disable_dyn_odm ||
 			(in_out->instance->options->disable_dyn_odm_for_multi_stream && display_config->num_streams > 1))
@@ -1444,7 +1444,7 @@ static bool stream_matches_drr_policy(struct dml2_pmo_instance *pmo,
 		/* DRR variable strategies are disallowed due to settings or policy */
 		strategy_matches_drr_requirements = false;
 	} else if (is_bit_set_in_bitfield(PMO_DRR_CLAMPED_STRATEGY_MASK, stream_pstate_method) &&
-			(pmo->options->disable_drr_clamped ||
+		(pmo->options->disable_drr_clamped ||
 			(!stream_descriptor->timing.drr_config.enabled ||
 			(!stream_descriptor->timing.drr_config.drr_active_fixed && !stream_descriptor->timing.drr_config.drr_active_variable)) ||
 			(pmo->options->disable_drr_clamped_when_var_active &&
@@ -1910,7 +1910,8 @@ static void setup_planes_for_vblank_by_mask(struct display_configuation_with_met
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
 			plane = &display_config->display_config.plane_descriptors[plane_index];
 
-			plane->overrides.reserved_vblank_time_ns = (long)(pmo->soc_bb->power_management_parameters.dram_clk_change_blackout_us * 1000);
+			plane->overrides.reserved_vblank_time_ns = (long)math_max2(pmo->soc_bb->power_management_parameters.dram_clk_change_blackout_us * 1000.0,
+					plane->overrides.reserved_vblank_time_ns);
 
 			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_vblank;
 
@@ -2196,15 +2197,15 @@ bool pmo_dcn4_fams2_test_for_stutter(struct dml2_pmo_test_for_stutter_in_out *in
 
 	unsigned int i;
 
-	for (i = 0; i < in_out->base_display_config->display_config.num_streams; i++) {
+	for (i = 0; i < in_out->base_display_config->display_config.num_planes; i++) {
 		if (pmo->soc_bb->power_management_parameters.z8_stutter_exit_latency_us > 0 &&
 			pmo->scratch.pmo_dcn4.z8_vblank_optimizable &&
-			in_out->base_display_config->display_config.stream_descriptors[i].overrides.minimum_vblank_idle_requirement_us < (int)pmo->soc_bb->power_management_parameters.z8_stutter_exit_latency_us) {
+			in_out->base_display_config->display_config.plane_descriptors[i].overrides.reserved_vblank_time_ns < (int)pmo->soc_bb->power_management_parameters.z8_stutter_exit_latency_us * 1000) {
 			success = false;
 			break;
 		}
 		if (pmo->soc_bb->power_management_parameters.stutter_enter_plus_exit_latency_us > 0 &&
-			in_out->base_display_config->display_config.stream_descriptors[i].overrides.minimum_vblank_idle_requirement_us < (int)pmo->soc_bb->power_management_parameters.stutter_enter_plus_exit_latency_us) {
+			in_out->base_display_config->display_config.plane_descriptors[i].overrides.reserved_vblank_time_ns < (int)pmo->soc_bb->power_management_parameters.stutter_enter_plus_exit_latency_us * 1000) {
 			success = false;
 			break;
 		}
@@ -2223,8 +2224,11 @@ bool pmo_dcn4_fams2_optimize_for_stutter(struct dml2_pmo_optimize_for_stutter_in
 
 	if (!in_out->last_candidate_failed) {
 		if (pmo->scratch.pmo_dcn4.cur_stutter_candidate < pmo->scratch.pmo_dcn4.num_stutter_candidates) {
-			for (i = 0; i < in_out->optimized_display_config->display_config.num_streams; i++) {
-				in_out->optimized_display_config->display_config.stream_descriptors[i].overrides.minimum_vblank_idle_requirement_us = pmo->scratch.pmo_dcn4.optimal_vblank_reserved_time_for_stutter_us[pmo->scratch.pmo_dcn4.cur_stutter_candidate];
+			for (i = 0; i < in_out->optimized_display_config->display_config.num_planes; i++) {
+				/* take the max of the current and the optimal reserved time */
+				in_out->optimized_display_config->display_config.plane_descriptors[i].overrides.reserved_vblank_time_ns =
+						(long)math_max2(pmo->scratch.pmo_dcn4.optimal_vblank_reserved_time_for_stutter_us[pmo->scratch.pmo_dcn4.cur_stutter_candidate] * 1000,
+						in_out->optimized_display_config->display_config.plane_descriptors[i].overrides.reserved_vblank_time_ns);
 			}
 
 			success = true;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
index 95f716e2641f..add51d41a515 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
@@ -26,7 +26,7 @@ bool dml2_pmo_create(enum dml2_project_id project_id, struct dml2_pmo_instance *
 {
 	bool result = false;
 
-	if (!out)
+	if (out == 0)
 		return false;
 
 	memset(out, 0, sizeof(struct dml2_pmo_instance));
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E408A69711
	for <lists+amd-gfx@lfdr.de>; Wed, 19 Mar 2025 18:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962A310E278;
	Wed, 19 Mar 2025 17:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pCFdKfMX";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C92D10E2D0
 for <amd-gfx@lists.freedesktop.org>; Wed, 19 Mar 2025 17:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMRxhrqj0BHydjK+DNWnixCSWXLvZrgLJOKseKiBv5DKAlU8OFL/yxkY93tM1KDMQsUCkrAjrDcV1d60DqCTF1DkUL/Dl275YlS7SW1Sz6fxXC5/+KDRZlflWycsUlQ7laeAHQqjRuk0KbiB1Jqs3Rs8EvARVnxvs3bLiaU38VcBnwsMTkUkHhianDB5WLsNxlE7p39Db2M1QD4P6bdZHnTAd4NlVTEXNGeuwLEdznxF8DgeaQKkVHVRBvV44D7UdHsSg8MS6ymXrilTu0evVWAkrWV/LHlX4jZiaf/lzXUWFcp+5YO0Vhylg6g2/4JNEZa/HCInAZBq5C4wmw4qXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO4kS8XBrAhIXHJtZ43k61I3BwWa2L0ksCr4ki5WZM8=;
 b=fnabO6lBBBX90GjqCf7lXhaEhj+FF3yzCBvOmnXI5VeFG8qSiZIcz/M3osjWgGrJ2kQsCjNYwuOM7KAP+3+s9QH2nwFhcyh40Vx9eK192tKJ+DajY8djz33MZJIFFi6/iAatkQlOLtP98lMcesAYTZqjPfMx2ViVqWR0KwxCWc061MZ7NzG4z6BPChFMv7n1o1PEBwSynSk+W7VolPTaR7uwzs43sj30DYEPP7CDuPsMQKaDA+CgJ37uuW4nqB/LLDJh3mjwVFCln+hk5kmbPoXEjVhPsnfzsdNoMMMnwqKdBLO+39EFn7TMVaV0vT4n3bDssL7MLxqLCcaskh0wQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO4kS8XBrAhIXHJtZ43k61I3BwWa2L0ksCr4ki5WZM8=;
 b=pCFdKfMXQa3H6zMcOSwRiSNPRkvC/d43R5NUNf5FTpuFk983+9dR6OzApq4+LAA4gxQayeHsrGVnjXHPVuPK6HI+rxQu+kCHmofWd7oyZ8+ql55DbTUtAKtftFXKbB/mUPeYSXMLDvr9eBis+c9k/ruqKvbNHQg1H5ldyGoG5nA=
Received: from CH0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:610:76::30)
 by CH1PPF93AB4E694.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::61b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 17:57:24 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::37) by CH0PR04CA0025.outlook.office365.com
 (2603:10b6:610:76::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Wed,
 19 Mar 2025 17:57:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 19 Mar 2025 17:57:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 12:57:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Mar
 2025 12:57:23 -0500
Received: from aaurabin-z5-cachy.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 19 Mar 2025 12:57:22 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, "Fangzhi
 Zuo" <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>, Solomon Chiu
 <solomon.chiu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Alex Hung
 <alex.hung@amd.com>, Austin Zheng <Austin.Zheng@amd.com>, Dillon Varone
 <dillon.varone@amd.com>
Subject: [PATCH 06/16] drm/amd/display: DML21 Reintegration
Date: Wed, 19 Mar 2025 13:55:11 -0400
Message-ID: <20250319175718.2578234-7-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319175718.2578234-1-aurabindo.pillai@amd.com>
References: <20250319175718.2578234-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: aurabindo.pillai@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CH1PPF93AB4E694:EE_
X-MS-Office365-Filtering-Correlation-Id: 48b9d337-b8d9-4e7b-994f-08dd670f8156
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|30052699003|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Rlf7qQl/75kiHbcstRrjilzGIzK1FzKoHVqjUBIfvqtPhLYTKfuGGNKC+rWP?=
 =?us-ascii?Q?+oWTMvg2tFFRNGFwAj+793TS3YlBVbkgYr017iOxcvfFbNAo3TuLEiEERv5v?=
 =?us-ascii?Q?T8fgbohZTKZXrMxTDYJx5nLMADvRNp/0MoWxKGqBnZn5Evf3wrfTygIqOuZq?=
 =?us-ascii?Q?PzGnfGT9sFYFWneWniNJzuAJHNYUa+tBZKfhKoymRgocII2s+5bM+Ufr8UI9?=
 =?us-ascii?Q?ZefaUVR4MrnGqxJFauWx8xMJ9dfnMnKqSRsTr4O7IxmK14UARVLg80f5FB2g?=
 =?us-ascii?Q?sJROB8ZrovSwl7cCm3jIkUmL38S46OkYAqO0Ordm1xKSLkeWsvKzBiUrvzy6?=
 =?us-ascii?Q?4cJ2/6yx1s5344tylwCdysfz44UItyuE9y+mLzBB7N+JOGNE4mLM5pAsZgSP?=
 =?us-ascii?Q?oiV94vmeBXq7IJZvEITqg8SuqTBbFANT2A46NyqnJwsXTKL0YUPW9WfTNpsE?=
 =?us-ascii?Q?qH/8rkjDQUCy3acn85zugFlf3dvcjijFGltn1CmdGWKgSOu4jyC1kIv52OBw?=
 =?us-ascii?Q?kChImy/GHejJRvMj7F13lXq4o0cOtMu7Hock1epa+Pi8LyIdHBewDMUWVvkC?=
 =?us-ascii?Q?UEvARba6ThFbSzZVcP6iadLYuli2Jq7X/3HvwnBzpG5ibXDVgHd2BRTB8z2L?=
 =?us-ascii?Q?OsdzWc/xj1jUwOp0UYCHqnOheOdWx7aB1Z5Kw1fcU/sIR8BjJM/fonbZxUxx?=
 =?us-ascii?Q?LmqnmxU4JHpURxhrvjQU7cUha0PlsjbynXF+7uNbbSxVZgQubI2ChU/n0MXk?=
 =?us-ascii?Q?BRD9DWN91JTz5uLnMWmvkjnk9+NpKC5Tz9hopIcII5t/mNJgopOSf+3zeWNG?=
 =?us-ascii?Q?NeNJouHQfUV+EJOUpWyE6gCL6z37v4b0LXSiSe/f9JNmJ98bl71RS+4zwad4?=
 =?us-ascii?Q?4Odnd6V9FkiGBGDbp/dbwXrtpSMn/6tLceAcK6CJC0uqU7UO0Kf4iE+t4Mzq?=
 =?us-ascii?Q?m76B/M9pmN0ep5UkOhoa3ePXLrpRJKcbOCqqiuAG889VyFrUq9OZsWZWnWMX?=
 =?us-ascii?Q?S418Nao4+ORmZqUyEY/5HR9RiHcU2YWw0ngFkYc8X94/vbjQ79lVfa7pXTqT?=
 =?us-ascii?Q?vZilqhJaJznxfQjTAnOrMd4rma+K1Y8udNcFv+SF8oCeo2Iisex+xGxBcBfS?=
 =?us-ascii?Q?nT6CMPB1gaikkT3rQEjcqXQ1PF1OXfBRuRNuCBUiUhT6ZFBqAUVnbonlaogV?=
 =?us-ascii?Q?NT8IDWwCB855cwGVOR65RnK7T9GD6ivUAxy1cDeoJB9yvhz4gzgsnFQS75wk?=
 =?us-ascii?Q?3IRnf0EdGCT4tOYn+/XOp+ETdYLuY6wpwarNmg2jmH86SnySKeGxBy/i1/gV?=
 =?us-ascii?Q?eQawO5Cwu5p3igCxzCCgGR/fwHmYA5VS//jRY/h9JZGfgvDpGB5yt6OqdRcP?=
 =?us-ascii?Q?RGbKHwsiq6KhXGtQZ8pty4xG5UTY7frwVV8mvBvcjBB5NO64VwdM/eY07LMS?=
 =?us-ascii?Q?Q0WZqVEn5n9ZtG+auJ9dgya6nyJXeFr25WVKRJGLjk3Qp+6BppExTXONwJ/m?=
 =?us-ascii?Q?GeTyud7unr9QROE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(30052699003)(36860700013)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 17:57:24.7803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48b9d337-b8d9-4e7b-994f-08dd670f8156
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF93AB4E694
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

[Why]
To bring in latest changes in DML21

[List of Changes]
- Unification of DML logging to use DML_LOG_* macro
- Clean up variables that are exclusively used for logging

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  |    3 -
 .../amd/display/dc/dml2/dml21/inc/dml_top.h   |    1 +
 .../dml2/dml21/inc/dml_top_dchub_registers.h  |    2 +
 .../dml21/inc/dml_top_display_cfg_types.h     |    3 +-
 .../dml2/dml21/src/dml2_core/dml2_core_dcn4.c |   10 +-
 .../src/dml2_core/dml2_core_dcn4_calcs.c      | 3083 ++++++++---------
 .../src/dml2_core/dml2_core_shared_types.h    |    2 +
 .../dml21/src/dml2_core/dml2_core_utils.c     |  134 +-
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c |    4 +
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |    8 +-
 .../dml2/dml21/src/dml2_top/dml2_top_soc15.c  |    2 +-
 .../dc/dml2/dml21/src/inc/dml2_debug.c        |   31 -
 .../dc/dml2/dml21/src/inc/dml2_debug.h        |   77 +-
 13 files changed, 1633 insertions(+), 1727 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 21fd466dba26..157ecf008d6c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -99,7 +99,6 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_standalone_libraries/lib_float_math.
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml21_wrapper.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/dml21_translation_helper.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/dml21_utils.o := $(dml2_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/inc/dml2_debug.o := $(dml2_ccflags)
 
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.o := $(dml2_rcflags)
@@ -117,11 +116,9 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_standalone_libraries/lib_floa
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml21_wrapper.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/dml21_translation_helper.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/dml21_utils.o := $(dml2_rcflags)
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/inc/dml2_debug.o := $(dml2_rcflags)
 
 DML21 := src/dml2_top/dml2_top_interfaces.o
 DML21 += src/dml2_top/dml2_top_soc15.o
-DML21 += src/inc/dml2_debug.o
 DML21 += src/dml2_core/dml2_core_dcn4.o
 DML21 += src/dml2_core/dml2_core_factory.o
 DML21 += src/dml2_core/dml2_core_dcn4_calcs.o
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h
index a64ec4dcf11a..c047d56527c4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top.h
@@ -43,4 +43,5 @@ bool dml2_build_mode_programming(struct dml2_build_mode_programming_in_out *in_o
  */
 bool dml2_build_mcache_programming(struct dml2_build_mcache_programming_in_out *in_out);
 
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h
index 25b607e7b726..84c90050668c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_dchub_registers.h
@@ -156,6 +156,8 @@ struct dml2_dchub_watermark_regs {
 	uint32_t urgent;
 	uint32_t sr_enter;
 	uint32_t sr_exit;
+	uint32_t sr_enter_z8;
+	uint32_t sr_exit_z8;
 	uint32_t uclk_pstate;
 	uint32_t fclk_pstate;
 	uint32_t temp_read_or_ppt;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
index 5e1ab6d97640..255f05de362c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
@@ -166,7 +166,7 @@ struct dml2_surface_cfg {
 	enum dml2_swizzle_mode tiling;
 
 	struct {
-		unsigned long pitch;
+		unsigned long pitch; // In elements, two pixels per element in 422 packed format
 		unsigned long width;
 		unsigned long height;
 	} plane0;
@@ -385,6 +385,7 @@ struct dml2_plane_parameters {
 		long reserved_vblank_time_ns;
 		unsigned int max_vactive_det_fill_delay_us; // 0 = no reserved time, +ve = explicit max delay
 		unsigned int gpuvm_min_page_size_kbytes;
+		unsigned int hostvm_min_page_size_kbytes;
 
 		enum dml2_svp_mode_override legacy_svp_config; //TODO remove in favor of svp_config
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
index bb863c8c6b39..6ee37386f672 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
@@ -456,10 +456,10 @@ bool core_dcn4_mode_support(struct dml2_core_mode_support_in_out *in_out)
 		in_out->mode_support_result.global.active.urgent_bw_dram_kbps = (unsigned long)math_ceil2((l->mode_support_ex_params.out_evaluation_info->urg_bandwidth_required_flip[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_dram] * 1000), 1.0);
 		in_out->mode_support_result.global.svp_prefetch.average_bw_dram_kbps = (unsigned long)math_ceil2((l->mode_support_ex_params.out_evaluation_info->avg_bandwidth_required[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_dram] * 1000), 1.0);
 		in_out->mode_support_result.global.svp_prefetch.urgent_bw_dram_kbps = (unsigned long)math_ceil2((l->mode_support_ex_params.out_evaluation_info->urg_bandwidth_required_flip[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_dram] * 1000), 1.0);
-		dml2_printf("DML::%s: in_out->mode_support_result.global.active.urgent_bw_sdp_kbps = %ld\n", __func__, in_out->mode_support_result.global.active.urgent_bw_sdp_kbps);
-		dml2_printf("DML::%s: in_out->mode_support_result.global.svp_prefetch.urgent_bw_sdp_kbps = %ld\n", __func__, in_out->mode_support_result.global.svp_prefetch.urgent_bw_sdp_kbps);
-		dml2_printf("DML::%s: in_out->mode_support_result.global.active.urgent_bw_dram_kbps = %ld\n", __func__, in_out->mode_support_result.global.active.urgent_bw_dram_kbps);
-		dml2_printf("DML::%s: in_out->mode_support_result.global.svp_prefetch.urgent_bw_dram_kbps = %ld\n", __func__, in_out->mode_support_result.global.svp_prefetch.urgent_bw_dram_kbps);
+		DML_LOG_VERBOSE("DML::%s: in_out->mode_support_result.global.active.urgent_bw_sdp_kbps = %ld\n", __func__, in_out->mode_support_result.global.active.urgent_bw_sdp_kbps);
+		DML_LOG_VERBOSE("DML::%s: in_out->mode_support_result.global.svp_prefetch.urgent_bw_sdp_kbps = %ld\n", __func__, in_out->mode_support_result.global.svp_prefetch.urgent_bw_sdp_kbps);
+		DML_LOG_VERBOSE("DML::%s: in_out->mode_support_result.global.active.urgent_bw_dram_kbps = %ld\n", __func__, in_out->mode_support_result.global.active.urgent_bw_dram_kbps);
+		DML_LOG_VERBOSE("DML::%s: in_out->mode_support_result.global.svp_prefetch.urgent_bw_dram_kbps = %ld\n", __func__, in_out->mode_support_result.global.svp_prefetch.urgent_bw_dram_kbps);
 
 		for (i = 0; i < l->svp_expanded_display_cfg.num_planes; i++) {
 			in_out->mode_support_result.per_plane[i].dppclk_khz = (unsigned int)(core->clean_me_up.mode_lib.ms.RequiredDPPCLK[i] * 1000);
@@ -509,7 +509,7 @@ bool core_dcn4_mode_support(struct dml2_core_mode_support_in_out *in_out)
 			stream_index = l->svp_expanded_display_cfg.plane_descriptors[i].stream_index;
 
 			in_out->mode_support_result.per_stream[stream_index].dscclk_khz = (unsigned int)core->clean_me_up.mode_lib.ms.required_dscclk_freq_mhz[i] * 1000;
-			dml2_printf("CORE_DCN4::%s: i=%d stream_index=%d, in_out->mode_support_result.per_stream[stream_index].dscclk_khz = %u\n", __func__, i, stream_index, in_out->mode_support_result.per_stream[stream_index].dscclk_khz);
+			DML_LOG_VERBOSE("CORE_DCN4::%s: i=%d stream_index=%d, in_out->mode_support_result.per_stream[stream_index].dscclk_khz = %u\n", __func__, i, stream_index, in_out->mode_support_result.per_stream[stream_index].dscclk_khz);
 
 			if (!((stream_bitmask >> stream_index) & 0x1)) {
 				in_out->mode_support_result.cfg_support_info.stream_support_info[stream_index].odms_used = odm_count;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 4c504cb0e1c5..5d91f195397a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -54,104 +54,104 @@ static double dml2_core_div_rem(double dividend, unsigned int divisor, unsigned
 
 static void dml2_print_mode_support_info(const struct dml2_core_internal_mode_support_info *support, bool fail_only)
 {
-	dml2_printf("DML: ===================================== \n");
-	dml2_printf("DML: DML_MODE_SUPPORT_INFO_ST\n");
+	DML_LOG_VERBOSE("DML: ===================================== \n");
+	DML_LOG_VERBOSE("DML: DML_MODE_SUPPORT_INFO_ST\n");
 	if (!fail_only || support->ScaleRatioAndTapsSupport == 0)
-		dml2_printf("DML: support: ScaleRatioAndTapsSupport = %d\n", support->ScaleRatioAndTapsSupport);
+		DML_LOG_VERBOSE("DML: support: ScaleRatioAndTapsSupport = %d\n", support->ScaleRatioAndTapsSupport);
 	if (!fail_only || support->SourceFormatPixelAndScanSupport == 0)
-		dml2_printf("DML: support: SourceFormatPixelAndScanSupport = %d\n", support->SourceFormatPixelAndScanSupport);
+		DML_LOG_VERBOSE("DML: support: SourceFormatPixelAndScanSupport = %d\n", support->SourceFormatPixelAndScanSupport);
 	if (!fail_only || support->ViewportSizeSupport == 0)
-		dml2_printf("DML: support: ViewportSizeSupport = %d\n", support->ViewportSizeSupport);
+		DML_LOG_VERBOSE("DML: support: ViewportSizeSupport = %d\n", support->ViewportSizeSupport);
 	if (!fail_only || support->LinkRateDoesNotMatchDPVersion == 1)
-		dml2_printf("DML: support: LinkRateDoesNotMatchDPVersion = %d\n", support->LinkRateDoesNotMatchDPVersion);
+		DML_LOG_VERBOSE("DML: support: LinkRateDoesNotMatchDPVersion = %d\n", support->LinkRateDoesNotMatchDPVersion);
 	if (!fail_only || support->LinkRateForMultistreamNotIndicated == 1)
-		dml2_printf("DML: support: LinkRateForMultistreamNotIndicated = %d\n", support->LinkRateForMultistreamNotIndicated);
+		DML_LOG_VERBOSE("DML: support: LinkRateForMultistreamNotIndicated = %d\n", support->LinkRateForMultistreamNotIndicated);
 	if (!fail_only || support->BPPForMultistreamNotIndicated == 1)
-		dml2_printf("DML: support: BPPForMultistreamNotIndicated = %d\n", support->BPPForMultistreamNotIndicated);
+		DML_LOG_VERBOSE("DML: support: BPPForMultistreamNotIndicated = %d\n", support->BPPForMultistreamNotIndicated);
 	if (!fail_only || support->MultistreamWithHDMIOreDP == 1)
-		dml2_printf("DML: support: MultistreamWithHDMIOreDP = %d\n", support->MultistreamWithHDMIOreDP);
+		DML_LOG_VERBOSE("DML: support: MultistreamWithHDMIOreDP = %d\n", support->MultistreamWithHDMIOreDP);
 	if (!fail_only || support->ExceededMultistreamSlots == 1)
-		dml2_printf("DML: support: ExceededMultistreamSlots = %d\n", support->ExceededMultistreamSlots);
+		DML_LOG_VERBOSE("DML: support: ExceededMultistreamSlots = %d\n", support->ExceededMultistreamSlots);
 	if (!fail_only || support->MSOOrODMSplitWithNonDPLink == 1)
-		dml2_printf("DML: support: MSOOrODMSplitWithNonDPLink = %d\n", support->MSOOrODMSplitWithNonDPLink);
+		DML_LOG_VERBOSE("DML: support: MSOOrODMSplitWithNonDPLink = %d\n", support->MSOOrODMSplitWithNonDPLink);
 	if (!fail_only || support->NotEnoughLanesForMSO == 1)
-		dml2_printf("DML: support: NotEnoughLanesForMSO = %d\n", support->NotEnoughLanesForMSO);
+		DML_LOG_VERBOSE("DML: support: NotEnoughLanesForMSO = %d\n", support->NotEnoughLanesForMSO);
 	if (!fail_only || support->P2IWith420 == 1)
-		dml2_printf("DML: support: P2IWith420 = %d\n", support->P2IWith420);
+		DML_LOG_VERBOSE("DML: support: P2IWith420 = %d\n", support->P2IWith420);
 	if (!fail_only || support->DSC422NativeNotSupported == 1)
-		dml2_printf("DML: support: DSC422NativeNotSupported = %d\n", support->DSC422NativeNotSupported);
+		DML_LOG_VERBOSE("DML: support: DSC422NativeNotSupported = %d\n", support->DSC422NativeNotSupported);
 	if (!fail_only || support->DSCSlicesODMModeSupported == 0)
-		dml2_printf("DML: support: DSCSlicesODMModeSupported = %d\n", support->DSCSlicesODMModeSupported);
+		DML_LOG_VERBOSE("DML: support: DSCSlicesODMModeSupported = %d\n", support->DSCSlicesODMModeSupported);
 	if (!fail_only || support->NotEnoughDSCUnits == 1)
-		dml2_printf("DML: support: NotEnoughDSCUnits = %d\n", support->NotEnoughDSCUnits);
+		DML_LOG_VERBOSE("DML: support: NotEnoughDSCUnits = %d\n", support->NotEnoughDSCUnits);
 	if (!fail_only || support->NotEnoughDSCSlices == 1)
-		dml2_printf("DML: support: NotEnoughDSCSlices = %d\n", support->NotEnoughDSCSlices);
+		DML_LOG_VERBOSE("DML: support: NotEnoughDSCSlices = %d\n", support->NotEnoughDSCSlices);
 	if (!fail_only || support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe == 1)
-		dml2_printf("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = %d\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
+		DML_LOG_VERBOSE("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = %d\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
 	if (!fail_only || support->InvalidCombinationOfMALLUseForPStateAndStaticScreen == 1)
-		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = %d\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
+		DML_LOG_VERBOSE("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = %d\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
 	if (!fail_only || support->DSCCLKRequiredMoreThanSupported == 1)
-		dml2_printf("DML: support: DSCCLKRequiredMoreThanSupported = %d\n", support->DSCCLKRequiredMoreThanSupported);
+		DML_LOG_VERBOSE("DML: support: DSCCLKRequiredMoreThanSupported = %d\n", support->DSCCLKRequiredMoreThanSupported);
 	if (!fail_only || support->PixelsPerLinePerDSCUnitSupport == 0)
-		dml2_printf("DML: support: PixelsPerLinePerDSCUnitSupport = %d\n", support->PixelsPerLinePerDSCUnitSupport);
+		DML_LOG_VERBOSE("DML: support: PixelsPerLinePerDSCUnitSupport = %d\n", support->PixelsPerLinePerDSCUnitSupport);
 	if (!fail_only || support->DTBCLKRequiredMoreThanSupported == 1)
-		dml2_printf("DML: support: DTBCLKRequiredMoreThanSupported = %d\n", support->DTBCLKRequiredMoreThanSupported);
+		DML_LOG_VERBOSE("DML: support: DTBCLKRequiredMoreThanSupported = %d\n", support->DTBCLKRequiredMoreThanSupported);
 	if (!fail_only || support->InvalidCombinationOfMALLUseForPState == 1)
-		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPState = %d\n", support->InvalidCombinationOfMALLUseForPState);
+		DML_LOG_VERBOSE("DML: support: InvalidCombinationOfMALLUseForPState = %d\n", support->InvalidCombinationOfMALLUseForPState);
 	if (!fail_only || support->ROBSupport == 0)
-		dml2_printf("DML: support: ROBSupport = %d\n", support->ROBSupport);
+		DML_LOG_VERBOSE("DML: support: ROBSupport = %d\n", support->ROBSupport);
 	if (!fail_only || support->OutstandingRequestsSupport == 0)
-		dml2_printf("DML: support: OutstandingRequestsSupport = %d\n", support->OutstandingRequestsSupport);
+		DML_LOG_VERBOSE("DML: support: OutstandingRequestsSupport = %d\n", support->OutstandingRequestsSupport);
 	if (!fail_only || support->OutstandingRequestsUrgencyAvoidance == 0)
-		dml2_printf("DML: support: OutstandingRequestsUrgencyAvoidance = %d\n", support->OutstandingRequestsUrgencyAvoidance);
+		DML_LOG_VERBOSE("DML: support: OutstandingRequestsUrgencyAvoidance = %d\n", support->OutstandingRequestsUrgencyAvoidance);
 	if (!fail_only || support->DISPCLK_DPPCLK_Support == 0)
-		dml2_printf("DML: support: DISPCLK_DPPCLK_Support = %d\n", support->DISPCLK_DPPCLK_Support);
+		DML_LOG_VERBOSE("DML: support: DISPCLK_DPPCLK_Support = %d\n", support->DISPCLK_DPPCLK_Support);
 	if (!fail_only || support->TotalAvailablePipesSupport == 0)
-		dml2_printf("DML: support: TotalAvailablePipesSupport = %d\n", support->TotalAvailablePipesSupport);
+		DML_LOG_VERBOSE("DML: support: TotalAvailablePipesSupport = %d\n", support->TotalAvailablePipesSupport);
 	if (!fail_only || support->NumberOfOTGSupport == 0)
-		dml2_printf("DML: support: NumberOfOTGSupport = %d\n", support->NumberOfOTGSupport);
+		DML_LOG_VERBOSE("DML: support: NumberOfOTGSupport = %d\n", support->NumberOfOTGSupport);
 	if (!fail_only || support->NumberOfHDMIFRLSupport == 0)
-		dml2_printf("DML: support: NumberOfHDMIFRLSupport = %d\n", support->NumberOfHDMIFRLSupport);
+		DML_LOG_VERBOSE("DML: support: NumberOfHDMIFRLSupport = %d\n", support->NumberOfHDMIFRLSupport);
 	if (!fail_only || support->NumberOfDP2p0Support == 0)
-		dml2_printf("DML: support: NumberOfDP2p0Support = %d\n", support->NumberOfDP2p0Support);
+		DML_LOG_VERBOSE("DML: support: NumberOfDP2p0Support = %d\n", support->NumberOfDP2p0Support);
 	if (!fail_only || support->EnoughWritebackUnits == 0)
-		dml2_printf("DML: support: EnoughWritebackUnits = %d\n", support->EnoughWritebackUnits);
+		DML_LOG_VERBOSE("DML: support: EnoughWritebackUnits = %d\n", support->EnoughWritebackUnits);
 	if (!fail_only || support->WritebackScaleRatioAndTapsSupport == 0)
-		dml2_printf("DML: support: WritebackScaleRatioAndTapsSupport = %d\n", support->WritebackScaleRatioAndTapsSupport);
+		DML_LOG_VERBOSE("DML: support: WritebackScaleRatioAndTapsSupport = %d\n", support->WritebackScaleRatioAndTapsSupport);
 	if (!fail_only || support->WritebackLatencySupport == 0)
-		dml2_printf("DML: support: WritebackLatencySupport = %d\n", support->WritebackLatencySupport);
+		DML_LOG_VERBOSE("DML: support: WritebackLatencySupport = %d\n", support->WritebackLatencySupport);
 	if (!fail_only || support->CursorSupport == 0)
-		dml2_printf("DML: support: CursorSupport = %d\n", support->CursorSupport);
+		DML_LOG_VERBOSE("DML: support: CursorSupport = %d\n", support->CursorSupport);
 	if (!fail_only || support->PitchSupport == 0)
-		dml2_printf("DML: support: PitchSupport = %d\n", support->PitchSupport);
+		DML_LOG_VERBOSE("DML: support: PitchSupport = %d\n", support->PitchSupport);
 	if (!fail_only || support->ViewportExceedsSurface == 1)
-		dml2_printf("DML: support: ViewportExceedsSurface = %d\n", support->ViewportExceedsSurface);
+		DML_LOG_VERBOSE("DML: support: ViewportExceedsSurface = %d\n", support->ViewportExceedsSurface);
 	if (!fail_only || support->PrefetchSupported == 0)
-		dml2_printf("DML: support: PrefetchSupported = %d\n", support->PrefetchSupported);
+		DML_LOG_VERBOSE("DML: support: PrefetchSupported = %d\n", support->PrefetchSupported);
 	if (!fail_only || support->EnoughUrgentLatencyHidingSupport == 0)
-		dml2_printf("DML: support: EnoughUrgentLatencyHidingSupport = %d\n", support->EnoughUrgentLatencyHidingSupport);
+		DML_LOG_VERBOSE("DML: support: EnoughUrgentLatencyHidingSupport = %d\n", support->EnoughUrgentLatencyHidingSupport);
 	if (!fail_only || support->AvgBandwidthSupport == 0)
-		dml2_printf("DML: support: AvgBandwidthSupport = %d\n", support->AvgBandwidthSupport);
+		DML_LOG_VERBOSE("DML: support: AvgBandwidthSupport = %d\n", support->AvgBandwidthSupport);
 	if (!fail_only || support->DynamicMetadataSupported == 0)
-		dml2_printf("DML: support: DynamicMetadataSupported = %d\n", support->DynamicMetadataSupported);
+		DML_LOG_VERBOSE("DML: support: DynamicMetadataSupported = %d\n", support->DynamicMetadataSupported);
 	if (!fail_only || support->VRatioInPrefetchSupported == 0)
-		dml2_printf("DML: support: VRatioInPrefetchSupported = %d\n", support->VRatioInPrefetchSupported);
+		DML_LOG_VERBOSE("DML: support: VRatioInPrefetchSupported = %d\n", support->VRatioInPrefetchSupported);
 	if (!fail_only || support->PTEBufferSizeNotExceeded == 0)
-		dml2_printf("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
+		DML_LOG_VERBOSE("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
 	if (!fail_only || support->DCCMetaBufferSizeNotExceeded == 0)
-		dml2_printf("DML: support: DCCMetaBufferSizeNotExceeded = %d\n", support->DCCMetaBufferSizeNotExceeded);
+		DML_LOG_VERBOSE("DML: support: DCCMetaBufferSizeNotExceeded = %d\n", support->DCCMetaBufferSizeNotExceeded);
 	if (!fail_only || support->ExceededMALLSize == 1)
-		dml2_printf("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
+		DML_LOG_VERBOSE("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
 	if (!fail_only || support->g6_temp_read_support == 0)
-		dml2_printf("DML: support: g6_temp_read_support = %d\n", support->g6_temp_read_support);
+		DML_LOG_VERBOSE("DML: support: g6_temp_read_support = %d\n", support->g6_temp_read_support);
 	if (!fail_only || support->ImmediateFlipSupport == 0)
-		dml2_printf("DML: support: ImmediateFlipSupport = %d\n", support->ImmediateFlipSupport);
+		DML_LOG_VERBOSE("DML: support: ImmediateFlipSupport = %d\n", support->ImmediateFlipSupport);
 	if (!fail_only || support->LinkCapacitySupport == 0)
-		dml2_printf("DML: support: LinkCapacitySupport = %d\n", support->LinkCapacitySupport);
+		DML_LOG_VERBOSE("DML: support: LinkCapacitySupport = %d\n", support->LinkCapacitySupport);
 
 	if (!fail_only || support->ModeSupport == 0)
-		dml2_printf("DML: support: ModeSupport = %d\n", support->ModeSupport);
-	dml2_printf("DML: ===================================== \n");
+		DML_LOG_VERBOSE("DML: support: ModeSupport = %d\n", support->ModeSupport);
+	DML_LOG_VERBOSE("DML: ===================================== \n");
 }
 
 static void get_stream_output_bpp(double *out_bpp, const struct dml2_display_cfg *display_cfg)
@@ -179,11 +179,9 @@ static void get_stream_output_bpp(double *out_bpp, const struct dml2_display_cfg
 		} else {
 			out_bpp[k] = 0;
 		}
-#ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%d bpc=%f\n", __func__, k, bpc);
-		dml2_printf("DML::%s: k=%d dsc.enable=%d\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable);
-		dml2_printf("DML::%s: k=%d out_bpp=%f\n", __func__, k, out_bpp[k]);
-#endif
+		DML_LOG_VERBOSE("DML::%s: k=%d bpc=%f\n", __func__, k, bpc);
+		DML_LOG_VERBOSE("DML::%s: k=%d dsc.enable=%d\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable);
+		DML_LOG_VERBOSE("DML::%s: k=%d out_bpp=%f\n", __func__, k, out_bpp[k]);
 	}
 }
 
@@ -212,9 +210,7 @@ static unsigned int dml_get_num_active_pipes(int unsigned num_planes, const stru
 		num_active_pipes = num_active_pipes + (unsigned int)cfg_support_info->plane_support_info[k].dpps_used;
 	}
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: num_active_pipes = %d\n", __func__, num_active_pipes);
-#endif
+	DML_LOG_VERBOSE("DML::%s: num_active_pipes = %d\n", __func__, num_active_pipes);
 	return num_active_pipes;
 }
 
@@ -251,7 +247,7 @@ static bool dml_get_is_phantom_pipe(const struct dml2_display_cfg *display_cfg,
 	unsigned int plane_idx = mode_lib->mp.pipe_plane[pipe_idx];
 
 	bool is_phantom = dml_is_phantom_pipe(&display_cfg->plane_descriptors[plane_idx]);
-	dml2_printf("DML::%s: pipe_idx=%d legacy_svp_config=%0d is_phantom=%d\n", __func__, pipe_idx, display_cfg->plane_descriptors[plane_idx].overrides.legacy_svp_config, is_phantom);
+	DML_LOG_VERBOSE("DML::%s: pipe_idx=%d legacy_svp_config=%0d is_phantom=%d\n", __func__, pipe_idx, display_cfg->plane_descriptors[plane_idx].overrides.legacy_svp_config, is_phantom);
 	return is_phantom;
 }
 
@@ -415,19 +411,17 @@ static void CalculateMaxDETAndMinCompressedBufferSize(
 	*nomDETInKByte = (unsigned int)(math_floor2((double)*MaxTotalDETInKByte / (double)MaxNumDPP, ConfigReturnBufferSegmentSizeInKByte));
 	*MinCompressedBufferSizeInKByte = ConfigReturnBufferSizeInKByte - *MaxTotalDETInKByte;
 
-#if defined(__DML_VBA_DEBUG__)
-	dml2_printf("DML::%s: is_mrq_present = %u\n", __func__, is_mrq_present);
-	dml2_printf("DML::%s: ConfigReturnBufferSizeInKByte = %u\n", __func__, ConfigReturnBufferSizeInKByte);
-	dml2_printf("DML::%s: ROBBufferSizeInKByte = %u\n", __func__, ROBBufferSizeInKByte);
-	dml2_printf("DML::%s: MaxNumDPP = %u\n", __func__, MaxNumDPP);
-	dml2_printf("DML::%s: MaxTotalDETInKByte = %u\n", __func__, *MaxTotalDETInKByte);
-	dml2_printf("DML::%s: nomDETInKByte = %u\n", __func__, *nomDETInKByte);
-	dml2_printf("DML::%s: MinCompressedBufferSizeInKByte = %u\n", __func__, *MinCompressedBufferSizeInKByte);
-#endif
+	DML_LOG_VERBOSE("DML::%s: is_mrq_present = %u\n", __func__, is_mrq_present);
+	DML_LOG_VERBOSE("DML::%s: ConfigReturnBufferSizeInKByte = %u\n", __func__, ConfigReturnBufferSizeInKByte);
+	DML_LOG_VERBOSE("DML::%s: ROBBufferSizeInKByte = %u\n", __func__, ROBBufferSizeInKByte);
+	DML_LOG_VERBOSE("DML::%s: MaxNumDPP = %u\n", __func__, MaxNumDPP);
+	DML_LOG_VERBOSE("DML::%s: MaxTotalDETInKByte = %u\n", __func__, *MaxTotalDETInKByte);
+	DML_LOG_VERBOSE("DML::%s: nomDETInKByte = %u\n", __func__, *nomDETInKByte);
+	DML_LOG_VERBOSE("DML::%s: MinCompressedBufferSizeInKByte = %u\n", __func__, *MinCompressedBufferSizeInKByte);
 
 	if (nomDETInKByteOverrideEnable) {
 		*nomDETInKByte = nomDETInKByteOverrideValue;
-		dml2_printf("DML::%s: nomDETInKByte = %u (overrided)\n", __func__, *nomDETInKByte);
+		DML_LOG_VERBOSE("DML::%s: nomDETInKByte = %u (overrided)\n", __func__, *nomDETInKByte);
 	}
 }
 
@@ -502,7 +496,7 @@ static bool dml_is_420(enum dml2_source_format_class source_format)
 		val = 0;
 		break;
 	default:
-		DML2_ASSERT(0);
+		DML_ASSERT(0);
 		break;
 	}
 	return val;
@@ -535,7 +529,7 @@ static unsigned int dml_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode
 	else if (sw_mode == dml2_gfx11_sw_256kb_r_x)
 		return 262144;
 	else {
-		DML2_ASSERT(0);
+		DML_ASSERT(0);
 		return 256;
 	}
 }
@@ -570,8 +564,8 @@ static int unsigned dml_get_gfx_version(enum dml2_swizzle_mode sw_mode)
 		sw_mode == dml2_gfx11_sw_256kb_r_x) {
 		version = 11;
 	} else {
-		dml2_printf("ERROR: Invalid sw_mode setting! val=%u\n", sw_mode);
-		DML2_ASSERT(0);
+		DML_LOG_VERBOSE("ERROR: Invalid sw_mode setting! val=%u\n", sw_mode);
+		DML_ASSERT(0);
 	}
 
 	return version;
@@ -645,21 +639,19 @@ static void CalculateBytePerPixelAndBlockSizes(
 		*BytePerPixelY = 2;
 		*BytePerPixelC = 4;
 	} else {
-		dml2_printf("ERROR: DML::%s: SourcePixelFormat = %u not supported!\n", __func__, SourcePixelFormat);
-		DML2_ASSERT(0);
+		DML_LOG_VERBOSE("ERROR: DML::%s: SourcePixelFormat = %u not supported!\n", __func__, SourcePixelFormat);
+		DML_ASSERT(0);
 	}
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: SourcePixelFormat = %u\n", __func__, SourcePixelFormat);
-	dml2_printf("DML::%s: BytePerPixelDETY = %f\n", __func__, *BytePerPixelDETY);
-	dml2_printf("DML::%s: BytePerPixelDETC = %f\n", __func__, *BytePerPixelDETC);
-	dml2_printf("DML::%s: BytePerPixelY = %u\n", __func__, *BytePerPixelY);
-	dml2_printf("DML::%s: BytePerPixelC = %u\n", __func__, *BytePerPixelC);
-	dml2_printf("DML::%s: pitch_y = %u\n", __func__, pitch_y);
-	dml2_printf("DML::%s: pitch_c = %u\n", __func__, pitch_c);
-	dml2_printf("DML::%s: surf_linear128_l = %u\n", __func__, *surf_linear128_l);
-	dml2_printf("DML::%s: surf_linear128_c = %u\n", __func__, *surf_linear128_c);
-#endif
+	DML_LOG_VERBOSE("DML::%s: SourcePixelFormat = %u\n", __func__, SourcePixelFormat);
+	DML_LOG_VERBOSE("DML::%s: BytePerPixelDETY = %f\n", __func__, *BytePerPixelDETY);
+	DML_LOG_VERBOSE("DML::%s: BytePerPixelDETC = %f\n", __func__, *BytePerPixelDETC);
+	DML_LOG_VERBOSE("DML::%s: BytePerPixelY = %u\n", __func__, *BytePerPixelY);
+	DML_LOG_VERBOSE("DML::%s: BytePerPixelC = %u\n", __func__, *BytePerPixelC);
+	DML_LOG_VERBOSE("DML::%s: pitch_y = %u\n", __func__, pitch_y);
+	DML_LOG_VERBOSE("DML::%s: pitch_c = %u\n", __func__, pitch_c);
+	DML_LOG_VERBOSE("DML::%s: surf_linear128_l = %u\n", __func__, *surf_linear128_l);
+	DML_LOG_VERBOSE("DML::%s: surf_linear128_c = %u\n", __func__, *surf_linear128_c);
 
 	if (dml_get_gfx_version(SurfaceTiling) == 11) {
 		*surf_linear128_l = 0;
@@ -703,12 +695,10 @@ static void CalculateBytePerPixelAndBlockSizes(
 		*BlockWidth256BytesY = 256U / *BytePerPixelY / *BlockHeight256BytesY;
 		*BlockWidth256BytesC = 256U / *BytePerPixelC / *BlockHeight256BytesC;
 	}
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: BlockWidth256BytesY = %u\n", __func__, *BlockWidth256BytesY);
-	dml2_printf("DML::%s: BlockHeight256BytesY = %u\n", __func__, *BlockHeight256BytesY);
-	dml2_printf("DML::%s: BlockWidth256BytesC = %u\n", __func__, *BlockWidth256BytesC);
-	dml2_printf("DML::%s: BlockHeight256BytesC = %u\n", __func__, *BlockHeight256BytesC);
-#endif
+	DML_LOG_VERBOSE("DML::%s: BlockWidth256BytesY = %u\n", __func__, *BlockWidth256BytesY);
+	DML_LOG_VERBOSE("DML::%s: BlockHeight256BytesY = %u\n", __func__, *BlockHeight256BytesY);
+	DML_LOG_VERBOSE("DML::%s: BlockWidth256BytesC = %u\n", __func__, *BlockWidth256BytesC);
+	DML_LOG_VERBOSE("DML::%s: BlockHeight256BytesC = %u\n", __func__, *BlockHeight256BytesC);
 
 	if (dml_get_gfx_version(SurfaceTiling) == 11) {
 		if (SurfaceTiling == dml2_gfx11_sw_linear) {
@@ -752,8 +742,8 @@ static void CalculateBytePerPixelAndBlockSizes(
 		} else if (SurfaceTiling == dml2_sw_256kb_2d) {
 			macro_tile_scale = 32;
 		} else {
-			dml2_printf("ERROR: Invalid SurfaceTiling setting! val=%u\n", SurfaceTiling);
-			DML2_ASSERT(0);
+			DML_LOG_VERBOSE("ERROR: Invalid SurfaceTiling setting! val=%u\n", SurfaceTiling);
+			DML_ASSERT(0);
 		}
 
 		*MacroTileHeightY = macro_tile_scale * *BlockHeight256BytesY;
@@ -766,12 +756,10 @@ static void CalculateBytePerPixelAndBlockSizes(
 		}
 	}
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: MacroTileWidthY = %u\n", __func__, *MacroTileWidthY);
-	dml2_printf("DML::%s: MacroTileHeightY = %u\n", __func__, *MacroTileHeightY);
-	dml2_printf("DML::%s: MacroTileWidthC = %u\n", __func__, *MacroTileWidthC);
-	dml2_printf("DML::%s: MacroTileHeightC = %u\n", __func__, *MacroTileHeightC);
-#endif
+	DML_LOG_VERBOSE("DML::%s: MacroTileWidthY = %u\n", __func__, *MacroTileWidthY);
+	DML_LOG_VERBOSE("DML::%s: MacroTileHeightY = %u\n", __func__, *MacroTileHeightY);
+	DML_LOG_VERBOSE("DML::%s: MacroTileWidthC = %u\n", __func__, *MacroTileWidthC);
+	DML_LOG_VERBOSE("DML::%s: MacroTileHeightC = %u\n", __func__, *MacroTileHeightC);
 }
 
 static void CalculateSinglePipeDPPCLKAndSCLThroughput(
@@ -860,10 +848,8 @@ static void CalculateSwathWidth(
 	unsigned int surface_width_ub_c;
 	unsigned int surface_height_ub_c;
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: ForceSingleDPP = %u\n", __func__, ForceSingleDPP);
-	dml2_printf("DML::%s: NumberOfActiveSurfaces = %u\n", __func__, NumberOfActiveSurfaces);
-#endif
+	DML_LOG_VERBOSE("DML::%s: ForceSingleDPP = %u\n", __func__, ForceSingleDPP);
+	DML_LOG_VERBOSE("DML::%s: NumberOfActiveSurfaces = %u\n", __func__, NumberOfActiveSurfaces);
 
 	for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
 		if (!dml_is_vertical_rotation(display_cfg->plane_descriptors[k].composition.rotation_angle)) {
@@ -872,11 +858,9 @@ static void CalculateSwathWidth(
 			SwathWidthSingleDPPY[k] = (unsigned int)display_cfg->plane_descriptors[k].composition.viewport.plane0.height;
 		}
 
-#ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u ViewportWidth=%u\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.width);
-		dml2_printf("DML::%s: k=%u ViewportHeight=%u\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.height);
-		dml2_printf("DML::%s: k=%u DPPPerSurface=%u\n", __func__, k, DPPPerSurface[k]);
-#endif
+		DML_LOG_VERBOSE("DML::%s: k=%u ViewportWidth=%lu\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.width);
+		DML_LOG_VERBOSE("DML::%s: k=%u ViewportHeight=%lu\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.height);
+		DML_LOG_VERBOSE("DML::%s: k=%u DPPPerSurface=%u\n", __func__, k, DPPPerSurface[k]);
 
 		MainSurfaceODMMode = ODMMode[k];
 
@@ -899,13 +883,11 @@ static void CalculateSwathWidth(
 			}
 		}
 
-#ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u HActive=%u\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active);
-		dml2_printf("DML::%s: k=%u HRatio=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio);
-		dml2_printf("DML::%s: k=%u MainSurfaceODMMode=%u\n", __func__, k, MainSurfaceODMMode);
-		dml2_printf("DML::%s: k=%u SwathWidthSingleDPPY=%u\n", __func__, k, SwathWidthSingleDPPY[k]);
-		dml2_printf("DML::%s: k=%u SwathWidthY=%u\n", __func__, k, SwathWidthY[k]);
-#endif
+		DML_LOG_VERBOSE("DML::%s: k=%u HActive=%lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_active);
+		DML_LOG_VERBOSE("DML::%s: k=%u HRatio=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%u MainSurfaceODMMode=%u\n", __func__, k, MainSurfaceODMMode);
+		DML_LOG_VERBOSE("DML::%s: k=%u SwathWidthSingleDPPY=%u\n", __func__, k, SwathWidthSingleDPPY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u SwathWidthY=%u\n", __func__, k, SwathWidthY[k]);
 
 		if (dml_is_420(display_cfg->plane_descriptors[k].pixel_format)) {
 			SwathWidthC[k] = SwathWidthY[k] / 2;
@@ -934,22 +916,20 @@ static void CalculateSwathWidth(
 		surface_width_ub_c = (unsigned int)math_ceil2((double)display_cfg->plane_descriptors[k].surface.plane1.width, req_width_horz_c);
 		surface_height_ub_c = (unsigned int)math_ceil2((double)display_cfg->plane_descriptors[k].surface.plane1.height, Read256BytesBlockHeightC[k]);
 
-#ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u surface_width_ub_l=%u\n", __func__, k, surface_width_ub_l);
-		dml2_printf("DML::%s: k=%u surface_height_ub_l=%u\n", __func__, k, surface_height_ub_l);
-		dml2_printf("DML::%s: k=%u surface_width_ub_c=%u\n", __func__, k, surface_width_ub_c);
-		dml2_printf("DML::%s: k=%u surface_height_ub_c=%u\n", __func__, k, surface_height_ub_c);
-		dml2_printf("DML::%s: k=%u req_width_horz_y=%u\n", __func__, k, req_width_horz_y);
-		dml2_printf("DML::%s: k=%u req_width_horz_c=%u\n", __func__, k, req_width_horz_c);
-		dml2_printf("DML::%s: k=%u Read256BytesBlockWidthY=%u\n", __func__, k, Read256BytesBlockWidthY[k]);
-		dml2_printf("DML::%s: k=%u Read256BytesBlockHeightY=%u\n", __func__, k, Read256BytesBlockHeightY[k]);
-		dml2_printf("DML::%s: k=%u Read256BytesBlockWidthC=%u\n", __func__, k, Read256BytesBlockWidthC[k]);
-		dml2_printf("DML::%s: k=%u Read256BytesBlockHeightC=%u\n", __func__, k, Read256BytesBlockHeightC[k]);
-		dml2_printf("DML::%s: k=%u req_width_horz_y=%u\n", __func__, k, req_width_horz_y);
-		dml2_printf("DML::%s: k=%u req_width_horz_c=%u\n", __func__, k, req_width_horz_c);
-		dml2_printf("DML::%s: k=%u ViewportStationary=%u\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.stationary);
-		dml2_printf("DML::%s: k=%u DPPPerSurface=%u\n", __func__, k, DPPPerSurface[k]);
-#endif
+		DML_LOG_VERBOSE("DML::%s: k=%u surface_width_ub_l=%u\n", __func__, k, surface_width_ub_l);
+		DML_LOG_VERBOSE("DML::%s: k=%u surface_height_ub_l=%u\n", __func__, k, surface_height_ub_l);
+		DML_LOG_VERBOSE("DML::%s: k=%u surface_width_ub_c=%u\n", __func__, k, surface_width_ub_c);
+		DML_LOG_VERBOSE("DML::%s: k=%u surface_height_ub_c=%u\n", __func__, k, surface_height_ub_c);
+		DML_LOG_VERBOSE("DML::%s: k=%u req_width_horz_y=%u\n", __func__, k, req_width_horz_y);
+		DML_LOG_VERBOSE("DML::%s: k=%u req_width_horz_c=%u\n", __func__, k, req_width_horz_c);
+		DML_LOG_VERBOSE("DML::%s: k=%u Read256BytesBlockWidthY=%u\n", __func__, k, Read256BytesBlockWidthY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u Read256BytesBlockHeightY=%u\n", __func__, k, Read256BytesBlockHeightY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u Read256BytesBlockWidthC=%u\n", __func__, k, Read256BytesBlockWidthC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u Read256BytesBlockHeightC=%u\n", __func__, k, Read256BytesBlockHeightC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u req_width_horz_y=%u\n", __func__, k, req_width_horz_y);
+		DML_LOG_VERBOSE("DML::%s: k=%u req_width_horz_c=%u\n", __func__, k, req_width_horz_c);
+		DML_LOG_VERBOSE("DML::%s: k=%u ViewportStationary=%u\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.stationary);
+		DML_LOG_VERBOSE("DML::%s: k=%u DPPPerSurface=%u\n", __func__, k, DPPPerSurface[k]);
 
 		req_per_swath_ub_l[k] = 0;
 		req_per_swath_ub_c[k] = 0;
@@ -995,15 +975,12 @@ static void CalculateSwathWidth(
 			}
 		}
 
-#ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u swath_width_luma_ub=%u\n", __func__, k, swath_width_luma_ub[k]);
-		dml2_printf("DML::%s: k=%u swath_width_chroma_ub=%u\n", __func__, k, swath_width_chroma_ub[k]);
-		dml2_printf("DML::%s: k=%u MaximumSwathHeightY=%u\n", __func__, k, MaximumSwathHeightY[k]);
-		dml2_printf("DML::%s: k=%u MaximumSwathHeightC=%u\n", __func__, k, MaximumSwathHeightC[k]);
-		dml2_printf("DML::%s: k=%u req_per_swath_ub_l=%u\n", __func__, k, req_per_swath_ub_l[k]);
-		dml2_printf("DML::%s: k=%u req_per_swath_ub_c=%u\n", __func__, k, req_per_swath_ub_c[k]);
-#endif
-
+		DML_LOG_VERBOSE("DML::%s: k=%u swath_width_luma_ub=%u\n", __func__, k, swath_width_luma_ub[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u swath_width_chroma_ub=%u\n", __func__, k, swath_width_chroma_ub[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathHeightY=%u\n", __func__, k, MaximumSwathHeightY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathHeightC=%u\n", __func__, k, MaximumSwathHeightC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u req_per_swath_ub_l=%u\n", __func__, k, req_per_swath_ub_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u req_per_swath_ub_c=%u\n", __func__, k, req_per_swath_ub_c[k]);
 	}
 }
 
@@ -1018,13 +995,11 @@ static bool UnboundedRequest(bool unb_req_force_en, bool unb_req_force_val, unsi
 	if (unb_req_force_en) {
 		unb_req_en = unb_req_force_val && unb_req_ok;
 	}
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: unb_req_force_en = %u\n", __func__, unb_req_force_en);
-	dml2_printf("DML::%s: unb_req_force_val = %u\n", __func__, unb_req_force_val);
-	dml2_printf("DML::%s: unb_req_ok = %u\n", __func__, unb_req_ok);
-	dml2_printf("DML::%s: unb_req_en = %u\n", __func__, unb_req_en);
-#endif
-	return (unb_req_en);
+	DML_LOG_VERBOSE("DML::%s: unb_req_force_en = %u\n", __func__, unb_req_force_en);
+	DML_LOG_VERBOSE("DML::%s: unb_req_force_val = %u\n", __func__, unb_req_force_val);
+	DML_LOG_VERBOSE("DML::%s: unb_req_ok = %u\n", __func__, unb_req_ok);
+	DML_LOG_VERBOSE("DML::%s: unb_req_en = %u\n", __func__, unb_req_en);
+	return unb_req_en;
 }
 
 static void CalculateDETBufferSize(
@@ -1054,16 +1029,14 @@ static void CalculateDETBufferSize(
 	bool NextPotentialSurfaceToAssignDETPieceFound;
 	bool MinimizeReallocationSuccess = false;
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: ForceSingleDPP = %u\n", __func__, ForceSingleDPP);
-	dml2_printf("DML::%s: nomDETInKByte = %u\n", __func__, nomDETInKByte);
-	dml2_printf("DML::%s: NumberOfActiveSurfaces = %u\n", __func__, NumberOfActiveSurfaces);
-	dml2_printf("DML::%s: UnboundedRequestEnabled = %u\n", __func__, UnboundedRequestEnabled);
-	dml2_printf("DML::%s: MaxTotalDETInKByte = %u\n", __func__, MaxTotalDETInKByte);
-	dml2_printf("DML::%s: ConfigReturnBufferSizeInKByte = %u\n", __func__, ConfigReturnBufferSizeInKByte);
-	dml2_printf("DML::%s: MinCompressedBufferSizeInKByte = %u\n", __func__, MinCompressedBufferSizeInKByte);
-	dml2_printf("DML::%s: CompressedBufferSegmentSizeInkByte = %u\n", __func__, CompressedBufferSegmentSizeInkByte);
-#endif
+	DML_LOG_VERBOSE("DML::%s: ForceSingleDPP = %u\n", __func__, ForceSingleDPP);
+	DML_LOG_VERBOSE("DML::%s: nomDETInKByte = %u\n", __func__, nomDETInKByte);
+	DML_LOG_VERBOSE("DML::%s: NumberOfActiveSurfaces = %u\n", __func__, NumberOfActiveSurfaces);
+	DML_LOG_VERBOSE("DML::%s: UnboundedRequestEnabled = %u\n", __func__, UnboundedRequestEnabled);
+	DML_LOG_VERBOSE("DML::%s: MaxTotalDETInKByte = %u\n", __func__, MaxTotalDETInKByte);
+	DML_LOG_VERBOSE("DML::%s: ConfigReturnBufferSizeInKByte = %u\n", __func__, ConfigReturnBufferSizeInKByte);
+	DML_LOG_VERBOSE("DML::%s: MinCompressedBufferSizeInKByte = %u\n", __func__, MinCompressedBufferSizeInKByte);
+	DML_LOG_VERBOSE("DML::%s: CompressedBufferSegmentSizeInkByte = %u\n", __func__, CompressedBufferSegmentSizeInkByte);
 
 	// Note: Will use default det size if that fits 2 swaths
 	if (UnboundedRequestEnabled) {
@@ -1092,19 +1065,15 @@ static void CalculateDETBufferSize(
 				l->minDET = l->minDET + ConfigReturnBufferSegmentSizeInkByte;
 			}
 
-#ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u minDET = %u\n", __func__, k, l->minDET);
-			dml2_printf("DML::%s: k=%u max_minDET = %u\n", __func__, k, l->max_minDET);
-			dml2_printf("DML::%s: k=%u minDET_pipe = %u\n", __func__, k, l->minDET_pipe);
-			dml2_printf("DML::%s: k=%u full_swath_bytes_l = %u\n", __func__, k, full_swath_bytes_l[k]);
-			dml2_printf("DML::%s: k=%u full_swath_bytes_c = %u\n", __func__, k, full_swath_bytes_c[k]);
-#endif
+			DML_LOG_VERBOSE("DML::%s: k=%u minDET = %u\n", __func__, k, l->minDET);
+			DML_LOG_VERBOSE("DML::%s: k=%u max_minDET = %u\n", __func__, k, l->max_minDET);
+			DML_LOG_VERBOSE("DML::%s: k=%u minDET_pipe = %u\n", __func__, k, l->minDET_pipe);
+			DML_LOG_VERBOSE("DML::%s: k=%u full_swath_bytes_l = %u\n", __func__, k, full_swath_bytes_l[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u full_swath_bytes_c = %u\n", __func__, k, full_swath_bytes_c[k]);
 
 			if (l->minDET_pipe == 0) {
 				l->minDET_pipe = (unsigned int)(math_max2(128, math_ceil2(((double)full_swath_bytes_l[k] + (double)full_swath_bytes_c[k]) / 1024.0, ConfigReturnBufferSegmentSizeInkByte)));
-#ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: k=%u minDET_pipe = %u (assume each plane take half DET)\n", __func__, k, l->minDET_pipe);
-#endif
+				DML_LOG_VERBOSE("DML::%s: k=%u minDET_pipe = %u (assume each plane take half DET)\n", __func__, k, l->minDET_pipe);
 			}
 
 			if (dml_is_phantom_pipe(&display_cfg->plane_descriptors[k])) {
@@ -1117,12 +1086,10 @@ static void CalculateDETBufferSize(
 				l->DETBufferSizePoolInKByte = l->DETBufferSizePoolInKByte - (ForceSingleDPP ? 1 : DPPPerSurface[k]) * l->minDET_pipe;
 			}
 
-#ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u DPPPerSurface = %u\n", __func__, k, DPPPerSurface[k]);
-			dml2_printf("DML::%s: k=%u DETSizeOverride = %u\n", __func__, k, display_cfg->plane_descriptors[k].overrides.det_size_override_kb);
-			dml2_printf("DML::%s: k=%u DETBufferSizeInKByte = %u\n", __func__, k, DETBufferSizeInKByte[k]);
-			dml2_printf("DML::%s: DETBufferSizePoolInKByte = %u\n", __func__, l->DETBufferSizePoolInKByte);
-#endif
+			DML_LOG_VERBOSE("DML::%s: k=%u DPPPerSurface = %u\n", __func__, k, DPPPerSurface[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u DETSizeOverride = %u\n", __func__, k, display_cfg->plane_descriptors[k].overrides.det_size_override_kb);
+			DML_LOG_VERBOSE("DML::%s: k=%u DETBufferSizeInKByte = %u\n", __func__, k, DETBufferSizeInKByte[k]);
+			DML_LOG_VERBOSE("DML::%s: DETBufferSizePoolInKByte = %u\n", __func__, l->DETBufferSizePoolInKByte);
 		}
 
 		if (display_cfg->minimize_det_reallocation) {
@@ -1194,14 +1161,12 @@ static void CalculateDETBufferSize(
 					l->TotalBandwidth = l->TotalBandwidth + ReadBandwidthLuma[k] + ReadBandwidthChroma[k];
 				}
 			}
-#ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: --- Before bandwidth adjustment ---\n", __func__);
+			DML_LOG_VERBOSE("DML::%s: --- Before bandwidth adjustment ---\n", __func__);
 			for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
-				dml2_printf("DML::%s: k=%u DETBufferSizeInKByte = %u\n", __func__, k, DETBufferSizeInKByte[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u DETBufferSizeInKByte = %u\n", __func__, k, DETBufferSizeInKByte[k]);
 			}
-			dml2_printf("DML::%s: --- DET allocation with bandwidth ---\n", __func__);
-#endif
-			dml2_printf("DML::%s: TotalBandwidth = %f\n", __func__, l->TotalBandwidth);
+			DML_LOG_VERBOSE("DML::%s: --- DET allocation with bandwidth ---\n", __func__);
+			DML_LOG_VERBOSE("DML::%s: TotalBandwidth = %f\n", __func__, l->TotalBandwidth);
 			l->BandwidthOfSurfacesNotAssignedDETPiece = l->TotalBandwidth;
 			for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
 
@@ -1213,10 +1178,8 @@ static void CalculateDETBufferSize(
 				} else {
 					DETPieceAssignedToThisSurfaceAlready[k] = false;
 				}
-#ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: k=%u DETPieceAssignedToThisSurfaceAlready = %u\n", __func__, k, DETPieceAssignedToThisSurfaceAlready[k]);
-				dml2_printf("DML::%s: k=%u BandwidthOfSurfacesNotAssignedDETPiece = %f\n", __func__, k, l->BandwidthOfSurfacesNotAssignedDETPiece);
-#endif
+				DML_LOG_VERBOSE("DML::%s: k=%u DETPieceAssignedToThisSurfaceAlready = %u\n", __func__, k, DETPieceAssignedToThisSurfaceAlready[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u BandwidthOfSurfacesNotAssignedDETPiece = %f\n", __func__, k, l->BandwidthOfSurfacesNotAssignedDETPiece);
 			}
 
 			for (unsigned int j = 0; j < NumberOfActiveSurfaces; ++j) {
@@ -1224,22 +1187,18 @@ static void CalculateDETBufferSize(
 				l->NextSurfaceToAssignDETPiece = 0;
 
 				for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
-#ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: j=%u k=%u, ReadBandwidthLuma[k] = %f\n", __func__, j, k, ReadBandwidthLuma[k]);
-					dml2_printf("DML::%s: j=%u k=%u, ReadBandwidthChroma[k] = %f\n", __func__, j, k, ReadBandwidthChroma[k]);
-					dml2_printf("DML::%s: j=%u k=%u, ReadBandwidthLuma[Next] = %f\n", __func__, j, k, ReadBandwidthLuma[l->NextSurfaceToAssignDETPiece]);
-					dml2_printf("DML::%s: j=%u k=%u, ReadBandwidthChroma[Next] = %f\n", __func__, j, k, ReadBandwidthChroma[l->NextSurfaceToAssignDETPiece]);
-					dml2_printf("DML::%s: j=%u k=%u, NextSurfaceToAssignDETPiece = %u\n", __func__, j, k, l->NextSurfaceToAssignDETPiece);
-#endif
+					DML_LOG_VERBOSE("DML::%s: j=%u k=%u, ReadBandwidthLuma[k] = %f\n", __func__, j, k, ReadBandwidthLuma[k]);
+					DML_LOG_VERBOSE("DML::%s: j=%u k=%u, ReadBandwidthChroma[k] = %f\n", __func__, j, k, ReadBandwidthChroma[k]);
+					DML_LOG_VERBOSE("DML::%s: j=%u k=%u, ReadBandwidthLuma[Next] = %f\n", __func__, j, k, ReadBandwidthLuma[l->NextSurfaceToAssignDETPiece]);
+					DML_LOG_VERBOSE("DML::%s: j=%u k=%u, ReadBandwidthChroma[Next] = %f\n", __func__, j, k, ReadBandwidthChroma[l->NextSurfaceToAssignDETPiece]);
+					DML_LOG_VERBOSE("DML::%s: j=%u k=%u, NextSurfaceToAssignDETPiece = %u\n", __func__, j, k, l->NextSurfaceToAssignDETPiece);
 					if (!DETPieceAssignedToThisSurfaceAlready[k] && (!NextPotentialSurfaceToAssignDETPieceFound ||
 						ReadBandwidthLuma[k] + ReadBandwidthChroma[k] < ReadBandwidthLuma[l->NextSurfaceToAssignDETPiece] + ReadBandwidthChroma[l->NextSurfaceToAssignDETPiece])) {
 						l->NextSurfaceToAssignDETPiece = k;
 						NextPotentialSurfaceToAssignDETPieceFound = true;
 					}
-#ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: j=%u k=%u, DETPieceAssignedToThisSurfaceAlready = %u\n", __func__, j, k, DETPieceAssignedToThisSurfaceAlready[k]);
-					dml2_printf("DML::%s: j=%u k=%u, NextPotentialSurfaceToAssignDETPieceFound = %u\n", __func__, j, k, NextPotentialSurfaceToAssignDETPieceFound);
-#endif
+					DML_LOG_VERBOSE("DML::%s: j=%u k=%u, DETPieceAssignedToThisSurfaceAlready = %u\n", __func__, j, k, DETPieceAssignedToThisSurfaceAlready[k]);
+					DML_LOG_VERBOSE("DML::%s: j=%u k=%u, NextPotentialSurfaceToAssignDETPieceFound = %u\n", __func__, j, k, NextPotentialSurfaceToAssignDETPieceFound);
 				}
 
 				if (NextPotentialSurfaceToAssignDETPieceFound) {
@@ -1249,20 +1208,16 @@ static void CalculateDETBufferSize(
 						* (ForceSingleDPP ? 1 : DPPPerSurface[l->NextSurfaceToAssignDETPiece]) * ConfigReturnBufferSegmentSizeInkByte,
 						math_floor2((double)l->DETBufferSizePoolInKByte, (ForceSingleDPP ? 1 : DPPPerSurface[l->NextSurfaceToAssignDETPiece]) * ConfigReturnBufferSegmentSizeInkByte)));
 
-#ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: j=%u, DETBufferSizePoolInKByte = %u\n", __func__, j, l->DETBufferSizePoolInKByte);
-					dml2_printf("DML::%s: j=%u, NextSurfaceToAssignDETPiece = %u\n", __func__, j, l->NextSurfaceToAssignDETPiece);
-					dml2_printf("DML::%s: j=%u, ReadBandwidthLuma[%u] = %f\n", __func__, j, l->NextSurfaceToAssignDETPiece, ReadBandwidthLuma[l->NextSurfaceToAssignDETPiece]);
-					dml2_printf("DML::%s: j=%u, ReadBandwidthChroma[%u] = %f\n", __func__, j, l->NextSurfaceToAssignDETPiece, ReadBandwidthChroma[l->NextSurfaceToAssignDETPiece]);
-					dml2_printf("DML::%s: j=%u, BandwidthOfSurfacesNotAssignedDETPiece = %f\n", __func__, j, l->BandwidthOfSurfacesNotAssignedDETPiece);
-					dml2_printf("DML::%s: j=%u, NextDETBufferPieceInKByte = %u\n", __func__, j, l->NextDETBufferPieceInKByte);
-					dml2_printf("DML::%s: j=%u, DETBufferSizeInKByte[%u] increases from %u ", __func__, j, l->NextSurfaceToAssignDETPiece, DETBufferSizeInKByte[l->NextSurfaceToAssignDETPiece]);
-#endif
+					DML_LOG_VERBOSE("DML::%s: j=%u, DETBufferSizePoolInKByte = %u\n", __func__, j, l->DETBufferSizePoolInKByte);
+					DML_LOG_VERBOSE("DML::%s: j=%u, NextSurfaceToAssignDETPiece = %u\n", __func__, j, l->NextSurfaceToAssignDETPiece);
+					DML_LOG_VERBOSE("DML::%s: j=%u, ReadBandwidthLuma[%u] = %f\n", __func__, j, l->NextSurfaceToAssignDETPiece, ReadBandwidthLuma[l->NextSurfaceToAssignDETPiece]);
+					DML_LOG_VERBOSE("DML::%s: j=%u, ReadBandwidthChroma[%u] = %f\n", __func__, j, l->NextSurfaceToAssignDETPiece, ReadBandwidthChroma[l->NextSurfaceToAssignDETPiece]);
+					DML_LOG_VERBOSE("DML::%s: j=%u, BandwidthOfSurfacesNotAssignedDETPiece = %f\n", __func__, j, l->BandwidthOfSurfacesNotAssignedDETPiece);
+					DML_LOG_VERBOSE("DML::%s: j=%u, NextDETBufferPieceInKByte = %u\n", __func__, j, l->NextDETBufferPieceInKByte);
+					DML_LOG_VERBOSE("DML::%s: j=%u, DETBufferSizeInKByte[%u] increases from %u ", __func__, j, l->NextSurfaceToAssignDETPiece, DETBufferSizeInKByte[l->NextSurfaceToAssignDETPiece]);
 
 					DETBufferSizeInKByte[l->NextSurfaceToAssignDETPiece] = DETBufferSizeInKByte[l->NextSurfaceToAssignDETPiece] + l->NextDETBufferPieceInKByte / (ForceSingleDPP ? 1 : DPPPerSurface[l->NextSurfaceToAssignDETPiece]);
-#ifdef __DML_VBA_DEBUG__
-					dml2_printf("to %u\n", DETBufferSizeInKByte[l->NextSurfaceToAssignDETPiece]);
-#endif
+					DML_LOG_VERBOSE("to %u\n", DETBufferSizeInKByte[l->NextSurfaceToAssignDETPiece]);
 
 					l->DETBufferSizePoolInKByte = l->DETBufferSizePoolInKByte - l->NextDETBufferPieceInKByte;
 					DETPieceAssignedToThisSurfaceAlready[l->NextSurfaceToAssignDETPiece] = true;
@@ -1274,13 +1229,11 @@ static void CalculateDETBufferSize(
 	}
 	*CompressedBufferSizeInkByte = *CompressedBufferSizeInkByte * CompressedBufferSegmentSizeInkByte / ConfigReturnBufferSegmentSizeInkByte;
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: --- After bandwidth adjustment ---\n", __func__);
-	dml2_printf("DML::%s: CompressedBufferSizeInkByte = %u\n", __func__, *CompressedBufferSizeInkByte);
+	DML_LOG_VERBOSE("DML::%s: --- After bandwidth adjustment ---\n", __func__);
+	DML_LOG_VERBOSE("DML::%s: CompressedBufferSizeInkByte = %u\n", __func__, *CompressedBufferSizeInkByte);
 	for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
-		dml2_printf("DML::%s: k=%u DETBufferSizeInKByte = %u (TotalReadBandWidth=%f)\n", __func__, k, DETBufferSizeInKByte[k], ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u DETBufferSizeInKByte = %u (TotalReadBandWidth=%f)\n", __func__, k, DETBufferSizeInKByte[k], ReadBandwidthLuma[k] + ReadBandwidthChroma[k]);
 	}
-#endif
 }
 
 static double CalculateRequiredDispclk(
@@ -1510,15 +1463,13 @@ static unsigned int dscceComputeDelay(
 	//pixel delay is group_delay (converted to pixels) + pipeline, however, first group is a special case since it is processed as soon as it arrives (i.e., in 3 cycles regardless of pixel format)
 	pixels = (group_delay - 1) * cycles_per_group + 3 + pipeline_delay;
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: bpc: %u\n", __func__, bpc);
-	dml2_printf("DML::%s: BPP: %f\n", __func__, BPP);
-	dml2_printf("DML::%s: sliceWidth: %u\n", __func__, sliceWidth);
-	dml2_printf("DML::%s: numSlices: %u\n", __func__, numSlices);
-	dml2_printf("DML::%s: pixelFormat: %u\n", __func__, pixelFormat);
-	dml2_printf("DML::%s: Output: %u\n", __func__, Output);
-	dml2_printf("DML::%s: pixels: %u\n", __func__, pixels);
-#endif
+	DML_LOG_VERBOSE("DML::%s: bpc: %u\n", __func__, bpc);
+	DML_LOG_VERBOSE("DML::%s: BPP: %f\n", __func__, BPP);
+	DML_LOG_VERBOSE("DML::%s: sliceWidth: %u\n", __func__, sliceWidth);
+	DML_LOG_VERBOSE("DML::%s: numSlices: %u\n", __func__, numSlices);
+	DML_LOG_VERBOSE("DML::%s: pixelFormat: %u\n", __func__, pixelFormat);
+	DML_LOG_VERBOSE("DML::%s: Output: %u\n", __func__, Output);
+	DML_LOG_VERBOSE("DML::%s: pixels: %u\n", __func__, pixels);
 	return pixels;
 }
 
@@ -1593,10 +1544,8 @@ static unsigned int dscComputeDelay(enum dml2_output_format_class pixelFormat, e
 
 	// sft
 	Delay = Delay + 1;
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: pixelFormat = %u\n", __func__, pixelFormat);
-	dml2_printf("DML::%s: Delay = %u\n", __func__, Delay);
-#endif
+	DML_LOG_VERBOSE("DML::%s: pixelFormat = %u\n", __func__, pixelFormat);
+	DML_LOG_VERBOSE("DML::%s: Delay = %u\n", __func__, Delay);
 
 	return Delay;
 }
@@ -1667,10 +1616,8 @@ static unsigned int CalculateVMAndRowBytes(struct dml2_core_shared_calculate_vm_
 	}
 
 	meta_surface_bytes = (unsigned int)(p->DCCMetaPitch * vp_height_meta_ub * p->BytePerPixel / 256.0);
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DCCMetaPitch = %u\n", __func__, p->DCCMetaPitch);
-	dml2_printf("DML::%s: meta_surface_bytes = %u\n", __func__, meta_surface_bytes);
-#endif
+	DML_LOG_VERBOSE("DML::%s: DCCMetaPitch = %u\n", __func__, p->DCCMetaPitch);
+	DML_LOG_VERBOSE("DML::%s: meta_surface_bytes = %u\n", __func__, meta_surface_bytes);
 	if (p->GPUVMEnable == true) {
 		double meta_vmpg_bytes = 4.0 * 1024.0;
 		*p->meta_pte_bytes_per_frame_ub = (unsigned int)((math_ceil2((double) (meta_surface_bytes - meta_vmpg_bytes) / (8 * meta_vmpg_bytes), 1) + 1) * 64);
@@ -1724,25 +1671,23 @@ static unsigned int CalculateVMAndRowBytes(struct dml2_core_shared_calculate_vm_
 
 	vm_bytes = *p->meta_pte_bytes_per_frame_ub + extra_mpde_bytes + *p->dpde0_bytes_per_frame_ub + extra_dpde_bytes;
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DCCEnable = %u\n", __func__, p->DCCEnable);
-	dml2_printf("DML::%s: GPUVMEnable = %u\n", __func__, p->GPUVMEnable);
-	dml2_printf("DML::%s: SwModeLinear = %u\n", __func__, p->SurfaceTiling == dml2_sw_linear);
-	dml2_printf("DML::%s: BytePerPixel = %u\n", __func__, p->BytePerPixel);
-	dml2_printf("DML::%s: GPUVMMaxPageTableLevels = %u\n", __func__, p->GPUVMMaxPageTableLevels);
-	dml2_printf("DML::%s: BlockHeight256Bytes = %u\n", __func__, p->BlockHeight256Bytes);
-	dml2_printf("DML::%s: BlockWidth256Bytes = %u\n", __func__, p->BlockWidth256Bytes);
-	dml2_printf("DML::%s: MacroTileHeight = %u\n", __func__, p->MacroTileHeight);
-	dml2_printf("DML::%s: MacroTileWidth = %u\n", __func__, p->MacroTileWidth);
-	dml2_printf("DML::%s: meta_pte_bytes_per_frame_ub = %u\n", __func__, *p->meta_pte_bytes_per_frame_ub);
-	dml2_printf("DML::%s: dpde0_bytes_per_frame_ub = %u\n", __func__, *p->dpde0_bytes_per_frame_ub);
-	dml2_printf("DML::%s: extra_mpde_bytes = %u\n", __func__, extra_mpde_bytes);
-	dml2_printf("DML::%s: extra_dpde_bytes = %u\n", __func__, extra_dpde_bytes);
-	dml2_printf("DML::%s: vm_bytes = %u\n", __func__, vm_bytes);
-	dml2_printf("DML::%s: ViewportHeight = %u\n", __func__, p->ViewportHeight);
-	dml2_printf("DML::%s: SwathWidth = %u\n", __func__, p->SwathWidth);
-	dml2_printf("DML::%s: vp_height_dpte_ub = %u\n", __func__, vp_height_dpte_ub);
-#endif
+	DML_LOG_VERBOSE("DML::%s: DCCEnable = %u\n", __func__, p->DCCEnable);
+	DML_LOG_VERBOSE("DML::%s: GPUVMEnable = %u\n", __func__, p->GPUVMEnable);
+	DML_LOG_VERBOSE("DML::%s: SwModeLinear = %u\n", __func__, p->SurfaceTiling == dml2_sw_linear);
+	DML_LOG_VERBOSE("DML::%s: BytePerPixel = %u\n", __func__, p->BytePerPixel);
+	DML_LOG_VERBOSE("DML::%s: GPUVMMaxPageTableLevels = %u\n", __func__, p->GPUVMMaxPageTableLevels);
+	DML_LOG_VERBOSE("DML::%s: BlockHeight256Bytes = %u\n", __func__, p->BlockHeight256Bytes);
+	DML_LOG_VERBOSE("DML::%s: BlockWidth256Bytes = %u\n", __func__, p->BlockWidth256Bytes);
+	DML_LOG_VERBOSE("DML::%s: MacroTileHeight = %u\n", __func__, p->MacroTileHeight);
+	DML_LOG_VERBOSE("DML::%s: MacroTileWidth = %u\n", __func__, p->MacroTileWidth);
+	DML_LOG_VERBOSE("DML::%s: meta_pte_bytes_per_frame_ub = %u\n", __func__, *p->meta_pte_bytes_per_frame_ub);
+	DML_LOG_VERBOSE("DML::%s: dpde0_bytes_per_frame_ub = %u\n", __func__, *p->dpde0_bytes_per_frame_ub);
+	DML_LOG_VERBOSE("DML::%s: extra_mpde_bytes = %u\n", __func__, extra_mpde_bytes);
+	DML_LOG_VERBOSE("DML::%s: extra_dpde_bytes = %u\n", __func__, extra_dpde_bytes);
+	DML_LOG_VERBOSE("DML::%s: vm_bytes = %u\n", __func__, vm_bytes);
+	DML_LOG_VERBOSE("DML::%s: ViewportHeight = %u\n", __func__, p->ViewportHeight);
+	DML_LOG_VERBOSE("DML::%s: SwathWidth = %u\n", __func__, p->SwathWidth);
+	DML_LOG_VERBOSE("DML::%s: vp_height_dpte_ub = %u\n", __func__, vp_height_dpte_ub);
 
 	if (p->SurfaceTiling == dml2_sw_linear) {
 		*p->PixelPTEReqHeight = 1;
@@ -1778,22 +1723,20 @@ static unsigned int CalculateVMAndRowBytes(struct dml2_core_shared_calculate_vm_
 		*p->vmpg_width = 1024 * p->GPUVMMinPageSizeKBytes / (p->MacroTileHeight * p->BytePerPixel);
 
 		if (p->GPUVMEnable == true) {
-			dml2_printf("DML::%s: GPUVMMinPageSizeKBytes=%u and sw_mode=%u (tile_size=%d) not supported!\n",
+			DML_LOG_VERBOSE("DML::%s: GPUVMMinPageSizeKBytes=%u and sw_mode=%u (tile_size=%d) not supported!\n",
 				__func__, p->GPUVMMinPageSizeKBytes, p->SurfaceTiling, dml_get_tile_block_size_bytes(p->SurfaceTiling));
-			DML2_ASSERT(0);
+			DML_ASSERT(0);
 		}
 	}
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: GPUVMMinPageSizeKBytes = %u\n", __func__, p->GPUVMMinPageSizeKBytes);
-	dml2_printf("DML::%s: PixelPTEReqHeight = %u\n", __func__, *p->PixelPTEReqHeight);
-	dml2_printf("DML::%s: PixelPTEReqWidth = %u\n", __func__, *p->PixelPTEReqWidth);
-	dml2_printf("DML::%s: PixelPTEReqWidth_linear = %u\n", __func__, PixelPTEReqWidth_linear);
-	dml2_printf("DML::%s: PTERequestSize = %u\n", __func__, *p->PTERequestSize);
-	dml2_printf("DML::%s: Pitch = %u\n", __func__, p->Pitch);
-	dml2_printf("DML::%s: vmpg_width = %u\n", __func__, *p->vmpg_width);
-	dml2_printf("DML::%s: vmpg_height = %u\n", __func__, *p->vmpg_height);
-#endif
+	DML_LOG_VERBOSE("DML::%s: GPUVMMinPageSizeKBytes = %u\n", __func__, p->GPUVMMinPageSizeKBytes);
+	DML_LOG_VERBOSE("DML::%s: PixelPTEReqHeight = %u\n", __func__, *p->PixelPTEReqHeight);
+	DML_LOG_VERBOSE("DML::%s: PixelPTEReqWidth = %u\n", __func__, *p->PixelPTEReqWidth);
+	DML_LOG_VERBOSE("DML::%s: PixelPTEReqWidth_linear = %u\n", __func__, PixelPTEReqWidth_linear);
+	DML_LOG_VERBOSE("DML::%s: PTERequestSize = %u\n", __func__, *p->PTERequestSize);
+	DML_LOG_VERBOSE("DML::%s: Pitch = %u\n", __func__, p->Pitch);
+	DML_LOG_VERBOSE("DML::%s: vmpg_width = %u\n", __func__, *p->vmpg_width);
+	DML_LOG_VERBOSE("DML::%s: vmpg_height = %u\n", __func__, *p->vmpg_height);
 
 	*p->dpte_row_height_one_row_per_frame = vp_height_dpte_ub;
 	*p->dpte_row_width_ub_one_row_per_frame = (unsigned int)((math_ceil2(((double)p->Pitch * (double)*p->dpte_row_height_one_row_per_frame / (double)*p->PixelPTEReqHeight - 1) / (double)*p->PixelPTEReqWidth, 1) + 1) * (double)*p->PixelPTEReqWidth);
@@ -1811,7 +1754,7 @@ static unsigned int CalculateVMAndRowBytes(struct dml2_core_shared_calculate_vm_
 			*p->dpte_row_height_linear = 128;
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: dpte_row_width_ub = %u (linear)\n", __func__, *p->dpte_row_width_ub);
+		DML_LOG_VERBOSE("DML::%s: dpte_row_width_ub = %u (linear)\n", __func__, *p->dpte_row_width_ub);
 #endif
 
 	} else if (!dml_is_vertical_rotation(p->RotationAngle)) {
@@ -1825,7 +1768,7 @@ static unsigned int CalculateVMAndRowBytes(struct dml2_core_shared_calculate_vm_
 			*p->dpte_row_width_ub = (unsigned int)((math_ceil2((double)(p->SwathWidth - 1) / (double)*p->PixelPTEReqWidth, 1) + 1.0) * *p->PixelPTEReqWidth);
 		}
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: dpte_row_width_ub = %u (tiled horz)\n", __func__, *p->dpte_row_width_ub);
+		DML_LOG_VERBOSE("DML::%s: dpte_row_width_ub = %u (tiled horz)\n", __func__, *p->dpte_row_width_ub);
 #endif
 
 		*p->PixelPTEBytesPerRow = *p->dpte_row_width_ub / *p->PixelPTEReqWidth * *p->PTERequestSize;
@@ -1840,7 +1783,7 @@ static unsigned int CalculateVMAndRowBytes(struct dml2_core_shared_calculate_vm_
 
 		*p->PixelPTEBytesPerRow = (unsigned int)((double)*p->dpte_row_width_ub / (double)*p->PixelPTEReqHeight * *p->PTERequestSize);
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: dpte_row_width_ub = %u (tiled vert)\n", __func__, *p->dpte_row_width_ub);
+		DML_LOG_VERBOSE("DML::%s: dpte_row_width_ub = %u (tiled vert)\n", __func__, *p->dpte_row_width_ub);
 #endif
 	}
 
@@ -1852,18 +1795,18 @@ static unsigned int CalculateVMAndRowBytes(struct dml2_core_shared_calculate_vm_
 	*p->PixelPTEBytesPerRowStorage = *p->PixelPTEBytesPerRow;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: GPUVMMinPageSizeKBytes = %u\n", __func__, p->GPUVMMinPageSizeKBytes);
-	dml2_printf("DML::%s: GPUVMEnable = %u\n", __func__, p->GPUVMEnable);
-	dml2_printf("DML::%s: meta_row_height = %u\n", __func__, *p->meta_row_height);
-	dml2_printf("DML::%s: dpte_row_height = %u\n", __func__, *p->dpte_row_height);
-	dml2_printf("DML::%s: dpte_row_height_linear = %u\n", __func__, *p->dpte_row_height_linear);
-	dml2_printf("DML::%s: dpte_row_width_ub = %u\n", __func__, *p->dpte_row_width_ub);
-	dml2_printf("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, *p->PixelPTEBytesPerRow);
-	dml2_printf("DML::%s: PixelPTEBytesPerRowStorage = %u\n", __func__, *p->PixelPTEBytesPerRowStorage);
-	dml2_printf("DML::%s: PTEBufferSizeInRequests = %u\n", __func__, p->PTEBufferSizeInRequests);
-	dml2_printf("DML::%s: dpte_row_height_one_row_per_frame = %u\n", __func__, *p->dpte_row_height_one_row_per_frame);
-	dml2_printf("DML::%s: dpte_row_width_ub_one_row_per_frame = %u\n", __func__, *p->dpte_row_width_ub_one_row_per_frame);
-	dml2_printf("DML::%s: PixelPTEBytesPerRow_one_row_per_frame = %u\n", __func__, *p->PixelPTEBytesPerRow_one_row_per_frame);
+	DML_LOG_VERBOSE("DML::%s: GPUVMMinPageSizeKBytes = %u\n", __func__, p->GPUVMMinPageSizeKBytes);
+	DML_LOG_VERBOSE("DML::%s: GPUVMEnable = %u\n", __func__, p->GPUVMEnable);
+	DML_LOG_VERBOSE("DML::%s: meta_row_height = %u\n", __func__, *p->meta_row_height);
+	DML_LOG_VERBOSE("DML::%s: dpte_row_height = %u\n", __func__, *p->dpte_row_height);
+	DML_LOG_VERBOSE("DML::%s: dpte_row_height_linear = %u\n", __func__, *p->dpte_row_height_linear);
+	DML_LOG_VERBOSE("DML::%s: dpte_row_width_ub = %u\n", __func__, *p->dpte_row_width_ub);
+	DML_LOG_VERBOSE("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, *p->PixelPTEBytesPerRow);
+	DML_LOG_VERBOSE("DML::%s: PixelPTEBytesPerRowStorage = %u\n", __func__, *p->PixelPTEBytesPerRowStorage);
+	DML_LOG_VERBOSE("DML::%s: PTEBufferSizeInRequests = %u\n", __func__, p->PTEBufferSizeInRequests);
+	DML_LOG_VERBOSE("DML::%s: dpte_row_height_one_row_per_frame = %u\n", __func__, *p->dpte_row_height_one_row_per_frame);
+	DML_LOG_VERBOSE("DML::%s: dpte_row_width_ub_one_row_per_frame = %u\n", __func__, *p->dpte_row_width_ub_one_row_per_frame);
+	DML_LOG_VERBOSE("DML::%s: PixelPTEBytesPerRow_one_row_per_frame = %u\n", __func__, *p->PixelPTEBytesPerRow_one_row_per_frame);
 #endif
 
 	return vm_bytes;
@@ -1894,12 +1837,12 @@ static unsigned int CalculatePrefetchSourceLines(
 	double numLines = 0;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: VRatio = %f\n", __func__, VRatio);
-	dml2_printf("DML::%s: VTaps = %u\n", __func__, VTaps);
-	dml2_printf("DML::%s: ViewportXStart = %u\n", __func__, ViewportXStart);
-	dml2_printf("DML::%s: ViewportYStart = %u\n", __func__, ViewportYStart);
-	dml2_printf("DML::%s: ViewportStationary = %u\n", __func__, ViewportStationary);
-	dml2_printf("DML::%s: SwathHeight = %u\n", __func__, SwathHeight);
+	DML_LOG_VERBOSE("DML::%s: VRatio = %f\n", __func__, VRatio);
+	DML_LOG_VERBOSE("DML::%s: VTaps = %u\n", __func__, VTaps);
+	DML_LOG_VERBOSE("DML::%s: ViewportXStart = %u\n", __func__, ViewportXStart);
+	DML_LOG_VERBOSE("DML::%s: ViewportYStart = %u\n", __func__, ViewportYStart);
+	DML_LOG_VERBOSE("DML::%s: ViewportStationary = %u\n", __func__, ViewportStationary);
+	DML_LOG_VERBOSE("DML::%s: SwathHeight = %u\n", __func__, SwathHeight);
 #endif
 	if (ProgressiveToInterlaceUnitInOPP)
 		*VInitPreFill = (unsigned int)(math_floor2((VRatio + (double)VTaps + 1) / 2.0, 1));
@@ -1934,11 +1877,11 @@ static unsigned int CalculatePrefetchSourceLines(
 	numLines = *MaxNumSwath * SwathHeight + MaxPartialSwath;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: vp_start_rot = %u\n", __func__, vp_start_rot);
-	dml2_printf("DML::%s: VInitPreFill = %u\n", __func__, *VInitPreFill);
-	dml2_printf("DML::%s: MaxPartialSwath = %u\n", __func__, MaxPartialSwath);
-	dml2_printf("DML::%s: MaxNumSwath = %u\n", __func__, *MaxNumSwath);
-	dml2_printf("DML::%s: Prefetch source lines = %3.2f\n", __func__, numLines);
+	DML_LOG_VERBOSE("DML::%s: vp_start_rot = %u\n", __func__, vp_start_rot);
+	DML_LOG_VERBOSE("DML::%s: VInitPreFill = %u\n", __func__, *VInitPreFill);
+	DML_LOG_VERBOSE("DML::%s: MaxPartialSwath = %u\n", __func__, MaxPartialSwath);
+	DML_LOG_VERBOSE("DML::%s: MaxNumSwath = %u\n", __func__, *MaxNumSwath);
+	DML_LOG_VERBOSE("DML::%s: Prefetch source lines = %3.2f\n", __func__, numLines);
 #endif
 	return (unsigned int)(numLines);
 
@@ -2007,8 +1950,8 @@ static void CalculateMALLUseForStaticScreen(
 		if (is_using_mall_for_ss[k])
 			TotalSurfaceSizeInMALL = TotalSurfaceSizeInMALL + SurfaceSizeInMALL[k];
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, is_using_mall_for_ss = %u\n", __func__, k, is_using_mall_for_ss[k]);
-		dml2_printf("DML::%s: k=%u, TotalSurfaceSizeInMALL = %u\n", __func__, k, TotalSurfaceSizeInMALL);
+		DML_LOG_VERBOSE("DML::%s: k=%u, is_using_mall_for_ss = %u\n", __func__, k, is_using_mall_for_ss[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, TotalSurfaceSizeInMALL = %u\n", __func__, k, TotalSurfaceSizeInMALL);
 #endif
 	}
 
@@ -2022,7 +1965,7 @@ static void CalculateMALLUseForStaticScreen(
 				(!CanAddAnotherSurfaceToMALL || SurfaceSizeInMALL[k] < SurfaceSizeInMALL[SurfaceToAddToMALL])) {
 				CanAddAnotherSurfaceToMALL = true;
 				SurfaceToAddToMALL = k;
-				dml2_printf("DML::%s: k=%u, UseMALLForStaticScreen = %u (dis, en, optimize)\n", __func__, k, display_cfg->plane_descriptors[k].overrides.refresh_from_mall);
+				DML_LOG_VERBOSE("DML::%s: k=%u, UseMALLForStaticScreen = %u (dis, en, optimize)\n", __func__, k, display_cfg->plane_descriptors[k].overrides.refresh_from_mall);
 			}
 		}
 		if (CanAddAnotherSurfaceToMALL) {
@@ -2030,8 +1973,8 @@ static void CalculateMALLUseForStaticScreen(
 			TotalSurfaceSizeInMALL = TotalSurfaceSizeInMALL + SurfaceSizeInMALL[SurfaceToAddToMALL];
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: SurfaceToAddToMALL = %u\n", __func__, SurfaceToAddToMALL);
-			dml2_printf("DML::%s: TotalSurfaceSizeInMALL = %u\n", __func__, TotalSurfaceSizeInMALL);
+			DML_LOG_VERBOSE("DML::%s: SurfaceToAddToMALL = %u\n", __func__, SurfaceToAddToMALL);
+			DML_LOG_VERBOSE("DML::%s: TotalSurfaceSizeInMALL = %u\n", __func__, TotalSurfaceSizeInMALL);
 #endif
 		}
 	}
@@ -2203,15 +2146,15 @@ static void CalculateDCCConfiguration(
 		segment_order_vert_contiguous_chroma = 0;
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DCCEnabled = %u\n", __func__, DCCEnabled);
-	dml2_printf("DML::%s: nomDETInKByte = %u\n", __func__, nomDETInKByte);
-	dml2_printf("DML::%s: DETBufferSizeForDCC = %u\n", __func__, DETBufferSizeForDCC);
-	dml2_printf("DML::%s: req128_horz_wc_l = %u\n", __func__, req128_horz_wc_l);
-	dml2_printf("DML::%s: req128_horz_wc_c = %u\n", __func__, req128_horz_wc_c);
-	dml2_printf("DML::%s: full_swath_bytes_horz_wc_l = %u\n", __func__, full_swath_bytes_horz_wc_l);
-	dml2_printf("DML::%s: full_swath_bytes_vert_wc_c = %u\n", __func__, full_swath_bytes_vert_wc_c);
-	dml2_printf("DML::%s: segment_order_horz_contiguous_luma = %u\n", __func__, segment_order_horz_contiguous_luma);
-	dml2_printf("DML::%s: segment_order_horz_contiguous_chroma = %u\n", __func__, segment_order_horz_contiguous_chroma);
+	DML_LOG_VERBOSE("DML::%s: DCCEnabled = %u\n", __func__, DCCEnabled);
+	DML_LOG_VERBOSE("DML::%s: nomDETInKByte = %u\n", __func__, nomDETInKByte);
+	DML_LOG_VERBOSE("DML::%s: DETBufferSizeForDCC = %u\n", __func__, DETBufferSizeForDCC);
+	DML_LOG_VERBOSE("DML::%s: req128_horz_wc_l = %u\n", __func__, req128_horz_wc_l);
+	DML_LOG_VERBOSE("DML::%s: req128_horz_wc_c = %u\n", __func__, req128_horz_wc_c);
+	DML_LOG_VERBOSE("DML::%s: full_swath_bytes_horz_wc_l = %u\n", __func__, full_swath_bytes_horz_wc_l);
+	DML_LOG_VERBOSE("DML::%s: full_swath_bytes_vert_wc_c = %u\n", __func__, full_swath_bytes_vert_wc_c);
+	DML_LOG_VERBOSE("DML::%s: segment_order_horz_contiguous_luma = %u\n", __func__, segment_order_horz_contiguous_luma);
+	DML_LOG_VERBOSE("DML::%s: segment_order_horz_contiguous_chroma = %u\n", __func__, segment_order_horz_contiguous_chroma);
 #endif
 	if (DCCProgrammingAssumesScanDirectionUnknown == true) {
 		if (req128_horz_wc_l == 0 && req128_vert_wc_l == 0) {
@@ -2301,12 +2244,12 @@ static void CalculateDCCConfiguration(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: MaxUncompressedBlockLuma = %u\n", __func__, *MaxUncompressedBlockLuma);
-	dml2_printf("DML::%s: MaxCompressedBlockLuma = %u\n", __func__, *MaxCompressedBlockLuma);
-	dml2_printf("DML::%s: IndependentBlockLuma = %u\n", __func__, *IndependentBlockLuma);
-	dml2_printf("DML::%s: MaxUncompressedBlockChroma = %u\n", __func__, *MaxUncompressedBlockChroma);
-	dml2_printf("DML::%s: MaxCompressedBlockChroma = %u\n", __func__, *MaxCompressedBlockChroma);
-	dml2_printf("DML::%s: IndependentBlockChroma = %u\n", __func__, *IndependentBlockChroma);
+	DML_LOG_VERBOSE("DML::%s: MaxUncompressedBlockLuma = %u\n", __func__, *MaxUncompressedBlockLuma);
+	DML_LOG_VERBOSE("DML::%s: MaxCompressedBlockLuma = %u\n", __func__, *MaxCompressedBlockLuma);
+	DML_LOG_VERBOSE("DML::%s: IndependentBlockLuma = %u\n", __func__, *IndependentBlockLuma);
+	DML_LOG_VERBOSE("DML::%s: MaxUncompressedBlockChroma = %u\n", __func__, *MaxUncompressedBlockChroma);
+	DML_LOG_VERBOSE("DML::%s: MaxCompressedBlockChroma = %u\n", __func__, *MaxCompressedBlockChroma);
+	DML_LOG_VERBOSE("DML::%s: IndependentBlockChroma = %u\n", __func__, *IndependentBlockChroma);
 #endif
 
 }
@@ -2326,26 +2269,26 @@ static void calculate_mcache_row_bytes(
 	unsigned int mvmpg_per_mcache;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: num_chans = %u\n", __func__, p->num_chans);
-	dml2_printf("DML::%s: mem_word_bytes = %u\n", __func__, p->mem_word_bytes);
-	dml2_printf("DML::%s: mcache_line_size_bytes = %u\n", __func__, p->mcache_line_size_bytes);
-	dml2_printf("DML::%s: mcache_size_bytes = %u\n", __func__, p->mcache_size_bytes);
-	dml2_printf("DML::%s: gpuvm_enable = %u\n", __func__, p->gpuvm_enable);
-	dml2_printf("DML::%s: gpuvm_page_size_kbytes = %u\n", __func__, p->gpuvm_page_size_kbytes);
-	dml2_printf("DML::%s: vp_stationary = %u\n", __func__, p->vp_stationary);
-	dml2_printf("DML::%s: tiling_mode = %u\n", __func__, p->tiling_mode);
-	dml2_printf("DML::%s: vp_start_x = %u\n", __func__, p->vp_start_x);
-	dml2_printf("DML::%s: vp_start_y = %u\n", __func__, p->vp_start_y);
-	dml2_printf("DML::%s: full_vp_width = %u\n", __func__, p->full_vp_width);
-	dml2_printf("DML::%s: full_vp_height = %u\n", __func__, p->full_vp_height);
-	dml2_printf("DML::%s: blk_width = %u\n", __func__, p->blk_width);
-	dml2_printf("DML::%s: blk_height = %u\n", __func__, p->blk_height);
-	dml2_printf("DML::%s: vmpg_width = %u\n", __func__, p->vmpg_width);
-	dml2_printf("DML::%s: vmpg_height = %u\n", __func__, p->vmpg_height);
-	dml2_printf("DML::%s: full_swath_bytes = %u\n", __func__, p->full_swath_bytes);
-#endif
-	DML2_ASSERT(p->mcache_line_size_bytes != 0);
-	DML2_ASSERT(p->mcache_size_bytes != 0);
+	DML_LOG_VERBOSE("DML::%s: num_chans = %u\n", __func__, p->num_chans);
+	DML_LOG_VERBOSE("DML::%s: mem_word_bytes = %u\n", __func__, p->mem_word_bytes);
+	DML_LOG_VERBOSE("DML::%s: mcache_line_size_bytes = %u\n", __func__, p->mcache_line_size_bytes);
+	DML_LOG_VERBOSE("DML::%s: mcache_size_bytes = %u\n", __func__, p->mcache_size_bytes);
+	DML_LOG_VERBOSE("DML::%s: gpuvm_enable = %u\n", __func__, p->gpuvm_enable);
+	DML_LOG_VERBOSE("DML::%s: gpuvm_page_size_kbytes = %u\n", __func__, p->gpuvm_page_size_kbytes);
+	DML_LOG_VERBOSE("DML::%s: vp_stationary = %u\n", __func__, p->vp_stationary);
+	DML_LOG_VERBOSE("DML::%s: tiling_mode = %u\n", __func__, p->tiling_mode);
+	DML_LOG_VERBOSE("DML::%s: vp_start_x = %u\n", __func__, p->vp_start_x);
+	DML_LOG_VERBOSE("DML::%s: vp_start_y = %u\n", __func__, p->vp_start_y);
+	DML_LOG_VERBOSE("DML::%s: full_vp_width = %u\n", __func__, p->full_vp_width);
+	DML_LOG_VERBOSE("DML::%s: full_vp_height = %u\n", __func__, p->full_vp_height);
+	DML_LOG_VERBOSE("DML::%s: blk_width = %u\n", __func__, p->blk_width);
+	DML_LOG_VERBOSE("DML::%s: blk_height = %u\n", __func__, p->blk_height);
+	DML_LOG_VERBOSE("DML::%s: vmpg_width = %u\n", __func__, p->vmpg_width);
+	DML_LOG_VERBOSE("DML::%s: vmpg_height = %u\n", __func__, p->vmpg_height);
+	DML_LOG_VERBOSE("DML::%s: full_swath_bytes = %u\n", __func__, p->full_swath_bytes);
+#endif
+	DML_ASSERT(p->mcache_line_size_bytes != 0);
+	DML_ASSERT(p->mcache_size_bytes != 0);
 
 	*p->mvmpg_width = 0;
 	*p->mvmpg_height = 0;
@@ -2370,8 +2313,8 @@ static void calculate_mcache_row_bytes(
 				*p->mvmpg_width = p->vmpg_width;
 				*p->mvmpg_height = p->vmpg_height;
 			} else if (!((blk_bytes == 65536) && (vmpg_bytes == 4096))) {
-				dml2_printf("ERROR: DML::%s: Tiling size and vm page size combination not supported\n", __func__);
-				DML2_ASSERT(0);
+				DML_LOG_VERBOSE("ERROR: DML::%s: Tiling size and vm page size combination not supported\n", __func__);
+				DML_ASSERT(0);
 			}
 		}
 
@@ -2439,25 +2382,25 @@ static void calculate_mcache_row_bytes(
 		*p->mvmpg_per_mcache_lb = (unsigned int)math_floor2(mvmpg_per_mcache, 1);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: gpuvm_enable = %u\n", __func__, p->gpuvm_enable);
-		dml2_printf("DML::%s: vmpg_bytes = %u\n", __func__, vmpg_bytes);
-		dml2_printf("DML::%s: blk_bytes = %u\n", __func__, blk_bytes);
-		dml2_printf("DML::%s: meta_per_mvmpg_per_channel = %f\n", __func__, meta_per_mvmpg_per_channel);
-		dml2_printf("DML::%s: mvmpg_per_row_ub = %u\n", __func__, mvmpg_per_row_ub);
-		dml2_printf("DML::%s: meta_row_width_ub = %u\n", __func__, *p->meta_row_width_ub);
-		dml2_printf("DML::%s: mvmpg_width = %u\n", __func__, *p->mvmpg_width);
-		dml2_printf("DML::%s: mvmpg_height = %u\n", __func__, *p->mvmpg_height);
-		dml2_printf("DML::%s: dcc_dram_bw_nom_overhead_factor = %f\n", __func__, *p->dcc_dram_bw_nom_overhead_factor);
-		dml2_printf("DML::%s: dcc_dram_bw_pref_overhead_factor = %f\n", __func__, *p->dcc_dram_bw_pref_overhead_factor);
+		DML_LOG_VERBOSE("DML::%s: gpuvm_enable = %u\n", __func__, p->gpuvm_enable);
+		DML_LOG_VERBOSE("DML::%s: vmpg_bytes = %u\n", __func__, vmpg_bytes);
+		DML_LOG_VERBOSE("DML::%s: blk_bytes = %u\n", __func__, blk_bytes);
+		DML_LOG_VERBOSE("DML::%s: meta_per_mvmpg_per_channel = %f\n", __func__, meta_per_mvmpg_per_channel);
+		DML_LOG_VERBOSE("DML::%s: mvmpg_per_row_ub = %u\n", __func__, mvmpg_per_row_ub);
+		DML_LOG_VERBOSE("DML::%s: meta_row_width_ub = %u\n", __func__, *p->meta_row_width_ub);
+		DML_LOG_VERBOSE("DML::%s: mvmpg_width = %u\n", __func__, *p->mvmpg_width);
+		DML_LOG_VERBOSE("DML::%s: mvmpg_height = %u\n", __func__, *p->mvmpg_height);
+		DML_LOG_VERBOSE("DML::%s: dcc_dram_bw_nom_overhead_factor = %f\n", __func__, *p->dcc_dram_bw_nom_overhead_factor);
+		DML_LOG_VERBOSE("DML::%s: dcc_dram_bw_pref_overhead_factor = %f\n", __func__, *p->dcc_dram_bw_pref_overhead_factor);
 #endif
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: mcache_row_bytes = %u\n", __func__, *p->mcache_row_bytes);
-	dml2_printf("DML::%s: mcache_row_bytes_per_channel = %u\n", __func__, *p->mcache_row_bytes_per_channel);
-	dml2_printf("DML::%s: num_mcaches = %u\n", __func__, *p->num_mcaches);
+	DML_LOG_VERBOSE("DML::%s: mcache_row_bytes = %u\n", __func__, *p->mcache_row_bytes);
+	DML_LOG_VERBOSE("DML::%s: mcache_row_bytes_per_channel = %u\n", __func__, *p->mcache_row_bytes_per_channel);
+	DML_LOG_VERBOSE("DML::%s: num_mcaches = %u\n", __func__, *p->num_mcaches);
 #endif
-	DML2_ASSERT(*p->num_mcaches > 0);
+	DML_ASSERT(*p->num_mcaches > 0);
 }
 
 static void calculate_mcache_setting(
@@ -2523,7 +2466,7 @@ static void calculate_mcache_setting(
 	l->l_p.mvmpg_per_mcache_lb = &l->mvmpg_per_mcache_lb_l;
 
 	calculate_mcache_row_bytes(scratch, &l->l_p);
-	DML2_ASSERT(*p->num_mcaches_l > 0);
+	DML_ASSERT(*p->num_mcaches_l > 0);
 
 	if (l->is_dual_plane) {
 		l->c_p.num_chans = p->num_chans;
@@ -2559,7 +2502,7 @@ static void calculate_mcache_setting(
 		l->c_p.mvmpg_per_mcache_lb = &l->mvmpg_per_mcache_lb_c;
 
 		calculate_mcache_row_bytes(scratch, &l->c_p);
-		DML2_ASSERT(*p->num_mcaches_c > 0);
+		DML_ASSERT(*p->num_mcaches_c > 0);
 	}
 
 	// Sharing for iMALL access
@@ -2598,28 +2541,28 @@ static void calculate_mcache_setting(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: imall_enable = %u\n", __func__, p->imall_enable);
-	dml2_printf("DML::%s: is_dual_plane = %u\n", __func__, l->is_dual_plane);
-	dml2_printf("DML::%s: surf_vert = %u\n", __func__, p->surf_vert);
-	dml2_printf("DML::%s: mvmpg_width_l = %u\n", __func__, l->mvmpg_width_l);
-	dml2_printf("DML::%s: mvmpg_height_l = %u\n", __func__, l->mvmpg_height_l);
-	dml2_printf("DML::%s: mcache_remainder_l = %f\n", __func__, l->mcache_remainder_l);
-	dml2_printf("DML::%s: num_mcaches_l = %u\n", __func__, *p->num_mcaches_l);
-	dml2_printf("DML::%s: avg_mcache_element_size_l = %u\n", __func__, l->avg_mcache_element_size_l);
-	dml2_printf("DML::%s: mvmpg_access_width_l = %u\n", __func__, l->mvmpg_access_width_l);
-	dml2_printf("DML::%s: mall_comb_mcache_l = %u\n", __func__, *p->mall_comb_mcache_l);
+	DML_LOG_VERBOSE("DML::%s: imall_enable = %u\n", __func__, p->imall_enable);
+	DML_LOG_VERBOSE("DML::%s: is_dual_plane = %u\n", __func__, l->is_dual_plane);
+	DML_LOG_VERBOSE("DML::%s: surf_vert = %u\n", __func__, p->surf_vert);
+	DML_LOG_VERBOSE("DML::%s: mvmpg_width_l = %u\n", __func__, l->mvmpg_width_l);
+	DML_LOG_VERBOSE("DML::%s: mvmpg_height_l = %u\n", __func__, l->mvmpg_height_l);
+	DML_LOG_VERBOSE("DML::%s: mcache_remainder_l = %f\n", __func__, l->mcache_remainder_l);
+	DML_LOG_VERBOSE("DML::%s: num_mcaches_l = %u\n", __func__, *p->num_mcaches_l);
+	DML_LOG_VERBOSE("DML::%s: avg_mcache_element_size_l = %u\n", __func__, l->avg_mcache_element_size_l);
+	DML_LOG_VERBOSE("DML::%s: mvmpg_access_width_l = %u\n", __func__, l->mvmpg_access_width_l);
+	DML_LOG_VERBOSE("DML::%s: mall_comb_mcache_l = %u\n", __func__, *p->mall_comb_mcache_l);
 
 	if (l->is_dual_plane) {
-		dml2_printf("DML::%s: mvmpg_width_c = %u\n", __func__, l->mvmpg_width_c);
-		dml2_printf("DML::%s: mvmpg_height_c = %u\n", __func__, l->mvmpg_height_c);
-		dml2_printf("DML::%s: mcache_remainder_c = %f\n", __func__, l->mcache_remainder_c);
-		dml2_printf("DML::%s: luma_time_factor = %f\n", __func__, l->luma_time_factor);
-		dml2_printf("DML::%s: num_mcaches_c = %u\n", __func__, *p->num_mcaches_c);
-		dml2_printf("DML::%s: avg_mcache_element_size_c = %u\n", __func__, l->avg_mcache_element_size_c);
-		dml2_printf("DML::%s: mvmpg_access_width_c = %u\n", __func__, l->mvmpg_access_width_c);
-		dml2_printf("DML::%s: mall_comb_mcache_c = %u\n", __func__, *p->mall_comb_mcache_c);
-		dml2_printf("DML::%s: lc_comb_last_mcache_size = %u\n", __func__, l->lc_comb_last_mcache_size);
-		dml2_printf("DML::%s: lc_comb_mcache = %u\n", __func__, *p->lc_comb_mcache);
+		DML_LOG_VERBOSE("DML::%s: mvmpg_width_c = %u\n", __func__, l->mvmpg_width_c);
+		DML_LOG_VERBOSE("DML::%s: mvmpg_height_c = %u\n", __func__, l->mvmpg_height_c);
+		DML_LOG_VERBOSE("DML::%s: mcache_remainder_c = %f\n", __func__, l->mcache_remainder_c);
+		DML_LOG_VERBOSE("DML::%s: luma_time_factor = %f\n", __func__, l->luma_time_factor);
+		DML_LOG_VERBOSE("DML::%s: num_mcaches_c = %u\n", __func__, *p->num_mcaches_c);
+		DML_LOG_VERBOSE("DML::%s: avg_mcache_element_size_c = %u\n", __func__, l->avg_mcache_element_size_c);
+		DML_LOG_VERBOSE("DML::%s: mvmpg_access_width_c = %u\n", __func__, l->mvmpg_access_width_c);
+		DML_LOG_VERBOSE("DML::%s: mall_comb_mcache_c = %u\n", __func__, *p->mall_comb_mcache_c);
+		DML_LOG_VERBOSE("DML::%s: lc_comb_last_mcache_size = %u\n", __func__, l->lc_comb_last_mcache_size);
+		DML_LOG_VERBOSE("DML::%s: lc_comb_mcache = %u\n", __func__, *p->lc_comb_mcache);
 	}
 #endif
 	// calculate split_coordinate
@@ -2639,11 +2582,11 @@ static void calculate_mcache_setting(
 	}
 #ifdef __DML_VBA_DEBUG__
 	for (n = 0; n < *p->num_mcaches_l; n++)
-		dml2_printf("DML::%s: mcache_offsets_l[%u] = %u\n", __func__, n, p->mcache_offsets_l[n]);
+		DML_LOG_VERBOSE("DML::%s: mcache_offsets_l[%u] = %u\n", __func__, n, p->mcache_offsets_l[n]);
 
 	if (l->is_dual_plane) {
 		for (n = 0; n < *p->num_mcaches_c; n++)
-			dml2_printf("DML::%s: mcache_offsets_c[%u] = %u\n", __func__, n, p->mcache_offsets_c[n]);
+			DML_LOG_VERBOSE("DML::%s: mcache_offsets_c[%u] = %u\n", __func__, n, p->mcache_offsets_c[n]);
 	}
 #endif
 
@@ -2660,10 +2603,10 @@ static void calculate_mcache_setting(
 
 #ifdef __DML_VBA_DEBUG__
 		for (n = 0; n < *p->num_mcaches_l; n++)
-			dml2_printf("DML::%s: mcache_offsets_l[%u] = %u\n", __func__, n, p->mcache_offsets_l[n]);
+			DML_LOG_VERBOSE("DML::%s: mcache_offsets_l[%u] = %u\n", __func__, n, p->mcache_offsets_l[n]);
 
 		for (n = 0; n < *p->num_mcaches_c; n++)
-			dml2_printf("DML::%s: mcache_offsets_c[%u] = %u\n", __func__, n, p->mcache_offsets_c[n]);
+			DML_LOG_VERBOSE("DML::%s: mcache_offsets_c[%u] = %u\n", __func__, n, p->mcache_offsets_c[n]);
 #endif
 	}
 
@@ -2694,8 +2637,8 @@ static void calculate_mall_bw_overhead_factor(
 			mall_prefetch_dram_overhead_factor[k] = 2.0;
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, mall_prefetch_sdp_overhead_factor = %f\n", __func__, k, mall_prefetch_sdp_overhead_factor[k]);
-		dml2_printf("DML::%s: k=%u, mall_prefetch_dram_overhead_factor = %f\n", __func__, k, mall_prefetch_dram_overhead_factor[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, mall_prefetch_sdp_overhead_factor = %f\n", __func__, k, mall_prefetch_sdp_overhead_factor[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, mall_prefetch_dram_overhead_factor = %f\n", __func__, k, mall_prefetch_dram_overhead_factor[k]);
 #endif
 	}
 }
@@ -2772,22 +2715,20 @@ static double dml_get_return_bandwidth_available(
 	else // dml2_core_internal_bw_dram
 		return_bw_mbps = derate_dram_bandwidth;
 
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: is_avg_bw = %u\n", __func__, is_avg_bw);
-	dml2_printf("DML::%s: is_hvm_en = %u\n", __func__, is_hvm_en);
-	dml2_printf("DML::%s: is_hvm_only = %u\n", __func__, is_hvm_only);
-	dml2_printf("DML::%s: state_type = %s\n", __func__, dml2_core_internal_soc_state_type_str(state_type));
-	dml2_printf("DML::%s: bw_type = %s\n", __func__, dml2_core_internal_bw_type_str(bw_type));
-	dml2_printf("DML::%s: dcfclk_mhz = %f\n", __func__, dcfclk_mhz);
-	dml2_printf("DML::%s: fclk_mhz = %f\n", __func__, fclk_mhz);
-	dml2_printf("DML::%s: ideal_sdp_bandwidth = %f\n", __func__, ideal_sdp_bandwidth);
-	dml2_printf("DML::%s: ideal_fabric_bandwidth = %f\n", __func__, ideal_fabric_bandwidth);
-	dml2_printf("DML::%s: ideal_dram_bandwidth = %f\n", __func__, ideal_dram_bandwidth);
-	dml2_printf("DML::%s: derate_sdp_bandwidth = %f (derate %f)\n", __func__, derate_sdp_bandwidth, derate_sdp_factor);
-	dml2_printf("DML::%s: derate_fabric_bandwidth = %f (derate %f)\n", __func__, derate_fabric_bandwidth, derate_fabric_factor);
-	dml2_printf("DML::%s: derate_dram_bandwidth = %f (derate %f)\n", __func__, derate_dram_bandwidth, derate_dram_factor);
-	dml2_printf("DML::%s: return_bw_mbps = %f\n", __func__, return_bw_mbps);
-#endif
+	DML_LOG_VERBOSE("DML::%s: is_avg_bw = %u\n", __func__, is_avg_bw);
+	DML_LOG_VERBOSE("DML::%s: is_hvm_en = %u\n", __func__, is_hvm_en);
+	DML_LOG_VERBOSE("DML::%s: is_hvm_only = %u\n", __func__, is_hvm_only);
+	DML_LOG_VERBOSE("DML::%s: state_type = %s\n", __func__, dml2_core_internal_soc_state_type_str(state_type));
+	DML_LOG_VERBOSE("DML::%s: bw_type = %s\n", __func__, dml2_core_internal_bw_type_str(bw_type));
+	DML_LOG_VERBOSE("DML::%s: dcfclk_mhz = %f\n", __func__, dcfclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: fclk_mhz = %f\n", __func__, fclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: ideal_sdp_bandwidth = %f\n", __func__, ideal_sdp_bandwidth);
+	DML_LOG_VERBOSE("DML::%s: ideal_fabric_bandwidth = %f\n", __func__, ideal_fabric_bandwidth);
+	DML_LOG_VERBOSE("DML::%s: ideal_dram_bandwidth = %f\n", __func__, ideal_dram_bandwidth);
+	DML_LOG_VERBOSE("DML::%s: derate_sdp_bandwidth = %f (derate %f)\n", __func__, derate_sdp_bandwidth, derate_sdp_factor);
+	DML_LOG_VERBOSE("DML::%s: derate_fabric_bandwidth = %f (derate %f)\n", __func__, derate_fabric_bandwidth, derate_fabric_factor);
+	DML_LOG_VERBOSE("DML::%s: derate_dram_bandwidth = %f (derate %f)\n", __func__, derate_dram_bandwidth, derate_dram_factor);
+	DML_LOG_VERBOSE("DML::%s: return_bw_mbps = %f\n", __func__, return_bw_mbps);
 	return return_bw_mbps;
 }
 
@@ -2807,9 +2748,9 @@ static noinline_for_stack void calculate_bandwidth_available(
 {
 	unsigned int n, m;
 
-	dml2_printf("DML::%s: dcfclk_mhz = %f\n", __func__, dcfclk_mhz);
-	dml2_printf("DML::%s: fclk_mhz = %f\n", __func__, fclk_mhz);
-	dml2_printf("DML::%s: dram_bw_mbps = %f\n", __func__, dram_bw_mbps);
+	DML_LOG_VERBOSE("DML::%s: dcfclk_mhz = %f\n", __func__, dcfclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: fclk_mhz = %f\n", __func__, fclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: dram_bw_mbps = %f\n", __func__, dram_bw_mbps);
 
 	// Calculate all the bandwidth availabe
 	for (m = 0; m < dml2_core_internal_soc_state_max; m++) {
@@ -2828,8 +2769,8 @@ static noinline_for_stack void calculate_bandwidth_available(
 
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: avg_bandwidth_available[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), avg_bandwidth_available[m][n]);
-			dml2_printf("DML::%s: urg_bandwidth_available[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), urg_bandwidth_available[m][n]);
+			DML_LOG_VERBOSE("DML::%s: avg_bandwidth_available[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), avg_bandwidth_available[m][n]);
+			DML_LOG_VERBOSE("DML::%s: urg_bandwidth_available[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), urg_bandwidth_available[m][n]);
 #endif
 
 			// urg_bandwidth_available_vm_only is indexed by soc_state
@@ -2843,9 +2784,9 @@ static noinline_for_stack void calculate_bandwidth_available(
 		urg_bandwidth_available_min[m] = math_min2(urg_bandwidth_available[m][dml2_core_internal_bw_dram], urg_bandwidth_available[m][dml2_core_internal_bw_sdp]);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: avg_bandwidth_available_min[%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), avg_bandwidth_available_min[m]);
-		dml2_printf("DML::%s: urg_bandwidth_available_min[%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), urg_bandwidth_available_min[m]);
-		dml2_printf("DML::%s: urg_bandwidth_available_vm_only[%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), urg_bandwidth_available_vm_only[n]);
+		DML_LOG_VERBOSE("DML::%s: avg_bandwidth_available_min[%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), avg_bandwidth_available_min[m]);
+		DML_LOG_VERBOSE("DML::%s: urg_bandwidth_available_min[%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), urg_bandwidth_available_min[m]);
+		DML_LOG_VERBOSE("DML::%s: urg_bandwidth_available_vm_only[%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), urg_bandwidth_available_vm_only[n]);
 #endif
 	}
 }
@@ -2879,13 +2820,13 @@ static void calculate_avg_bandwidth_required(
 	// SysActive and SVP Prefetch AVG bandwidth Check
 	for (k = 0; k < num_active_planes; ++k) {
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: plane %0d\n", __func__, k);
-		dml2_printf("DML::%s: ReadBandwidthLuma=%f\n", __func__, ReadBandwidthLuma[k]);
-		dml2_printf("DML::%s: ReadBandwidthChroma=%f\n", __func__, ReadBandwidthChroma[k]);
-		dml2_printf("DML::%s: dcc_dram_bw_nom_overhead_factor_p0=%f\n", __func__, dcc_dram_bw_nom_overhead_factor_p0[k]);
-		dml2_printf("DML::%s: dcc_dram_bw_nom_overhead_factor_p1=%f\n", __func__, dcc_dram_bw_nom_overhead_factor_p1[k]);
-		dml2_printf("DML::%s: mall_prefetch_dram_overhead_factor=%f\n", __func__, mall_prefetch_dram_overhead_factor[k]);
-		dml2_printf("DML::%s: mall_prefetch_sdp_overhead_factor=%f\n", __func__, mall_prefetch_sdp_overhead_factor[k]);
+		DML_LOG_VERBOSE("DML::%s: plane %0d\n", __func__, k);
+		DML_LOG_VERBOSE("DML::%s: ReadBandwidthLuma=%f\n", __func__, ReadBandwidthLuma[k]);
+		DML_LOG_VERBOSE("DML::%s: ReadBandwidthChroma=%f\n", __func__, ReadBandwidthChroma[k]);
+		DML_LOG_VERBOSE("DML::%s: dcc_dram_bw_nom_overhead_factor_p0=%f\n", __func__, dcc_dram_bw_nom_overhead_factor_p0[k]);
+		DML_LOG_VERBOSE("DML::%s: dcc_dram_bw_nom_overhead_factor_p1=%f\n", __func__, dcc_dram_bw_nom_overhead_factor_p1[k]);
+		DML_LOG_VERBOSE("DML::%s: mall_prefetch_dram_overhead_factor=%f\n", __func__, mall_prefetch_dram_overhead_factor[k]);
+		DML_LOG_VERBOSE("DML::%s: mall_prefetch_sdp_overhead_factor=%f\n", __func__, mall_prefetch_sdp_overhead_factor[k]);
 #endif
 
 		sdp_overhead_factor = mall_prefetch_sdp_overhead_factor[k];
@@ -2902,10 +2843,10 @@ static void calculate_avg_bandwidth_required(
 		avg_bandwidth_required[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_dram] += dram_overhead_factor_p0 * ReadBandwidthLuma[k] + dram_overhead_factor_p1 * ReadBandwidthChroma[k] + cursor_bw[k];
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: avg_bandwidth_required[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(dml2_core_internal_soc_state_sys_active), dml2_core_internal_bw_type_str(dml2_core_internal_bw_sdp), avg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]);
-		dml2_printf("DML::%s: avg_bandwidth_required[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(dml2_core_internal_soc_state_sys_active), dml2_core_internal_bw_type_str(dml2_core_internal_bw_dram), avg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_dram]);
-		dml2_printf("DML::%s: avg_bandwidth_required[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(dml2_core_internal_soc_state_svp_prefetch), dml2_core_internal_bw_type_str(dml2_core_internal_bw_sdp), avg_bandwidth_required[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_sdp]);
-		dml2_printf("DML::%s: avg_bandwidth_required[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(dml2_core_internal_soc_state_svp_prefetch), dml2_core_internal_bw_type_str(dml2_core_internal_bw_dram), avg_bandwidth_required[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_dram]);
+		DML_LOG_VERBOSE("DML::%s: avg_bandwidth_required[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(dml2_core_internal_soc_state_sys_active), dml2_core_internal_bw_type_str(dml2_core_internal_bw_sdp), avg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]);
+		DML_LOG_VERBOSE("DML::%s: avg_bandwidth_required[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(dml2_core_internal_soc_state_sys_active), dml2_core_internal_bw_type_str(dml2_core_internal_bw_dram), avg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_dram]);
+		DML_LOG_VERBOSE("DML::%s: avg_bandwidth_required[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(dml2_core_internal_soc_state_svp_prefetch), dml2_core_internal_bw_type_str(dml2_core_internal_bw_sdp), avg_bandwidth_required[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_sdp]);
+		DML_LOG_VERBOSE("DML::%s: avg_bandwidth_required[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(dml2_core_internal_soc_state_svp_prefetch), dml2_core_internal_bw_type_str(dml2_core_internal_bw_dram), avg_bandwidth_required[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_dram]);
 #endif
 	}
 }
@@ -3080,10 +3021,10 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 			&p->MaxNumSwathY[k]);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, vm_bytes_l = %u (before hvm level)\n", __func__, k, s->vm_bytes_l);
-		dml2_printf("DML::%s: k=%u, vm_bytes_c = %u (before hvm level)\n", __func__, k, s->vm_bytes_c);
-		dml2_printf("DML::%s: k=%u, meta_row_bytes_per_row_ub_l = %u\n", __func__, k, s->meta_row_bytes_per_row_ub_l[k]);
-		dml2_printf("DML::%s: k=%u, meta_row_bytes_per_row_ub_c = %u\n", __func__, k, s->meta_row_bytes_per_row_ub_c[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, vm_bytes_l = %u (before hvm level)\n", __func__, k, s->vm_bytes_l);
+		DML_LOG_VERBOSE("DML::%s: k=%u, vm_bytes_c = %u (before hvm level)\n", __func__, k, s->vm_bytes_c);
+		DML_LOG_VERBOSE("DML::%s: k=%u, meta_row_bytes_per_row_ub_l = %u\n", __func__, k, s->meta_row_bytes_per_row_ub_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, meta_row_bytes_per_row_ub_c = %u\n", __func__, k, s->meta_row_bytes_per_row_ub_c[k]);
 #endif
 		p->vm_bytes[k] = (s->vm_bytes_l + s->vm_bytes_c) * (1 + 8 * s->HostVMDynamicLevels);
 		p->meta_row_bytes[k] = s->meta_row_bytes_per_row_ub_l[k] + s->meta_row_bytes_per_row_ub_c[k];
@@ -3091,8 +3032,8 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 		p->meta_row_bytes_per_row_ub_c[k] = s->meta_row_bytes_per_row_ub_c[k];
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, meta_row_bytes = %u\n", __func__, k, p->meta_row_bytes[k]);
-		dml2_printf("DML::%s: k=%u, vm_bytes = %u (after hvm level)\n", __func__, k, p->vm_bytes[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, meta_row_bytes = %u\n", __func__, k, p->meta_row_bytes[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, vm_bytes = %u (after hvm level)\n", __func__, k, p->vm_bytes[k]);
 #endif
 		if (s->PixelPTEBytesPerRowStorageY[k] <= 64 * s->PTEBufferSizeInRequestsForLuma[k] && s->PixelPTEBytesPerRowStorageC[k] <= 64 * s->PTEBufferSizeInRequestsForChroma[k]) {
 			p->PTEBufferSizeNotExceeded[k] = true;
@@ -3104,18 +3045,18 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 												s->PixelPTEBytesPerRowC_one_row_per_frame[k] <= 64 * 2 * s->PTEBufferSizeInRequestsForChroma[k]);
 #ifdef __DML_VBA_DEBUG__
 		if (p->PTEBufferSizeNotExceeded[k] == 0 || s->one_row_per_frame_fits_in_buffer[k] == 0) {
-			dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRowY = %u (before hvm level)\n", __func__, k, s->PixelPTEBytesPerRowY[k]);
-			dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRowC = %u (before hvm level)\n", __func__, k, s->PixelPTEBytesPerRowC[k]);
-			dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRowStorageY = %u\n", __func__, k, s->PixelPTEBytesPerRowStorageY[k]);
-			dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRowStorageC = %u\n", __func__, k, s->PixelPTEBytesPerRowStorageC[k]);
-			dml2_printf("DML::%s: k=%u, PTEBufferSizeInRequestsForLuma = %u\n", __func__, k, s->PTEBufferSizeInRequestsForLuma[k]);
-			dml2_printf("DML::%s: k=%u, PTEBufferSizeInRequestsForChroma = %u\n", __func__, k, s->PTEBufferSizeInRequestsForChroma[k]);
-			dml2_printf("DML::%s: k=%u, PTEBufferSizeNotExceeded (not one_row_per_frame) = %u\n", __func__, k, p->PTEBufferSizeNotExceeded[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRowY = %u (before hvm level)\n", __func__, k, s->PixelPTEBytesPerRowY[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRowC = %u (before hvm level)\n", __func__, k, s->PixelPTEBytesPerRowC[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRowStorageY = %u\n", __func__, k, s->PixelPTEBytesPerRowStorageY[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRowStorageC = %u\n", __func__, k, s->PixelPTEBytesPerRowStorageC[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PTEBufferSizeInRequestsForLuma = %u\n", __func__, k, s->PTEBufferSizeInRequestsForLuma[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PTEBufferSizeInRequestsForChroma = %u\n", __func__, k, s->PTEBufferSizeInRequestsForChroma[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PTEBufferSizeNotExceeded (not one_row_per_frame) = %u\n", __func__, k, p->PTEBufferSizeNotExceeded[k]);
 
-			dml2_printf("DML::%s: k=%u, HostVMDynamicLevels = %u\n", __func__, k, s->HostVMDynamicLevels);
-			dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRowY_one_row_per_frame = %u\n", __func__, k, s->PixelPTEBytesPerRowY_one_row_per_frame[k]);
-			dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRowC_one_row_per_frame = %u\n", __func__, k, s->PixelPTEBytesPerRowC_one_row_per_frame[k]);
-			dml2_printf("DML::%s: k=%u, one_row_per_frame_fits_in_buffer = %u\n", __func__, k, s->one_row_per_frame_fits_in_buffer[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, HostVMDynamicLevels = %u\n", __func__, k, s->HostVMDynamicLevels);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRowY_one_row_per_frame = %u\n", __func__, k, s->PixelPTEBytesPerRowY_one_row_per_frame[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRowC_one_row_per_frame = %u\n", __func__, k, s->PixelPTEBytesPerRowC_one_row_per_frame[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, one_row_per_frame_fits_in_buffer = %u\n", __func__, k, s->one_row_per_frame_fits_in_buffer[k]);
 		}
 #endif
 	}
@@ -3146,8 +3087,8 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
 		p->DCCMetaBufferSizeNotExceeded[k] = true;
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, SurfaceSizeInMALL = %u\n", __func__, k, p->SurfaceSizeInMALL[k]);
-		dml2_printf("DML::%s: k=%u, is_using_mall_for_ss = %u\n", __func__, k, p->is_using_mall_for_ss[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, SurfaceSizeInMALL = %u\n", __func__, k, p->SurfaceSizeInMALL[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, is_using_mall_for_ss = %u\n", __func__, k, p->is_using_mall_for_ss[k]);
 #endif
 		p->use_one_row_for_frame[k] = p->myPipe[k].FORCE_ONE_ROW_FOR_FRAME || p->is_using_mall_for_ss[k] || (p->display_cfg->plane_descriptors[k].overrides.legacy_svp_config == dml2_svp_mode_override_main_pipe) ||
 			(dml_is_phantom_pipe(&p->display_cfg->plane_descriptors[k])) || (p->display_cfg->plane_descriptors[k].overrides.gpuvm_min_page_size_kbytes > 64 && dml_is_vertical_rotation(p->myPipe[k].RotationAngle));
@@ -3170,9 +3111,9 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 			p->DCCMetaBufferSizeNotExceeded[k] = false;
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%d, meta_row_bytes = %d\n",  __func__, k, p->meta_row_bytes[k]);
-			dml2_printf("DML::%s: k=%d, DCCMetaBufferSizeBytes = %d\n",  __func__, k, p->DCCMetaBufferSizeBytes);
-			dml2_printf("DML::%s: k=%d, DCCMetaBufferSizeNotExceeded = %d\n",  __func__, k, p->DCCMetaBufferSizeNotExceeded[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, meta_row_bytes = %d\n",  __func__, k, p->meta_row_bytes[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, DCCMetaBufferSizeBytes = %d\n",  __func__, k, p->DCCMetaBufferSizeBytes);
+			DML_LOG_VERBOSE("DML::%s: k=%d, DCCMetaBufferSizeNotExceeded = %d\n",  __func__, k, p->DCCMetaBufferSizeNotExceeded[k]);
 #endif
 		}
 
@@ -3209,20 +3150,20 @@ static void CalculateVMRowAndSwath(struct dml2_core_internal_scratch *scratch,
 			&p->dpte_row_bw[k],
 			&p->meta_row_bw[k]);
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, use_one_row_for_frame = %u\n", __func__, k, p->use_one_row_for_frame[k]);
-		dml2_printf("DML::%s: k=%u, use_one_row_for_frame_flip = %u\n", __func__, k, p->use_one_row_for_frame_flip[k]);
-		dml2_printf("DML::%s: k=%u, UseMALLForPStateChange = %u\n", __func__, k, p->display_cfg->plane_descriptors[k].overrides.legacy_svp_config);
-		dml2_printf("DML::%s: k=%u, dpte_row_height_luma = %u\n", __func__, k, p->dpte_row_height_luma[k]);
-		dml2_printf("DML::%s: k=%u, dpte_row_width_luma_ub = %u\n", __func__, k, p->dpte_row_width_luma_ub[k]);
-		dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRowY = %u (after hvm level)\n", __func__, k, s->PixelPTEBytesPerRowY[k]);
-		dml2_printf("DML::%s: k=%u, dpte_row_height_chroma = %u\n", __func__, k, p->dpte_row_height_chroma[k]);
-		dml2_printf("DML::%s: k=%u, dpte_row_width_chroma_ub = %u\n", __func__, k, p->dpte_row_width_chroma_ub[k]);
-		dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRowC = %u (after hvm level)\n", __func__, k, s->PixelPTEBytesPerRowC[k]);
-		dml2_printf("DML::%s: k=%u, PixelPTEBytesPerRow = %u\n", __func__, k, p->PixelPTEBytesPerRow[k]);
-		dml2_printf("DML::%s: k=%u, PTEBufferSizeNotExceeded = %u\n", __func__, k, p->PTEBufferSizeNotExceeded[k]);
-		dml2_printf("DML::%s: k=%u, gpuvm_enable = %u\n", __func__, k, p->display_cfg->gpuvm_enable);
-		dml2_printf("DML::%s: k=%u, PTE_BUFFER_MODE = %u\n", __func__, k, p->PTE_BUFFER_MODE[k]);
-		dml2_printf("DML::%s: k=%u, BIGK_FRAGMENT_SIZE = %u\n", __func__, k, p->BIGK_FRAGMENT_SIZE[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, use_one_row_for_frame = %u\n", __func__, k, p->use_one_row_for_frame[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, use_one_row_for_frame_flip = %u\n", __func__, k, p->use_one_row_for_frame_flip[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, UseMALLForPStateChange = %u\n", __func__, k, p->display_cfg->plane_descriptors[k].overrides.legacy_svp_config);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dpte_row_height_luma = %u\n", __func__, k, p->dpte_row_height_luma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dpte_row_width_luma_ub = %u\n", __func__, k, p->dpte_row_width_luma_ub[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRowY = %u (after hvm level)\n", __func__, k, s->PixelPTEBytesPerRowY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dpte_row_height_chroma = %u\n", __func__, k, p->dpte_row_height_chroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dpte_row_width_chroma_ub = %u\n", __func__, k, p->dpte_row_width_chroma_ub[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRowC = %u (after hvm level)\n", __func__, k, s->PixelPTEBytesPerRowC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEBytesPerRow = %u\n", __func__, k, p->PixelPTEBytesPerRow[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, PTEBufferSizeNotExceeded = %u\n", __func__, k, p->PTEBufferSizeNotExceeded[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, gpuvm_enable = %u\n", __func__, k, p->display_cfg->gpuvm_enable);
+		DML_LOG_VERBOSE("DML::%s: k=%u, PTE_BUFFER_MODE = %u\n", __func__, k, p->PTE_BUFFER_MODE[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, BIGK_FRAGMENT_SIZE = %u\n", __func__, k, p->BIGK_FRAGMENT_SIZE[k]);
 #endif
 	}
 }
@@ -3257,19 +3198,19 @@ static double CalculateUrgentLatency(
 	}
 #ifdef __DML_VBA_DEBUG__
 	if (qos_type == dml2_qos_param_type_dcn4x) {
-		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
-		dml2_printf("DML::%s: urgent_ramp_uclk_cycles = %d\n", __func__, urgent_ramp_uclk_cycles);
-		dml2_printf("DML::%s: uclk_freq_mhz = %f\n", __func__, uclk_freq_mhz);
-		dml2_printf("DML::%s: umc_urgent_ramp_latency_margin = %f\n", __func__, umc_urgent_ramp_latency_margin);
+		DML_LOG_VERBOSE("DML::%s: qos_type = %d\n", __func__, qos_type);
+		DML_LOG_VERBOSE("DML::%s: urgent_ramp_uclk_cycles = %d\n", __func__, urgent_ramp_uclk_cycles);
+		DML_LOG_VERBOSE("DML::%s: uclk_freq_mhz = %f\n", __func__, uclk_freq_mhz);
+		DML_LOG_VERBOSE("DML::%s: umc_urgent_ramp_latency_margin = %f\n", __func__, umc_urgent_ramp_latency_margin);
 	} else {
-		dml2_printf("DML::%s: UrgentLatencyPixelDataOnly = %f\n", __func__, UrgentLatencyPixelDataOnly);
-		dml2_printf("DML::%s: UrgentLatencyPixelMixedWithVMData = %f\n", __func__, UrgentLatencyPixelMixedWithVMData);
-		dml2_printf("DML::%s: UrgentLatencyVMDataOnly = %f\n", __func__, UrgentLatencyVMDataOnly);
-		dml2_printf("DML::%s: UrgentLatencyAdjustmentFabricClockComponent = %f\n", __func__, UrgentLatencyAdjustmentFabricClockComponent);
-		dml2_printf("DML::%s: UrgentLatencyAdjustmentFabricClockReference = %f\n", __func__, UrgentLatencyAdjustmentFabricClockReference);
+		DML_LOG_VERBOSE("DML::%s: UrgentLatencyPixelDataOnly = %f\n", __func__, UrgentLatencyPixelDataOnly);
+		DML_LOG_VERBOSE("DML::%s: UrgentLatencyPixelMixedWithVMData = %f\n", __func__, UrgentLatencyPixelMixedWithVMData);
+		DML_LOG_VERBOSE("DML::%s: UrgentLatencyVMDataOnly = %f\n", __func__, UrgentLatencyVMDataOnly);
+		DML_LOG_VERBOSE("DML::%s: UrgentLatencyAdjustmentFabricClockComponent = %f\n", __func__, UrgentLatencyAdjustmentFabricClockComponent);
+		DML_LOG_VERBOSE("DML::%s: UrgentLatencyAdjustmentFabricClockReference = %f\n", __func__, UrgentLatencyAdjustmentFabricClockReference);
 	}
-	dml2_printf("DML::%s: FabricClock = %f\n", __func__, FabricClock);
-	dml2_printf("DML::%s: UrgentLatency = %f\n", __func__, urgent_latency);
+	DML_LOG_VERBOSE("DML::%s: FabricClock = %f\n", __func__, FabricClock);
+	DML_LOG_VERBOSE("DML::%s: UrgentLatency = %f\n", __func__, urgent_latency);
 #endif
 	return urgent_latency;
 }
@@ -3296,18 +3237,18 @@ static double CalculateTripToMemory(
 
 #ifdef __DML_VBA_DEBUG__
 	if (qos_type == dml2_qos_param_type_dcn4x) {
-		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
-		dml2_printf("DML::%s: max_round_trip_to_furthest_cs_fclk_cycles = %d\n", __func__, max_round_trip_to_furthest_cs_fclk_cycles);
-		dml2_printf("DML::%s: mall_overhead_fclk_cycles = %d\n", __func__, mall_overhead_fclk_cycles);
-		dml2_printf("DML::%s: trip_to_memory_uclk_cycles = %d\n", __func__, trip_to_memory_uclk_cycles);
-		dml2_printf("DML::%s: uclk_freq_mhz = %f\n", __func__, uclk_freq_mhz);
-		dml2_printf("DML::%s: FabricClock = %f\n", __func__, FabricClock);
-		dml2_printf("DML::%s: fabric_max_transport_latency_margin = %f\n", __func__, fabric_max_transport_latency_margin);
-		dml2_printf("DML::%s: umc_max_latency_margin = %f\n", __func__, umc_max_latency_margin);
+		DML_LOG_VERBOSE("DML::%s: qos_type = %d\n", __func__, qos_type);
+		DML_LOG_VERBOSE("DML::%s: max_round_trip_to_furthest_cs_fclk_cycles = %d\n", __func__, max_round_trip_to_furthest_cs_fclk_cycles);
+		DML_LOG_VERBOSE("DML::%s: mall_overhead_fclk_cycles = %d\n", __func__, mall_overhead_fclk_cycles);
+		DML_LOG_VERBOSE("DML::%s: trip_to_memory_uclk_cycles = %d\n", __func__, trip_to_memory_uclk_cycles);
+		DML_LOG_VERBOSE("DML::%s: uclk_freq_mhz = %f\n", __func__, uclk_freq_mhz);
+		DML_LOG_VERBOSE("DML::%s: FabricClock = %f\n", __func__, FabricClock);
+		DML_LOG_VERBOSE("DML::%s: fabric_max_transport_latency_margin = %f\n", __func__, fabric_max_transport_latency_margin);
+		DML_LOG_VERBOSE("DML::%s: umc_max_latency_margin = %f\n", __func__, umc_max_latency_margin);
 	} else {
-		dml2_printf("DML::%s: UrgLatency = %f\n", __func__, UrgLatency);
+		DML_LOG_VERBOSE("DML::%s: UrgLatency = %f\n", __func__, UrgLatency);
 	}
-	dml2_printf("DML::%s: trip_to_memory_us = %f\n", __func__, trip_to_memory_us);
+	DML_LOG_VERBOSE("DML::%s: trip_to_memory_us = %f\n", __func__, trip_to_memory_us);
 #endif
 
 
@@ -3334,14 +3275,14 @@ static double CalculateMetaTripToMemory(
 
 #ifdef __DML_VBA_DEBUG__
 	if (qos_type == dml2_qos_param_type_dcn4x) {
-		dml2_printf("DML::%s: qos_type = %d\n", __func__, qos_type);
-		dml2_printf("DML::%s: meta_trip_to_memory_fclk_cycles = %d\n", __func__, meta_trip_to_memory_fclk_cycles);
-		dml2_printf("DML::%s: meta_trip_to_memory_uclk_cycles = %d\n", __func__, meta_trip_to_memory_uclk_cycles);
-		dml2_printf("DML::%s: uclk_freq_mhz = %f\n", __func__, uclk_freq_mhz);
+		DML_LOG_VERBOSE("DML::%s: qos_type = %d\n", __func__, qos_type);
+		DML_LOG_VERBOSE("DML::%s: meta_trip_to_memory_fclk_cycles = %d\n", __func__, meta_trip_to_memory_fclk_cycles);
+		DML_LOG_VERBOSE("DML::%s: meta_trip_to_memory_uclk_cycles = %d\n", __func__, meta_trip_to_memory_uclk_cycles);
+		DML_LOG_VERBOSE("DML::%s: uclk_freq_mhz = %f\n", __func__, uclk_freq_mhz);
 	} else {
-		dml2_printf("DML::%s: UrgLatency = %f\n", __func__, UrgLatency);
+		DML_LOG_VERBOSE("DML::%s: UrgLatency = %f\n", __func__, UrgLatency);
 	}
-	dml2_printf("DML::%s: meta_trip_to_memory_us = %f\n", __func__, meta_trip_to_memory_us);
+	DML_LOG_VERBOSE("DML::%s: meta_trip_to_memory_us = %f\n", __func__, meta_trip_to_memory_us);
 #endif
 
 
@@ -3358,7 +3299,6 @@ static void calculate_cursor_req_attributes(
 	unsigned int *cursor_bytes_per_chunk,
 	unsigned int *cursor_bytes)
 {
-	unsigned int cursor_pitch = 0;
 	unsigned int cursor_bytes_per_req = 0;
 	unsigned int cursor_width_bytes = 0;
 	unsigned int cursor_height = 0;
@@ -3366,10 +3306,6 @@ static void calculate_cursor_req_attributes(
 	//SW determines the cursor pitch to support the maximum cursor_width that will be used but the following restrictions apply.
 	//- For 2bpp, cursor_pitch = 256 pixels due to min cursor request size of 64B
 	//- For 32 or 64 bpp, cursor_pitch = 64, 128 or 256 pixels depending on the cursor width
-	if (cursor_bpp == 2)
-		cursor_pitch = 256;
-	else
-		cursor_pitch = (unsigned int)1 << (unsigned int)math_ceil2(math_log((float)cursor_width, 2), 1);
 
 	//The cursor requestor uses a cursor request size of 64B, 128B, or 256B depending on the cursor_width and cursor_bpp as follows.
 
@@ -3409,8 +3345,8 @@ static void calculate_cursor_req_attributes(
 			*cursor_lines_per_chunk = 1;
 	} else {
 		if (cursor_width > 0) {
-			dml2_printf("DML::%s: Invalid cursor_bpp = %d\n", __func__, cursor_bpp);
-			DML2_ASSERT(0);
+			DML_LOG_VERBOSE("DML::%s: Invalid cursor_bpp = %d\n", __func__, cursor_bpp);
+			DML_ASSERT(0);
 		}
 	}
 
@@ -3421,15 +3357,15 @@ static void calculate_cursor_req_attributes(
 	cursor_height = cursor_width;
 	*cursor_bytes = *cursor_bytes_per_line * cursor_height;
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: cursor_bpp = %d\n", __func__, cursor_bpp);
-	dml2_printf("DML::%s: cursor_width = %d\n", __func__, cursor_width);
-	dml2_printf("DML::%s: cursor_width_bytes = %d\n", __func__, cursor_width_bytes);
-	dml2_printf("DML::%s: cursor_bytes_per_req = %d\n", __func__, cursor_bytes_per_req);
-	dml2_printf("DML::%s: cursor_lines_per_chunk = %d\n", __func__, *cursor_lines_per_chunk);
-	dml2_printf("DML::%s: cursor_bytes_per_line = %d\n", __func__, *cursor_bytes_per_line);
-	dml2_printf("DML::%s: cursor_bytes_per_chunk = %d\n", __func__, *cursor_bytes_per_chunk);
-	dml2_printf("DML::%s: cursor_bytes = %d\n", __func__, *cursor_bytes);
-	dml2_printf("DML::%s: cursor_pitch = %d\n", __func__, cursor_pitch);
+	DML_LOG_VERBOSE("DML::%s: cursor_bpp = %d\n", __func__, cursor_bpp);
+	DML_LOG_VERBOSE("DML::%s: cursor_width = %d\n", __func__, cursor_width);
+	DML_LOG_VERBOSE("DML::%s: cursor_width_bytes = %d\n", __func__, cursor_width_bytes);
+	DML_LOG_VERBOSE("DML::%s: cursor_bytes_per_req = %d\n", __func__, cursor_bytes_per_req);
+	DML_LOG_VERBOSE("DML::%s: cursor_lines_per_chunk = %d\n", __func__, *cursor_lines_per_chunk);
+	DML_LOG_VERBOSE("DML::%s: cursor_bytes_per_line = %d\n", __func__, *cursor_bytes_per_line);
+	DML_LOG_VERBOSE("DML::%s: cursor_bytes_per_chunk = %d\n", __func__, *cursor_bytes_per_chunk);
+	DML_LOG_VERBOSE("DML::%s: cursor_bytes = %d\n", __func__, *cursor_bytes);
+	DML_LOG_VERBOSE("DML::%s: cursor_pitch = %d\n", __func__, cursor_bpp == 2 ? 256 : (unsigned int)1 << (unsigned int)math_ceil2(math_log((float)cursor_width, 2), 1));
 #endif
 }
 
@@ -3460,13 +3396,13 @@ static void calculate_cursor_urgent_burst_factor(
 		}
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: LinesInCursorBuffer = %u\n", __func__, LinesInCursorBuffer);
-		dml2_printf("DML::%s: CursorBufferSizeInTime = %f\n", __func__, CursorBufferSizeInTime);
-		dml2_printf("DML::%s: CursorBufferSize = %u (kbytes)\n", __func__, CursorBufferSize);
-		dml2_printf("DML::%s: cursor_bytes_per_chunk = %u\n", __func__, cursor_bytes_per_chunk);
-		dml2_printf("DML::%s: cursor_lines_per_chunk = %u\n", __func__, cursor_lines_per_chunk);
-		dml2_printf("DML::%s: UrgentBurstFactorCursor = %f\n", __func__, *UrgentBurstFactorCursor);
-		dml2_printf("DML::%s: NotEnoughUrgentLatencyHiding = %d\n", __func__, *NotEnoughUrgentLatencyHiding);
+		DML_LOG_VERBOSE("DML::%s: LinesInCursorBuffer = %u\n", __func__, LinesInCursorBuffer);
+		DML_LOG_VERBOSE("DML::%s: CursorBufferSizeInTime = %f\n", __func__, CursorBufferSizeInTime);
+		DML_LOG_VERBOSE("DML::%s: CursorBufferSize = %u (kbytes)\n", __func__, CursorBufferSize);
+		DML_LOG_VERBOSE("DML::%s: cursor_bytes_per_chunk = %u\n", __func__, cursor_bytes_per_chunk);
+		DML_LOG_VERBOSE("DML::%s: cursor_lines_per_chunk = %u\n", __func__, cursor_lines_per_chunk);
+		DML_LOG_VERBOSE("DML::%s: UrgentBurstFactorCursor = %f\n", __func__, *UrgentBurstFactorCursor);
+		DML_LOG_VERBOSE("DML::%s: NotEnoughUrgentLatencyHiding = %d\n", __func__, *NotEnoughUrgentLatencyHiding);
 #endif
 
 	}
@@ -3501,15 +3437,15 @@ static void CalculateUrgentBurstFactor(
 	*UrgentBurstFactorChroma = 0;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: VRatio = %f\n", __func__, VRatio);
-	dml2_printf("DML::%s: VRatioC = %f\n", __func__, VRatioC);
-	dml2_printf("DML::%s: DETBufferSizeY = %d\n", __func__, DETBufferSizeY);
-	dml2_printf("DML::%s: DETBufferSizeC = %d\n", __func__, DETBufferSizeC);
-	dml2_printf("DML::%s: BytePerPixelInDETY = %f\n", __func__, BytePerPixelInDETY);
-	dml2_printf("DML::%s: swath_width_luma_ub = %d\n", __func__, swath_width_luma_ub);
-	dml2_printf("DML::%s: LineTime = %f\n", __func__, LineTime);
+	DML_LOG_VERBOSE("DML::%s: VRatio = %f\n", __func__, VRatio);
+	DML_LOG_VERBOSE("DML::%s: VRatioC = %f\n", __func__, VRatioC);
+	DML_LOG_VERBOSE("DML::%s: DETBufferSizeY = %d\n", __func__, DETBufferSizeY);
+	DML_LOG_VERBOSE("DML::%s: DETBufferSizeC = %d\n", __func__, DETBufferSizeC);
+	DML_LOG_VERBOSE("DML::%s: BytePerPixelInDETY = %f\n", __func__, BytePerPixelInDETY);
+	DML_LOG_VERBOSE("DML::%s: swath_width_luma_ub = %d\n", __func__, swath_width_luma_ub);
+	DML_LOG_VERBOSE("DML::%s: LineTime = %f\n", __func__, LineTime);
 #endif
-	DML2_ASSERT(VRatio > 0);
+	DML_ASSERT(VRatio > 0);
 
 	LinesInDETLuma = (dml_is_phantom_pipe(plane_cfg) ? 1024 * 1024 : DETBufferSizeY) / BytePerPixelInDETY / swath_width_luma_ub;
 
@@ -3534,12 +3470,12 @@ static void CalculateUrgentBurstFactor(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: LinesInDETLuma = %f\n", __func__, LinesInDETLuma);
-	dml2_printf("DML::%s: UrgentLatency = %f\n", __func__, UrgentLatency);
-	dml2_printf("DML::%s: DETBufferSizeInTimeLuma = %f\n", __func__, DETBufferSizeInTimeLuma);
-	dml2_printf("DML::%s: UrgentBurstFactorLuma = %f\n", __func__, *UrgentBurstFactorLuma);
-	dml2_printf("DML::%s: UrgentBurstFactorChroma = %f\n", __func__, *UrgentBurstFactorChroma);
-	dml2_printf("DML::%s: NotEnoughUrgentLatencyHiding = %d\n", __func__, *NotEnoughUrgentLatencyHiding);
+	DML_LOG_VERBOSE("DML::%s: LinesInDETLuma = %f\n", __func__, LinesInDETLuma);
+	DML_LOG_VERBOSE("DML::%s: UrgentLatency = %f\n", __func__, UrgentLatency);
+	DML_LOG_VERBOSE("DML::%s: DETBufferSizeInTimeLuma = %f\n", __func__, DETBufferSizeInTimeLuma);
+	DML_LOG_VERBOSE("DML::%s: UrgentBurstFactorLuma = %f\n", __func__, *UrgentBurstFactorLuma);
+	DML_LOG_VERBOSE("DML::%s: UrgentBurstFactorChroma = %f\n", __func__, *UrgentBurstFactorChroma);
+	DML_LOG_VERBOSE("DML::%s: NotEnoughUrgentLatencyHiding = %d\n", __func__, *NotEnoughUrgentLatencyHiding);
 #endif
 }
 
@@ -3600,10 +3536,10 @@ static void CalculateDCFCLKDeepSleepTdlut(
 		if (display_cfg->plane_descriptors[k].tdlut.setup_for_tdlut && tdlut_bytes_to_deliver[k] > 0) {
 			double tdlut_required_deepsleep_dcfclk = (double) tdlut_bytes_to_deliver[k] / 64.0 / prefetch_swath_time_us[k];
 
-			dml2_printf("DML::%s: k=%d, DCFClkDeepSleepPerSurface = %f\n", __func__, k, DCFClkDeepSleepPerSurface[k]);
-			dml2_printf("DML::%s: k=%d, tdlut_bytes_to_deliver = %d\n", __func__, k, tdlut_bytes_to_deliver[k]);
-			dml2_printf("DML::%s: k=%d, prefetch_swath_time_us = %f\n", __func__, k, prefetch_swath_time_us[k]);
-			dml2_printf("DML::%s: k=%d, tdlut_required_deepsleep_dcfclk = %f\n", __func__, k, tdlut_required_deepsleep_dcfclk);
+			DML_LOG_VERBOSE("DML::%s: k=%d, DCFClkDeepSleepPerSurface = %f\n", __func__, k, DCFClkDeepSleepPerSurface[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, tdlut_bytes_to_deliver = %d\n", __func__, k, tdlut_bytes_to_deliver[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, prefetch_swath_time_us = %f\n", __func__, k, prefetch_swath_time_us[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, tdlut_required_deepsleep_dcfclk = %f\n", __func__, k, tdlut_required_deepsleep_dcfclk);
 
 			// increase the deepsleep dcfclk to match the original dispclk throughput rate
 			if (tdlut_required_deepsleep_dcfclk > DCFClkDeepSleepPerSurface[k]) {
@@ -3613,8 +3549,8 @@ static void CalculateDCFCLKDeepSleepTdlut(
 		}
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, PixelClock = %f\n", __func__, k, pixel_rate_mhz);
-		dml2_printf("DML::%s: k=%u, DCFClkDeepSleepPerSurface = %f\n", __func__, k, DCFClkDeepSleepPerSurface[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, PixelClock = %f\n", __func__, k, pixel_rate_mhz);
+		DML_LOG_VERBOSE("DML::%s: k=%u, DCFClkDeepSleepPerSurface = %f\n", __func__, k, DCFClkDeepSleepPerSurface[k]);
 #endif
 	}
 
@@ -3625,17 +3561,17 @@ static void CalculateDCFCLKDeepSleepTdlut(
 	*DCFClkDeepSleep = math_max2(8.0, __DML2_CALCS_DCFCLK_FACTOR__ * ReadBandwidth / (double)ReturnBusWidth);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: __DML2_CALCS_DCFCLK_FACTOR__ = %f\n", __func__, __DML2_CALCS_DCFCLK_FACTOR__);
-	dml2_printf("DML::%s: ReadBandwidth = %f\n", __func__, ReadBandwidth);
-	dml2_printf("DML::%s: ReturnBusWidth = %u\n", __func__, ReturnBusWidth);
-	dml2_printf("DML::%s: DCFClkDeepSleep = %f\n", __func__, *DCFClkDeepSleep);
+	DML_LOG_VERBOSE("DML::%s: __DML2_CALCS_DCFCLK_FACTOR__ = %f\n", __func__, __DML2_CALCS_DCFCLK_FACTOR__);
+	DML_LOG_VERBOSE("DML::%s: ReadBandwidth = %f\n", __func__, ReadBandwidth);
+	DML_LOG_VERBOSE("DML::%s: ReturnBusWidth = %u\n", __func__, ReturnBusWidth);
+	DML_LOG_VERBOSE("DML::%s: DCFClkDeepSleep = %f\n", __func__, *DCFClkDeepSleep);
 #endif
 
 	for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
 		*DCFClkDeepSleep = math_max2(*DCFClkDeepSleep, DCFClkDeepSleepPerSurface[k]);
 	}
 
-	dml2_printf("DML::%s: DCFClkDeepSleep = %f (final)\n", __func__, *DCFClkDeepSleep);
+	DML_LOG_VERBOSE("DML::%s: DCFClkDeepSleep = %f (final)\n", __func__, *DCFClkDeepSleep);
 }
 
 static noinline_for_stack void CalculateDCFCLKDeepSleep(
@@ -3731,12 +3667,12 @@ static unsigned int CalculateMaxVStartup(
 	else
 		max_vstartup_lines = vblank_size - (unsigned int)math_max2(1.0, math_ceil2(write_back_delay_us / line_time_us, 1.0));
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: VBlankNom = %u\n", __func__, timing->vblank_nom);
-	dml2_printf("DML::%s: vblank_nom_default_us = %u\n", __func__, vblank_nom_default_us);
-	dml2_printf("DML::%s: line_time_us = %f\n", __func__, line_time_us);
-	dml2_printf("DML::%s: vblank_actual = %u\n", __func__, vblank_actual);
-	dml2_printf("DML::%s: vblank_avail = %u\n", __func__, vblank_avail);
-	dml2_printf("DML::%s: max_vstartup_lines = %u\n", __func__, max_vstartup_lines);
+	DML_LOG_VERBOSE("DML::%s: VBlankNom = %lu\n", __func__, timing->vblank_nom);
+	DML_LOG_VERBOSE("DML::%s: vblank_nom_default_us = %u\n", __func__, vblank_nom_default_us);
+	DML_LOG_VERBOSE("DML::%s: line_time_us = %f\n", __func__, line_time_us);
+	DML_LOG_VERBOSE("DML::%s: vblank_actual = %u\n", __func__, vblank_actual);
+	DML_LOG_VERBOSE("DML::%s: vblank_avail = %u\n", __func__, vblank_avail);
+	DML_LOG_VERBOSE("DML::%s: max_vstartup_lines = %u\n", __func__, max_vstartup_lines);
 #endif
 	max_vstartup_lines = (unsigned int)math_min2(max_vstartup_lines, DML_MAX_VSTARTUP_START);
 	return max_vstartup_lines;
@@ -3761,9 +3697,9 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 	const long MAXIMUMCOMPRESSION = 4;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: ForceSingleDPP = %u\n", __func__, p->ForceSingleDPP);
+	DML_LOG_VERBOSE("DML::%s: ForceSingleDPP = %u\n", __func__, p->ForceSingleDPP);
 	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
-		dml2_printf("DML::%s: DPPPerSurface[%u] = %u\n", __func__, k, p->DPPPerSurface[k]);
+		DML_LOG_VERBOSE("DML::%s: DPPPerSurface[%u] = %u\n", __func__, k, p->DPPPerSurface[k]);
 	}
 #endif
 	CalculateSwathWidth(
@@ -3797,15 +3733,15 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 		p->full_swath_bytes_l[k] = (unsigned int)(p->swath_width_luma_ub[k] * p->BytePerPixDETY[k] * MaximumSwathHeightY[k]);
 		p->full_swath_bytes_c[k] = (unsigned int)(p->swath_width_chroma_ub[k] * p->BytePerPixDETC[k] * MaximumSwathHeightC[k]);
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u DPPPerSurface = %u\n", __func__, k, p->DPPPerSurface[k]);
-		dml2_printf("DML::%s: k=%u swath_width_luma_ub = %u\n", __func__, k, p->swath_width_luma_ub[k]);
-		dml2_printf("DML::%s: k=%u BytePerPixDETY = %f\n", __func__, k, p->BytePerPixDETY[k]);
-		dml2_printf("DML::%s: k=%u MaximumSwathHeightY = %u\n", __func__, k, MaximumSwathHeightY[k]);
-		dml2_printf("DML::%s: k=%u full_swath_bytes_l = %u\n", __func__, k, p->full_swath_bytes_l[k]);
-		dml2_printf("DML::%s: k=%u swath_width_chroma_ub = %u\n", __func__, k, p->swath_width_chroma_ub[k]);
-		dml2_printf("DML::%s: k=%u BytePerPixDETC = %f\n", __func__, k, p->BytePerPixDETC[k]);
-		dml2_printf("DML::%s: k=%u MaximumSwathHeightC = %u\n", __func__, k, MaximumSwathHeightC[k]);
-		dml2_printf("DML::%s: k=%u full_swath_bytes_c = %u\n", __func__, k, p->full_swath_bytes_c[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u DPPPerSurface = %u\n", __func__, k, p->DPPPerSurface[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u swath_width_luma_ub = %u\n", __func__, k, p->swath_width_luma_ub[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u BytePerPixDETY = %f\n", __func__, k, p->BytePerPixDETY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathHeightY = %u\n", __func__, k, MaximumSwathHeightY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u full_swath_bytes_l = %u\n", __func__, k, p->full_swath_bytes_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u swath_width_chroma_ub = %u\n", __func__, k, p->swath_width_chroma_ub[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u BytePerPixDETC = %f\n", __func__, k, p->BytePerPixDETC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathHeightC = %u\n", __func__, k, MaximumSwathHeightC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u full_swath_bytes_c = %u\n", __func__, k, p->full_swath_bytes_c[k]);
 #endif
 		if (p->display_cfg->plane_descriptors[k].pixel_format == dml2_420_10) {
 			p->full_swath_bytes_l[k] = (unsigned int)(math_ceil2((double)p->full_swath_bytes_l[k], 256));
@@ -3848,11 +3784,11 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 		p->CompressedBufferSizeInkByte);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: TotalActiveDPP = %u\n", __func__, TotalActiveDPP);
-	dml2_printf("DML::%s: nomDETInKByte = %u\n", __func__, p->nomDETInKByte);
-	dml2_printf("DML::%s: ConfigReturnBufferSizeInKByte = %u\n", __func__, p->ConfigReturnBufferSizeInKByte);
-	dml2_printf("DML::%s: UnboundedRequestEnabled = %u\n", __func__, *p->UnboundedRequestEnabled);
-	dml2_printf("DML::%s: CompressedBufferSizeInkByte = %u\n", __func__, *p->CompressedBufferSizeInkByte);
+	DML_LOG_VERBOSE("DML::%s: TotalActiveDPP = %u\n", __func__, TotalActiveDPP);
+	DML_LOG_VERBOSE("DML::%s: nomDETInKByte = %u\n", __func__, p->nomDETInKByte);
+	DML_LOG_VERBOSE("DML::%s: ConfigReturnBufferSizeInKByte = %u\n", __func__, p->ConfigReturnBufferSizeInKByte);
+	DML_LOG_VERBOSE("DML::%s: UnboundedRequestEnabled = %u\n", __func__, *p->UnboundedRequestEnabled);
+	DML_LOG_VERBOSE("DML::%s: CompressedBufferSizeInkByte = %u\n", __func__, *p->CompressedBufferSizeInkByte);
 #endif
 
 	*p->ViewportSizeSupport = true;
@@ -3860,7 +3796,7 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 
 		DETBufferSizeInKByteForSwathCalculation = (dml_is_phantom_pipe(&p->display_cfg->plane_descriptors[k]) ? 1024 : p->DETBufferSizeInKByte[k]);
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u DETBufferSizeInKByteForSwathCalculation = %u\n", __func__, k, DETBufferSizeInKByteForSwathCalculation);
+		DML_LOG_VERBOSE("DML::%s: k=%u DETBufferSizeInKByteForSwathCalculation = %u\n", __func__, k, DETBufferSizeInKByteForSwathCalculation);
 #endif
 		if (p->display_cfg->plane_descriptors[k].surface.tiling == dml2_sw_linear) {
 			p->SwathHeightY[k] = MaximumSwathHeightY[k];
@@ -3917,13 +3853,13 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 		if ((p->full_swath_bytes_l[k] / 2 + p->full_swath_bytes_c[k] / 2 > DETBufferSizeInKByteForSwathCalculation * 1024 / 2) ||
 			p->SwathWidth[k] > p->MaximumSwathWidthLuma[k] || (p->SwathHeightC[k] > 0 && p->SwathWidthChroma[k] > p->MaximumSwathWidthChroma[k])) {
 			*p->ViewportSizeSupport = false;
-			dml2_printf("DML::%s: k=%u full_swath_bytes_l=%u\n", __func__, k, p->full_swath_bytes_l[k]);
-			dml2_printf("DML::%s: k=%u full_swath_bytes_c=%u\n", __func__, k, p->full_swath_bytes_c[k]);
-			dml2_printf("DML::%s: k=%u DETBufferSizeInKByteForSwathCalculation=%u\n", __func__, k, DETBufferSizeInKByteForSwathCalculation);
-			dml2_printf("DML::%s: k=%u SwathWidth=%u\n", __func__, k, p->SwathWidth[k]);
-			dml2_printf("DML::%s: k=%u MaximumSwathWidthLuma=%f\n", __func__, k, p->MaximumSwathWidthLuma[k]);
-			dml2_printf("DML::%s: k=%u SwathWidthChroma=%d\n", __func__, k, p->SwathWidthChroma[k]);
-			dml2_printf("DML::%s: k=%u MaximumSwathWidthChroma=%f\n", __func__, k, p->MaximumSwathWidthChroma[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u full_swath_bytes_l=%u\n", __func__, k, p->full_swath_bytes_l[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u full_swath_bytes_c=%u\n", __func__, k, p->full_swath_bytes_c[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u DETBufferSizeInKByteForSwathCalculation=%u\n", __func__, k, DETBufferSizeInKByteForSwathCalculation);
+			DML_LOG_VERBOSE("DML::%s: k=%u SwathWidth=%u\n", __func__, k, p->SwathWidth[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathWidthLuma=%f\n", __func__, k, p->MaximumSwathWidthLuma[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u SwathWidthChroma=%d\n", __func__, k, p->SwathWidthChroma[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathWidthChroma=%f\n", __func__, k, p->MaximumSwathWidthChroma[k]);
 			p->ViewportSizeSupportPerSurface[k] = false;
 		} else {
 			p->ViewportSizeSupportPerSurface[k] = true;
@@ -3931,35 +3867,35 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 
 		if (p->SwathHeightC[k] == 0) {
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, All DET will be used for plane0\n", __func__, k);
+			DML_LOG_VERBOSE("DML::%s: k=%u, All DET will be used for plane0\n", __func__, k);
 #endif
 			p->DETBufferSizeY[k] = p->DETBufferSizeInKByte[k] * 1024;
 			p->DETBufferSizeC[k] = 0;
 		} else if (RoundedUpSwathSizeBytesY[k] <= 1.5 * RoundedUpSwathSizeBytesC[k]) {
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, Half DET will be used for plane0, and half for plane1\n", __func__, k);
+			DML_LOG_VERBOSE("DML::%s: k=%u, Half DET will be used for plane0, and half for plane1\n", __func__, k);
 #endif
 			p->DETBufferSizeY[k] = p->DETBufferSizeInKByte[k] * 1024 / 2;
 			p->DETBufferSizeC[k] = p->DETBufferSizeInKByte[k] * 1024 / 2;
 		} else {
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, 2/3 DET will be used for plane0, and 1/3 for plane1\n", __func__, k);
+			DML_LOG_VERBOSE("DML::%s: k=%u, 2/3 DET will be used for plane0, and 1/3 for plane1\n", __func__, k);
 #endif
 			p->DETBufferSizeY[k] = (unsigned int)(math_floor2(p->DETBufferSizeInKByte[k] * 1024 * 2 / 3, 1024));
 			p->DETBufferSizeC[k] = p->DETBufferSizeInKByte[k] * 1024 - p->DETBufferSizeY[k];
 		}
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u SwathHeightY = %u\n", __func__, k, p->SwathHeightY[k]);
-		dml2_printf("DML::%s: k=%u SwathHeightC = %u\n", __func__, k, p->SwathHeightC[k]);
-		dml2_printf("DML::%s: k=%u full_swath_bytes_l = %u\n", __func__, k, p->full_swath_bytes_l[k]);
-		dml2_printf("DML::%s: k=%u full_swath_bytes_c = %u\n", __func__, k, p->full_swath_bytes_c[k]);
-		dml2_printf("DML::%s: k=%u RoundedUpSwathSizeBytesY = %u\n", __func__, k, RoundedUpSwathSizeBytesY[k]);
-		dml2_printf("DML::%s: k=%u RoundedUpSwathSizeBytesC = %u\n", __func__, k, RoundedUpSwathSizeBytesC[k]);
-		dml2_printf("DML::%s: k=%u DETBufferSizeInKByte = %u\n", __func__, k, p->DETBufferSizeInKByte[k]);
-		dml2_printf("DML::%s: k=%u DETBufferSizeY = %u\n", __func__, k, p->DETBufferSizeY[k]);
-		dml2_printf("DML::%s: k=%u DETBufferSizeC = %u\n", __func__, k, p->DETBufferSizeC[k]);
-		dml2_printf("DML::%s: k=%u ViewportSizeSupportPerSurface = %u\n", __func__, k, p->ViewportSizeSupportPerSurface[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u SwathHeightY = %u\n", __func__, k, p->SwathHeightY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u SwathHeightC = %u\n", __func__, k, p->SwathHeightC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u full_swath_bytes_l = %u\n", __func__, k, p->full_swath_bytes_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u full_swath_bytes_c = %u\n", __func__, k, p->full_swath_bytes_c[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u RoundedUpSwathSizeBytesY = %u\n", __func__, k, RoundedUpSwathSizeBytesY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u RoundedUpSwathSizeBytesC = %u\n", __func__, k, RoundedUpSwathSizeBytesC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u DETBufferSizeInKByte = %u\n", __func__, k, p->DETBufferSizeInKByte[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u DETBufferSizeY = %u\n", __func__, k, p->DETBufferSizeY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u DETBufferSizeC = %u\n", __func__, k, p->DETBufferSizeC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u ViewportSizeSupportPerSurface = %u\n", __func__, k, p->ViewportSizeSupportPerSurface[k]);
 #endif
 
 	}
@@ -3969,12 +3905,12 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 		*p->compbuf_reserved_space_64b = (unsigned int)math_ceil2(math_max2(*p->compbuf_reserved_space_64b,
 			(double)(p->rob_buffer_size_kbytes * 1024 / 64) - (double)(RoundedUpSwathSizeBytesY[SurfaceDoingUnboundedRequest] * TTUFIFODEPTH / (p->mrq_present ? MAXIMUMCOMPRESSION : 1) / 64)), 1.0);
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: RoundedUpSwathSizeBytesY[%d] = %u\n", __func__, SurfaceDoingUnboundedRequest, RoundedUpSwathSizeBytesY[SurfaceDoingUnboundedRequest]);
-		dml2_printf("DML::%s: rob_buffer_size_kbytes = %u\n", __func__, p->rob_buffer_size_kbytes);
+		DML_LOG_VERBOSE("DML::%s: RoundedUpSwathSizeBytesY[%d] = %u\n", __func__, SurfaceDoingUnboundedRequest, RoundedUpSwathSizeBytesY[SurfaceDoingUnboundedRequest]);
+		DML_LOG_VERBOSE("DML::%s: rob_buffer_size_kbytes = %u\n", __func__, p->rob_buffer_size_kbytes);
 #endif
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: compbuf_reserved_space_64b = %u\n", __func__, *p->compbuf_reserved_space_64b);
+	DML_LOG_VERBOSE("DML::%s: compbuf_reserved_space_64b = %u\n", __func__, *p->compbuf_reserved_space_64b);
 #endif
 
 	*p->hw_debug5 = false;
@@ -3989,12 +3925,12 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 				+ *p->CompressedBufferSizeInkByte * MAXIMUMCOMPRESSION * 1024) > TTUFIFODEPTH * (RoundedUpSwathSizeBytesY[k] + RoundedUpSwathSizeBytesC[k])))
 			*p->hw_debug5 = true;
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u UnboundedRequestEnabled = %u\n", __func__, k, *p->UnboundedRequestEnabled);
-		dml2_printf("DML::%s: k=%u MAXIMUMCOMPRESSION = %lu\n", __func__, k, MAXIMUMCOMPRESSION);
-		dml2_printf("DML::%s: k=%u TTUFIFODEPTH = %lu\n", __func__, k, TTUFIFODEPTH);
-		dml2_printf("DML::%s: k=%u CompressedBufferSizeInkByte = %u\n", __func__, k, *p->CompressedBufferSizeInkByte);
-		dml2_printf("DML::%s: k=%u RoundedUpSwathSizeBytesC = %u\n", __func__, k, RoundedUpSwathSizeBytesC[k]);
-		dml2_printf("DML::%s: k=%u hw_debug5 = %u\n", __func__, k, *p->hw_debug5);
+		DML_LOG_VERBOSE("DML::%s: k=%u UnboundedRequestEnabled = %u\n", __func__, k, *p->UnboundedRequestEnabled);
+		DML_LOG_VERBOSE("DML::%s: k=%u MAXIMUMCOMPRESSION = %lu\n", __func__, k, MAXIMUMCOMPRESSION);
+		DML_LOG_VERBOSE("DML::%s: k=%u TTUFIFODEPTH = %lu\n", __func__, k, TTUFIFODEPTH);
+		DML_LOG_VERBOSE("DML::%s: k=%u CompressedBufferSizeInkByte = %u\n", __func__, k, *p->CompressedBufferSizeInkByte);
+		DML_LOG_VERBOSE("DML::%s: k=%u RoundedUpSwathSizeBytesC = %u\n", __func__, k, RoundedUpSwathSizeBytesC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u hw_debug5 = %u\n", __func__, k, *p->hw_debug5);
 #endif
 	}
 #endif
@@ -4192,15 +4128,15 @@ static noinline_for_stack void CalculateODMMode(
 	SurfaceRequiredDISPCLKWithODMCombineThreeToOne = CalculateRequiredDispclk(dml2_odm_mode_combine_3to1, PixelClock);
 	SurfaceRequiredDISPCLKWithODMCombineFourToOne = CalculateRequiredDispclk(dml2_odm_mode_combine_4to1, PixelClock);
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: ODMUse = %d\n", __func__, ODMUse);
-	dml2_printf("DML::%s: Output = %d\n", __func__, Output);
-	dml2_printf("DML::%s: DSCEnable = %d\n", __func__, DSCEnable);
-	dml2_printf("DML::%s: MaxDispclk = %f\n", __func__, MaxDispclk);
-	dml2_printf("DML::%s: MaximumPixelsPerLinePerDSCUnit = %d\n", __func__, MaximumPixelsPerLinePerDSCUnit);
-	dml2_printf("DML::%s: SurfaceRequiredDISPCLKWithoutODMCombine = %f\n", __func__, SurfaceRequiredDISPCLKWithoutODMCombine);
-	dml2_printf("DML::%s: SurfaceRequiredDISPCLKWithODMCombineTwoToOne = %f\n", __func__, SurfaceRequiredDISPCLKWithODMCombineTwoToOne);
-	dml2_printf("DML::%s: SurfaceRequiredDISPCLKWithODMCombineThreeToOne = %f\n", __func__, SurfaceRequiredDISPCLKWithODMCombineThreeToOne);
-	dml2_printf("DML::%s: SurfaceRequiredDISPCLKWithODMCombineFourToOne = %f\n", __func__, SurfaceRequiredDISPCLKWithODMCombineFourToOne);
+	DML_LOG_VERBOSE("DML::%s: ODMUse = %d\n", __func__, ODMUse);
+	DML_LOG_VERBOSE("DML::%s: Output = %d\n", __func__, Output);
+	DML_LOG_VERBOSE("DML::%s: DSCEnable = %d\n", __func__, DSCEnable);
+	DML_LOG_VERBOSE("DML::%s: MaxDispclk = %f\n", __func__, MaxDispclk);
+	DML_LOG_VERBOSE("DML::%s: MaximumPixelsPerLinePerDSCUnit = %d\n", __func__, MaximumPixelsPerLinePerDSCUnit);
+	DML_LOG_VERBOSE("DML::%s: SurfaceRequiredDISPCLKWithoutODMCombine = %f\n", __func__, SurfaceRequiredDISPCLKWithoutODMCombine);
+	DML_LOG_VERBOSE("DML::%s: SurfaceRequiredDISPCLKWithODMCombineTwoToOne = %f\n", __func__, SurfaceRequiredDISPCLKWithODMCombineTwoToOne);
+	DML_LOG_VERBOSE("DML::%s: SurfaceRequiredDISPCLKWithODMCombineThreeToOne = %f\n", __func__, SurfaceRequiredDISPCLKWithODMCombineThreeToOne);
+	DML_LOG_VERBOSE("DML::%s: SurfaceRequiredDISPCLKWithODMCombineFourToOne = %f\n", __func__, SurfaceRequiredDISPCLKWithODMCombineFourToOne);
 #endif
 	if (ODMUse == dml2_odm_mode_auto)
 		DecidedODMMode = DecideODMMode(HActive,
@@ -4245,10 +4181,10 @@ static noinline_for_stack void CalculateODMMode(
 	*NumberOfDPP = NumberOfDPPRequired;
 	*RequiredDISPCLKPerSurface = success ? DISPCLKRequired : 0;
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: ODMMode = %d\n", __func__, *ODMMode);
-	dml2_printf("DML::%s: NumberOfDPP = %d\n", __func__, *NumberOfDPP);
-	dml2_printf("DML::%s: TotalAvailablePipesSupport = %d\n", __func__, *TotalAvailablePipesSupport);
-	dml2_printf("DML::%s: RequiredDISPCLKPerSurface = %f\n", __func__, *RequiredDISPCLKPerSurface);
+	DML_LOG_VERBOSE("DML::%s: ODMMode = %d\n", __func__, *ODMMode);
+	DML_LOG_VERBOSE("DML::%s: NumberOfDPP = %d\n", __func__, *NumberOfDPP);
+	DML_LOG_VERBOSE("DML::%s: TotalAvailablePipesSupport = %d\n", __func__, *TotalAvailablePipesSupport);
+	DML_LOG_VERBOSE("DML::%s: RequiredDISPCLKPerSurface = %f\n", __func__, *RequiredDISPCLKPerSurface);
 #endif
 }
 
@@ -4292,17 +4228,17 @@ static noinline_for_stack void CalculateOutputLink(
 	*OutputRate = dml2_core_internal_output_rate_unknown;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DSCEnable = %u (dis, en, en_if_necessary)\n", __func__, DSCEnable);
-	dml2_printf("DML::%s: PHYCLK = %f\n", __func__, PHYCLK);
-	dml2_printf("DML::%s: PixelClockBackEnd = %f\n", __func__, PixelClockBackEnd);
-	dml2_printf("DML::%s: AudioSampleRate = %f\n", __func__, AudioSampleRate);
-	dml2_printf("DML::%s: HActive = %u\n", __func__, HActive);
-	dml2_printf("DML::%s: HTotal = %u\n", __func__, HTotal);
-	dml2_printf("DML::%s: ODMModeNoDSC = %u\n", __func__, ODMModeNoDSC);
-	dml2_printf("DML::%s: ODMModeDSC = %u\n", __func__, ODMModeDSC);
-	dml2_printf("DML::%s: ForcedOutputLinkBPP = %f\n", __func__, ForcedOutputLinkBPP);
-	dml2_printf("DML::%s: Output (encoder) = %u\n", __func__, Output);
-	dml2_printf("DML::%s: OutputLinkDPRate = %u\n", __func__, OutputLinkDPRate);
+	DML_LOG_VERBOSE("DML::%s: DSCEnable = %u (dis, en, en_if_necessary)\n", __func__, DSCEnable);
+	DML_LOG_VERBOSE("DML::%s: PHYCLK = %f\n", __func__, PHYCLK);
+	DML_LOG_VERBOSE("DML::%s: PixelClockBackEnd = %f\n", __func__, PixelClockBackEnd);
+	DML_LOG_VERBOSE("DML::%s: AudioSampleRate = %f\n", __func__, AudioSampleRate);
+	DML_LOG_VERBOSE("DML::%s: HActive = %u\n", __func__, HActive);
+	DML_LOG_VERBOSE("DML::%s: HTotal = %u\n", __func__, HTotal);
+	DML_LOG_VERBOSE("DML::%s: ODMModeNoDSC = %u\n", __func__, ODMModeNoDSC);
+	DML_LOG_VERBOSE("DML::%s: ODMModeDSC = %u\n", __func__, ODMModeDSC);
+	DML_LOG_VERBOSE("DML::%s: ForcedOutputLinkBPP = %f\n", __func__, ForcedOutputLinkBPP);
+	DML_LOG_VERBOSE("DML::%s: Output (encoder) = %u\n", __func__, Output);
+	DML_LOG_VERBOSE("DML::%s: OutputLinkDPRate = %u\n", __func__, OutputLinkDPRate);
 #endif
 	{
 		if (Output == dml2_hdmi) {
@@ -4487,9 +4423,9 @@ static noinline_for_stack void CalculateOutputLink(
 		}
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: RequiresDSC = %u\n", __func__, *RequiresDSC);
-	dml2_printf("DML::%s: RequiresFEC = %u\n", __func__, *RequiresFEC);
-	dml2_printf("DML::%s: OutBpp = %f\n", __func__, *OutBpp);
+	DML_LOG_VERBOSE("DML::%s: RequiresDSC = %u\n", __func__, *RequiresDSC);
+	DML_LOG_VERBOSE("DML::%s: RequiresFEC = %u\n", __func__, *RequiresFEC);
+	DML_LOG_VERBOSE("DML::%s: OutBpp = %f\n", __func__, *OutBpp);
 #endif
 }
 
@@ -4571,17 +4507,17 @@ static unsigned int DSCDelayRequirement(
 		DSCDelayRequirement_val = 0;
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DSCEnabled= %u\n", __func__, DSCEnabled);
-	dml2_printf("DML::%s: ODMMode = %u\n", __func__, ODMMode);
-	dml2_printf("DML::%s: OutputBpp = %f\n", __func__, OutputBpp);
-	dml2_printf("DML::%s: HActive = %u\n", __func__, HActive);
-	dml2_printf("DML::%s: HTotal = %u\n", __func__, HTotal);
-	dml2_printf("DML::%s: PixelClock = %f\n", __func__, PixelClock);
-	dml2_printf("DML::%s: PixelClockBackEnd = %f\n", __func__, PixelClockBackEnd);
-	dml2_printf("DML::%s: OutputFormat = %u\n", __func__, OutputFormat);
-	dml2_printf("DML::%s: DSCInputBitPerComponent = %u\n", __func__, DSCInputBitPerComponent);
-	dml2_printf("DML::%s: NumberOfDSCSlices = %u\n", __func__, NumberOfDSCSlices);
-	dml2_printf("DML::%s: DSCDelayRequirement_val = %u\n", __func__, DSCDelayRequirement_val);
+	DML_LOG_VERBOSE("DML::%s: DSCEnabled= %u\n", __func__, DSCEnabled);
+	DML_LOG_VERBOSE("DML::%s: ODMMode = %u\n", __func__, ODMMode);
+	DML_LOG_VERBOSE("DML::%s: OutputBpp = %f\n", __func__, OutputBpp);
+	DML_LOG_VERBOSE("DML::%s: HActive = %u\n", __func__, HActive);
+	DML_LOG_VERBOSE("DML::%s: HTotal = %u\n", __func__, HTotal);
+	DML_LOG_VERBOSE("DML::%s: PixelClock = %f\n", __func__, PixelClock);
+	DML_LOG_VERBOSE("DML::%s: PixelClockBackEnd = %f\n", __func__, PixelClockBackEnd);
+	DML_LOG_VERBOSE("DML::%s: OutputFormat = %u\n", __func__, OutputFormat);
+	DML_LOG_VERBOSE("DML::%s: DSCInputBitPerComponent = %u\n", __func__, DSCInputBitPerComponent);
+	DML_LOG_VERBOSE("DML::%s: NumberOfDSCSlices = %u\n", __func__, NumberOfDSCSlices);
+	DML_LOG_VERBOSE("DML::%s: DSCDelayRequirement_val = %u\n", __func__, DSCDelayRequirement_val);
 #endif
 
 	return DSCDelayRequirement_val;
@@ -4654,10 +4590,10 @@ static void CalculateSurfaceSizeInMall(
 		(TotalSurfaceSizeInMALLForSubVP > MALLAllocatedForDCNInBytes);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: MALLAllocatedForDCN = %u\n", __func__, MALLAllocatedForDCN * 1024 * 1024);
-	dml2_printf("DML::%s: TotalSurfaceSizeInMALLForSubVP = %u\n", __func__, TotalSurfaceSizeInMALLForSubVP);
-	dml2_printf("DML::%s: TotalSurfaceSizeInMALLForSS = %u\n", __func__, TotalSurfaceSizeInMALLForSS);
-	dml2_printf("DML::%s: ExceededMALLSize = %u\n", __func__, *ExceededMALLSize);
+	DML_LOG_VERBOSE("DML::%s: MALLAllocatedForDCN = %u\n", __func__, MALLAllocatedForDCN * 1024 * 1024);
+	DML_LOG_VERBOSE("DML::%s: TotalSurfaceSizeInMALLForSubVP = %u\n", __func__, TotalSurfaceSizeInMALLForSubVP);
+	DML_LOG_VERBOSE("DML::%s: TotalSurfaceSizeInMALLForSS = %u\n", __func__, TotalSurfaceSizeInMALLForSS);
+	DML_LOG_VERBOSE("DML::%s: ExceededMALLSize = %u\n", __func__, *ExceededMALLSize);
 #endif
 }
 
@@ -4674,7 +4610,6 @@ static void calculate_tdlut_setting(
 	unsigned int tdlut_vmpg_per_frame;
 	unsigned int tdlut_pte_req_per_frame;
 	unsigned int tdlut_bytes_per_line;
-	unsigned int tdlut_delivery_cycles;
 	double tdlut_drain_rate;
 	unsigned int tdlut_mpc_width;
 	unsigned int tdlut_bytes_per_group_simple;
@@ -4737,13 +4672,13 @@ static void calculate_tdlut_setting(
 		*p->tdlut_bytes_per_frame = tdlut_bytes_per_line * tdlut_mpc_width * tdlut_mpc_width;
 		*p->tdlut_bytes_per_group = tdlut_bytes_per_line * tdlut_mpc_width;
 		//the delivery cycles is DispClk cycles per line * number of lines * number of slices
-		tdlut_delivery_cycles = (unsigned int)math_ceil2(tdlut_mpc_width/2.0, 1) * tdlut_mpc_width * tdlut_mpc_width;
+		//tdlut_delivery_cycles = (unsigned int)math_ceil2(tdlut_mpc_width/2.0, 1) * tdlut_mpc_width * tdlut_mpc_width;
 		tdlut_drain_rate = tdlut_bytes_per_line * p->dispclk_mhz / math_ceil2(tdlut_mpc_width/2.0, 1);
 	} else {
 		//tdlut_addressing_mode = tdlut_simple_linear, 3dlut width should be 4*1229=4916 elements
 		*p->tdlut_bytes_per_frame = (unsigned int)math_ceil2(tdlut_width * tdlut_bpe, 256);
 		*p->tdlut_bytes_per_group = tdlut_bytes_per_group_simple;
-		tdlut_delivery_cycles = (unsigned int)math_ceil2(tdlut_width/2.0, 1);
+		//tdlut_delivery_cycles = (unsigned int)math_ceil2(tdlut_width/2.0, 1);
 		tdlut_drain_rate = 2 * tdlut_bpe * p->dispclk_mhz;
 	}
 
@@ -4756,25 +4691,25 @@ static void calculate_tdlut_setting(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: gpuvm_enable = %d\n", __func__, p->gpuvm_enable);
-	dml2_printf("DML::%s: vmpg_bytes = %d\n", __func__, vmpg_bytes);
-	dml2_printf("DML::%s: tdlut_vmpg_per_frame = %d\n", __func__, tdlut_vmpg_per_frame);
-	dml2_printf("DML::%s: tdlut_pte_req_per_frame = %d\n", __func__, tdlut_pte_req_per_frame);
+	DML_LOG_VERBOSE("DML::%s: gpuvm_enable = %d\n", __func__, p->gpuvm_enable);
+	DML_LOG_VERBOSE("DML::%s: vmpg_bytes = %d\n", __func__, vmpg_bytes);
+	DML_LOG_VERBOSE("DML::%s: tdlut_vmpg_per_frame = %d\n", __func__, tdlut_vmpg_per_frame);
+	DML_LOG_VERBOSE("DML::%s: tdlut_pte_req_per_frame = %d\n", __func__, tdlut_pte_req_per_frame);
 
-	dml2_printf("DML::%s: dispclk_mhz = %f\n", __func__, p->dispclk_mhz);
-	dml2_printf("DML::%s: tdlut_width = %u\n", __func__, tdlut_width);
-	dml2_printf("DML::%s: tdlut_addressing_mode = %s\n", __func__, (p->tdlut_addressing_mode == dml2_tdlut_sw_linear) ? "sw_linear" : "simple_linear");
-	dml2_printf("DML::%s: tdlut_pitch_bytes = %u\n", __func__, tdlut_pitch_bytes);
-	dml2_printf("DML::%s: tdlut_footprint_bytes = %u\n", __func__, tdlut_footprint_bytes);
-	dml2_printf("DML::%s: tdlut_bytes_per_frame = %u\n", __func__, *p->tdlut_bytes_per_frame);
-	dml2_printf("DML::%s: tdlut_bytes_per_line = %u\n", __func__, tdlut_bytes_per_line);
-	dml2_printf("DML::%s: tdlut_bytes_per_group = %u\n", __func__, *p->tdlut_bytes_per_group);
-	dml2_printf("DML::%s: tdlut_drain_rate = %f\n", __func__, tdlut_drain_rate);
-	dml2_printf("DML::%s: tdlut_delivery_cycles = %u\n", __func__, tdlut_delivery_cycles);
-	dml2_printf("DML::%s: tdlut_opt_time = %f\n", __func__, *p->tdlut_opt_time);
-	dml2_printf("DML::%s: tdlut_drain_time = %f\n", __func__, *p->tdlut_drain_time);
-	dml2_printf("DML::%s: tdlut_bytes_to_deliver = %d\n", __func__, *p->tdlut_bytes_to_deliver);
-	dml2_printf("DML::%s: tdlut_groups_per_2row_ub = %d\n", __func__, *p->tdlut_groups_per_2row_ub);
+	DML_LOG_VERBOSE("DML::%s: dispclk_mhz = %f\n", __func__, p->dispclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: tdlut_width = %u\n", __func__, tdlut_width);
+	DML_LOG_VERBOSE("DML::%s: tdlut_addressing_mode = %s\n", __func__, (p->tdlut_addressing_mode == dml2_tdlut_sw_linear) ? "sw_linear" : "simple_linear");
+	DML_LOG_VERBOSE("DML::%s: tdlut_pitch_bytes = %u\n", __func__, tdlut_pitch_bytes);
+	DML_LOG_VERBOSE("DML::%s: tdlut_footprint_bytes = %u\n", __func__, tdlut_footprint_bytes);
+	DML_LOG_VERBOSE("DML::%s: tdlut_bytes_per_frame = %u\n", __func__, *p->tdlut_bytes_per_frame);
+	DML_LOG_VERBOSE("DML::%s: tdlut_bytes_per_line = %u\n", __func__, tdlut_bytes_per_line);
+	DML_LOG_VERBOSE("DML::%s: tdlut_bytes_per_group = %u\n", __func__, *p->tdlut_bytes_per_group);
+	DML_LOG_VERBOSE("DML::%s: tdlut_drain_rate = %f\n", __func__, tdlut_drain_rate);
+	DML_LOG_VERBOSE("DML::%s: tdlut_delivery_cycles = %u\n", __func__, p->tdlut_addressing_mode == dml2_tdlut_sw_linear ? (unsigned int)math_ceil2(tdlut_mpc_width/2.0, 1) * tdlut_mpc_width * tdlut_mpc_width : (unsigned int)math_ceil2(tdlut_width/2.0, 1));
+	DML_LOG_VERBOSE("DML::%s: tdlut_opt_time = %f\n", __func__, *p->tdlut_opt_time);
+	DML_LOG_VERBOSE("DML::%s: tdlut_drain_time = %f\n", __func__, *p->tdlut_drain_time);
+	DML_LOG_VERBOSE("DML::%s: tdlut_bytes_to_deliver = %d\n", __func__, *p->tdlut_bytes_to_deliver);
+	DML_LOG_VERBOSE("DML::%s: tdlut_groups_per_2row_ub = %d\n", __func__, *p->tdlut_groups_per_2row_ub);
 #endif
 }
 
@@ -4820,10 +4755,10 @@ static void CalculateTarb(
 	*Tarb = extra_bytes / ReturnBW;
 	*Tarb_prefetch = extra_bytes_prefetch / ReturnBW;
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: PixelChunkSizeInKByte = %d\n", __func__, PixelChunkSizeInKByte);
-	dml2_printf("DML::%s: MetaChunkSize = %d\n", __func__, MetaChunkSize);
-	dml2_printf("DML::%s: extra_bytes = %f\n", __func__, extra_bytes);
-	dml2_printf("DML::%s: extra_bytes_prefetch = %f\n", __func__, extra_bytes_prefetch);
+	DML_LOG_VERBOSE("DML::%s: PixelChunkSizeInKByte = %d\n", __func__, PixelChunkSizeInKByte);
+	DML_LOG_VERBOSE("DML::%s: MetaChunkSize = %d\n", __func__, MetaChunkSize);
+	DML_LOG_VERBOSE("DML::%s: extra_bytes = %f\n", __func__, extra_bytes);
+	DML_LOG_VERBOSE("DML::%s: extra_bytes_prefetch = %f\n", __func__, extra_bytes_prefetch);
 #endif
 }
 
@@ -4838,10 +4773,10 @@ static double CalculateTWait(
 	TWait = math_max2(reserved_vblank_time_ns/1000.0, g6_temp_read_blackout_us) + t_urg_trip;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: reserved_vblank_time_ns = %d\n", __func__, reserved_vblank_time_ns);
-	dml2_printf("DML::%s: UrgentLatency = %f\n", __func__, UrgentLatency);
-	dml2_printf("DML::%s: Ttrip = %f\n", __func__, Ttrip);
-	dml2_printf("DML::%s: TWait = %f\n", __func__, TWait);
+	DML_LOG_VERBOSE("DML::%s: reserved_vblank_time_ns = %ld\n", __func__, reserved_vblank_time_ns);
+	DML_LOG_VERBOSE("DML::%s: UrgentLatency = %f\n", __func__, UrgentLatency);
+	DML_LOG_VERBOSE("DML::%s: Ttrip = %f\n", __func__, Ttrip);
+	DML_LOG_VERBOSE("DML::%s: TWait = %f\n", __func__, TWait);
 #endif
 	return TWait;
 }
@@ -4887,20 +4822,20 @@ static void CalculateVUpdateAndDynamicMetadataParameters(
 		*Tdmsks = *Tdmsks / 2;
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DynamicMetadataLinesBeforeActiveRequired = %u\n", __func__, DynamicMetadataLinesBeforeActiveRequired);
-	dml2_printf("DML::%s: VBlank = %u\n", __func__, VBlank);
-	dml2_printf("DML::%s: HTotal = %u\n", __func__, HTotal);
-	dml2_printf("DML::%s: PixelClock = %f\n", __func__, PixelClock);
-	dml2_printf("DML::%s: Dppclk = %f\n", __func__, Dppclk);
-	dml2_printf("DML::%s: DCFClkDeepSleep = %f\n", __func__, DCFClkDeepSleep);
-	dml2_printf("DML::%s: MaxInterDCNTileRepeaters = %u\n", __func__, MaxInterDCNTileRepeaters);
-	dml2_printf("DML::%s: TotalRepeaterDelayTime = %f\n", __func__, TotalRepeaterDelayTime);
+	DML_LOG_VERBOSE("DML::%s: DynamicMetadataLinesBeforeActiveRequired = %u\n", __func__, DynamicMetadataLinesBeforeActiveRequired);
+	DML_LOG_VERBOSE("DML::%s: VBlank = %u\n", __func__, VBlank);
+	DML_LOG_VERBOSE("DML::%s: HTotal = %u\n", __func__, HTotal);
+	DML_LOG_VERBOSE("DML::%s: PixelClock = %f\n", __func__, PixelClock);
+	DML_LOG_VERBOSE("DML::%s: Dppclk = %f\n", __func__, Dppclk);
+	DML_LOG_VERBOSE("DML::%s: DCFClkDeepSleep = %f\n", __func__, DCFClkDeepSleep);
+	DML_LOG_VERBOSE("DML::%s: MaxInterDCNTileRepeaters = %u\n", __func__, MaxInterDCNTileRepeaters);
+	DML_LOG_VERBOSE("DML::%s: TotalRepeaterDelayTime = %f\n", __func__, TotalRepeaterDelayTime);
 
-	dml2_printf("DML::%s: VUpdateWidthPix = %u\n", __func__, *VUpdateWidthPix);
-	dml2_printf("DML::%s: VReadyOffsetPix = %u\n", __func__, *VReadyOffsetPix);
-	dml2_printf("DML::%s: VUpdateOffsetPix = %u\n", __func__, *VUpdateOffsetPix);
+	DML_LOG_VERBOSE("DML::%s: VUpdateWidthPix = %u\n", __func__, *VUpdateWidthPix);
+	DML_LOG_VERBOSE("DML::%s: VReadyOffsetPix = %u\n", __func__, *VReadyOffsetPix);
+	DML_LOG_VERBOSE("DML::%s: VUpdateOffsetPix = %u\n", __func__, *VUpdateOffsetPix);
 
-	dml2_printf("DML::%s: Tdmsks = %f\n", __func__, *Tdmsks);
+	DML_LOG_VERBOSE("DML::%s: Tdmsks = %f\n", __func__, *Tdmsks);
 #endif
 }
 
@@ -4995,12 +4930,12 @@ static double get_urgent_bandwidth_required(
 			surface_peak_required_bw[k] = math_max2(surface_required_bw[k], surface_peak_required_bw[k]);
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%d, max1: vm_row_bw=%f\n", __func__, k, l->vm_row_bw);
-			dml2_printf("DML::%s: k=%d, max2: flip_and_active_bw=%f\n", __func__, k, l->flip_and_active_bw);
-			dml2_printf("DML::%s: k=%d, max3: flip_and_prefetch_bw=%f\n", __func__, k, l->flip_and_prefetch_bw);
-			dml2_printf("DML::%s: k=%d, max4: active_and_excess_bw=%f\n", __func__, k, l->active_and_excess_bw);
-			dml2_printf("DML::%s: k=%d, surface_required_bw=%f\n", __func__, k, surface_required_bw[k]);
-			dml2_printf("DML::%s: k=%d, surface_peak_required_bw=%f\n", __func__, k, surface_peak_required_bw[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, max1: vm_row_bw=%f\n", __func__, k, l->vm_row_bw);
+			DML_LOG_VERBOSE("DML::%s: k=%d, max2: flip_and_active_bw=%f\n", __func__, k, l->flip_and_active_bw);
+			DML_LOG_VERBOSE("DML::%s: k=%d, max3: flip_and_prefetch_bw=%f\n", __func__, k, l->flip_and_prefetch_bw);
+			DML_LOG_VERBOSE("DML::%s: k=%d, max4: active_and_excess_bw=%f\n", __func__, k, l->active_and_excess_bw);
+			DML_LOG_VERBOSE("DML::%s: k=%d, surface_required_bw=%f\n", __func__, k, surface_required_bw[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, surface_peak_required_bw=%f\n", __func__, k, surface_peak_required_bw[k]);
 #endif
 		} else {
 			surface_required_bw[k] = 0.0;
@@ -5009,34 +4944,34 @@ static double get_urgent_bandwidth_required(
 		l->required_bandwidth_mbps += surface_required_bw[k];
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%d, NumberOfDPP=%d\n", __func__, k, NumberOfDPP[k]);
-		dml2_printf("DML::%s: k=%d, use_qual_row_bw=%d\n", __func__, k, use_qual_row_bw);
-		dml2_printf("DML::%s: k=%d, immediate_flip=%d\n", __func__, k, display_cfg->plane_descriptors[k].immediate_flip);
-		dml2_printf("DML::%s: k=%d, mall_svp_prefetch_factor=%f\n", __func__, k, l->mall_svp_prefetch_factor);
-		dml2_printf("DML::%s: k=%d, adj_factor_p0=%f\n", __func__, k, l->adj_factor_p0);
-		dml2_printf("DML::%s: k=%d, adj_factor_p1=%f\n", __func__, k, l->adj_factor_p1);
-		dml2_printf("DML::%s: k=%d, adj_factor_cur=%f\n", __func__, k, l->adj_factor_cur);
+		DML_LOG_VERBOSE("DML::%s: k=%d, NumberOfDPP=%d\n", __func__, k, NumberOfDPP[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, use_qual_row_bw=%d\n", __func__, k, use_qual_row_bw);
+		DML_LOG_VERBOSE("DML::%s: k=%d, immediate_flip=%d\n", __func__, k, display_cfg->plane_descriptors[k].immediate_flip);
+		DML_LOG_VERBOSE("DML::%s: k=%d, mall_svp_prefetch_factor=%f\n", __func__, k, l->mall_svp_prefetch_factor);
+		DML_LOG_VERBOSE("DML::%s: k=%d, adj_factor_p0=%f\n", __func__, k, l->adj_factor_p0);
+		DML_LOG_VERBOSE("DML::%s: k=%d, adj_factor_p1=%f\n", __func__, k, l->adj_factor_p1);
+		DML_LOG_VERBOSE("DML::%s: k=%d, adj_factor_cur=%f\n", __func__, k, l->adj_factor_cur);
 
-		dml2_printf("DML::%s: k=%d, adj_factor_p0_pre=%f\n", __func__, k, l->adj_factor_p0_pre);
-		dml2_printf("DML::%s: k=%d, adj_factor_p1_pre=%f\n", __func__, k, l->adj_factor_p1_pre);
-		dml2_printf("DML::%s: k=%d, adj_factor_cur_pre=%f\n", __func__, k, l->adj_factor_cur_pre);
+		DML_LOG_VERBOSE("DML::%s: k=%d, adj_factor_p0_pre=%f\n", __func__, k, l->adj_factor_p0_pre);
+		DML_LOG_VERBOSE("DML::%s: k=%d, adj_factor_p1_pre=%f\n", __func__, k, l->adj_factor_p1_pre);
+		DML_LOG_VERBOSE("DML::%s: k=%d, adj_factor_cur_pre=%f\n", __func__, k, l->adj_factor_cur_pre);
 
-		dml2_printf("DML::%s: k=%d, per_plane_flip_bw=%f\n", __func__, k, l->per_plane_flip_bw[k]);
-		dml2_printf("DML::%s: k=%d, prefetch_vmrow_bw=%f\n", __func__, k, prefetch_vmrow_bw[k]);
-		dml2_printf("DML::%s: k=%d, ReadBandwidthLuma=%f\n", __func__, k, ReadBandwidthLuma[k]);
-		dml2_printf("DML::%s: k=%d, ReadBandwidthChroma=%f\n", __func__, k, ReadBandwidthChroma[k]);
-		dml2_printf("DML::%s: k=%d, excess_vactive_fill_bw_l=%f\n", __func__, k, excess_vactive_fill_bw_l[k]);
-		dml2_printf("DML::%s: k=%d, excess_vactive_fill_bw_c=%f\n", __func__, k, excess_vactive_fill_bw_c[k]);
-		dml2_printf("DML::%s: k=%d, cursor_bw=%f\n", __func__, k, cursor_bw[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, per_plane_flip_bw=%f\n", __func__, k, l->per_plane_flip_bw[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, prefetch_vmrow_bw=%f\n", __func__, k, prefetch_vmrow_bw[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, ReadBandwidthLuma=%f\n", __func__, k, ReadBandwidthLuma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, ReadBandwidthChroma=%f\n", __func__, k, ReadBandwidthChroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, excess_vactive_fill_bw_l=%f\n", __func__, k, excess_vactive_fill_bw_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, excess_vactive_fill_bw_c=%f\n", __func__, k, excess_vactive_fill_bw_c[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, cursor_bw=%f\n", __func__, k, cursor_bw[k]);
 
-		dml2_printf("DML::%s: k=%d, meta_row_bw=%f\n", __func__, k, meta_row_bw[k]);
-		dml2_printf("DML::%s: k=%d, dpte_row_bw=%f\n", __func__, k, dpte_row_bw[k]);
-		dml2_printf("DML::%s: k=%d, PrefetchBandwidthLuma=%f\n", __func__, k, PrefetchBandwidthLuma[k]);
-		dml2_printf("DML::%s: k=%d, PrefetchBandwidthChroma=%f\n", __func__, k, PrefetchBandwidthChroma[k]);
-		dml2_printf("DML::%s: k=%d, prefetch_cursor_bw=%f\n", __func__, k, prefetch_cursor_bw[k]);
-		dml2_printf("DML::%s: k=%d, required_bandwidth_mbps=%f (total), inc_flip_bw=%d, is_phantom=%d exclude_this_plane=%d\n", __func__, k, l->required_bandwidth_mbps, inc_flip_bw, is_phantom, exclude_this_plane);
-		dml2_printf("DML::%s: k=%d, required_bandwidth_mbps=%f (total), soc_state=%s, inc_flip_bw=%d, is_phantom=%d exclude_this_plane=%d\n", __func__, k, l->required_bandwidth_mbps, dml2_core_internal_soc_state_type_str(state_type), inc_flip_bw, is_phantom, exclude_this_plane);
-		dml2_printf("DML::%s: k=%d, required_bandwidth_mbps=%f (total), inc_flip_bw=%d, is_phantom=%d exclude_this_plane=%d\n", __func__, k, l->required_bandwidth_mbps, inc_flip_bw, is_phantom, exclude_this_plane);
+		DML_LOG_VERBOSE("DML::%s: k=%d, meta_row_bw=%f\n", __func__, k, meta_row_bw[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, dpte_row_bw=%f\n", __func__, k, dpte_row_bw[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, PrefetchBandwidthLuma=%f\n", __func__, k, PrefetchBandwidthLuma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, PrefetchBandwidthChroma=%f\n", __func__, k, PrefetchBandwidthChroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, prefetch_cursor_bw=%f\n", __func__, k, prefetch_cursor_bw[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, required_bandwidth_mbps=%f (total), inc_flip_bw=%d, is_phantom=%d exclude_this_plane=%d\n", __func__, k, l->required_bandwidth_mbps, inc_flip_bw, is_phantom, exclude_this_plane);
+		DML_LOG_VERBOSE("DML::%s: k=%d, required_bandwidth_mbps=%f (total), soc_state=%s, inc_flip_bw=%d, is_phantom=%d exclude_this_plane=%d\n", __func__, k, l->required_bandwidth_mbps, dml2_core_internal_soc_state_type_str(state_type), inc_flip_bw, is_phantom, exclude_this_plane);
+		DML_LOG_VERBOSE("DML::%s: k=%d, required_bandwidth_mbps=%f (total), inc_flip_bw=%d, is_phantom=%d exclude_this_plane=%d\n", __func__, k, l->required_bandwidth_mbps, inc_flip_bw, is_phantom, exclude_this_plane);
 #endif
 	}
 
@@ -5120,19 +5055,19 @@ static void CalculateExtraLatency(
 	*ExtraLatency_sr = *ExtraLatency_sr + Tarb;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: qos_type=%u\n", __func__, qos_type);
-	dml2_printf("DML::%s: hostvm_mode=%u\n", __func__, hostvm_mode);
-	dml2_printf("DML::%s: Tex_trips=%u\n", __func__, Tex_trips);
-	dml2_printf("DML::%s: max_outstanding_when_urgent_expected=%u\n", __func__, max_outstanding_when_urgent_expected);
-	dml2_printf("DML::%s: FabricClock=%f\n", __func__, FabricClock);
-	dml2_printf("DML::%s: DCFCLK=%f\n", __func__, DCFCLK);
-	dml2_printf("DML::%s: ReturnBW=%f\n", __func__, ReturnBW);
-	dml2_printf("DML::%s: RoundTripPingLatencyCycles=%u\n", __func__, RoundTripPingLatencyCycles);
-	dml2_printf("DML::%s: ReorderingBytes=%u\n", __func__, ReorderingBytes);
-	dml2_printf("DML::%s: Tarb=%f\n", __func__, Tarb);
-	dml2_printf("DML::%s: ExtraLatency=%f\n", __func__, *ExtraLatency);
-	dml2_printf("DML::%s: ExtraLatency_sr=%f\n", __func__, *ExtraLatency_sr);
-	dml2_printf("DML::%s: ExtraLatencyPrefetch=%f\n", __func__, *ExtraLatencyPrefetch);
+	DML_LOG_VERBOSE("DML::%s: qos_type=%u\n", __func__, qos_type);
+	DML_LOG_VERBOSE("DML::%s: hostvm_mode=%u\n", __func__, hostvm_mode);
+	DML_LOG_VERBOSE("DML::%s: Tex_trips=%f\n", __func__, Tex_trips);
+	DML_LOG_VERBOSE("DML::%s: max_outstanding_when_urgent_expected=%u\n", __func__, max_outstanding_when_urgent_expected);
+	DML_LOG_VERBOSE("DML::%s: FabricClock=%f\n", __func__, FabricClock);
+	DML_LOG_VERBOSE("DML::%s: DCFCLK=%f\n", __func__, DCFCLK);
+	DML_LOG_VERBOSE("DML::%s: ReturnBW=%f\n", __func__, ReturnBW);
+	DML_LOG_VERBOSE("DML::%s: RoundTripPingLatencyCycles=%u\n", __func__, RoundTripPingLatencyCycles);
+	DML_LOG_VERBOSE("DML::%s: ReorderingBytes=%u\n", __func__, ReorderingBytes);
+	DML_LOG_VERBOSE("DML::%s: Tarb=%f\n", __func__, Tarb);
+	DML_LOG_VERBOSE("DML::%s: ExtraLatency=%f\n", __func__, *ExtraLatency);
+	DML_LOG_VERBOSE("DML::%s: ExtraLatency_sr=%f\n", __func__, *ExtraLatency_sr);
+	DML_LOG_VERBOSE("DML::%s: ExtraLatencyPrefetch=%f\n", __func__, *ExtraLatencyPrefetch);
 #endif
 }
 
@@ -5199,20 +5134,20 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		s->HostVMDynamicLevelsTrips = 0;
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: dcc_enable = %u\n", __func__, p->dcc_enable);
-	dml2_printf("DML::%s: mrq_present = %u\n", __func__, p->mrq_present);
-	dml2_printf("DML::%s: dcc_mrq_enable = %u\n", __func__, dcc_mrq_enable);
-	dml2_printf("DML::%s: GPUVMEnable = %u\n", __func__, p->display_cfg->gpuvm_enable);
-	dml2_printf("DML::%s: GPUVMPageTableLevels = %u\n", __func__, p->display_cfg->gpuvm_max_page_table_levels);
-	dml2_printf("DML::%s: DCCEnable = %u\n", __func__, p->myPipe->DCCEnable);
-	dml2_printf("DML::%s: VStartup = %u\n", __func__, p->VStartup);
-	dml2_printf("DML::%s: HostVMEnable = %u\n", __func__, p->display_cfg->hostvm_enable);
-	dml2_printf("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, p->HostVMInefficiencyFactor);
-	dml2_printf("DML::%s: TWait = %f\n", __func__, p->TWait);
-	dml2_printf("DML::%s: TWait_p = %f\n", __func__, s->TWait_p);
-	dml2_printf("DML::%s: Ttrip = %f\n", __func__, p->Ttrip);
-	dml2_printf("DML::%s: myPipe->Dppclk = %f\n", __func__, p->myPipe->Dppclk);
-	dml2_printf("DML::%s: myPipe->Dispclk = %f\n", __func__, p->myPipe->Dispclk);
+	DML_LOG_VERBOSE("DML::%s: dcc_enable = %u\n", __func__, p->dcc_enable);
+	DML_LOG_VERBOSE("DML::%s: mrq_present = %u\n", __func__, p->mrq_present);
+	DML_LOG_VERBOSE("DML::%s: dcc_mrq_enable = %u\n", __func__, dcc_mrq_enable);
+	DML_LOG_VERBOSE("DML::%s: GPUVMEnable = %u\n", __func__, p->display_cfg->gpuvm_enable);
+	DML_LOG_VERBOSE("DML::%s: GPUVMPageTableLevels = %u\n", __func__, p->display_cfg->gpuvm_max_page_table_levels);
+	DML_LOG_VERBOSE("DML::%s: DCCEnable = %u\n", __func__, p->myPipe->DCCEnable);
+	DML_LOG_VERBOSE("DML::%s: VStartup = %u\n", __func__, p->VStartup);
+	DML_LOG_VERBOSE("DML::%s: HostVMEnable = %u\n", __func__, p->display_cfg->hostvm_enable);
+	DML_LOG_VERBOSE("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, p->HostVMInefficiencyFactor);
+	DML_LOG_VERBOSE("DML::%s: TWait = %f\n", __func__, p->TWait);
+	DML_LOG_VERBOSE("DML::%s: TWait_p = %f\n", __func__, s->TWait_p);
+	DML_LOG_VERBOSE("DML::%s: Ttrip = %f\n", __func__, p->Ttrip);
+	DML_LOG_VERBOSE("DML::%s: myPipe->Dppclk = %f\n", __func__, p->myPipe->Dppclk);
+	DML_LOG_VERBOSE("DML::%s: myPipe->Dispclk = %f\n", __func__, p->myPipe->Dispclk);
 #endif
 	CalculateVUpdateAndDynamicMetadataParameters(
 		p->MaxInterDCNTileRepeaters,
@@ -5258,11 +5193,11 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	if (p->DynamicMetadataEnable == true) {
 		if (p->VStartup * s->LineTime < *p->TSetup + *p->Tdmdl + s->Tdmbf + s->Tdmec + s->Tdmsks) {
 			*p->NotEnoughTimeForDynamicMetadata = true;
-			dml2_printf("DML::%s: Not Enough Time for Dynamic Meta!\n", __func__);
-			dml2_printf("DML::%s: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", __func__, s->Tdmbf);
-			dml2_printf("DML::%s: Tdmec: %fus - time dio takes to transfer dmd\n", __func__, s->Tdmec);
-			dml2_printf("DML::%s: Tdmsks: %fus - time before active dmd must complete transmission at dio\n", __func__, s->Tdmsks);
-			dml2_printf("DML::%s: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", __func__, *p->Tdmdl);
+			DML_LOG_VERBOSE("DML::%s: Not Enough Time for Dynamic Meta!\n", __func__);
+			DML_LOG_VERBOSE("DML::%s: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", __func__, s->Tdmbf);
+			DML_LOG_VERBOSE("DML::%s: Tdmec: %fus - time dio takes to transfer dmd\n", __func__, s->Tdmec);
+			DML_LOG_VERBOSE("DML::%s: Tdmsks: %fus - time before active dmd must complete transmission at dio\n", __func__, s->Tdmsks);
+			DML_LOG_VERBOSE("DML::%s: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", __func__, *p->Tdmdl);
 		} else {
 			*p->NotEnoughTimeForDynamicMetadata = false;
 		}
@@ -5288,21 +5223,21 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		((p->myPipe->ODMMode == dml2_odm_mode_mso_1to4) ? (double)p->myPipe->HActive * 3.0 / 4.0 : 0));
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DynamicMetadataVMEnabled = %u\n", __func__, p->DynamicMetadataVMEnabled);
-	dml2_printf("DML::%s: DPPCycles = %u\n", __func__, s->DPPCycles);
-	dml2_printf("DML::%s: PixelClock = %f\n", __func__, p->myPipe->PixelClock);
-	dml2_printf("DML::%s: Dppclk = %f\n", __func__, p->myPipe->Dppclk);
-	dml2_printf("DML::%s: DISPCLKCycles = %u\n", __func__, s->DISPCLKCycles);
-	dml2_printf("DML::%s: DISPCLK = %f\n", __func__, p->myPipe->Dispclk);
-	dml2_printf("DML::%s: DSCDelay = %u\n", __func__, p->DSCDelay);
-	dml2_printf("DML::%s: ODMMode = %u\n", __func__, p->myPipe->ODMMode);
-	dml2_printf("DML::%s: DPP_RECOUT_WIDTH = %u\n", __func__, p->DPP_RECOUT_WIDTH);
-	dml2_printf("DML::%s: DSTXAfterScaler = %u\n", __func__, *p->DSTXAfterScaler);
+	DML_LOG_VERBOSE("DML::%s: DynamicMetadataVMEnabled = %u\n", __func__, p->DynamicMetadataVMEnabled);
+	DML_LOG_VERBOSE("DML::%s: DPPCycles = %u\n", __func__, s->DPPCycles);
+	DML_LOG_VERBOSE("DML::%s: PixelClock = %f\n", __func__, p->myPipe->PixelClock);
+	DML_LOG_VERBOSE("DML::%s: Dppclk = %f\n", __func__, p->myPipe->Dppclk);
+	DML_LOG_VERBOSE("DML::%s: DISPCLKCycles = %u\n", __func__, s->DISPCLKCycles);
+	DML_LOG_VERBOSE("DML::%s: DISPCLK = %f\n", __func__, p->myPipe->Dispclk);
+	DML_LOG_VERBOSE("DML::%s: DSCDelay = %u\n", __func__, p->DSCDelay);
+	DML_LOG_VERBOSE("DML::%s: ODMMode = %u\n", __func__, p->myPipe->ODMMode);
+	DML_LOG_VERBOSE("DML::%s: DPP_RECOUT_WIDTH = %u\n", __func__, p->DPP_RECOUT_WIDTH);
+	DML_LOG_VERBOSE("DML::%s: DSTXAfterScaler = %u\n", __func__, *p->DSTXAfterScaler);
 
-	dml2_printf("DML::%s: setup_for_tdlut = %u\n", __func__, p->setup_for_tdlut);
-	dml2_printf("DML::%s: tdlut_opt_time = %f\n", __func__, p->tdlut_opt_time);
-	dml2_printf("DML::%s: tdlut_pte_bytes_per_frame = %u\n", __func__, p->tdlut_pte_bytes_per_frame);
-	dml2_printf("DML::%s: tdlut_drain_time = %f\n", __func__, p->tdlut_drain_time);
+	DML_LOG_VERBOSE("DML::%s: setup_for_tdlut = %u\n", __func__, p->setup_for_tdlut);
+	DML_LOG_VERBOSE("DML::%s: tdlut_opt_time = %f\n", __func__, p->tdlut_opt_time);
+	DML_LOG_VERBOSE("DML::%s: tdlut_pte_bytes_per_frame = %u\n", __func__, p->tdlut_pte_bytes_per_frame);
+	DML_LOG_VERBOSE("DML::%s: tdlut_drain_time = %f\n", __func__, p->tdlut_drain_time);
 #endif
 
 	if (p->OutputFormat == dml2_420 || (p->myPipe->InterlaceEnable && p->myPipe->ProgressiveToInterlaceUnitInOPP))
@@ -5314,17 +5249,17 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	*p->DSTYAfterScaler = (unsigned int)(math_floor2(s->DSTTotalPixelsAfterScaler / p->myPipe->HTotal, 1));
 	*p->DSTXAfterScaler = (unsigned int)(s->DSTTotalPixelsAfterScaler - ((double)(*p->DSTYAfterScaler * p->myPipe->HTotal)));
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DSTXAfterScaler = %u (final)\n", __func__, *p->DSTXAfterScaler);
-	dml2_printf("DML::%s: DSTYAfterScaler = %u (final)\n", __func__, *p->DSTYAfterScaler);
+	DML_LOG_VERBOSE("DML::%s: DSTXAfterScaler = %u (final)\n", __func__, *p->DSTXAfterScaler);
+	DML_LOG_VERBOSE("DML::%s: DSTYAfterScaler = %u (final)\n", __func__, *p->DSTYAfterScaler);
 #endif
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: Tr0_trips = %f\n", __func__, *p->Tr0_trips);
-	dml2_printf("DML::%s: Tvm_trips = %f\n", __func__, *p->Tvm_trips);
-	dml2_printf("DML::%s: trip_to_mem = %f\n", __func__, s->trip_to_mem);
-	dml2_printf("DML::%s: ExtraLatencyPrefetch = %f\n", __func__, p->ExtraLatencyPrefetch);
-	dml2_printf("DML::%s: GPUVMPageTableLevels = %u\n", __func__, p->display_cfg->gpuvm_max_page_table_levels);
-	dml2_printf("DML::%s: HostVMDynamicLevelsTrips = %u\n", __func__, s->HostVMDynamicLevelsTrips);
+	DML_LOG_VERBOSE("DML::%s: Tr0_trips = %f\n", __func__, *p->Tr0_trips);
+	DML_LOG_VERBOSE("DML::%s: Tvm_trips = %f\n", __func__, *p->Tvm_trips);
+	DML_LOG_VERBOSE("DML::%s: trip_to_mem = %f\n", __func__, s->trip_to_mem);
+	DML_LOG_VERBOSE("DML::%s: ExtraLatencyPrefetch = %f\n", __func__, p->ExtraLatencyPrefetch);
+	DML_LOG_VERBOSE("DML::%s: GPUVMPageTableLevels = %u\n", __func__, p->display_cfg->gpuvm_max_page_table_levels);
+	DML_LOG_VERBOSE("DML::%s: HostVMDynamicLevelsTrips = %u\n", __func__, s->HostVMDynamicLevelsTrips);
 #endif
 	if (p->display_cfg->gpuvm_enable) {
 		s->Tvm_trips_rounded = math_ceil2(4.0 * *p->Tvm_trips / s->LineTime, 1.0) / 4.0 * s->LineTime;
@@ -5402,7 +5337,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	}
 
 	/* oto prefetch bw should be always be less than total vactive bw */
-	//DML2_ASSERT(s->prefetch_bw_oto < s->per_pipe_vactive_sw_bw * p->myPipe->DPPPerSurface);
+	//DML_ASSERT(s->prefetch_bw_oto < s->per_pipe_vactive_sw_bw * p->myPipe->DPPPerSurface);
 
 	s->prefetch_bw_oto = math_max2(s->per_pipe_vactive_sw_bw, s->prefetch_bw_oto) * p->mall_prefetch_sdp_overhead_factor;
 
@@ -5421,9 +5356,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	*p->RequiredPrefetchBWOTO = s->prefetch_bw_oto;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: vactive_sw_bw_l = %f\n", __func__, p->vactive_sw_bw_l);
-	dml2_printf("DML::%s: vactive_sw_bw_c = %f\n", __func__, p->vactive_sw_bw_c);
-	dml2_printf("DML::%s: per_pipe_vactive_sw_bw = %f\n", __func__, s->per_pipe_vactive_sw_bw);
+	DML_LOG_VERBOSE("DML::%s: vactive_sw_bw_l = %f\n", __func__, p->vactive_sw_bw_l);
+	DML_LOG_VERBOSE("DML::%s: vactive_sw_bw_c = %f\n", __func__, p->vactive_sw_bw_c);
+	DML_LOG_VERBOSE("DML::%s: per_pipe_vactive_sw_bw = %f\n", __func__, s->per_pipe_vactive_sw_bw);
 #endif
 
 	if (p->display_cfg->gpuvm_enable == true) {
@@ -5433,9 +5368,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			s->LineTime / 4.0);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: Tvm_oto max0 = %f\n", __func__, *p->Tvm_trips);
-		dml2_printf("DML::%s: Tvm_oto max1 = %f\n", __func__, *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw_oto);
-		dml2_printf("DML::%s: Tvm_oto max2 = %f\n", __func__, s->LineTime / 4.0);
+		DML_LOG_VERBOSE("DML::%s: Tvm_oto max0 = %f\n", __func__, *p->Tvm_trips);
+		DML_LOG_VERBOSE("DML::%s: Tvm_oto max1 = %f\n", __func__, *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw_oto);
+		DML_LOG_VERBOSE("DML::%s: Tvm_oto max2 = %f\n", __func__, s->LineTime / 4.0);
 #endif
 	} else {
 		s->Tvm_oto = s->Tvm_trips_rounded;
@@ -5447,9 +5382,9 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / s->prefetch_bw_oto,
 			s->LineTime / 4.0);
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: Tr0_oto max0 = %f\n", __func__, *p->Tr0_trips);
-		dml2_printf("DML::%s: Tr0_oto max1 = %f\n", __func__, (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / s->prefetch_bw_oto);
-		dml2_printf("DML::%s: Tr0_oto max2 = %f\n", __func__, s->LineTime / 4);
+		DML_LOG_VERBOSE("DML::%s: Tr0_oto max0 = %f\n", __func__, *p->Tr0_trips);
+		DML_LOG_VERBOSE("DML::%s: Tr0_oto max1 = %f\n", __func__, (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / s->prefetch_bw_oto);
+		DML_LOG_VERBOSE("DML::%s: Tr0_oto max2 = %f\n", __func__, s->LineTime / 4);
 #endif
 	} else
 		s->Tr0_oto = s->LineTime / 4.0;
@@ -5459,11 +5394,11 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->dst_y_prefetch_oto = s->Tvm_oto_lines + 2 * s->Tr0_oto_lines + s->Lsw_oto;
 
 #ifdef DML_GLOBAL_PREFETCH_CHECK
-	dml2_printf("DML::%s: impacted_Tpre = %f\n", __func__, p->impacted_dst_y_pre);
+	DML_LOG_VERBOSE("DML::%s: impacted_Tpre = %f\n", __func__, p->impacted_dst_y_pre);
 	if (p->impacted_dst_y_pre > 0) {
-		dml2_printf("DML::%s: dst_y_prefetch_oto = %f\n", __func__, s->dst_y_prefetch_oto);
+		DML_LOG_VERBOSE("DML::%s: dst_y_prefetch_oto = %f\n", __func__, s->dst_y_prefetch_oto);
 		s->dst_y_prefetch_oto = math_max2(s->dst_y_prefetch_oto, p->impacted_dst_y_pre);
-		dml2_printf("DML::%s: dst_y_prefetch_oto = %f (impacted)\n", __func__, s->dst_y_prefetch_oto);
+		DML_LOG_VERBOSE("DML::%s: dst_y_prefetch_oto = %f (impacted)\n", __func__, s->dst_y_prefetch_oto);
 	}
 #endif
 	*p->Tpre_oto = s->dst_y_prefetch_oto * s->LineTime;
@@ -5492,72 +5427,71 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->dst_y_prefetch_equ = math_min2(s->dst_y_prefetch_equ, 63.75); // limit to the reg limit of U6.2 for DST_Y_PREFETCH
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: HTotal = %u\n", __func__, p->myPipe->HTotal);
-	dml2_printf("DML::%s: min_Lsw_oto = %f\n", __func__, s->min_Lsw_oto);
-	dml2_printf("DML::%s: min_Lsw_equ = %f\n", __func__, s->min_Lsw_equ);
-	dml2_printf("DML::%s: Tno_bw = %f\n", __func__, *p->Tno_bw);
-	dml2_printf("DML::%s: Tno_bw_flip = %f\n", __func__, *p->Tno_bw_flip);
-	dml2_printf("DML::%s: ExtraLatencyPrefetch = %f\n", __func__, p->ExtraLatencyPrefetch);
-	dml2_printf("DML::%s: trip_to_mem = %f\n", __func__, s->trip_to_mem);
-	dml2_printf("DML::%s: mall_prefetch_sdp_overhead_factor = %f\n", __func__, p->mall_prefetch_sdp_overhead_factor);
-	dml2_printf("DML::%s: BytePerPixelY = %u\n", __func__, p->myPipe->BytePerPixelY);
-	dml2_printf("DML::%s: PrefetchSourceLinesY = %f\n", __func__, p->PrefetchSourceLinesY);
-	dml2_printf("DML::%s: swath_width_luma_ub = %u\n", __func__, p->swath_width_luma_ub);
-	dml2_printf("DML::%s: BytePerPixelC = %u\n", __func__, p->myPipe->BytePerPixelC);
-	dml2_printf("DML::%s: PrefetchSourceLinesC = %f\n", __func__, p->PrefetchSourceLinesC);
-	dml2_printf("DML::%s: swath_width_chroma_ub = %u\n", __func__, p->swath_width_chroma_ub);
-	dml2_printf("DML::%s: prefetch_sw_bytes = %f\n", __func__, *p->prefetch_sw_bytes);
-	dml2_printf("DML::%s: max_Tsw = %f\n", __func__, s->max_Tsw);
-	dml2_printf("DML::%s: bytes_pp = %f\n", __func__, s->bytes_pp);
-	dml2_printf("DML::%s: vm_bytes = %u\n", __func__, vm_bytes);
-	dml2_printf("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, p->PixelPTEBytesPerRow);
-	dml2_printf("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, p->HostVMInefficiencyFactor);
-	dml2_printf("DML::%s: Tvm_trips = %f\n", __func__, *p->Tvm_trips);
-	dml2_printf("DML::%s: Tr0_trips = %f\n", __func__, *p->Tr0_trips);
-	dml2_printf("DML::%s: Tvm_trips_flip = %f\n", __func__, *p->Tvm_trips_flip);
-	dml2_printf("DML::%s: Tr0_trips_flip = %f\n", __func__, *p->Tr0_trips_flip);
-	dml2_printf("DML::%s: prefetch_bw_pr = %f\n", __func__, s->prefetch_bw_pr);
-	dml2_printf("DML::%s: prefetch_bw_oto = %f\n", __func__, s->prefetch_bw_oto);
-	dml2_printf("DML::%s: Tr0_oto = %f\n", __func__, s->Tr0_oto);
-	dml2_printf("DML::%s: Tvm_oto = %f\n", __func__, s->Tvm_oto);
-	dml2_printf("DML::%s: Tvm_oto_lines = %f\n", __func__, s->Tvm_oto_lines);
-	dml2_printf("DML::%s: Tr0_oto_lines = %f\n", __func__, s->Tr0_oto_lines);
-	dml2_printf("DML::%s: Lsw_oto = %f\n", __func__, s->Lsw_oto);
-	dml2_printf("DML::%s: dst_y_prefetch_oto = %f\n", __func__, s->dst_y_prefetch_oto);
-	dml2_printf("DML::%s: dst_y_prefetch_equ = %f\n", __func__, s->dst_y_prefetch_equ);
-	dml2_printf("DML::%s: tdlut_row_bytes = %d\n", __func__, tdlut_row_bytes);
-	dml2_printf("DML::%s: meta_row_bytes = %d\n", __func__, p->meta_row_bytes);
-#endif
-	double Tpre = s->dst_y_prefetch_equ * s->LineTime;
+	DML_LOG_VERBOSE("DML::%s: HTotal = %u\n", __func__, p->myPipe->HTotal);
+	DML_LOG_VERBOSE("DML::%s: min_Lsw_oto = %f\n", __func__, s->min_Lsw_oto);
+	DML_LOG_VERBOSE("DML::%s: min_Lsw_equ = %f\n", __func__, s->min_Lsw_equ);
+	DML_LOG_VERBOSE("DML::%s: Tno_bw = %f\n", __func__, *p->Tno_bw);
+	DML_LOG_VERBOSE("DML::%s: Tno_bw_flip = %f\n", __func__, *p->Tno_bw_flip);
+	DML_LOG_VERBOSE("DML::%s: ExtraLatencyPrefetch = %f\n", __func__, p->ExtraLatencyPrefetch);
+	DML_LOG_VERBOSE("DML::%s: trip_to_mem = %f\n", __func__, s->trip_to_mem);
+	DML_LOG_VERBOSE("DML::%s: mall_prefetch_sdp_overhead_factor = %f\n", __func__, p->mall_prefetch_sdp_overhead_factor);
+	DML_LOG_VERBOSE("DML::%s: BytePerPixelY = %u\n", __func__, p->myPipe->BytePerPixelY);
+	DML_LOG_VERBOSE("DML::%s: PrefetchSourceLinesY = %f\n", __func__, p->PrefetchSourceLinesY);
+	DML_LOG_VERBOSE("DML::%s: swath_width_luma_ub = %u\n", __func__, p->swath_width_luma_ub);
+	DML_LOG_VERBOSE("DML::%s: BytePerPixelC = %u\n", __func__, p->myPipe->BytePerPixelC);
+	DML_LOG_VERBOSE("DML::%s: PrefetchSourceLinesC = %f\n", __func__, p->PrefetchSourceLinesC);
+	DML_LOG_VERBOSE("DML::%s: swath_width_chroma_ub = %u\n", __func__, p->swath_width_chroma_ub);
+	DML_LOG_VERBOSE("DML::%s: prefetch_sw_bytes = %f\n", __func__, *p->prefetch_sw_bytes);
+	DML_LOG_VERBOSE("DML::%s: max_Tsw = %f\n", __func__, s->max_Tsw);
+	DML_LOG_VERBOSE("DML::%s: bytes_pp = %f\n", __func__, s->bytes_pp);
+	DML_LOG_VERBOSE("DML::%s: vm_bytes = %u\n", __func__, vm_bytes);
+	DML_LOG_VERBOSE("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, p->PixelPTEBytesPerRow);
+	DML_LOG_VERBOSE("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, p->HostVMInefficiencyFactor);
+	DML_LOG_VERBOSE("DML::%s: Tvm_trips = %f\n", __func__, *p->Tvm_trips);
+	DML_LOG_VERBOSE("DML::%s: Tr0_trips = %f\n", __func__, *p->Tr0_trips);
+	DML_LOG_VERBOSE("DML::%s: Tvm_trips_flip = %f\n", __func__, *p->Tvm_trips_flip);
+	DML_LOG_VERBOSE("DML::%s: Tr0_trips_flip = %f\n", __func__, *p->Tr0_trips_flip);
+	DML_LOG_VERBOSE("DML::%s: prefetch_bw_pr = %f\n", __func__, s->prefetch_bw_pr);
+	DML_LOG_VERBOSE("DML::%s: prefetch_bw_oto = %f\n", __func__, s->prefetch_bw_oto);
+	DML_LOG_VERBOSE("DML::%s: Tr0_oto = %f\n", __func__, s->Tr0_oto);
+	DML_LOG_VERBOSE("DML::%s: Tvm_oto = %f\n", __func__, s->Tvm_oto);
+	DML_LOG_VERBOSE("DML::%s: Tvm_oto_lines = %f\n", __func__, s->Tvm_oto_lines);
+	DML_LOG_VERBOSE("DML::%s: Tr0_oto_lines = %f\n", __func__, s->Tr0_oto_lines);
+	DML_LOG_VERBOSE("DML::%s: Lsw_oto = %f\n", __func__, s->Lsw_oto);
+	DML_LOG_VERBOSE("DML::%s: dst_y_prefetch_oto = %f\n", __func__, s->dst_y_prefetch_oto);
+	DML_LOG_VERBOSE("DML::%s: dst_y_prefetch_equ = %f\n", __func__, s->dst_y_prefetch_equ);
+	DML_LOG_VERBOSE("DML::%s: tdlut_row_bytes = %d\n", __func__, tdlut_row_bytes);
+	DML_LOG_VERBOSE("DML::%s: meta_row_bytes = %d\n", __func__, p->meta_row_bytes);
+#endif
 	s->dst_y_prefetch_equ = math_floor2(4.0 * (s->dst_y_prefetch_equ + 0.125), 1) / 4.0;
 	*p->Tpre_rounded = s->dst_y_prefetch_equ * s->LineTime;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: dst_y_prefetch_equ: %f (after round)\n", __func__, s->dst_y_prefetch_equ);
-	dml2_printf("DML::%s: LineTime: %f\n", __func__, s->LineTime);
-	dml2_printf("DML::%s: VStartup: %u\n", __func__, p->VStartup);
-	dml2_printf("DML::%s: Tvstartup: %fus - time between vstartup and first pixel of active\n", __func__, p->VStartup * s->LineTime);
-	dml2_printf("DML::%s: TSetup: %fus - time from vstartup to vready\n", __func__, *p->TSetup);
-	dml2_printf("DML::%s: TCalc: %fus - time for calculations in dchub starting at vready\n", __func__, p->TCalc);
-	dml2_printf("DML::%s: TWait: %fus - time for fabric to become ready max(pstate exit,cstate enter/exit, urgent latency) after TCalc\n", __func__, p->TWait);
-	dml2_printf("DML::%s: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", __func__, s->Tdmbf);
-	dml2_printf("DML::%s: Tdmec: %fus - time dio takes to transfer dmd\n", __func__, s->Tdmec);
-	dml2_printf("DML::%s: Tdmsks: %fus - time before active dmd must complete transmission at dio\n", __func__, s->Tdmsks);
-	dml2_printf("DML::%s: TWait = %f\n", __func__, p->TWait);
-	dml2_printf("DML::%s: TWait_p = %f\n", __func__, s->TWait_p);
-	dml2_printf("DML::%s: Ttrip = %f\n", __func__, p->Ttrip);
-	dml2_printf("DML::%s: Tex = %f\n", __func__, p->ExtraLatencyPrefetch);
-	dml2_printf("DML::%s: Tdmdl_vm: %fus - time for vm stages of dmd \n", __func__, *p->Tdmdl_vm);
-	dml2_printf("DML::%s: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", __func__, *p->Tdmdl);
-	dml2_printf("DML::%s: TWait_p: %fus\n", __func__, s->TWait_p);
-	dml2_printf("DML::%s: Ttrip: %fus\n", __func__, p->Ttrip);
-	dml2_printf("DML::%s: DSTXAfterScaler: %u pixels - number of pixel clocks pipeline and buffer delay after scaler \n", __func__, *p->DSTXAfterScaler);
-	dml2_printf("DML::%s: DSTYAfterScaler: %u lines - number of lines of pipeline and buffer delay after scaler \n", __func__, *p->DSTYAfterScaler);
-	dml2_printf("DML::%s: vm_bytes: %f (hvm inefficiency scaled)\n", __func__, vm_bytes*p->HostVMInefficiencyFactor);
-	dml2_printf("DML::%s: row_bytes: %f (hvm inefficiency scaled, 1 row)\n", __func__, p->PixelPTEBytesPerRow*p->HostVMInefficiencyFactor+p->meta_row_bytes+tdlut_row_bytes);
-	dml2_printf("DML::%s: Tno_bw: %f\n", __func__, *p->Tno_bw);
-	dml2_printf("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, Tpre, *p->Tpre_rounded, (*p->Tpre_rounded - Tpre));
-	dml2_printf("DML::%s: Tvm_trips=%f Tvm_trips_rounded: %f, delta=%f\n", __func__, *p->Tvm_trips, s->Tvm_trips_rounded, (s->Tvm_trips_rounded - *p->Tvm_trips));
+	DML_LOG_VERBOSE("DML::%s: dst_y_prefetch_equ: %f (after round)\n", __func__, s->dst_y_prefetch_equ);
+	DML_LOG_VERBOSE("DML::%s: LineTime: %f\n", __func__, s->LineTime);
+	DML_LOG_VERBOSE("DML::%s: VStartup: %u\n", __func__, p->VStartup);
+	DML_LOG_VERBOSE("DML::%s: Tvstartup: %fus - time between vstartup and first pixel of active\n", __func__, p->VStartup * s->LineTime);
+	DML_LOG_VERBOSE("DML::%s: TSetup: %fus - time from vstartup to vready\n", __func__, *p->TSetup);
+	DML_LOG_VERBOSE("DML::%s: TCalc: %fus - time for calculations in dchub starting at vready\n", __func__, p->TCalc);
+	DML_LOG_VERBOSE("DML::%s: TWait: %fus - time for fabric to become ready max(pstate exit,cstate enter/exit, urgent latency) after TCalc\n", __func__, p->TWait);
+	DML_LOG_VERBOSE("DML::%s: Tdmbf: %fus - time for dmd transfer from dchub to dio output buffer\n", __func__, s->Tdmbf);
+	DML_LOG_VERBOSE("DML::%s: Tdmec: %fus - time dio takes to transfer dmd\n", __func__, s->Tdmec);
+	DML_LOG_VERBOSE("DML::%s: Tdmsks: %fus - time before active dmd must complete transmission at dio\n", __func__, s->Tdmsks);
+	DML_LOG_VERBOSE("DML::%s: TWait = %f\n", __func__, p->TWait);
+	DML_LOG_VERBOSE("DML::%s: TWait_p = %f\n", __func__, s->TWait_p);
+	DML_LOG_VERBOSE("DML::%s: Ttrip = %f\n", __func__, p->Ttrip);
+	DML_LOG_VERBOSE("DML::%s: Tex = %f\n", __func__, p->ExtraLatencyPrefetch);
+	DML_LOG_VERBOSE("DML::%s: Tdmdl_vm: %fus - time for vm stages of dmd \n", __func__, *p->Tdmdl_vm);
+	DML_LOG_VERBOSE("DML::%s: Tdmdl: %fus - time for fabric to become ready and fetch dmd \n", __func__, *p->Tdmdl);
+	DML_LOG_VERBOSE("DML::%s: TWait_p: %fus\n", __func__, s->TWait_p);
+	DML_LOG_VERBOSE("DML::%s: Ttrip: %fus\n", __func__, p->Ttrip);
+	DML_LOG_VERBOSE("DML::%s: DSTXAfterScaler: %u pixels - number of pixel clocks pipeline and buffer delay after scaler \n", __func__, *p->DSTXAfterScaler);
+	DML_LOG_VERBOSE("DML::%s: DSTYAfterScaler: %u lines - number of lines of pipeline and buffer delay after scaler \n", __func__, *p->DSTYAfterScaler);
+	DML_LOG_VERBOSE("DML::%s: vm_bytes: %f (hvm inefficiency scaled)\n", __func__, vm_bytes*p->HostVMInefficiencyFactor);
+	DML_LOG_VERBOSE("DML::%s: row_bytes: %f (hvm inefficiency scaled, 1 row)\n", __func__, p->PixelPTEBytesPerRow*p->HostVMInefficiencyFactor+p->meta_row_bytes+tdlut_row_bytes);
+	DML_LOG_VERBOSE("DML::%s: Tno_bw: %f\n", __func__, *p->Tno_bw);
+	DML_LOG_VERBOSE("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, (s->dst_y_prefetch_equ * s->LineTime), *p->Tpre_rounded, (*p->Tpre_rounded - (s->dst_y_prefetch_equ * s->LineTime)));
+	DML_LOG_VERBOSE("DML::%s: Tvm_trips=%f Tvm_trips_rounded: %f, delta=%f\n", __func__, *p->Tvm_trips, s->Tvm_trips_rounded, (s->Tvm_trips_rounded - *p->Tvm_trips));
 #endif
 
 	*p->dst_y_per_vm_vblank = 0;
@@ -5596,19 +5530,19 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		} else
 			s->prefetch_bw1 = 0;
 
-		dml2_printf("DML::%s: prefetch_bw1: %f\n", __func__, s->prefetch_bw1);
+		DML_LOG_VERBOSE("DML::%s: prefetch_bw1: %f\n", __func__, s->prefetch_bw1);
 		if ((s->Tsw_est1 < s->min_Lsw_equ * s->LineTime) && (*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw > 0)) {
 			s->prefetch_bw1 = (vm_bytes * p->HostVMInefficiencyFactor + 2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)) /
 				(*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw);
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: vm and 2 rows bytes = %f\n", __func__, (vm_bytes * p->HostVMInefficiencyFactor + 2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)));
-			dml2_printf("DML::%s: Tpre_rounded = %f\n", __func__, *p->Tpre_rounded);
-			dml2_printf("DML::%s: minus term = %f\n", __func__, s->min_Lsw_equ * s->LineTime + 0.75 * s->LineTime + *p->Tno_bw);
-			dml2_printf("DML::%s: min_Lsw_equ = %f\n", __func__, s->min_Lsw_equ);
-			dml2_printf("DML::%s: LineTime = %f\n", __func__, s->LineTime);
-			dml2_printf("DML::%s: Tno_bw = %f\n", __func__, *p->Tno_bw);
-			dml2_printf("DML::%s: Time to fetch vm and 2 rows = %f\n", __func__, (*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw));
-			dml2_printf("DML::%s: prefetch_bw1: %f (updated)\n", __func__, s->prefetch_bw1);
+			DML_LOG_VERBOSE("DML::%s: vm and 2 rows bytes = %f\n", __func__, (vm_bytes * p->HostVMInefficiencyFactor + 2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)));
+			DML_LOG_VERBOSE("DML::%s: Tpre_rounded = %f\n", __func__, *p->Tpre_rounded);
+			DML_LOG_VERBOSE("DML::%s: minus term = %f\n", __func__, s->min_Lsw_equ * s->LineTime + 0.75 * s->LineTime + *p->Tno_bw);
+			DML_LOG_VERBOSE("DML::%s: min_Lsw_equ = %f\n", __func__, s->min_Lsw_equ);
+			DML_LOG_VERBOSE("DML::%s: LineTime = %f\n", __func__, s->LineTime);
+			DML_LOG_VERBOSE("DML::%s: Tno_bw = %f\n", __func__, *p->Tno_bw);
+			DML_LOG_VERBOSE("DML::%s: Time to fetch vm and 2 rows = %f\n", __func__, (*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw));
+			DML_LOG_VERBOSE("DML::%s: prefetch_bw1: %f (updated)\n", __func__, s->prefetch_bw1);
 #endif
 		}
 
@@ -5620,10 +5554,10 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		} else
 			s->prefetch_bw2 = 0;
 
-		dml2_printf("DML::%s: prefetch_bw2: %f\n", __func__, s->prefetch_bw2);
+		DML_LOG_VERBOSE("DML::%s: prefetch_bw2: %f\n", __func__, s->prefetch_bw2);
 		if ((s->Tsw_est2 < s->min_Lsw_equ * s->LineTime) && ((*p->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded - s->min_Lsw_equ * s->LineTime - 0.25 * s->LineTime) > 0)) {
 			s->prefetch_bw2 = vm_bytes * p->HostVMInefficiencyFactor / (*p->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded - s->min_Lsw_equ * s->LineTime - 0.25 * s->LineTime);
-			dml2_printf("DML::%s: prefetch_bw2: %f (updated)\n", __func__, s->prefetch_bw2);
+			DML_LOG_VERBOSE("DML::%s: prefetch_bw2: %f (updated)\n", __func__, s->prefetch_bw2);
 		}
 
 		// prefetch_bw3: 2*R0 + SW
@@ -5634,10 +5568,10 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		} else
 			s->prefetch_bw3 = 0;
 
-		dml2_printf("DML::%s: prefetch_bw3: %f\n", __func__, s->prefetch_bw3);
+		DML_LOG_VERBOSE("DML::%s: prefetch_bw3: %f\n", __func__, s->prefetch_bw3);
 		if ((s->Tsw_est3 < s->min_Lsw_equ * s->LineTime) && ((*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded) > 0)) {
 			s->prefetch_bw3 = (2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)) / (*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded);
-			dml2_printf("DML::%s: prefetch_bw3: %f (updated)\n", __func__, s->prefetch_bw3);
+			DML_LOG_VERBOSE("DML::%s: prefetch_bw3: %f (updated)\n", __func__, s->prefetch_bw3);
 		}
 
 		// prefetch_bw4: SW
@@ -5647,17 +5581,17 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			s->prefetch_bw4 = 0;
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: Tno_bw: %f\n", __func__, *p->Tno_bw);
-		dml2_printf("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, Tpre, *p->Tpre_rounded, (*p->Tpre_rounded - Tpre));
-		dml2_printf("DML::%s: Tvm_trips=%f Tvm_trips_rounded: %f, delta=%f\n", __func__, *p->Tvm_trips, s->Tvm_trips_rounded, (s->Tvm_trips_rounded - *p->Tvm_trips));
-		dml2_printf("DML::%s: Tr0_trips=%f Tr0_trips_rounded: %f, delta=%f\n", __func__, *p->Tr0_trips, s->Tr0_trips_rounded, (s->Tr0_trips_rounded - *p->Tr0_trips));
-		dml2_printf("DML::%s: Tsw_est1: %f\n", __func__, s->Tsw_est1);
-		dml2_printf("DML::%s: Tsw_est2: %f\n", __func__, s->Tsw_est2);
-		dml2_printf("DML::%s: Tsw_est3: %f\n", __func__, s->Tsw_est3);
-		dml2_printf("DML::%s: prefetch_bw1: %f (final)\n", __func__, s->prefetch_bw1);
-		dml2_printf("DML::%s: prefetch_bw2: %f (final)\n", __func__, s->prefetch_bw2);
-		dml2_printf("DML::%s: prefetch_bw3: %f (final)\n", __func__, s->prefetch_bw3);
-		dml2_printf("DML::%s: prefetch_bw4: %f (final)\n", __func__, s->prefetch_bw4);
+		DML_LOG_VERBOSE("DML::%s: Tno_bw: %f\n", __func__, *p->Tno_bw);
+		DML_LOG_VERBOSE("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, s->dst_y_prefetch_equ * s->LineTime, *p->Tpre_rounded, (*p->Tpre_rounded - (s->dst_y_prefetch_equ * s->LineTime)));
+		DML_LOG_VERBOSE("DML::%s: Tvm_trips=%f Tvm_trips_rounded: %f, delta=%f\n", __func__, *p->Tvm_trips, s->Tvm_trips_rounded, (s->Tvm_trips_rounded - *p->Tvm_trips));
+		DML_LOG_VERBOSE("DML::%s: Tr0_trips=%f Tr0_trips_rounded: %f, delta=%f\n", __func__, *p->Tr0_trips, s->Tr0_trips_rounded, (s->Tr0_trips_rounded - *p->Tr0_trips));
+		DML_LOG_VERBOSE("DML::%s: Tsw_est1: %f\n", __func__, s->Tsw_est1);
+		DML_LOG_VERBOSE("DML::%s: Tsw_est2: %f\n", __func__, s->Tsw_est2);
+		DML_LOG_VERBOSE("DML::%s: Tsw_est3: %f\n", __func__, s->Tsw_est3);
+		DML_LOG_VERBOSE("DML::%s: prefetch_bw1: %f (final)\n", __func__, s->prefetch_bw1);
+		DML_LOG_VERBOSE("DML::%s: prefetch_bw2: %f (final)\n", __func__, s->prefetch_bw2);
+		DML_LOG_VERBOSE("DML::%s: prefetch_bw3: %f (final)\n", __func__, s->prefetch_bw3);
+		DML_LOG_VERBOSE("DML::%s: prefetch_bw4: %f (final)\n", __func__, s->prefetch_bw4);
 #endif
 		{
 			bool Case1OK = false;
@@ -5676,14 +5610,14 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 
 			double total_row_bytes = (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes);
 
-			dml2_printf("DML::%s: Tvm_trips_rounded = %f\n", __func__, s->Tvm_trips_rounded);
-			dml2_printf("DML::%s: Tr0_trips_rounded = %f\n", __func__, s->Tr0_trips_rounded);
+			DML_LOG_VERBOSE("DML::%s: Tvm_trips_rounded = %f\n", __func__, s->Tvm_trips_rounded);
+			DML_LOG_VERBOSE("DML::%s: Tr0_trips_rounded = %f\n", __func__, s->Tr0_trips_rounded);
 
 			if (s->prefetch_bw1 > 0) {
 				double vm_transfer_time = *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw1;
 				double row_transfer_time = total_row_bytes / s->prefetch_bw1;
-				dml2_printf("DML::%s: Case1: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
-				dml2_printf("DML::%s: Case1: row_transfer_time = %f\n", __func__, row_transfer_time);
+				DML_LOG_VERBOSE("DML::%s: Case1: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
+				DML_LOG_VERBOSE("DML::%s: Case1: row_transfer_time = %f\n", __func__, row_transfer_time);
 				if (vm_transfer_time >= s->Tvm_trips_rounded && row_transfer_time >= s->Tr0_trips_rounded) {
 					Case1OK = true;
 				}
@@ -5696,8 +5630,8 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			if (s->prefetch_bw2 > 0) {
 				double vm_transfer_time = *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw2;
 				double row_transfer_time = total_row_bytes / s->prefetch_bw2;
-				dml2_printf("DML::%s: Case2: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
-				dml2_printf("DML::%s: Case2: row_transfer_time = %f\n", __func__, row_transfer_time);
+				DML_LOG_VERBOSE("DML::%s: Case2: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
+				DML_LOG_VERBOSE("DML::%s: Case2: row_transfer_time = %f\n", __func__, row_transfer_time);
 				if (vm_transfer_time >= s->Tvm_trips_rounded && row_transfer_time < s->Tr0_trips_rounded) {
 					Case2OK = true;
 				}
@@ -5709,8 +5643,8 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			if (s->prefetch_bw3 > 0) {
 				double vm_transfer_time = *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw3;
 				double row_transfer_time = total_row_bytes / s->prefetch_bw3;
-				dml2_printf("DML::%s: Case3: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
-				dml2_printf("DML::%s: Case3: row_transfer_time = %f\n", __func__, row_transfer_time);
+				DML_LOG_VERBOSE("DML::%s: Case3: vm_transfer_time  = %f\n", __func__, vm_transfer_time);
+				DML_LOG_VERBOSE("DML::%s: Case3: row_transfer_time = %f\n", __func__, row_transfer_time);
 				if (vm_transfer_time < s->Tvm_trips_rounded && row_transfer_time >= s->Tr0_trips_rounded) {
 					Case3OK = true;
 				}
@@ -5730,10 +5664,10 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 							p->vm_bytes * p->HostVMInefficiencyFactor / (31 * s->LineTime) - *p->Tno_bw,
 							(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / (15 * s->LineTime));
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: Case1OK: %u\n", __func__, Case1OK);
-			dml2_printf("DML::%s: Case2OK: %u\n", __func__, Case2OK);
-			dml2_printf("DML::%s: Case3OK: %u\n", __func__, Case3OK);
-			dml2_printf("DML::%s: prefetch_bw_equ: %f\n", __func__, s->prefetch_bw_equ);
+			DML_LOG_VERBOSE("DML::%s: Case1OK: %u\n", __func__, Case1OK);
+			DML_LOG_VERBOSE("DML::%s: Case2OK: %u\n", __func__, Case2OK);
+			DML_LOG_VERBOSE("DML::%s: Case3OK: %u\n", __func__, Case3OK);
+			DML_LOG_VERBOSE("DML::%s: prefetch_bw_equ: %f\n", __func__, s->prefetch_bw_equ);
 #endif
 
 			if (s->prefetch_bw_equ > 0) {
@@ -5753,12 +5687,12 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			} else {
 				s->Tvm_equ = 0;
 				s->Tr0_equ = 0;
-				dml2_printf("DML::%s: prefetch_bw_equ equals 0!\n", __func__);
+				DML_LOG_VERBOSE("DML::%s: prefetch_bw_equ equals 0!\n", __func__);
 			}
 		}
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: Tvm_equ = %f\n", __func__, s->Tvm_equ);
-		dml2_printf("DML::%s: Tr0_equ = %f\n", __func__, s->Tr0_equ);
+		DML_LOG_VERBOSE("DML::%s: Tvm_equ = %f\n", __func__, s->Tvm_equ);
+		DML_LOG_VERBOSE("DML::%s: Tr0_equ = %f\n", __func__, s->Tr0_equ);
 #endif
 		// Use the more stressful prefetch schedule
 		if (s->dst_y_prefetch_oto < s->dst_y_prefetch_equ) {
@@ -5769,7 +5703,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
 			*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: Using oto scheduling for prefetch\n", __func__);
+			DML_LOG_VERBOSE("DML::%s: Using oto scheduling for prefetch\n", __func__);
 #endif
 
 		} else {
@@ -5785,7 +5719,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: Using equ bw scheduling for prefetch\n", __func__);
+			DML_LOG_VERBOSE("DML::%s: Using equ bw scheduling for prefetch\n", __func__);
 #endif
 		}
 
@@ -5797,31 +5731,31 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		*p->prefetch_swath_time_us = (s->LinesToRequestPrefetchPixelData * s->LineTime);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: TimeForFetchingVM = %f\n", __func__, s->TimeForFetchingVM);
-		dml2_printf("DML::%s: TimeForFetchingRowInVBlank = %f\n", __func__, s->TimeForFetchingRowInVBlank);
-		dml2_printf("DML::%s: LineTime = %f\n", __func__, s->LineTime);
-		dml2_printf("DML::%s: dst_y_prefetch = %f\n", __func__, *p->dst_y_prefetch);
-		dml2_printf("DML::%s: dst_y_per_vm_vblank = %f\n", __func__, *p->dst_y_per_vm_vblank);
-		dml2_printf("DML::%s: dst_y_per_row_vblank = %f\n", __func__, *p->dst_y_per_row_vblank);
-		dml2_printf("DML::%s: LinesToRequestPrefetchPixelData = %f\n", __func__, s->LinesToRequestPrefetchPixelData);
-		dml2_printf("DML::%s: PrefetchSourceLinesY = %f\n", __func__, p->PrefetchSourceLinesY);
-		dml2_printf("DML::%s: prefetch_swath_time_us = %f\n", __func__, *p->prefetch_swath_time_us);
+		DML_LOG_VERBOSE("DML::%s: TimeForFetchingVM = %f\n", __func__, s->TimeForFetchingVM);
+		DML_LOG_VERBOSE("DML::%s: TimeForFetchingRowInVBlank = %f\n", __func__, s->TimeForFetchingRowInVBlank);
+		DML_LOG_VERBOSE("DML::%s: LineTime = %f\n", __func__, s->LineTime);
+		DML_LOG_VERBOSE("DML::%s: dst_y_prefetch = %f\n", __func__, *p->dst_y_prefetch);
+		DML_LOG_VERBOSE("DML::%s: dst_y_per_vm_vblank = %f\n", __func__, *p->dst_y_per_vm_vblank);
+		DML_LOG_VERBOSE("DML::%s: dst_y_per_row_vblank = %f\n", __func__, *p->dst_y_per_row_vblank);
+		DML_LOG_VERBOSE("DML::%s: LinesToRequestPrefetchPixelData = %f\n", __func__, s->LinesToRequestPrefetchPixelData);
+		DML_LOG_VERBOSE("DML::%s: PrefetchSourceLinesY = %f\n", __func__, p->PrefetchSourceLinesY);
+		DML_LOG_VERBOSE("DML::%s: prefetch_swath_time_us = %f\n", __func__, *p->prefetch_swath_time_us);
 
-		dml2_printf("DML::%s: cursor_bytes_per_chunk = %d\n", __func__, p->cursor_bytes_per_chunk);
-		dml2_printf("DML::%s: cursor_bytes_per_line = %d\n", __func__, p->cursor_bytes_per_line);
-		dml2_printf("DML::%s: cursor_prefetch_bytes = %d\n", __func__, s->cursor_prefetch_bytes);
-		dml2_printf("DML::%s: prefetch_cursor_bw = %f\n", __func__, *p->prefetch_cursor_bw);
+		DML_LOG_VERBOSE("DML::%s: cursor_bytes_per_chunk = %d\n", __func__, p->cursor_bytes_per_chunk);
+		DML_LOG_VERBOSE("DML::%s: cursor_bytes_per_line = %d\n", __func__, p->cursor_bytes_per_line);
+		DML_LOG_VERBOSE("DML::%s: cursor_prefetch_bytes = %d\n", __func__, s->cursor_prefetch_bytes);
+		DML_LOG_VERBOSE("DML::%s: prefetch_cursor_bw = %f\n", __func__, *p->prefetch_cursor_bw);
 #endif
-		DML2_ASSERT(*p->dst_y_prefetch < 64);
+		DML_ASSERT(*p->dst_y_prefetch < 64);
 
 		unsigned int min_lsw_required = (unsigned int)math_max2(2, p->tdlut_drain_time / s->LineTime);
 		if (s->LinesToRequestPrefetchPixelData >= min_lsw_required && s->prefetch_bw_equ > 0) {
 			*p->VRatioPrefetchY = (double)p->PrefetchSourceLinesY / s->LinesToRequestPrefetchPixelData;
 			*p->VRatioPrefetchY = math_max2(*p->VRatioPrefetchY, 1.0);
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: VRatioPrefetchY = %f\n", __func__, *p->VRatioPrefetchY);
-			dml2_printf("DML::%s: SwathHeightY = %u\n", __func__, p->SwathHeightY);
-			dml2_printf("DML::%s: VInitPreFillY = %u\n", __func__, p->VInitPreFillY);
+			DML_LOG_VERBOSE("DML::%s: VRatioPrefetchY = %f\n", __func__, *p->VRatioPrefetchY);
+			DML_LOG_VERBOSE("DML::%s: SwathHeightY = %u\n", __func__, p->SwathHeightY);
+			DML_LOG_VERBOSE("DML::%s: VInitPreFillY = %u\n", __func__, p->VInitPreFillY);
 #endif
 			if ((p->SwathHeightY > 4) && (p->VInitPreFillY > 3)) {
 				if (s->LinesToRequestPrefetchPixelData > (p->VInitPreFillY - 3.0) / 2.0) {
@@ -5829,13 +5763,13 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 						(double)p->MaxNumSwathY * p->SwathHeightY / (s->LinesToRequestPrefetchPixelData - (p->VInitPreFillY - 3.0) / 2.0));
 				} else {
 					s->NoTimeToPrefetch = true;
-					dml2_printf("DML::%s: No time to prefetch!. LinesToRequestPrefetchPixelData=%f VinitPreFillY=%u\n", __func__, s->LinesToRequestPrefetchPixelData, p->VInitPreFillY);
+					DML_LOG_VERBOSE("DML::%s: No time to prefetch!. LinesToRequestPrefetchPixelData=%f VinitPreFillY=%u\n", __func__, s->LinesToRequestPrefetchPixelData, p->VInitPreFillY);
 					*p->VRatioPrefetchY = 0;
 				}
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: VRatioPrefetchY = %f\n", __func__, *p->VRatioPrefetchY);
-				dml2_printf("DML::%s: PrefetchSourceLinesY = %f\n", __func__, p->PrefetchSourceLinesY);
-				dml2_printf("DML::%s: MaxNumSwathY = %u\n", __func__, p->MaxNumSwathY);
+				DML_LOG_VERBOSE("DML::%s: VRatioPrefetchY = %f\n", __func__, *p->VRatioPrefetchY);
+				DML_LOG_VERBOSE("DML::%s: PrefetchSourceLinesY = %f\n", __func__, p->PrefetchSourceLinesY);
+				DML_LOG_VERBOSE("DML::%s: MaxNumSwathY = %u\n", __func__, p->MaxNumSwathY);
 #endif
 			}
 
@@ -5843,22 +5777,22 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			*p->VRatioPrefetchC = math_max2(*p->VRatioPrefetchC, 1.0);
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: VRatioPrefetchC = %f\n", __func__, *p->VRatioPrefetchC);
-			dml2_printf("DML::%s: SwathHeightC = %u\n", __func__, p->SwathHeightC);
-			dml2_printf("DML::%s: VInitPreFillC = %u\n", __func__, p->VInitPreFillC);
+			DML_LOG_VERBOSE("DML::%s: VRatioPrefetchC = %f\n", __func__, *p->VRatioPrefetchC);
+			DML_LOG_VERBOSE("DML::%s: SwathHeightC = %u\n", __func__, p->SwathHeightC);
+			DML_LOG_VERBOSE("DML::%s: VInitPreFillC = %u\n", __func__, p->VInitPreFillC);
 #endif
 			if ((p->SwathHeightC > 4) && (p->VInitPreFillC > 3)) {
 				if (s->LinesToRequestPrefetchPixelData > (p->VInitPreFillC - 3.0) / 2.0) {
 					*p->VRatioPrefetchC = math_max2(*p->VRatioPrefetchC, (double)p->MaxNumSwathC * p->SwathHeightC / (s->LinesToRequestPrefetchPixelData - (p->VInitPreFillC - 3.0) / 2.0));
 				} else {
 					s->NoTimeToPrefetch = true;
-					dml2_printf("DML::%s: No time to prefetch!. LinesToRequestPrefetchPixelData=%f VInitPreFillC=%u\n", __func__, s->LinesToRequestPrefetchPixelData, p->VInitPreFillC);
+					DML_LOG_VERBOSE("DML::%s: No time to prefetch!. LinesToRequestPrefetchPixelData=%f VInitPreFillC=%u\n", __func__, s->LinesToRequestPrefetchPixelData, p->VInitPreFillC);
 					*p->VRatioPrefetchC = 0;
 				}
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: VRatioPrefetchC = %f\n", __func__, *p->VRatioPrefetchC);
-				dml2_printf("DML::%s: PrefetchSourceLinesC = %f\n", __func__, p->PrefetchSourceLinesC);
-				dml2_printf("DML::%s: MaxNumSwathC = %u\n", __func__, p->MaxNumSwathC);
+				DML_LOG_VERBOSE("DML::%s: VRatioPrefetchC = %f\n", __func__, *p->VRatioPrefetchC);
+				DML_LOG_VERBOSE("DML::%s: PrefetchSourceLinesC = %f\n", __func__, p->PrefetchSourceLinesC);
+				DML_LOG_VERBOSE("DML::%s: MaxNumSwathC = %u\n", __func__, p->MaxNumSwathC);
 #endif
 			}
 
@@ -5866,36 +5800,34 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			*p->RequiredPrefetchPixelDataBWChroma = (double)p->PrefetchSourceLinesC / s->LinesToRequestPrefetchPixelData * p->myPipe->BytePerPixelC * p->swath_width_chroma_ub / s->LineTime;
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: BytePerPixelY = %u\n", __func__, p->myPipe->BytePerPixelY);
-			dml2_printf("DML::%s: swath_width_luma_ub = %u\n", __func__, p->swath_width_luma_ub);
-			dml2_printf("DML::%s: LineTime = %f\n", __func__, s->LineTime);
-			dml2_printf("DML::%s: RequiredPrefetchPixelDataBWLuma = %f\n", __func__, *p->RequiredPrefetchPixelDataBWLuma);
-			dml2_printf("DML::%s: RequiredPrefetchPixelDataBWChroma = %f\n", __func__, *p->RequiredPrefetchPixelDataBWChroma);
+			DML_LOG_VERBOSE("DML::%s: BytePerPixelY = %u\n", __func__, p->myPipe->BytePerPixelY);
+			DML_LOG_VERBOSE("DML::%s: swath_width_luma_ub = %u\n", __func__, p->swath_width_luma_ub);
+			DML_LOG_VERBOSE("DML::%s: LineTime = %f\n", __func__, s->LineTime);
+			DML_LOG_VERBOSE("DML::%s: RequiredPrefetchPixelDataBWLuma = %f\n", __func__, *p->RequiredPrefetchPixelDataBWLuma);
+			DML_LOG_VERBOSE("DML::%s: RequiredPrefetchPixelDataBWChroma = %f\n", __func__, *p->RequiredPrefetchPixelDataBWChroma);
 #endif
 		} else {
 			s->NoTimeToPrefetch = true;
-			dml2_printf("DML::%s: No time to prefetch!, LinesToRequestPrefetchPixelData: %f, should be >= %d\n", __func__, s->LinesToRequestPrefetchPixelData, min_lsw_required);
-			dml2_printf("DML::%s: No time to prefetch!, prefetch_bw_equ: %f, should be > 0\n", __func__, s->prefetch_bw_equ);
+			DML_LOG_VERBOSE("DML::%s: No time to prefetch!, LinesToRequestPrefetchPixelData: %f, should be >= %d\n", __func__, s->LinesToRequestPrefetchPixelData, min_lsw_required);
+			DML_LOG_VERBOSE("DML::%s: No time to prefetch!, prefetch_bw_equ: %f, should be > 0\n", __func__, s->prefetch_bw_equ);
 			*p->VRatioPrefetchY = 0;
 			*p->VRatioPrefetchC = 0;
 			*p->RequiredPrefetchPixelDataBWLuma = 0;
 			*p->RequiredPrefetchPixelDataBWChroma = 0;
 		}
-		dml2_printf("DML: Tpre: %fus - sum of time to request 2 x data pte, swaths\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime + 2.0 * s->TimeForFetchingRowInVBlank + s->TimeForFetchingVM);
-		dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
-		dml2_printf("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
-		dml2_printf("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
-		dml2_printf("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
-		dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
-		dml2_printf("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
-		dml2_printf("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
+		DML_LOG_VERBOSE("DML: Tpre: %fus - sum of time to request 2 x data pte, swaths\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime + 2.0 * s->TimeForFetchingRowInVBlank + s->TimeForFetchingVM);
+		DML_LOG_VERBOSE("DML: Tvm: %fus - time to fetch vm\n", s->TimeForFetchingVM);
+		DML_LOG_VERBOSE("DML: Tr0: %fus - time to fetch first row of data pagetables\n", s->TimeForFetchingRowInVBlank);
+		DML_LOG_VERBOSE("DML: Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)s->LinesToRequestPrefetchPixelData * s->LineTime);
+		DML_LOG_VERBOSE("DML: To: %fus - time for propagation from scaler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime);
+		DML_LOG_VERBOSE("DML: Tvstartup - TSetup - Tcalc - TWait - Tpre - To > 0\n");
+		DML_LOG_VERBOSE("DML: Tslack(pre): %fus - time left over in schedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeForFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->TSetup);
+		DML_LOG_VERBOSE("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %u\n", p->PixelPTEBytesPerRow);
 
 	} else {
-		dml2_printf("DML::%s: No time to prefetch! dst_y_prefetch_equ = %f (should be > 1)\n", __func__, s->dst_y_prefetch_equ);
-		dml2_printf("DML::%s: No time to prefetch! min_Lsw_equ_ok = %d, Tpre_rounded (%f) should be >= Tvm_trips_rounded (%f) + 2.0*Tr0_trips_rounded (%f) + min_Tsw_equ (%f)\n",
+		DML_LOG_VERBOSE("DML::%s: No time to prefetch! dst_y_prefetch_equ = %f (should be > 1)\n", __func__, s->dst_y_prefetch_equ);
+		DML_LOG_VERBOSE("DML::%s: No time to prefetch! min_Lsw_equ_ok = %d, Tpre_rounded (%f) should be >= Tvm_trips_rounded (%f) + 2.0*Tr0_trips_rounded (%f) + min_Tsw_equ (%f)\n",
 				__func__, min_Lsw_equ_ok, *p->Tpre_rounded, s->Tvm_trips_rounded, 2.0*s->Tr0_trips_rounded, s->min_Lsw_equ*s->LineTime);
-		dml2_printf("DML::%s: No time to prefetch! min_Lsw_equ_ok = %d, Tpre_rounded+Tvm_trips_rounded+2.0*Tr0_trips_rounded+min_Tsw_equ (%f) should be > \n",
-				__func__, tpre_gt_req_latency, (s->min_Lsw_equ*s->LineTime + s->Tvm_trips_rounded + 2.0*s->Tr0_trips_rounded), p->Turg, s->trip_to_mem, p->ExtraLatencyPrefetch);
 		s->NoTimeToPrefetch = true;
 		s->TimeForFetchingVM = 0;
 		s->TimeForFetchingRowInVBlank = 0;
@@ -5916,18 +5848,18 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			prefetch_vm_bw = 0;
 		} else if (*p->dst_y_per_vm_vblank > 0) {
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, p->HostVMInefficiencyFactor);
-			dml2_printf("DML::%s: dst_y_per_vm_vblank = %f\n", __func__, *p->dst_y_per_vm_vblank);
-			dml2_printf("DML::%s: LineTime = %f\n", __func__, s->LineTime);
+			DML_LOG_VERBOSE("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, p->HostVMInefficiencyFactor);
+			DML_LOG_VERBOSE("DML::%s: dst_y_per_vm_vblank = %f\n", __func__, *p->dst_y_per_vm_vblank);
+			DML_LOG_VERBOSE("DML::%s: LineTime = %f\n", __func__, s->LineTime);
 #endif
 			prefetch_vm_bw = vm_bytes * p->HostVMInefficiencyFactor / (*p->dst_y_per_vm_vblank * s->LineTime);
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: prefetch_vm_bw = %f\n", __func__, prefetch_vm_bw);
+			DML_LOG_VERBOSE("DML::%s: prefetch_vm_bw = %f\n", __func__, prefetch_vm_bw);
 #endif
 		} else {
 			prefetch_vm_bw = 0;
 			s->NoTimeToPrefetch = true;
-			dml2_printf("DML::%s: No time to prefetch!. dst_y_per_vm_vblank=%f (should be > 0)\n", __func__, *p->dst_y_per_vm_vblank);
+			DML_LOG_VERBOSE("DML::%s: No time to prefetch!. dst_y_per_vm_vblank=%f (should be > 0)\n", __func__, *p->dst_y_per_vm_vblank);
 		}
 
 		if (p->PixelPTEBytesPerRow == 0 && tdlut_row_bytes == 0) {
@@ -5936,14 +5868,14 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 			prefetch_row_bw = (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + tdlut_row_bytes) / (*p->dst_y_per_row_vblank * s->LineTime);
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, p->PixelPTEBytesPerRow);
-			dml2_printf("DML::%s: dst_y_per_row_vblank = %f\n", __func__, *p->dst_y_per_row_vblank);
-			dml2_printf("DML::%s: prefetch_row_bw = %f\n", __func__, prefetch_row_bw);
+			DML_LOG_VERBOSE("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, p->PixelPTEBytesPerRow);
+			DML_LOG_VERBOSE("DML::%s: dst_y_per_row_vblank = %f\n", __func__, *p->dst_y_per_row_vblank);
+			DML_LOG_VERBOSE("DML::%s: prefetch_row_bw = %f\n", __func__, prefetch_row_bw);
 #endif
 		} else {
 			prefetch_row_bw = 0;
 			s->NoTimeToPrefetch = true;
-			dml2_printf("DML::%s: No time to prefetch!. dst_y_per_row_vblank=%f (should be > 0)\n", __func__, *p->dst_y_per_row_vblank);
+			DML_LOG_VERBOSE("DML::%s: No time to prefetch!. dst_y_per_row_vblank=%f (should be > 0)\n", __func__, *p->dst_y_per_row_vblank);
 		}
 
 		*p->prefetch_vmrow_bw = math_max2(prefetch_vm_bw, prefetch_row_bw);
@@ -5963,12 +5895,12 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		*p->prefetch_vmrow_bw = 0;
 	}
 
-	dml2_printf("DML::%s: dst_y_per_vm_vblank = %f (final)\n", __func__, *p->dst_y_per_vm_vblank);
-	dml2_printf("DML::%s: dst_y_per_row_vblank = %f (final)\n", __func__, *p->dst_y_per_row_vblank);
-	dml2_printf("DML::%s: prefetch_vmrow_bw = %f (final)\n", __func__, *p->prefetch_vmrow_bw);
-	dml2_printf("DML::%s: RequiredPrefetchPixelDataBWLuma = %f (final)\n", __func__, *p->RequiredPrefetchPixelDataBWLuma);
-	dml2_printf("DML::%s: RequiredPrefetchPixelDataBWChroma = %f (final)\n", __func__, *p->RequiredPrefetchPixelDataBWChroma);
-	dml2_printf("DML::%s: NoTimeToPrefetch=%d\n", __func__, s->NoTimeToPrefetch);
+	DML_LOG_VERBOSE("DML::%s: dst_y_per_vm_vblank = %f (final)\n", __func__, *p->dst_y_per_vm_vblank);
+	DML_LOG_VERBOSE("DML::%s: dst_y_per_row_vblank = %f (final)\n", __func__, *p->dst_y_per_row_vblank);
+	DML_LOG_VERBOSE("DML::%s: prefetch_vmrow_bw = %f (final)\n", __func__, *p->prefetch_vmrow_bw);
+	DML_LOG_VERBOSE("DML::%s: RequiredPrefetchPixelDataBWLuma = %f (final)\n", __func__, *p->RequiredPrefetchPixelDataBWLuma);
+	DML_LOG_VERBOSE("DML::%s: RequiredPrefetchPixelDataBWChroma = %f (final)\n", __func__, *p->RequiredPrefetchPixelDataBWChroma);
+	DML_LOG_VERBOSE("DML::%s: NoTimeToPrefetch=%d\n", __func__, s->NoTimeToPrefetch);
 
 	return s->NoTimeToPrefetch;
 }
@@ -6005,7 +5937,7 @@ static unsigned int find_max_impact_plane(unsigned int this_plane_idx, unsigned
 		}
 	}
 	if (max_idx <= 0) {
-		DML2_ASSERT(max_idx >= 0);
+		DML_ASSERT(max_idx >= 0);
 		max_idx = this_plane_idx;
 	}
 
@@ -6037,12 +5969,12 @@ static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct dml2_core
 	// worst case if the rob and cdb is fully hogged
 	s->max_Trpd_dcfclk_cycles = (unsigned int) math_ceil2((p->rob_buffer_size_kbytes*1024 + p->compressed_buffer_size_kbytes*DML_MAX_COMPRESSION_RATIO*1024)/64.0, 1.0);
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: num_active_planes = %d\n", __func__, p->num_active_planes);
-	dml2_printf("DML::%s: rob_buffer_size_kbytes = %d\n", __func__, p->rob_buffer_size_kbytes);
-	dml2_printf("DML::%s: compressed_buffer_size_kbytes = %d\n", __func__, p->compressed_buffer_size_kbytes);
-	dml2_printf("DML::%s: estimated_urg_bandwidth_required_mbps = %f\n", __func__, p->estimated_urg_bandwidth_required_mbps);
-	dml2_printf("DML::%s: estimated_dcfclk_mhz = %f\n", __func__, p->estimated_dcfclk_mhz);
-	dml2_printf("DML::%s: max_Trpd_dcfclk_cycles = %u\n", __func__, s->max_Trpd_dcfclk_cycles);
+	DML_LOG_VERBOSE("DML::%s: num_active_planes = %d\n", __func__, p->num_active_planes);
+	DML_LOG_VERBOSE("DML::%s: rob_buffer_size_kbytes = %d\n", __func__, p->rob_buffer_size_kbytes);
+	DML_LOG_VERBOSE("DML::%s: compressed_buffer_size_kbytes = %d\n", __func__, p->compressed_buffer_size_kbytes);
+	DML_LOG_VERBOSE("DML::%s: estimated_urg_bandwidth_required_mbps = %f\n", __func__, p->estimated_urg_bandwidth_required_mbps);
+	DML_LOG_VERBOSE("DML::%s: estimated_dcfclk_mhz = %f\n", __func__, p->estimated_dcfclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: max_Trpd_dcfclk_cycles = %u\n", __func__, s->max_Trpd_dcfclk_cycles);
 #endif
 
 	// calculate the return impact from each plane, request is 256B per dcfclk
@@ -6063,12 +5995,12 @@ static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct dml2_core
 		s->burst_bytes_to_fill_det += (unsigned int) (math_floor2(p->lb_source_lines_l[i] / p->swath_height_l[i], 1) * s->src_swath_bytes_l[i]);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: i=%u pixel_format = %d\n", __func__, i, p->pixel_format[i]);
-		dml2_printf("DML::%s: i=%u chunk_bytes_l = %d\n", __func__, i, p->chunk_bytes_l);
-		dml2_printf("DML::%s: i=%u lb_source_lines_l = %d\n", __func__, i, p->lb_source_lines_l[i]);
-		dml2_printf("DML::%s: i=%u src_detile_buf_size_bytes_l=%d\n", __func__, i, s->src_detile_buf_size_bytes_l[i]);
-		dml2_printf("DML::%s: i=%u src_swath_bytes_l=%d\n", __func__, i, s->src_swath_bytes_l[i]);
-		dml2_printf("DML::%s: i=%u burst_bytes_to_fill_det=%d (luma)\n", __func__, i, s->burst_bytes_to_fill_det);
+		DML_LOG_VERBOSE("DML::%s: i=%u pixel_format = %d\n", __func__, i, p->pixel_format[i]);
+		DML_LOG_VERBOSE("DML::%s: i=%u chunk_bytes_l = %d\n", __func__, i, p->chunk_bytes_l);
+		DML_LOG_VERBOSE("DML::%s: i=%u lb_source_lines_l = %d\n", __func__, i, p->lb_source_lines_l[i]);
+		DML_LOG_VERBOSE("DML::%s: i=%u src_detile_buf_size_bytes_l=%d\n", __func__, i, s->src_detile_buf_size_bytes_l[i]);
+		DML_LOG_VERBOSE("DML::%s: i=%u src_swath_bytes_l=%d\n", __func__, i, s->src_swath_bytes_l[i]);
+		DML_LOG_VERBOSE("DML::%s: i=%u burst_bytes_to_fill_det=%d (luma)\n", __func__, i, s->burst_bytes_to_fill_det);
 #endif
 
 		if (s->src_swath_bytes_c[i] > 0) { // dual_plane
@@ -6079,10 +6011,10 @@ static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct dml2_core
 			}
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: i=%u chunk_bytes_c = %d\n", __func__, i, p->chunk_bytes_c);
-			dml2_printf("DML::%s: i=%u lb_source_lines_c = %d\n", __func__, i, p->lb_source_lines_c[i]);
-			dml2_printf("DML::%s: i=%u src_detile_buf_size_bytes_c=%d\n", __func__, i, s->src_detile_buf_size_bytes_c[i]);
-			dml2_printf("DML::%s: i=%u src_swath_bytes_c=%d\n", __func__, i, s->src_swath_bytes_c[i]);
+			DML_LOG_VERBOSE("DML::%s: i=%u chunk_bytes_c = %d\n", __func__, i, p->chunk_bytes_c);
+			DML_LOG_VERBOSE("DML::%s: i=%u lb_source_lines_c = %d\n", __func__, i, p->lb_source_lines_c[i]);
+			DML_LOG_VERBOSE("DML::%s: i=%u src_detile_buf_size_bytes_c=%d\n", __func__, i, s->src_detile_buf_size_bytes_c[i]);
+			DML_LOG_VERBOSE("DML::%s: i=%u src_swath_bytes_c=%d\n", __func__, i, s->src_swath_bytes_c[i]);
 #endif
 		}
 
@@ -6090,9 +6022,9 @@ static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct dml2_core
 		s->accumulated_return_path_dcfclk_cycles[i] = (unsigned int) math_ceil2(((DML_MAX_COMPRESSION_RATIO-1) * 64 * p->estimated_dcfclk_mhz) * s->time_to_fill_det_us / 64.0, 1.0); //for 64B per DCFClk
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: i=%u burst_bytes_to_fill_det=%d\n", __func__, i, s->burst_bytes_to_fill_det);
-		dml2_printf("DML::%s: i=%u time_to_fill_det_us=%f\n", __func__, i, s->time_to_fill_det_us);
-		dml2_printf("DML::%s: i=%u accumulated_return_path_dcfclk_cycles=%u\n", __func__, i, s->accumulated_return_path_dcfclk_cycles[i]);
+		DML_LOG_VERBOSE("DML::%s: i=%u burst_bytes_to_fill_det=%d\n", __func__, i, s->burst_bytes_to_fill_det);
+		DML_LOG_VERBOSE("DML::%s: i=%u time_to_fill_det_us=%f\n", __func__, i, s->time_to_fill_det_us);
+		DML_LOG_VERBOSE("DML::%s: i=%u accumulated_return_path_dcfclk_cycles=%u\n", __func__, i, s->accumulated_return_path_dcfclk_cycles[i]);
 #endif
 		// clamping to worst case delay which is one which occupy the full rob+cdb
 		if (s->accumulated_return_path_dcfclk_cycles[i] > s->max_Trpd_dcfclk_cycles)
@@ -6109,7 +6041,7 @@ static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct dml2_core
 		p->impacted_dst_y_pre[i] = math_ceil2(p->impacted_dst_y_pre[i] / p->line_time[i], 0.25);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: i=%u impacted_Tpre=%f (k=%u)\n", __func__, i, p->impacted_dst_y_pre[i], k);
+		DML_LOG_VERBOSE("DML::%s: i=%u impacted_Tpre=%f (k=%u)\n", __func__, i, p->impacted_dst_y_pre[i], k);
 #endif
 	}
 
@@ -6120,8 +6052,8 @@ static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct dml2_core
 				*p->recalc_prefetch_schedule = 1;
 			}
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: i=%u Tpre_rounded=%f\n", __func__, i, p->Tpre_rounded[i]);
-			dml2_printf("DML::%s: i=%u Tpre_oto=%f\n", __func__, i, p->Tpre_oto[i]);
+			DML_LOG_VERBOSE("DML::%s: i=%u Tpre_rounded=%f\n", __func__, i, p->Tpre_rounded[i]);
+			DML_LOG_VERBOSE("DML::%s: i=%u Tpre_oto=%f\n", __func__, i, p->Tpre_oto[i]);
 #endif
 		}
 	} else {
@@ -6131,8 +6063,8 @@ static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct dml2_core
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: prefetch_global_check_passed=%u\n", __func__, s->prefetch_global_check_passed);
-	dml2_printf("DML::%s: recalc_prefetch_schedule=%u\n", __func__, *p->recalc_prefetch_schedule);
+	DML_LOG_VERBOSE("DML::%s: prefetch_global_check_passed=%u\n", __func__, s->prefetch_global_check_passed);
+	DML_LOG_VERBOSE("DML::%s: recalc_prefetch_schedule=%u\n", __func__, *p->recalc_prefetch_schedule);
 #endif
 
 	return s->prefetch_global_check_passed;
@@ -6150,8 +6082,8 @@ static void calculate_peak_bandwidth_required(
 	memset(l, 0, sizeof(struct dml2_core_shared_calculate_peak_bandwidth_required_locals));
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: inc_flip_bw = %d\n", __func__, p->inc_flip_bw);
-	dml2_printf("DML::%s: NumberOfActiveSurfaces = %d\n", __func__, p->num_active_planes);
+	DML_LOG_VERBOSE("DML::%s: inc_flip_bw = %d\n", __func__, p->inc_flip_bw);
+	DML_LOG_VERBOSE("DML::%s: NumberOfActiveSurfaces = %d\n", __func__, p->num_active_planes);
 #endif
 
 	for (unsigned int k = 0; k < p->num_active_planes; ++k) {
@@ -6347,12 +6279,12 @@ static void calculate_peak_bandwidth_required(
 				p->surface_peak_required_bw[m][n]);
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: urg_vactive_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_vactive_bandwidth_required[m][n]);
-			dml2_printf("DML::%s: urg_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_bandwidth_required[m][n]);
-			dml2_printf("DML::%s: urg_bandwidth_required_qual[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_bandwidth_required[m][n]);
-			dml2_printf("DML::%s: non_urg_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->non_urg_bandwidth_required[m][n]);
+			DML_LOG_VERBOSE("DML::%s: urg_vactive_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_vactive_bandwidth_required[m][n]);
+			DML_LOG_VERBOSE("DML::%s: urg_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_bandwidth_required[m][n]);
+			DML_LOG_VERBOSE("DML::%s: urg_bandwidth_required_qual[%s][%s]=%f\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->urg_bandwidth_required[m][n]);
+			DML_LOG_VERBOSE("DML::%s: non_urg_bandwidth_required%s[%s][%s]=%f\n", __func__, (p->inc_flip_bw ? "_flip" : ""), dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n), p->non_urg_bandwidth_required[m][n]);
 #endif
-			DML2_ASSERT(p->urg_bandwidth_required[m][n] >= p->non_urg_bandwidth_required[m][n]);
+			DML_ASSERT(p->urg_bandwidth_required[m][n] >= p->non_urg_bandwidth_required[m][n]);
 		}
 	}
 }
@@ -6414,18 +6346,18 @@ static void check_urgent_bandwidth_support(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: frac_urg_bandwidth_nom_sdp = %f\n", __func__, frac_urg_bandwidth_nom_sdp);
-	dml2_printf("DML::%s: frac_urg_bandwidth_nom_dram = %f\n", __func__, frac_urg_bandwidth_nom_dram);
-	dml2_printf("DML::%s: frac_urg_bandwidth_nom = %f\n", __func__, *frac_urg_bandwidth_nom);
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bandwidth_nom_sdp = %f\n", __func__, frac_urg_bandwidth_nom_sdp);
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bandwidth_nom_dram = %f\n", __func__, frac_urg_bandwidth_nom_dram);
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bandwidth_nom = %f\n", __func__, *frac_urg_bandwidth_nom);
 
-	dml2_printf("DML::%s: frac_urg_bandwidth_mall_sdp = %f\n", __func__, frac_urg_bandwidth_mall_sdp);
-	dml2_printf("DML::%s: frac_urg_bandwidth_mall_dram = %f\n", __func__, frac_urg_bandwidth_mall_dram);
-	dml2_printf("DML::%s: frac_urg_bandwidth_mall = %f\n", __func__, *frac_urg_bandwidth_mall);
-	dml2_printf("DML::%s: bandwidth_support_ok = %d\n", __func__, *bandwidth_support_ok);
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bandwidth_mall_sdp = %f\n", __func__, frac_urg_bandwidth_mall_sdp);
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bandwidth_mall_dram = %f\n", __func__, frac_urg_bandwidth_mall_dram);
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bandwidth_mall = %f\n", __func__, *frac_urg_bandwidth_mall);
+	DML_LOG_VERBOSE("DML::%s: bandwidth_support_ok = %d\n", __func__, *bandwidth_support_ok);
 
 	for (unsigned int m = 0; m < dml2_core_internal_soc_state_max; m++) {
 		for (unsigned int n = 0; n < dml2_core_internal_bw_max; n++) {
-			dml2_printf("DML::%s: state:%s bw_type:%s urg_bandwidth_available=%f %s urg_bandwidth_required=%f\n",
+			DML_LOG_VERBOSE("DML::%s: state:%s bw_type:%s urg_bandwidth_available=%f %s urg_bandwidth_required=%f\n",
 			__func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n),
 			urg_bandwidth_available[m][n], (urg_bandwidth_available[m][n] < urg_bandwidth_required[m][n]) ? "<" : ">=", urg_bandwidth_required[m][n]);
 		}
@@ -6446,14 +6378,14 @@ static double get_bandwidth_available_for_immediate_flip(enum dml2_core_internal
 	flip_bw_available_mbps = flip_bw_available_sdp_mbps < flip_bw_available_dram_mbps ? flip_bw_available_sdp_mbps : flip_bw_available_dram_mbps;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: eval_state = %s\n", __func__, dml2_core_internal_soc_state_type_str(eval_state));
-	dml2_printf("DML::%s: urg_bandwidth_available_sdp_mbps = %f\n", __func__, urg_bandwidth_available[eval_state][dml2_core_internal_bw_sdp]);
-	dml2_printf("DML::%s: urg_bandwidth_available_dram_mbps = %f\n", __func__, urg_bandwidth_available[eval_state][dml2_core_internal_bw_dram]);
-	dml2_printf("DML::%s: urg_bandwidth_required_sdp_mbps = %f\n", __func__, urg_bandwidth_required[eval_state][dml2_core_internal_bw_sdp]);
-	dml2_printf("DML::%s: urg_bandwidth_required_dram_mbps = %f\n", __func__, urg_bandwidth_required[eval_state][dml2_core_internal_bw_dram]);
-	dml2_printf("DML::%s: flip_bw_available_sdp_mbps = %f\n", __func__, flip_bw_available_sdp_mbps);
-	dml2_printf("DML::%s: flip_bw_available_dram_mbps = %f\n", __func__, flip_bw_available_dram_mbps);
-	dml2_printf("DML::%s: flip_bw_available_mbps = %f\n", __func__, flip_bw_available_mbps);
+	DML_LOG_VERBOSE("DML::%s: eval_state = %s\n", __func__, dml2_core_internal_soc_state_type_str(eval_state));
+	DML_LOG_VERBOSE("DML::%s: urg_bandwidth_available_sdp_mbps = %f\n", __func__, urg_bandwidth_available[eval_state][dml2_core_internal_bw_sdp]);
+	DML_LOG_VERBOSE("DML::%s: urg_bandwidth_available_dram_mbps = %f\n", __func__, urg_bandwidth_available[eval_state][dml2_core_internal_bw_dram]);
+	DML_LOG_VERBOSE("DML::%s: urg_bandwidth_required_sdp_mbps = %f\n", __func__, urg_bandwidth_required[eval_state][dml2_core_internal_bw_sdp]);
+	DML_LOG_VERBOSE("DML::%s: urg_bandwidth_required_dram_mbps = %f\n", __func__, urg_bandwidth_required[eval_state][dml2_core_internal_bw_dram]);
+	DML_LOG_VERBOSE("DML::%s: flip_bw_available_sdp_mbps = %f\n", __func__, flip_bw_available_sdp_mbps);
+	DML_LOG_VERBOSE("DML::%s: flip_bw_available_dram_mbps = %f\n", __func__, flip_bw_available_dram_mbps);
+	DML_LOG_VERBOSE("DML::%s: flip_bw_available_mbps = %f\n", __func__, flip_bw_available_mbps);
 #endif
 
 	return flip_bw_available_mbps;
@@ -6478,28 +6410,28 @@ static void calculate_immediate_flip_bandwidth_support(
 		*flip_bandwidth_support_ok &= urg_bandwidth_available[eval_state][n] >= urg_bandwidth_required_flip[eval_state][n];
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: n = %s\n", __func__, dml2_core_internal_bw_type_str(n));
-		dml2_printf("DML::%s: urg_bandwidth_available = %f\n", __func__, urg_bandwidth_available[eval_state][n]);
-		dml2_printf("DML::%s: non_urg_bandwidth_required_flip = %f\n", __func__, non_urg_bandwidth_required_flip[eval_state][n]);
-		dml2_printf("DML::%s: urg_bandwidth_required_flip = %f\n", __func__, urg_bandwidth_required_flip[eval_state][n]);
-		dml2_printf("DML::%s: flip_bandwidth_support_ok = %d\n", __func__, *flip_bandwidth_support_ok);
+		DML_LOG_VERBOSE("DML::%s: n = %s\n", __func__, dml2_core_internal_bw_type_str(n));
+		DML_LOG_VERBOSE("DML::%s: urg_bandwidth_available = %f\n", __func__, urg_bandwidth_available[eval_state][n]);
+		DML_LOG_VERBOSE("DML::%s: non_urg_bandwidth_required_flip = %f\n", __func__, non_urg_bandwidth_required_flip[eval_state][n]);
+		DML_LOG_VERBOSE("DML::%s: urg_bandwidth_required_flip = %f\n", __func__, urg_bandwidth_required_flip[eval_state][n]);
+		DML_LOG_VERBOSE("DML::%s: flip_bandwidth_support_ok = %d\n", __func__, *flip_bandwidth_support_ok);
 #endif
-		DML2_ASSERT(urg_bandwidth_required_flip[eval_state][n] >= non_urg_bandwidth_required_flip[eval_state][n]);
+		DML_ASSERT(urg_bandwidth_required_flip[eval_state][n] >= non_urg_bandwidth_required_flip[eval_state][n]);
 	}
 
 	*frac_urg_bandwidth_flip = (frac_urg_bw_flip_sdp > frac_urg_bw_flip_dram) ? frac_urg_bw_flip_sdp : frac_urg_bw_flip_dram;
 	*flip_bandwidth_support_ok &= (*frac_urg_bandwidth_flip <= 1.0);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: eval_state = %s\n", __func__, dml2_core_internal_soc_state_type_str(eval_state));
-	dml2_printf("DML::%s: frac_urg_bw_flip_sdp = %f\n", __func__, frac_urg_bw_flip_sdp);
-	dml2_printf("DML::%s: frac_urg_bw_flip_dram = %f\n", __func__, frac_urg_bw_flip_dram);
-	dml2_printf("DML::%s: frac_urg_bandwidth_flip = %f\n", __func__, *frac_urg_bandwidth_flip);
-	dml2_printf("DML::%s: flip_bandwidth_support_ok = %d\n", __func__, *flip_bandwidth_support_ok);
+	DML_LOG_VERBOSE("DML::%s: eval_state = %s\n", __func__, dml2_core_internal_soc_state_type_str(eval_state));
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bw_flip_sdp = %f\n", __func__, frac_urg_bw_flip_sdp);
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bw_flip_dram = %f\n", __func__, frac_urg_bw_flip_dram);
+	DML_LOG_VERBOSE("DML::%s: frac_urg_bandwidth_flip = %f\n", __func__, *frac_urg_bandwidth_flip);
+	DML_LOG_VERBOSE("DML::%s: flip_bandwidth_support_ok = %d\n", __func__, *flip_bandwidth_support_ok);
 
 	for (unsigned int m = 0; m < dml2_core_internal_soc_state_max; m++) {
 		for (unsigned int n = 0; n < dml2_core_internal_bw_max; n++) {
-			dml2_printf("DML::%s: state:%s bw_type:%s, urg_bandwidth_available=%f %s urg_bandwidth_required=%f\n",
+			DML_LOG_VERBOSE("DML::%s: state:%s bw_type:%s, urg_bandwidth_available=%f %s urg_bandwidth_required=%f\n",
 			__func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n),
 			urg_bandwidth_available[m][n], (urg_bandwidth_available[m][n] < urg_bandwidth_required_flip[m][n]) ? "<" : ">=", urg_bandwidth_required_flip[m][n]);
 		}
@@ -6549,27 +6481,27 @@ static void CalculateFlipSchedule(
 	l->dpte_row_bytes = DPTEBytesPerRow;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: GPUVMEnable = %u\n", __func__, GPUVMEnable);
-	dml2_printf("DML::%s: ip.max_flip_time_us = %d\n", __func__, max_flip_time_us);
-	dml2_printf("DML::%s: ip.max_flip_time_lines = %d\n", __func__, max_flip_time_lines);
-	dml2_printf("DML::%s: BandwidthAvailableForImmediateFlip = %f\n", __func__, BandwidthAvailableForImmediateFlip);
-	dml2_printf("DML::%s: TotImmediateFlipBytes = %u\n", __func__, TotImmediateFlipBytes);
-	dml2_printf("DML::%s: use_lb_flip_bw = %u\n", __func__, use_lb_flip_bw);
-	dml2_printf("DML::%s: iflip_enable = %u\n", __func__, iflip_enable);
-	dml2_printf("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, HostVMInefficiencyFactor);
-	dml2_printf("DML::%s: LineTime = %f\n", __func__, LineTime);
-	dml2_printf("DML::%s: Tno_bw_flip = %f\n", __func__, Tno_bw_flip);
-	dml2_printf("DML::%s: Tvm_trips_flip = %f\n", __func__, Tvm_trips_flip);
-	dml2_printf("DML::%s: Tr0_trips_flip = %f\n", __func__, Tr0_trips_flip);
-	dml2_printf("DML::%s: Tvm_trips_flip_rounded = %f\n", __func__, Tvm_trips_flip_rounded);
-	dml2_printf("DML::%s: Tr0_trips_flip_rounded = %f\n", __func__, Tr0_trips_flip_rounded);
-	dml2_printf("DML::%s: vm_bytes = %f\n", __func__, vm_bytes);
-	dml2_printf("DML::%s: DPTEBytesPerRow = %f\n", __func__, DPTEBytesPerRow);
-	dml2_printf("DML::%s: meta_row_bytes = %d\n", __func__, meta_row_bytes);
-	dml2_printf("DML::%s: dpte_row_bytes = %f\n", __func__, l->dpte_row_bytes);
-	dml2_printf("DML::%s: dpte_row_height = %d\n", __func__, dpte_row_height);
-	dml2_printf("DML::%s: meta_row_height = %d\n", __func__, meta_row_height);
-	dml2_printf("DML::%s: VRatio = %f\n", __func__, VRatio);
+	DML_LOG_VERBOSE("DML::%s: GPUVMEnable = %u\n", __func__, GPUVMEnable);
+	DML_LOG_VERBOSE("DML::%s: ip.max_flip_time_us = %d\n", __func__, max_flip_time_us);
+	DML_LOG_VERBOSE("DML::%s: ip.max_flip_time_lines = %d\n", __func__, max_flip_time_lines);
+	DML_LOG_VERBOSE("DML::%s: BandwidthAvailableForImmediateFlip = %f\n", __func__, BandwidthAvailableForImmediateFlip);
+	DML_LOG_VERBOSE("DML::%s: TotImmediateFlipBytes = %u\n", __func__, TotImmediateFlipBytes);
+	DML_LOG_VERBOSE("DML::%s: use_lb_flip_bw = %u\n", __func__, use_lb_flip_bw);
+	DML_LOG_VERBOSE("DML::%s: iflip_enable = %u\n", __func__, iflip_enable);
+	DML_LOG_VERBOSE("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, HostVMInefficiencyFactor);
+	DML_LOG_VERBOSE("DML::%s: LineTime = %f\n", __func__, LineTime);
+	DML_LOG_VERBOSE("DML::%s: Tno_bw_flip = %f\n", __func__, Tno_bw_flip);
+	DML_LOG_VERBOSE("DML::%s: Tvm_trips_flip = %f\n", __func__, Tvm_trips_flip);
+	DML_LOG_VERBOSE("DML::%s: Tr0_trips_flip = %f\n", __func__, Tr0_trips_flip);
+	DML_LOG_VERBOSE("DML::%s: Tvm_trips_flip_rounded = %f\n", __func__, Tvm_trips_flip_rounded);
+	DML_LOG_VERBOSE("DML::%s: Tr0_trips_flip_rounded = %f\n", __func__, Tr0_trips_flip_rounded);
+	DML_LOG_VERBOSE("DML::%s: vm_bytes = %f\n", __func__, vm_bytes);
+	DML_LOG_VERBOSE("DML::%s: DPTEBytesPerRow = %f\n", __func__, DPTEBytesPerRow);
+	DML_LOG_VERBOSE("DML::%s: meta_row_bytes = %d\n", __func__, meta_row_bytes);
+	DML_LOG_VERBOSE("DML::%s: dpte_row_bytes = %f\n", __func__, l->dpte_row_bytes);
+	DML_LOG_VERBOSE("DML::%s: dpte_row_height = %d\n", __func__, dpte_row_height);
+	DML_LOG_VERBOSE("DML::%s: meta_row_height = %d\n", __func__, meta_row_height);
+	DML_LOG_VERBOSE("DML::%s: VRatio = %f\n", __func__, VRatio);
 #endif
 
 	if (TotImmediateFlipBytes > 0 && (GPUVMEnable || dcc_mrq_enable)) {
@@ -6596,9 +6528,9 @@ static void CalculateFlipSchedule(
 			l->min_row_time = l->min_row_height * LineTime / VRatio;
 		}
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: min_row_time = %f\n", __func__, l->min_row_time);
+		DML_LOG_VERBOSE("DML::%s: min_row_time = %f\n", __func__, l->min_row_time);
 #endif
-		DML2_ASSERT(l->min_row_time > 0);
+		DML_ASSERT(l->min_row_time > 0);
 
 		if (use_lb_flip_bw) {
 			// For mode check, calculation the flip bw requirement with worst case flip time
@@ -6619,20 +6551,20 @@ static void CalculateFlipSchedule(
 					l->hvm_scaled_vm_bytes / (l->max_flip_time - Tno_bw_flip - 2 * Tr0_trips_flip_rounded),
 					l->hvm_scaled_row_bytes / (l->max_flip_time - Tvm_trips_flip_rounded));
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: max_flip_time = %f\n", __func__, l->max_flip_time);
-				dml2_printf("DML::%s: total vm bytes (hvm ineff scaled) = %f\n", __func__, l->hvm_scaled_vm_bytes);
-				dml2_printf("DML::%s: total row bytes (%d row, hvm ineff scaled) = %f\n", __func__, l->num_rows, l->hvm_scaled_row_bytes);
-				dml2_printf("DML::%s: total vm+row bytes (hvm ineff scaled) = %f\n", __func__, l->hvm_scaled_vm_row_bytes);
-				dml2_printf("DML::%s: lb_flip_bw for vm and row = %f\n", __func__, l->hvm_scaled_vm_row_bytes / (l->max_flip_time - Tno_bw_flip));
-				dml2_printf("DML::%s: lb_flip_bw for vm = %f\n", __func__, l->hvm_scaled_vm_bytes / (l->max_flip_time - Tno_bw_flip - 2 * Tr0_trips_flip_rounded));
-				dml2_printf("DML::%s: lb_flip_bw for row = %f\n", __func__, l->hvm_scaled_row_bytes / (l->max_flip_time - Tvm_trips_flip_rounded));
+				DML_LOG_VERBOSE("DML::%s: max_flip_time = %f\n", __func__, l->max_flip_time);
+				DML_LOG_VERBOSE("DML::%s: total vm bytes (hvm ineff scaled) = %f\n", __func__, l->hvm_scaled_vm_bytes);
+				DML_LOG_VERBOSE("DML::%s: total row bytes (%f row, hvm ineff scaled) = %f\n", __func__, l->num_rows, l->hvm_scaled_row_bytes);
+				DML_LOG_VERBOSE("DML::%s: total vm+row bytes (hvm ineff scaled) = %f\n", __func__, l->hvm_scaled_vm_row_bytes);
+				DML_LOG_VERBOSE("DML::%s: lb_flip_bw for vm and row = %f\n", __func__, l->hvm_scaled_vm_row_bytes / (l->max_flip_time - Tno_bw_flip));
+				DML_LOG_VERBOSE("DML::%s: lb_flip_bw for vm = %f\n", __func__, l->hvm_scaled_vm_bytes / (l->max_flip_time - Tno_bw_flip - 2 * Tr0_trips_flip_rounded));
+				DML_LOG_VERBOSE("DML::%s: lb_flip_bw for row = %f\n", __func__, l->hvm_scaled_row_bytes / (l->max_flip_time - Tvm_trips_flip_rounded));
 
 				if (l->lb_flip_bw > 0) {
-					dml2_printf("DML::%s: mode_support est Tvm_flip = %f (bw-based)\n", __func__, Tno_bw_flip + l->hvm_scaled_vm_bytes / l->lb_flip_bw);
-					dml2_printf("DML::%s: mode_support est Tr0_flip = %f (bw-based)\n", __func__, l->hvm_scaled_row_bytes / l->lb_flip_bw / l->num_rows);
-					dml2_printf("DML::%s: mode_support est dst_y_per_vm_flip = %f (bw-based)\n", __func__, Tno_bw_flip + l->hvm_scaled_vm_bytes / l->lb_flip_bw / LineTime);
-					dml2_printf("DML::%s: mode_support est dst_y_per_row_flip = %f (bw-based)\n", __func__, l->hvm_scaled_row_bytes / l->lb_flip_bw / LineTime / l->num_rows);
-					dml2_printf("DML::%s: Tvm_trips_flip_rounded + 2*Tr0_trips_flip_rounded = %f\n", __func__, (Tvm_trips_flip_rounded + 2 * Tr0_trips_flip_rounded));
+					DML_LOG_VERBOSE("DML::%s: mode_support est Tvm_flip = %f (bw-based)\n", __func__, Tno_bw_flip + l->hvm_scaled_vm_bytes / l->lb_flip_bw);
+					DML_LOG_VERBOSE("DML::%s: mode_support est Tr0_flip = %f (bw-based)\n", __func__, l->hvm_scaled_row_bytes / l->lb_flip_bw / l->num_rows);
+					DML_LOG_VERBOSE("DML::%s: mode_support est dst_y_per_vm_flip = %f (bw-based)\n", __func__, Tno_bw_flip + l->hvm_scaled_vm_bytes / l->lb_flip_bw / LineTime);
+					DML_LOG_VERBOSE("DML::%s: mode_support est dst_y_per_row_flip = %f (bw-based)\n", __func__, l->hvm_scaled_row_bytes / l->lb_flip_bw / LineTime / l->num_rows);
+					DML_LOG_VERBOSE("DML::%s: Tvm_trips_flip_rounded + 2*Tr0_trips_flip_rounded = %f\n", __func__, (Tvm_trips_flip_rounded + 2 * Tr0_trips_flip_rounded));
 				}
 #endif
 				l->lb_flip_bw = math_max3(l->lb_flip_bw,
@@ -6640,8 +6572,8 @@ static void CalculateFlipSchedule(
 						(l->dpte_row_bytes * HostVMInefficiencyFactor + meta_row_bytes) / (15 * LineTime));
 
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: lb_flip_bw for vm reg limit = %f\n", __func__, l->hvm_scaled_vm_bytes / (31 * LineTime) - Tno_bw_flip);
-				dml2_printf("DML::%s: lb_flip_bw for row reg limit = %f\n", __func__, (l->dpte_row_bytes * HostVMInefficiencyFactor + meta_row_bytes) / (15 * LineTime));
+				DML_LOG_VERBOSE("DML::%s: lb_flip_bw for vm reg limit = %f\n", __func__, l->hvm_scaled_vm_bytes / (31 * LineTime) - Tno_bw_flip);
+				DML_LOG_VERBOSE("DML::%s: lb_flip_bw for row reg limit = %f\n", __func__, (l->dpte_row_bytes * HostVMInefficiencyFactor + meta_row_bytes) / (15 * LineTime));
 #endif
 			}
 
@@ -6653,13 +6585,12 @@ static void CalculateFlipSchedule(
 		} else {
 			if (iflip_enable) {
 				l->ImmediateFlipBW = (double)per_pipe_flip_bytes * BandwidthAvailableForImmediateFlip / (double)TotImmediateFlipBytes; // flip_bw(i)
-				double portion = (double)per_pipe_flip_bytes / (double)TotImmediateFlipBytes;
 
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: per_pipe_flip_bytes = %d\n", __func__, per_pipe_flip_bytes);
-				dml2_printf("DML::%s: BandwidthAvailableForImmediateFlip = %f\n", __func__, BandwidthAvailableForImmediateFlip);
-				dml2_printf("DML::%s: ImmediateFlipBW = %f\n", __func__, l->ImmediateFlipBW);
-				dml2_printf("DML::%s: portion of flip bw = %f\n", __func__, portion);
+				DML_LOG_VERBOSE("DML::%s: per_pipe_flip_bytes = %d\n", __func__, per_pipe_flip_bytes);
+				DML_LOG_VERBOSE("DML::%s: BandwidthAvailableForImmediateFlip = %f\n", __func__, BandwidthAvailableForImmediateFlip);
+				DML_LOG_VERBOSE("DML::%s: ImmediateFlipBW = %f\n", __func__, l->ImmediateFlipBW);
+				DML_LOG_VERBOSE("DML::%s: portion of flip bw = %f\n", __func__, (double)per_pipe_flip_bytes / (double)TotImmediateFlipBytes);
 #endif
 				if (l->ImmediateFlipBW == 0) {
 					l->Tvm_flip = 0;
@@ -6674,11 +6605,11 @@ static void CalculateFlipSchedule(
 						LineTime / 4.0);
 				}
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: total vm bytes (hvm ineff scaled) = %f\n", __func__, vm_bytes * HostVMInefficiencyFactor);
-				dml2_printf("DML::%s: total row bytes (hvm ineff scaled, one row) = %f\n", __func__, (l->dpte_row_bytes * HostVMInefficiencyFactor + meta_row_bytes));
+				DML_LOG_VERBOSE("DML::%s: total vm bytes (hvm ineff scaled) = %f\n", __func__, vm_bytes * HostVMInefficiencyFactor);
+				DML_LOG_VERBOSE("DML::%s: total row bytes (hvm ineff scaled, one row) = %f\n", __func__, (l->dpte_row_bytes * HostVMInefficiencyFactor + meta_row_bytes));
 
-				dml2_printf("DML::%s: Tvm_flip = %f (bw-based), Tvm_trips_flip = %f (latency-based)\n", __func__, Tno_bw_flip + vm_bytes * HostVMInefficiencyFactor / l->ImmediateFlipBW, Tvm_trips_flip);
-				dml2_printf("DML::%s: Tr0_flip = %f (bw-based), Tr0_trips_flip = %f (latency-based)\n", __func__, (l->dpte_row_bytes * HostVMInefficiencyFactor + meta_row_bytes) / l->ImmediateFlipBW, Tr0_trips_flip);
+				DML_LOG_VERBOSE("DML::%s: Tvm_flip = %f (bw-based), Tvm_trips_flip = %f (latency-based)\n", __func__, Tno_bw_flip + vm_bytes * HostVMInefficiencyFactor / l->ImmediateFlipBW, Tvm_trips_flip);
+				DML_LOG_VERBOSE("DML::%s: Tr0_flip = %f (bw-based), Tr0_trips_flip = %f (latency-based)\n", __func__, (l->dpte_row_bytes * HostVMInefficiencyFactor + meta_row_bytes) / l->ImmediateFlipBW, Tr0_trips_flip);
 #endif
 				*dst_y_per_vm_flip = math_ceil2(4.0 * (l->Tvm_flip / LineTime), 1.0) / 4.0;
 				*dst_y_per_row_flip = math_ceil2(4.0 * (l->Tr0_flip / LineTime), 1.0) / 4.0;
@@ -6711,14 +6642,14 @@ static void CalculateFlipSchedule(
 
 #ifdef __DML_VBA_DEBUG__
 	if (!use_lb_flip_bw) {
-		dml2_printf("DML::%s: dst_y_per_vm_flip = %f (should be < 32)\n", __func__, *dst_y_per_vm_flip);
-		dml2_printf("DML::%s: dst_y_per_row_flip = %f (should be < 16)\n", __func__, *dst_y_per_row_flip);
-		dml2_printf("DML::%s: Tvm_flip = %f (final)\n", __func__, l->Tvm_flip);
-		dml2_printf("DML::%s: Tr0_flip = %f (final)\n", __func__, l->Tr0_flip);
-		dml2_printf("DML::%s: Tvm_flip + 2*Tr0_flip = %f (should be <= min_row_time=%f)\n", __func__, l->Tvm_flip + 2 * l->Tr0_flip, l->min_row_time);
+		DML_LOG_VERBOSE("DML::%s: dst_y_per_vm_flip = %f (should be < 32)\n", __func__, *dst_y_per_vm_flip);
+		DML_LOG_VERBOSE("DML::%s: dst_y_per_row_flip = %f (should be < 16)\n", __func__, *dst_y_per_row_flip);
+		DML_LOG_VERBOSE("DML::%s: Tvm_flip = %f (final)\n", __func__, l->Tvm_flip);
+		DML_LOG_VERBOSE("DML::%s: Tr0_flip = %f (final)\n", __func__, l->Tr0_flip);
+		DML_LOG_VERBOSE("DML::%s: Tvm_flip + 2*Tr0_flip = %f (should be <= min_row_time=%f)\n", __func__, l->Tvm_flip + 2 * l->Tr0_flip, l->min_row_time);
 	}
-	dml2_printf("DML::%s: final_flip_bw = %f\n", __func__, *final_flip_bw);
-	dml2_printf("DML::%s: ImmediateFlipSupportedForPipe = %u\n", __func__, *ImmediateFlipSupportedForPipe);
+	DML_LOG_VERBOSE("DML::%s: final_flip_bw = %f\n", __func__, *final_flip_bw);
+	DML_LOG_VERBOSE("DML::%s: ImmediateFlipSupportedForPipe = %u\n", __func__, *ImmediateFlipSupportedForPipe);
 #endif
 }
 
@@ -6736,7 +6667,7 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	p->Watermark->UrgentWatermark = p->mmSOCParameters.UrgentLatency + p->mmSOCParameters.ExtraLatency;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: UrgentWatermark = %f\n", __func__, p->Watermark->UrgentWatermark);
+	DML_LOG_VERBOSE("DML::%s: UrgentWatermark = %f\n", __func__, p->Watermark->UrgentWatermark);
 #endif
 
 	p->Watermark->USRRetrainingWatermark = p->mmSOCParameters.UrgentLatency + p->mmSOCParameters.ExtraLatency + p->mmSOCParameters.USRRetrainingLatency + p->mmSOCParameters.SMNLatency;
@@ -6755,20 +6686,20 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	p->Watermark->temp_read_or_ppt_watermark_us = p->mmSOCParameters.g6_temp_read_blackout_us + p->Watermark->UrgentWatermark;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: UrgentLatency = %f\n", __func__, p->mmSOCParameters.UrgentLatency);
-	dml2_printf("DML::%s: ExtraLatency = %f\n", __func__, p->mmSOCParameters.ExtraLatency);
-	dml2_printf("DML::%s: DRAMClockChangeLatency = %f\n", __func__, p->mmSOCParameters.DRAMClockChangeLatency);
-	dml2_printf("DML::%s: SREnterPlusExitZ8Time = %f\n", __func__, p->mmSOCParameters.SREnterPlusExitZ8Time);
-	dml2_printf("DML::%s: SREnterPlusExitTime = %f\n", __func__, p->mmSOCParameters.SREnterPlusExitTime);
-	dml2_printf("DML::%s: UrgentWatermark = %f\n", __func__, p->Watermark->UrgentWatermark);
-	dml2_printf("DML::%s: USRRetrainingWatermark = %f\n", __func__, p->Watermark->USRRetrainingWatermark);
-	dml2_printf("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, p->Watermark->DRAMClockChangeWatermark);
-	dml2_printf("DML::%s: FCLKChangeWatermark = %f\n", __func__, p->Watermark->FCLKChangeWatermark);
-	dml2_printf("DML::%s: StutterExitWatermark = %f\n", __func__, p->Watermark->StutterExitWatermark);
-	dml2_printf("DML::%s: StutterEnterPlusExitWatermark = %f\n", __func__, p->Watermark->StutterEnterPlusExitWatermark);
-	dml2_printf("DML::%s: Z8StutterExitWatermark = %f\n", __func__, p->Watermark->Z8StutterExitWatermark);
-	dml2_printf("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n", __func__, p->Watermark->Z8StutterEnterPlusExitWatermark);
-	dml2_printf("DML::%s: temp_read_or_ppt_watermark_us = %f\n", __func__, p->Watermark->temp_read_or_ppt_watermark_us);
+	DML_LOG_VERBOSE("DML::%s: UrgentLatency = %f\n", __func__, p->mmSOCParameters.UrgentLatency);
+	DML_LOG_VERBOSE("DML::%s: ExtraLatency = %f\n", __func__, p->mmSOCParameters.ExtraLatency);
+	DML_LOG_VERBOSE("DML::%s: DRAMClockChangeLatency = %f\n", __func__, p->mmSOCParameters.DRAMClockChangeLatency);
+	DML_LOG_VERBOSE("DML::%s: SREnterPlusExitZ8Time = %f\n", __func__, p->mmSOCParameters.SREnterPlusExitZ8Time);
+	DML_LOG_VERBOSE("DML::%s: SREnterPlusExitTime = %f\n", __func__, p->mmSOCParameters.SREnterPlusExitTime);
+	DML_LOG_VERBOSE("DML::%s: UrgentWatermark = %f\n", __func__, p->Watermark->UrgentWatermark);
+	DML_LOG_VERBOSE("DML::%s: USRRetrainingWatermark = %f\n", __func__, p->Watermark->USRRetrainingWatermark);
+	DML_LOG_VERBOSE("DML::%s: DRAMClockChangeWatermark = %f\n", __func__, p->Watermark->DRAMClockChangeWatermark);
+	DML_LOG_VERBOSE("DML::%s: FCLKChangeWatermark = %f\n", __func__, p->Watermark->FCLKChangeWatermark);
+	DML_LOG_VERBOSE("DML::%s: StutterExitWatermark = %f\n", __func__, p->Watermark->StutterExitWatermark);
+	DML_LOG_VERBOSE("DML::%s: StutterEnterPlusExitWatermark = %f\n", __func__, p->Watermark->StutterEnterPlusExitWatermark);
+	DML_LOG_VERBOSE("DML::%s: Z8StutterExitWatermark = %f\n", __func__, p->Watermark->Z8StutterExitWatermark);
+	DML_LOG_VERBOSE("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n", __func__, p->Watermark->Z8StutterEnterPlusExitWatermark);
+	DML_LOG_VERBOSE("DML::%s: temp_read_or_ppt_watermark_us = %f\n", __func__, p->Watermark->temp_read_or_ppt_watermark_us);
 #endif
 
 	s->TotalActiveWriteback = 0;
@@ -6801,11 +6732,11 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		p->Watermark->WritebackFCLKChangeWatermark = p->Watermark->WritebackFCLKChangeWatermark + p->mmSOCParameters.USRRetrainingLatency;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: WritebackDRAMClockChangeWatermark = %f\n", __func__, p->Watermark->WritebackDRAMClockChangeWatermark);
-	dml2_printf("DML::%s: WritebackFCLKChangeWatermark = %f\n", __func__, p->Watermark->WritebackFCLKChangeWatermark);
-	dml2_printf("DML::%s: WritebackUrgentWatermark = %f\n", __func__, p->Watermark->WritebackUrgentWatermark);
-	dml2_printf("DML::%s: USRRetrainingRequired = %u\n", __func__, p->USRRetrainingRequired);
-	dml2_printf("DML::%s: USRRetrainingLatency = %f\n", __func__, p->mmSOCParameters.USRRetrainingLatency);
+	DML_LOG_VERBOSE("DML::%s: WritebackDRAMClockChangeWatermark = %f\n", __func__, p->Watermark->WritebackDRAMClockChangeWatermark);
+	DML_LOG_VERBOSE("DML::%s: WritebackFCLKChangeWatermark = %f\n", __func__, p->Watermark->WritebackFCLKChangeWatermark);
+	DML_LOG_VERBOSE("DML::%s: WritebackUrgentWatermark = %f\n", __func__, p->Watermark->WritebackUrgentWatermark);
+	DML_LOG_VERBOSE("DML::%s: USRRetrainingRequired = %u\n", __func__, p->USRRetrainingRequired);
+	DML_LOG_VERBOSE("DML::%s: USRRetrainingLatency = %f\n", __func__, p->mmSOCParameters.USRRetrainingLatency);
 #endif
 
 	s->TotalPixelBW = 0.0;
@@ -6836,11 +6767,11 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		s->LBLatencyHidingSourceLinesC[k] = (unsigned int)(math_min2((double)p->MaxLineBufferLines, math_floor2((double)p->LineBufferSize / LBBitPerPixel / ((double)p->SwathWidthC[k] / math_max2(h_ratio_c, 1.0)), 1)) - (v_taps_c - 1));
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, MaxLineBufferLines = %u\n", __func__, k, p->MaxLineBufferLines);
-		dml2_printf("DML::%s: k=%u, LineBufferSize = %u\n", __func__, k, p->LineBufferSize);
-		dml2_printf("DML::%s: k=%u, LBBitPerPixel = %u\n", __func__, k, LBBitPerPixel);
-		dml2_printf("DML::%s: k=%u, HRatio = %f\n", __func__, k, h_ratio);
-		dml2_printf("DML::%s: k=%u, VTaps = %f\n", __func__, k, v_taps);
+		DML_LOG_VERBOSE("DML::%s: k=%u, MaxLineBufferLines = %u\n", __func__, k, p->MaxLineBufferLines);
+		DML_LOG_VERBOSE("DML::%s: k=%u, LineBufferSize = %u\n", __func__, k, p->LineBufferSize);
+		DML_LOG_VERBOSE("DML::%s: k=%u, LBBitPerPixel = %f\n", __func__, k, LBBitPerPixel);
+		DML_LOG_VERBOSE("DML::%s: k=%u, HRatio = %f\n", __func__, k, h_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%u, VTaps = %f\n", __func__, k, v_taps);
 #endif
 
 		s->EffectiveLBLatencyHidingY = s->LBLatencyHidingSourceLinesY[k] / v_ratio * (h_total / pixel_clock_mhz);
@@ -6943,16 +6874,16 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		s->sub_vp_lines_l = s->src_y_pstate_l + s->src_y_ahead_l + p->meta_row_height_l[k];
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, DETBufferSizeY = %u\n", __func__, k, p->DETBufferSizeY[k]);
-		dml2_printf("DML::%s: k=%u, BytePerPixelDETY = %f\n", __func__, k, p->BytePerPixelDETY[k]);
-		dml2_printf("DML::%s: k=%u, SwathWidthY = %u\n", __func__, k, p->SwathWidthY[k]);
-		dml2_printf("DML::%s: k=%u, SwathHeightY = %u\n", __func__, k, p->SwathHeightY[k]);
-		dml2_printf("DML::%s: k=%u, LBLatencyHidingSourceLinesY = %u\n", __func__, k, s->LBLatencyHidingSourceLinesY[k]);
-		dml2_printf("DML::%s: k=%u, dst_y_pstate = %u\n", __func__, k, s->dst_y_pstate);
-		dml2_printf("DML::%s: k=%u, src_y_pstate_l = %u\n", __func__, k, s->src_y_pstate_l);
-		dml2_printf("DML::%s: k=%u, src_y_ahead_l = %u\n", __func__, k, s->src_y_ahead_l);
-		dml2_printf("DML::%s: k=%u, meta_row_height_l = %u\n", __func__, k, p->meta_row_height_l[k]);
-		dml2_printf("DML::%s: k=%u, sub_vp_lines_l = %u\n", __func__, k, s->sub_vp_lines_l);
+		DML_LOG_VERBOSE("DML::%s: k=%u, DETBufferSizeY = %u\n", __func__, k, p->DETBufferSizeY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, BytePerPixelDETY = %f\n", __func__, k, p->BytePerPixelDETY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, SwathWidthY = %u\n", __func__, k, p->SwathWidthY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, SwathHeightY = %u\n", __func__, k, p->SwathHeightY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, LBLatencyHidingSourceLinesY = %u\n", __func__, k, s->LBLatencyHidingSourceLinesY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dst_y_pstate = %u\n", __func__, k, s->dst_y_pstate);
+		DML_LOG_VERBOSE("DML::%s: k=%u, src_y_pstate_l = %u\n", __func__, k, s->src_y_pstate_l);
+		DML_LOG_VERBOSE("DML::%s: k=%u, src_y_ahead_l = %u\n", __func__, k, s->src_y_ahead_l);
+		DML_LOG_VERBOSE("DML::%s: k=%u, meta_row_height_l = %u\n", __func__, k, p->meta_row_height_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, sub_vp_lines_l = %u\n", __func__, k, s->sub_vp_lines_l);
 #endif
 		p->SubViewportLinesNeededInMALL[k] = s->sub_vp_lines_l;
 
@@ -6967,10 +6898,10 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 				p->SubViewportLinesNeededInMALL[k] = (unsigned int)(math_max2(s->sub_vp_lines_l, s->sub_vp_lines_c));
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, meta_row_height_c = %u\n", __func__, k, p->meta_row_height_c[k]);
-			dml2_printf("DML::%s: k=%u, src_y_pstate_c = %u\n", __func__, k, s->src_y_pstate_c);
-			dml2_printf("DML::%s: k=%u, src_y_ahead_c = %u\n", __func__, k, s->src_y_ahead_c);
-			dml2_printf("DML::%s: k=%u, sub_vp_lines_c = %u\n", __func__, k, s->sub_vp_lines_c);
+			DML_LOG_VERBOSE("DML::%s: k=%u, meta_row_height_c = %u\n", __func__, k, p->meta_row_height_c[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, src_y_pstate_c = %u\n", __func__, k, s->src_y_pstate_c);
+			DML_LOG_VERBOSE("DML::%s: k=%u, src_y_ahead_c = %u\n", __func__, k, s->src_y_ahead_c);
+			DML_LOG_VERBOSE("DML::%s: k=%u, sub_vp_lines_c = %u\n", __func__, k, s->sub_vp_lines_c);
 #endif
 		}
 	}
@@ -6992,10 +6923,10 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DRAMClockChangeSupport = %u\n", __func__, *p->global_dram_clock_change_supported);
-	dml2_printf("DML::%s: FCLKChangeSupport = %u\n", __func__, *p->global_fclk_change_supported);
-	dml2_printf("DML::%s: MaxActiveFCLKChangeLatencySupported = %f\n", __func__, *p->MaxActiveFCLKChangeLatencySupported);
-	dml2_printf("DML::%s: USRRetrainingSupport = %u\n", __func__, *p->USRRetrainingSupport);
+	DML_LOG_VERBOSE("DML::%s: DRAMClockChangeSupport = %u\n", __func__, *p->global_dram_clock_change_supported);
+	DML_LOG_VERBOSE("DML::%s: FCLKChangeSupport = %u\n", __func__, *p->global_fclk_change_supported);
+	DML_LOG_VERBOSE("DML::%s: MaxActiveFCLKChangeLatencySupported = %f\n", __func__, *p->MaxActiveFCLKChangeLatencySupported);
+	DML_LOG_VERBOSE("DML::%s: USRRetrainingSupport = %u\n", __func__, *p->USRRetrainingSupport);
 #endif
 }
 
@@ -7141,7 +7072,7 @@ static unsigned int get_qos_param_index(unsigned long uclk_freq_khz, const struc
 	unsigned int index = 0;
 
 	for (i = 0; i < DML_MAX_CLK_TABLE_SIZE; i++) {
-		dml2_printf("DML::%s: per_uclk_dpm_params[%d].minimum_uclk_khz = %d\n", __func__, i, per_uclk_dpm_params[i].minimum_uclk_khz);
+		DML_LOG_VERBOSE("DML::%s: per_uclk_dpm_params[%d].minimum_uclk_khz = %ld\n", __func__, i, per_uclk_dpm_params[i].minimum_uclk_khz);
 
 		if (i == 0)
 			index = 0;
@@ -7153,10 +7084,8 @@ static unsigned int get_qos_param_index(unsigned long uclk_freq_khz, const struc
 			break;
 		}
 	}
-#if defined(__DML_VBA_DEBUG__)
-	dml2_printf("DML::%s: uclk_freq_khz = %d\n", __func__, uclk_freq_khz);
-	dml2_printf("DML::%s: index = %d\n", __func__, index);
-#endif
+	DML_LOG_VERBOSE("DML::%s: uclk_freq_khz = %ld\n", __func__, uclk_freq_khz);
+	DML_LOG_VERBOSE("DML::%s: index = %d\n", __func__, index);
 	return index;
 }
 
@@ -7166,7 +7095,7 @@ static unsigned int get_active_min_uclk_dpm_index(unsigned long uclk_freq_khz, c
 	bool clk_entry_found = 0;
 
 	for (i = 0; i < clk_table->uclk.num_clk_values; i++) {
-		dml2_printf("DML::%s: clk_table.uclk.clk_values_khz[%d] = %d\n", __func__, i, clk_table->uclk.clk_values_khz[i]);
+		DML_LOG_VERBOSE("DML::%s: clk_table.uclk.clk_values_khz[%d] = %ld\n", __func__, i, clk_table->uclk.clk_values_khz[i]);
 
 		if (uclk_freq_khz == clk_table->uclk.clk_values_khz[i]) {
 			clk_entry_found = 1;
@@ -7175,10 +7104,10 @@ static unsigned int get_active_min_uclk_dpm_index(unsigned long uclk_freq_khz, c
 	}
 
 	if (!clk_entry_found)
-		DML2_ASSERT(clk_entry_found);
+		DML_ASSERT(clk_entry_found);
 #if defined(__DML_VBA_DEBUG__)
-	dml2_printf("DML::%s: uclk_freq_khz = %ld\n", __func__, uclk_freq_khz);
-	dml2_printf("DML::%s: index = %d\n", __func__, i);
+	DML_LOG_VERBOSE("DML::%s: uclk_freq_khz = %ld\n", __func__, uclk_freq_khz);
+	DML_LOG_VERBOSE("DML::%s: index = %d\n", __func__, i);
 #endif
 	return i;
 }
@@ -7218,10 +7147,10 @@ static void calculate_hostvm_inefficiency_factor(
 			if ((*HostVMInefficiencyFactorPrefetch < 4) && (remote_iommu_outstanding_translations < max_outstanding_reqs))
 				*HostVMInefficiencyFactorPrefetch = 4;
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: urg_bandwidth_avail_active_pixel_and_vm = %f\n", __func__, urg_bandwidth_avail_active_pixel_and_vm);
-			dml2_printf("DML::%s: urg_bandwidth_avail_active_vm_only = %f\n", __func__, urg_bandwidth_avail_active_vm_only);
-			dml2_printf("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, *HostVMInefficiencyFactor);
-			dml2_printf("DML::%s: HostVMInefficiencyFactorPrefetch = %f\n", __func__, *HostVMInefficiencyFactorPrefetch);
+			DML_LOG_VERBOSE("DML::%s: urg_bandwidth_avail_active_pixel_and_vm = %f\n", __func__, urg_bandwidth_avail_active_pixel_and_vm);
+			DML_LOG_VERBOSE("DML::%s: urg_bandwidth_avail_active_vm_only = %f\n", __func__, urg_bandwidth_avail_active_vm_only);
+			DML_LOG_VERBOSE("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, *HostVMInefficiencyFactor);
+			DML_LOG_VERBOSE("DML::%s: HostVMInefficiencyFactorPrefetch = %f\n", __func__, *HostVMInefficiencyFactorPrefetch);
 #endif
 		}
 }
@@ -7341,10 +7270,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	const struct dml2_display_cfg *display_cfg = in_out_params->in_display_cfg;
 	const struct dml2_mcg_min_clock_table *min_clk_table = in_out_params->min_clk_table;
 
-#if defined(__DML_VBA_DEBUG__)
-	double old_ReadBandwidthLuma;
-	double old_ReadBandwidthChroma;
-#endif
 	double outstanding_latency_us = 0;
 	double min_return_bw_for_latency;
 
@@ -7384,25 +7309,25 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	mode_lib->ms.active_min_uclk_dpm_index = get_active_min_uclk_dpm_index((unsigned int) (mode_lib->ms.uclk_freq_mhz * 1000.0), &mode_lib->soc.clk_table);
 
 #if defined(__DML_VBA_DEBUG__)
-	dml2_printf("DML::%s: --- START --- \n", __func__);
-	dml2_printf("DML::%s: num_active_planes = %u\n", __func__, mode_lib->ms.num_active_planes);
-	dml2_printf("DML::%s: min_clk_index = %0d\n", __func__, in_out_params->min_clk_index);
-	dml2_printf("DML::%s: qos_param_index = %0d\n", __func__, mode_lib->ms.qos_param_index);
-	dml2_printf("DML::%s: SOCCLK = %f\n", __func__, mode_lib->ms.SOCCLK);
-	dml2_printf("DML::%s: dram_bw_mbps = %f\n", __func__, mode_lib->ms.dram_bw_mbps);
-	dml2_printf("DML::%s: uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
-	dml2_printf("DML::%s: FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
-	dml2_printf("DML::%s: MaxDCFCLK = %f\n", __func__, mode_lib->ms.MaxDCFCLK);
-	dml2_printf("DML::%s: max_dispclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dispclk_freq_mhz);
-	dml2_printf("DML::%s: max_dscclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dscclk_freq_mhz);
-	dml2_printf("DML::%s: max_dppclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dppclk_freq_mhz);
-	dml2_printf("DML::%s: MaxFabricClock = %f\n", __func__, mode_lib->ms.MaxFabricClock);
-	dml2_printf("DML::%s: ip.compressed_buffer_segment_size_in_kbytes = %u\n", __func__, mode_lib->ip.compressed_buffer_segment_size_in_kbytes);
-	dml2_printf("DML::%s: ip.dcn_mrq_present = %u\n", __func__, mode_lib->ip.dcn_mrq_present);
+	DML_LOG_VERBOSE("DML::%s: --- START --- \n", __func__);
+	DML_LOG_VERBOSE("DML::%s: num_active_planes = %u\n", __func__, mode_lib->ms.num_active_planes);
+	DML_LOG_VERBOSE("DML::%s: min_clk_index = %0d\n", __func__, in_out_params->min_clk_index);
+	DML_LOG_VERBOSE("DML::%s: qos_param_index = %0d\n", __func__, mode_lib->ms.qos_param_index);
+	DML_LOG_VERBOSE("DML::%s: SOCCLK = %f\n", __func__, mode_lib->ms.SOCCLK);
+	DML_LOG_VERBOSE("DML::%s: dram_bw_mbps = %f\n", __func__, mode_lib->ms.dram_bw_mbps);
+	DML_LOG_VERBOSE("DML::%s: uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
+	DML_LOG_VERBOSE("DML::%s: DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
+	DML_LOG_VERBOSE("DML::%s: FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
+	DML_LOG_VERBOSE("DML::%s: MaxDCFCLK = %f\n", __func__, mode_lib->ms.MaxDCFCLK);
+	DML_LOG_VERBOSE("DML::%s: max_dispclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dispclk_freq_mhz);
+	DML_LOG_VERBOSE("DML::%s: max_dscclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dscclk_freq_mhz);
+	DML_LOG_VERBOSE("DML::%s: max_dppclk_freq_mhz = %f\n", __func__, mode_lib->ms.max_dppclk_freq_mhz);
+	DML_LOG_VERBOSE("DML::%s: MaxFabricClock = %f\n", __func__, mode_lib->ms.MaxFabricClock);
+	DML_LOG_VERBOSE("DML::%s: ip.compressed_buffer_segment_size_in_kbytes = %u\n", __func__, mode_lib->ip.compressed_buffer_segment_size_in_kbytes);
+	DML_LOG_VERBOSE("DML::%s: ip.dcn_mrq_present = %u\n", __func__, mode_lib->ip.dcn_mrq_present);
 
 	for (k = 0; k < mode_lib->ms.num_active_planes; k++)
-		dml2_printf("DML::%s: plane_%d: reserved_vblank_time_ns = %u\n", __func__, k, display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
+		DML_LOG_VERBOSE("DML::%s: plane_%d: reserved_vblank_time_ns = %lu\n", __func__, k, display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
 #endif
 
 	CalculateMaxDETAndMinCompressedBufferSize(
@@ -7504,12 +7429,10 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			display_cfg->plane_descriptors[k].cursor.cursor_bpp / 8.0 / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000));
 
 #ifdef __DML_VBA_DEBUG__
-		old_ReadBandwidthLuma = mode_lib->ms.SwathWidthYSingleDPP[k] * math_ceil2(mode_lib->ms.BytePerPixelInDETY[k], 1.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
-		old_ReadBandwidthChroma = mode_lib->ms.SwathWidthYSingleDPP[k] / 2 * math_ceil2(mode_lib->ms.BytePerPixelInDETC[k], 2.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio / 2.0;
-		dml2_printf("DML::%s: k=%u, old_ReadBandwidthLuma = %f\n", __func__, k, old_ReadBandwidthLuma);
-		dml2_printf("DML::%s: k=%u, old_ReadBandwidthChroma = %f\n", __func__, k, old_ReadBandwidthChroma);
-		dml2_printf("DML::%s: k=%u, vactive_sw_bw_l = %f\n", __func__, k, mode_lib->ms.vactive_sw_bw_l[k]);
-		dml2_printf("DML::%s: k=%u, vactive_sw_bw_c = %f\n", __func__, k, mode_lib->ms.vactive_sw_bw_c[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, old_ReadBandwidthLuma = %f\n", __func__, k, mode_lib->ms.SwathWidthYSingleDPP[k] * math_ceil2(mode_lib->ms.BytePerPixelInDETY[k], 1.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%u, old_ReadBandwidthChroma = %f\n", __func__, k, mode_lib->ms.SwathWidthYSingleDPP[k] / 2 * math_ceil2(mode_lib->ms.BytePerPixelInDETC[k], 2.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio / 2.0);
+		DML_LOG_VERBOSE("DML::%s: k=%u, vactive_sw_bw_l = %f\n", __func__, k, mode_lib->ms.vactive_sw_bw_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, vactive_sw_bw_c = %f\n", __func__, k, mode_lib->ms.vactive_sw_bw_c[k]);
 #endif
 	}
 
@@ -7629,13 +7552,13 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		mode_lib->ms.MaximumSwathWidthLuma[k] = math_min2(s->MaximumSwathWidthSupportLuma, mode_lib->ms.MaximumSwathWidthInLineBufferLuma);
 		mode_lib->ms.MaximumSwathWidthChroma[k] = math_min2(s->MaximumSwathWidthSupportChroma, mode_lib->ms.MaximumSwathWidthInLineBufferChroma);
 
-		dml2_printf("DML::%s: k=%u MaximumSwathWidthLuma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthLuma[k]);
-		dml2_printf("DML::%s: k=%u MaximumSwathWidthSupportLuma=%u\n", __func__, k, s->MaximumSwathWidthSupportLuma);
-		dml2_printf("DML::%s: k=%u MaximumSwathWidthInLineBufferLuma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthInLineBufferLuma);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathWidthLuma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthLuma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathWidthSupportLuma=%u\n", __func__, k, s->MaximumSwathWidthSupportLuma);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathWidthInLineBufferLuma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthInLineBufferLuma);
 
-		dml2_printf("DML::%s: k=%u MaximumSwathWidthChroma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthChroma[k]);
-		dml2_printf("DML::%s: k=%u MaximumSwathWidthSupportChroma=%u\n", __func__, k, s->MaximumSwathWidthSupportChroma);
-		dml2_printf("DML::%s: k=%u MaximumSwathWidthInLineBufferChroma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthInLineBufferChroma);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathWidthChroma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthChroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathWidthSupportChroma=%u\n", __func__, k, s->MaximumSwathWidthSupportChroma);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaximumSwathWidthInLineBufferChroma=%f\n", __func__, k, mode_lib->ms.MaximumSwathWidthInLineBufferChroma);
 	}
 
 	/* Cursor Support Check */
@@ -7672,11 +7595,11 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.support.AlignedCPitch[k] > display_cfg->plane_descriptors[k].surface.plane1.pitch) {
 			mode_lib->ms.support.PitchSupport = false;
 #if defined(__DML_VBA_DEBUG__)
-			dml2_printf("DML::%s: k=%u AlignedYPitch = %d\n", __func__, k, mode_lib->ms.support.AlignedYPitch[k]);
-			dml2_printf("DML::%s: k=%u PitchY = %d\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane0.pitch);
-			dml2_printf("DML::%s: k=%u AlignedCPitch = %d\n", __func__, k, mode_lib->ms.support.AlignedCPitch[k]);
-			dml2_printf("DML::%s: k=%u PitchC = %d\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane1.pitch);
-			dml2_printf("DML::%s: k=%u PitchSupport = %d\n", __func__, k, mode_lib->ms.support.PitchSupport);
+			DML_LOG_VERBOSE("DML::%s: k=%u AlignedYPitch = %d\n", __func__, k, mode_lib->ms.support.AlignedYPitch[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u PitchY = %ld\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane0.pitch);
+			DML_LOG_VERBOSE("DML::%s: k=%u AlignedCPitch = %d\n", __func__, k, mode_lib->ms.support.AlignedCPitch[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u PitchC = %ld\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane1.pitch);
+			DML_LOG_VERBOSE("DML::%s: k=%u PitchSupport = %d\n", __func__, k, mode_lib->ms.support.PitchSupport);
 #endif
 		}
 
@@ -7708,11 +7631,11 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				display_cfg->plane_descriptors[k].composition.viewport.plane0.height > display_cfg->plane_descriptors[k].surface.plane0.height) {
 				mode_lib->ms.support.ViewportExceedsSurface = true;
 #if defined(__DML_VBA_DEBUG__)
-				dml2_printf("DML::%s: k=%u ViewportWidth = %d\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.width);
-				dml2_printf("DML::%s: k=%u SurfaceWidthY = %d\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane0.width);
-				dml2_printf("DML::%s: k=%u ViewportHeight = %d\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.height);
-				dml2_printf("DML::%s: k=%u SurfaceHeightY = %d\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane0.height);
-				dml2_printf("DML::%s: k=%u ViewportExceedsSurface = %d\n", __func__, k, mode_lib->ms.support.ViewportExceedsSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u ViewportWidth = %ld\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.width);
+				DML_LOG_VERBOSE("DML::%s: k=%u SurfaceWidthY = %ld\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane0.width);
+				DML_LOG_VERBOSE("DML::%s: k=%u ViewportHeight = %ld\n", __func__, k, display_cfg->plane_descriptors[k].composition.viewport.plane0.height);
+				DML_LOG_VERBOSE("DML::%s: k=%u SurfaceHeightY = %ld\n", __func__, k, display_cfg->plane_descriptors[k].surface.plane0.height);
+				DML_LOG_VERBOSE("DML::%s: k=%u ViewportExceedsSurface = %d\n", __func__, k, mode_lib->ms.support.ViewportExceedsSurface);
 #endif
 			}
 			if (dml_is_420(display_cfg->plane_descriptors[k].pixel_format) || display_cfg->plane_descriptors[k].pixel_format == dml2_rgbe_alpha) {
@@ -7894,8 +7817,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.TotalNumberOfActiveDPP = mode_lib->ms.TotalNumberOfActiveDPP + s->NumberOfDPPDSC;
 		}
 #if defined(__DML_VBA_DEBUG__)
-		dml2_printf("DML::%s: k=%d RequiresDSC = %d\n", __func__, k, mode_lib->ms.RequiresDSC[k]);
-		dml2_printf("DML::%s: k=%d ODMMode = %d\n", __func__, k, mode_lib->ms.ODMMode[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d RequiresDSC = %d\n", __func__, k, mode_lib->ms.RequiresDSC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d ODMMode = %d\n", __func__, k, mode_lib->ms.ODMMode[k]);
 #endif
 
 		// ensure the number dsc slices is integer multiple based on ODM mode
@@ -7911,9 +7834,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 					mode_lib->ms.support.DSCSlicesODMModeSupported = ((mode_lib->ms.support.NumberOfDSCSlices[k] % 4) == 0);
 #if defined(__DML_VBA_DEBUG__)
 				if (!mode_lib->ms.support.DSCSlicesODMModeSupported) {
-					dml2_printf("DML::%s: k=%d Invalid dsc num_slices and ODM mode setting\n", __func__, k);
-					dml2_printf("DML::%s: k=%d num_slices = %d\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.overrides.num_slices);
-					dml2_printf("DML::%s: k=%d ODMMode = %d\n", __func__, k, mode_lib->ms.ODMMode[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%d Invalid dsc num_slices and ODM mode setting\n", __func__, k);
+					DML_LOG_VERBOSE("DML::%s: k=%d num_slices = %d\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.overrides.num_slices);
+					DML_LOG_VERBOSE("DML::%s: k=%d ODMMode = %d\n", __func__, k, mode_lib->ms.ODMMode[k]);
 				}
 #endif
 			} else {
@@ -7958,7 +7881,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.MPCCombine[k] = false;
 			mode_lib->ms.NoOfDPP[k] = 1;
 			if (!mode_lib->ms.SingleDPPViewportSizeSupportPerSurface[k]) {
-				dml2_printf("WARNING: DML::%s: MPCC is override to disable but viewport is too large to be supported with single pipe!\n", __func__);
+				DML_LOG_VERBOSE("WARNING: DML::%s: MPCC is override to disable but viewport is too large to be supported with single pipe!\n", __func__);
 			}
 		} else {
 			if ((mode_lib->ms.MinDPPCLKUsingSingleDPP[k] > mode_lib->ms.max_dppclk_freq_mhz) || !mode_lib->ms.SingleDPPViewportSizeSupportPerSurface[k]) {
@@ -7968,7 +7891,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			}
 		}
 #if defined(__DML_VBA_DEBUG__)
-		dml2_printf("DML::%s: k=%d, NoOfDPP = %d\n", __func__, k, mode_lib->ms.NoOfDPP[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, NoOfDPP = %d\n", __func__, k, mode_lib->ms.NoOfDPP[k]);
 #endif
 	}
 
@@ -8167,7 +8090,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				s->DSCFormatFactor = 1;
 			}
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, RequiresDSC = %u\n", __func__, k, mode_lib->ms.RequiresDSC[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, RequiresDSC = %u\n", __func__, k, mode_lib->ms.RequiresDSC[k]);
 #endif
 			if (mode_lib->ms.RequiresDSC[k] == true) {
 				s->PixelClockBackEndFactor = 3.0;
@@ -8185,10 +8108,10 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				}
 
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: k=%u, PixelClockBackEnd = %f\n", __func__, k, s->PixelClockBackEnd[k]);
-				dml2_printf("DML::%s: k=%u, required_dscclk_freq_mhz = %f\n", __func__, k, mode_lib->ms.required_dscclk_freq_mhz[k]);
-				dml2_printf("DML::%s: k=%u, DSCFormatFactor = %u\n", __func__, k, s->DSCFormatFactor);
-				dml2_printf("DML::%s: k=%u, DSCCLKRequiredMoreThanSupported = %u\n", __func__, k, mode_lib->ms.support.DSCCLKRequiredMoreThanSupported);
+				DML_LOG_VERBOSE("DML::%s: k=%u, PixelClockBackEnd = %f\n", __func__, k, s->PixelClockBackEnd[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u, required_dscclk_freq_mhz = %f\n", __func__, k, mode_lib->ms.required_dscclk_freq_mhz[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u, DSCFormatFactor = %u\n", __func__, k, s->DSCFormatFactor);
+				DML_LOG_VERBOSE("DML::%s: k=%u, DSCCLKRequiredMoreThanSupported = %u\n", __func__, k, mode_lib->ms.support.DSCCLKRequiredMoreThanSupported);
 #endif
 			}
 		}
@@ -8423,13 +8346,13 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.support.DCCMetaBufferSizeNotExceeded = false;
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, PTEBufferSizeNotExceeded = %u\n", __func__, k, mode_lib->ms.PTEBufferSizeNotExceeded[k]);
-		dml2_printf("DML::%s: k=%u, DCCMetaBufferSizeNotExceeded = %u\n", __func__, k, mode_lib->ms.DCCMetaBufferSizeNotExceeded[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, PTEBufferSizeNotExceeded = %u\n", __func__, k, mode_lib->ms.PTEBufferSizeNotExceeded[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, DCCMetaBufferSizeNotExceeded = %u\n", __func__, k, mode_lib->ms.DCCMetaBufferSizeNotExceeded[k]);
 #endif
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: PTEBufferSizeNotExceeded = %u\n", __func__, mode_lib->ms.support.PTEBufferSizeNotExceeded);
-	dml2_printf("DML::%s: DCCMetaBufferSizeNotExceeded = %u\n", __func__, mode_lib->ms.support.DCCMetaBufferSizeNotExceeded);
+	DML_LOG_VERBOSE("DML::%s: PTEBufferSizeNotExceeded = %u\n", __func__, mode_lib->ms.support.PTEBufferSizeNotExceeded);
+	DML_LOG_VERBOSE("DML::%s: DCCMetaBufferSizeNotExceeded = %u\n", __func__, mode_lib->ms.support.DCCMetaBufferSizeNotExceeded);
 #endif
 
 	/* VActive bytes to fetch for UCLK P-State */
@@ -8531,9 +8454,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		mode_lib->ms.UrgentBurstFactorCursorPre[k] = mode_lib->ms.UrgentBurstFactorCursor[k];
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%d, Calling CalculateUrgentBurstFactor\n", __func__, k);
-		dml2_printf("DML::%s: k=%d, VRatio=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
-		dml2_printf("DML::%s: k=%d, VRatioChroma=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%d, Calling CalculateUrgentBurstFactor\n", __func__, k);
+		DML_LOG_VERBOSE("DML::%s: k=%d, VRatio=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%d, VRatioChroma=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio);
 #endif
 
 		CalculateUrgentBurstFactor(
@@ -8605,7 +8528,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: k=%u, MaximumVStartup = %u\n", __func__, k, s->MaximumVStartup[k]);
+	DML_LOG_VERBOSE("DML::%s: k=%u, MaximumVStartup = %u\n", __func__, k, s->MaximumVStartup[k]);
 #endif
 
 	/* Immediate Flip and MALL parameters */
@@ -8654,16 +8577,15 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		(s->SubViewportMALLPStateMethod && s->FullFrameMALLPStateMethod) || s->SubViewportMALLRefreshGreaterThan120Hz;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: SubViewportMALLPStateMethod = %u\n", __func__, s->SubViewportMALLPStateMethod);
-	dml2_printf("DML::%s: PhantomPipeMALLPStateMethod = %u\n", __func__, s->PhantomPipeMALLPStateMethod);
-	dml2_printf("DML::%s: FullFrameMALLPStateMethod = %u\n", __func__, s->FullFrameMALLPStateMethod);
-	dml2_printf("DML::%s: SubViewportMALLRefreshGreaterThan120Hz = %u\n", __func__, s->SubViewportMALLRefreshGreaterThan120Hz);
-	dml2_printf("DML::%s: InvalidCombinationOfMALLUseForPState = %u\n", __func__, mode_lib->ms.support.InvalidCombinationOfMALLUseForPState);
-	dml2_printf("DML::%s: in_out_params->min_clk_index = %u\n", __func__, in_out_params->min_clk_index);
-	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
-	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
-	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	DML_LOG_VERBOSE("DML::%s: SubViewportMALLPStateMethod = %u\n", __func__, s->SubViewportMALLPStateMethod);
+	DML_LOG_VERBOSE("DML::%s: PhantomPipeMALLPStateMethod = %u\n", __func__, s->PhantomPipeMALLPStateMethod);
+	DML_LOG_VERBOSE("DML::%s: FullFrameMALLPStateMethod = %u\n", __func__, s->FullFrameMALLPStateMethod);
+	DML_LOG_VERBOSE("DML::%s: SubViewportMALLRefreshGreaterThan120Hz = %u\n", __func__, s->SubViewportMALLRefreshGreaterThan120Hz);
+	DML_LOG_VERBOSE("DML::%s: InvalidCombinationOfMALLUseForPState = %u\n", __func__, mode_lib->ms.support.InvalidCombinationOfMALLUseForPState);
+	DML_LOG_VERBOSE("DML::%s: in_out_params->min_clk_index = %u\n", __func__, in_out_params->min_clk_index);
+	DML_LOG_VERBOSE("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
+	DML_LOG_VERBOSE("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
+	DML_LOG_VERBOSE("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
 #endif
 
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
@@ -8703,10 +8625,10 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			}
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: avg_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.avg_urgent_latency_us);
-			dml2_printf("DML::%s: avg_non_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.avg_non_urgent_latency_us);
-			dml2_printf("DML::%s: k=%d, request_size_bytes_luma = %d\n", __func__, k, mode_lib->ms.support.request_size_bytes_luma[k]);
-			dml2_printf("DML::%s: k=%d, outstanding_latency_us = %f (luma)\n", __func__, k, outstanding_latency_us);
+			DML_LOG_VERBOSE("DML::%s: avg_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.avg_urgent_latency_us);
+			DML_LOG_VERBOSE("DML::%s: avg_non_urgent_latency_us = %f\n", __func__, mode_lib->ms.support.avg_non_urgent_latency_us);
+			DML_LOG_VERBOSE("DML::%s: k=%d, request_size_bytes_luma = %d\n", __func__, k, mode_lib->ms.support.request_size_bytes_luma[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, outstanding_latency_us = %f (luma)\n", __func__, k, outstanding_latency_us);
 #endif
 		}
 
@@ -8722,8 +8644,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				mode_lib->ms.support.OutstandingRequestsUrgencyAvoidance = false;
 			}
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%d, request_size_bytes_chroma = %d\n", __func__, k, mode_lib->ms.support.request_size_bytes_chroma[k]);
-			dml2_printf("DML::%s: k=%d, outstanding_latency_us = %f (chroma)\n", __func__, k, outstanding_latency_us);
+			DML_LOG_VERBOSE("DML::%s: k=%d, request_size_bytes_chroma = %d\n", __func__, k, mode_lib->ms.support.request_size_bytes_chroma[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d, outstanding_latency_us = %f (chroma)\n", __func__, k, outstanding_latency_us);
 #endif
 		}
 	}
@@ -8869,7 +8791,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
 		if (mode_lib->ms.NotEnoughUrgentLatencyHiding[k]) {
 			mode_lib->ms.support.EnoughUrgentLatencyHidingSupport = false;
-			dml2_printf("DML::%s: k=%u NotEnoughUrgentLatencyHiding set\n", __func__, k);
+			DML_LOG_VERBOSE("DML::%s: k=%u NotEnoughUrgentLatencyHiding set\n", __func__, k);
 
 		}
 	}
@@ -8878,7 +8800,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			if (!mode_lib->ms.support.avg_bandwidth_support_ok[m][n] && (m == dml2_core_internal_soc_state_sys_active || mode_lib->soc.mall_allocated_for_dcn_mbytes > 0)) {
 				mode_lib->ms.support.AvgBandwidthSupport = false;
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: avg_bandwidth_support_ok[%s][%s] not ok\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n));
+				DML_LOG_VERBOSE("DML::%s: avg_bandwidth_support_ok[%s][%s] not ok\n", __func__, dml2_core_internal_soc_state_type_str(m), dml2_core_internal_bw_type_str(n));
 #endif
 			}
 		}
@@ -9029,8 +8951,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				myPipe->ProgressiveToInterlaceUnitInOPP = mode_lib->ip.ptoi_supported;
 
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: Calling CalculatePrefetchSchedule for k=%u\n", __func__, k);
-				dml2_printf("DML::%s: MaximumVStartup = %u\n", __func__, s->MaximumVStartup[k]);
+				DML_LOG_VERBOSE("DML::%s: Calling CalculatePrefetchSchedule for k=%u\n", __func__, k);
+				DML_LOG_VERBOSE("DML::%s: MaximumVStartup = %u\n", __func__, s->MaximumVStartup[k]);
 #endif
 				CalculatePrefetchSchedule_params->display_cfg = display_cfg;
 				CalculatePrefetchSchedule_params->HostVMInefficiencyFactor = s->HostVMInefficiencyFactorPrefetch;
@@ -9120,8 +9042,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				mode_lib->ms.NoTimeForPrefetch[k] = CalculatePrefetchSchedule(&mode_lib->scratch, CalculatePrefetchSchedule_params);
 
 				mode_lib->ms.support.PrefetchSupported &= !mode_lib->ms.NoTimeForPrefetch[k];
-				dml2_printf("DML::%s: k=%d, dst_y_per_vm_vblank = %f\n", __func__, k, *CalculatePrefetchSchedule_params->dst_y_per_vm_vblank);
-				dml2_printf("DML::%s: k=%d, dst_y_per_row_vblank = %f\n", __func__, k, *CalculatePrefetchSchedule_params->dst_y_per_row_vblank);
+				DML_LOG_VERBOSE("DML::%s: k=%d, dst_y_per_vm_vblank = %f\n", __func__, k, *CalculatePrefetchSchedule_params->dst_y_per_vm_vblank);
+				DML_LOG_VERBOSE("DML::%s: k=%d, dst_y_per_row_vblank = %f\n", __func__, k, *CalculatePrefetchSchedule_params->dst_y_per_row_vblank);
 			} // for k num_planes
 
 			CalculateDCFCLKDeepSleepTdlut(
@@ -9152,11 +9074,11 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 					|| mode_lib->ms.NoTimeForPrefetch[k] == true
 					|| s->DSTYAfterScaler[k] > 8) {
 					mode_lib->ms.support.PrefetchSupported = false;
-					dml2_printf("DML::%s: k=%d, dst_y_prefetch=%f (should not be < 2)\n", __func__, k, mode_lib->ms.dst_y_prefetch[k]);
-					dml2_printf("DML::%s: k=%d, LinesForVM=%f (should not be >= 32)\n", __func__, k, mode_lib->ms.LinesForVM[k]);
-					dml2_printf("DML::%s: k=%d, LinesForDPTERow=%f (should not be >= 16)\n", __func__, k, mode_lib->ms.LinesForDPTERow[k]);
-					dml2_printf("DML::%s: k=%d, DSTYAfterScaler=%d (should be <= 8)\n", __func__, k, s->DSTYAfterScaler[k]);
-					dml2_printf("DML::%s: k=%d, NoTimeForPrefetch=%d\n", __func__, k, mode_lib->ms.NoTimeForPrefetch[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%d, dst_y_prefetch=%f (should not be < 2)\n", __func__, k, mode_lib->ms.dst_y_prefetch[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%d, LinesForVM=%f (should not be >= 32)\n", __func__, k, mode_lib->ms.LinesForVM[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%d, LinesForDPTERow=%f (should not be >= 16)\n", __func__, k, mode_lib->ms.LinesForDPTERow[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%d, DSTYAfterScaler=%d (should be <= 8)\n", __func__, k, s->DSTYAfterScaler[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%d, NoTimeForPrefetch=%d\n", __func__, k, mode_lib->ms.NoTimeForPrefetch[k]);
 				}
 			}
 
@@ -9172,9 +9094,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				if (mode_lib->ms.VRatioPreY[k] > __DML2_CALCS_MAX_VRATIO_PRE__ ||
 					mode_lib->ms.VRatioPreC[k] > __DML2_CALCS_MAX_VRATIO_PRE__) {
 					mode_lib->ms.support.VRatioInPrefetchSupported = false;
-					dml2_printf("DML::%s: k=%d VRatioPreY = %f (should be <= %f)\n", __func__, k, mode_lib->ms.VRatioPreY[k], __DML2_CALCS_MAX_VRATIO_PRE__);
-					dml2_printf("DML::%s: k=%d VRatioPreC = %f (should be <= %f)\n", __func__, k, mode_lib->ms.VRatioPreC[k], __DML2_CALCS_MAX_VRATIO_PRE__);
-					dml2_printf("DML::%s: VRatioInPrefetchSupported = %u\n", __func__, mode_lib->ms.support.VRatioInPrefetchSupported);
+					DML_LOG_VERBOSE("DML::%s: k=%d VRatioPreY = %f (should be <= %f)\n", __func__, k, mode_lib->ms.VRatioPreY[k], __DML2_CALCS_MAX_VRATIO_PRE__);
+					DML_LOG_VERBOSE("DML::%s: k=%d VRatioPreC = %f (should be <= %f)\n", __func__, k, mode_lib->ms.VRatioPreC[k], __DML2_CALCS_MAX_VRATIO_PRE__);
+					DML_LOG_VERBOSE("DML::%s: VRatioInPrefetchSupported = %u\n", __func__, mode_lib->ms.support.VRatioInPrefetchSupported);
 				}
 			}
 
@@ -9188,9 +9110,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 					// Calculate Urgent burst factor for prefetch
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: k=%d, Calling CalculateUrgentBurstFactor (for prefetch)\n", __func__, k);
-					dml2_printf("DML::%s: k=%d, VRatioPreY=%f\n", __func__, k, mode_lib->ms.VRatioPreY[k]);
-					dml2_printf("DML::%s: k=%d, VRatioPreC=%f\n", __func__, k, mode_lib->ms.VRatioPreC[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%d, Calling CalculateUrgentBurstFactor (for prefetch)\n", __func__, k);
+					DML_LOG_VERBOSE("DML::%s: k=%d, VRatioPreY=%f\n", __func__, k, mode_lib->ms.VRatioPreY[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%d, VRatioPreC=%f\n", __func__, k, mode_lib->ms.VRatioPreC[k]);
 #endif
 					CalculateUrgentBurstFactor(
 						&display_cfg->plane_descriptors[k],
@@ -9274,12 +9196,12 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 					mode_lib->ms.support.urg_bandwidth_available);
 
 				mode_lib->ms.support.PrefetchSupported &= mode_lib->ms.support.PrefetchBandwidthSupported;
-				dml2_printf("DML::%s: PrefetchBandwidthSupported=%0d\n", __func__, mode_lib->ms.support.PrefetchBandwidthSupported);
+				DML_LOG_VERBOSE("DML::%s: PrefetchBandwidthSupported=%0d\n", __func__, mode_lib->ms.support.PrefetchBandwidthSupported);
 
 				for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 					if (mode_lib->ms.NotEnoughUrgentLatencyHidingPre[k]) {
 						mode_lib->ms.support.PrefetchSupported = false;
-						dml2_printf("DML::%s: k=%d, NotEnoughUrgentLatencyHidingPre=%d\n", __func__, k, mode_lib->ms.NotEnoughUrgentLatencyHidingPre[k]);
+						DML_LOG_VERBOSE("DML::%s: k=%d, NotEnoughUrgentLatencyHidingPre=%d\n", __func__, k, mode_lib->ms.NotEnoughUrgentLatencyHidingPre[k]);
 					}
 				}
 
@@ -9509,7 +9431,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 		calculate_pstate_keepout_dst_lines(display_cfg, &mode_lib->ms.support.watermarks, s->dummy_integer_array[0]);
 	}
-	dml2_printf("DML::%s: Done prefetch calculation\n", __func__);
+	DML_LOG_VERBOSE("DML::%s: Done prefetch calculation\n", __func__);
 	// End of Prefetch Check
 
 	mode_lib->ms.support.max_urgent_latency_us = s->mSOCParameters.max_urgent_latency_us;
@@ -9546,8 +9468,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			mode_lib->ms.dram_change_vactive_det_fill_delay_us);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: max_urgent_latency_us = %f\n", __func__, s->mSOCParameters.max_urgent_latency_us);
-	dml2_printf("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
+	DML_LOG_VERBOSE("DML::%s: max_urgent_latency_us = %f\n", __func__, s->mSOCParameters.max_urgent_latency_us);
+	DML_LOG_VERBOSE("DML::%s: ROBSupport = %u\n", __func__, mode_lib->ms.support.ROBSupport);
 #endif
 
 	/*Mode Support, Voltage State and SOC Configuration*/
@@ -9597,17 +9519,17 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			&& !mode_lib->ms.support.ExceededMALLSize
 			&& mode_lib->ms.support.g6_temp_read_support
 			&& ((!display_cfg->hostvm_enable && !s->ImmediateFlipRequired) || mode_lib->ms.support.ImmediateFlipSupport)) {
-			dml2_printf("DML::%s: mode is supported\n", __func__);
+			DML_LOG_VERBOSE("DML::%s: mode is supported\n", __func__);
 			mode_lib->ms.support.ModeSupport = true;
 		} else {
-			dml2_printf("DML::%s: mode is NOT supported\n", __func__);
+			DML_LOG_VERBOSE("DML::%s: mode is NOT supported\n", __func__);
 			mode_lib->ms.support.ModeSupport = false;
 		}
 	}
 
 	// Since now the mode_support work on 1 particular power state, so there is only 1 state idx (index 0).
-	dml2_printf("DML::%s: ModeSupport = %u\n", __func__, mode_lib->ms.support.ModeSupport);
-	dml2_printf("DML::%s: ImmediateFlipSupport = %u\n", __func__, mode_lib->ms.support.ImmediateFlipSupport);
+	DML_LOG_VERBOSE("DML::%s: ModeSupport = %u\n", __func__, mode_lib->ms.support.ModeSupport);
+	DML_LOG_VERBOSE("DML::%s: ImmediateFlipSupport = %u\n", __func__, mode_lib->ms.support.ImmediateFlipSupport);
 
 	for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 		mode_lib->ms.support.MPCCombineEnable[k] = mode_lib->ms.MPCCombine[k];
@@ -9623,8 +9545,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		mode_lib->ms.support.OutputRate[k] = mode_lib->ms.OutputRate[k];
 
 #if defined(__DML_VBA_DEBUG__)
-		dml2_printf("DML::%s: k=%d, ODMMode = %u\n", __func__, k, mode_lib->ms.support.ODMMode[k]);
-		dml2_printf("DML::%s: k=%d, DSCEnabled = %u\n", __func__, k, mode_lib->ms.support.DSCEnabled[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, ODMMode = %u\n", __func__, k, mode_lib->ms.support.ODMMode[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, DSCEnabled = %u\n", __func__, k, mode_lib->ms.support.DSCEnabled[k]);
 #endif
 	}
 
@@ -9632,7 +9554,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	if (!mode_lib->ms.support.ModeSupport)
 		dml2_print_mode_support_info(&mode_lib->ms.support, true);
 
-	dml2_printf("DML::%s: --- DONE --- \n", __func__);
+	DML_LOG_VERBOSE("DML::%s: --- DONE --- \n", __func__);
 #endif
 
 	return mode_lib->ms.support.ModeSupport;
@@ -9642,18 +9564,18 @@ unsigned int dml2_core_calcs_mode_support_ex(struct dml2_core_calcs_mode_support
 {
 	unsigned int result;
 
-	dml2_printf("DML::%s: ------------- START ----------\n", __func__);
+	DML_LOG_VERBOSE("DML::%s: ------------- START ----------\n", __func__);
 	result = dml_core_mode_support(in_out_params);
 
 	if (result)
 		*in_out_params->out_evaluation_info = in_out_params->mode_lib->ms.support;
 
-	dml2_printf("DML::%s: is_mode_support = %u (min_clk_index=%d)\n", __func__, result, in_out_params->min_clk_index);
+	DML_LOG_VERBOSE("DML::%s: is_mode_support = %u (min_clk_index=%d)\n", __func__, result, in_out_params->min_clk_index);
 
 	for (unsigned int k = 0; k < in_out_params->in_display_cfg->num_planes; k++)
-		dml2_printf("DML::%s: plane_%d: reserved_vblank_time_ns = %u\n", __func__, k, in_out_params->in_display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
+		DML_LOG_VERBOSE("DML::%s: plane_%d: reserved_vblank_time_ns = %lu\n", __func__, k, in_out_params->in_display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
 
-	dml2_printf("DML::%s: ------------- DONE ----------\n", __func__);
+	DML_LOG_VERBOSE("DML::%s: ------------- DONE ----------\n", __func__);
 
 	return result;
 }
@@ -9687,19 +9609,19 @@ static void CalculatePixelDeliveryTimes(
 		double pixel_clock_mhz = ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u : HRatio = %f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio);
-		dml2_printf("DML::%s: k=%u : VRatio = %f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
-		dml2_printf("DML::%s: k=%u : HRatioChroma = %f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio);
-		dml2_printf("DML::%s: k=%u : VRatioChroma = %f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio);
-		dml2_printf("DML::%s: k=%u : VRatioPrefetchY = %f\n", __func__, k, VRatioPrefetchY[k]);
-		dml2_printf("DML::%s: k=%u : VRatioPrefetchC = %f\n", __func__, k, VRatioPrefetchC[k]);
-		dml2_printf("DML::%s: k=%u : swath_width_luma_ub = %u\n", __func__, k, swath_width_luma_ub[k]);
-		dml2_printf("DML::%s: k=%u : swath_width_chroma_ub = %u\n", __func__, k, swath_width_chroma_ub[k]);
-		dml2_printf("DML::%s: k=%u : PSCL_THROUGHPUT = %f\n", __func__, k, PSCL_THROUGHPUT[k]);
-		dml2_printf("DML::%s: k=%u : PSCL_THROUGHPUT_CHROMA = %f\n", __func__, k, PSCL_THROUGHPUT_CHROMA[k]);
-		dml2_printf("DML::%s: k=%u : DPPPerSurface = %u\n", __func__, k, cfg_support_info->plane_support_info[k].dpps_used);
-		dml2_printf("DML::%s: k=%u : pixel_clock_mhz = %f\n", __func__, k, pixel_clock_mhz);
-		dml2_printf("DML::%s: k=%u : Dppclk = %f\n", __func__, k, Dppclk[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : HRatio = %f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%u : VRatio = %f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%u : HRatioChroma = %f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%u : VRatioChroma = %f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio);
+		DML_LOG_VERBOSE("DML::%s: k=%u : VRatioPrefetchY = %f\n", __func__, k, VRatioPrefetchY[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : VRatioPrefetchC = %f\n", __func__, k, VRatioPrefetchC[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : swath_width_luma_ub = %u\n", __func__, k, swath_width_luma_ub[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : swath_width_chroma_ub = %u\n", __func__, k, swath_width_chroma_ub[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : PSCL_THROUGHPUT = %f\n", __func__, k, PSCL_THROUGHPUT[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : PSCL_THROUGHPUT_CHROMA = %f\n", __func__, k, PSCL_THROUGHPUT_CHROMA[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DPPPerSurface = %u\n", __func__, k, cfg_support_info->plane_support_info[k].dpps_used);
+		DML_LOG_VERBOSE("DML::%s: k=%u : pixel_clock_mhz = %f\n", __func__, k, pixel_clock_mhz);
+		DML_LOG_VERBOSE("DML::%s: k=%u : Dppclk = %f\n", __func__, k, Dppclk[k]);
 #endif
 		if (display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio <= 1) {
 			DisplayPipeLineDeliveryTimeLuma[k] = swath_width_luma_ub[k] * cfg_support_info->plane_support_info[k].dpps_used / display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio / pixel_clock_mhz;
@@ -9733,10 +9655,10 @@ static void CalculatePixelDeliveryTimes(
 			}
 		}
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u : DisplayPipeLineDeliveryTimeLuma = %f\n", __func__, k, DisplayPipeLineDeliveryTimeLuma[k]);
-		dml2_printf("DML::%s: k=%u : DisplayPipeLineDeliveryTimeLumaPrefetch = %f\n", __func__, k, DisplayPipeLineDeliveryTimeLumaPrefetch[k]);
-		dml2_printf("DML::%s: k=%u : DisplayPipeLineDeliveryTimeChroma = %f\n", __func__, k, DisplayPipeLineDeliveryTimeChroma[k]);
-		dml2_printf("DML::%s: k=%u : DisplayPipeLineDeliveryTimeChromaPrefetch = %f\n", __func__, k, DisplayPipeLineDeliveryTimeChromaPrefetch[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DisplayPipeLineDeliveryTimeLuma = %f\n", __func__, k, DisplayPipeLineDeliveryTimeLuma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DisplayPipeLineDeliveryTimeLumaPrefetch = %f\n", __func__, k, DisplayPipeLineDeliveryTimeLumaPrefetch[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DisplayPipeLineDeliveryTimeChroma = %f\n", __func__, k, DisplayPipeLineDeliveryTimeChroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DisplayPipeLineDeliveryTimeChromaPrefetch = %f\n", __func__, k, DisplayPipeLineDeliveryTimeChromaPrefetch[k]);
 #endif
 	}
 
@@ -9752,12 +9674,12 @@ static void CalculatePixelDeliveryTimes(
 			DisplayPipeRequestDeliveryTimeChromaPrefetch[k] = DisplayPipeLineDeliveryTimeChromaPrefetch[k] / req_per_swath_ub_c[k];
 		}
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u : DisplayPipeRequestDeliveryTimeLuma = %f\n", __func__, k, DisplayPipeRequestDeliveryTimeLuma[k]);
-		dml2_printf("DML::%s: k=%u : DisplayPipeRequestDeliveryTimeLumaPrefetch = %f\n", __func__, k, DisplayPipeRequestDeliveryTimeLumaPrefetch[k]);
-		dml2_printf("DML::%s: k=%u : req_per_swath_ub_l = %d\n", __func__, k, req_per_swath_ub_l[k]);
-		dml2_printf("DML::%s: k=%u : DisplayPipeRequestDeliveryTimeChroma = %f\n", __func__, k, DisplayPipeRequestDeliveryTimeChroma[k]);
-		dml2_printf("DML::%s: k=%u : DisplayPipeRequestDeliveryTimeChromaPrefetch = %f\n", __func__, k, DisplayPipeRequestDeliveryTimeChromaPrefetch[k]);
-		dml2_printf("DML::%s: k=%u : req_per_swath_ub_c = %d\n", __func__, k, req_per_swath_ub_c[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DisplayPipeRequestDeliveryTimeLuma = %f\n", __func__, k, DisplayPipeRequestDeliveryTimeLuma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DisplayPipeRequestDeliveryTimeLumaPrefetch = %f\n", __func__, k, DisplayPipeRequestDeliveryTimeLumaPrefetch[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : req_per_swath_ub_l = %d\n", __func__, k, req_per_swath_ub_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DisplayPipeRequestDeliveryTimeChroma = %f\n", __func__, k, DisplayPipeRequestDeliveryTimeChroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : DisplayPipeRequestDeliveryTimeChromaPrefetch = %f\n", __func__, k, DisplayPipeRequestDeliveryTimeChromaPrefetch[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u : req_per_swath_ub_c = %d\n", __func__, k, req_per_swath_ub_c[k]);
 #endif
 	}
 }
@@ -9853,14 +9775,14 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 		}
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%d, DST_Y_PER_META_ROW_NOM_L = %f\n", __func__, k, p->DST_Y_PER_META_ROW_NOM_L[k]);
-		dml2_printf("DML::%s: k=%d, DST_Y_PER_META_ROW_NOM_C = %f\n", __func__, k, p->DST_Y_PER_META_ROW_NOM_C[k]);
-		dml2_printf("DML::%s: k=%d, TimePerMetaChunkNominal		  = %f\n", __func__, k, p->TimePerMetaChunkNominal[k]);
-		dml2_printf("DML::%s: k=%d, TimePerMetaChunkVBlank		   = %f\n", __func__, k, p->TimePerMetaChunkVBlank[k]);
-		dml2_printf("DML::%s: k=%d, TimePerMetaChunkFlip			 = %f\n", __func__, k, p->TimePerMetaChunkFlip[k]);
-		dml2_printf("DML::%s: k=%d, TimePerChromaMetaChunkNominal	= %f\n", __func__, k, p->TimePerChromaMetaChunkNominal[k]);
-		dml2_printf("DML::%s: k=%d, TimePerChromaMetaChunkVBlank	 = %f\n", __func__, k, p->TimePerChromaMetaChunkVBlank[k]);
-		dml2_printf("DML::%s: k=%d, TimePerChromaMetaChunkFlip	   = %f\n", __func__, k, p->TimePerChromaMetaChunkFlip[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, DST_Y_PER_META_ROW_NOM_L = %f\n", __func__, k, p->DST_Y_PER_META_ROW_NOM_L[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, DST_Y_PER_META_ROW_NOM_C = %f\n", __func__, k, p->DST_Y_PER_META_ROW_NOM_C[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, TimePerMetaChunkNominal		  = %f\n", __func__, k, p->TimePerMetaChunkNominal[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, TimePerMetaChunkVBlank		   = %f\n", __func__, k, p->TimePerMetaChunkVBlank[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, TimePerMetaChunkFlip			 = %f\n", __func__, k, p->TimePerMetaChunkFlip[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, TimePerChromaMetaChunkNominal	= %f\n", __func__, k, p->TimePerChromaMetaChunkNominal[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, TimePerChromaMetaChunkVBlank	 = %f\n", __func__, k, p->TimePerChromaMetaChunkVBlank[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, TimePerChromaMetaChunkFlip	   = %f\n", __func__, k, p->TimePerChromaMetaChunkFlip[k]);
 #endif
 	}
 
@@ -9881,7 +9803,7 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 		else
 			p->time_per_tdlut_group[k] = 0;
 
-		dml2_printf("DML::%s: k=%u, time_per_tdlut_group = %f\n", __func__, k, p->time_per_tdlut_group[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, time_per_tdlut_group = %f\n", __func__, k, p->time_per_tdlut_group[k]);
 
 		if (p->display_cfg->gpuvm_enable == true) {
 			if (!dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) {
@@ -9897,14 +9819,14 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 			if (dpte_groups_per_row_luma_ub <= 2) {
 				dpte_groups_per_row_luma_ub = dpte_groups_per_row_luma_ub + 1;
 			}
-			dml2_printf("DML::%s: k=%u, use_one_row_for_frame = %u\n", __func__, k, p->use_one_row_for_frame[k]);
-			dml2_printf("DML::%s: k=%u, dpte_group_bytes = %u\n", __func__, k, p->dpte_group_bytes[k]);
-			dml2_printf("DML::%s: k=%u, PTERequestSizeY = %u\n", __func__, k, p->PTERequestSizeY[k]);
-			dml2_printf("DML::%s: k=%u, PixelPTEReqWidthY = %u\n", __func__, k, p->PixelPTEReqWidthY[k]);
-			dml2_printf("DML::%s: k=%u, PixelPTEReqHeightY = %u\n", __func__, k, p->PixelPTEReqHeightY[k]);
-			dml2_printf("DML::%s: k=%u, dpte_row_width_luma_ub = %u\n", __func__, k, p->dpte_row_width_luma_ub[k]);
-			dml2_printf("DML::%s: k=%u, dpte_group_width_luma = %u\n", __func__, k, dpte_group_width_luma);
-			dml2_printf("DML::%s: k=%u, dpte_groups_per_row_luma_ub = %u\n", __func__, k, dpte_groups_per_row_luma_ub);
+			DML_LOG_VERBOSE("DML::%s: k=%u, use_one_row_for_frame = %u\n", __func__, k, p->use_one_row_for_frame[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, dpte_group_bytes = %u\n", __func__, k, p->dpte_group_bytes[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PTERequestSizeY = %u\n", __func__, k, p->PTERequestSizeY[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEReqWidthY = %u\n", __func__, k, p->PixelPTEReqWidthY[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, PixelPTEReqHeightY = %u\n", __func__, k, p->PixelPTEReqHeightY[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, dpte_row_width_luma_ub = %u\n", __func__, k, p->dpte_row_width_luma_ub[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, dpte_group_width_luma = %u\n", __func__, k, dpte_group_width_luma);
+			DML_LOG_VERBOSE("DML::%s: k=%u, dpte_groups_per_row_luma_ub = %u\n", __func__, k, dpte_groups_per_row_luma_ub);
 
 			p->time_per_pte_group_nom_luma[k] = p->DST_Y_PER_PTE_ROW_NOM_L[k] * p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total / pixel_clock_mhz / dpte_groups_per_row_luma_ub;
 			p->time_per_pte_group_vblank_luma[k] = p->dst_y_per_row_vblank[k] * p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total / pixel_clock_mhz / dpte_groups_per_row_luma_ub;
@@ -9928,9 +9850,9 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 				if (dpte_groups_per_row_chroma_ub <= 2) {
 					dpte_groups_per_row_chroma_ub = dpte_groups_per_row_chroma_ub + 1;
 				}
-				dml2_printf("DML::%s: k=%u, dpte_row_width_chroma_ub = %u\n", __func__, k, p->dpte_row_width_chroma_ub[k]);
-				dml2_printf("DML::%s: k=%u, dpte_group_width_chroma = %u\n", __func__, k, dpte_group_width_chroma);
-				dml2_printf("DML::%s: k=%u, dpte_groups_per_row_chroma_ub = %u\n", __func__, k, dpte_groups_per_row_chroma_ub);
+				DML_LOG_VERBOSE("DML::%s: k=%u, dpte_row_width_chroma_ub = %u\n", __func__, k, p->dpte_row_width_chroma_ub[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u, dpte_group_width_chroma = %u\n", __func__, k, dpte_group_width_chroma);
+				DML_LOG_VERBOSE("DML::%s: k=%u, dpte_groups_per_row_chroma_ub = %u\n", __func__, k, dpte_groups_per_row_chroma_ub);
 
 				p->time_per_pte_group_nom_chroma[k] = p->DST_Y_PER_PTE_ROW_NOM_C[k] * p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total / pixel_clock_mhz / dpte_groups_per_row_chroma_ub;
 				p->time_per_pte_group_vblank_chroma[k] = p->dst_y_per_row_vblank[k] * p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total / pixel_clock_mhz / dpte_groups_per_row_chroma_ub;
@@ -9945,17 +9867,17 @@ static void CalculateMetaAndPTETimes(struct dml2_core_shared_CalculateMetaAndPTE
 			p->time_per_pte_group_flip_chroma[k] = 0;
 		}
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, dst_y_per_row_vblank = %f\n", __func__, k, p->dst_y_per_row_vblank[k]);
-		dml2_printf("DML::%s: k=%u, dst_y_per_row_flip = %f\n", __func__, k, p->dst_y_per_row_flip[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dst_y_per_row_vblank = %f\n", __func__, k, p->dst_y_per_row_vblank[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dst_y_per_row_flip = %f\n", __func__, k, p->dst_y_per_row_flip[k]);
 
-		dml2_printf("DML::%s: k=%u, DST_Y_PER_PTE_ROW_NOM_L = %f\n", __func__, k, p->DST_Y_PER_PTE_ROW_NOM_L[k]);
-		dml2_printf("DML::%s: k=%u, DST_Y_PER_PTE_ROW_NOM_C = %f\n", __func__, k, p->DST_Y_PER_PTE_ROW_NOM_C[k]);
-		dml2_printf("DML::%s: k=%u, time_per_pte_group_nom_luma = %f\n", __func__, k, p->time_per_pte_group_nom_luma[k]);
-		dml2_printf("DML::%s: k=%u, time_per_pte_group_vblank_luma = %f\n", __func__, k, p->time_per_pte_group_vblank_luma[k]);
-		dml2_printf("DML::%s: k=%u, time_per_pte_group_flip_luma = %f\n", __func__, k, p->time_per_pte_group_flip_luma[k]);
-		dml2_printf("DML::%s: k=%u, time_per_pte_group_nom_chroma = %f\n", __func__, k, p->time_per_pte_group_nom_chroma[k]);
-		dml2_printf("DML::%s: k=%u, time_per_pte_group_vblank_chroma = %f\n", __func__, k, p->time_per_pte_group_vblank_chroma[k]);
-		dml2_printf("DML::%s: k=%u, time_per_pte_group_flip_chroma = %f\n", __func__, k, p->time_per_pte_group_flip_chroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, DST_Y_PER_PTE_ROW_NOM_L = %f\n", __func__, k, p->DST_Y_PER_PTE_ROW_NOM_L[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, DST_Y_PER_PTE_ROW_NOM_C = %f\n", __func__, k, p->DST_Y_PER_PTE_ROW_NOM_C[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, time_per_pte_group_nom_luma = %f\n", __func__, k, p->time_per_pte_group_nom_luma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, time_per_pte_group_vblank_luma = %f\n", __func__, k, p->time_per_pte_group_vblank_luma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, time_per_pte_group_flip_luma = %f\n", __func__, k, p->time_per_pte_group_flip_luma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, time_per_pte_group_nom_chroma = %f\n", __func__, k, p->time_per_pte_group_nom_chroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, time_per_pte_group_vblank_chroma = %f\n", __func__, k, p->time_per_pte_group_vblank_chroma[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, time_per_pte_group_flip_chroma = %f\n", __func__, k, p->time_per_pte_group_flip_chroma[k]);
 #endif
 	}
 } // CalculateMetaAndPTETimes
@@ -9991,18 +9913,18 @@ static void CalculateVMGroupAndRequestTimes(
 	double line_time;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: NumberOfActiveSurfaces = %u\n", __func__, NumberOfActiveSurfaces);
+	DML_LOG_VERBOSE("DML::%s: NumberOfActiveSurfaces = %u\n", __func__, NumberOfActiveSurfaces);
 #endif
 	for (unsigned int k = 0; k < NumberOfActiveSurfaces; ++k) {
 		double pixel_clock_mhz = ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
 		bool dcc_mrq_enable = display_cfg->plane_descriptors[k].surface.dcc.enable && mrq_present;
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, dcc_mrq_enable = %u\n", __func__, k, dcc_mrq_enable);
-		dml2_printf("DML::%s: k=%u, vm_group_bytes = %u\n", __func__, k, vm_group_bytes[k]);
-		dml2_printf("DML::%s: k=%u, dpde0_bytes_per_frame_ub_l = %u\n", __func__, k, dpde0_bytes_per_frame_ub_l[k]);
-		dml2_printf("DML::%s: k=%u, dpde0_bytes_per_frame_ub_c = %u\n", __func__, k, dpde0_bytes_per_frame_ub_c[k]);
-		dml2_printf("DML::%s: k=%d, meta_pte_bytes_per_frame_ub_l = %d\n", __func__, k, meta_pte_bytes_per_frame_ub_l[k]);
-		dml2_printf("DML::%s: k=%d, meta_pte_bytes_per_frame_ub_c = %d\n", __func__, k, meta_pte_bytes_per_frame_ub_c[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dcc_mrq_enable = %u\n", __func__, k, dcc_mrq_enable);
+		DML_LOG_VERBOSE("DML::%s: k=%u, vm_group_bytes = %u\n", __func__, k, vm_group_bytes[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dpde0_bytes_per_frame_ub_l = %u\n", __func__, k, dpde0_bytes_per_frame_ub_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, dpde0_bytes_per_frame_ub_c = %u\n", __func__, k, dpde0_bytes_per_frame_ub_c[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, meta_pte_bytes_per_frame_ub_l = %d\n", __func__, k, meta_pte_bytes_per_frame_ub_l[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d, meta_pte_bytes_per_frame_ub_c = %d\n", __func__, k, meta_pte_bytes_per_frame_ub_c[k]);
 #endif
 
 		if (display_cfg->gpuvm_enable) {
@@ -10071,13 +9993,13 @@ static void CalculateVMGroupAndRequestTimes(
 			else
 				TimePerVMRequestFlip[k] = 0.0;
 
-			dml2_printf("DML::%s: k=%u, dst_y_per_vm_vblank = %f\n", __func__, k, dst_y_per_vm_vblank[k]);
-			dml2_printf("DML::%s: k=%u, dst_y_per_vm_flip = %f\n", __func__, k, dst_y_per_vm_flip[k]);
-			dml2_printf("DML::%s: k=%u, line_time = %f\n", __func__, k, line_time);
-			dml2_printf("DML::%s: k=%u, num_group_per_lower_vm_stage_pref = %f\n", __func__, k, num_group_per_lower_vm_stage_pref);
-			dml2_printf("DML::%s: k=%u, num_group_per_lower_vm_stage_flip = %f\n", __func__, k, num_group_per_lower_vm_stage_flip);
-			dml2_printf("DML::%s: k=%u, num_req_per_lower_vm_stage_pref = %f\n", __func__, k, num_req_per_lower_vm_stage_pref);
-			dml2_printf("DML::%s: k=%u, num_req_per_lower_vm_stage_flip = %f\n", __func__, k, num_req_per_lower_vm_stage_flip);
+			DML_LOG_VERBOSE("DML::%s: k=%u, dst_y_per_vm_vblank = %f\n", __func__, k, dst_y_per_vm_vblank[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, dst_y_per_vm_flip = %f\n", __func__, k, dst_y_per_vm_flip[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, line_time = %f\n", __func__, k, line_time);
+			DML_LOG_VERBOSE("DML::%s: k=%u, num_group_per_lower_vm_stage_pref = %d\n", __func__, k, num_group_per_lower_vm_stage_pref);
+			DML_LOG_VERBOSE("DML::%s: k=%u, num_group_per_lower_vm_stage_flip = %d\n", __func__, k, num_group_per_lower_vm_stage_flip);
+			DML_LOG_VERBOSE("DML::%s: k=%u, num_req_per_lower_vm_stage_pref = %d\n", __func__, k, num_req_per_lower_vm_stage_pref);
+			DML_LOG_VERBOSE("DML::%s: k=%u, num_req_per_lower_vm_stage_flip = %d\n", __func__, k, num_req_per_lower_vm_stage_flip);
 
 			if (display_cfg->gpuvm_max_page_table_levels > 2) {
 				TimePerVMGroupVBlank[k] = TimePerVMGroupVBlank[k] / 2;
@@ -10094,10 +10016,10 @@ static void CalculateVMGroupAndRequestTimes(
 		}
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, TimePerVMGroupVBlank = %f\n", __func__, k, TimePerVMGroupVBlank[k]);
-		dml2_printf("DML::%s: k=%u, TimePerVMGroupFlip = %f\n", __func__, k, TimePerVMGroupFlip[k]);
-		dml2_printf("DML::%s: k=%u, TimePerVMRequestVBlank = %f\n", __func__, k, TimePerVMRequestVBlank[k]);
-		dml2_printf("DML::%s: k=%u, TimePerVMRequestFlip = %f\n", __func__, k, TimePerVMRequestFlip[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, TimePerVMGroupVBlank = %f\n", __func__, k, TimePerVMGroupVBlank[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, TimePerVMGroupFlip = %f\n", __func__, k, TimePerVMGroupFlip[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, TimePerVMRequestVBlank = %f\n", __func__, k, TimePerVMRequestVBlank[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u, TimePerVMRequestFlip = %f\n", __func__, k, TimePerVMRequestFlip[k]);
 #endif
 	}
 }
@@ -10113,7 +10035,6 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	unsigned int SingleVTotal = 0;
 	bool SameTiming = true;
 	bool FoundCriticalSurface = false;
-	double LastZ8StutterPeriod = 0;
 
 	memset(l, 0, sizeof(struct dml2_core_calcs_CalculateStutterEfficiency_locals));
 
@@ -10127,9 +10048,9 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 				}
 				l->TotalCompressedReadBandwidth = l->TotalCompressedReadBandwidth + p->ReadBandwidthSurfaceLuma[k] / math_min2(p->display_cfg->plane_descriptors[k].surface.dcc.informative.dcc_rate_plane0, l->MaximumEffectiveCompressionLuma);
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: k=%u, ReadBandwidthSurfaceLuma = %f\n", __func__, k, p->ReadBandwidthSurfaceLuma[k]);
-				dml2_printf("DML::%s: k=%u, NetDCCRateLuma = %f\n", __func__, k, p->display_cfg->plane_descriptors[k].surface.dcc.informative.dcc_rate_plane0);
-				dml2_printf("DML::%s: k=%u, MaximumEffectiveCompressionLuma = %f\n", __func__, k, l->MaximumEffectiveCompressionLuma);
+				DML_LOG_VERBOSE("DML::%s: k=%u, ReadBandwidthSurfaceLuma = %f\n", __func__, k, p->ReadBandwidthSurfaceLuma[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u, NetDCCRateLuma = %f\n", __func__, k, p->display_cfg->plane_descriptors[k].surface.dcc.informative.dcc_rate_plane0);
+				DML_LOG_VERBOSE("DML::%s: k=%u, MaximumEffectiveCompressionLuma = %f\n", __func__, k, l->MaximumEffectiveCompressionLuma);
 #endif
 				l->TotalZeroSizeRequestReadBandwidth = l->TotalZeroSizeRequestReadBandwidth + p->ReadBandwidthSurfaceLuma[k] * p->display_cfg->plane_descriptors[k].surface.dcc.informative.fraction_of_zero_size_request_plane0;
 				l->TotalZeroSizeCompressedReadBandwidth = l->TotalZeroSizeCompressedReadBandwidth + p->ReadBandwidthSurfaceLuma[k] * p->display_cfg->plane_descriptors[k].surface.dcc.informative.fraction_of_zero_size_request_plane0 / l->MaximumEffectiveCompressionLuma;
@@ -10142,9 +10063,9 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 					}
 					l->TotalCompressedReadBandwidth = l->TotalCompressedReadBandwidth + p->ReadBandwidthSurfaceChroma[k] / math_min2(p->display_cfg->plane_descriptors[k].surface.dcc.informative.dcc_rate_plane1, l->MaximumEffectiveCompressionChroma);
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: k=%u, ReadBandwidthSurfaceChroma = %f\n", __func__, k, p->ReadBandwidthSurfaceChroma[k]);
-					dml2_printf("DML::%s: k=%u, NetDCCRateChroma = %f\n", __func__, k, p->display_cfg->plane_descriptors[k].surface.dcc.informative.dcc_rate_plane1);
-					dml2_printf("DML::%s: k=%u, MaximumEffectiveCompressionChroma = %f\n", __func__, k, l->MaximumEffectiveCompressionChroma);
+					DML_LOG_VERBOSE("DML::%s: k=%u, ReadBandwidthSurfaceChroma = %f\n", __func__, k, p->ReadBandwidthSurfaceChroma[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%u, NetDCCRateChroma = %f\n", __func__, k, p->display_cfg->plane_descriptors[k].surface.dcc.informative.dcc_rate_plane1);
+					DML_LOG_VERBOSE("DML::%s: k=%u, MaximumEffectiveCompressionChroma = %f\n", __func__, k, l->MaximumEffectiveCompressionChroma);
 #endif
 					l->TotalZeroSizeRequestReadBandwidth = l->TotalZeroSizeRequestReadBandwidth + p->ReadBandwidthSurfaceChroma[k] * p->display_cfg->plane_descriptors[k].surface.dcc.informative.fraction_of_zero_size_request_plane1;
 					l->TotalZeroSizeCompressedReadBandwidth = l->TotalZeroSizeCompressedReadBandwidth + p->ReadBandwidthSurfaceChroma[k] * p->display_cfg->plane_descriptors[k].surface.dcc.informative.fraction_of_zero_size_request_plane1 / l->MaximumEffectiveCompressionChroma;
@@ -10160,19 +10081,19 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	l->AverageDCCZeroSizeFraction = l->TotalZeroSizeRequestReadBandwidth / p->TotalDataReadBandwidth;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: UnboundedRequestEnabled = %u\n", __func__, p->UnboundedRequestEnabled);
-	dml2_printf("DML::%s: TotalCompressedReadBandwidth = %f\n", __func__, l->TotalCompressedReadBandwidth);
-	dml2_printf("DML::%s: TotalZeroSizeRequestReadBandwidth = %f\n", __func__, l->TotalZeroSizeRequestReadBandwidth);
-	dml2_printf("DML::%s: TotalZeroSizeCompressedReadBandwidth = %f\n", __func__, l->TotalZeroSizeCompressedReadBandwidth);
-	dml2_printf("DML::%s: MaximumEffectiveCompressionLuma = %f\n", __func__, l->MaximumEffectiveCompressionLuma);
-	dml2_printf("DML::%s: MaximumEffectiveCompressionChroma = %f\n", __func__, l->MaximumEffectiveCompressionChroma);
-	dml2_printf("DML::%s: AverageDCCCompressionRate = %f\n", __func__, l->AverageDCCCompressionRate);
-	dml2_printf("DML::%s: AverageDCCZeroSizeFraction = %f\n", __func__, l->AverageDCCZeroSizeFraction);
+	DML_LOG_VERBOSE("DML::%s: UnboundedRequestEnabled = %u\n", __func__, p->UnboundedRequestEnabled);
+	DML_LOG_VERBOSE("DML::%s: TotalCompressedReadBandwidth = %f\n", __func__, l->TotalCompressedReadBandwidth);
+	DML_LOG_VERBOSE("DML::%s: TotalZeroSizeRequestReadBandwidth = %f\n", __func__, l->TotalZeroSizeRequestReadBandwidth);
+	DML_LOG_VERBOSE("DML::%s: TotalZeroSizeCompressedReadBandwidth = %f\n", __func__, l->TotalZeroSizeCompressedReadBandwidth);
+	DML_LOG_VERBOSE("DML::%s: MaximumEffectiveCompressionLuma = %f\n", __func__, l->MaximumEffectiveCompressionLuma);
+	DML_LOG_VERBOSE("DML::%s: MaximumEffectiveCompressionChroma = %f\n", __func__, l->MaximumEffectiveCompressionChroma);
+	DML_LOG_VERBOSE("DML::%s: AverageDCCCompressionRate = %f\n", __func__, l->AverageDCCCompressionRate);
+	DML_LOG_VERBOSE("DML::%s: AverageDCCZeroSizeFraction = %f\n", __func__, l->AverageDCCZeroSizeFraction);
 
-	dml2_printf("DML::%s: CompbufReservedSpace64B = %u (%f kbytes)\n", __func__, p->CompbufReservedSpace64B, p->CompbufReservedSpace64B * 64 / 1024.0);
-	dml2_printf("DML::%s: CompbufReservedSpaceZs = %u\n", __func__, p->CompbufReservedSpaceZs);
-	dml2_printf("DML::%s: CompressedBufferSizeInkByte = %u kbytes\n", __func__, p->CompressedBufferSizeInkByte);
-	dml2_printf("DML::%s: ROBBufferSizeInKByte = %u kbytes\n", __func__, p->ROBBufferSizeInKByte);
+	DML_LOG_VERBOSE("DML::%s: CompbufReservedSpace64B = %u (%f kbytes)\n", __func__, p->CompbufReservedSpace64B, p->CompbufReservedSpace64B * 64 / 1024.0);
+	DML_LOG_VERBOSE("DML::%s: CompbufReservedSpaceZs = %u\n", __func__, p->CompbufReservedSpaceZs);
+	DML_LOG_VERBOSE("DML::%s: CompressedBufferSizeInkByte = %u kbytes\n", __func__, p->CompressedBufferSizeInkByte);
+	DML_LOG_VERBOSE("DML::%s: ROBBufferSizeInKByte = %u kbytes\n", __func__, p->ROBBufferSizeInKByte);
 #endif
 	if (l->AverageDCCZeroSizeFraction == 1) {
 		l->AverageZeroSizeCompressionRate = l->TotalZeroSizeRequestReadBandwidth / l->TotalZeroSizeCompressedReadBandwidth;
@@ -10189,10 +10110,10 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: min 1 = %f\n", __func__, p->CompressedBufferSizeInkByte * 1024 * l->AverageDCCCompressionRate);
-		dml2_printf("DML::%s: min 2 = %f\n", __func__, p->MetaFIFOSizeInKEntries * 1024 * 64 / (l->AverageDCCZeroSizeFraction / l->AverageZeroSizeCompressionRate + 1 / l->AverageDCCCompressionRate));
-		dml2_printf("DML::%s: min 3 = %d\n", __func__, (p->ROBBufferSizeInKByte * 1024 - p->CompbufReservedSpace64B * 64));
-		dml2_printf("DML::%s: min 4 = %f\n", __func__, (p->ZeroSizeBufferEntries - p->CompbufReservedSpaceZs) * 64 / (l->AverageDCCZeroSizeFraction / l->AverageZeroSizeCompressionRate));
+		DML_LOG_VERBOSE("DML::%s: min 1 = %f\n", __func__, p->CompressedBufferSizeInkByte * 1024 * l->AverageDCCCompressionRate);
+		DML_LOG_VERBOSE("DML::%s: min 2 = %f\n", __func__, p->MetaFIFOSizeInKEntries * 1024 * 64 / (l->AverageDCCZeroSizeFraction / l->AverageZeroSizeCompressionRate + 1 / l->AverageDCCCompressionRate));
+		DML_LOG_VERBOSE("DML::%s: min 3 = %d\n", __func__, (p->ROBBufferSizeInKByte * 1024 - p->CompbufReservedSpace64B * 64));
+		DML_LOG_VERBOSE("DML::%s: min 4 = %f\n", __func__, (p->ZeroSizeBufferEntries - p->CompbufReservedSpaceZs) * 64 / (l->AverageDCCZeroSizeFraction / l->AverageZeroSizeCompressionRate));
 #endif
 	} else {
 		l->EffectiveCompressedBufferSize = math_min2((double)p->CompressedBufferSizeInkByte * 1024 * l->AverageDCCCompressionRate,
@@ -10200,16 +10121,16 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 			((double)p->ROBBufferSizeInKByte * 1024 - p->CompbufReservedSpace64B * 64) * (p->rob_alloc_compressed ? l->AverageDCCCompressionRate : 1.0);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: min 1 = %f\n", __func__, p->CompressedBufferSizeInkByte * 1024 * l->AverageDCCCompressionRate);
-		dml2_printf("DML::%s: min 2 = %f\n", __func__, p->MetaFIFOSizeInKEntries * 1024 * 64 * l->AverageDCCCompressionRate);
+		DML_LOG_VERBOSE("DML::%s: min 1 = %f\n", __func__, p->CompressedBufferSizeInkByte * 1024 * l->AverageDCCCompressionRate);
+		DML_LOG_VERBOSE("DML::%s: min 2 = %f\n", __func__, p->MetaFIFOSizeInKEntries * 1024 * 64 * l->AverageDCCCompressionRate);
 #endif
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: MetaFIFOSizeInKEntries = %u\n", __func__, p->MetaFIFOSizeInKEntries);
-	dml2_printf("DML::%s: ZeroSizeBufferEntries = %u\n", __func__, p->ZeroSizeBufferEntries);
-	dml2_printf("DML::%s: AverageZeroSizeCompressionRate = %f\n", __func__, l->AverageZeroSizeCompressionRate);
-	dml2_printf("DML::%s: EffectiveCompressedBufferSize = %f (%f kbytes)\n", __func__, l->EffectiveCompressedBufferSize, l->EffectiveCompressedBufferSize / 1024.0);
+	DML_LOG_VERBOSE("DML::%s: MetaFIFOSizeInKEntries = %u\n", __func__, p->MetaFIFOSizeInKEntries);
+	DML_LOG_VERBOSE("DML::%s: ZeroSizeBufferEntries = %u\n", __func__, p->ZeroSizeBufferEntries);
+	DML_LOG_VERBOSE("DML::%s: AverageZeroSizeCompressionRate = %f\n", __func__, l->AverageZeroSizeCompressionRate);
+	DML_LOG_VERBOSE("DML::%s: EffectiveCompressedBufferSize = %f (%f kbytes)\n", __func__, l->EffectiveCompressedBufferSize, l->EffectiveCompressedBufferSize / 1024.0);
 #endif
 
 	*p->StutterPeriod = 0;
@@ -10220,15 +10141,15 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 			l->LinesInDETYRoundedDownToSwath = math_floor2(l->LinesInDETY, p->SwathHeightY[k]);
 			l->DETBufferingTimeY = l->LinesInDETYRoundedDownToSwath * ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) / p->display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, DETBufferSizeY = %u (%u kbytes)\n", __func__, k, p->DETBufferSizeY[k], p->DETBufferSizeY[k] / 1024);
-			dml2_printf("DML::%s: k=%u, BytePerPixelDETY = %f\n", __func__, k, p->BytePerPixelDETY[k]);
-			dml2_printf("DML::%s: k=%u, SwathWidthY = %u\n", __func__, k, p->SwathWidthY[k]);
-			dml2_printf("DML::%s: k=%u, ReadBandwidthSurfaceLuma = %f\n", __func__, k, p->ReadBandwidthSurfaceLuma[k]);
-			dml2_printf("DML::%s: k=%u, TotalDataReadBandwidth = %f\n", __func__, k, p->TotalDataReadBandwidth);
-			dml2_printf("DML::%s: k=%u, LinesInDETY = %f\n", __func__, k, l->LinesInDETY);
-			dml2_printf("DML::%s: k=%u, LinesInDETYRoundedDownToSwath = %f\n", __func__, k, l->LinesInDETYRoundedDownToSwath);
-			dml2_printf("DML::%s: k=%u, VRatio = %f\n", __func__, k, p->display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
-			dml2_printf("DML::%s: k=%u, DETBufferingTimeY = %f\n", __func__, k, l->DETBufferingTimeY);
+			DML_LOG_VERBOSE("DML::%s: k=%u, DETBufferSizeY = %u (%u kbytes)\n", __func__, k, p->DETBufferSizeY[k], p->DETBufferSizeY[k] / 1024);
+			DML_LOG_VERBOSE("DML::%s: k=%u, BytePerPixelDETY = %f\n", __func__, k, p->BytePerPixelDETY[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, SwathWidthY = %u\n", __func__, k, p->SwathWidthY[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, ReadBandwidthSurfaceLuma = %f\n", __func__, k, p->ReadBandwidthSurfaceLuma[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, TotalDataReadBandwidth = %f\n", __func__, k, p->TotalDataReadBandwidth);
+			DML_LOG_VERBOSE("DML::%s: k=%u, LinesInDETY = %f\n", __func__, k, l->LinesInDETY);
+			DML_LOG_VERBOSE("DML::%s: k=%u, LinesInDETYRoundedDownToSwath = %f\n", __func__, k, l->LinesInDETYRoundedDownToSwath);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VRatio = %f\n", __func__, k, p->display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
+			DML_LOG_VERBOSE("DML::%s: k=%u, DETBufferingTimeY = %f\n", __func__, k, l->DETBufferingTimeY);
 #endif
 
 			if (!FoundCriticalSurface || l->DETBufferingTimeY < *p->StutterPeriod) {
@@ -10248,17 +10169,17 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 				l->SinglePipeCriticalSurface = (p->DPPPerSurface[k] == 1);
 
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: k=%u, FoundCriticalSurface = %u\n", __func__, k, FoundCriticalSurface);
-				dml2_printf("DML::%s: k=%u, StutterPeriod = %f\n", __func__, k, *p->StutterPeriod);
-				dml2_printf("DML::%s: k=%u, MinTTUVBlankCriticalSurface = %f\n", __func__, k, l->MinTTUVBlankCriticalSurface);
-				dml2_printf("DML::%s: k=%u, FrameTimeCriticalSurface= %f\n", __func__, k, l->FrameTimeCriticalSurface);
-				dml2_printf("DML::%s: k=%u, VActiveTimeCriticalSurface = %f\n", __func__, k, l->VActiveTimeCriticalSurface);
-				dml2_printf("DML::%s: k=%u, BytePerPixelYCriticalSurface = %u\n", __func__, k, l->BytePerPixelYCriticalSurface);
-				dml2_printf("DML::%s: k=%u, SwathWidthYCriticalSurface = %f\n", __func__, k, l->SwathWidthYCriticalSurface);
-				dml2_printf("DML::%s: k=%u, SwathHeightYCriticalSurface = %f\n", __func__, k, l->SwathHeightYCriticalSurface);
-				dml2_printf("DML::%s: k=%u, BlockWidth256BytesYCriticalSurface = %u\n", __func__, k, l->BlockWidth256BytesYCriticalSurface);
-				dml2_printf("DML::%s: k=%u, SinglePlaneCriticalSurface = %u\n", __func__, k, l->SinglePlaneCriticalSurface);
-				dml2_printf("DML::%s: k=%u, SinglePipeCriticalSurface = %u\n", __func__, k, l->SinglePipeCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, FoundCriticalSurface = %u\n", __func__, k, FoundCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, StutterPeriod = %f\n", __func__, k, *p->StutterPeriod);
+				DML_LOG_VERBOSE("DML::%s: k=%u, MinTTUVBlankCriticalSurface = %f\n", __func__, k, l->MinTTUVBlankCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, FrameTimeCriticalSurface= %f\n", __func__, k, l->FrameTimeCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, VActiveTimeCriticalSurface = %f\n", __func__, k, l->VActiveTimeCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, BytePerPixelYCriticalSurface = %u\n", __func__, k, l->BytePerPixelYCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, SwathWidthYCriticalSurface = %f\n", __func__, k, l->SwathWidthYCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, SwathHeightYCriticalSurface = %f\n", __func__, k, l->SwathHeightYCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, BlockWidth256BytesYCriticalSurface = %u\n", __func__, k, l->BlockWidth256BytesYCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, SinglePlaneCriticalSurface = %u\n", __func__, k, l->SinglePlaneCriticalSurface);
+				DML_LOG_VERBOSE("DML::%s: k=%u, SinglePipeCriticalSurface = %u\n", __func__, k, l->SinglePipeCriticalSurface);
 #endif
 			}
 		}
@@ -10276,14 +10197,14 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 
 	l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer = math_min2(*p->StutterPeriod * p->TotalDataReadBandwidth, l->EffectiveCompressedBufferSize);
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: AverageDCCCompressionRate = %f\n", __func__, l->AverageDCCCompressionRate);
-	dml2_printf("DML::%s: StutterPeriod*TotalDataReadBandwidth = %f (%f kbytes)\n", __func__, *p->StutterPeriod * p->TotalDataReadBandwidth, (*p->StutterPeriod * p->TotalDataReadBandwidth) / 1024.0);
-	dml2_printf("DML::%s: EffectiveCompressedBufferSize = %f (%f kbytes)\n", __func__, l->EffectiveCompressedBufferSize, l->EffectiveCompressedBufferSize / 1024.0);
-	dml2_printf("DML::%s: PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer = %f (%f kbytes)\n", __func__, l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer, l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer / 1024);
-	dml2_printf("DML::%s: ReturnBW = %f\n", __func__, p->ReturnBW);
-	dml2_printf("DML::%s: TotalDataReadBandwidth = %f\n", __func__, p->TotalDataReadBandwidth);
-	dml2_printf("DML::%s: TotalRowReadBandwidth = %f\n", __func__, l->TotalRowReadBandwidth);
-	dml2_printf("DML::%s: DCFCLK = %f\n", __func__, p->DCFCLK);
+	DML_LOG_VERBOSE("DML::%s: AverageDCCCompressionRate = %f\n", __func__, l->AverageDCCCompressionRate);
+	DML_LOG_VERBOSE("DML::%s: StutterPeriod*TotalDataReadBandwidth = %f (%f kbytes)\n", __func__, *p->StutterPeriod * p->TotalDataReadBandwidth, (*p->StutterPeriod * p->TotalDataReadBandwidth) / 1024.0);
+	DML_LOG_VERBOSE("DML::%s: EffectiveCompressedBufferSize = %f (%f kbytes)\n", __func__, l->EffectiveCompressedBufferSize, l->EffectiveCompressedBufferSize / 1024.0);
+	DML_LOG_VERBOSE("DML::%s: PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer = %f (%f kbytes)\n", __func__, l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer, l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer / 1024);
+	DML_LOG_VERBOSE("DML::%s: ReturnBW = %f\n", __func__, p->ReturnBW);
+	DML_LOG_VERBOSE("DML::%s: TotalDataReadBandwidth = %f\n", __func__, p->TotalDataReadBandwidth);
+	DML_LOG_VERBOSE("DML::%s: TotalRowReadBandwidth = %f\n", __func__, l->TotalRowReadBandwidth);
+	DML_LOG_VERBOSE("DML::%s: DCFCLK = %f\n", __func__, p->DCFCLK);
 #endif
 
 	l->StutterBurstTime = l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer
@@ -10292,10 +10213,10 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 		/ math_min2(p->DCFCLK * 64, p->ReturnBW * (p->hw_debug5 ? 1 : l->AverageDCCCompressionRate)) +
 		*p->StutterPeriod * l->TotalRowReadBandwidth / p->ReturnBW;
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: Part 1 = %f\n", __func__, l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer / p->ReturnBW / (p->hw_debug5 ? 1 : l->AverageDCCCompressionRate));
-	dml2_printf("DML::%s: Part 2 = %f\n", __func__, (*p->StutterPeriod * p->TotalDataReadBandwidth - l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer) / (p->DCFCLK * 64));
-	dml2_printf("DML::%s: Part 3 = %f\n", __func__, *p->StutterPeriod * l->TotalRowReadBandwidth / p->ReturnBW);
-	dml2_printf("DML::%s: StutterBurstTime = %f\n", __func__, l->StutterBurstTime);
+	DML_LOG_VERBOSE("DML::%s: Part 1 = %f\n", __func__, l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer / p->ReturnBW / (p->hw_debug5 ? 1 : l->AverageDCCCompressionRate));
+	DML_LOG_VERBOSE("DML::%s: Part 2 = %f\n", __func__, (*p->StutterPeriod * p->TotalDataReadBandwidth - l->PartOfUncompressedPixelBurstThatFitsInROBAndCompressedBuffer) / (p->DCFCLK * 64));
+	DML_LOG_VERBOSE("DML::%s: Part 3 = %f\n", __func__, *p->StutterPeriod * l->TotalRowReadBandwidth / p->ReturnBW);
+	DML_LOG_VERBOSE("DML::%s: StutterBurstTime = %f\n", __func__, l->StutterBurstTime);
 #endif
 	l->TotalActiveWriteback = 0;
 	memset(l->stream_visited, 0, DML2_MAX_PLANES * sizeof(bool));
@@ -10324,9 +10245,9 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 
 	if (l->TotalActiveWriteback == 0) {
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: SRExitTime = %f\n", __func__, p->SRExitTime);
-		dml2_printf("DML::%s: SRExitZ8Time = %f\n", __func__, p->SRExitZ8Time);
-		dml2_printf("DML::%s: StutterPeriod = %f\n", __func__, *p->StutterPeriod);
+		DML_LOG_VERBOSE("DML::%s: SRExitTime = %f\n", __func__, p->SRExitTime);
+		DML_LOG_VERBOSE("DML::%s: SRExitZ8Time = %f\n", __func__, p->SRExitZ8Time);
+		DML_LOG_VERBOSE("DML::%s: StutterPeriod = %f\n", __func__, *p->StutterPeriod);
 #endif
 		*p->StutterEfficiencyNotIncludingVBlank = math_max2(0., 1 - (p->SRExitTime + l->StutterBurstTime) / *p->StutterPeriod) * 100;
 		*p->Z8StutterEfficiencyNotIncludingVBlank = math_max2(0., 1 - (p->SRExitZ8Time + l->StutterBurstTime) / *p->StutterPeriod) * 100;
@@ -10339,11 +10260,11 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 		*p->Z8NumberOfStutterBurstsPerFrame = 0;
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: VActiveTimeCriticalSurface = %f\n", __func__, l->VActiveTimeCriticalSurface);
-	dml2_printf("DML::%s: StutterEfficiencyNotIncludingVBlank = %f\n", __func__, *p->StutterEfficiencyNotIncludingVBlank);
-	dml2_printf("DML::%s: Z8StutterEfficiencyNotIncludingVBlank = %f\n", __func__, *p->Z8StutterEfficiencyNotIncludingVBlank);
-	dml2_printf("DML::%s: NumberOfStutterBurstsPerFrame = %u\n", __func__, *p->NumberOfStutterBurstsPerFrame);
-	dml2_printf("DML::%s: Z8NumberOfStutterBurstsPerFrame = %u\n", __func__, *p->Z8NumberOfStutterBurstsPerFrame);
+	DML_LOG_VERBOSE("DML::%s: VActiveTimeCriticalSurface = %f\n", __func__, l->VActiveTimeCriticalSurface);
+	DML_LOG_VERBOSE("DML::%s: StutterEfficiencyNotIncludingVBlank = %f\n", __func__, *p->StutterEfficiencyNotIncludingVBlank);
+	DML_LOG_VERBOSE("DML::%s: Z8StutterEfficiencyNotIncludingVBlank = %f\n", __func__, *p->Z8StutterEfficiencyNotIncludingVBlank);
+	DML_LOG_VERBOSE("DML::%s: NumberOfStutterBurstsPerFrame = %u\n", __func__, *p->NumberOfStutterBurstsPerFrame);
+	DML_LOG_VERBOSE("DML::%s: Z8NumberOfStutterBurstsPerFrame = %u\n", __func__, *p->Z8NumberOfStutterBurstsPerFrame);
 #endif
 
 	if (*p->StutterEfficiencyNotIncludingVBlank > 0) {
@@ -10358,7 +10279,7 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	}
 
 	if (*p->Z8StutterEfficiencyNotIncludingVBlank > 0) {
-		LastZ8StutterPeriod = l->VActiveTimeCriticalSurface - (*p->Z8NumberOfStutterBurstsPerFrame - 1) * *p->StutterPeriod;
+		//LastZ8StutterPeriod = l->VActiveTimeCriticalSurface - (*p->Z8NumberOfStutterBurstsPerFrame - 1) * *p->StutterPeriod;
 		if (!((p->SynchronizeTimings || TotalNumberOfActiveOTG == 1) && SameTiming)) {
 			*p->Z8StutterEfficiency = *p->Z8StutterEfficiencyNotIncludingVBlank;
 		} else {
@@ -10370,25 +10291,25 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: TotalNumberOfActiveOTG = %u\n", __func__, TotalNumberOfActiveOTG);
-	dml2_printf("DML::%s: SameTiming = %u\n", __func__, SameTiming);
-	dml2_printf("DML::%s: SynchronizeTimings = %u\n", __func__, p->SynchronizeTimings);
-	dml2_printf("DML::%s: LastZ8StutterPeriod = %f\n", __func__, LastZ8StutterPeriod);
-	dml2_printf("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n", __func__, p->Z8StutterEnterPlusExitWatermark);
-	dml2_printf("DML::%s: StutterBurstTime = %f\n", __func__, l->StutterBurstTime);
-	dml2_printf("DML::%s: StutterPeriod = %f\n", __func__, *p->StutterPeriod);
-	dml2_printf("DML::%s: StutterEfficiency = %f\n", __func__, *p->StutterEfficiency);
-	dml2_printf("DML::%s: Z8StutterEfficiency = %f\n", __func__, *p->Z8StutterEfficiency);
-	dml2_printf("DML::%s: StutterEfficiencyNotIncludingVBlank = %f\n", __func__, *p->StutterEfficiencyNotIncludingVBlank);
-	dml2_printf("DML::%s: Z8NumberOfStutterBurstsPerFrame = %u\n", __func__, *p->Z8NumberOfStutterBurstsPerFrame);
+	DML_LOG_VERBOSE("DML::%s: TotalNumberOfActiveOTG = %u\n", __func__, TotalNumberOfActiveOTG);
+	DML_LOG_VERBOSE("DML::%s: SameTiming = %u\n", __func__, SameTiming);
+	DML_LOG_VERBOSE("DML::%s: SynchronizeTimings = %u\n", __func__, p->SynchronizeTimings);
+	DML_LOG_VERBOSE("DML::%s: LastZ8StutterPeriod = %f\n", __func__, *p->Z8StutterEfficiencyNotIncludingVBlank > 0 ? l->VActiveTimeCriticalSurface - (*p->Z8NumberOfStutterBurstsPerFrame - 1) * *p->StutterPeriod : 0);
+	DML_LOG_VERBOSE("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n", __func__, p->Z8StutterEnterPlusExitWatermark);
+	DML_LOG_VERBOSE("DML::%s: StutterBurstTime = %f\n", __func__, l->StutterBurstTime);
+	DML_LOG_VERBOSE("DML::%s: StutterPeriod = %f\n", __func__, *p->StutterPeriod);
+	DML_LOG_VERBOSE("DML::%s: StutterEfficiency = %f\n", __func__, *p->StutterEfficiency);
+	DML_LOG_VERBOSE("DML::%s: Z8StutterEfficiency = %f\n", __func__, *p->Z8StutterEfficiency);
+	DML_LOG_VERBOSE("DML::%s: StutterEfficiencyNotIncludingVBlank = %f\n", __func__, *p->StutterEfficiencyNotIncludingVBlank);
+	DML_LOG_VERBOSE("DML::%s: Z8NumberOfStutterBurstsPerFrame = %u\n", __func__, *p->Z8NumberOfStutterBurstsPerFrame);
 #endif
 
 	*p->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = !(!p->UnboundedRequestEnabled && (p->NumberOfActiveSurfaces == 1) && l->SinglePlaneCriticalSurface && l->SinglePipeCriticalSurface);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: DETBufferSizeYCriticalSurface = %u\n", __func__, l->DETBufferSizeYCriticalSurface);
-	dml2_printf("DML::%s: PixelChunkSizeInKByte = %u\n", __func__, p->PixelChunkSizeInKByte);
-	dml2_printf("DML::%s: DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = %u\n", __func__, *p->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
+	DML_LOG_VERBOSE("DML::%s: DETBufferSizeYCriticalSurface = %u\n", __func__, l->DETBufferSizeYCriticalSurface);
+	DML_LOG_VERBOSE("DML::%s: PixelChunkSizeInKByte = %u\n", __func__, p->PixelChunkSizeInKByte);
+	DML_LOG_VERBOSE("DML::%s: DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE = %u\n", __func__, *p->DCHUBBUB_ARB_CSTATE_MAX_CAP_MODE);
 #endif
 }
 
@@ -10422,7 +10343,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	double max_uclk_mhz = 0;
 	double min_return_latency_in_DCFCLK_cycles = 0;
 
-	dml2_printf("DML::%s: --- START --- \n", __func__);
+	DML_LOG_VERBOSE("DML::%s: --- START --- \n", __func__);
 
 	memset(&mode_lib->scratch, 0, sizeof(struct dml2_core_internal_scratch));
 	memset(&mode_lib->mp, 0, sizeof(struct dml2_core_internal_mode_program));
@@ -10444,13 +10365,13 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
-		DML2_ASSERT(cfg_support_info->stream_support_info[stream_index].odms_used <= 4);
-		DML2_ASSERT(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 4 ||
+		DML_ASSERT(cfg_support_info->stream_support_info[stream_index].odms_used <= 4);
+		DML_ASSERT(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 4 ||
 					cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 2 ||
 					cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
 
 		if (cfg_support_info->stream_support_info[stream_index].odms_used > 1)
-			DML2_ASSERT(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
+			DML_ASSERT(cfg_support_info->stream_support_info[stream_index].num_odm_output_segments == 1);
 
 		switch (cfg_support_info->stream_support_info[stream_index].odms_used) {
 		case (4):
@@ -10476,51 +10397,51 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	for (k = 0; k < s->num_active_planes; ++k) {
 		mode_lib->mp.NoOfDPP[k] = cfg_support_info->plane_support_info[k].dpps_used;
 		mode_lib->mp.Dppclk[k] = programming->plane_programming[k].min_clocks.dcn4x.dppclk_khz / 1000.0;
-		DML2_ASSERT(mode_lib->mp.Dppclk[k] > 0);
+		DML_ASSERT(mode_lib->mp.Dppclk[k] > 0);
 	}
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		unsigned int stream_index = display_cfg->plane_descriptors[k].stream_index;
 		mode_lib->mp.DSCCLK[k] = programming->stream_programming[stream_index].min_clocks.dcn4x.dscclk_khz / 1000.0;
-		dml2_printf("DML::%s: k=%d stream_index=%d, mode_lib->mp.DSCCLK = %f\n", __func__, k, stream_index, mode_lib->mp.DSCCLK[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d stream_index=%d, mode_lib->mp.DSCCLK = %f\n", __func__, k, stream_index, mode_lib->mp.DSCCLK[k]);
 	}
 
 	mode_lib->mp.Dispclk = programming->min_clocks.dcn4x.dispclk_khz / 1000.0;
 	mode_lib->mp.DCFCLKDeepSleep = programming->min_clocks.dcn4x.deepsleep_dcfclk_khz / 1000.0;
 
-	DML2_ASSERT(mode_lib->mp.Dcfclk > 0);
-	DML2_ASSERT(mode_lib->mp.FabricClock > 0);
-	DML2_ASSERT(mode_lib->mp.dram_bw_mbps > 0);
-	DML2_ASSERT(mode_lib->mp.uclk_freq_mhz > 0);
-	DML2_ASSERT(mode_lib->mp.GlobalDPPCLK > 0);
-	DML2_ASSERT(mode_lib->mp.Dispclk > 0);
-	DML2_ASSERT(mode_lib->mp.DCFCLKDeepSleep > 0);
-	DML2_ASSERT(s->SOCCLK > 0);
-
-#ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: num_active_planes = %u\n", __func__, s->num_active_planes);
-	dml2_printf("DML::%s: num_active_pipes = %u\n", __func__, mode_lib->mp.num_active_pipes);
-	dml2_printf("DML::%s: Dcfclk = %f\n", __func__, mode_lib->mp.Dcfclk);
-	dml2_printf("DML::%s: FabricClock = %f\n", __func__, mode_lib->mp.FabricClock);
-	dml2_printf("DML::%s: dram_bw_mbps = %f\n", __func__, mode_lib->mp.dram_bw_mbps);
-	dml2_printf("DML::%s: uclk_freq_mhz = %f\n", __func__, mode_lib->mp.uclk_freq_mhz);
-	dml2_printf("DML::%s: Dispclk = %f\n", __func__, mode_lib->mp.Dispclk);
+	DML_ASSERT(mode_lib->mp.Dcfclk > 0);
+	DML_ASSERT(mode_lib->mp.FabricClock > 0);
+	DML_ASSERT(mode_lib->mp.dram_bw_mbps > 0);
+	DML_ASSERT(mode_lib->mp.uclk_freq_mhz > 0);
+	DML_ASSERT(mode_lib->mp.GlobalDPPCLK > 0);
+	DML_ASSERT(mode_lib->mp.Dispclk > 0);
+	DML_ASSERT(mode_lib->mp.DCFCLKDeepSleep > 0);
+	DML_ASSERT(s->SOCCLK > 0);
+
+#ifdef __DML_VBA_DEBUG__
+	DML_LOG_VERBOSE("DML::%s: num_active_planes = %u\n", __func__, s->num_active_planes);
+	DML_LOG_VERBOSE("DML::%s: num_active_pipes = %u\n", __func__, mode_lib->mp.num_active_pipes);
+	DML_LOG_VERBOSE("DML::%s: Dcfclk = %f\n", __func__, mode_lib->mp.Dcfclk);
+	DML_LOG_VERBOSE("DML::%s: FabricClock = %f\n", __func__, mode_lib->mp.FabricClock);
+	DML_LOG_VERBOSE("DML::%s: dram_bw_mbps = %f\n", __func__, mode_lib->mp.dram_bw_mbps);
+	DML_LOG_VERBOSE("DML::%s: uclk_freq_mhz = %f\n", __func__, mode_lib->mp.uclk_freq_mhz);
+	DML_LOG_VERBOSE("DML::%s: Dispclk = %f\n", __func__, mode_lib->mp.Dispclk);
 	for (k = 0; k < s->num_active_planes; ++k) {
-		dml2_printf("DML::%s: Dppclk[%0d] = %f\n", __func__, k, mode_lib->mp.Dppclk[k]);
-	}
-	dml2_printf("DML::%s: GlobalDPPCLK = %f\n", __func__, mode_lib->mp.GlobalDPPCLK);
-	dml2_printf("DML::%s: DCFCLKDeepSleep = %f\n", __func__, mode_lib->mp.DCFCLKDeepSleep);
-	dml2_printf("DML::%s: SOCCLK = %f\n", __func__, s->SOCCLK);
-	dml2_printf("DML::%s: min_clk_index = %0d\n", __func__, in_out_params->min_clk_index);
-	dml2_printf("DML::%s: min_clk_table min_fclk_khz = %d\n", __func__, min_clk_table->dram_bw_table.entries[in_out_params->min_clk_index].min_fclk_khz);
-	dml2_printf("DML::%s: min_clk_table uclk_mhz = %f\n", __func__, dram_bw_kbps_to_uclk_mhz(min_clk_table->dram_bw_table.entries[in_out_params->min_clk_index].pre_derate_dram_bw_kbps, &mode_lib->soc.clk_table.dram_config));
+		DML_LOG_VERBOSE("DML::%s: Dppclk[%0d] = %f\n", __func__, k, mode_lib->mp.Dppclk[k]);
+	}
+	DML_LOG_VERBOSE("DML::%s: GlobalDPPCLK = %f\n", __func__, mode_lib->mp.GlobalDPPCLK);
+	DML_LOG_VERBOSE("DML::%s: DCFCLKDeepSleep = %f\n", __func__, mode_lib->mp.DCFCLKDeepSleep);
+	DML_LOG_VERBOSE("DML::%s: SOCCLK = %f\n", __func__, s->SOCCLK);
+	DML_LOG_VERBOSE("DML::%s: min_clk_index = %0d\n", __func__, in_out_params->min_clk_index);
+	DML_LOG_VERBOSE("DML::%s: min_clk_table min_fclk_khz = %ld\n", __func__, min_clk_table->dram_bw_table.entries[in_out_params->min_clk_index].min_fclk_khz);
+	DML_LOG_VERBOSE("DML::%s: min_clk_table uclk_mhz = %f\n", __func__, dram_bw_kbps_to_uclk_mhz(min_clk_table->dram_bw_table.entries[in_out_params->min_clk_index].pre_derate_dram_bw_kbps, &mode_lib->soc.clk_table.dram_config));
 	for (k = 0; k < mode_lib->mp.num_active_pipes; ++k) {
-		dml2_printf("DML::%s: pipe=%d is in plane=%d\n", __func__, k, mode_lib->mp.pipe_plane[k]);
-		dml2_printf("DML::%s: Per-plane DPPPerSurface[%0d] = %d\n", __func__, k, mode_lib->mp.NoOfDPP[k]);
+		DML_LOG_VERBOSE("DML::%s: pipe=%d is in plane=%d\n", __func__, k, mode_lib->mp.pipe_plane[k]);
+		DML_LOG_VERBOSE("DML::%s: Per-plane DPPPerSurface[%0d] = %d\n", __func__, k, mode_lib->mp.NoOfDPP[k]);
 	}
 
 	for (k = 0; k < s->num_active_planes; k++)
-		dml2_printf("DML::%s: plane_%d: reserved_vblank_time_ns = %u\n", __func__, k, display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
+		DML_LOG_VERBOSE("DML::%s: plane_%d: reserved_vblank_time_ns = %lu\n", __func__, k, display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
 #endif
 
 	CalculateMaxDETAndMinCompressedBufferSize(
@@ -10617,8 +10538,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000));
 		mode_lib->mp.vactive_sw_bw_l[k] = mode_lib->mp.SwathWidthSingleDPPY[k] * mode_lib->mp.BytePerPixelY[k] / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
 		mode_lib->mp.vactive_sw_bw_c[k] = mode_lib->mp.SwathWidthSingleDPPC[k] * mode_lib->mp.BytePerPixelC[k] / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
-		dml2_printf("DML::%s: vactive_sw_bw_l[%i] = %fBps\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
-		dml2_printf("DML::%s: vactive_sw_bw_c[%i] = %fBps\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
+		DML_LOG_VERBOSE("DML::%s: vactive_sw_bw_l[%i] = %fBps\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
+		DML_LOG_VERBOSE("DML::%s: vactive_sw_bw_c[%i] = %fBps\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
 	}
 
 	CalculateSwathAndDETConfiguration_params->display_cfg = display_cfg;
@@ -11173,8 +11094,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			mode_lib->mp.WritebackDelay[k]);
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
-		dml2_printf("DML::%s: k=%u WritebackDelay = %f\n", __func__, k, mode_lib->mp.WritebackDelay[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%u WritebackDelay = %f\n", __func__, k, mode_lib->mp.WritebackDelay[k]);
 #endif
 	}
 
@@ -11183,7 +11104,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		s->immediate_flip_required = s->immediate_flip_required || display_cfg->plane_descriptors[k].immediate_flip;
 	}
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: immediate_flip_required = %u\n", __func__, s->immediate_flip_required);
+	DML_LOG_VERBOSE("DML::%s: immediate_flip_required = %u\n", __func__, s->immediate_flip_required);
 #endif
 
 	if (s->num_active_planes > 1) {
@@ -11219,12 +11140,12 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		s->DestinationLineTimesForPrefetchLessThan2 = false;
 		s->VRatioPrefetchMoreThanMax = false;
 
-		dml2_printf("DML::%s: Start one iteration of prefetch schedule evaluation\n", __func__);
+		DML_LOG_VERBOSE("DML::%s: Start one iteration of prefetch schedule evaluation\n", __func__);
 
 		for (k = 0; k < s->num_active_planes; ++k) {
 			struct dml2_core_internal_DmlPipe *myPipe = &s->myPipe;
 
-			dml2_printf("DML::%s: k=%d MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%d MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
 			mode_lib->mp.TWait[k] = CalculateTWait(
 					display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns,
 					mode_lib->mp.UrgentLatency,
@@ -11261,7 +11182,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			myPipe->ProgressiveToInterlaceUnitInOPP = mode_lib->ip.ptoi_supported;
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: Calling CalculatePrefetchSchedule for k=%u\n", __func__, k);
+			DML_LOG_VERBOSE("DML::%s: Calling CalculatePrefetchSchedule for k=%u\n", __func__, k);
 #endif
 			CalculatePrefetchSchedule_params->display_cfg = display_cfg;
 			CalculatePrefetchSchedule_params->HostVMInefficiencyFactor = s->HostVMInefficiencyFactorPrefetch;
@@ -11356,7 +11277,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				mode_lib->mp.impacted_prefetch_margin_us[k] = 0;
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%0u NoTimeToPrefetch=%0d\n", __func__, k, mode_lib->mp.NoTimeToPrefetch[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%0u NoTimeToPrefetch=%0d\n", __func__, k, mode_lib->mp.NoTimeToPrefetch[k]);
 #endif
 			mode_lib->mp.VStartupMin[k] = s->MaxVStartupLines[k];
 		} // for k
@@ -11366,9 +11287,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			if (mode_lib->mp.NoTimeToPrefetch[k] == true ||
 				mode_lib->mp.NotEnoughTimeForDynamicMetadata[k] ||
 				mode_lib->mp.DSTYAfterScaler[k] > 8) {
-				dml2_printf("DML::%s: k=%u, NoTimeToPrefetch = %0d\n", __func__, k, mode_lib->mp.NoTimeToPrefetch[k]);
-				dml2_printf("DML::%s: k=%u, NotEnoughTimeForDynamicMetadata=%u\n", __func__, k, mode_lib->mp.NotEnoughTimeForDynamicMetadata[k]);
-				dml2_printf("DML::%s: k=%u, DSTYAfterScaler=%u (should be <= 0)\n", __func__, k, mode_lib->mp.DSTYAfterScaler[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u, NoTimeToPrefetch = %0d\n", __func__, k, mode_lib->mp.NoTimeToPrefetch[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u, NotEnoughTimeForDynamicMetadata=%u\n", __func__, k, mode_lib->mp.NotEnoughTimeForDynamicMetadata[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u, DSTYAfterScaler=%u (should be <= 0)\n", __func__, k, mode_lib->mp.DSTYAfterScaler[k]);
 				mode_lib->mp.PrefetchModeSupported = false;
 			}
 			if (mode_lib->mp.dst_y_prefetch[k] < 2)
@@ -11377,24 +11298,24 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			if (mode_lib->mp.VRatioPrefetchY[k] > __DML2_CALCS_MAX_VRATIO_PRE__ ||
 				mode_lib->mp.VRatioPrefetchC[k] > __DML2_CALCS_MAX_VRATIO_PRE__) {
 				s->VRatioPrefetchMoreThanMax = true;
-				dml2_printf("DML::%s: k=%d, VRatioPrefetchY=%f (should not be < %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchY[k], __DML2_CALCS_MAX_VRATIO_PRE__);
-				dml2_printf("DML::%s: k=%d, VRatioPrefetchC=%f (should not be < %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchC[k], __DML2_CALCS_MAX_VRATIO_PRE__);
-				dml2_printf("DML::%s: VRatioPrefetchMoreThanMax = %u\n", __func__, s->VRatioPrefetchMoreThanMax);
+				DML_LOG_VERBOSE("DML::%s: k=%d, VRatioPrefetchY=%f (should not be < %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchY[k], __DML2_CALCS_MAX_VRATIO_PRE__);
+				DML_LOG_VERBOSE("DML::%s: k=%d, VRatioPrefetchC=%f (should not be < %f)\n", __func__, k, mode_lib->mp.VRatioPrefetchC[k], __DML2_CALCS_MAX_VRATIO_PRE__);
+				DML_LOG_VERBOSE("DML::%s: VRatioPrefetchMoreThanMax = %u\n", __func__, s->VRatioPrefetchMoreThanMax);
 			}
 
 			if (mode_lib->mp.NotEnoughUrgentLatencyHiding[k]) {
-				dml2_printf("DML::%s: k=%u, NotEnoughUrgentLatencyHiding = %u\n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHiding[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%u, NotEnoughUrgentLatencyHiding = %u\n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHiding[k]);
 				mode_lib->mp.PrefetchModeSupported = false;
 			}
 		}
 
 		if (s->VRatioPrefetchMoreThanMax == true || s->DestinationLineTimesForPrefetchLessThan2 == true) {
-			dml2_printf("DML::%s: VRatioPrefetchMoreThanMax = %u\n", __func__, s->VRatioPrefetchMoreThanMax);
-			dml2_printf("DML::%s: DestinationLineTimesForPrefetchLessThan2 = %u\n", __func__, s->DestinationLineTimesForPrefetchLessThan2);
+			DML_LOG_VERBOSE("DML::%s: VRatioPrefetchMoreThanMax = %u\n", __func__, s->VRatioPrefetchMoreThanMax);
+			DML_LOG_VERBOSE("DML::%s: DestinationLineTimesForPrefetchLessThan2 = %u\n", __func__, s->DestinationLineTimesForPrefetchLessThan2);
 			mode_lib->mp.PrefetchModeSupported = false;
 		}
 
-		dml2_printf("DML::%s: Prefetch schedule is %sOK at vstartup = %u\n", __func__,
+		DML_LOG_VERBOSE("DML::%s: Prefetch schedule is %sOK at vstartup = %u\n", __func__,
 			mode_lib->mp.PrefetchModeSupported ? "" : "NOT ", CalculatePrefetchSchedule_params->VStartup);
 
 		// Prefetch schedule OK, now check prefetch bw
@@ -11422,24 +11343,24 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 					&mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]);
 
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: k=%0u DPPPerSurface=%u\n", __func__, k, mode_lib->mp.NoOfDPP[k]);
-				dml2_printf("DML::%s: k=%0u UrgentBurstFactorLuma=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorLuma[k]);
-				dml2_printf("DML::%s: k=%0u UrgentBurstFactorChroma=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorChroma[k]);
-				dml2_printf("DML::%s: k=%0u UrgentBurstFactorLumaPre=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorLumaPre[k]);
-				dml2_printf("DML::%s: k=%0u UrgentBurstFactorChromaPre=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorChromaPre[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u DPPPerSurface=%u\n", __func__, k, mode_lib->mp.NoOfDPP[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u UrgentBurstFactorLuma=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorLuma[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u UrgentBurstFactorChroma=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorChroma[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u UrgentBurstFactorLumaPre=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorLumaPre[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u UrgentBurstFactorChromaPre=%f\n", __func__, k, mode_lib->mp.UrgentBurstFactorChromaPre[k]);
 
-				dml2_printf("DML::%s: k=%0u VRatioPrefetchY=%f\n", __func__, k, mode_lib->mp.VRatioPrefetchY[k]);
-				dml2_printf("DML::%s: k=%0u VRatioY=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
+				DML_LOG_VERBOSE("DML::%s: k=%0u VRatioPrefetchY=%f\n", __func__, k, mode_lib->mp.VRatioPrefetchY[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u VRatioY=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
 
-				dml2_printf("DML::%s: k=%0u prefetch_vmrow_bw=%f\n", __func__, k, mode_lib->mp.prefetch_vmrow_bw[k]);
-				dml2_printf("DML::%s: k=%0u vactive_sw_bw_l=%f\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
-				dml2_printf("DML::%s: k=%0u vactive_sw_bw_c=%f\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
-				dml2_printf("DML::%s: k=%0u cursor_bw=%f\n", __func__, k, mode_lib->mp.cursor_bw[k]);
-				dml2_printf("DML::%s: k=%0u dpte_row_bw=%f\n", __func__, k, mode_lib->mp.dpte_row_bw[k]);
-				dml2_printf("DML::%s: k=%0u meta_row_bw=%f\n", __func__, k, mode_lib->mp.meta_row_bw[k]);
-				dml2_printf("DML::%s: k=%0u RequiredPrefetchPixelDataBWLuma=%f\n", __func__, k, mode_lib->mp.RequiredPrefetchPixelDataBWLuma[k]);
-				dml2_printf("DML::%s: k=%0u RequiredPrefetchPixelDataBWChroma=%f\n", __func__, k, mode_lib->mp.RequiredPrefetchPixelDataBWChroma[k]);
-				dml2_printf("DML::%s: k=%0u prefetch_cursor_bw=%f\n", __func__, k, mode_lib->mp.prefetch_cursor_bw[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u prefetch_vmrow_bw=%f\n", __func__, k, mode_lib->mp.prefetch_vmrow_bw[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u vactive_sw_bw_l=%f\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u vactive_sw_bw_c=%f\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u cursor_bw=%f\n", __func__, k, mode_lib->mp.cursor_bw[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u dpte_row_bw=%f\n", __func__, k, mode_lib->mp.dpte_row_bw[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u meta_row_bw=%f\n", __func__, k, mode_lib->mp.meta_row_bw[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u RequiredPrefetchPixelDataBWLuma=%f\n", __func__, k, mode_lib->mp.RequiredPrefetchPixelDataBWLuma[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u RequiredPrefetchPixelDataBWChroma=%f\n", __func__, k, mode_lib->mp.RequiredPrefetchPixelDataBWChroma[k]);
+				DML_LOG_VERBOSE("DML::%s: k=%0u prefetch_cursor_bw=%f\n", __func__, k, mode_lib->mp.prefetch_cursor_bw[k]);
 #endif
 			}
 
@@ -11503,11 +11424,11 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				mode_lib->mp.urg_bandwidth_available);
 
 			if (!mode_lib->mp.PrefetchModeSupported)
-				dml2_printf("DML::%s: Bandwidth not sufficient for prefetch!\n", __func__);
+				DML_LOG_VERBOSE("DML::%s: Bandwidth not sufficient for prefetch!\n", __func__);
 
 			for (k = 0; k < s->num_active_planes; ++k) {
 				if (mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]) {
-					dml2_printf("DML::%s: k=%u, NotEnoughUrgentLatencyHidingPre = %u\n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]);
+					DML_LOG_VERBOSE("DML::%s: k=%u, NotEnoughUrgentLatencyHidingPre = %u\n", __func__, k, mode_lib->mp.NotEnoughUrgentLatencyHidingPre[k]);
 					mode_lib->mp.PrefetchModeSupported = false;
 				}
 			}
@@ -11533,12 +11454,12 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				}
 				mode_lib->mp.TotImmediateFlipBytes += s->per_pipe_flip_bytes[k] * mode_lib->mp.NoOfDPP[k];
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML::%s: k = %u\n", __func__, k);
-				dml2_printf("DML::%s: DPPPerSurface = %u\n", __func__, mode_lib->mp.NoOfDPP[k]);
-				dml2_printf("DML::%s: vm_bytes = %u\n", __func__, mode_lib->mp.vm_bytes[k]);
-				dml2_printf("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, mode_lib->mp.PixelPTEBytesPerRow[k]);
-				dml2_printf("DML::%s: meta_row_bytes = %u\n", __func__, mode_lib->mp.meta_row_bytes[k]);
-				dml2_printf("DML::%s: TotImmediateFlipBytes = %u\n", __func__, mode_lib->mp.TotImmediateFlipBytes);
+				DML_LOG_VERBOSE("DML::%s: k = %u\n", __func__, k);
+				DML_LOG_VERBOSE("DML::%s: DPPPerSurface = %u\n", __func__, mode_lib->mp.NoOfDPP[k]);
+				DML_LOG_VERBOSE("DML::%s: vm_bytes = %u\n", __func__, mode_lib->mp.vm_bytes[k]);
+				DML_LOG_VERBOSE("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, mode_lib->mp.PixelPTEBytesPerRow[k]);
+				DML_LOG_VERBOSE("DML::%s: meta_row_bytes = %u\n", __func__, mode_lib->mp.meta_row_bytes[k]);
+				DML_LOG_VERBOSE("DML::%s: TotImmediateFlipBytes = %u\n", __func__, mode_lib->mp.TotImmediateFlipBytes);
 #endif
 			}
 			for (k = 0; k < s->num_active_planes; ++k) {
@@ -11631,13 +11552,13 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				mode_lib->mp.urg_bandwidth_available);
 
 			if (!mode_lib->mp.ImmediateFlipSupported)
-				dml2_printf("DML::%s: Bandwidth not sufficient for flip!", __func__);
+				DML_LOG_VERBOSE("DML::%s: Bandwidth not sufficient for flip!", __func__);
 
 			for (k = 0; k < s->num_active_planes; ++k) {
 				if (display_cfg->plane_descriptors[k].immediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] == false) {
 					mode_lib->mp.ImmediateFlipSupported = false;
 #ifdef __DML_VBA_DEBUG__
-					dml2_printf("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
+					DML_LOG_VERBOSE("DML::%s: Pipe %0d not supporting iflip!\n", __func__, k);
 #endif
 				}
 			}
@@ -11650,28 +11571,28 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		mode_lib->mp.PrefetchAndImmediateFlipSupported = (mode_lib->mp.PrefetchModeSupported == true && (!must_support_iflip || mode_lib->mp.ImmediateFlipSupported));
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: PrefetchModeSupported = %u\n", __func__, mode_lib->mp.PrefetchModeSupported);
+		DML_LOG_VERBOSE("DML::%s: PrefetchModeSupported = %u\n", __func__, mode_lib->mp.PrefetchModeSupported);
 		for (k = 0; k < s->num_active_planes; ++k)
-			dml2_printf("DML::%s: immediate_flip_required[%u] = %u\n", __func__, k, display_cfg->plane_descriptors[k].immediate_flip);
-		dml2_printf("DML::%s: HostVMEnable = %u\n", __func__, display_cfg->hostvm_enable);
-		dml2_printf("DML::%s: ImmediateFlipSupported = %u\n", __func__, mode_lib->mp.ImmediateFlipSupported);
-		dml2_printf("DML::%s: PrefetchAndImmediateFlipSupported = %u\n", __func__, mode_lib->mp.PrefetchAndImmediateFlipSupported);
+			DML_LOG_VERBOSE("DML::%s: immediate_flip_required[%u] = %u\n", __func__, k, display_cfg->plane_descriptors[k].immediate_flip);
+		DML_LOG_VERBOSE("DML::%s: HostVMEnable = %u\n", __func__, display_cfg->hostvm_enable);
+		DML_LOG_VERBOSE("DML::%s: ImmediateFlipSupported = %u\n", __func__, mode_lib->mp.ImmediateFlipSupported);
+		DML_LOG_VERBOSE("DML::%s: PrefetchAndImmediateFlipSupported = %u\n", __func__, mode_lib->mp.PrefetchAndImmediateFlipSupported);
 #endif
-		dml2_printf("DML::%s: Done one iteration: k=%d, MaxVStartupLines=%u\n", __func__, k, s->MaxVStartupLines[k]);
+		DML_LOG_VERBOSE("DML::%s: Done one iteration: k=%d, MaxVStartupLines=%u\n", __func__, k, s->MaxVStartupLines[k]);
 	}
 
 	for (k = 0; k < s->num_active_planes; ++k)
-		dml2_printf("DML::%s: k=%d MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
 
 	if (!mode_lib->mp.PrefetchAndImmediateFlipSupported) {
-		dml2_printf("DML::%s: Bad, Prefetch and flip scheduling solution NOT found!\n", __func__);
+		DML_LOG_VERBOSE("DML::%s: Bad, Prefetch and flip scheduling solution NOT found!\n", __func__);
 	} else {
-		dml2_printf("DML::%s: Good, Prefetch and flip scheduling solution found\n", __func__);
+		DML_LOG_VERBOSE("DML::%s: Good, Prefetch and flip scheduling solution found\n", __func__);
 
 		// DCC Configuration
 		for (k = 0; k < s->num_active_planes; ++k) {
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: Calculate DCC configuration for surface k=%u\n", __func__, k);
+			DML_LOG_VERBOSE("DML::%s: Calculate DCC configuration for surface k=%u\n", __func__, k);
 #endif
 			CalculateDCCConfiguration(
 				display_cfg->plane_descriptors[k].surface.dcc.enable,
@@ -11780,8 +11701,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 
 		calculate_pstate_keepout_dst_lines(display_cfg, &mode_lib->mp.Watermark, mode_lib->mp.pstate_keepout_dst_lines);
 
-		dml2_printf("DML::%s: DEBUG stream_index = %0d\n", __func__, display_cfg->plane_descriptors[0].stream_index);
-		dml2_printf("DML::%s: DEBUG PixelClock = %d kHz\n", __func__, (display_cfg->stream_descriptors[display_cfg->plane_descriptors[0].stream_index].timing.pixel_clock_khz));
+		DML_LOG_VERBOSE("DML::%s: DEBUG stream_index = %0d\n", __func__, display_cfg->plane_descriptors[0].stream_index);
+		DML_LOG_VERBOSE("DML::%s: DEBUG PixelClock = %ld kHz\n", __func__, (display_cfg->stream_descriptors[display_cfg->plane_descriptors[0].stream_index].timing.pixel_clock_khz));
 
 		//Display Pipeline Delivery Time in Prefetch, Groups
 		CalculatePixelDeliveryTimes(
@@ -11893,15 +11814,15 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				mode_lib->mp.MinTTUVBlank[k] = mode_lib->mp.TCalc + mode_lib->mp.MinTTUVBlank[k];
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, MinTTUVBlank = %f (before vstartup margin)\n", __func__, k, mode_lib->mp.MinTTUVBlank[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, MinTTUVBlank = %f (before vstartup margin)\n", __func__, k, mode_lib->mp.MinTTUVBlank[k]);
 #endif
 			s->Tvstartup_margin = (s->MaxVStartupLines[k] - mode_lib->mp.VStartupMin[k]) * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
 			mode_lib->mp.MinTTUVBlank[k] = mode_lib->mp.MinTTUVBlank[k] + s->Tvstartup_margin;
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, Tvstartup_margin = %f\n", __func__, k, s->Tvstartup_margin);
-			dml2_printf("DML::%s: k=%u, MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
-			dml2_printf("DML::%s: k=%u, MinTTUVBlank = %f\n", __func__, k, mode_lib->mp.MinTTUVBlank[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, Tvstartup_margin = %f\n", __func__, k, s->Tvstartup_margin);
+			DML_LOG_VERBOSE("DML::%s: k=%u, MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, MinTTUVBlank = %f\n", __func__, k, mode_lib->mp.MinTTUVBlank[k]);
 #endif
 
 			mode_lib->mp.Tdmdl[k] = mode_lib->mp.Tdmdl[k] + s->Tvstartup_margin;
@@ -11920,9 +11841,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			s->blank_lines_remaining = (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total - display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active) - mode_lib->mp.VStartup[k];
 
 			if (s->blank_lines_remaining < 0) {
-				dml2_printf("ERROR: Vstartup is larger than vblank!?\n");
+				DML_LOG_VERBOSE("ERROR: Vstartup is larger than vblank!?\n");
 				s->blank_lines_remaining = 0;
-				DML2_ASSERT(0);
+				DML_ASSERT(0);
 			}
 			mode_lib->mp.MIN_DST_Y_NEXT_START[k] = s->dlg_vblank_start + s->blank_lines_remaining + s->LSetup;
 
@@ -11936,18 +11857,18 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k] = false;
 			}
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, VStartup = %u (max)\n", __func__, k, mode_lib->mp.VStartup[k]);
-			dml2_printf("DML::%s: k=%u, VStartupMin = %u (max)\n", __func__, k, mode_lib->mp.VStartupMin[k]);
-			dml2_printf("DML::%s: k=%u, VUpdateOffsetPix = %u\n", __func__, k, mode_lib->mp.VUpdateOffsetPix[k]);
-			dml2_printf("DML::%s: k=%u, VUpdateWidthPix = %u\n", __func__, k, mode_lib->mp.VUpdateWidthPix[k]);
-			dml2_printf("DML::%s: k=%u, VReadyOffsetPix = %u\n", __func__, k, mode_lib->mp.VReadyOffsetPix[k]);
-			dml2_printf("DML::%s: k=%u, HTotal = %u\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total);
-			dml2_printf("DML::%s: k=%u, VTotal = %u\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total);
-			dml2_printf("DML::%s: k=%u, VActive = %u\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active);
-			dml2_printf("DML::%s: k=%u, VFrontPorch = %u\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_front_porch);
-			dml2_printf("DML::%s: k=%u, TSetup = %f\n", __func__, k, mode_lib->mp.TSetup[k]);
-			dml2_printf("DML::%s: k=%u, MIN_DST_Y_NEXT_START = %f\n", __func__, k, mode_lib->mp.MIN_DST_Y_NEXT_START[k]);
-			dml2_printf("DML::%s: k=%u, VREADY_AT_OR_AFTER_VSYNC = %u\n", __func__, k, mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VStartup = %u (max)\n", __func__, k, mode_lib->mp.VStartup[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VStartupMin = %u (max)\n", __func__, k, mode_lib->mp.VStartupMin[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VUpdateOffsetPix = %u\n", __func__, k, mode_lib->mp.VUpdateOffsetPix[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VUpdateWidthPix = %u\n", __func__, k, mode_lib->mp.VUpdateWidthPix[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VReadyOffsetPix = %u\n", __func__, k, mode_lib->mp.VReadyOffsetPix[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, HTotal = %lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VTotal = %lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_total);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VActive = %lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_active);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VFrontPorch = %lu\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.v_front_porch);
+			DML_LOG_VERBOSE("DML::%s: k=%u, TSetup = %f\n", __func__, k, mode_lib->mp.TSetup[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, MIN_DST_Y_NEXT_START = %f\n", __func__, k, mode_lib->mp.MIN_DST_Y_NEXT_START[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, VREADY_AT_OR_AFTER_VSYNC = %u\n", __func__, k, mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[k]);
 #endif
 		}
 
@@ -11969,9 +11890,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		for (k = 0; k < s->num_active_planes; ++k) {
 			mode_lib->mp.TotalDataReadBandwidth = mode_lib->mp.TotalDataReadBandwidth + mode_lib->mp.vactive_sw_bw_l[k] + mode_lib->mp.vactive_sw_bw_c[k];
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML::%s: k=%u, TotalDataReadBandwidth = %f\n", __func__, k, mode_lib->mp.TotalDataReadBandwidth);
-			dml2_printf("DML::%s: k=%u, vactive_sw_bw_l = %f\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
-			dml2_printf("DML::%s: k=%u, vactive_sw_bw_c = %f\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, TotalDataReadBandwidth = %f\n", __func__, k, mode_lib->mp.TotalDataReadBandwidth);
+			DML_LOG_VERBOSE("DML::%s: k=%u, vactive_sw_bw_l = %f\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
+			DML_LOG_VERBOSE("DML::%s: k=%u, vactive_sw_bw_c = %f\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
 #endif
 		}
 
@@ -12051,28 +11972,28 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	min_return_latency_in_DCFCLK_cycles = (min_return_uclk_cycles / max_uclk_mhz + min_return_fclk_cycles / max_fclk_mhz) * hard_minimum_dcfclk_mhz;
 	mode_lib->mp.min_return_latency_in_dcfclk = (unsigned int)min_return_latency_in_DCFCLK_cycles;
 	mode_lib->mp.dcfclk_deep_sleep_hysteresis = (unsigned int)math_max2(32, (double)mode_lib->ip.pixel_chunk_size_kbytes * 1024 * 3 / 4 / 64 - min_return_latency_in_DCFCLK_cycles);
-	DML2_ASSERT(mode_lib->mp.dcfclk_deep_sleep_hysteresis < 256);
+	DML_ASSERT(mode_lib->mp.dcfclk_deep_sleep_hysteresis < 256);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: max_fclk_mhz = %f\n", __func__, max_fclk_mhz);
-	dml2_printf("DML::%s: max_uclk_mhz = %f\n", __func__, max_uclk_mhz);
-	dml2_printf("DML::%s: hard_minimum_dcfclk_mhz = %f\n", __func__, hard_minimum_dcfclk_mhz);
-	dml2_printf("DML::%s: min_return_uclk_cycles = %d\n", __func__, min_return_uclk_cycles);
-	dml2_printf("DML::%s: min_return_fclk_cycles = %d\n", __func__, min_return_fclk_cycles);
-	dml2_printf("DML::%s: min_return_latency_in_DCFCLK_cycles = %f\n", __func__, min_return_latency_in_DCFCLK_cycles);
-	dml2_printf("DML::%s: dcfclk_deep_sleep_hysteresis = %d \n", __func__, mode_lib->mp.dcfclk_deep_sleep_hysteresis);
-	dml2_printf("DML::%s: --- END --- \n", __func__);
+	DML_LOG_VERBOSE("DML::%s: max_fclk_mhz = %f\n", __func__, max_fclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: max_uclk_mhz = %f\n", __func__, max_uclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: hard_minimum_dcfclk_mhz = %f\n", __func__, hard_minimum_dcfclk_mhz);
+	DML_LOG_VERBOSE("DML::%s: min_return_uclk_cycles = %ld\n", __func__, min_return_uclk_cycles);
+	DML_LOG_VERBOSE("DML::%s: min_return_fclk_cycles = %ld\n", __func__, min_return_fclk_cycles);
+	DML_LOG_VERBOSE("DML::%s: min_return_latency_in_DCFCLK_cycles = %f\n", __func__, min_return_latency_in_DCFCLK_cycles);
+	DML_LOG_VERBOSE("DML::%s: dcfclk_deep_sleep_hysteresis = %d \n", __func__, mode_lib->mp.dcfclk_deep_sleep_hysteresis);
+	DML_LOG_VERBOSE("DML::%s: --- END --- \n", __func__);
 #endif
 	return (in_out_params->mode_lib->mp.PrefetchAndImmediateFlipSupported);
 }
 
 bool dml2_core_calcs_mode_programming_ex(struct dml2_core_calcs_mode_programming_ex *in_out_params)
 {
-	dml2_printf("DML::%s: ------------- START ----------\n", __func__);
+	DML_LOG_VERBOSE("DML::%s: ------------- START ----------\n", __func__);
 	bool result = dml_core_mode_programming(in_out_params);
 
-	dml2_printf("DML::%s: result = %0d\n", __func__, result);
-	dml2_printf("DML::%s: ------------- DONE ----------\n", __func__);
+	DML_LOG_VERBOSE("DML::%s: result = %0d\n", __func__, result);
+	DML_LOG_VERBOSE("DML::%s: ------------- DONE ----------\n", __func__);
 	return result;
 }
 
@@ -12130,16 +12051,16 @@ void dml2_core_calcs_get_dpte_row_height(
 	unsigned int MacroTileHeight		= is_plane1 ? MacroTileHeightC : MacroTileHeightY;
 	unsigned int PTEBufferSizeInRequests = is_plane1 ? mode_lib->ip.dpte_buffer_size_in_pte_reqs_chroma : mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma;
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML: %s: is_plane1 = %u\n", __func__, is_plane1);
-	dml2_printf("DML: %s: BytePerPixel = %u\n", __func__, BytePerPixel);
-	dml2_printf("DML: %s: BlockHeight256Bytes = %u\n", __func__, BlockHeight256Bytes);
-	dml2_printf("DML: %s: BlockWidth256Bytes = %u\n", __func__, BlockWidth256Bytes);
-	dml2_printf("DML: %s: MacroTileWidth = %u\n", __func__, MacroTileWidth);
-	dml2_printf("DML: %s: MacroTileHeight = %u\n", __func__, MacroTileHeight);
-	dml2_printf("DML: %s: PTEBufferSizeInRequests = %u\n", __func__, PTEBufferSizeInRequests);
-	dml2_printf("DML: %s: dpte_buffer_size_in_pte_reqs_luma = %u\n", __func__, mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma);
-	dml2_printf("DML: %s: dpte_buffer_size_in_pte_reqs_chroma = %u\n", __func__, mode_lib->ip.dpte_buffer_size_in_pte_reqs_chroma);
-	dml2_printf("DML: %s: GPUVMMinPageSizeKBytes = %u\n", __func__, GPUVMMinPageSizeKBytes);
+	DML_LOG_VERBOSE("DML: %s: is_plane1 = %u\n", __func__, is_plane1);
+	DML_LOG_VERBOSE("DML: %s: BytePerPixel = %u\n", __func__, BytePerPixel);
+	DML_LOG_VERBOSE("DML: %s: BlockHeight256Bytes = %u\n", __func__, BlockHeight256Bytes);
+	DML_LOG_VERBOSE("DML: %s: BlockWidth256Bytes = %u\n", __func__, BlockWidth256Bytes);
+	DML_LOG_VERBOSE("DML: %s: MacroTileWidth = %u\n", __func__, MacroTileWidth);
+	DML_LOG_VERBOSE("DML: %s: MacroTileHeight = %u\n", __func__, MacroTileHeight);
+	DML_LOG_VERBOSE("DML: %s: PTEBufferSizeInRequests = %u\n", __func__, PTEBufferSizeInRequests);
+	DML_LOG_VERBOSE("DML: %s: dpte_buffer_size_in_pte_reqs_luma = %u\n", __func__, mode_lib->ip.dpte_buffer_size_in_pte_reqs_luma);
+	DML_LOG_VERBOSE("DML: %s: dpte_buffer_size_in_pte_reqs_chroma = %u\n", __func__, mode_lib->ip.dpte_buffer_size_in_pte_reqs_chroma);
+	DML_LOG_VERBOSE("DML: %s: GPUVMMinPageSizeKBytes = %u\n", __func__, GPUVMMinPageSizeKBytes);
 #endif
 	unsigned int dummy_integer[21];
 
@@ -12193,7 +12114,7 @@ void dml2_core_calcs_get_dpte_row_height(
 	CalculateVMAndRowBytes(&mode_lib->scratch.calculate_vm_and_row_bytes_params);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML: %s: dpte_row_height = %u\n", __func__, *dpte_row_height);
+	DML_LOG_VERBOSE("DML: %s: dpte_row_height = %u\n", __func__, *dpte_row_height);
 #endif
 }
 
@@ -12220,6 +12141,8 @@ static void rq_dlg_get_wm_regs(const struct dml2_display_cfg *display_cfg, const
 	wm_regs->fclk_pstate = (int unsigned)(mode_lib->mp.Watermark.FCLKChangeWatermark * refclk_freq_in_mhz);
 	wm_regs->sr_enter = (int unsigned)(mode_lib->mp.Watermark.StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
 	wm_regs->sr_exit = (int unsigned)(mode_lib->mp.Watermark.StutterExitWatermark * refclk_freq_in_mhz);
+	wm_regs->sr_enter_z8 = (int unsigned)(mode_lib->mp.Watermark.Z8StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
+	wm_regs->sr_exit_z8 = (int unsigned)(mode_lib->mp.Watermark.Z8StutterExitWatermark * refclk_freq_in_mhz);
 	wm_regs->temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.temp_read_or_ppt_watermark_us * refclk_freq_in_mhz);
 	wm_regs->uclk_pstate = (int unsigned)(mode_lib->mp.Watermark.DRAMClockChangeWatermark * refclk_freq_in_mhz);
 	wm_regs->urgent = (int unsigned)(mode_lib->mp.Watermark.UrgentWatermark * refclk_freq_in_mhz);
@@ -12246,11 +12169,11 @@ void dml2_core_calcs_cursor_dlg_reg(struct dml2_cursor_dlg_regs *cursor_dlg_regs
 	cursor_dlg_regs->dst_x_offset = (unsigned int) ((dst_x_offset > 0) ? dst_x_offset : 0);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML_DLG::%s: cursor_x_position=%d\n", __func__, p->cursor_x_position);
-	dml2_printf("DML_DLG::%s: dlg_refclk_mhz=%f\n", __func__, p->dlg_refclk_mhz);
-	dml2_printf("DML_DLG::%s: pixel_rate_mhz=%f\n", __func__, p->pixel_rate_mhz);
-	dml2_printf("DML_DLG::%s: dst_x_offset=%d\n", __func__, dst_x_offset);
-	dml2_printf("DML_DLG::%s: dst_x_offset=%d (reg)\n", __func__, cursor_dlg_regs->dst_x_offset);
+	DML_LOG_VERBOSE("DML_DLG::%s: cursor_x_position=%d\n", __func__, p->cursor_x_position);
+	DML_LOG_VERBOSE("DML_DLG::%s: dlg_refclk_mhz=%f\n", __func__, p->dlg_refclk_mhz);
+	DML_LOG_VERBOSE("DML_DLG::%s: pixel_rate_mhz=%f\n", __func__, p->pixel_rate_mhz);
+	DML_LOG_VERBOSE("DML_DLG::%s: dst_x_offset=%d\n", __func__, dst_x_offset);
+	DML_LOG_VERBOSE("DML_DLG::%s: dst_x_offset=%d (reg)\n", __func__, cursor_dlg_regs->dst_x_offset);
 #endif
 
 	cursor_dlg_regs->chunk_hdl_adjust = 3;
@@ -12286,7 +12209,7 @@ static void rq_dlg_get_rq_reg(struct dml2_display_rq_regs *rq_regs,
 	double stored_swath_c_bytes;
 	bool is_phantom_pipe;
 
-	dml2_printf("DML_DLG::%s: Calculation for pipe[%d] start\n", __func__, pipe_idx);
+	DML_LOG_VERBOSE("DML_DLG::%s: Calculation for pipe[%d] start\n", __func__, pipe_idx);
 
 	pixel_chunk_bytes = (unsigned int)(mode_lib->ip.pixel_chunk_size_kbytes * 1024);
 	min_pixel_chunk_bytes = (unsigned int)(mode_lib->ip.min_pixel_chunk_size_bytes);
@@ -12329,19 +12252,19 @@ static void rq_dlg_get_rq_reg(struct dml2_display_rq_regs *rq_regs,
 	if (sw_mode == dml2_sw_linear && display_cfg->gpuvm_enable) {
 		unsigned int p0_pte_row_height_linear = (unsigned int)(dml_get_dpte_row_height_linear_l(mode_lib, pipe_idx));
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML_DLG: %s: p0_pte_row_height_linear = %u\n", __func__, p0_pte_row_height_linear);
+		DML_LOG_VERBOSE("DML_DLG: %s: p0_pte_row_height_linear = %u\n", __func__, p0_pte_row_height_linear);
 #endif
-		DML2_ASSERT(p0_pte_row_height_linear >= 8);
+		DML_ASSERT(p0_pte_row_height_linear >= 8);
 
 		rq_regs->rq_regs_l.pte_row_height_linear = math_log2_approx(p0_pte_row_height_linear) - 3;
 		if (dual_plane) {
 			unsigned int p1_pte_row_height_linear = (unsigned int)(dml_get_dpte_row_height_linear_c(mode_lib, pipe_idx));
 
 #ifdef __DML_VBA_DEBUG__
-			dml2_printf("DML_DLG: %s: p1_pte_row_height_linear = %u\n", __func__, p1_pte_row_height_linear);
+			DML_LOG_VERBOSE("DML_DLG: %s: p1_pte_row_height_linear = %u\n", __func__, p1_pte_row_height_linear);
 #endif
 			if (sw_mode == dml2_sw_linear) {
-				DML2_ASSERT(p1_pte_row_height_linear >= 8);
+				DML_ASSERT(p1_pte_row_height_linear >= 8);
 			}
 			rq_regs->rq_regs_c.pte_row_height_linear = math_log2_approx(p1_pte_row_height_linear) - 3;
 		}
@@ -12375,12 +12298,12 @@ static void rq_dlg_get_rq_reg(struct dml2_display_rq_regs *rq_regs,
 			if (stored_swath_l_bytes / stored_swath_c_bytes <= 1.5) {
 				detile_buf_plane1_addr = (unsigned int)(detile_buf_size_in_bytes / 2.0 / 1024.0); // half to chroma
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML_DLG: %s: detile_buf_plane1_addr = %d (1/2 to chroma)\n", __func__, detile_buf_plane1_addr);
+				DML_LOG_VERBOSE("DML_DLG: %s: detile_buf_plane1_addr = %d (1/2 to chroma)\n", __func__, detile_buf_plane1_addr);
 #endif
 			} else {
 				detile_buf_plane1_addr = (unsigned int)(dml_round_to_multiple((unsigned int)((2.0 * detile_buf_size_in_bytes) / 3.0), 1024, 0) / 1024.0); // 2/3 to luma
 #ifdef __DML_VBA_DEBUG__
-				dml2_printf("DML_DLG: %s: detile_buf_plane1_addr = %d (1/3 chroma)\n", __func__, detile_buf_plane1_addr);
+				DML_LOG_VERBOSE("DML_DLG: %s: detile_buf_plane1_addr = %d (1/3 chroma)\n", __func__, detile_buf_plane1_addr);
 #endif
 			}
 		}
@@ -12388,15 +12311,15 @@ static void rq_dlg_get_rq_reg(struct dml2_display_rq_regs *rq_regs,
 	rq_regs->plane1_base_address = detile_buf_plane1_addr;
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML_DLG: %s: is_phantom_pipe = %d\n", __func__, is_phantom_pipe);
-	dml2_printf("DML_DLG: %s: stored_swath_l_bytes = %f\n", __func__, stored_swath_l_bytes);
-	dml2_printf("DML_DLG: %s: stored_swath_c_bytes = %f\n", __func__, stored_swath_c_bytes);
-	dml2_printf("DML_DLG: %s: detile_buf_size_in_bytes = %d\n", __func__, detile_buf_size_in_bytes);
-	dml2_printf("DML_DLG: %s: detile_buf_plane1_addr = %d\n", __func__, detile_buf_plane1_addr);
-	dml2_printf("DML_DLG: %s: plane1_base_address = %d\n", __func__, rq_regs->plane1_base_address);
+	DML_LOG_VERBOSE("DML_DLG: %s: is_phantom_pipe = %d\n", __func__, is_phantom_pipe);
+	DML_LOG_VERBOSE("DML_DLG: %s: stored_swath_l_bytes = %f\n", __func__, stored_swath_l_bytes);
+	DML_LOG_VERBOSE("DML_DLG: %s: stored_swath_c_bytes = %f\n", __func__, stored_swath_c_bytes);
+	DML_LOG_VERBOSE("DML_DLG: %s: detile_buf_size_in_bytes = %d\n", __func__, detile_buf_size_in_bytes);
+	DML_LOG_VERBOSE("DML_DLG: %s: detile_buf_plane1_addr = %d\n", __func__, detile_buf_plane1_addr);
+	DML_LOG_VERBOSE("DML_DLG: %s: plane1_base_address = %d\n", __func__, rq_regs->plane1_base_address);
 #endif
-	//dml2_printf_rq_regs_st(rq_regs);
-	dml2_printf("DML_DLG::%s: Calculation for pipe[%d] done\n", __func__, pipe_idx);
+	//DML_LOG_VERBOSE_rq_regs_st(rq_regs);
+	DML_LOG_VERBOSE("DML_DLG::%s: Calculation for pipe[%d] done\n", __func__, pipe_idx);
 }
 
 static void rq_dlg_get_dlg_reg(
@@ -12411,10 +12334,10 @@ static void rq_dlg_get_dlg_reg(
 
 	memset(l, 0, sizeof(struct dml2_core_shared_rq_dlg_get_dlg_reg_locals));
 
-	dml2_printf("DML_DLG::%s: Calculation for pipe_idx=%d\n", __func__, pipe_idx);
+	DML_LOG_VERBOSE("DML_DLG::%s: Calculation for pipe_idx=%d\n", __func__, pipe_idx);
 
 	l->plane_idx = dml_get_plane_idx(mode_lib, pipe_idx);
-	DML2_ASSERT(l->plane_idx < DML2_MAX_PLANES);
+	DML_ASSERT(l->plane_idx < DML2_MAX_PLANES);
 
 	l->source_format = dml2_444_8;
 	l->odm_mode = dml2_odm_mode_bypass;
@@ -12444,18 +12367,18 @@ static void rq_dlg_get_dlg_reg(
 		l->pclk_freq_in_mhz = (double)l->timing->pixel_clock_khz / 1000;
 		l->ref_freq_to_pix_freq = l->refclk_freq_in_mhz / l->pclk_freq_in_mhz;
 
-		dml2_printf("DML_DLG::%s: plane_idx = %d\n", __func__, l->plane_idx);
-		dml2_printf("DML_DLG: %s: htotal = %d\n", __func__, l->htotal);
-		dml2_printf("DML_DLG: %s: refclk_freq_in_mhz = %3.2f\n", __func__, l->refclk_freq_in_mhz);
-		dml2_printf("DML_DLG: %s: dlg_ref_clk_mhz = %3.2f\n", __func__, display_cfg->overrides.hw.dlg_ref_clk_mhz);
-		dml2_printf("DML_DLG: %s: soc.refclk_mhz = %3.2f\n", __func__, mode_lib->soc.dchub_refclk_mhz);
-		dml2_printf("DML_DLG: %s: pclk_freq_in_mhz = %3.2f\n", __func__, l->pclk_freq_in_mhz);
-		dml2_printf("DML_DLG: %s: ref_freq_to_pix_freq = %3.2f\n", __func__, l->ref_freq_to_pix_freq);
-		dml2_printf("DML_DLG: %s: interlaced = %d\n", __func__, l->interlaced);
+		DML_LOG_VERBOSE("DML_DLG::%s: plane_idx = %d\n", __func__, l->plane_idx);
+		DML_LOG_VERBOSE("DML_DLG: %s: htotal = %d\n", __func__, l->htotal);
+		DML_LOG_VERBOSE("DML_DLG: %s: refclk_freq_in_mhz = %3.2f\n", __func__, l->refclk_freq_in_mhz);
+		DML_LOG_VERBOSE("DML_DLG: %s: dlg_ref_clk_mhz = %3.2f\n", __func__, display_cfg->overrides.hw.dlg_ref_clk_mhz);
+		DML_LOG_VERBOSE("DML_DLG: %s: soc.refclk_mhz = %d\n", __func__, mode_lib->soc.dchub_refclk_mhz);
+		DML_LOG_VERBOSE("DML_DLG: %s: pclk_freq_in_mhz = %3.2f\n", __func__, l->pclk_freq_in_mhz);
+		DML_LOG_VERBOSE("DML_DLG: %s: ref_freq_to_pix_freq = %3.2f\n", __func__, l->ref_freq_to_pix_freq);
+		DML_LOG_VERBOSE("DML_DLG: %s: interlaced = %d\n", __func__, l->interlaced);
 
-		DML2_ASSERT(l->refclk_freq_in_mhz != 0);
-		DML2_ASSERT(l->pclk_freq_in_mhz != 0);
-		DML2_ASSERT(l->ref_freq_to_pix_freq < 4.0);
+		DML_ASSERT(l->refclk_freq_in_mhz != 0);
+		DML_ASSERT(l->pclk_freq_in_mhz != 0);
+		DML_ASSERT(l->ref_freq_to_pix_freq < 4.0);
 
 		// Need to figure out which side of odm combine we're in
 		// Assume the pipe instance under the same plane is in order
@@ -12484,14 +12407,14 @@ static void rq_dlg_get_dlg_reg(
 			l->pipe_idx_in_combine = pipe_idx - l->first_pipe_idx_in_plane; // DML assumes the pipes in the same plane will have continuous indexing (i.e. plane 0 use pipe 0, 1, and plane 1 uses pipe 2, 3, etc.)
 
 			disp_dlg_regs->refcyc_h_blank_end = (unsigned int)(((double)l->hblank_end + (double)l->pipe_idx_in_combine * (double)l->hactive / (double)l->odm_combine_factor) * l->ref_freq_to_pix_freq);
-			dml2_printf("DML_DLG: %s: pipe_idx = %d\n", __func__, pipe_idx);
-			dml2_printf("DML_DLG: %s: first_pipe_idx_in_plane = %d\n", __func__, l->first_pipe_idx_in_plane);
-			dml2_printf("DML_DLG: %s: pipe_idx_in_combine = %d\n", __func__, l->pipe_idx_in_combine);
-			dml2_printf("DML_DLG: %s: odm_combine_factor = %d\n", __func__, l->odm_combine_factor);
+			DML_LOG_VERBOSE("DML_DLG: %s: pipe_idx = %d\n", __func__, pipe_idx);
+			DML_LOG_VERBOSE("DML_DLG: %s: first_pipe_idx_in_plane = %d\n", __func__, l->first_pipe_idx_in_plane);
+			DML_LOG_VERBOSE("DML_DLG: %s: pipe_idx_in_combine = %d\n", __func__, l->pipe_idx_in_combine);
+			DML_LOG_VERBOSE("DML_DLG: %s: odm_combine_factor = %d\n", __func__, l->odm_combine_factor);
 		}
-		dml2_printf("DML_DLG: %s: refcyc_h_blank_end = %d\n", __func__, disp_dlg_regs->refcyc_h_blank_end);
+		DML_LOG_VERBOSE("DML_DLG: %s: refcyc_h_blank_end = %d\n", __func__, disp_dlg_regs->refcyc_h_blank_end);
 
-		DML2_ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)math_pow(2, 13));
+		DML_ASSERT(disp_dlg_regs->refcyc_h_blank_end < (unsigned int)math_pow(2, 13));
 
 		disp_dlg_regs->ref_freq_to_pix_freq = (unsigned int)(l->ref_freq_to_pix_freq * math_pow(2, 19));
 		disp_dlg_regs->refcyc_per_htotal = (unsigned int)(l->ref_freq_to_pix_freq * (double)l->htotal * math_pow(2, 8));
@@ -12500,20 +12423,20 @@ static void rq_dlg_get_dlg_reg(
 		l->min_ttu_vblank = mode_lib->mp.MinTTUVBlank[mode_lib->mp.pipe_plane[pipe_idx]];
 		l->min_dst_y_next_start = (unsigned int)(mode_lib->mp.MIN_DST_Y_NEXT_START[mode_lib->mp.pipe_plane[pipe_idx]]);
 
-		dml2_printf("DML_DLG: %s: min_ttu_vblank (us) = %3.2f\n", __func__, l->min_ttu_vblank);
-		dml2_printf("DML_DLG: %s: min_dst_y_next_start = %d\n", __func__, l->min_dst_y_next_start);
-		dml2_printf("DML_DLG: %s: ref_freq_to_pix_freq = %3.2f\n", __func__, l->ref_freq_to_pix_freq);
+		DML_LOG_VERBOSE("DML_DLG: %s: min_ttu_vblank (us) = %3.2f\n", __func__, l->min_ttu_vblank);
+		DML_LOG_VERBOSE("DML_DLG: %s: min_dst_y_next_start = %d\n", __func__, l->min_dst_y_next_start);
+		DML_LOG_VERBOSE("DML_DLG: %s: ref_freq_to_pix_freq = %3.2f\n", __func__, l->ref_freq_to_pix_freq);
 
 		l->vready_after_vcount0 = (unsigned int)(mode_lib->mp.VREADY_AT_OR_AFTER_VSYNC[mode_lib->mp.pipe_plane[pipe_idx]]);
 		disp_dlg_regs->vready_after_vcount0 = l->vready_after_vcount0;
 
-		dml2_printf("DML_DLG: %s: vready_after_vcount0 = %d\n", __func__, disp_dlg_regs->vready_after_vcount0);
+		DML_LOG_VERBOSE("DML_DLG: %s: vready_after_vcount0 = %d\n", __func__, disp_dlg_regs->vready_after_vcount0);
 
 		l->dst_x_after_scaler = (unsigned int)(mode_lib->mp.DSTXAfterScaler[mode_lib->mp.pipe_plane[pipe_idx]]);
 		l->dst_y_after_scaler = (unsigned int)(mode_lib->mp.DSTYAfterScaler[mode_lib->mp.pipe_plane[pipe_idx]]);
 
-		dml2_printf("DML_DLG: %s: dst_x_after_scaler = %d\n", __func__, l->dst_x_after_scaler);
-		dml2_printf("DML_DLG: %s: dst_y_after_scaler = %d\n", __func__, l->dst_y_after_scaler);
+		DML_LOG_VERBOSE("DML_DLG: %s: dst_x_after_scaler = %d\n", __func__, l->dst_x_after_scaler);
+		DML_LOG_VERBOSE("DML_DLG: %s: dst_y_after_scaler = %d\n", __func__, l->dst_y_after_scaler);
 
 		l->dst_y_prefetch = mode_lib->mp.dst_y_prefetch[mode_lib->mp.pipe_plane[pipe_idx]];
 		l->dst_y_per_vm_vblank = mode_lib->mp.dst_y_per_vm_vblank[mode_lib->mp.pipe_plane[pipe_idx]];
@@ -12521,28 +12444,28 @@ static void rq_dlg_get_dlg_reg(
 		l->dst_y_per_vm_flip = mode_lib->mp.dst_y_per_vm_flip[mode_lib->mp.pipe_plane[pipe_idx]];
 		l->dst_y_per_row_flip = mode_lib->mp.dst_y_per_row_flip[mode_lib->mp.pipe_plane[pipe_idx]];
 
-		dml2_printf("DML_DLG: %s: dst_y_prefetch (after rnd) = %3.2f\n", __func__, l->dst_y_prefetch);
-		dml2_printf("DML_DLG: %s: dst_y_per_vm_flip = %3.2f\n", __func__, l->dst_y_per_vm_flip);
-		dml2_printf("DML_DLG: %s: dst_y_per_row_flip = %3.2f\n", __func__, l->dst_y_per_row_flip);
-		dml2_printf("DML_DLG: %s: dst_y_per_vm_vblank = %3.2f\n", __func__, l->dst_y_per_vm_vblank);
-		dml2_printf("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, l->dst_y_per_row_vblank);
+		DML_LOG_VERBOSE("DML_DLG: %s: dst_y_prefetch (after rnd) = %3.2f\n", __func__, l->dst_y_prefetch);
+		DML_LOG_VERBOSE("DML_DLG: %s: dst_y_per_vm_flip = %3.2f\n", __func__, l->dst_y_per_vm_flip);
+		DML_LOG_VERBOSE("DML_DLG: %s: dst_y_per_row_flip = %3.2f\n", __func__, l->dst_y_per_row_flip);
+		DML_LOG_VERBOSE("DML_DLG: %s: dst_y_per_vm_vblank = %3.2f\n", __func__, l->dst_y_per_vm_vblank);
+		DML_LOG_VERBOSE("DML_DLG: %s: dst_y_per_row_vblank = %3.2f\n", __func__, l->dst_y_per_row_vblank);
 
 		if (l->dst_y_prefetch > 0 && l->dst_y_per_vm_vblank > 0 && l->dst_y_per_row_vblank > 0) {
-			DML2_ASSERT(l->dst_y_prefetch > (l->dst_y_per_vm_vblank + l->dst_y_per_row_vblank));
+			DML_ASSERT(l->dst_y_prefetch > (l->dst_y_per_vm_vblank + l->dst_y_per_row_vblank));
 		}
 
 		l->vratio_pre_l = mode_lib->mp.VRatioPrefetchY[mode_lib->mp.pipe_plane[pipe_idx]];
 		l->vratio_pre_c = mode_lib->mp.VRatioPrefetchC[mode_lib->mp.pipe_plane[pipe_idx]];
 
-		dml2_printf("DML_DLG: %s: vratio_pre_l = %3.2f\n", __func__, l->vratio_pre_l);
-		dml2_printf("DML_DLG: %s: vratio_pre_c = %3.2f\n", __func__, l->vratio_pre_c);
+		DML_LOG_VERBOSE("DML_DLG: %s: vratio_pre_l = %3.2f\n", __func__, l->vratio_pre_l);
+		DML_LOG_VERBOSE("DML_DLG: %s: vratio_pre_c = %3.2f\n", __func__, l->vratio_pre_c);
 
 		// Active
 		l->refcyc_per_line_delivery_pre_l = mode_lib->mp.DisplayPipeLineDeliveryTimeLumaPrefetch[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz;
 		l->refcyc_per_line_delivery_l = mode_lib->mp.DisplayPipeLineDeliveryTimeLuma[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz;
 
-		dml2_printf("DML_DLG: %s: refcyc_per_line_delivery_pre_l = %3.2f\n", __func__, l->refcyc_per_line_delivery_pre_l);
-		dml2_printf("DML_DLG: %s: refcyc_per_line_delivery_l = %3.2f\n", __func__, l->refcyc_per_line_delivery_l);
+		DML_LOG_VERBOSE("DML_DLG: %s: refcyc_per_line_delivery_pre_l = %3.2f\n", __func__, l->refcyc_per_line_delivery_pre_l);
+		DML_LOG_VERBOSE("DML_DLG: %s: refcyc_per_line_delivery_l = %3.2f\n", __func__, l->refcyc_per_line_delivery_l);
 
 		l->refcyc_per_line_delivery_pre_c = 0.0;
 		l->refcyc_per_line_delivery_c = 0.0;
@@ -12551,8 +12474,8 @@ static void rq_dlg_get_dlg_reg(
 			l->refcyc_per_line_delivery_pre_c = mode_lib->mp.DisplayPipeLineDeliveryTimeChromaPrefetch[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz;
 			l->refcyc_per_line_delivery_c = mode_lib->mp.DisplayPipeLineDeliveryTimeChroma[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz;
 
-			dml2_printf("DML_DLG: %s: refcyc_per_line_delivery_pre_c = %3.2f\n", __func__, l->refcyc_per_line_delivery_pre_c);
-			dml2_printf("DML_DLG: %s: refcyc_per_line_delivery_c = %3.2f\n", __func__, l->refcyc_per_line_delivery_c);
+			DML_LOG_VERBOSE("DML_DLG: %s: refcyc_per_line_delivery_pre_c = %3.2f\n", __func__, l->refcyc_per_line_delivery_pre_c);
+			DML_LOG_VERBOSE("DML_DLG: %s: refcyc_per_line_delivery_c = %3.2f\n", __func__, l->refcyc_per_line_delivery_c);
 		}
 
 		disp_dlg_regs->refcyc_per_vm_dmdata = (unsigned int)(mode_lib->mp.Tdmdl_vm[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz);
@@ -12561,8 +12484,8 @@ static void rq_dlg_get_dlg_reg(
 		l->refcyc_per_req_delivery_pre_l = mode_lib->mp.DisplayPipeRequestDeliveryTimeLumaPrefetch[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz;
 		l->refcyc_per_req_delivery_l = mode_lib->mp.DisplayPipeRequestDeliveryTimeLuma[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz;
 
-		dml2_printf("DML_DLG: %s: refcyc_per_req_delivery_pre_l = %3.2f\n", __func__, l->refcyc_per_req_delivery_pre_l);
-		dml2_printf("DML_DLG: %s: refcyc_per_req_delivery_l = %3.2f\n", __func__, l->refcyc_per_req_delivery_l);
+		DML_LOG_VERBOSE("DML_DLG: %s: refcyc_per_req_delivery_pre_l = %3.2f\n", __func__, l->refcyc_per_req_delivery_pre_l);
+		DML_LOG_VERBOSE("DML_DLG: %s: refcyc_per_req_delivery_l = %3.2f\n", __func__, l->refcyc_per_req_delivery_l);
 
 		l->refcyc_per_req_delivery_pre_c = 0.0;
 		l->refcyc_per_req_delivery_c = 0.0;
@@ -12570,16 +12493,16 @@ static void rq_dlg_get_dlg_reg(
 			l->refcyc_per_req_delivery_pre_c = mode_lib->mp.DisplayPipeRequestDeliveryTimeChromaPrefetch[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz;
 			l->refcyc_per_req_delivery_c = mode_lib->mp.DisplayPipeRequestDeliveryTimeChroma[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz;
 
-			dml2_printf("DML_DLG: %s: refcyc_per_req_delivery_pre_c = %3.2f\n", __func__, l->refcyc_per_req_delivery_pre_c);
-			dml2_printf("DML_DLG: %s: refcyc_per_req_delivery_c = %3.2f\n", __func__, l->refcyc_per_req_delivery_c);
+			DML_LOG_VERBOSE("DML_DLG: %s: refcyc_per_req_delivery_pre_c = %3.2f\n", __func__, l->refcyc_per_req_delivery_pre_c);
+			DML_LOG_VERBOSE("DML_DLG: %s: refcyc_per_req_delivery_c = %3.2f\n", __func__, l->refcyc_per_req_delivery_c);
 		}
 
 		// TTU - Cursor
-		DML2_ASSERT(display_cfg->plane_descriptors[l->plane_idx].cursor.num_cursors <= 1);
+		DML_ASSERT(display_cfg->plane_descriptors[l->plane_idx].cursor.num_cursors <= 1);
 
 		// Assign to register structures
 		disp_dlg_regs->min_dst_y_next_start = (unsigned int)((double)l->min_dst_y_next_start * math_pow(2, 2));
-		DML2_ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int)math_pow(2, 18));
+		DML_ASSERT(disp_dlg_regs->min_dst_y_next_start < (unsigned int)math_pow(2, 18));
 
 		disp_dlg_regs->dst_y_after_scaler = l->dst_y_after_scaler; // in terms of line
 		disp_dlg_regs->refcyc_x_after_scaler = (unsigned int)((double)l->dst_x_after_scaler * l->ref_freq_to_pix_freq); // in terms of refclk
@@ -12592,10 +12515,10 @@ static void rq_dlg_get_dlg_reg(
 		disp_dlg_regs->vratio_prefetch = (unsigned int)(l->vratio_pre_l * math_pow(2, 19));
 		disp_dlg_regs->vratio_prefetch_c = (unsigned int)(l->vratio_pre_c * math_pow(2, 19));
 
-		dml2_printf("DML_DLG: %s: disp_dlg_regs->dst_y_per_vm_vblank = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_vm_vblank);
-		dml2_printf("DML_DLG: %s: disp_dlg_regs->dst_y_per_row_vblank = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_row_vblank);
-		dml2_printf("DML_DLG: %s: disp_dlg_regs->dst_y_per_vm_flip = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_vm_flip);
-		dml2_printf("DML_DLG: %s: disp_dlg_regs->dst_y_per_row_flip = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_row_flip);
+		DML_LOG_VERBOSE("DML_DLG: %s: disp_dlg_regs->dst_y_per_vm_vblank = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_vm_vblank);
+		DML_LOG_VERBOSE("DML_DLG: %s: disp_dlg_regs->dst_y_per_row_vblank = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_row_vblank);
+		DML_LOG_VERBOSE("DML_DLG: %s: disp_dlg_regs->dst_y_per_vm_flip = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_vm_flip);
+		DML_LOG_VERBOSE("DML_DLG: %s: disp_dlg_regs->dst_y_per_row_flip = 0x%x\n", __func__, disp_dlg_regs->dst_y_per_row_flip);
 
 		disp_dlg_regs->refcyc_per_vm_group_vblank = (unsigned int)(mode_lib->mp.TimePerVMGroupVBlank[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz);
 		disp_dlg_regs->refcyc_per_vm_group_flip = (unsigned int)(mode_lib->mp.TimePerVMGroupFlip[mode_lib->mp.pipe_plane[pipe_idx]] * l->refclk_freq_in_mhz);
@@ -12662,11 +12585,11 @@ static void rq_dlg_get_dlg_reg(
 		disp_ttu_regs->qos_ramp_disable_c = 0;
 		disp_ttu_regs->min_ttu_vblank = (unsigned int)(l->min_ttu_vblank * l->refclk_freq_in_mhz);
 
-		// CHECK for HW registers' range, DML2_ASSERT or clamp
-		DML2_ASSERT(l->refcyc_per_req_delivery_pre_l < math_pow(2, 13));
-		DML2_ASSERT(l->refcyc_per_req_delivery_l < math_pow(2, 13));
-		DML2_ASSERT(l->refcyc_per_req_delivery_pre_c < math_pow(2, 13));
-		DML2_ASSERT(l->refcyc_per_req_delivery_c < math_pow(2, 13));
+		// CHECK for HW registers' range, DML_ASSERT or clamp
+		DML_ASSERT(l->refcyc_per_req_delivery_pre_l < math_pow(2, 13));
+		DML_ASSERT(l->refcyc_per_req_delivery_l < math_pow(2, 13));
+		DML_ASSERT(l->refcyc_per_req_delivery_pre_c < math_pow(2, 13));
+		DML_ASSERT(l->refcyc_per_req_delivery_c < math_pow(2, 13));
 		if (disp_dlg_regs->refcyc_per_vm_group_vblank >= (unsigned int)math_pow(2, 23))
 			disp_dlg_regs->refcyc_per_vm_group_vblank = (unsigned int)(math_pow(2, 23) - 1);
 
@@ -12680,16 +12603,16 @@ static void rq_dlg_get_dlg_reg(
 			disp_dlg_regs->refcyc_per_vm_req_flip = (unsigned int)(math_pow(2, 23) - 1);
 
 
-		DML2_ASSERT(disp_dlg_regs->dst_y_after_scaler < (unsigned int)8);
-		DML2_ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)math_pow(2, 13));
+		DML_ASSERT(disp_dlg_regs->dst_y_after_scaler < (unsigned int)8);
+		DML_ASSERT(disp_dlg_regs->refcyc_x_after_scaler < (unsigned int)math_pow(2, 13));
 
 		if (disp_dlg_regs->dst_y_per_pte_row_nom_l >= (unsigned int)math_pow(2, 17)) {
-			dml2_printf("DML_DLG: %s: Warning DST_Y_PER_PTE_ROW_NOM_L %u > register max U15.2 %u, clamp to max\n", __func__, disp_dlg_regs->dst_y_per_pte_row_nom_l, (unsigned int)math_pow(2, 17) - 1);
+			DML_LOG_VERBOSE("DML_DLG: %s: Warning DST_Y_PER_PTE_ROW_NOM_L %u > register max U15.2 %u, clamp to max\n", __func__, disp_dlg_regs->dst_y_per_pte_row_nom_l, (unsigned int)math_pow(2, 17) - 1);
 			l->dst_y_per_pte_row_nom_l = (unsigned int)math_pow(2, 17) - 1;
 		}
 		if (l->dual_plane) {
 			if (disp_dlg_regs->dst_y_per_pte_row_nom_c >= (unsigned int)math_pow(2, 17)) {
-				dml2_printf("DML_DLG: %s: Warning DST_Y_PER_PTE_ROW_NOM_C %u > register max U15.2 %u, clamp to max\n", __func__, disp_dlg_regs->dst_y_per_pte_row_nom_c, (unsigned int)math_pow(2, 17) - 1);
+				DML_LOG_VERBOSE("DML_DLG: %s: Warning DST_Y_PER_PTE_ROW_NOM_C %u > register max U15.2 %u, clamp to max\n", __func__, disp_dlg_regs->dst_y_per_pte_row_nom_c, (unsigned int)math_pow(2, 17) - 1);
 				l->dst_y_per_pte_row_nom_c = (unsigned int)math_pow(2, 17) - 1;
 			}
 		}
@@ -12700,20 +12623,20 @@ static void rq_dlg_get_dlg_reg(
 			if (disp_dlg_regs->refcyc_per_pte_group_nom_c >= (unsigned int)math_pow(2, 23))
 				disp_dlg_regs->refcyc_per_pte_group_nom_c = (unsigned int)(math_pow(2, 23) - 1);
 		}
-		DML2_ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)math_pow(2, 13));
+		DML_ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_l < (unsigned int)math_pow(2, 13));
 		if (l->dual_plane) {
-			DML2_ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)math_pow(2, 13));
+			DML_ASSERT(disp_dlg_regs->refcyc_per_pte_group_vblank_c < (unsigned int)math_pow(2, 13));
 		}
 
-		DML2_ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)math_pow(2, 13));
-		DML2_ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)math_pow(2, 13));
-		DML2_ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)math_pow(2, 13));
-		DML2_ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)math_pow(2, 13));
-		DML2_ASSERT(disp_ttu_regs->qos_level_low_wm < (unsigned int)math_pow(2, 14));
-		DML2_ASSERT(disp_ttu_regs->qos_level_high_wm < (unsigned int)math_pow(2, 14));
-		DML2_ASSERT(disp_ttu_regs->min_ttu_vblank < (unsigned int)math_pow(2, 24));
+		DML_ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_l < (unsigned int)math_pow(2, 13));
+		DML_ASSERT(disp_dlg_regs->refcyc_per_line_delivery_l < (unsigned int)math_pow(2, 13));
+		DML_ASSERT(disp_dlg_regs->refcyc_per_line_delivery_pre_c < (unsigned int)math_pow(2, 13));
+		DML_ASSERT(disp_dlg_regs->refcyc_per_line_delivery_c < (unsigned int)math_pow(2, 13));
+		DML_ASSERT(disp_ttu_regs->qos_level_low_wm < (unsigned int)math_pow(2, 14));
+		DML_ASSERT(disp_ttu_regs->qos_level_high_wm < (unsigned int)math_pow(2, 14));
+		DML_ASSERT(disp_ttu_regs->min_ttu_vblank < (unsigned int)math_pow(2, 24));
 
-		dml2_printf("DML_DLG::%s: Calculation for pipe[%d] done\n", __func__, pipe_idx);
+		DML_LOG_VERBOSE("DML_DLG::%s: Calculation for pipe[%d] done\n", __func__, pipe_idx);
 
 	}
 }
@@ -12736,11 +12659,11 @@ static void rq_dlg_get_arb_params(const struct dml2_display_cfg *display_cfg, co
 	arb_param->pstate_stall_threshold = (unsigned int)(mode_lib->ip_caps.fams2.max_allow_delay_us * refclk_freq_in_mhz);
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: max_req_outstanding = %d\n", __func__, arb_param->max_req_outstanding);
-	dml2_printf("DML::%s: sdpif_request_rate_limit = %d\n", __func__, arb_param->sdpif_request_rate_limit);
-	dml2_printf("DML::%s: compbuf_reserved_space_kbytes = %d\n", __func__, arb_param->compbuf_reserved_space_kbytes);
-	dml2_printf("DML::%s: allow_sdpif_rate_limit_when_cstate_req = %d\n", __func__, arb_param->allow_sdpif_rate_limit_when_cstate_req);
-	dml2_printf("DML::%s: dcfclk_deep_sleep_hysteresis = %d\n", __func__, arb_param->dcfclk_deep_sleep_hysteresis);
+	DML_LOG_VERBOSE("DML::%s: max_req_outstanding = %d\n", __func__, arb_param->max_req_outstanding);
+	DML_LOG_VERBOSE("DML::%s: sdpif_request_rate_limit = %d\n", __func__, arb_param->sdpif_request_rate_limit);
+	DML_LOG_VERBOSE("DML::%s: compbuf_reserved_space_kbytes = %d\n", __func__, arb_param->compbuf_reserved_space_kbytes);
+	DML_LOG_VERBOSE("DML::%s: allow_sdpif_rate_limit_when_cstate_req = %d\n", __func__, arb_param->allow_sdpif_rate_limit_when_cstate_req);
+	DML_LOG_VERBOSE("DML::%s: dcfclk_deep_sleep_hysteresis = %d\n", __func__, arb_param->dcfclk_deep_sleep_hysteresis);
 #endif
 
 }
@@ -13013,10 +12936,10 @@ void dml2_core_calcs_get_stream_support_info(const struct dml2_display_cfg *disp
 
 	out->vblank_reserved_time_us = display_cfg->plane_descriptors[plane_index].overrides.reserved_vblank_time_ns / 1000;
 #if defined(__DML_VBA_DEBUG__)
-	dml2_printf("DML::%s: subvp_fw_processing_delay_us = %d\n", __func__, mode_lib->ip.subvp_fw_processing_delay_us);
-	dml2_printf("DML::%s: subvp_pstate_allow_width_us = %d\n", __func__, mode_lib->ip.subvp_pstate_allow_width_us);
-	dml2_printf("DML::%s: subvp_swath_height_margin_lines = %d\n", __func__, mode_lib->ip.subvp_swath_height_margin_lines);
-	dml2_printf("DML::%s: vblank_reserved_time_us = %f\n", __func__, out->vblank_reserved_time_us);
+	DML_LOG_VERBOSE("DML::%s: subvp_fw_processing_delay_us = %d\n", __func__, mode_lib->ip.subvp_fw_processing_delay_us);
+	DML_LOG_VERBOSE("DML::%s: subvp_pstate_allow_width_us = %d\n", __func__, mode_lib->ip.subvp_pstate_allow_width_us);
+	DML_LOG_VERBOSE("DML::%s: subvp_swath_height_margin_lines = %d\n", __func__, mode_lib->ip.subvp_swath_height_margin_lines);
+	DML_LOG_VERBOSE("DML::%s: vblank_reserved_time_us = %u\n", __func__, out->vblank_reserved_time_us);
 #endif
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index 4e502f0a6d20..bdee6ad7bc59 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -1078,6 +1078,8 @@ struct dml2_core_calcs_mode_programming_locals {
 	enum dml2_source_format_class pixel_format[DML2_MAX_PLANES];
 	unsigned int lb_source_lines_l[DML2_MAX_PLANES];
 	unsigned int lb_source_lines_c[DML2_MAX_PLANES];
+	unsigned int num_dsc_slices[DML2_MAX_PLANES];
+	bool dsc_enable[DML2_MAX_PLANES];
 };
 
 struct dml2_core_calcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_locals {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
index 2504d9c2ec34..5a4d331047e3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
@@ -82,7 +82,7 @@ bool dml2_core_utils_is_420(enum dml2_source_format_class source_format)
 		val = 0;
 		break;
 	default:
-		DML2_ASSERT(0);
+		DML_ASSERT(0);
 		break;
 	}
 	return val;
@@ -145,7 +145,7 @@ bool dml2_core_utils_is_422_planar(enum dml2_source_format_class source_format)
 		val = 0;
 		break;
 	default:
-		DML2_ASSERT(0);
+		DML_ASSERT(0);
 		break;
 	}
 	return val;
@@ -208,7 +208,7 @@ bool dml2_core_utils_is_422_packed(enum dml2_source_format_class source_format)
 		val = 1;
 		break;
 	default:
-		DML2_ASSERT(0);
+		DML_ASSERT(0);
 		break;
 	}
 	return val;
@@ -216,104 +216,104 @@ bool dml2_core_utils_is_422_packed(enum dml2_source_format_class source_format)
 
 void dml2_core_utils_print_mode_support_info(const struct dml2_core_internal_mode_support_info *support, bool fail_only)
 {
-	dml2_printf("DML: ===================================== \n");
-	dml2_printf("DML: DML_MODE_SUPPORT_INFO_ST\n");
+	DML_LOG_VERBOSE("DML: ===================================== \n");
+	DML_LOG_VERBOSE("DML: DML_MODE_SUPPORT_INFO_ST\n");
 	if (!fail_only || support->ScaleRatioAndTapsSupport == 0)
-		dml2_printf("DML: support: ScaleRatioAndTapsSupport = %d\n", support->ScaleRatioAndTapsSupport);
+		DML_LOG_VERBOSE("DML: support: ScaleRatioAndTapsSupport = %d\n", support->ScaleRatioAndTapsSupport);
 	if (!fail_only || support->SourceFormatPixelAndScanSupport == 0)
-		dml2_printf("DML: support: SourceFormatPixelAndScanSupport = %d\n", support->SourceFormatPixelAndScanSupport);
+		DML_LOG_VERBOSE("DML: support: SourceFormatPixelAndScanSupport = %d\n", support->SourceFormatPixelAndScanSupport);
 	if (!fail_only || support->ViewportSizeSupport == 0)
-		dml2_printf("DML: support: ViewportSizeSupport = %d\n", support->ViewportSizeSupport);
+		DML_LOG_VERBOSE("DML: support: ViewportSizeSupport = %d\n", support->ViewportSizeSupport);
 	if (!fail_only || support->LinkRateDoesNotMatchDPVersion == 1)
-		dml2_printf("DML: support: LinkRateDoesNotMatchDPVersion = %d\n", support->LinkRateDoesNotMatchDPVersion);
+		DML_LOG_VERBOSE("DML: support: LinkRateDoesNotMatchDPVersion = %d\n", support->LinkRateDoesNotMatchDPVersion);
 	if (!fail_only || support->LinkRateForMultistreamNotIndicated == 1)
-		dml2_printf("DML: support: LinkRateForMultistreamNotIndicated = %d\n", support->LinkRateForMultistreamNotIndicated);
+		DML_LOG_VERBOSE("DML: support: LinkRateForMultistreamNotIndicated = %d\n", support->LinkRateForMultistreamNotIndicated);
 	if (!fail_only || support->BPPForMultistreamNotIndicated == 1)
-		dml2_printf("DML: support: BPPForMultistreamNotIndicated = %d\n", support->BPPForMultistreamNotIndicated);
+		DML_LOG_VERBOSE("DML: support: BPPForMultistreamNotIndicated = %d\n", support->BPPForMultistreamNotIndicated);
 	if (!fail_only || support->MultistreamWithHDMIOreDP == 1)
-		dml2_printf("DML: support: MultistreamWithHDMIOreDP = %d\n", support->MultistreamWithHDMIOreDP);
+		DML_LOG_VERBOSE("DML: support: MultistreamWithHDMIOreDP = %d\n", support->MultistreamWithHDMIOreDP);
 	if (!fail_only || support->ExceededMultistreamSlots == 1)
-		dml2_printf("DML: support: ExceededMultistreamSlots = %d\n", support->ExceededMultistreamSlots);
+		DML_LOG_VERBOSE("DML: support: ExceededMultistreamSlots = %d\n", support->ExceededMultistreamSlots);
 	if (!fail_only || support->MSOOrODMSplitWithNonDPLink == 1)
-		dml2_printf("DML: support: MSOOrODMSplitWithNonDPLink = %d\n", support->MSOOrODMSplitWithNonDPLink);
+		DML_LOG_VERBOSE("DML: support: MSOOrODMSplitWithNonDPLink = %d\n", support->MSOOrODMSplitWithNonDPLink);
 	if (!fail_only || support->NotEnoughLanesForMSO == 1)
-		dml2_printf("DML: support: NotEnoughLanesForMSO = %d\n", support->NotEnoughLanesForMSO);
+		DML_LOG_VERBOSE("DML: support: NotEnoughLanesForMSO = %d\n", support->NotEnoughLanesForMSO);
 	if (!fail_only || support->P2IWith420 == 1)
-		dml2_printf("DML: support: P2IWith420 = %d\n", support->P2IWith420);
+		DML_LOG_VERBOSE("DML: support: P2IWith420 = %d\n", support->P2IWith420);
 	if (!fail_only || support->DSC422NativeNotSupported == 1)
-		dml2_printf("DML: support: DSC422NativeNotSupported = %d\n", support->DSC422NativeNotSupported);
+		DML_LOG_VERBOSE("DML: support: DSC422NativeNotSupported = %d\n", support->DSC422NativeNotSupported);
 	if (!fail_only || support->DSCSlicesODMModeSupported == 0)
-		dml2_printf("DML: support: DSCSlicesODMModeSupported = %d\n", support->DSCSlicesODMModeSupported);
+		DML_LOG_VERBOSE("DML: support: DSCSlicesODMModeSupported = %d\n", support->DSCSlicesODMModeSupported);
 	if (!fail_only || support->NotEnoughDSCUnits == 1)
-		dml2_printf("DML: support: NotEnoughDSCUnits = %d\n", support->NotEnoughDSCUnits);
+		DML_LOG_VERBOSE("DML: support: NotEnoughDSCUnits = %d\n", support->NotEnoughDSCUnits);
 	if (!fail_only || support->NotEnoughDSCSlices == 1)
-		dml2_printf("DML: support: NotEnoughDSCSlices = %d\n", support->NotEnoughDSCSlices);
+		DML_LOG_VERBOSE("DML: support: NotEnoughDSCSlices = %d\n", support->NotEnoughDSCSlices);
 	if (!fail_only || support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe == 1)
-		dml2_printf("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = %d\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
+		DML_LOG_VERBOSE("DML: support: ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = %d\n", support->ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe);
 	if (!fail_only || support->InvalidCombinationOfMALLUseForPStateAndStaticScreen == 1)
-		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = %d\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
+		DML_LOG_VERBOSE("DML: support: InvalidCombinationOfMALLUseForPStateAndStaticScreen = %d\n", support->InvalidCombinationOfMALLUseForPStateAndStaticScreen);
 	if (!fail_only || support->DSCCLKRequiredMoreThanSupported == 1)
-		dml2_printf("DML: support: DSCCLKRequiredMoreThanSupported = %d\n", support->DSCCLKRequiredMoreThanSupported);
+		DML_LOG_VERBOSE("DML: support: DSCCLKRequiredMoreThanSupported = %d\n", support->DSCCLKRequiredMoreThanSupported);
 	if (!fail_only || support->PixelsPerLinePerDSCUnitSupport == 0)
-		dml2_printf("DML: support: PixelsPerLinePerDSCUnitSupport = %d\n", support->PixelsPerLinePerDSCUnitSupport);
+		DML_LOG_VERBOSE("DML: support: PixelsPerLinePerDSCUnitSupport = %d\n", support->PixelsPerLinePerDSCUnitSupport);
 	if (!fail_only || support->DTBCLKRequiredMoreThanSupported == 1)
-		dml2_printf("DML: support: DTBCLKRequiredMoreThanSupported = %d\n", support->DTBCLKRequiredMoreThanSupported);
+		DML_LOG_VERBOSE("DML: support: DTBCLKRequiredMoreThanSupported = %d\n", support->DTBCLKRequiredMoreThanSupported);
 	if (!fail_only || support->InvalidCombinationOfMALLUseForPState == 1)
-		dml2_printf("DML: support: InvalidCombinationOfMALLUseForPState = %d\n", support->InvalidCombinationOfMALLUseForPState);
+		DML_LOG_VERBOSE("DML: support: InvalidCombinationOfMALLUseForPState = %d\n", support->InvalidCombinationOfMALLUseForPState);
 	if (!fail_only || support->ROBSupport == 0)
-		dml2_printf("DML: support: ROBSupport = %d\n", support->ROBSupport);
+		DML_LOG_VERBOSE("DML: support: ROBSupport = %d\n", support->ROBSupport);
 	if (!fail_only || support->OutstandingRequestsSupport == 0)
-		dml2_printf("DML: support: OutstandingRequestsSupport = %d\n", support->OutstandingRequestsSupport);
+		DML_LOG_VERBOSE("DML: support: OutstandingRequestsSupport = %d\n", support->OutstandingRequestsSupport);
 	if (!fail_only || support->OutstandingRequestsUrgencyAvoidance == 0)
-		dml2_printf("DML: support: OutstandingRequestsUrgencyAvoidance = %d\n", support->OutstandingRequestsUrgencyAvoidance);
+		DML_LOG_VERBOSE("DML: support: OutstandingRequestsUrgencyAvoidance = %d\n", support->OutstandingRequestsUrgencyAvoidance);
 	if (!fail_only || support->DISPCLK_DPPCLK_Support == 0)
-		dml2_printf("DML: support: DISPCLK_DPPCLK_Support = %d\n", support->DISPCLK_DPPCLK_Support);
+		DML_LOG_VERBOSE("DML: support: DISPCLK_DPPCLK_Support = %d\n", support->DISPCLK_DPPCLK_Support);
 	if (!fail_only || support->TotalAvailablePipesSupport == 0)
-		dml2_printf("DML: support: TotalAvailablePipesSupport = %d\n", support->TotalAvailablePipesSupport);
+		DML_LOG_VERBOSE("DML: support: TotalAvailablePipesSupport = %d\n", support->TotalAvailablePipesSupport);
 	if (!fail_only || support->NumberOfOTGSupport == 0)
-		dml2_printf("DML: support: NumberOfOTGSupport = %d\n", support->NumberOfOTGSupport);
+		DML_LOG_VERBOSE("DML: support: NumberOfOTGSupport = %d\n", support->NumberOfOTGSupport);
 	if (!fail_only || support->NumberOfHDMIFRLSupport == 0)
-		dml2_printf("DML: support: NumberOfHDMIFRLSupport = %d\n", support->NumberOfHDMIFRLSupport);
+		DML_LOG_VERBOSE("DML: support: NumberOfHDMIFRLSupport = %d\n", support->NumberOfHDMIFRLSupport);
 	if (!fail_only || support->NumberOfDP2p0Support == 0)
-		dml2_printf("DML: support: NumberOfDP2p0Support = %d\n", support->NumberOfDP2p0Support);
+		DML_LOG_VERBOSE("DML: support: NumberOfDP2p0Support = %d\n", support->NumberOfDP2p0Support);
 	if (!fail_only || support->EnoughWritebackUnits == 0)
-		dml2_printf("DML: support: EnoughWritebackUnits = %d\n", support->EnoughWritebackUnits);
+		DML_LOG_VERBOSE("DML: support: EnoughWritebackUnits = %d\n", support->EnoughWritebackUnits);
 	if (!fail_only || support->WritebackScaleRatioAndTapsSupport == 0)
-		dml2_printf("DML: support: WritebackScaleRatioAndTapsSupport = %d\n", support->WritebackScaleRatioAndTapsSupport);
+		DML_LOG_VERBOSE("DML: support: WritebackScaleRatioAndTapsSupport = %d\n", support->WritebackScaleRatioAndTapsSupport);
 	if (!fail_only || support->WritebackLatencySupport == 0)
-		dml2_printf("DML: support: WritebackLatencySupport = %d\n", support->WritebackLatencySupport);
+		DML_LOG_VERBOSE("DML: support: WritebackLatencySupport = %d\n", support->WritebackLatencySupport);
 	if (!fail_only || support->CursorSupport == 0)
-		dml2_printf("DML: support: CursorSupport = %d\n", support->CursorSupport);
+		DML_LOG_VERBOSE("DML: support: CursorSupport = %d\n", support->CursorSupport);
 	if (!fail_only || support->PitchSupport == 0)
-		dml2_printf("DML: support: PitchSupport = %d\n", support->PitchSupport);
+		DML_LOG_VERBOSE("DML: support: PitchSupport = %d\n", support->PitchSupport);
 	if (!fail_only || support->ViewportExceedsSurface == 1)
-		dml2_printf("DML: support: ViewportExceedsSurface = %d\n", support->ViewportExceedsSurface);
+		DML_LOG_VERBOSE("DML: support: ViewportExceedsSurface = %d\n", support->ViewportExceedsSurface);
 	if (!fail_only || support->PrefetchSupported == 0)
-		dml2_printf("DML: support: PrefetchSupported = %d\n", support->PrefetchSupported);
+		DML_LOG_VERBOSE("DML: support: PrefetchSupported = %d\n", support->PrefetchSupported);
 	if (!fail_only || support->EnoughUrgentLatencyHidingSupport == 0)
-		dml2_printf("DML: support: EnoughUrgentLatencyHidingSupport = %d\n", support->EnoughUrgentLatencyHidingSupport);
+		DML_LOG_VERBOSE("DML: support: EnoughUrgentLatencyHidingSupport = %d\n", support->EnoughUrgentLatencyHidingSupport);
 	if (!fail_only || support->AvgBandwidthSupport == 0)
-		dml2_printf("DML: support: AvgBandwidthSupport = %d\n", support->AvgBandwidthSupport);
+		DML_LOG_VERBOSE("DML: support: AvgBandwidthSupport = %d\n", support->AvgBandwidthSupport);
 	if (!fail_only || support->DynamicMetadataSupported == 0)
-		dml2_printf("DML: support: DynamicMetadataSupported = %d\n", support->DynamicMetadataSupported);
+		DML_LOG_VERBOSE("DML: support: DynamicMetadataSupported = %d\n", support->DynamicMetadataSupported);
 	if (!fail_only || support->VRatioInPrefetchSupported == 0)
-		dml2_printf("DML: support: VRatioInPrefetchSupported = %d\n", support->VRatioInPrefetchSupported);
+		DML_LOG_VERBOSE("DML: support: VRatioInPrefetchSupported = %d\n", support->VRatioInPrefetchSupported);
 	if (!fail_only || support->PTEBufferSizeNotExceeded == 0)
-		dml2_printf("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
+		DML_LOG_VERBOSE("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
 	if (!fail_only || support->DCCMetaBufferSizeNotExceeded == 0)
-		dml2_printf("DML: support: DCCMetaBufferSizeNotExceeded = %d\n", support->DCCMetaBufferSizeNotExceeded);
+		DML_LOG_VERBOSE("DML: support: DCCMetaBufferSizeNotExceeded = %d\n", support->DCCMetaBufferSizeNotExceeded);
 	if (!fail_only || support->ExceededMALLSize == 1)
-		dml2_printf("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
+		DML_LOG_VERBOSE("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
 	if (!fail_only || support->g6_temp_read_support == 0)
-		dml2_printf("DML: support: g6_temp_read_support = %d\n", support->g6_temp_read_support);
+		DML_LOG_VERBOSE("DML: support: g6_temp_read_support = %d\n", support->g6_temp_read_support);
 	if (!fail_only || support->ImmediateFlipSupport == 0)
-		dml2_printf("DML: support: ImmediateFlipSupport = %d\n", support->ImmediateFlipSupport);
+		DML_LOG_VERBOSE("DML: support: ImmediateFlipSupport = %d\n", support->ImmediateFlipSupport);
 	if (!fail_only || support->LinkCapacitySupport == 0)
-		dml2_printf("DML: support: LinkCapacitySupport = %d\n", support->LinkCapacitySupport);
+		DML_LOG_VERBOSE("DML: support: LinkCapacitySupport = %d\n", support->LinkCapacitySupport);
 
 	if (!fail_only || support->ModeSupport == 0)
-		dml2_printf("DML: support: ModeSupport = %d\n", support->ModeSupport);
-	dml2_printf("DML: ===================================== \n");
+		DML_LOG_VERBOSE("DML: support: ModeSupport = %d\n", support->ModeSupport);
+	DML_LOG_VERBOSE("DML: ===================================== \n");
 }
 
 const char *dml2_core_utils_internal_soc_state_type_str(enum dml2_core_internal_soc_state_type dml2_core_internal_soc_state_type)
@@ -358,9 +358,9 @@ void dml2_core_utils_get_stream_output_bpp(double *out_bpp, const struct dml2_di
 			out_bpp[k] = 0;
 		}
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%d bpc=%f\n", __func__, k, bpc);
-		dml2_printf("DML::%s: k=%d dsc.enable=%d\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable);
-		dml2_printf("DML::%s: k=%d out_bpp=%f\n", __func__, k, out_bpp[k]);
+		DML_LOG_VERBOSE("DML::%s: k=%d bpc=%f\n", __func__, k, bpc);
+		DML_LOG_VERBOSE("DML::%s: k=%d dsc.enable=%d\n", __func__, k, display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.dsc.enable);
+		DML_LOG_VERBOSE("DML::%s: k=%d out_bpp=%f\n", __func__, k, out_bpp[k]);
 #endif
 	}
 }
@@ -391,7 +391,7 @@ unsigned int dml2_core_util_get_num_active_pipes(int unsigned num_planes, const
 	}
 
 #ifdef __DML_VBA_DEBUG__
-	dml2_printf("DML::%s: num_active_pipes = %d\n", __func__, num_active_pipes);
+	DML_LOG_VERBOSE("DML::%s: num_active_pipes = %d\n", __func__, num_active_pipes);
 #endif
 	return num_active_pipes;
 }
@@ -452,7 +452,7 @@ unsigned int dml2_core_utils_get_tile_block_size_bytes(enum dml2_swizzle_mode sw
 	else if (sw_mode == dml2_gfx11_sw_256kb_r_x)
 		return 262144;
 	else {
-		DML2_ASSERT(0);
+		DML_ASSERT(0);
 		return 256;
 	};
 }
@@ -498,8 +498,8 @@ int unsigned dml2_core_utils_get_gfx_version(enum dml2_swizzle_mode sw_mode)
 		sw_mode == dml2_gfx11_sw_256kb_r_x)
 		version = 11;
 	else {
-		dml2_printf("ERROR: Invalid sw_mode setting! val=%u\n", sw_mode);
-		DML2_ASSERT(0);
+		DML_LOG_VERBOSE("ERROR: Invalid sw_mode setting! val=%u\n", sw_mode);
+		DML_ASSERT(0);
 	}
 
 	return version;
@@ -511,7 +511,7 @@ unsigned int dml2_core_utils_get_qos_param_index(unsigned long uclk_freq_khz, co
 	unsigned int index = 0;
 
 	for (i = 0; i < DML_MAX_CLK_TABLE_SIZE; i++) {
-		dml2_printf("DML::%s: per_uclk_dpm_params[%d].minimum_uclk_khz = %d\n", __func__, i, per_uclk_dpm_params[i].minimum_uclk_khz);
+		DML_LOG_VERBOSE("DML::%s: per_uclk_dpm_params[%d].minimum_uclk_khz = %ld\n", __func__, i, per_uclk_dpm_params[i].minimum_uclk_khz);
 
 		if (i == 0)
 			index = 0;
@@ -524,8 +524,8 @@ unsigned int dml2_core_utils_get_qos_param_index(unsigned long uclk_freq_khz, co
 		}
 	}
 #if defined(__DML_VBA_DEBUG__)
-	dml2_printf("DML::%s: uclk_freq_khz = %d\n", __func__, uclk_freq_khz);
-	dml2_printf("DML::%s: index = %d\n", __func__, index);
+	DML_LOG_VERBOSE("DML::%s: uclk_freq_khz = %ld\n", __func__, uclk_freq_khz);
+	DML_LOG_VERBOSE("DML::%s: index = %d\n", __func__, index);
 #endif
 	return index;
 }
@@ -536,7 +536,7 @@ unsigned int dml2_core_utils_get_active_min_uclk_dpm_index(unsigned long uclk_fr
 	bool clk_entry_found = 0;
 
 	for (i = 0; i < clk_table->uclk.num_clk_values; i++) {
-		dml2_printf("DML::%s: clk_table.uclk.clk_values_khz[%d] = %d\n", __func__, i, clk_table->uclk.clk_values_khz[i]);
+		DML_LOG_VERBOSE("DML::%s: clk_table.uclk.clk_values_khz[%d] = %ld\n", __func__, i, clk_table->uclk.clk_values_khz[i]);
 
 		if (uclk_freq_khz == clk_table->uclk.clk_values_khz[i]) {
 			clk_entry_found = 1;
@@ -545,10 +545,10 @@ unsigned int dml2_core_utils_get_active_min_uclk_dpm_index(unsigned long uclk_fr
 	}
 
 	if (!clk_entry_found)
-		DML2_ASSERT(clk_entry_found);
+		DML_ASSERT(clk_entry_found);
 #if defined(__DML_VBA_DEBUG__)
-	dml2_printf("DML::%s: uclk_freq_khz = %ld\n", __func__, uclk_freq_khz);
-	dml2_printf("DML::%s: index = %d\n", __func__, i);
+	DML_LOG_VERBOSE("DML::%s: uclk_freq_khz = %ld\n", __func__, uclk_freq_khz);
+	DML_LOG_VERBOSE("DML::%s: index = %d\n", __func__, i);
 #endif
 	return i;
 }
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
index 15507926f3a4..f486b090bbfc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
@@ -754,6 +754,8 @@ bool dpmm_dcn4_map_watermarks(struct dml2_dpmm_map_watermarks_params_in_out *in_
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].fclk_pstate = (int unsigned)(mode_lib->mp.Watermark.FCLKChangeWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].sr_enter = (int unsigned)(mode_lib->mp.Watermark.StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].sr_exit = (int unsigned)(mode_lib->mp.Watermark.StutterExitWatermark * refclk_freq_in_mhz);
+	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].sr_enter_z8 = (int unsigned)(mode_lib->mp.Watermark.Z8StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
+	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].sr_exit_z8 = (int unsigned)(mode_lib->mp.Watermark.Z8StutterExitWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.temp_read_or_ppt_watermark_us * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].uclk_pstate = (int unsigned)(mode_lib->mp.Watermark.DRAMClockChangeWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].urgent = (int unsigned)(mode_lib->mp.Watermark.UrgentWatermark * refclk_freq_in_mhz);
@@ -768,6 +770,8 @@ bool dpmm_dcn4_map_watermarks(struct dml2_dpmm_map_watermarks_params_in_out *in_
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].fclk_pstate = (int unsigned)(mode_lib->mp.Watermark.FCLKChangeWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].sr_enter = (int unsigned)(mode_lib->mp.Watermark.StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].sr_exit = (int unsigned)(mode_lib->mp.Watermark.StutterExitWatermark * refclk_freq_in_mhz);
+	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].sr_enter_z8 = (int unsigned)(mode_lib->mp.Watermark.Z8StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
+	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].sr_exit_z8 = (int unsigned)(mode_lib->mp.Watermark.Z8StutterExitWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.temp_read_or_ppt_watermark_us * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].uclk_pstate = (int unsigned)(mode_lib->mp.Watermark.DRAMClockChangeWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].urgent = (int unsigned)(mode_lib->mp.Watermark.UrgentWatermark * refclk_freq_in_mhz);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
index f50662b83296..d88b3e0082dd 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
@@ -659,7 +659,7 @@ bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
 	for (i = 1; i <= PMO_DCN4_MAX_DISPLAYS; i++) {
 		switch (i) {
 		case 1:
-			DML2_ASSERT(base_strategy_list_1_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
+			DML_ASSERT(base_strategy_list_1_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
 
 			/* populate list */
 			pmo_dcn4_fams2_expand_base_pstate_strategies(
@@ -670,7 +670,7 @@ bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
 					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
 			break;
 		case 2:
-			DML2_ASSERT(base_strategy_list_2_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
+			DML_ASSERT(base_strategy_list_2_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
 
 			/* populate list */
 			pmo_dcn4_fams2_expand_base_pstate_strategies(
@@ -681,7 +681,7 @@ bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
 					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
 			break;
 		case 3:
-			DML2_ASSERT(base_strategy_list_3_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
+			DML_ASSERT(base_strategy_list_3_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
 
 			/* populate list */
 			pmo_dcn4_fams2_expand_base_pstate_strategies(
@@ -692,7 +692,7 @@ bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
 					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
 			break;
 		case 4:
-			DML2_ASSERT(base_strategy_list_4_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
+			DML_ASSERT(base_strategy_list_4_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
 
 			/* populate list */
 			pmo_dcn4_fams2_expand_base_pstate_strategies(
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
index dc2ce5e77f57..4a7c4c62111e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
@@ -761,7 +761,7 @@ bool dml2_top_mcache_calc_mcache_count_and_offsets(struct top_mcache_calc_mcache
 				total_mcaches_required--;
 		}
 	}
-	dml2_printf("DML_CORE_DCN3::%s: plane_%d, total_mcaches_required=%d\n", __func__, i, total_mcaches_required);
+	DML_LOG_VERBOSE("DML_CORE_DCN3::%s: plane_%d, total_mcaches_required=%d\n", __func__, i, total_mcaches_required);
 
 	if (total_mcaches_required > dml->soc_bbox.num_dcc_mcaches) {
 		result = false;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
deleted file mode 100644
index c506667897c4..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
+++ /dev/null
@@ -1,31 +0,0 @@
-// SPDX-License-Identifier: MIT
-//
-// Copyright 2024 Advanced Micro Devices, Inc.
-
-#include "dml2_debug.h"
-
-int dml2_log_internal(const char *format, ...)
-{
-	return 0;
-}
-
-int dml2_printf(const char *format, ...)
-{
-#ifdef _DEBUG
-#ifdef _DEBUG_PRINTS
-	int result;
-	va_list args;
-	va_start(args, format);
-
-	result = vprintf(format, args);
-
-	va_end(args);
-
-	return result;
-#else
-	return 0;
-#endif
-#else
-	return 0;
-#endif
-}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
index bfe6f236d2e4..b226225103c3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
@@ -5,55 +5,62 @@
 #ifndef __DML2_DEBUG_H__
 #define __DML2_DEBUG_H__
 
-#ifndef DML2_ASSERT
-#define DML2_ASSERT(condition) ((void)0)
-#endif
+#include "os_types.h"
+#define DML_ASSERT(condition) ASSERT(condition)
+#define DML_LOG_LEVEL_DEFAULT DML_LOG_LEVEL_WARN
+#define DML_LOG_INTERNAL(fmt, ...) dm_output_to_console(fmt, ## __VA_ARGS__)
 
-/*
- * DML_LOG_FATAL - fatal errors for unrecoverable DML states until a restart.
- * DML_LOG_ERROR - unexpected but recoverable failures inside DML
- * DML_LOG_WARN - unexpected inputs or events to DML
- * DML_LOG_INFO - high level tracing of DML interfaces
- * DML_LOG_DEBUG - detailed tracing of DML internal components
- * DML_LOG_VERBOSE - detailed tracing of DML calculation procedure
- */
-#if !defined(DML_LOG_LEVEL)
-#if defined(_DEBUG) && defined(_DEBUG_PRINTS)
-/* for backward compatibility with old macros */
-#define DML_LOG_LEVEL 5
-#else
-#define DML_LOG_LEVEL 0
-#endif
-#endif
+/* ASSERT with message output */
+#define DML_ASSERT_MSG(condition, fmt, ...)								\
+	do {												\
+		if (!(condition)) {									\
+			DML_LOG_ERROR("DML ASSERT hit in %s line %d\n", __func__, __LINE__);	\
+			DML_LOG_ERROR(fmt, ## __VA_ARGS__);						\
+			DML_ASSERT(condition);								\
+		}											\
+	} while (0)
+
+/* fatal errors for unrecoverable DML states until a full reset */
+#define DML_LOG_LEVEL_FATAL 0
+/* unexpected but recoverable failures inside DML */
+#define DML_LOG_LEVEL_ERROR 1
+/* unexpected inputs or events to DML */
+#define DML_LOG_LEVEL_WARN 2
+/* high level tracing of DML interfaces */
+#define DML_LOG_LEVEL_INFO 3
+/* detailed tracing of DML internal components */
+#define DML_LOG_LEVEL_DEBUG 4
+/* detailed tracing of DML calculation procedure */
+#define DML_LOG_LEVEL_VERBOSE 5
 
-#define DML_LOG_FATAL(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
-#if DML_LOG_LEVEL >= 1
-#define DML_LOG_ERROR(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#ifndef DML_LOG_LEVEL
+#define DML_LOG_LEVEL DML_LOG_LEVEL_DEFAULT
+#endif /* #ifndef DML_LOG_LEVEL */
+
+#define DML_LOG_FATAL(fmt, ...) DML_LOG_INTERNAL("[DML FATAL] " fmt, ## __VA_ARGS__)
+#if DML_LOG_LEVEL >= DML_LOG_LEVEL_ERROR
+#define DML_LOG_ERROR(fmt, ...) DML_LOG_INTERNAL("[DML ERROR] "fmt, ## __VA_ARGS__)
 #else
 #define DML_LOG_ERROR(fmt, ...) ((void)0)
 #endif
-#if DML_LOG_LEVEL >= 2
-#define DML_LOG_WARN(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#if DML_LOG_LEVEL >= DML_LOG_LEVEL_WARN
+#define DML_LOG_WARN(fmt, ...) DML_LOG_INTERNAL("[DML WARN] "fmt, ## __VA_ARGS__)
 #else
 #define DML_LOG_WARN(fmt, ...) ((void)0)
 #endif
-#if DML_LOG_LEVEL >= 3
-#define DML_LOG_INFO(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#if DML_LOG_LEVEL >= DML_LOG_LEVEL_INFO
+#define DML_LOG_INFO(fmt, ...) DML_LOG_INTERNAL("[DML INFO] "fmt, ## __VA_ARGS__)
 #else
 #define DML_LOG_INFO(fmt, ...) ((void)0)
 #endif
-#if DML_LOG_LEVEL >= 4
-#define DML_LOG_DEBUG(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#if DML_LOG_LEVEL >= DML_LOG_LEVEL_DEBUG
+#define DML_LOG_DEBUG(fmt, ...) DML_LOG_INTERNAL("[DML DEBUG] "fmt, ## __VA_ARGS__)
 #else
 #define DML_LOG_DEBUG(fmt, ...) ((void)0)
 #endif
-#if DML_LOG_LEVEL >= 5
-#define DML_LOG_VERBOSE(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#if DML_LOG_LEVEL >= DML_LOG_LEVEL_VERBOSE
+#define DML_LOG_VERBOSE(fmt, ...) DML_LOG_INTERNAL("[DML VERBOSE] "fmt, ## __VA_ARGS__)
 #else
 #define DML_LOG_VERBOSE(fmt, ...) ((void)0)
 #endif
-
-int dml2_log_internal(const char *format, ...);
-int dml2_printf(const char *format, ...);
-
-#endif
+#endif /* __DML2_DEBUG_H__ */
-- 
2.49.0


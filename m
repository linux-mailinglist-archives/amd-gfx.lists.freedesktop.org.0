Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECB99F1175
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Dec 2024 16:55:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20A510F073;
	Fri, 13 Dec 2024 15:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZZK3MKPO";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E4D10F073
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Dec 2024 15:55:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peRCd3Gnj7vSQtLnEvFeZj40I7QcITb4r0DgWdFU14Fw3eGWVfM8ELtfkd9tarD/8mvQ7W/fc8ff5JqUzZYS0A+hsYUtUC6BdYAXHPyTrjQbEdQ9IqU5k51GW+Z9/G8s72JlxVSj5FqIUJ8nzHlZd1ThGSi8cEhXExtvqEHDv+Xo2k6HSICek3OH0Kj1ZL0bhCkuTo3MH4oSc3GoYYoJ6m+g7zpjVDjE4KIEchDEuHLrtom/IPeP3CuY931rNlAMhOqg9pxSCaDsmrKcn92bPRHV+rAUaoly5gdjFs3OfK9K+BBa8SqX4ErylOCWtC/l74d53fOFXdLp5BwjcNs0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xZDvOVcU6YAhQYizlsUu4XBXHOZeDdA59QJIdlViPA=;
 b=QvZKRGyPfHp7//xoCvD6hEv0Vc8wubKrhun8z6rjIW6F3BLU/WPU+G3ntsRr9qogd0/ADkBairc4gdi08QvPkJIzkqkoQiux0ySJzmeRcRzIcu/h5Lh2NgHIlSMhzqrdz/IXltjW3TmAkI5paCzKBqzGxzpJzNmwH0H+yoAVwzD2UJ/ZQ1a+5qC/MgrmRWByPzcrF0xozu5ouTtd31qTow9Y9oU7HACHw/QwZn9X8YpgTRc3ncfeGzIiFBtQzaeWO4uB17CCeY4D+jOBY/3NZZELqhKaabhcjYMzLeXBCFPn+J8eTfPGOy4Y4GTXK4z7mBXi+BpUWZ6jatfk7AQAAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xZDvOVcU6YAhQYizlsUu4XBXHOZeDdA59QJIdlViPA=;
 b=ZZK3MKPOD6uLtyxp3j5vWelJDFf+xFCyZ4N9VL3nwYWYHfp3YYTVpr8pWiOGsH9MTLbQUSWWR5qK0oAA04ARG55B8cXmLRK+jpkaH9t5bOQoaorkPZiskP0qI6hiwGIysJoczmUbOtOUB2oz5Ew7taRLqSpNV3kH5GpPBhK9xUQ=
Received: from DS7PR03CA0248.namprd03.prod.outlook.com (2603:10b6:5:3b3::13)
 by BN5PR12MB9488.namprd12.prod.outlook.com (2603:10b6:408:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 15:54:55 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::23) by DS7PR03CA0248.outlook.office365.com
 (2603:10b6:5:3b3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Fri,
 13 Dec 2024 15:54:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 13 Dec 2024 15:54:54 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 09:54:50 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Roman Li <roman.li@amd.com>, Wayne Lin
 <wayne.lin@amd.com>, Tom Chung <chiahsuan.chung@amd.com>, Fangzhi Zuo
 <jerry.zuo@amd.com>, Zaeem Mohamed <zaeem.mohamed@amd.com>, Solomon Chiu
 <solomon.chiu@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>, Austin Zheng
 <Austin.Zheng@amd.com>, Dillon Varone <dillon.varone@amd.com>
Subject: [PATCH 07/17] drm/amd/display: DML21 Reintegration For Various Fixes
Date: Fri, 13 Dec 2024 08:52:39 -0700
Message-ID: <20241213155405.393252-8-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213155405.393252-1-Rodrigo.Siqueira@amd.com>
References: <20241213155405.393252-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|BN5PR12MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7036ef-c2c1-4e99-3061-08dd1b8e7cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZepfX/1wIrsD/Dxyz8OKY6GQnBZW3KHXVKChqNsKLJTKV4NdCdtXc/LFY7zr?=
 =?us-ascii?Q?vW/xiOMTex+qdFg9MN6LsM1gJBFtJ21LvbNTf9z1ouzvZoyArocS1iVX3NwB?=
 =?us-ascii?Q?TKl6L7onytncUye5pq5ahJudMqd+NyYeeeFU6QCVkYj2wH4E9chyQpiXEOFz?=
 =?us-ascii?Q?QhwLwCx+I3Sch1STNeZSIyPa75BmSwoZ1RaL1diA7SrWVaL1ReHDLENHCqCB?=
 =?us-ascii?Q?+j/AfOYZfk16xkMWT+nnyTEj5TBS9hlXEZku1AtFb+c2GM8d17ZyN1UZatIL?=
 =?us-ascii?Q?z/DZILz5R2sY7y9mi8g1xd4riRozuIU7VNHP11659NrqbU0qfwFDpbT+1lWZ?=
 =?us-ascii?Q?az8aijQKXHZl3qJrCOnN2zLi6EMPqxAY6MniG0PszQjkv/pM5uyESv+GMz85?=
 =?us-ascii?Q?XLLRxlBspeKtiLIIbhxXTkOyGypmY6+lT4WpwQdgECX3Znl0yZ6HzuaiaUuj?=
 =?us-ascii?Q?yQ1nkzOfFbjRT16S3Ibj07MJdflv65XHO/n8ubRjLWHR3R9dH/Aow62dROBh?=
 =?us-ascii?Q?1V96cekF2Ok2roKWs2s+d4m0fnLcLDJyeVQdjBioJYbLC55orwOi9UHsSvTO?=
 =?us-ascii?Q?g7GHg4GDuDtKhsZwcaGi6vyVegqIGmeEBo0P67imhOWit6XZBUyu+jB5K3Qy?=
 =?us-ascii?Q?I5f8oSN27S3QdcZV86eXvmLP70PaWc8+KO4DrCBFmVatNAdORe3cJnZn0mFC?=
 =?us-ascii?Q?HqDW6jXpnBd/RwUt37JJKSwdwTMd7Oe67a1Zkx65N9/A76VzbMV7gln8Jt8s?=
 =?us-ascii?Q?6bOUE0EIFzAYxzr3MuvljehjMXSqMNLz1cbee6AoatZm7tPRI9zkRFUktTbF?=
 =?us-ascii?Q?nJ7hCW1LPN/ADNsREkRLu0InaewF17Rk0rs8hQoY/2I3Fz9DTfvvaH0Tpcif?=
 =?us-ascii?Q?m1Bdgto2DWNf5wVTJYH0KXhGqGeV+SMdJvVk2QaxK0xj669sf8qgKmixSkjB?=
 =?us-ascii?Q?CBRi0xlhSvTn4fSF4trxue9BWMY4cTJewGm6C+Y3sgoyKYXhbnZYIZWrSd9e?=
 =?us-ascii?Q?Kd9w2TQ4HgYrisPhBTM369bZVAYD0rwJAv9B+iILjeIYs0QSDfdWje2PskNb?=
 =?us-ascii?Q?BdYsNu9ip353vIhV98LPzwLudbX8kJTqfhUKu6xKw90rUzKNctWLRmA3YGcZ?=
 =?us-ascii?Q?cfxZq0my1J0qyRIC7TOCbTD66tIebE1QNECwQdI5xs5CExZzhdKVG9+tjR2m?=
 =?us-ascii?Q?u9kmhdLAyiXdi6SOnKsKtsoLlUNCS8nBsatCHEzmXXkRF/kx4AVd2Rdbm5hM?=
 =?us-ascii?Q?jdeN1yefWUtMZkKOCxDwgcpeEoW4awxJttJ44rxF0e1In9oyUdVk1iaGob2e?=
 =?us-ascii?Q?anefHozyBCXA+PS49irsC8o+bKjCuIWmlqNjf51yKCAu5jpfB7dIpHzv0NiK?=
 =?us-ascii?Q?ytiurbuKZIZytLSMOkXIixT5fQYLuuTHnY3rvRQWknCKN4OReM54eT4OlH1A?=
 =?us-ascii?Q?6YscY0sfumEcjs3Nnhz4Nn5/m1s5/4XH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 15:54:54.9561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7036ef-c2c1-4e99-3061-08dd1b8e7cdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9488
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

Reintegrate latest DML21 code.

Reviewed-by: Dillon Varone <dillon.varone@amd.com>
Signed-off-by: Austin Zheng <Austin.Zheng@amd.com>
Signed-off-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  |   15 +-
 .../amd/display/dc/dml2/display_mode_core.c   |    6 +-
 .../dc/dml2/display_mode_core_structs.h       |  103 +-
 .../amd/display/dc/dml2/display_mode_util.c   |    6 +-
 .../dc/dml2/dml21/dml21_translation_helper.c  |   14 +-
 .../dml21/inc/bounding_boxes/dcn4_soc_bb.h    |    1 +
 .../dml21/inc/dml_top_display_cfg_types.h     |   52 +-
 .../dml21/inc/dml_top_soc_parameter_types.h   |    2 +
 .../display/dc/dml2/dml21/inc/dml_top_types.h |   69 +-
 .../dml2/dml21/src/dml2_core/dml2_core_dcn4.c |   39 +-
 .../src/dml2_core/dml2_core_dcn4_calcs.c      | 1214 +++++++++++------
 .../src/dml2_core/dml2_core_dcn4_calcs.h      |    2 +-
 .../src/dml2_core/dml2_core_shared_types.h    |  129 +-
 .../dml21/src/dml2_core/dml2_core_utils.c     |  223 ++-
 .../dml21/src/dml2_core/dml2_core_utils.h     |    6 +-
 .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c |    6 +-
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  394 ++++--
 .../dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h  |    7 +
 .../dml21/src/dml2_pmo/dml2_pmo_factory.c     |    1 -
 .../dml21/src/dml2_top/dml2_top_interfaces.c  |   51 +
 .../dml2/dml21/src/dml2_top/dml2_top_legacy.c |    4 +
 .../dml2/dml21/src/dml2_top/dml2_top_legacy.h |    9 +
 .../src/dml2_top/dml2_top_optimization.c      |  307 -----
 .../src/dml2_top/dml2_top_optimization.h      |   33 -
 .../dml2/dml21/src/dml2_top/dml2_top_soc15.c  | 1177 ++++++++++++++++
 .../{dml_top_mcache.h => dml2_top_soc15.h}    |   20 +-
 .../dml2/dml21/src/dml2_top/dml_top_mcache.c  |  549 --------
 .../dc/dml2/dml21/src/inc/dml2_debug.c        |    5 +
 .../dc/dml2/dml21/src/inc/dml2_debug.h        |   46 +-
 .../src/inc/dml2_internal_shared_types.h      |   60 +-
 30 files changed, 2819 insertions(+), 1731 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.h
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
 rename drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/{dml_top_mcache.h => dml2_top_soc15.h} (58%)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index c4378e620cbf..d9c27ebe12ee 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -73,9 +73,8 @@ AMD_DAL_DML2 = $(addprefix $(AMDDALPATH)/dc/dml2/,$(DML2))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_DML2)
 
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top.o := $(dml2_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o := $(dml2_ccflags)
-CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimization := $(dml2_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.o := $(dml2_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o := $(dml2_ccflags)
@@ -94,9 +93,8 @@ CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/dml21_translation_helper.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/dml21_utils.o := $(dml2_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml2/dml21/inc/dml2_debug.o := $(dml2_ccflags)
 
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top.o := $(dml2_rcflags)
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml_top_mcache.o := $(dml2_rcflags)
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.o := $(dml2_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.o := $(dml2_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/src/dml2_core/dml2_core_factory.o := $(dml2_rcflags)
@@ -113,9 +111,8 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/dml21_translation_helper.o := $(dml2_r
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/dml21_utils.o := $(dml2_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml2/dml21/inc/dml2_debug.o := $(dml2_rcflags)
 
-DML21 := src/dml2_top/dml_top.o
-DML21 += src/dml2_top/dml_top_mcache.o
-DML21 += src/dml2_top/dml2_top_optimization.o
+DML21 := src/dml2_top/dml2_top_interfaces.o
+DML21 += src/dml2_top/dml2_top_soc15.o
 DML21 += src/inc/dml2_debug.o
 DML21 += src/dml2_core/dml2_core_dcn4.o
 DML21 += src/dml2_core/dml2_core_factory.o
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index 6822b0795120..35bc917631ae 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -8318,7 +8318,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 	if (clk_cfg->dcfclk_option != dml_use_override_freq)
 		locals->Dcfclk = mode_lib->ms.DCFCLK;
 	else
-		locals->Dcfclk = clk_cfg->dcfclk_freq_mhz;
+		locals->Dcfclk = clk_cfg->dcfclk_mhz;
 
 #ifdef __DML_VBA_DEBUG__
 	dml_print_dml_policy(&mode_lib->ms.policy);
@@ -8371,7 +8371,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 	if (clk_cfg->dispclk_option == dml_use_required_freq)
 		locals->Dispclk = locals->Dispclk_calculated;
 	else if (clk_cfg->dispclk_option == dml_use_override_freq)
-		locals->Dispclk = clk_cfg->dispclk_freq_mhz;
+		locals->Dispclk = clk_cfg->dispclk_mhz;
 	else
 		locals->Dispclk = mode_lib->ms.state.dispclk_mhz;
 #ifdef __DML_VBA_DEBUG__
@@ -8412,7 +8412,7 @@ void dml_core_mode_programming(struct display_mode_lib_st *mode_lib, const struc
 		if (clk_cfg->dppclk_option[k] == dml_use_required_freq)
 			locals->Dppclk[k] = locals->Dppclk_calculated[k];
 		else if (clk_cfg->dppclk_option[k] == dml_use_override_freq)
-			locals->Dppclk[k] = clk_cfg->dppclk_freq_mhz[k];
+			locals->Dppclk[k] = clk_cfg->dppclk_mhz[k];
 		else
 			locals->Dppclk[k] = mode_lib->ms.state.dppclk_mhz;
 #ifdef __DML_VBA_DEBUG__
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h
index 504c427b3b31..dd3f43181a6e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core_structs.h
@@ -28,6 +28,7 @@
 #define __DISPLAY_MODE_CORE_STRUCT_H__
 
 #include "display_mode_lib_defines.h"
+#include "dml_top_display_cfg_types.h"
 
 enum dml_project_id {
 	dml_project_invalid = 0,
@@ -49,7 +50,9 @@ enum dml_use_mall_for_pstate_change_mode {
 	dml_use_mall_pstate_change_disable = 0,
 	dml_use_mall_pstate_change_full_frame = 1,
 	dml_use_mall_pstate_change_sub_viewport = 2,
-	dml_use_mall_pstate_change_phantom_pipe = 3
+	dml_use_mall_pstate_change_phantom_pipe = 3,
+	dml_use_mall_pstate_change_phantom_pipe_no_data_return = 4,
+	dml_use_mall_pstate_change_imall = 5
 };
 enum dml_use_mall_for_static_screen_mode {
 	dml_use_mall_static_screen_disable = 0,
@@ -171,7 +174,11 @@ enum dml_swizzle_mode {
 	dml_sw_256kb_z_x = 28,
 	dml_sw_256kb_s_x = 29,
 	dml_sw_256kb_d_x = 30,
-	dml_sw_256kb_r_x = 31
+	dml_sw_256kb_r_x = 31,
+	dml_sw_256b_2d = 32,
+	dml_sw_4kb_2d = 33,
+	dml_sw_64kb_2d = 34,
+	dml_sw_256kb_2d = 35
 };
 enum dml_lb_depth {
 	dml_lb_6 = 0,
@@ -223,24 +230,28 @@ enum dml_mpc_use_policy {
 	dml_mpc_disabled = 0,
 	dml_mpc_as_possible = 1,
 	dml_mpc_as_needed_for_voltage = 2,
-	dml_mpc_as_needed_for_pstate_and_voltage = 3
+	dml_mpc_as_needed_for_pstate_and_voltage = 3,
+	dml_mpc_as_needed = 4,
+	dml_mpc_2to1 = 5
 };
 enum dml_odm_use_policy {
 	dml_odm_use_policy_bypass = 0,
 	dml_odm_use_policy_combine_as_needed = 1,
 	dml_odm_use_policy_combine_2to1 = 2,
-	dml_odm_use_policy_combine_4to1 = 3,
-	dml_odm_use_policy_split_1to2 = 4,
-	dml_odm_use_policy_mso_1to2 = 5,
-	dml_odm_use_policy_mso_1to4 = 6
+	dml_odm_use_policy_combine_3to1 = 3,
+	dml_odm_use_policy_combine_4to1 = 4,
+	dml_odm_use_policy_split_1to2 = 5,
+	dml_odm_use_policy_mso_1to2 = 6,
+	dml_odm_use_policy_mso_1to4 = 7
 };
 enum dml_odm_mode {
 	dml_odm_mode_bypass = 0,
 	dml_odm_mode_combine_2to1 = 1,
-	dml_odm_mode_combine_4to1 = 2,
-	dml_odm_mode_split_1to2 = 3,
-	dml_odm_mode_mso_1to2 = 4,
-	dml_odm_mode_mso_1to4 = 5
+	dml_odm_mode_combine_3to1 = 2,
+	dml_odm_mode_combine_4to1 = 3,
+	dml_odm_mode_split_1to2 = 4,
+	dml_odm_mode_mso_1to2 = 5,
+	dml_odm_mode_mso_1to4 = 6
 };
 enum dml_writeback_configuration {
 	dml_whole_buffer_for_single_stream_no_interleave = 0,
@@ -289,6 +300,17 @@ struct soc_state_bounding_box_st {
 	dml_float_t fclk_change_latency_us;
 	dml_float_t usr_retraining_latency_us;
 	dml_bool_t use_ideal_dram_bw_strobe;
+	dml_float_t g6_temp_read_blackout_us;
+
+	struct {
+		dml_uint_t urgent_ramp_uclk_cycles;
+		dml_uint_t trip_to_memory_uclk_cycles;
+		dml_uint_t meta_trip_to_memory_uclk_cycles;
+		dml_uint_t maximum_latency_when_urgent_uclk_cycles;
+		dml_uint_t average_latency_when_urgent_uclk_cycles;
+		dml_uint_t maximum_latency_when_non_urgent_uclk_cycles;
+		dml_uint_t average_latency_when_non_urgent_uclk_cycles;
+	}  dml_dcn401_uclk_dpm_dependent_soc_qos_params;
 };
 
 struct soc_bounding_box_st {
@@ -297,7 +319,7 @@ struct soc_bounding_box_st {
 	dml_float_t pcierefclk_mhz;
 	dml_float_t refclk_mhz;
 	dml_float_t amclk_mhz;
-	dml_float_t max_outstanding_reqs;
+	dml_uint_t max_outstanding_reqs;
 	dml_float_t pct_ideal_sdp_bw_after_urgent;
 	dml_float_t pct_ideal_fabric_bw_after_urgent;
 	dml_float_t pct_ideal_dram_bw_after_urgent_pixel_only;
@@ -308,6 +330,16 @@ struct soc_bounding_box_st {
 	dml_float_t max_avg_fabric_bw_use_normal_percent;
 	dml_float_t max_avg_dram_bw_use_normal_percent;
 	dml_float_t max_avg_dram_bw_use_normal_strobe_percent;
+
+	dml_float_t svp_prefetch_pct_ideal_sdp_bw_after_urgent;
+	dml_float_t svp_prefetch_pct_ideal_fabric_bw_after_urgent;
+	dml_float_t svp_prefetch_pct_ideal_dram_bw_after_urgent_pixel_only;
+	dml_float_t svp_prefetch_pct_ideal_dram_bw_after_urgent_pixel_and_vm;
+	dml_float_t svp_prefetch_pct_ideal_dram_bw_after_urgent_vm_only;
+	dml_float_t svp_prefetch_max_avg_sdp_bw_use_normal_percent;
+	dml_float_t svp_prefetch_max_avg_fabric_bw_use_normal_percent;
+	dml_float_t svp_prefetch_max_avg_dram_bw_use_normal_percent;
+
 	dml_uint_t round_trip_ping_latency_dcfclk_cycles;
 	dml_uint_t urgent_out_of_order_return_per_channel_pixel_only_bytes;
 	dml_uint_t urgent_out_of_order_return_per_channel_pixel_and_vm_bytes;
@@ -324,6 +356,26 @@ struct soc_bounding_box_st {
 	dml_uint_t mall_allocated_for_dcn_mbytes;
 	dml_float_t dispclk_dppclk_vco_speed_mhz;
 	dml_bool_t do_urgent_latency_adjustment;
+
+	dml_uint_t mem_word_bytes;
+	dml_uint_t num_dcc_mcaches;
+	dml_uint_t mcache_size_bytes;
+	dml_uint_t mcache_line_size_bytes;
+
+	struct {
+		dml_bool_t UseNewDCN401SOCParameters;
+		dml_uint_t df_qos_response_time_fclk_cycles;
+		dml_uint_t max_round_trip_to_furthest_cs_fclk_cycles;
+		dml_uint_t mall_overhead_fclk_cycles;
+		dml_uint_t meta_trip_adder_fclk_cycles;
+		dml_uint_t average_transport_distance_fclk_cycles;
+		dml_float_t umc_urgent_ramp_latency_margin;
+		dml_float_t umc_max_latency_margin;
+		dml_float_t umc_average_latency_margin;
+		dml_float_t fabric_max_transport_latency_margin;
+		dml_float_t fabric_average_transport_latency_margin;
+	}  dml_dcn401_soc_qos_params;
+
 };
 
 struct ip_params_st {
@@ -515,6 +567,10 @@ struct dml_plane_cfg_st {
 	dml_uint_t CursorWidth[__DML_NUM_PLANES__];
 	dml_uint_t CursorBPP[__DML_NUM_PLANES__];
 
+	dml_bool_t setup_for_tdlut[__DML_NUM_PLANES__];
+	enum dml2_tdlut_addressing_mode tdlut_addressing_mode[__DML_NUM_PLANES__];
+	enum dml2_tdlut_width_mode tdlut_width_mode[__DML_NUM_PLANES__];
+
 	enum dml_use_mall_for_static_screen_mode UseMALLForStaticScreen[__DML_NUM_PLANES__];
 	enum dml_use_mall_for_pstate_change_mode UseMALLForPStateChange[__DML_NUM_PLANES__];
 
@@ -604,6 +660,17 @@ struct dml_hw_resource_st {
 	dml_float_t DLGRefClkFreqMHz; /// <brief DLG Global Reference timer
 };
 
+/// @brief To control the clk usage for model programming
+struct dml_clk_cfg_st {
+	enum dml_clk_cfg_policy dcfclk_option; ///< brief Use for mode_program; user can select between use the min require clk req as calculated by DML or use the test-specific freq
+	enum dml_clk_cfg_policy dispclk_option; ///< brief Use for mode_program; user can select between use the min require clk req as calculated by DML or use the test-specific freq
+	enum dml_clk_cfg_policy dppclk_option[__DML_NUM_PLANES__];
+
+	dml_float_t dcfclk_mhz;
+	dml_float_t dispclk_mhz;
+	dml_float_t dppclk_mhz[__DML_NUM_PLANES__];
+}; // dml_clk_cfg_st
+
 /// @brief DML display configuration.
 ///        Describe how to display a surface in multi-plane setup and output to different output and writeback using the specified timgin
 struct dml_display_cfg_st {
@@ -616,19 +683,9 @@ struct dml_display_cfg_st {
 	unsigned int num_timings;
 
 	struct dml_hw_resource_st hw; //< brief for mode programming
+	struct dml_clk_cfg_st clk_overrides;   //< brief for mode programming clk override
 }; // dml_display_cfg_st
 
-/// @brief To control the clk usage for model programming
-struct dml_clk_cfg_st {
-	enum dml_clk_cfg_policy dcfclk_option; ///< brief Use for mode_program; user can select between use the min require clk req as calculated by DML or use the test-specific freq
-	enum dml_clk_cfg_policy dispclk_option; ///< brief Use for mode_program; user can select between use the min require clk req as calculated by DML or use the test-specific freq
-	enum dml_clk_cfg_policy dppclk_option[__DML_NUM_PLANES__];
-
-	dml_float_t dcfclk_freq_mhz;
-	dml_float_t dispclk_freq_mhz;
-	dml_float_t dppclk_freq_mhz[__DML_NUM_PLANES__];
-}; // dml_clk_cfg_st
-
 /// @brief DML mode evaluation and programming policy
 /// Those knobs that affect mode support and mode programming
 struct dml_mode_eval_policy_st {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
index c247aee89caf..89890c88fd66 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_util.c
@@ -690,12 +690,12 @@ __DML_DLL_EXPORT__ void dml_print_clk_cfg(const struct dml_clk_cfg_st *clk_cfg)
 	dml_print("DML: clk_cfg: dcfclk_option = %d\n", clk_cfg->dcfclk_option);
 	dml_print("DML: clk_cfg: dispclk_option = %d\n", clk_cfg->dispclk_option);
 
-	dml_print("DML: clk_cfg: dcfclk_freq_mhz = %f\n", clk_cfg->dcfclk_freq_mhz);
-	dml_print("DML: clk_cfg: dispclk_freq_mhz = %f\n", clk_cfg->dispclk_freq_mhz);
+	dml_print("DML: clk_cfg: dcfclk_mhz = %f\n", clk_cfg->dcfclk_mhz);
+	dml_print("DML: clk_cfg: dispclk_mhz = %f\n", clk_cfg->dispclk_mhz);
 
 	for (dml_uint_t i = 0; i < DCN_DML__NUM_PLANE; i++) {
 		dml_print("DML: clk_cfg: i=%d, dppclk_option = %d\n", i, clk_cfg->dppclk_option[i]);
-		dml_print("DML: clk_cfg: i=%d, dppclk_freq_mhz = %f\n", i, clk_cfg->dppclk_freq_mhz[i]);
+		dml_print("DML: clk_cfg: i=%d, dppclk_mhz = %f\n", i, clk_cfg->dppclk_mhz[i]);
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
index c6a5a8614679..730bf35e6043 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_translation_helper.c
@@ -1226,22 +1226,22 @@ void dml21_set_dc_p_state_type(
 		bool sub_vp_enabled)
 {
 	switch (stream_programming->uclk_pstate_method) {
-	case dml2_uclk_pstate_support_method_vactive:
-	case dml2_uclk_pstate_support_method_fw_vactive_drr:
+	case dml2_pstate_method_vactive:
+	case dml2_pstate_method_fw_vactive_drr:
 		pipe_ctx->p_state_type = P_STATE_V_ACTIVE;
 		break;
-	case dml2_uclk_pstate_support_method_vblank:
-	case dml2_uclk_pstate_support_method_fw_vblank_drr:
+	case dml2_pstate_method_vblank:
+	case dml2_pstate_method_fw_vblank_drr:
 		if (sub_vp_enabled)
 			pipe_ctx->p_state_type = P_STATE_V_BLANK_SUB_VP;
 		else
 			pipe_ctx->p_state_type = P_STATE_V_BLANK;
 		break;
-	case dml2_uclk_pstate_support_method_fw_subvp_phantom:
-	case dml2_uclk_pstate_support_method_fw_subvp_phantom_drr:
+	case dml2_pstate_method_fw_svp:
+	case dml2_pstate_method_fw_svp_drr:
 		pipe_ctx->p_state_type = P_STATE_SUB_VP;
 		break;
-	case dml2_uclk_pstate_support_method_fw_drr:
+	case dml2_pstate_method_fw_drr:
 		if (sub_vp_enabled)
 			pipe_ctx->p_state_type = P_STATE_DRR_SUB_VP;
 		else
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
index 8b18027b8357..793e1c038efd 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h
@@ -344,6 +344,7 @@ static const struct dml2_ip_capabilities dml2_dcn401_max_ip_caps = {
 	.config_return_buffer_segment_size_in_kbytes = 64,
 	.meta_fifo_size_in_kentries = 22,
 	.compressed_buffer_segment_size_in_kbytes = 64,
+	.cursor_buffer_size = 24,
 	.max_flip_time_us = 80,
 	.max_flip_time_lines = 32,
 	.hostvm_mode = 0,
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
index b132f676a68d..5e1ab6d97640 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_display_cfg_types.h
@@ -10,9 +10,10 @@
 #define DML2_MAX_PLANES 8
 #define DML2_MAX_DCN_PIPES 8
 #define DML2_MAX_MCACHES 8 // assume plane is going to be supported by a max of 8 mcaches
+#define DML2_MAX_WRITEBACK 3
 
 enum dml2_swizzle_mode {
-	dml2_sw_linear,
+	dml2_sw_linear, // SW_LINEAR accepts 256 byte aligned pitch and also 128 byte aligned pitch if DCC is not enabled
 	dml2_sw_256b_2d,
 	dml2_sw_4kb_2d,
 	dml2_sw_64kb_2d,
@@ -24,7 +25,8 @@ enum dml2_swizzle_mode {
 	dml2_gfx11_sw_64kb_d_x,
 	dml2_gfx11_sw_64kb_r_x,
 	dml2_gfx11_sw_256kb_d_x,
-	dml2_gfx11_sw_256kb_r_x
+	dml2_gfx11_sw_256kb_r_x,
+
 };
 
 enum dml2_source_format_class {
@@ -38,7 +40,13 @@ enum dml2_source_format_class {
 	dml2_rgbe_alpha = 9,
 	dml2_rgbe = 10,
 	dml2_mono_8 = 11,
-	dml2_mono_16 = 12
+	dml2_mono_16 = 12,
+	dml2_422_planar_8 = 13,
+	dml2_422_planar_10 = 14,
+	dml2_422_planar_12 = 15,
+	dml2_422_packed_8 = 16,
+	dml2_422_packed_10 = 17,
+	dml2_422_packed_12 = 18
 };
 
 enum dml2_rotation_angle {
@@ -121,15 +129,6 @@ enum dml2_dsc_enable_option {
 	dml2_dsc_enable_if_necessary = 2
 };
 
-enum dml2_pstate_support_method {
-	dml2_pstate_method_uninitialized,
-	dml2_pstate_method_not_supported,
-	dml2_pstate_method_vactive,
-	dml2_pstate_method_vblank,
-	dml2_pstate_method_svp,
-	dml2_pstate_method_drr
-};
-
 enum dml2_tdlut_addressing_mode {
 	dml2_tdlut_sw_linear = 0,
 	dml2_tdlut_simple_linear = 1
@@ -287,22 +286,23 @@ struct dml2_link_output_cfg {
 	bool validate_output; // Do not validate the link configuration for this display stream.
 };
 
-struct dml2_writeback_cfg {
-	bool enable;
+struct dml2_writeback_info {
 	enum dml2_source_format_class pixel_format;
-	unsigned int active_writebacks_per_surface;
+	unsigned long input_width;
+	unsigned long input_height;
+	unsigned long output_width;
+	unsigned long output_height;
+	unsigned long v_taps;
+	unsigned long h_taps;
+	unsigned long v_taps_chroma;
+	unsigned long h_taps_chroma;
+	double h_ratio;
+	double v_ratio;
+};
 
-	struct {
-		bool enabled;
-		unsigned long input_width;
-		unsigned long input_height;
-		unsigned long output_width;
-		unsigned long output_height;
-		unsigned long v_taps;
-		unsigned long h_taps;
-		double h_ratio;
-		double v_ratio;
-	} scaling_info;
+struct dml2_writeback_cfg {
+	unsigned int active_writebacks_per_stream;
+	struct dml2_writeback_info writeback_stream[DML2_MAX_WRITEBACK];
 };
 
 struct dml2_plane_parameters {
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
index ebd8abe894a9..5f0bc42d1d2f 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_soc_parameter_types.h
@@ -167,11 +167,13 @@ struct dml2_ip_capabilities {
 	unsigned int max_num_dp2p0_streams;
 	unsigned int max_num_hdmi_frl_outputs;
 	unsigned int max_num_dp2p0_outputs;
+	unsigned int max_num_wb;
 	unsigned int rob_buffer_size_kbytes;
 	unsigned int config_return_buffer_size_in_kbytes;
 	unsigned int config_return_buffer_segment_size_in_kbytes;
 	unsigned int meta_fifo_size_in_kentries;
 	unsigned int compressed_buffer_segment_size_in_kbytes;
+	unsigned int cursor_buffer_size;
 	unsigned int max_flip_time_us;
 	unsigned int max_flip_time_lines;
 	unsigned int hostvm_mode;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
index 476cbd7a4790..b2ae6232673b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/inc/dml_top_types.h
@@ -26,20 +26,14 @@ enum dml2_project_id {
 	dml2_project_dcn4x_stage2_auto_drr_svp = 3,
 };
 
-enum dml2_dram_clock_change_support {
-	dml2_dram_clock_change_vactive = 0,
-	dml2_dram_clock_change_vblank = 1,
-	dml2_dram_clock_change_vblank_and_vactive = 2,
-	dml2_dram_clock_change_drr = 3,
-	dml2_dram_clock_change_mall_svp = 4,
-	dml2_dram_clock_change_mall_full_frame = 6,
-	dml2_dram_clock_change_unsupported = 7
-};
-
-enum dml2_fclock_change_support {
-	dml2_fclock_change_vactive = 0,
-	dml2_fclock_change_vblank = 1,
-	dml2_fclock_change_unsupported = 2
+enum dml2_pstate_change_support {
+	dml2_pstate_change_vactive = 0,
+	dml2_pstate_change_vblank = 1,
+	dml2_pstate_change_vblank_and_vactive = 2,
+	dml2_pstate_change_drr = 3,
+	dml2_pstate_change_mall_svp = 4,
+	dml2_pstate_change_mall_full_frame = 6,
+	dml2_pstate_change_unsupported = 7
 };
 
 enum dml2_output_type_and_rate__type {
@@ -202,24 +196,23 @@ struct dml2_mcache_surface_allocation {
 	} informative;
 };
 
-enum dml2_uclk_pstate_support_method {
-	dml2_uclk_pstate_support_method_not_supported = 0,
-	/* hw */
-	dml2_uclk_pstate_support_method_vactive = 1,
-	dml2_uclk_pstate_support_method_vblank = 2,
-	dml2_uclk_pstate_support_method_reserved_hw = 5,
-	/* fw */
-	dml2_uclk_pstate_support_method_fw_subvp_phantom = 6,
-	dml2_uclk_pstate_support_method_reserved_fw = 10,
-	/* fw w/drr */
-	dml2_uclk_pstate_support_method_fw_vactive_drr = 11,
-	dml2_uclk_pstate_support_method_fw_vblank_drr = 12,
-	dml2_uclk_pstate_support_method_fw_subvp_phantom_drr = 13,
-	dml2_uclk_pstate_support_method_reserved_fw_drr_fixed = 20,
-	dml2_uclk_pstate_support_method_fw_drr = 21,
-	dml2_uclk_pstate_support_method_reserved_fw_drr_var = 22,
-
-	dml2_uclk_pstate_support_method_count
+enum dml2_pstate_method {
+	dml2_pstate_method_na = 0,
+	/* hw exclusive modes */
+	dml2_pstate_method_vactive = 1,
+	dml2_pstate_method_vblank = 2,
+	dml2_pstate_method_reserved_hw = 5,
+	/* fw assisted exclusive modes */
+	dml2_pstate_method_fw_svp = 6,
+	dml2_pstate_method_reserved_fw = 10,
+	/* fw assisted modes requiring drr modulation */
+	dml2_pstate_method_fw_vactive_drr = 11,
+	dml2_pstate_method_fw_vblank_drr = 12,
+	dml2_pstate_method_fw_svp_drr = 13,
+	dml2_pstate_method_reserved_fw_drr_clamped = 20,
+	dml2_pstate_method_fw_drr = 21,
+	dml2_pstate_method_reserved_fw_drr_var = 22,
+	dml2_pstate_method_count
 };
 
 struct dml2_per_plane_programming {
@@ -241,7 +234,7 @@ struct dml2_per_plane_programming {
 	// If a stream is using odm split, then this value is always 1
 	unsigned int num_dpps_required;
 
-	enum dml2_uclk_pstate_support_method uclk_pstate_support_method;
+	enum dml2_pstate_method uclk_pstate_support_method;
 
 	// MALL size requirements for MALL SS and SubVP
 	unsigned int surface_size_mall_bytes;
@@ -281,7 +274,7 @@ struct dml2_per_stream_programming {
 
 	unsigned int num_odms_required;
 
-	enum dml2_uclk_pstate_support_method uclk_pstate_method;
+	enum dml2_pstate_method uclk_pstate_method;
 
 	struct {
 		bool enabled;
@@ -340,7 +333,7 @@ struct dml2_mode_support_info {
 	bool DCCMetaBufferSizeNotExceeded;
 	bool TotalVerticalActiveBandwidthSupport;
 	bool VActiveBandwidthSupport;
-	enum dml2_fclock_change_support FCLKChangeSupport[DML2_MAX_PLANES];
+	enum dml2_pstate_change_support FCLKChangeSupport[DML2_MAX_PLANES];
 	bool USRRetrainingSupport;
 	bool PrefetchSupported;
 	bool DynamicMetadataSupported;
@@ -362,6 +355,7 @@ struct dml2_mode_support_info {
 	unsigned int AlignedYPitch[DML2_MAX_PLANES];
 	unsigned int AlignedCPitch[DML2_MAX_PLANES];
 	bool g6_temp_read_support;
+	bool temp_read_or_ppt_support;
 }; // dml2_mode_support_info
 
 struct dml2_display_cfg_programming {
@@ -445,7 +439,7 @@ struct dml2_display_cfg_programming {
 			double pstate_change_us;
 			double fclk_pstate_change_us;
 			double usr_retraining_us;
-			double g6_temp_read_watermark_us;
+			double temp_read_or_ppt_watermark_us;
 		} watermarks;
 
 		struct {
@@ -654,6 +648,7 @@ struct dml2_display_cfg_programming {
 			double DisplayPipeLineDeliveryTimeLumaPrefetch[DML2_MAX_PLANES];
 			double DisplayPipeLineDeliveryTimeChromaPrefetch[DML2_MAX_PLANES];
 
+			double WritebackRequiredBandwidth;
 			double WritebackAllowDRAMClockChangeEndPosition[DML2_MAX_PLANES];
 			double WritebackAllowFCLKChangeEndPosition[DML2_MAX_PLANES];
 			double DSCCLK_calculated[DML2_MAX_PLANES];
@@ -663,6 +658,7 @@ struct dml2_display_cfg_programming {
 			double MaxActiveDRAMClockChangeLatencySupported[DML2_MAX_PLANES];
 			unsigned int PrefetchMode[DML2_MAX_PLANES]; // LEGACY_ONLY
 			bool ROBUrgencyAvoidance;
+			double LowestPrefetchMargin;
 		} misc;
 
 		struct dml2_mode_support_info mode_support_info;
@@ -676,6 +672,7 @@ struct dml2_display_cfg_programming {
 		bool failed_mcache_validation;
 		bool failed_dpmm;
 		bool failed_mode_programming;
+		bool failed_map_watermarks;
 	} informative;
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
index 367dc8ca89a9..d68b4567e218 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c
@@ -9,7 +9,7 @@
 #include "dml2_debug.h"
 #include "lib_float_math.h"
 
-static const struct dml2_core_ip_params core_dcn4_ip_caps_base = {
+struct dml2_core_ip_params core_dcn4_ip_caps_base = {
 	// Hardcoded values for DCN3x
 	.vblank_nom_default_us = 668,
 	.remote_iommu_outstanding_translations = 256,
@@ -90,6 +90,7 @@ static void patch_ip_caps_with_explicit_ip_params(struct dml2_ip_capabilities *i
 	ip_caps->config_return_buffer_segment_size_in_kbytes = ip_params->config_return_buffer_segment_size_in_kbytes;
 	ip_caps->meta_fifo_size_in_kentries = ip_params->meta_fifo_size_in_kentries;
 	ip_caps->compressed_buffer_segment_size_in_kbytes = ip_params->compressed_buffer_segment_size_in_kbytes;
+	ip_caps->cursor_buffer_size = ip_params->cursor_buffer_size;
 	ip_caps->max_flip_time_us = ip_params->max_flip_time_us;
 	ip_caps->max_flip_time_lines = ip_params->max_flip_time_lines;
 	ip_caps->hostvm_mode = ip_params->hostvm_mode;
@@ -114,6 +115,7 @@ static void patch_ip_params_with_ip_caps(struct dml2_core_ip_params *ip_params,
 	ip_params->config_return_buffer_segment_size_in_kbytes = ip_caps->config_return_buffer_segment_size_in_kbytes;
 	ip_params->meta_fifo_size_in_kentries = ip_caps->meta_fifo_size_in_kentries;
 	ip_params->compressed_buffer_segment_size_in_kbytes = ip_caps->compressed_buffer_segment_size_in_kbytes;
+	ip_params->cursor_buffer_size = ip_caps->cursor_buffer_size;
 	ip_params->max_flip_time_us = ip_caps->max_flip_time_us;
 	ip_params->max_flip_time_lines = ip_caps->max_flip_time_lines;
 	ip_params->hostvm_mode = ip_caps->hostvm_mode;
@@ -316,28 +318,9 @@ static void pack_mode_programming_params_with_implicit_subvp(struct dml2_core_in
 
 		// Setup the appropriate p-state strategy
 		if (display_cfg->stage3.performed && display_cfg->stage3.success) {
-			switch (display_cfg->stage3.pstate_switch_modes[plane_index]) {
-			case dml2_uclk_pstate_support_method_vactive:
-			case dml2_uclk_pstate_support_method_vblank:
-			case dml2_uclk_pstate_support_method_fw_subvp_phantom:
-			case dml2_uclk_pstate_support_method_fw_drr:
-			case dml2_uclk_pstate_support_method_fw_vactive_drr:
-			case dml2_uclk_pstate_support_method_fw_vblank_drr:
-			case dml2_uclk_pstate_support_method_fw_subvp_phantom_drr:
-				programming->plane_programming[plane_index].uclk_pstate_support_method = display_cfg->stage3.pstate_switch_modes[plane_index];
-				break;
-			case dml2_uclk_pstate_support_method_reserved_hw:
-			case dml2_uclk_pstate_support_method_reserved_fw:
-			case dml2_uclk_pstate_support_method_reserved_fw_drr_fixed:
-			case dml2_uclk_pstate_support_method_reserved_fw_drr_var:
-			case dml2_uclk_pstate_support_method_not_supported:
-			case dml2_uclk_pstate_support_method_count:
-			default:
-				programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_not_supported;
-				break;
-			}
+			programming->plane_programming[plane_index].uclk_pstate_support_method = display_cfg->stage3.pstate_switch_modes[plane_index];
 		} else {
-			programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_not_supported;
+			programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_pstate_method_na;
 		}
 
 		dml2_core_calcs_get_mall_allocation(&core->clean_me_up.mode_lib, &programming->plane_programming[plane_index].surface_size_mall_bytes, dml_internal_pipe_index);
@@ -573,18 +556,18 @@ bool core_dcn4_mode_programming(struct dml2_core_mode_programming_in_out *in_out
 				in_out->programming->plane_programming[plane_index].num_dpps_required = core->clean_me_up.mode_lib.mp.NoOfDPP[plane_index];
 
 				if (in_out->programming->display_config.plane_descriptors[plane_index].overrides.legacy_svp_config == dml2_svp_mode_override_main_pipe)
-					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
+					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_pstate_method_fw_svp;
 				else if (in_out->programming->display_config.plane_descriptors[plane_index].overrides.legacy_svp_config == dml2_svp_mode_override_phantom_pipe)
-					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
+					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_pstate_method_fw_svp;
 				else if (in_out->programming->display_config.plane_descriptors[plane_index].overrides.legacy_svp_config == dml2_svp_mode_override_phantom_pipe_no_data_return)
-					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_fw_subvp_phantom;
+					in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_pstate_method_fw_svp;
 				else {
 					if (core->clean_me_up.mode_lib.mp.MaxActiveDRAMClockChangeLatencySupported[plane_index] >= core->clean_me_up.mode_lib.soc.power_management_parameters.dram_clk_change_blackout_us)
-						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_vactive;
+						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_pstate_method_vactive;
 					else if (core->clean_me_up.mode_lib.mp.TWait[plane_index] >= core->clean_me_up.mode_lib.soc.power_management_parameters.dram_clk_change_blackout_us)
-						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_vblank;
+						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_pstate_method_vblank;
 					else
-						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_uclk_pstate_support_method_not_supported;
+						in_out->programming->plane_programming[plane_index].uclk_pstate_support_method = dml2_pstate_method_na;
 				}
 
 				dml2_core_calcs_get_mall_allocation(&core->clean_me_up.mode_lib, &in_out->programming->plane_programming[plane_index].surface_size_mall_bytes, dml_internal_pipe_index);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
index 74baa480441f..b9ec243cf9ba 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c
@@ -11,8 +11,10 @@
 
 #define DML2_MAX_FMT_420_BUFFER_WIDTH 4096
 #define DML_MAX_NUM_OF_SLICES_PER_DSC 4
+#define DML_MAX_COMPRESSION_RATIO 4
+//#define DML_MODE_SUPPORT_USE_DPM_DRAM_BW
+//#define DML_GLOBAL_PREFETCH_CHECK
 #define ALLOW_SDPIF_RATE_LIMIT_PRE_CSTATE
-#define DML_PREFETCH_OTO_BW_CAP_FIX // just cap prefetch_bw_oto to max_vratio_oto
 
 const char *dml2_core_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type)
 {
@@ -133,9 +135,9 @@ static void dml2_print_mode_support_info(const struct dml2_core_internal_mode_su
 		dml2_printf("DML: support: DynamicMetadataSupported = %d\n", support->DynamicMetadataSupported);
 	if (!fail_only || support->VRatioInPrefetchSupported == 0)
 		dml2_printf("DML: support: VRatioInPrefetchSupported = %d\n", support->VRatioInPrefetchSupported);
-	if (!fail_only || support->PTEBufferSizeNotExceeded == 1)
+	if (!fail_only || support->PTEBufferSizeNotExceeded == 0)
 		dml2_printf("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
-	if (!fail_only || support->DCCMetaBufferSizeNotExceeded == 1)
+	if (!fail_only || support->DCCMetaBufferSizeNotExceeded == 0)
 		dml2_printf("DML: support: DCCMetaBufferSizeNotExceeded = %d\n", support->DCCMetaBufferSizeNotExceeded);
 	if (!fail_only || support->ExceededMALLSize == 1)
 		dml2_printf("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
@@ -316,12 +318,11 @@ dml_get_var_func(meta_trip_memory_us, double, mode_lib->mp.MetaTripToMemory);
 
 dml_get_var_func(wm_fclk_change, double, mode_lib->mp.Watermark.FCLKChangeWatermark);
 dml_get_var_func(wm_usr_retraining, double, mode_lib->mp.Watermark.USRRetrainingWatermark);
-dml_get_var_func(wm_g6_temp_read, double, mode_lib->mp.Watermark.g6_temp_read_watermark_us);
+dml_get_var_func(wm_temp_read_or_ppt, double, mode_lib->mp.Watermark.temp_read_or_ppt_watermark_us);
 dml_get_var_func(wm_dram_clock_change, double, mode_lib->mp.Watermark.DRAMClockChangeWatermark);
 dml_get_var_func(fraction_of_urgent_bandwidth, double, mode_lib->mp.FractionOfUrgentBandwidth);
 dml_get_var_func(fraction_of_urgent_bandwidth_imm_flip, double, mode_lib->mp.FractionOfUrgentBandwidthImmediateFlip);
 dml_get_var_func(fraction_of_urgent_bandwidth_mall, double, mode_lib->mp.FractionOfUrgentBandwidthMALL);
-dml_get_var_func(urgent_latency, double, mode_lib->mp.UrgentLatency);
 dml_get_var_func(wm_writeback_dram_clock_change, double, mode_lib->mp.Watermark.WritebackDRAMClockChangeWatermark);
 dml_get_var_func(wm_writeback_fclk_change, double, mode_lib->mp.Watermark.WritebackFCLKChangeWatermark);
 dml_get_var_func(stutter_efficiency, double, mode_lib->mp.StutterEfficiency);
@@ -356,7 +357,9 @@ dml_get_var_func(svp_prefetch_urg_bw_available_sdp, double, mode_lib->mp.urg_ban
 dml_get_var_func(svp_prefetch_urg_bw_available_dram, double, mode_lib->mp.urg_bandwidth_available[dml2_core_internal_soc_state_svp_prefetch][dml2_core_internal_bw_dram]);
 dml_get_var_func(svp_prefetch_urg_bw_available_dram_vm_only, double, mode_lib->mp.urg_bandwidth_available_vm_only[dml2_core_internal_soc_state_svp_prefetch]);
 
+dml_get_var_func(urgent_latency, double, mode_lib->mp.UrgentLatency);
 dml_get_var_func(max_urgent_latency_us, double, mode_lib->ms.support.max_urgent_latency_us);
+dml_get_var_func(max_non_urgent_latency_us, double, mode_lib->ms.support.max_non_urgent_latency_us);
 dml_get_var_func(avg_non_urgent_latency_us, double, mode_lib->ms.support.avg_non_urgent_latency_us);
 dml_get_var_func(avg_urgent_latency_us, double, mode_lib->ms.support.avg_urgent_latency_us);
 
@@ -467,6 +470,24 @@ static bool dml_is_420(enum dml2_source_format_class source_format)
 	case dml2_420_12:
 		val = 1;
 		break;
+	case dml2_422_planar_8:
+		val = 0;
+		break;
+	case dml2_422_planar_10:
+		val = 0;
+		break;
+	case dml2_422_planar_12:
+		val = 0;
+		break;
+	case dml2_422_packed_8:
+		val = 0;
+		break;
+	case dml2_422_packed_10:
+		val = 0;
+		break;
+	case dml2_422_packed_12:
+		val = 0;
+		break;
 	case dml2_rgbe_alpha:
 		val = 0;
 		break;
@@ -488,32 +509,31 @@ static bool dml_is_420(enum dml2_source_format_class source_format)
 
 static unsigned int dml_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode)
 {
-	switch (sw_mode) {
-	case (dml2_sw_linear):
-		return 256; break;
-	case (dml2_sw_256b_2d):
-		return 256; break;
-	case (dml2_sw_4kb_2d):
-		return 4096; break;
-	case (dml2_sw_64kb_2d):
-		return 65536; break;
-	case (dml2_sw_256kb_2d):
-		return 262144; break;
-	case (dml2_gfx11_sw_linear):
-		return 256; break;
-	case (dml2_gfx11_sw_64kb_d):
-		return 65536; break;
-	case (dml2_gfx11_sw_64kb_d_t):
-		return 65536; break;
-	case (dml2_gfx11_sw_64kb_d_x):
-		return 65536; break;
-	case (dml2_gfx11_sw_64kb_r_x):
-		return 65536; break;
-	case (dml2_gfx11_sw_256kb_d_x):
-		return 262144; break;
-	case (dml2_gfx11_sw_256kb_r_x):
-		return 262144; break;
-	default:
+	if (sw_mode == dml2_sw_linear)
+		return 256;
+	else if (sw_mode == dml2_sw_256b_2d)
+		return 256;
+	else if (sw_mode == dml2_sw_4kb_2d)
+		return 4096;
+	else if (sw_mode == dml2_sw_64kb_2d)
+		return 65536;
+	else if (sw_mode == dml2_sw_256kb_2d)
+		return 262144;
+	else if (sw_mode == dml2_gfx11_sw_linear)
+		return 256;
+	else if (sw_mode == dml2_gfx11_sw_64kb_d)
+		return 65536;
+	else if (sw_mode == dml2_gfx11_sw_64kb_d_t)
+		return 65536;
+	else if (sw_mode == dml2_gfx11_sw_64kb_d_x)
+		return 65536;
+	else if (sw_mode == dml2_gfx11_sw_64kb_r_x)
+		return 65536;
+	else if (sw_mode == dml2_gfx11_sw_256kb_d_x)
+		return 262144;
+	else if (sw_mode == dml2_gfx11_sw_256kb_r_x)
+		return 262144;
+	else {
 		DML2_ASSERT(0);
 		return 256;
 	}
@@ -821,7 +841,7 @@ static void CalculateSwathWidth(
 	// Output
 	unsigned int req_per_swath_ub_l[],
 	unsigned int req_per_swath_ub_c[],
-	unsigned int SwathWidthSingleDPPY[],
+	unsigned int SwathWidthSingleDPPY[], // post-rotated plane width
 	unsigned int SwathWidthSingleDPPC[],
 	unsigned int SwathWidthY[], // per-pipe
 	unsigned int SwathWidthC[], // per-pipe
@@ -1404,7 +1424,6 @@ static unsigned int dscceComputeDelay(
 	// N422/N420 operate at 2 pixels per clock
 	unsigned int pixelsPerClock, padding_pixels, ssm_group_priming_delay, ssm_pipeline_delay, obsm_pipeline_delay, slice_padded_pixels, ixd_plus_padding, ixd_plus_padding_groups, cycles_per_group, group_delay, pipeline_delay, pixels, additional_group_delay, lines_to_reach_ixd, groups_to_reach_ixd, slice_width_groups, initial_xmit_delay, number_of_lines_to_reach_ixd, slice_width_modified;
 
-
 	if (pixelFormat == dml2_420)
 		pixelsPerClock = 2;
 	// #all other modes operate at 1 pixel per clock
@@ -1429,7 +1448,6 @@ static unsigned int dscceComputeDelay(
 		}
 	}
 
-
 	//sub-stream multiplexer balance fifo priming delay in groups as per dsc standard
 	if (bpc == 8)
 		ssm_group_priming_delay = 83;
@@ -1448,9 +1466,6 @@ static unsigned int dscceComputeDelay(
 	//determine number of padded pixels in the last group of a slice line, computed as
 	slice_padded_pixels = 3 * slice_width_groups - slice_width_modified;
 
-
-
-
 	//determine integer number of complete slice lines required to reach initial transmit delay without ssm delay considered
 	number_of_lines_to_reach_ixd = initial_xmit_delay / slice_width_modified;
 
@@ -1464,7 +1479,6 @@ static unsigned int dscceComputeDelay(
 	//number of groups required for a slice to reach initial transmit delay is the sum of the padded initial transmit delay plus the ssm group priming delay
 	groups_to_reach_ixd = ixd_plus_padding_groups + ssm_group_priming_delay;
 
-
 	//number of lines required to reach padded initial transmit delay in groups in slices to the left of the last horizontal slice
 	//needs to be rounded up as a complete slice lines are buffered prior to initial transmit delay being reached in the last horizontal slice
 	lines_to_reach_ixd = (groups_to_reach_ixd + slice_width_groups - 1) / slice_width_groups; //round up lines to reach ixd to next
@@ -1507,7 +1521,6 @@ static unsigned int dscceComputeDelay(
 	return pixels;
 }
 
-
 //updated in dcn4
 static unsigned int dscComputeDelay(enum dml2_output_format_class pixelFormat, enum dml2_output_encoder_class Output)
 {
@@ -2091,7 +2104,6 @@ static void CalculateDCCConfiguration(
 		yuv420 = 1;
 	else
 		yuv420 = 0;
-
 	horz_div_l = 1;
 	horz_div_c = 1;
 	vert_div_l = 1;
@@ -2562,8 +2574,7 @@ static void calculate_mcache_setting(
 	if (*p->num_mcaches_l) {
 		l->avg_mcache_element_size_l = l->meta_row_width_l / *p->num_mcaches_l;
 	}
-
-	if (l->is_dual_plane && *p->num_mcaches_c) {
+	if (l->is_dual_plane) {
 		l->avg_mcache_element_size_c = l->meta_row_width_c / *p->num_mcaches_c;
 
 		if (!p->imall_enable || (*p->mall_comb_mcache_l == *p->mall_comb_mcache_c)) {
@@ -2683,12 +2694,12 @@ static double dml_get_return_bandwidth_available(
 	bool is_avg_bw,
 	bool is_hvm_en,
 	bool is_hvm_only,
-	double dcflk_mhz,
+	double dcfclk_mhz,
 	double fclk_mhz,
 	double dram_bw_mbps)
 {
 	double return_bw_mbps = 0.;
-	double ideal_sdp_bandwidth = (double)soc->return_bus_width_bytes * dcflk_mhz;
+	double ideal_sdp_bandwidth = (double)soc->return_bus_width_bytes * dcfclk_mhz;
 	double ideal_fabric_bandwidth = fclk_mhz * (double)soc->fabric_datapath_to_dcn_data_return_bytes;
 	double ideal_dram_bandwidth = dram_bw_mbps; //dram_speed_mts * soc->clk_table.dram_config.channel_count * soc->clk_table.dram_config.channel_width_bytes;
 
@@ -2754,7 +2765,7 @@ static double dml_get_return_bandwidth_available(
 	dml2_printf("DML::%s: is_hvm_only = %u\n", __func__, is_hvm_only);
 	dml2_printf("DML::%s: state_type = %s\n", __func__, dml2_core_internal_soc_state_type_str(state_type));
 	dml2_printf("DML::%s: bw_type = %s\n", __func__, dml2_core_internal_bw_type_str(bw_type));
-	dml2_printf("DML::%s: dcflk_mhz = %f\n", __func__, dcflk_mhz);
+	dml2_printf("DML::%s: dcfclk_mhz = %f\n", __func__, dcfclk_mhz);
 	dml2_printf("DML::%s: fclk_mhz = %f\n", __func__, fclk_mhz);
 	dml2_printf("DML::%s: ideal_sdp_bandwidth = %f\n", __func__, ideal_sdp_bandwidth);
 	dml2_printf("DML::%s: ideal_fabric_bandwidth = %f\n", __func__, ideal_fabric_bandwidth);
@@ -3817,8 +3828,8 @@ static void CalculateSwathAndDETConfiguration(struct dml2_core_internal_scratch
 			p->SwathHeightC[k] = MaximumSwathHeightC[k] / 2;
 			RoundedUpSwathSizeBytesY[k] = p->full_swath_bytes_l[k] / 2;
 			RoundedUpSwathSizeBytesC[k] = p->full_swath_bytes_c[k] / 2;
-			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
-			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;
+			p->request_size_bytes_luma[k] = ((p->BytePerPixY[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
+			p->request_size_bytes_chroma[k] = ((p->BytePerPixC[k] == 2) == dml_is_vertical_rotation(p->display_cfg->plane_descriptors[k].composition.rotation_angle)) ? 128 : 64;;
 		}
 
 		if (p->SwathHeightC[k] == 0)
@@ -5070,20 +5081,18 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	s->trip_to_mem = 0.0;
 	*p->Tvm_trips = 0.0;
 	*p->Tr0_trips = 0.0;
-	s->Tvm_no_trip_oto = 0.0;
-	s->Tr0_no_trip_oto = 0.0;
 	s->Tvm_trips_rounded = 0.0;
 	s->Tr0_trips_rounded = 0.0;
 	s->max_Tsw = 0.0;
 	s->Lsw_oto = 0.0;
-	s->Tpre_rounded = 0.0;
+	*p->Tpre_rounded = 0.0;
 	s->prefetch_bw_equ = 0.0;
 	s->Tvm_equ = 0.0;
 	s->Tr0_equ = 0.0;
 	s->Tdmbf = 0.0;
 	s->Tdmec = 0.0;
 	s->Tdmsks = 0.0;
-	s->prefetch_sw_bytes = 0.0;
+	*p->prefetch_sw_bytes = 0.0;
 	s->prefetch_bw_pr = 0.0;
 	s->bytes_pp = 0.0;
 	s->dep_bytes = 0.0;
@@ -5208,6 +5217,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	dml2_printf("DML::%s: setup_for_tdlut = %u\n", __func__, p->setup_for_tdlut);
 	dml2_printf("DML::%s: tdlut_opt_time = %f\n", __func__, p->tdlut_opt_time);
 	dml2_printf("DML::%s: tdlut_pte_bytes_per_frame = %u\n", __func__, p->tdlut_pte_bytes_per_frame);
+	dml2_printf("DML::%s: tdlut_drain_time = %f\n", __func__, p->tdlut_drain_time);
 #endif
 
 	if (p->OutputFormat == dml2_420 || (p->myPipe->InterlaceEnable && p->myPipe->ProgressiveToInterlaceUnitInOPP))
@@ -5278,23 +5288,8 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		s->bytes_pp = p->myPipe->BytePerPixelY + p->myPipe->BytePerPixelC;
 	}
 
-	s->prefetch_bw_pr = s->bytes_pp * p->myPipe->PixelClock / (double)p->myPipe->DPPPerSurface;
-	if (p->myPipe->VRatio < 1.0)
-		s->prefetch_bw_pr = p->myPipe->VRatio * s->prefetch_bw_pr;
-	s->max_Tsw = (math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) * s->LineTime);
-
-	s->prefetch_sw_bytes = p->PrefetchSourceLinesY * p->swath_width_luma_ub * p->myPipe->BytePerPixelY + p->PrefetchSourceLinesC * p->swath_width_chroma_ub * p->myPipe->BytePerPixelC;
-	s->prefetch_bw_pr = s->prefetch_bw_pr * p->mall_prefetch_sdp_overhead_factor;
-	s->prefetch_sw_bytes = s->prefetch_sw_bytes * p->mall_prefetch_sdp_overhead_factor;
-	s->prefetch_bw_oto = math_max2(s->prefetch_bw_pr, s->prefetch_sw_bytes / s->max_Tsw);
-
-	s->min_Lsw_oto = math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) / __DML2_CALCS_MAX_VRATIO_PRE_OTO__;
-	s->min_Lsw_oto = math_max2(s->min_Lsw_oto, 2.0);
-	s->min_Lsw_oto = math_max2(s->min_Lsw_oto, p->tdlut_drain_time / s->LineTime);
-
-	s->min_Lsw_equ = math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) / __DML2_CALCS_MAX_VRATIO_PRE_EQU__;
-	s->min_Lsw_equ = math_max2(s->min_Lsw_equ, 2.0);
-	s->min_Lsw_equ = math_max2(s->min_Lsw_equ, p->tdlut_drain_time / s->LineTime);
+	*p->prefetch_sw_bytes = p->PrefetchSourceLinesY * p->swath_width_luma_ub * p->myPipe->BytePerPixelY + p->PrefetchSourceLinesC * p->swath_width_chroma_ub * p->myPipe->BytePerPixelC;
+	*p->prefetch_sw_bytes = *p->prefetch_sw_bytes * p->mall_prefetch_sdp_overhead_factor;
 
 	vm_bytes = p->vm_bytes; // vm_bytes is dpde0_bytes_per_frame_ub_l + dpde0_bytes_per_frame_ub_c + 2*extra_dpde_bytes;
 	extra_tdpe_bytes = (unsigned int)math_max2(0, (p->display_cfg->gpuvm_max_page_table_levels - 1) * 128);
@@ -5304,66 +5299,102 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 
 	tdlut_row_bytes = (unsigned long) math_ceil2(p->tdlut_bytes_per_frame/2.0, 1.0);
 
-#ifdef DML_PREFETCH_OTO_BW_CAP_FIX
-	s->prefetch_bw_oto = math_min2(s->prefetch_bw_oto, s->prefetch_sw_bytes/(s->min_Lsw_oto*s->LineTime));
+	s->min_Lsw_oto = math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) / __DML2_CALCS_MAX_VRATIO_PRE_OTO__;
+	s->min_Lsw_oto = math_max2(s->min_Lsw_oto, p->tdlut_drain_time / s->LineTime);
+	s->min_Lsw_oto = math_max2(s->min_Lsw_oto, 2.0);
+
+	// use vactive swath bw for prefetch oto and also cap prefetch_bw_oto to max_vratio_oto
+	// Note: in prefetch calculation, acounting is done mostly per-pipe.
+	// vactive swath bw represents the per-surface (aka per dml plane) bw to move vratio_l/c lines of bytes_l/c per line time
+	s->per_pipe_vactive_sw_bw = p->vactive_sw_bw_l / (double)p->myPipe->DPPPerSurface;
+
+	// one-to-one prefetch bw as one line of bytes per line time (as per vratio_pre_l/c = 1)
+	s->prefetch_bw_oto = (p->swath_width_luma_ub * p->myPipe->BytePerPixelY) / s->LineTime;
+
+	if (p->myPipe->BytePerPixelC > 0) {
+		s->per_pipe_vactive_sw_bw += p->vactive_sw_bw_c / (double)p->myPipe->DPPPerSurface;
+		s->prefetch_bw_oto += (p->swath_width_chroma_ub * p->myPipe->BytePerPixelC) / s->LineTime;
+	}
+
+	s->prefetch_bw_oto = math_max2(s->per_pipe_vactive_sw_bw, s->prefetch_bw_oto) * p->mall_prefetch_sdp_overhead_factor;
+
+	s->prefetch_bw_oto = math_min2(s->prefetch_bw_oto, *p->prefetch_sw_bytes/(s->min_Lsw_oto*s->LineTime));
+
+	s->Lsw_oto = math_ceil2(4.0 * *p->prefetch_sw_bytes / s->prefetch_bw_oto / s->LineTime, 1.0) / 4.0;
 
-	s->Lsw_oto = math_ceil2(4.0 * s->prefetch_sw_bytes / s->prefetch_bw_oto / s->LineTime, 1.0) / 4.0;
-	s->prefetch_bw_oto = math_max3(s->prefetch_bw_oto,
-					p->vm_bytes * p->HostVMInefficiencyFactor / (31 * s->LineTime) - *p->Tno_bw,
-					(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / (15 * s->LineTime));
-#else
 	s->prefetch_bw_oto = math_max3(s->prefetch_bw_oto,
 					p->vm_bytes * p->HostVMInefficiencyFactor / (31 * s->LineTime) - *p->Tno_bw,
 					(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / (15 * s->LineTime));
-	s->Lsw_oto = math_ceil2(4.0 * math_max2(s->prefetch_sw_bytes / s->prefetch_bw_oto / s->LineTime, s->min_Lsw_oto), 1.0) / 4.0;
+
+#ifdef __DML_VBA_DEBUG__
+	dml2_printf("DML::%s: vactive_sw_bw_l = %f\n", __func__, p->vactive_sw_bw_l);
+	dml2_printf("DML::%s: vactive_sw_bw_c = %f\n", __func__, p->vactive_sw_bw_c);
+	dml2_printf("DML::%s: per_pipe_vactive_sw_bw = %f\n", __func__, s->per_pipe_vactive_sw_bw);
 #endif
 
 	if (p->display_cfg->gpuvm_enable == true) {
-		s->Tvm_no_trip_oto = math_max2(
+		s->Tvm_oto = math_max3(
+			*p->Tvm_trips,
 			*p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw_oto,
 			s->LineTime / 4.0);
-		s->Tvm_oto = math_max2(
-			*p->Tvm_trips,
-			s->Tvm_no_trip_oto);
+
 #ifdef __DML_VBA_DEBUG__
 		dml2_printf("DML::%s: Tvm_oto max0 = %f\n", __func__, *p->Tvm_trips);
 		dml2_printf("DML::%s: Tvm_oto max1 = %f\n", __func__, *p->Tno_bw + vm_bytes * p->HostVMInefficiencyFactor / s->prefetch_bw_oto);
 		dml2_printf("DML::%s: Tvm_oto max2 = %f\n", __func__, s->LineTime / 4.0);
 #endif
 	} else {
-		s->Tvm_no_trip_oto = s->Tvm_trips_rounded;
 		s->Tvm_oto = s->Tvm_trips_rounded;
 	}
 
 	if ((p->display_cfg->gpuvm_enable == true || p->setup_for_tdlut || dcc_mrq_enable)) {
-		s->Tr0_no_trip_oto = math_max2(
+		s->Tr0_oto = math_max3(
+			*p->Tr0_trips,
 			(p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / s->prefetch_bw_oto,
 			s->LineTime / 4.0);
-		s->Tr0_oto = math_max2(
-			*p->Tr0_trips,
-			s->Tr0_no_trip_oto);
 #ifdef __DML_VBA_DEBUG__
 		dml2_printf("DML::%s: Tr0_oto max0 = %f\n", __func__, *p->Tr0_trips);
 		dml2_printf("DML::%s: Tr0_oto max1 = %f\n", __func__, (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) / s->prefetch_bw_oto);
 		dml2_printf("DML::%s: Tr0_oto max2 = %f\n", __func__, s->LineTime / 4);
 #endif
-	} else {
-		s->Tr0_no_trip_oto = (s->LineTime - s->Tvm_oto) / 4.0;
-		s->Tr0_oto = s->Tr0_no_trip_oto;
-	}
+	} else
+		s->Tr0_oto = s->LineTime / 4.0;
 
 	s->Tvm_oto_lines = math_ceil2(4.0 * s->Tvm_oto / s->LineTime, 1) / 4.0;
 	s->Tr0_oto_lines = math_ceil2(4.0 * s->Tr0_oto / s->LineTime, 1) / 4.0;
 	s->dst_y_prefetch_oto = s->Tvm_oto_lines + 2 * s->Tr0_oto_lines + s->Lsw_oto;
 
+#ifdef DML_GLOBAL_PREFETCH_CHECK
+	dml2_printf("DML::%s: impacted_Tpre = %f\n", __func__, p->impacted_dst_y_pre);
+	if (p->impacted_dst_y_pre > 0) {
+		dml2_printf("DML::%s: dst_y_prefetch_oto = %f\n", __func__, s->dst_y_prefetch_oto);
+		s->dst_y_prefetch_oto = math_max2(s->dst_y_prefetch_oto, p->impacted_dst_y_pre);
+		dml2_printf("DML::%s: dst_y_prefetch_oto = %f (impacted)\n", __func__, s->dst_y_prefetch_oto);
+	}
+#endif
+	*p->Tpre_oto = s->dst_y_prefetch_oto * s->LineTime;
+
 	//To (time for delay after scaler) in line time
 	Lo = (unsigned int)(*p->DSTYAfterScaler + (double)*p->DSTXAfterScaler / (double)p->myPipe->HTotal);
 
+	s->min_Lsw_equ = math_max2(p->PrefetchSourceLinesY, p->PrefetchSourceLinesC) / __DML2_CALCS_MAX_VRATIO_PRE_EQU__;
+	s->min_Lsw_equ = math_max2(s->min_Lsw_equ, p->tdlut_drain_time / s->LineTime);
+	s->min_Lsw_equ = math_max2(s->min_Lsw_equ, 2.0);
 	//Tpre_equ in line time
 	if (p->DynamicMetadataVMEnabled && p->DynamicMetadataEnable)
 		s->dst_y_prefetch_equ = p->VStartup - (*p->TSetup + math_max2(p->TCalc, *p->Tvm_trips) + s->TWait_p) / s->LineTime - Lo;
 	else
 		s->dst_y_prefetch_equ = p->VStartup - (*p->TSetup + math_max2(p->TCalc, p->ExtraLatencyPrefetch) + s->TWait_p) / s->LineTime - Lo;
+
+#ifdef DML_GLOBAL_PREFETCH_CHECK
+	s->dst_y_prefetch_equ_impacted = math_max2(p->impacted_dst_y_pre, s->dst_y_prefetch_equ);
+
+	s->dst_y_prefetch_equ_impacted = math_min2(s->dst_y_prefetch_equ_impacted, 63.75); // limit to the reg limit of U6.2 for DST_Y_PREFETCH
+
+	if (s->dst_y_prefetch_equ_impacted > s->dst_y_prefetch_equ)
+		s->dst_y_prefetch_equ -= s->dst_y_prefetch_equ_impacted - s->dst_y_prefetch_equ;
+#endif
+
 	s->dst_y_prefetch_equ = math_min2(s->dst_y_prefetch_equ, 63.75); // limit to the reg limit of U6.2 for DST_Y_PREFETCH
 
 #ifdef __DML_VBA_DEBUG__
@@ -5381,7 +5412,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	dml2_printf("DML::%s: BytePerPixelC = %u\n", __func__, p->myPipe->BytePerPixelC);
 	dml2_printf("DML::%s: PrefetchSourceLinesC = %f\n", __func__, p->PrefetchSourceLinesC);
 	dml2_printf("DML::%s: swath_width_chroma_ub = %u\n", __func__, p->swath_width_chroma_ub);
-	dml2_printf("DML::%s: prefetch_sw_bytes = %f\n", __func__, s->prefetch_sw_bytes);
+	dml2_printf("DML::%s: prefetch_sw_bytes = %f\n", __func__, *p->prefetch_sw_bytes);
 	dml2_printf("DML::%s: max_Tsw = %f\n", __func__, s->max_Tsw);
 	dml2_printf("DML::%s: bytes_pp = %f\n", __func__, s->bytes_pp);
 	dml2_printf("DML::%s: vm_bytes = %u\n", __func__, vm_bytes);
@@ -5405,7 +5436,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 #endif
 	double Tpre = s->dst_y_prefetch_equ * s->LineTime;
 	s->dst_y_prefetch_equ = math_floor2(4.0 * (s->dst_y_prefetch_equ + 0.125), 1) / 4.0;
-	s->Tpre_rounded = s->dst_y_prefetch_equ * s->LineTime;
+	*p->Tpre_rounded = s->dst_y_prefetch_equ * s->LineTime;
 
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: dst_y_prefetch_equ: %f (after round)\n", __func__, s->dst_y_prefetch_equ);
@@ -5431,7 +5462,7 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	dml2_printf("DML::%s: vm_bytes: %f (hvm inefficiency scaled)\n", __func__, vm_bytes*p->HostVMInefficiencyFactor);
 	dml2_printf("DML::%s: row_bytes: %f (hvm inefficiency scaled, 1 row)\n", __func__, p->PixelPTEBytesPerRow*p->HostVMInefficiencyFactor+p->meta_row_bytes+tdlut_row_bytes);
 	dml2_printf("DML::%s: Tno_bw: %f\n", __func__, *p->Tno_bw);
-	dml2_printf("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, Tpre, s->Tpre_rounded, (s->Tpre_rounded - Tpre));
+	dml2_printf("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, Tpre, *p->Tpre_rounded, (*p->Tpre_rounded - Tpre));
 	dml2_printf("DML::%s: Tvm_trips=%f Tvm_trips_rounded: %f, delta=%f\n", __func__, *p->Tvm_trips, s->Tvm_trips_rounded, (s->Tvm_trips_rounded - *p->Tvm_trips));
 #endif
 
@@ -5445,78 +5476,85 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	// Tpre_rounded is Tpre rounding to 2-bit fraction
 	// Tvm_trips_rounded is Tvm_trips ceiling to 1/4 line time
 	// Tr0_trips_rounded is Tr0_trips ceiling to 1/4 line time
-	// So that means prefetch bw calculated can be higher since the total time availabe for prefetch is less
-	bool min_Lsw_equ_ok = s->Tpre_rounded >= s->Tvm_trips_rounded + 2.0*s->Tr0_trips_rounded + s->min_Lsw_equ*s->LineTime;
+	// So that means prefetch bw calculated can be higher since the total time available for prefetch is less
+	bool min_Lsw_equ_ok = *p->Tpre_rounded >= s->Tvm_trips_rounded + 2.0*s->Tr0_trips_rounded + s->min_Lsw_equ*s->LineTime;
+	bool tpre_gt_req_latency = true;
+#if 0
+	// Check that Tpre_rounded is big enough if all of the stages of the prefetch are time constrained.
+	// The terms Tvm_trips_rounded and Tr0_trips_rounded represent the min time constraints for the VM and row stages.
+	// Normally, these terms cover the overall time constraint for Tpre >= (Tex + max{Ttrip, Turg}), but if these terms are at their minimum, an explicit check is necessary.
+	tpre_gt_req_latency = *p->Tpre_rounded > (math_max2(p->Turg, s->trip_to_mem) + p->ExtraLatencyPrefetch);
+#endif
 
-	if (s->dst_y_prefetch_equ > 1 && min_Lsw_equ_ok) {
+	if (s->dst_y_prefetch_equ > 1 && min_Lsw_equ_ok && tpre_gt_req_latency) {
 		s->prefetch_bw1 = 0.;
 		s->prefetch_bw2 = 0.;
 		s->prefetch_bw3 = 0.;
 		s->prefetch_bw4 = 0.;
 
 		// prefetch_bw1: VM + 2*R0 + SW
-		if (s->Tpre_rounded - *p->Tno_bw > 0) {
+		if (*p->Tpre_rounded - *p->Tno_bw > 0) {
 			s->prefetch_bw1 = (vm_bytes * p->HostVMInefficiencyFactor
 				+ 2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)
-				+ s->prefetch_sw_bytes)
-				/ (s->Tpre_rounded - *p->Tno_bw);
-			s->Tsw_est1 = s->prefetch_sw_bytes / s->prefetch_bw1;
+				+ *p->prefetch_sw_bytes)
+				/ (*p->Tpre_rounded - *p->Tno_bw);
+			s->Tsw_est1 = *p->prefetch_sw_bytes / s->prefetch_bw1;
 		} else
 			s->prefetch_bw1 = 0;
 
 		dml2_printf("DML::%s: prefetch_bw1: %f\n", __func__, s->prefetch_bw1);
-		if ((s->Tsw_est1 < s->min_Lsw_equ * s->LineTime) && (s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw > 0)) {
+		if ((s->Tsw_est1 < s->min_Lsw_equ * s->LineTime) && (*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw > 0)) {
 			s->prefetch_bw1 = (vm_bytes * p->HostVMInefficiencyFactor + 2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)) /
-				(s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw);
+				(*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw);
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: vm and 2 rows bytes = %f\n", __func__, (vm_bytes * p->HostVMInefficiencyFactor + 2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)));
-			dml2_printf("DML::%s: Tpre_rounded = %f\n", __func__, s->Tpre_rounded);
+			dml2_printf("DML::%s: Tpre_rounded = %f\n", __func__, *p->Tpre_rounded);
 			dml2_printf("DML::%s: minus term = %f\n", __func__, s->min_Lsw_equ * s->LineTime + 0.75 * s->LineTime + *p->Tno_bw);
 			dml2_printf("DML::%s: min_Lsw_equ = %f\n", __func__, s->min_Lsw_equ);
 			dml2_printf("DML::%s: LineTime = %f\n", __func__, s->LineTime);
 			dml2_printf("DML::%s: Tno_bw = %f\n", __func__, *p->Tno_bw);
-			dml2_printf("DML::%s: Time to fetch vm and 2 rows = %f\n", __func__, (s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw));
+			dml2_printf("DML::%s: Time to fetch vm and 2 rows = %f\n", __func__, (*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.75 * s->LineTime - *p->Tno_bw));
 			dml2_printf("DML::%s: prefetch_bw1: %f (updated)\n", __func__, s->prefetch_bw1);
 #endif
 		}
 
 		// prefetch_bw2: VM + SW
-		if (s->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded > 0) {
-			s->prefetch_bw2 = (vm_bytes * p->HostVMInefficiencyFactor + s->prefetch_sw_bytes) /
-			(s->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded);
-			s->Tsw_est2 = s->prefetch_sw_bytes / s->prefetch_bw2;
+		if (*p->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded > 0) {
+			s->prefetch_bw2 = (vm_bytes * p->HostVMInefficiencyFactor + *p->prefetch_sw_bytes) /
+			(*p->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded);
+			s->Tsw_est2 = *p->prefetch_sw_bytes / s->prefetch_bw2;
 		} else
 			s->prefetch_bw2 = 0;
 
 		dml2_printf("DML::%s: prefetch_bw2: %f\n", __func__, s->prefetch_bw2);
-		if ((s->Tsw_est2 < s->min_Lsw_equ * s->LineTime) && ((s->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded - s->min_Lsw_equ * s->LineTime - 0.25 * s->LineTime) > 0)) {
-			s->prefetch_bw2 = vm_bytes * p->HostVMInefficiencyFactor / (s->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded - s->min_Lsw_equ * s->LineTime - 0.25 * s->LineTime);
+		if ((s->Tsw_est2 < s->min_Lsw_equ * s->LineTime) && ((*p->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded - s->min_Lsw_equ * s->LineTime - 0.25 * s->LineTime) > 0)) {
+			s->prefetch_bw2 = vm_bytes * p->HostVMInefficiencyFactor / (*p->Tpre_rounded - *p->Tno_bw - 2.0 * s->Tr0_trips_rounded - s->min_Lsw_equ * s->LineTime - 0.25 * s->LineTime);
 			dml2_printf("DML::%s: prefetch_bw2: %f (updated)\n", __func__, s->prefetch_bw2);
 		}
 
 		// prefetch_bw3: 2*R0 + SW
-		if (s->Tpre_rounded - s->Tvm_trips_rounded > 0) {
-			s->prefetch_bw3 = (2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) + s->prefetch_sw_bytes) /
-				(s->Tpre_rounded - s->Tvm_trips_rounded);
-			s->Tsw_est3 = s->prefetch_sw_bytes / s->prefetch_bw3;
+		if (*p->Tpre_rounded - s->Tvm_trips_rounded > 0) {
+			s->prefetch_bw3 = (2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes) + *p->prefetch_sw_bytes) /
+				(*p->Tpre_rounded - s->Tvm_trips_rounded);
+			s->Tsw_est3 = *p->prefetch_sw_bytes / s->prefetch_bw3;
 		} else
 			s->prefetch_bw3 = 0;
 
 		dml2_printf("DML::%s: prefetch_bw3: %f\n", __func__, s->prefetch_bw3);
-		if ((s->Tsw_est3 < s->min_Lsw_equ * s->LineTime) && ((s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded) > 0)) {
-			s->prefetch_bw3 = (2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)) / (s->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded);
+		if ((s->Tsw_est3 < s->min_Lsw_equ * s->LineTime) && ((*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded) > 0)) {
+			s->prefetch_bw3 = (2 * (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + p->meta_row_bytes + tdlut_row_bytes)) / (*p->Tpre_rounded - s->min_Lsw_equ * s->LineTime - 0.5 * s->LineTime - s->Tvm_trips_rounded);
 			dml2_printf("DML::%s: prefetch_bw3: %f (updated)\n", __func__, s->prefetch_bw3);
 		}
 
 		// prefetch_bw4: SW
-		if (s->Tpre_rounded - s->Tvm_trips_rounded - 2 * s->Tr0_trips_rounded > 0)
-			s->prefetch_bw4 = s->prefetch_sw_bytes / (s->Tpre_rounded - s->Tvm_trips_rounded - 2 * s->Tr0_trips_rounded);
+		if (*p->Tpre_rounded - s->Tvm_trips_rounded - 2 * s->Tr0_trips_rounded > 0)
+			s->prefetch_bw4 = *p->prefetch_sw_bytes / (*p->Tpre_rounded - s->Tvm_trips_rounded - 2 * s->Tr0_trips_rounded);
 		else
 			s->prefetch_bw4 = 0;
 
 #ifdef __DML_VBA_DEBUG__
 		dml2_printf("DML::%s: Tno_bw: %f\n", __func__, *p->Tno_bw);
-		dml2_printf("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, Tpre, s->Tpre_rounded, (s->Tpre_rounded - Tpre));
+		dml2_printf("DML::%s: Tpre=%f Tpre_rounded: %f, delta=%f\n", __func__, Tpre, *p->Tpre_rounded, (*p->Tpre_rounded - Tpre));
 		dml2_printf("DML::%s: Tvm_trips=%f Tvm_trips_rounded: %f, delta=%f\n", __func__, *p->Tvm_trips, s->Tvm_trips_rounded, (s->Tvm_trips_rounded - *p->Tvm_trips));
 		dml2_printf("DML::%s: Tr0_trips=%f Tr0_trips_rounded: %f, delta=%f\n", __func__, *p->Tr0_trips, s->Tr0_trips_rounded, (s->Tr0_trips_rounded - *p->Tr0_trips));
 		dml2_printf("DML::%s: Tsw_est1: %f\n", __func__, s->Tsw_est1);
@@ -5628,9 +5666,6 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 		dml2_printf("DML::%s: Tvm_equ = %f\n", __func__, s->Tvm_equ);
 		dml2_printf("DML::%s: Tr0_equ = %f\n", __func__, s->Tr0_equ);
 #endif
-		// Lsw = dst_y_prefetch - (dst_y_per_vm_vblank + 2*dst_y_per_row_vblank)
-		s->Lsw_equ = s->dst_y_prefetch_equ - math_ceil2(4.0 * (s->Tvm_equ + 2 * s->Tr0_equ) / s->LineTime, 1.0) / 4.0;
-
 		// Use the more stressful prefetch schedule
 		if (s->dst_y_prefetch_oto < s->dst_y_prefetch_equ) {
 			*p->dst_y_prefetch = s->dst_y_prefetch_oto;
@@ -5639,28 +5674,29 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 
 			*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
 			*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
-			s->dst_y_per_vm_no_trip_vblank = math_ceil2(4.0 * s->Tvm_no_trip_oto / s->LineTime, 1.0) / 4.0;
-			s->dst_y_per_row_no_trip_vblank = math_ceil2(4.0 * s->Tr0_no_trip_oto / s->LineTime, 1.0) / 4.0;
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: Using oto scheduling for prefetch\n", __func__);
 #endif
+
 		} else {
 			*p->dst_y_prefetch = s->dst_y_prefetch_equ;
+
+			if (s->dst_y_prefetch_equ < s->dst_y_prefetch_equ_impacted)
+				*p->dst_y_prefetch = s->dst_y_prefetch_equ_impacted;
+
 			s->TimeForFetchingVM = s->Tvm_equ;
 			s->TimeForFetchingRowInVBlank = s->Tr0_equ;
 
-			*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
-			*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
-			s->dst_y_per_vm_no_trip_vblank = *p->dst_y_per_vm_vblank;
-			s->dst_y_per_row_no_trip_vblank = *p->dst_y_per_row_vblank;
+		*p->dst_y_per_vm_vblank = math_ceil2(4.0 * s->TimeForFetchingVM / s->LineTime, 1.0) / 4.0;
+		*p->dst_y_per_row_vblank = math_ceil2(4.0 * s->TimeForFetchingRowInVBlank / s->LineTime, 1.0) / 4.0;
 
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: Using equ bw scheduling for prefetch\n", __func__);
 #endif
 		}
 
-		/* take worst case Lsw to calculate bandwidth requirement regardless of schedule */
-		s->LinesToRequestPrefetchPixelData = math_min2(s->Lsw_equ, s->Lsw_oto); // Lsw
+		// Lsw = dst_y_prefetch - (dst_y_per_vm_vblank + 2*dst_y_per_row_vblank)
+		s->LinesToRequestPrefetchPixelData = *p->dst_y_prefetch - *p->dst_y_per_vm_vblank - 2 * *p->dst_y_per_row_vblank; // Lsw
 
 		s->cursor_prefetch_bytes = (unsigned int)math_max2(p->cursor_bytes_per_chunk, 4 * p->cursor_bytes_per_line);
 		*p->prefetch_cursor_bw = p->num_cursors * s->cursor_prefetch_bytes / (s->LinesToRequestPrefetchPixelData * s->LineTime);
@@ -5760,8 +5796,10 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 
 	} else {
 		dml2_printf("DML::%s: No time to prefetch! dst_y_prefetch_equ = %f (should be > 1)\n", __func__, s->dst_y_prefetch_equ);
-		dml2_printf("DML::%s: No time to prefetch! min_Lsw_equ_ok = %d, Tpre_rounded (%f) should be >= Tvm_trips_rounded (%f)  + 2.0*Tr0_trips_rounded (%f) + min_Tsw_equ (%f)\n",
-				__func__, min_Lsw_equ_ok, s->Tpre_rounded, s->Tvm_trips_rounded, 2.0*s->Tr0_trips_rounded, s->min_Lsw_equ*s->LineTime);
+		dml2_printf("DML::%s: No time to prefetch! min_Lsw_equ_ok = %d, Tpre_rounded (%f) should be >= Tvm_trips_rounded (%f) + 2.0*Tr0_trips_rounded (%f) + min_Tsw_equ (%f)\n",
+				__func__, min_Lsw_equ_ok, *p->Tpre_rounded, s->Tvm_trips_rounded, 2.0*s->Tr0_trips_rounded, s->min_Lsw_equ*s->LineTime);
+		dml2_printf("DML::%s: No time to prefetch! min_Lsw_equ_ok = %d, Tpre_rounded+Tvm_trips_rounded+2.0*Tr0_trips_rounded+min_Tsw_equ (%f) should be > \n",
+				__func__, tpre_gt_req_latency, (s->min_Lsw_equ*s->LineTime + s->Tvm_trips_rounded + 2.0*s->Tr0_trips_rounded), p->Turg, s->trip_to_mem, p->ExtraLatencyPrefetch);
 		s->NoTimeToPrefetch = true;
 		s->TimeForFetchingVM = 0;
 		s->TimeForFetchingRowInVBlank = 0;
@@ -5780,13 +5818,13 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 
 		if (vm_bytes == 0) {
 			prefetch_vm_bw = 0;
-		} else if (s->dst_y_per_vm_no_trip_vblank > 0) {
+		} else if (*p->dst_y_per_vm_vblank > 0) {
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: HostVMInefficiencyFactor = %f\n", __func__, p->HostVMInefficiencyFactor);
 			dml2_printf("DML::%s: dst_y_per_vm_vblank = %f\n", __func__, *p->dst_y_per_vm_vblank);
 			dml2_printf("DML::%s: LineTime = %f\n", __func__, s->LineTime);
 #endif
-			prefetch_vm_bw = vm_bytes * p->HostVMInefficiencyFactor / (s->dst_y_per_vm_no_trip_vblank * s->LineTime);
+			prefetch_vm_bw = vm_bytes * p->HostVMInefficiencyFactor / (*p->dst_y_per_vm_vblank * s->LineTime);
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: prefetch_vm_bw = %f\n", __func__, prefetch_vm_bw);
 #endif
@@ -5798,8 +5836,8 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 
 		if (p->PixelPTEBytesPerRow == 0 && tdlut_row_bytes == 0) {
 			prefetch_row_bw = 0;
-		} else if (s->dst_y_per_row_no_trip_vblank > 0) {
-			prefetch_row_bw = (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + tdlut_row_bytes) / (s->dst_y_per_row_no_trip_vblank * s->LineTime);
+		} else if (*p->dst_y_per_row_vblank > 0) {
+			prefetch_row_bw = (p->PixelPTEBytesPerRow * p->HostVMInefficiencyFactor + tdlut_row_bytes) / (*p->dst_y_per_row_vblank * s->LineTime);
 
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: PixelPTEBytesPerRow = %u\n", __func__, p->PixelPTEBytesPerRow);
@@ -5839,6 +5877,171 @@ static bool CalculatePrefetchSchedule(struct dml2_core_internal_scratch *scratch
 	return s->NoTimeToPrefetch;
 }
 
+static unsigned int get_num_lb_source_lines(unsigned int max_line_buffer_lines,
+									unsigned int line_buffer_size_bits,
+									unsigned int num_pipes,
+									unsigned int vp_width,
+									unsigned int vp_height,
+									double h_ratio,
+									enum dml2_rotation_angle rotation_angle)
+{
+	unsigned int num_lb_source_lines = 0;
+	double lb_bit_per_pixel = 57.0;
+	unsigned recin_width = vp_width/num_pipes;
+
+	if (dml_is_vertical_rotation(rotation_angle))
+		recin_width = vp_height/num_pipes;
+
+	num_lb_source_lines = (unsigned int) math_min2((double) max_line_buffer_lines,
+								math_floor2(line_buffer_size_bits / lb_bit_per_pixel / (recin_width / math_max2(h_ratio, 1.0)), 1.0));
+
+	return num_lb_source_lines;
+}
+
+static unsigned int find_max_impact_plane(unsigned int this_plane_idx, unsigned int num_planes, unsigned int Trpd_dcfclk_cycles[])
+{
+	int max_value = -1;
+	int max_idx = -1;
+	for (unsigned int i = 0; i < num_planes; i++) {
+		if (i != this_plane_idx && (int) Trpd_dcfclk_cycles[i] > max_value) {
+			max_value = Trpd_dcfclk_cycles[i];
+			max_idx = i;
+		}
+	}
+	if (max_idx <= 0) {
+		dml2_assert(max_idx >= 0);
+		max_idx = this_plane_idx;
+	}
+
+	return max_idx;
+}
+
+static double calculate_impacted_Tsw(unsigned int exclude_plane_idx, unsigned int num_planes, double *prefetch_swath_bytes, double bw_mbps)
+{
+	double sum = 0.;
+	for (unsigned int i = 0; i < num_planes; i++) {
+		if (i != exclude_plane_idx) {
+			sum += prefetch_swath_bytes[i];
+		}
+	}
+	return sum / bw_mbps;
+}
+
+// a global check against the aggregate effect of the per plane prefetch schedule
+static bool CheckGlobalPrefetchAdmissibility(struct dml2_core_internal_scratch *scratch,
+											 struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_params *p)
+{
+	struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_locals *s = &scratch->CheckGlobalPrefetchAdmissibility_locals;
+	unsigned int i, k;
+
+	memset(s, 0, sizeof(struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_locals));
+
+	*p->recalc_prefetch_schedule = 0;
+	s->prefetch_global_check_passed = 1;
+	// worst case if the rob and cdb is fully hogged
+	s->max_Trpd_dcfclk_cycles = (unsigned int) math_ceil2((p->rob_buffer_size_kbytes*1024 + p->compressed_buffer_size_kbytes*DML_MAX_COMPRESSION_RATIO*1024)/64.0, 1.0);
+#ifdef __DML_VBA_DEBUG__
+	dml2_printf("DML::%s: num_active_planes = %d\n", __func__, p->num_active_planes);
+	dml2_printf("DML::%s: rob_buffer_size_kbytes = %d\n", __func__, p->rob_buffer_size_kbytes);
+	dml2_printf("DML::%s: compressed_buffer_size_kbytes = %d\n", __func__, p->compressed_buffer_size_kbytes);
+	dml2_printf("DML::%s: estimated_urg_bandwidth_required_mbps = %f\n", __func__, p->estimated_urg_bandwidth_required_mbps);
+	dml2_printf("DML::%s: estimated_dcfclk_mhz = %f\n", __func__, p->estimated_dcfclk_mhz);
+	dml2_printf("DML::%s: max_Trpd_dcfclk_cycles = %u\n", __func__, s->max_Trpd_dcfclk_cycles);
+#endif
+
+	// calculate the return impact from each plane, request is 256B per dcfclk
+	for (i = 0; i < p->num_active_planes; i++) {
+		s->src_detile_buf_size_bytes_l[i] = p->detile_buffer_size_bytes_l[i];
+		s->src_detile_buf_size_bytes_c[i] = p->detile_buffer_size_bytes_c[i];
+		s->src_swath_bytes_l[i] = p->full_swath_bytes_l[i];
+		s->src_swath_bytes_c[i] = p->full_swath_bytes_c[i];
+
+		if (p->pixel_format[i] == dml2_420_10) {
+			s->src_detile_buf_size_bytes_l[i] = (unsigned int) (s->src_detile_buf_size_bytes_l[i] * 1.5);
+			s->src_detile_buf_size_bytes_c[i] = (unsigned int) (s->src_detile_buf_size_bytes_c[i] * 1.5);
+			s->src_swath_bytes_l[i] = (unsigned int) (s->src_swath_bytes_l[i] * 1.5);
+			s->src_swath_bytes_c[i] = (unsigned int) (s->src_swath_bytes_c[i] * 1.5);
+		}
+
+		s->burst_bytes_to_fill_det = (unsigned int) (math_floor2(s->src_detile_buf_size_bytes_l[i] / p->chunk_bytes_l, 1) * p->chunk_bytes_l);
+		s->burst_bytes_to_fill_det += (unsigned int) (math_floor2(p->lb_source_lines_l[i] / p->swath_height_l[i], 1) * s->src_swath_bytes_l[i]);
+
+#ifdef __DML_VBA_DEBUG__
+		dml2_printf("DML::%s: i=%u pixel_format = %d\n", __func__, i, p->pixel_format[i]);
+		dml2_printf("DML::%s: i=%u chunk_bytes_l = %d\n", __func__, i, p->chunk_bytes_l);
+		dml2_printf("DML::%s: i=%u lb_source_lines_l = %d\n", __func__, i, p->lb_source_lines_l[i]);
+		dml2_printf("DML::%s: i=%u src_detile_buf_size_bytes_l=%d\n", __func__, i, s->src_detile_buf_size_bytes_l[i]);
+		dml2_printf("DML::%s: i=%u src_swath_bytes_l=%d\n", __func__, i, s->src_swath_bytes_l[i]);
+		dml2_printf("DML::%s: i=%u burst_bytes_to_fill_det=%d (luma)\n", __func__, i, s->burst_bytes_to_fill_det);
+#endif
+
+		if (s->src_swath_bytes_c[i] > 0) { // dual_plane
+			s->burst_bytes_to_fill_det += (unsigned int) (math_floor2(s->src_detile_buf_size_bytes_c[i] / p->chunk_bytes_c, 1) * p->chunk_bytes_c);
+
+			if (p->pixel_format[i] == dml2_422_planar_8 || p->pixel_format[i] == dml2_422_planar_10 || p->pixel_format[i] == dml2_422_planar_12) {
+				s->burst_bytes_to_fill_det += (unsigned int) (math_floor2(p->lb_source_lines_c[i] / p->swath_height_c[i], 1) * s->src_swath_bytes_c[i]);
+			}
+
+#ifdef __DML_VBA_DEBUG__
+			dml2_printf("DML::%s: i=%u chunk_bytes_c = %d\n", __func__, i, p->chunk_bytes_c);
+			dml2_printf("DML::%s: i=%u lb_source_lines_c = %d\n", __func__, i, p->lb_source_lines_c[i]);
+			dml2_printf("DML::%s: i=%u src_detile_buf_size_bytes_c=%d\n", __func__, i, s->src_detile_buf_size_bytes_c[i]);
+			dml2_printf("DML::%s: i=%u src_swath_bytes_c=%d\n", __func__, i, s->src_swath_bytes_c[i]);
+#endif
+		}
+
+		s->time_to_fill_det_us = (double) s->burst_bytes_to_fill_det / (256 * p->estimated_dcfclk_mhz); // fill time assume full burst at request rate
+		s->accumulated_return_path_dcfclk_cycles[i] = (unsigned int) math_ceil2(((DML_MAX_COMPRESSION_RATIO-1) * 64 * p->estimated_dcfclk_mhz) * s->time_to_fill_det_us / 64.0, 1.0); //for 64B per DCFClk
+
+#ifdef __DML_VBA_DEBUG__
+		dml2_printf("DML::%s: i=%u burst_bytes_to_fill_det=%d\n", __func__, i, s->burst_bytes_to_fill_det);
+		dml2_printf("DML::%s: i=%u time_to_fill_det_us=%f\n", __func__, i, s->time_to_fill_det_us);
+		dml2_printf("DML::%s: i=%u accumulated_return_path_dcfclk_cycles=%u\n", __func__, i, s->accumulated_return_path_dcfclk_cycles[i]);
+#endif
+		// clamping to worst case delay which is one which occupy the full rob+cdb
+		if (s->accumulated_return_path_dcfclk_cycles[i] > s->max_Trpd_dcfclk_cycles)
+			s->accumulated_return_path_dcfclk_cycles[i] = s->max_Trpd_dcfclk_cycles;
+	}
+
+	// Figure out the impacted prefetch time for each plane
+	// if impacted_Tre is > equ bw Tpre, we need to fail the prefetch schedule as we need a higher state to support the bw
+	for (i = 0; i < p->num_active_planes; i++) {
+		k = find_max_impact_plane(i, p->num_active_planes, s->accumulated_return_path_dcfclk_cycles); // plane k causes most impact to plane i
+		// the rest of planes (except for k) complete for bw
+		p->impacted_dst_y_pre[i] = s->accumulated_return_path_dcfclk_cycles[k]/p->estimated_dcfclk_mhz;
+		p->impacted_dst_y_pre[i] += calculate_impacted_Tsw(k, p->num_active_planes, p->prefetch_sw_bytes, p->estimated_urg_bandwidth_required_mbps);
+		p->impacted_dst_y_pre[i] = math_ceil2(p->impacted_dst_y_pre[i] / p->line_time[i], 0.25);
+
+#ifdef __DML_VBA_DEBUG__
+		dml2_printf("DML::%s: i=%u impacted_Tpre=%f (k=%u)\n", __func__, i, p->impacted_dst_y_pre[i], k);
+#endif
+	}
+
+	if (p->Tpre_rounded != NULL && p->Tpre_oto != NULL) {
+		for (i = 0; i < p->num_active_planes; i++) {
+			if (p->impacted_dst_y_pre[i] > p->dst_y_prefetch[i]) {
+				s->prefetch_global_check_passed = 0;
+				*p->recalc_prefetch_schedule = 1;
+			}
+#ifdef __DML_VBA_DEBUG__
+			dml2_printf("DML::%s: i=%u Tpre_rounded=%f\n", __func__, i, p->Tpre_rounded[i]);
+			dml2_printf("DML::%s: i=%u Tpre_oto=%f\n", __func__, i, p->Tpre_oto[i]);
+#endif
+		}
+	} else {
+		// likely a mode programming calls, assume support, and no recalc - not used anyways
+		s->prefetch_global_check_passed = 1;
+		*p->recalc_prefetch_schedule = 0;
+	}
+
+#ifdef __DML_VBA_DEBUG__
+	dml2_printf("DML::%s: prefetch_global_check_passed=%u\n", __func__, s->prefetch_global_check_passed);
+	dml2_printf("DML::%s: recalc_prefetch_schedule=%u\n", __func__, *p->recalc_prefetch_schedule);
+#endif
+
+	return s->prefetch_global_check_passed;
+}
+
 static void calculate_peak_bandwidth_required(
 	struct dml2_core_internal_scratch *s,
 	struct dml2_core_calcs_calculate_peak_bandwidth_required_params *p)
@@ -6057,7 +6260,7 @@ static void check_urgent_bandwidth_support(
 	double *frac_urg_bandwidth_nom,
 	double *frac_urg_bandwidth_mall,
 	bool *vactive_bandwidth_support_ok, // vactive ok
-	bool *bandwidth_support_ok,   // max of vm, prefetch, vactive all ok
+	bool *bandwidth_support_ok,// max of vm, prefetch, vactive all ok
 
 	unsigned int mall_allocated_for_dcn_mbytes,
 	double non_urg_bandwidth_required[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max],
@@ -6127,7 +6330,6 @@ static void check_urgent_bandwidth_support(
 		}
 	}
 #endif
-
 }
 
 static double get_bandwidth_available_for_immediate_flip(enum dml2_core_internal_soc_state_type eval_state,
@@ -6449,7 +6651,7 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		p->Watermark->Z8StutterExitWatermark += p->mmSOCParameters.max_urgent_latency_us + p->mmSOCParameters.df_response_time_us;
 		p->Watermark->Z8StutterEnterPlusExitWatermark += p->mmSOCParameters.max_urgent_latency_us + p->mmSOCParameters.df_response_time_us;
 	}
-	p->Watermark->g6_temp_read_watermark_us = p->mmSOCParameters.g6_temp_read_blackout_us + p->Watermark->UrgentWatermark;
+	p->Watermark->temp_read_or_ppt_watermark_us = p->mmSOCParameters.g6_temp_read_blackout_us + p->Watermark->UrgentWatermark;
 
 #ifdef __DML_VBA_DEBUG__
 	dml2_printf("DML::%s: UrgentLatency = %f\n", __func__, p->mmSOCParameters.UrgentLatency);
@@ -6465,12 +6667,12 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 	dml2_printf("DML::%s: StutterEnterPlusExitWatermark = %f\n", __func__, p->Watermark->StutterEnterPlusExitWatermark);
 	dml2_printf("DML::%s: Z8StutterExitWatermark = %f\n", __func__, p->Watermark->Z8StutterExitWatermark);
 	dml2_printf("DML::%s: Z8StutterEnterPlusExitWatermark = %f\n", __func__, p->Watermark->Z8StutterEnterPlusExitWatermark);
-	dml2_printf("DML::%s: g6_temp_read_watermark_us = %f\n", __func__, p->Watermark->g6_temp_read_watermark_us);
+	dml2_printf("DML::%s: temp_read_or_ppt_watermark_us = %f\n", __func__, p->Watermark->temp_read_or_ppt_watermark_us);
 #endif
 
 	s->TotalActiveWriteback = 0;
 	for (unsigned int k = 0; k < p->NumberOfActiveSurfaces; ++k) {
-		if (p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
+		if (p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
 			s->TotalActiveWriteback = s->TotalActiveWriteback + 1;
 		}
 	}
@@ -6533,7 +6735,7 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		s->LBLatencyHidingSourceLinesC[k] = (unsigned int)(math_min2((double)p->MaxLineBufferLines, math_floor2((double)p->LineBufferSize / LBBitPerPixel / ((double)p->SwathWidthC[k] / math_max2(h_ratio_c, 1.0)), 1)) - (v_taps_c - 1));
 
 #ifdef __DML_VBA_DEBUG__
-		dml2_printf("DML::%s: k=%u, MaxLineBufferLines= %u\n", __func__, k, p->MaxLineBufferLines);
+		dml2_printf("DML::%s: k=%u, MaxLineBufferLines = %u\n", __func__, k, p->MaxLineBufferLines);
 		dml2_printf("DML::%s: k=%u, LineBufferSize = %u\n", __func__, k, p->LineBufferSize);
 		dml2_printf("DML::%s: k=%u, LBBitPerPixel = %u\n", __func__, k, LBBitPerPixel);
 		dml2_printf("DML::%s: k=%u, HRatio = %f\n", __func__, k, h_ratio);
@@ -6574,7 +6776,7 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		s->ActiveDRAMClockChangeLatencyMargin[k] = s->ActiveClockChangeLatencyHiding - p->Watermark->DRAMClockChangeWatermark;
 		s->ActiveFCLKChangeLatencyMargin[k] = s->ActiveClockChangeLatencyHiding - p->Watermark->FCLKChangeWatermark;
 		s->USRRetrainingLatencyMargin[k] = s->ActiveClockChangeLatencyHiding - p->Watermark->USRRetrainingWatermark;
-		s->g6_temp_read_latency_margin[k] = s->ActiveClockChangeLatencyHiding - p->Watermark->g6_temp_read_watermark_us;
+		s->g6_temp_read_latency_margin[k] = s->ActiveClockChangeLatencyHiding - p->Watermark->temp_read_or_ppt_watermark_us;
 
 		if (p->VActiveLatencyHidingMargin)
 			p->VActiveLatencyHidingMargin[k] = s->ActiveDRAMClockChangeLatencyMargin[k];
@@ -6582,9 +6784,12 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		if (p->VActiveLatencyHidingUs)
 			p->VActiveLatencyHidingUs[k] = s->ActiveClockChangeLatencyHiding;
 
-		if (p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.enable) {
-			s->WritebackLatencyHiding = (double)p->WritebackInterfaceBufferSize * 1024.0 / ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height * (double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width / ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height * (double)h_total / pixel_clock_mhz) * 4.0);
-			if (p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format == dml2_444_64) {
+		if (p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
+			s->WritebackLatencyHiding = (double)p->WritebackInterfaceBufferSize * 1024.0
+				/ ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_height
+					* (double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_width
+					/ ((double)p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].input_height * (double)h_total / pixel_clock_mhz) * 4.0);
+			if (p->display_cfg->stream_descriptors[p->display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].pixel_format == dml2_444_64) {
 				s->WritebackLatencyHiding = s->WritebackLatencyHiding / 2;
 			}
 			s->WritebackDRAMClockChangeLatencyMargin = s->WritebackLatencyHiding - p->Watermark->WritebackDRAMClockChangeWatermark;
@@ -6599,36 +6804,36 @@ static void CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(
 		uclk_pstate_change_strategy = p->display_cfg->plane_descriptors[k].overrides.uclk_pstate_change_strategy;
 		reserved_vblank_time_us = (double)p->display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns / 1000;
 
-		p->FCLKChangeSupport[k] = dml2_fclock_change_unsupported;
+		p->FCLKChangeSupport[k] = dml2_pstate_change_unsupported;
 		if (s->ActiveFCLKChangeLatencyMargin[k] > 0)
-			p->FCLKChangeSupport[k] = dml2_fclock_change_vactive;
+			p->FCLKChangeSupport[k] = dml2_pstate_change_vactive;
 		else if (reserved_vblank_time_us >= p->mmSOCParameters.FCLKChangeLatency)
-			p->FCLKChangeSupport[k] = dml2_fclock_change_vblank;
+			p->FCLKChangeSupport[k] = dml2_pstate_change_vblank;
 
-		if (p->FCLKChangeSupport[k] == dml2_fclock_change_unsupported)
+		if (p->FCLKChangeSupport[k] == dml2_pstate_change_unsupported)
 			*p->global_fclk_change_supported = false;
 
-		p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_unsupported;
+		p->DRAMClockChangeSupport[k] = dml2_pstate_change_unsupported;
 		if (uclk_pstate_change_strategy == dml2_uclk_pstate_change_strategy_auto) {
 			if (p->display_cfg->overrides.all_streams_blanked ||
 					(s->ActiveDRAMClockChangeLatencyMargin[k] > 0 && reserved_vblank_time_us >= p->mmSOCParameters.DRAMClockChangeLatency))
-				p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_vblank_and_vactive;
+				p->DRAMClockChangeSupport[k] = dml2_pstate_change_vblank_and_vactive;
 			else if (s->ActiveDRAMClockChangeLatencyMargin[k] > 0)
-				p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_vactive;
+				p->DRAMClockChangeSupport[k] = dml2_pstate_change_vactive;
 			else if (reserved_vblank_time_us >= p->mmSOCParameters.DRAMClockChangeLatency)
-				p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_vblank;
+				p->DRAMClockChangeSupport[k] = dml2_pstate_change_vblank;
 		} else if (uclk_pstate_change_strategy == dml2_uclk_pstate_change_strategy_force_vactive && s->ActiveDRAMClockChangeLatencyMargin[k] > 0)
-			p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_vactive;
+			p->DRAMClockChangeSupport[k] = dml2_pstate_change_vactive;
 		else if (uclk_pstate_change_strategy == dml2_uclk_pstate_change_strategy_force_vblank && reserved_vblank_time_us >= p->mmSOCParameters.DRAMClockChangeLatency)
-			p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_vblank;
+			p->DRAMClockChangeSupport[k] = dml2_pstate_change_vblank;
 		else if (uclk_pstate_change_strategy == dml2_uclk_pstate_change_strategy_force_drr)
-			p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_drr;
+			p->DRAMClockChangeSupport[k] = dml2_pstate_change_drr;
 		else if (uclk_pstate_change_strategy == dml2_uclk_pstate_change_strategy_force_mall_svp)
-			p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_mall_svp;
+			p->DRAMClockChangeSupport[k] = dml2_pstate_change_mall_svp;
 		else if (uclk_pstate_change_strategy == dml2_uclk_pstate_change_strategy_force_mall_full_frame)
-			p->DRAMClockChangeSupport[k] = dml2_dram_clock_change_mall_full_frame;
+			p->DRAMClockChangeSupport[k] = dml2_pstate_change_mall_full_frame;
 
-		if (p->DRAMClockChangeSupport[k] == dml2_dram_clock_change_unsupported)
+		if (p->DRAMClockChangeSupport[k] == dml2_pstate_change_unsupported)
 			*p->global_dram_clock_change_supported = false;
 
 		s->dst_y_pstate = (unsigned int)(math_ceil2((p->mmSOCParameters.DRAMClockChangeLatency + p->mmSOCParameters.UrgentLatency) / (h_total / pixel_clock_mhz), 1));
@@ -6926,8 +7131,7 @@ struct dml2_core_internal_g6_temp_read_blackouts_table {
 	} entries[DML_MAX_CLK_TABLE_SIZE];
 };
 
-static const struct dml2_core_internal_g6_temp_read_blackouts_table
-	core_dcn4_g6_temp_read_blackout_table = {
+struct dml2_core_internal_g6_temp_read_blackouts_table core_dcn4_g6_temp_read_blackout_table = {
 	.entries = {
 		{
 			.uclk_khz = 96000,
@@ -7047,6 +7251,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	struct dml2_core_calcs_CalculateVMRowAndSwath_params *CalculateVMRowAndSwath_params = &mode_lib->scratch.CalculateVMRowAndSwath_params;
 	struct dml2_core_calcs_CalculateSwathAndDETConfiguration_params *CalculateSwathAndDETConfiguration_params = &mode_lib->scratch.CalculateSwathAndDETConfiguration_params;
 	struct dml2_core_calcs_CalculatePrefetchSchedule_params *CalculatePrefetchSchedule_params = &mode_lib->scratch.CalculatePrefetchSchedule_params;
+#ifdef DML_GLOBAL_PREFETCH_CHECK
+	struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_params *CheckGlobalPrefetchAdmissibility_params = &mode_lib->scratch.CheckGlobalPrefetchAdmissibility_params;
+#endif
 	struct dml2_core_calcs_calculate_tdlut_setting_params *calculate_tdlut_setting_params = &mode_lib->scratch.calculate_tdlut_setting_params;
 	struct dml2_core_calcs_calculate_mcache_setting_params *calculate_mcache_setting_params = &mode_lib->scratch.calculate_mcache_setting_params;
 	struct dml2_core_calcs_calculate_peak_bandwidth_required_params *calculate_peak_bandwidth_params = &mode_lib->scratch.calculate_peak_bandwidth_params;
@@ -7094,12 +7301,6 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 
 	for (k = 0; k < mode_lib->ms.num_active_planes; k++)
 		dml2_printf("DML::%s: plane_%d: reserved_vblank_time_ns = %u\n", __func__, k, display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
-
-	// dml2_printf_dml_policy(&mode_lib->ms.policy);
-	// dml2_printf_dml_display_cfg_timing(&display_cfg->timing, mode_lib->ms.num_active_planes);
-	// dml2_printf_dml_display_cfg_plane(&display_cfg->plane, mode_lib->ms.num_active_planes);
-	// dml2_printf_dml_display_cfg_surface(&display_cfg->surface, mode_lib->ms.num_active_planes);
-	// dml2_printf_dml_display_cfg_output(&display_cfg->output, mode_lib->ms.num_active_planes);
 #endif
 
 	CalculateMaxDETAndMinCompressedBufferSize(
@@ -7194,8 +7395,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	}
 
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		mode_lib->ms.SurfaceReadBandwidthLuma[k] = mode_lib->ms.SwathWidthYSingleDPP[k] * math_ceil2(mode_lib->ms.BytePerPixelY[k], 1.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
-		mode_lib->ms.SurfaceReadBandwidthChroma[k] = mode_lib->ms.SwathWidthCSingleDPP[k] * math_ceil2(mode_lib->ms.BytePerPixelC[k], 2.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
+		mode_lib->ms.vactive_sw_bw_l[k] = mode_lib->ms.SwathWidthYSingleDPP[k] * math_ceil2(mode_lib->ms.BytePerPixelY[k], 1.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
+		mode_lib->ms.vactive_sw_bw_c[k] = mode_lib->ms.SwathWidthCSingleDPP[k] * math_ceil2(mode_lib->ms.BytePerPixelC[k], 2.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
 
 		mode_lib->ms.cursor_bw[k] = display_cfg->plane_descriptors[k].cursor.num_cursors * display_cfg->plane_descriptors[k].cursor.cursor_width *
 			display_cfg->plane_descriptors[k].cursor.cursor_bpp / 8.0 / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000));
@@ -7205,35 +7406,35 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		old_ReadBandwidthChroma = mode_lib->ms.SwathWidthYSingleDPP[k] / 2 * math_ceil2(mode_lib->ms.BytePerPixelInDETC[k], 2.0) / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio / 2.0;
 		dml2_printf("DML::%s: k=%u, old_ReadBandwidthLuma = %f\n", __func__, k, old_ReadBandwidthLuma);
 		dml2_printf("DML::%s: k=%u, old_ReadBandwidthChroma = %f\n", __func__, k, old_ReadBandwidthChroma);
-		dml2_printf("DML::%s: k=%u, ReadBandwidthLuma = %f\n", __func__, k, mode_lib->ms.SurfaceReadBandwidthLuma[k]);
-		dml2_printf("DML::%s: k=%u, ReadBandwidthChroma = %f\n", __func__, k, mode_lib->ms.SurfaceReadBandwidthChroma[k]);
+		dml2_printf("DML::%s: k=%u, vactive_sw_bw_l = %f\n", __func__, k, mode_lib->ms.vactive_sw_bw_l[k]);
+		dml2_printf("DML::%s: k=%u, vactive_sw_bw_c = %f\n", __func__, k, mode_lib->ms.vactive_sw_bw_c[k]);
 #endif
 	}
 
 	// Writeback bandwidth
 	for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
-		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format == dml2_444_64) {
-			mode_lib->ms.WriteBandwidth[k] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height
-				* display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width
-				/ (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0 && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].pixel_format == dml2_444_64) {
+			mode_lib->ms.WriteBandwidth[k][0] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_height
+				* display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_width
+				/ (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].input_height
 					* display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total
 					/ ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * 8.0;
-		} else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
-			mode_lib->ms.WriteBandwidth[k] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height
-				* display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width
-				/ (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height
+		} else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
+			mode_lib->ms.WriteBandwidth[k][0] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_height
+				* display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_width
+				/ (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].input_height
 					* display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total
 					/ ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * 4.0;
 		} else {
-			mode_lib->ms.WriteBandwidth[k] = 0.0;
+			mode_lib->ms.WriteBandwidth[k][0] = 0.0;
 		}
 	}
 
 	/*Writeback Latency support check*/
 	mode_lib->ms.support.WritebackLatencySupport = true;
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true &&
-			(mode_lib->ms.WriteBandwidth[k] > mode_lib->ip.writeback_interface_buffer_size_kbytes * 1024 / ((double)mode_lib->soc.qos_parameters.writeback.base_latency_us))) {
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0 &&
+			(mode_lib->ms.WriteBandwidth[k][0] > mode_lib->ip.writeback_interface_buffer_size_kbytes * 1024 / ((double)mode_lib->soc.qos_parameters.writeback.base_latency_us))) {
 			mode_lib->ms.support.WritebackLatencySupport = false;
 		}
 	}
@@ -7242,19 +7443,19 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	/* Writeback Scale Ratio and Taps Support Check */
 	mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = true;
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio > mode_lib->ip.writeback_max_hscl_ratio
-				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio > mode_lib->ip.writeback_max_vscl_ratio
-				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio < mode_lib->ip.writeback_min_hscl_ratio
-				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio < mode_lib->ip.writeback_min_vscl_ratio
-				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_taps > (unsigned int) mode_lib->ip.writeback_max_hscl_taps
-				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps > (unsigned int) mode_lib->ip.writeback_max_vscl_taps
-				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio > (unsigned int)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_taps
-				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio > (unsigned int)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps
-				|| (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_taps > 2.0 && ((display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_taps % 2) == 1))) {
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
+			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_ratio > mode_lib->ip.writeback_max_hscl_ratio
+				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_ratio > mode_lib->ip.writeback_max_vscl_ratio
+				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_ratio < mode_lib->ip.writeback_min_hscl_ratio
+				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_ratio < mode_lib->ip.writeback_min_vscl_ratio
+				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_taps > (unsigned int) mode_lib->ip.writeback_max_hscl_taps
+				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_taps > (unsigned int) mode_lib->ip.writeback_max_vscl_taps
+				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_ratio > (unsigned int)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_taps
+				|| display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_ratio > (unsigned int)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_taps
+				|| (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_taps > 2.0 && ((display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_taps % 2) == 1))) {
 				mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = false;
 			}
-			if (2.0 * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height * (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps - 1) * 57 > mode_lib->ip.writeback_line_buffer_buffer_size) {
+			if (2.0 * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_height * (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_taps - 1) * 57 > mode_lib->ip.writeback_line_buffer_buffer_size) {
 				mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = false;
 			}
 		}
@@ -7434,8 +7635,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	CalculateSwathAndDETConfiguration_params->nomDETInKByte = mode_lib->ms.NomDETInKByte;
 	CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSegmentSizeInkByte = mode_lib->ip.config_return_buffer_segment_size_in_kbytes;
 	CalculateSwathAndDETConfiguration_params->CompressedBufferSegmentSizeInkByte = mode_lib->ip.compressed_buffer_segment_size_in_kbytes;
-	CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->ms.SurfaceReadBandwidthLuma;
-	CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->ms.SurfaceReadBandwidthChroma;
+	CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->ms.vactive_sw_bw_l;
+	CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->ms.vactive_sw_bw_c;
 	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthLuma = mode_lib->ms.MaximumSwathWidthLuma;
 	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthChroma = mode_lib->ms.MaximumSwathWidthChroma;
 	CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightY = mode_lib->ms.Read256BlockHeightY;
@@ -7682,16 +7883,16 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	//DISPCLK/DPPCLK
 	mode_lib->ms.WritebackRequiredDISPCLK = 0;
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable) {
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
 			mode_lib->ms.WritebackRequiredDISPCLK = math_max2(mode_lib->ms.WritebackRequiredDISPCLK,
-				CalculateWriteBackDISPCLK(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
+				CalculateWriteBackDISPCLK(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].pixel_format,
 					((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000),
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_taps,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_width,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_ratio,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_ratio,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_taps,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_taps,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].input_width,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_width,
 					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total,
 					mode_lib->ip.writeback_line_buffer_buffer_size));
 		}
@@ -7723,7 +7924,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			if (!s->stream_visited[display_cfg->plane_descriptors[k].stream_index]) {
 				s->stream_visited[display_cfg->plane_descriptors[k].stream_index] = 1;
 
-				if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true)
+				if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0)
 					s->TotalNumberOfActiveWriteback = s->TotalNumberOfActiveWriteback + 1;
 
 				s->TotalNumberOfActiveOTG = s->TotalNumberOfActiveOTG + 1;
@@ -8267,23 +8468,23 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		mode_lib->ms.PSCL_FACTOR,
 		mode_lib->ms.PSCL_FACTOR_CHROMA,
 		mode_lib->ms.RequiredDPPCLK,
-		mode_lib->ms.SurfaceReadBandwidthLuma,
-		mode_lib->ms.SurfaceReadBandwidthChroma,
+		mode_lib->ms.vactive_sw_bw_l,
+		mode_lib->ms.vactive_sw_bw_c,
 		mode_lib->soc.return_bus_width_bytes,
 
 		/* Output */
 		&mode_lib->ms.dcfclk_deepsleep);
 
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
 			mode_lib->ms.WritebackDelayTime[k] = mode_lib->soc.qos_parameters.writeback.base_latency_us + CalculateWriteBackDelay(
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
-				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].pixel_format,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_ratio,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_ratio,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_taps,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_width,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_height,
+				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].input_height,
 				display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total) / mode_lib->ms.RequiredDISPCLK;
 		} else {
 			mode_lib->ms.WritebackDelayTime[k] = 0.0;
@@ -8360,7 +8561,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: mode_lib->ms.DCFCLK = %f\n", __func__, mode_lib->ms.DCFCLK);
 	dml2_printf("DML::%s: mode_lib->ms.FabricClock = %f\n", __func__, mode_lib->ms.FabricClock);
 	dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz = %f\n", __func__, mode_lib->ms.uclk_freq_mhz);
-	dml2_printf("DML::%s: urgent latency tolerance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
+	dml2_printf("DML::%s: urgent latency tolarance = %f\n", __func__, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)));
 #endif
 
 	mode_lib->ms.support.OutstandingRequestsSupport = true;
@@ -8378,6 +8579,13 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			+ mode_lib->soc.qos_parameters.qos_params.dcn4x.average_transport_distance_fclk_cycles / mode_lib->ms.FabricClock)
 		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_average_transport_latency_margin / 100.0);
 
+	mode_lib->ms.support.max_non_urgent_latency_us
+		= mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->ms.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles
+		/ mode_lib->ms.uclk_freq_mhz * (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin / 100.0)
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles / mode_lib->ms.FabricClock
+		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->ms.FabricClock
+		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin / 100.0);
+
 	for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 
 		if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
@@ -8419,7 +8627,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	}
 
 	memset(calculate_mcache_setting_params, 0, sizeof(struct dml2_core_calcs_calculate_mcache_setting_params));
-	if (mode_lib->soc.mall_allocated_for_dcn_mbytes == 0 || mode_lib->ip.dcn_mrq_present) {
+	if (mode_lib->soc.mcache_size_bytes == 0 || mode_lib->ip.dcn_mrq_present) {
 		for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 			mode_lib->ms.mall_prefetch_sdp_overhead_factor[k] = 1.0;
 			mode_lib->ms.mall_prefetch_dram_overhead_factor[k] = 1.0;
@@ -8526,8 +8734,11 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		display_cfg->hostvm_enable,
 		mode_lib->ms.MaxDCFCLK,
 		mode_lib->ms.MaxFabricClock,
+#ifdef DML_MODE_SUPPORT_USE_DPM_DRAM_BW
+		mode_lib->ms.dram_bw_mbps);
+#else
 		mode_lib->ms.max_dram_bw_mbps);
-
+#endif
 
 	// Average BW support check
 	calculate_avg_bandwidth_required(
@@ -8535,8 +8746,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 		// input
 		display_cfg,
 		mode_lib->ms.num_active_planes,
-		mode_lib->ms.SurfaceReadBandwidthLuma,
-		mode_lib->ms.SurfaceReadBandwidthChroma,
+		mode_lib->ms.vactive_sw_bw_l,
+		mode_lib->ms.vactive_sw_bw_c,
 		mode_lib->ms.cursor_bw,
 		mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0,
 		mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1,
@@ -8649,9 +8860,32 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			&mode_lib->ms.ExtraLatency_sr,
 			&mode_lib->ms.ExtraLatencyPrefetch);
 
-		{
+		for (k = 0; k < mode_lib->ms.num_active_planes; k++)
+			s->impacted_dst_y_pre[k] = 0;
+
+		s->recalc_prefetch_schedule = 0;
+		s->recalc_prefetch_done = 0;
+		do {
 			mode_lib->ms.support.PrefetchSupported = true;
+
 			for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
+				s->line_times[k] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
+				s->pixel_format[k] = display_cfg->plane_descriptors[k].pixel_format;
+
+				s->lb_source_lines_l[k] = get_num_lb_source_lines(mode_lib->ip.max_line_buffer_lines, mode_lib->ip.line_buffer_size_bits,
+																	mode_lib->ms.NoOfDPP[k],
+																	display_cfg->plane_descriptors[k].composition.viewport.plane0.width,
+																	display_cfg->plane_descriptors[k].composition.viewport.plane0.height,
+																	display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio,
+																	display_cfg->plane_descriptors[k].composition.rotation_angle);
+
+				s->lb_source_lines_c[k] = get_num_lb_source_lines(mode_lib->ip.max_line_buffer_lines, mode_lib->ip.line_buffer_size_bits,
+																	mode_lib->ms.NoOfDPP[k],
+																	display_cfg->plane_descriptors[k].composition.viewport.plane1.width,
+																	display_cfg->plane_descriptors[k].composition.viewport.plane1.height,
+																	display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio,
+																	display_cfg->plane_descriptors[k].composition.rotation_angle);
+
 				struct dml2_core_internal_DmlPipe *myPipe = &s->myPipe;
 
 				mode_lib->ms.TWait[k] = CalculateTWait(
@@ -8741,6 +8975,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				CalculatePrefetchSchedule_params->mrq_present = mode_lib->ip.dcn_mrq_present;
 				CalculatePrefetchSchedule_params->meta_row_bytes = mode_lib->ms.meta_row_bytes[k];
 				CalculatePrefetchSchedule_params->mall_prefetch_sdp_overhead_factor = mode_lib->ms.mall_prefetch_sdp_overhead_factor[k];
+				CalculatePrefetchSchedule_params->impacted_dst_y_pre = s->impacted_dst_y_pre[k];
+				CalculatePrefetchSchedule_params->vactive_sw_bw_l = mode_lib->ms.vactive_sw_bw_l[k];
+				CalculatePrefetchSchedule_params->vactive_sw_bw_c = mode_lib->ms.vactive_sw_bw_c[k];
 
 				// output
 				CalculatePrefetchSchedule_params->DSTXAfterScaler = &s->DSTXAfterScaler[k];
@@ -8769,6 +9006,9 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				CalculatePrefetchSchedule_params->VUpdateWidthPix = &s->dummy_integer[1];
 				CalculatePrefetchSchedule_params->VReadyOffsetPix = &s->dummy_integer[2];
 				CalculatePrefetchSchedule_params->prefetch_cursor_bw = &mode_lib->ms.prefetch_cursor_bw[k];
+				CalculatePrefetchSchedule_params->prefetch_sw_bytes = &s->prefetch_sw_bytes[k];
+				CalculatePrefetchSchedule_params->Tpre_rounded = &s->Tpre_rounded[k];
+				CalculatePrefetchSchedule_params->Tpre_oto = &s->Tpre_oto[k];
 
 				mode_lib->ms.NoTimeForPrefetch[k] = CalculatePrefetchSchedule(&mode_lib->scratch, CalculatePrefetchSchedule_params);
 
@@ -8800,7 +9040,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			}
 
 			mode_lib->ms.support.VRatioInPrefetchSupported = true;
-			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+			for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 				if (mode_lib->ms.VRatioPreY[k] > __DML2_CALCS_MAX_VRATIO_PRE__ ||
 					mode_lib->ms.VRatioPreC[k] > __DML2_CALCS_MAX_VRATIO_PRE__) {
 					mode_lib->ms.support.VRatioInPrefetchSupported = false;
@@ -8810,10 +9050,14 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				}
 			}
 
+			mode_lib->ms.support.PrefetchSupported &= mode_lib->ms.support.VRatioInPrefetchSupported;
+
+			// By default, do not recalc prefetch schedule
+			s->recalc_prefetch_schedule = 0;
+
 			// Only do urg vs prefetch bandwidth check, flip schedule check, power saving feature support check IF the Prefetch Schedule Check is ok
 			if (mode_lib->ms.support.PrefetchSupported) {
-				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-					double line_time_us = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
+				for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 					// Calculate Urgent burst factor for prefetch
 #ifdef __DML_VBA_DEBUG__
 					dml2_printf("DML::%s: k=%d, Calling CalculateUrgentBurstFactor (for prefetch)\n", __func__, k);
@@ -8826,7 +9070,7 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 						mode_lib->ms.swath_width_chroma_ub[k],
 						mode_lib->ms.SwathHeightY[k],
 						mode_lib->ms.SwathHeightC[k],
-						line_time_us,
+						s->line_times[k],
 						mode_lib->ms.UrgLatency,
 						mode_lib->ms.VRatioPreY[k],
 						mode_lib->ms.VRatioPreC[k],
@@ -8863,8 +9107,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 				calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->ms.mall_prefetch_sdp_overhead_factor;
 				calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->ms.mall_prefetch_dram_overhead_factor;
 
-				calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->ms.SurfaceReadBandwidthLuma;
-				calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->ms.SurfaceReadBandwidthChroma;
+				calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->ms.vactive_sw_bw_l;
+				calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->ms.vactive_sw_bw_c;
 				calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->ms.RequiredPrefetchPixelDataBWLuma;
 				calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->ms.RequiredPrefetchPixelDataBWChroma;
 				calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->ms.excess_vactive_fill_bw_l;
@@ -8910,127 +9154,164 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 					}
 				}
 
+#ifdef DML_GLOBAL_PREFETCH_CHECK
+				if (mode_lib->ms.support.PrefetchSupported && mode_lib->ms.num_active_planes > 1 && s->recalc_prefetch_done == 0) {
+					CheckGlobalPrefetchAdmissibility_params->num_active_planes =  mode_lib->ms.num_active_planes;
+					CheckGlobalPrefetchAdmissibility_params->pixel_format = s->pixel_format;
+					CheckGlobalPrefetchAdmissibility_params->chunk_bytes_l = mode_lib->ip.pixel_chunk_size_kbytes * 1024;
+					CheckGlobalPrefetchAdmissibility_params->chunk_bytes_c = mode_lib->ip.pixel_chunk_size_kbytes * 1024;
+					CheckGlobalPrefetchAdmissibility_params->lb_source_lines_l = s->lb_source_lines_l;
+					CheckGlobalPrefetchAdmissibility_params->lb_source_lines_c = s->lb_source_lines_c;
+					CheckGlobalPrefetchAdmissibility_params->swath_height_l =  mode_lib->ms.SwathHeightY;
+					CheckGlobalPrefetchAdmissibility_params->swath_height_c =  mode_lib->ms.SwathHeightC;
+					CheckGlobalPrefetchAdmissibility_params->rob_buffer_size_kbytes = mode_lib->ip.rob_buffer_size_kbytes;
+					CheckGlobalPrefetchAdmissibility_params->compressed_buffer_size_kbytes = mode_lib->ms.CompressedBufferSizeInkByte;
+					CheckGlobalPrefetchAdmissibility_params->detile_buffer_size_bytes_l = mode_lib->ms.DETBufferSizeY;
+					CheckGlobalPrefetchAdmissibility_params->detile_buffer_size_bytes_c = mode_lib->ms.DETBufferSizeC;
+					CheckGlobalPrefetchAdmissibility_params->full_swath_bytes_l = s->full_swath_bytes_l;
+					CheckGlobalPrefetchAdmissibility_params->full_swath_bytes_c = s->full_swath_bytes_c;
+					CheckGlobalPrefetchAdmissibility_params->prefetch_sw_bytes = s->prefetch_sw_bytes;
+					CheckGlobalPrefetchAdmissibility_params->Tpre_rounded = s->Tpre_rounded;
+					CheckGlobalPrefetchAdmissibility_params->Tpre_oto = s->Tpre_oto;
+					CheckGlobalPrefetchAdmissibility_params->estimated_urg_bandwidth_required_mbps = mode_lib->ms.support.urg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp];
+					CheckGlobalPrefetchAdmissibility_params->line_time = s->line_times;
+					CheckGlobalPrefetchAdmissibility_params->dst_y_prefetch = mode_lib->ms.dst_y_prefetch;
+					if (CheckGlobalPrefetchAdmissibility_params->estimated_urg_bandwidth_required_mbps < 10 * 1024)
+						CheckGlobalPrefetchAdmissibility_params->estimated_urg_bandwidth_required_mbps = 10 * 1024;
+
+					CheckGlobalPrefetchAdmissibility_params->estimated_dcfclk_mhz = (CheckGlobalPrefetchAdmissibility_params->estimated_urg_bandwidth_required_mbps / (double) mode_lib->soc.return_bus_width_bytes) /
+																					((double)mode_lib->soc.qos_parameters.derate_table.system_active_urgent.dcfclk_derate_percent / 100.0);
+
+					// if recalc_prefetch_schedule is set, recalculate the prefetch schedule with the new impacted_Tpre, prefetch should be possible
+					CheckGlobalPrefetchAdmissibility_params->recalc_prefetch_schedule = &s->recalc_prefetch_schedule;
+					CheckGlobalPrefetchAdmissibility_params->impacted_dst_y_pre = s->impacted_dst_y_pre;
+					mode_lib->ms.support.PrefetchSupported = CheckGlobalPrefetchAdmissibility(&mode_lib->scratch, CheckGlobalPrefetchAdmissibility_params);
+					s->recalc_prefetch_done = 1;
+					s->recalc_prefetch_schedule = 1;
+				}
+#endif
+			} // prefetch schedule ok, do urg bw and flip schedule
+		} while (s->recalc_prefetch_schedule);
 
-				// Both prefetch schedule and BW okay
-				if (mode_lib->ms.support.PrefetchSupported == true && mode_lib->ms.support.VRatioInPrefetchSupported == true) {
-					mode_lib->ms.BandwidthAvailableForImmediateFlip =
-						get_bandwidth_available_for_immediate_flip(
-							dml2_core_internal_soc_state_sys_active,
-							mode_lib->ms.support.urg_bandwidth_required_qual, // no flip
-							mode_lib->ms.support.urg_bandwidth_available);
-
-					mode_lib->ms.TotImmediateFlipBytes = 0;
-					for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
-						if (display_cfg->plane_descriptors[k].immediate_flip) {
-							s->per_pipe_flip_bytes[k] = get_pipe_flip_bytes(
-											s->HostVMInefficiencyFactor,
-											mode_lib->ms.vm_bytes[k],
-											mode_lib->ms.DPTEBytesPerRow[k],
-											mode_lib->ms.meta_row_bytes[k]);
-						} else {
-							s->per_pipe_flip_bytes[k] = 0;
-						}
-						mode_lib->ms.TotImmediateFlipBytes += s->per_pipe_flip_bytes[k] * mode_lib->ms.NoOfDPP[k];
+		// Flip Schedule
+		// Both prefetch schedule and BW okay
+		if (mode_lib->ms.support.PrefetchSupported == true) {
+			mode_lib->ms.BandwidthAvailableForImmediateFlip =
+				get_bandwidth_available_for_immediate_flip(
+					dml2_core_internal_soc_state_sys_active,
+					mode_lib->ms.support.urg_bandwidth_required_qual, // no flip
+					mode_lib->ms.support.urg_bandwidth_available);
 
-					}
+			mode_lib->ms.TotImmediateFlipBytes = 0;
+			for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
+				if (display_cfg->plane_descriptors[k].immediate_flip) {
+					s->per_pipe_flip_bytes[k] = get_pipe_flip_bytes(
+									s->HostVMInefficiencyFactor,
+									mode_lib->ms.vm_bytes[k],
+									mode_lib->ms.DPTEBytesPerRow[k],
+									mode_lib->ms.meta_row_bytes[k]);
+				} else {
+					s->per_pipe_flip_bytes[k] = 0;
+				}
+				mode_lib->ms.TotImmediateFlipBytes += s->per_pipe_flip_bytes[k] * mode_lib->ms.NoOfDPP[k];
 
-					for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-						CalculateFlipSchedule(
-							&mode_lib->scratch,
-							display_cfg->plane_descriptors[k].immediate_flip,
-							1, // use_lb_flip_bw
-							s->HostVMInefficiencyFactor,
-							s->Tvm_trips_flip[k],
-							s->Tr0_trips_flip[k],
-							s->Tvm_trips_flip_rounded[k],
-							s->Tr0_trips_flip_rounded[k],
-							display_cfg->gpuvm_enable,
-							mode_lib->ms.vm_bytes[k],
-							mode_lib->ms.DPTEBytesPerRow[k],
-							mode_lib->ms.BandwidthAvailableForImmediateFlip,
-							mode_lib->ms.TotImmediateFlipBytes,
-							display_cfg->plane_descriptors[k].pixel_format,
-							(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)),
-							display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio,
-							display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio,
-							mode_lib->ms.Tno_bw_flip[k],
-							mode_lib->ms.dpte_row_height[k],
-							mode_lib->ms.dpte_row_height_chroma[k],
-							mode_lib->ms.use_one_row_for_frame_flip[k],
-							mode_lib->ip.max_flip_time_us,
-							mode_lib->ip.max_flip_time_lines,
-							s->per_pipe_flip_bytes[k],
-							mode_lib->ms.meta_row_bytes[k],
-							s->meta_row_height_luma[k],
-							s->meta_row_height_chroma[k],
-							mode_lib->ip.dcn_mrq_present && display_cfg->plane_descriptors[k].surface.dcc.enable,
-
-							/* Output */
-							&mode_lib->ms.dst_y_per_vm_flip[k],
-							&mode_lib->ms.dst_y_per_row_flip[k],
-							&mode_lib->ms.final_flip_bw[k],
-							&mode_lib->ms.ImmediateFlipSupportedForPipe[k]);
-					}
+			}
 
-					calculate_peak_bandwidth_params->urg_vactive_bandwidth_required = s->dummy_bw;
-					calculate_peak_bandwidth_params->urg_bandwidth_required = mode_lib->ms.support.urg_bandwidth_required_flip;
-					calculate_peak_bandwidth_params->urg_bandwidth_required_qual = s->dummy_bw;
-					calculate_peak_bandwidth_params->non_urg_bandwidth_required = mode_lib->ms.support.non_urg_bandwidth_required_flip;
-					calculate_peak_bandwidth_params->surface_avg_vactive_required_bw = s->surface_dummy_bw;
-					calculate_peak_bandwidth_params->surface_peak_required_bw = mode_lib->ms.surface_peak_required_bw;
-
-					calculate_peak_bandwidth_params->display_cfg = display_cfg;
-					calculate_peak_bandwidth_params->inc_flip_bw = 1;
-					calculate_peak_bandwidth_params->num_active_planes = mode_lib->ms.num_active_planes;
-					calculate_peak_bandwidth_params->num_of_dpp = mode_lib->ms.NoOfDPP;
-					calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 = mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0;
-					calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 = mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1;
-					calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 = mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p0;
-					calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 = mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p1;
-					calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->ms.mall_prefetch_sdp_overhead_factor;
-					calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->ms.mall_prefetch_dram_overhead_factor;
-
-					calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->ms.SurfaceReadBandwidthLuma;
-					calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->ms.SurfaceReadBandwidthChroma;
-					calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->ms.RequiredPrefetchPixelDataBWLuma;
-					calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->ms.RequiredPrefetchPixelDataBWChroma;
-					calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->ms.excess_vactive_fill_bw_l;
-					calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->ms.excess_vactive_fill_bw_c;
-					calculate_peak_bandwidth_params->cursor_bw = mode_lib->ms.cursor_bw;
-					calculate_peak_bandwidth_params->dpte_row_bw = mode_lib->ms.dpte_row_bw;
-					calculate_peak_bandwidth_params->meta_row_bw = mode_lib->ms.meta_row_bw;
-					calculate_peak_bandwidth_params->prefetch_cursor_bw = mode_lib->ms.prefetch_cursor_bw;
-					calculate_peak_bandwidth_params->prefetch_vmrow_bw = mode_lib->ms.prefetch_vmrow_bw;
-					calculate_peak_bandwidth_params->flip_bw = mode_lib->ms.final_flip_bw;
-					calculate_peak_bandwidth_params->urgent_burst_factor_l = mode_lib->ms.UrgentBurstFactorLuma;
-					calculate_peak_bandwidth_params->urgent_burst_factor_c = mode_lib->ms.UrgentBurstFactorChroma;
-					calculate_peak_bandwidth_params->urgent_burst_factor_cursor = mode_lib->ms.UrgentBurstFactorCursor;
-					calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_l = mode_lib->ms.UrgentBurstFactorLumaPre;
-					calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_c = mode_lib->ms.UrgentBurstFactorChromaPre;
-					calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor = mode_lib->ms.UrgentBurstFactorCursorPre;
-
-					calculate_peak_bandwidth_required(
-							&mode_lib->scratch,
-							calculate_peak_bandwidth_params);
-
-					calculate_immediate_flip_bandwidth_support(
-						&s->dummy_single[0], // double* frac_urg_bandwidth_flip
-						&mode_lib->ms.support.ImmediateFlipSupport,
-
-						dml2_core_internal_soc_state_sys_active,
-						mode_lib->ms.support.urg_bandwidth_required_flip,
-						mode_lib->ms.support.non_urg_bandwidth_required_flip,
-						mode_lib->ms.support.urg_bandwidth_available);
-
-					for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-						if (display_cfg->plane_descriptors[k].immediate_flip == true && mode_lib->ms.ImmediateFlipSupportedForPipe[k] == false)
-							mode_lib->ms.support.ImmediateFlipSupport = false;
-					}
+			for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
+				CalculateFlipSchedule(
+					&mode_lib->scratch,
+					display_cfg->plane_descriptors[k].immediate_flip,
+					1, // use_lb_flip_bw
+					s->HostVMInefficiencyFactor,
+					s->Tvm_trips_flip[k],
+					s->Tr0_trips_flip[k],
+					s->Tvm_trips_flip_rounded[k],
+					s->Tr0_trips_flip_rounded[k],
+					display_cfg->gpuvm_enable,
+					mode_lib->ms.vm_bytes[k],
+					mode_lib->ms.DPTEBytesPerRow[k],
+					mode_lib->ms.BandwidthAvailableForImmediateFlip,
+					mode_lib->ms.TotImmediateFlipBytes,
+					display_cfg->plane_descriptors[k].pixel_format,
+					(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)),
+					display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio,
+					display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio,
+					mode_lib->ms.Tno_bw_flip[k],
+					mode_lib->ms.dpte_row_height[k],
+					mode_lib->ms.dpte_row_height_chroma[k],
+					mode_lib->ms.use_one_row_for_frame_flip[k],
+					mode_lib->ip.max_flip_time_us,
+					mode_lib->ip.max_flip_time_lines,
+					s->per_pipe_flip_bytes[k],
+					mode_lib->ms.meta_row_bytes[k],
+					s->meta_row_height_luma[k],
+					s->meta_row_height_chroma[k],
+					mode_lib->ip.dcn_mrq_present && display_cfg->plane_descriptors[k].surface.dcc.enable,
+
+					/* Output */
+					&mode_lib->ms.dst_y_per_vm_flip[k],
+					&mode_lib->ms.dst_y_per_row_flip[k],
+					&mode_lib->ms.final_flip_bw[k],
+					&mode_lib->ms.ImmediateFlipSupportedForPipe[k]);
+			}
+
+			calculate_peak_bandwidth_params->urg_vactive_bandwidth_required = s->dummy_bw;
+			calculate_peak_bandwidth_params->urg_bandwidth_required = mode_lib->ms.support.urg_bandwidth_required_flip;
+			calculate_peak_bandwidth_params->urg_bandwidth_required_qual = s->dummy_bw;
+			calculate_peak_bandwidth_params->non_urg_bandwidth_required = mode_lib->ms.support.non_urg_bandwidth_required_flip;
+			calculate_peak_bandwidth_params->surface_avg_vactive_required_bw = s->surface_dummy_bw;
+			calculate_peak_bandwidth_params->surface_peak_required_bw = mode_lib->ms.surface_peak_required_bw;
+
+			calculate_peak_bandwidth_params->display_cfg = display_cfg;
+			calculate_peak_bandwidth_params->inc_flip_bw = 1;
+			calculate_peak_bandwidth_params->num_active_planes = mode_lib->ms.num_active_planes;
+			calculate_peak_bandwidth_params->num_of_dpp = mode_lib->ms.NoOfDPP;
+			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p0 = mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0;
+			calculate_peak_bandwidth_params->dcc_dram_bw_nom_overhead_factor_p1 = mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1;
+			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p0 = mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p0;
+			calculate_peak_bandwidth_params->dcc_dram_bw_pref_overhead_factor_p1 = mode_lib->ms.dcc_dram_bw_pref_overhead_factor_p1;
+			calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->ms.mall_prefetch_sdp_overhead_factor;
+			calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->ms.mall_prefetch_dram_overhead_factor;
+
+			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->ms.vactive_sw_bw_l;
+			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->ms.vactive_sw_bw_c;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->ms.RequiredPrefetchPixelDataBWLuma;
+			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->ms.RequiredPrefetchPixelDataBWChroma;
+			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->ms.excess_vactive_fill_bw_l;
+			calculate_peak_bandwidth_params->excess_vactive_fill_bw_c = mode_lib->ms.excess_vactive_fill_bw_c;
+			calculate_peak_bandwidth_params->cursor_bw = mode_lib->ms.cursor_bw;
+			calculate_peak_bandwidth_params->dpte_row_bw = mode_lib->ms.dpte_row_bw;
+			calculate_peak_bandwidth_params->meta_row_bw = mode_lib->ms.meta_row_bw;
+			calculate_peak_bandwidth_params->prefetch_cursor_bw = mode_lib->ms.prefetch_cursor_bw;
+			calculate_peak_bandwidth_params->prefetch_vmrow_bw = mode_lib->ms.prefetch_vmrow_bw;
+			calculate_peak_bandwidth_params->flip_bw = mode_lib->ms.final_flip_bw;
+			calculate_peak_bandwidth_params->urgent_burst_factor_l = mode_lib->ms.UrgentBurstFactorLuma;
+			calculate_peak_bandwidth_params->urgent_burst_factor_c = mode_lib->ms.UrgentBurstFactorChroma;
+			calculate_peak_bandwidth_params->urgent_burst_factor_cursor = mode_lib->ms.UrgentBurstFactorCursor;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_l = mode_lib->ms.UrgentBurstFactorLumaPre;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_c = mode_lib->ms.UrgentBurstFactorChromaPre;
+			calculate_peak_bandwidth_params->urgent_burst_factor_prefetch_cursor = mode_lib->ms.UrgentBurstFactorCursorPre;
+
+			calculate_peak_bandwidth_required(
+					&mode_lib->scratch,
+					calculate_peak_bandwidth_params);
+
+			calculate_immediate_flip_bandwidth_support(
+				&s->dummy_single[0], // double* frac_urg_bandwidth_flip
+				&mode_lib->ms.support.ImmediateFlipSupport,
 
-				} else { // if prefetch not support, assume iflip is not supported too
+				dml2_core_internal_soc_state_sys_active,
+				mode_lib->ms.support.urg_bandwidth_required_flip,
+				mode_lib->ms.support.non_urg_bandwidth_required_flip,
+				mode_lib->ms.support.urg_bandwidth_available);
+
+			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+				if (display_cfg->plane_descriptors[k].immediate_flip == true && mode_lib->ms.ImmediateFlipSupportedForPipe[k] == false)
 					mode_lib->ms.support.ImmediateFlipSupport = false;
-				}
-			} // prefetch schedule
+			}
+
+		} else { // if prefetch not support, assume iflip is not supported too
+			mode_lib->ms.support.ImmediateFlipSupport = false;
 		}
 
 		s->mSOCParameters.UrgentLatency = mode_lib->ms.UrgLatency;
@@ -9127,8 +9408,8 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 			s->pstate_bytes_required_c,
 			mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p0,
 			mode_lib->ms.dcc_dram_bw_nom_overhead_factor_p1,
-			mode_lib->ms.SurfaceReadBandwidthLuma,
-			mode_lib->ms.SurfaceReadBandwidthChroma,
+			mode_lib->ms.vactive_sw_bw_l,
+			mode_lib->ms.vactive_sw_bw_c,
 			mode_lib->ms.surface_avg_vactive_required_bw,
 			mode_lib->ms.surface_peak_required_bw,
 			/* outputs */
@@ -9198,12 +9479,12 @@ static bool dml_core_mode_support(struct dml2_core_calcs_mode_support_ex *in_out
 	dml2_printf("DML::%s: ModeSupport = %u\n", __func__, mode_lib->ms.support.ModeSupport);
 	dml2_printf("DML::%s: ImmediateFlipSupport = %u\n", __func__, mode_lib->ms.support.ImmediateFlipSupport);
 
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+	for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 		mode_lib->ms.support.MPCCombineEnable[k] = mode_lib->ms.MPCCombine[k];
 		mode_lib->ms.support.DPPPerSurface[k] = mode_lib->ms.NoOfDPP[k];
 	}
 
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+	for (k = 0; k < mode_lib->ms.num_active_planes; k++) {
 		mode_lib->ms.support.ODMMode[k] = mode_lib->ms.ODMMode[k];
 		mode_lib->ms.support.DSCEnabled[k] = mode_lib->ms.RequiresDSC[k];
 		mode_lib->ms.support.FECEnabled[k] = mode_lib->ms.RequiresFEC[k];
@@ -9240,7 +9521,7 @@ unsigned int dml2_core_calcs_mode_support_ex(struct dml2_core_calcs_mode_support
 	dml2_printf("DML::%s: is_mode_support = %u (min_clk_index=%d)\n", __func__, result, in_out_params->min_clk_index);
 
 	for (unsigned int k = 0; k < in_out_params->in_display_cfg->num_planes; k++)
-	    dml2_printf("DML::%s: plane_%d: reserved_vblank_time_ns = %u\n", __func__, k, in_out_params->in_display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
+		dml2_printf("DML::%s: plane_%d: reserved_vblank_time_ns = %u\n", __func__, k, in_out_params->in_display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns);
 
 	dml2_printf("DML::%s: ------------- DONE ----------\n", __func__);
 
@@ -9893,7 +10174,7 @@ static void CalculateStutterEfficiency(struct dml2_core_internal_scratch *scratc
 		if (!dml_is_phantom_pipe(&p->display_cfg->plane_descriptors[k])) {
 			if (!l->stream_visited[p->display_cfg->plane_descriptors[k].stream_index]) {
 
-				if (p->display_cfg->stream_descriptors[k].writeback.enable)
+				if (p->display_cfg->stream_descriptors[k].writeback.active_writebacks_per_stream > 0)
 					l->TotalActiveWriteback = l->TotalActiveWriteback + 1;
 
 				if (TotalNumberOfActiveOTG == 0) { // first otg
@@ -9995,6 +10276,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	struct dml2_core_calcs_CalculateSwathAndDETConfiguration_params *CalculateSwathAndDETConfiguration_params = &mode_lib->scratch.CalculateSwathAndDETConfiguration_params;
 	struct dml2_core_calcs_CalculateStutterEfficiency_params *CalculateStutterEfficiency_params = &mode_lib->scratch.CalculateStutterEfficiency_params;
 	struct dml2_core_calcs_CalculatePrefetchSchedule_params *CalculatePrefetchSchedule_params = &mode_lib->scratch.CalculatePrefetchSchedule_params;
+	struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_params *CheckGlobalPrefetchAdmissibility_params = &mode_lib->scratch.CheckGlobalPrefetchAdmissibility_params;
 	struct dml2_core_calcs_calculate_mcache_setting_params *calculate_mcache_setting_params = &mode_lib->scratch.calculate_mcache_setting_params;
 	struct dml2_core_calcs_calculate_tdlut_setting_params *calculate_tdlut_setting_params = &mode_lib->scratch.calculate_tdlut_setting_params;
 	struct dml2_core_shared_CalculateMetaAndPTETimes_params *CalculateMetaAndPTETimes_params = &mode_lib->scratch.CalculateMetaAndPTETimes_params;
@@ -10209,10 +10491,10 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	for (k = 0; k < s->num_active_planes; ++k) {
 		mode_lib->mp.cursor_bw[k] = display_cfg->plane_descriptors[k].cursor.num_cursors * display_cfg->plane_descriptors[k].cursor.cursor_width * display_cfg->plane_descriptors[k].cursor.cursor_bpp / 8.0 /
 			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000));
-		mode_lib->mp.SurfaceReadBandwidthLuma[k] = mode_lib->mp.SwathWidthSingleDPPY[k] * mode_lib->mp.BytePerPixelY[k] / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
-		mode_lib->mp.SurfaceReadBandwidthChroma[k] = mode_lib->mp.SwathWidthSingleDPPC[k] * mode_lib->mp.BytePerPixelC[k] / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
-		dml2_printf("DML::%s: ReadBandwidthSurfaceLuma[%i] = %fBps\n", __func__, k, mode_lib->mp.SurfaceReadBandwidthLuma[k]);
-		dml2_printf("DML::%s: ReadBandwidthSurfaceChroma[%i] = %fBps\n", __func__, k, mode_lib->mp.SurfaceReadBandwidthChroma[k]);
+		mode_lib->mp.vactive_sw_bw_l[k] = mode_lib->mp.SwathWidthSingleDPPY[k] * mode_lib->mp.BytePerPixelY[k] / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio;
+		mode_lib->mp.vactive_sw_bw_c[k] = mode_lib->mp.SwathWidthSingleDPPC[k] * mode_lib->mp.BytePerPixelC[k] / (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio;
+		dml2_printf("DML::%s: vactive_sw_bw_l[%i] = %fBps\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
+		dml2_printf("DML::%s: vactive_sw_bw_c[%i] = %fBps\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
 	}
 
 	CalculateSwathAndDETConfiguration_params->display_cfg = display_cfg;
@@ -10228,8 +10510,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	CalculateSwathAndDETConfiguration_params->nomDETInKByte = s->NomDETInKByte;
 	CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSegmentSizeInkByte = mode_lib->ip.config_return_buffer_segment_size_in_kbytes;
 	CalculateSwathAndDETConfiguration_params->CompressedBufferSegmentSizeInkByte = mode_lib->ip.compressed_buffer_segment_size_in_kbytes;
-	CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->mp.SurfaceReadBandwidthLuma;
-	CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->mp.SurfaceReadBandwidthChroma;
+	CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->mp.vactive_sw_bw_l;
+	CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->mp.vactive_sw_bw_c;
 	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthLuma = s->dummy_single_array[0];
 	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthChroma = s->dummy_single_array[1];
 	CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightY = mode_lib->mp.Read256BlockHeightY;
@@ -10594,17 +10876,17 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	mode_lib->mp.TCalc = 24.0 / mode_lib->mp.DCFCLKDeepSleep;
 
 	for (k = 0; k < s->num_active_planes; ++k) {
-		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
+		if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
 			mode_lib->mp.WritebackDelay[k] =
 				mode_lib->soc.qos_parameters.writeback.base_latency_us
 				+ CalculateWriteBackDelay(
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.h_ratio,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_ratio,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.v_taps,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height,
-					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].pixel_format,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].h_ratio,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_ratio,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].v_taps,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_width,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].output_height,
+					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.writeback_stream[0].input_height,
 					display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total) / mode_lib->mp.Dispclk;
 		} else
 			mode_lib->mp.WritebackDelay[k] = 0;
@@ -10690,10 +10972,25 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 
 	for (k = 0; k < s->num_active_planes; ++k) {
 		bool cursor_not_enough_urgent_latency_hiding = 0;
-		double line_time_us = 0.0;
-
-		line_time_us = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total /
+		s->line_times[k] = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total /
 			((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000);
+
+		s->pixel_format[k] = display_cfg->plane_descriptors[k].pixel_format;
+
+		s->lb_source_lines_l[k] = get_num_lb_source_lines(mode_lib->ip.max_line_buffer_lines, mode_lib->ip.line_buffer_size_bits,
+															mode_lib->mp.NoOfDPP[k],
+															display_cfg->plane_descriptors[k].composition.viewport.plane0.width,
+															display_cfg->plane_descriptors[k].composition.viewport.plane0.height,
+															display_cfg->plane_descriptors[k].composition.scaler_info.plane0.h_ratio,
+															display_cfg->plane_descriptors[k].composition.rotation_angle);
+
+		s->lb_source_lines_c[k] = get_num_lb_source_lines(mode_lib->ip.max_line_buffer_lines, mode_lib->ip.line_buffer_size_bits,
+															mode_lib->mp.NoOfDPP[k],
+															display_cfg->plane_descriptors[k].composition.viewport.plane1.width,
+															display_cfg->plane_descriptors[k].composition.viewport.plane1.height,
+															display_cfg->plane_descriptors[k].composition.scaler_info.plane1.h_ratio,
+															display_cfg->plane_descriptors[k].composition.rotation_angle);
+
 		if (display_cfg->plane_descriptors[k].cursor.num_cursors > 0) {
 			calculate_cursor_req_attributes(
 				display_cfg->plane_descriptors[k].cursor.cursor_width,
@@ -10710,7 +11007,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				display_cfg->plane_descriptors[k].cursor.cursor_width,
 				s->cursor_bytes_per_chunk[k],
 				s->cursor_lines_per_chunk[k],
-				line_time_us,
+				s->line_times[k],
 				mode_lib->mp.UrgentLatency,
 
 				// output
@@ -10725,7 +11022,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			mode_lib->mp.swath_width_chroma_ub[k],
 			mode_lib->mp.SwathHeightY[k],
 			mode_lib->mp.SwathHeightC[k],
-			line_time_us,
+			s->line_times[k],
 			mode_lib->mp.UrgentLatency,
 			display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio,
 			display_cfg->plane_descriptors[k].composition.scaler_info.plane1.v_ratio,
@@ -10763,6 +11060,35 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 	dml2_printf("DML::%s: immediate_flip_required = %u\n", __func__, s->immediate_flip_required);
 #endif
 
+	if (s->num_active_planes > 1) {
+		CheckGlobalPrefetchAdmissibility_params->num_active_planes =  s->num_active_planes;
+		CheckGlobalPrefetchAdmissibility_params->pixel_format = s->pixel_format;
+		CheckGlobalPrefetchAdmissibility_params->chunk_bytes_l = mode_lib->ip.pixel_chunk_size_kbytes * 1024;
+		CheckGlobalPrefetchAdmissibility_params->chunk_bytes_c = mode_lib->ip.pixel_chunk_size_kbytes * 1024;
+		CheckGlobalPrefetchAdmissibility_params->lb_source_lines_l = s->lb_source_lines_l;
+		CheckGlobalPrefetchAdmissibility_params->lb_source_lines_c = s->lb_source_lines_c;
+		CheckGlobalPrefetchAdmissibility_params->swath_height_l =  mode_lib->mp.SwathHeightY;
+		CheckGlobalPrefetchAdmissibility_params->swath_height_c =  mode_lib->mp.SwathHeightC;
+		CheckGlobalPrefetchAdmissibility_params->rob_buffer_size_kbytes = mode_lib->ip.rob_buffer_size_kbytes;
+		CheckGlobalPrefetchAdmissibility_params->compressed_buffer_size_kbytes = mode_lib->mp.CompressedBufferSizeInkByte;
+		CheckGlobalPrefetchAdmissibility_params->detile_buffer_size_bytes_l = mode_lib->mp.DETBufferSizeY;
+		CheckGlobalPrefetchAdmissibility_params->detile_buffer_size_bytes_c = mode_lib->mp.DETBufferSizeC;
+		CheckGlobalPrefetchAdmissibility_params->full_swath_bytes_l = s->full_swath_bytes_l;
+		CheckGlobalPrefetchAdmissibility_params->full_swath_bytes_c = s->full_swath_bytes_c;
+		CheckGlobalPrefetchAdmissibility_params->prefetch_sw_bytes = s->prefetch_sw_bytes;
+		CheckGlobalPrefetchAdmissibility_params->Tpre_rounded = 0; // don't care
+		CheckGlobalPrefetchAdmissibility_params->Tpre_oto = 0; // don't care
+		CheckGlobalPrefetchAdmissibility_params->estimated_urg_bandwidth_required_mbps = mode_lib->mp.urg_bandwidth_available[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp];
+		CheckGlobalPrefetchAdmissibility_params->estimated_dcfclk_mhz = mode_lib->mp.Dcfclk;
+		CheckGlobalPrefetchAdmissibility_params->line_time = s->line_times;
+		CheckGlobalPrefetchAdmissibility_params->dst_y_prefetch = mode_lib->mp.dst_y_prefetch;
+
+		// if recalc_prefetch_schedule is set, recalculate the prefetch schedule with the new impacted_Tpre, prefetch should be possible
+		CheckGlobalPrefetchAdmissibility_params->recalc_prefetch_schedule = &s->dummy_boolean[0];
+		CheckGlobalPrefetchAdmissibility_params->impacted_dst_y_pre = s->impacted_dst_y_pre;
+		CheckGlobalPrefetchAdmissibility(&mode_lib->scratch, CheckGlobalPrefetchAdmissibility_params); // dont care about the check output for mode programming
+	}
+
 	{
 		s->DestinationLineTimesForPrefetchLessThan2 = false;
 		s->VRatioPrefetchMoreThanMax = false;
@@ -10774,11 +11100,11 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 
 			dml2_printf("DML::%s: k=%d MaxVStartupLines = %u\n", __func__, k, s->MaxVStartupLines[k]);
 			mode_lib->mp.TWait[k] = CalculateTWait(
-				display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns,
-				mode_lib->mp.UrgentLatency,
-				mode_lib->mp.TripToMemory,
-				!dml_is_phantom_pipe(&display_cfg->plane_descriptors[k]) && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.drr_config.enabled ?
-				get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->mp.uclk_freq_mhz * 1000), in_out_params->min_clk_index) : 0.0);
+					display_cfg->plane_descriptors[k].overrides.reserved_vblank_time_ns,
+					mode_lib->mp.UrgentLatency,
+					mode_lib->mp.TripToMemory,
+					!dml_is_phantom_pipe(&display_cfg->plane_descriptors[k]) && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.drr_config.enabled ?
+					get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->mp.uclk_freq_mhz * 1000), in_out_params->min_clk_index) : 0.0);
 
 			myPipe->Dppclk = mode_lib->mp.Dppclk[k];
 			myPipe->Dispclk = mode_lib->mp.Dispclk;
@@ -10859,6 +11185,9 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			CalculatePrefetchSchedule_params->mrq_present = mode_lib->ip.dcn_mrq_present;
 			CalculatePrefetchSchedule_params->meta_row_bytes = mode_lib->mp.meta_row_bytes[k];
 			CalculatePrefetchSchedule_params->mall_prefetch_sdp_overhead_factor = mode_lib->mp.mall_prefetch_sdp_overhead_factor[k];
+			CalculatePrefetchSchedule_params->impacted_dst_y_pre = s->impacted_dst_y_pre[k];
+			CalculatePrefetchSchedule_params->vactive_sw_bw_l = mode_lib->mp.vactive_sw_bw_l[k];
+			CalculatePrefetchSchedule_params->vactive_sw_bw_c = mode_lib->mp.vactive_sw_bw_c[k];
 
 			// output
 			CalculatePrefetchSchedule_params->DSTXAfterScaler = &mode_lib->mp.DSTXAfterScaler[k];
@@ -10887,9 +11216,17 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			CalculatePrefetchSchedule_params->VUpdateWidthPix = &mode_lib->mp.VUpdateWidthPix[k];
 			CalculatePrefetchSchedule_params->VReadyOffsetPix = &mode_lib->mp.VReadyOffsetPix[k];
 			CalculatePrefetchSchedule_params->prefetch_cursor_bw = &mode_lib->mp.prefetch_cursor_bw[k];
+			CalculatePrefetchSchedule_params->prefetch_sw_bytes = &s->prefetch_sw_bytes[k];
+			CalculatePrefetchSchedule_params->Tpre_rounded = &s->Tpre_rounded[k];
+			CalculatePrefetchSchedule_params->Tpre_oto = &s->Tpre_oto[k];
 
 			mode_lib->mp.NoTimeToPrefetch[k] = CalculatePrefetchSchedule(&mode_lib->scratch, CalculatePrefetchSchedule_params);
 
+			if (s->impacted_dst_y_pre[k] > 0)
+				mode_lib->mp.impacted_prefetch_margin_us[k] = (mode_lib->mp.dst_y_prefetch[k] - s->impacted_dst_y_pre[k]) * s->line_times[k];
+			else
+				mode_lib->mp.impacted_prefetch_margin_us[k] = 0;
+
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: k=%0u NoTimeToPrefetch=%0d\n", __func__, k, mode_lib->mp.NoTimeToPrefetch[k]);
 #endif
@@ -10967,8 +11304,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 				dml2_printf("DML::%s: k=%0u VRatioY=%f\n", __func__, k, display_cfg->plane_descriptors[k].composition.scaler_info.plane0.v_ratio);
 
 				dml2_printf("DML::%s: k=%0u prefetch_vmrow_bw=%f\n", __func__, k, mode_lib->mp.prefetch_vmrow_bw[k]);
-				dml2_printf("DML::%s: k=%0u ReadBandwidthSurfaceLuma=%f\n", __func__, k, mode_lib->mp.SurfaceReadBandwidthLuma[k]);
-				dml2_printf("DML::%s: k=%0u ReadBandwidthSurfaceChroma=%f\n", __func__, k, mode_lib->mp.SurfaceReadBandwidthChroma[k]);
+				dml2_printf("DML::%s: k=%0u vactive_sw_bw_l=%f\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
+				dml2_printf("DML::%s: k=%0u vactive_sw_bw_c=%f\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
 				dml2_printf("DML::%s: k=%0u cursor_bw=%f\n", __func__, k, mode_lib->mp.cursor_bw[k]);
 				dml2_printf("DML::%s: k=%0u dpte_row_bw=%f\n", __func__, k, mode_lib->mp.dpte_row_bw[k]);
 				dml2_printf("DML::%s: k=%0u meta_row_bw=%f\n", __func__, k, mode_lib->mp.meta_row_bw[k]);
@@ -10999,8 +11336,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->mp.mall_prefetch_sdp_overhead_factor;
 			calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->mp.mall_prefetch_dram_overhead_factor;
 
-			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->mp.SurfaceReadBandwidthLuma;
-			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.SurfaceReadBandwidthChroma;
+			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->mp.vactive_sw_bw_l;
+			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.vactive_sw_bw_c;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->mp.RequiredPrefetchPixelDataBWLuma;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->mp.RequiredPrefetchPixelDataBWChroma;
 			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->mp.excess_vactive_fill_bw_l;
@@ -11131,8 +11468,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 			calculate_peak_bandwidth_params->mall_prefetch_sdp_overhead_factor = mode_lib->mp.mall_prefetch_sdp_overhead_factor;
 			calculate_peak_bandwidth_params->mall_prefetch_dram_overhead_factor = mode_lib->mp.mall_prefetch_dram_overhead_factor;
 
-			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->mp.SurfaceReadBandwidthLuma;
-			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.SurfaceReadBandwidthChroma;
+			calculate_peak_bandwidth_params->surface_read_bandwidth_l = mode_lib->mp.vactive_sw_bw_l;
+			calculate_peak_bandwidth_params->surface_read_bandwidth_c = mode_lib->mp.vactive_sw_bw_c;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_l = mode_lib->mp.RequiredPrefetchPixelDataBWLuma;
 			calculate_peak_bandwidth_params->prefetch_bandwidth_c = mode_lib->mp.RequiredPrefetchPixelDataBWChroma;
 			calculate_peak_bandwidth_params->excess_vactive_fill_bw_l = mode_lib->mp.excess_vactive_fill_bw_l;
@@ -11249,8 +11586,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		s->mmSOCParameters.USRRetrainingLatency = 0;
 		s->mmSOCParameters.SMNLatency = 0;
 		s->mmSOCParameters.g6_temp_read_blackout_us = get_g6_temp_read_blackout_us(&mode_lib->soc, (unsigned int)(mode_lib->mp.uclk_freq_mhz * 1000), in_out_params->min_clk_index);
-		s->mmSOCParameters.max_urgent_latency_us = get_max_urgent_latency_us(&mode_lib->soc.qos_parameters.qos_params.dcn4x, mode_lib->ms.uclk_freq_mhz, mode_lib->ms.FabricClock, in_out_params->min_clk_index);
-		s->mmSOCParameters.df_response_time_us = mode_lib->soc.qos_parameters.qos_params.dcn4x.df_qos_response_time_fclk_cycles / mode_lib->ms.FabricClock;
+		s->mmSOCParameters.max_urgent_latency_us = get_max_urgent_latency_us(&mode_lib->soc.qos_parameters.qos_params.dcn4x, mode_lib->mp.uclk_freq_mhz, mode_lib->mp.FabricClock, in_out_params->min_clk_index);
+		s->mmSOCParameters.df_response_time_us = mode_lib->soc.qos_parameters.qos_params.dcn4x.df_qos_response_time_fclk_cycles / mode_lib->mp.FabricClock;
 		s->mmSOCParameters.qos_type = mode_lib->soc.qos_parameters.qos_type;
 
 		CalculateWatermarks_params->display_cfg = display_cfg;
@@ -11300,7 +11637,7 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(&mode_lib->scratch, CalculateWatermarks_params);
 
 		for (k = 0; k < s->num_active_planes; ++k) {
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
+			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.active_writebacks_per_stream > 0) {
 				mode_lib->mp.WritebackAllowDRAMClockChangeEndPosition[k] = math_max2(0, mode_lib->mp.VStartupMin[k] * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total /
 					((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000) - mode_lib->mp.Watermark.WritebackDRAMClockChangeWatermark);
 				mode_lib->mp.WritebackAllowFCLKChangeEndPosition[k] = math_max2(0, mode_lib->mp.VStartupMin[k] * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total /
@@ -11486,25 +11823,25 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 
 		//Maximum Bandwidth Used
 		s->TotalWRBandwidth = 0;
-		s->WRBandwidth = 0;
-		for (k = 0; k < s->num_active_planes; ++k) {
-			if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true && display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.pixel_format == dml2_444_32) {
-				s->WRBandwidth = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width /
-					(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * 4;
-			} else if (display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.enable == true) {
-				s->WRBandwidth = display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_height * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.output_width /
-					(display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.h_total * display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].writeback.scaling_info.input_height / ((double)display_cfg->stream_descriptors[display_cfg->plane_descriptors[k].stream_index].timing.pixel_clock_khz / 1000)) * 8;
+		for (k = 0; k < display_cfg->num_streams; ++k) {
+			s->WRBandwidth = 0;
+			if (display_cfg->stream_descriptors[k].writeback.active_writebacks_per_stream > 0) {
+				s->WRBandwidth = display_cfg->stream_descriptors[k].writeback.writeback_stream[0].output_height
+					* display_cfg->stream_descriptors[k].writeback.writeback_stream[0].output_width /
+					(display_cfg->stream_descriptors[k].timing.h_total * display_cfg->stream_descriptors[k].writeback.writeback_stream[0].input_height
+						/ ((double)display_cfg->stream_descriptors[k].timing.pixel_clock_khz / 1000))
+					* (display_cfg->stream_descriptors[k].writeback.writeback_stream[0].pixel_format == dml2_444_32 ? 4.0 : 8.0);
+				s->TotalWRBandwidth = s->TotalWRBandwidth + s->WRBandwidth;
 			}
-			s->TotalWRBandwidth = s->TotalWRBandwidth + s->WRBandwidth;
 		}
 
 		mode_lib->mp.TotalDataReadBandwidth = 0;
 		for (k = 0; k < s->num_active_planes; ++k) {
-			mode_lib->mp.TotalDataReadBandwidth = mode_lib->mp.TotalDataReadBandwidth + mode_lib->mp.SurfaceReadBandwidthLuma[k] + mode_lib->mp.SurfaceReadBandwidthChroma[k];
+			mode_lib->mp.TotalDataReadBandwidth = mode_lib->mp.TotalDataReadBandwidth + mode_lib->mp.vactive_sw_bw_l[k] + mode_lib->mp.vactive_sw_bw_c[k];
 #ifdef __DML_VBA_DEBUG__
 			dml2_printf("DML::%s: k=%u, TotalDataReadBandwidth = %f\n", __func__, k, mode_lib->mp.TotalDataReadBandwidth);
-			dml2_printf("DML::%s: k=%u, ReadBandwidthSurfaceLuma = %f\n", __func__, k, mode_lib->mp.SurfaceReadBandwidthLuma[k]);
-			dml2_printf("DML::%s: k=%u, ReadBandwidthSurfaceChroma = %f\n", __func__, k, mode_lib->mp.SurfaceReadBandwidthChroma[k]);
+			dml2_printf("DML::%s: k=%u, vactive_sw_bw_l = %f\n", __func__, k, mode_lib->mp.vactive_sw_bw_l[k]);
+			dml2_printf("DML::%s: k=%u, vactive_sw_bw_c = %f\n", __func__, k, mode_lib->mp.vactive_sw_bw_c[k]);
 #endif
 		}
 
@@ -11541,8 +11878,8 @@ static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex
 		CalculateStutterEfficiency_params->BlockWidth256BytesC = mode_lib->mp.Read256BlockWidthC;
 		CalculateStutterEfficiency_params->DCCYMaxUncompressedBlock = mode_lib->mp.DCCYMaxUncompressedBlock;
 		CalculateStutterEfficiency_params->DCCCMaxUncompressedBlock = mode_lib->mp.DCCCMaxUncompressedBlock;
-		CalculateStutterEfficiency_params->ReadBandwidthSurfaceLuma = mode_lib->mp.SurfaceReadBandwidthLuma;
-		CalculateStutterEfficiency_params->ReadBandwidthSurfaceChroma = mode_lib->mp.SurfaceReadBandwidthChroma;
+		CalculateStutterEfficiency_params->ReadBandwidthSurfaceLuma = mode_lib->mp.vactive_sw_bw_l;
+		CalculateStutterEfficiency_params->ReadBandwidthSurfaceChroma = mode_lib->mp.vactive_sw_bw_c;
 		CalculateStutterEfficiency_params->dpte_row_bw = mode_lib->mp.dpte_row_bw;
 		CalculateStutterEfficiency_params->meta_row_bw = mode_lib->mp.meta_row_bw;
 		CalculateStutterEfficiency_params->rob_alloc_compressed = mode_lib->ip.dcn_mrq_present;
@@ -11753,7 +12090,7 @@ static void rq_dlg_get_wm_regs(const struct dml2_display_cfg *display_cfg, const
 	wm_regs->fclk_pstate = (int unsigned)(mode_lib->mp.Watermark.FCLKChangeWatermark * refclk_freq_in_mhz);
 	wm_regs->sr_enter = (int unsigned)(mode_lib->mp.Watermark.StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
 	wm_regs->sr_exit = (int unsigned)(mode_lib->mp.Watermark.StutterExitWatermark * refclk_freq_in_mhz);
-	wm_regs->temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.g6_temp_read_watermark_us * refclk_freq_in_mhz);
+	wm_regs->temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.temp_read_or_ppt_watermark_us * refclk_freq_in_mhz);
 	wm_regs->uclk_pstate = (int unsigned)(mode_lib->mp.Watermark.DRAMClockChangeWatermark * refclk_freq_in_mhz);
 	wm_regs->urgent = (int unsigned)(mode_lib->mp.Watermark.UrgentWatermark * refclk_freq_in_mhz);
 	wm_regs->usr = (int unsigned)(mode_lib->mp.Watermark.USRRetrainingWatermark * refclk_freq_in_mhz);
@@ -12334,7 +12671,7 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 		const struct display_configuation_with_meta *display_cfg,
 		union dmub_cmd_fams2_config *fams2_base_programming,
 		union dmub_cmd_fams2_config *fams2_sub_programming,
-		enum dml2_uclk_pstate_support_method pstate_method,
+		enum dml2_pstate_method pstate_method,
 		int plane_index)
 {
 	const struct dml2_plane_parameters *plane_descriptor = &display_cfg->display_config.plane_descriptors[plane_index];
@@ -12385,77 +12722,77 @@ void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_interna
 	}
 
 	switch (pstate_method) {
-	case dml2_uclk_pstate_support_method_vactive:
-	case dml2_uclk_pstate_support_method_fw_vactive_drr:
+	case dml2_pstate_method_vactive:
+	case dml2_pstate_method_fw_vactive_drr:
 		/* legacy vactive */
 		base_programming->type = FAMS2_STREAM_TYPE_VACTIVE;
 		sub_programming->legacy.vactive_det_fill_delay_otg_vlines =
-				(uint8_t)stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines;
+			(uint8_t)stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines;
 		base_programming->allow_start_otg_vline =
-				(uint16_t)stream_fams2_meta->method_vactive.common.allow_start_otg_vline;
+			(uint16_t)stream_fams2_meta->method_vactive.common.allow_start_otg_vline;
 		base_programming->allow_end_otg_vline =
-				(uint16_t)stream_fams2_meta->method_vactive.common.allow_end_otg_vline;
+			(uint16_t)stream_fams2_meta->method_vactive.common.allow_end_otg_vline;
 		base_programming->config.bits.clamp_vtotal_min = true;
 		break;
-	case dml2_uclk_pstate_support_method_vblank:
-	case dml2_uclk_pstate_support_method_fw_vblank_drr:
+	case dml2_pstate_method_vblank:
+	case dml2_pstate_method_fw_vblank_drr:
 		/* legacy vblank */
 		base_programming->type = FAMS2_STREAM_TYPE_VBLANK;
 		base_programming->allow_start_otg_vline =
-				(uint16_t)stream_fams2_meta->method_vblank.common.allow_start_otg_vline;
+			(uint16_t)stream_fams2_meta->method_vblank.common.allow_start_otg_vline;
 		base_programming->allow_end_otg_vline =
-				(uint16_t)stream_fams2_meta->method_vblank.common.allow_end_otg_vline;
+			(uint16_t)stream_fams2_meta->method_vblank.common.allow_end_otg_vline;
 		base_programming->config.bits.clamp_vtotal_min = true;
 		break;
-	case dml2_uclk_pstate_support_method_fw_drr:
+	case dml2_pstate_method_fw_drr:
 		/* drr */
 		base_programming->type = FAMS2_STREAM_TYPE_DRR;
 		sub_programming->drr.programming_delay_otg_vlines =
-				(uint8_t)stream_fams2_meta->method_drr.programming_delay_otg_vlines;
+			(uint8_t)stream_fams2_meta->method_drr.programming_delay_otg_vlines;
 		sub_programming->drr.nom_stretched_vtotal =
-				(uint16_t)stream_fams2_meta->method_drr.stretched_vtotal;
+			(uint16_t)stream_fams2_meta->method_drr.stretched_vtotal;
 		base_programming->allow_start_otg_vline =
-				(uint16_t)stream_fams2_meta->method_drr.common.allow_start_otg_vline;
+			(uint16_t)stream_fams2_meta->method_drr.common.allow_start_otg_vline;
 		base_programming->allow_end_otg_vline =
-				(uint16_t)stream_fams2_meta->method_drr.common.allow_end_otg_vline;
+			(uint16_t)stream_fams2_meta->method_drr.common.allow_end_otg_vline;
 		/* drr only clamps to vtotal min for single display */
 		base_programming->config.bits.clamp_vtotal_min = display_cfg->display_config.num_streams == 1;
 		sub_programming->drr.only_stretch_if_required = true;
 		break;
-	case dml2_uclk_pstate_support_method_fw_subvp_phantom:
-	case dml2_uclk_pstate_support_method_fw_subvp_phantom_drr:
+	case dml2_pstate_method_fw_svp:
+	case dml2_pstate_method_fw_svp_drr:
 		/* subvp */
 		base_programming->type = FAMS2_STREAM_TYPE_SUBVP;
 		sub_programming->subvp.vratio_numerator =
-				(uint16_t)(plane_descriptor->composition.scaler_info.plane0.v_ratio * 1000.0);
+			(uint16_t)(plane_descriptor->composition.scaler_info.plane0.v_ratio * 1000.0);
 		sub_programming->subvp.vratio_denominator = 1000;
 		sub_programming->subvp.programming_delay_otg_vlines =
-				(uint8_t)stream_fams2_meta->method_subvp.programming_delay_otg_vlines;
+			(uint8_t)stream_fams2_meta->method_subvp.programming_delay_otg_vlines;
 		sub_programming->subvp.prefetch_to_mall_otg_vlines =
-				(uint8_t)stream_fams2_meta->method_subvp.prefetch_to_mall_delay_otg_vlines;
+			(uint8_t)stream_fams2_meta->method_subvp.prefetch_to_mall_delay_otg_vlines;
 		sub_programming->subvp.phantom_vtotal =
-				(uint16_t)stream_fams2_meta->method_subvp.phantom_vtotal;
+			(uint16_t)stream_fams2_meta->method_subvp.phantom_vtotal;
 		sub_programming->subvp.phantom_vactive =
-				(uint16_t)stream_fams2_meta->method_subvp.phantom_vactive;
+			(uint16_t)stream_fams2_meta->method_subvp.phantom_vactive;
 		sub_programming->subvp.config.bits.is_multi_planar =
-				plane_descriptor->surface.plane1.height > 0;
+			plane_descriptor->surface.plane1.height > 0;
 		sub_programming->subvp.config.bits.is_yuv420 =
-				plane_descriptor->pixel_format == dml2_420_8 ||
-				plane_descriptor->pixel_format == dml2_420_10 ||
-				plane_descriptor->pixel_format == dml2_420_12;
+			plane_descriptor->pixel_format == dml2_420_8 ||
+			plane_descriptor->pixel_format == dml2_420_10 ||
+			plane_descriptor->pixel_format == dml2_420_12;
 
 		base_programming->allow_start_otg_vline =
-				(uint16_t)stream_fams2_meta->method_subvp.common.allow_start_otg_vline;
+			(uint16_t)stream_fams2_meta->method_subvp.common.allow_start_otg_vline;
 		base_programming->allow_end_otg_vline =
-				(uint16_t)stream_fams2_meta->method_subvp.common.allow_end_otg_vline;
+			(uint16_t)stream_fams2_meta->method_subvp.common.allow_end_otg_vline;
 		base_programming->config.bits.clamp_vtotal_min = true;
 		break;
-	case dml2_uclk_pstate_support_method_reserved_hw:
-	case dml2_uclk_pstate_support_method_reserved_fw:
-	case dml2_uclk_pstate_support_method_reserved_fw_drr_fixed:
-	case dml2_uclk_pstate_support_method_reserved_fw_drr_var:
-	case dml2_uclk_pstate_support_method_not_supported:
-	case dml2_uclk_pstate_support_method_count:
+	case dml2_pstate_method_reserved_hw:
+	case dml2_pstate_method_reserved_fw:
+	case dml2_pstate_method_reserved_fw_drr_clamped:
+	case dml2_pstate_method_reserved_fw_drr_var:
+	case dml2_pstate_method_na:
+	case dml2_pstate_method_count:
 	default:
 		/* this should never happen */
 		break;
@@ -12584,6 +12921,8 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 	out->informative.mode_support_info.InvalidCombinationOfMALLUseForPState = mode_lib->ms.support.InvalidCombinationOfMALLUseForPState;
 	out->informative.mode_support_info.ExceededMALLSize = mode_lib->ms.support.ExceededMALLSize;
 	out->informative.mode_support_info.EnoughWritebackUnits = mode_lib->ms.support.EnoughWritebackUnits;
+	out->informative.mode_support_info.temp_read_or_ppt_support = mode_lib->ms.support.temp_read_or_ppt_support;
+	out->informative.mode_support_info.g6_temp_read_support = mode_lib->ms.support.g6_temp_read_support;
 
 	out->informative.mode_support_info.ExceededMultistreamSlots = mode_lib->ms.support.ExceededMultistreamSlots;
 	out->informative.mode_support_info.NotEnoughDSCUnits = mode_lib->ms.support.NotEnoughDSCUnits;
@@ -12677,7 +13016,7 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 	out->informative.watermarks.pstate_change_us = dml_get_wm_dram_clock_change(mode_lib);
 	out->informative.watermarks.fclk_pstate_change_us = dml_get_wm_fclk_change(mode_lib);
 	out->informative.watermarks.usr_retraining_us = dml_get_wm_usr_retraining(mode_lib);
-	out->informative.watermarks.g6_temp_read_watermark_us = dml_get_wm_g6_temp_read(mode_lib);
+	out->informative.watermarks.temp_read_or_ppt_watermark_us = dml_get_wm_temp_read_or_ppt(mode_lib);
 
 	out->informative.mall.total_surface_size_in_mall_bytes = 0;
 	for (k = 0; k < out->display_config.num_planes; ++k)
@@ -12760,6 +13099,8 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 
 	out->informative.qos.max_active_fclk_change_latency_supported = dml_get_fclk_change_latency(mode_lib);
 
+	out->informative.misc.LowestPrefetchMargin = 10 * 1000 * 1000;
+
 	for (k = 0; k < out->display_config.num_planes; k++) {
 
 		if ((out->display_config.plane_descriptors->overrides.reserved_vblank_time_ns >= 1000.0 * mode_lib->soc.power_management_parameters.dram_clk_change_blackout_us)
@@ -12839,6 +13180,7 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 		out->informative.misc.DisplayPipeLineDeliveryTimeLumaPrefetch[k] = mode_lib->mp.DisplayPipeLineDeliveryTimeLumaPrefetch[k];
 		out->informative.misc.DisplayPipeLineDeliveryTimeChromaPrefetch[k] = mode_lib->mp.DisplayPipeLineDeliveryTimeChromaPrefetch[k];
 
+		out->informative.misc.WritebackRequiredBandwidth = mode_lib->scratch.dml_core_mode_programming_locals.TotalWRBandwidth / 1000.0;
 		out->informative.misc.WritebackAllowDRAMClockChangeEndPosition[k] = mode_lib->mp.WritebackAllowDRAMClockChangeEndPosition[k];
 		out->informative.misc.WritebackAllowFCLKChangeEndPosition[k] = mode_lib->mp.WritebackAllowFCLKChangeEndPosition[k];
 		out->informative.misc.DSCCLK_calculated[k] = mode_lib->mp.DSCCLK[k];
@@ -12846,6 +13188,9 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 		out->informative.misc.PTE_BUFFER_MODE[k] = mode_lib->mp.PTE_BUFFER_MODE[k];
 		out->informative.misc.DSCDelay[k] = mode_lib->mp.DSCDelay[k];
 		out->informative.misc.MaxActiveDRAMClockChangeLatencySupported[k] = mode_lib->mp.MaxActiveDRAMClockChangeLatencySupported[k];
+
+		if (mode_lib->mp.impacted_prefetch_margin_us[k] < out->informative.misc.LowestPrefetchMargin)
+			out->informative.misc.LowestPrefetchMargin = mode_lib->mp.impacted_prefetch_margin_us[k];
 	}
 
 	// For this DV informative layer, all pipes in the same planes will just use the same id
@@ -12868,16 +13213,11 @@ void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mod
 			out->informative.non_optimized_mcache_allocation[k].global_mcache_ids_plane1[n] = k;
 		}
 	}
-
-	out->informative.qos.max_non_urgent_latency_us = mode_lib->soc.qos_parameters.qos_params.dcn4x.per_uclk_dpm_params[mode_lib->mp.qos_param_index].maximum_latency_when_non_urgent_uclk_cycles
-		/ mode_lib->mp.uclk_freq_mhz * (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.umc_max_latency_margin / 100.0)
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.mall_overhead_fclk_cycles / mode_lib->mp.FabricClock
-		+ mode_lib->soc.qos_parameters.qos_params.dcn4x.max_round_trip_to_furthest_cs_fclk_cycles / mode_lib->mp.FabricClock
-		* (1 + mode_lib->soc.qos_parameters.qos_params.dcn4x.fabric_max_transport_latency_margin / 100.0);
+	out->informative.qos.max_non_urgent_latency_us = dml_get_max_non_urgent_latency_us(mode_lib);
 
 	if (mode_lib->soc.qos_parameters.qos_type == dml2_qos_param_type_dcn4x) {
 		if (((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kbytes) * 1024
-			/ mode_lib->mp.non_urg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= out->informative.qos.max_non_urgent_latency_us) {
+			/ mode_lib->ms.support.non_urg_bandwidth_required[dml2_core_internal_soc_state_sys_active][dml2_core_internal_bw_sdp]) >= out->informative.qos.max_non_urgent_latency_us) {
 			out->informative.misc.ROBUrgencyAvoidance = true;
 		} else {
 			out->informative.misc.ROBUrgencyAvoidance = false;
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h
index d4c40b8c3752..27ef0e096b25 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.h
@@ -28,7 +28,7 @@ void dml2_core_calcs_get_plane_support_info(const struct dml2_display_cfg *displ
 void dml2_core_calcs_get_informative(const struct dml2_core_internal_display_mode_lib *mode_lib, struct dml2_display_cfg_programming *out);
 void dml2_core_calcs_get_stream_support_info(const struct dml2_display_cfg *display_cfg, const struct dml2_core_internal_display_mode_lib *mode_lib, struct core_stream_support_info *out, int plane_index);
 void dml2_core_calcs_get_mall_allocation(struct dml2_core_internal_display_mode_lib *mode_lib, unsigned int *out, int pipe_index);
-void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, const struct display_configuation_with_meta *display_cfg, union dmub_cmd_fams2_config *fams2_base_programming, union dmub_cmd_fams2_config *fams2_sub_programming, enum dml2_uclk_pstate_support_method pstate_method, int plane_index);
+void dml2_core_calcs_get_stream_fams2_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, const struct display_configuation_with_meta *display_cfg, union dmub_cmd_fams2_config *fams2_base_programming, union dmub_cmd_fams2_config *fams2_sub_programming, enum dml2_pstate_method pstate_method, int plane_index);
 void dml2_core_calcs_get_global_fams2_programming(const struct dml2_core_internal_display_mode_lib *mode_lib, const struct display_configuation_with_meta *display_cfg, struct dmub_cmd_fams2_global_config *fams2_global_config);
 
 void dml2_core_calcs_get_dpte_row_height(unsigned int *dpte_row_height, struct dml2_core_internal_display_mode_lib *mode_lib, bool is_plane1, enum dml2_source_format_class SourcePixelFormat, enum dml2_swizzle_mode SurfaceTiling, enum dml2_rotation_angle ScanDirection, unsigned int pitch, unsigned int GPUVMMinPageSizeKBytes);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
index cbdfbd5a0bde..4f54e54102ef 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared_types.h
@@ -201,7 +201,7 @@ struct dml2_core_internal_watermarks {
 	double Z8StutterExitWatermark;
 	double Z8StutterEnterPlusExitWatermark;
 	double USRRetrainingWatermark;
-	double g6_temp_read_watermark_us;
+	double temp_read_or_ppt_watermark_us;
 };
 
 struct dml2_core_internal_mode_support_info {
@@ -252,8 +252,8 @@ struct dml2_core_internal_mode_support_info {
 
 	bool PTEBufferSizeNotExceeded;
 	bool DCCMetaBufferSizeNotExceeded;
-	enum dml2_dram_clock_change_support DRAMClockChangeSupport[DML2_MAX_PLANES];
-	enum dml2_fclock_change_support FCLKChangeSupport[DML2_MAX_PLANES];
+	enum dml2_pstate_change_support DRAMClockChangeSupport[DML2_MAX_PLANES];
+	enum dml2_pstate_change_support FCLKChangeSupport[DML2_MAX_PLANES];
 	bool global_dram_clock_change_supported;
 	bool global_fclk_change_supported;
 	bool USRRetrainingSupport;
@@ -318,12 +318,15 @@ struct dml2_core_internal_mode_support_info {
 	bool avg_bandwidth_support_ok[dml2_core_internal_soc_state_max][dml2_core_internal_bw_max];
 
 	double max_urgent_latency_us;
+	double max_non_urgent_latency_us;
 	double avg_non_urgent_latency_us;
 	double avg_urgent_latency_us;
+	double df_response_time_us;
 
 	bool incorrect_imall_usage;
 
 	bool g6_temp_read_support;
+	bool temp_read_or_ppt_support;
 
 	struct dml2_core_internal_watermarks watermarks;
 };
@@ -378,8 +381,8 @@ struct dml2_core_internal_mode_support {
 	unsigned int DETBufferSizeC[DML2_MAX_PLANES];
 	unsigned int SwathHeightY[DML2_MAX_PLANES];
 	unsigned int SwathHeightC[DML2_MAX_PLANES];
-	unsigned int SwathWidthY[DML2_MAX_PLANES];
-	unsigned int SwathWidthC[DML2_MAX_PLANES];
+	unsigned int SwathWidthY[DML2_MAX_PLANES]; // per-pipe
+	unsigned int SwathWidthC[DML2_MAX_PLANES]; // per-pipe
 
 	// ----------------------------------
 	// Intermediates/Informational
@@ -476,9 +479,9 @@ struct dml2_core_internal_mode_support {
 
 	// Bandwidth Related Info
 	double BandwidthAvailableForImmediateFlip;
-	double SurfaceReadBandwidthLuma[DML2_MAX_PLANES]; // no dcc overhead, for the plane
-	double SurfaceReadBandwidthChroma[DML2_MAX_PLANES];
-	double WriteBandwidth[DML2_MAX_PLANES];
+	double vactive_sw_bw_l[DML2_MAX_PLANES]; // no dcc overhead, for the plane
+	double vactive_sw_bw_c[DML2_MAX_PLANES];
+	double WriteBandwidth[DML2_MAX_PLANES][DML2_MAX_WRITEBACK];
 	double RequiredPrefetchPixelDataBWLuma[DML2_MAX_PLANES];
 	double RequiredPrefetchPixelDataBWChroma[DML2_MAX_PLANES];
 	double cursor_bw[DML2_MAX_PLANES];
@@ -539,7 +542,7 @@ struct dml2_core_internal_mode_program {
 	unsigned int qos_param_index; // to access the uclk dependent dpm table
 	unsigned int active_min_uclk_dpm_index; // to access the min_clk table
 	double FabricClock; /// <brief Basically just the clock freq at the min (or given) state
-	double DCFCLK; /// <brief Basically just the clock freq at the min (or given) state and max combine setting
+	//double DCFCLK; /// <brief Basically just the clock freq at the min (or given) state and max combine setting
 	double dram_bw_mbps;
 	double uclk_freq_mhz;
 	unsigned int NoOfDPP[DML2_MAX_PLANES];
@@ -562,14 +565,14 @@ struct dml2_core_internal_mode_program {
 	double BytePerPixelInDETC[DML2_MAX_PLANES];
 	unsigned int BytePerPixelY[DML2_MAX_PLANES];
 	unsigned int BytePerPixelC[DML2_MAX_PLANES];
-	unsigned int SwathWidthY[DML2_MAX_PLANES];
-	unsigned int SwathWidthC[DML2_MAX_PLANES];
+	unsigned int SwathWidthY[DML2_MAX_PLANES]; // per-pipe
+	unsigned int SwathWidthC[DML2_MAX_PLANES]; // per-pipe
 	unsigned int req_per_swath_ub_l[DML2_MAX_PLANES];
 	unsigned int req_per_swath_ub_c[DML2_MAX_PLANES];
 	unsigned int SwathWidthSingleDPPY[DML2_MAX_PLANES];
 	unsigned int SwathWidthSingleDPPC[DML2_MAX_PLANES];
-	double SurfaceReadBandwidthLuma[DML2_MAX_PLANES];
-	double SurfaceReadBandwidthChroma[DML2_MAX_PLANES];
+	double vactive_sw_bw_l[DML2_MAX_PLANES];
+	double vactive_sw_bw_c[DML2_MAX_PLANES];
 	double excess_vactive_fill_bw_l[DML2_MAX_PLANES];
 	double excess_vactive_fill_bw_c[DML2_MAX_PLANES];
 
@@ -797,8 +800,9 @@ struct dml2_core_internal_mode_program {
 	double MaxActiveFCLKChangeLatencySupported;
 	bool USRRetrainingSupport;
 	bool g6_temp_read_support;
-	enum dml2_fclock_change_support FCLKChangeSupport[DML2_MAX_PLANES];
-	enum dml2_dram_clock_change_support DRAMClockChangeSupport[DML2_MAX_PLANES];
+	bool temp_read_or_ppt_support;
+	enum dml2_pstate_change_support FCLKChangeSupport[DML2_MAX_PLANES];
+	enum dml2_pstate_change_support DRAMClockChangeSupport[DML2_MAX_PLANES];
 	bool global_dram_clock_change_supported;
 	bool global_fclk_change_supported;
 	double MaxActiveDRAMClockChangeLatencySupported[DML2_MAX_PLANES];
@@ -846,6 +850,8 @@ struct dml2_core_internal_mode_program {
 	bool mall_comb_mcache_l[DML2_MAX_PLANES];
 	bool mall_comb_mcache_c[DML2_MAX_PLANES];
 	bool lc_comb_mcache[DML2_MAX_PLANES];
+
+	double impacted_prefetch_margin_us[DML2_MAX_PLANES];
 };
 
 struct dml2_core_internal_SOCParametersList {
@@ -862,6 +868,7 @@ struct dml2_core_internal_SOCParametersList {
 	double USRRetrainingLatency;
 	double SMNLatency;
 	double g6_temp_read_blackout_us;
+	double temp_read_or_ppt_blackout_us;
 	double max_urgent_latency_us;
 	double df_response_time_us;
 	enum dml2_qos_param_type qos_type;
@@ -961,6 +968,17 @@ struct dml2_core_calcs_mode_support_locals {
 
 	unsigned int pstate_bytes_required_l[DML2_MAX_PLANES];
 	unsigned int pstate_bytes_required_c[DML2_MAX_PLANES];
+
+	double prefetch_sw_bytes[DML2_MAX_PLANES];
+	double Tpre_rounded[DML2_MAX_PLANES];
+	double Tpre_oto[DML2_MAX_PLANES];
+	bool recalc_prefetch_schedule;
+	bool recalc_prefetch_done;
+	double impacted_dst_y_pre[DML2_MAX_PLANES];
+	double line_times[DML2_MAX_PLANES];
+	enum dml2_source_format_class pixel_format[DML2_MAX_PLANES];
+	unsigned int lb_source_lines_l[DML2_MAX_PLANES];
+	unsigned int lb_source_lines_c[DML2_MAX_PLANES];
 };
 
 struct dml2_core_calcs_mode_programming_locals {
@@ -1041,6 +1059,16 @@ struct dml2_core_calcs_mode_programming_locals {
 
 	unsigned int pstate_bytes_required_l[DML2_MAX_PLANES];
 	unsigned int pstate_bytes_required_c[DML2_MAX_PLANES];
+
+	double prefetch_sw_bytes[DML2_MAX_PLANES];
+	double Tpre_rounded[DML2_MAX_PLANES];
+	double Tpre_oto[DML2_MAX_PLANES];
+	bool recalc_prefetch_schedule;
+	double impacted_dst_y_pre[DML2_MAX_PLANES];
+	double line_times[DML2_MAX_PLANES];
+	enum dml2_source_format_class pixel_format[DML2_MAX_PLANES];
+	unsigned int lb_source_lines_l[DML2_MAX_PLANES];
+	unsigned int lb_source_lines_c[DML2_MAX_PLANES];
 };
 
 struct dml2_core_calcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_locals {
@@ -1048,6 +1076,7 @@ struct dml2_core_calcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_local
 	double ActiveFCLKChangeLatencyMargin[DML2_MAX_PLANES];
 	double USRRetrainingLatencyMargin[DML2_MAX_PLANES];
 	double g6_temp_read_latency_margin[DML2_MAX_PLANES];
+	double temp_read_or_ppt_latency_margin[DML2_MAX_PLANES];
 
 	double EffectiveLBLatencyHidingY;
 	double EffectiveLBLatencyHidingC;
@@ -1185,17 +1214,14 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_locals {
 	double LineTime;
 	double dst_y_prefetch_equ;
 	double prefetch_bw_oto;
+	double per_pipe_vactive_sw_bw;
 	double Tvm_oto;
 	double Tr0_oto;
-	double Tvm_no_trip_oto;
-	double Tr0_no_trip_oto;
 	double Tvm_oto_lines;
 	double Tr0_oto_lines;
 	double dst_y_prefetch_oto;
 	double TimeForFetchingVM;
 	double TimeForFetchingRowInVBlank;
-	double dst_y_per_vm_no_trip_vblank;
-	double dst_y_per_row_no_trip_vblank;
 	double LinesToRequestPrefetchPixelData;
 	unsigned int HostVMDynamicLevelsTrips;
 	double trip_to_mem;
@@ -1203,15 +1229,12 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_locals {
 	double Tr0_trips_rounded;
 	double max_Tsw;
 	double Lsw_oto;
-	double Lsw_equ;
-	double Tpre_rounded;
 	double prefetch_bw_equ;
 	double Tvm_equ;
 	double Tr0_equ;
 	double Tdmbf;
 	double Tdmec;
 	double Tdmsks;
-	double prefetch_sw_bytes;
 	double total_row_bytes;
 	double prefetch_bw_pr;
 	double bytes_pp;
@@ -1225,6 +1248,7 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_locals {
 	double prefetch_bw2;
 	double prefetch_bw3;
 	double prefetch_bw4;
+	double dst_y_prefetch_equ_impacted;
 
 	double TWait_p;
 	unsigned int cursor_prefetch_bytes;
@@ -1545,17 +1569,18 @@ struct dml2_core_calcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_param
 
 	// Output
 	struct dml2_core_internal_watermarks *Watermark;
-	enum dml2_dram_clock_change_support *DRAMClockChangeSupport;
+	enum dml2_pstate_change_support *DRAMClockChangeSupport;
 	bool *global_dram_clock_change_supported;
 	double *MaxActiveDRAMClockChangeLatencySupported;
 	unsigned int *SubViewportLinesNeededInMALL;
-	enum dml2_fclock_change_support *FCLKChangeSupport;
+	enum dml2_pstate_change_support *FCLKChangeSupport;
 	bool *global_fclk_change_supported;
 	double *MaxActiveFCLKChangeLatencySupported;
 	bool *USRRetrainingSupport;
 	double *VActiveLatencyHidingMargin;
 	double *VActiveLatencyHidingUs;
 	bool *g6_temp_read_support;
+	bool *temp_read_or_ppt_support;
 };
 
 
@@ -1727,8 +1752,8 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_params {
 	double PrefetchSourceLinesC;
 	unsigned int VInitPreFillC;
 	unsigned int MaxNumSwathC;
-	unsigned int swath_width_luma_ub;
-	unsigned int swath_width_chroma_ub;
+	unsigned int swath_width_luma_ub;  // per-pipe
+	unsigned int swath_width_chroma_ub; // per-pipe
 	unsigned int SwathHeightY;
 	unsigned int SwathHeightC;
 	double TWait;
@@ -1750,6 +1775,10 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_params {
 	unsigned int meta_row_bytes;
 	double mall_prefetch_sdp_overhead_factor;
 
+	double impacted_dst_y_pre;
+	double vactive_sw_bw_l; // per surface bw
+	double vactive_sw_bw_c; // per surface bw
+
 	// output
 	unsigned int *DSTXAfterScaler;
 	unsigned int *DSTYAfterScaler;
@@ -1767,6 +1796,8 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_params {
 	double *Tdmdl_vm;
 	double *Tdmdl;
 	double *TSetup;
+	double *Tpre_rounded;
+	double *Tpre_oto;
 	double *Tvm_trips;
 	double *Tr0_trips;
 	double *Tvm_trips_flip;
@@ -1777,6 +1808,47 @@ struct dml2_core_calcs_CalculatePrefetchSchedule_params {
 	unsigned int *VUpdateWidthPix;
 	unsigned int *VReadyOffsetPix;
 	double *prefetch_cursor_bw;
+	double *prefetch_sw_bytes;
+};
+
+struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_params {
+	unsigned int num_active_planes;
+	enum dml2_source_format_class *pixel_format;
+	unsigned int rob_buffer_size_kbytes;
+	unsigned int compressed_buffer_size_kbytes;
+	unsigned int chunk_bytes_l; // same for all planes
+	unsigned int chunk_bytes_c;
+	unsigned int *detile_buffer_size_bytes_l;
+	unsigned int *detile_buffer_size_bytes_c;
+	unsigned int *full_swath_bytes_l;
+	unsigned int *full_swath_bytes_c;
+	unsigned int *lb_source_lines_l;
+	unsigned int *lb_source_lines_c;
+	unsigned int *swath_height_l;
+	unsigned int *swath_height_c;
+	double *prefetch_sw_bytes;
+	double *Tpre_rounded;
+	double *Tpre_oto;
+	double estimated_dcfclk_mhz;
+	double estimated_urg_bandwidth_required_mbps;
+	double *line_time;
+	double *dst_y_prefetch;
+
+	// output
+	bool *recalc_prefetch_schedule;
+	double *impacted_dst_y_pre;
+};
+
+struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_locals {
+	unsigned int max_Trpd_dcfclk_cycles;
+	unsigned int burst_bytes_to_fill_det;
+	double time_to_fill_det_us;
+	unsigned int accumulated_return_path_dcfclk_cycles[DML2_MAX_PLANES];
+	bool prefetch_global_check_passed;
+	unsigned int src_swath_bytes_l[DML2_MAX_PLANES];
+	unsigned int src_swath_bytes_c[DML2_MAX_PLANES];
+	unsigned int src_detile_buf_size_bytes_l[DML2_MAX_PLANES];
+	unsigned int src_detile_buf_size_bytes_c[DML2_MAX_PLANES];
 };
 
 struct dml2_core_calcs_calculate_mcache_row_bytes_params {
@@ -2004,6 +2076,7 @@ struct dml2_core_internal_scratch {
 	struct dml2_core_calcs_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_locals CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_locals;
 	struct dml2_core_calcs_CalculateVMRowAndSwath_locals CalculateVMRowAndSwath_locals;
 	struct dml2_core_calcs_CalculatePrefetchSchedule_locals CalculatePrefetchSchedule_locals;
+	struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_locals CheckGlobalPrefetchAdmissibility_locals;
 	struct dml2_core_shared_CalculateSwathAndDETConfiguration_locals CalculateSwathAndDETConfiguration_locals;
 	struct dml2_core_shared_TruncToValidBPP_locals TruncToValidBPP_locals;
 	struct dml2_core_shared_CalculateDETBufferSize_locals CalculateDETBufferSize_locals;
@@ -2019,6 +2092,7 @@ struct dml2_core_internal_scratch {
 	struct dml2_core_calcs_CalculateSwathAndDETConfiguration_params CalculateSwathAndDETConfiguration_params;
 	struct dml2_core_calcs_CalculateStutterEfficiency_params CalculateStutterEfficiency_params;
 	struct dml2_core_calcs_CalculatePrefetchSchedule_params CalculatePrefetchSchedule_params;
+	struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_params CheckGlobalPrefetchAdmissibility_params;
 	struct dml2_core_calcs_calculate_mcache_setting_params calculate_mcache_setting_params;
 	struct dml2_core_calcs_calculate_tdlut_setting_params calculate_tdlut_setting_params;
 	struct dml2_core_shared_calculate_vm_and_row_bytes_params calculate_vm_and_row_bytes_params;
@@ -2038,7 +2112,6 @@ struct dml2_core_internal_display_mode_lib {
 	// Used to hold input; intermediate and output of the calculations
 	struct dml2_core_internal_mode_support ms; // struct for mode support
 	struct dml2_core_internal_mode_program mp; // struct for mode programming
-
 	// Available overridable calculators for core_shared.
 	// if null, core_shared will use default calculators.
 	struct dml2_core_shared_calculation_funcs funcs;
@@ -2051,7 +2124,6 @@ struct dml2_core_calcs_mode_support_ex {
 	const struct dml2_display_cfg *in_display_cfg;
 	const struct dml2_mcg_min_clock_table *min_clk_table;
 	int min_clk_index;
-
 	//unsigned int in_state_index;
 	struct dml2_core_internal_mode_support_info *out_evaluation_info;
 };
@@ -2064,7 +2136,6 @@ struct dml2_core_calcs_mode_programming_ex {
 	const struct dml2_mcg_min_clock_table *min_clk_table;
 	const struct core_display_cfg_support_info *cfg_support_info;
 	int min_clk_index;
-
 	struct dml2_display_cfg_programming *programming;
 
 };
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
index 714b5c39b7e6..1548dfc68b8e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
@@ -63,6 +63,150 @@ bool dml2_core_utils_is_420(enum dml2_source_format_class source_format)
 	case dml2_mono_16:
 		val = 0;
 		break;
+	case dml2_422_planar_8:
+		val = 0;
+		break;
+	case dml2_422_planar_10:
+		val = 0;
+		break;
+	case dml2_422_planar_12:
+		val = 0;
+		break;
+	case dml2_422_packed_8:
+		val = 0;
+		break;
+	case dml2_422_packed_10:
+		val = 0;
+		break;
+	case dml2_422_packed_12:
+		val = 0;
+		break;
+	default:
+		DML2_ASSERT(0);
+		break;
+	}
+	return val;
+}
+
+bool dml2_core_utils_is_422_planar(enum dml2_source_format_class source_format)
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
+		val = 0;
+		break;
+	case dml2_420_10:
+		val = 0;
+		break;
+	case dml2_420_12:
+		val = 0;
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
+	case dml2_422_planar_8:
+		val = 1;
+		break;
+	case dml2_422_planar_10:
+		val = 1;
+		break;
+	case dml2_422_planar_12:
+		val = 1;
+		break;
+	case dml2_422_packed_8:
+		val = 0;
+		break;
+	case dml2_422_packed_10:
+		val = 0;
+		break;
+	case dml2_422_packed_12:
+		val = 0;
+		break;
+	default:
+		DML2_ASSERT(0);
+		break;
+	}
+	return val;
+}
+
+bool dml2_core_utils_is_422_packed(enum dml2_source_format_class source_format)
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
+		val = 0;
+		break;
+	case dml2_420_10:
+		val = 0;
+		break;
+	case dml2_420_12:
+		val = 0;
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
+	case dml2_422_planar_8:
+		val = 0;
+		break;
+	case dml2_422_planar_10:
+		val = 0;
+		break;
+	case dml2_422_planar_12:
+		val = 0;
+		break;
+	case dml2_422_packed_8:
+		val = 1;
+		break;
+	case dml2_422_packed_10:
+		val = 1;
+		break;
+	case dml2_422_packed_12:
+		val = 1;
+		break;
 	default:
 		DML2_ASSERT(0);
 		break;
@@ -154,9 +298,9 @@ void dml2_core_utils_print_mode_support_info(const struct dml2_core_internal_mod
 		dml2_printf("DML: support: DynamicMetadataSupported = %d\n", support->DynamicMetadataSupported);
 	if (!fail_only || support->VRatioInPrefetchSupported == 0)
 		dml2_printf("DML: support: VRatioInPrefetchSupported = %d\n", support->VRatioInPrefetchSupported);
-	if (!fail_only || support->PTEBufferSizeNotExceeded == 1)
+	if (!fail_only || support->PTEBufferSizeNotExceeded == 0)
 		dml2_printf("DML: support: PTEBufferSizeNotExceeded = %d\n", support->PTEBufferSizeNotExceeded);
-	if (!fail_only || support->DCCMetaBufferSizeNotExceeded == 1)
+	if (!fail_only || support->DCCMetaBufferSizeNotExceeded == 0)
 		dml2_printf("DML: support: DCCMetaBufferSizeNotExceeded = %d\n", support->DCCMetaBufferSizeNotExceeded);
 	if (!fail_only || support->ExceededMALLSize == 1)
 		dml2_printf("DML: support: ExceededMALLSize = %d\n", support->ExceededMALLSize);
@@ -280,39 +424,49 @@ bool dml2_core_utils_is_phantom_pipe(const struct dml2_plane_parameters *plane_c
 	return is_phantom;
 }
 
-unsigned int dml2_core_utils_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode)
-{
-	switch (sw_mode) {
-	case (dml2_sw_linear):
-		return 256; break;
-	case (dml2_sw_256b_2d):
-		return 256; break;
-	case (dml2_sw_4kb_2d):
-		return 4096; break;
-	case (dml2_sw_64kb_2d):
-		return 65536; break;
-	case (dml2_sw_256kb_2d):
-		return 262144; break;
-	case (dml2_gfx11_sw_linear):
-		return 256; break;
-	case (dml2_gfx11_sw_64kb_d):
-		return 65536; break;
-	case (dml2_gfx11_sw_64kb_d_t):
-		return 65536; break;
-	case (dml2_gfx11_sw_64kb_d_x):
-		return 65536; break;
-	case (dml2_gfx11_sw_64kb_r_x):
-		return 65536; break;
-	case (dml2_gfx11_sw_256kb_d_x):
-		return 262144; break;
-	case (dml2_gfx11_sw_256kb_r_x):
-		return 262144; break;
-	default:
+unsigned int dml2_core_utils_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode, unsigned int byte_per_pixel)
+{
+
+	if (sw_mode == dml2_sw_linear)
+		return 256;
+	else if (sw_mode == dml2_sw_256b_2d)
+		return 256;
+	else if (sw_mode == dml2_sw_4kb_2d)
+		return 4096;
+	else if (sw_mode == dml2_sw_64kb_2d)
+		return 65536;
+	else if (sw_mode == dml2_sw_256kb_2d)
+		return 262144;
+	else if (sw_mode == dml2_gfx11_sw_linear)
+		return 256;
+	else if (sw_mode == dml2_gfx11_sw_64kb_d)
+		return 65536;
+	else if (sw_mode == dml2_gfx11_sw_64kb_d_t)
+		return 65536;
+	else if (sw_mode == dml2_gfx11_sw_64kb_d_x)
+		return 65536;
+	else if (sw_mode == dml2_gfx11_sw_64kb_r_x)
+		return 65536;
+	else if (sw_mode == dml2_gfx11_sw_256kb_d_x)
+		return 262144;
+	else if (sw_mode == dml2_gfx11_sw_256kb_r_x)
+		return 262144;
+	else {
 		DML2_ASSERT(0);
 		return 256;
 	};
 }
 
+bool dml2_core_utils_get_segment_horizontal_contiguous(enum dml2_swizzle_mode sw_mode, unsigned int byte_per_pixel)
+{
+	return (byte_per_pixel != 2);
+}
+
+bool dml2_core_utils_is_linear(enum dml2_swizzle_mode sw_mode)
+{
+	return (sw_mode == dml2_sw_linear || sw_mode == dml2_sw_linear_256b || sw_mode == dml2_linear_64elements);
+};
+
 
 bool dml2_core_utils_is_vertical_rotation(enum dml2_rotation_angle Scan)
 {
@@ -325,7 +479,6 @@ bool dml2_core_utils_is_vertical_rotation(enum dml2_rotation_angle Scan)
 	return is_vert;
 }
 
-
 int unsigned dml2_core_utils_get_gfx_version(enum dml2_swizzle_mode sw_mode)
 {
 	int unsigned version = 0;
@@ -334,17 +487,17 @@ int unsigned dml2_core_utils_get_gfx_version(enum dml2_swizzle_mode sw_mode)
 		sw_mode == dml2_sw_256b_2d ||
 		sw_mode == dml2_sw_4kb_2d ||
 		sw_mode == dml2_sw_64kb_2d ||
-		sw_mode == dml2_sw_256kb_2d) {
+		sw_mode == dml2_sw_256kb_2d)
 		version = 12;
-	} else if (sw_mode == dml2_gfx11_sw_linear ||
+	else if (sw_mode == dml2_gfx11_sw_linear ||
 		sw_mode == dml2_gfx11_sw_64kb_d ||
 		sw_mode == dml2_gfx11_sw_64kb_d_t ||
 		sw_mode == dml2_gfx11_sw_64kb_d_x ||
 		sw_mode == dml2_gfx11_sw_64kb_r_x ||
 		sw_mode == dml2_gfx11_sw_256kb_d_x ||
-		sw_mode == dml2_gfx11_sw_256kb_r_x) {
+		sw_mode == dml2_gfx11_sw_256kb_r_x)
 		version = 11;
-	} else {
+	else {
 		dml2_printf("ERROR: Invalid sw_mode setting! val=%u\n", sw_mode);
 		DML2_ASSERT(0);
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h
index a5cc6a07167a..95f0d017add4 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h
@@ -11,6 +11,8 @@
 double dml2_core_utils_div_rem(double dividend, unsigned int divisor, unsigned int *remainder);
 const char *dml2_core_utils_internal_bw_type_str(enum dml2_core_internal_bw_type bw_type);
 bool dml2_core_utils_is_420(enum dml2_source_format_class source_format);
+bool dml2_core_utils_is_422_planar(enum dml2_source_format_class source_format);
+bool dml2_core_utils_is_422_packed(enum dml2_source_format_class source_format);
 void dml2_core_utils_print_mode_support_info(const struct dml2_core_internal_mode_support_info *support, bool fail_only);
 const char *dml2_core_utils_internal_soc_state_type_str(enum dml2_core_internal_soc_state_type dml2_core_internal_soc_state_type);
 void dml2_core_utils_get_stream_output_bpp(double *out_bpp, const struct dml2_display_cfg *display_cfg);
@@ -18,8 +20,10 @@ unsigned int dml2_core_utils_round_to_multiple(unsigned int num, unsigned int mu
 unsigned int dml2_core_util_get_num_active_pipes(int unsigned num_planes, const struct core_display_cfg_support_info *cfg_support_info);
 void dml2_core_utils_pipe_plane_mapping(const struct core_display_cfg_support_info *cfg_support_info, unsigned int *pipe_plane);
 bool dml2_core_utils_is_phantom_pipe(const struct dml2_plane_parameters *plane_cfg);
-unsigned int dml2_core_utils_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode);
+unsigned int dml2_core_utils_get_tile_block_size_bytes(enum dml2_swizzle_mode sw_mode, unsigned int byte_per_pixel);
+bool dml2_core_utils_get_segment_horizontal_contiguous(enum dml2_swizzle_mode sw_mode, unsigned int byte_per_pixel);
 bool dml2_core_utils_is_vertical_rotation(enum dml2_rotation_angle Scan);
+bool dml2_core_utils_is_linear(enum dml2_swizzle_mode sw_mode);
 int unsigned dml2_core_utils_get_gfx_version(enum dml2_swizzle_mode sw_mode);
 unsigned int dml2_core_utils_get_qos_param_index(unsigned long uclk_freq_khz, const struct dml2_dcn4_uclk_dpm_dependent_qos_params *per_uclk_dpm_params);
 unsigned int dml2_core_utils_get_active_min_uclk_dpm_index(unsigned long uclk_freq_khz, const struct dml2_soc_state_table *clk_table);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
index 8869ea089312..009026950b6c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c
@@ -180,7 +180,7 @@ static bool add_margin_and_round_to_dfs_grainularity(double clock_khz, double ma
 
 	clock_khz *= 1.0 + margin;
 
-	divider = (unsigned int)((int)DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
+	divider = (unsigned int)(DFS_DIVIDER_RANGE_SCALE_FACTOR * (vco_freq_khz / clock_khz));
 
 	/* we want to floor here to get higher clock than required rather than lower */
 	if (divider < DFS_DIVIDER_RANGE_2_START) {
@@ -711,7 +711,7 @@ bool dpmm_dcn4_map_watermarks(struct dml2_dpmm_map_watermarks_params_in_out *in_
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].fclk_pstate = (int unsigned)(mode_lib->mp.Watermark.FCLKChangeWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].sr_enter = (int unsigned)(mode_lib->mp.Watermark.StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].sr_exit = (int unsigned)(mode_lib->mp.Watermark.StutterExitWatermark * refclk_freq_in_mhz);
-	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.g6_temp_read_watermark_us * refclk_freq_in_mhz);
+	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.temp_read_or_ppt_watermark_us * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].uclk_pstate = (int unsigned)(mode_lib->mp.Watermark.DRAMClockChangeWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].urgent = (int unsigned)(mode_lib->mp.Watermark.UrgentWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_A].usr = (int unsigned)(mode_lib->mp.Watermark.USRRetrainingWatermark * refclk_freq_in_mhz);
@@ -725,7 +725,7 @@ bool dpmm_dcn4_map_watermarks(struct dml2_dpmm_map_watermarks_params_in_out *in_
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].fclk_pstate = (int unsigned)(mode_lib->mp.Watermark.FCLKChangeWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].sr_enter = (int unsigned)(mode_lib->mp.Watermark.StutterEnterPlusExitWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].sr_exit = (int unsigned)(mode_lib->mp.Watermark.StutterExitWatermark * refclk_freq_in_mhz);
-	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.g6_temp_read_watermark_us * refclk_freq_in_mhz);
+	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].temp_read_or_ppt = (int unsigned)(mode_lib->mp.Watermark.temp_read_or_ppt_watermark_us * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].uclk_pstate = (int unsigned)(mode_lib->mp.Watermark.DRAMClockChangeWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].urgent = (int unsigned)(mode_lib->mp.Watermark.UrgentWatermark * refclk_freq_in_mhz);
 	dchubbub_regs->wm_regs[DML2_DCHUB_WATERMARK_SET_B].usr = (int unsigned)(mode_lib->mp.Watermark.USRRetrainingWatermark * refclk_freq_in_mhz);
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
index 92269f0e50ed..1efbc0329f85 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c
@@ -13,32 +13,32 @@ static const double MIN_BLANK_STUTTER_FACTOR = 3.0;
 static const struct dml2_pmo_pstate_strategy base_strategy_list_1_display[] = {
 	// VActive Preferred
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vactive, dml2_pstate_method_na, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// Then SVP
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_fw_svp, dml2_pstate_method_na, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// Then VBlank
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vblank, dml2_pstate_method_na, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = false,
 	},
 
 	// Then DRR
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_fw_drr, dml2_pstate_method_na, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// Finally VBlank, but allow base clocks for latency to increase
 	/*
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vblank, dml2_pstate_method_na, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 	*/
@@ -49,56 +49,56 @@ static const int base_strategy_list_1_display_size = sizeof(base_strategy_list_1
 static const struct dml2_pmo_pstate_strategy base_strategy_list_2_display[] = {
 	// VActive only is preferred
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vactive, dml2_pstate_method_vactive, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// Then VActive + VBlank
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vactive, dml2_pstate_method_vblank, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = false,
 	},
 
 	// Then VBlank only
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = false,
 	},
 
 	// Then SVP + VBlank
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_fw_svp, dml2_pstate_method_vblank, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = false,
 	},
 
 	// Then SVP + DRR
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_fw_svp, dml2_pstate_method_fw_drr, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// Then SVP + SVP
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_fw_svp, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_fw_svp, dml2_pstate_method_fw_svp, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// Then DRR + VActive
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vactive, dml2_pstate_method_fw_drr, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// Then DRR + DRR
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_fw_drr, dml2_pstate_method_fw_drr, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// Finally VBlank, but allow base clocks for latency to increase
 	/*
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_na, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 	*/
@@ -109,32 +109,32 @@ static const int base_strategy_list_2_display_size = sizeof(base_strategy_list_2
 static const struct dml2_pmo_pstate_strategy base_strategy_list_3_display[] = {
 	// All VActive
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vactive, dml2_pstate_method_vactive, dml2_pstate_method_vactive, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// VActive + 1 VBlank
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vactive, dml2_pstate_method_vactive, dml2_pstate_method_vblank, dml2_pstate_method_na },
 		.allow_state_increase = false,
 	},
 
 	// All VBlank
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_na },
 		.allow_state_increase = false,
 	},
 
 	// All DRR
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_fw_drr, dml2_pstate_method_fw_drr, dml2_pstate_method_fw_drr, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 
 	// All VBlank, with state increase allowed
 	/*
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_na },
+		.per_stream_pstate_method = { dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_na },
 		.allow_state_increase = true,
 	},
 	*/
@@ -145,32 +145,32 @@ static const int base_strategy_list_3_display_size = sizeof(base_strategy_list_3
 static const struct dml2_pmo_pstate_strategy base_strategy_list_4_display[] = {
 	// All VActive
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive },
+		.per_stream_pstate_method = { dml2_pstate_method_vactive, dml2_pstate_method_vactive, dml2_pstate_method_vactive, dml2_pstate_method_vactive },
 		.allow_state_increase = true,
 	},
 
 	// VActive + 1 VBlank
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vactive, dml2_pmo_pstate_strategy_vblank },
+		.per_stream_pstate_method = { dml2_pstate_method_vactive, dml2_pstate_method_vactive, dml2_pstate_method_vactive, dml2_pstate_method_vblank },
 		.allow_state_increase = false,
 	},
 
 	// All Vblank
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank },
+		.per_stream_pstate_method = { dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_vblank },
 		.allow_state_increase = false,
 	},
 
 	// All DRR
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr, dml2_pmo_pstate_strategy_fw_drr },
+		.per_stream_pstate_method = { dml2_pstate_method_fw_drr, dml2_pstate_method_fw_drr, dml2_pstate_method_fw_drr, dml2_pstate_method_fw_drr },
 		.allow_state_increase = true,
 	},
 
 	// All VBlank, with state increase allowed
 	/*
 	{
-		.per_stream_pstate_method = { dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank, dml2_pmo_pstate_strategy_vblank },
+		.per_stream_pstate_method = { dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_vblank, dml2_pstate_method_vblank },
 		.allow_state_increase = true,
 	},
 	*/
@@ -355,29 +355,30 @@ bool pmo_dcn4_fams2_optimize_dcc_mcache(struct dml2_pmo_optimize_dcc_mcache_in_o
 	return result;
 }
 
-static enum dml2_pmo_pstate_method convert_strategy_to_drr_variant(const enum dml2_pmo_pstate_method base_strategy)
+static enum dml2_pstate_method convert_strategy_to_drr_variant(const enum dml2_pstate_method base_strategy)
 {
-	enum dml2_pmo_pstate_method variant_strategy = 0;
+	enum dml2_pstate_method variant_strategy = 0;
 
 	switch (base_strategy) {
-	case dml2_pmo_pstate_strategy_vactive:
-		variant_strategy = dml2_pmo_pstate_strategy_fw_vactive_drr;
+	case dml2_pstate_method_vactive:
+		variant_strategy = dml2_pstate_method_fw_vactive_drr;
 		break;
-	case dml2_pmo_pstate_strategy_vblank:
-		variant_strategy = dml2_pmo_pstate_strategy_fw_vblank_drr;
+	case dml2_pstate_method_vblank:
+		variant_strategy = dml2_pstate_method_fw_vblank_drr;
 		break;
-	case dml2_pmo_pstate_strategy_fw_svp:
-		variant_strategy = dml2_pmo_pstate_strategy_fw_svp_drr;
+	case dml2_pstate_method_fw_svp:
+		variant_strategy = dml2_pstate_method_fw_svp_drr;
 		break;
-	case dml2_pmo_pstate_strategy_fw_vactive_drr:
-	case dml2_pmo_pstate_strategy_fw_vblank_drr:
-	case dml2_pmo_pstate_strategy_fw_svp_drr:
-	case dml2_pmo_pstate_strategy_fw_drr:
-	case dml2_pmo_pstate_strategy_reserved_hw:
-	case dml2_pmo_pstate_strategy_reserved_fw:
-	case dml2_pmo_pstate_strategy_reserved_fw_drr_clamped:
-	case dml2_pmo_pstate_strategy_reserved_fw_drr_var:
-	case dml2_pmo_pstate_strategy_na:
+	case dml2_pstate_method_fw_vactive_drr:
+	case dml2_pstate_method_fw_vblank_drr:
+	case dml2_pstate_method_fw_svp_drr:
+	case dml2_pstate_method_fw_drr:
+	case dml2_pstate_method_reserved_hw:
+	case dml2_pstate_method_reserved_fw:
+	case dml2_pstate_method_reserved_fw_drr_clamped:
+	case dml2_pstate_method_reserved_fw_drr_var:
+	case dml2_pstate_method_count:
+	case dml2_pstate_method_na:
 	default:
 		/* no variant for this mode */
 		variant_strategy = base_strategy;
@@ -419,23 +420,22 @@ static unsigned int get_num_expanded_strategies(
 
 static void insert_strategy_into_expanded_list(
 	const struct dml2_pmo_pstate_strategy *per_stream_pstate_strategy,
-	int stream_count,
-	struct dml2_pmo_init_data *init_data)
+	const int stream_count,
+	struct dml2_pmo_pstate_strategy *expanded_strategy_list,
+	unsigned int *num_expanded_strategies)
 {
-	struct dml2_pmo_pstate_strategy *expanded_strategy_list = NULL;
-
-	expanded_strategy_list = get_expanded_strategy_list(init_data, stream_count);
-
-	if (expanded_strategy_list) {
-		memcpy(&expanded_strategy_list[init_data->pmo_dcn4.num_expanded_strategies_per_list[stream_count - 1]], per_stream_pstate_strategy, sizeof(struct dml2_pmo_pstate_strategy));
+	if (expanded_strategy_list && num_expanded_strategies) {
+		memcpy(&expanded_strategy_list[*num_expanded_strategies], per_stream_pstate_strategy, sizeof(struct dml2_pmo_pstate_strategy));
 
-		init_data->pmo_dcn4.num_expanded_strategies_per_list[stream_count - 1]++;
+		(*num_expanded_strategies)++;
 	}
 }
 
-static void expand_base_strategy(struct dml2_pmo_instance *pmo,
+static void expand_base_strategy(
 	const struct dml2_pmo_pstate_strategy *base_strategy,
-	unsigned int stream_count)
+	const unsigned int stream_count,
+	struct dml2_pmo_pstate_strategy *expanded_strategy_list,
+	unsigned int *num_expanded_strategies)
 {
 	bool skip_to_next_stream;
 	bool expanded_strategy_added;
@@ -473,7 +473,7 @@ static void expand_base_strategy(struct dml2_pmo_instance *pmo,
 
 			if (i >= stream_count - 1) {
 				/* insert into strategy list */
-				insert_strategy_into_expanded_list(&cur_strategy_list, stream_count, &pmo->init_data);
+				insert_strategy_into_expanded_list(&cur_strategy_list, stream_count, expanded_strategy_list, num_expanded_strategies);
 				expanded_strategy_added = true;
 			} else {
 				/* skip to next stream */
@@ -512,9 +512,9 @@ static void expand_base_strategy(struct dml2_pmo_instance *pmo,
 
 static bool is_variant_method_valid(const struct dml2_pmo_pstate_strategy *base_strategy,
 		const struct dml2_pmo_pstate_strategy *variant_strategy,
-		unsigned int num_streams_per_base_method[PMO_DCN4_MAX_DISPLAYS],
-		unsigned int num_streams_per_variant_method[PMO_DCN4_MAX_DISPLAYS],
-		unsigned int stream_count)
+		const unsigned int num_streams_per_base_method[PMO_DCN4_MAX_DISPLAYS],
+		const unsigned int num_streams_per_variant_method[PMO_DCN4_MAX_DISPLAYS],
+		const unsigned int stream_count)
 {
 	bool valid = true;
 	unsigned int i;
@@ -522,7 +522,7 @@ static bool is_variant_method_valid(const struct dml2_pmo_pstate_strategy *base_
 	/* check all restrictions are met */
 	for (i = 0; i < stream_count; i++) {
 		/* vblank + vblank_drr variants are invalid */
-		if (base_strategy->per_stream_pstate_method[i] == dml2_pmo_pstate_strategy_vblank &&
+		if (base_strategy->per_stream_pstate_method[i] == dml2_pstate_method_vblank &&
 				((num_streams_per_base_method[i] > 0 && num_streams_per_variant_method[i] > 0) ||
 				num_streams_per_variant_method[i] > 1)) {
 			valid = false;
@@ -533,9 +533,12 @@ static bool is_variant_method_valid(const struct dml2_pmo_pstate_strategy *base_
 	return valid;
 }
 
-static void expand_variant_strategy(struct dml2_pmo_instance *pmo,
+static void expand_variant_strategy(
 		const struct dml2_pmo_pstate_strategy *base_strategy,
-		unsigned int stream_count)
+		const unsigned int stream_count,
+		const bool should_permute,
+		struct dml2_pmo_pstate_strategy *expanded_strategy_list,
+		unsigned int *num_expanded_strategies)
 {
 	bool variant_found;
 	unsigned int i, j;
@@ -544,7 +547,7 @@ static void expand_variant_strategy(struct dml2_pmo_instance *pmo,
 	unsigned int num_streams_per_method[PMO_DCN4_MAX_DISPLAYS] = { 0 };
 	unsigned int num_streams_per_base_method[PMO_DCN4_MAX_DISPLAYS] = { 0 };
 	unsigned int num_streams_per_variant_method[PMO_DCN4_MAX_DISPLAYS] = { 0 };
-	enum dml2_pmo_pstate_method per_stream_variant_method[DML2_MAX_PLANES];
+	enum dml2_pstate_method per_stream_variant_method[DML2_MAX_PLANES];
 	struct dml2_pmo_pstate_strategy variant_strategy = { 0 };
 
 	/* determine number of displays per method */
@@ -585,7 +588,13 @@ static void expand_variant_strategy(struct dml2_pmo_instance *pmo,
 			}
 
 			if (variant_found && is_variant_method_valid(base_strategy, &variant_strategy, num_streams_per_base_method, num_streams_per_variant_method, stream_count)) {
-				expand_base_strategy(pmo, &variant_strategy, stream_count);
+				if (should_permute) {
+					/* permutations are permitted, proceed to expand */
+					expand_base_strategy(&variant_strategy, stream_count, expanded_strategy_list, num_expanded_strategies);
+				} else {
+					/* no permutations allowed, so add to list now */
+					insert_strategy_into_expanded_list(&variant_strategy, stream_count, expanded_strategy_list, num_expanded_strategies);
+				}
 			}
 
 			/* rollback to earliest method with bases remaining */
@@ -612,18 +621,19 @@ static void expand_variant_strategy(struct dml2_pmo_instance *pmo,
 	}
 }
 
-static void expand_base_strategies(
-	struct dml2_pmo_instance *pmo,
-	const struct dml2_pmo_pstate_strategy *base_strategies_list,
-	const unsigned int num_base_strategies,
-	unsigned int stream_count)
+void pmo_dcn4_fams2_expand_base_pstate_strategies(
+		const struct dml2_pmo_pstate_strategy *base_strategies_list,
+		const unsigned int num_base_strategies,
+		const unsigned int stream_count,
+		struct dml2_pmo_pstate_strategy *expanded_strategy_list,
+		unsigned int *num_expanded_strategies)
 {
 	unsigned int i;
 
 	/* expand every explicit base strategy (except all DRR) */
 	for (i = 0; i < num_base_strategies; i++) {
-		expand_base_strategy(pmo, &base_strategies_list[i], stream_count);
-		expand_variant_strategy(pmo, &base_strategies_list[i], stream_count);
+		expand_base_strategy(&base_strategies_list[i], stream_count, expanded_strategy_list, num_expanded_strategies);
+		expand_variant_strategy(&base_strategies_list[i], stream_count, true, expanded_strategy_list, num_expanded_strategies);
 	}
 }
 
@@ -652,25 +662,45 @@ bool pmo_dcn4_fams2_initialize(struct dml2_pmo_initialize_in_out *in_out)
 			DML2_ASSERT(base_strategy_list_1_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
 
 			/* populate list */
-			expand_base_strategies(pmo, base_strategy_list_1_display, base_strategy_list_1_display_size, 1);
+			pmo_dcn4_fams2_expand_base_pstate_strategies(
+					base_strategy_list_1_display,
+					base_strategy_list_1_display_size,
+					i,
+					pmo->init_data.pmo_dcn4.expanded_strategy_list_1_display,
+					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
 			break;
 		case 2:
 			DML2_ASSERT(base_strategy_list_2_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
 
 			/* populate list */
-			expand_base_strategies(pmo, base_strategy_list_2_display, base_strategy_list_2_display_size, 2);
+			pmo_dcn4_fams2_expand_base_pstate_strategies(
+					base_strategy_list_2_display,
+					base_strategy_list_2_display_size,
+					i,
+					pmo->init_data.pmo_dcn4.expanded_strategy_list_2_display,
+					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
 			break;
 		case 3:
 			DML2_ASSERT(base_strategy_list_3_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
 
 			/* populate list */
-			expand_base_strategies(pmo, base_strategy_list_3_display, base_strategy_list_3_display_size, 3);
+			pmo_dcn4_fams2_expand_base_pstate_strategies(
+					base_strategy_list_3_display,
+					base_strategy_list_3_display_size,
+					i,
+					pmo->init_data.pmo_dcn4.expanded_strategy_list_3_display,
+					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
 			break;
 		case 4:
 			DML2_ASSERT(base_strategy_list_4_display_size <= PMO_DCN4_MAX_BASE_STRATEGIES);
 
 			/* populate list */
-			expand_base_strategies(pmo, base_strategy_list_4_display, base_strategy_list_4_display_size, 4);
+			pmo_dcn4_fams2_expand_base_pstate_strategies(
+					base_strategy_list_4_display,
+					base_strategy_list_4_display_size,
+					i,
+					pmo->init_data.pmo_dcn4.expanded_strategy_list_4_display,
+					&pmo->init_data.pmo_dcn4.num_expanded_strategies_per_list[i - 1]);
 			break;
 		}
 	}
@@ -941,11 +971,8 @@ static void build_synchronized_timing_groups(
 		/* find synchronizable timing groups */
 		for (j = i + 1; j < display_config->display_config.num_streams; j++) {
 			if (memcmp(master_timing,
-					&display_config->display_config.stream_descriptors[j].timing,
-					sizeof(struct dml2_timing_cfg)) == 0 &&
-					display_config->display_config.stream_descriptors[i].output.output_encoder == display_config->display_config.stream_descriptors[j].output.output_encoder &&
-					(display_config->display_config.stream_descriptors[i].output.output_encoder != dml2_hdmi || //hdmi requires formats match
-					display_config->display_config.stream_descriptors[i].output.output_format == display_config->display_config.stream_descriptors[j].output.output_format)) {
+				&display_config->display_config.stream_descriptors[j].timing,
+				sizeof(struct dml2_timing_cfg)) == 0) {
 				set_bit_in_bitfield(&pmo->scratch.pmo_dcn4.synchronized_timing_group_masks[timing_group_idx], j);
 				set_bit_in_bitfield(&stream_mapped_mask, j);
 			}
@@ -1106,24 +1133,73 @@ static void insert_into_candidate_list(const struct dml2_pmo_pstate_strategy *ps
 	scratch->pmo_dcn4.num_pstate_candidates++;
 }
 
-static bool all_planes_match_method(const struct display_configuation_with_meta *display_cfg, int plane_mask, enum dml2_pmo_pstate_method method)
+static enum dml2_pstate_method uclk_pstate_strategy_override_to_pstate_method(const enum dml2_uclk_pstate_change_strategy override_strategy)
 {
-	unsigned char i;
-	enum dml2_uclk_pstate_change_strategy matching_strategy = (enum dml2_uclk_pstate_change_strategy) dml2_pmo_pstate_strategy_na;
+	enum dml2_pstate_method method = dml2_pstate_method_na;
+
+	switch (override_strategy) {
+	case dml2_uclk_pstate_change_strategy_force_vactive:
+		method = dml2_pstate_method_vactive;
+		break;
+	case dml2_uclk_pstate_change_strategy_force_vblank:
+		method = dml2_pstate_method_vblank;
+		break;
+	case dml2_uclk_pstate_change_strategy_force_drr:
+		method = dml2_pstate_method_fw_drr;
+		break;
+	case dml2_uclk_pstate_change_strategy_force_mall_svp:
+		method = dml2_pstate_method_fw_svp;
+		break;
+	case dml2_uclk_pstate_change_strategy_force_mall_full_frame:
+	case dml2_uclk_pstate_change_strategy_auto:
+	default:
+		method = dml2_pstate_method_na;
+	}
 
-	if (method == dml2_pmo_pstate_strategy_vactive || method == dml2_pmo_pstate_strategy_fw_vactive_drr)
-		matching_strategy = dml2_uclk_pstate_change_strategy_force_vactive;
-	else if (method == dml2_pmo_pstate_strategy_vblank || method == dml2_pmo_pstate_strategy_fw_vblank_drr)
-		matching_strategy = dml2_uclk_pstate_change_strategy_force_vblank;
-	else if (method == dml2_pmo_pstate_strategy_fw_svp)
-		matching_strategy = dml2_uclk_pstate_change_strategy_force_mall_svp;
-	else if (method == dml2_pmo_pstate_strategy_fw_drr)
-		matching_strategy = dml2_uclk_pstate_change_strategy_force_drr;
+	return method;
+}
+
+static enum dml2_uclk_pstate_change_strategy pstate_method_to_uclk_pstate_strategy_override(const enum dml2_pstate_method method)
+{
+	enum dml2_uclk_pstate_change_strategy override_strategy = dml2_uclk_pstate_change_strategy_auto;
+
+	switch (method) {
+	case dml2_pstate_method_vactive:
+	case dml2_pstate_method_fw_vactive_drr:
+		override_strategy = dml2_uclk_pstate_change_strategy_force_vactive;
+		break;
+	case dml2_pstate_method_vblank:
+	case dml2_pstate_method_fw_vblank_drr:
+		override_strategy = dml2_uclk_pstate_change_strategy_force_vblank;
+		break;
+	case dml2_pstate_method_fw_svp:
+	case dml2_pstate_method_fw_svp_drr:
+		override_strategy = dml2_uclk_pstate_change_strategy_force_mall_svp;
+		break;
+	case dml2_pstate_method_fw_drr:
+		override_strategy = dml2_uclk_pstate_change_strategy_force_drr;
+		break;
+	case dml2_pstate_method_reserved_hw:
+	case dml2_pstate_method_reserved_fw:
+	case dml2_pstate_method_reserved_fw_drr_clamped:
+	case dml2_pstate_method_reserved_fw_drr_var:
+	case dml2_pstate_method_count:
+	case dml2_pstate_method_na:
+	default:
+		override_strategy = dml2_uclk_pstate_change_strategy_auto;
+	}
+
+	return override_strategy;
+}
+
+static bool all_planes_match_method(const struct display_configuation_with_meta *display_cfg, int plane_mask, enum dml2_pstate_method method)
+{
+	unsigned char i;
 
 	for (i = 0; i < DML2_MAX_PLANES; i++) {
 		if (is_bit_set_in_bitfield(plane_mask, i)) {
 			if (display_cfg->display_config.plane_descriptors[i].overrides.uclk_pstate_change_strategy != dml2_uclk_pstate_change_strategy_auto &&
-				display_cfg->display_config.plane_descriptors[i].overrides.uclk_pstate_change_strategy != matching_strategy)
+				display_cfg->display_config.plane_descriptors[i].overrides.uclk_pstate_change_strategy != pstate_method_to_uclk_pstate_strategy_override(method))
 				return false;
 		}
 	}
@@ -1149,32 +1225,33 @@ static void build_method_scheduling_params(
 
 static struct dml2_fams2_per_method_common_meta *get_per_method_common_meta(
 	struct dml2_pmo_instance *pmo,
-	enum dml2_pmo_pstate_method stream_pstate_method,
+	enum dml2_pstate_method stream_pstate_method,
 	int stream_idx)
 {
 	struct dml2_fams2_per_method_common_meta *stream_method_fams2_meta = NULL;
 
 	switch (stream_pstate_method) {
-	case dml2_pmo_pstate_strategy_vactive:
-	case dml2_pmo_pstate_strategy_fw_vactive_drr:
+	case dml2_pstate_method_vactive:
+	case dml2_pstate_method_fw_vactive_drr:
 		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_vactive.common;
 		break;
-	case dml2_pmo_pstate_strategy_vblank:
-	case dml2_pmo_pstate_strategy_fw_vblank_drr:
+	case dml2_pstate_method_vblank:
+	case dml2_pstate_method_fw_vblank_drr:
 		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_vblank.common;
 		break;
-	case dml2_pmo_pstate_strategy_fw_svp:
-	case dml2_pmo_pstate_strategy_fw_svp_drr:
+	case dml2_pstate_method_fw_svp:
+	case dml2_pstate_method_fw_svp_drr:
 		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_subvp.common;
 		break;
-	case dml2_pmo_pstate_strategy_fw_drr:
+	case dml2_pstate_method_fw_drr:
 		stream_method_fams2_meta = &pmo->scratch.pmo_dcn4.stream_fams2_meta[stream_idx].method_drr.common;
 		break;
-	case dml2_pmo_pstate_strategy_reserved_hw:
-	case dml2_pmo_pstate_strategy_reserved_fw:
-	case dml2_pmo_pstate_strategy_reserved_fw_drr_clamped:
-	case dml2_pmo_pstate_strategy_reserved_fw_drr_var:
-	case dml2_pmo_pstate_strategy_na:
+	case dml2_pstate_method_reserved_hw:
+	case dml2_pstate_method_reserved_fw:
+	case dml2_pstate_method_reserved_fw_drr_clamped:
+	case dml2_pstate_method_reserved_fw_drr_var:
+	case dml2_pstate_method_count:
+	case dml2_pstate_method_na:
 	default:
 		stream_method_fams2_meta = NULL;
 	}
@@ -1215,7 +1292,7 @@ static bool is_timing_group_schedulable(
 		if (is_bit_set_in_bitfield(pmo->scratch.pmo_dcn4.synchronized_timing_group_masks[timing_group_idx], i)) {
 			stream_method_fams2_meta = get_per_method_common_meta(pmo, pstate_strategy->per_stream_pstate_method[i], i);
 			if (!stream_method_fams2_meta)
-				return false;
+				continue;
 
 			if (group_fams2_meta->allow_start_otg_vline < stream_method_fams2_meta->allow_start_otg_vline) {
 				/* set group allow start to larger otg vline */
@@ -1295,7 +1372,7 @@ static bool is_config_schedulable(
 			if (j_disallow_us < jp1_disallow_us) {
 				/* swap as A < B */
 				swap(s->pmo_dcn4.sorted_group_gtl_disallow_index[j],
-				     s->pmo_dcn4.sorted_group_gtl_disallow_index[j+1]);
+					 s->pmo_dcn4.sorted_group_gtl_disallow_index[j+1]);
 				swapped = true;
 			}
 		}
@@ -1354,7 +1431,7 @@ static bool is_config_schedulable(
 			if (j_period_us < jp1_period_us) {
 				/* swap as A < B */
 				swap(s->pmo_dcn4.sorted_group_gtl_period_index[j],
-				     s->pmo_dcn4.sorted_group_gtl_period_index[j+1]);
+					 s->pmo_dcn4.sorted_group_gtl_period_index[j+1]);
 				swapped = true;
 			}
 		}
@@ -1413,7 +1490,7 @@ static bool is_config_schedulable(
 
 static bool stream_matches_drr_policy(struct dml2_pmo_instance *pmo,
 	const struct display_configuation_with_meta *display_cfg,
-	const enum dml2_pmo_pstate_method stream_pstate_method,
+	const enum dml2_pstate_method stream_pstate_method,
 	unsigned int stream_index)
 {
 	const struct dml2_stream_parameters *stream_descriptor = &display_cfg->display_config.stream_descriptors[stream_index];
@@ -1494,19 +1571,19 @@ static bool validate_pstate_support_strategy_cofunctionality(struct dml2_pmo_ins
 		strategy_matches_drr_requirements &=
 			stream_matches_drr_policy(pmo, display_cfg, pstate_strategy->per_stream_pstate_method[stream_index], stream_index);
 
-		if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp ||
-			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
+		if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_svp ||
+			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_svp_drr) {
 			svp_count++;
 			set_bit_in_bitfield(&svp_stream_mask, stream_index);
-		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
+		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_drr) {
 			drr_count++;
 			set_bit_in_bitfield(&drr_stream_mask, stream_index);
-		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vactive ||
-			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
+		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pstate_method_vactive ||
+			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_vactive_drr) {
 			vactive_count++;
 			set_bit_in_bitfield(&vactive_stream_mask, stream_index);
-		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vblank ||
-			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
+		} else if (pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pstate_method_vblank ||
+			pstate_strategy->per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_vblank_drr) {
 			vblank_count++;
 			set_bit_in_bitfield(&vblank_stream_mask, stream_index);
 		}
@@ -1625,7 +1702,7 @@ static void build_fams2_meta_per_stream(struct dml2_pmo_instance *pmo,
 		/* for single stream, guarantee at least an instant of allow */
 		stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines = (unsigned int)math_floor(
 				math_max2(0.0,
-				timing->v_active - stream_fams2_meta->min_allow_width_otg_vlines - stream_fams2_meta->dram_clk_change_blackout_otg_vlines));
+				timing->v_active - math_max2(1.0, stream_fams2_meta->min_allow_width_otg_vlines) - stream_fams2_meta->dram_clk_change_blackout_otg_vlines));
 	} else {
 		/* for multi stream, bound to a max fill time defined by IP caps */
 		stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_otg_vlines =
@@ -1738,8 +1815,10 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 	struct display_configuation_with_meta *display_config;
 	const struct dml2_plane_parameters *plane_descriptor;
 	const struct dml2_pmo_pstate_strategy *strategy_list = NULL;
+	struct dml2_pmo_pstate_strategy override_base_strategy = { 0 };
 	unsigned int strategy_list_size = 0;
 	unsigned char plane_index, stream_index, i;
+	bool build_override_strategy = true;
 
 	state->performed = true;
 	in_out->base_display_config->stage3.min_clk_index_for_latency = in_out->base_display_config->stage1.min_clk_index_for_latency;
@@ -1763,7 +1842,11 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 
 		set_bit_in_bitfield(&s->pmo_dcn4.stream_plane_mask[plane_descriptor->stream_index], plane_index);
 
-		state->pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_vactive;
+		state->pstate_switch_modes[plane_index] = dml2_pstate_method_vactive;
+
+		build_override_strategy &= plane_descriptor->overrides.uclk_pstate_change_strategy != dml2_uclk_pstate_change_strategy_auto;
+		override_base_strategy.per_stream_pstate_method[plane_descriptor->stream_index] =
+				uclk_pstate_strategy_override_to_pstate_method(plane_descriptor->overrides.uclk_pstate_change_strategy);
 	}
 
 	// Figure out which streams can do vactive, and also build up implicit SVP and FAMS2 meta
@@ -1781,13 +1864,30 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 	/* get synchronized timing groups */
 	build_synchronized_timing_groups(pmo, display_config);
 
-	strategy_list = get_expanded_strategy_list(&pmo->init_data, display_config->display_config.num_streams);
-	if (!strategy_list)
-		return false;
-
-	strategy_list_size = get_num_expanded_strategies(&pmo->init_data, display_config->display_config.num_streams);
+	if (build_override_strategy) {
+		/* build expanded override strategy list (no permutations) */
+		override_base_strategy.allow_state_increase = true;
+		s->pmo_dcn4.num_expanded_override_strategies = 0;
+		insert_strategy_into_expanded_list(&override_base_strategy,
+				display_config->display_config.num_streams,
+				s->pmo_dcn4.expanded_override_strategy_list,
+				&s->pmo_dcn4.num_expanded_override_strategies);
+		expand_variant_strategy(&override_base_strategy,
+				display_config->display_config.num_streams,
+				false,
+				s->pmo_dcn4.expanded_override_strategy_list,
+				&s->pmo_dcn4.num_expanded_override_strategies);
+
+		/* use override strategy list */
+		strategy_list = s->pmo_dcn4.expanded_override_strategy_list;
+		strategy_list_size = s->pmo_dcn4.num_expanded_override_strategies;
+	} else {
+		/* use predefined strategy list */
+		strategy_list = get_expanded_strategy_list(&pmo->init_data, display_config->display_config.num_streams);
+		strategy_list_size = get_num_expanded_strategies(&pmo->init_data, display_config->display_config.num_streams);
+	}
 
-	if (strategy_list_size == 0)
+	if (!strategy_list || strategy_list_size == 0)
 		return false;
 
 	s->pmo_dcn4.num_pstate_candidates = 0;
@@ -1799,7 +1899,7 @@ bool pmo_dcn4_fams2_init_for_pstate_support(struct dml2_pmo_init_for_pstate_supp
 	}
 
 	if (s->pmo_dcn4.num_pstate_candidates > 0) {
-		s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.num_pstate_candidates - 1].allow_state_increase = true;
+		s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.num_pstate_candidates-1].allow_state_increase = true;
 		s->pmo_dcn4.cur_pstate_candidate = -1;
 		return true;
 	} else {
@@ -1832,7 +1932,7 @@ static void reset_display_configuration(struct display_configuation_with_meta *d
 		// Reset strategy to auto
 		plane->overrides.uclk_pstate_change_strategy = dml2_uclk_pstate_change_strategy_auto;
 
-		display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_not_supported;
+		display_config->stage3.pstate_switch_modes[plane_index] = dml2_pstate_method_na;
 	}
 }
 
@@ -1849,7 +1949,7 @@ static void setup_planes_for_drr_by_mask(struct display_configuation_with_meta *
 
 			plane->overrides.uclk_pstate_change_strategy = dml2_uclk_pstate_change_strategy_force_drr;
 
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_fw_drr;
+			display_config->stage3.pstate_switch_modes[plane_index] = dml2_pstate_method_fw_drr;
 
 		}
 	}
@@ -1867,7 +1967,7 @@ static void setup_planes_for_svp_by_mask(struct display_configuation_with_meta *
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
 			stream_index = (char)display_config->display_config.plane_descriptors[plane_index].stream_index;
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_fw_subvp_phantom;
+			display_config->stage3.pstate_switch_modes[plane_index] = dml2_pstate_method_fw_svp;
 		}
 	}
 
@@ -1890,7 +1990,7 @@ static void setup_planes_for_svp_drr_by_mask(struct display_configuation_with_me
 	for (plane_index = 0; plane_index < display_config->display_config.num_planes; plane_index++) {
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
 			stream_index = (char)display_config->display_config.plane_descriptors[plane_index].stream_index;
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_fw_subvp_phantom_drr;
+			display_config->stage3.pstate_switch_modes[plane_index] = dml2_pstate_method_fw_svp_drr;
 		}
 	}
 
@@ -1915,7 +2015,7 @@ static void setup_planes_for_vblank_by_mask(struct display_configuation_with_met
 			plane->overrides.reserved_vblank_time_ns = (long)math_max2(pmo->soc_bb->power_management_parameters.dram_clk_change_blackout_us * 1000.0,
 					plane->overrides.reserved_vblank_time_ns);
 
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_vblank;
+			display_config->stage3.pstate_switch_modes[plane_index] = dml2_pstate_method_vblank;
 
 		}
 	}
@@ -1933,7 +2033,7 @@ static void setup_planes_for_vblank_drr_by_mask(struct display_configuation_with
 			plane = &display_config->display_config.plane_descriptors[plane_index];
 			plane->overrides.reserved_vblank_time_ns = (long)(pmo->soc_bb->power_management_parameters.dram_clk_change_blackout_us * 1000);
 
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_fw_vblank_drr;
+			display_config->stage3.pstate_switch_modes[plane_index] = dml2_pstate_method_fw_vblank_drr;
 		}
 	}
 }
@@ -1949,7 +2049,7 @@ static void setup_planes_for_vactive_by_mask(struct display_configuation_with_me
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
 			stream_index = display_config->display_config.plane_descriptors[plane_index].stream_index;
 
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_vactive;
+			display_config->stage3.pstate_switch_modes[plane_index] = dml2_pstate_method_vactive;
 
 			if (!pmo->options->disable_vactive_det_fill_bw_pad) {
 				display_config->display_config.plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us =
@@ -1970,7 +2070,7 @@ static void setup_planes_for_vactive_drr_by_mask(struct display_configuation_wit
 		if (is_bit_set_in_bitfield(plane_mask, plane_index)) {
 			stream_index = display_config->display_config.plane_descriptors[plane_index].stream_index;
 
-			display_config->stage3.pstate_switch_modes[plane_index] = dml2_uclk_pstate_support_method_fw_vactive_drr;
+			display_config->stage3.pstate_switch_modes[plane_index] = dml2_pstate_method_fw_vactive_drr;
 
 			if (!pmo->options->disable_vactive_det_fill_bw_pad) {
 				display_config->display_config.plane_descriptors[plane_index].overrides.max_vactive_det_fill_delay_us =
@@ -1992,26 +2092,26 @@ static bool setup_display_config(struct display_configuation_with_meta *display_
 
 	for (stream_index = 0; stream_index < display_config->display_config.num_streams; stream_index++) {
 
-		if (pmo->scratch.pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_na) {
+		if (pmo->scratch.pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pstate_method_na) {
 			success = false;
 			break;
-		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vactive) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pstate_method_vactive) {
 			setup_planes_for_vactive_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vblank) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pstate_method_vblank) {
 			setup_planes_for_vblank_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_svp) {
 			fams2_required = true;
 			setup_planes_for_svp_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_vactive_drr) {
 			fams2_required = true;
 			setup_planes_for_vactive_drr_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_vblank_drr) {
 			fams2_required = true;
 			setup_planes_for_vblank_drr_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_svp_drr) {
 			fams2_required = true;
 			setup_planes_for_svp_drr_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
-		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
+		} else if (scratch->pmo_dcn4.pstate_strategy_candidates[strategy_index].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_drr) {
 			fams2_required = true;
 			setup_planes_for_drr_by_mask(display_config, pmo, scratch->pmo_dcn4.stream_plane_mask[stream_index]);
 		}
@@ -2066,34 +2166,34 @@ bool pmo_dcn4_fams2_test_for_pstate_support(struct dml2_pmo_test_for_pstate_supp
 	for (stream_index = 0; stream_index < in_out->base_display_config->display_config.num_streams; stream_index++) {
 		struct dml2_fams2_meta *stream_fams2_meta = &s->pmo_dcn4.stream_fams2_meta[stream_index];
 
-		if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vactive ||
-				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vactive_drr) {
+		if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_vactive ||
+				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_vactive_drr) {
 			if (get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < (MIN_VACTIVE_MARGIN_PCT * in_out->instance->soc_bb->power_management_parameters.dram_clk_change_blackout_us) ||
 					get_vactive_det_fill_latency_delay_us(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) > stream_fams2_meta->method_vactive.max_vactive_det_fill_delay_us) {
 				p_state_supported = false;
 				break;
 			}
-		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_vblank ||
-				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_vblank_drr) {
+		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_vblank ||
+				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_vblank_drr) {
 			if (get_minimum_reserved_time_us_for_planes(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) <
 				REQUIRED_RESERVED_TIME ||
 				get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < MIN_VACTIVE_MARGIN_VBLANK) {
 				p_state_supported = false;
 				break;
 			}
-		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp ||
-				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_svp_drr) {
+		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_svp ||
+				s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_svp_drr) {
 			if (in_out->base_display_config->stage3.stream_svp_meta[stream_index].valid == false) {
 				p_state_supported = false;
 				break;
 			}
-		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_fw_drr) {
-			if (!all_planes_match_method(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index], dml2_pmo_pstate_strategy_fw_drr) ||
+		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_fw_drr) {
+			if (!all_planes_match_method(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index], dml2_pstate_method_fw_drr) ||
 				get_vactive_pstate_margin(in_out->base_display_config, s->pmo_dcn4.stream_plane_mask[stream_index]) < MIN_VACTIVE_MARGIN_DRR) {
 				p_state_supported = false;
 				break;
 			}
-		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pmo_pstate_strategy_na) {
+		} else if (s->pmo_dcn4.pstate_strategy_candidates[s->pmo_dcn4.cur_pstate_candidate].per_stream_pstate_method[stream_index] == dml2_pstate_method_na) {
 			p_state_supported = false;
 			break;
 		}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h
index 0c25bd3e9ac0..6baab7ad6ecc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h
@@ -23,4 +23,11 @@ bool pmo_dcn4_fams2_init_for_stutter(struct dml2_pmo_init_for_stutter_in_out *in
 bool pmo_dcn4_fams2_test_for_stutter(struct dml2_pmo_test_for_stutter_in_out *in_out);
 bool pmo_dcn4_fams2_optimize_for_stutter(struct dml2_pmo_optimize_for_stutter_in_out *in_out);
 
+void pmo_dcn4_fams2_expand_base_pstate_strategies(
+	const struct dml2_pmo_pstate_strategy *base_strategies_list,
+	const unsigned int num_base_strategies,
+	const unsigned int stream_count,
+	struct dml2_pmo_pstate_strategy *expanded_strategy_list,
+	unsigned int *num_expanded_strategies);
+
 #endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
index add51d41a515..7ed0242a4b33 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
@@ -72,7 +72,6 @@ bool dml2_pmo_create(enum dml2_project_id project_id, struct dml2_pmo_instance *
 		out->init_for_stutter = pmo_dcn4_fams2_init_for_stutter;
 		out->test_for_stutter = pmo_dcn4_fams2_test_for_stutter;
 		out->optimize_for_stutter = pmo_dcn4_fams2_optimize_for_stutter;
-
 		result = true;
 		break;
 	case dml2_project_invalid:
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.c
new file mode 100644
index 000000000000..5f6dfc24df69
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_interfaces.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include "dml_top.h"
+#include "dml2_internal_shared_types.h"
+#include "dml2_top_soc15.h"
+
+unsigned int dml2_get_instance_size_bytes(void)
+{
+	return sizeof(struct dml2_instance);
+}
+
+bool dml2_initialize_instance(struct dml2_initialize_instance_in_out *in_out)
+{
+	switch (in_out->options.project_id) {
+	case dml2_project_dcn4x_stage1:
+		return false;
+	case dml2_project_dcn4x_stage2:
+	case dml2_project_dcn4x_stage2_auto_drr_svp:
+		return dml2_top_soc15_initialize_instance(in_out);
+	case dml2_project_invalid:
+	default:
+		return false;
+	}
+}
+
+bool dml2_check_mode_supported(struct dml2_check_mode_supported_in_out *in_out)
+{
+	if (!in_out->dml2_instance->funcs.check_mode_supported)
+		return false;
+
+	return in_out->dml2_instance->funcs.check_mode_supported(in_out);
+}
+
+bool dml2_build_mode_programming(struct dml2_build_mode_programming_in_out *in_out)
+{
+	if (!in_out->dml2_instance->funcs.build_mode_programming)
+		return false;
+
+	return in_out->dml2_instance->funcs.build_mode_programming(in_out);
+}
+
+bool dml2_build_mcache_programming(struct dml2_build_mcache_programming_in_out *in_out)
+{
+	if (!in_out->dml2_instance->funcs.build_mcache_programming)
+		return false;
+
+	return in_out->dml2_instance->funcs.build_mcache_programming(in_out);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c
new file mode 100644
index 000000000000..db0a30fdb58d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.c
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.h
new file mode 100644
index 000000000000..14d0ae03dce6
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_legacy.h
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#ifndef __DML2_TOP_LEGACY_H__
+#define __DML2_TOP_LEGACY_H__
+#include "dml2_internal_shared_types.h"
+bool dml2_top_legacy_initialize_instance(struct dml2_initialize_instance_in_out *in_out);
+#endif /* __DML2_TOP_LEGACY_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c
deleted file mode 100644
index d0e026d981b5..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.c
+++ /dev/null
@@ -1,307 +0,0 @@
-// SPDX-License-Identifier: MIT
-//
-// Copyright 2024 Advanced Micro Devices, Inc.
-
-#include "dml2_top_optimization.h"
-#include "dml2_internal_shared_types.h"
-#include "dml_top_mcache.h"
-
-static void copy_display_configuration_with_meta(struct display_configuation_with_meta *dst, const struct display_configuation_with_meta *src)
-{
-	memcpy(dst, src, sizeof(struct display_configuation_with_meta));
-}
-
-bool dml2_top_optimization_init_function_min_clk_for_latency(const struct optimization_init_function_params *params)
-{
-	struct dml2_optimization_stage1_state *state = &params->display_config->stage1;
-
-	state->performed = true;
-
-	return true;
-}
-
-bool dml2_top_optimization_test_function_min_clk_for_latency(const struct optimization_test_function_params *params)
-{
-	struct dml2_optimization_stage1_state *state = &params->display_config->stage1;
-
-	return state->min_clk_index_for_latency == 0;
-}
-
-bool dml2_top_optimization_optimize_function_min_clk_for_latency(const struct optimization_optimize_function_params *params)
-{
-	bool result = false;
-
-	if (params->display_config->stage1.min_clk_index_for_latency > 0) {
-		copy_display_configuration_with_meta(params->optimized_display_config, params->display_config);
-		params->optimized_display_config->stage1.min_clk_index_for_latency--;
-		result = true;
-	}
-
-	return result;
-}
-
-bool dml2_top_optimization_test_function_mcache(const struct optimization_test_function_params *params)
-{
-	struct dml2_optimization_test_function_locals *l = params->locals;
-	bool mcache_success = false;
-	bool result = false;
-
-	memset(l, 0, sizeof(struct dml2_optimization_test_function_locals));
-
-	l->test_mcache.calc_mcache_count_params.dml2_instance = params->dml;
-	l->test_mcache.calc_mcache_count_params.display_config = &params->display_config->display_config;
-	l->test_mcache.calc_mcache_count_params.mcache_allocations = params->display_config->stage2.mcache_allocations;
-
-	result = dml2_top_mcache_calc_mcache_count_and_offsets(&l->test_mcache.calc_mcache_count_params); // use core to get the basic mcache_allocations
-
-	if (result) {
-		l->test_mcache.assign_global_mcache_ids_params.allocations = params->display_config->stage2.mcache_allocations;
-		l->test_mcache.assign_global_mcache_ids_params.num_allocations = params->display_config->display_config.num_planes;
-
-		dml2_top_mcache_assign_global_mcache_ids(&l->test_mcache.assign_global_mcache_ids_params);
-
-		l->test_mcache.validate_admissibility_params.dml2_instance = params->dml;
-		l->test_mcache.validate_admissibility_params.display_cfg = &params->display_config->display_config;
-		l->test_mcache.validate_admissibility_params.mcache_allocations = params->display_config->stage2.mcache_allocations;
-		l->test_mcache.validate_admissibility_params.cfg_support_info = &params->display_config->mode_support_result.cfg_support_info;
-
-		mcache_success = dml2_top_mcache_validate_admissability(&l->test_mcache.validate_admissibility_params); // also find the shift to make mcache allocation works
-
-		memcpy(params->display_config->stage2.per_plane_mcache_support, l->test_mcache.validate_admissibility_params.per_plane_status, sizeof(bool) * DML2_MAX_PLANES);
-	}
-
-	return mcache_success;
-}
-
-bool dml2_top_optimization_optimize_function_mcache(const struct optimization_optimize_function_params *params)
-{
-	struct dml2_optimization_optimize_function_locals *l = params->locals;
-	bool optimize_success = false;
-
-	if (params->last_candidate_supported == false)
-		return false;
-
-	copy_display_configuration_with_meta(params->optimized_display_config, params->display_config);
-
-	l->optimize_mcache.optimize_mcache_params.instance = &params->dml->pmo_instance;
-	l->optimize_mcache.optimize_mcache_params.dcc_mcache_supported = params->display_config->stage2.per_plane_mcache_support;
-	l->optimize_mcache.optimize_mcache_params.display_config = &params->display_config->display_config;
-	l->optimize_mcache.optimize_mcache_params.optimized_display_cfg = &params->optimized_display_config->display_config;
-	l->optimize_mcache.optimize_mcache_params.cfg_support_info = &params->optimized_display_config->mode_support_result.cfg_support_info;
-
-	optimize_success = params->dml->pmo_instance.optimize_dcc_mcache(&l->optimize_mcache.optimize_mcache_params);
-
-	return optimize_success;
-}
-
-bool dml2_top_optimization_init_function_vmin(const struct optimization_init_function_params *params)
-{
-	struct dml2_optimization_init_function_locals *l = params->locals;
-
-	l->vmin.init_params.instance = &params->dml->pmo_instance;
-	l->vmin.init_params.base_display_config = params->display_config;
-	return params->dml->pmo_instance.init_for_vmin(&l->vmin.init_params);
-}
-
-bool dml2_top_optimization_test_function_vmin(const struct optimization_test_function_params *params)
-{
-	struct dml2_optimization_test_function_locals *l = params->locals;
-
-	l->test_vmin.pmo_test_vmin_params.instance = &params->dml->pmo_instance;
-	l->test_vmin.pmo_test_vmin_params.display_config = params->display_config;
-	l->test_vmin.pmo_test_vmin_params.vmin_limits = &params->dml->soc_bbox.vmin_limit;
-	return params->dml->pmo_instance.test_for_vmin(&l->test_vmin.pmo_test_vmin_params);
-}
-
-bool dml2_top_optimization_optimize_function_vmin(const struct optimization_optimize_function_params *params)
-{
-	struct dml2_optimization_optimize_function_locals *l = params->locals;
-
-	if (params->last_candidate_supported == false)
-		return false;
-
-	l->optimize_vmin.pmo_optimize_vmin_params.instance = &params->dml->pmo_instance;
-	l->optimize_vmin.pmo_optimize_vmin_params.base_display_config = params->display_config;
-	l->optimize_vmin.pmo_optimize_vmin_params.optimized_display_config = params->optimized_display_config;
-	return params->dml->pmo_instance.optimize_for_vmin(&l->optimize_vmin.pmo_optimize_vmin_params);
-}
-
-bool dml2_top_optimization_perform_optimization_phase(struct dml2_optimization_phase_locals *l, const struct optimization_phase_params *params)
-{
-	bool test_passed = false;
-	bool optimize_succeeded = true;
-	bool candidate_validation_passed = true;
-	struct optimization_init_function_params init_params = { 0 };
-	struct optimization_test_function_params test_params = { 0 };
-	struct optimization_optimize_function_params optimize_params = { 0 };
-
-	if (!params->dml ||
-		!params->optimize_function ||
-		!params->test_function ||
-		!params->display_config ||
-		!params->optimized_display_config)
-		return false;
-
-	copy_display_configuration_with_meta(&l->cur_candidate_display_cfg, params->display_config);
-
-	init_params.locals = &l->init_function_locals;
-	init_params.dml = params->dml;
-	init_params.display_config = &l->cur_candidate_display_cfg;
-
-	if (params->init_function && !params->init_function(&init_params))
-		return false;
-
-	test_params.locals = &l->test_function_locals;
-	test_params.dml = params->dml;
-	test_params.display_config = &l->cur_candidate_display_cfg;
-
-	test_passed = params->test_function(&test_params);
-
-	while (!test_passed && optimize_succeeded) {
-		memset(&optimize_params, 0, sizeof(struct optimization_optimize_function_params));
-
-		optimize_params.locals = &l->optimize_function_locals;
-		optimize_params.dml = params->dml;
-		optimize_params.display_config = &l->cur_candidate_display_cfg;
-		optimize_params.optimized_display_config = &l->next_candidate_display_cfg;
-		optimize_params.last_candidate_supported = candidate_validation_passed;
-
-		optimize_succeeded = params->optimize_function(&optimize_params);
-
-		if (optimize_succeeded) {
-			l->mode_support_params.instance = &params->dml->core_instance;
-			l->mode_support_params.display_cfg = &l->next_candidate_display_cfg;
-			l->mode_support_params.min_clk_table = &params->dml->min_clk_table;
-
-			if (l->next_candidate_display_cfg.stage3.performed)
-				l->mode_support_params.min_clk_index = l->next_candidate_display_cfg.stage3.min_clk_index_for_latency;
-			else
-				l->mode_support_params.min_clk_index = l->next_candidate_display_cfg.stage1.min_clk_index_for_latency;
-
-			candidate_validation_passed = params->dml->core_instance.mode_support(&l->mode_support_params);
-
-			l->next_candidate_display_cfg.mode_support_result = l->mode_support_params.mode_support_result;
-		}
-
-		if (optimize_succeeded && candidate_validation_passed) {
-			memset(&test_params, 0, sizeof(struct optimization_test_function_params));
-			test_params.locals = &l->test_function_locals;
-			test_params.dml = params->dml;
-			test_params.display_config = &l->next_candidate_display_cfg;
-			test_passed = params->test_function(&test_params);
-
-			copy_display_configuration_with_meta(&l->cur_candidate_display_cfg, &l->next_candidate_display_cfg);
-
-			// If optimization is not all or nothing, then store partial progress in output
-			if (!params->all_or_nothing)
-				copy_display_configuration_with_meta(params->optimized_display_config, &l->next_candidate_display_cfg);
-		}
-	}
-
-	if (test_passed)
-		copy_display_configuration_with_meta(params->optimized_display_config, &l->cur_candidate_display_cfg);
-
-	return test_passed;
-}
-
-bool dml2_top_optimization_perform_optimization_phase_1(struct dml2_optimization_phase_locals *l, const struct optimization_phase_params *params)
-{
-	int highest_state, lowest_state, cur_state;
-	bool supported = false;
-
-	if (!params->dml ||
-		!params->optimize_function ||
-		!params->test_function ||
-		!params->display_config ||
-		!params->optimized_display_config)
-		return false;
-
-	copy_display_configuration_with_meta(&l->cur_candidate_display_cfg, params->display_config);
-	highest_state = l->cur_candidate_display_cfg.stage1.min_clk_index_for_latency;
-	lowest_state = 0;
-
-	while (highest_state > lowest_state) {
-		cur_state = (highest_state + lowest_state) / 2;
-
-		l->mode_support_params.instance = &params->dml->core_instance;
-		l->mode_support_params.display_cfg = &l->cur_candidate_display_cfg;
-		l->mode_support_params.min_clk_table = &params->dml->min_clk_table;
-		l->mode_support_params.min_clk_index = cur_state;
-
-		supported = params->dml->core_instance.mode_support(&l->mode_support_params);
-
-		if (supported) {
-			l->cur_candidate_display_cfg.mode_support_result = l->mode_support_params.mode_support_result;
-			highest_state = cur_state;
-		} else {
-			lowest_state = cur_state + 1;
-		}
-	}
-	l->cur_candidate_display_cfg.stage1.min_clk_index_for_latency = lowest_state;
-
-	copy_display_configuration_with_meta(params->optimized_display_config, &l->cur_candidate_display_cfg);
-
-	return true;
-}
-
-bool dml2_top_optimization_init_function_uclk_pstate(const struct optimization_init_function_params *params)
-{
-	struct dml2_optimization_init_function_locals *l = params->locals;
-
-	l->uclk_pstate.init_params.instance = &params->dml->pmo_instance;
-	l->uclk_pstate.init_params.base_display_config = params->display_config;
-
-	return params->dml->pmo_instance.init_for_uclk_pstate(&l->uclk_pstate.init_params);
-}
-
-bool dml2_top_optimization_test_function_uclk_pstate(const struct optimization_test_function_params *params)
-{
-	struct dml2_optimization_test_function_locals *l = params->locals;
-
-	l->uclk_pstate.test_params.instance = &params->dml->pmo_instance;
-	l->uclk_pstate.test_params.base_display_config = params->display_config;
-
-	return params->dml->pmo_instance.test_for_uclk_pstate(&l->uclk_pstate.test_params);
-}
-
-bool dml2_top_optimization_optimize_function_uclk_pstate(const struct optimization_optimize_function_params *params)
-{
-	struct dml2_optimization_optimize_function_locals *l = params->locals;
-
-	l->uclk_pstate.optimize_params.instance = &params->dml->pmo_instance;
-	l->uclk_pstate.optimize_params.base_display_config = params->display_config;
-	l->uclk_pstate.optimize_params.optimized_display_config = params->optimized_display_config;
-	l->uclk_pstate.optimize_params.last_candidate_failed = !params->last_candidate_supported;
-
-	return params->dml->pmo_instance.optimize_for_uclk_pstate(&l->uclk_pstate.optimize_params);
-}
-
-bool dml2_top_optimization_init_function_stutter(const struct optimization_init_function_params *params)
-{
-	struct dml2_optimization_init_function_locals *l = params->locals;
-
-	l->uclk_pstate.init_params.instance = &params->dml->pmo_instance;
-	l->uclk_pstate.init_params.base_display_config = params->display_config;
-
-	return params->dml->pmo_instance.init_for_stutter(&l->stutter.stutter_params);
-}
-
-bool dml2_top_optimization_test_function_stutter(const struct optimization_test_function_params *params)
-{
-	struct dml2_optimization_test_function_locals *l = params->locals;
-
-	l->stutter.stutter_params.instance = &params->dml->pmo_instance;
-	l->stutter.stutter_params.base_display_config = params->display_config;
-	return params->dml->pmo_instance.test_for_stutter(&l->stutter.stutter_params);
-}
-
-bool dml2_top_optimization_optimize_function_stutter(const struct optimization_optimize_function_params *params)
-{
-	struct dml2_optimization_optimize_function_locals *l = params->locals;
-
-	l->stutter.stutter_params.instance = &params->dml->pmo_instance;
-	l->stutter.stutter_params.base_display_config = params->display_config;
-	l->stutter.stutter_params.optimized_display_config = params->optimized_display_config;
-	l->stutter.stutter_params.last_candidate_failed = !params->last_candidate_supported;
-	return params->dml->pmo_instance.optimize_for_stutter(&l->stutter.stutter_params);
-}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h
deleted file mode 100644
index 9f22ab33eab1..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_optimization.h
+++ /dev/null
@@ -1,33 +0,0 @@
-// SPDX-License-Identifier: MIT
-//
-// Copyright 2024 Advanced Micro Devices, Inc.
-
-#ifndef __DML2_TOP_OPTIMIZATION_H__
-#define __DML2_TOP_OPTIMIZATION_H__
-
-#include "dml2_external_lib_deps.h"
-#include "dml2_internal_shared_types.h"
-
-bool dml2_top_optimization_perform_optimization_phase(struct dml2_optimization_phase_locals *l, const struct optimization_phase_params *params);
-bool dml2_top_optimization_perform_optimization_phase_1(struct dml2_optimization_phase_locals *l, const struct optimization_phase_params *params);
-
-bool dml2_top_optimization_init_function_min_clk_for_latency(const struct optimization_init_function_params *params);
-bool dml2_top_optimization_test_function_min_clk_for_latency(const struct optimization_test_function_params *params);
-bool dml2_top_optimization_optimize_function_min_clk_for_latency(const struct optimization_optimize_function_params *params);
-
-bool dml2_top_optimization_test_function_mcache(const struct optimization_test_function_params *params);
-bool dml2_top_optimization_optimize_function_mcache(const struct optimization_optimize_function_params *params);
-
-bool dml2_top_optimization_init_function_uclk_pstate(const struct optimization_init_function_params *params);
-bool dml2_top_optimization_test_function_uclk_pstate(const struct optimization_test_function_params *params);
-bool dml2_top_optimization_optimize_function_uclk_pstate(const struct optimization_optimize_function_params *params);
-
-bool dml2_top_optimization_init_function_vmin(const struct optimization_init_function_params *params);
-bool dml2_top_optimization_test_function_vmin(const struct optimization_test_function_params *params);
-bool dml2_top_optimization_optimize_function_vmin(const struct optimization_optimize_function_params *params);
-
-bool dml2_top_optimization_init_function_stutter(const struct optimization_init_function_params *params);
-bool dml2_top_optimization_test_function_stutter(const struct optimization_test_function_params *params);
-bool dml2_top_optimization_optimize_function_stutter(const struct optimization_optimize_function_params *params);
-
-#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
new file mode 100644
index 000000000000..b39029c0e56f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.c
@@ -0,0 +1,1177 @@
+// SPDX-License-Identifier: MIT
+//
+// Copyright 2024 Advanced Micro Devices, Inc.
+
+#include "dml2_top_soc15.h"
+#include "dml2_mcg_factory.h"
+#include "dml2_dpmm_factory.h"
+#include "dml2_core_factory.h"
+#include "dml2_pmo_factory.h"
+#include "lib_float_math.h"
+#include "dml2_debug.h"
+static void setup_unoptimized_display_config_with_meta(const struct dml2_instance *dml, struct display_configuation_with_meta *out, const struct dml2_display_cfg *display_config)
+{
+	memcpy(&out->display_config, display_config, sizeof(struct dml2_display_cfg));
+	out->stage1.min_clk_index_for_latency = dml->min_clk_table.dram_bw_table.num_entries - 1; //dml->min_clk_table.clean_me_up.soc_bb.num_states - 1;
+}
+
+static void setup_speculative_display_config_with_meta(const struct dml2_instance *dml, struct display_configuation_with_meta *out, const struct dml2_display_cfg *display_config)
+{
+	memcpy(&out->display_config, display_config, sizeof(struct dml2_display_cfg));
+	out->stage1.min_clk_index_for_latency = 0;
+}
+
+static void copy_display_configuration_with_meta(struct display_configuation_with_meta *dst, const struct display_configuation_with_meta *src)
+{
+	memcpy(dst, src, sizeof(struct display_configuation_with_meta));
+}
+
+static bool dml2_top_optimization_init_function_min_clk_for_latency(const struct optimization_init_function_params *params)
+{
+	struct dml2_optimization_stage1_state *state = &params->display_config->stage1;
+
+	state->performed = true;
+
+	return true;
+}
+
+static bool dml2_top_optimization_test_function_min_clk_for_latency(const struct optimization_test_function_params *params)
+{
+	struct dml2_optimization_stage1_state *state = &params->display_config->stage1;
+
+	return state->min_clk_index_for_latency == 0;
+}
+
+static bool dml2_top_optimization_optimize_function_min_clk_for_latency(const struct optimization_optimize_function_params *params)
+{
+	bool result = false;
+
+	if (params->display_config->stage1.min_clk_index_for_latency > 0) {
+		copy_display_configuration_with_meta(params->optimized_display_config, params->display_config);
+		params->optimized_display_config->stage1.min_clk_index_for_latency--;
+		result = true;
+	}
+
+	return result;
+}
+
+static bool dml2_top_optimization_test_function_mcache(const struct optimization_test_function_params *params)
+{
+	struct dml2_optimization_test_function_locals *l = params->locals;
+	bool mcache_success = false;
+	bool result = false;
+
+	memset(l, 0, sizeof(struct dml2_optimization_test_function_locals));
+
+	l->test_mcache.calc_mcache_count_params.dml2_instance = params->dml;
+	l->test_mcache.calc_mcache_count_params.display_config = &params->display_config->display_config;
+	l->test_mcache.calc_mcache_count_params.mcache_allocations = params->display_config->stage2.mcache_allocations;
+
+	result = dml2_top_mcache_calc_mcache_count_and_offsets(&l->test_mcache.calc_mcache_count_params); // use core to get the basic mcache_allocations
+
+	if (result) {
+		l->test_mcache.assign_global_mcache_ids_params.allocations = params->display_config->stage2.mcache_allocations;
+		l->test_mcache.assign_global_mcache_ids_params.num_allocations = params->display_config->display_config.num_planes;
+
+		dml2_top_mcache_assign_global_mcache_ids(&l->test_mcache.assign_global_mcache_ids_params);
+
+		l->test_mcache.validate_admissibility_params.dml2_instance = params->dml;
+		l->test_mcache.validate_admissibility_params.display_cfg = &params->display_config->display_config;
+		l->test_mcache.validate_admissibility_params.mcache_allocations = params->display_config->stage2.mcache_allocations;
+		l->test_mcache.validate_admissibility_params.cfg_support_info = &params->display_config->mode_support_result.cfg_support_info;
+
+		mcache_success = dml2_top_mcache_validate_admissability(&l->test_mcache.validate_admissibility_params); // also find the shift to make mcache allocation works
+
+		memcpy(params->display_config->stage2.per_plane_mcache_support, l->test_mcache.validate_admissibility_params.per_plane_status, sizeof(bool) * DML2_MAX_PLANES);
+	}
+
+	return mcache_success;
+}
+
+static bool dml2_top_optimization_optimize_function_mcache(const struct optimization_optimize_function_params *params)
+{
+	struct dml2_optimization_optimize_function_locals *l = params->locals;
+	bool optimize_success = false;
+
+	if (params->last_candidate_supported == false)
+		return false;
+
+	copy_display_configuration_with_meta(params->optimized_display_config, params->display_config);
+
+	l->optimize_mcache.optimize_mcache_params.instance = &params->dml->pmo_instance;
+	l->optimize_mcache.optimize_mcache_params.dcc_mcache_supported = params->display_config->stage2.per_plane_mcache_support;
+	l->optimize_mcache.optimize_mcache_params.display_config = &params->display_config->display_config;
+	l->optimize_mcache.optimize_mcache_params.optimized_display_cfg = &params->optimized_display_config->display_config;
+	l->optimize_mcache.optimize_mcache_params.cfg_support_info = &params->optimized_display_config->mode_support_result.cfg_support_info;
+
+	optimize_success = params->dml->pmo_instance.optimize_dcc_mcache(&l->optimize_mcache.optimize_mcache_params);
+
+	return optimize_success;
+}
+
+static bool dml2_top_optimization_init_function_vmin(const struct optimization_init_function_params *params)
+{
+	struct dml2_optimization_init_function_locals *l = params->locals;
+
+	l->vmin.init_params.instance = &params->dml->pmo_instance;
+	l->vmin.init_params.base_display_config = params->display_config;
+	return params->dml->pmo_instance.init_for_vmin(&l->vmin.init_params);
+}
+
+static bool dml2_top_optimization_test_function_vmin(const struct optimization_test_function_params *params)
+{
+	struct dml2_optimization_test_function_locals *l = params->locals;
+
+	l->test_vmin.pmo_test_vmin_params.instance = &params->dml->pmo_instance;
+	l->test_vmin.pmo_test_vmin_params.display_config = params->display_config;
+	l->test_vmin.pmo_test_vmin_params.vmin_limits = &params->dml->soc_bbox.vmin_limit;
+	return params->dml->pmo_instance.test_for_vmin(&l->test_vmin.pmo_test_vmin_params);
+}
+
+static bool dml2_top_optimization_optimize_function_vmin(const struct optimization_optimize_function_params *params)
+{
+	struct dml2_optimization_optimize_function_locals *l = params->locals;
+
+	if (params->last_candidate_supported == false)
+		return false;
+
+	l->optimize_vmin.pmo_optimize_vmin_params.instance = &params->dml->pmo_instance;
+	l->optimize_vmin.pmo_optimize_vmin_params.base_display_config = params->display_config;
+	l->optimize_vmin.pmo_optimize_vmin_params.optimized_display_config = params->optimized_display_config;
+	return params->dml->pmo_instance.optimize_for_vmin(&l->optimize_vmin.pmo_optimize_vmin_params);
+}
+
+static bool dml2_top_optimization_init_function_uclk_pstate(const struct optimization_init_function_params *params)
+{
+	struct dml2_optimization_init_function_locals *l = params->locals;
+
+	l->uclk_pstate.init_params.instance = &params->dml->pmo_instance;
+	l->uclk_pstate.init_params.base_display_config = params->display_config;
+
+	return params->dml->pmo_instance.init_for_uclk_pstate(&l->uclk_pstate.init_params);
+}
+
+static bool dml2_top_optimization_test_function_uclk_pstate(const struct optimization_test_function_params *params)
+{
+	struct dml2_optimization_test_function_locals *l = params->locals;
+
+	l->uclk_pstate.test_params.instance = &params->dml->pmo_instance;
+	l->uclk_pstate.test_params.base_display_config = params->display_config;
+
+	return params->dml->pmo_instance.test_for_uclk_pstate(&l->uclk_pstate.test_params);
+}
+
+static bool dml2_top_optimization_optimize_function_uclk_pstate(const struct optimization_optimize_function_params *params)
+{
+	struct dml2_optimization_optimize_function_locals *l = params->locals;
+
+	l->uclk_pstate.optimize_params.instance = &params->dml->pmo_instance;
+	l->uclk_pstate.optimize_params.base_display_config = params->display_config;
+	l->uclk_pstate.optimize_params.optimized_display_config = params->optimized_display_config;
+	l->uclk_pstate.optimize_params.last_candidate_failed = !params->last_candidate_supported;
+
+	return params->dml->pmo_instance.optimize_for_uclk_pstate(&l->uclk_pstate.optimize_params);
+}
+
+static bool dml2_top_optimization_init_function_stutter(const struct optimization_init_function_params *params)
+{
+	struct dml2_optimization_init_function_locals *l = params->locals;
+
+	l->uclk_pstate.init_params.instance = &params->dml->pmo_instance;
+	l->uclk_pstate.init_params.base_display_config = params->display_config;
+
+	return params->dml->pmo_instance.init_for_stutter(&l->stutter.stutter_params);
+}
+
+static bool dml2_top_optimization_test_function_stutter(const struct optimization_test_function_params *params)
+{
+	struct dml2_optimization_test_function_locals *l = params->locals;
+
+	l->stutter.stutter_params.instance = &params->dml->pmo_instance;
+	l->stutter.stutter_params.base_display_config = params->display_config;
+	return params->dml->pmo_instance.test_for_stutter(&l->stutter.stutter_params);
+}
+
+static bool dml2_top_optimization_optimize_function_stutter(const struct optimization_optimize_function_params *params)
+{
+	struct dml2_optimization_optimize_function_locals *l = params->locals;
+
+	l->stutter.stutter_params.instance = &params->dml->pmo_instance;
+	l->stutter.stutter_params.base_display_config = params->display_config;
+	l->stutter.stutter_params.optimized_display_config = params->optimized_display_config;
+	l->stutter.stutter_params.last_candidate_failed = !params->last_candidate_supported;
+	return params->dml->pmo_instance.optimize_for_stutter(&l->stutter.stutter_params);
+}
+
+static bool dml2_top_optimization_perform_optimization_phase(struct dml2_optimization_phase_locals *l, const struct optimization_phase_params *params)
+{
+	bool test_passed = false;
+	bool optimize_succeeded = true;
+	bool candidate_validation_passed = true;
+	struct optimization_init_function_params init_params = { 0 };
+	struct optimization_test_function_params test_params = { 0 };
+	struct optimization_optimize_function_params optimize_params = { 0 };
+
+	if (!params->dml ||
+		!params->optimize_function ||
+		!params->test_function ||
+		!params->display_config ||
+		!params->optimized_display_config)
+		return false;
+
+	copy_display_configuration_with_meta(&l->cur_candidate_display_cfg, params->display_config);
+
+	init_params.locals = &l->init_function_locals;
+	init_params.dml = params->dml;
+	init_params.display_config = &l->cur_candidate_display_cfg;
+
+	if (params->init_function && !params->init_function(&init_params))
+		return false;
+
+	test_params.locals = &l->test_function_locals;
+	test_params.dml = params->dml;
+	test_params.display_config = &l->cur_candidate_display_cfg;
+
+	test_passed = params->test_function(&test_params);
+
+	while (!test_passed && optimize_succeeded) {
+		memset(&optimize_params, 0, sizeof(struct optimization_optimize_function_params));
+
+		optimize_params.locals = &l->optimize_function_locals;
+		optimize_params.dml = params->dml;
+		optimize_params.display_config = &l->cur_candidate_display_cfg;
+		optimize_params.optimized_display_config = &l->next_candidate_display_cfg;
+		optimize_params.last_candidate_supported = candidate_validation_passed;
+
+		optimize_succeeded = params->optimize_function(&optimize_params);
+
+		if (optimize_succeeded) {
+			l->mode_support_params.instance = &params->dml->core_instance;
+			l->mode_support_params.display_cfg = &l->next_candidate_display_cfg;
+			l->mode_support_params.min_clk_table = &params->dml->min_clk_table;
+
+			if (l->next_candidate_display_cfg.stage3.performed)
+				l->mode_support_params.min_clk_index = l->next_candidate_display_cfg.stage3.min_clk_index_for_latency;
+			else
+				l->mode_support_params.min_clk_index = l->next_candidate_display_cfg.stage1.min_clk_index_for_latency;
+			candidate_validation_passed = params->dml->core_instance.mode_support(&l->mode_support_params);
+			l->next_candidate_display_cfg.mode_support_result = l->mode_support_params.mode_support_result;
+		}
+
+		if (optimize_succeeded && candidate_validation_passed) {
+			memset(&test_params, 0, sizeof(struct optimization_test_function_params));
+			test_params.locals = &l->test_function_locals;
+			test_params.dml = params->dml;
+			test_params.display_config = &l->next_candidate_display_cfg;
+			test_passed = params->test_function(&test_params);
+
+			copy_display_configuration_with_meta(&l->cur_candidate_display_cfg, &l->next_candidate_display_cfg);
+
+			// If optimization is not all or nothing, then store partial progress in output
+			if (!params->all_or_nothing)
+				copy_display_configuration_with_meta(params->optimized_display_config, &l->next_candidate_display_cfg);
+		}
+	}
+
+	if (test_passed)
+		copy_display_configuration_with_meta(params->optimized_display_config, &l->cur_candidate_display_cfg);
+
+	return test_passed;
+}
+
+static bool dml2_top_optimization_perform_optimization_phase_1(struct dml2_optimization_phase_locals *l, const struct optimization_phase_params *params)
+{
+	int highest_state, lowest_state, cur_state;
+	bool supported = false;
+
+	if (!params->dml ||
+		!params->optimize_function ||
+		!params->test_function ||
+		!params->display_config ||
+		!params->optimized_display_config)
+		return false;
+
+	copy_display_configuration_with_meta(&l->cur_candidate_display_cfg, params->display_config);
+	highest_state = l->cur_candidate_display_cfg.stage1.min_clk_index_for_latency;
+	lowest_state = 0;
+
+	while (highest_state > lowest_state) {
+		cur_state = (highest_state + lowest_state) / 2;
+
+		l->mode_support_params.instance = &params->dml->core_instance;
+		l->mode_support_params.display_cfg = &l->cur_candidate_display_cfg;
+		l->mode_support_params.min_clk_table = &params->dml->min_clk_table;
+		l->mode_support_params.min_clk_index = cur_state;
+		supported = params->dml->core_instance.mode_support(&l->mode_support_params);
+
+		if (supported) {
+			l->cur_candidate_display_cfg.mode_support_result = l->mode_support_params.mode_support_result;
+			highest_state = cur_state;
+		} else {
+			lowest_state = cur_state + 1;
+		}
+	}
+	l->cur_candidate_display_cfg.stage1.min_clk_index_for_latency = lowest_state;
+
+	copy_display_configuration_with_meta(params->optimized_display_config, &l->cur_candidate_display_cfg);
+
+	return true;
+}
+
+/*
+* Takes an input set of mcache boundaries and finds the appropriate setting of cache programming.
+* Returns true if a valid set of programming can be made, and false otherwise. "Valid" means
+* that the horizontal viewport does not span more than 2 cache slices.
+*
+* It optionally also can apply a constant shift to all the cache boundaries.
+*/
+static const uint32_t MCACHE_ID_UNASSIGNED = 0xF;
+static const uint32_t SPLIT_LOCATION_UNDEFINED = 0xFFFF;
+
+static bool calculate_first_second_splitting(const int *mcache_boundaries, int num_boundaries, int shift,
+	int pipe_h_vp_start, int pipe_h_vp_end, int *first_offset, int *second_offset)
+{
+	const int MAX_VP = 0xFFFFFF;
+	int left_cache_id;
+	int right_cache_id;
+	int range_start;
+	int range_end;
+	bool success = false;
+
+	if (num_boundaries <= 1) {
+		if (first_offset && second_offset) {
+			*first_offset = 0;
+			*second_offset = -1;
+		}
+		success = true;
+		return success;
+	} else {
+		range_start = 0;
+		for (left_cache_id = 0; left_cache_id < num_boundaries; left_cache_id++) {
+			range_end = mcache_boundaries[left_cache_id] - shift - 1;
+
+			if (range_start <= pipe_h_vp_start && pipe_h_vp_start <= range_end)
+				break;
+
+			range_start = range_end + 1;
+		}
+
+		range_end = MAX_VP;
+		for (right_cache_id = num_boundaries - 1; right_cache_id >= -1; right_cache_id--) {
+			if (right_cache_id >= 0)
+				range_start = mcache_boundaries[right_cache_id] - shift;
+			else
+				range_start = 0;
+
+			if (range_start <= pipe_h_vp_end && pipe_h_vp_end <= range_end) {
+				break;
+			}
+			range_end = range_start - 1;
+		}
+		right_cache_id = (right_cache_id + 1) % num_boundaries;
+
+		if (right_cache_id == left_cache_id) {
+			if (first_offset && second_offset) {
+				*first_offset = left_cache_id;
+				*second_offset = -1;
+			}
+			success = true;
+		} else if (right_cache_id == (left_cache_id + 1) % num_boundaries) {
+			if (first_offset && second_offset) {
+				*first_offset = left_cache_id;
+				*second_offset = right_cache_id;
+			}
+			success = true;
+		}
+	}
+
+	return success;
+}
+
+/*
+* For a given set of pipe start/end x positions, checks to see it can support the input mcache splitting.
+* It also attempts to "optimize" by finding a shift if the default 0 shift does not work.
+*/
+static bool find_shift_for_valid_cache_id_assignment(int *mcache_boundaries, unsigned int num_boundaries,
+	int *pipe_vp_startx, int *pipe_vp_endx, unsigned int pipe_count, int shift_granularity, int *shift)
+{
+	int max_shift = 0xFFFF;
+	unsigned int pipe_index;
+	unsigned int i, slice_width;
+	bool success = false;
+
+	for (i = 0; i < num_boundaries; i++) {
+		if (i == 0)
+			slice_width = mcache_boundaries[i];
+		else
+			slice_width = mcache_boundaries[i] - mcache_boundaries[i - 1];
+
+		if (max_shift > (int)slice_width) {
+			max_shift = slice_width;
+		}
+	}
+
+	for (*shift = 0; *shift <= max_shift; *shift += shift_granularity) {
+		success = true;
+		for (pipe_index = 0; pipe_index < pipe_count; pipe_index++) {
+			if (!calculate_first_second_splitting(mcache_boundaries, num_boundaries, *shift,
+				pipe_vp_startx[pipe_index], pipe_vp_endx[pipe_index], 0, 0)) {
+				success = false;
+				break;
+			}
+		}
+		if (success)
+			break;
+	}
+
+	return success;
+}
+
+/*
+* Counts the number of elements inside input array within the given span length.
+* Formally, what is the size of the largest subset of the array where the largest and smallest element
+* differ no more than the span.
+*/
+static unsigned int count_elements_in_span(int *array, unsigned int array_size, unsigned int span)
+{
+	unsigned int i;
+	unsigned int span_start_value;
+	unsigned int span_start_index;
+	unsigned int greatest_element_count;
+
+	if (array_size == 0)
+		return 1;
+
+	if (span == 0)
+		return array_size > 0 ? 1 : 0;
+
+	span_start_value = 0;
+	span_start_index = 0;
+	greatest_element_count = 0;
+
+	while (span_start_index < array_size) {
+		for (i = span_start_index; i < array_size; i++) {
+			if (array[i] - span_start_value <= span) {
+				if (i - span_start_index + 1 > greatest_element_count) {
+					greatest_element_count = i - span_start_index + 1;
+				}
+			} else
+				break;
+		}
+
+		span_start_index++;
+
+		if (span_start_index < array_size) {
+			span_start_value = array[span_start_index - 1] + 1;
+		}
+	}
+
+	return greatest_element_count;
+}
+
+static bool calculate_h_split_for_scaling_transform(int full_vp_width, int h_active, int num_pipes,
+	enum dml2_scaling_transform scaling_transform, int *pipe_vp_x_start, int *pipe_vp_x_end)
+{
+	int i, slice_width;
+	const char MAX_SCL_VP_OVERLAP = 3;
+	bool success = false;
+
+	switch (scaling_transform) {
+	case dml2_scaling_transform_centered:
+	case dml2_scaling_transform_aspect_ratio:
+	case dml2_scaling_transform_fullscreen:
+		slice_width = full_vp_width / num_pipes;
+		for (i = 0; i < num_pipes; i++) {
+			pipe_vp_x_start[i] = i * slice_width;
+			pipe_vp_x_end[i] = (i + 1) * slice_width - 1;
+
+			if (pipe_vp_x_start[i] < MAX_SCL_VP_OVERLAP)
+				pipe_vp_x_start[i] = 0;
+			else
+				pipe_vp_x_start[i] -= MAX_SCL_VP_OVERLAP;
+
+			if (pipe_vp_x_end[i] > full_vp_width - MAX_SCL_VP_OVERLAP - 1)
+				pipe_vp_x_end[i] = full_vp_width - 1;
+			else
+				pipe_vp_x_end[i] += MAX_SCL_VP_OVERLAP;
+		}
+		break;
+	case dml2_scaling_transform_explicit:
+	default:
+		success = false;
+		break;
+	}
+
+	return success;
+}
+
+bool dml2_top_mcache_validate_admissability(struct top_mcache_validate_admissability_in_out *params)
+{
+	struct dml2_instance *dml = (struct dml2_instance *)params->dml2_instance;
+	struct dml2_top_mcache_validate_admissability_locals *l = &dml->scratch.mcache_validate_admissability_locals;
+
+	const int MAX_PIXEL_OVERLAP = 6;
+	int max_per_pipe_vp_p0 = 0;
+	int max_per_pipe_vp_p1 = 0;
+	int temp, p0shift, p1shift;
+	unsigned int plane_index = 0;
+	unsigned int i;
+	unsigned int odm_combine_factor;
+	unsigned int mpc_combine_factor;
+	unsigned int num_dpps;
+	unsigned int num_boundaries;
+	enum dml2_scaling_transform scaling_transform;
+	const struct dml2_plane_parameters *plane;
+	const struct dml2_stream_parameters *stream;
+
+	bool p0pass = false;
+	bool p1pass = false;
+	bool all_pass = true;
+
+	for (plane_index = 0; plane_index < params->display_cfg->num_planes; plane_index++) {
+		if (!params->display_cfg->plane_descriptors[plane_index].surface.dcc.enable)
+			continue;
+
+		plane = &params->display_cfg->plane_descriptors[plane_index];
+		stream = &params->display_cfg->stream_descriptors[plane->stream_index];
+
+		num_dpps = odm_combine_factor = params->cfg_support_info->stream_support_info[plane->stream_index].odms_used;
+
+		if (odm_combine_factor == 1)
+			num_dpps = mpc_combine_factor = (unsigned int)params->cfg_support_info->plane_support_info[plane_index].dpps_used;
+		else
+			mpc_combine_factor = 1;
+
+		if (odm_combine_factor > 1) {
+			max_per_pipe_vp_p0 = plane->surface.plane0.width;
+			temp = (unsigned int)math_ceil(plane->composition.scaler_info.plane0.h_ratio * stream->timing.h_active / odm_combine_factor);
+			if (temp < max_per_pipe_vp_p0)
+				max_per_pipe_vp_p0 = temp;
+
+			max_per_pipe_vp_p1 = plane->surface.plane1.width;
+			temp = (unsigned int)math_ceil(plane->composition.scaler_info.plane1.h_ratio * stream->timing.h_active / odm_combine_factor);
+
+			if (temp < max_per_pipe_vp_p1)
+				max_per_pipe_vp_p1 = temp;
+		} else {
+			max_per_pipe_vp_p0 = plane->surface.plane0.width / mpc_combine_factor;
+			max_per_pipe_vp_p1 = plane->surface.plane1.width / mpc_combine_factor;
+		}
+
+		max_per_pipe_vp_p0 += 2 * MAX_PIXEL_OVERLAP;
+		max_per_pipe_vp_p1 += MAX_PIXEL_OVERLAP;
+
+		p0shift = 0;
+		p1shift = 0;
+
+		// The last element in the unshifted boundary array will always be the first pixel outside the
+		// plane, which means theres no mcache associated with it, so -1
+		num_boundaries = params->mcache_allocations[plane_index].num_mcaches_plane0 == 0 ? 0 : params->mcache_allocations[plane_index].num_mcaches_plane0 - 1;
+		if ((count_elements_in_span(params->mcache_allocations[plane_index].mcache_x_offsets_plane0,
+			num_boundaries, max_per_pipe_vp_p0) <= 1) && (num_boundaries <= num_dpps)) {
+			p0pass = true;
+		}
+		num_boundaries = params->mcache_allocations[plane_index].num_mcaches_plane1 == 0 ? 0 : params->mcache_allocations[plane_index].num_mcaches_plane1 - 1;
+		if ((count_elements_in_span(params->mcache_allocations[plane_index].mcache_x_offsets_plane1,
+			num_boundaries, max_per_pipe_vp_p1) <= 1) && (num_boundaries <= num_dpps)) {
+			p1pass = true;
+		}
+
+		if (!p0pass || !p1pass) {
+			if (odm_combine_factor > 1) {
+				num_dpps = odm_combine_factor;
+				scaling_transform = plane->composition.scaling_transform;
+			} else {
+				num_dpps = mpc_combine_factor;
+				scaling_transform = dml2_scaling_transform_fullscreen;
+			}
+
+			if (!p0pass) {
+				if (plane->composition.viewport.stationary) {
+					calculate_h_split_for_scaling_transform(plane->surface.plane0.width,
+						stream->timing.h_active, num_dpps, scaling_transform,
+						&l->plane0.pipe_vp_startx[plane_index], &l->plane0.pipe_vp_endx[plane_index]);
+					p0pass = find_shift_for_valid_cache_id_assignment(params->mcache_allocations[plane_index].mcache_x_offsets_plane0,
+						params->mcache_allocations[plane_index].num_mcaches_plane0,
+						&l->plane0.pipe_vp_startx[plane_index], &l->plane0.pipe_vp_endx[plane_index], num_dpps,
+						params->mcache_allocations[plane_index].shift_granularity.p0, &p0shift);
+				}
+			}
+			if (!p1pass) {
+				if (plane->composition.viewport.stationary) {
+					calculate_h_split_for_scaling_transform(plane->surface.plane1.width,
+						stream->timing.h_active, num_dpps, scaling_transform,
+						&l->plane0.pipe_vp_startx[plane_index], &l->plane0.pipe_vp_endx[plane_index]);
+					p1pass = find_shift_for_valid_cache_id_assignment(params->mcache_allocations[plane_index].mcache_x_offsets_plane1,
+						params->mcache_allocations[plane_index].num_mcaches_plane1,
+						&l->plane1.pipe_vp_startx[plane_index], &l->plane1.pipe_vp_endx[plane_index], num_dpps,
+						params->mcache_allocations[plane_index].shift_granularity.p1, &p1shift);
+				}
+			}
+		}
+
+		if (p0pass && p1pass) {
+			for (i = 0; i < params->mcache_allocations[plane_index].num_mcaches_plane0; i++) {
+				params->mcache_allocations[plane_index].mcache_x_offsets_plane0[i] -= p0shift;
+			}
+			for (i = 0; i < params->mcache_allocations[plane_index].num_mcaches_plane1; i++) {
+				params->mcache_allocations[plane_index].mcache_x_offsets_plane1[i] -= p1shift;
+			}
+		}
+
+		params->per_plane_status[plane_index] = p0pass && p1pass;
+		all_pass &= p0pass && p1pass;
+	}
+
+	return all_pass;
+}
+
+static void reset_mcache_allocations(struct dml2_hubp_pipe_mcache_regs *per_plane_pipe_mcache_regs)
+{
+	// Initialize all entries to special valid MCache ID and special valid split coordinate
+	per_plane_pipe_mcache_regs->main.p0.mcache_id_first = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->main.p0.mcache_id_second = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->main.p0.split_location = SPLIT_LOCATION_UNDEFINED;
+
+	per_plane_pipe_mcache_regs->mall.p0.mcache_id_first = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->mall.p0.mcache_id_second = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->mall.p0.split_location = SPLIT_LOCATION_UNDEFINED;
+
+	per_plane_pipe_mcache_regs->main.p1.mcache_id_first = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->main.p1.mcache_id_second = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->main.p1.split_location = SPLIT_LOCATION_UNDEFINED;
+
+	per_plane_pipe_mcache_regs->mall.p1.mcache_id_first = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->mall.p1.mcache_id_second = MCACHE_ID_UNASSIGNED;
+	per_plane_pipe_mcache_regs->mall.p1.split_location = SPLIT_LOCATION_UNDEFINED;
+}
+
+void dml2_top_mcache_assign_global_mcache_ids(struct top_mcache_assign_global_mcache_ids_in_out *params)
+{
+	int i;
+	unsigned int j;
+	int next_unused_cache_id = 0;
+
+	for (i = 0; i < params->num_allocations; i++) {
+		if (!params->allocations[i].valid)
+			continue;
+
+		for (j = 0; j < params->allocations[i].num_mcaches_plane0; j++) {
+			params->allocations[i].global_mcache_ids_plane0[j] = next_unused_cache_id++;
+		}
+		for (j = 0; j < params->allocations[i].num_mcaches_plane1; j++) {
+			params->allocations[i].global_mcache_ids_plane1[j] = next_unused_cache_id++;
+		}
+
+		// The "psuedo-last" slice is always wrapped around
+		params->allocations[i].global_mcache_ids_plane0[params->allocations[i].num_mcaches_plane0] =
+			params->allocations[i].global_mcache_ids_plane0[0];
+		params->allocations[i].global_mcache_ids_plane1[params->allocations[i].num_mcaches_plane1] =
+			params->allocations[i].global_mcache_ids_plane1[0];
+
+		// If we need dedicated caches for mall requesting, then we assign them here.
+		if (params->allocations[i].requires_dedicated_mall_mcache) {
+			for (j = 0; j < params->allocations[i].num_mcaches_plane0; j++) {
+				params->allocations[i].global_mcache_ids_mall_plane0[j] = next_unused_cache_id++;
+			}
+			for (j = 0; j < params->allocations[i].num_mcaches_plane1; j++) {
+				params->allocations[i].global_mcache_ids_mall_plane1[j] = next_unused_cache_id++;
+			}
+
+			// The "psuedo-last" slice is always wrapped around
+			params->allocations[i].global_mcache_ids_mall_plane0[params->allocations[i].num_mcaches_plane0] =
+				params->allocations[i].global_mcache_ids_mall_plane0[0];
+			params->allocations[i].global_mcache_ids_mall_plane1[params->allocations[i].num_mcaches_plane1] =
+				params->allocations[i].global_mcache_ids_mall_plane1[0];
+		}
+
+		// If P0 and P1 are sharing caches, then it means the largest mcache IDs for p0 and p1 can be the same
+		// since mcache IDs are always ascending, then it means the largest mcacheID of p1 should be the
+		// largest mcacheID of P0
+		if (params->allocations[i].num_mcaches_plane0 > 0 && params->allocations[i].num_mcaches_plane1 > 0 &&
+			params->allocations[i].last_slice_sharing.plane0_plane1) {
+			params->allocations[i].global_mcache_ids_plane1[params->allocations[i].num_mcaches_plane1 - 1] =
+				params->allocations[i].global_mcache_ids_plane0[params->allocations[i].num_mcaches_plane0 - 1];
+		}
+
+		// If we need dedicated caches handle last slice sharing
+		if (params->allocations[i].requires_dedicated_mall_mcache) {
+			if (params->allocations[i].num_mcaches_plane0 > 0 && params->allocations[i].num_mcaches_plane1 > 0 &&
+				params->allocations[i].last_slice_sharing.plane0_plane1) {
+				params->allocations[i].global_mcache_ids_mall_plane1[params->allocations[i].num_mcaches_plane1 - 1] =
+					params->allocations[i].global_mcache_ids_mall_plane0[params->allocations[i].num_mcaches_plane0 - 1];
+			}
+			// If mall_comb_mcache_l is set then it means that largest mcache ID for MALL p0 can be same as regular read p0
+			if (params->allocations[i].num_mcaches_plane0 > 0 && params->allocations[i].last_slice_sharing.mall_comb_mcache_p0) {
+				params->allocations[i].global_mcache_ids_mall_plane0[params->allocations[i].num_mcaches_plane0 - 1] =
+					params->allocations[i].global_mcache_ids_plane0[params->allocations[i].num_mcaches_plane0 - 1];
+			}
+			// If mall_comb_mcache_c is set then it means that largest mcache ID for MALL p1 can be same as regular
+			// read p1 (which can be same as regular read p0 if plane0_plane1 is also set)
+			if (params->allocations[i].num_mcaches_plane1 > 0 && params->allocations[i].last_slice_sharing.mall_comb_mcache_p1) {
+				params->allocations[i].global_mcache_ids_mall_plane1[params->allocations[i].num_mcaches_plane1 - 1] =
+					params->allocations[i].global_mcache_ids_plane1[params->allocations[i].num_mcaches_plane1 - 1];
+			}
+		}
+
+		// If you don't need dedicated mall mcaches, the mall mcache assignments are identical to the normal requesting
+		if (!params->allocations[i].requires_dedicated_mall_mcache) {
+			memcpy(params->allocations[i].global_mcache_ids_mall_plane0, params->allocations[i].global_mcache_ids_plane0,
+				sizeof(params->allocations[i].global_mcache_ids_mall_plane0));
+			memcpy(params->allocations[i].global_mcache_ids_mall_plane1, params->allocations[i].global_mcache_ids_plane1,
+				sizeof(params->allocations[i].global_mcache_ids_mall_plane1));
+		}
+	}
+}
+
+bool dml2_top_mcache_calc_mcache_count_and_offsets(struct top_mcache_calc_mcache_count_and_offsets_in_out *params)
+{
+	struct dml2_instance *dml = (struct dml2_instance *)params->dml2_instance;
+	struct dml2_top_mcache_verify_mcache_size_locals *l = &dml->scratch.mcache_verify_mcache_size_locals;
+
+	unsigned int total_mcaches_required;
+	unsigned int i;
+	bool result = false;
+
+	if (dml->soc_bbox.num_dcc_mcaches == 0) {
+		return true;
+	}
+
+	total_mcaches_required = 0;
+	l->calc_mcache_params.instance = &dml->core_instance;
+	for (i = 0; i < params->display_config->num_planes; i++) {
+		if (!params->display_config->plane_descriptors[i].surface.dcc.enable) {
+			memset(&params->mcache_allocations[i], 0, sizeof(struct dml2_mcache_surface_allocation));
+			continue;
+		}
+
+		l->calc_mcache_params.plane_descriptor = &params->display_config->plane_descriptors[i];
+		l->calc_mcache_params.mcache_allocation = &params->mcache_allocations[i];
+		l->calc_mcache_params.plane_index = i;
+
+		if (!dml->core_instance.calculate_mcache_allocation(&l->calc_mcache_params)) {
+			result = false;
+			break;
+		}
+
+		if (params->mcache_allocations[i].valid) {
+			total_mcaches_required += params->mcache_allocations[i].num_mcaches_plane0 + params->mcache_allocations[i].num_mcaches_plane1;
+			if (params->mcache_allocations[i].last_slice_sharing.plane0_plane1)
+				total_mcaches_required--;
+		}
+	}
+	dml2_printf("DML_CORE_DCN3::%s: plane_%d, total_mcaches_required=%d\n", __func__, i, total_mcaches_required);
+
+	if (total_mcaches_required > dml->soc_bbox.num_dcc_mcaches) {
+		result = false;
+	} else {
+		result = true;
+	}
+
+	return result;
+}
+
+static bool dml2_top_soc15_check_mode_supported(struct dml2_check_mode_supported_in_out *in_out)
+{
+	struct dml2_instance *dml = (struct dml2_instance *)in_out->dml2_instance;
+	struct dml2_check_mode_supported_locals *l = &dml->scratch.check_mode_supported_locals;
+	struct dml2_display_cfg_programming *dpmm_programming = &dml->dpmm_instance.dpmm_scratch.programming;
+
+	bool result = false;
+	bool mcache_success = false;
+	memset(dpmm_programming, 0, sizeof(struct dml2_display_cfg_programming));
+
+	setup_unoptimized_display_config_with_meta(dml, &l->base_display_config_with_meta, in_out->display_config);
+
+	l->mode_support_params.instance = &dml->core_instance;
+	l->mode_support_params.display_cfg = &l->base_display_config_with_meta;
+	l->mode_support_params.min_clk_table = &dml->min_clk_table;
+	l->mode_support_params.min_clk_index = l->base_display_config_with_meta.stage1.min_clk_index_for_latency;
+	result = dml->core_instance.mode_support(&l->mode_support_params);
+	l->base_display_config_with_meta.mode_support_result = l->mode_support_params.mode_support_result;
+
+	if (result) {
+		struct optimization_phase_params mcache_phase =	{
+		.dml = dml,
+		.display_config = &l->base_display_config_with_meta,
+		.test_function = dml2_top_optimization_test_function_mcache,
+		.optimize_function = dml2_top_optimization_optimize_function_mcache,
+		.optimized_display_config = &l->optimized_display_config_with_meta,
+		.all_or_nothing = false,
+		};
+		mcache_success = dml2_top_optimization_perform_optimization_phase(&l->optimization_phase_locals, &mcache_phase);
+	}
+
+	/*
+	* Call DPMM to map all requirements to minimum clock state
+	*/
+	if (result) {
+		l->dppm_map_mode_params.min_clk_table = &dml->min_clk_table;
+		l->dppm_map_mode_params.display_cfg = &l->base_display_config_with_meta;
+		l->dppm_map_mode_params.programming = dpmm_programming;
+		l->dppm_map_mode_params.soc_bb = &dml->soc_bbox;
+		l->dppm_map_mode_params.ip = &dml->core_instance.clean_me_up.mode_lib.ip;
+		result = dml->dpmm_instance.map_mode_to_soc_dpm(&l->dppm_map_mode_params);
+	}
+
+	in_out->is_supported = mcache_success;
+	result = result && in_out->is_supported;
+
+	return result;
+}
+
+static bool dml2_top_soc15_build_mode_programming(struct dml2_build_mode_programming_in_out *in_out)
+{
+	struct dml2_instance *dml = (struct dml2_instance *)in_out->dml2_instance;
+	struct dml2_build_mode_programming_locals *l = &dml->scratch.build_mode_programming_locals;
+
+	bool result = false;
+	bool mcache_success = false;
+	bool uclk_pstate_success = false;
+	bool vmin_success = false;
+	bool stutter_success = false;
+	unsigned int i;
+
+	memset(l, 0, sizeof(struct dml2_build_mode_programming_locals));
+	memset(in_out->programming, 0, sizeof(struct dml2_display_cfg_programming));
+
+	memcpy(&in_out->programming->display_config, in_out->display_config, sizeof(struct dml2_display_cfg));
+
+	setup_speculative_display_config_with_meta(dml, &l->base_display_config_with_meta, in_out->display_config);
+
+	l->mode_support_params.instance = &dml->core_instance;
+	l->mode_support_params.display_cfg = &l->base_display_config_with_meta;
+	l->mode_support_params.min_clk_table = &dml->min_clk_table;
+	l->mode_support_params.min_clk_index = l->base_display_config_with_meta.stage1.min_clk_index_for_latency;
+	result = dml->core_instance.mode_support(&l->mode_support_params);
+
+	l->base_display_config_with_meta.mode_support_result = l->mode_support_params.mode_support_result;
+
+	if (!result) {
+		setup_unoptimized_display_config_with_meta(dml, &l->base_display_config_with_meta, in_out->display_config);
+
+		l->mode_support_params.instance = &dml->core_instance;
+		l->mode_support_params.display_cfg = &l->base_display_config_with_meta;
+		l->mode_support_params.min_clk_table = &dml->min_clk_table;
+		l->mode_support_params.min_clk_index = l->base_display_config_with_meta.stage1.min_clk_index_for_latency;
+		result = dml->core_instance.mode_support(&l->mode_support_params);
+		l->base_display_config_with_meta.mode_support_result = l->mode_support_params.mode_support_result;
+
+		if (!result) {
+			l->informative_params.instance = &dml->core_instance;
+			l->informative_params.programming = in_out->programming;
+			l->informative_params.mode_is_supported = false;
+			dml->core_instance.populate_informative(&l->informative_params);
+
+			return false;
+		}
+
+		/*
+		* Phase 1: Determine minimum clocks to satisfy latency requirements for this mode
+		*/
+		memset(&l->min_clock_for_latency_phase, 0, sizeof(struct optimization_phase_params));
+		l->min_clock_for_latency_phase.dml = dml;
+		l->min_clock_for_latency_phase.display_config = &l->base_display_config_with_meta;
+		l->min_clock_for_latency_phase.init_function = dml2_top_optimization_init_function_min_clk_for_latency;
+		l->min_clock_for_latency_phase.test_function = dml2_top_optimization_test_function_min_clk_for_latency;
+		l->min_clock_for_latency_phase.optimize_function = dml2_top_optimization_optimize_function_min_clk_for_latency;
+		l->min_clock_for_latency_phase.optimized_display_config = &l->optimized_display_config_with_meta;
+		l->min_clock_for_latency_phase.all_or_nothing = false;
+
+		dml2_top_optimization_perform_optimization_phase_1(&l->optimization_phase_locals, &l->min_clock_for_latency_phase);
+
+		memcpy(&l->base_display_config_with_meta, &l->optimized_display_config_with_meta, sizeof(struct display_configuation_with_meta));
+	}
+
+	/*
+	* Phase 2: Satisfy DCC mcache requirements
+	*/
+	memset(&l->mcache_phase, 0, sizeof(struct optimization_phase_params));
+	l->mcache_phase.dml = dml;
+	l->mcache_phase.display_config = &l->base_display_config_with_meta;
+	l->mcache_phase.test_function = dml2_top_optimization_test_function_mcache;
+	l->mcache_phase.optimize_function = dml2_top_optimization_optimize_function_mcache;
+	l->mcache_phase.optimized_display_config = &l->optimized_display_config_with_meta;
+	l->mcache_phase.all_or_nothing = true;
+
+	mcache_success = dml2_top_optimization_perform_optimization_phase(&l->optimization_phase_locals, &l->mcache_phase);
+
+	if (!mcache_success) {
+		l->informative_params.instance = &dml->core_instance;
+		l->informative_params.programming = in_out->programming;
+		l->informative_params.mode_is_supported = false;
+
+		dml->core_instance.populate_informative(&l->informative_params);
+
+		in_out->programming->informative.failed_mcache_validation = true;
+		return false;
+	}
+
+	memcpy(&l->base_display_config_with_meta, &l->optimized_display_config_with_meta, sizeof(struct display_configuation_with_meta));
+
+	/*
+	* Phase 3: Optimize for Pstate
+	*/
+	memset(&l->uclk_pstate_phase, 0, sizeof(struct optimization_phase_params));
+	l->uclk_pstate_phase.dml = dml;
+	l->uclk_pstate_phase.display_config = &l->base_display_config_with_meta;
+	l->uclk_pstate_phase.init_function = dml2_top_optimization_init_function_uclk_pstate;
+	l->uclk_pstate_phase.test_function = dml2_top_optimization_test_function_uclk_pstate;
+	l->uclk_pstate_phase.optimize_function = dml2_top_optimization_optimize_function_uclk_pstate;
+	l->uclk_pstate_phase.optimized_display_config = &l->optimized_display_config_with_meta;
+	l->uclk_pstate_phase.all_or_nothing = true;
+
+	uclk_pstate_success = dml2_top_optimization_perform_optimization_phase(&l->optimization_phase_locals, &l->uclk_pstate_phase);
+
+	if (uclk_pstate_success) {
+		memcpy(&l->base_display_config_with_meta, &l->optimized_display_config_with_meta, sizeof(struct display_configuation_with_meta));
+		l->base_display_config_with_meta.stage3.success = true;
+	}
+
+	/*
+	* Phase 4: Optimize for Vmin
+	*/
+	memset(&l->vmin_phase, 0, sizeof(struct optimization_phase_params));
+	l->vmin_phase.dml = dml;
+	l->vmin_phase.display_config = &l->base_display_config_with_meta;
+	l->vmin_phase.init_function = dml2_top_optimization_init_function_vmin;
+	l->vmin_phase.test_function = dml2_top_optimization_test_function_vmin;
+	l->vmin_phase.optimize_function = dml2_top_optimization_optimize_function_vmin;
+	l->vmin_phase.optimized_display_config = &l->optimized_display_config_with_meta;
+	l->vmin_phase.all_or_nothing = false;
+
+	vmin_success = dml2_top_optimization_perform_optimization_phase(&l->optimization_phase_locals, &l->vmin_phase);
+
+	if (l->optimized_display_config_with_meta.stage4.performed) {
+		/*
+		 * when performed is true, optimization has applied to
+		 * optimized_display_config_with_meta and it has passed mode
+		 * support. However it may or may not pass the test function to
+		 * reach actual Vmin. As long as voltage is optimized even if it
+		 * doesn't reach Vmin level, there is still power benefit so in
+		 * this case we will still copy this optimization into base
+		 * display config.
+		 */
+		memcpy(&l->base_display_config_with_meta, &l->optimized_display_config_with_meta, sizeof(struct display_configuation_with_meta));
+		l->base_display_config_with_meta.stage4.success = vmin_success;
+	}
+
+	/*
+	* Phase 5: Optimize for Stutter
+	*/
+	memset(&l->stutter_phase, 0, sizeof(struct optimization_phase_params));
+	l->stutter_phase.dml = dml;
+	l->stutter_phase.display_config = &l->base_display_config_with_meta;
+	l->stutter_phase.init_function = dml2_top_optimization_init_function_stutter;
+	l->stutter_phase.test_function = dml2_top_optimization_test_function_stutter;
+	l->stutter_phase.optimize_function = dml2_top_optimization_optimize_function_stutter;
+	l->stutter_phase.optimized_display_config = &l->optimized_display_config_with_meta;
+	l->stutter_phase.all_or_nothing = true;
+
+	stutter_success = dml2_top_optimization_perform_optimization_phase(&l->optimization_phase_locals, &l->stutter_phase);
+
+	if (stutter_success) {
+		memcpy(&l->base_display_config_with_meta, &l->optimized_display_config_with_meta, sizeof(struct display_configuation_with_meta));
+		l->base_display_config_with_meta.stage5.success = true;
+	}
+
+	/*
+	* Populate mcache programming
+	*/
+	for (i = 0; i < in_out->display_config->num_planes; i++) {
+		in_out->programming->plane_programming[i].mcache_allocation = l->base_display_config_with_meta.stage2.mcache_allocations[i];
+	}
+
+	/*
+	* Call DPMM to map all requirements to minimum clock state
+	*/
+	if (result) {
+		l->dppm_map_mode_params.min_clk_table = &dml->min_clk_table;
+		l->dppm_map_mode_params.display_cfg = &l->base_display_config_with_meta;
+		l->dppm_map_mode_params.programming = in_out->programming;
+		l->dppm_map_mode_params.soc_bb = &dml->soc_bbox;
+		l->dppm_map_mode_params.ip = &dml->core_instance.clean_me_up.mode_lib.ip;
+		result = dml->dpmm_instance.map_mode_to_soc_dpm(&l->dppm_map_mode_params);
+		if (!result)
+			in_out->programming->informative.failed_dpmm = true;
+	}
+
+	if (result) {
+		l->mode_programming_params.instance = &dml->core_instance;
+		l->mode_programming_params.display_cfg = &l->base_display_config_with_meta;
+		l->mode_programming_params.cfg_support_info = &l->base_display_config_with_meta.mode_support_result.cfg_support_info;
+		l->mode_programming_params.programming = in_out->programming;
+		result = dml->core_instance.mode_programming(&l->mode_programming_params);
+		if (!result)
+			in_out->programming->informative.failed_mode_programming = true;
+	}
+
+	if (result) {
+		l->dppm_map_watermarks_params.core = &dml->core_instance;
+		l->dppm_map_watermarks_params.display_cfg = &l->base_display_config_with_meta;
+		l->dppm_map_watermarks_params.programming = in_out->programming;
+		result = dml->dpmm_instance.map_watermarks(&l->dppm_map_watermarks_params);
+	}
+
+	l->informative_params.instance = &dml->core_instance;
+	l->informative_params.programming = in_out->programming;
+	l->informative_params.mode_is_supported = result;
+
+	dml->core_instance.populate_informative(&l->informative_params);
+
+	return result;
+}
+
+bool dml2_top_soc15_build_mcache_programming(struct dml2_build_mcache_programming_in_out *params)
+{
+	bool success = true;
+	int config_index, pipe_index;
+	int first_offset, second_offset;
+	int free_per_plane_reg_index = 0;
+
+	memset(params->per_plane_pipe_mcache_regs, 0, DML2_MAX_PLANES * DML2_MAX_DCN_PIPES * sizeof(struct dml2_hubp_pipe_mcache_regs *));
+
+	for (config_index = 0; config_index < params->num_configurations; config_index++) {
+		for (pipe_index = 0; pipe_index < params->mcache_configurations[config_index].num_pipes; pipe_index++) {
+			// Allocate storage for the mcache regs
+			params->per_plane_pipe_mcache_regs[config_index][pipe_index] = &params->mcache_regs_set[free_per_plane_reg_index++];
+
+			reset_mcache_allocations(params->per_plane_pipe_mcache_regs[config_index][pipe_index]);
+
+			if (params->mcache_configurations[config_index].plane_descriptor->surface.dcc.enable) {
+				// P0 always enabled
+				if (!calculate_first_second_splitting(params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane0,
+					params->mcache_configurations[config_index].mcache_allocation->num_mcaches_plane0,
+					0,
+					params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane0.viewport_x_start,
+					params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane0.viewport_x_start +
+					params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane0.viewport_width - 1,
+					&first_offset, &second_offset)) {
+					success = false;
+					break;
+				}
+
+				params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.mcache_id_first =
+					params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_plane0[first_offset];
+
+				params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.mcache_id_first =
+					params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_mall_plane0[first_offset];
+
+				if (second_offset >= 0) {
+					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.mcache_id_second =
+						params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_plane0[second_offset];
+					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.split_location =
+						params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane0[first_offset] - 1;
+
+					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.mcache_id_second =
+						params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_mall_plane0[second_offset];
+					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.split_location =
+						params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane0[first_offset] - 1;
+				}
+
+				// Populate P1 if enabled
+				if (params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane1_enabled) {
+					if (!calculate_first_second_splitting(params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane1,
+						params->mcache_configurations[config_index].mcache_allocation->num_mcaches_plane1,
+						0,
+						params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane1.viewport_x_start,
+						params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane1.viewport_x_start +
+						params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane1.viewport_width - 1,
+						&first_offset, &second_offset)) {
+						success = false;
+						break;
+					}
+
+					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.mcache_id_first =
+						params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_plane1[first_offset];
+
+					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.mcache_id_first =
+						params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_mall_plane1[first_offset];
+
+					if (second_offset >= 0) {
+						params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.mcache_id_second =
+							params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_plane1[second_offset];
+						params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.split_location =
+							params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane1[first_offset] - 1;
+
+						params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.mcache_id_second =
+							params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_mall_plane1[second_offset];
+						params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.split_location =
+							params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane1[first_offset] - 1;
+					}
+				}
+			}
+		}
+	}
+
+	return success;
+}
+
+static const struct dml2_top_funcs soc15_funcs = {
+	.check_mode_supported = dml2_top_soc15_check_mode_supported,
+	.build_mode_programming = dml2_top_soc15_build_mode_programming,
+	.build_mcache_programming = dml2_top_soc15_build_mcache_programming,
+};
+
+bool dml2_top_soc15_initialize_instance(struct dml2_initialize_instance_in_out *in_out)
+{
+	struct dml2_instance *dml = (struct dml2_instance *)in_out->dml2_instance;
+	struct dml2_initialize_instance_locals *l = &dml->scratch.initialize_instance_locals;
+	struct dml2_core_initialize_in_out core_init_params = { 0 };
+	struct dml2_mcg_build_min_clock_table_params_in_out mcg_build_min_clk_params = { 0 };
+	struct dml2_pmo_initialize_in_out pmo_init_params = { 0 };
+	bool result = false;
+
+	memset(l, 0, sizeof(struct dml2_initialize_instance_locals));
+	memset(dml, 0, sizeof(struct dml2_instance));
+
+	memcpy(&dml->ip_caps, &in_out->ip_caps, sizeof(struct dml2_ip_capabilities));
+	memcpy(&dml->soc_bbox, &in_out->soc_bb, sizeof(struct dml2_soc_bb));
+
+	dml->project_id = in_out->options.project_id;
+	dml->pmo_options = in_out->options.pmo_options;
+
+	// Initialize All Components
+	result = dml2_mcg_create(in_out->options.project_id, &dml->mcg_instance);
+
+	if (result)
+		result = dml2_dpmm_create(in_out->options.project_id, &dml->dpmm_instance);
+
+	if (result)
+		result = dml2_core_create(in_out->options.project_id, &dml->core_instance);
+
+	if (result) {
+		mcg_build_min_clk_params.soc_bb = &in_out->soc_bb;
+		mcg_build_min_clk_params.min_clk_table = &dml->min_clk_table;
+		result = dml->mcg_instance.build_min_clock_table(&mcg_build_min_clk_params);
+	}
+
+	if (result) {
+		core_init_params.project_id = in_out->options.project_id;
+		core_init_params.instance = &dml->core_instance;
+		core_init_params.minimum_clock_table = &dml->min_clk_table;
+		core_init_params.explicit_ip_bb = in_out->overrides.explicit_ip_bb;
+		core_init_params.explicit_ip_bb_size = in_out->overrides.explicit_ip_bb_size;
+		core_init_params.ip_caps = &in_out->ip_caps;
+		core_init_params.soc_bb = &in_out->soc_bb;
+		result = dml->core_instance.initialize(&core_init_params);
+
+		if (core_init_params.explicit_ip_bb && core_init_params.explicit_ip_bb_size > 0) {
+			memcpy(&dml->ip_caps, &in_out->ip_caps, sizeof(struct dml2_ip_capabilities));
+		}
+	}
+
+	if (result)
+		result = dml2_pmo_create(in_out->options.project_id, &dml->pmo_instance);
+
+	if (result) {
+		pmo_init_params.instance = &dml->pmo_instance;
+		pmo_init_params.soc_bb = &dml->soc_bbox;
+		pmo_init_params.ip_caps = &dml->ip_caps;
+		pmo_init_params.mcg_clock_table_size = dml->min_clk_table.dram_bw_table.num_entries;
+		pmo_init_params.options = &dml->pmo_options;
+		dml->pmo_instance.initialize(&pmo_init_params);
+	}
+	dml->funcs = soc15_funcs;
+	return result;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.h
similarity index 58%
rename from drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
rename to drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.h
index 7b1f6f7143d0..6fda201af898 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml2_top_soc15.h
@@ -1,23 +1,13 @@
 // SPDX-License-Identifier: MIT
 //
 // Copyright 2024 Advanced Micro Devices, Inc.
-
-#ifndef __DML_TOP_MCACHE_H__
-#define __DML_TOP_MCACHE_H__
-
-#include "dml2_external_lib_deps.h"
-#include "dml_top_display_cfg_types.h"
-#include "dml_top_types.h"
+#ifndef __DML2_TOP_SOC15_H__
+#define __DML2_TOP_SOC15_H__
 #include "dml2_internal_shared_types.h"
+bool dml2_top_soc15_initialize_instance(struct dml2_initialize_instance_in_out *in_out);
 
 bool dml2_top_mcache_calc_mcache_count_and_offsets(struct top_mcache_calc_mcache_count_and_offsets_in_out *params);
-
 void dml2_top_mcache_assign_global_mcache_ids(struct top_mcache_assign_global_mcache_ids_in_out *params);
-
 bool dml2_top_mcache_validate_admissability(struct top_mcache_validate_admissability_in_out *params);
-
-bool dml2_top_mcache_build_mcache_programming(struct dml2_build_mcache_programming_in_out *params);
-
-bool dml2_top_mcache_unit_test(void);
-
-#endif
+bool dml2_top_soc15_build_mcache_programming(struct dml2_build_mcache_programming_in_out *params);
+#endif /* __DML2_TOP_SOC15_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
deleted file mode 100644
index a342ebfbe4e7..000000000000
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_top/dml_top_mcache.c
+++ /dev/null
@@ -1,549 +0,0 @@
-// SPDX-License-Identifier: MIT
-//
-// Copyright 2024 Advanced Micro Devices, Inc.
-
-#include "dml2_debug.h"
-
-#include "dml_top_mcache.h"
-#include "lib_float_math.h"
-
-#include "dml2_internal_shared_types.h"
-
-/*
-* Takes an input set of mcache boundaries and finds the appropriate setting of cache programming.
-* Returns true if a valid set of programming can be made, and false otherwise. "Valid" means
-* that the horizontal viewport does not span more than 2 cache slices.
-*
-* It optionally also can apply a constant shift to all the cache boundaries.
-*/
-static const uint32_t MCACHE_ID_UNASSIGNED = 0xF;
-static const uint32_t SPLIT_LOCATION_UNDEFINED = 0xFFFF;
-
-static bool calculate_first_second_splitting(const int *mcache_boundaries, int num_boundaries, int shift,
-	int pipe_h_vp_start, int pipe_h_vp_end, int *first_offset, int *second_offset)
-{
-	const int MAX_VP = 0xFFFFFF;
-	int left_cache_id;
-	int right_cache_id;
-	int range_start;
-	int range_end;
-	bool success = false;
-
-	if (num_boundaries <= 1) {
-		if (first_offset && second_offset) {
-			*first_offset = 0;
-			*second_offset = -1;
-		}
-		success = true;
-		return success;
-	} else {
-		range_start = 0;
-		for (left_cache_id = 0; left_cache_id < num_boundaries; left_cache_id++) {
-			range_end = mcache_boundaries[left_cache_id] - shift - 1;
-
-			if (range_start <= pipe_h_vp_start && pipe_h_vp_start <= range_end)
-				break;
-
-			range_start = range_end + 1;
-		}
-
-		range_end = MAX_VP;
-		for (right_cache_id = num_boundaries - 1; right_cache_id >= -1; right_cache_id--) {
-			if (right_cache_id >= 0)
-				range_start = mcache_boundaries[right_cache_id] - shift;
-			else
-				range_start = 0;
-
-			if (range_start <= pipe_h_vp_end && pipe_h_vp_end <= range_end) {
-				break;
-			}
-			range_end = range_start - 1;
-		}
-		right_cache_id = (right_cache_id + 1) % num_boundaries;
-
-		if (right_cache_id == left_cache_id) {
-			if (first_offset && second_offset) {
-				*first_offset = left_cache_id;
-				*second_offset = -1;
-			}
-			success = true;
-		} else if (right_cache_id == (left_cache_id + 1) % num_boundaries) {
-			if (first_offset && second_offset) {
-				*first_offset = left_cache_id;
-				*second_offset = right_cache_id;
-			}
-			success = true;
-		}
-	}
-
-	return success;
-}
-
-/*
-* For a given set of pipe start/end x positions, checks to see it can support the input mcache splitting.
-* It also attempts to "optimize" by finding a shift if the default 0 shift does not work.
-*/
-static bool find_shift_for_valid_cache_id_assignment(int *mcache_boundaries, unsigned int num_boundaries,
-	int *pipe_vp_startx, int *pipe_vp_endx, unsigned int pipe_count, int shift_granularity, int *shift)
-{
-	int max_shift = 0xFFFF;
-	unsigned int pipe_index;
-	unsigned int i, slice_width;
-	bool success = false;
-
-	for (i = 0; i < num_boundaries; i++) {
-		if (i == 0)
-			slice_width = mcache_boundaries[i];
-		else
-			slice_width = mcache_boundaries[i] - mcache_boundaries[i - 1];
-
-		if (max_shift > (int)slice_width) {
-			max_shift = slice_width;
-		}
-	}
-
-	for (*shift = 0; *shift <= max_shift; *shift += shift_granularity) {
-		success = true;
-		for (pipe_index = 0; pipe_index < pipe_count; pipe_index++) {
-			if (!calculate_first_second_splitting(mcache_boundaries, num_boundaries, *shift,
-				pipe_vp_startx[pipe_index], pipe_vp_endx[pipe_index], 0, 0)) {
-				success = false;
-				break;
-			}
-		}
-		if (success)
-			break;
-	}
-
-	return success;
-}
-
-/*
-* Counts the number of elements inside input array within the given span length.
-* Formally, what is the size of the largest subset of the array where the largest and smallest element
-* differ no more than the span.
-*/
-static unsigned int count_elements_in_span(int *array, unsigned int array_size, unsigned int span)
-{
-	unsigned int i;
-	unsigned int span_start_value;
-	unsigned int span_start_index;
-	unsigned int greatest_element_count;
-
-	if (array_size == 0)
-		return 1;
-
-	if (span == 0)
-		return array_size > 0 ? 1 : 0;
-
-	span_start_value = 0;
-	span_start_index = 0;
-	greatest_element_count = 0;
-
-	while (span_start_index < array_size) {
-		for (i = span_start_index; i < array_size; i++) {
-			if (array[i] - span_start_value <= span) {
-				if (i - span_start_index + 1 > greatest_element_count) {
-					greatest_element_count = i - span_start_index + 1;
-				}
-			} else
-				break;
-		}
-
-		span_start_index++;
-
-		if (span_start_index < array_size) {
-			span_start_value = array[span_start_index - 1] + 1;
-		}
-	}
-
-	return greatest_element_count;
-}
-
-static bool calculate_h_split_for_scaling_transform(int full_vp_width, int h_active, int num_pipes,
-	enum dml2_scaling_transform scaling_transform, int *pipe_vp_x_start, int *pipe_vp_x_end)
-{
-	int i, slice_width;
-	const char MAX_SCL_VP_OVERLAP = 3;
-	bool success = false;
-
-	switch (scaling_transform) {
-	case dml2_scaling_transform_centered:
-	case dml2_scaling_transform_aspect_ratio:
-	case dml2_scaling_transform_fullscreen:
-		slice_width = full_vp_width / num_pipes;
-		for (i = 0; i < num_pipes; i++) {
-			pipe_vp_x_start[i] = i * slice_width;
-			pipe_vp_x_end[i] = (i + 1) * slice_width - 1;
-
-			if (pipe_vp_x_start[i] < MAX_SCL_VP_OVERLAP)
-				pipe_vp_x_start[i] = 0;
-			else
-				pipe_vp_x_start[i] -= MAX_SCL_VP_OVERLAP;
-
-			if (pipe_vp_x_end[i] > full_vp_width - MAX_SCL_VP_OVERLAP - 1)
-				pipe_vp_x_end[i] = full_vp_width - 1;
-			else
-				pipe_vp_x_end[i] += MAX_SCL_VP_OVERLAP;
-		}
-		break;
-	case dml2_scaling_transform_explicit:
-	default:
-		success = false;
-		break;
-	}
-
-	return success;
-}
-
-bool dml2_top_mcache_validate_admissability(struct top_mcache_validate_admissability_in_out *params)
-{
-	struct dml2_instance *dml = (struct dml2_instance *)params->dml2_instance;
-	struct dml2_top_mcache_validate_admissability_locals *l = &dml->scratch.mcache_validate_admissability_locals;
-
-	const int MAX_PIXEL_OVERLAP = 6;
-	int max_per_pipe_vp_p0 = 0;
-	int max_per_pipe_vp_p1 = 0;
-	int temp, p0shift, p1shift;
-	unsigned int plane_index = 0;
-	unsigned int i;
-	unsigned int odm_combine_factor;
-	unsigned int mpc_combine_factor;
-	unsigned int num_dpps;
-	unsigned int num_boundaries;
-	enum dml2_scaling_transform scaling_transform;
-	const struct dml2_plane_parameters *plane;
-	const struct dml2_stream_parameters *stream;
-
-	bool p0pass = false;
-	bool p1pass = false;
-	bool all_pass = true;
-
-	for (plane_index = 0; plane_index < params->display_cfg->num_planes; plane_index++) {
-		if (!params->display_cfg->plane_descriptors[plane_index].surface.dcc.enable)
-			continue;
-
-		plane = &params->display_cfg->plane_descriptors[plane_index];
-		stream = &params->display_cfg->stream_descriptors[plane->stream_index];
-
-		num_dpps = odm_combine_factor = params->cfg_support_info->stream_support_info[plane->stream_index].odms_used;
-
-		if (odm_combine_factor == 1)
-			num_dpps = mpc_combine_factor = (unsigned int)params->cfg_support_info->plane_support_info[plane_index].dpps_used;
-		else
-			mpc_combine_factor = 1;
-
-		if (odm_combine_factor > 1) {
-			max_per_pipe_vp_p0 = plane->surface.plane0.width;
-			temp = (unsigned int)math_ceil(plane->composition.scaler_info.plane0.h_ratio * stream->timing.h_active / odm_combine_factor);
-
-			if (temp < max_per_pipe_vp_p0)
-				max_per_pipe_vp_p0 = temp;
-
-			max_per_pipe_vp_p1 = plane->surface.plane1.width;
-			temp = (unsigned int)math_ceil(plane->composition.scaler_info.plane1.h_ratio * stream->timing.h_active / odm_combine_factor);
-
-			if (temp < max_per_pipe_vp_p1)
-				max_per_pipe_vp_p1 = temp;
-		} else {
-			max_per_pipe_vp_p0 = plane->surface.plane0.width / mpc_combine_factor;
-			max_per_pipe_vp_p1 = plane->surface.plane1.width / mpc_combine_factor;
-		}
-
-		max_per_pipe_vp_p0 += 2 * MAX_PIXEL_OVERLAP;
-		max_per_pipe_vp_p1 += MAX_PIXEL_OVERLAP;
-
-		p0shift = 0;
-		p1shift = 0;
-
-		// The last element in the unshifted boundary array will always be the first pixel outside the
-		// plane, which means theres no mcache associated with it, so -1
-		num_boundaries = params->mcache_allocations[plane_index].num_mcaches_plane0 == 0 ? 0 : params->mcache_allocations[plane_index].num_mcaches_plane0 - 1;
-		if ((count_elements_in_span(params->mcache_allocations[plane_index].mcache_x_offsets_plane0,
-			num_boundaries, max_per_pipe_vp_p0) <= 1) && (num_boundaries <= num_dpps)) {
-			p0pass = true;
-		}
-		num_boundaries = params->mcache_allocations[plane_index].num_mcaches_plane1 == 0 ? 0 : params->mcache_allocations[plane_index].num_mcaches_plane1 - 1;
-		if ((count_elements_in_span(params->mcache_allocations[plane_index].mcache_x_offsets_plane1,
-			num_boundaries, max_per_pipe_vp_p1) <= 1) && (num_boundaries <= num_dpps)) {
-			p1pass = true;
-		}
-
-		if (!p0pass || !p1pass) {
-			if (odm_combine_factor > 1) {
-				num_dpps = odm_combine_factor;
-				scaling_transform = plane->composition.scaling_transform;
-			} else {
-				num_dpps = mpc_combine_factor;
-				scaling_transform = dml2_scaling_transform_fullscreen;
-			}
-
-			if (!p0pass) {
-				if (plane->composition.viewport.stationary) {
-					calculate_h_split_for_scaling_transform(plane->surface.plane0.width,
-						stream->timing.h_active, num_dpps, scaling_transform,
-						&l->plane0.pipe_vp_startx[plane_index], &l->plane0.pipe_vp_endx[plane_index]);
-					p0pass = find_shift_for_valid_cache_id_assignment(params->mcache_allocations[plane_index].mcache_x_offsets_plane0,
-						params->mcache_allocations[plane_index].num_mcaches_plane0,
-						&l->plane0.pipe_vp_startx[plane_index], &l->plane0.pipe_vp_endx[plane_index], num_dpps,
-						params->mcache_allocations[plane_index].shift_granularity.p0, &p0shift);
-				}
-			}
-			if (!p1pass) {
-				if (plane->composition.viewport.stationary) {
-					calculate_h_split_for_scaling_transform(plane->surface.plane1.width,
-						stream->timing.h_active, num_dpps, scaling_transform,
-						&l->plane0.pipe_vp_startx[plane_index], &l->plane0.pipe_vp_endx[plane_index]);
-					p1pass = find_shift_for_valid_cache_id_assignment(params->mcache_allocations[plane_index].mcache_x_offsets_plane1,
-						params->mcache_allocations[plane_index].num_mcaches_plane1,
-						&l->plane1.pipe_vp_startx[plane_index], &l->plane1.pipe_vp_endx[plane_index], num_dpps,
-						params->mcache_allocations[plane_index].shift_granularity.p1, &p1shift);
-				}
-			}
-		}
-
-		if (p0pass && p1pass) {
-			for (i = 0; i < params->mcache_allocations[plane_index].num_mcaches_plane0; i++) {
-				params->mcache_allocations[plane_index].mcache_x_offsets_plane0[i] -= p0shift;
-			}
-			for (i = 0; i < params->mcache_allocations[plane_index].num_mcaches_plane1; i++) {
-				params->mcache_allocations[plane_index].mcache_x_offsets_plane1[i] -= p1shift;
-			}
-		}
-
-		params->per_plane_status[plane_index] = p0pass && p1pass;
-		all_pass &= p0pass && p1pass;
-	}
-
-	return all_pass;
-}
-
-static void reset_mcache_allocations(struct dml2_hubp_pipe_mcache_regs *per_plane_pipe_mcache_regs)
-{
-	// Initialize all entries to special valid MCache ID and special valid split coordinate
-	per_plane_pipe_mcache_regs->main.p0.mcache_id_first = MCACHE_ID_UNASSIGNED;
-	per_plane_pipe_mcache_regs->main.p0.mcache_id_second = MCACHE_ID_UNASSIGNED;
-	per_plane_pipe_mcache_regs->main.p0.split_location = SPLIT_LOCATION_UNDEFINED;
-
-	per_plane_pipe_mcache_regs->mall.p0.mcache_id_first = MCACHE_ID_UNASSIGNED;
-	per_plane_pipe_mcache_regs->mall.p0.mcache_id_second = MCACHE_ID_UNASSIGNED;
-	per_plane_pipe_mcache_regs->mall.p0.split_location = SPLIT_LOCATION_UNDEFINED;
-
-	per_plane_pipe_mcache_regs->main.p1.mcache_id_first = MCACHE_ID_UNASSIGNED;
-	per_plane_pipe_mcache_regs->main.p1.mcache_id_second = MCACHE_ID_UNASSIGNED;
-	per_plane_pipe_mcache_regs->main.p1.split_location = SPLIT_LOCATION_UNDEFINED;
-
-	per_plane_pipe_mcache_regs->mall.p1.mcache_id_first = MCACHE_ID_UNASSIGNED;
-	per_plane_pipe_mcache_regs->mall.p1.mcache_id_second = MCACHE_ID_UNASSIGNED;
-	per_plane_pipe_mcache_regs->mall.p1.split_location = SPLIT_LOCATION_UNDEFINED;
-}
-
-bool dml2_top_mcache_build_mcache_programming(struct dml2_build_mcache_programming_in_out *params)
-{
-	bool success = true;
-	int config_index, pipe_index;
-	int first_offset, second_offset;
-	int free_per_plane_reg_index = 0;
-
-	memset(params->per_plane_pipe_mcache_regs, 0, DML2_MAX_PLANES * DML2_MAX_DCN_PIPES * sizeof(struct dml2_hubp_pipe_mcache_regs *));
-
-	for (config_index = 0; config_index < params->num_configurations; config_index++) {
-		for (pipe_index = 0; pipe_index < params->mcache_configurations[config_index].num_pipes; pipe_index++) {
-			// Allocate storage for the mcache regs
-			params->per_plane_pipe_mcache_regs[config_index][pipe_index] = &params->mcache_regs_set[free_per_plane_reg_index++];
-
-			reset_mcache_allocations(params->per_plane_pipe_mcache_regs[config_index][pipe_index]);
-
-			if (params->mcache_configurations[config_index].plane_descriptor->surface.dcc.enable) {
-				// P0 always enabled
-				if (!calculate_first_second_splitting(params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane0,
-					params->mcache_configurations[config_index].mcache_allocation->num_mcaches_plane0,
-					0,
-					params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane0.viewport_x_start,
-					params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane0.viewport_x_start +
-					params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane0.viewport_width - 1,
-					&first_offset, &second_offset)) {
-					success = false;
-					break;
-				}
-
-				params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.mcache_id_first =
-					params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_plane0[first_offset];
-
-				params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.mcache_id_first =
-					params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_mall_plane0[first_offset];
-
-				if (second_offset >= 0) {
-					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.mcache_id_second =
-						params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_plane0[second_offset];
-					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p0.split_location =
-						params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane0[first_offset] - 1;
-
-					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.mcache_id_second =
-						params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_mall_plane0[second_offset];
-					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p0.split_location =
-						params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane0[first_offset] - 1;
-				}
-
-				// Populate P1 if enabled
-				if (params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane1_enabled) {
-					if (!calculate_first_second_splitting(params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane1,
-						params->mcache_configurations[config_index].mcache_allocation->num_mcaches_plane1,
-						0,
-						params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane1.viewport_x_start,
-						params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane1.viewport_x_start +
-						params->mcache_configurations[config_index].pipe_configurations[pipe_index].plane1.viewport_width - 1,
-						&first_offset, &second_offset)) {
-						success = false;
-						break;
-					}
-
-					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.mcache_id_first =
-						params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_plane1[first_offset];
-
-					params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.mcache_id_first =
-						params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_mall_plane1[first_offset];
-
-					if (second_offset >= 0) {
-						params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.mcache_id_second =
-							params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_plane1[second_offset];
-						params->per_plane_pipe_mcache_regs[config_index][pipe_index]->main.p1.split_location =
-							params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane1[first_offset] - 1;
-
-						params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.mcache_id_second =
-							params->mcache_configurations[config_index].mcache_allocation->global_mcache_ids_mall_plane1[second_offset];
-						params->per_plane_pipe_mcache_regs[config_index][pipe_index]->mall.p1.split_location =
-							params->mcache_configurations[config_index].mcache_allocation->mcache_x_offsets_plane1[first_offset] - 1;
-					}
-				}
-			}
-		}
-	}
-
-	return success;
-}
-
-void dml2_top_mcache_assign_global_mcache_ids(struct top_mcache_assign_global_mcache_ids_in_out *params)
-{
-	int i;
-	unsigned int j;
-	int next_unused_cache_id = 0;
-
-	for (i = 0; i < params->num_allocations; i++) {
-		if (!params->allocations[i].valid)
-			continue;
-
-		for (j = 0; j < params->allocations[i].num_mcaches_plane0; j++) {
-			params->allocations[i].global_mcache_ids_plane0[j] = next_unused_cache_id++;
-		}
-		for (j = 0; j < params->allocations[i].num_mcaches_plane1; j++) {
-			params->allocations[i].global_mcache_ids_plane1[j] = next_unused_cache_id++;
-		}
-
-		// The "psuedo-last" slice is always wrapped around
-		params->allocations[i].global_mcache_ids_plane0[params->allocations[i].num_mcaches_plane0] =
-			params->allocations[i].global_mcache_ids_plane0[0];
-		params->allocations[i].global_mcache_ids_plane1[params->allocations[i].num_mcaches_plane1] =
-			params->allocations[i].global_mcache_ids_plane1[0];
-
-		// If we need dedicated caches for mall requesting, then we assign them here.
-		if (params->allocations[i].requires_dedicated_mall_mcache) {
-			for (j = 0; j < params->allocations[i].num_mcaches_plane0; j++) {
-				params->allocations[i].global_mcache_ids_mall_plane0[j] = next_unused_cache_id++;
-			}
-			for (j = 0; j < params->allocations[i].num_mcaches_plane1; j++) {
-				params->allocations[i].global_mcache_ids_mall_plane1[j] = next_unused_cache_id++;
-			}
-
-			// The "psuedo-last" slice is always wrapped around
-			params->allocations[i].global_mcache_ids_mall_plane0[params->allocations[i].num_mcaches_plane0] =
-				params->allocations[i].global_mcache_ids_mall_plane0[0];
-			params->allocations[i].global_mcache_ids_mall_plane1[params->allocations[i].num_mcaches_plane1] =
-				params->allocations[i].global_mcache_ids_mall_plane1[0];
-		}
-
-		// If P0 and P1 are sharing caches, then it means the largest mcache IDs for p0 and p1 can be the same
-		// since mcache IDs are always ascending, then it means the largest mcacheID of p1 should be the
-		// largest mcacheID of P0
-		if (params->allocations[i].num_mcaches_plane0 > 0 && params->allocations[i].num_mcaches_plane1 > 0 &&
-			params->allocations[i].last_slice_sharing.plane0_plane1) {
-			params->allocations[i].global_mcache_ids_plane1[params->allocations[i].num_mcaches_plane1 - 1] =
-				params->allocations[i].global_mcache_ids_plane0[params->allocations[i].num_mcaches_plane0 - 1];
-		}
-
-		// If we need dedicated caches handle last slice sharing
-		if (params->allocations[i].requires_dedicated_mall_mcache) {
-			if (params->allocations[i].num_mcaches_plane0 > 0 && params->allocations[i].num_mcaches_plane1 > 0 &&
-				params->allocations[i].last_slice_sharing.plane0_plane1) {
-				params->allocations[i].global_mcache_ids_mall_plane1[params->allocations[i].num_mcaches_plane1 - 1] =
-					params->allocations[i].global_mcache_ids_mall_plane0[params->allocations[i].num_mcaches_plane0 - 1];
-			}
-			// If mall_comb_mcache_l is set then it means that largest mcache ID for MALL p0 can be same as regular read p0
-			if (params->allocations[i].num_mcaches_plane0 > 0 && params->allocations[i].last_slice_sharing.mall_comb_mcache_p0) {
-				params->allocations[i].global_mcache_ids_mall_plane0[params->allocations[i].num_mcaches_plane0 - 1] =
-					params->allocations[i].global_mcache_ids_plane0[params->allocations[i].num_mcaches_plane0 - 1];
-			}
-			// If mall_comb_mcache_c is set then it means that largest mcache ID for MALL p1 can be same as regular
-			// read p1 (which can be same as regular read p0 if plane0_plane1 is also set)
-			if (params->allocations[i].num_mcaches_plane1 > 0 && params->allocations[i].last_slice_sharing.mall_comb_mcache_p1) {
-				params->allocations[i].global_mcache_ids_mall_plane1[params->allocations[i].num_mcaches_plane1 - 1] =
-					params->allocations[i].global_mcache_ids_plane1[params->allocations[i].num_mcaches_plane1 - 1];
-			}
-		}
-
-		// If you don't need dedicated mall mcaches, the mall mcache assignments are identical to the normal requesting
-		if (!params->allocations[i].requires_dedicated_mall_mcache) {
-			memcpy(params->allocations[i].global_mcache_ids_mall_plane0, params->allocations[i].global_mcache_ids_plane0,
-				sizeof(params->allocations[i].global_mcache_ids_mall_plane0));
-			memcpy(params->allocations[i].global_mcache_ids_mall_plane1, params->allocations[i].global_mcache_ids_plane1,
-				sizeof(params->allocations[i].global_mcache_ids_mall_plane1));
-		}
-	}
-}
-
-bool dml2_top_mcache_calc_mcache_count_and_offsets(struct top_mcache_calc_mcache_count_and_offsets_in_out *params)
-{
-	struct dml2_instance *dml = (struct dml2_instance *)params->dml2_instance;
-	struct dml2_top_mcache_verify_mcache_size_locals *l = &dml->scratch.mcache_verify_mcache_size_locals;
-
-	unsigned int total_mcaches_required;
-	unsigned int i;
-	bool result = false;
-
-	if (dml->soc_bbox.num_dcc_mcaches == 0) {
-		return true;
-	}
-
-	total_mcaches_required = 0;
-	l->calc_mcache_params.instance = &dml->core_instance;
-	for (i = 0; i < params->display_config->num_planes; i++) {
-		if (!params->display_config->plane_descriptors[i].surface.dcc.enable) {
-			memset(&params->mcache_allocations[i], 0, sizeof(struct dml2_mcache_surface_allocation));
-			continue;
-		}
-
-		l->calc_mcache_params.plane_descriptor = &params->display_config->plane_descriptors[i];
-		l->calc_mcache_params.mcache_allocation = &params->mcache_allocations[i];
-		l->calc_mcache_params.plane_index = i;
-
-		if (!dml->core_instance.calculate_mcache_allocation(&l->calc_mcache_params)) {
-			result = false;
-			break;
-		}
-
-		if (params->mcache_allocations[i].valid) {
-			total_mcaches_required += params->mcache_allocations[i].num_mcaches_plane0 + params->mcache_allocations[i].num_mcaches_plane1;
-			if (params->mcache_allocations[i].last_slice_sharing.plane0_plane1)
-				total_mcaches_required--;
-		}
-	}
-	dml2_printf("DML_CORE_DCN3::%s: plane_%d, total_mcaches_required=%d\n", __func__, i, total_mcaches_required);
-
-	if (total_mcaches_required > dml->soc_bbox.num_dcc_mcaches) {
-		result = false;
-	} else {
-		result = true;
-	}
-
-	return result;
-}
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
index e9b8e10695ae..f95c7ff56f15 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.c
@@ -4,6 +4,11 @@
 
 #include "dml2_debug.h"
 
+int dml2_log_internal(const char *format, ...)
+{
+	return 0;
+}
+
 int dml2_printf(const char *format, ...)
 {
 #ifdef _DEBUG
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
index d51a1b6c62f2..a27792b56f7e 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_debug.h
@@ -8,9 +8,53 @@
 #ifdef _DEBUG
 #define DML2_ASSERT(condition) dml2_assert(condition)
 #else
-#define DML2_ASSERT(condition)
+#define DML2_ASSERT(condition) ((void)0)
+#endif
+/*
+ * DML_LOG_FATAL - fatal errors for unrecoverable DML states until a restart.
+ * DML_LOG_ERROR - unexpected but recoverable failures inside DML
+ * DML_LOG_WARN - unexpected inputs or events to DML
+ * DML_LOG_INFO - high level tracing of DML interfaces
+ * DML_LOG_DEBUG - detailed tracing of DML internal components
+ * DML_LOG_VERBOSE - detailed tracing of DML calculation procedure
+ */
+#if !defined(DML_LOG_LEVEL)
+#if defined(_DEBUG) && defined(_DEBUG_PRINTS)
+/* for backward compatibility with old macros */
+#define DML_LOG_LEVEL 5
+#else
+#define DML_LOG_LEVEL 0
+#endif
+#endif
+
+#define DML_LOG_FATAL(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#if DML_LOG_LEVEL >= 1
+#define DML_LOG_ERROR(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#else
+#define DML_LOG_ERROR(fmt, ...) ((void)0)
+#endif
+#if DML_LOG_LEVEL >= 2
+#define DML_LOG_WARN(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#else
+#define DML_LOG_WARN(fmt, ...) ((void)0)
+#endif
+#if DML_LOG_LEVEL >= 3
+#define DML_LOG_INFO(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#else
+#define DML_LOG_INFO(fmt, ...) ((void)0)
+#endif
+#if DML_LOG_LEVEL >= 4
+#define DML_LOG_DEBUG(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#else
+#define DML_LOG_DEBUG(fmt, ...) ((void)0)
+#endif
+#if DML_LOG_LEVEL >= 5
+#define DML_LOG_VERBOSE(fmt, ...) dml2_log_internal(fmt, ## __VA_ARGS__)
+#else
+#define DML_LOG_VERBOSE(fmt, ...) ((void)0)
 #endif
 
+int dml2_log_internal(const char *format, ...);
 int dml2_printf(const char *format, ...);
 void dml2_assert(int condition);
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
index aeac9f159fa5..d94b310d6eec 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/inc/dml2_internal_shared_types.h
@@ -8,7 +8,6 @@
 #include "dml2_external_lib_deps.h"
 #include "dml_top_types.h"
 #include "dml2_core_shared_types.h"
-
 /*
 * DML2 MCG Types and Interfaces
 */
@@ -63,7 +62,6 @@ struct dml2_mcg_build_min_clock_table_params_in_out {
 	*/
 	struct dml2_mcg_min_clock_table *min_clk_table;
 };
-
 struct dml2_mcg_instance {
 	bool (*build_min_clock_table)(struct dml2_mcg_build_min_clock_table_params_in_out *in_out);
 	bool (*unit_test)(void);
@@ -81,7 +79,6 @@ struct dml2_dpmm_map_mode_to_soc_dpm_params_in_out {
 	struct dml2_soc_bb *soc_bb;
 	struct dml2_mcg_min_clock_table *min_clk_table;
 	const struct display_configuation_with_meta *display_cfg;
-
 	struct {
 		bool perform_pseudo_map;
 		struct dml2_core_internal_soc_bb *soc_bb;
@@ -309,7 +306,7 @@ struct dml2_optimization_stage3_state {
 	// The pstate support mode for each plane
 	// The number of valid elements == display_cfg.num_planes
 	// The indexing of pstate_switch_modes matches plane_descriptors[]
-	enum dml2_uclk_pstate_support_method pstate_switch_modes[DML2_MAX_PLANES];
+	enum dml2_pstate_method pstate_switch_modes[DML2_MAX_PLANES];
 
 	// Meta-data for implicit SVP generation, indexed by stream index
 	struct dml2_implicit_svp_meta stream_svp_meta[DML2_MAX_PLANES];
@@ -356,6 +353,12 @@ struct display_configuation_with_meta {
 	struct dml2_optimization_stage5_state stage5;
 };
 
+struct dml2_pmo_pstate_strategy {
+	enum dml2_pstate_method per_stream_pstate_method[DML2_MAX_PLANES];
+	bool allow_state_increase;
+};
+
+
 struct dml2_core_mode_support_in_out {
 	/*
 	* Inputs
@@ -365,7 +368,6 @@ struct dml2_core_mode_support_in_out {
 
 	struct dml2_mcg_min_clock_table *min_clk_table;
 	int min_clk_index;
-
 	/*
 	* Outputs
 	*/
@@ -395,7 +397,6 @@ struct dml2_core_mode_programming_in_out {
 	struct dml2_core_instance *instance;
 	const struct display_configuation_with_meta *display_cfg;
 	const struct core_display_cfg_support_info *cfg_support_info;
-
 	/*
 	* Outputs (also Input the clk freq are also from programming struct)
 	*/
@@ -445,6 +446,7 @@ struct dml2_core_internal_state_intermediates {
 struct dml2_core_mode_support_locals {
 	struct dml2_core_calcs_mode_support_ex mode_support_ex_params;
 	struct dml2_display_cfg svp_expanded_display_cfg;
+	struct dml2_calculate_mcache_allocation_in_out calc_mcache_allocation_params;
 };
 
 struct dml2_core_mode_programming_locals {
@@ -600,34 +602,11 @@ struct dml2_pmo_optimize_for_stutter_in_out {
 	struct display_configuation_with_meta *optimized_display_config;
 };
 
-enum dml2_pmo_pstate_method {
-	dml2_pmo_pstate_strategy_na = 0,
-	/* hw exclusive modes */
-	dml2_pmo_pstate_strategy_vactive = 1,
-	dml2_pmo_pstate_strategy_vblank = 2,
-	dml2_pmo_pstate_strategy_reserved_hw = 5,
-	/* fw assisted exclusive modes */
-	dml2_pmo_pstate_strategy_fw_svp = 6,
-	dml2_pmo_pstate_strategy_reserved_fw = 10,
-	/* fw assisted modes requiring drr modulation */
-	dml2_pmo_pstate_strategy_fw_vactive_drr = 11,
-	dml2_pmo_pstate_strategy_fw_vblank_drr = 12,
-	dml2_pmo_pstate_strategy_fw_svp_drr = 13,
-	dml2_pmo_pstate_strategy_reserved_fw_drr_clamped = 20,
-	dml2_pmo_pstate_strategy_fw_drr = 21,
-	dml2_pmo_pstate_strategy_reserved_fw_drr_var = 22,
-};
-
-struct dml2_pmo_pstate_strategy {
-	enum dml2_pmo_pstate_method per_stream_pstate_method[DML2_MAX_PLANES];
-	bool allow_state_increase;
-};
-
-#define PMO_NO_DRR_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw - dml2_pmo_pstate_strategy_na + 1)) - 1) << dml2_pmo_pstate_strategy_na)
-#define PMO_DRR_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_var - dml2_pmo_pstate_strategy_fw_vactive_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_vactive_drr)
-#define PMO_DRR_CLAMPED_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_clamped - dml2_pmo_pstate_strategy_fw_vactive_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_vactive_drr)
-#define PMO_DRR_VAR_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_var - dml2_pmo_pstate_strategy_fw_drr + 1)) - 1) << dml2_pmo_pstate_strategy_fw_drr)
-#define PMO_FW_STRATEGY_MASK (((1 << (dml2_pmo_pstate_strategy_reserved_fw_drr_var - dml2_pmo_pstate_strategy_fw_svp + 1)) - 1) << dml2_pmo_pstate_strategy_fw_svp)
+#define PMO_NO_DRR_STRATEGY_MASK (((1 << (dml2_pstate_method_reserved_fw - dml2_pstate_method_na + 1)) - 1) << dml2_pstate_method_na)
+#define PMO_DRR_STRATEGY_MASK (((1 << (dml2_pstate_method_reserved_fw_drr_var - dml2_pstate_method_fw_vactive_drr + 1)) - 1) << dml2_pstate_method_fw_vactive_drr)
+#define PMO_DRR_CLAMPED_STRATEGY_MASK (((1 << (dml2_pstate_method_reserved_fw_drr_clamped - dml2_pstate_method_fw_vactive_drr + 1)) - 1) << dml2_pstate_method_fw_vactive_drr)
+#define PMO_DRR_VAR_STRATEGY_MASK (((1 << (dml2_pstate_method_reserved_fw_drr_var - dml2_pstate_method_fw_drr + 1)) - 1) << dml2_pstate_method_fw_drr)
+#define PMO_FW_STRATEGY_MASK (((1 << (dml2_pstate_method_reserved_fw_drr_var - dml2_pstate_method_fw_svp + 1)) - 1) << dml2_pstate_method_fw_svp)
 
 #define PMO_DCN4_MAX_DISPLAYS 4
 #define PMO_DCN4_MAX_NUM_VARIANTS 2
@@ -645,6 +624,8 @@ struct dml2_pmo_scratch {
 			int stream_mask;
 		} pmo_dcn3;
 		struct {
+			struct dml2_pmo_pstate_strategy expanded_override_strategy_list[2 * 2 * 2 * 2];
+			unsigned int num_expanded_override_strategies;
 			struct dml2_pmo_pstate_strategy pstate_strategy_candidates[DML2_PMO_PSTATE_CANDIDATE_LIST_SIZE];
 			int num_pstate_candidates;
 			int cur_pstate_candidate;
@@ -706,7 +687,6 @@ struct dml2_pmo_instance {
 	int mpc_combine_limit;
 	int odm_combine_limit;
 	int mcg_clock_table_size;
-
 	union {
 		struct {
 			struct {
@@ -963,7 +943,13 @@ struct dml2_top_mcache_validate_admissability_locals {
 struct dml2_top_display_cfg_support_info {
 	const struct dml2_display_cfg *display_config;
 	struct core_display_cfg_support_info core_info;
-	enum dml2_pstate_support_method per_plane_pstate_method[DML2_MAX_PLANES];
+};
+
+struct dml2_top_funcs {
+	bool (*check_mode_supported)(struct dml2_check_mode_supported_in_out *in_out);
+	bool (*build_mode_programming)(struct dml2_build_mode_programming_in_out *in_out);
+	bool (*build_mcache_programming)(struct dml2_build_mcache_programming_in_out *in_out);
+	bool (*unit_test)(void);
 };
 
 struct dml2_instance {
@@ -978,8 +964,8 @@ struct dml2_instance {
 	struct dml2_ip_capabilities ip_caps;
 
 	struct dml2_mcg_min_clock_table min_clk_table;
-
 	struct dml2_pmo_options pmo_options;
+	struct dml2_top_funcs funcs;
 
 	struct {
 		struct dml2_initialize_instance_locals initialize_instance_locals;
-- 
2.45.2


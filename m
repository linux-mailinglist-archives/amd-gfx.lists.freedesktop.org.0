Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1162753413E
	for <lists+amd-gfx@lfdr.de>; Wed, 25 May 2022 18:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306DD10E5F8;
	Wed, 25 May 2022 16:20:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2043.outbound.protection.outlook.com [40.107.236.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9297B10E472
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 May 2022 16:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THizsr+0jBlOFyjAx1ymnMAnYjE8i6dLl3CNDsyY4/9k0IBRsELclNx0nOIaT5GTy117ZKA7AMCnsSYzJDBr6ZzoQ4Vot/RBUb0B9EKQowO0VQWjFzHLCCmL3b1KVFJGURlI5UT7+dupcdZdAEWOzRkkvPm+611V38ILCSzbDcMoXtLq6zPhIIiCQdU/b/R37Q4R2qvrmwCgAEgIT+Nh5HfQtkgt4BDqPv+VqHbrhSBP6u6bzIyUfYfrB11a90Z/tBuMM8Iz1slBP0wbSZalM5+jmaPkepEf7UuWKzh2uZFL1AB0cpj7drZYwE02KBN08tvKpzs1czJOyEsc1lhUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtZHM2YHt6HcEuOcHwXRNU90ul1o6LJZjo6uwL0hPCc=;
 b=Z1dkXW0reXUjg9U4O8W4VbfkDXWWgzl5TVv5T2o75TqBWUG7Jap/+wVgOZaX+qMGsSSvW8QNIV6Ktd+DYAFhczaglYSmSOsPSA4z1SrylwXMuP9igWu3n/qGjlWMa+8koECMqrVvmmqFANL4nAZ8H6HJ55xIV5Kkip4PzTmPUcNRHYLO5TLws3kIg23E0Qb85vIQ+dIaMgDo3CdsS6CIUZt/HQXqONWMxPsTaskJEpPwj3XnGQPZAnynM8iAFf+TKBo4bdOWnkN1U//av2Rbjy9vwJKe318YG+MpWYLzEp0y74zWMvW0qelu6qdOCffJjDk+LbyCXEykQ0o/QdQ4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtZHM2YHt6HcEuOcHwXRNU90ul1o6LJZjo6uwL0hPCc=;
 b=biZDY65VnMa0fd2ZNths/jTQg5KVmN9vcEvNpMYUMyVHEURj/9l9kTn1dKtB9yFoaDIu31e8Rry+f7YNVR82VGFXNalJmSnbls41ZOWB8RYqEgd3h/lM1zxoT4SJymBSTeAroUcsrBoVWzOwMO999V82adDNX6u7/DefN9RKRvQ=
Received: from DM6PR04CA0003.namprd04.prod.outlook.com (2603:10b6:5:334::8) by
 BN6PR12MB1297.namprd12.prod.outlook.com (2603:10b6:404:14::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.17; Wed, 25 May 2022 16:20:06 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::ea) by DM6PR04CA0003.outlook.office365.com
 (2603:10b6:5:334::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19 via Frontend
 Transport; Wed, 25 May 2022 16:20:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 16:20:05 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 11:20:04 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 09/43] drm/amd/display: add CLKMGR changes for DCN32/321
Date: Wed, 25 May 2022 12:19:07 -0400
Message-ID: <20220525161941.2544055-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220525161941.2544055-1-alexander.deucher@amd.com>
References: <20220525161941.2544055-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46a292aa-4fc9-4de1-ea33-08da3e6a6dfc
X-MS-TrafficTypeDiagnostic: BN6PR12MB1297:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB1297468204C3A2CC3601B3D1F7D69@BN6PR12MB1297.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YpYrAITxbJknO6CfuKc5v9vcZMMECn3KWv0QIEVC18mcNKdNGc9sLFxgGp1vd2rjybgdAathSRtRcPu36rZbW0ga/0EEKvollo0YG8ihDxy38ZUtAltDz501AChuY0xjsrkvsUamEBEvOOCwtfRG/vvvIhTOjeeeMVFHuZaor8wSPsKs5RoPtrJ9yBze0SdhO+GmC6S8DVRwd/IM7+IgOYOp7aNni06J6JqRQ/7lAbjTsiUO6Kq3kksULYL8yYd+hUgCgFXflNWzA1mutSlZrME6YWp+uvUHYOMuyRTv2xPqgqNEq9BmLxoB51mTPzXWQfHO1kZf+xcYDaKdCRrrNupHz5zo6tP+qrurJ1yqROQaoaCPteAtOEe9Ey3+kQTGfocGfGJvJEIRgAiF2mb1MvwVX7vuRwx9ZGkZvpm73icg9/MTX9EbZMQsi/ckEmCBMkKb3rPgixNob9qT/Up3ya5xbAGrpIREJsxc2CJth+z0DG+bhgXDH+Qf7aCxsMOr0awzWl+02+yDSoR5U3MjOXe7fThT6bvBM0zeTKREeju0FxlwaSJ2op71LVSKbYP1F9K5SfIw0blaeTXO75CmPWfLZDBjxGwfheIXHVS4duRaODc8vq2fbA3bvqO/PIjLPmczHlg6i04m39apwXPPiIwxAbC+8GTsGmcvVEta5m5ITtZ2oYfxc1SEY/vCdDCl9afqHBJiklVqTuG5kqKJMnAu6mZ23f4hHI6sIE9YMyEi1IdIDVSTCxnjjNToOeuz
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(54906003)(186003)(5660300002)(316002)(6916009)(70206006)(81166007)(83380400001)(30864003)(36860700001)(1076003)(40140700001)(36756003)(19627235002)(508600001)(8936002)(47076005)(356005)(82310400005)(336012)(426003)(8676002)(2906002)(2616005)(16526019)(4326008)(26005)(7696005)(70586007)(86362001)(36900700001)(559001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 16:20:05.7999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a292aa-4fc9-4de1-ea33-08da3e6a6dfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1297
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jerry Zuo <jerry.zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

Add support for managing DCN3.2.x clocks.

v2: squash in smu interface updates (Alex)
v3: Drop unused SMU header (Alex)

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Acked-by: Jerry Zuo <jerry.zuo@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |   35 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   17 +-
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c  |   15 +-
 .../display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h  |   60 +
 .../drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h |   65 +
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c  |  628 +++++
 .../display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h  |   39 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c  |  117 +
 .../dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h  |   49 +
 .../dc/clk_mgr/dcn32/smu13_driver_if.h        |  108 +
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |    3 +
 drivers/gpu/drm/amd/display/dc/dc.h           |    3 +
 .../amd/display/dc/dcn321/dcn321_resource.c   | 2325 +++++++++++++++++
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |    2 +
 .../amd/display/dc/inc/hw/clk_mgr_internal.h  |   45 +-
 15 files changed, 3506 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index 817871917632..c935c10b5f4f 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -172,4 +172,39 @@ AMD_DAL_CLK_MGR_DCN316 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn316/,$(CLK_MGR_
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN316)
 
+###############################################################################
+# DCN32
+###############################################################################
+CLK_MGR_DCN32 = dcn32_clk_mgr.o dcn32_clk_mgr_smu_msg.o
+
+AMD_DAL_CLK_MGR_DCN32 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn32/,$(CLK_MGR_DCN32))
+
+ifdef CONFIG_X86
+CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn32/dcn32_clk_mgr.o := -msse
+endif
+
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn32/dcn32_clk_mgr.o := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn32/dcn32_clk_mgr.o := -mhard-float
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn32/dcn32_clk_mgr.o := -mpreferred-stack-boundary=4
+else
+CFLAGS_$(AMDDALPATH)/dc/clk_mgr/dcn32/dcn32_clk_mgr.o := -msse2
+endif
+endif
+
+AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN32)
+
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index 772bffda68cc..e803e59abd56 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -45,6 +45,7 @@
 #include "dcn31/dcn31_clk_mgr.h"
 #include "dcn315/dcn315_clk_mgr.h"
 #include "dcn316/dcn316_clk_mgr.h"
+#include "dcn32/dcn32_clk_mgr.h"
 
 
 int clk_mgr_helper_get_active_display_cnt(
@@ -316,8 +317,19 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 		return &clk_mgr->base.base;
 	}
 		break;
-#endif
+	case AMDGPU_FAMILY_GC_11_0_0: {
+	    struct clk_mgr_internal *clk_mgr = kzalloc(sizeof(*clk_mgr), GFP_KERNEL);
+
+	    if (clk_mgr == NULL) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	    }
 
+	    dcn32_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+	    return &clk_mgr->base;
+	    break;
+#endif
+	}
 	default:
 		ASSERT(0); /* Unknown Asic */
 		break;
@@ -360,6 +372,9 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 		dcn316_clk_mgr_destroy(clk_mgr);
 		break;
 
+	case AMDGPU_FAMILY_GC_11_0_0:
+		dcn32_clk_mgr_destroy(clk_mgr);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
index 5ed6a93d1708..914708cefc79 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -129,7 +129,7 @@ static noinline void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
 
 	/* Set C - Dummy P-State - P-State latency set to "dummy p-state" value */
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].valid = true;
-	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dummy_pstate_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = 0;
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us = sr_exit_time_us;
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.wm_type = WATERMARKS_DUMMY_PSTATE;
@@ -137,6 +137,14 @@ static noinline void dcn3_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_dcfclk = 0xFFFF;
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_uclk = min_uclk_mhz;
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_uclk = 0xFFFF;
+	clk_mgr->base.bw_params->dummy_pstate_table[0].dram_speed_mts = 1600;
+	clk_mgr->base.bw_params->dummy_pstate_table[0].dummy_pstate_latency_us = 38;
+	clk_mgr->base.bw_params->dummy_pstate_table[1].dram_speed_mts = 8000;
+	clk_mgr->base.bw_params->dummy_pstate_table[1].dummy_pstate_latency_us = 9;
+	clk_mgr->base.bw_params->dummy_pstate_table[2].dram_speed_mts = 10000;
+	clk_mgr->base.bw_params->dummy_pstate_table[2].dummy_pstate_latency_us = 8;
+	clk_mgr->base.bw_params->dummy_pstate_table[3].dram_speed_mts = 16000;
+	clk_mgr->base.bw_params->dummy_pstate_table[3].dummy_pstate_latency_us = 5;
 
 	/* Set D - MALL - SR enter and exit times adjusted for MALL */
 	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].valid = true;
@@ -517,6 +525,8 @@ static void dcn30_notify_link_rate_change(struct clk_mgr *clk_mgr_base, struct d
 	if (!clk_mgr->smu_present)
 		return;
 
+	/* TODO - DP2.0 HW: calculate link 128b/132 link rate in clock manager with new formula */
+
 	clk_mgr->cur_phyclk_req_table[link->link_index] = link->cur_link_settings.link_rate * LINK_RATE_REF_FREQ_IN_KHZ;
 
 	for (i = 0; i < MAX_PIPES * 2; i++) {
@@ -620,7 +630,8 @@ void dcn3_clk_mgr_construct(
 
 void dcn3_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
 {
-	kfree(clk_mgr->base.bw_params);
+	if (clk_mgr->base.bw_params)
+		kfree(clk_mgr->base.bw_params);
 
 	if (clk_mgr->wm_range_table)
 		dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_GART,
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
index dd4a0bd72458..2cd95ec38266 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.h
@@ -26,6 +26,66 @@
 #ifndef __DCN30_CLK_MGR_H__
 #define __DCN30_CLK_MGR_H__
 
+//CLK1_CLK_PLL_REQ
+#ifndef CLK11_CLK1_CLK_PLL_REQ__FbMult_int__SHIFT
+#define CLK11_CLK1_CLK_PLL_REQ__FbMult_int__SHIFT                                                                   0x0
+#define CLK11_CLK1_CLK_PLL_REQ__PllSpineDiv__SHIFT                                                                  0xc
+#define CLK11_CLK1_CLK_PLL_REQ__FbMult_frac__SHIFT                                                                  0x10
+#define CLK11_CLK1_CLK_PLL_REQ__FbMult_int_MASK                                                                     0x000001FFL
+#define CLK11_CLK1_CLK_PLL_REQ__PllSpineDiv_MASK                                                                    0x0000F000L
+#define CLK11_CLK1_CLK_PLL_REQ__FbMult_frac_MASK                                                                    0xFFFF0000L
+//CLK1_CLK0_DFS_CNTL
+#define CLK11_CLK1_CLK0_DFS_CNTL__CLK0_DIVIDER__SHIFT                                                               0x0
+#define CLK11_CLK1_CLK0_DFS_CNTL__CLK0_DIVIDER_MASK                                                                 0x0000007FL
+/*DPREF clock related*/
+#define CLK0_CLK3_DFS_CNTL__CLK3_DIVIDER__SHIFT                                                               0x0
+#define CLK0_CLK3_DFS_CNTL__CLK3_DIVIDER_MASK                                                                 0x0000007FL
+#define CLK1_CLK3_DFS_CNTL__CLK3_DIVIDER__SHIFT                                                               0x0
+#define CLK1_CLK3_DFS_CNTL__CLK3_DIVIDER_MASK                                                                 0x0000007FL
+#define CLK2_CLK3_DFS_CNTL__CLK3_DIVIDER__SHIFT                                                               0x0
+#define CLK2_CLK3_DFS_CNTL__CLK3_DIVIDER_MASK                                                                 0x0000007FL
+#define CLK3_CLK3_DFS_CNTL__CLK3_DIVIDER__SHIFT                                                               0x0
+#define CLK3_CLK3_DFS_CNTL__CLK3_DIVIDER_MASK                                                                 0x0000007FL
+
+//CLK3_0_CLK3_CLK_PLL_REQ
+#define CLK3_0_CLK3_CLK_PLL_REQ__FbMult_int__SHIFT                                                            0x0
+#define CLK3_0_CLK3_CLK_PLL_REQ__PllSpineDiv__SHIFT                                                           0xc
+#define CLK3_0_CLK3_CLK_PLL_REQ__FbMult_frac__SHIFT                                                           0x10
+#define CLK3_0_CLK3_CLK_PLL_REQ__FbMult_int_MASK                                                              0x000001FFL
+#define CLK3_0_CLK3_CLK_PLL_REQ__PllSpineDiv_MASK                                                             0x0000F000L
+#define CLK3_0_CLK3_CLK_PLL_REQ__FbMult_frac_MASK                                                             0xFFFF0000L
+
+#define mmCLK0_CLK2_DFS_CNTL                            0x16C55
+#define mmCLK00_CLK0_CLK2_DFS_CNTL                      0x16C55
+#define mmCLK01_CLK0_CLK2_DFS_CNTL                      0x16E55
+#define mmCLK02_CLK0_CLK2_DFS_CNTL                      0x17055
+
+#define mmCLK0_CLK3_DFS_CNTL                            0x16C60
+#define mmCLK00_CLK0_CLK3_DFS_CNTL                      0x16C60
+#define mmCLK01_CLK0_CLK3_DFS_CNTL                      0x16E60
+#define mmCLK02_CLK0_CLK3_DFS_CNTL                      0x17060
+#define mmCLK03_CLK0_CLK3_DFS_CNTL                      0x17260
+
+#define mmCLK0_CLK_PLL_REQ                              0x16C10
+#define mmCLK00_CLK0_CLK_PLL_REQ                        0x16C10
+#define mmCLK01_CLK0_CLK_PLL_REQ                        0x16E10
+#define mmCLK02_CLK0_CLK_PLL_REQ                        0x17010
+#define mmCLK03_CLK0_CLK_PLL_REQ                        0x17210
+
+#define mmCLK1_CLK_PLL_REQ                              0x1B00D
+#define mmCLK10_CLK1_CLK_PLL_REQ                        0x1B00D
+#define mmCLK11_CLK1_CLK_PLL_REQ                        0x1B20D
+#define mmCLK12_CLK1_CLK_PLL_REQ                        0x1B40D
+#define mmCLK13_CLK1_CLK_PLL_REQ                        0x1B60D
+
+#define mmCLK2_CLK_PLL_REQ                              0x17E0D
+
+/*AMCLK*/
+
+#define mmCLK11_CLK1_CLK0_DFS_CNTL                      0x1B23F
+#define mmCLK11_CLK1_CLK_PLL_REQ                        0x1B20D
+
+#endif
 void dcn3_init_clocks(struct clk_mgr *clk_mgr_base);
 
 void dcn3_clk_mgr_construct(struct dc_context *ctx,
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h
new file mode 100644
index 000000000000..c427be6add8a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dalsmc.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+ * Authors: AMD
+ *
+ */
+#ifndef DALSMC_H
+#define DALSMC_H
+
+#define DALSMC_VERSION 0x1
+
+// SMU Response Codes:
+#define DALSMC_Result_OK                   0x1
+#define DALSMC_Result_Failed               0xFF
+#define DALSMC_Result_UnknownCmd           0xFE
+#define DALSMC_Result_CmdRejectedPrereq    0xFD
+#define DALSMC_Result_CmdRejectedBusy      0xFC
+
+// Message Definitions:
+#define DALSMC_MSG_TestMessage                    0x1
+#define DALSMC_MSG_GetSmuVersion                  0x2
+#define DALSMC_MSG_GetDriverIfVersion             0x3
+#define DALSMC_MSG_GetMsgHeaderVersion            0x4
+#define DALSMC_MSG_SetDalDramAddrHigh             0x5
+#define DALSMC_MSG_SetDalDramAddrLow              0x6
+#define DALSMC_MSG_TransferTableSmu2Dram          0x7
+#define DALSMC_MSG_TransferTableDram2Smu          0x8
+#define DALSMC_MSG_SetHardMinByFreq               0x9
+#define DALSMC_MSG_SetHardMaxByFreq               0xA
+#define DALSMC_MSG_GetDpmFreqByIndex              0xB
+#define DALSMC_MSG_GetDcModeMaxDpmFreq            0xC
+#define DALSMC_MSG_SetMinDeepSleepDcfclk          0xD
+#define DALSMC_MSG_NumOfDisplays                  0xE
+#define DALSMC_MSG_SetExternalClientDfCstateAllow 0xF
+#define DALSMC_MSG_BacoAudioD3PME                 0x10
+#define DALSMC_MSG_SetFclkSwitchAllow             0x11
+#define DALSMC_MSG_SetCabForUclkPstate            0x12
+#define DALSMC_MSG_SetWorstCaseUclkLatency        0x13
+#define DALSMC_Message_Count                      0x14
+
+typedef enum {
+	FCLK_SWITCH_DISALLOW,
+	FCLK_SWITCH_ALLOW,
+} FclkSwitchAllow_e;
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
new file mode 100644
index 000000000000..419cc83b3d21
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c
@@ -0,0 +1,628 @@
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
+ * Authors: AMD
+ *
+ */
+
+#include "dccg.h"
+#include "clk_mgr_internal.h"
+
+#include "dcn32/dcn32_clk_mgr_smu_msg.h"
+#include "dcn20/dcn20_clk_mgr.h"
+#include "dce100/dce_clk_mgr.h"
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dm_helpers.h"
+
+#include "atomfirmware.h"
+#include "smu13_driver_if.h"
+
+#include "dcn/dcn_3_2_0_offset.h"
+#include "dcn/dcn_3_2_0_sh_mask.h"
+
+#include "dcn32/dcn32_clk_mgr.h"
+
+#define DCN_BASE__INST0_SEG1                       0x000000C0
+
+#define mmCLK1_CLK_PLL_REQ                              0x16E37
+#define mmCLK1_CLK0_DFS_CNTL                            0x16E69
+#define mmCLK1_CLK1_DFS_CNTL                            0x16E6C
+#define mmCLK1_CLK2_DFS_CNTL                            0x16E6F
+#define mmCLK1_CLK3_DFS_CNTL                            0x16E72
+#define mmCLK1_CLK4_DFS_CNTL                            0x16E75
+
+#define CLK1_CLK_PLL_REQ__FbMult_int_MASK               0x000001ffUL
+#define CLK1_CLK_PLL_REQ__PllSpineDiv_MASK              0x0000f000UL
+#define CLK1_CLK_PLL_REQ__FbMult_frac_MASK              0xffff0000UL
+#define CLK1_CLK_PLL_REQ__FbMult_int__SHIFT             0x00000000
+#define CLK1_CLK_PLL_REQ__PllSpineDiv__SHIFT            0x0000000c
+#define CLK1_CLK_PLL_REQ__FbMult_frac__SHIFT            0x00000010
+
+#define mmCLK01_CLK0_CLK_PLL_REQ                        0x16E37
+#define mmCLK01_CLK0_CLK0_DFS_CNTL                      0x16E64
+#define mmCLK01_CLK0_CLK1_DFS_CNTL                      0x16E67
+#define mmCLK01_CLK0_CLK2_DFS_CNTL                      0x16E6A
+#define mmCLK01_CLK0_CLK3_DFS_CNTL                      0x16E6D
+#define mmCLK01_CLK0_CLK4_DFS_CNTL                      0x16E70
+
+#define CLK0_CLK_PLL_REQ__FbMult_int_MASK               0x000001ffL
+#define CLK0_CLK_PLL_REQ__PllSpineDiv_MASK              0x0000f000L
+#define CLK0_CLK_PLL_REQ__FbMult_frac_MASK              0xffff0000L
+#define CLK0_CLK_PLL_REQ__FbMult_int__SHIFT             0x00000000
+#define CLK0_CLK_PLL_REQ__PllSpineDiv__SHIFT            0x0000000c
+#define CLK0_CLK_PLL_REQ__FbMult_frac__SHIFT            0x00000010
+
+#undef FN
+#define FN(reg_name, field_name) \
+	clk_mgr->clk_mgr_shift->field_name, clk_mgr->clk_mgr_mask->field_name
+
+#define REG(reg) \
+	(clk_mgr->regs->reg)
+
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define SR(reg_name)\
+		.reg_name = BASE(reg ## reg_name ## _BASE_IDX) +  \
+					reg ## reg_name
+
+#define CLK_SR_DCN32(reg_name)\
+	.reg_name = mm ## reg_name
+
+static const struct clk_mgr_registers clk_mgr_regs_dcn32 = {
+	CLK_REG_LIST_DCN32()
+};
+
+static const struct clk_mgr_shift clk_mgr_shift_dcn32 = {
+	CLK_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct clk_mgr_mask clk_mgr_mask_dcn32 = {
+	CLK_COMMON_MASK_SH_LIST_DCN32(_MASK)
+};
+
+
+#define CLK_SR_DCN321(reg_name, block, inst)\
+	.reg_name = mm ## block ## _ ## reg_name
+
+static const struct clk_mgr_registers clk_mgr_regs_dcn321 = {
+	CLK_REG_LIST_DCN321()
+};
+
+static const struct clk_mgr_shift clk_mgr_shift_dcn321 = {
+	CLK_COMMON_MASK_SH_LIST_DCN321(__SHIFT)
+};
+
+static const struct clk_mgr_mask clk_mgr_mask_dcn321 = {
+	CLK_COMMON_MASK_SH_LIST_DCN321(_MASK)
+};
+
+
+/* Query SMU for all clock states for a particular clock */
+static void dcn32_init_single_clock(struct clk_mgr_internal *clk_mgr, PPCLK_e clk, unsigned int *entry_0,
+		unsigned int *num_levels)
+{
+	unsigned int i;
+	char *entry_i = (char *)entry_0;
+
+	uint32_t ret = dcn30_smu_get_dpm_freq_by_index(clk_mgr, clk, 0xFF);
+
+	if (ret & (1 << 31))
+		/* fine-grained, only min and max */
+		*num_levels = 2;
+	else
+		/* discrete, a number of fixed states */
+		/* will set num_levels to 0 on failure */
+		*num_levels = ret & 0xFF;
+
+	/* if the initial message failed, num_levels will be 0 */
+	for (i = 0; i < *num_levels; i++) {
+		*((unsigned int *)entry_i) = (dcn30_smu_get_dpm_freq_by_index(clk_mgr, clk, i) & 0xFFFF);
+		entry_i += sizeof(clk_mgr->base.bw_params->clk_table.entries[0]);
+	}
+}
+
+static void dcn32_build_wm_range_table(struct clk_mgr_internal *clk_mgr)
+{
+	/* defaults */
+	double pstate_latency_us = clk_mgr->base.ctx->dc->dml.soc.dram_clock_change_latency_us;
+	double fclk_change_latency_us = clk_mgr->base.ctx->dc->dml.soc.fclk_change_latency_us;
+	double sr_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_exit_time_us;
+	double sr_enter_plus_exit_time_us = clk_mgr->base.ctx->dc->dml.soc.sr_enter_plus_exit_time_us;
+	/* For min clocks use as reported by PM FW and report those as min */
+	uint16_t min_uclk_mhz			= clk_mgr->base.bw_params->clk_table.entries[0].memclk_mhz;
+	uint16_t min_dcfclk_mhz			= clk_mgr->base.bw_params->clk_table.entries[0].dcfclk_mhz;
+	uint16_t setb_min_uclk_mhz		= min_uclk_mhz;
+	uint16_t setb_min_dcfclk_mhz	= min_dcfclk_mhz;
+	/* For Set B ranges use min clocks state 2 when available, and report those to PM FW */
+	if (clk_mgr->base.ctx->dc->dml.soc.clock_limits[2].dcfclk_mhz)
+		setb_min_dcfclk_mhz = clk_mgr->base.ctx->dc->dml.soc.clock_limits[2].dcfclk_mhz;
+	if (clk_mgr->base.bw_params->clk_table.entries[2].memclk_mhz)
+		setb_min_uclk_mhz = clk_mgr->base.bw_params->clk_table.entries[2].memclk_mhz;
+
+	/* Set A - Normal - default values */
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].valid = true;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us = pstate_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.fclk_change_latency_us = fclk_change_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_exit_time_us = sr_exit_time_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_dcfclk = min_dcfclk_mhz;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_dcfclk = 0xFFFF;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.min_uclk = min_uclk_mhz;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_A].pmfw_breakdown.max_uclk = 0xFFFF;
+
+	/* Set B - Performance - higher clocks, using DPM[2] DCFCLK and UCLK */
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].valid = true;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us = pstate_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.fclk_change_latency_us = fclk_change_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us = sr_exit_time_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.wm_type = WATERMARKS_CLOCK_RANGE;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_dcfclk = setb_min_dcfclk_mhz;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_dcfclk = 0xFFFF;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.min_uclk = setb_min_uclk_mhz;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_B].pmfw_breakdown.max_uclk = 0xFFFF;
+
+	/* Set C - Dummy P-State - P-State latency set to "dummy p-state" value */
+	/* 'DalDummyClockChangeLatencyNs' registry key option set to 0x7FFFFFFF can be used to disable Set C for dummy p-state */
+	if (clk_mgr->base.ctx->dc->bb_overrides.dummy_clock_change_latency_ns != 0x7FFFFFFF) {
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].valid = true;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.pstate_latency_us = 38;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.fclk_change_latency_us = fclk_change_latency_us;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us = sr_exit_time_us;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.wm_type = WATERMARKS_DUMMY_PSTATE;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_dcfclk = min_dcfclk_mhz;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_dcfclk = 0xFFFF;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.min_uclk = min_uclk_mhz;
+		clk_mgr->base.bw_params->wm_table.nv_entries[WM_C].pmfw_breakdown.max_uclk = 0xFFFF;
+		clk_mgr->base.bw_params->dummy_pstate_table[0].dram_speed_mts = clk_mgr->base.bw_params->clk_table.entries[0].memclk_mhz * 16;
+		clk_mgr->base.bw_params->dummy_pstate_table[0].dummy_pstate_latency_us = 38;
+		clk_mgr->base.bw_params->dummy_pstate_table[1].dram_speed_mts = clk_mgr->base.bw_params->clk_table.entries[1].memclk_mhz * 16;
+		clk_mgr->base.bw_params->dummy_pstate_table[1].dummy_pstate_latency_us = 9;
+		clk_mgr->base.bw_params->dummy_pstate_table[2].dram_speed_mts = clk_mgr->base.bw_params->clk_table.entries[2].memclk_mhz * 16;
+		clk_mgr->base.bw_params->dummy_pstate_table[2].dummy_pstate_latency_us = 8;
+		clk_mgr->base.bw_params->dummy_pstate_table[3].dram_speed_mts = clk_mgr->base.bw_params->clk_table.entries[3].memclk_mhz * 16;
+		clk_mgr->base.bw_params->dummy_pstate_table[3].dummy_pstate_latency_us = 5;
+	}
+	/* Set D - MALL - SR enter and exit time specific to MALL, TBD after bringup or later phase for now use DRAM values / 2 */
+	/* For MALL DRAM clock change latency is N/A, for watermak calculations use lowest value dummy P state latency */
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].valid = true;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.pstate_latency_us = clk_mgr->base.bw_params->dummy_pstate_table[3].dummy_pstate_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.fclk_change_latency_us = fclk_change_latency_us;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.sr_exit_time_us = sr_exit_time_us / 2; // TBD
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].dml_input.sr_enter_plus_exit_time_us = sr_enter_plus_exit_time_us / 2; // TBD
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.wm_type = WATERMARKS_MALL;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_dcfclk = min_dcfclk_mhz;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_dcfclk = 0xFFFF;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.min_uclk = min_uclk_mhz;
+	clk_mgr->base.bw_params->wm_table.nv_entries[WM_D].pmfw_breakdown.max_uclk = 0xFFFF;
+}
+
+void dcn32_init_clocks(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	unsigned int num_levels;
+
+	memset(&(clk_mgr_base->clks), 0, sizeof(struct dc_clocks));
+	clk_mgr_base->clks.p_state_change_support = true;
+	clk_mgr_base->clks.prev_p_state_change_support = true;
+	clk_mgr_base->clks.fclk_prev_p_state_change_support = true;
+	clk_mgr->smu_present = false;
+
+	if (!clk_mgr_base->bw_params)
+		return;
+
+	if (!clk_mgr_base->force_smu_not_present && dcn30_smu_get_smu_version(clk_mgr, &clk_mgr->smu_ver))
+		clk_mgr->smu_present = true;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn30_smu_check_driver_if_version(clk_mgr);
+	dcn30_smu_check_msg_header_version(clk_mgr);
+
+	/* DCFCLK */
+	dcn32_init_single_clock(clk_mgr, PPCLK_DCFCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].dcfclk_mhz,
+			&num_levels);
+
+	/* SOCCLK */
+	dcn32_init_single_clock(clk_mgr, PPCLK_SOCCLK,
+					&clk_mgr_base->bw_params->clk_table.entries[0].socclk_mhz,
+					&num_levels);
+	/* DTBCLK */
+	dcn32_init_single_clock(clk_mgr, PPCLK_DTBCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].dtbclk_mhz,
+			&num_levels);
+
+	/* DISPCLK */
+	dcn32_init_single_clock(clk_mgr, PPCLK_DISPCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].dispclk_mhz,
+			&num_levels);
+
+
+	/* Get UCLK, update bounding box */
+	clk_mgr_base->funcs->get_memclk_states_from_smu(clk_mgr_base);
+
+	/* WM range table */
+	dcn32_build_wm_range_table(clk_mgr);
+}
+
+static void dcn32_update_clocks(struct clk_mgr *clk_mgr_base,
+			struct dc_state *context,
+			bool safe_to_lower)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	struct dc *dc = clk_mgr_base->ctx->dc;
+	int display_count;
+	bool update_dppclk = false;
+	bool update_dispclk = false;
+	bool enter_display_off = false;
+	bool dpp_clock_lowered = false;
+	struct dmcu *dmcu = clk_mgr_base->ctx->dc->res_pool->dmcu;
+	bool force_reset = false;
+	bool update_uclk = false;
+	bool p_state_change_support;
+	bool fclk_p_state_change_support;
+	int total_plane_count;
+
+	if (dc->work_arounds.skip_clock_update)
+		return;
+
+	if (clk_mgr_base->clks.dispclk_khz == 0 ||
+			(dc->debug.force_clock_mode & 0x1)) {
+		/* This is from resume or boot up, if forced_clock cfg option used,
+		 * we bypass program dispclk and DPPCLK, but need set them for S3.
+		 */
+		force_reset = true;
+
+		dcn2_read_clocks_from_hw_dentist(clk_mgr_base);
+
+		/* Force_clock_mode 0x1:  force reset the clock even it is the same clock
+		 * as long as it is in Passive level.
+		 */
+	}
+	display_count = clk_mgr_helper_get_active_display_cnt(dc, context);
+
+	if (display_count == 0)
+		enter_display_off = true;
+
+	if (enter_display_off == safe_to_lower)
+		dcn30_smu_set_num_of_displays(clk_mgr, display_count);
+
+	if (dc->debug.force_min_dcfclk_mhz > 0)
+		new_clocks->dcfclk_khz = (new_clocks->dcfclk_khz > (dc->debug.force_min_dcfclk_mhz * 1000)) ?
+				new_clocks->dcfclk_khz : (dc->debug.force_min_dcfclk_mhz * 1000);
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
+		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_DCFCLK, khz_to_mhz_ceil(clk_mgr_base->clks.dcfclk_khz));
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
+		dcn30_smu_set_min_deep_sleep_dcef_clk(clk_mgr, khz_to_mhz_ceil(clk_mgr_base->clks.dcfclk_deep_sleep_khz));
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->socclk_khz, clk_mgr_base->clks.socclk_khz))
+		/* We don't actually care about socclk, don't notify SMU of hard min */
+		clk_mgr_base->clks.socclk_khz = new_clocks->socclk_khz;
+
+	clk_mgr_base->clks.prev_p_state_change_support = clk_mgr_base->clks.p_state_change_support;
+	clk_mgr_base->clks.fclk_prev_p_state_change_support = clk_mgr_base->clks.fclk_p_state_change_support;
+
+	total_plane_count = clk_mgr_helper_get_active_plane_cnt(dc, context);
+	p_state_change_support = new_clocks->p_state_change_support || (total_plane_count == 0);
+	fclk_p_state_change_support = new_clocks->fclk_p_state_change_support || (total_plane_count == 0);
+	if (should_update_pstate_support(safe_to_lower, p_state_change_support, clk_mgr_base->clks.p_state_change_support)) {
+		clk_mgr_base->clks.p_state_change_support = p_state_change_support;
+
+		/* to disable P-State switching, set UCLK min = max */
+		if (!clk_mgr_base->clks.p_state_change_support)
+			dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
+					clk_mgr_base->bw_params->clk_table.entries[clk_mgr_base->bw_params->clk_table.num_entries - 1].memclk_mhz);
+	}
+
+	if (should_update_pstate_support(safe_to_lower, fclk_p_state_change_support, clk_mgr_base->clks.fclk_p_state_change_support)) {
+		clk_mgr_base->clks.fclk_p_state_change_support = fclk_p_state_change_support;
+
+		/* To disable FCLK P-state switching, send FCLK_PSTATE_NOTSUPPORTED message to PMFW */
+		if (!clk_mgr_base->clks.fclk_p_state_change_support) {
+			/* Handle code for sending a message to PMFW that FCLK P-state change is not supported */
+			dcn32_smu_send_fclk_pstate_message(clk_mgr, FCLK_PSTATE_NOTSUPPORTED);
+		}
+	}
+
+	/* Always update saved value, even if new value not set due to P-State switching unsupported */
+	if (should_set_clock(safe_to_lower, new_clocks->dramclk_khz, clk_mgr_base->clks.dramclk_khz)) {
+		clk_mgr_base->clks.dramclk_khz = new_clocks->dramclk_khz;
+		update_uclk = true;
+	}
+
+	/* set UCLK to requested value if P-State switching is supported, or to re-enable P-State switching */
+	if (clk_mgr_base->clks.p_state_change_support &&
+			(update_uclk || !clk_mgr_base->clks.prev_p_state_change_support))
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK, khz_to_mhz_ceil(clk_mgr_base->clks.dramclk_khz));
+
+	if (clk_mgr_base->clks.fclk_p_state_change_support &&
+			(update_uclk || !clk_mgr_base->clks.fclk_prev_p_state_change_support)) {
+		/* Handle the code for sending a message to PMFW that FCLK P-state change is supported */
+		dcn32_smu_send_fclk_pstate_message(clk_mgr, FCLK_PSTATE_SUPPORTED);
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr_base->clks.dppclk_khz)) {
+		if (clk_mgr_base->clks.dppclk_khz > new_clocks->dppclk_khz)
+			dpp_clock_lowered = true;
+
+		clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_DPPCLK, khz_to_mhz_ceil(clk_mgr_base->clks.dppclk_khz));
+		update_dppclk = true;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
+		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_DISPCLK, khz_to_mhz_ceil(clk_mgr_base->clks.dispclk_khz));
+		update_dispclk = true;
+	}
+
+	if (dc->config.forced_clocks == false || (force_reset && safe_to_lower)) {
+		if (dpp_clock_lowered) {
+			/* if clock is being lowered, increase DTO before lowering refclk */
+			dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+			dcn20_update_clocks_update_dentist(clk_mgr, context);
+		} else {
+			/* if clock is being raised, increase refclk before lowering DTO */
+			if (update_dppclk || update_dispclk)
+				dcn20_update_clocks_update_dentist(clk_mgr, context);
+			/* There is a check inside dcn20_update_clocks_update_dpp_dto which ensures
+			 * that we do not lower dto when it is not safe to lower. We do not need to
+			 * compare the current and new dppclk before calling this function.
+			 */
+			dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+		}
+	}
+
+	if (update_dispclk && dmcu && dmcu->funcs->is_dmcu_initialized(dmcu))
+		/*update dmcu for wait_loop count*/
+		dmcu->funcs->set_psr_wait_loop(dmcu,
+				clk_mgr_base->clks.dispclk_khz / 1000 / 7);
+}
+
+void dcn32_clock_read_ss_info(struct clk_mgr_internal *clk_mgr)
+{
+	struct dc_bios *bp = clk_mgr->base.ctx->dc_bios;
+	int ss_info_num = bp->funcs->get_ss_entry_number(
+			bp, AS_SIGNAL_TYPE_GPU_PLL);
+
+	if (ss_info_num) {
+		struct spread_spectrum_info info = { { 0 } };
+		enum bp_result result = bp->funcs->get_spread_spectrum_info(
+				bp, AS_SIGNAL_TYPE_GPU_PLL, 0, &info);
+
+		/* SSInfo.spreadSpectrumPercentage !=0 would be sign
+		 * that SS is enabled
+		 */
+		if (result == BP_RESULT_OK &&
+				info.spread_spectrum_percentage != 0) {
+			clk_mgr->ss_on_dprefclk = true;
+			clk_mgr->dprefclk_ss_divider = info.spread_percentage_divider;
+
+			if (info.type.CENTER_MODE == 0) {
+				/* Currently for DP Reference clock we
+				 * need only SS percentage for
+				 * downspread
+				 */
+				clk_mgr->dprefclk_ss_percentage =
+						info.spread_spectrum_percentage;
+			}
+		}
+	}
+}
+static void dcn32_notify_wm_ranges(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	WatermarksExternal_t *table = (WatermarksExternal_t *) clk_mgr->wm_range_table;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	if (!table)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn30_smu_set_dram_addr_high(clk_mgr, clk_mgr->wm_range_table_addr >> 32);
+	dcn30_smu_set_dram_addr_low(clk_mgr, clk_mgr->wm_range_table_addr & 0xFFFFFFFF);
+	dcn32_smu_transfer_wm_table_dram_2_smu(clk_mgr);
+}
+
+/* Set min memclk to minimum, either constrained by the current mode or DPM0 */
+static void dcn32_set_hard_min_memclk(struct clk_mgr *clk_mgr_base, bool current_mode)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	if (current_mode) {
+		if (clk_mgr_base->clks.p_state_change_support)
+			dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
+					khz_to_mhz_ceil(clk_mgr_base->clks.dramclk_khz));
+		else
+			dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
+					clk_mgr_base->bw_params->clk_table.entries[clk_mgr_base->bw_params->clk_table.num_entries - 1].memclk_mhz);
+	} else {
+		dcn30_smu_set_hard_min_by_freq(clk_mgr, PPCLK_UCLK,
+				clk_mgr_base->bw_params->clk_table.entries[0].memclk_mhz);
+	}
+}
+
+/* Set max memclk to highest DPM value */
+static void dcn32_set_hard_max_memclk(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn30_smu_set_hard_max_by_freq(clk_mgr, PPCLK_UCLK,
+			clk_mgr_base->bw_params->clk_table.entries[clk_mgr_base->bw_params->clk_table.num_entries - 1].memclk_mhz);
+}
+
+/* Get current memclk states, update bounding box */
+static void dcn32_get_memclk_states_from_smu(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	unsigned int num_levels;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	/* Refresh memclk states */
+	dcn32_init_single_clock(clk_mgr, PPCLK_UCLK,
+			&clk_mgr_base->bw_params->clk_table.entries[0].memclk_mhz,
+			&num_levels);
+	clk_mgr_base->bw_params->clk_table.num_entries = num_levels ? num_levels : 1;
+
+	/* Refresh bounding box */
+	clk_mgr_base->ctx->dc->res_pool->funcs->update_bw_bounding_box(
+			clk_mgr->base.ctx->dc, clk_mgr_base->bw_params);
+}
+
+static bool dcn32_are_clock_states_equal(struct dc_clocks *a,
+					struct dc_clocks *b)
+{
+	if (a->dispclk_khz != b->dispclk_khz)
+		return false;
+	else if (a->dppclk_khz != b->dppclk_khz)
+		return false;
+	else if (a->dcfclk_khz != b->dcfclk_khz)
+		return false;
+	else if (a->dcfclk_deep_sleep_khz != b->dcfclk_deep_sleep_khz)
+		return false;
+	else if (a->dramclk_khz != b->dramclk_khz)
+		return false;
+	else if (a->p_state_change_support != b->p_state_change_support)
+		return false;
+	else if (a->fclk_p_state_change_support != b->fclk_p_state_change_support)
+		return false;
+
+	return true;
+}
+
+static void dcn32_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn30_smu_set_pme_workaround(clk_mgr);
+}
+
+static bool dcn32_is_smu_present(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	return clk_mgr->smu_present;
+}
+
+
+static struct clk_mgr_funcs dcn32_funcs = {
+		.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+		.update_clocks = dcn32_update_clocks,
+		.init_clocks = dcn32_init_clocks,
+		.notify_wm_ranges = dcn32_notify_wm_ranges,
+		.set_hard_min_memclk = dcn32_set_hard_min_memclk,
+		.set_hard_max_memclk = dcn32_set_hard_max_memclk,
+		.get_memclk_states_from_smu = dcn32_get_memclk_states_from_smu,
+		.are_clock_states_equal = dcn32_are_clock_states_equal,
+		.enable_pme_wa = dcn32_enable_pme_wa,
+		.is_smu_present = dcn32_is_smu_present,
+};
+
+void dcn32_clk_mgr_construct(
+		struct dc_context *ctx,
+		struct clk_mgr_internal *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg)
+{
+	clk_mgr->base.ctx = ctx;
+	clk_mgr->base.funcs = &dcn32_funcs;
+	if (ASICREV_IS_GC_11_0_2(clk_mgr->base.ctx->asic_id.hw_internal_rev)) {
+		clk_mgr->regs = &clk_mgr_regs_dcn321;
+		clk_mgr->clk_mgr_shift = &clk_mgr_shift_dcn321;
+		clk_mgr->clk_mgr_mask = &clk_mgr_mask_dcn321;
+	} else {
+		clk_mgr->regs = &clk_mgr_regs_dcn32;
+		clk_mgr->clk_mgr_shift = &clk_mgr_shift_dcn32;
+		clk_mgr->clk_mgr_mask = &clk_mgr_mask_dcn32;
+	}
+
+	clk_mgr->dccg = dccg;
+	clk_mgr->dfs_bypass_disp_clk = 0;
+
+	clk_mgr->dprefclk_ss_percentage = 0;
+	clk_mgr->dprefclk_ss_divider = 1000;
+	clk_mgr->ss_on_dprefclk = false;
+	clk_mgr->dfs_ref_freq_khz = 100000;
+
+	clk_mgr->base.dprefclk_khz = 717000; /* Changed as per DCN3.2_clock_frequency doc */
+	clk_mgr->dccg->ref_dtbclk_khz = 477800;
+
+	/* integer part is now VCO frequency in kHz */
+	clk_mgr->base.dentist_vco_freq_khz = 4300000;//dcn32_get_vco_frequency_from_reg(clk_mgr);
+	/* in case we don't get a value from the register, use default */
+	if (clk_mgr->base.dentist_vco_freq_khz == 0)
+		clk_mgr->base.dentist_vco_freq_khz = 4300000; /* Updated as per HW docs */
+
+	if (clk_mgr->base.boot_snapshot.dprefclk != 0) {
+		//ASSERT(clk_mgr->base.dprefclk_khz == clk_mgr->base.boot_snapshot.dprefclk);
+		//clk_mgr->base.dprefclk_khz = clk_mgr->base.boot_snapshot.dprefclk;
+	}
+	dcn32_clock_read_ss_info(clk_mgr);
+
+	clk_mgr->dfs_bypass_enabled = false;
+
+	clk_mgr->smu_present = false;
+
+	clk_mgr->base.bw_params = kzalloc(sizeof(*clk_mgr->base.bw_params), GFP_KERNEL);
+
+	/* need physical address of table to give to PMFW */
+	clk_mgr->wm_range_table = dm_helpers_allocate_gpu_mem(clk_mgr->base.ctx,
+			DC_MEM_ALLOC_TYPE_GART, sizeof(WatermarksExternal_t),
+			&clk_mgr->wm_range_table_addr);
+}
+
+void dcn32_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
+{
+	if (clk_mgr->base.bw_params)
+		kfree(clk_mgr->base.bw_params);
+
+	if (clk_mgr->wm_range_table)
+		dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_GART,
+				clk_mgr->wm_range_table);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h
new file mode 100644
index 000000000000..57e09c7c95f5
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.h
@@ -0,0 +1,39 @@
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
+ * Authors: AMD
+ *
+ */
+#ifndef __DCN32_CLK_MGR_H_
+#define __DCN32_CLK_MGR_H_
+
+void dcn32_init_clocks(struct clk_mgr *clk_mgr_base);
+
+void dcn32_clk_mgr_construct(struct dc_context *ctx,
+		struct clk_mgr_internal *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg);
+
+void dcn32_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr);
+
+
+
+#endif /* __DCN32_CLK_MGR_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c
new file mode 100644
index 000000000000..35e8afe6db93
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.c
@@ -0,0 +1,117 @@
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
+ * Authors: AMD
+ *
+ */
+
+#include "dcn32_clk_mgr_smu_msg.h"
+
+#include "clk_mgr_internal.h"
+#include "reg_helper.h"
+
+#define mmDAL_MSG_REG  0x1628A
+#define mmDAL_ARG_REG  0x16273
+#define mmDAL_RESP_REG 0x16274
+
+#define DALSMC_MSG_TransferTableDram2Smu          0x8
+
+#define REG(reg_name) \
+	mm ## reg_name
+
+#include "logger_types.h"
+#include "dalsmc.h"
+#include "smu13_driver_if.h"
+
+#define smu_print(str, ...) {DC_LOG_SMU(str, ##__VA_ARGS__); }
+
+
+/*
+ * Function to be used instead of REG_WAIT macro because the wait ends when
+ * the register is NOT EQUAL to zero, and because the translation in msg_if.h
+ * won't work with REG_WAIT.
+ */
+static uint32_t dcn32_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
+{
+	uint32_t reg = 0;
+
+	do {
+		reg = REG_READ(DAL_RESP_REG);
+		if (reg)
+			break;
+
+		if (delay_us >= 1000)
+			msleep(delay_us/1000);
+		else if (delay_us > 0)
+			udelay(delay_us);
+	} while (max_retries--);
+
+	return reg;
+}
+
+static bool dcn32_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr, uint32_t msg_id, uint32_t param_in, uint32_t *param_out)
+{
+	/* Wait for response register to be ready */
+	dcn32_smu_wait_for_response(clk_mgr, 10, 200000);
+
+	/* Clear response register */
+	REG_WRITE(DAL_RESP_REG, 0);
+
+	/* Set the parameter register for the SMU message */
+	REG_WRITE(DAL_ARG_REG, param_in);
+
+	/* Trigger the message transaction by writing the message ID */
+	REG_WRITE(DAL_MSG_REG, msg_id);
+
+	/* Wait for response */
+	if (dcn32_smu_wait_for_response(clk_mgr, 10, 200000) == DALSMC_Result_OK) {
+		if (param_out)
+			*param_out = REG_READ(DAL_ARG_REG);
+
+		return true;
+	}
+
+	return false;
+}
+
+void dcn32_smu_send_fclk_pstate_message(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	smu_print("FCLK P-state support value is : %d\n", enable);
+
+	dcn32_smu_send_msg_with_param(clk_mgr,
+			DALSMC_MSG_SetFclkSwitchAllow, enable ? FCLK_PSTATE_SUPPORTED : FCLK_PSTATE_NOTSUPPORTED, NULL);
+}
+
+void dcn32_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr)
+{
+       smu_print("SMU Transfer WM table DRAM 2 SMU\n");
+
+       dcn32_smu_send_msg_with_param(clk_mgr,
+                       DALSMC_MSG_TransferTableDram2Smu, TABLE_WATERMARKS, NULL);
+}
+
+void dcn32_smu_send_cab_for_uclk_message(struct clk_mgr_internal *clk_mgr, unsigned int num_ways)
+{
+	smu_print("Numways for SubVP : %d\n", num_ways);
+
+	dcn32_smu_send_msg_with_param(clk_mgr, DALSMC_MSG_SetCabForUclkPstate, num_ways, NULL);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h
new file mode 100644
index 000000000000..11b25de1527f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr_smu_msg.h
@@ -0,0 +1,49 @@
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
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DCN32_CLK_MGR_SMU_MSG_H_
+#define __DCN32_CLK_MGR_SMU_MSG_H_
+
+#include "core_types.h"
+#include "dcn30/dcn30_clk_mgr_smu_msg.h"
+
+#define FCLK_PSTATE_NOTSUPPORTED       0x00
+#define FCLK_PSTATE_SUPPORTED          0x01
+
+/* TODO Remove this MSG ID define after it becomes available in dalsmc */
+#define DALSMC_MSG_SetFclkSwitchAllow	0x11
+#define DALSMC_MSG_SetCabForUclkPstate	0x12
+#define DALSMC_Result_OK				0x1
+
+void
+dcn32_smu_send_fclk_pstate_message(struct clk_mgr_internal *clk_mgr,
+				   bool enable);
+
+void dcn32_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr);
+
+void dcn32_smu_send_cab_for_uclk_message(struct clk_mgr_internal *clk_mgr, unsigned int num_ways);
+
+
+#endif /* __DCN32_CLK_MGR_SMU_MSG_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h
new file mode 100644
index 000000000000..deeb85047e7b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn32/smu13_driver_if.h
@@ -0,0 +1,108 @@
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
+ * Authors: AMD
+ *
+ */
+#ifndef SMU13_DRIVER_IF_DCN32_H
+#define SMU13_DRIVER_IF_DCN32_H
+
+// *** IMPORTANT ***
+// PMFW TEAM: Always increment the interface version on any change to this file
+#define SMU13_DRIVER_IF_VERSION  0x18
+
+//Only Clks that have DPM descriptors are listed here
+typedef enum {
+  PPCLK_GFXCLK = 0,
+  PPCLK_SOCCLK,
+  PPCLK_UCLK,
+  PPCLK_FCLK,
+  PPCLK_DCLK_0,
+  PPCLK_VCLK_0,
+  PPCLK_DCLK_1,
+  PPCLK_VCLK_1,
+  PPCLK_DISPCLK,
+  PPCLK_DPPCLK,
+  PPCLK_DPREFCLK,
+  PPCLK_DCFCLK,
+  PPCLK_DTBCLK,
+  PPCLK_COUNT,
+} PPCLK_e;
+
+typedef enum {
+  UCLK_DIV_BY_1 = 0,
+  UCLK_DIV_BY_2,
+  UCLK_DIV_BY_4,
+  UCLK_DIV_BY_8,
+} UCLK_DIV_e;
+
+typedef struct {
+  uint8_t  WmSetting;
+  uint8_t  Flags;
+  uint8_t  Padding[2];
+
+} WatermarkRowGeneric_t;
+
+#define NUM_WM_RANGES 4
+
+typedef enum {
+  WATERMARKS_CLOCK_RANGE = 0,
+  WATERMARKS_DUMMY_PSTATE,
+  WATERMARKS_MALL,
+  WATERMARKS_COUNT,
+} WATERMARKS_FLAGS_e;
+
+typedef struct {
+  // Watermarks
+  WatermarkRowGeneric_t WatermarkRow[NUM_WM_RANGES];
+} Watermarks_t;
+
+typedef struct {
+  Watermarks_t Watermarks;
+  uint32_t  Spare[16];
+
+  uint32_t     MmHubPadding[8]; // SMU internal use
+} WatermarksExternal_t;
+
+// These defines are used with the following messages:
+// SMC_MSG_TransferTableDram2Smu
+// SMC_MSG_TransferTableSmu2Dram
+
+// Table transfer status
+#define TABLE_TRANSFER_OK         0x0
+#define TABLE_TRANSFER_FAILED     0xFF
+#define TABLE_TRANSFER_PENDING    0xAB
+
+// Table types
+#define TABLE_PMFW_PPTABLE            0
+#define TABLE_COMBO_PPTABLE           1
+#define TABLE_WATERMARKS              2
+#define TABLE_AVFS_PSM_DEBUG          3
+#define TABLE_PMSTATUSLOG             4
+#define TABLE_SMU_METRICS             5
+#define TABLE_DRIVER_SMU_CONFIG       6
+#define TABLE_ACTIVITY_MONITOR_COEFF  7
+#define TABLE_OVERDRIVE               8
+#define TABLE_I2C_COMMANDS            9
+#define TABLE_DRIVER_INFO             10
+#define TABLE_COUNT                   11
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 3c9523218c19..99b17629a203 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -3975,6 +3975,9 @@ static bool decide_mst_link_settings(const struct dc_link *link, struct dc_link_
 	return true;
 }
 
+bool FORCE_RATE = false;
+uint32_t FORCE_LANE_COUNT = 0;
+
 void decide_link_settings(struct dc_stream_state *stream,
 	struct dc_link_settings *link_setting)
 {
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index 3960c74482be..2eabcdef8903 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -416,12 +416,15 @@ struct dc_clocks {
 	bool p_state_change_support;
 	enum dcn_zstate_support_state zstate_support;
 	bool dtbclk_en;
+	int dtbclk_khz;
+	bool fclk_p_state_change_support;
 	enum dcn_pwr_state pwr_state;
 	/*
 	 * Elements below are not compared for the purposes of
 	 * optimization required
 	 */
 	bool prev_p_state_change_support;
+	bool fclk_prev_p_state_change_support;
 	enum dtm_pstate dtm_level;
 	int max_supported_dppclk_khz;
 	int max_supported_dispclk_khz;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
new file mode 100644
index 000000000000..a8fb4ab8ced1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
@@ -0,0 +1,2325 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
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
+ * Authors: AMD
+ *
+ */
+
+
+#include "dm_services.h"
+#include "dc.h"
+
+#include "dcn32/dcn32_init.h"
+
+#include "resource.h"
+#include "include/irq_service_interface.h"
+#include "dcn32/dcn32_resource.h"
+#include "dcn321_resource.h"
+
+#include "dcn20/dcn20_resource.h"
+#include "dcn30/dcn30_resource.h"
+
+#include "dcn10/dcn10_ipp.h"
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn31/dcn31_hubbub.h"
+#include "dcn32/dcn32_hubbub.h"
+#include "dcn32/dcn32_mpc.h"
+#include "dcn32/dcn32_hubp.h"
+#include "irq/dcn32/irq_service_dcn32.h"
+#include "dcn32/dcn32_dpp.h"
+#include "dcn32/dcn32_optc.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn30/dcn30_opp.h"
+#include "dcn20/dcn20_dsc.h"
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+#include "dcn30/dcn30_dio_stream_encoder.h"
+#include "dcn32/dcn32_dio_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_link_encoder.h"
+#include "dcn32/dcn32_hpo_dp_link_encoder.h"
+#include "dc_link_dp.h"
+#include "dcn31/dcn31_apg.h"
+#include "dcn31/dcn31_dio_link_encoder.h"
+#include "dcn32/dcn32_dio_link_encoder.h"
+#include "dce/dce_clock_source.h"
+#include "dce/dce_audio.h"
+#include "dce/dce_hwseq.h"
+#include "clk_mgr.h"
+#include "virtual/virtual_stream_encoder.h"
+#include "dml/display_mode_vba.h"
+#include "dcn32/dcn32_dccg.h"
+#include "dcn10/dcn10_resource.h"
+#include "dc_link_ddc.h"
+#include "dcn31/dcn31_panel_cntl.h"
+
+#include "dcn30/dcn30_dwb.h"
+#include "dcn32/dcn32_mmhubbub.h"
+
+#include "dcn/dcn_3_2_1_offset.h"
+#include "dcn/dcn_3_2_1_sh_mask.h"
+#include "nbio/nbio_4_3_0_offset.h"
+
+#include "reg_helper.h"
+#include "dce/dmub_abm.h"
+#include "dce/dmub_psr.h"
+#include "dce/dce_aux.h"
+#include "dce/dce_i2c.h"
+
+#include "dml/dcn30/display_mode_vba_30.h"
+#include "vm_helper.h"
+#include "dcn20/dcn20_vmid.h"
+
+#define DCN_BASE__INST0_SEG1                       0x000000C0
+#define DCN_BASE__INST0_SEG2                       0x000034C0
+#define DCN_BASE__INST0_SEG3                       0x00009000
+#define NBIO_BASE__INST0_SEG1                      0x00000014
+
+#define MAX_INSTANCE                                        8
+#define MAX_SEGMENT                                         6
+
+
+struct IP_BASE_INSTANCE
+{
+    unsigned int segment[MAX_SEGMENT];
+};
+
+struct IP_BASE
+{
+    struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
+};
+
+static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+
+#define DC_LOGGER_INIT(logger)
+#define fixed16_to_double(x) (((double) x) / ((double) (1 << 16)))
+#define fixed16_to_double_to_cpu(x) fixed16_to_double(le32_to_cpu(x))
+
+#define DCN3_2_DEFAULT_DET_SIZE 256
+
+struct _vcs_dpi_ip_params_st dcn3_21_ip = {
+	.gpuvm_enable = 1,
+	.gpuvm_max_page_table_levels = 1,
+	.hostvm_enable = 0,
+	.rob_buffer_size_kbytes = 128,
+	.det_buffer_size_kbytes = DCN3_2_DEFAULT_DET_SIZE,
+	.config_return_buffer_size_in_kbytes = 1280,
+	.compressed_buffer_segment_size_in_kbytes = 64,
+	.meta_fifo_size_in_kentries = 22,
+	.zero_size_buffer_entries = 512,
+	.compbuf_reserved_space_64b = 256,
+	.compbuf_reserved_space_zs = 64,
+	.dpp_output_buffer_pixels = 2560,
+	.opp_output_buffer_lines = 1,
+	.pixel_chunk_size_kbytes = 8,
+	.alpha_pixel_chunk_size_kbytes = 4, // not appearing in spreadsheet, match c code from hw team
+	.min_pixel_chunk_size_bytes = 1024,
+	.dcc_meta_buffer_size_bytes = 6272,
+	.meta_chunk_size_kbytes = 2,
+	.min_meta_chunk_size_bytes = 256,
+	.writeback_chunk_size_kbytes = 8,
+	.ptoi_supported = false,
+	.num_dsc = 4,
+	.maximum_dsc_bits_per_component = 12,
+	.maximum_pixels_per_line_per_dsc_unit = 6016,
+	.dsc422_native_support = true,
+	.is_line_buffer_bpp_fixed = true,
+	.line_buffer_fixed_bpp = 57,
+	.line_buffer_size_bits = 1171920, //DPP doc, DCN3_2_DisplayMode_73.xlsm still shows as 986880 bits with 48 bpp
+	.max_line_buffer_lines = 32,
+	.writeback_interface_buffer_size_kbytes = 90,
+	.max_num_dpp = 4,
+	.max_num_otg = 4,
+	.max_num_hdmi_frl_outputs = 1,
+	.max_num_wb = 1,
+	.max_dchub_pscl_bw_pix_per_clk = 4,
+	.max_pscl_lb_bw_pix_per_clk = 2,
+	.max_lb_vscl_bw_pix_per_clk = 4,
+	.max_vscl_hscl_bw_pix_per_clk = 4,
+	.max_hscl_ratio = 6,
+	.max_vscl_ratio = 6,
+	.max_hscl_taps = 8,
+	.max_vscl_taps = 8,
+	.dpte_buffer_size_in_pte_reqs_luma = 64,
+	.dpte_buffer_size_in_pte_reqs_chroma = 34,
+	.dispclk_ramp_margin_percent = 1,
+	.max_inter_dcn_tile_repeaters = 8,
+	.cursor_buffer_size = 16,
+	.cursor_chunk_size = 2,
+	.writeback_line_buffer_buffer_size = 0,
+	.writeback_min_hscl_ratio = 1,
+	.writeback_min_vscl_ratio = 1,
+	.writeback_max_hscl_ratio = 1,
+	.writeback_max_vscl_ratio = 1,
+	.writeback_max_hscl_taps = 1,
+	.writeback_max_vscl_taps = 1,
+	.dppclk_delay_subtotal = 47,
+	.dppclk_delay_scl = 50,
+	.dppclk_delay_scl_lb_only = 16,
+	.dppclk_delay_cnvc_formatter = 28,
+	.dppclk_delay_cnvc_cursor = 6,
+	.dispclk_delay_subtotal = 125,
+	.dynamic_metadata_vm_enabled = false,
+	.odm_combine_4to1_supported = false,
+	.dcc_supported = true,
+	.max_num_dp2p0_outputs = 2,
+	.max_num_dp2p0_streams = 4,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn3_21_soc = {
+	.clock_limits = {
+		{
+			.state = 0,
+			.dcfclk_mhz = 1564.0,
+			.fabricclk_mhz = 400.0,
+			.dispclk_mhz = 2150.0,
+			.dppclk_mhz = 2150.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.phyclk_d32_mhz = 625.0,
+			.socclk_mhz = 1200.0,
+			.dscclk_mhz = 716.667,
+			.dram_speed_mts = 1600.0,
+			.dtbclk_mhz = 1564.0,
+		},
+	},
+	.num_states = 1,
+	.sr_exit_time_us = 5.20,
+	.sr_enter_plus_exit_time_us = 9.60,
+	.sr_exit_z8_time_us = 285.0,
+	.sr_enter_plus_exit_z8_time_us = 320,
+	.writeback_latency_us = 12.0,
+	.round_trip_ping_latency_dcfclk_cycles = 263,
+	.urgent_latency_pixel_data_only_us = 4.0,
+	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+	.urgent_latency_vm_data_only_us = 4.0,
+	.fclk_change_latency_us = 20,
+	.usr_retraining_latency_us = 2,
+	.smn_latency_us = 2,
+	.mall_allocated_for_dcn_mbytes = 64,
+	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+	.pct_ideal_sdp_bw_after_urgent = 100.0,
+	.pct_ideal_fabric_bw_after_urgent = 67.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 20.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0, // N/A, for now keep as is until DML implemented
+	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 30.0, // N/A, for now keep as is until DML implemented
+	.pct_ideal_dram_bw_after_urgent_strobe = 67.0,
+	.max_avg_sdp_bw_use_normal_percent = 80.0,
+	.max_avg_fabric_bw_use_normal_percent = 60.0,
+	.max_avg_dram_bw_use_normal_strobe_percent = 50.0,
+	.max_avg_dram_bw_use_normal_percent = 15.0,
+	.num_chans = 8,
+	.dram_channel_width_bytes = 2,
+	.fabric_datapath_to_dcn_data_return_bytes = 64,
+	.return_bus_width_bytes = 64,
+	.downspread_percent = 0.38,
+	.dcn_downspread_percent = 0.5,
+	.dram_clock_change_latency_us = 400,
+	.dispclk_dppclk_vco_speed_mhz = 4300.0,
+	.do_urgent_latency_adjustment = true,
+	.urgent_latency_adjustment_fabric_clock_component_us = 1.0,
+	.urgent_latency_adjustment_fabric_clock_reference_mhz = 1000,
+};
+
+enum dcn321_clk_src_array_id {
+	DCN321_CLK_SRC_PLL0,
+	DCN321_CLK_SRC_PLL1,
+	DCN321_CLK_SRC_PLL2,
+	DCN321_CLK_SRC_PLL3,
+	DCN321_CLK_SRC_PLL4,
+	DCN321_CLK_SRC_TOTAL
+};
+
+/* begin *********************
+ * macros to expend register list macro defined in HW object header file
+ */
+
+/* DCN */
+/* TODO awful hack. fixup dcn20_dwb.h */
+#undef BASE_INNER
+#define BASE_INNER(seg) DCN_BASE__INST0_SEG ## seg
+
+#define BASE(seg) BASE_INNER(seg)
+
+#define SR(reg_name)\
+		.reg_name = BASE(reg ## reg_name ## _BASE_IDX) +  \
+					reg ## reg_name
+
+#define SRI(reg_name, block, id)\
+	.reg_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRI2(reg_name, block, id)\
+	.reg_name = BASE(reg ## reg_name ## _BASE_IDX) + \
+					reg ## reg_name
+
+#define SRIR(var_name, reg_name, block, id)\
+	.var_name = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII(reg_name, block, id)\
+	.reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII_MPC_RMU(reg_name, block, id)\
+	.RMU##_##reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define SRII_DWB(reg_name, temp_name, block, id)\
+	.reg_name[id] = BASE(reg ## block ## id ## _ ## temp_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## temp_name
+
+#define DCCG_SRII(reg_name, block, id)\
+	.block ## _ ## reg_name[id] = BASE(reg ## block ## id ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## id ## _ ## reg_name
+
+#define VUPDATE_SRII(reg_name, block, id)\
+	.reg_name[id] = BASE(reg ## reg_name ## _ ## block ## id ## _BASE_IDX) + \
+					reg ## reg_name ## _ ## block ## id
+
+/* NBIO */
+#define NBIO_BASE_INNER(seg) \
+	NBIO_BASE__INST0_SEG ## seg
+
+#define NBIO_BASE(seg) \
+	NBIO_BASE_INNER(seg)
+
+#define NBIO_SR(reg_name)\
+		.reg_name = NBIO_BASE(regBIF_BX0_ ## reg_name ## _BASE_IDX) + \
+					regBIF_BX0_ ## reg_name
+
+#define CTX ctx
+#define REG(reg_name) \
+	(DCN_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
+
+static const struct bios_registers bios_regs = {
+		NBIO_SR(BIOS_SCRATCH_3),
+		NBIO_SR(BIOS_SCRATCH_6)
+};
+
+#define clk_src_regs(index, pllid)\
+[index] = {\
+	CS_COMMON_REG_LIST_DCN3_0(index, pllid),\
+}
+
+static const struct dce110_clk_src_regs clk_src_regs[] = {
+	clk_src_regs(0, A),
+	clk_src_regs(1, B),
+	clk_src_regs(2, C),
+	clk_src_regs(3, D)
+};
+
+static const struct dce110_clk_src_shift cs_shift = {
+		CS_COMMON_MASK_SH_LIST_DCN3_2(__SHIFT)
+};
+
+static const struct dce110_clk_src_mask cs_mask = {
+		CS_COMMON_MASK_SH_LIST_DCN3_2(_MASK)
+};
+
+#define abm_regs(id)\
+[id] = {\
+		ABM_DCN32_REG_LIST(id)\
+}
+
+static const struct dce_abm_registers abm_regs[] = {
+		abm_regs(0),
+		abm_regs(1),
+		abm_regs(2),
+		abm_regs(3),
+};
+
+static const struct dce_abm_shift abm_shift = {
+		ABM_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dce_abm_mask abm_mask = {
+		ABM_MASK_SH_LIST_DCN32(_MASK)
+};
+
+#define audio_regs(id)\
+[id] = {\
+		AUD_COMMON_REG_LIST(id)\
+}
+
+static const struct dce_audio_registers audio_regs[] = {
+	audio_regs(0),
+	audio_regs(1),
+	audio_regs(2),
+	audio_regs(3),
+	audio_regs(4)
+};
+
+#define DCE120_AUD_COMMON_MASK_SH_LIST(mask_sh)\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_INDEX, AZALIA_ENDPOINT_REG_INDEX, mask_sh),\
+		SF(AZF0ENDPOINT0_AZALIA_F0_CODEC_ENDPOINT_DATA, AZALIA_ENDPOINT_REG_DATA, mask_sh),\
+		AUD_COMMON_MASK_SH_LIST_BASE(mask_sh)
+
+static const struct dce_audio_shift audio_shift = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_audio_mask audio_mask = {
+		DCE120_AUD_COMMON_MASK_SH_LIST(_MASK)
+};
+
+#define vpg_regs(id)\
+[id] = {\
+	VPG_DCN3_REG_LIST(id)\
+}
+
+static const struct dcn30_vpg_registers vpg_regs[] = {
+	vpg_regs(0),
+	vpg_regs(1),
+	vpg_regs(2),
+	vpg_regs(3),
+	vpg_regs(4),
+	vpg_regs(5),
+	vpg_regs(6),
+	vpg_regs(7),
+	vpg_regs(8),
+	vpg_regs(9),
+};
+
+static const struct dcn30_vpg_shift vpg_shift = {
+	DCN3_VPG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn30_vpg_mask vpg_mask = {
+	DCN3_VPG_MASK_SH_LIST(_MASK)
+};
+
+#define afmt_regs(id)\
+[id] = {\
+	AFMT_DCN3_REG_LIST(id)\
+}
+
+static const struct dcn30_afmt_registers afmt_regs[] = {
+	afmt_regs(0),
+	afmt_regs(1),
+	afmt_regs(2),
+	afmt_regs(3),
+	afmt_regs(4),
+	afmt_regs(5)
+};
+
+static const struct dcn30_afmt_shift afmt_shift = {
+	DCN3_AFMT_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn30_afmt_mask afmt_mask = {
+	DCN3_AFMT_MASK_SH_LIST(_MASK)
+};
+
+#define apg_regs(id)\
+[id] = {\
+	APG_DCN31_REG_LIST(id)\
+}
+
+static const struct dcn31_apg_registers apg_regs[] = {
+	apg_regs(0),
+	apg_regs(1),
+	apg_regs(2),
+	apg_regs(3)
+};
+
+static const struct dcn31_apg_shift apg_shift = {
+	DCN31_APG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_apg_mask apg_mask = {
+		DCN31_APG_MASK_SH_LIST(_MASK)
+};
+
+#define stream_enc_regs(id)\
+[id] = {\
+	SE_DCN32_REG_LIST(id)\
+}
+
+static const struct dcn10_stream_enc_registers stream_enc_regs[] = {
+	stream_enc_regs(0),
+	stream_enc_regs(1),
+	stream_enc_regs(2),
+	stream_enc_regs(3),
+	stream_enc_regs(4)
+};
+
+static const struct dcn10_stream_encoder_shift se_shift = {
+		SE_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dcn10_stream_encoder_mask se_mask = {
+		SE_COMMON_MASK_SH_LIST_DCN32(_MASK)
+};
+
+
+#define aux_regs(id)\
+[id] = {\
+	DCN2_AUX_REG_LIST(id)\
+}
+
+static const struct dcn10_link_enc_aux_registers link_enc_aux_regs[] = {
+		aux_regs(0),
+		aux_regs(1),
+		aux_regs(2),
+		aux_regs(3),
+		aux_regs(4)
+};
+
+#define hpd_regs(id)\
+[id] = {\
+	HPD_REG_LIST(id)\
+}
+
+static const struct dcn10_link_enc_hpd_registers link_enc_hpd_regs[] = {
+		hpd_regs(0),
+		hpd_regs(1),
+		hpd_regs(2),
+		hpd_regs(3),
+		hpd_regs(4)
+};
+
+#define link_regs(id, phyid)\
+[id] = {\
+	LE_DCN31_REG_LIST(id), \
+	UNIPHY_DCN2_REG_LIST(phyid), \
+	/*DPCS_DCN31_REG_LIST(id),*/ \
+}
+
+static const struct dcn10_link_enc_registers link_enc_regs[] = {
+	link_regs(0, A),
+	link_regs(1, B),
+	link_regs(2, C),
+	link_regs(3, D),
+	link_regs(4, E)
+};
+
+static const struct dcn10_link_enc_shift le_shift = {
+	LINK_ENCODER_MASK_SH_LIST_DCN31(__SHIFT), \
+//	DPCS_DCN31_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+	LINK_ENCODER_MASK_SH_LIST_DCN31(_MASK), \
+//	DPCS_DCN31_MASK_SH_LIST(_MASK)
+};
+
+#define hpo_dp_stream_encoder_reg_list(id)\
+[id] = {\
+	DCN3_1_HPO_DP_STREAM_ENC_REG_LIST(id)\
+}
+
+static const struct dcn31_hpo_dp_stream_encoder_registers hpo_dp_stream_enc_regs[] = {
+	hpo_dp_stream_encoder_reg_list(0),
+	hpo_dp_stream_encoder_reg_list(1),
+	hpo_dp_stream_encoder_reg_list(2),
+	hpo_dp_stream_encoder_reg_list(3),
+};
+
+static const struct dcn31_hpo_dp_stream_encoder_shift hpo_dp_se_shift = {
+	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_hpo_dp_stream_encoder_mask hpo_dp_se_mask = {
+	DCN3_1_HPO_DP_STREAM_ENC_MASK_SH_LIST(_MASK)
+};
+
+
+#define hpo_dp_link_encoder_reg_list(id)\
+[id] = {\
+	DCN3_1_HPO_DP_LINK_ENC_REG_LIST(id),\
+	/*DCN3_1_RDPCSTX_REG_LIST(0),*/\
+	/*DCN3_1_RDPCSTX_REG_LIST(1),*/\
+	/*DCN3_1_RDPCSTX_REG_LIST(2),*/\
+	/*DCN3_1_RDPCSTX_REG_LIST(3),*/\
+	/*DCN3_1_RDPCSTX_REG_LIST(4)*/\
+}
+
+static const struct dcn31_hpo_dp_link_encoder_registers hpo_dp_link_enc_regs[] = {
+	hpo_dp_link_encoder_reg_list(0),
+	hpo_dp_link_encoder_reg_list(1),
+};
+
+static const struct dcn31_hpo_dp_link_encoder_shift hpo_dp_le_shift = {
+	DCN3_2_HPO_DP_LINK_ENC_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_hpo_dp_link_encoder_mask hpo_dp_le_mask = {
+	DCN3_2_HPO_DP_LINK_ENC_MASK_SH_LIST(_MASK)
+};
+
+#define dpp_regs(id)\
+[id] = {\
+	DPP_REG_LIST_DCN30_COMMON(id),\
+}
+
+static const struct dcn3_dpp_registers dpp_regs[] = {
+	dpp_regs(0),
+	dpp_regs(1),
+	dpp_regs(2),
+	dpp_regs(3)
+};
+
+static const struct dcn3_dpp_shift tf_shift = {
+		DPP_REG_LIST_SH_MASK_DCN30_COMMON(__SHIFT)
+};
+
+static const struct dcn3_dpp_mask tf_mask = {
+		DPP_REG_LIST_SH_MASK_DCN30_COMMON(_MASK)
+};
+
+
+#define opp_regs(id)\
+[id] = {\
+	OPP_REG_LIST_DCN30(id),\
+}
+
+static const struct dcn20_opp_registers opp_regs[] = {
+	opp_regs(0),
+	opp_regs(1),
+	opp_regs(2),
+	opp_regs(3)
+};
+
+static const struct dcn20_opp_shift opp_shift = {
+	OPP_MASK_SH_LIST_DCN20(__SHIFT)
+};
+
+static const struct dcn20_opp_mask opp_mask = {
+	OPP_MASK_SH_LIST_DCN20(_MASK)
+};
+
+#define aux_engine_regs(id)\
+[id] = {\
+	AUX_COMMON_REG_LIST0(id), \
+	.AUXN_IMPCAL = 0, \
+	.AUXP_IMPCAL = 0, \
+	.AUX_RESET_MASK = DP_AUX0_AUX_CONTROL__AUX_RESET_MASK, \
+}
+
+static const struct dce110_aux_registers aux_engine_regs[] = {
+		aux_engine_regs(0),
+		aux_engine_regs(1),
+		aux_engine_regs(2),
+		aux_engine_regs(3),
+		aux_engine_regs(4)
+};
+
+static const struct dce110_aux_registers_shift aux_shift = {
+	DCN_AUX_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce110_aux_registers_mask aux_mask = {
+	DCN_AUX_MASK_SH_LIST(_MASK)
+};
+
+
+#define dwbc_regs_dcn3(id)\
+[id] = {\
+	DWBC_COMMON_REG_LIST_DCN30(id),\
+}
+
+static const struct dcn30_dwbc_registers dwbc30_regs[] = {
+	dwbc_regs_dcn3(0),
+};
+
+static const struct dcn30_dwbc_shift dwbc30_shift = {
+	DWBC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_dwbc_mask dwbc30_mask = {
+	DWBC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+#define mcif_wb_regs_dcn3(id)\
+[id] = {\
+	MCIF_WB_COMMON_REG_LIST_DCN32(id),\
+}
+
+static const struct dcn30_mmhubbub_registers mcif_wb30_regs[] = {
+	mcif_wb_regs_dcn3(0)
+};
+
+static const struct dcn30_mmhubbub_shift mcif_wb30_shift = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dcn30_mmhubbub_mask mcif_wb30_mask = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN32(_MASK)
+};
+
+#define dsc_regsDCN20(id)\
+[id] = {\
+	DSC_REG_LIST_DCN20(id)\
+}
+
+static const struct dcn20_dsc_registers dsc_regs[] = {
+	dsc_regsDCN20(0),
+	dsc_regsDCN20(1),
+	dsc_regsDCN20(2),
+	dsc_regsDCN20(3)
+};
+
+static const struct dcn20_dsc_shift dsc_shift = {
+	DSC_REG_LIST_SH_MASK_DCN20(__SHIFT)
+};
+
+static const struct dcn20_dsc_mask dsc_mask = {
+	DSC_REG_LIST_SH_MASK_DCN20(_MASK)
+};
+
+static const struct dcn30_mpc_registers mpc_regs = {
+		MPC_REG_LIST_DCN3_0(0),
+		MPC_REG_LIST_DCN3_0(1),
+		MPC_REG_LIST_DCN3_0(2),
+		MPC_REG_LIST_DCN3_0(3),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(0),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(1),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(2),
+		MPC_OUT_MUX_REG_LIST_DCN3_0(3),
+		MPC_MCM_REG_LIST_DCN32(0),
+		MPC_MCM_REG_LIST_DCN32(1),
+		MPC_MCM_REG_LIST_DCN32(2),
+		MPC_MCM_REG_LIST_DCN32(3),
+		MPC_DWB_MUX_REG_LIST_DCN3_0(0),
+};
+
+static const struct dcn30_mpc_shift mpc_shift = {
+	MPC_COMMON_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dcn30_mpc_mask mpc_mask = {
+	MPC_COMMON_MASK_SH_LIST_DCN32(_MASK)
+};
+
+#define optc_regs(id)\
+[id] = {OPTC_COMMON_REG_LIST_DCN3_2(id)}
+
+static const struct dcn_optc_registers optc_regs[] = {
+	optc_regs(0),
+	optc_regs(1),
+	optc_regs(2),
+	optc_regs(3)
+};
+
+static const struct dcn_optc_shift optc_shift = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_2(__SHIFT)
+};
+
+static const struct dcn_optc_mask optc_mask = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_2(_MASK)
+};
+
+#define hubp_regs(id)\
+[id] = {\
+	HUBP_REG_LIST_DCN32(id)\
+}
+
+static const struct dcn_hubp2_registers hubp_regs[] = {
+		hubp_regs(0),
+		hubp_regs(1),
+		hubp_regs(2),
+		hubp_regs(3)
+};
+
+
+static const struct dcn_hubp2_shift hubp_shift = {
+		HUBP_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dcn_hubp2_mask hubp_mask = {
+		HUBP_MASK_SH_LIST_DCN32(_MASK)
+};
+static const struct dcn_hubbub_registers hubbub_reg = {
+		HUBBUB_REG_LIST_DCN32(0)
+};
+
+static const struct dcn_hubbub_shift hubbub_shift = {
+		HUBBUB_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dcn_hubbub_mask hubbub_mask = {
+		HUBBUB_MASK_SH_LIST_DCN32(_MASK)
+};
+
+static const struct dccg_registers dccg_regs = {
+		DCCG_REG_LIST_DCN32()
+};
+
+static const struct dccg_shift dccg_shift = {
+		DCCG_MASK_SH_LIST_DCN32(__SHIFT)
+};
+
+static const struct dccg_mask dccg_mask = {
+		DCCG_MASK_SH_LIST_DCN32(_MASK)
+};
+
+
+#define SRII2(reg_name_pre, reg_name_post, id)\
+	.reg_name_pre ## _ ##  reg_name_post[id] = BASE(reg ## reg_name_pre \
+			## id ## _ ## reg_name_post ## _BASE_IDX) + \
+			reg ## reg_name_pre ## id ## _ ## reg_name_post
+
+
+#define HWSEQ_DCN32_REG_LIST()\
+	SR(DCHUBBUB_GLOBAL_TIMER_CNTL), \
+	SR(DIO_MEM_PWR_CTRL), \
+	SR(ODM_MEM_PWR_CTRL3), \
+	SR(MMHUBBUB_MEM_PWR_CNTL), \
+	SR(DCCG_GATE_DISABLE_CNTL), \
+	SR(DCCG_GATE_DISABLE_CNTL2), \
+	SR(DCFCLK_CNTL),\
+	SR(DC_MEM_GLOBAL_PWR_REQ_CNTL), \
+	SRII(PIXEL_RATE_CNTL, OTG, 0), \
+	SRII(PIXEL_RATE_CNTL, OTG, 1),\
+	SRII(PIXEL_RATE_CNTL, OTG, 2),\
+	SRII(PIXEL_RATE_CNTL, OTG, 3),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 0),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 1),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 2),\
+	SRII(PHYPLL_PIXEL_RATE_CNTL, OTG, 3),\
+	SR(MICROSECOND_TIME_BASE_DIV), \
+	SR(MILLISECOND_TIME_BASE_DIV), \
+	SR(DISPCLK_FREQ_CHANGE_CNTL), \
+	SR(RBBMIF_TIMEOUT_DIS), \
+	SR(RBBMIF_TIMEOUT_DIS_2), \
+	SR(DCHUBBUB_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_CTRL), \
+	SR(DPP_TOP0_DPP_CRC_VAL_B_A), \
+	SR(DPP_TOP0_DPP_CRC_VAL_R_G), \
+	SR(MPC_CRC_CTRL), \
+	SR(MPC_CRC_RESULT_GB), \
+	SR(MPC_CRC_RESULT_C), \
+	SR(MPC_CRC_RESULT_AR), \
+	SR(DOMAIN0_PG_CONFIG), \
+	SR(DOMAIN1_PG_CONFIG), \
+	SR(DOMAIN2_PG_CONFIG), \
+	SR(DOMAIN3_PG_CONFIG), \
+	SR(DOMAIN16_PG_CONFIG), \
+	SR(DOMAIN17_PG_CONFIG), \
+	SR(DOMAIN18_PG_CONFIG), \
+	SR(DOMAIN19_PG_CONFIG), \
+	SR(DOMAIN0_PG_STATUS), \
+	SR(DOMAIN1_PG_STATUS), \
+	SR(DOMAIN2_PG_STATUS), \
+	SR(DOMAIN3_PG_STATUS), \
+	SR(DOMAIN16_PG_STATUS), \
+	SR(DOMAIN17_PG_STATUS), \
+	SR(DOMAIN18_PG_STATUS), \
+	SR(DOMAIN19_PG_STATUS), \
+	SR(D1VGA_CONTROL), \
+	SR(D2VGA_CONTROL), \
+	SR(D3VGA_CONTROL), \
+	SR(D4VGA_CONTROL), \
+	SR(D5VGA_CONTROL), \
+	SR(D6VGA_CONTROL), \
+	SR(DC_IP_REQUEST_CNTL), \
+	SR(AZALIA_AUDIO_DTO), \
+	SR(AZALIA_CONTROLLER_CLOCK_GATING)
+
+static const struct dce_hwseq_registers hwseq_reg = {
+		HWSEQ_DCN32_REG_LIST()
+};
+
+#define HWSEQ_DCN32_MASK_SH_LIST(mask_sh)\
+	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
+	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_CONFIG, DOMAIN_POWER_FORCEON, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_CONFIG, DOMAIN_POWER_GATE, mask_sh), \
+	HWS_SF(, DOMAIN0_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN19_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh), \
+	HWS_SF(, HPO_TOP_CLOCK_CONTROL, HPO_HDMISTREAMCLK_G_GATE_DIS, mask_sh), \
+	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_UNASSIGNED_PWR_MODE, mask_sh), \
+	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_VBLANK_PWR_MODE, mask_sh), \
+	HWS_SF(, MMHUBBUB_MEM_PWR_CNTL, VGA_MEM_PWR_FORCE, mask_sh)
+
+static const struct dce_hwseq_shift hwseq_shift = {
+		HWSEQ_DCN32_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_hwseq_mask hwseq_mask = {
+		HWSEQ_DCN32_MASK_SH_LIST(_MASK)
+};
+#define vmid_regs(id)\
+[id] = {\
+		DCN20_VMID_REG_LIST(id)\
+}
+
+static const struct dcn_vmid_registers vmid_regs[] = {
+	vmid_regs(0),
+	vmid_regs(1),
+	vmid_regs(2),
+	vmid_regs(3),
+	vmid_regs(4),
+	vmid_regs(5),
+	vmid_regs(6),
+	vmid_regs(7),
+	vmid_regs(8),
+	vmid_regs(9),
+	vmid_regs(10),
+	vmid_regs(11),
+	vmid_regs(12),
+	vmid_regs(13),
+	vmid_regs(14),
+	vmid_regs(15)
+};
+
+static const struct dcn20_vmid_shift vmid_shifts = {
+		DCN20_VMID_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn20_vmid_mask vmid_masks = {
+		DCN20_VMID_MASK_SH_LIST(_MASK)
+};
+
+static const struct resource_caps res_cap_dcn321 = {
+	.num_timing_generator = 4,
+	.num_opp = 4,
+	.num_video_plane = 4,
+	.num_audio = 5,
+	.num_stream_encoder = 5,
+	.num_hpo_dp_stream_encoder = 4,
+	.num_hpo_dp_link_encoder = 2,
+	.num_pll = 5,
+	.num_dwb = 1,
+	.num_ddc = 5,
+	.num_vmid = 16,
+	.num_mpc_3dlut = 4,
+	.num_dsc = 4,
+};
+
+static const struct dc_plane_cap plane_cap = {
+	.type = DC_PLANE_TYPE_DCN_UNIVERSAL,
+	.blends_with_above = true,
+	.blends_with_below = true,
+	.per_pixel_alpha = true,
+
+	.pixel_format_support = {
+			.argb8888 = true,
+			.nv12 = true,
+			.fp16 = true,
+			.p010 = true,
+			.ayuv = false,
+	},
+
+	.max_upscale_factor = {
+			.argb8888 = 16000,
+			.nv12 = 16000,
+			.fp16 = 16000
+	},
+
+	// 6:1 downscaling ratio: 1000/6 = 166.666
+	.max_downscale_factor = {
+			.argb8888 = 167,
+			.nv12 = 167,
+			.fp16 = 167
+	},
+	64,
+	64
+};
+
+static const struct dc_debug_options debug_defaults_drv = {
+	.disable_dmcu = true,
+	.force_abm_enable = false,
+	.timing_trace = false,
+	.clock_trace = true,
+	.disable_pplib_clock_request = false,
+	.pipe_split_policy = MPC_SPLIT_DYNAMIC,
+	.force_single_disp_pipe_split = false,
+	.disable_dcc = DCC_ENABLE,
+	.vsr_support = true,
+	.performance_trace = false,
+	.max_downscale_src_width = 7680,/*upto 8K*/
+	.disable_pplib_wm_range = false,
+	.scl_reset_length10 = true,
+	.sanity_checks = false,
+	.underflow_assert_delay_us = 0xFFFFFFFF,
+	.dwb_fi_phase = -1, // -1 = disable,
+	.dmub_command_table = true,
+	.enable_mem_low_power = {
+		.bits = {
+			.vga = false,
+			.i2c = false,
+			.dmcu = false, // This is previously known to cause hang on S3 cycles if enabled
+			.dscl = false,
+			.cm = false,
+			.mpc = false,
+			.optc = false,
+		}
+	},
+	.use_max_lb = true,
+	.force_disable_subvp = true
+};
+
+static const struct dc_debug_options debug_defaults_diags = {
+	.disable_dmcu = true,
+	.force_abm_enable = false,
+	.timing_trace = true,
+	.clock_trace = true,
+	.disable_dpp_power_gate = true,
+	.disable_hubp_power_gate = true,
+	.disable_dsc_power_gate = true,
+	.disable_clock_gate = true,
+	.disable_pplib_clock_request = true,
+	.disable_pplib_wm_range = true,
+	.disable_stutter = false,
+	.scl_reset_length10 = true,
+	.dwb_fi_phase = -1, // -1 = disable
+	.dmub_command_table = true,
+	.enable_tri_buf = true,
+	.use_max_lb = true,
+	.force_disable_subvp = true
+};
+
+
+static struct dce_aux *dcn321_aux_engine_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct aux_engine_dce110 *aux_engine =
+		kzalloc(sizeof(struct aux_engine_dce110), GFP_KERNEL);
+
+	if (!aux_engine)
+		return NULL;
+
+	dce110_aux_engine_construct(aux_engine, ctx, inst,
+				    SW_AUX_TIMEOUT_PERIOD_MULTIPLIER * AUX_TIMEOUT_PERIOD,
+				    &aux_engine_regs[inst],
+					&aux_mask,
+					&aux_shift,
+					ctx->dc->caps.extended_aux_timeout_support);
+
+	return &aux_engine->base;
+}
+#define i2c_inst_regs(id) { I2C_HW_ENGINE_COMMON_REG_LIST_DCN30(id) }
+
+static const struct dce_i2c_registers i2c_hw_regs[] = {
+		i2c_inst_regs(1),
+		i2c_inst_regs(2),
+		i2c_inst_regs(3),
+		i2c_inst_regs(4),
+		i2c_inst_regs(5),
+};
+
+static const struct dce_i2c_shift i2c_shifts = {
+		I2C_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dce_i2c_mask i2c_masks = {
+		I2C_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+static struct dce_i2c_hw *dcn321_i2c_hw_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dce_i2c_hw *dce_i2c_hw =
+		kzalloc(sizeof(struct dce_i2c_hw), GFP_KERNEL);
+
+	if (!dce_i2c_hw)
+		return NULL;
+
+	dcn2_i2c_hw_construct(dce_i2c_hw, ctx, inst,
+				    &i2c_hw_regs[inst], &i2c_shifts, &i2c_masks);
+
+	return dce_i2c_hw;
+}
+
+static struct clock_source *dcn321_clock_source_create(
+		struct dc_context *ctx,
+		struct dc_bios *bios,
+		enum clock_source_id id,
+		const struct dce110_clk_src_regs *regs,
+		bool dp_clk_src)
+{
+	struct dce110_clk_src *clk_src =
+		kzalloc(sizeof(struct dce110_clk_src), GFP_KERNEL);
+
+	if (!clk_src)
+		return NULL;
+
+	if (dcn3_clk_src_construct(clk_src, ctx, bios, id,
+			regs, &cs_shift, &cs_mask)) {
+		clk_src->base.dp_clk_src = dp_clk_src;
+		return &clk_src->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static struct hubbub *dcn321_hubbub_create(struct dc_context *ctx)
+{
+	int i;
+
+	struct dcn20_hubbub *hubbub2 = kzalloc(sizeof(struct dcn20_hubbub),
+					  GFP_KERNEL);
+
+	if (!hubbub2)
+		return NULL;
+
+	hubbub32_construct(hubbub2, ctx,
+			&hubbub_reg,
+			&hubbub_shift,
+			&hubbub_mask,
+			ctx->dc->dml.ip.det_buffer_size_kbytes,
+			ctx->dc->dml.ip.pixel_chunk_size_kbytes,
+			ctx->dc->dml.ip.config_return_buffer_size_in_kbytes);
+
+
+	for (i = 0; i < res_cap_dcn321.num_vmid; i++) {
+		struct dcn20_vmid *vmid = &hubbub2->vmid[i];
+
+		vmid->ctx = ctx;
+
+		vmid->regs = &vmid_regs[i];
+		vmid->shifts = &vmid_shifts;
+		vmid->masks = &vmid_masks;
+	}
+
+	return &hubbub2->base;
+}
+
+static struct hubp *dcn321_hubp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn20_hubp *hubp2 =
+		kzalloc(sizeof(struct dcn20_hubp), GFP_KERNEL);
+
+	if (!hubp2)
+		return NULL;
+
+	if (hubp32_construct(hubp2, ctx, inst,
+			&hubp_regs[inst], &hubp_shift, &hubp_mask))
+		return &hubp2->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(hubp2);
+	return NULL;
+}
+
+static void dcn321_dpp_destroy(struct dpp **dpp)
+{
+	kfree(TO_DCN30_DPP(*dpp));
+	*dpp = NULL;
+}
+
+static struct dpp *dcn321_dpp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn3_dpp *dpp3 =
+		kzalloc(sizeof(struct dcn3_dpp), GFP_KERNEL);
+
+	if (!dpp3)
+		return NULL;
+
+	if (dpp32_construct(dpp3, ctx, inst,
+			&dpp_regs[inst], &tf_shift, &tf_mask))
+		return &dpp3->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(dpp3);
+	return NULL;
+}
+
+static struct mpc *dcn321_mpc_create(
+		struct dc_context *ctx,
+		int num_mpcc,
+		int num_rmu)
+{
+	struct dcn30_mpc *mpc30 = kzalloc(sizeof(struct dcn30_mpc),
+					  GFP_KERNEL);
+
+	if (!mpc30)
+		return NULL;
+
+	dcn32_mpc_construct(mpc30, ctx,
+			&mpc_regs,
+			&mpc_shift,
+			&mpc_mask,
+			num_mpcc,
+			num_rmu);
+
+	return &mpc30->base;
+}
+
+static struct output_pixel_processor *dcn321_opp_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_opp *opp2 =
+		kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
+
+	if (!opp2) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dcn20_opp_construct(opp2, ctx, inst,
+			&opp_regs[inst], &opp_shift, &opp_mask);
+	return &opp2->base;
+}
+
+
+static struct timing_generator *dcn321_timing_generator_create(
+		struct dc_context *ctx,
+		uint32_t instance)
+{
+	struct optc *tgn10 =
+		kzalloc(sizeof(struct optc), GFP_KERNEL);
+
+	if (!tgn10)
+		return NULL;
+
+	tgn10->base.inst = instance;
+	tgn10->base.ctx = ctx;
+
+	tgn10->tg_regs = &optc_regs[instance];
+	tgn10->tg_shift = &optc_shift;
+	tgn10->tg_mask = &optc_mask;
+
+	dcn32_timing_generator_init(tgn10);
+
+	return &tgn10->base;
+}
+
+static const struct encoder_feature_support link_enc_feature = {
+		.max_hdmi_deep_color = COLOR_DEPTH_121212,
+		.max_hdmi_pixel_clock = 600000,
+		.hdmi_ycbcr420_supported = true,
+		.dp_ycbcr420_supported = true,
+		.fec_supported = true,
+		.flags.bits.IS_HBR2_CAPABLE = true,
+		.flags.bits.IS_HBR3_CAPABLE = true,
+		.flags.bits.IS_TPS3_CAPABLE = true,
+		.flags.bits.IS_TPS4_CAPABLE = true
+};
+
+static struct link_encoder *dcn321_link_encoder_create(
+	const struct encoder_init_data *enc_init_data)
+{
+	struct dcn20_link_encoder *enc20 =
+		kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+
+	if (!enc20)
+		return NULL;
+
+	dcn32_link_encoder_construct(enc20,
+			enc_init_data,
+			&link_enc_feature,
+			&link_enc_regs[enc_init_data->transmitter],
+			&link_enc_aux_regs[enc_init_data->channel - 1],
+			&link_enc_hpd_regs[enc_init_data->hpd_source],
+			&le_shift,
+			&le_mask);
+
+	return &enc20->enc10.base;
+}
+
+static void read_dce_straps(
+	struct dc_context *ctx,
+	struct resource_straps *straps)
+{
+	generic_reg_get(ctx, regDC_PINSTRAPS + BASE(regDC_PINSTRAPS_BASE_IDX),
+		FN(DC_PINSTRAPS, DC_PINSTRAPS_AUDIO), &straps->dc_pinstraps_audio);
+
+}
+
+static struct audio *dcn321_create_audio(
+		struct dc_context *ctx, unsigned int inst)
+{
+	return dce_audio_create(ctx, inst,
+			&audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+static struct vpg *dcn321_vpg_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn30_vpg *vpg3 = kzalloc(sizeof(struct dcn30_vpg), GFP_KERNEL);
+
+	if (!vpg3)
+		return NULL;
+
+	vpg3_construct(vpg3, ctx, inst,
+			&vpg_regs[inst],
+			&vpg_shift,
+			&vpg_mask);
+
+	return &vpg3->base;
+}
+
+static struct afmt *dcn321_afmt_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn30_afmt *afmt3 = kzalloc(sizeof(struct dcn30_afmt), GFP_KERNEL);
+
+	if (!afmt3)
+		return NULL;
+
+	afmt3_construct(afmt3, ctx, inst,
+			&afmt_regs[inst],
+			&afmt_shift,
+			&afmt_mask);
+
+	return &afmt3->base;
+}
+
+static struct apg *dcn321_apg_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_apg *apg31 = kzalloc(sizeof(struct dcn31_apg), GFP_KERNEL);
+
+	if (!apg31)
+		return NULL;
+
+	apg31_construct(apg31, ctx, inst,
+			&apg_regs[inst],
+			&apg_shift,
+			&apg_mask);
+
+	return &apg31->base;
+}
+
+static struct stream_encoder *dcn321_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dcn10_stream_encoder *enc1;
+	struct vpg *vpg;
+	struct afmt *afmt;
+	int vpg_inst;
+	int afmt_inst;
+
+	/* Mapping of VPG, AFMT, DME register blocks to DIO block instance */
+	if (eng_id <= ENGINE_ID_DIGF) {
+		vpg_inst = eng_id;
+		afmt_inst = eng_id;
+	} else
+		return NULL;
+
+	enc1 = kzalloc(sizeof(struct dcn10_stream_encoder), GFP_KERNEL);
+	vpg = dcn321_vpg_create(ctx, vpg_inst);
+	afmt = dcn321_afmt_create(ctx, afmt_inst);
+
+	if (!enc1 || !vpg || !afmt) {
+		kfree(enc1);
+		kfree(vpg);
+		kfree(afmt);
+		return NULL;
+	}
+
+	dcn32_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
+					eng_id, vpg, afmt,
+					&stream_enc_regs[eng_id],
+					&se_shift, &se_mask);
+
+	return &enc1->base;
+}
+
+static struct hpo_dp_stream_encoder *dcn321_hpo_dp_stream_encoder_create(
+	enum engine_id eng_id,
+	struct dc_context *ctx)
+{
+	struct dcn31_hpo_dp_stream_encoder *hpo_dp_enc31;
+	struct vpg *vpg;
+	struct apg *apg;
+	uint32_t hpo_dp_inst;
+	uint32_t vpg_inst;
+	uint32_t apg_inst;
+
+	ASSERT((eng_id >= ENGINE_ID_HPO_DP_0) && (eng_id <= ENGINE_ID_HPO_DP_3));
+	hpo_dp_inst = eng_id - ENGINE_ID_HPO_DP_0;
+
+	/* Mapping of VPG register blocks to HPO DP block instance:
+	 * VPG[6] -> HPO_DP[0]
+	 * VPG[7] -> HPO_DP[1]
+	 * VPG[8] -> HPO_DP[2]
+	 * VPG[9] -> HPO_DP[3]
+	 */
+	vpg_inst = hpo_dp_inst + 6;
+
+	/* Mapping of APG register blocks to HPO DP block instance:
+	 * APG[0] -> HPO_DP[0]
+	 * APG[1] -> HPO_DP[1]
+	 * APG[2] -> HPO_DP[2]
+	 * APG[3] -> HPO_DP[3]
+	 */
+	apg_inst = hpo_dp_inst;
+
+	/* allocate HPO stream encoder and create VPG sub-block */
+	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_stream_encoder), GFP_KERNEL);
+	vpg = dcn321_vpg_create(ctx, vpg_inst);
+	apg = dcn321_apg_create(ctx, apg_inst);
+
+	if (!hpo_dp_enc31 || !vpg || !apg) {
+		kfree(hpo_dp_enc31);
+		kfree(vpg);
+		kfree(apg);
+		return NULL;
+	}
+
+	dcn31_hpo_dp_stream_encoder_construct(hpo_dp_enc31, ctx, ctx->dc_bios,
+					hpo_dp_inst, eng_id, vpg, apg,
+					&hpo_dp_stream_enc_regs[hpo_dp_inst],
+					&hpo_dp_se_shift, &hpo_dp_se_mask);
+
+	return &hpo_dp_enc31->base;
+}
+
+static struct hpo_dp_link_encoder *dcn321_hpo_dp_link_encoder_create(
+	uint8_t inst,
+	struct dc_context *ctx)
+{
+	struct dcn31_hpo_dp_link_encoder *hpo_dp_enc31;
+
+	/* allocate HPO link encoder */
+	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_link_encoder), GFP_KERNEL);
+
+	hpo_dp_link_encoder32_construct(hpo_dp_enc31, ctx, inst,
+					&hpo_dp_link_enc_regs[inst],
+					&hpo_dp_le_shift, &hpo_dp_le_mask);
+
+	return &hpo_dp_enc31->base;
+}
+
+static struct dce_hwseq *dcn321_hwseq_create(
+	struct dc_context *ctx)
+{
+	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
+
+	if (hws) {
+		hws->ctx = ctx;
+		hws->regs = &hwseq_reg;
+		hws->shifts = &hwseq_shift;
+		hws->masks = &hwseq_mask;
+	}
+	return hws;
+}
+static const struct resource_create_funcs res_create_funcs = {
+	.read_dce_straps = read_dce_straps,
+	.create_audio = dcn321_create_audio,
+	.create_stream_encoder = dcn321_stream_encoder_create,
+	.create_hpo_dp_stream_encoder = dcn321_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn321_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn321_hwseq_create,
+};
+
+static const struct resource_create_funcs res_create_maximus_funcs = {
+	.read_dce_straps = NULL,
+	.create_audio = NULL,
+	.create_stream_encoder = NULL,
+	.create_hpo_dp_stream_encoder = dcn321_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn321_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn321_hwseq_create,
+};
+
+static void dcn321_resource_destruct(struct dcn321_resource_pool *pool)
+{
+	unsigned int i;
+
+	for (i = 0; i < pool->base.stream_enc_count; i++) {
+		if (pool->base.stream_enc[i] != NULL) {
+			if (pool->base.stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->base.stream_enc[i]->vpg));
+				pool->base.stream_enc[i]->vpg = NULL;
+			}
+			if (pool->base.stream_enc[i]->afmt != NULL) {
+				kfree(DCN30_AFMT_FROM_AFMT(pool->base.stream_enc[i]->afmt));
+				pool->base.stream_enc[i]->afmt = NULL;
+			}
+			kfree(DCN10STRENC_FROM_STRENC(pool->base.stream_enc[i]));
+			pool->base.stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.hpo_dp_stream_enc_count; i++) {
+		if (pool->base.hpo_dp_stream_enc[i] != NULL) {
+			if (pool->base.hpo_dp_stream_enc[i]->vpg != NULL) {
+				kfree(DCN30_VPG_FROM_VPG(pool->base.hpo_dp_stream_enc[i]->vpg));
+				pool->base.hpo_dp_stream_enc[i]->vpg = NULL;
+			}
+			if (pool->base.hpo_dp_stream_enc[i]->apg != NULL) {
+				kfree(DCN31_APG_FROM_APG(pool->base.hpo_dp_stream_enc[i]->apg));
+				pool->base.hpo_dp_stream_enc[i]->apg = NULL;
+			}
+			kfree(DCN3_1_HPO_DP_STREAM_ENC_FROM_HPO_STREAM_ENC(pool->base.hpo_dp_stream_enc[i]));
+			pool->base.hpo_dp_stream_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.hpo_dp_link_enc_count; i++) {
+		if (pool->base.hpo_dp_link_enc[i] != NULL) {
+			kfree(DCN3_1_HPO_DP_LINK_ENC_FROM_HPO_LINK_ENC(pool->base.hpo_dp_link_enc[i]));
+			pool->base.hpo_dp_link_enc[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		if (pool->base.dscs[i] != NULL)
+			dcn20_dsc_destroy(&pool->base.dscs[i]);
+	}
+
+	if (pool->base.mpc != NULL) {
+		kfree(TO_DCN20_MPC(pool->base.mpc));
+		pool->base.mpc = NULL;
+	}
+	if (pool->base.hubbub != NULL) {
+		kfree(TO_DCN20_HUBBUB(pool->base.hubbub));
+		pool->base.hubbub = NULL;
+	}
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		if (pool->base.dpps[i] != NULL)
+			dcn321_dpp_destroy(&pool->base.dpps[i]);
+
+		if (pool->base.ipps[i] != NULL)
+			pool->base.ipps[i]->funcs->ipp_destroy(&pool->base.ipps[i]);
+
+		if (pool->base.hubps[i] != NULL) {
+			kfree(TO_DCN20_HUBP(pool->base.hubps[i]));
+			pool->base.hubps[i] = NULL;
+		}
+
+		if (pool->base.irqs != NULL) {
+			dal_irq_service_destroy(&pool->base.irqs);
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		if (pool->base.engines[i] != NULL)
+			dce110_engine_destroy(&pool->base.engines[i]);
+		if (pool->base.hw_i2cs[i] != NULL) {
+			kfree(pool->base.hw_i2cs[i]);
+			pool->base.hw_i2cs[i] = NULL;
+		}
+		if (pool->base.sw_i2cs[i] != NULL) {
+			kfree(pool->base.sw_i2cs[i]);
+			pool->base.sw_i2cs[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_opp; i++) {
+		if (pool->base.opps[i] != NULL)
+			pool->base.opps[i]->funcs->opp_destroy(&pool->base.opps[i]);
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		if (pool->base.timing_generators[i] != NULL)	{
+			kfree(DCN10TG_FROM_TG(pool->base.timing_generators[i]));
+			pool->base.timing_generators[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dwb; i++) {
+		if (pool->base.dwbc[i] != NULL) {
+			kfree(TO_DCN30_DWBC(pool->base.dwbc[i]));
+			pool->base.dwbc[i] = NULL;
+		}
+		if (pool->base.mcif_wb[i] != NULL) {
+			kfree(TO_DCN30_MMHUBBUB(pool->base.mcif_wb[i]));
+			pool->base.mcif_wb[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.audio_count; i++) {
+		if (pool->base.audios[i])
+			dce_aud_destroy(&pool->base.audios[i]);
+	}
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] != NULL) {
+			dcn20_clock_source_destroy(&pool->base.clock_sources[i]);
+			pool->base.clock_sources[i] = NULL;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_mpc_3dlut; i++) {
+		if (pool->base.mpc_lut[i] != NULL) {
+			dc_3dlut_func_release(pool->base.mpc_lut[i]);
+			pool->base.mpc_lut[i] = NULL;
+		}
+		if (pool->base.mpc_shaper[i] != NULL) {
+			dc_transfer_func_release(pool->base.mpc_shaper[i]);
+			pool->base.mpc_shaper[i] = NULL;
+		}
+	}
+
+	if (pool->base.dp_clock_source != NULL) {
+		dcn20_clock_source_destroy(&pool->base.dp_clock_source);
+		pool->base.dp_clock_source = NULL;
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		if (pool->base.multiple_abms[i] != NULL)
+			dce_abm_destroy(&pool->base.multiple_abms[i]);
+	}
+
+	if (pool->base.psr != NULL)
+		dmub_psr_destroy(&pool->base.psr);
+
+	if (pool->base.dccg != NULL)
+		dcn_dccg_destroy(&pool->base.dccg);
+
+	if (pool->base.oem_device != NULL)
+		dal_ddc_service_destroy(&pool->base.oem_device);
+}
+
+
+static bool dcn321_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t dwb_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < dwb_count; i++) {
+		struct dcn30_dwbc *dwbc30 = kzalloc(sizeof(struct dcn30_dwbc),
+						    GFP_KERNEL);
+
+		if (!dwbc30) {
+			dm_error("DC: failed to create dwbc30!\n");
+			return false;
+		}
+
+		dcn30_dwbc_construct(dwbc30, ctx,
+				&dwbc30_regs[i],
+				&dwbc30_shift,
+				&dwbc30_mask,
+				i);
+
+		pool->dwbc[i] = &dwbc30->base;
+	}
+	return true;
+}
+
+static bool dcn321_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t dwb_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < dwb_count; i++) {
+		struct dcn30_mmhubbub *mcif_wb30 = kzalloc(sizeof(struct dcn30_mmhubbub),
+						    GFP_KERNEL);
+
+		if (!mcif_wb30) {
+			dm_error("DC: failed to create mcif_wb30!\n");
+			return false;
+		}
+
+		dcn32_mmhubbub_construct(mcif_wb30, ctx,
+				&mcif_wb30_regs[i],
+				&mcif_wb30_shift,
+				&mcif_wb30_mask,
+				i);
+
+		pool->mcif_wb[i] = &mcif_wb30->base;
+	}
+	return true;
+}
+
+static struct display_stream_compressor *dcn321_dsc_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_dsc *dsc =
+		kzalloc(sizeof(struct dcn20_dsc), GFP_KERNEL);
+
+	if (!dsc) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dsc2_construct(dsc, ctx, inst, &dsc_regs[inst], &dsc_shift, &dsc_mask);
+	return &dsc->base;
+}
+
+static void dcn321_destroy_resource_pool(struct resource_pool **pool)
+{
+	struct dcn321_resource_pool *dcn321_pool = TO_DCN321_RES_POOL(*pool);
+
+	dcn321_resource_destruct(dcn321_pool);
+	kfree(dcn321_pool);
+	*pool = NULL;
+}
+
+static struct dc_cap_funcs cap_funcs = {
+	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
+};
+
+
+static void dcn321_get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
+		unsigned int *optimal_dcfclk,
+		unsigned int *optimal_fclk)
+{
+	double bw_from_dram, bw_from_dram1, bw_from_dram2;
+
+	bw_from_dram1 = uclk_mts * dcn3_21_soc.num_chans *
+		dcn3_21_soc.dram_channel_width_bytes * (dcn3_21_soc.max_avg_dram_bw_use_normal_percent / 100);
+	bw_from_dram2 = uclk_mts * dcn3_21_soc.num_chans *
+		dcn3_21_soc.dram_channel_width_bytes * (dcn3_21_soc.max_avg_sdp_bw_use_normal_percent / 100);
+
+	bw_from_dram = (bw_from_dram1 < bw_from_dram2) ? bw_from_dram1 : bw_from_dram2;
+
+	if (optimal_fclk)
+		*optimal_fclk = bw_from_dram /
+		(dcn3_21_soc.fabric_datapath_to_dcn_data_return_bytes * (dcn3_21_soc.max_avg_sdp_bw_use_normal_percent / 100));
+
+	if (optimal_dcfclk)
+		*optimal_dcfclk =  bw_from_dram /
+		(dcn3_21_soc.return_bus_width_bytes * (dcn3_21_soc.max_avg_sdp_bw_use_normal_percent / 100));
+}
+
+/* dcn321_update_bw_bounding_box
+ * This would override some dcn3_2 ip_or_soc initial parameters hardcoded from spreadsheet
+ * with actual values as per dGPU SKU:
+ * -with passed few options from dc->config
+ * -with dentist_vco_frequency from Clk Mgr (currently hardcoded, but might need to get it from PM FW)
+ * -with passed latency values (passed in ns units) in dc-> bb override for debugging purposes
+ * -with passed latencies from VBIOS (in 100_ns units) if available for certain dGPU SKU
+ * -with number of DRAM channels from VBIOS (which differ for certain dGPU SKU of the same ASIC)
+ * -clocks levels with passed clk_table entries from Clk Mgr as reported by PM FW for different
+ *  clocks (which might differ for certain dGPU SKU of the same ASIC)
+ */
+static void dcn321_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
+{
+	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+		/* Overrides from dc->config options */
+		dcn3_21_ip.clamp_min_dcfclk = dc->config.clamp_min_dcfclk;
+
+		/* Override from passed dc->bb_overrides if available*/
+		if ((int)(dcn3_21_soc.sr_exit_time_us * 1000) != dc->bb_overrides.sr_exit_time_ns
+				&& dc->bb_overrides.sr_exit_time_ns) {
+			dcn3_21_soc.sr_exit_time_us = dc->bb_overrides.sr_exit_time_ns / 1000.0;
+		}
+
+		if ((int)(dcn3_21_soc.sr_enter_plus_exit_time_us * 1000)
+				!= dc->bb_overrides.sr_enter_plus_exit_time_ns
+				&& dc->bb_overrides.sr_enter_plus_exit_time_ns) {
+			dcn3_21_soc.sr_enter_plus_exit_time_us =
+				dc->bb_overrides.sr_enter_plus_exit_time_ns / 1000.0;
+		}
+
+		if ((int)(dcn3_21_soc.urgent_latency_us * 1000) != dc->bb_overrides.urgent_latency_ns
+			&& dc->bb_overrides.urgent_latency_ns) {
+			dcn3_21_soc.urgent_latency_us = dc->bb_overrides.urgent_latency_ns / 1000.0;
+		}
+
+		if ((int)(dcn3_21_soc.dram_clock_change_latency_us * 1000)
+				!= dc->bb_overrides.dram_clock_change_latency_ns
+				&& dc->bb_overrides.dram_clock_change_latency_ns) {
+			dcn3_21_soc.dram_clock_change_latency_us =
+				dc->bb_overrides.dram_clock_change_latency_ns / 1000.0;
+		}
+
+		if ((int)(dcn3_21_soc.dummy_pstate_latency_us * 1000)
+				!= dc->bb_overrides.dummy_clock_change_latency_ns
+				&& dc->bb_overrides.dummy_clock_change_latency_ns) {
+			dcn3_21_soc.dummy_pstate_latency_us =
+				dc->bb_overrides.dummy_clock_change_latency_ns / 1000.0;
+		}
+
+		/* Override from VBIOS if VBIOS bb_info available */
+		if (dc->ctx->dc_bios->funcs->get_soc_bb_info) {
+			struct bp_soc_bb_info bb_info = {0};
+
+			if (dc->ctx->dc_bios->funcs->get_soc_bb_info(dc->ctx->dc_bios, &bb_info) == BP_RESULT_OK) {
+				if (bb_info.dram_clock_change_latency_100ns > 0)
+					dcn3_21_soc.dram_clock_change_latency_us = bb_info.dram_clock_change_latency_100ns * 10;
+
+			if (bb_info.dram_sr_enter_exit_latency_100ns > 0)
+				dcn3_21_soc.sr_enter_plus_exit_time_us = bb_info.dram_sr_enter_exit_latency_100ns * 10;
+
+			if (bb_info.dram_sr_exit_latency_100ns > 0)
+				dcn3_21_soc.sr_exit_time_us = bb_info.dram_sr_exit_latency_100ns * 10;
+			}
+		}
+
+		/* Override from VBIOS for num_chan */
+		if (dc->ctx->dc_bios->vram_info.num_chans)
+			dcn3_21_soc.num_chans = dc->ctx->dc_bios->vram_info.num_chans;
+
+		if (dc->ctx->dc_bios->vram_info.dram_channel_width_bytes)
+			dcn3_21_soc.dram_channel_width_bytes = dc->ctx->dc_bios->vram_info.dram_channel_width_bytes;
+
+	}
+
+	/* Override dispclk_dppclk_vco_speed_mhz from Clk Mgr */
+	dcn3_21_soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+	dc->dml.soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
+
+	/* Overrides Clock levelsfrom CLK Mgr table entries as reported by PM FW */
+	if ((!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) && (bw_params->clk_table.entries[0].memclk_mhz)) {
+		unsigned int i = 0, j = 0, num_states = 0;
+
+		unsigned int dcfclk_mhz[DC__VOLTAGE_STATES] = {0};
+		unsigned int dram_speed_mts[DC__VOLTAGE_STATES] = {0};
+		unsigned int optimal_uclk_for_dcfclk_sta_targets[DC__VOLTAGE_STATES] = {0};
+		unsigned int optimal_dcfclk_for_uclk[DC__VOLTAGE_STATES] = {0};
+
+		unsigned int dcfclk_sta_targets[DC__VOLTAGE_STATES] = {615, 906, 1324, 1564};
+		unsigned int num_dcfclk_sta_targets = 4, num_uclk_states = 0;
+		unsigned int max_dcfclk_mhz = 0, max_dispclk_mhz = 0, max_dppclk_mhz = 0, max_phyclk_mhz = 0;
+
+		for (i = 0; i < MAX_NUM_DPM_LVL; i++) {
+			if (bw_params->clk_table.entries[i].dcfclk_mhz > max_dcfclk_mhz)
+				max_dcfclk_mhz = bw_params->clk_table.entries[i].dcfclk_mhz;
+			if (bw_params->clk_table.entries[i].dispclk_mhz > max_dispclk_mhz)
+				max_dispclk_mhz = bw_params->clk_table.entries[i].dispclk_mhz;
+			if (bw_params->clk_table.entries[i].dppclk_mhz > max_dppclk_mhz)
+				max_dppclk_mhz = bw_params->clk_table.entries[i].dppclk_mhz;
+			if (bw_params->clk_table.entries[i].phyclk_mhz > max_phyclk_mhz)
+				max_phyclk_mhz = bw_params->clk_table.entries[i].phyclk_mhz;
+		}
+		if (!max_dcfclk_mhz)
+			max_dcfclk_mhz = dcn3_21_soc.clock_limits[0].dcfclk_mhz;
+		if (!max_dispclk_mhz)
+			max_dispclk_mhz = dcn3_21_soc.clock_limits[0].dispclk_mhz;
+		if (!max_dppclk_mhz)
+			max_dppclk_mhz = dcn3_21_soc.clock_limits[0].dppclk_mhz;
+		if (!max_phyclk_mhz)
+			max_phyclk_mhz = dcn3_21_soc.clock_limits[0].phyclk_mhz;
+
+		if (max_dcfclk_mhz > dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+			// If max DCFCLK is greater than the max DCFCLK STA target, insert into the DCFCLK STA target array
+			dcfclk_sta_targets[num_dcfclk_sta_targets] = max_dcfclk_mhz;
+			num_dcfclk_sta_targets++;
+		} else if (max_dcfclk_mhz < dcfclk_sta_targets[num_dcfclk_sta_targets-1]) {
+			// If max DCFCLK is less than the max DCFCLK STA target, cap values and remove duplicates
+			for (i = 0; i < num_dcfclk_sta_targets; i++) {
+				if (dcfclk_sta_targets[i] > max_dcfclk_mhz) {
+					dcfclk_sta_targets[i] = max_dcfclk_mhz;
+					break;
+				}
+			}
+			// Update size of array since we "removed" duplicates
+			num_dcfclk_sta_targets = i + 1;
+		}
+
+		num_uclk_states = bw_params->clk_table.num_entries;
+
+		// Calculate optimal dcfclk for each uclk
+		for (i = 0; i < num_uclk_states; i++) {
+			dcn321_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
+					&optimal_dcfclk_for_uclk[i], NULL);
+			if (optimal_dcfclk_for_uclk[i] < bw_params->clk_table.entries[0].dcfclk_mhz) {
+				optimal_dcfclk_for_uclk[i] = bw_params->clk_table.entries[0].dcfclk_mhz;
+			}
+		}
+
+		// Calculate optimal uclk for each dcfclk sta target
+		for (i = 0; i < num_dcfclk_sta_targets; i++) {
+			for (j = 0; j < num_uclk_states; j++) {
+				if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j]) {
+					optimal_uclk_for_dcfclk_sta_targets[i] =
+							bw_params->clk_table.entries[j].memclk_mhz * 16;
+					break;
+				}
+			}
+		}
+
+		i = 0;
+		j = 0;
+		// create the final dcfclk and uclk table
+		while (i < num_dcfclk_sta_targets && j < num_uclk_states && num_states < DC__VOLTAGE_STATES) {
+			if (dcfclk_sta_targets[i] < optimal_dcfclk_for_uclk[j] && i < num_dcfclk_sta_targets) {
+				dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+				dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+			} else {
+				if (j < num_uclk_states && optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+					dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+					dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+				} else {
+					j = num_uclk_states;
+				}
+			}
+		}
+
+		while (i < num_dcfclk_sta_targets && num_states < DC__VOLTAGE_STATES) {
+			dcfclk_mhz[num_states] = dcfclk_sta_targets[i];
+			dram_speed_mts[num_states++] = optimal_uclk_for_dcfclk_sta_targets[i++];
+		}
+
+		while (j < num_uclk_states && num_states < DC__VOLTAGE_STATES &&
+				optimal_dcfclk_for_uclk[j] <= max_dcfclk_mhz) {
+			dcfclk_mhz[num_states] = optimal_dcfclk_for_uclk[j];
+			dram_speed_mts[num_states++] = bw_params->clk_table.entries[j++].memclk_mhz * 16;
+		}
+
+		dcn3_21_soc.num_states = num_states;
+		for (i = 0; i < dcn3_21_soc.num_states; i++) {
+			dcn3_21_soc.clock_limits[i].state = i;
+			dcn3_21_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
+			dcn3_21_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
+			dcn3_21_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
+
+			/* Fill all states with max values of all these clocks */
+			dcn3_21_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
+			dcn3_21_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
+			dcn3_21_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
+			dcn3_21_soc.clock_limits[i].dscclk_mhz  = max_dispclk_mhz / 3;
+
+			/* Populate from bw_params for DTBCLK, SOCCLK */
+			if (!bw_params->clk_table.entries[i].dtbclk_mhz && i > 0)
+				dcn3_21_soc.clock_limits[i].dtbclk_mhz  = dcn3_21_soc.clock_limits[i-1].dtbclk_mhz;
+			else
+				dcn3_21_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
+
+			if (!bw_params->clk_table.entries[i].socclk_mhz && i > 0)
+				dcn3_21_soc.clock_limits[i].socclk_mhz = dcn3_21_soc.clock_limits[i-1].socclk_mhz;
+			else
+				dcn3_21_soc.clock_limits[i].socclk_mhz = bw_params->clk_table.entries[i].socclk_mhz;
+
+			/* These clocks cannot come from bw_params, always fill from dcn3_21_soc[0] */
+			/* PHYCLK_D18, PHYCLK_D32 */
+			dcn3_21_soc.clock_limits[i].phyclk_d18_mhz = dcn3_21_soc.clock_limits[0].phyclk_d18_mhz;
+			dcn3_21_soc.clock_limits[i].phyclk_d32_mhz = dcn3_21_soc.clock_limits[0].phyclk_d32_mhz;
+		}
+
+		/* Re-init DML with updated bb */
+		dml_init_instance(&dc->dml, &dcn3_21_soc, &dcn3_21_ip, DML_PROJECT_DCN32);
+		if (dc->current_state)
+			dml_init_instance(&dc->current_state->bw_ctx.dml, &dcn3_21_soc, &dcn3_21_ip, DML_PROJECT_DCN32);
+	}
+}
+
+static struct resource_funcs dcn321_res_pool_funcs = {
+	.destroy = dcn321_destroy_resource_pool,
+	.link_enc_create = dcn321_link_encoder_create,
+	.link_enc_create_minimal = NULL,
+	.panel_cntl_create = dcn32_panel_cntl_create,
+	.validate_bandwidth = dcn32_validate_bandwidth,
+	.calculate_wm_and_dlg = dcn32_calculate_wm_and_dlg,
+	.populate_dml_pipes = dcn32_populate_dml_pipes_from_context,
+	.acquire_idle_pipe_for_layer = dcn20_acquire_idle_pipe_for_layer,
+	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
+	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
+	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
+	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.acquire_post_bldn_3dlut = dcn32_acquire_post_bldn_3dlut,
+	.release_post_bldn_3dlut = dcn32_release_post_bldn_3dlut,
+	.update_bw_bounding_box = dcn321_update_bw_bounding_box,
+	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
+	.update_soc_for_wm_a = dcn30_update_soc_for_wm_a,
+	.add_phantom_pipes = dcn32_add_phantom_pipes,
+	.remove_phantom_pipes = dcn32_remove_phantom_pipes,
+};
+
+
+static bool dcn321_resource_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dcn321_resource_pool *pool)
+{
+	int i, j;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+	struct ddc_service_init_data ddc_init_data = {0};
+	uint32_t pipe_fuses = 0;
+	uint32_t num_pipes  = 4;
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_dcn321;
+	/* max number of pipes for ASIC before checking for pipe fuses */
+	num_pipes  = pool->base.res_cap->num_timing_generator;
+	pipe_fuses = REG_READ(CC_DC_PIPE_DIS);
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++)
+		if (pipe_fuses & 1 << i)
+			num_pipes--;
+
+	if (pipe_fuses & 1)
+		ASSERT(0); //Unexpected - Pipe 0 should always be fully functional!
+
+	if (pipe_fuses & CC_DC_PIPE_DIS__DC_FULL_DIS_MASK)
+		ASSERT(0); //Entire DCN is harvested!
+
+	/* within dml lib, initial value is hard coded, if ASIC pipe is fused, the
+	 * value will be changed, update max_num_dpp and max_num_otg for dml.
+	 */
+	dcn3_21_ip.max_num_dpp = num_pipes;
+	dcn3_21_ip.max_num_otg = num_pipes;
+
+	pool->base.funcs = &dcn321_res_pool_funcs;
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.timing_generator_count = num_pipes;
+	pool->base.pipe_count = num_pipes;
+	pool->base.mpcc_count = num_pipes;
+	dc->caps.max_downscale_ratio = 600;
+	dc->caps.i2c_speed_in_khz = 100;
+	dc->caps.i2c_speed_in_khz_hdcp = 100; /*1.4 w/a applied by default*/
+	dc->caps.max_cursor_size = 256;
+	dc->caps.min_horizontal_blanking_period = 80;
+	dc->caps.dmdata_alloc_size = 2048;
+	dc->caps.mall_size_per_mem_channel = 0;
+	dc->caps.mall_size_total = 0;
+	dc->caps.cursor_cache_size = dc->caps.max_cursor_size * dc->caps.max_cursor_size * 8;
+	dc->caps.cache_line_size = 64;
+	dc->caps.cache_num_ways = 16;
+	dc->caps.max_cab_allocation_bytes = 33554432; // 32MB = 1024 * 1024 * 32
+	dc->caps.subvp_fw_processing_delay_us = 15;
+	dc->caps.subvp_prefetch_end_to_mall_start_us = 15;
+	dc->caps.subvp_pstate_allow_width_us = 20;
+
+	dc->caps.max_slave_planes = 1;
+	dc->caps.max_slave_yuv_planes = 1;
+	dc->caps.max_slave_rgb_planes = 1;
+	dc->caps.post_blend_color_processing = true;
+	dc->caps.force_dp_tps4_for_cp2520 = true;
+	dc->caps.dp_hpo = true;
+	dc->caps.edp_dsc_support = true;
+	dc->caps.extended_aux_timeout_support = true;
+	dc->caps.dmcub_support = true;
+
+	/* Color pipeline capabilities */
+	dc->caps.color.dpp.dcn_arch = 1;
+	dc->caps.color.dpp.input_lut_shared = 0;
+	dc->caps.color.dpp.icsc = 1;
+	dc->caps.color.dpp.dgam_ram = 0; // must use gamma_corr
+	dc->caps.color.dpp.dgam_rom_caps.srgb = 1;
+	dc->caps.color.dpp.dgam_rom_caps.bt2020 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.gamma2_2 = 1;
+	dc->caps.color.dpp.dgam_rom_caps.pq = 1;
+	dc->caps.color.dpp.dgam_rom_caps.hlg = 1;
+	dc->caps.color.dpp.post_csc = 1;
+	dc->caps.color.dpp.gamma_corr = 1;
+	dc->caps.color.dpp.dgam_rom_for_yuv = 0;
+
+	dc->caps.color.dpp.hw_3d_lut = 0; //3DLUT removed from DPP
+	dc->caps.color.dpp.ogam_ram = 0;  //Blnd Gam also removed
+	// no OGAM ROM on DCN2 and later ASICs
+	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
+	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.pq = 0;
+	dc->caps.color.dpp.ogam_rom_caps.hlg = 0;
+	dc->caps.color.dpp.ocsc = 0;
+
+	dc->caps.color.mpc.gamut_remap = 1;
+	dc->caps.color.mpc.num_3dluts = pool->base.res_cap->num_mpc_3dlut; //4, configurable to be before or after BLND in MPCC
+	dc->caps.color.mpc.ogam_ram = 1;
+	dc->caps.color.mpc.ogam_rom_caps.srgb = 0;
+	dc->caps.color.mpc.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.mpc.ogam_rom_caps.pq = 0;
+	dc->caps.color.mpc.ogam_rom_caps.hlg = 0;
+	dc->caps.color.mpc.ocsc = 1;
+
+	/* read VBIOS LTTPR caps */
+	{
+		if (ctx->dc_bios->funcs->get_lttpr_caps) {
+			enum bp_result bp_query_result;
+			uint8_t is_vbios_lttpr_enable = 0;
+
+			bp_query_result = ctx->dc_bios->funcs->get_lttpr_caps(ctx->dc_bios, &is_vbios_lttpr_enable);
+			dc->caps.vbios_lttpr_enable = (bp_query_result == BP_RESULT_OK) && !!is_vbios_lttpr_enable;
+		}
+
+		/* interop bit is implicit */
+		{
+			dc->caps.vbios_lttpr_aware = true;
+		}
+	}
+
+	if (dc->ctx->dce_environment == DCE_ENV_PRODUCTION_DRV)
+		dc->debug = debug_defaults_drv;
+	else if (dc->ctx->dce_environment == DCE_ENV_FPGA_MAXIMUS) {
+		dc->debug = debug_defaults_diags;
+	} else
+		dc->debug = debug_defaults_diags;
+	// Init the vm_helper
+	if (dc->vm_helper)
+		vm_helper_init(dc->vm_helper, 16);
+
+	/*************************************************
+	 *  Create resources                             *
+	 *************************************************/
+
+	/* Clock Sources for Pixel Clock*/
+	pool->base.clock_sources[DCN321_CLK_SRC_PLL0] =
+			dcn321_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL0,
+				&clk_src_regs[0], false);
+	pool->base.clock_sources[DCN321_CLK_SRC_PLL1] =
+			dcn321_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL1,
+				&clk_src_regs[1], false);
+	pool->base.clock_sources[DCN321_CLK_SRC_PLL2] =
+			dcn321_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL2,
+				&clk_src_regs[2], false);
+	pool->base.clock_sources[DCN321_CLK_SRC_PLL3] =
+			dcn321_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL3,
+				&clk_src_regs[3], false);
+	pool->base.clock_sources[DCN321_CLK_SRC_PLL4] =
+			dcn321_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL4,
+				&clk_src_regs[4], false);
+
+	pool->base.clk_src_count = DCN321_CLK_SRC_TOTAL;
+
+	/* todo: not reuse phy_pll registers */
+	pool->base.dp_clock_source =
+			dcn321_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_ID_DP_DTO,
+				&clk_src_regs[0], true);
+
+	for (i = 0; i < pool->base.clk_src_count; i++) {
+		if (pool->base.clock_sources[i] == NULL) {
+			dm_error("DC: failed to create clock sources!\n");
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* DCCG */
+	pool->base.dccg = dccg32_create(ctx, &dccg_regs, &dccg_shift, &dccg_mask);
+	if (pool->base.dccg == NULL) {
+		dm_error("DC: failed to create dccg!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* DML */
+	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
+		dml_init_instance(&dc->dml, &dcn3_21_soc, &dcn3_21_ip, DML_PROJECT_DCN32);
+
+	/* IRQ Service */
+	init_data.ctx = dc->ctx;
+	pool->base.irqs = dal_irq_service_dcn32_create(&init_data);
+	if (!pool->base.irqs)
+		goto create_fail;
+
+	/* HUBBUB */
+	pool->base.hubbub = dcn321_hubbub_create(ctx);
+	if (pool->base.hubbub == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create hubbub!\n");
+		goto create_fail;
+	}
+
+	/* HUBPs, DPPs, OPPs, TGs, ABMs */
+	for (i = 0, j = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+
+		/* if pipe is disabled, skip instance of HW pipe,
+		 * i.e, skip ASIC register instance
+		 */
+		if (pipe_fuses & 1 << i)
+			continue;
+
+		pool->base.hubps[j] = dcn321_hubp_create(ctx, i);
+		if (pool->base.hubps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create hubps!\n");
+			goto create_fail;
+		}
+
+		pool->base.dpps[j] = dcn321_dpp_create(ctx, i);
+		if (pool->base.dpps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create dpps!\n");
+			goto create_fail;
+		}
+
+		pool->base.opps[j] = dcn321_opp_create(ctx, i);
+		if (pool->base.opps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create output pixel processor!\n");
+			goto create_fail;
+		}
+
+		pool->base.timing_generators[j] = dcn321_timing_generator_create(
+				ctx, i);
+		if (pool->base.timing_generators[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto create_fail;
+		}
+
+		pool->base.multiple_abms[j] = dmub_abm_create(ctx,
+				&abm_regs[i],
+				&abm_shift,
+				&abm_mask);
+		if (pool->base.multiple_abms[j] == NULL) {
+			dm_error("DC: failed to create abm for pipe %d!\n", i);
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+
+		/* index for resource pool arrays for next valid pipe */
+		j++;
+	}
+
+	/* PSR */
+	pool->base.psr = dmub_psr_create(ctx);
+	if (pool->base.psr == NULL) {
+		dm_error("DC: failed to create psr obj!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* MPCCs */
+	pool->base.mpc = dcn321_mpc_create(ctx,  pool->base.res_cap->num_timing_generator, pool->base.res_cap->num_mpc_3dlut);
+	if (pool->base.mpc == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mpc!\n");
+		goto create_fail;
+	}
+
+	/* DSCs */
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		pool->base.dscs[i] = dcn321_dsc_create(ctx, i);
+		if (pool->base.dscs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create display stream compressor %d!\n", i);
+			goto create_fail;
+		}
+	}
+
+	/* DWB */
+	if (!dcn321_dwbc_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create dwbc!\n");
+		goto create_fail;
+	}
+
+	/* MMHUBBUB */
+	if (!dcn321_mmhubbub_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mcif_wb!\n");
+		goto create_fail;
+	}
+
+	/* AUX and I2C */
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dcn321_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto create_fail;
+		}
+		pool->base.hw_i2cs[i] = dcn321_i2c_hw_create(ctx, i);
+		if (pool->base.hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create hw i2c!!\n");
+			goto create_fail;
+		}
+		pool->base.sw_i2cs[i] = NULL;
+	}
+
+	/* Audio, HWSeq, Stream Encoders including HPO and virtual, MPC 3D LUTs */
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+			(!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment) ?
+			&res_create_funcs : &res_create_maximus_funcs)))
+			goto create_fail;
+
+	/* HW Sequencer init functions and Plane caps */
+	dcn32_hw_sequencer_init_functions(dc);
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->cap_funcs = cap_funcs;
+
+	if (dc->ctx->dc_bios->fw_info.oem_i2c_present) {
+		ddc_init_data.ctx = dc->ctx;
+		ddc_init_data.link = NULL;
+		ddc_init_data.id.id = dc->ctx->dc_bios->fw_info.oem_i2c_obj_id;
+		ddc_init_data.id.enum_id = 0;
+		ddc_init_data.id.type = OBJECT_TYPE_GENERIC;
+		pool->base.oem_device = dal_ddc_service_create(&ddc_init_data);
+	} else {
+		pool->base.oem_device = NULL;
+	}
+
+	return true;
+
+create_fail:
+
+	dcn321_resource_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn321_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc)
+{
+	struct dcn321_resource_pool *pool =
+		kzalloc(sizeof(struct dcn321_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn321_resource_construct(init_data->num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index 46ce5a0ee4ec..a89d219e712c 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -125,6 +125,7 @@ struct nv_wm_range_entry {
 		double pstate_latency_us;
 		double sr_exit_time_us;
 		double sr_enter_plus_exit_time_us;
+		double fclk_change_latency_us;
 	} dml_input;
 };
 
@@ -142,6 +143,7 @@ struct clk_state_registers_and_bypass {
 	uint32_t dprefclk;
 	uint32_t dispclk;
 	uint32_t dppclk;
+	uint32_t dtbclk;
 
 	uint32_t dppclk_bypass;
 	uint32_t dcfclk_bypass;
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
index 1391c20f1852..68c2ed434d2c 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr_internal.h
@@ -112,9 +112,10 @@ enum dentist_divider_range {
 	CLK_SRI(CLK3_CLK_PLL_REQ, CLK3, 0), \
 	CLK_SRI(CLK3_CLK2_DFS_CNTL, CLK3, 0)
 
-// TODO:
 #define CLK_REG_LIST_DCN3()	  \
-	SR(DENTIST_DISPCLK_CNTL)
+	CLK_COMMON_REG_LIST_DCN_BASE(), \
+	CLK_SRI(CLK0_CLK_PLL_REQ,   CLK02, 0), \
+	CLK_SRI(CLK0_CLK2_DFS_CNTL, CLK02, 0)
 
 #define CLK_SF(reg_name, field_name, post_fix)\
 	.field_name = reg_name ## __ ## field_name ## post_fix
@@ -155,6 +156,34 @@ enum dentist_divider_range {
 	CLK_SF(DENTIST_DISPCLK_CNTL, DENTIST_DPPCLK_CHG_DONE, mask_sh),\
 	CLK_SF(CLK4_0_CLK4_CLK_PLL_REQ, FbMult_int, mask_sh)
 
+#define CLK_REG_LIST_DCN32()	  \
+	SR(DENTIST_DISPCLK_CNTL), \
+	CLK_SR_DCN32(CLK1_CLK_PLL_REQ), \
+	CLK_SR_DCN32(CLK1_CLK0_DFS_CNTL), \
+	CLK_SR_DCN32(CLK1_CLK1_DFS_CNTL), \
+	CLK_SR_DCN32(CLK1_CLK2_DFS_CNTL), \
+	CLK_SR_DCN32(CLK1_CLK3_DFS_CNTL), \
+	CLK_SR_DCN32(CLK1_CLK4_DFS_CNTL)
+
+#define CLK_COMMON_MASK_SH_LIST_DCN32(mask_sh) \
+	CLK_COMMON_MASK_SH_LIST_DCN20_BASE(mask_sh),\
+	CLK_SF(CLK1_CLK_PLL_REQ, FbMult_int, mask_sh),\
+	CLK_SF(CLK1_CLK_PLL_REQ, FbMult_frac, mask_sh)
+
+#define CLK_REG_LIST_DCN321()	  \
+	SR(DENTIST_DISPCLK_CNTL), \
+	CLK_SR_DCN321(CLK0_CLK_PLL_REQ,   CLK01, 0), \
+	CLK_SR_DCN321(CLK0_CLK0_DFS_CNTL, CLK01, 0), \
+	CLK_SR_DCN321(CLK0_CLK1_DFS_CNTL, CLK01, 0), \
+	CLK_SR_DCN321(CLK0_CLK2_DFS_CNTL, CLK01, 0), \
+	CLK_SR_DCN321(CLK0_CLK3_DFS_CNTL, CLK01, 0), \
+	CLK_SR_DCN321(CLK0_CLK4_DFS_CNTL, CLK01, 0)
+
+#define CLK_COMMON_MASK_SH_LIST_DCN321(mask_sh) \
+	CLK_COMMON_MASK_SH_LIST_DCN20_BASE(mask_sh),\
+	CLK_SF(CLK0_CLK_PLL_REQ, FbMult_int, mask_sh),\
+	CLK_SF(CLK0_CLK_PLL_REQ, FbMult_frac, mask_sh)
+
 #define CLK_REG_FIELD_LIST(type) \
 	type DPREFCLK_SRC_SEL; \
 	type DENTIST_DPREFCLK_WDIVIDER; \
@@ -199,6 +228,18 @@ struct clk_mgr_registers {
 	uint32_t CLK0_CLK2_DFS_CNTL;
 	uint32_t CLK0_CLK_PLL_REQ;
 
+	uint32_t CLK1_CLK_PLL_REQ;
+	uint32_t CLK1_CLK0_DFS_CNTL;
+	uint32_t CLK1_CLK1_DFS_CNTL;
+	uint32_t CLK1_CLK2_DFS_CNTL;
+	uint32_t CLK1_CLK3_DFS_CNTL;
+	uint32_t CLK1_CLK4_DFS_CNTL;
+
+	uint32_t CLK0_CLK0_DFS_CNTL;
+	uint32_t CLK0_CLK1_DFS_CNTL;
+	uint32_t CLK0_CLK3_DFS_CNTL;
+	uint32_t CLK0_CLK4_DFS_CNTL;
+
 	uint32_t MP1_SMN_C2PMSG_67;
 	uint32_t MP1_SMN_C2PMSG_83;
 	uint32_t MP1_SMN_C2PMSG_91;
-- 
2.35.3


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A703990E5
	for <lists+amd-gfx@lfdr.de>; Wed,  2 Jun 2021 18:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD196EDD9;
	Wed,  2 Jun 2021 16:51:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D24B6EDC0
 for <amd-gfx@lists.freedesktop.org>; Wed,  2 Jun 2021 16:51:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJfzHNi+mbAdCfjdVE+hu+cgr+dY3TkFEjrVX7PcSX6kR1+R05dGynrsffyaZSlgcgP/5O+0fLANWCLAv526gm3KTW4MG/6uLv6O4BPetkDDyLBMEIJ4ncpdj36irBMKY3SZa4k7D7UkTpifgsYENDIG+sFxTXZIEHAZd3voZ0Hn05uwGe8J5ttAJ4j5y7RKPF8pGhY0DZlberpq+1M3B+MkytpK7uKVq7Nn2ol625mzsl4l2uoW8O+XXlvq2K84TC+DtGWB0M8u/h++r77pt+6tPYLYqJ6Csd93GUx9/rel1n33QWDx469O5g93JHzOs84111oh4pkkrD1YZfTZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS+3+UjDeSET0Yu5aLzhBTs+PWlh/bVKEU2OBcGBQbE=;
 b=bJkHUo+kNbanH10MopRtKdjSfX439bxSV46eHhAoYMX1ZvTdvubT+2dUNUscxHmy0XLaoca7I8fbZidQhyq+RqcsRGafFrpyCp2QiHTkLq3BWgpzHrxtCopvIBeDaOt2yak1kS2tw0BwD/WY5113V3RxD4IEBq9C/N8x/4p4T/hkMx6qVwEi7+t0/uH6DE0iClxtvJ5mBpNp7VTuXZhFU8zFqsFjAIotuDHTZqa8GvFy6rlpal7CZHtiPX2NuwzWTiZ59SoZ/WaGmXtsYPAegqdejFj2nwx/lfToLrOZEQHFCYA0GUrsbRvfdS3BT9kOhQ2m62vLoZfg1K1OlEw1UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bS+3+UjDeSET0Yu5aLzhBTs+PWlh/bVKEU2OBcGBQbE=;
 b=QrIwNLvF4w4vija5dfDA4eCrj5GnDUi/NSfOJ40c6j5oSHS6MkyL71aZreukAocv32kF2bhcU/wJKcZm9RHHlJleUNqXyjABFoX5895pCcXEHp6mPapbO6TQyAp9jzwhD6On3WZws2jGdlPnAU0hExSHL4527tanTnOmglmsMIw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by BL0PR12MB2434.namprd12.prod.outlook.com (2603:10b6:207:4d::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Wed, 2 Jun
 2021 16:51:18 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::25f7:664:3a8f:25b6%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 16:51:18 +0000
From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 71/89] drm/amd/display: Add DCN3.1 clock manager support
Date: Wed,  2 Jun 2021 12:48:50 -0400
Message-Id: <20210602164908.2848791-71-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602164908.2848791-1-alexander.deucher@amd.com>
References: <20210602164908.2848791-1-alexander.deucher@amd.com>
X-Originating-IP: [192.161.79.207]
X-ClientProxiedBy: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To MN2PR12MB4488.namprd12.prod.outlook.com
 (2603:10b6:208:24e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (192.161.79.207) by
 MN2PR13CA0007.namprd13.prod.outlook.com (2603:10b6:208:160::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.9 via Frontend
 Transport; Wed, 2 Jun 2021 16:50:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7fe2da5-7bc1-4e0e-8cc7-08d925e67fc7
X-MS-TrafficTypeDiagnostic: BL0PR12MB2434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2434C43342DA99C3C71D1A72F73D9@BL0PR12MB2434.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8JBxUNrIfyYneAMqFWNhEr5nQz8AAVyMUnqJ/ymriduxEAUqUze+LlGktoPNGjBGXk+BwgisGZQJqia+MdKQpGvkzls6E4VXbx3JHpSeFhlc2n2RxPXR58+/wPzub8CnLr06+shKIvhYQ8fcxOhHw8q0HxCpbPvAFTaw/ewfMqDKBxcw0yFv1KTKBrcgNtExZrf8xNGD7ouDAqndWxUvA/LWlE/L2PPTuNjGiJhk+ociBC7GnKIAJTiP684h7DsBLTNSGQ4SEBwGJSbl8JFK8Ev4k0Di7SyNF+IrlR1s79UF6JHr57QpBR2NpC9SNyTUk0DCjxGIoMAsP+ZMz/GSetAK5Qt5fDXv8AizRK7kviBW7rpm6Ugf3r0RLayDzmYL1+wb9CZqJDw4JHaq5wTGtxBYWPZ2qY50JpK1FxnjYMmBSmcYqTyuMdKDGnNd6knlgnGJGcogg1wXP77NGMo9dC+jyBtU8OLkxFi8XXgbYpDFTBejGKKWjHzvUzFFWDqfOL4NQt/FCLEwQA+8sMDXf46aHZcAdkwbJQl5NCcj/y/zT38Kha5LuYkbhQCGBQhtB8KFhsl/pMNqJZYtsn7ixRGZ1Ovm1thxBX4+9cSAeqMg4iF6+WSFo3SLmUqi4QCzgsfbH5itbG3cKtF7tRk9gBnXFaznkIgVwGx724fcZfFI3b1TPQDy0lVvRYCIvU35
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(52116002)(6486002)(6916009)(66476007)(66556008)(316002)(66946007)(36756003)(19627235002)(54906003)(86362001)(5660300002)(16526019)(186003)(6506007)(6512007)(26005)(6666004)(83380400001)(1076003)(8676002)(30864003)(956004)(4326008)(2616005)(478600001)(38350700002)(38100700002)(2906002)(8936002)(69590400013)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NP066j+8Hs3goDnPOJyyCIfMVDzmU1g6fm8KSzssW1OXwtVxEChwZWc9t9GI?=
 =?us-ascii?Q?j/oEkkM8nJTz7vilIJQZpHeBeeI/V+ETHrym5bwxVVUL6e71u2jHcxjH0sSS?=
 =?us-ascii?Q?O0Fih5+whsCzgFQN8DDpapdF7Ui6me5QXxeypPGjiTDA6hiVMJbYOCMrR39g?=
 =?us-ascii?Q?qLJbgjvvgJot8ilyH5hIdfjYIfafXi+y71EntmtJKwosmYTZde+UqyVJUjZo?=
 =?us-ascii?Q?SQ01czNK7kvGS1RF9zHA272d/0+qhRgV/jSFvxGttqmqtIVItAjwtCiogRQw?=
 =?us-ascii?Q?6jj7+/Hd3J4Kol47Fg1368jKXDQ5R0ntZKpU8DuAxzKJN8sGMPdYgSIJnko3?=
 =?us-ascii?Q?rSV1lFcW2XhgMYT4a1qEYylsK+XEpRQn7JHlimAyv9cAGq+ras3puZNJXdJl?=
 =?us-ascii?Q?wFWR3rJxCwb7lluqA5MlKfNraW5kp5/5+gKvg1yrC7yqGzCk9hXMhUG94N8y?=
 =?us-ascii?Q?HltoaTLV8cV5O58ZdCppFpEfF+0Bsc8+4YL93yKUykSIEK9xvVaclO6J1bPR?=
 =?us-ascii?Q?WpA2UZsvmFTa+/lRETNXerRSgz7roxxKHcZ0fku0bWvkjHoU6xX52mSxx0Ib?=
 =?us-ascii?Q?Mgm0i3vYv5k2UghJhWNSymxoZqzBHxzMMXNVSzoOhMZtgfowZ0QTSeSanPEt?=
 =?us-ascii?Q?6+eOE5Akz7eu/978f4dOaiA6X3YMLiJDdOV2lEWChHf1IbAu7ths3wPNUwzA?=
 =?us-ascii?Q?hupZ2SuozvMlmsMmUSSctk9CxRnMjwqMrPQ8Z1So+MlJbUS7G7K11QFp3LUS?=
 =?us-ascii?Q?k29PiiNsXiCd9jszONxLOdgd3hXEh74oQ5JcfFp1qiuAUAzqcqB+lo4ZsbRg?=
 =?us-ascii?Q?4XB7Jtn1SN+DjLwuxkIF+w2gxylHcYeO8WgxusyT7EavzpoQasTWjVjQsEm+?=
 =?us-ascii?Q?Stz083jI0883uRyx/3D1WpxESGCm2PppjD4+8lJcKIVQoc+a6O8ltgorKbnE?=
 =?us-ascii?Q?9fDrn601EdVKTaGAYHLBs41mkOmT55dYSTMyd4Ff3zRLQJAx1Z0SmyKPrN/m?=
 =?us-ascii?Q?f5WtT++DjRDmlwBlyeBwO3TjOUChGZsuOVHUwnxrxmIhTmSaeiihVw3DUWkV?=
 =?us-ascii?Q?jh0AfPN4JM28QHETr76vno3oGj/6uh46FIxzhcWHNp7io7ZjWuCGqRRraBUv?=
 =?us-ascii?Q?t7kaywjqBVEjbvL9khSgmZ77PocHtVQPtbVGUt5nEJvb6HQD1yHDElpJU2b+?=
 =?us-ascii?Q?t0oAv9PapjKumCg7TyttdtIu+ad3VEAZfsdC9v3kcfM8eAphAFKr9zoxnnHq?=
 =?us-ascii?Q?UYTSNOHgte/fitG/y52EtyhWA8sJgXYIqRPDjKQDDvoQk4HTPP3wcWtRdC3t?=
 =?us-ascii?Q?uFY/kDQ0oIPiGUKXAh5D05eg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fe2da5-7bc1-4e0e-8cc7-08d925e67fc7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 16:50:16.8704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZwXl3RwIDR3YevcMHkwPyuhU8DzTskw2tPte26ftrHySZHoZdLX5Cpa6lpTYNysMMwov+981CSL3Lsyy+xfScA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2434
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Adds support for clock requests for the various parts of the DCN3.1 IP
and the interfaces and definitions for sending messages to SMU/PMFW.

Includes new support for z9/10, detecting SMU timeout and p-state
support enablement.

Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |   6 +
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |  11 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |  30 +
 .../display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c  |   4 +
 .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c  | 673 ++++++++++++++++++
 .../display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h  | 103 +++
 .../amd/display/dc/clk_mgr/dcn31/dcn31_smu.c  | 333 +++++++++
 .../amd/display/dc/clk_mgr/dcn31/dcn31_smu.h  | 271 +++++++
 drivers/gpu/drm/amd/display/dc/dc.h           |  14 +
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   6 +
 .../gpu/drm/amd/display/dc/inc/hw/clk_mgr.h   |   3 +
 11 files changed, 1454 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 4646b0d02939..6fee12c91ef5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -655,6 +655,12 @@ void dm_set_dcn_clocks(struct dc_context *ctx, struct dc_clocks *clks)
 	/* TODO: something */
 }
 
+void dm_helpers_smu_timeout(struct dc_context *ctx, unsigned int msg_id, unsigned int param, unsigned int timeout_us)
+{
+	// TODO:
+	//amdgpu_device_gpu_recover(dc_context->driver-context, NULL);
+}
+
 void *dm_helpers_allocate_gpu_mem(
 		struct dc_context *ctx,
 		enum dc_gpu_mem_alloc_type type,
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index ff96bee57bfc..713251547d1c 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -136,3 +136,14 @@ AMD_DAL_CLK_MGR_DCN301 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn301/,$(CLK_MGR_
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN301)
 endif
+
+ifdef CONFIG_DRM_AMD_DC_DCN3_1
+###############################################################################
+# DCN31
+###############################################################################
+CLK_MGR_DCN31 = dcn31_smu.o dcn31_clk_mgr.o
+
+AMD_DAL_CLK_MGR_DCN31 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn31/,$(CLK_MGR_DCN31))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN31)
+endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index dd52ebf56d62..2f413809f67b 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -41,6 +41,9 @@
 #include "dcn21/rn_clk_mgr.h"
 #include "dcn30/dcn30_clk_mgr.h"
 #include "dcn301/vg_clk_mgr.h"
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+#include "dcn31/dcn31_clk_mgr.h"
+#endif
 
 
 int clk_mgr_helper_get_active_display_cnt(
@@ -261,6 +264,26 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 		}
 		break;
 #endif
+
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	case FAMILY_YELLOW_CARP: {
+		struct clk_mgr_dcn31 *clk_mgr = kzalloc(sizeof(*clk_mgr), GFP_KERNEL);
+
+		if (clk_mgr == NULL) {
+			BREAK_TO_DEBUGGER();
+			return NULL;
+		}
+		if (ASICREV_IS_YELLOW_CARP(asic_id.hw_internal_rev)) {
+			/* TODO: to add DCN31 clk_mgr support, once CLK IP header files are available,
+			 * for now use DCN3.0 clk mgr.
+			 */
+			dcn31_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+			return &clk_mgr->base.base;
+		}
+		return &clk_mgr->base.base;
+	}
+#endif
+
 	default:
 		ASSERT(0); /* Unknown Asic */
 		break;
@@ -292,6 +315,13 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 			vg_clk_mgr_destroy(clk_mgr);
 		break;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	case FAMILY_YELLOW_CARP:
+		if (ASICREV_IS_YELLOW_CARP(clk_mgr_base->ctx->asic_id.hw_internal_rev))
+			dcn31_clk_mgr_destroy(clk_mgr);
+		break;
+#endif
+
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
index 372d53b5a34d..59d17195bc22 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c
@@ -324,6 +324,10 @@ void dcn2_update_clocks_fpga(struct clk_mgr *clk_mgr,
 	// Both fclk and ref_dppclk run on the same scemi clock.
 	clk_mgr_int->dccg->ref_dppclk = clk_mgr->clks.fclk_khz;
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	/* TODO: set dtbclk in correct place */
+	clk_mgr->clks.dtbclk_en = false;
+#endif
 	dm_set_dcn_clocks(clk_mgr->ctx, &clk_mgr->clks);
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
new file mode 100644
index 000000000000..7b7d884d58be
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.c
@@ -0,0 +1,673 @@
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
+
+#include "dccg.h"
+#include "clk_mgr_internal.h"
+
+// For dce12_get_dp_ref_freq_khz
+#include "dce100/dce_clk_mgr.h"
+
+// For dcn20_update_clocks_update_dpp_dto
+#include "dcn20/dcn20_clk_mgr.h"
+
+
+
+#include "dcn31_clk_mgr.h"
+
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dcn31_smu.h"
+#include "dm_helpers.h"
+
+/* TODO: remove this include once we ported over remaining clk mgr functions*/
+#include "dcn30/dcn30_clk_mgr.h"
+
+#include "dc_dmub_srv.h"
+
+#define TO_CLK_MGR_DCN31(clk_mgr)\
+	container_of(clk_mgr, struct clk_mgr_dcn31, base)
+
+int dcn31_get_active_display_cnt_wa(
+		struct dc *dc,
+		struct dc_state *context)
+{
+	int i, display_count;
+	bool tmds_present = false;
+
+	display_count = 0;
+	for (i = 0; i < context->stream_count; i++) {
+		const struct dc_stream_state *stream = context->streams[i];
+
+		if (stream->signal == SIGNAL_TYPE_HDMI_TYPE_A ||
+				stream->signal == SIGNAL_TYPE_DVI_SINGLE_LINK ||
+				stream->signal == SIGNAL_TYPE_DVI_DUAL_LINK)
+			tmds_present = true;
+	}
+
+	for (i = 0; i < dc->link_count; i++) {
+		const struct dc_link *link = dc->links[i];
+
+		/* abusing the fact that the dig and phy are coupled to see if the phy is enabled */
+		if (link->link_enc->funcs->is_dig_enabled &&
+				link->link_enc->funcs->is_dig_enabled(link->link_enc))
+			display_count++;
+	}
+
+	/* WA for hang on HDMI after display off back back on*/
+	if (display_count == 0 && tmds_present)
+		display_count = 1;
+
+	return display_count;
+}
+
+static void dcn31_disable_otg_wa(struct clk_mgr *clk_mgr_base, bool disable)
+{
+	struct dc *dc = clk_mgr_base->ctx->dc;
+	int i;
+
+	for (i = 0; i < dc->res_pool->pipe_count; ++i) {
+		struct pipe_ctx *pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+
+		if (pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+		if (pipe->stream && (pipe->stream->dpms_off || dc_is_virtual_signal(pipe->stream->signal))) {
+			if (disable)
+				pipe->stream_res.tg->funcs->immediate_disable_crtc(pipe->stream_res.tg);
+			else
+				pipe->stream_res.tg->funcs->enable_crtc(pipe->stream_res.tg);
+		}
+	}
+}
+
+static void dcn31_update_clocks(struct clk_mgr *clk_mgr_base,
+			struct dc_state *context,
+			bool safe_to_lower)
+{
+	union dmub_rb_cmd cmd;
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct dc_clocks *new_clocks = &context->bw_ctx.bw.dcn.clk;
+	struct dc *dc = clk_mgr_base->ctx->dc;
+	int display_count;
+	bool update_dppclk = false;
+	bool update_dispclk = false;
+	bool dpp_clock_lowered = false;
+
+	if (dc->work_arounds.skip_clock_update)
+		return;
+
+	/*
+	 * if it is safe to lower, but we are already in the lower state, we don't have to do anything
+	 * also if safe to lower is false, we just go in the higher state
+	 */
+	if (safe_to_lower) {
+		if (new_clocks->z9_support == DCN_Z9_SUPPORT_ALLOW &&
+				new_clocks->z9_support != clk_mgr_base->clks.z9_support) {
+			dcn31_smu_set_Z9_support(clk_mgr, true);
+			clk_mgr_base->clks.z9_support = new_clocks->z9_support;
+		}
+
+		if (clk_mgr_base->clks.dtbclk_en && !new_clocks->dtbclk_en) {
+			dcn31_smu_set_dtbclk(clk_mgr, false);
+			clk_mgr_base->clks.dtbclk_en = new_clocks->dtbclk_en;
+		}
+		/* check that we're not already in lower */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
+			display_count = dcn31_get_active_display_cnt_wa(dc, context);
+			/* if we can go lower, go lower */
+			if (display_count == 0) {
+				union display_idle_optimization_u idle_info = { 0 };
+				idle_info.idle_info.df_request_disabled = 1;
+				idle_info.idle_info.phy_ref_clk_off = 1;
+				dcn31_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+				/* update power state */
+				clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_LOW_POWER;
+			}
+		}
+	} else {
+		if (new_clocks->z9_support == DCN_Z9_SUPPORT_DISALLOW &&
+				new_clocks->z9_support != clk_mgr_base->clks.z9_support) {
+			dcn31_smu_set_Z9_support(clk_mgr, false);
+			clk_mgr_base->clks.z9_support = new_clocks->z9_support;
+		}
+
+		if (!clk_mgr_base->clks.dtbclk_en && new_clocks->dtbclk_en) {
+			dcn31_smu_set_dtbclk(clk_mgr, true);
+			clk_mgr_base->clks.dtbclk_en = new_clocks->dtbclk_en;
+		}
+
+		/* check that we're not already in D0 */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_MISSION_MODE) {
+			union display_idle_optimization_u idle_info = { 0 };
+			dcn31_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+			/* update power state */
+			clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_MISSION_MODE;
+		}
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
+		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
+		dcn31_smu_set_hard_min_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_khz);
+	}
+
+	if (should_set_clock(safe_to_lower,
+			new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
+		dcn31_smu_set_min_deep_sleep_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz);
+	}
+
+	// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
+	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
+		if (new_clocks->dppclk_khz < 100000)
+			new_clocks->dppclk_khz = 100000;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dppclk_khz, clk_mgr->base.clks.dppclk_khz)) {
+		if (clk_mgr->base.clks.dppclk_khz > new_clocks->dppclk_khz)
+			dpp_clock_lowered = true;
+		clk_mgr_base->clks.dppclk_khz = new_clocks->dppclk_khz;
+		update_dppclk = true;
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dispclk_khz, clk_mgr_base->clks.dispclk_khz)) {
+		dcn31_disable_otg_wa(clk_mgr_base, true);
+
+		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
+		dcn31_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
+		dcn31_disable_otg_wa(clk_mgr_base, false);
+
+		update_dispclk = true;
+	}
+
+	/* TODO: add back DTO programming when DPPCLK restore is fixed in FSDL*/
+	if (dpp_clock_lowered) {
+		// increase per DPP DTO before lowering global dppclk
+		dcn31_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+	} else {
+		// increase global DPPCLK before lowering per DPP DTO
+		if (update_dppclk || update_dispclk)
+			dcn31_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+	}
+
+	// notify DMCUB of latest clocks
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.notify_clocks.header.type = DMUB_CMD__CLK_MGR;
+	cmd.notify_clocks.header.sub_type = DMUB_CMD__CLK_MGR_NOTIFY_CLOCKS;
+	cmd.notify_clocks.clocks.dcfclk_khz = clk_mgr_base->clks.dcfclk_khz;
+	cmd.notify_clocks.clocks.dcfclk_deep_sleep_khz =
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz;
+	cmd.notify_clocks.clocks.dispclk_khz = clk_mgr_base->clks.dispclk_khz;
+	cmd.notify_clocks.clocks.dppclk_khz = clk_mgr_base->clks.dppclk_khz;
+
+	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+}
+
+static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
+{
+	return 0;
+}
+
+static void dcn31_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	dcn31_smu_enable_pme_wa(clk_mgr);
+}
+
+static void dcn31_init_clocks(struct clk_mgr *clk_mgr)
+{
+	memset(&(clk_mgr->clks), 0, sizeof(struct dc_clocks));
+	// Assumption is that boot state always supports pstate
+	clk_mgr->clks.p_state_change_support = true;
+	clk_mgr->clks.prev_p_state_change_support = true;
+	clk_mgr->clks.pwr_state = DCN_PWR_STATE_UNKNOWN;
+	clk_mgr->clks.z9_support = DCN_Z9_SUPPORT_UNKNOWN;
+}
+
+static bool dcn31_are_clock_states_equal(struct dc_clocks *a,
+		struct dc_clocks *b)
+{
+	if (a->dispclk_khz != b->dispclk_khz)
+		return false;
+	else if (a->dppclk_khz != b->dppclk_khz)
+		return false;
+	else if (a->dcfclk_khz != b->dcfclk_khz)
+		return false;
+	else if (a->dcfclk_deep_sleep_khz != b->dcfclk_deep_sleep_khz)
+		return false;
+	else if (a->z9_support != b->z9_support)
+		return false;
+	else if (a->dtbclk_en != b->dtbclk_en)
+		return false;
+
+	return true;
+}
+
+static void dcn31_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
+		struct clk_mgr *clk_mgr_base, struct clk_log_info *log_info)
+{
+	return;
+}
+
+static struct clk_bw_params dcn31_bw_params = {
+	.vram_type = Ddr4MemType,
+	.num_channels = 1,
+	.clk_table = {
+		.num_entries = 4,
+	},
+
+};
+
+static struct wm_table ddr4_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 6.09,
+			.sr_enter_plus_exit_time_us = 7.14,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.72,
+			.sr_exit_time_us = 10.12,
+			.sr_enter_plus_exit_time_us = 11.48,
+			.valid = true,
+		},
+	}
+};
+
+static struct wm_table lpddr5_wm_table = {
+	.entries = {
+		{
+			.wm_inst = WM_A,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 5.32,
+			.sr_enter_plus_exit_time_us = 6.38,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.82,
+			.sr_enter_plus_exit_time_us = 11.196,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.89,
+			.sr_enter_plus_exit_time_us = 11.24,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 9.748,
+			.sr_enter_plus_exit_time_us = 11.102,
+			.valid = true,
+		},
+	}
+};
+
+static DpmClocks_t dummy_clocks;
+
+static struct dcn31_watermarks dummy_wms = { 0 };
+
+static void dcn31_build_watermark_ranges(struct clk_bw_params *bw_params, struct dcn31_watermarks *table)
+{
+	int i, num_valid_sets;
+
+	num_valid_sets = 0;
+
+	for (i = 0; i < WM_SET_COUNT; i++) {
+		/* skip empty entries, the smu array has no holes*/
+		if (!bw_params->wm_table.entries[i].valid)
+			continue;
+
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmSetting = bw_params->wm_table.entries[i].wm_inst;
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmType = bw_params->wm_table.entries[i].wm_type;
+		/* We will not select WM based on fclk, so leave it as unconstrained */
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinClock = 0;
+		table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxClock = 0xFFFF;
+
+		if (table->WatermarkRow[WM_DCFCLK][num_valid_sets].WmType == WM_TYPE_PSTATE_CHG) {
+			if (i == 0)
+				table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinMclk = 0;
+			else {
+				/* add 1 to make it non-overlapping with next lvl */
+				table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinMclk =
+						bw_params->clk_table.entries[i - 1].dcfclk_mhz + 1;
+			}
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxMclk =
+					bw_params->clk_table.entries[i].dcfclk_mhz;
+
+		} else {
+			/* unconstrained for memory retraining */
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MinClock = 0;
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets].MaxClock = 0xFFFF;
+
+			/* Modify previous watermark range to cover up to max */
+			table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxClock = 0xFFFF;
+		}
+		num_valid_sets++;
+	}
+
+	ASSERT(num_valid_sets != 0); /* Must have at least one set of valid watermarks */
+
+	/* modify the min and max to make sure we cover the whole range*/
+	table->WatermarkRow[WM_DCFCLK][0].MinMclk = 0;
+	table->WatermarkRow[WM_DCFCLK][0].MinClock = 0;
+	table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxMclk = 0xFFFF;
+	table->WatermarkRow[WM_DCFCLK][num_valid_sets - 1].MaxClock = 0xFFFF;
+
+	/* This is for writeback only, does not matter currently as no writeback support*/
+	table->WatermarkRow[WM_SOCCLK][0].WmSetting = WM_A;
+	table->WatermarkRow[WM_SOCCLK][0].MinClock = 0;
+	table->WatermarkRow[WM_SOCCLK][0].MaxClock = 0xFFFF;
+	table->WatermarkRow[WM_SOCCLK][0].MinMclk = 0;
+	table->WatermarkRow[WM_SOCCLK][0].MaxMclk = 0xFFFF;
+}
+
+static void dcn31_notify_wm_ranges(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct clk_mgr_dcn31 *clk_mgr_dcn31 = TO_CLK_MGR_DCN31(clk_mgr);
+	struct dcn31_watermarks *table = clk_mgr_dcn31->smu_wm_set.wm_set;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || clk_mgr_dcn31->smu_wm_set.mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn31_build_watermark_ranges(clk_mgr_base->bw_params, table);
+
+	dcn31_smu_set_dram_addr_high(clk_mgr,
+			clk_mgr_dcn31->smu_wm_set.mc_address.high_part);
+	dcn31_smu_set_dram_addr_low(clk_mgr,
+			clk_mgr_dcn31->smu_wm_set.mc_address.low_part);
+	dcn31_smu_transfer_wm_table_dram_2_smu(clk_mgr);
+}
+
+static void dcn31_get_dpm_table_from_smu(struct clk_mgr_internal *clk_mgr,
+		struct dcn31_smu_dpm_clks *smu_dpm_clks)
+{
+	DpmClocks_t *table = smu_dpm_clks->dpm_clks;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || smu_dpm_clks->mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn31_smu_set_dram_addr_high(clk_mgr,
+			smu_dpm_clks->mc_address.high_part);
+	dcn31_smu_set_dram_addr_low(clk_mgr,
+			smu_dpm_clks->mc_address.low_part);
+	dcn31_smu_transfer_dpm_table_smu_2_dram(clk_mgr);
+}
+
+static uint32_t find_max_clk_value(const uint32_t clocks[], uint32_t num_clocks)
+{
+	uint32_t max = 0;
+	int i;
+
+	for (i = 0; i < num_clocks; ++i) {
+		if (clocks[i] > max)
+			max = clocks[i];
+	}
+
+	return max;
+}
+
+static unsigned int find_clk_for_voltage(
+		const DpmClocks_t *clock_table,
+		const uint32_t clocks[],
+		unsigned int voltage)
+{
+	int i;
+
+	for (i = 0; i < NUM_SOC_VOLTAGE_LEVELS; i++) {
+		if (clock_table->SocVoltage[i] == voltage)
+			return clocks[i];
+	}
+
+	ASSERT(0);
+	return 0;
+}
+
+void dcn31_clk_mgr_helper_populate_bw_params(
+		struct clk_mgr_internal *clk_mgr,
+		struct integrated_info *bios_info,
+		const DpmClocks_t *clock_table)
+{
+	int i, j;
+	struct clk_bw_params *bw_params = clk_mgr->base.bw_params;
+	uint32_t max_dispclk = 0, max_dppclk = 0;
+
+	j = -1;
+
+	ASSERT(NUM_DF_PSTATE_LEVELS <= MAX_NUM_DPM_LVL);
+
+	/* Find lowest DPM, FCLK is filled in reverse order*/
+
+	for (i = NUM_DF_PSTATE_LEVELS - 1; i >= 0; i--) {
+		if (clock_table->DfPstateTable[i].FClk != 0) {
+			j = i;
+			break;
+		}
+	}
+
+	if (j == -1) {
+		/* clock table is all 0s, just use our own hardcode */
+		ASSERT(0);
+		return;
+	}
+
+	bw_params->clk_table.num_entries = j + 1;
+
+	/* dispclk and dppclk can be max at any voltage, same number of levels for both */
+	if (clock_table->NumDispClkLevelsEnabled <= NUM_DISPCLK_DPM_LEVELS &&
+	    clock_table->NumDispClkLevelsEnabled <= NUM_DPPCLK_DPM_LEVELS) {
+		max_dispclk = find_max_clk_value(clock_table->DispClocks, clock_table->NumDispClkLevelsEnabled);
+		max_dppclk = find_max_clk_value(clock_table->DppClocks, clock_table->NumDispClkLevelsEnabled);
+	} else {
+		ASSERT(0);
+	}
+
+	for (i = 0; i < bw_params->clk_table.num_entries; i++, j--) {
+		bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].FClk;
+		bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].MemClk;
+		bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].Voltage;
+		switch (clock_table->DfPstateTable[j].WckRatio) {
+		case WCK_RATIO_1_2:
+			bw_params->clk_table.entries[i].wck_ratio = 2;
+			break;
+		case WCK_RATIO_1_4:
+			bw_params->clk_table.entries[i].wck_ratio = 4;
+			break;
+		default:
+			bw_params->clk_table.entries[i].wck_ratio = 1;
+		}
+		bw_params->clk_table.entries[i].dcfclk_mhz = find_clk_for_voltage(clock_table, clock_table->DcfClocks, clock_table->DfPstateTable[j].Voltage);
+		bw_params->clk_table.entries[i].socclk_mhz = find_clk_for_voltage(clock_table, clock_table->SocClocks, clock_table->DfPstateTable[j].Voltage);
+		bw_params->clk_table.entries[i].dispclk_mhz = max_dispclk;
+		bw_params->clk_table.entries[i].dppclk_mhz = max_dppclk;
+	}
+
+	bw_params->vram_type = bios_info->memory_type;
+	bw_params->num_channels = bios_info->ma_channel_number;
+
+	for (i = 0; i < WM_SET_COUNT; i++) {
+		bw_params->wm_table.entries[i].wm_inst = i;
+
+		if (i >= bw_params->clk_table.num_entries) {
+			bw_params->wm_table.entries[i].valid = false;
+			continue;
+		}
+
+		bw_params->wm_table.entries[i].wm_type = WM_TYPE_PSTATE_CHG;
+		bw_params->wm_table.entries[i].valid = true;
+	}
+}
+
+static struct clk_mgr_funcs dcn31_funcs = {
+	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+	.update_clocks = dcn31_update_clocks,
+	.init_clocks = dcn31_init_clocks,
+	.enable_pme_wa = dcn31_enable_pme_wa,
+	.are_clock_states_equal = dcn31_are_clock_states_equal,
+	.notify_wm_ranges = dcn31_notify_wm_ranges
+};
+extern struct clk_mgr_funcs dcn3_fpga_funcs;
+
+void dcn31_clk_mgr_construct(
+		struct dc_context *ctx,
+		struct clk_mgr_dcn31 *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg)
+{
+	struct dcn31_smu_dpm_clks smu_dpm_clks = { 0 };
+
+	clk_mgr->base.base.ctx = ctx;
+	clk_mgr->base.base.funcs = &dcn31_funcs;
+
+	clk_mgr->base.pp_smu = pp_smu;
+
+	clk_mgr->base.dccg = dccg;
+	clk_mgr->base.dfs_bypass_disp_clk = 0;
+
+	clk_mgr->base.dprefclk_ss_percentage = 0;
+	clk_mgr->base.dprefclk_ss_divider = 1000;
+	clk_mgr->base.ss_on_dprefclk = false;
+
+	clk_mgr->smu_wm_set.wm_set = (struct dcn31_watermarks *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(struct dcn31_watermarks),
+				&clk_mgr->smu_wm_set.mc_address.quad_part);
+
+	if (clk_mgr->smu_wm_set.wm_set == 0) {
+		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
+		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
+	}
+	ASSERT(clk_mgr->smu_wm_set.wm_set);
+
+	smu_dpm_clks.dpm_clks = (DpmClocks_t *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(DpmClocks_t),
+				&smu_dpm_clks.mc_address.quad_part);
+
+	if (smu_dpm_clks.dpm_clks == NULL) {
+		smu_dpm_clks.dpm_clks = &dummy_clocks;
+		smu_dpm_clks.mc_address.quad_part = 0;
+	}
+
+	ASSERT(smu_dpm_clks.dpm_clks);
+
+	if (IS_FPGA_MAXIMUS_DC(ctx->dce_environment)) {
+		clk_mgr->base.base.funcs = &dcn3_fpga_funcs;
+	} else {
+		struct clk_log_info log_info = {0};
+
+		clk_mgr->base.smu_ver = dcn31_smu_get_smu_version(&clk_mgr->base);
+
+		if (clk_mgr->base.smu_ver)
+			clk_mgr->base.smu_present = true;
+
+		/* TODO: Check we get what we expect during bringup */
+		clk_mgr->base.base.dentist_vco_freq_khz = get_vco_frequency_from_reg(&clk_mgr->base);
+
+		if (ctx->dc_bios->integrated_info->memory_type == LpDdr5MemType) {
+			dcn31_bw_params.wm_table = lpddr5_wm_table;
+		} else {
+			dcn31_bw_params.wm_table = ddr4_wm_table;
+		}
+		/* Saved clocks configured at boot for debug purposes */
+		 dcn31_dump_clk_registers(&clk_mgr->base.base.boot_snapshot, &clk_mgr->base.base, &log_info);
+
+	}
+
+	clk_mgr->base.base.dprefclk_khz = 600000;
+	clk_mgr->base.dccg->ref_dtbclk_khz = 600000;
+	dce_clock_read_ss_info(&clk_mgr->base);
+
+	clk_mgr->base.base.bw_params = &dcn31_bw_params;
+
+	if (clk_mgr->base.base.ctx->dc->debug.pstate_enabled) {
+		dcn31_get_dpm_table_from_smu(&clk_mgr->base, &smu_dpm_clks);
+
+		if (ctx->dc_bios && ctx->dc_bios->integrated_info) {
+			dcn31_clk_mgr_helper_populate_bw_params(
+					&clk_mgr->base,
+					ctx->dc_bios->integrated_info,
+					smu_dpm_clks.dpm_clks);
+		}
+	}
+
+	if (smu_dpm_clks.dpm_clks && smu_dpm_clks.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr->base.base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				smu_dpm_clks.dpm_clks);
+}
+
+void dcn31_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr_int)
+{
+	struct clk_mgr_dcn31 *clk_mgr = TO_CLK_MGR_DCN31(clk_mgr_int);
+
+	if (clk_mgr->smu_wm_set.wm_set && clk_mgr->smu_wm_set.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr_int->base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				clk_mgr->smu_wm_set.wm_set);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h
new file mode 100644
index 000000000000..cc21cf75eafd
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_clk_mgr.h
@@ -0,0 +1,103 @@
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
+#ifndef __DCN31_CLK_MGR_H__
+#define __DCN31_CLK_MGR_H__
+#include "clk_mgr_internal.h"
+
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
+#define mmCLK11_CLK1_CLK0_DFS_CNTL                      0x1B23F
+#define mmCLK11_CLK1_CLK_PLL_REQ                        0x1B20D
+#endif
+
+struct dcn31_watermarks;
+
+struct dcn31_smu_watermark_set {
+	struct dcn31_watermarks *wm_set;
+	union large_integer mc_address;
+};
+
+struct clk_mgr_dcn31 {
+	struct clk_mgr_internal base;
+	struct dcn31_smu_watermark_set smu_wm_set;
+};
+
+void dcn31_clk_mgr_construct(struct dc_context *ctx,
+		struct clk_mgr_dcn31 *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg);
+
+void dcn31_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr_int);
+
+#endif //__DCN31_CLK_MGR_H__
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
new file mode 100644
index 000000000000..66db5e988bc1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.c
@@ -0,0 +1,333 @@
+/*
+ * Copyright 2012-16 Advanced Micro Devices, Inc.
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
+#include <linux/delay.h>
+#include "core_types.h"
+#include "clk_mgr_internal.h"
+#include "reg_helper.h"
+#include "dm_helpers.h"
+#include "dcn31_smu.h"
+
+#include "yellow_carp_offset.h"
+#include "mp/mp_13_0_1_offset.h"
+#include "mp/mp_13_0_1_sh_mask.h"
+
+#define REG(reg_name) \
+	(MP0_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
+
+#define FN(reg_name, field) \
+	FD(reg_name##__##field)
+
+#define VBIOSSMC_MSG_TestMessage                  0x1
+#define VBIOSSMC_MSG_GetSmuVersion                0x2
+#define VBIOSSMC_MSG_PowerUpGfx                   0x3
+#define VBIOSSMC_MSG_SetDispclkFreq               0x4
+#define VBIOSSMC_MSG_SetDprefclkFreq              0x5   //Not used. DPRef is constant
+#define VBIOSSMC_MSG_SetDppclkFreq                0x6
+#define VBIOSSMC_MSG_SetHardMinDcfclkByFreq       0x7
+#define VBIOSSMC_MSG_SetMinDeepSleepDcfclk        0x8
+#define VBIOSSMC_MSG_SetPhyclkVoltageByFreq       0x9	//Keep it in case VMIN dees not support phy clk
+#define VBIOSSMC_MSG_GetFclkFrequency             0xA
+#define VBIOSSMC_MSG_SetDisplayCount              0xB   //Not used anymore
+#define VBIOSSMC_MSG_EnableTmdp48MHzRefclkPwrDown 0xC   //Not used anymore
+#define VBIOSSMC_MSG_UpdatePmeRestore             0xD
+#define VBIOSSMC_MSG_SetVbiosDramAddrHigh         0xE   //Used for WM table txfr
+#define VBIOSSMC_MSG_SetVbiosDramAddrLow          0xF
+#define VBIOSSMC_MSG_TransferTableSmu2Dram        0x10
+#define VBIOSSMC_MSG_TransferTableDram2Smu        0x11
+#define VBIOSSMC_MSG_SetDisplayIdleOptimizations  0x12
+#define VBIOSSMC_MSG_GetDprefclkFreq              0x13
+#define VBIOSSMC_MSG_GetDtbclkFreq                0x14
+#define VBIOSSMC_MSG_AllowZstatesEntry            0x15
+#define VBIOSSMC_MSG_DisallowZstatesEntry     	  0x16
+#define VBIOSSMC_MSG_SetDtbClk                    0x17
+#define VBIOSSMC_Message_Count                    0x18
+
+#define VBIOSSMC_Status_BUSY                      0x0
+#define VBIOSSMC_Result_OK                        0x1
+#define VBIOSSMC_Result_Failed                    0xFF
+#define VBIOSSMC_Result_UnknownCmd                0xFE
+#define VBIOSSMC_Result_CmdRejectedPrereq         0xFD
+#define VBIOSSMC_Result_CmdRejectedBusy           0xFC
+
+/*
+ * Function to be used instead of REG_WAIT macro because the wait ends when
+ * the register is NOT EQUAL to zero, and because the translation in msg_if.h
+ * won't work with REG_WAIT.
+ */
+static uint32_t dcn31_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
+{
+	uint32_t res_val = VBIOSSMC_Status_BUSY;
+
+	do {
+		res_val = REG_READ(MP1_SMN_C2PMSG_91);
+		if (res_val != VBIOSSMC_Status_BUSY)
+			break;
+
+		if (delay_us >= 1000)
+			msleep(delay_us/1000);
+		else if (delay_us > 0)
+			udelay(delay_us);
+	} while (max_retries--);
+
+	return res_val;
+}
+
+int dcn31_smu_send_msg_with_param(
+		struct clk_mgr_internal *clk_mgr,
+		unsigned int msg_id, unsigned int param)
+{
+	uint32_t result;
+
+	result = dcn31_smu_wait_for_response(clk_mgr, 10, 200000);
+	ASSERT(result == VBIOSSMC_Result_OK);
+
+	if (result == VBIOSSMC_Status_BUSY) {
+		return -1;
+	}
+
+	/* First clear response register */
+	REG_WRITE(MP1_SMN_C2PMSG_91, VBIOSSMC_Status_BUSY);
+
+	/* Set the parameter register for the SMU message, unit is Mhz */
+	REG_WRITE(MP1_SMN_C2PMSG_83, param);
+
+	/* Trigger the message transaction by writing the message ID */
+	REG_WRITE(MP1_SMN_C2PMSG_67, msg_id);
+
+	result = dcn31_smu_wait_for_response(clk_mgr, 10, 200000);
+
+	if (IS_SMU_TIMEOUT(result)) {
+		ASSERT(0);
+		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
+	}
+
+	return REG_READ(MP1_SMN_C2PMSG_83);
+}
+
+int dcn31_smu_get_smu_version(struct clk_mgr_internal *clk_mgr)
+{
+	return dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_GetSmuVersion,
+			0);
+}
+
+
+int dcn31_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz)
+{
+	int actual_dispclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dispclk_khz;
+
+	/*  Unit of SMU msg parameter is Mhz */
+	actual_dispclk_set_mhz = dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDispclkFreq,
+			(requested_dispclk_khz + 999) / 1000);
+
+	return actual_dispclk_set_mhz * 1000;
+}
+
+int dcn31_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
+{
+	int actual_dprefclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return clk_mgr->base.dprefclk_khz;
+
+	actual_dprefclk_set_mhz = dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDprefclkFreq,
+			(clk_mgr->base.dprefclk_khz + 999) / 1000);
+
+	/* TODO: add code for programing DP DTO, currently this is down by command table */
+
+	return actual_dprefclk_set_mhz * 1000;
+}
+
+int dcn31_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz)
+{
+	int actual_dcfclk_set_mhz = -1;
+
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dcfclk_khz;
+
+	actual_dcfclk_set_mhz = dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetHardMinDcfclkByFreq,
+			(requested_dcfclk_khz + 999) / 1000);
+
+	return actual_dcfclk_set_mhz * 1000;
+}
+
+int dcn31_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz)
+{
+	int actual_min_ds_dcfclk_mhz = -1;
+
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_min_ds_dcfclk_khz;
+
+	actual_min_ds_dcfclk_mhz = dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetMinDeepSleepDcfclk,
+			(requested_min_ds_dcfclk_khz + 999) / 1000);
+
+	return actual_min_ds_dcfclk_mhz * 1000;
+}
+
+int dcn31_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz)
+{
+	int actual_dppclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dpp_khz;
+
+	actual_dppclk_set_mhz = dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDppclkFreq,
+			(requested_dpp_khz + 999) / 1000);
+
+	return actual_dppclk_set_mhz * 1000;
+}
+
+void dcn31_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info)
+{
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	//TODO: Work with smu team to define optimization options.
+	dcn31_smu_send_msg_with_param(
+		clk_mgr,
+		VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+		idle_info);
+}
+
+void dcn31_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	union display_idle_optimization_u idle_info = { 0 };
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	if (enable) {
+		idle_info.idle_info.df_request_disabled = 1;
+		idle_info.idle_info.phy_ref_clk_off = 1;
+	}
+
+	dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+			idle_info.data);
+}
+
+void dcn31_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_UpdatePmeRestore,
+			0);
+}
+
+void dcn31_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn31_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrHigh, addr_high);
+}
+
+void dcn31_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn31_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrLow, addr_low);
+}
+
+void dcn31_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn31_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableSmu2Dram, TABLE_DPMCLOCKS);
+}
+
+void dcn31_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn31_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableDram2Smu, TABLE_WATERMARKS);
+}
+
+void dcn31_smu_set_Z9_support(struct clk_mgr_internal *clk_mgr, bool support)
+{
+	//TODO: Work with smu team to define optimization options.
+	unsigned int msg_id;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	if (support)
+		msg_id = VBIOSSMC_MSG_AllowZstatesEntry;
+	else
+		msg_id = VBIOSSMC_MSG_DisallowZstatesEntry;
+
+	dcn31_smu_send_msg_with_param(
+		clk_mgr,
+		msg_id,
+		0);
+
+}
+
+/* Arg = 1: Turn DTB on; 0: Turn DTB CLK OFF. when it is on, it is 600MHZ */
+void dcn31_smu_set_dtbclk(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn31_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDtbClk,
+			enable);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h
new file mode 100644
index 000000000000..cd0b7e1e685f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn31/dcn31_smu.h
@@ -0,0 +1,271 @@
+/*
+ * Copyright 2018 Advanced Micro Devices, Inc.
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
+#ifndef DAL_DC_31_SMU_H_
+#define DAL_DC_31_SMU_H_
+
+#ifndef PMFW_DRIVER_IF_H
+#define PMFW_DRIVER_IF_H
+#define PMFW_DRIVER_IF_VERSION 4
+
+typedef struct {
+  int32_t value;
+  uint32_t numFractionalBits;
+} FloatInIntFormat_t;
+
+typedef enum {
+  DSPCLK_DCFCLK = 0,
+  DSPCLK_DISPCLK,
+  DSPCLK_PIXCLK,
+  DSPCLK_PHYCLK,
+  DSPCLK_COUNT,
+} DSPCLK_e;
+
+typedef struct {
+  uint16_t Freq; // in MHz
+  uint16_t Vid;  // min voltage in SVI3 VID
+} DisplayClockTable_t;
+
+typedef struct {
+  uint16_t MinClock; // This is either DCFCLK or SOCCLK (in MHz)
+  uint16_t MaxClock; // This is either DCFCLK or SOCCLK (in MHz)
+  uint16_t MinMclk;
+  uint16_t MaxMclk;
+
+  uint8_t  WmSetting;
+  uint8_t  WmType;  // Used for normal pstate change or memory retraining
+  uint8_t  Padding[2];
+} WatermarkRowGeneric_t;
+
+#define NUM_WM_RANGES 4
+#define WM_PSTATE_CHG 0
+#define WM_RETRAINING 1
+
+typedef enum {
+  WM_SOCCLK = 0,
+  WM_DCFCLK,
+  WM_COUNT,
+} WM_CLOCK_e;
+
+typedef struct {
+  // Watermarks
+  WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+
+  uint32_t MmHubPadding[7]; // SMU internal use
+} Watermarks_t;
+
+typedef enum {
+  CUSTOM_DPM_SETTING_GFXCLK,
+  CUSTOM_DPM_SETTING_CCLK,
+  CUSTOM_DPM_SETTING_FCLK_CCX,
+  CUSTOM_DPM_SETTING_FCLK_GFX,
+  CUSTOM_DPM_SETTING_FCLK_STALLS,
+  CUSTOM_DPM_SETTING_LCLK,
+  CUSTOM_DPM_SETTING_COUNT,
+} CUSTOM_DPM_SETTING_e;
+
+typedef struct {
+  uint8_t             ActiveHystLimit;
+  uint8_t             IdleHystLimit;
+  uint8_t             FPS;
+  uint8_t             MinActiveFreqType;
+  FloatInIntFormat_t  MinActiveFreq;
+  FloatInIntFormat_t  PD_Data_limit;
+  FloatInIntFormat_t  PD_Data_time_constant;
+  FloatInIntFormat_t  PD_Data_error_coeff;
+  FloatInIntFormat_t  PD_Data_error_rate_coeff;
+} DpmActivityMonitorCoeffExt_t;
+
+typedef struct {
+  DpmActivityMonitorCoeffExt_t DpmActivityMonitorCoeff[CUSTOM_DPM_SETTING_COUNT];
+} CustomDpmSettings_t;
+
+#define NUM_DCFCLK_DPM_LEVELS   8
+#define NUM_DISPCLK_DPM_LEVELS  8
+#define NUM_DPPCLK_DPM_LEVELS   8
+#define NUM_SOCCLK_DPM_LEVELS   8
+#define NUM_VCN_DPM_LEVELS      8
+#define NUM_SOC_VOLTAGE_LEVELS  8
+#define NUM_DF_PSTATE_LEVELS    4
+
+typedef enum{
+  WCK_RATIO_1_1 = 0,  // DDR5, Wck:ck is always 1:1;
+  WCK_RATIO_1_2,
+  WCK_RATIO_1_4,
+  WCK_RATIO_MAX
+} WCK_RATIO_e;
+
+typedef struct {
+  uint32_t FClk;
+  uint32_t MemClk;
+  uint32_t Voltage;
+  uint8_t  WckRatio;
+  uint8_t  Spare[3];
+} DfPstateTable_t;
+
+//Freq in MHz
+//Voltage in milli volts with 2 fractional bits
+typedef struct {
+  uint32_t DcfClocks[NUM_DCFCLK_DPM_LEVELS];
+  uint32_t DispClocks[NUM_DISPCLK_DPM_LEVELS];
+  uint32_t DppClocks[NUM_DPPCLK_DPM_LEVELS];
+  uint32_t SocClocks[NUM_SOCCLK_DPM_LEVELS];
+  uint32_t VClocks[NUM_VCN_DPM_LEVELS];
+  uint32_t DClocks[NUM_VCN_DPM_LEVELS];
+  uint32_t SocVoltage[NUM_SOC_VOLTAGE_LEVELS];
+  DfPstateTable_t DfPstateTable[NUM_DF_PSTATE_LEVELS];
+
+  uint8_t  NumDcfClkLevelsEnabled;
+  uint8_t  NumDispClkLevelsEnabled; //Applies to both Dispclk and Dppclk
+  uint8_t  NumSocClkLevelsEnabled;
+  uint8_t  VcnClkLevelsEnabled;     //Applies to both Vclk and Dclk
+  uint8_t  NumDfPstatesEnabled;
+  uint8_t  spare[3];
+
+  uint32_t MinGfxClk;
+  uint32_t MaxGfxClk;
+} DpmClocks_t;
+
+
+// Throttler Status Bitmask
+#define THROTTLER_STATUS_BIT_SPL            0
+#define THROTTLER_STATUS_BIT_FPPT           1
+#define THROTTLER_STATUS_BIT_SPPT           2
+#define THROTTLER_STATUS_BIT_SPPT_APU       3
+#define THROTTLER_STATUS_BIT_THM_CORE       4
+#define THROTTLER_STATUS_BIT_THM_GFX        5
+#define THROTTLER_STATUS_BIT_THM_SOC        6
+#define THROTTLER_STATUS_BIT_TDC_VDD        7
+#define THROTTLER_STATUS_BIT_TDC_SOC        8
+#define THROTTLER_STATUS_BIT_PROCHOT_CPU    9
+#define THROTTLER_STATUS_BIT_PROCHOT_GFX   10
+#define THROTTLER_STATUS_BIT_EDC_CPU       11
+#define THROTTLER_STATUS_BIT_EDC_GFX       12
+
+typedef struct {
+  uint16_t GfxclkFrequency;             //[MHz]
+  uint16_t SocclkFrequency;             //[MHz]
+  uint16_t VclkFrequency;               //[MHz]
+  uint16_t DclkFrequency;               //[MHz]
+  uint16_t MemclkFrequency;             //[MHz]
+  uint16_t spare;
+
+  uint16_t GfxActivity;                 //[centi]
+  uint16_t UvdActivity;                 //[centi]
+
+  uint16_t Voltage[2];                  //[mV] indices: VDDCR_VDD, VDDCR_SOC
+  uint16_t Current[2];                  //[mA] indices: VDDCR_VDD, VDDCR_SOC
+  uint16_t Power[2];                    //[mW] indices: VDDCR_VDD, VDDCR_SOC
+
+  //3rd party tools in Windows need this info in the case of APUs
+  uint16_t CoreFrequency[8];            //[MHz]
+  uint16_t CorePower[8];                //[mW]
+  uint16_t CoreTemperature[8];          //[centi-Celsius]
+  uint16_t L3Frequency;                 //[MHz]
+  uint16_t L3Temperature;               //[centi-Celsius]
+
+  uint16_t GfxTemperature;              //[centi-Celsius]
+  uint16_t SocTemperature;              //[centi-Celsius]
+  uint16_t ThrottlerStatus;
+
+  uint16_t CurrentSocketPower;          //[mW]
+  uint16_t StapmOriginalLimit;          //[W]
+  uint16_t StapmCurrentLimit;           //[W]
+  uint16_t ApuPower;                    //[W]
+  uint16_t dGpuPower;                   //[W]
+
+  uint16_t VddTdcValue;                 //[mA]
+  uint16_t SocTdcValue;                 //[mA]
+  uint16_t VddEdcValue;                 //[mA]
+  uint16_t SocEdcValue;                 //[mA]
+
+  uint16_t InfrastructureCpuMaxFreq;    //[MHz]
+  uint16_t InfrastructureGfxMaxFreq;    //[MHz]
+} SmuMetrics_t;
+
+
+// Workload bits
+#define WORKLOAD_PPLIB_FULL_SCREEN_3D_BIT 0
+#define WORKLOAD_PPLIB_VIDEO_BIT          2
+#define WORKLOAD_PPLIB_VR_BIT             3
+#define WORKLOAD_PPLIB_COMPUTE_BIT        4
+#define WORKLOAD_PPLIB_CUSTOM_BIT         5
+#define WORKLOAD_PPLIB_COUNT              6
+
+#define TABLE_BIOS_IF            0 // Called by BIOS
+#define TABLE_WATERMARKS         1 // Called by DAL through VBIOS
+#define TABLE_CUSTOM_DPM         2 // Called by Driver
+#define TABLE_SPARE1             3
+#define TABLE_DPMCLOCKS          4 // Called by Driver
+#define TABLE_MOMENTARY_PM       5 // Called by Tools
+#define TABLE_MODERN_STDBY       6 // Called by Tools for Modern Standby Log
+#define TABLE_SMU_METRICS        7 // Called by Driver
+#define TABLE_COUNT              8
+
+#endif
+
+struct dcn31_watermarks {
+  // Watermarks
+  WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+
+  uint32_t MmHubPadding[7]; // SMU internal use
+};
+
+struct dcn31_smu_dpm_clks {
+	DpmClocks_t *dpm_clks;
+	union large_integer mc_address;
+};
+
+/* TODO: taken from vgh, may not be correct */
+struct display_idle_optimization {
+	unsigned int df_request_disabled : 1;
+	unsigned int phy_ref_clk_off     : 1;
+	unsigned int s0i2_rdy            : 1;
+	unsigned int reserved            : 29;
+};
+
+union display_idle_optimization_u {
+	struct display_idle_optimization idle_info;
+	uint32_t data;
+};
+
+int dcn31_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
+int dcn31_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
+int dcn31_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
+int dcn31_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz);
+int dcn31_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz);
+int dcn31_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz);
+void dcn31_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info);
+void dcn31_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable);
+void dcn31_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr);
+void dcn31_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high);
+void dcn31_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low);
+void dcn31_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr);
+void dcn31_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr);
+
+void dcn31_smu_set_Z9_support(struct clk_mgr_internal *clk_mgr, bool support);
+void dcn31_smu_set_dtbclk(struct clk_mgr_internal *clk_mgr, bool enable);
+
+#endif /* DAL_DC_31_SMU_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
index c0fbcbd4cbfc..699160f9d3e7 100644
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -350,6 +350,13 @@ enum dcn_pwr_state {
 	DCN_PWR_STATE_LOW_POWER = 3,
 };
 
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+enum dcn_z9_support_state {
+	DCN_Z9_SUPPORT_UNKNOWN,
+	DCN_Z9_SUPPORT_ALLOW,
+	DCN_Z9_SUPPORT_DISALLOW,
+};
+#endif
 /*
  * For any clocks that may differ per pipe
  * only the max is stored in this structure
@@ -367,6 +374,10 @@ struct dc_clocks {
 	int phyclk_khz;
 	int dramclk_khz;
 	bool p_state_change_support;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	enum dcn_z9_support_state z9_support;
+	bool dtbclk_en;
+#endif
 	enum dcn_pwr_state pwr_state;
 	/*
 	 * Elements below are not compared for the purposes of
@@ -487,6 +498,9 @@ struct dc_debug_options {
 	bool disable_pplib_clock_request;
 	bool disable_clock_gate;
 	bool disable_mem_low_power;
+#if defined(CONFIG_DRM_AMD_DC_DCN3_1)
+	bool pstate_enabled;
+#endif
 	bool disable_dmcu;
 	bool disable_psr;
 	bool force_abm_enable;
diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
index 304d50d16d01..9ab854293ace 100644
--- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
+++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
@@ -162,6 +162,12 @@ void dm_set_dcn_clocks(
 
 bool dm_helpers_dmub_outbox_interrupt_control(struct dc_context *ctx, bool enable);
 
+void dm_helpers_smu_timeout(struct dc_context *ctx, unsigned int msg_id, unsigned int param, unsigned int timeout_us);
+
+// 0x1 = Result_OK, 0xFE = Result_UnkmownCmd
+#define IS_SMU_TIMEOUT(result) \
+	(!(result == 0x1 || result == 0xFE))
+
 int dm_helper_dmub_aux_transfer_sync(
 		struct dc_context *ctx,
 		const struct dc_link *link,
diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
index 5dc8d02b40c3..90dbe26bf954 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h
@@ -91,6 +91,9 @@ struct clk_limit_table_entry {
 	unsigned int dispclk_mhz;
 	unsigned int dppclk_mhz;
 	unsigned int phyclk_mhz;
+#ifdef CONFIG_DRM_AMD_DC_DCN3_1
+	unsigned int wck_ratio;
+#endif
 };
 
 /* This table is contiguous */
-- 
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

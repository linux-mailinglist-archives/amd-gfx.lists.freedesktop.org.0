Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 628E74B795F
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Feb 2022 22:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CE210E556;
	Tue, 15 Feb 2022 21:45:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A2510E55F
 for <amd-gfx@lists.freedesktop.org>; Tue, 15 Feb 2022 21:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gio5LtmaOZj6GxuTa48VYBDW20zzlvhyM8av2iTGNVO3UyNb730EIHtWKHWHIv9t0rcwDq/O4JfTffZ/aJjLAme/77HydLBO799w7eKl7WDCeYVvLlYrdDWFlovTcvRaVOJ37HqiA7/efvnsjFjz4aZBjpq1wsNhfnBioOFharxOR1XMgDSf1Mkw8NedLqoSlJCNgTaSgACj/wPduL75AS83z90AzoOeSaNWk/PANgpqAQxVooRZK4yavslHRtqMs2j94XeNcf98iv6SIXgpBAzBH2BM7SmwOowwW1Dy/+QBhmydFQDfqL6Y9muzgdX09FKQlj42Qu9js8OR/4TMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHJ4hZ03WRiCLnxcPUGxtaTBYf4ekBLVbAcx35wHgJI=;
 b=YHRG5YzCt6q0ZupvrBXVwm5k7qp7yogEVpE2mIOd3VfvPntpDJVTBKy+R4qnWa0Fd0J4kti9fUOnaljxncxtEwlBpfdQzMmV9vj4ZAIXuhqEkKlfqBp3rXikiSF7iGOhDflPY+dyvx6sXVLilboMR/ZaKyD/9CGf7LMIFQb+Iimvxgo9HvZQRV/9q9Epk2Sqr1rhTq7emlyKOjWWX0+kUeMLb6RukCdM6aG5ydHWu9Mnm1yNXpxxVGkT1HjdTqDtQfKQPHZsxECx/mz1CVKBK6YiBR3iZdrE1JFP22VOUSAamkqKCOe0Rv9KHXQ3hhwHn+vsYSEo1g6GK7Y0XeYO/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHJ4hZ03WRiCLnxcPUGxtaTBYf4ekBLVbAcx35wHgJI=;
 b=qvxkg785FuK958HWfYruoEk6memrUvyaWHzkOkWRWdWEIxgo0BOhVXGa9QjRdh6N1gcvRBLFIl+a0/d6JjYhXLwhwcPkRUkZkSV/QmLDrcWJaflnC72UNlC/WkQgCgv7ZtDzcn4/gCs3HX+eZfq/UtIAordCa6BiTTmhbOKSElU=
Received: from BN9PR03CA0269.namprd03.prod.outlook.com (2603:10b6:408:ff::34)
 by CO6PR12MB5460.namprd12.prod.outlook.com (2603:10b6:5:357::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Tue, 15 Feb
 2022 21:45:10 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::fa) by BN9PR03CA0269.outlook.office365.com
 (2603:10b6:408:ff::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Tue, 15 Feb 2022 21:45:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 21:45:10 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 15:45:05 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 5/6] drm/amd/display: Add DCN316 resource and SMU clock manager
Date: Tue, 15 Feb 2022 16:44:46 -0500
Message-ID: <20220215214447.2234978-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220215214447.2234978-1-alexander.deucher@amd.com>
References: <20220215214447.2234978-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e155a6f-6789-4319-5d67-08d9f0cc70be
X-MS-TrafficTypeDiagnostic: CO6PR12MB5460:EE_
X-Microsoft-Antispam-PRVS: <CO6PR12MB5460126006BC5B55642C43E1F7349@CO6PR12MB5460.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lAsy+2flG65f6LmJbx1CV5FnAIQ6s0yHpkbBoD7Rzkt3Pdu5iUfR3m6bXJM6idbYgoIFL1GfibIWAxcqN1VjeLlsuKnCOFTYBsm7XoB+/svnIaBpqppvpQ2pCImKSQW8pRkrgXN7H3rASgcXz2fU7WFgyfoKn1meoJBYBrUAMZ//6nkFnX2XNRfPW4pfWEoICMojAbH1K29sK1Loz8VRe/jACmRfiqc0WfDW5zgLTDe6303DuKuKlGQpQpnMSuqbwe9lKbBxuaFS2EIU12napZO4pmIM2M70mVtl2gWWKt85Q0yP20JZVWdUbT2/pcib8qonbPAW3+gqzJ5x70vC6bg4Auo5q6b4OJny79UA3bkqXtehons1//iwCwATbWkV66vCarPvTjpAEO/T9ZK5WXL86Q3g0IsYkN25yTkGqMqqP52IuLmGc8DigWwDuCbKqmKHRbXwNVfwiVmlGKqoJOxLchnu1ZIXI8QsivknXAZfttr+jb+0x6Et6rho5oIp0bLAtGSQEHSRS9Lg7/aMPxREEOaXO/bBOtky+fRyBS6oLATWDPIPayVOAFyn9w487YDAWsXcpU3/LLfhQDDuPazQTtWrCIh4x8rOXQ1IBDKi5L+tx/IlTM6pcqXS7xu5yd4Kr8d6ub7ikBHhq2Bc/e3cr/ky525CQJr1ZKPYtB3AT31PoYed8Xd0q7gMSmzLItY7lFiRuc8sXl3J7cDz0YyVUVWpi5CNTDoQsDOXGNg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(7696005)(356005)(8936002)(82310400004)(86362001)(83380400001)(16526019)(81166007)(30864003)(5660300002)(26005)(426003)(336012)(186003)(36860700001)(40460700003)(6666004)(2616005)(2906002)(316002)(1076003)(70586007)(47076005)(70206006)(8676002)(508600001)(19627235002)(36756003)(4326008)(6916009)(54906003)(36900700001)(559001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 21:45:10.4685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e155a6f-6789-4319-5d67-08d9f0cc70be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5460
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
Cc: Leo Li <sunpeng.li@amd.com>, Charlene Liu <Charlene.Liu@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Hansen Dsouza <Hansen.Dsouza@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Hansen Dsouza <Hansen.Dsouza@amd.com>

Add core DC implementation for DCN316.

Reviewed-by: Charlene Liu <Charlene.Liu@amd.com>
Acked-by: Prike Liang <Prike.Liang@amd.com>
Acked-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Hansen Dsouza <Hansen.Dsouza@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/Makefile       |    1 +
 .../gpu/drm/amd/display/dc/clk_mgr/Makefile   |   10 +
 .../gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c  |   20 +-
 .../dc/clk_mgr/dcn316/dcn316_clk_mgr.c        |  706 +++++
 .../dc/clk_mgr/dcn316/dcn316_clk_mgr.h        |   49 +
 .../display/dc/clk_mgr/dcn316/dcn316_smu.c    |  328 +++
 .../display/dc/clk_mgr/dcn316/dcn316_smu.h    |  128 +
 .../gpu/drm/amd/display/dc/core/dc_resource.c |    4 +
 .../gpu/drm/amd/display/dc/dcn316/Makefile    |   56 +
 .../amd/display/dc/dcn316/dcn316_resource.c   | 2306 +++++++++++++++++
 .../amd/display/dc/dcn316/dcn316_resource.h   |   42 +
 drivers/gpu/drm/amd/display/dc/gpio/Makefile  |    1 +
 12 files changed, 3648 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h

diff --git a/drivers/gpu/drm/amd/display/dc/Makefile b/drivers/gpu/drm/amd/display/dc/Makefile
index 0aaf394b73ff..30d0286b2291 100644
--- a/drivers/gpu/drm/amd/display/dc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/Makefile
@@ -36,6 +36,7 @@ DC_LIBS += dcn301
 DC_LIBS += dcn302
 DC_LIBS += dcn303
 DC_LIBS += dcn31
+DC_LIBS += dcn316
 endif
 
 DC_LIBS += dce120
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
index 6bd73e49a6d2..3bf8ef9373e8 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/Makefile
@@ -153,4 +153,14 @@ CLK_MGR_DCN31 = dcn31_smu.o dcn31_clk_mgr.o
 AMD_DAL_CLK_MGR_DCN31 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn31/,$(CLK_MGR_DCN31))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN31)
+
+###############################################################################
+# DCN316
+###############################################################################
+CLK_MGR_DCN316 = dcn316_smu.o dcn316_clk_mgr.o
+
+AMD_DAL_CLK_MGR_DCN316 = $(addprefix $(AMDDALPATH)/dc/clk_mgr/dcn316/,$(CLK_MGR_DCN316))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_CLK_MGR_DCN316)
+
 endif
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
index a707d07d5197..0a608bd4bd61 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/clk_mgr.c
@@ -43,6 +43,7 @@
 #include "dcn30/dcn30_clk_mgr.h"
 #include "dcn301/vg_clk_mgr.h"
 #include "dcn31/dcn31_clk_mgr.h"
+#include "dcn316/dcn316_clk_mgr.h"
 
 
 int clk_mgr_helper_get_active_display_cnt(
@@ -278,8 +279,7 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 			return &clk_mgr->base.base;
 		}
 		break;
-	case FAMILY_YELLOW_CARP:
-	case AMDGPU_FAMILY_GC_10_3_7:{
+	case FAMILY_YELLOW_CARP: {
 		struct clk_mgr_dcn31 *clk_mgr = kzalloc(sizeof(*clk_mgr), GFP_KERNEL);
 
 		if (clk_mgr == NULL) {
@@ -290,6 +290,17 @@ struct clk_mgr *dc_clk_mgr_create(struct dc_context *ctx, struct pp_smu_funcs *p
 		dcn31_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
 		return &clk_mgr->base.base;
 	}
+	case AMDGPU_FAMILY_GC_10_3_7: {
+		struct clk_mgr_dcn316 *clk_mgr = kzalloc(sizeof(*clk_mgr), GFP_KERNEL);
+
+		if (clk_mgr == NULL) {
+			BREAK_TO_DEBUGGER();
+			return NULL;
+		}
+
+		dcn316_clk_mgr_construct(ctx, clk_mgr, pp_smu, dccg);
+		return &clk_mgr->base.base;
+	}
 #endif
 
 	default:
@@ -323,10 +334,13 @@ void dc_destroy_clk_mgr(struct clk_mgr *clk_mgr_base)
 		break;
 
 	case FAMILY_YELLOW_CARP:
-	case AMDGPU_FAMILY_GC_10_3_7:
 			dcn31_clk_mgr_destroy(clk_mgr);
 		break;
 
+	case AMDGPU_FAMILY_GC_10_3_7:
+			dcn316_clk_mgr_destroy(clk_mgr);
+		break;
+
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
new file mode 100644
index 000000000000..ffd3d5cb9871
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c
@@ -0,0 +1,706 @@
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
+
+
+#include "dccg.h"
+#include "clk_mgr_internal.h"
+
+// For dce12_get_dp_ref_freq_khz
+#include "dce100/dce_clk_mgr.h"
+// For dcn20_update_clocks_update_dpp_dto
+#include "dcn20/dcn20_clk_mgr.h"
+#include "dcn31/dcn31_clk_mgr.h"
+#include "dcn316_clk_mgr.h"
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dcn316_smu.h"
+#include "dm_helpers.h"
+#include "dc_dmub_srv.h"
+#include "dc_link_dp.h"
+
+// DCN316 this is CLK1 instance
+#define MAX_INSTANCE                                        7
+#define MAX_SEGMENT                                         6
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
+static const struct IP_BASE CLK_BASE = { { { { 0x00016C00, 0x02401800, 0, 0, 0, 0 } },
+                                        { { 0x00016E00, 0x02401C00, 0, 0, 0, 0 } },
+                                        { { 0x00017000, 0x02402000, 0, 0, 0, 0 } },
+                                        { { 0x00017200, 0x02402400, 0, 0, 0, 0 } },
+                                        { { 0x0001B000, 0x0242D800, 0, 0, 0, 0 } },
+                                        { { 0x0001B200, 0x0242DC00, 0, 0, 0, 0 } },
+                                        { { 0x0001B400, 0x0242E000, 0, 0, 0, 0 } } } };
+
+#define regCLK1_CLK_PLL_REQ						0x0237
+#define regCLK1_CLK_PLL_REQ_BASE_IDX			0
+
+#define CLK1_CLK_PLL_REQ__FbMult_int__SHIFT		0x0
+#define CLK1_CLK_PLL_REQ__PllSpineDiv__SHIFT	0xc
+#define CLK1_CLK_PLL_REQ__FbMult_frac__SHIFT	0x10
+#define CLK1_CLK_PLL_REQ__FbMult_int_MASK		0x000001FFL
+#define CLK1_CLK_PLL_REQ__PllSpineDiv_MASK		0x0000F000L
+#define CLK1_CLK_PLL_REQ__FbMult_frac_MASK		0xFFFF0000L
+
+#define REG(reg_name) \
+	(CLK_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
+
+#define TO_CLK_MGR_DCN316(clk_mgr)\
+	container_of(clk_mgr, struct clk_mgr_dcn316, base)
+
+static int dcn316_get_active_display_cnt_wa(
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
+		if (link->link_enc && link->link_enc->funcs->is_dig_enabled &&
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
+static void dcn316_disable_otg_wa(struct clk_mgr *clk_mgr_base, bool disable)
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
+static void dcn316_enable_pme_wa(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+
+	dcn316_smu_enable_pme_wa(clk_mgr);
+}
+
+static void dcn316_update_clocks(struct clk_mgr *clk_mgr_base,
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
+	clk_mgr_base->clks.zstate_support = new_clocks->zstate_support;
+	if (safe_to_lower) {
+		if (clk_mgr_base->clks.dtbclk_en && !new_clocks->dtbclk_en) {
+			dcn316_smu_set_dtbclk(clk_mgr, false);
+			clk_mgr_base->clks.dtbclk_en = new_clocks->dtbclk_en;
+		}
+		/* check that we're not already in lower */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
+			display_count = dcn316_get_active_display_cnt_wa(dc, context);
+			/* if we can go lower, go lower */
+			if (display_count == 0) {
+				union display_idle_optimization_u idle_info = { 0 };
+				idle_info.idle_info.df_request_disabled = 1;
+				idle_info.idle_info.phy_ref_clk_off = 1;
+				// Todo DCN316 set this to 1 if any no issue
+				idle_info.idle_info.s0i2_rdy = 0;
+				dcn316_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+				/* update power state */
+				clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_LOW_POWER;
+			}
+		}
+	} else {
+		if (!clk_mgr_base->clks.dtbclk_en && new_clocks->dtbclk_en) {
+			dcn316_smu_set_dtbclk(clk_mgr, true);
+			clk_mgr_base->clks.dtbclk_en = new_clocks->dtbclk_en;
+		}
+
+		/* check that we're not already in D0 */
+		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_MISSION_MODE) {
+			union display_idle_optimization_u idle_info = { 0 };
+			dcn316_smu_set_display_idle_optimization(clk_mgr, idle_info.data);
+			/* update power state */
+			clk_mgr_base->clks.pwr_state = DCN_PWR_STATE_MISSION_MODE;
+		}
+	}
+
+	if (should_set_clock(safe_to_lower, new_clocks->dcfclk_khz, clk_mgr_base->clks.dcfclk_khz)) {
+		clk_mgr_base->clks.dcfclk_khz = new_clocks->dcfclk_khz;
+		dcn316_smu_set_hard_min_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_khz);
+	}
+
+	if (should_set_clock(safe_to_lower,
+			new_clocks->dcfclk_deep_sleep_khz, clk_mgr_base->clks.dcfclk_deep_sleep_khz)) {
+		clk_mgr_base->clks.dcfclk_deep_sleep_khz = new_clocks->dcfclk_deep_sleep_khz;
+		dcn316_smu_set_min_deep_sleep_dcfclk(clk_mgr, clk_mgr_base->clks.dcfclk_deep_sleep_khz);
+	}
+
+	// workaround: Limit dppclk to 100Mhz to avoid lower eDP panel switch to plus 4K monitor underflow.
+	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
+		if (new_clocks->dppclk_khz < 100000)
+			new_clocks->dppclk_khz = 100000;
+		if (new_clocks->dispclk_khz < 100000)
+			new_clocks->dispclk_khz = 100000;
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
+		dcn316_disable_otg_wa(clk_mgr_base, true);
+
+		clk_mgr_base->clks.dispclk_khz = new_clocks->dispclk_khz;
+		dcn316_smu_set_dispclk(clk_mgr, clk_mgr_base->clks.dispclk_khz);
+		dcn316_disable_otg_wa(clk_mgr_base, false);
+
+		update_dispclk = true;
+	}
+
+	if (dpp_clock_lowered) {
+		// increase per DPP DTO before lowering global dppclk
+		dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
+		dcn316_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+	} else {
+		// increase global DPPCLK before lowering per DPP DTO
+		if (update_dppclk || update_dispclk)
+			dcn316_smu_set_dppclk(clk_mgr, clk_mgr_base->clks.dppclk_khz);
+		// always update dtos unless clock is lowered and not safe to lower
+		if (new_clocks->dppclk_khz >= dc->current_state->bw_ctx.bw.dcn.clk.dppclk_khz)
+			dcn20_update_clocks_update_dpp_dto(clk_mgr, context, safe_to_lower);
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
+static void dcn316_dump_clk_registers(struct clk_state_registers_and_bypass *regs_and_bypass,
+		struct clk_mgr *clk_mgr_base, struct clk_log_info *log_info)
+{
+	return;
+}
+
+static struct clk_bw_params dcn316_bw_params = {
+	.vram_type = Ddr4MemType,
+	.num_channels = 1,
+	.clk_table = {
+		.num_entries = 5,
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
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_B,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_C,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+		{
+			.wm_inst = WM_D,
+			.wm_type = WM_TYPE_PSTATE_CHG,
+			.pstate_latency_us = 11.65333,
+			.sr_exit_time_us = 11.5,
+			.sr_enter_plus_exit_time_us = 14.5,
+			.valid = true,
+		},
+	}
+};
+
+static DpmClocks_316_t dummy_clocks;
+
+static struct dcn316_watermarks dummy_wms = { 0 };
+
+static void dcn316_build_watermark_ranges(struct clk_bw_params *bw_params, struct dcn316_watermarks *table)
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
+static void dcn316_notify_wm_ranges(struct clk_mgr *clk_mgr_base)
+{
+	struct clk_mgr_internal *clk_mgr = TO_CLK_MGR_INTERNAL(clk_mgr_base);
+	struct clk_mgr_dcn316 *clk_mgr_dcn316 = TO_CLK_MGR_DCN316(clk_mgr);
+	struct dcn316_watermarks *table = clk_mgr_dcn316->smu_wm_set.wm_set;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || clk_mgr_dcn316->smu_wm_set.mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn316_build_watermark_ranges(clk_mgr_base->bw_params, table);
+
+	dcn316_smu_set_dram_addr_high(clk_mgr,
+			clk_mgr_dcn316->smu_wm_set.mc_address.high_part);
+	dcn316_smu_set_dram_addr_low(clk_mgr,
+			clk_mgr_dcn316->smu_wm_set.mc_address.low_part);
+	dcn316_smu_transfer_wm_table_dram_2_smu(clk_mgr);
+}
+
+static void dcn316_get_dpm_table_from_smu(struct clk_mgr_internal *clk_mgr,
+		struct dcn316_smu_dpm_clks *smu_dpm_clks)
+{
+	DpmClocks_316_t *table = smu_dpm_clks->dpm_clks;
+
+	if (!clk_mgr->smu_ver)
+		return;
+
+	if (!table || smu_dpm_clks->mc_address.quad_part == 0)
+		return;
+
+	memset(table, 0, sizeof(*table));
+
+	dcn316_smu_set_dram_addr_high(clk_mgr,
+			smu_dpm_clks->mc_address.high_part);
+	dcn316_smu_set_dram_addr_low(clk_mgr,
+			smu_dpm_clks->mc_address.low_part);
+	dcn316_smu_transfer_dpm_table_smu_2_dram(clk_mgr);
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
+		const DpmClocks_316_t *clock_table,
+		const uint32_t clocks[],
+		unsigned int voltage)
+{
+	int i;
+	int max_voltage = 0;
+	int clock = 0;
+
+	for (i = 0; i < NUM_SOC_VOLTAGE_LEVELS; i++) {
+		if (clock_table->SocVoltage[i] == voltage) {
+			return clocks[i];
+		} else if (clock_table->SocVoltage[i] >= max_voltage &&
+				clock_table->SocVoltage[i] < voltage) {
+			max_voltage = clock_table->SocVoltage[i];
+			clock = clocks[i];
+		}
+	}
+
+	ASSERT(clock);
+	return clock;
+}
+
+void dcn316_clk_mgr_helper_populate_bw_params(
+		struct clk_mgr_internal *clk_mgr,
+		struct integrated_info *bios_info,
+		const DpmClocks_316_t *clock_table)
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
+		int temp;
+
+		bw_params->clk_table.entries[i].fclk_mhz = clock_table->DfPstateTable[j].FClk;
+		bw_params->clk_table.entries[i].memclk_mhz = clock_table->DfPstateTable[j].MemClk;
+		bw_params->clk_table.entries[i].voltage = clock_table->DfPstateTable[j].Voltage;
+		bw_params->clk_table.entries[i].wck_ratio = 1;
+		temp = find_clk_for_voltage(clock_table, clock_table->DcfClocks, clock_table->DfPstateTable[j].Voltage);
+		if (temp)
+			bw_params->clk_table.entries[i].dcfclk_mhz = temp;
+		temp = find_clk_for_voltage(clock_table, clock_table->SocClocks, clock_table->DfPstateTable[j].Voltage);
+		if (temp)
+			bw_params->clk_table.entries[i].socclk_mhz = temp;
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
+
+
+static struct clk_mgr_funcs dcn316_funcs = {
+	.enable_pme_wa = dcn316_enable_pme_wa,
+	.get_dp_ref_clk_frequency = dce12_get_dp_ref_freq_khz,
+	.update_clocks = dcn316_update_clocks,
+	.init_clocks = dcn31_init_clocks,
+	.are_clock_states_equal = dcn31_are_clock_states_equal,
+	.notify_wm_ranges = dcn316_notify_wm_ranges
+};
+extern struct clk_mgr_funcs dcn3_fpga_funcs;
+
+static int get_vco_frequency_from_reg(struct clk_mgr_internal *clk_mgr)
+{
+	/* get FbMult value */
+	struct fixed31_32 pll_req;
+	unsigned int fbmult_frac_val = 0;
+	unsigned int fbmult_int_val = 0;
+
+	/*
+	 * Register value of fbmult is in 8.16 format, we are converting to 31.32
+	 * to leverage the fix point operations available in driver
+	 */
+
+	REG_GET(CLK1_CLK_PLL_REQ, FbMult_frac, &fbmult_frac_val); /* 16 bit fractional part*/
+	REG_GET(CLK1_CLK_PLL_REQ, FbMult_int, &fbmult_int_val); /* 8 bit integer part */
+
+	pll_req = dc_fixpt_from_int(fbmult_int_val);
+
+	/*
+	 * since fractional part is only 16 bit in register definition but is 32 bit
+	 * in our fix point definiton, need to shift left by 16 to obtain correct value
+	 */
+	pll_req.value |= fbmult_frac_val << 16;
+
+	/* multiply by REFCLK period */
+	pll_req = dc_fixpt_mul_int(pll_req, clk_mgr->dfs_ref_freq_khz);
+
+	/* integer part is now VCO frequency in kHz */
+	return dc_fixpt_floor(pll_req);
+}
+
+void dcn316_clk_mgr_construct(
+		struct dc_context *ctx,
+		struct clk_mgr_dcn316 *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg)
+{
+	struct dcn316_smu_dpm_clks smu_dpm_clks = { 0 };
+
+	clk_mgr->base.base.ctx = ctx;
+	clk_mgr->base.base.funcs = &dcn316_funcs;
+
+	clk_mgr->base.pp_smu = pp_smu;
+
+	clk_mgr->base.dccg = dccg;
+	clk_mgr->base.dfs_bypass_disp_clk = 0;
+
+	clk_mgr->base.dprefclk_ss_percentage = 0;
+	clk_mgr->base.dprefclk_ss_divider = 1000;
+	clk_mgr->base.ss_on_dprefclk = false;
+	clk_mgr->base.dfs_ref_freq_khz = 48000;
+
+	clk_mgr->smu_wm_set.wm_set = (struct dcn316_watermarks *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(struct dcn316_watermarks),
+				&clk_mgr->smu_wm_set.mc_address.quad_part);
+
+	if (!clk_mgr->smu_wm_set.wm_set) {
+		clk_mgr->smu_wm_set.wm_set = &dummy_wms;
+		clk_mgr->smu_wm_set.mc_address.quad_part = 0;
+	}
+	ASSERT(clk_mgr->smu_wm_set.wm_set);
+
+	smu_dpm_clks.dpm_clks = (DpmClocks_316_t *)dm_helpers_allocate_gpu_mem(
+				clk_mgr->base.base.ctx,
+				DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				sizeof(DpmClocks_316_t),
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
+		clk_mgr->base.base.dentist_vco_freq_khz = 2500000;
+	} else {
+		struct clk_log_info log_info = {0};
+
+		clk_mgr->base.smu_ver = dcn316_smu_get_smu_version(&clk_mgr->base);
+
+		if (clk_mgr->base.smu_ver > 0)
+			clk_mgr->base.smu_present = true;
+
+		// Skip this for now as it did not work on DCN315, renable during bring up
+		clk_mgr->base.base.dentist_vco_freq_khz = get_vco_frequency_from_reg(&clk_mgr->base);
+
+		/* in case we don't get a value from the register, use default */
+		if (clk_mgr->base.base.dentist_vco_freq_khz == 0)
+			clk_mgr->base.base.dentist_vco_freq_khz = 2500000; /* 2400MHz */
+
+
+		if (ctx->dc_bios->integrated_info->memory_type == LpDdr5MemType) {
+			dcn316_bw_params.wm_table = lpddr5_wm_table;
+		} else {
+			dcn316_bw_params.wm_table = ddr4_wm_table;
+		}
+		/* Saved clocks configured at boot for debug purposes */
+		 dcn316_dump_clk_registers(&clk_mgr->base.base.boot_snapshot, &clk_mgr->base.base, &log_info);
+
+	}
+
+	clk_mgr->base.base.dprefclk_khz = 600000;
+	clk_mgr->base.dccg->ref_dtbclk_khz = 600000;
+	dce_clock_read_ss_info(&clk_mgr->base);
+
+	clk_mgr->base.base.bw_params = &dcn316_bw_params;
+
+	if (clk_mgr->base.base.ctx->dc->debug.pstate_enabled) {
+		dcn316_get_dpm_table_from_smu(&clk_mgr->base, &smu_dpm_clks);
+
+		if (ctx->dc_bios && ctx->dc_bios->integrated_info) {
+			dcn316_clk_mgr_helper_populate_bw_params(
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
+void dcn316_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr_int)
+{
+	struct clk_mgr_dcn316 *clk_mgr = TO_CLK_MGR_DCN316(clk_mgr_int);
+
+	if (clk_mgr->smu_wm_set.wm_set && clk_mgr->smu_wm_set.mc_address.quad_part != 0)
+		dm_helpers_free_gpu_mem(clk_mgr_int->base.ctx, DC_MEM_ALLOC_TYPE_FRAME_BUFFER,
+				clk_mgr->smu_wm_set.wm_set);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.h
new file mode 100644
index 000000000000..864d1f6cef26
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_clk_mgr.h
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
+#ifndef __DCN316_CLK_MGR_H__
+#define __DCN316_CLK_MGR_H__
+#include "clk_mgr_internal.h"
+
+struct dcn316_watermarks;
+
+struct dcn316_smu_watermark_set {
+	struct dcn316_watermarks *wm_set;
+	union large_integer mc_address;
+};
+
+struct clk_mgr_dcn316 {
+	struct clk_mgr_internal base;
+	struct dcn316_smu_watermark_set smu_wm_set;
+};
+
+void dcn316_clk_mgr_construct(struct dc_context *ctx,
+		struct clk_mgr_dcn316 *clk_mgr,
+		struct pp_smu_funcs *pp_smu,
+		struct dccg *dccg);
+
+void dcn316_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr_int);
+
+#endif //__DCN316_CLK_MGR_H__
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
new file mode 100644
index 000000000000..b7f9e1b34c11
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
@@ -0,0 +1,328 @@
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
+#include "core_types.h"
+#include "clk_mgr_internal.h"
+#include "reg_helper.h"
+#include "dm_helpers.h"
+#include "dcn316_smu.h"
+#include "mp/mp_13_0_8_offset.h"
+#include "mp/mp_13_0_8_sh_mask.h"
+
+#define MAX_INSTANCE                                        7
+#define MAX_SEGMENT                                         6
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
+static const struct IP_BASE MP0_BASE = { { { { 0x00016000, 0x00DC0000, 0x00E00000, 0x00E40000, 0x0243FC00, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } },
+                                        { { 0, 0, 0, 0, 0, 0 } } } };
+
+#define REG(reg_name) \
+	(MP0_BASE.instance[0].segment[reg ## reg_name ## _BASE_IDX] + reg ## reg_name)
+
+#define FN(reg_name, field) \
+	FD(reg_name##__##field)
+
+#define VBIOSSMC_MSG_TestMessage                  0x01 ///< To check if PMFW is alive and responding. Requirement specified by PMFW team
+#define VBIOSSMC_MSG_GetPmfwVersion               0x02 ///< Get PMFW version
+#define VBIOSSMC_MSG_Spare0                       0x03 ///< Spare0
+#define VBIOSSMC_MSG_SetDispclkFreq               0x04 ///< Set display clock frequency in MHZ
+#define VBIOSSMC_MSG_Spare1                       0x05 ///< Spare1
+#define VBIOSSMC_MSG_SetDppclkFreq                0x06 ///< Set DPP clock frequency in MHZ
+#define VBIOSSMC_MSG_SetHardMinDcfclkByFreq       0x07 ///< Set DCF clock frequency hard min in MHZ
+#define VBIOSSMC_MSG_SetMinDeepSleepDcfclk        0x08 ///< Set DCF clock minimum frequency in deep sleep in MHZ
+#define VBIOSSMC_MSG_SetPhyclkVoltageByFreq       0x09 ///< Set display phy clock frequency in MHZ in case VMIN does not support phy frequency
+#define VBIOSSMC_MSG_GetFclkFrequency             0x0A ///< Get FCLK frequency, return frequemcy in MHZ
+#define VBIOSSMC_MSG_SetDisplayCount              0x0B ///< Inform PMFW of number of display connected
+#define VBIOSSMC_MSG_SPARE						  0x0C ///< SPARE
+#define VBIOSSMC_MSG_UpdatePmeRestore             0x0D ///< To ask PMFW to write into Azalia for PME wake up event
+#define VBIOSSMC_MSG_SetVbiosDramAddrHigh         0x0E ///< Set DRAM address high 32 bits for WM table transfer
+#define VBIOSSMC_MSG_SetVbiosDramAddrLow          0x0F ///< Set DRAM address low 32 bits for WM table transfer
+#define VBIOSSMC_MSG_TransferTableSmu2Dram        0x10 ///< Transfer table from PMFW SRAM to system DRAM
+#define VBIOSSMC_MSG_TransferTableDram2Smu        0x11 ///< Transfer table from system DRAM to PMFW
+#define VBIOSSMC_MSG_SetDisplayIdleOptimizations  0x12 ///< Set Idle state optimization for display off
+#define VBIOSSMC_MSG_GetDprefclkFreq              0x13 ///< Get DPREF clock frequency. Return in MHZ
+#define VBIOSSMC_MSG_GetDtbclkFreq                0x14 ///< Get DPREF clock frequency. Return in MHZ
+#define VBIOSSMC_MSG_SetDtbclkFreq                0x15 ///< Inform PMFW to turn on/off DTB clock arg = 1, turn DTB clock on 600MHz/ arg = 0 turn DTB clock off
+#define VBIOSSMC_Message_Count                    0x16 ///< Total number of VBIS and DAL messages
+
+#define VBIOSSMC_Status_BUSY                      0x0
+#define VBIOSSMC_Result_OK                        0x01 ///< Message Response OK
+#define VBIOSSMC_Result_Failed                    0xFF ///< Message Response Failed
+#define VBIOSSMC_Result_UnknownCmd                0xFE ///< Message Response Unknown Command
+#define VBIOSSMC_Result_CmdRejectedPrereq         0xFD ///< Message Response Command Failed Prerequisite
+#define VBIOSSMC_Result_CmdRejectedBusy           0xFC ///< Message Response Command Rejected due to PMFW is busy. Sender should retry sending this message
+
+/*
+ * Function to be used instead of REG_WAIT macro because the wait ends when
+ * the register is NOT EQUAL to zero, and because the translation in msg_if.h
+ * won't work with REG_WAIT.
+ */
+static uint32_t dcn316_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
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
+int dcn316_smu_send_msg_with_param(
+		struct clk_mgr_internal *clk_mgr,
+		unsigned int msg_id, unsigned int param)
+{
+	uint32_t result;
+
+	result = dcn316_smu_wait_for_response(clk_mgr, 10, 200000);
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
+	result = dcn316_smu_wait_for_response(clk_mgr, 10, 200000);
+
+	if (result == VBIOSSMC_Status_BUSY) {
+		ASSERT(0);
+		dm_helpers_smu_timeout(CTX, msg_id, param, 10 * 200000);
+	}
+
+	return REG_READ(MP1_SMN_C2PMSG_83);
+}
+
+int dcn316_smu_get_smu_version(struct clk_mgr_internal *clk_mgr)
+{
+	return dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_GetPmfwVersion,
+			0);
+}
+
+
+int dcn316_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz)
+{
+	int actual_dispclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dispclk_khz;
+
+	/*  Unit of SMU msg parameter is Mhz */
+	actual_dispclk_set_mhz = dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDispclkFreq,
+			khz_to_mhz_ceil(requested_dispclk_khz));
+
+	return actual_dispclk_set_mhz * 1000;
+}
+
+int dcn316_smu_set_voltage_via_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz)
+{
+	int actual_phypclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present && requested_phyclk_khz)
+		return requested_phyclk_khz;
+
+	/*  Unit of SMU msg parameter is Mhz */
+	actual_phypclk_set_mhz = dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetPhyclkVoltageByFreq,
+			khz_to_mhz_ceil(requested_phyclk_khz));
+
+	return actual_phypclk_set_mhz * 1000;
+}
+
+int dcn316_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz)
+{
+	int actual_dcfclk_set_mhz = -1;
+
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dcfclk_khz;
+
+	actual_dcfclk_set_mhz = dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetHardMinDcfclkByFreq,
+			khz_to_mhz_ceil(requested_dcfclk_khz));
+
+	return actual_dcfclk_set_mhz * 1000;
+}
+
+int dcn316_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz)
+{
+	int actual_min_ds_dcfclk_mhz = -1;
+
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_min_ds_dcfclk_khz;
+
+	actual_min_ds_dcfclk_mhz = dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetMinDeepSleepDcfclk,
+			khz_to_mhz_ceil(requested_min_ds_dcfclk_khz));
+
+	return actual_min_ds_dcfclk_mhz * 1000;
+}
+
+int dcn316_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz)
+{
+	int actual_dppclk_set_mhz = -1;
+
+	if (!clk_mgr->smu_present)
+		return requested_dpp_khz;
+
+	actual_dppclk_set_mhz = dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDppclkFreq,
+			khz_to_mhz_ceil(requested_dpp_khz));
+
+	return actual_dppclk_set_mhz * 1000;
+}
+
+void dcn316_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info)
+{
+	if (!clk_mgr->base.ctx->dc->debug.pstate_enabled)
+		return;
+
+	if (!clk_mgr->smu_present)
+		return;
+
+	//TODO: Work with smu team to define optimization options.
+	dcn316_smu_send_msg_with_param(
+		clk_mgr,
+		VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+		idle_info);
+}
+
+void dcn316_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable)
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
+	dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDisplayIdleOptimizations,
+			idle_info.data);
+}
+
+void dcn316_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn316_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrHigh, addr_high);
+}
+
+void dcn316_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn316_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_SetVbiosDramAddrLow, addr_low);
+}
+
+void dcn316_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn316_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableSmu2Dram, TABLE_DPMCLOCKS);
+}
+
+void dcn316_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn316_smu_send_msg_with_param(clk_mgr,
+			VBIOSSMC_MSG_TransferTableDram2Smu, TABLE_WATERMARKS);
+}
+
+void dcn316_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_UpdatePmeRestore,
+			0);
+}
+
+/* Arg = 1: Turn DTB on; 0: Turn DTB CLK OFF. when it is on, it is 600MHZ */
+void dcn316_smu_set_dtbclk(struct clk_mgr_internal *clk_mgr, bool enable)
+{
+	if (!clk_mgr->smu_present)
+		return;
+
+	dcn316_smu_send_msg_with_param(
+			clk_mgr,
+			VBIOSSMC_MSG_SetDtbclkFreq,
+			enable);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h
new file mode 100644
index 000000000000..4c6b202fe622
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.h
@@ -0,0 +1,128 @@
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
+#ifndef DAL_DC_316_SMU_H_
+#define DAL_DC_316_SMU_H_
+#include "os_types.h"
+
+#define PMFW_DRIVER_IF_VERSION 4
+
+#define NUM_DCFCLK_DPM_LEVELS   8
+#define NUM_DISPCLK_DPM_LEVELS  8
+#define NUM_DPPCLK_DPM_LEVELS   8
+#define NUM_SOCCLK_DPM_LEVELS   8
+#define NUM_VCN_DPM_LEVELS      8
+#define NUM_SOC_VOLTAGE_LEVELS  8
+#define NUM_DF_PSTATE_LEVELS    4
+
+typedef struct {
+  uint16_t MinClock; // This is either DCFCLK or SOCCLK (in MHz)
+  uint16_t MaxClock; // This is either DCFCLK or SOCCLK (in MHz)
+  uint16_t MinMclk;
+  uint16_t MaxMclk;
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
+  uint32_t FClk;
+  uint32_t MemClk;
+  uint32_t Voltage;
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
+  uint8_t  NumDcfClkLevelsEnabled;
+  uint8_t  NumDispClkLevelsEnabled; //Applies to both Dispclk and Dppclk
+  uint8_t  NumSocClkLevelsEnabled;
+  uint8_t  VcnClkLevelsEnabled;     //Applies to both Vclk and Dclk
+  uint8_t  NumDfPstatesEnabled;
+  uint8_t  spare[3];
+  uint32_t MinGfxClk;
+  uint32_t MaxGfxClk;
+} DpmClocks_316_t;
+
+struct dcn316_watermarks {
+  // Watermarks
+  WatermarkRowGeneric_t WatermarkRow[WM_COUNT][NUM_WM_RANGES];
+  uint32_t MmHubPadding[7]; // SMU internal use
+};
+
+struct dcn316_smu_dpm_clks {
+	DpmClocks_316_t *dpm_clks;
+	union large_integer mc_address;
+};
+
+#define TABLE_WATERMARKS         1 // Called by DAL through VBIOS
+#define TABLE_DPMCLOCKS          4 // Called by Driver and VBIOS
+
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
+int dcn316_smu_get_smu_version(struct clk_mgr_internal *clk_mgr);
+int dcn316_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
+int dcn316_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_dcfclk_khz);
+int dcn316_smu_set_min_deep_sleep_dcfclk(struct clk_mgr_internal *clk_mgr, int requested_min_ds_dcfclk_khz);
+int dcn316_smu_set_dppclk(struct clk_mgr_internal *clk_mgr, int requested_dpp_khz);
+void dcn316_smu_set_display_idle_optimization(struct clk_mgr_internal *clk_mgr, uint32_t idle_info);
+void dcn316_smu_enable_phy_refclk_pwrdwn(struct clk_mgr_internal *clk_mgr, bool enable);
+void dcn316_smu_set_dram_addr_high(struct clk_mgr_internal *clk_mgr, uint32_t addr_high);
+void dcn316_smu_set_dram_addr_low(struct clk_mgr_internal *clk_mgr, uint32_t addr_low);
+void dcn316_smu_transfer_dpm_table_smu_2_dram(struct clk_mgr_internal *clk_mgr);
+void dcn316_smu_transfer_wm_table_dram_2_smu(struct clk_mgr_internal *clk_mgr);
+void dcn316_smu_request_voltage_via_phyclk(struct clk_mgr_internal *clk_mgr, int requested_phyclk_khz);
+void dcn316_smu_enable_pme_wa(struct clk_mgr_internal *clk_mgr);
+void dcn316_smu_set_dtbclk(struct clk_mgr_internal *clk_mgr, bool enable);
+
+#endif /* DAL_DC_316_SMU_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index ed6b0eec1b68..fefae35d016f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -66,6 +66,7 @@
 #include "dcn302/dcn302_resource.h"
 #include "dcn303/dcn303_resource.h"
 #include "dcn31/dcn31_resource.h"
+#include "dcn316/dcn316_resource.h"
 #endif
 
 #define DC_LOGGER_INIT(logger)
@@ -250,6 +251,9 @@ struct resource_pool *dc_create_resource_pool(struct dc  *dc,
 	case DCN_VERSION_3_1:
 		res_pool = dcn31_create_resource_pool(init_data, dc);
 		break;
+	case DCN_VERSION_3_16:
+		res_pool = dcn316_create_resource_pool(init_data, dc);
+		break;
 #endif
 	default:
 		break;
diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/Makefile b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
new file mode 100644
index 000000000000..cd87b687c5e2
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn316/Makefile
@@ -0,0 +1,56 @@
+#
+# Copyright 2021 Advanced Micro Devices, Inc.
+#
+# Permission is hereby granted, free of charge, to any person obtaining a
+# copy of this software and associated documentation files (the "Software"),
+# to deal in the Software without restriction, including without limitation
+# the rights to use, copy, modify, merge, publish, distribute, sublicense,
+# and/or sell copies of the Software, and to permit persons to whom the
+# Software is furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+# THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+# OTHER DEALINGS IN THE SOFTWARE.
+#
+# Authors: AMD
+#
+# Makefile for dcn316.
+
+DCN316 = dcn316_resource.o
+
+ifdef CONFIG_X86
+CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -msse
+endif
+
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o += -mhard-float
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o += -mpreferred-stack-boundary=4
+else
+CFLAGS_$(AMDDALPATH)/dc/dcn316/dcn316_resource.o += -msse2
+endif
+endif
+
+AMD_DAL_DCN316 = $(addprefix $(AMDDALPATH)/dc/dcn316/,$(DCN316))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCN316)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
new file mode 100644
index 000000000000..72d581c6092f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.c
@@ -0,0 +1,2306 @@
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
+
+#include "dm_services.h"
+#include "dc.h"
+
+#include "dcn31/dcn31_init.h"
+
+#include "resource.h"
+#include "include/irq_service_interface.h"
+#include "dcn316_resource.h"
+
+#include "dcn20/dcn20_resource.h"
+#include "dcn30/dcn30_resource.h"
+#include "dcn31/dcn31_resource.h"
+
+#include "dcn10/dcn10_ipp.h"
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn31/dcn31_hubbub.h"
+#include "dcn30/dcn30_mpc.h"
+#include "dcn31/dcn31_hubp.h"
+#include "irq/dcn31/irq_service_dcn31.h"
+#include "dcn30/dcn30_dpp.h"
+#include "dcn31/dcn31_optc.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn30/dcn30_opp.h"
+#include "dcn20/dcn20_dsc.h"
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+#include "dcn30/dcn30_dio_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_stream_encoder.h"
+#include "dcn31/dcn31_hpo_dp_link_encoder.h"
+#include "dcn31/dcn31_apg.h"
+#include "dcn31/dcn31_dio_link_encoder.h"
+#include "dcn31/dcn31_vpg.h"
+#include "dcn31/dcn31_afmt.h"
+#include "dce/dce_clock_source.h"
+#include "dce/dce_audio.h"
+#include "dce/dce_hwseq.h"
+#include "clk_mgr.h"
+#include "virtual/virtual_stream_encoder.h"
+#include "dce110/dce110_resource.h"
+#include "dml/display_mode_vba.h"
+#include "dcn31/dcn31_dccg.h"
+#include "dcn10/dcn10_resource.h"
+#include "dcn31/dcn31_panel_cntl.h"
+
+#include "dcn30/dcn30_dwb.h"
+#include "dcn30/dcn30_mmhubbub.h"
+
+#include "dcn/dcn_3_1_6_offset.h"
+#include "dcn/dcn_3_1_6_sh_mask.h"
+#include "dpcs/dpcs_4_2_3_offset.h"
+#include "dpcs/dpcs_4_2_3_sh_mask.h"
+
+#define regBIF_BX1_BIOS_SCRATCH_2                                                                       0x003a
+#define regBIF_BX1_BIOS_SCRATCH_2_BASE_IDX                                                              1
+#define regBIF_BX1_BIOS_SCRATCH_3                                                                       0x003b
+#define regBIF_BX1_BIOS_SCRATCH_3_BASE_IDX                                                              1
+#define regBIF_BX1_BIOS_SCRATCH_6                                                                       0x003e
+#define regBIF_BX1_BIOS_SCRATCH_6_BASE_IDX                                                              1
+
+#define regDCHUBBUB_DEBUG_CTRL_0                                              0x04d6
+#define regDCHUBBUB_DEBUG_CTRL_0_BASE_IDX                                     2
+#define DCHUBBUB_DEBUG_CTRL_0__DET_DEPTH__SHIFT                               0x10
+#define DCHUBBUB_DEBUG_CTRL_0__DET_DEPTH_MASK                                 0x01FF0000L
+
+#define DCN_BASE__INST0_SEG0                       0x00000012
+#define DCN_BASE__INST0_SEG1                       0x000000C0
+#define DCN_BASE__INST0_SEG2                       0x000034C0
+#define DCN_BASE__INST0_SEG3                       0x00009000
+#define DCN_BASE__INST0_SEG4                       0x02403C00
+#define DCN_BASE__INST0_SEG5                       0
+
+#define DPCS_BASE__INST0_SEG0                      0x00000012
+#define DPCS_BASE__INST0_SEG1                      0x000000C0
+#define DPCS_BASE__INST0_SEG2                      0x000034C0
+#define DPCS_BASE__INST0_SEG3                      0x00009000
+#define DPCS_BASE__INST0_SEG4                      0x02403C00
+#define DPCS_BASE__INST0_SEG5                      0
+
+#define NBIO_BASE__INST0_SEG0                      0x00000000
+#define NBIO_BASE__INST0_SEG1                      0x00000014
+#define NBIO_BASE__INST0_SEG2                      0x00000D20
+#define NBIO_BASE__INST0_SEG3                      0x00010400
+#define NBIO_BASE__INST0_SEG4                      0x0241B000
+#define NBIO_BASE__INST0_SEG5                      0x04040000
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
+#include "link_enc_cfg.h"
+
+#define DC_LOGGER_INIT(logger)
+
+#define DCN3_16_DEFAULT_DET_SIZE 192
+#define DCN3_16_MAX_DET_SIZE 384
+#define DCN3_16_MIN_COMPBUF_SIZE_KB 128
+#define DCN3_16_CRB_SEGMENT_SIZE_KB 64
+
+struct _vcs_dpi_ip_params_st dcn3_16_ip = {
+	.gpuvm_enable = 1,
+	.gpuvm_max_page_table_levels = 1,
+	.hostvm_enable = 1,
+	.hostvm_max_page_table_levels = 2,
+	.rob_buffer_size_kbytes = 64,
+	.det_buffer_size_kbytes = DCN3_16_DEFAULT_DET_SIZE,
+	.config_return_buffer_size_in_kbytes = 1024,
+	.compressed_buffer_segment_size_in_kbytes = 64,
+	.meta_fifo_size_in_kentries = 32,
+	.zero_size_buffer_entries = 512,
+	.compbuf_reserved_space_64b = 256,
+	.compbuf_reserved_space_zs = 64,
+	.dpp_output_buffer_pixels = 2560,
+	.opp_output_buffer_lines = 1,
+	.pixel_chunk_size_kbytes = 8,
+	.meta_chunk_size_kbytes = 2,
+	.min_meta_chunk_size_bytes = 256,
+	.writeback_chunk_size_kbytes = 8,
+	.ptoi_supported = false,
+	.num_dsc = 3,
+	.maximum_dsc_bits_per_component = 10,
+	.dsc422_native_support = false,
+	.is_line_buffer_bpp_fixed = true,
+	.line_buffer_fixed_bpp = 48,
+	.line_buffer_size_bits = 789504,
+	.max_line_buffer_lines = 12,
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
+	.dppclk_delay_subtotal = 46,
+	.dppclk_delay_scl = 50,
+	.dppclk_delay_scl_lb_only = 16,
+	.dppclk_delay_cnvc_formatter = 27,
+	.dppclk_delay_cnvc_cursor = 6,
+	.dispclk_delay_subtotal = 119,
+	.dynamic_metadata_vm_enabled = false,
+	.odm_combine_4to1_supported = false,
+	.dcc_supported = true,
+};
+
+struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc = {
+		/*TODO: correct dispclk/dppclk voltage level determination*/
+	.clock_limits = {
+		{
+			.state = 0,
+			.dispclk_mhz = 556.0,
+			.dppclk_mhz = 556.0,
+			.phyclk_mhz = 600.0,
+			.phyclk_d18_mhz = 445.0,
+			.dscclk_mhz = 186.0,
+			.dtbclk_mhz = 625.0,
+		},
+		{
+			.state = 1,
+			.dispclk_mhz = 625.0,
+			.dppclk_mhz = 625.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 209.0,
+			.dtbclk_mhz = 625.0,
+		},
+		{
+			.state = 2,
+			.dispclk_mhz = 625.0,
+			.dppclk_mhz = 625.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 209.0,
+			.dtbclk_mhz = 625.0,
+		},
+		{
+			.state = 3,
+			.dispclk_mhz = 1112.0,
+			.dppclk_mhz = 1112.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 371.0,
+			.dtbclk_mhz = 625.0,
+		},
+		{
+			.state = 4,
+			.dispclk_mhz = 1250.0,
+			.dppclk_mhz = 1250.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 417.0,
+			.dtbclk_mhz = 625.0,
+		},
+	},
+	.num_states = 5,
+	.sr_exit_time_us = 9.0,
+	.sr_enter_plus_exit_time_us = 11.0,
+	.sr_exit_z8_time_us = 442.0,
+	.sr_enter_plus_exit_z8_time_us = 560.0,
+	.writeback_latency_us = 12.0,
+	.dram_channel_width_bytes = 4,
+	.round_trip_ping_latency_dcfclk_cycles = 106,
+	.urgent_latency_pixel_data_only_us = 4.0,
+	.urgent_latency_pixel_mixed_with_vm_data_us = 4.0,
+	.urgent_latency_vm_data_only_us = 4.0,
+	.urgent_out_of_order_return_per_channel_pixel_only_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes = 4096,
+	.urgent_out_of_order_return_per_channel_vm_only_bytes = 4096,
+	.pct_ideal_sdp_bw_after_urgent = 80.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_only = 65.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_pixel_and_vm = 60.0,
+	.pct_ideal_dram_sdp_bw_after_urgent_vm_only = 30.0,
+	.max_avg_sdp_bw_use_normal_percent = 60.0,
+	.max_avg_dram_bw_use_normal_percent = 60.0,
+	.fabric_datapath_to_dcn_data_return_bytes = 32,
+	.return_bus_width_bytes = 64,
+	.downspread_percent = 0.38,
+	.dcn_downspread_percent = 0.5,
+	.gpuvm_min_page_size_bytes = 4096,
+	.hostvm_min_page_size_bytes = 4096,
+	.do_urgent_latency_adjustment = false,
+	.urgent_latency_adjustment_fabric_clock_component_us = 0,
+	.urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
+};
+
+enum dcn31_clk_src_array_id {
+	DCN31_CLK_SRC_PLL0,
+	DCN31_CLK_SRC_PLL1,
+	DCN31_CLK_SRC_PLL2,
+	DCN31_CLK_SRC_PLL3,
+	DCN31_CLK_SRC_PLL4,
+	DCN30_CLK_SRC_TOTAL
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
+		.reg_name = NBIO_BASE(regBIF_BX1_ ## reg_name ## _BASE_IDX) + \
+					regBIF_BX1_ ## reg_name
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
+	clk_src_regs(3, D),
+	clk_src_regs(4, E)
+};
+
+static const struct dce110_clk_src_shift cs_shift = {
+		CS_COMMON_MASK_SH_LIST_DCN2_0(__SHIFT)
+};
+
+static const struct dce110_clk_src_mask cs_mask = {
+		CS_COMMON_MASK_SH_LIST_DCN2_0(_MASK)
+};
+
+#define abm_regs(id)\
+[id] = {\
+		ABM_DCN302_REG_LIST(id)\
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
+		ABM_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dce_abm_mask abm_mask = {
+		ABM_MASK_SH_LIST_DCN30(_MASK)
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
+	audio_regs(4),
+	audio_regs(5),
+	audio_regs(6)
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
+	VPG_DCN31_REG_LIST(id)\
+}
+
+static const struct dcn31_vpg_registers vpg_regs[] = {
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
+static const struct dcn31_vpg_shift vpg_shift = {
+	DCN31_VPG_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_vpg_mask vpg_mask = {
+	DCN31_VPG_MASK_SH_LIST(_MASK)
+};
+
+#define afmt_regs(id)\
+[id] = {\
+	AFMT_DCN31_REG_LIST(id)\
+}
+
+static const struct dcn31_afmt_registers afmt_regs[] = {
+	afmt_regs(0),
+	afmt_regs(1),
+	afmt_regs(2),
+	afmt_regs(3),
+	afmt_regs(4),
+	afmt_regs(5)
+};
+
+static const struct dcn31_afmt_shift afmt_shift = {
+	DCN31_AFMT_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_afmt_mask afmt_mask = {
+	DCN31_AFMT_MASK_SH_LIST(_MASK)
+};
+
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
+
+#define stream_enc_regs(id)\
+[id] = {\
+	SE_DCN3_REG_LIST(id)\
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
+		SE_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn10_stream_encoder_mask se_mask = {
+		SE_COMMON_MASK_SH_LIST_DCN30(_MASK)
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
+	DPCS_DCN31_REG_LIST(id), \
+}
+
+static const struct dce110_aux_registers_shift aux_shift = {
+	DCN_AUX_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce110_aux_registers_mask aux_mask = {
+	DCN_AUX_MASK_SH_LIST(_MASK)
+};
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
+	DPCS_DCN31_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+	LINK_ENCODER_MASK_SH_LIST_DCN31(_MASK), \
+	DPCS_DCN31_MASK_SH_LIST(_MASK)
+};
+
+
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
+	DCN3_1_RDPCSTX_REG_LIST(0),\
+	DCN3_1_RDPCSTX_REG_LIST(1),\
+	DCN3_1_RDPCSTX_REG_LIST(2),\
+	DCN3_1_RDPCSTX_REG_LIST(3),\
+	DCN3_1_RDPCSTX_REG_LIST(4)\
+}
+
+static const struct dcn31_hpo_dp_link_encoder_registers hpo_dp_link_enc_regs[] = {
+	hpo_dp_link_encoder_reg_list(0),
+	hpo_dp_link_encoder_reg_list(1),
+};
+
+static const struct dcn31_hpo_dp_link_encoder_shift hpo_dp_le_shift = {
+	DCN3_1_HPO_DP_LINK_ENC_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn31_hpo_dp_link_encoder_mask hpo_dp_le_mask = {
+	DCN3_1_HPO_DP_LINK_ENC_MASK_SH_LIST(_MASK)
+};
+
+
+#define dpp_regs(id)\
+[id] = {\
+	DPP_REG_LIST_DCN30(id),\
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
+		DPP_REG_LIST_SH_MASK_DCN30(__SHIFT)
+};
+
+static const struct dcn3_dpp_mask tf_mask = {
+		DPP_REG_LIST_SH_MASK_DCN30(_MASK)
+};
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
+	MCIF_WB_COMMON_REG_LIST_DCN30(id),\
+}
+
+static const struct dcn30_mmhubbub_registers mcif_wb30_regs[] = {
+	mcif_wb_regs_dcn3(0)
+};
+
+static const struct dcn30_mmhubbub_shift mcif_wb30_shift = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_mmhubbub_mask mcif_wb30_mask = {
+	MCIF_WB_COMMON_MASK_SH_LIST_DCN30(_MASK)
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
+	dsc_regsDCN20(2)
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
+		MPC_RMU_GLOBAL_REG_LIST_DCN3AG,
+		MPC_RMU_REG_LIST_DCN3AG(0),
+		MPC_RMU_REG_LIST_DCN3AG(1),
+		//MPC_RMU_REG_LIST_DCN3AG(2),
+		MPC_DWB_MUX_REG_LIST_DCN3_0(0),
+};
+
+static const struct dcn30_mpc_shift mpc_shift = {
+	MPC_COMMON_MASK_SH_LIST_DCN30(__SHIFT)
+};
+
+static const struct dcn30_mpc_mask mpc_mask = {
+	MPC_COMMON_MASK_SH_LIST_DCN30(_MASK)
+};
+
+#define optc_regs(id)\
+[id] = {OPTC_COMMON_REG_LIST_DCN3_1(id)}
+
+static const struct dcn_optc_registers optc_regs[] = {
+	optc_regs(0),
+	optc_regs(1),
+	optc_regs(2),
+	optc_regs(3)
+};
+
+static const struct dcn_optc_shift optc_shift = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_1(__SHIFT)
+};
+
+static const struct dcn_optc_mask optc_mask = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_1(_MASK)
+};
+
+#define hubp_regs(id)\
+[id] = {\
+	HUBP_REG_LIST_DCN30(id)\
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
+		HUBP_MASK_SH_LIST_DCN31(__SHIFT)
+};
+
+static const struct dcn_hubp2_mask hubp_mask = {
+		HUBP_MASK_SH_LIST_DCN31(_MASK)
+};
+static const struct dcn_hubbub_registers hubbub_reg = {
+		HUBBUB_REG_LIST_DCN31(0)
+};
+
+static const struct dcn_hubbub_shift hubbub_shift = {
+		HUBBUB_MASK_SH_LIST_DCN31(__SHIFT)
+};
+
+static const struct dcn_hubbub_mask hubbub_mask = {
+		HUBBUB_MASK_SH_LIST_DCN31(_MASK)
+};
+
+static const struct dccg_registers dccg_regs = {
+		DCCG_REG_LIST_DCN31()
+};
+
+static const struct dccg_shift dccg_shift = {
+		DCCG_MASK_SH_LIST_DCN31(__SHIFT)
+};
+
+static const struct dccg_mask dccg_mask = {
+		DCCG_MASK_SH_LIST_DCN31(_MASK)
+};
+
+
+#define SRII2(reg_name_pre, reg_name_post, id)\
+	.reg_name_pre ## _ ##  reg_name_post[id] = BASE(reg ## reg_name_pre \
+			## id ## _ ## reg_name_post ## _BASE_IDX) + \
+			reg ## reg_name_pre ## id ## _ ## reg_name_post
+
+
+#define HWSEQ_DCN31_REG_LIST()\
+	SR(DCHUBBUB_GLOBAL_TIMER_CNTL), \
+	SR(DCHUBBUB_ARB_HOSTVM_CNTL), \
+	SR(DIO_MEM_PWR_CTRL), \
+	SR(ODM_MEM_PWR_CTRL3), \
+	SR(DMU_MEM_PWR_CNTL), \
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
+	SR(DOMAIN0_PG_STATUS), \
+	SR(DOMAIN1_PG_STATUS), \
+	SR(DOMAIN2_PG_STATUS), \
+	SR(DOMAIN3_PG_STATUS), \
+	SR(DOMAIN16_PG_STATUS), \
+	SR(DOMAIN17_PG_STATUS), \
+	SR(DOMAIN18_PG_STATUS), \
+	SR(D1VGA_CONTROL), \
+	SR(D2VGA_CONTROL), \
+	SR(D3VGA_CONTROL), \
+	SR(D4VGA_CONTROL), \
+	SR(D5VGA_CONTROL), \
+	SR(D6VGA_CONTROL), \
+	SR(DC_IP_REQUEST_CNTL), \
+	SR(AZALIA_AUDIO_DTO), \
+	SR(AZALIA_CONTROLLER_CLOCK_GATING), \
+	SR(HPO_TOP_HW_CONTROL)
+
+static const struct dce_hwseq_registers hwseq_reg = {
+		HWSEQ_DCN31_REG_LIST()
+};
+
+#define HWSEQ_DCN31_MASK_SH_LIST(mask_sh)\
+	HWSEQ_DCN_MASK_SH_LIST(mask_sh), \
+	HWS_SF(, DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
+	HWS_SF(, DCHUBBUB_ARB_HOSTVM_CNTL, DISABLE_HOSTVM_FORCE_ALLOW_PSTATE, mask_sh), \
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
+	HWS_SF(, DOMAIN0_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN1_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN2_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN3_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN16_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN17_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DOMAIN18_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, mask_sh), \
+	HWS_SF(, DC_IP_REQUEST_CNTL, IP_REQUEST_EN, mask_sh), \
+	HWS_SF(, AZALIA_AUDIO_DTO, AZALIA_AUDIO_DTO_MODULE, mask_sh), \
+	HWS_SF(, HPO_TOP_CLOCK_CONTROL, HPO_HDMISTREAMCLK_G_GATE_DIS, mask_sh), \
+	HWS_SF(, DMU_MEM_PWR_CNTL, DMCU_ERAM_MEM_PWR_FORCE, mask_sh), \
+	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_UNASSIGNED_PWR_MODE, mask_sh), \
+	HWS_SF(, ODM_MEM_PWR_CTRL3, ODM_MEM_VBLANK_PWR_MODE, mask_sh), \
+	HWS_SF(, MMHUBBUB_MEM_PWR_CNTL, VGA_MEM_PWR_FORCE, mask_sh), \
+	HWS_SF(, DIO_MEM_PWR_CTRL, I2C_LIGHT_SLEEP_FORCE, mask_sh), \
+	HWS_SF(, HPO_TOP_HW_CONTROL, HPO_IO_EN, mask_sh)
+
+static const struct dce_hwseq_shift hwseq_shift = {
+		HWSEQ_DCN31_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dce_hwseq_mask hwseq_mask = {
+		HWSEQ_DCN31_MASK_SH_LIST(_MASK)
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
+static const struct resource_caps res_cap_dcn31 = {
+	.num_timing_generator = 4,
+	.num_opp = 4,
+	.num_video_plane = 4,
+	.num_audio = 5,
+	.num_stream_encoder = 5,
+	.num_dig_link_enc = 5,
+	.num_hpo_dp_stream_encoder = 4,
+	.num_hpo_dp_link_encoder = 2,
+	.num_pll = 5,
+	.num_dwb = 1,
+	.num_ddc = 5,
+	.num_vmid = 16,
+	.num_mpc_3dlut = 2,
+	.num_dsc = 3,
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
+	.disable_z10 = true, /*hw not support it*/
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
+	.max_downscale_src_width = 4096,/*upto true 4k*/
+	.disable_pplib_wm_range = false,
+	.scl_reset_length10 = true,
+	.sanity_checks = false,
+	.underflow_assert_delay_us = 0xFFFFFFFF,
+	.dwb_fi_phase = -1, // -1 = disable,
+	.dmub_command_table = true,
+	.pstate_enabled = true,
+	.use_max_lb = true,
+	.enable_mem_low_power = {
+		.bits = {
+			.vga = true,
+			.i2c = true,
+			.dmcu = false, // This is previously known to cause hang on S3 cycles if enabled
+			.dscl = true,
+			.cm = true,
+			.mpc = true,
+			.optc = true,
+			.vpg = true,
+			.afmt = true,
+		}
+	},
+	.optimize_edp_link_rate = true,
+	.enable_sw_cntl_psr = true,
+};
+
+static const struct dc_debug_options debug_defaults_diags = {
+	.disable_dmcu = true,
+	.force_abm_enable = false,
+	.timing_trace = true,
+	.clock_trace = true,
+	.disable_dpp_power_gate = true,
+	.disable_hubp_power_gate = true,
+	.disable_clock_gate = true,
+	.disable_pplib_clock_request = true,
+	.disable_pplib_wm_range = true,
+	.disable_stutter = false,
+	.scl_reset_length10 = true,
+	.dwb_fi_phase = -1, // -1 = disable
+	.dmub_command_table = true,
+	.enable_tri_buf = true,
+	.use_max_lb = true
+};
+
+static void dcn31_dpp_destroy(struct dpp **dpp)
+{
+	kfree(TO_DCN20_DPP(*dpp));
+	*dpp = NULL;
+}
+
+static struct dpp *dcn31_dpp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn3_dpp *dpp =
+		kzalloc(sizeof(struct dcn3_dpp), GFP_KERNEL);
+
+	if (!dpp)
+		return NULL;
+
+	if (dpp3_construct(dpp, ctx, inst,
+			&dpp_regs[inst], &tf_shift, &tf_mask))
+		return &dpp->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(dpp);
+	return NULL;
+}
+
+static struct output_pixel_processor *dcn31_opp_create(
+	struct dc_context *ctx, uint32_t inst)
+{
+	struct dcn20_opp *opp =
+		kzalloc(sizeof(struct dcn20_opp), GFP_KERNEL);
+
+	if (!opp) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	dcn20_opp_construct(opp, ctx, inst,
+			&opp_regs[inst], &opp_shift, &opp_mask);
+	return &opp->base;
+}
+
+static struct dce_aux *dcn31_aux_engine_create(
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
+static struct dce_i2c_hw *dcn31_i2c_hw_create(
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
+static struct mpc *dcn31_mpc_create(
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
+	dcn30_mpc_construct(mpc30, ctx,
+			&mpc_regs,
+			&mpc_shift,
+			&mpc_mask,
+			num_mpcc,
+			num_rmu);
+
+	return &mpc30->base;
+}
+
+static struct hubbub *dcn31_hubbub_create(struct dc_context *ctx)
+{
+	int i;
+
+	struct dcn20_hubbub *hubbub3 = kzalloc(sizeof(struct dcn20_hubbub),
+					  GFP_KERNEL);
+
+	if (!hubbub3)
+		return NULL;
+
+	hubbub31_construct(hubbub3, ctx,
+			&hubbub_reg,
+			&hubbub_shift,
+			&hubbub_mask,
+			dcn3_16_ip.det_buffer_size_kbytes,
+			dcn3_16_ip.pixel_chunk_size_kbytes,
+			dcn3_16_ip.config_return_buffer_size_in_kbytes);
+
+
+	for (i = 0; i < res_cap_dcn31.num_vmid; i++) {
+		struct dcn20_vmid *vmid = &hubbub3->vmid[i];
+
+		vmid->ctx = ctx;
+
+		vmid->regs = &vmid_regs[i];
+		vmid->shifts = &vmid_shifts;
+		vmid->masks = &vmid_masks;
+	}
+
+	return &hubbub3->base;
+}
+
+static struct timing_generator *dcn31_timing_generator_create(
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
+	dcn31_timing_generator_init(tgn10);
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
+static struct link_encoder *dcn31_link_encoder_create(
+	const struct encoder_init_data *enc_init_data)
+{
+	struct dcn20_link_encoder *enc20 =
+		kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+
+	if (!enc20)
+		return NULL;
+
+	dcn31_link_encoder_construct(enc20,
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
+/* Create a minimal link encoder object not associated with a particular
+ * physical connector.
+ * resource_funcs.link_enc_create_minimal
+ */
+static struct link_encoder *dcn31_link_enc_create_minimal(
+		struct dc_context *ctx, enum engine_id eng_id)
+{
+	struct dcn20_link_encoder *enc20;
+
+	if ((eng_id - ENGINE_ID_DIGA) > ctx->dc->res_pool->res_cap->num_dig_link_enc)
+		return NULL;
+
+	enc20 = kzalloc(sizeof(struct dcn20_link_encoder), GFP_KERNEL);
+	if (!enc20)
+		return NULL;
+
+	dcn31_link_encoder_construct_minimal(
+			enc20,
+			ctx,
+			&link_enc_feature,
+			&link_enc_regs[eng_id - ENGINE_ID_DIGA],
+			eng_id);
+
+	return &enc20->enc10.base;
+}
+
+static struct panel_cntl *dcn31_panel_cntl_create(const struct panel_cntl_init_data *init_data)
+{
+	struct dcn31_panel_cntl *panel_cntl =
+		kzalloc(sizeof(struct dcn31_panel_cntl), GFP_KERNEL);
+
+	if (!panel_cntl)
+		return NULL;
+
+	dcn31_panel_cntl_construct(panel_cntl, init_data);
+
+	return &panel_cntl->base;
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
+static struct audio *dcn31_create_audio(
+		struct dc_context *ctx, unsigned int inst)
+{
+	return dce_audio_create(ctx, inst,
+			&audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+static struct vpg *dcn31_vpg_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_vpg *vpg31 = kzalloc(sizeof(struct dcn31_vpg), GFP_KERNEL);
+
+	if (!vpg31)
+		return NULL;
+
+	vpg31_construct(vpg31, ctx, inst,
+			&vpg_regs[inst],
+			&vpg_shift,
+			&vpg_mask);
+
+	return &vpg31->base;
+}
+
+static struct afmt *dcn31_afmt_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn31_afmt *afmt31 = kzalloc(sizeof(struct dcn31_afmt), GFP_KERNEL);
+
+	if (!afmt31)
+		return NULL;
+
+	afmt31_construct(afmt31, ctx, inst,
+			&afmt_regs[inst],
+			&afmt_shift,
+			&afmt_mask);
+
+	// Light sleep by default, no need to power down here
+
+	return &afmt31->base;
+}
+
+
+static struct apg *dcn31_apg_create(
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
+
+static struct stream_encoder *dcn316_stream_encoder_create(
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
+	vpg = dcn31_vpg_create(ctx, vpg_inst);
+	afmt = dcn31_afmt_create(ctx, afmt_inst);
+
+	if (!enc1 || !vpg || !afmt) {
+		kfree(enc1);
+		kfree(vpg);
+		kfree(afmt);
+		return NULL;
+	}
+
+	dcn30_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
+					eng_id, vpg, afmt,
+					&stream_enc_regs[eng_id],
+					&se_shift, &se_mask);
+
+	return &enc1->base;
+}
+
+
+static struct hpo_dp_stream_encoder *dcn31_hpo_dp_stream_encoder_create(
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
+	vpg = dcn31_vpg_create(ctx, vpg_inst);
+	apg = dcn31_apg_create(ctx, apg_inst);
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
+static struct hpo_dp_link_encoder *dcn31_hpo_dp_link_encoder_create(
+	uint8_t inst,
+	struct dc_context *ctx)
+{
+	struct dcn31_hpo_dp_link_encoder *hpo_dp_enc31;
+
+	/* allocate HPO link encoder */
+	hpo_dp_enc31 = kzalloc(sizeof(struct dcn31_hpo_dp_link_encoder), GFP_KERNEL);
+
+	hpo_dp_link_encoder31_construct(hpo_dp_enc31, ctx, inst,
+					&hpo_dp_link_enc_regs[inst],
+					&hpo_dp_le_shift, &hpo_dp_le_mask);
+
+	return &hpo_dp_enc31->base;
+}
+
+
+static struct dce_hwseq *dcn31_hwseq_create(
+	struct dc_context *ctx)
+{
+	struct dce_hwseq *hws = kzalloc(sizeof(struct dce_hwseq), GFP_KERNEL);
+
+	if (hws) {
+		hws->ctx = ctx;
+		hws->regs = &hwseq_reg;
+		hws->shifts = &hwseq_shift;
+		hws->masks = &hwseq_mask;
+		/* DCN3.1 FPGA Workaround
+		 * Need to enable HPO DP Stream Encoder before setting OTG master enable.
+		 * To do so, move calling function enable_stream_timing to only be done AFTER calling
+		 * function core_link_enable_stream
+		 */
+		if (IS_FPGA_MAXIMUS_DC(ctx->dce_environment))
+			hws->wa.dp_hpo_and_otg_sequence = true;
+	}
+	return hws;
+}
+static const struct resource_create_funcs res_create_funcs = {
+	.read_dce_straps = read_dce_straps,
+	.create_audio = dcn31_create_audio,
+	.create_stream_encoder = dcn316_stream_encoder_create,
+	.create_hpo_dp_stream_encoder = dcn31_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn31_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn31_hwseq_create,
+};
+
+static const struct resource_create_funcs res_create_maximus_funcs = {
+	.read_dce_straps = NULL,
+	.create_audio = NULL,
+	.create_stream_encoder = NULL,
+	.create_hpo_dp_stream_encoder = dcn31_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn31_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn31_hwseq_create,
+};
+
+static void dcn316_resource_destruct(struct dcn316_resource_pool *pool)
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
+		kfree(pool->base.hubbub);
+		pool->base.hubbub = NULL;
+	}
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		if (pool->base.dpps[i] != NULL)
+			dcn31_dpp_destroy(&pool->base.dpps[i]);
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
+}
+
+static struct hubp *dcn31_hubp_create(
+	struct dc_context *ctx,
+	uint32_t inst)
+{
+	struct dcn20_hubp *hubp2 =
+		kzalloc(sizeof(struct dcn20_hubp), GFP_KERNEL);
+
+	if (!hubp2)
+		return NULL;
+
+	if (hubp31_construct(hubp2, ctx, inst,
+			&hubp_regs[inst], &hubp_shift, &hubp_mask))
+		return &hubp2->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(hubp2);
+	return NULL;
+}
+
+static bool dcn31_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
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
+static bool dcn31_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
+{
+	int i;
+	uint32_t pipe_count = pool->res_cap->num_dwb;
+
+	for (i = 0; i < pipe_count; i++) {
+		struct dcn30_mmhubbub *mcif_wb30 = kzalloc(sizeof(struct dcn30_mmhubbub),
+						    GFP_KERNEL);
+
+		if (!mcif_wb30) {
+			dm_error("DC: failed to create mcif_wb30!\n");
+			return false;
+		}
+
+		dcn30_mmhubbub_construct(mcif_wb30, ctx,
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
+static struct display_stream_compressor *dcn31_dsc_create(
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
+static void dcn316_destroy_resource_pool(struct resource_pool **pool)
+{
+	struct dcn316_resource_pool *dcn31_pool = TO_DCN316_RES_POOL(*pool);
+
+	dcn316_resource_destruct(dcn31_pool);
+	kfree(dcn31_pool);
+	*pool = NULL;
+}
+
+static struct clock_source *dcn31_clock_source_create(
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
+	kfree(clk_src);
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static bool is_dual_plane(enum surface_pixel_format format)
+{
+	return format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN || format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA;
+}
+
+static int dcn316_populate_dml_pipes_from_context(
+	struct dc *dc, struct dc_state *context,
+	display_e2e_pipe_params_st *pipes,
+	bool fast_validate)
+{
+	int i, pipe_cnt;
+	struct resource_context *res_ctx = &context->res_ctx;
+	struct pipe_ctx *pipe;
+	const int max_usable_det = context->bw_ctx.dml.ip.config_return_buffer_size_in_kbytes - DCN3_16_MIN_COMPBUF_SIZE_KB;
+
+	dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
+
+	for (i = 0, pipe_cnt = 0; i < dc->res_pool->pipe_count; i++) {
+		struct dc_crtc_timing *timing;
+
+		if (!res_ctx->pipe_ctx[i].stream)
+			continue;
+		pipe = &res_ctx->pipe_ctx[i];
+		timing = &pipe->stream->timing;
+
+		/*
+		 * Immediate flip can be set dynamically after enabling the plane.
+		 * We need to require support for immediate flip or underflow can be
+		 * intermittently experienced depending on peak b/w requirements.
+		 */
+		pipes[pipe_cnt].pipe.src.immediate_flip = true;
+
+		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
+		pipes[pipe_cnt].pipe.src.gpuvm = true;
+		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
+		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
+		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
+		pipes[pipe_cnt].pipe.src.dcc_rate = 3;
+		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
+
+		if (pipes[pipe_cnt].dout.dsc_enable) {
+			switch (timing->display_color_depth) {
+			case COLOR_DEPTH_888:
+				pipes[pipe_cnt].dout.dsc_input_bpc = 8;
+				break;
+			case COLOR_DEPTH_101010:
+				pipes[pipe_cnt].dout.dsc_input_bpc = 10;
+				break;
+			case COLOR_DEPTH_121212:
+				pipes[pipe_cnt].dout.dsc_input_bpc = 12;
+				break;
+			default:
+				ASSERT(0);
+				break;
+			}
+		}
+
+		pipe_cnt++;
+	}
+
+	if (pipe_cnt)
+		context->bw_ctx.dml.ip.det_buffer_size_kbytes =
+				(max_usable_det / DCN3_16_CRB_SEGMENT_SIZE_KB / pipe_cnt) * DCN3_16_CRB_SEGMENT_SIZE_KB;
+	if (context->bw_ctx.dml.ip.det_buffer_size_kbytes > DCN3_16_MAX_DET_SIZE)
+		context->bw_ctx.dml.ip.det_buffer_size_kbytes = DCN3_16_MAX_DET_SIZE;
+	ASSERT(context->bw_ctx.dml.ip.det_buffer_size_kbytes >= DCN3_16_DEFAULT_DET_SIZE);
+	dc->config.enable_4to1MPC = false;
+	if (pipe_cnt == 1 && pipe->plane_state && !dc->debug.disable_z9_mpc) {
+		if (is_dual_plane(pipe->plane_state->format)
+				&& pipe->plane_state->src_rect.width <= 1920 && pipe->plane_state->src_rect.height <= 1080) {
+			dc->config.enable_4to1MPC = true;
+			context->bw_ctx.dml.ip.det_buffer_size_kbytes =
+					(max_usable_det / DCN3_16_CRB_SEGMENT_SIZE_KB / 4) * DCN3_16_CRB_SEGMENT_SIZE_KB;
+		} else if (!is_dual_plane(pipe->plane_state->format)) {
+			context->bw_ctx.dml.ip.det_buffer_size_kbytes = 192;
+			pipes[0].pipe.src.unbounded_req_mode = true;
+		}
+	}
+
+	return pipe_cnt;
+}
+
+static struct dc_cap_funcs cap_funcs = {
+	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
+};
+
+static void dcn316_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
+{
+	struct clk_limit_table *clk_table = &bw_params->clk_table;
+	struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
+	unsigned int i, closest_clk_lvl;
+	int max_dispclk_mhz = 0, max_dppclk_mhz = 0;
+	int j;
+
+	// Default clock levels are used for diags, which may lead to overclocking.
+	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
+
+		dcn3_16_ip.max_num_otg = dc->res_pool->res_cap->num_timing_generator;
+		dcn3_16_ip.max_num_dpp = dc->res_pool->pipe_count;
+		dcn3_16_soc.num_chans = bw_params->num_channels;
+
+		ASSERT(clk_table->num_entries);
+
+		/* Prepass to find max clocks independent of voltage level. */
+		for (i = 0; i < clk_table->num_entries; ++i) {
+			if (clk_table->entries[i].dispclk_mhz > max_dispclk_mhz)
+				max_dispclk_mhz = clk_table->entries[i].dispclk_mhz;
+			if (clk_table->entries[i].dppclk_mhz > max_dppclk_mhz)
+				max_dppclk_mhz = clk_table->entries[i].dppclk_mhz;
+		}
+
+		for (i = 0; i < clk_table->num_entries; i++) {
+			/* loop backwards*/
+			for (closest_clk_lvl = 0, j = dcn3_16_soc.num_states - 1; j >= 0; j--) {
+				if ((unsigned int) dcn3_16_soc.clock_limits[j].dcfclk_mhz <= clk_table->entries[i].dcfclk_mhz) {
+					closest_clk_lvl = j;
+					break;
+				}
+			}
+			// Ported from DCN315
+			if (clk_table->num_entries == 1) {
+				/*smu gives one DPM level, let's take the highest one*/
+				closest_clk_lvl = dcn3_16_soc.num_states - 1;
+			}
+
+			clock_limits[i].state = i;
+
+			/* Clocks dependent on voltage level. */
+			clock_limits[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+			if (clk_table->num_entries == 1 &&
+				clock_limits[i].dcfclk_mhz < dcn3_16_soc.clock_limits[closest_clk_lvl].dcfclk_mhz) {
+				/*SMU fix not released yet*/
+				clock_limits[i].dcfclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].dcfclk_mhz;
+			}
+			clock_limits[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
+			clock_limits[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
+			clock_limits[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2 * clk_table->entries[i].wck_ratio;
+
+			/* Clocks independent of voltage level. */
+			clock_limits[i].dispclk_mhz = max_dispclk_mhz ? max_dispclk_mhz :
+				dcn3_16_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
+
+			clock_limits[i].dppclk_mhz = max_dppclk_mhz ? max_dppclk_mhz :
+				dcn3_16_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
+
+			clock_limits[i].dram_bw_per_chan_gbps = dcn3_16_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+			clock_limits[i].dscclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+			clock_limits[i].dtbclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+			clock_limits[i].phyclk_d18_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+			clock_limits[i].phyclk_mhz = dcn3_16_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+		}
+		for (i = 0; i < clk_table->num_entries; i++)
+			dcn3_16_soc.clock_limits[i] = clock_limits[i];
+		if (clk_table->num_entries) {
+			dcn3_16_soc.num_states = clk_table->num_entries;
+		}
+	}
+
+	if (max_dispclk_mhz) {
+		dcn3_16_soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
+		dc->dml.soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
+	}
+
+	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
+		dml_init_instance(&dc->dml, &dcn3_16_soc, &dcn3_16_ip, DML_PROJECT_DCN31);
+	else
+		dml_init_instance(&dc->dml, &dcn3_16_soc, &dcn3_16_ip, DML_PROJECT_DCN31_FPGA);
+}
+
+static struct resource_funcs dcn316_res_pool_funcs = {
+	.destroy = dcn316_destroy_resource_pool,
+	.link_enc_create = dcn31_link_encoder_create,
+	.link_enc_create_minimal = dcn31_link_enc_create_minimal,
+	.link_encs_assign = link_enc_cfg_link_encs_assign,
+	.link_enc_unassign = link_enc_cfg_link_enc_unassign,
+	.panel_cntl_create = dcn31_panel_cntl_create,
+	.validate_bandwidth = dcn31_validate_bandwidth,
+	.calculate_wm_and_dlg = dcn31_calculate_wm_and_dlg,
+	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
+	.populate_dml_pipes = dcn316_populate_dml_pipes_from_context,
+	.acquire_idle_pipe_for_layer = dcn20_acquire_idle_pipe_for_layer,
+	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
+	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
+	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
+	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
+	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
+	.update_bw_bounding_box = dcn316_update_bw_bounding_box,
+	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
+};
+
+static struct clock_source *dcn30_clock_source_create(
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
+static bool dcn316_resource_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dcn316_resource_pool *pool)
+{
+	int i;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_dcn31;
+
+	pool->base.funcs = &dcn316_res_pool_funcs;
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.pipe_count = pool->base.res_cap->num_timing_generator;
+	pool->base.mpcc_count = pool->base.res_cap->num_timing_generator;
+	dc->caps.max_downscale_ratio = 600;
+	dc->caps.i2c_speed_in_khz = 100;
+	dc->caps.i2c_speed_in_khz_hdcp = 5; /*1.4 w/a applied by default*/
+	dc->caps.max_cursor_size = 256;
+	dc->caps.min_horizontal_blanking_period = 80;
+	dc->caps.dmdata_alloc_size = 2048;
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
+	dc->caps.is_apu = true;
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
+	dc->caps.color.dpp.hw_3d_lut = 1;
+	dc->caps.color.dpp.ogam_ram = 1;
+	// no OGAM ROM on DCN301
+	dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
+	dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.gamma2_2 = 0;
+	dc->caps.color.dpp.ogam_rom_caps.pq = 0;
+	dc->caps.color.dpp.ogam_rom_caps.hlg = 0;
+	dc->caps.color.dpp.ocsc = 0;
+
+	dc->caps.color.mpc.gamut_remap = 1;
+	dc->caps.color.mpc.num_3dluts = pool->base.res_cap->num_mpc_3dlut; //2
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
+	pool->base.clock_sources[DCN31_CLK_SRC_PLL0] =
+			dcn30_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL0,
+				&clk_src_regs[0], false);
+	pool->base.clock_sources[DCN31_CLK_SRC_PLL1] =
+			dcn30_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL1,
+				&clk_src_regs[1], false);
+	pool->base.clock_sources[DCN31_CLK_SRC_PLL2] =
+			dcn30_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL2,
+				&clk_src_regs[2], false);
+	pool->base.clock_sources[DCN31_CLK_SRC_PLL3] =
+			dcn30_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL3,
+				&clk_src_regs[3], false);
+	pool->base.clock_sources[DCN31_CLK_SRC_PLL4] =
+			dcn30_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL4,
+				&clk_src_regs[4], false);
+
+	pool->base.clk_src_count = DCN30_CLK_SRC_TOTAL;
+
+	/* todo: not reuse phy_pll registers */
+	pool->base.dp_clock_source =
+			dcn31_clock_source_create(ctx, ctx->dc_bios,
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
+	/* TODO: DCCG */
+	pool->base.dccg = dccg31_create(ctx, &dccg_regs, &dccg_shift, &dccg_mask);
+	if (pool->base.dccg == NULL) {
+		dm_error("DC: failed to create dccg!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* TODO: IRQ */
+	init_data.ctx = dc->ctx;
+	pool->base.irqs = dal_irq_service_dcn31_create(&init_data);
+	if (!pool->base.irqs)
+		goto create_fail;
+
+	/* HUBBUB */
+	pool->base.hubbub = dcn31_hubbub_create(ctx);
+	if (pool->base.hubbub == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create hubbub!\n");
+		goto create_fail;
+	}
+
+	/* HUBPs, DPPs, OPPs and TGs */
+	for (i = 0; i < pool->base.pipe_count; i++) {
+		pool->base.hubps[i] = dcn31_hubp_create(ctx, i);
+		if (pool->base.hubps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create hubps!\n");
+			goto create_fail;
+		}
+
+		pool->base.dpps[i] = dcn31_dpp_create(ctx, i);
+		if (pool->base.dpps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create dpps!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_opp; i++) {
+		pool->base.opps[i] = dcn31_opp_create(ctx, i);
+		if (pool->base.opps[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create output pixel processor!\n");
+			goto create_fail;
+		}
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		pool->base.timing_generators[i] = dcn31_timing_generator_create(
+				ctx, i);
+		if (pool->base.timing_generators[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto create_fail;
+		}
+	}
+	pool->base.timing_generator_count = i;
+
+	/* PSR */
+	pool->base.psr = dmub_psr_create(ctx);
+	if (pool->base.psr == NULL) {
+		dm_error("DC: failed to create psr obj!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	/* ABM */
+	for (i = 0; i < pool->base.res_cap->num_timing_generator; i++) {
+		pool->base.multiple_abms[i] = dmub_abm_create(ctx,
+				&abm_regs[i],
+				&abm_shift,
+				&abm_mask);
+		if (pool->base.multiple_abms[i] == NULL) {
+			dm_error("DC: failed to create abm for pipe %d!\n", i);
+			BREAK_TO_DEBUGGER();
+			goto create_fail;
+		}
+	}
+
+	/* MPC and DSC */
+	pool->base.mpc = dcn31_mpc_create(ctx, pool->base.mpcc_count, pool->base.res_cap->num_mpc_3dlut);
+	if (pool->base.mpc == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mpc!\n");
+		goto create_fail;
+	}
+
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		pool->base.dscs[i] = dcn31_dsc_create(ctx, i);
+		if (pool->base.dscs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create display stream compressor %d!\n", i);
+			goto create_fail;
+		}
+	}
+
+	/* DWB and MMHUBBUB */
+	if (!dcn31_dwbc_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create dwbc!\n");
+		goto create_fail;
+	}
+
+	if (!dcn31_mmhubbub_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mcif_wb!\n");
+		goto create_fail;
+	}
+
+	/* AUX and I2C */
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dcn31_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto create_fail;
+		}
+		pool->base.hw_i2cs[i] = dcn31_i2c_hw_create(ctx, i);
+		if (pool->base.hw_i2cs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create hw i2c!!\n");
+			goto create_fail;
+		}
+		pool->base.sw_i2cs[i] = NULL;
+	}
+
+	/* Audio, Stream Encoders including HPO and virtual, MPC 3D LUTs */
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+			(!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment) ?
+			&res_create_funcs : &res_create_maximus_funcs)))
+			goto create_fail;
+
+	/* HW Sequencer and Plane caps */
+	dcn31_hw_sequencer_construct(dc);
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->cap_funcs = cap_funcs;
+
+	dc->dcn_ip->max_num_dpp = dcn3_16_ip.max_num_dpp;
+
+	return true;
+
+create_fail:
+
+	dcn316_resource_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn316_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc)
+{
+	struct dcn316_resource_pool *pool =
+		kzalloc(sizeof(struct dcn316_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn316_resource_construct(init_data->num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
new file mode 100644
index 000000000000..9d0d60cb9482
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn316/dcn316_resource.h
@@ -0,0 +1,42 @@
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
+#ifndef _DCN316_RESOURCE_H_
+#define _DCN316_RESOURCE_H_
+
+#include "core_types.h"
+
+#define TO_DCN316_RES_POOL(pool)\
+	container_of(pool, struct dcn316_resource_pool, base)
+
+struct dcn316_resource_pool {
+	struct resource_pool base;
+};
+
+struct resource_pool *dcn316_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc);
+
+#endif /* _DCN316_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/Makefile b/drivers/gpu/drm/amd/display/dc/gpio/Makefile
index c5ddade8b187..a1bf2128feba 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/gpio/Makefile
@@ -106,6 +106,7 @@ GPIO_DCN30 = hw_translate_dcn30.o hw_factory_dcn30.o
 AMD_DAL_GPIO_DCN30 = $(addprefix $(AMDDALPATH)/dc/gpio/dcn30/,$(GPIO_DCN30))
 
 AMD_DISPLAY_FILES += $(AMD_DAL_GPIO_DCN30)
+
 endif
 ###############################################################################
 # Diagnostics on FPGA
-- 
2.34.1


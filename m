Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E51534145
	for <lists+amd-gfx@lfdr.de>; Wed, 25 May 2022 18:20:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6442610F066;
	Wed, 25 May 2022 16:20:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D965F10E7E0
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 May 2022 16:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJjCq1XsplxXZkcz0oasYCseDg+grQ+Aqu9x9bP1srZmdVqd9jma8nVneGnDnRYjmyMnz/x5/aXpyXUWzJ6ur6edP7x1MxHCzidExa4u0Skzm4w/ZXKHCe71gspq7kF3ghInndypTCyhDdYTc78ZawzeVCykm/7G3NRodui0c78yE4ks4f/E6kFiIsYlT1IqaQbUbrNEcojLaoJjDhtN9ja4FTuJ4QYHOtGEmYcuf/zD/u6gHQ/Yms4IRUj64hkFMevkTyNn9fkPl1kwWkCqBNWXxXbsehwUSDGCWLF+i9onLLiN0Q2gA3hwX3sSN5ZGPVeuZzf3O1Am5UiDE4/TZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2aIS8QfT34kpxWWMdsFIMp1v0aFAFc0m/SGijWE/yE=;
 b=P9eP/Evo5hLoA7s/VrLeRHPzQPMN1fnd+Fpz/rKDeWN2NThLS5QsoZVJnhJmV3Lj8SAmpVZTvByUPgFoTNvZOY7Jz8Czh0hZvSHOr8mmK+fABb8VjnfZi12Aq0BY9R9zEJ7JB8pIDR4X3qdjIY1dAKMFwiNDg59Td1aVLC1dKoIgRfDowdvs62TzbRR3x7V+iAmrWGYHDgDsEreK8Apxl3/f5ypZD+ybYPNnZiizyJ5iSVwtGvM9uxerjGPB1vHuv01NjSjCIOTEdtGWnphpq84h/qOLiX4TKvmOj37F9v6D0Nk4tmiWvQI2Id9mHb8ts2xWjo5DuY/6M/XuvtsL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2aIS8QfT34kpxWWMdsFIMp1v0aFAFc0m/SGijWE/yE=;
 b=C+J7PlgKKLpodSIMdWsoTKnTQOCd0EiXp1VMhKWCY6C81MRxoLp6R85sPkWMCDwwoLUNOD+RirzMO4L8V/Iv/1QwpNfXvD9DbTW/GoZkZLhdqko5HlhD0Z0Zurk2Mm/WMabQ3ntQrzI5HFZFg+PR6HctZA0A6uXYWZT+9XZps9o=
Received: from DS7PR05CA0094.namprd05.prod.outlook.com (2603:10b6:8:56::11) by
 DS0PR12MB6654.namprd12.prod.outlook.com (2603:10b6:8:d1::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.13; Wed, 25 May 2022 16:20:07 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::1b) by DS7PR05CA0094.outlook.office365.com
 (2603:10b6:8:56::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.5 via Frontend
 Transport; Wed, 25 May 2022 16:20:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Wed, 25 May 2022 16:20:07 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 25 May
 2022 11:20:05 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 10/43] drm/amd/display: add DCN32/321 specific files for
 Display Core
Date: Wed, 25 May 2022 12:19:08 -0400
Message-ID: <20220525161941.2544055-10-alexander.deucher@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 51956eb9-e29a-4623-48a9-08da3e6a6ef0
X-MS-TrafficTypeDiagnostic: DS0PR12MB6654:EE_
X-Microsoft-Antispam-PRVS: <DS0PR12MB6654B8AD8708346AF1B8786FF7D69@DS0PR12MB6654.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FcINcowoRqBluJwfYwl0yLceU2Eke36nKIx6KEIpPds5BzMr3TyFcFQ4ihFR6VhPQtqNRbA7UlHCmA5KXpgN6GekA6JOI93KRlbhQYJzJ1LnZQMKCgiYKu3g7sHJWXWFtUkZ+D0OikfPPSdXg7GcFS2DgiZ4E2J/PFlNi1+UYR+CtydL88LBdPSIw4O0EVGU/A6ojIspIbNZ7T898lDh9r9DQLs4ByiGnocZtvHHdCuTQAG/SsSGhduSSAXKwDfOvouk8EQhQycFtN7JCriMvoQGEWuPBEmr1aKqh5603PN/9cgWwaz40e9xqrOTqUO+qJwNxTLcnVq9mNFUxLgXhb9eoAkUnp9V/Jnxj61F7yuoVvtiL+JIMYXfYN7DlOG8XlY0VpwtFPD20burEGxmAAOvUhpuye5W9rKvUFCUMlV2+MZKiszj67MTWAvrBBtforCgX3yJgkv7mSdLJ5LcM3M7iL3H2n1ComVtgfuivZNh3lRpkDBcJKt2Xi5QFVF+Ua5rr1ddKvh6cYHLO3smM1mTk75yo+N4pF12ZfZYznsWcM210p/2Q5ZmZd4o1xAEb//Z4LJ86WHZf83yR0HZi7m3aiX6JGWXb7amUe3SbFW+/PnSx1dpm3wbjszFFFFnfDVrQ1lE4JnYBWkObR7T1KVd6HQ6GxDAwGhG1JGMWgYy1BHS1o69CBFDx7hGtyACZeN+fVzoiGEhi0U4FNAERt4vwGsq+4zePfKuf2Go/m8QmC0TECMGXjYaNg2J20r8WtrdzW3tZfcF6wGDjJPTPQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(5660300002)(336012)(1076003)(316002)(40140700001)(6916009)(2616005)(186003)(36756003)(356005)(2906002)(426003)(16526019)(86362001)(508600001)(7696005)(47076005)(26005)(54906003)(8936002)(82310400005)(81166007)(40460700003)(8676002)(36860700001)(83380400001)(70586007)(4326008)(70206006)(30864003)(36900700001)(579004)(559001)(309714004)(44824005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 16:20:07.3949 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51956eb9-e29a-4623-48a9-08da3e6a6ef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6654
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
 Aurabindo Pillai <aurabindo.pillai@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

Add core DC support for DCN 3.2.x.

v2: squash in fixup (Alex)

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn32/Makefile |   37 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c |  299 ++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h |  155 +
 .../display/dc/dcn32/dcn32_dio_link_encoder.c |  283 ++
 .../display/dc/dcn32/dcn32_dio_link_encoder.h |   42 +
 .../dc/dcn32/dcn32_dio_stream_encoder.c       |  427 ++
 .../dc/dcn32/dcn32_dio_stream_encoder.h       |  254 ++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c  |  164 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_dpp.h  |   38 +
 .../dc/dcn32/dcn32_hpo_dp_link_encoder.c      |   90 +
 .../dc/dcn32/dcn32_hpo_dp_link_encoder.h      |   63 +
 .../drm/amd/display/dc/dcn32/dcn32_hubbub.c   |  964 ++++
 .../drm/amd/display/dc/dcn32/dcn32_hubbub.h   |  172 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c |  148 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h |   69 +
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.c    |  891 ++++
 .../drm/amd/display/dc/dcn32/dcn32_hwseq.h    |   64 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_init.c |  155 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_init.h |   33 +
 .../drm/amd/display/dc/dcn32/dcn32_mmhubbub.c |  239 +
 .../drm/amd/display/dc/dcn32/dcn32_mmhubbub.h |  225 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c  |  810 ++++
 .../gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h  |  213 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_optc.c |  236 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_optc.h |  253 ++
 .../drm/amd/display/dc/dcn32/dcn32_resource.c | 3976 +++++++++++++++++
 .../drm/amd/display/dc/dcn32/dcn32_resource.h |   88 +
 .../gpu/drm/amd/display/dc/dcn321/Makefile    |   34 +
 .../amd/display/dc/dcn321/dcn321_resource.c   |   32 +-
 .../amd/display/dc/dcn321/dcn321_resource.h   |   42 +
 30 files changed, 10478 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/Makefile b/drivers/gpu/drm/amd/display/dc/dcn32/Makefile
new file mode 100644
index 000000000000..6e0328060255
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/Makefile
@@ -0,0 +1,37 @@
+#
+# (c) Copyright 2022 Advanced Micro Devices, Inc. All the rights reserved
+#
+#  All rights reserved.  This notice is intended as a precaution against
+#  inadvertent publication and does not imply publication or any waiver
+#  of confidentiality.  The year included in the foregoing notice is the
+#  year of creation of the work.
+#
+#  Authors: AMD
+#
+# Makefile for dcn32.
+
+DCN32 = dcn32_resource.o dcn32_hubbub.o dcn32_hwseq.o dcn32_init.o \
+		dcn32_dccg.o dcn32_optc.o dcn32_mmhubbub.o dcn32_hubp.o dcn32_dpp.o \
+		dcn32_dio_stream_encoder.o dcn32_dio_link_encoder.o dcn32_hpo_dp_link_encoder.o \
+		dcn32_mpc.o
+
+CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource.o := -mhard-float -msse
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+endif
+
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource.o += -mpreferred-stack-boundary=4
+else
+CFLAGS_$(AMDDALPATH)/dc/dcn32/dcn32_resource.o += -msse2
+endif
+
+AMD_DAL_DCN32 = $(addprefix $(AMDDALPATH)/dc/dcn32/,$(DCN32))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCN32)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
new file mode 100644
index 000000000000..12633561be3f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.c
@@ -0,0 +1,299 @@
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
+#include "reg_helper.h"
+#include "core_types.h"
+#include "dcn32_dccg.h"
+
+#define TO_DCN_DCCG(dccg)\
+	container_of(dccg, struct dcn_dccg, base)
+
+#define REG(reg) \
+	(dccg_dcn->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	dccg_dcn->dccg_shift->field_name, dccg_dcn->dccg_mask->field_name
+
+#define CTX \
+	dccg_dcn->base.ctx
+#define DC_LOGGER \
+	dccg->ctx->logger
+
+enum pixel_rate_div {
+	PIXEL_RATE_DIV_BY_1 = 0,
+	PIXEL_RATE_DIV_BY_2 = 1,
+	PIXEL_RATE_DIV_BY_4 = 3
+};
+
+static void dccg32_set_pixel_rate_div(
+		struct dccg *dccg,
+		uint32_t otg_inst,
+		enum pixel_rate_div k1,
+		enum pixel_rate_div k2)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	switch (otg_inst) {
+	case 0:
+		REG_UPDATE_2(OTG_PIXEL_RATE_DIV,
+				OTG0_PIXEL_RATE_DIVK1, k1,
+				OTG0_PIXEL_RATE_DIVK2, k2);
+		break;
+	case 1:
+		REG_UPDATE_2(OTG_PIXEL_RATE_DIV,
+				OTG1_PIXEL_RATE_DIVK1, k1,
+				OTG1_PIXEL_RATE_DIVK2, k2);
+		break;
+	case 2:
+		REG_UPDATE_2(OTG_PIXEL_RATE_DIV,
+				OTG2_PIXEL_RATE_DIVK1, k1,
+				OTG2_PIXEL_RATE_DIVK2, k2);
+		break;
+	case 3:
+		REG_UPDATE_2(OTG_PIXEL_RATE_DIV,
+				OTG3_PIXEL_RATE_DIVK1, k1,
+				OTG3_PIXEL_RATE_DIVK2, k2);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		return;
+	}
+}
+
+static void dccg32_set_dtbclk_p_src(
+		struct dccg *dccg,
+		enum streamclk_source src,
+		uint32_t otg_inst)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	uint32_t p_src_sel = 0; /* selects dprefclk */
+	if (src == DTBCLK0)
+		p_src_sel = 2;  /* selects dtbclk0 */
+
+	switch (otg_inst) {
+	case 0:
+		if (src == REFCLK)
+			REG_UPDATE(DTBCLK_P_CNTL,
+					DTBCLK_P0_EN, 0);
+		else
+			REG_UPDATE_2(DTBCLK_P_CNTL,
+					DTBCLK_P0_SRC_SEL, p_src_sel,
+					DTBCLK_P0_EN, 1);
+		break;
+	case 1:
+		if (src == REFCLK)
+			REG_UPDATE(DTBCLK_P_CNTL,
+					DTBCLK_P1_EN, 0);
+		else
+			REG_UPDATE_2(DTBCLK_P_CNTL,
+					DTBCLK_P1_SRC_SEL, p_src_sel,
+					DTBCLK_P1_EN, 1);
+		break;
+	case 2:
+		if (src == REFCLK)
+			REG_UPDATE(DTBCLK_P_CNTL,
+					DTBCLK_P2_EN, 0);
+		else
+			REG_UPDATE_2(DTBCLK_P_CNTL,
+					DTBCLK_P2_SRC_SEL, p_src_sel,
+					DTBCLK_P2_EN, 1);
+		break;
+	case 3:
+		if (src == REFCLK)
+			REG_UPDATE(DTBCLK_P_CNTL,
+					DTBCLK_P3_EN, 0);
+		else
+			REG_UPDATE_2(DTBCLK_P_CNTL,
+					DTBCLK_P3_SRC_SEL, p_src_sel,
+					DTBCLK_P3_EN, 1);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		return;
+	}
+
+}
+
+/* Controls the generation of pixel valid for OTG in (OTG -> HPO case) */
+void dccg32_set_dtbclk_dto(
+		struct dccg *dccg,
+		int otg_inst,
+		int pixclk_khz,
+		int num_odm_segments,
+		const struct dc_crtc_timing *timing)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+	/* DTO Output Rate / Pixel Rate = 1/4 */
+	int req_dtbclk_khz = pixclk_khz / 4;
+
+	if (dccg->ref_dtbclk_khz && req_dtbclk_khz) {
+		uint32_t modulo, phase;
+
+		// phase / modulo = dtbclk / dtbclk ref
+		modulo = 0xffffffff;
+		phase = (((unsigned long long)modulo * req_dtbclk_khz) + dccg->ref_dtbclk_khz - 1) / dccg->ref_dtbclk_khz;
+
+		REG_WRITE(DTBCLK_DTO_MODULO[otg_inst], modulo);
+		REG_WRITE(DTBCLK_DTO_PHASE[otg_inst], phase);
+
+		REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+				DTBCLK_DTO_ENABLE[otg_inst], 1);
+
+		REG_WAIT(OTG_PIXEL_RATE_CNTL[otg_inst],
+				DTBCLKDTO_ENABLE_STATUS[otg_inst], 1,
+				1, 100);
+
+		/* program OTG_PIXEL_RATE_DIV for DIVK1 and DIVK2 fields */
+		dccg32_set_pixel_rate_div(dccg, otg_inst, PIXEL_RATE_DIV_BY_1, PIXEL_RATE_DIV_BY_1);
+
+		/* The recommended programming sequence to enable DTBCLK DTO to generate
+		 * valid pixel HPO DPSTREAM ENCODER, specifies that DTO source select should
+		 * be set only after DTO is enabled
+		 */
+		REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+				PIPE_DTO_SRC_SEL[otg_inst], 2);
+
+		dccg->dtbclk_khz[otg_inst] = req_dtbclk_khz;
+	} else {
+		REG_UPDATE_2(OTG_PIXEL_RATE_CNTL[otg_inst],
+				DTBCLK_DTO_ENABLE[otg_inst], 0,
+				PIPE_DTO_SRC_SEL[otg_inst], 1);
+
+		REG_WRITE(DTBCLK_DTO_MODULO[otg_inst], 0);
+		REG_WRITE(DTBCLK_DTO_PHASE[otg_inst], 0);
+
+		dccg->dtbclk_khz[otg_inst] = 0;
+	}
+}
+
+static void dccg32_get_dccg_ref_freq(struct dccg *dccg,
+		unsigned int xtalin_freq_inKhz,
+		unsigned int *dccg_ref_freq_inKhz)
+{
+	/*
+	 * Assume refclk is sourced from xtalin
+	 * expect 100MHz
+	 */
+	*dccg_ref_freq_inKhz = xtalin_freq_inKhz;
+	return;
+}
+
+void dccg32_set_dpstreamclk(
+		struct dccg *dccg,
+		enum streamclk_source src,
+		int otg_inst)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	/* set the dtbclk_p source */
+	dccg32_set_dtbclk_p_src(dccg, src, otg_inst);
+
+	/* enabled to select one of the DTBCLKs for pipe */
+	switch (otg_inst)
+	{
+	case 0:
+		REG_UPDATE_2(DPSTREAMCLK_CNTL,
+			     DPSTREAMCLK0_EN,
+			     (src == REFCLK) ? 0 : 1, DPSTREAMCLK0_SRC_SEL, 0);
+		break;
+	case 1:
+		REG_UPDATE_2(DPSTREAMCLK_CNTL, DPSTREAMCLK1_EN,
+			     (src == REFCLK) ? 0 : 1, DPSTREAMCLK1_SRC_SEL, 1);
+		break;
+	case 2:
+		REG_UPDATE_2(DPSTREAMCLK_CNTL, DPSTREAMCLK2_EN,
+			     (src == REFCLK) ? 0 : 1, DPSTREAMCLK2_SRC_SEL, 2);
+		break;
+	case 3:
+		REG_UPDATE_2(DPSTREAMCLK_CNTL, DPSTREAMCLK3_EN,
+			     (src == REFCLK) ? 0 : 1, DPSTREAMCLK3_SRC_SEL, 3);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		return;
+	}
+}
+
+void dccg32_otg_add_pixel(struct dccg *dccg,
+		uint32_t otg_inst)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+			OTG_ADD_PIXEL[otg_inst], 1);
+}
+
+void dccg32_otg_drop_pixel(struct dccg *dccg,
+		uint32_t otg_inst)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	REG_UPDATE(OTG_PIXEL_RATE_CNTL[otg_inst],
+			OTG_DROP_PIXEL[otg_inst], 1);
+}
+
+static const struct dccg_funcs dccg32_funcs = {
+	.update_dpp_dto = dccg2_update_dpp_dto,
+	.get_dccg_ref_freq = dccg32_get_dccg_ref_freq,
+	.dccg_init = dccg31_init,
+	.set_dpstreamclk = dccg32_set_dpstreamclk,
+	.enable_symclk32_se = dccg31_enable_symclk32_se,
+	.disable_symclk32_se = dccg31_disable_symclk32_se,
+	.enable_symclk32_le = dccg31_enable_symclk32_le,
+	.disable_symclk32_le = dccg31_disable_symclk32_le,
+	.set_physymclk = dccg31_set_physymclk,
+	.set_dtbclk_dto = dccg32_set_dtbclk_dto,
+	.set_fifo_errdet_ovr_en = dccg2_set_fifo_errdet_ovr_en,
+	.set_audio_dtbclk_dto = dccg31_set_audio_dtbclk_dto,
+	.otg_add_pixel = dccg32_otg_add_pixel,
+	.otg_drop_pixel = dccg32_otg_drop_pixel,
+};
+
+struct dccg *dccg32_create(
+	struct dc_context *ctx,
+	const struct dccg_registers *regs,
+	const struct dccg_shift *dccg_shift,
+	const struct dccg_mask *dccg_mask)
+{
+	struct dcn_dccg *dccg_dcn = kzalloc(sizeof(*dccg_dcn), GFP_KERNEL);
+	struct dccg *base;
+
+	if (dccg_dcn == NULL) {
+		BREAK_TO_DEBUGGER();
+		return NULL;
+	}
+
+	base = &dccg_dcn->base;
+	base->ctx = ctx;
+	base->funcs = &dccg32_funcs;
+
+	dccg_dcn->regs = regs;
+	dccg_dcn->dccg_shift = dccg_shift;
+	dccg_dcn->dccg_mask = dccg_mask;
+
+	return &dccg_dcn->base;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h
new file mode 100644
index 000000000000..0e54c0a105a1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dccg.h
@@ -0,0 +1,155 @@
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
+#ifndef __DCN32_DCCG_H__
+#define __DCN32_DCCG_H__
+
+#include "dcn31/dcn31_dccg.h"
+
+#define DCCG_SFII(block, reg_name, field_prefix, field_name, inst, post_fix)\
+	.field_prefix ## _ ## field_name[inst] = block ## inst ## _ ## reg_name ## __ ## field_prefix ## inst ## _ ## field_name ## post_fix
+
+
+#define DCCG_REG_LIST_DCN32() \
+	SR(DPPCLK_DTO_CTRL),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 0),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 1),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 2),\
+	DCCG_SRII(DTO_PARAM, DPPCLK, 3),\
+	DCCG_SRII(CLOCK_CNTL, HDMICHARCLK, 0),\
+	SR(PHYASYMCLK_CLOCK_CNTL),\
+	SR(PHYBSYMCLK_CLOCK_CNTL),\
+	SR(PHYCSYMCLK_CLOCK_CNTL),\
+	SR(PHYDSYMCLK_CLOCK_CNTL),\
+	SR(PHYESYMCLK_CLOCK_CNTL),\
+	SR(DPSTREAMCLK_CNTL),\
+	SR(SYMCLK32_SE_CNTL),\
+	SR(SYMCLK32_LE_CNTL),\
+	DCCG_SRII(PIXEL_RATE_CNTL, OTG, 0),\
+	DCCG_SRII(PIXEL_RATE_CNTL, OTG, 1),\
+	DCCG_SRII(PIXEL_RATE_CNTL, OTG, 2),\
+	DCCG_SRII(PIXEL_RATE_CNTL, OTG, 3),\
+	DCCG_SRII(MODULO, DTBCLK_DTO, 0),\
+	DCCG_SRII(MODULO, DTBCLK_DTO, 1),\
+	DCCG_SRII(MODULO, DTBCLK_DTO, 2),\
+	DCCG_SRII(MODULO, DTBCLK_DTO, 3),\
+	DCCG_SRII(PHASE, DTBCLK_DTO, 0),\
+	DCCG_SRII(PHASE, DTBCLK_DTO, 1),\
+	DCCG_SRII(PHASE, DTBCLK_DTO, 2),\
+	DCCG_SRII(PHASE, DTBCLK_DTO, 3),\
+	SR(DCCG_AUDIO_DTBCLK_DTO_MODULO),\
+	SR(DCCG_AUDIO_DTBCLK_DTO_PHASE),\
+	SR(OTG_PIXEL_RATE_DIV),\
+	SR(DTBCLK_P_CNTL),\
+	SR(DCCG_AUDIO_DTO_SOURCE)
+
+
+#define DCCG_MASK_SH_LIST_DCN32(mask_sh) \
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 0, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 0, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 1, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 1, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 2, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 2, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_ENABLE, DPPCLK, 3, mask_sh),\
+	DCCG_SFI(DPPCLK_DTO_CTRL, DTO_DB_EN, DPPCLK, 3, mask_sh),\
+	DCCG_SF(DPPCLK0_DTO_PARAM, DPPCLK0_DTO_PHASE, mask_sh),\
+	DCCG_SF(DPPCLK0_DTO_PARAM, DPPCLK0_DTO_MODULO, mask_sh),\
+	DCCG_SF(HDMICHARCLK0_CLOCK_CNTL, HDMICHARCLK0_EN, mask_sh),\
+	DCCG_SF(HDMICHARCLK0_CLOCK_CNTL, HDMICHARCLK0_SRC_SEL, mask_sh),\
+	DCCG_SF(PHYASYMCLK_CLOCK_CNTL, PHYASYMCLK_FORCE_EN, mask_sh),\
+	DCCG_SF(PHYASYMCLK_CLOCK_CNTL, PHYASYMCLK_FORCE_SRC_SEL, mask_sh),\
+	DCCG_SF(PHYBSYMCLK_CLOCK_CNTL, PHYBSYMCLK_FORCE_EN, mask_sh),\
+	DCCG_SF(PHYBSYMCLK_CLOCK_CNTL, PHYBSYMCLK_FORCE_SRC_SEL, mask_sh),\
+	DCCG_SF(PHYCSYMCLK_CLOCK_CNTL, PHYCSYMCLK_FORCE_EN, mask_sh),\
+	DCCG_SF(PHYCSYMCLK_CLOCK_CNTL, PHYCSYMCLK_FORCE_SRC_SEL, mask_sh),\
+	DCCG_SF(PHYDSYMCLK_CLOCK_CNTL, PHYDSYMCLK_FORCE_EN, mask_sh),\
+	DCCG_SF(PHYDSYMCLK_CLOCK_CNTL, PHYDSYMCLK_FORCE_SRC_SEL, mask_sh),\
+	DCCG_SF(PHYESYMCLK_CLOCK_CNTL, PHYESYMCLK_FORCE_EN, mask_sh),\
+	DCCG_SF(PHYESYMCLK_CLOCK_CNTL, PHYESYMCLK_FORCE_SRC_SEL, mask_sh),\
+	DCCG_SF(DPSTREAMCLK_CNTL, DPSTREAMCLK0_EN, mask_sh),\
+	DCCG_SF(DPSTREAMCLK_CNTL, DPSTREAMCLK1_EN, mask_sh),\
+	DCCG_SF(DPSTREAMCLK_CNTL, DPSTREAMCLK2_EN, mask_sh),\
+	DCCG_SF(DPSTREAMCLK_CNTL, DPSTREAMCLK3_EN, mask_sh),\
+	DCCG_SF(DPSTREAMCLK_CNTL, DPSTREAMCLK0_SRC_SEL, mask_sh),\
+	DCCG_SF(DPSTREAMCLK_CNTL, DPSTREAMCLK1_SRC_SEL, mask_sh),\
+	DCCG_SF(DPSTREAMCLK_CNTL, DPSTREAMCLK2_SRC_SEL, mask_sh),\
+	DCCG_SF(DPSTREAMCLK_CNTL, DPSTREAMCLK3_SRC_SEL, mask_sh),\
+	DCCG_SF(HDMISTREAMCLK_CNTL, HDMISTREAMCLK0_EN, mask_sh),\
+	DCCG_SF(SYMCLK32_SE_CNTL, SYMCLK32_SE0_SRC_SEL, mask_sh),\
+	DCCG_SF(SYMCLK32_SE_CNTL, SYMCLK32_SE1_SRC_SEL, mask_sh),\
+	DCCG_SF(SYMCLK32_SE_CNTL, SYMCLK32_SE2_SRC_SEL, mask_sh),\
+	DCCG_SF(SYMCLK32_SE_CNTL, SYMCLK32_SE3_SRC_SEL, mask_sh),\
+	DCCG_SF(SYMCLK32_SE_CNTL, SYMCLK32_SE0_EN, mask_sh),\
+	DCCG_SF(SYMCLK32_SE_CNTL, SYMCLK32_SE1_EN, mask_sh),\
+	DCCG_SF(SYMCLK32_SE_CNTL, SYMCLK32_SE2_EN, mask_sh),\
+	DCCG_SF(SYMCLK32_SE_CNTL, SYMCLK32_SE3_EN, mask_sh),\
+	DCCG_SF(SYMCLK32_LE_CNTL, SYMCLK32_LE0_SRC_SEL, mask_sh),\
+	DCCG_SF(SYMCLK32_LE_CNTL, SYMCLK32_LE1_SRC_SEL, mask_sh),\
+	DCCG_SF(SYMCLK32_LE_CNTL, SYMCLK32_LE0_EN, mask_sh),\
+	DCCG_SF(SYMCLK32_LE_CNTL, SYMCLK32_LE1_EN, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLK_DTO, ENABLE, 0, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLK_DTO, ENABLE, 1, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLK_DTO, ENABLE, 2, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLK_DTO, ENABLE, 3, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLKDTO, ENABLE_STATUS, 0, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLKDTO, ENABLE_STATUS, 1, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLKDTO, ENABLE_STATUS, 2, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, DTBCLKDTO, ENABLE_STATUS, 3, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, PIPE, DTO_SRC_SEL, 0, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, PIPE, DTO_SRC_SEL, 1, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, PIPE, DTO_SRC_SEL, 2, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, PIPE, DTO_SRC_SEL, 3, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, OTG, ADD_PIXEL, 0, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, OTG, ADD_PIXEL, 1, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, OTG, ADD_PIXEL, 2, mask_sh),\
+	DCCG_SFII(OTG, PIXEL_RATE_CNTL, OTG, ADD_PIXEL, 3, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG0_PIXEL_RATE_DIVK1, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG0_PIXEL_RATE_DIVK2, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG1_PIXEL_RATE_DIVK1, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG1_PIXEL_RATE_DIVK2, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG2_PIXEL_RATE_DIVK1, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG2_PIXEL_RATE_DIVK2, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG3_PIXEL_RATE_DIVK1, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG3_PIXEL_RATE_DIVK2, mask_sh),\
+	DCCG_SF(OTG_PIXEL_RATE_DIV, OTG3_PIXEL_RATE_DIVK2, mask_sh),\
+	DCCG_SF(DTBCLK_P_CNTL, DTBCLK_P0_SRC_SEL, mask_sh),\
+	DCCG_SF(DTBCLK_P_CNTL, DTBCLK_P0_EN, mask_sh),\
+	DCCG_SF(DTBCLK_P_CNTL, DTBCLK_P1_SRC_SEL, mask_sh),\
+	DCCG_SF(DTBCLK_P_CNTL, DTBCLK_P1_EN, mask_sh),\
+	DCCG_SF(DTBCLK_P_CNTL, DTBCLK_P2_SRC_SEL, mask_sh),\
+	DCCG_SF(DTBCLK_P_CNTL, DTBCLK_P2_EN, mask_sh),\
+	DCCG_SF(DTBCLK_P_CNTL, DTBCLK_P3_SRC_SEL, mask_sh),\
+	DCCG_SF(DTBCLK_P_CNTL, DTBCLK_P3_EN, mask_sh),\
+	DCCG_SF(DCCG_AUDIO_DTO_SOURCE, DCCG_AUDIO_DTO0_SOURCE_SEL, mask_sh)
+
+
+struct dccg *dccg32_create(
+	struct dc_context *ctx,
+	const struct dccg_registers *regs,
+	const struct dccg_shift *dccg_shift,
+	const struct dccg_mask *dccg_mask);
+
+#endif //__DCN32_DCCG_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
new file mode 100644
index 000000000000..7170a9aa82a4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.c
@@ -0,0 +1,283 @@
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
+#include "reg_helper.h"
+
+#include "core_types.h"
+#include "link_encoder.h"
+#include "dcn31/dcn31_dio_link_encoder.h"
+#include "dcn32_dio_link_encoder.h"
+#include "stream_encoder.h"
+#include "i2caux_interface.h"
+#include "dc_bios_types.h"
+
+#include "gpio_service_interface.h"
+
+#ifndef MIN
+#define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
+#endif
+
+#define CTX \
+	enc10->base.ctx
+#define DC_LOGGER \
+	enc10->base.ctx->logger
+
+#define REG(reg)\
+	(enc10->link_regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	enc10->link_shift->field_name, enc10->link_mask->field_name
+
+#define AUX_REG(reg)\
+	(enc10->aux_regs->reg)
+
+#define AUX_REG_READ(reg_name) \
+		dm_read_reg(CTX, AUX_REG(reg_name))
+
+#define AUX_REG_WRITE(reg_name, val) \
+			dm_write_reg(CTX, AUX_REG(reg_name), val)
+
+
+void enc32_hw_init(struct link_encoder *enc)
+{
+	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
+
+/*
+	00 - DP_AUX_DPHY_RX_DETECTION_THRESHOLD__1to2 : 1/2
+	01 - DP_AUX_DPHY_RX_DETECTION_THRESHOLD__3to4 : 3/4
+	02 - DP_AUX_DPHY_RX_DETECTION_THRESHOLD__7to8 : 7/8
+	03 - DP_AUX_DPHY_RX_DETECTION_THRESHOLD__15to16 : 15/16
+	04 - DP_AUX_DPHY_RX_DETECTION_THRESHOLD__31to32 : 31/32
+	05 - DP_AUX_DPHY_RX_DETECTION_THRESHOLD__63to64 : 63/64
+	06 - DP_AUX_DPHY_RX_DETECTION_THRESHOLD__127to128 : 127/128
+	07 - DP_AUX_DPHY_RX_DETECTION_THRESHOLD__255to256 : 255/256
+*/
+
+/*
+	AUX_REG_UPDATE_5(AUX_DPHY_RX_CONTROL0,
+	AUX_RX_START_WINDOW = 1 [6:4]
+	AUX_RX_RECEIVE_WINDOW = 1 default is 2 [10:8]
+	AUX_RX_HALF_SYM_DETECT_LEN  = 1 [13:12] default is 1
+	AUX_RX_TRANSITION_FILTER_EN = 1 [16] default is 1
+	AUX_RX_ALLOW_BELOW_THRESHOLD_PHASE_DETECT [17] is 0  default is 0
+	AUX_RX_ALLOW_BELOW_THRESHOLD_START [18] is 1  default is 1
+	AUX_RX_ALLOW_BELOW_THRESHOLD_STOP [19] is 1  default is 1
+	AUX_RX_PHASE_DETECT_LEN,  [21,20] = 0x3 default is 3
+	AUX_RX_DETECTION_THRESHOLD [30:28] = 1
+*/
+	AUX_REG_WRITE(AUX_DPHY_RX_CONTROL0, 0x103d1110);
+
+	AUX_REG_WRITE(AUX_DPHY_TX_CONTROL, 0x21c7a);
+
+	//AUX_DPHY_TX_REF_CONTROL'AUX_TX_REF_DIV HW default is 0x32;
+	// Set AUX_TX_REF_DIV Divider to generate 2 MHz reference from refclk
+	// 27MHz -> 0xd
+	// 100MHz -> 0x32
+	// 48MHz -> 0x18
+
+	// Set TMDS_CTL0 to 1.  This is a legacy setting.
+	REG_UPDATE(TMDS_CTL_BITS, TMDS_CTL0, 1);
+
+	dcn10_aux_initialize(enc10);
+}
+
+
+void dcn32_link_encoder_enable_dp_output(
+	struct link_encoder *enc,
+	const struct dc_link_settings *link_settings,
+	enum clock_source_id clock_source)
+{
+	if (!enc->ctx->dc->debug.avoid_vbios_exec_table) {
+		dcn10_link_encoder_enable_dp_output(enc, link_settings, clock_source);
+		return;
+	}
+}
+
+bool dcn32_link_encoder_is_in_alt_mode(struct link_encoder *enc)
+{
+	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
+	uint32_t dp_alt_mode_disable = 0;
+	bool is_usb_c_alt_mode = false;
+
+	if (enc->features.flags.bits.DP_IS_USB_C) {
+		/* if value == 1 alt mode is disabled, otherwise it is enabled */
+		//REG_GET(RDPCSTX_PHY_CNTL6, RDPCS_PHY_DPALT_DISABLE, &dp_alt_mode_disable);
+		is_usb_c_alt_mode = (dp_alt_mode_disable == 0);
+	}
+
+	return is_usb_c_alt_mode;
+}
+
+void dcn32_link_encoder_get_max_link_cap(struct link_encoder *enc,
+	struct dc_link_settings *link_settings)
+{
+	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
+	uint32_t is_in_usb_c_dp4_mode = 0;
+
+	dcn10_link_encoder_get_max_link_cap(enc, link_settings);
+
+	/* in usb c dp2 mode, max lane count is 2 */
+	if (enc->funcs->is_in_alt_mode && enc->funcs->is_in_alt_mode(enc)) {
+//		REG_GET(RDPCSTX_PHY_CNTL6, RDPCS_PHY_DPALT_DP4, &is_in_usb_c_dp4_mode);
+		if (!is_in_usb_c_dp4_mode)
+			link_settings->lane_count = MIN(LANE_COUNT_TWO, link_settings->lane_count);
+	}
+
+}
+
+static const struct link_encoder_funcs dcn32_link_enc_funcs = {
+	.read_state = link_enc2_read_state,
+	.validate_output_with_stream =
+			dcn30_link_encoder_validate_output_with_stream,
+	.hw_init = enc32_hw_init,
+	.setup = dcn10_link_encoder_setup,
+	.enable_tmds_output = dcn10_link_encoder_enable_tmds_output,
+	.enable_dp_output = dcn32_link_encoder_enable_dp_output,
+	.enable_dp_mst_output = dcn10_link_encoder_enable_dp_mst_output,
+	.disable_output = dcn10_link_encoder_disable_output,
+	.dp_set_lane_settings = dcn10_link_encoder_dp_set_lane_settings,
+	.dp_set_phy_pattern = dcn10_link_encoder_dp_set_phy_pattern,
+	.update_mst_stream_allocation_table =
+		dcn10_link_encoder_update_mst_stream_allocation_table,
+	.psr_program_dp_dphy_fast_training =
+			dcn10_psr_program_dp_dphy_fast_training,
+	.psr_program_secondary_packet = dcn10_psr_program_secondary_packet,
+	.connect_dig_be_to_fe = dcn10_link_encoder_connect_dig_be_to_fe,
+	.enable_hpd = dcn10_link_encoder_enable_hpd,
+	.disable_hpd = dcn10_link_encoder_disable_hpd,
+	.is_dig_enabled = dcn10_is_dig_enabled,
+	.destroy = dcn10_link_encoder_destroy,
+	.fec_set_enable = enc2_fec_set_enable,
+	.fec_set_ready = enc2_fec_set_ready,
+	.fec_is_active = enc2_fec_is_active,
+	.get_dig_frontend = dcn10_get_dig_frontend,
+	.get_dig_mode = dcn10_get_dig_mode,
+	.is_in_alt_mode = dcn32_link_encoder_is_in_alt_mode,
+	.get_max_link_cap = dcn32_link_encoder_get_max_link_cap,
+	.set_dio_phy_mux = dcn31_link_encoder_set_dio_phy_mux,
+};
+
+void dcn32_link_encoder_construct(
+	struct dcn20_link_encoder *enc20,
+	const struct encoder_init_data *init_data,
+	const struct encoder_feature_support *enc_features,
+	const struct dcn10_link_enc_registers *link_regs,
+	const struct dcn10_link_enc_aux_registers *aux_regs,
+	const struct dcn10_link_enc_hpd_registers *hpd_regs,
+	const struct dcn10_link_enc_shift *link_shift,
+	const struct dcn10_link_enc_mask *link_mask)
+{
+	struct bp_connector_speed_cap_info bp_cap_info = {0};
+	const struct dc_vbios_funcs *bp_funcs = init_data->ctx->dc_bios->funcs;
+	enum bp_result result = BP_RESULT_OK;
+	struct dcn10_link_encoder *enc10 = &enc20->enc10;
+
+	enc10->base.funcs = &dcn32_link_enc_funcs;
+	enc10->base.ctx = init_data->ctx;
+	enc10->base.id = init_data->encoder;
+
+	enc10->base.hpd_source = init_data->hpd_source;
+	enc10->base.connector = init_data->connector;
+
+	enc10->base.preferred_engine = ENGINE_ID_UNKNOWN;
+
+	enc10->base.features = *enc_features;
+
+	enc10->base.transmitter = init_data->transmitter;
+
+	/* set the flag to indicate whether driver poll the I2C data pin
+	 * while doing the DP sink detect
+	 */
+
+/*	if (dal_adapter_service_is_feature_supported(as,
+		FEATURE_DP_SINK_DETECT_POLL_DATA_PIN))
+		enc10->base.features.flags.bits.
+			DP_SINK_DETECT_POLL_DATA_PIN = true;*/
+
+	enc10->base.output_signals =
+		SIGNAL_TYPE_DVI_SINGLE_LINK |
+		SIGNAL_TYPE_DVI_DUAL_LINK |
+		SIGNAL_TYPE_LVDS |
+		SIGNAL_TYPE_DISPLAY_PORT |
+		SIGNAL_TYPE_DISPLAY_PORT_MST |
+		SIGNAL_TYPE_EDP |
+		SIGNAL_TYPE_HDMI_TYPE_A;
+
+	enc10->link_regs = link_regs;
+	enc10->aux_regs = aux_regs;
+	enc10->hpd_regs = hpd_regs;
+	enc10->link_shift = link_shift;
+	enc10->link_mask = link_mask;
+
+	switch (enc10->base.transmitter) {
+	case TRANSMITTER_UNIPHY_A:
+		enc10->base.preferred_engine = ENGINE_ID_DIGA;
+	break;
+	case TRANSMITTER_UNIPHY_B:
+		enc10->base.preferred_engine = ENGINE_ID_DIGB;
+	break;
+	case TRANSMITTER_UNIPHY_C:
+		enc10->base.preferred_engine = ENGINE_ID_DIGC;
+	break;
+	case TRANSMITTER_UNIPHY_D:
+		enc10->base.preferred_engine = ENGINE_ID_DIGD;
+	break;
+	case TRANSMITTER_UNIPHY_E:
+		enc10->base.preferred_engine = ENGINE_ID_DIGE;
+	break;
+	default:
+		ASSERT_CRITICAL(false);
+		enc10->base.preferred_engine = ENGINE_ID_UNKNOWN;
+	}
+
+	/* default to one to mirror Windows behavior */
+	enc10->base.features.flags.bits.HDMI_6GB_EN = 1;
+
+	if (bp_funcs->get_connector_speed_cap_info)
+		result = bp_funcs->get_connector_speed_cap_info(enc10->base.ctx->dc_bios,
+						enc10->base.connector, &bp_cap_info);
+
+	/* Override features with DCE-specific values */
+	if (result == BP_RESULT_OK) {
+		enc10->base.features.flags.bits.IS_HBR2_CAPABLE =
+				bp_cap_info.DP_HBR2_EN;
+		enc10->base.features.flags.bits.IS_HBR3_CAPABLE =
+				bp_cap_info.DP_HBR3_EN;
+		enc10->base.features.flags.bits.HDMI_6GB_EN = bp_cap_info.HDMI_6GB_EN;
+		enc10->base.features.flags.bits.IS_DP2_CAPABLE = 1;
+		enc10->base.features.flags.bits.IS_UHBR10_CAPABLE = bp_cap_info.DP_UHBR10_EN;
+		enc10->base.features.flags.bits.IS_UHBR13_5_CAPABLE = bp_cap_info.DP_UHBR13_5_EN;
+		enc10->base.features.flags.bits.IS_UHBR20_CAPABLE = bp_cap_info.DP_UHBR20_EN;
+	} else {
+		DC_LOG_WARNING("%s: Failed to get encoder_cap_info from VBIOS with error code %d!\n",
+				__func__,
+				result);
+	}
+	if (enc10->base.ctx->dc->debug.hdmi20_disable) {
+		enc10->base.features.flags.bits.HDMI_6GB_EN = 0;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.h
new file mode 100644
index 000000000000..e880b76d5f25
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_link_encoder.h
@@ -0,0 +1,42 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+#ifndef __DC_LINK_ENCODER__DCN32_H__
+#define __DC_LINK_ENCODER__DCN32_H__
+
+#include "dcn30/dcn30_dio_link_encoder.h"
+
+void dcn32_link_encoder_construct(
+	struct dcn20_link_encoder *enc20,
+	const struct encoder_init_data *init_data,
+	const struct encoder_feature_support *enc_features,
+	const struct dcn10_link_enc_registers *link_regs,
+	const struct dcn10_link_enc_aux_registers *aux_regs,
+	const struct dcn10_link_enc_hpd_registers *hpd_regs,
+	const struct dcn10_link_enc_shift *link_shift,
+	const struct dcn10_link_enc_mask *link_mask);
+
+
+#endif /* __DC_LINK_ENCODER__DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
new file mode 100644
index 000000000000..62532da94913
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.c
@@ -0,0 +1,427 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+#include "dc_bios_types.h"
+#include "dcn30/dcn30_dio_stream_encoder.h"
+#include "dcn32_dio_stream_encoder.h"
+#include "reg_helper.h"
+#include "hw_shared.h"
+#include "inc/link_dpcd.h"
+#include "dpcd_defs.h"
+
+#define DC_LOGGER \
+		enc1->base.ctx->logger
+
+#define REG(reg)\
+	(enc1->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	enc1->se_shift->field_name, enc1->se_mask->field_name
+
+#define VBI_LINE_0 0
+#define HDMI_CLOCK_CHANNEL_RATE_MORE_340M 340000
+
+#define CTX \
+	enc1->base.ctx
+
+
+
+static void enc32_dp_set_odm_combine(
+	struct stream_encoder *enc,
+	bool odm_combine)
+{
+	//struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	//TODO: REG_UPDATE(DP_PIXEL_FORMAT, DP_PIXEL_COMBINE, odm_combine);
+}
+
+/* setup stream encoder in dvi mode */
+void enc32_stream_encoder_dvi_set_stream_attribute(
+	struct stream_encoder *enc,
+	struct dc_crtc_timing *crtc_timing,
+	bool is_dual_link)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	if (!enc->ctx->dc->debug.avoid_vbios_exec_table) {
+		struct bp_encoder_control cntl = {0};
+
+		cntl.action = ENCODER_CONTROL_SETUP;
+		cntl.engine_id = enc1->base.id;
+		cntl.signal = is_dual_link ?
+			SIGNAL_TYPE_DVI_DUAL_LINK : SIGNAL_TYPE_DVI_SINGLE_LINK;
+		cntl.enable_dp_audio = false;
+		cntl.pixel_clock = crtc_timing->pix_clk_100hz / 10;
+		cntl.lanes_number = (is_dual_link) ? LANE_COUNT_EIGHT : LANE_COUNT_FOUR;
+
+		if (enc1->base.bp->funcs->encoder_control(
+				enc1->base.bp, &cntl) != BP_RESULT_OK)
+			return;
+
+	} else {
+
+		//Set pattern for clock channel, default vlue 0x63 does not work
+		REG_UPDATE(DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, 0x1F);
+
+		//DIG_BE_TMDS_DVI_MODE : TMDS-DVI mode is already set in link_encoder_setup
+
+		//DIG_SOURCE_SELECT is already set in dig_connect_to_otg
+
+		/* DIG_START is removed from the register spec */
+	}
+
+	ASSERT(crtc_timing->pixel_encoding == PIXEL_ENCODING_RGB);
+	ASSERT(crtc_timing->display_color_depth == COLOR_DEPTH_888);
+	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
+}
+
+/* setup stream encoder in hdmi mode */
+static void enc32_stream_encoder_hdmi_set_stream_attribute(
+	struct stream_encoder *enc,
+	struct dc_crtc_timing *crtc_timing,
+	int actual_pix_clk_khz,
+	bool enable_audio)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	if (!enc->ctx->dc->debug.avoid_vbios_exec_table) {
+		struct bp_encoder_control cntl = {0};
+
+		cntl.action = ENCODER_CONTROL_SETUP;
+		cntl.engine_id = enc1->base.id;
+		cntl.signal = SIGNAL_TYPE_HDMI_TYPE_A;
+		cntl.enable_dp_audio = enable_audio;
+		cntl.pixel_clock = actual_pix_clk_khz;
+		cntl.lanes_number = LANE_COUNT_FOUR;
+
+		if (enc1->base.bp->funcs->encoder_control(
+				enc1->base.bp, &cntl) != BP_RESULT_OK)
+			return;
+
+	} else {
+
+		//Set pattern for clock channel, default vlue 0x63 does not work
+		REG_UPDATE(DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, 0x1F);
+
+		//DIG_BE_TMDS_HDMI_MODE : TMDS-HDMI mode is already set in link_encoder_setup
+
+		//DIG_SOURCE_SELECT is already set in dig_connect_to_otg
+
+		/* DIG_START is removed from the register spec */
+	}
+
+	/* Configure pixel encoding */
+	enc1_stream_encoder_set_stream_attribute_helper(enc1, crtc_timing);
+
+	/* setup HDMI engine */
+	REG_UPDATE_6(HDMI_CONTROL,
+		HDMI_PACKET_GEN_VERSION, 1,
+		HDMI_KEEPOUT_MODE, 1,
+		HDMI_DEEP_COLOR_ENABLE, 0,
+		HDMI_DATA_SCRAMBLE_EN, 0,
+		HDMI_NO_EXTRA_NULL_PACKET_FILLED, 1,
+		HDMI_CLOCK_CHANNEL_RATE, 0);
+
+	/* Configure color depth */
+	switch (crtc_timing->display_color_depth) {
+	case COLOR_DEPTH_888:
+		REG_UPDATE(HDMI_CONTROL, HDMI_DEEP_COLOR_DEPTH, 0);
+		break;
+	case COLOR_DEPTH_101010:
+		if (crtc_timing->pixel_encoding == PIXEL_ENCODING_YCBCR422) {
+			REG_UPDATE_2(HDMI_CONTROL,
+					HDMI_DEEP_COLOR_DEPTH, 1,
+					HDMI_DEEP_COLOR_ENABLE, 0);
+		} else {
+			REG_UPDATE_2(HDMI_CONTROL,
+					HDMI_DEEP_COLOR_DEPTH, 1,
+					HDMI_DEEP_COLOR_ENABLE, 1);
+			}
+		break;
+	case COLOR_DEPTH_121212:
+		if (crtc_timing->pixel_encoding == PIXEL_ENCODING_YCBCR422) {
+			REG_UPDATE_2(HDMI_CONTROL,
+					HDMI_DEEP_COLOR_DEPTH, 2,
+					HDMI_DEEP_COLOR_ENABLE, 0);
+		} else {
+			REG_UPDATE_2(HDMI_CONTROL,
+					HDMI_DEEP_COLOR_DEPTH, 2,
+					HDMI_DEEP_COLOR_ENABLE, 1);
+			}
+		break;
+	case COLOR_DEPTH_161616:
+		REG_UPDATE_2(HDMI_CONTROL,
+				HDMI_DEEP_COLOR_DEPTH, 3,
+				HDMI_DEEP_COLOR_ENABLE, 1);
+		break;
+	default:
+		break;
+	}
+
+	if (actual_pix_clk_khz >= HDMI_CLOCK_CHANNEL_RATE_MORE_340M) {
+		/* enable HDMI data scrambler
+		 * HDMI_CLOCK_CHANNEL_RATE_MORE_340M
+		 * Clock channel frequency is 1/4 of character rate.
+		 */
+		REG_UPDATE_2(HDMI_CONTROL,
+			HDMI_DATA_SCRAMBLE_EN, 1,
+			HDMI_CLOCK_CHANNEL_RATE, 1);
+	} else if (crtc_timing->flags.LTE_340MCSC_SCRAMBLE) {
+
+		/* TODO: New feature for DCE11, still need to implement */
+
+		/* enable HDMI data scrambler
+		 * HDMI_CLOCK_CHANNEL_FREQ_EQUAL_TO_CHAR_RATE
+		 * Clock channel frequency is the same
+		 * as character rate
+		 */
+		REG_UPDATE_2(HDMI_CONTROL,
+			HDMI_DATA_SCRAMBLE_EN, 1,
+			HDMI_CLOCK_CHANNEL_RATE, 0);
+	}
+
+
+	/* Enable transmission of General Control packet on every frame */
+	REG_UPDATE_3(HDMI_VBI_PACKET_CONTROL,
+		HDMI_GC_CONT, 1,
+		HDMI_GC_SEND, 1,
+		HDMI_NULL_SEND, 1);
+
+	/* Disable Audio Content Protection packet transmission */
+	REG_UPDATE(HDMI_VBI_PACKET_CONTROL, HDMI_ACP_SEND, 0);
+
+	/* following belongs to audio */
+	/* Enable Audio InfoFrame packet transmission. */
+	REG_UPDATE(HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, 1);
+
+	/* update double-buffered AUDIO_INFO registers immediately */
+	ASSERT(enc->afmt);
+	enc->afmt->funcs->audio_info_immediate_update(enc->afmt);
+
+	/* Select line number on which to send Audio InfoFrame packets */
+	REG_UPDATE(HDMI_INFOFRAME_CONTROL1, HDMI_AUDIO_INFO_LINE,
+				VBI_LINE_0 + 2);
+
+	/* set HDMI GC AVMUTE */
+	REG_UPDATE(HDMI_GC, HDMI_GC_AVMUTE, 0);
+}
+
+
+
+static bool is_two_pixels_per_containter(const struct dc_crtc_timing *timing)
+{
+	bool two_pix = timing->pixel_encoding == PIXEL_ENCODING_YCBCR420;
+
+	two_pix = two_pix || (timing->flags.DSC && timing->pixel_encoding == PIXEL_ENCODING_YCBCR422
+			&& !timing->dsc_cfg.ycbcr422_simple);
+	return two_pix;
+}
+
+static void enc32_stream_encoder_dp_unblank(
+        struct dc_link *link,
+		struct stream_encoder *enc,
+		const struct encoder_unblank_param *param)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	if (param->link_settings.link_rate != LINK_RATE_UNKNOWN) {
+		uint32_t n_vid = 0x8000;
+		uint32_t m_vid;
+		uint32_t n_multiply = 0;
+		uint64_t m_vid_l = n_vid;
+
+		/* YCbCr 4:2:0 : Computed VID_M will be 2X the input rate */
+		if (is_two_pixels_per_containter(&param->timing) || param->opp_cnt > 1) {
+			/*this logic should be the same in get_pixel_clock_parameters() */
+			n_multiply = 1;
+		}
+		/* M / N = Fstream / Flink
+		 * m_vid / n_vid = pixel rate / link rate
+		 */
+
+		m_vid_l *= param->timing.pix_clk_100hz / 10;
+		m_vid_l = div_u64(m_vid_l,
+			param->link_settings.link_rate
+				* LINK_RATE_REF_FREQ_IN_KHZ);
+
+		m_vid = (uint32_t) m_vid_l;
+
+		/* enable auto measurement */
+
+		REG_UPDATE(DP_VID_TIMING, DP_VID_M_N_GEN_EN, 0);
+
+		/* auto measurement need 1 full 0x8000 symbol cycle to kick in,
+		 * therefore program initial value for Mvid and Nvid
+		 */
+
+		REG_UPDATE(DP_VID_N, DP_VID_N, n_vid);
+
+		REG_UPDATE(DP_VID_M, DP_VID_M, m_vid);
+
+		REG_UPDATE_2(DP_VID_TIMING,
+				DP_VID_M_N_GEN_EN, 1,
+				DP_VID_N_MUL, n_multiply);
+	}
+
+	/* make sure stream is disabled before resetting steer fifo */
+	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, false);
+	REG_WAIT(DP_VID_STREAM_CNTL, DP_VID_STREAM_STATUS, 0, 10, 5000);
+
+	/* DIG_START is removed from the register spec */
+
+	/* switch DP encoder to CRTC data, but reset it the fifo first. It may happen
+	 * that it overflows during mode transition, and sometimes doesn't recover.
+	 */
+	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, 1);
+	udelay(10);
+
+	REG_UPDATE(DP_STEER_FIFO, DP_STEER_FIFO_RESET, 0);
+
+	/* wait 100us for DIG/DP logic to prime
+	 * (i.e. a few video lines)
+	 */
+	udelay(100);
+
+	/* the hardware would start sending video at the start of the next DP
+	 * frame (i.e. rising edge of the vblank).
+	 * NOTE: We used to program DP_VID_STREAM_DIS_DEFER = 2 here, but this
+	 * register has no effect on enable transition! HW always guarantees
+	 * VID_STREAM enable at start of next frame, and this is not
+	 * programmable
+	 */
+
+	REG_UPDATE(DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, true);
+
+	dp_source_sequence_trace(link, DPCD_SOURCE_SEQ_AFTER_ENABLE_DP_VID_STREAM);
+}
+
+/* Set DSC-related configuration.
+ *   dsc_mode: 0 disables DSC, other values enable DSC in specified format
+ *   sc_bytes_per_pixel: DP_DSC_BYTES_PER_PIXEL removed in DCN32
+ *   dsc_slice_width: DP_DSC_SLICE_WIDTH removed in DCN32
+ */
+static void enc32_dp_set_dsc_config(struct stream_encoder *enc,
+					enum optc_dsc_mode dsc_mode,
+					uint32_t dsc_bytes_per_pixel,
+					uint32_t dsc_slice_width)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	REG_UPDATE(DP_DSC_CNTL,	DP_DSC_MODE, dsc_mode);
+}
+
+/* this function read dsc related register fields to be logged later in dcn10_log_hw_state
+ * into a dcn_dsc_state struct.
+ */
+static void enc32_read_state(struct stream_encoder *enc, struct enc_state *s)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	//if dsc is enabled, continue to read
+	REG_GET(DP_DSC_CNTL, DP_DSC_MODE, &s->dsc_mode);
+	if (s->dsc_mode) {
+		REG_GET(DP_GSP11_CNTL, DP_SEC_GSP11_LINE_NUM, &s->sec_gsp_pps_line_num);
+
+		REG_GET(DP_MSA_VBID_MISC, DP_VBID6_LINE_REFERENCE, &s->vbid6_line_reference);
+		REG_GET(DP_MSA_VBID_MISC, DP_VBID6_LINE_NUM, &s->vbid6_line_num);
+
+		REG_GET(DP_GSP11_CNTL, DP_SEC_GSP11_ENABLE, &s->sec_gsp_pps_enable);
+		REG_GET(DP_SEC_CNTL, DP_SEC_STREAM_ENABLE, &s->sec_stream_enable);
+	}
+}
+
+
+static const struct stream_encoder_funcs dcn32_str_enc_funcs = {
+	.dp_set_odm_combine =
+		enc32_dp_set_odm_combine,
+	.dp_set_stream_attribute =
+		enc2_stream_encoder_dp_set_stream_attribute,
+	.hdmi_set_stream_attribute =
+		enc32_stream_encoder_hdmi_set_stream_attribute,
+	.dvi_set_stream_attribute =
+		enc32_stream_encoder_dvi_set_stream_attribute,
+	.set_throttled_vcp_size =
+		enc1_stream_encoder_set_throttled_vcp_size,
+	.update_hdmi_info_packets =
+		enc3_stream_encoder_update_hdmi_info_packets,
+	.stop_hdmi_info_packets =
+		enc3_stream_encoder_stop_hdmi_info_packets,
+	.update_dp_info_packets =
+		enc3_stream_encoder_update_dp_info_packets,
+	.stop_dp_info_packets =
+		enc1_stream_encoder_stop_dp_info_packets,
+	.reset_fifo =
+		enc1_stream_encoder_reset_fifo,
+	.dp_blank =
+		enc1_stream_encoder_dp_blank,
+	.dp_unblank =
+		enc32_stream_encoder_dp_unblank,
+	.audio_mute_control = enc3_audio_mute_control,
+
+	.dp_audio_setup = enc3_se_dp_audio_setup,
+	.dp_audio_enable = enc3_se_dp_audio_enable,
+	.dp_audio_disable = enc1_se_dp_audio_disable,
+
+	.hdmi_audio_setup = enc3_se_hdmi_audio_setup,
+	.hdmi_audio_disable = enc1_se_hdmi_audio_disable,
+	.setup_stereo_sync  = enc1_setup_stereo_sync,
+	.set_avmute = enc1_stream_encoder_set_avmute,
+	.dig_connect_to_otg = enc1_dig_connect_to_otg,
+	.dig_source_otg = enc1_dig_source_otg,
+
+	.dp_get_pixel_format  = enc1_stream_encoder_dp_get_pixel_format,
+
+	.enc_read_state = enc32_read_state,
+	.dp_set_dsc_config = enc32_dp_set_dsc_config,
+	.dp_set_dsc_pps_info_packet = enc3_dp_set_dsc_pps_info_packet,
+	.set_dynamic_metadata = enc2_set_dynamic_metadata,
+	.hdmi_reset_stream_attribute = enc1_reset_hdmi_stream_attribute,
+};
+
+void dcn32_dio_stream_encoder_construct(
+	struct dcn10_stream_encoder *enc1,
+	struct dc_context *ctx,
+	struct dc_bios *bp,
+	enum engine_id eng_id,
+	struct vpg *vpg,
+	struct afmt *afmt,
+	const struct dcn10_stream_enc_registers *regs,
+	const struct dcn10_stream_encoder_shift *se_shift,
+	const struct dcn10_stream_encoder_mask *se_mask)
+{
+	enc1->base.funcs = &dcn32_str_enc_funcs;
+	enc1->base.ctx = ctx;
+	enc1->base.id = eng_id;
+	enc1->base.bp = bp;
+	enc1->base.vpg = vpg;
+	enc1->base.afmt = afmt;
+	enc1->regs = regs;
+	enc1->se_shift = se_shift;
+	enc1->se_mask = se_mask;
+	enc1->base.stream_enc_inst = vpg->inst;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h
new file mode 100644
index 000000000000..7241080b1553
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dio_stream_encoder.h
@@ -0,0 +1,254 @@
+/*
+ * Copyright 2021 - Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+#ifndef __DC_DIO_STREAM_ENCODER_DCN32_H__
+#define __DC_DIO_STREAM_ENCODER_DCN32_H__
+
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+#include "stream_encoder.h"
+#include "dcn20/dcn20_stream_encoder.h"
+
+#define SE_DCN32_REG_LIST(id)\
+	SRI(AFMT_CNTL, DIG, id), \
+	SRI(DIG_FE_CNTL, DIG, id), \
+	SRI(HDMI_CONTROL, DIG, id), \
+	SRI(HDMI_DB_CONTROL, DIG, id), \
+	SRI(HDMI_GC, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL0, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL1, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL2, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL3, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL4, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL5, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL6, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL7, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL8, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL9, DIG, id), \
+	SRI(HDMI_GENERIC_PACKET_CONTROL10, DIG, id), \
+	SRI(HDMI_INFOFRAME_CONTROL0, DIG, id), \
+	SRI(HDMI_INFOFRAME_CONTROL1, DIG, id), \
+	SRI(HDMI_VBI_PACKET_CONTROL, DIG, id), \
+	SRI(HDMI_AUDIO_PACKET_CONTROL, DIG, id),\
+	SRI(HDMI_ACR_PACKET_CONTROL, DIG, id),\
+	SRI(HDMI_ACR_32_0, DIG, id),\
+	SRI(HDMI_ACR_32_1, DIG, id),\
+	SRI(HDMI_ACR_44_0, DIG, id),\
+	SRI(HDMI_ACR_44_1, DIG, id),\
+	SRI(HDMI_ACR_48_0, DIG, id),\
+	SRI(HDMI_ACR_48_1, DIG, id),\
+	SRI(DP_DB_CNTL, DP, id), \
+	SRI(DP_MSA_MISC, DP, id), \
+	SRI(DP_MSA_VBID_MISC, DP, id), \
+	SRI(DP_MSA_COLORIMETRY, DP, id), \
+	SRI(DP_MSA_TIMING_PARAM1, DP, id), \
+	SRI(DP_MSA_TIMING_PARAM2, DP, id), \
+	SRI(DP_MSA_TIMING_PARAM3, DP, id), \
+	SRI(DP_MSA_TIMING_PARAM4, DP, id), \
+	SRI(DP_MSE_RATE_CNTL, DP, id), \
+	SRI(DP_MSE_RATE_UPDATE, DP, id), \
+	SRI(DP_PIXEL_FORMAT, DP, id), \
+	SRI(DP_SEC_CNTL, DP, id), \
+	SRI(DP_SEC_CNTL2, DP, id), \
+	SRI(DP_SEC_CNTL6, DP, id), \
+	SRI(DP_STEER_FIFO, DP, id), \
+	SRI(DP_VID_M, DP, id), \
+	SRI(DP_VID_N, DP, id), \
+	SRI(DP_VID_STREAM_CNTL, DP, id), \
+	SRI(DP_VID_TIMING, DP, id), \
+	SRI(DP_SEC_AUD_N, DP, id), \
+	SRI(DP_SEC_TIMESTAMP, DP, id), \
+	SRI(DP_DSC_CNTL, DP, id), \
+	SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
+	SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
+	SRI(DP_SEC_FRAMING4, DP, id), \
+	SRI(DP_GSP11_CNTL, DP, id), \
+	SRI(DME_CONTROL, DME, id),\
+	SRI(DP_SEC_METADATA_TRANSMISSION, DP, id), \
+	SRI(HDMI_METADATA_PACKET_CONTROL, DIG, id), \
+	SRI(DIG_FE_CNTL, DIG, id), \
+	SRI(DIG_CLOCK_PATTERN, DIG, id)
+
+
+#define SE_COMMON_MASK_SH_LIST_DCN32_BASE(mask_sh)\
+	SE_SF(DP0_DP_PIXEL_FORMAT, DP_PIXEL_ENCODING, mask_sh),\
+	SE_SF(DP0_DP_PIXEL_FORMAT, DP_COMPONENT_DEPTH, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_PACKET_GEN_VERSION, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_KEEPOUT_MODE, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DEEP_COLOR_ENABLE, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DEEP_COLOR_DEPTH, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DATA_SCRAMBLE_EN, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_NO_EXTRA_NULL_PACKET_FILLED, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_GC_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_GC_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_NULL_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_INFOFRAME_CONTROL0, HDMI_AUDIO_INFO_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_INFOFRAME_CONTROL1, HDMI_AUDIO_INFO_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GC, HDMI_GC_AVMUTE, mask_sh),\
+	SE_SF(DP0_DP_MSE_RATE_CNTL, DP_MSE_RATE_X, mask_sh),\
+	SE_SF(DP0_DP_MSE_RATE_CNTL, DP_MSE_RATE_Y, mask_sh),\
+	SE_SF(DP0_DP_MSE_RATE_UPDATE, DP_MSE_RATE_UPDATE_PENDING, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP0_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_STREAM_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP1_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP2_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP3_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_MPG_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL1, DP_SEC_GSP5_LINE_REFERENCE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP4_SEND, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP4_SEND_PENDING, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL4, DP_SEC_GSP4_LINE_NUM, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL5, DP_SEC_GSP5_LINE_NUM, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP4_SEND_ANY_LINE, mask_sh),\
+	SE_SF(DP0_DP_VID_STREAM_CNTL, DP_VID_STREAM_DIS_DEFER, mask_sh),\
+	SE_SF(DP0_DP_VID_STREAM_CNTL, DP_VID_STREAM_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_VID_STREAM_CNTL, DP_VID_STREAM_STATUS, mask_sh),\
+	SE_SF(DP0_DP_STEER_FIFO, DP_STEER_FIFO_RESET, mask_sh),\
+	SE_SF(DP0_DP_VID_TIMING, DP_VID_M_N_GEN_EN, mask_sh),\
+	SE_SF(DP0_DP_VID_N, DP_VID_N, mask_sh),\
+	SE_SF(DP0_DP_VID_M, DP_VID_M, mask_sh),\
+	SE_SF(DIG0_HDMI_AUDIO_PACKET_CONTROL, HDMI_AUDIO_DELAY_EN, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_PACKET_CONTROL, HDMI_ACR_AUTO_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_PACKET_CONTROL, HDMI_ACR_SOURCE, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_PACKET_CONTROL, HDMI_ACR_AUDIO_PRIORITY, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_32_0, HDMI_ACR_CTS_32, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_32_1, HDMI_ACR_N_32, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_44_0, HDMI_ACR_CTS_44, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_44_1, HDMI_ACR_N_44, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_48_0, HDMI_ACR_CTS_48, mask_sh),\
+	SE_SF(DIG0_HDMI_ACR_48_1, HDMI_ACR_N_48, mask_sh),\
+	SE_SF(DP0_DP_SEC_AUD_N, DP_SEC_AUD_N, mask_sh),\
+	SE_SF(DP0_DP_SEC_TIMESTAMP, DP_SEC_TIMESTAMP_MODE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_ASP_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_ATP_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_AIP_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_ACM_ENABLE, mask_sh),\
+	SE_SF(DIG0_AFMT_CNTL, AFMT_AUDIO_CLOCK_EN, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_CLOCK_CHANNEL_RATE, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, TMDS_PIXEL_ENCODING, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, TMDS_COLOR_FORMAT, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_STEREOSYNC_SELECT, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_STEREOSYNC_GATE_EN, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP4_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP5_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP6_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL, DP_SEC_GSP7_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP7_SEND, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL6, DP_SEC_GSP7_LINE_NUM, mask_sh),\
+	SE_SF(DP0_DP_SEC_CNTL2, DP_SEC_GSP11_PPS, mask_sh),\
+	SE_SF(DP0_DP_GSP11_CNTL, DP_SEC_GSP11_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_GSP11_CNTL, DP_SEC_GSP11_LINE_NUM, mask_sh),\
+	SE_SF(DP0_DP_DB_CNTL, DP_DB_DISABLE, mask_sh),\
+	SE_SF(DP0_DP_MSA_COLORIMETRY, DP_MSA_MISC0, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM1, DP_MSA_HTOTAL, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM1, DP_MSA_VTOTAL, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM2, DP_MSA_HSTART, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM2, DP_MSA_VSTART, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM3, DP_MSA_HSYNCWIDTH, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM3, DP_MSA_HSYNCPOLARITY, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM3, DP_MSA_VSYNCWIDTH, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM3, DP_MSA_VSYNCPOLARITY, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM4, DP_MSA_HWIDTH, mask_sh),\
+	SE_SF(DP0_DP_MSA_TIMING_PARAM4, DP_MSA_VHEIGHT, mask_sh),\
+	SE_SF(DIG0_HDMI_DB_CONTROL, HDMI_DB_DISABLE, mask_sh),\
+	SE_SF(DP0_DP_VID_TIMING, DP_VID_N_MUL, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_SOURCE_SELECT, mask_sh), \
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC0_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC0_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC1_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC1_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC2_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC2_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC3_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC3_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC4_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC4_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC5_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC5_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC6_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC6_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC7_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL0, HDMI_GENERIC7_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC8_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC8_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC9_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC9_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC10_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC10_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC11_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC11_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC12_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC12_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC13_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC13_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC14_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL6, HDMI_GENERIC14_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL1, HDMI_GENERIC0_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL1, HDMI_GENERIC1_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL2, HDMI_GENERIC2_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL2, HDMI_GENERIC3_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL3, HDMI_GENERIC4_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL3, HDMI_GENERIC5_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL4, HDMI_GENERIC6_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL4, HDMI_GENERIC7_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL7, HDMI_GENERIC8_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL7, HDMI_GENERIC9_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL8, HDMI_GENERIC10_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL8, HDMI_GENERIC11_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL9, HDMI_GENERIC12_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL9, HDMI_GENERIC13_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_GENERIC_PACKET_CONTROL10, HDMI_GENERIC14_LINE, mask_sh),\
+	SE_SF(DP0_DP_DSC_CNTL, DP_DSC_MODE, mask_sh),\
+	SE_SF(DP0_DP_MSA_VBID_MISC, DP_VBID6_LINE_REFERENCE, mask_sh),\
+	SE_SF(DP0_DP_MSA_VBID_MISC, DP_VBID6_LINE_NUM, mask_sh),\
+	SE_SF(DME0_DME_CONTROL, METADATA_ENGINE_EN, mask_sh),\
+	SE_SF(DME0_DME_CONTROL, METADATA_HUBP_REQUESTOR_ID, mask_sh),\
+	SE_SF(DME0_DME_CONTROL, METADATA_STREAM_TYPE, mask_sh),\
+	SE_SF(DP0_DP_SEC_METADATA_TRANSMISSION, DP_SEC_METADATA_PACKET_ENABLE, mask_sh),\
+	SE_SF(DP0_DP_SEC_METADATA_TRANSMISSION, DP_SEC_METADATA_PACKET_LINE_REFERENCE, mask_sh),\
+	SE_SF(DP0_DP_SEC_METADATA_TRANSMISSION, DP_SEC_METADATA_PACKET_LINE, mask_sh),\
+	SE_SF(DIG0_HDMI_METADATA_PACKET_CONTROL, HDMI_METADATA_PACKET_ENABLE, mask_sh),\
+	SE_SF(DIG0_HDMI_METADATA_PACKET_CONTROL, HDMI_METADATA_PACKET_LINE_REFERENCE, mask_sh),\
+	SE_SF(DIG0_HDMI_METADATA_PACKET_CONTROL, HDMI_METADATA_PACKET_LINE, mask_sh),\
+	SE_SF(DIG0_DIG_FE_CNTL, DOLBY_VISION_EN, mask_sh),\
+	SE_SF(DP0_DP_SEC_FRAMING4, DP_SST_SDP_SPLITTING, mask_sh),\
+	SE_SF(DIG0_DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, mask_sh)
+
+#define SE_COMMON_MASK_SH_LIST_DCN32(mask_sh)\
+	SE_COMMON_MASK_SH_LIST_DCN32_BASE(mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_ACP_SEND, mask_sh)
+
+void dcn32_dio_stream_encoder_construct(
+	struct dcn10_stream_encoder *enc1,
+	struct dc_context *ctx,
+	struct dc_bios *bp,
+	enum engine_id eng_id,
+	struct vpg *vpg,
+	struct afmt *afmt,
+	const struct dcn10_stream_enc_registers *regs,
+	const struct dcn10_stream_encoder_shift *se_shift,
+	const struct dcn10_stream_encoder_mask *se_mask);
+
+#endif /* __DC_DIO_STREAM_ENCODER_DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
new file mode 100644
index 000000000000..f349cbe2a0f0
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.c
@@ -0,0 +1,164 @@
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
+#include "dm_services.h"
+#include "core_types.h"
+#include "reg_helper.h"
+#include "dcn32_dpp.h"
+#include "basics/conversion.h"
+#include "dcn30/dcn30_cm_common.h"
+
+/* Compute the maximum number of lines that we can fit in the line buffer */
+void dscl32_calc_lb_num_partitions(
+		const struct scaler_data *scl_data,
+		enum lb_memory_config lb_config,
+		int *num_part_y,
+		int *num_part_c)
+{
+	int memory_line_size_y, memory_line_size_c, memory_line_size_a,
+	lb_memory_size, lb_memory_size_c, lb_memory_size_a, num_partitions_a;
+
+	int line_size = scl_data->viewport.width < scl_data->recout.width ?
+			scl_data->viewport.width : scl_data->recout.width;
+	int line_size_c = scl_data->viewport_c.width < scl_data->recout.width ?
+			scl_data->viewport_c.width : scl_data->recout.width;
+
+	if (line_size == 0)
+		line_size = 1;
+
+	if (line_size_c == 0)
+		line_size_c = 1;
+
+	memory_line_size_y = (line_size + 5) / 6; /* +5 to ceil */
+	memory_line_size_c = (line_size_c + 5) / 6; /* +5 to ceil */
+	memory_line_size_a = (line_size + 5) / 6; /* +5 to ceil */
+
+	if (lb_config == LB_MEMORY_CONFIG_1) {
+		lb_memory_size = 970;
+		lb_memory_size_c = 970;
+		lb_memory_size_a = 970;
+	} else if (lb_config == LB_MEMORY_CONFIG_2) {
+		lb_memory_size = 1290;
+		lb_memory_size_c = 1290;
+		lb_memory_size_a = 1290;
+	} else if (lb_config == LB_MEMORY_CONFIG_3) {
+		if (scl_data->viewport.width  == scl_data->h_active &&
+			scl_data->viewport.height == scl_data->v_active) {
+			/* 420 mode: luma using all 3 mem from Y, plus 3rd mem from Cr and Cb */
+			/* use increased LB size for calculation only if Scaler not enabled */
+			lb_memory_size = 970 + 1290 + 1170 + 1170 + 1170;
+			lb_memory_size_c = 970 + 1290;
+			lb_memory_size_a = 970 + 1290 + 1170;
+		} else {
+			/* 420 mode: luma using all 3 mem from Y, plus 3rd mem from Cr and Cb */
+			lb_memory_size = 970 + 1290 + 484 + 484 + 484;
+			lb_memory_size_c = 970 + 1290;
+			lb_memory_size_a = 970 + 1290 + 484;
+		}
+	} else {
+		if (scl_data->viewport.width  == scl_data->h_active &&
+			scl_data->viewport.height == scl_data->v_active) {
+			/* use increased LB size for calculation only if Scaler not enabled */
+			lb_memory_size = 970 + 1290 + 1170;
+			lb_memory_size_c = 970 + 1290 + 1170;
+			lb_memory_size_a = 970 + 1290 + 1170;
+		} else {
+			lb_memory_size = 970 + 1290 + 484;
+			lb_memory_size_c = 970 + 1290 + 484;
+			lb_memory_size_a = 970 + 1290 + 484;
+		}
+	}
+	*num_part_y = lb_memory_size / memory_line_size_y;
+	*num_part_c = lb_memory_size_c / memory_line_size_c;
+	num_partitions_a = lb_memory_size_a / memory_line_size_a;
+
+	if (scl_data->lb_params.alpha_en
+			&& (num_partitions_a < *num_part_y))
+		*num_part_y = num_partitions_a;
+
+	if (*num_part_y > 32)
+		*num_part_y = 32;
+	if (*num_part_c > 32)
+		*num_part_c = 32;
+}
+
+static struct dpp_funcs dcn32_dpp_funcs = {
+	.dpp_program_gamcor_lut		= dpp3_program_gamcor_lut,
+	.dpp_read_state				= dpp30_read_state,
+	.dpp_reset					= dpp_reset,
+	.dpp_set_scaler				= dpp1_dscl_set_scaler_manual_scale,
+	.dpp_get_optimal_number_of_taps	= dpp3_get_optimal_number_of_taps,
+	.dpp_set_gamut_remap		= dpp3_cm_set_gamut_remap,
+	.dpp_set_csc_adjustment		= NULL,
+	.dpp_set_csc_default		= NULL,
+	.dpp_program_regamma_pwl	= NULL,
+	.dpp_set_pre_degam			= dpp3_set_pre_degam,
+	.dpp_program_input_lut		= NULL,
+	.dpp_full_bypass			= dpp1_full_bypass,
+	.dpp_setup					= dpp3_cnv_setup,
+	.dpp_program_degamma_pwl	= NULL,
+	.dpp_program_cm_dealpha		= dpp3_program_cm_dealpha,
+	.dpp_program_cm_bias		= dpp3_program_cm_bias,
+
+	.dpp_program_blnd_lut		= NULL, // BLNDGAM is removed completely in DCN3.2 DPP
+	.dpp_program_shaper_lut		= NULL, // CM SHAPER block is removed in DCN3.2 DPP, (it is in MPCC, programmable before or after BLND)
+	.dpp_program_3dlut			= NULL, // CM 3DLUT block is removed in DCN3.2 DPP, (it is in MPCC, programmable before or after BLND)
+
+	.dpp_program_bias_and_scale	= NULL,
+	.dpp_cnv_set_alpha_keyer	= dpp2_cnv_set_alpha_keyer,
+	.set_cursor_attributes		= dpp3_set_cursor_attributes,
+	.set_cursor_position		= dpp1_set_cursor_position,
+	.set_optional_cursor_attributes	= dpp1_cnv_set_optional_cursor_attributes,
+	.dpp_dppclk_control			= dpp1_dppclk_control,
+	.dpp_set_hdr_multiplier		= dpp3_set_hdr_multiplier,
+};
+
+
+static struct dpp_caps dcn32_dpp_cap = {
+	.dscl_data_proc_format = DSCL_DATA_PRCESSING_FLOAT_FORMAT,
+	.max_lb_partitions = 31,
+	.dscl_calc_lb_num_partitions = dscl32_calc_lb_num_partitions,
+};
+
+bool dpp32_construct(
+	struct dcn3_dpp *dpp,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn3_dpp_registers *tf_regs,
+	const struct dcn3_dpp_shift *tf_shift,
+	const struct dcn3_dpp_mask *tf_mask)
+{
+	dpp->base.ctx = ctx;
+
+	dpp->base.inst = inst;
+	dpp->base.funcs = &dcn32_dpp_funcs;
+	dpp->base.caps = &dcn32_dpp_cap;
+
+	dpp->tf_regs = tf_regs;
+	dpp->tf_shift = tf_shift;
+	dpp->tf_mask = tf_mask;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.h
new file mode 100644
index 000000000000..572958d287eb
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_dpp.h
@@ -0,0 +1,38 @@
+/* Copyright 2021 Advanced Micro Devices, Inc.
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
+#ifndef __DCN32_DPP_H__
+#define __DCN32_DPP_H__
+
+#include "dcn20/dcn20_dpp.h"
+#include "dcn30/dcn30_dpp.h"
+
+bool dpp32_construct(struct dcn3_dpp *dpp3,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn3_dpp_registers *tf_regs,
+	const struct dcn3_dpp_shift *tf_shift,
+	const struct dcn3_dpp_mask *tf_mask);
+
+#endif /* __DCN32_DPP_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c
new file mode 100644
index 000000000000..4dbad8d4b4fc
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.c
@@ -0,0 +1,90 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ *  and/or sell copies of the Software, and to permit persons to whom the
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
+#include "dc_bios_types.h"
+#include "dcn31/dcn31_hpo_dp_link_encoder.h"
+#include "dcn32_hpo_dp_link_encoder.h"
+#include "reg_helper.h"
+#include "dc_link.h"
+#include "stream_encoder.h"
+
+#define DC_LOGGER \
+		enc3->base.ctx->logger
+
+#define REG(reg)\
+	(enc3->regs->reg)
+
+#undef FN
+#define FN(reg_name, field_name) \
+	enc3->hpo_le_shift->field_name, enc3->hpo_le_mask->field_name
+
+#define CTX \
+	enc3->base.ctx
+
+static bool dcn32_hpo_dp_link_enc_is_in_alt_mode(
+		struct hpo_dp_link_encoder *enc)
+{
+	struct dcn31_hpo_dp_link_encoder *enc3 = DCN3_1_HPO_DP_LINK_ENC_FROM_HPO_LINK_ENC(enc);
+	uint32_t dp_alt_mode_disable = 0;
+
+	ASSERT((enc->transmitter >= TRANSMITTER_UNIPHY_A) && (enc->transmitter <= TRANSMITTER_UNIPHY_E));
+
+	/* if value == 1 alt mode is disabled, otherwise it is enabled */
+	REG_GET(RDPCSTX_PHY_CNTL6[enc->transmitter], RDPCS_PHY_DPALT_DISABLE, &dp_alt_mode_disable);
+	return (dp_alt_mode_disable == 0);
+}
+
+
+
+static struct hpo_dp_link_encoder_funcs dcn32_hpo_dp_link_encoder_funcs = {
+	.enable_link_phy = dcn31_hpo_dp_link_enc_enable_dp_output,
+	.disable_link_phy = dcn31_hpo_dp_link_enc_disable_output,
+	.link_enable = dcn31_hpo_dp_link_enc_enable,
+	.link_disable = dcn31_hpo_dp_link_enc_disable,
+	.set_link_test_pattern = dcn31_hpo_dp_link_enc_set_link_test_pattern,
+	.update_stream_allocation_table = dcn31_hpo_dp_link_enc_update_stream_allocation_table,
+	.set_throttled_vcp_size = dcn31_hpo_dp_link_enc_set_throttled_vcp_size,
+	.is_in_alt_mode = dcn32_hpo_dp_link_enc_is_in_alt_mode,
+	.read_state = dcn31_hpo_dp_link_enc_read_state,
+	.set_ffe = dcn31_hpo_dp_link_enc_set_ffe,
+};
+
+void hpo_dp_link_encoder32_construct(struct dcn31_hpo_dp_link_encoder *enc31,
+		struct dc_context *ctx,
+		uint32_t inst,
+		const struct dcn31_hpo_dp_link_encoder_registers *hpo_le_regs,
+		const struct dcn31_hpo_dp_link_encoder_shift *hpo_le_shift,
+		const struct dcn31_hpo_dp_link_encoder_mask *hpo_le_mask)
+{
+	enc31->base.ctx = ctx;
+
+	enc31->base.inst = inst;
+	enc31->base.funcs = &dcn32_hpo_dp_link_encoder_funcs;
+	enc31->base.hpd_source = HPD_SOURCEID_UNKNOWN;
+	enc31->base.transmitter = TRANSMITTER_UNKNOWN;
+
+	enc31->regs = hpo_le_regs;
+	enc31->hpo_le_shift = hpo_le_shift;
+	enc31->hpo_le_mask = hpo_le_mask;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h
new file mode 100644
index 000000000000..9db1323e1933
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hpo_dp_link_encoder.h
@@ -0,0 +1,63 @@
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
+#ifndef __DAL_DCN32_HPO_DP_LINK_ENCODER_H__
+#define __DAL_DCN32_HPO_DP_LINK_ENCODER_H__
+
+#include "link_encoder.h"
+
+#define DCN3_2_HPO_DP_LINK_ENC_MASK_SH_LIST(mask_sh)\
+	SE_SF(DP_LINK_ENC0_DP_LINK_ENC_CLOCK_CONTROL, DP_LINK_ENC_CLOCK_EN, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_CONTROL, DPHY_RESET, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_CONTROL, DPHY_ENABLE, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_CONTROL, PRECODER_ENABLE, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_CONTROL, MODE, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_CONTROL, NUM_LANES, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_STATUS, STATUS, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_STATUS, SAT_UPDATE_PENDING, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_STATUS, RATE_UPDATE_PENDING, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CUSTOM0, TP_CUSTOM, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_SELECT0, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_SELECT1, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_SELECT2, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_SELECT3, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_PRBS_SEL0, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_PRBS_SEL1, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_PRBS_SEL2, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_TP_CONFIG, TP_PRBS_SEL3, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_SAT_VC0, SAT_STREAM_SOURCE, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_SAT_VC0, SAT_SLOT_COUNT, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_VC_RATE_CNTL0, STREAM_VC_RATE_X, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_VC_RATE_CNTL0, STREAM_VC_RATE_Y, mask_sh),\
+	SE_SF(DP_DPHY_SYM320_DP_DPHY_SYM32_SAT_UPDATE, SAT_UPDATE, mask_sh)
+
+void hpo_dp_link_encoder32_construct(struct dcn31_hpo_dp_link_encoder *enc31,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn31_hpo_dp_link_encoder_registers *hpo_le_regs,
+	const struct dcn31_hpo_dp_link_encoder_shift *hpo_le_shift,
+	const struct dcn31_hpo_dp_link_encoder_mask *hpo_le_mask);
+
+#endif   // __DAL_DCN32_HPO_DP_LINK_ENCODER_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
new file mode 100644
index 000000000000..27813374f2bb
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.c
@@ -0,0 +1,964 @@
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
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn32_hubbub.h"
+#include "dm_services.h"
+#include "reg_helper.h"
+
+
+#define CTX \
+	hubbub2->base.ctx
+#define DC_LOGGER \
+	hubbub2->base.ctx->logger
+#define REG(reg)\
+	hubbub2->regs->reg
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hubbub2->shifts->field_name, hubbub2->masks->field_name
+
+#define DCN32_CRB_SEGMENT_SIZE_KB 64
+
+static void dcn32_init_crb(struct hubbub *hubbub)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+
+	REG_GET(DCHUBBUB_DET0_CTRL, DET0_SIZE_CURRENT,
+		&hubbub2->det0_size);
+
+	REG_GET(DCHUBBUB_DET1_CTRL, DET1_SIZE_CURRENT,
+		&hubbub2->det1_size);
+
+	REG_GET(DCHUBBUB_DET2_CTRL, DET2_SIZE_CURRENT,
+		&hubbub2->det2_size);
+
+	REG_GET(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT,
+		&hubbub2->det3_size);
+
+	REG_GET(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE_CURRENT,
+		&hubbub2->compbuf_size_segments);
+
+	REG_SET_2(COMPBUF_RESERVED_SPACE, 0,
+			COMPBUF_RESERVED_SPACE_64B, hubbub2->pixel_chunk_size / 32,
+			COMPBUF_RESERVED_SPACE_ZS, hubbub2->pixel_chunk_size / 128);
+	REG_UPDATE(DCHUBBUB_DEBUG_CTRL_0, DET_DEPTH, 0x17F);
+}
+
+static void dcn32_program_det_size(struct hubbub *hubbub, int hubp_inst, unsigned int det_buffer_size_in_kbyte)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+
+	unsigned int det_size_segments = (det_buffer_size_in_kbyte + DCN32_CRB_SEGMENT_SIZE_KB - 1) / DCN32_CRB_SEGMENT_SIZE_KB;
+
+	switch (hubp_inst) {
+	case 0:
+		REG_UPDATE(DCHUBBUB_DET0_CTRL,
+					DET0_SIZE, det_size_segments);
+		hubbub2->det0_size = det_size_segments;
+		break;
+	case 1:
+		REG_UPDATE(DCHUBBUB_DET1_CTRL,
+					DET1_SIZE, det_size_segments);
+		hubbub2->det1_size = det_size_segments;
+		break;
+	case 2:
+		REG_UPDATE(DCHUBBUB_DET2_CTRL,
+					DET2_SIZE, det_size_segments);
+		hubbub2->det2_size = det_size_segments;
+		break;
+	case 3:
+		REG_UPDATE(DCHUBBUB_DET3_CTRL,
+					DET3_SIZE, det_size_segments);
+		hubbub2->det3_size = det_size_segments;
+		break;
+	default:
+		break;
+	}
+	/* Should never be hit, if it is we have an erroneous hw config*/
+	ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+			+ hubbub2->det3_size + hubbub2->compbuf_size_segments <= hubbub2->crb_size_segs);
+}
+
+static void dcn32_program_compbuf_size(struct hubbub *hubbub, unsigned int compbuf_size_kb, bool safe_to_increase)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	unsigned int compbuf_size_segments = (compbuf_size_kb + DCN32_CRB_SEGMENT_SIZE_KB - 1) / DCN32_CRB_SEGMENT_SIZE_KB;
+
+	if (safe_to_increase || compbuf_size_segments <= hubbub2->compbuf_size_segments) {
+		if (compbuf_size_segments > hubbub2->compbuf_size_segments) {
+			REG_WAIT(DCHUBBUB_DET0_CTRL, DET0_SIZE_CURRENT, hubbub2->det0_size, 1, 100);
+			REG_WAIT(DCHUBBUB_DET1_CTRL, DET1_SIZE_CURRENT, hubbub2->det1_size, 1, 100);
+			REG_WAIT(DCHUBBUB_DET2_CTRL, DET2_SIZE_CURRENT, hubbub2->det2_size, 1, 100);
+			REG_WAIT(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, hubbub2->det3_size, 1, 100);
+		}
+		/* Should never be hit, if it is we have an erroneous hw config*/
+		ASSERT(hubbub2->det0_size + hubbub2->det1_size + hubbub2->det2_size
+				+ hubbub2->det3_size + compbuf_size_segments <= hubbub2->crb_size_segs);
+		REG_UPDATE(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE, compbuf_size_segments);
+		REG_WAIT(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE_CURRENT, compbuf_size_segments, 1, 100);
+		hubbub2->compbuf_size_segments = compbuf_size_segments;
+	}
+}
+
+static uint32_t convert_and_clamp(
+	uint32_t wm_ns,
+	uint32_t refclk_mhz,
+	uint32_t clamp_value)
+{
+	uint32_t ret_val = 0;
+	ret_val = wm_ns * refclk_mhz;
+
+	ret_val /= 1000;
+
+	if (ret_val > clamp_value)
+		ret_val = clamp_value;
+
+	return ret_val;
+}
+
+static bool hubbub32_program_urgent_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t prog_wm_value;
+	bool wm_pending = false;
+
+	/* Repeat for water mark set A, B, C and D. */
+	/* clock state A */
+	if (safe_to_lower || watermarks->a.urgent_ns > hubbub2->watermarks.a.urgent_ns) {
+		hubbub2->watermarks.a.urgent_ns = watermarks->a.urgent_ns;
+		prog_wm_value = convert_and_clamp(watermarks->a.urgent_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, 0,
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, prog_wm_value);
+
+		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->a.urgent_ns, prog_wm_value);
+	} else if (watermarks->a.urgent_ns < hubbub2->watermarks.a.urgent_ns)
+		wm_pending = true;
+
+	/* determine the transfer time for a quantity of data for a particular requestor.*/
+	if (safe_to_lower || watermarks->a.frac_urg_bw_flip
+			> hubbub2->watermarks.a.frac_urg_bw_flip) {
+		hubbub2->watermarks.a.frac_urg_bw_flip = watermarks->a.frac_urg_bw_flip;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, watermarks->a.frac_urg_bw_flip);
+	} else if (watermarks->a.frac_urg_bw_flip
+			< hubbub2->watermarks.a.frac_urg_bw_flip)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->a.frac_urg_bw_nom
+			> hubbub2->watermarks.a.frac_urg_bw_nom) {
+		hubbub2->watermarks.a.frac_urg_bw_nom = watermarks->a.frac_urg_bw_nom;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, watermarks->a.frac_urg_bw_nom);
+	} else if (watermarks->a.frac_urg_bw_nom
+			< hubbub2->watermarks.a.frac_urg_bw_nom)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->a.urgent_latency_ns > hubbub2->watermarks.a.urgent_latency_ns) {
+		hubbub2->watermarks.a.urgent_latency_ns = watermarks->a.urgent_latency_ns;
+		prog_wm_value = convert_and_clamp(watermarks->a.urgent_latency_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, 0,
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, prog_wm_value);
+	} else if (watermarks->a.urgent_latency_ns < hubbub2->watermarks.a.urgent_latency_ns)
+		wm_pending = true;
+
+	/* clock state B */
+	if (safe_to_lower || watermarks->b.urgent_ns > hubbub2->watermarks.b.urgent_ns) {
+		hubbub2->watermarks.b.urgent_ns = watermarks->b.urgent_ns;
+		prog_wm_value = convert_and_clamp(watermarks->b.urgent_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, 0,
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, prog_wm_value);
+
+		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->b.urgent_ns, prog_wm_value);
+	} else if (watermarks->b.urgent_ns < hubbub2->watermarks.b.urgent_ns)
+		wm_pending = true;
+
+	/* determine the transfer time for a quantity of data for a particular requestor.*/
+	if (safe_to_lower || watermarks->b.frac_urg_bw_flip
+			> hubbub2->watermarks.b.frac_urg_bw_flip) {
+		hubbub2->watermarks.b.frac_urg_bw_flip = watermarks->b.frac_urg_bw_flip;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, watermarks->b.frac_urg_bw_flip);
+	} else if (watermarks->b.frac_urg_bw_flip
+			< hubbub2->watermarks.b.frac_urg_bw_flip)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->b.frac_urg_bw_nom
+			> hubbub2->watermarks.b.frac_urg_bw_nom) {
+		hubbub2->watermarks.b.frac_urg_bw_nom = watermarks->b.frac_urg_bw_nom;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, watermarks->b.frac_urg_bw_nom);
+	} else if (watermarks->b.frac_urg_bw_nom
+			< hubbub2->watermarks.b.frac_urg_bw_nom)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->b.urgent_latency_ns > hubbub2->watermarks.b.urgent_latency_ns) {
+		hubbub2->watermarks.b.urgent_latency_ns = watermarks->b.urgent_latency_ns;
+		prog_wm_value = convert_and_clamp(watermarks->b.urgent_latency_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, 0,
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, prog_wm_value);
+	} else if (watermarks->b.urgent_latency_ns < hubbub2->watermarks.b.urgent_latency_ns)
+		wm_pending = true;
+
+	/* clock state C */
+	if (safe_to_lower || watermarks->c.urgent_ns > hubbub2->watermarks.c.urgent_ns) {
+		hubbub2->watermarks.c.urgent_ns = watermarks->c.urgent_ns;
+		prog_wm_value = convert_and_clamp(watermarks->c.urgent_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, 0,
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, prog_wm_value);
+
+		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->c.urgent_ns, prog_wm_value);
+	} else if (watermarks->c.urgent_ns < hubbub2->watermarks.c.urgent_ns)
+		wm_pending = true;
+
+	/* determine the transfer time for a quantity of data for a particular requestor.*/
+	if (safe_to_lower || watermarks->c.frac_urg_bw_flip
+			> hubbub2->watermarks.c.frac_urg_bw_flip) {
+		hubbub2->watermarks.c.frac_urg_bw_flip = watermarks->c.frac_urg_bw_flip;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, watermarks->c.frac_urg_bw_flip);
+	} else if (watermarks->c.frac_urg_bw_flip
+			< hubbub2->watermarks.c.frac_urg_bw_flip)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->c.frac_urg_bw_nom
+			> hubbub2->watermarks.c.frac_urg_bw_nom) {
+		hubbub2->watermarks.c.frac_urg_bw_nom = watermarks->c.frac_urg_bw_nom;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, watermarks->c.frac_urg_bw_nom);
+	} else if (watermarks->c.frac_urg_bw_nom
+			< hubbub2->watermarks.c.frac_urg_bw_nom)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->c.urgent_latency_ns > hubbub2->watermarks.c.urgent_latency_ns) {
+		hubbub2->watermarks.c.urgent_latency_ns = watermarks->c.urgent_latency_ns;
+		prog_wm_value = convert_and_clamp(watermarks->c.urgent_latency_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, 0,
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, prog_wm_value);
+	} else if (watermarks->c.urgent_latency_ns < hubbub2->watermarks.c.urgent_latency_ns)
+		wm_pending = true;
+
+	/* clock state D */
+	if (safe_to_lower || watermarks->d.urgent_ns > hubbub2->watermarks.d.urgent_ns) {
+		hubbub2->watermarks.d.urgent_ns = watermarks->d.urgent_ns;
+		prog_wm_value = convert_and_clamp(watermarks->d.urgent_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, 0,
+				DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, prog_wm_value);
+
+		DC_LOG_BANDWIDTH_CALCS("URGENCY_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->d.urgent_ns, prog_wm_value);
+	} else if (watermarks->d.urgent_ns < hubbub2->watermarks.d.urgent_ns)
+		wm_pending = true;
+
+	/* determine the transfer time for a quantity of data for a particular requestor.*/
+	if (safe_to_lower || watermarks->d.frac_urg_bw_flip
+			> hubbub2->watermarks.d.frac_urg_bw_flip) {
+		hubbub2->watermarks.d.frac_urg_bw_flip = watermarks->d.frac_urg_bw_flip;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, watermarks->d.frac_urg_bw_flip);
+	} else if (watermarks->d.frac_urg_bw_flip
+			< hubbub2->watermarks.d.frac_urg_bw_flip)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->d.frac_urg_bw_nom
+			> hubbub2->watermarks.d.frac_urg_bw_nom) {
+		hubbub2->watermarks.d.frac_urg_bw_nom = watermarks->d.frac_urg_bw_nom;
+
+		REG_SET(DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, 0,
+				DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, watermarks->d.frac_urg_bw_nom);
+	} else if (watermarks->d.frac_urg_bw_nom
+			< hubbub2->watermarks.d.frac_urg_bw_nom)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->d.urgent_latency_ns > hubbub2->watermarks.d.urgent_latency_ns) {
+		hubbub2->watermarks.d.urgent_latency_ns = watermarks->d.urgent_latency_ns;
+		prog_wm_value = convert_and_clamp(watermarks->d.urgent_latency_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, 0,
+				DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, prog_wm_value);
+	} else if (watermarks->d.urgent_latency_ns < hubbub2->watermarks.d.urgent_latency_ns)
+		wm_pending = true;
+
+	return wm_pending;
+}
+
+static bool hubbub32_program_stutter_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t prog_wm_value;
+	bool wm_pending = false;
+
+	/* clock state A */
+	if (safe_to_lower || watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns
+			> hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns) {
+		hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns =
+				watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.cstate_enter_plus_exit_ns
+			< hubbub2->watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->a.cstate_pstate.cstate_exit_ns
+			> hubbub2->watermarks.a.cstate_pstate.cstate_exit_ns) {
+		hubbub2->watermarks.a.cstate_pstate.cstate_exit_ns =
+				watermarks->a.cstate_pstate.cstate_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.cstate_exit_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->a.cstate_pstate.cstate_exit_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.cstate_exit_ns
+			< hubbub2->watermarks.a.cstate_pstate.cstate_exit_ns)
+		wm_pending = true;
+
+	/* clock state B */
+	if (safe_to_lower || watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns
+			> hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns) {
+		hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns =
+				watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.cstate_enter_plus_exit_ns
+			< hubbub2->watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->b.cstate_pstate.cstate_exit_ns
+			> hubbub2->watermarks.b.cstate_pstate.cstate_exit_ns) {
+		hubbub2->watermarks.b.cstate_pstate.cstate_exit_ns =
+				watermarks->b.cstate_pstate.cstate_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.cstate_exit_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->b.cstate_pstate.cstate_exit_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.cstate_exit_ns
+			< hubbub2->watermarks.b.cstate_pstate.cstate_exit_ns)
+		wm_pending = true;
+
+	/* clock state C */
+	if (safe_to_lower || watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns
+			> hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns) {
+		hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns =
+				watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.cstate_enter_plus_exit_ns
+			< hubbub2->watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->c.cstate_pstate.cstate_exit_ns
+			> hubbub2->watermarks.c.cstate_pstate.cstate_exit_ns) {
+		hubbub2->watermarks.c.cstate_pstate.cstate_exit_ns =
+				watermarks->c.cstate_pstate.cstate_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.cstate_exit_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->c.cstate_pstate.cstate_exit_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.cstate_exit_ns
+			< hubbub2->watermarks.c.cstate_pstate.cstate_exit_ns)
+		wm_pending = true;
+
+	/* clock state D */
+	if (safe_to_lower || watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns
+			> hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns) {
+		hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns =
+				watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D, 0,
+				DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_ENTER_EXIT_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.cstate_enter_plus_exit_ns
+			< hubbub2->watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns)
+		wm_pending = true;
+
+	if (safe_to_lower || watermarks->d.cstate_pstate.cstate_exit_ns
+			> hubbub2->watermarks.d.cstate_pstate.cstate_exit_ns) {
+		hubbub2->watermarks.d.cstate_pstate.cstate_exit_ns =
+				watermarks->d.cstate_pstate.cstate_exit_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.cstate_exit_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, 0,
+				DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("SR_EXIT_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n",
+			watermarks->d.cstate_pstate.cstate_exit_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.cstate_exit_ns
+			< hubbub2->watermarks.d.cstate_pstate.cstate_exit_ns)
+		wm_pending = true;
+
+	return wm_pending;
+}
+
+
+static bool hubbub32_program_pstate_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t prog_wm_value;
+
+	bool wm_pending = false;
+
+	/* Section for UCLK_PSTATE_CHANGE_WATERMARKS */
+	/* clock state A */
+	if (safe_to_lower || watermarks->a.cstate_pstate.pstate_change_ns
+			> hubbub2->watermarks.a.cstate_pstate.pstate_change_ns) {
+		hubbub2->watermarks.a.cstate_pstate.pstate_change_ns =
+				watermarks->a.cstate_pstate.pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.pstate_change_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, 0,
+				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->a.cstate_pstate.pstate_change_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.pstate_change_ns
+			< hubbub2->watermarks.a.cstate_pstate.pstate_change_ns)
+		wm_pending = true;
+
+	/* clock state B */
+	if (safe_to_lower || watermarks->b.cstate_pstate.pstate_change_ns
+			> hubbub2->watermarks.b.cstate_pstate.pstate_change_ns) {
+		hubbub2->watermarks.b.cstate_pstate.pstate_change_ns =
+				watermarks->b.cstate_pstate.pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.pstate_change_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, 0,
+				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->b.cstate_pstate.pstate_change_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.pstate_change_ns
+			< hubbub2->watermarks.b.cstate_pstate.pstate_change_ns)
+		wm_pending = true;
+
+	/* clock state C */
+	if (safe_to_lower || watermarks->c.cstate_pstate.pstate_change_ns
+			> hubbub2->watermarks.c.cstate_pstate.pstate_change_ns) {
+		hubbub2->watermarks.c.cstate_pstate.pstate_change_ns =
+				watermarks->c.cstate_pstate.pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.pstate_change_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C, 0,
+				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->c.cstate_pstate.pstate_change_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.pstate_change_ns
+			< hubbub2->watermarks.c.cstate_pstate.pstate_change_ns)
+		wm_pending = true;
+
+	/* clock state D */
+	if (safe_to_lower || watermarks->d.cstate_pstate.pstate_change_ns
+			> hubbub2->watermarks.d.cstate_pstate.pstate_change_ns) {
+		hubbub2->watermarks.d.cstate_pstate.pstate_change_ns =
+				watermarks->d.cstate_pstate.pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.pstate_change_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D, 0,
+				DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("DRAM_CLK_CHANGE_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->d.cstate_pstate.pstate_change_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.pstate_change_ns
+			< hubbub2->watermarks.d.cstate_pstate.pstate_change_ns)
+		wm_pending = true;
+
+	/* Section for FCLK_PSTATE_CHANGE_WATERMARKS */
+	/* clock state A */
+	if (safe_to_lower || watermarks->a.cstate_pstate.fclk_pstate_change_ns
+			> hubbub2->watermarks.a.cstate_pstate.fclk_pstate_change_ns) {
+		hubbub2->watermarks.a.cstate_pstate.fclk_pstate_change_ns =
+				watermarks->a.cstate_pstate.fclk_pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.cstate_pstate.fclk_pstate_change_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A, 0,
+				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("FCLK_CHANGE_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->a.cstate_pstate.fclk_pstate_change_ns, prog_wm_value);
+	} else if (watermarks->a.cstate_pstate.fclk_pstate_change_ns
+			< hubbub2->watermarks.a.cstate_pstate.fclk_pstate_change_ns)
+		wm_pending = true;
+
+	/* clock state B */
+	if (safe_to_lower || watermarks->b.cstate_pstate.fclk_pstate_change_ns
+			> hubbub2->watermarks.b.cstate_pstate.fclk_pstate_change_ns) {
+		hubbub2->watermarks.b.cstate_pstate.fclk_pstate_change_ns =
+				watermarks->b.cstate_pstate.fclk_pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.cstate_pstate.fclk_pstate_change_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, 0,
+				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("FCLK_CHANGE_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->b.cstate_pstate.fclk_pstate_change_ns, prog_wm_value);
+	} else if (watermarks->b.cstate_pstate.fclk_pstate_change_ns
+			< hubbub2->watermarks.b.cstate_pstate.fclk_pstate_change_ns)
+		wm_pending = true;
+
+	/* clock state C */
+	if (safe_to_lower || watermarks->c.cstate_pstate.fclk_pstate_change_ns
+			> hubbub2->watermarks.c.cstate_pstate.fclk_pstate_change_ns) {
+		hubbub2->watermarks.c.cstate_pstate.fclk_pstate_change_ns =
+				watermarks->c.cstate_pstate.fclk_pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.cstate_pstate.fclk_pstate_change_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C, 0,
+				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("FCLK_CHANGE_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->c.cstate_pstate.fclk_pstate_change_ns, prog_wm_value);
+	} else if (watermarks->c.cstate_pstate.fclk_pstate_change_ns
+			< hubbub2->watermarks.c.cstate_pstate.fclk_pstate_change_ns)
+		wm_pending = true;
+
+	/* clock state D */
+	if (safe_to_lower || watermarks->d.cstate_pstate.fclk_pstate_change_ns
+			> hubbub2->watermarks.d.cstate_pstate.fclk_pstate_change_ns) {
+		hubbub2->watermarks.d.cstate_pstate.fclk_pstate_change_ns =
+				watermarks->d.cstate_pstate.fclk_pstate_change_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.cstate_pstate.fclk_pstate_change_ns,
+				refclk_mhz, 0xffff);
+		REG_SET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D, 0,
+				DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("FCLK_CHANGE_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->d.cstate_pstate.fclk_pstate_change_ns, prog_wm_value);
+	} else if (watermarks->d.cstate_pstate.fclk_pstate_change_ns
+			< hubbub2->watermarks.d.cstate_pstate.fclk_pstate_change_ns)
+		wm_pending = true;
+
+	return wm_pending;
+}
+
+
+static bool hubbub32_program_usr_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t prog_wm_value;
+
+	bool wm_pending = false;
+
+	/* clock state A */
+	if (safe_to_lower || watermarks->a.usr_retraining_ns
+			> hubbub2->watermarks.a.usr_retraining_ns) {
+		hubbub2->watermarks.a.usr_retraining_ns = watermarks->a.usr_retraining_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->a.usr_retraining_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, 0,
+				DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("USR_RETRAINING_WATERMARK_A calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->a.usr_retraining_ns, prog_wm_value);
+	} else if (watermarks->a.usr_retraining_ns
+			< hubbub2->watermarks.a.usr_retraining_ns)
+		wm_pending = true;
+
+	/* clock state B */
+	if (safe_to_lower || watermarks->b.usr_retraining_ns
+			> hubbub2->watermarks.b.usr_retraining_ns) {
+		hubbub2->watermarks.b.usr_retraining_ns = watermarks->b.usr_retraining_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->b.usr_retraining_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, 0,
+				DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("USR_RETRAINING_WATERMARK_B calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->b.usr_retraining_ns, prog_wm_value);
+	} else if (watermarks->b.usr_retraining_ns
+			< hubbub2->watermarks.b.usr_retraining_ns)
+		wm_pending = true;
+
+	/* clock state C */
+	if (safe_to_lower || watermarks->c.usr_retraining_ns
+			> hubbub2->watermarks.c.usr_retraining_ns) {
+		hubbub2->watermarks.c.usr_retraining_ns =
+				watermarks->c.usr_retraining_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->c.usr_retraining_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C, 0,
+				DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("USR_RETRAINING_WATERMARK_C calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->c.usr_retraining_ns, prog_wm_value);
+	} else if (watermarks->c.usr_retraining_ns
+			< hubbub2->watermarks.c.usr_retraining_ns)
+		wm_pending = true;
+
+	/* clock state D */
+	if (safe_to_lower || watermarks->d.usr_retraining_ns
+			> hubbub2->watermarks.d.usr_retraining_ns) {
+		hubbub2->watermarks.d.usr_retraining_ns =
+				watermarks->d.usr_retraining_ns;
+		prog_wm_value = convert_and_clamp(
+				watermarks->d.usr_retraining_ns,
+				refclk_mhz, 0x3fff);
+		REG_SET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D, 0,
+				DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D, prog_wm_value);
+		DC_LOG_BANDWIDTH_CALCS("USR_RETRAINING_WATERMARK_D calculated =%d\n"
+			"HW register value = 0x%x\n\n",
+			watermarks->d.usr_retraining_ns, prog_wm_value);
+	} else if (watermarks->d.usr_retraining_ns
+			< hubbub2->watermarks.d.usr_retraining_ns)
+		wm_pending = true;
+
+	return wm_pending;
+}
+
+void hubbub32_force_usr_retraining_allow(struct hubbub *hubbub, bool allow)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+
+	/*
+	 * DCHUBBUB_ARB_ALLOW_USR_RETRAINING_FORCE_ENABLE = 1 means enabling forcing value
+	 * DCHUBBUB_ARB_ALLOW_USR_RETRAINING_FORCE_VALUE = 1 or 0,  means value to be forced when force enable
+	 */
+
+	REG_UPDATE_2(DCHUBBUB_ARB_USR_RETRAINING_CNTL,
+			DCHUBBUB_ARB_ALLOW_USR_RETRAINING_FORCE_VALUE, allow,
+			DCHUBBUB_ARB_ALLOW_USR_RETRAINING_FORCE_ENABLE, allow);
+}
+
+static bool hubbub32_program_watermarks(
+		struct hubbub *hubbub,
+		struct dcn_watermark_set *watermarks,
+		unsigned int refclk_mhz,
+		bool safe_to_lower)
+{
+	bool wm_pending = false;
+
+	if (hubbub32_program_urgent_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower))
+		wm_pending = true;
+
+	if (hubbub32_program_stutter_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower))
+		wm_pending = true;
+
+	if (hubbub32_program_pstate_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower))
+		wm_pending = true;
+
+	if (hubbub32_program_usr_watermarks(hubbub, watermarks, refclk_mhz, safe_to_lower))
+		wm_pending = true;
+
+	/*
+	 * The DCHub arbiter has a mechanism to dynamically rate limit the DCHub request stream to the fabric.
+	 * If the memory controller is fully utilized and the DCHub requestors are
+	 * well ahead of their amortized schedule, then it is safe to prevent the next winner
+	 * from being committed and sent to the fabric.
+	 * The utilization of the memory controller is approximated by ensuring that
+	 * the number of outstanding requests is greater than a threshold specified
+	 * by the ARB_MIN_REQ_OUTSTANDING. To determine that the DCHub requestors are well ahead of the amortized schedule,
+	 * the slack of the next winner is compared with the ARB_SAT_LEVEL in DLG RefClk cycles.
+	 *
+	 * TODO: Revisit request limit after figure out right number. request limit for RM isn't decided yet, set maximum value (0x1FF)
+	 * to turn off it for now.
+	 */
+	/*REG_SET(DCHUBBUB_ARB_SAT_LEVEL, 0,
+			DCHUBBUB_ARB_SAT_LEVEL, 60 * refclk_mhz);
+	REG_UPDATE(DCHUBBUB_ARB_DF_REQ_OUTSTAND,
+			DCHUBBUB_ARB_MIN_REQ_OUTSTAND, 0x1FF);*/
+
+	hubbub1_allow_self_refresh_control(hubbub, !hubbub->ctx->dc->debug.disable_stutter);
+
+	hubbub32_force_usr_retraining_allow(hubbub, hubbub->ctx->dc->debug.force_usr_allow);
+
+	return wm_pending;
+}
+
+/* Copy values from WM set A to all other sets */
+void hubbub32_init_watermarks(struct hubbub *hubbub)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t reg;
+
+	reg = REG_READ(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A);
+	REG_WRITE(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, reg);
+
+	reg = REG_READ(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A);
+	REG_WRITE(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, reg);
+
+	reg = REG_READ(DCHUBBUB_ARB_FRAC_URG_BW_NOM_A);
+	REG_WRITE(DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, reg);
+
+	reg = REG_READ(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A);
+	REG_WRITE(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, reg);
+
+	reg = REG_READ(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A);
+	REG_WRITE(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D, reg);
+
+	reg = REG_READ(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A);
+	REG_WRITE(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, reg);
+
+	reg = REG_READ(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A);
+	REG_WRITE(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D, reg);
+
+	reg = REG_READ(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A);
+	REG_WRITE(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D, reg);
+
+	reg = REG_READ(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A);
+	REG_WRITE(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, reg);
+	REG_WRITE(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C, reg);
+	REG_WRITE(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D, reg);
+}
+
+void hubbub32_wm_read_state(struct hubbub *hubbub,
+		struct dcn_hubbub_wm *wm)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	struct dcn_hubbub_wm_set *s;
+
+	memset(wm, 0, sizeof(struct dcn_hubbub_wm));
+
+	s = &wm->sets[0];
+	s->wm_set = 0;
+	REG_GET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A,
+			DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, &s->data_urgent);
+
+	REG_GET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A,
+			DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_A, &s->sr_enter);
+
+	REG_GET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A,
+			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_A, &s->sr_exit);
+
+	REG_GET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A,
+			 DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, &s->dram_clk_chanage);
+
+	REG_GET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A,
+			 DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, &s->usr_retrain);
+
+	REG_GET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A,
+			 DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A, &s->fclk_pstate_change);
+
+	s = &wm->sets[1];
+	s->wm_set = 1;
+	REG_GET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B,
+			DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, &s->data_urgent);
+
+	REG_GET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B,
+			DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_B, &s->sr_enter);
+
+	REG_GET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B,
+			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_B, &s->sr_exit);
+
+	REG_GET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B,
+			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, &s->dram_clk_chanage);
+
+	REG_GET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B,
+			 DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, &s->usr_retrain);
+
+	REG_GET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B,
+			DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, &s->fclk_pstate_change);
+
+	s = &wm->sets[2];
+	s->wm_set = 2;
+	REG_GET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C,
+			DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, &s->data_urgent);
+
+	REG_GET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C,
+			DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_C, &s->sr_enter);
+
+	REG_GET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C,
+			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_C, &s->sr_exit);
+
+	REG_GET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C,
+			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C, &s->dram_clk_chanage);
+
+	REG_GET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C,
+			 DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C, &s->usr_retrain);
+
+	REG_GET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C,
+			DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C, &s->fclk_pstate_change);
+
+	s = &wm->sets[3];
+	s->wm_set = 3;
+	REG_GET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D,
+			DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, &s->data_urgent);
+
+	REG_GET(DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D,
+			DCHUBBUB_ARB_ALLOW_SR_ENTER_WATERMARK_D, &s->sr_enter);
+
+	REG_GET(DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D,
+			DCHUBBUB_ARB_ALLOW_SR_EXIT_WATERMARK_D, &s->sr_exit);
+
+	REG_GET(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D,
+			DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D, &s->dram_clk_chanage);
+
+	REG_GET(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D,
+			 DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D, &s->usr_retrain);
+
+	REG_GET(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D,
+			DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D, &s->fclk_pstate_change);
+}
+
+void hubbub32_force_wm_propagate_to_pipes(struct hubbub *hubbub)
+{
+	struct dcn20_hubbub *hubbub2 = TO_DCN20_HUBBUB(hubbub);
+	uint32_t refclk_mhz = hubbub->ctx->dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000;
+	uint32_t prog_wm_value = convert_and_clamp(hubbub2->watermarks.a.urgent_ns,
+			refclk_mhz, 0x3fff);
+
+	REG_SET(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, 0,
+			DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, prog_wm_value);
+}
+
+static const struct hubbub_funcs hubbub32_funcs = {
+	.update_dchub = hubbub2_update_dchub,
+	.init_dchub_sys_ctx = hubbub3_init_dchub_sys_ctx,
+	.init_vm_ctx = hubbub2_init_vm_ctx,
+	.dcc_support_swizzle = hubbub3_dcc_support_swizzle,
+	.dcc_support_pixel_format = hubbub2_dcc_support_pixel_format,
+	.get_dcc_compression_cap = hubbub3_get_dcc_compression_cap,
+	.wm_read_state = hubbub32_wm_read_state,
+	.get_dchub_ref_freq = hubbub2_get_dchub_ref_freq,
+	.program_watermarks = hubbub32_program_watermarks,
+	.allow_self_refresh_control = hubbub1_allow_self_refresh_control,
+	.is_allow_self_refresh_enabled = hubbub1_is_allow_self_refresh_enabled,
+	.force_wm_propagate_to_pipes = hubbub32_force_wm_propagate_to_pipes,
+	.force_pstate_change_control = hubbub3_force_pstate_change_control,
+	.init_watermarks = hubbub32_init_watermarks,
+	.program_det_size = dcn32_program_det_size,
+	.program_compbuf_size = dcn32_program_compbuf_size,
+	.init_crb = dcn32_init_crb,
+	.hubbub_read_state = hubbub2_read_state,
+	.force_usr_retraining_allow = hubbub32_force_usr_retraining_allow,
+};
+
+void hubbub32_construct(struct dcn20_hubbub *hubbub2,
+	struct dc_context *ctx,
+	const struct dcn_hubbub_registers *hubbub_regs,
+	const struct dcn_hubbub_shift *hubbub_shift,
+	const struct dcn_hubbub_mask *hubbub_mask,
+	int det_size_kb,
+	int pixel_chunk_size_kb,
+	int config_return_buffer_size_kb)
+{
+	hubbub2->base.ctx = ctx;
+	hubbub2->base.funcs = &hubbub32_funcs;
+	hubbub2->regs = hubbub_regs;
+	hubbub2->shifts = hubbub_shift;
+	hubbub2->masks = hubbub_mask;
+
+	hubbub2->debug_test_index_pstate = 0xB;
+	hubbub2->detile_buf_size = det_size_kb * 1024;
+	hubbub2->pixel_chunk_size = pixel_chunk_size_kb * 1024;
+	hubbub2->crb_size_segs = config_return_buffer_size_kb / DCN32_CRB_SEGMENT_SIZE_KB;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
new file mode 100644
index 000000000000..8d3ea8ee5b3b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
@@ -0,0 +1,172 @@
+/*
+ * Copyright 2016 Advanced Micro Devices, Inc.
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
+#ifndef __DC_HUBBUB_DCN32_H__
+#define __DC_HUBBUB_DCN32_H__
+
+#include "dcn21/dcn21_hubbub.h"
+
+#define HUBBUB_REG_LIST_DCN32(id)\
+	SR(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A),\
+	SR(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B),\
+	SR(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C),\
+	SR(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D),\
+	SR(DCHUBBUB_ARB_WATERMARK_CHANGE_CNTL),\
+	SR(DCHUBBUB_ARB_DRAM_STATE_CNTL),\
+	SR(DCHUBBUB_ARB_SAT_LEVEL),\
+	SR(DCHUBBUB_ARB_DF_REQ_OUTSTAND),\
+	SR(DCHUBBUB_GLOBAL_TIMER_CNTL), \
+	SR(DCHUBBUB_SOFT_RESET),\
+	SR(DCHUBBUB_CRC_CTRL), \
+	SR(DCN_VM_FB_LOCATION_BASE),\
+	SR(DCN_VM_FB_LOCATION_TOP),\
+	SR(DCN_VM_FB_OFFSET),\
+	SR(DCN_VM_AGP_BOT),\
+	SR(DCN_VM_AGP_TOP),\
+	SR(DCN_VM_AGP_BASE),\
+	HUBBUB_SR_WATERMARK_REG_LIST(), \
+	SR(DCHUBBUB_ARB_FRAC_URG_BW_NOM_A),\
+	SR(DCHUBBUB_ARB_FRAC_URG_BW_NOM_B),\
+	SR(DCHUBBUB_ARB_FRAC_URG_BW_NOM_C),\
+	SR(DCHUBBUB_ARB_FRAC_URG_BW_NOM_D),\
+	SR(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A),\
+	SR(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B),\
+	SR(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C),\
+	SR(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D),\
+	SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A),\
+	SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B),\
+	SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C),\
+	SR(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D),\
+	SR(DCHUBBUB_DET0_CTRL),\
+	SR(DCHUBBUB_DET1_CTRL),\
+	SR(DCHUBBUB_DET2_CTRL),\
+	SR(DCHUBBUB_DET3_CTRL),\
+	SR(DCHUBBUB_COMPBUF_CTRL),\
+	SR(COMPBUF_RESERVED_SPACE),\
+	SR(DCHUBBUB_ARB_USR_RETRAINING_CNTL),\
+	SR(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A),\
+	SR(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B),\
+	SR(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C),\
+	SR(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D),\
+	SR(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A),\
+	SR(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B),\
+	SR(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C),\
+	SR(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D),\
+	SR(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A),\
+	SR(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B),\
+	SR(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C),\
+	SR(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D),\
+	SR(DCN_VM_FAULT_ADDR_MSB),\
+	SR(DCN_VM_FAULT_ADDR_LSB),\
+	SR(DCN_VM_FAULT_CNTL),\
+	SR(DCN_VM_FAULT_STATUS)
+
+#define HUBBUB_MASK_SH_LIST_DCN32(mask_sh)\
+	HUBBUB_SF(DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_ENABLE, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_SOFT_RESET, DCHUBBUB_GLOBAL_SOFT_RESET, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_WATERMARK_CHANGE_CNTL, DCHUBBUB_ARB_WATERMARK_CHANGE_REQUEST, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_WATERMARK_CHANGE_CNTL, DCHUBBUB_ARB_WATERMARK_CHANGE_DONE_INTERRUPT_DISABLE, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DRAM_STATE_CNTL, DCHUBBUB_ARB_ALLOW_SELF_REFRESH_FORCE_VALUE, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DRAM_STATE_CNTL, DCHUBBUB_ARB_ALLOW_SELF_REFRESH_FORCE_ENABLE, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DRAM_STATE_CNTL, DCHUBBUB_ARB_ALLOW_PSTATE_CHANGE_FORCE_VALUE, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DRAM_STATE_CNTL, DCHUBBUB_ARB_ALLOW_PSTATE_CHANGE_FORCE_ENABLE, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_SAT_LEVEL, DCHUBBUB_ARB_SAT_LEVEL, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DF_REQ_OUTSTAND, DCHUBBUB_ARB_MIN_REQ_OUTSTAND, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, DCHUBBUB_ARB_DATA_URGENCY_WATERMARK_D, mask_sh), \
+	HUBBUB_MASK_SH_LIST_STUTTER(mask_sh), \
+	HUBBUB_SF(DCHUBBUB_GLOBAL_TIMER_CNTL, DCHUBBUB_GLOBAL_TIMER_REFDIV, mask_sh), \
+	HUBBUB_SF(DCN_VM_FB_LOCATION_BASE, FB_BASE, mask_sh), \
+	HUBBUB_SF(DCN_VM_FB_LOCATION_TOP, FB_TOP, mask_sh), \
+	HUBBUB_SF(DCN_VM_FB_OFFSET, FB_OFFSET, mask_sh), \
+	HUBBUB_SF(DCN_VM_AGP_BOT, AGP_BOT, mask_sh), \
+	HUBBUB_SF(DCN_VM_AGP_TOP, AGP_TOP, mask_sh), \
+	HUBBUB_SF(DCN_VM_AGP_BASE, AGP_BASE, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, DCHUBBUB_ARB_FRAC_URG_BW_FLIP_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, DCHUBBUB_ARB_FRAC_URG_BW_FLIP_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, DCHUBBUB_ARB_FRAC_URG_BW_FLIP_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, DCHUBBUB_ARB_FRAC_URG_BW_FLIP_D, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, DCHUBBUB_ARB_FRAC_URG_BW_NOM_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, DCHUBBUB_ARB_FRAC_URG_BW_NOM_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, DCHUBBUB_ARB_FRAC_URG_BW_NOM_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, DCHUBBUB_ARB_FRAC_URG_BW_NOM_D, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, DCHUBBUB_ARB_REFCYC_PER_TRIP_TO_MEMORY_D, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET0_CTRL, DET0_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET0_CTRL, DET0_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET1_CTRL, DET1_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET1_CTRL, DET1_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET2_CTRL, DET2_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET2_CTRL, DET2_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET3_CTRL, DET3_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_DET3_CTRL, DET3_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_COMPBUF_CTRL, COMPBUF_SIZE_CURRENT, mask_sh),\
+	HUBBUB_SF(COMPBUF_RESERVED_SPACE, COMPBUF_RESERVED_SPACE_64B, mask_sh),\
+	HUBBUB_SF(COMPBUF_RESERVED_SPACE, COMPBUF_RESERVED_SPACE_ZS, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_USR_RETRAINING_CNTL, DCHUBBUB_ARB_ALLOW_USR_RETRAINING_FORCE_VALUE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_USR_RETRAINING_CNTL, DCHUBBUB_ARB_ALLOW_USR_RETRAINING_FORCE_ENABLE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_USR_RETRAINING_CNTL, DCHUBBUB_ARB_DO_NOT_FORCE_ALLOW_USR_RETRAINING_DURING_PSTATE_CHANGE_REQUEST, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_USR_RETRAINING_CNTL, DCHUBBUB_ARB_DO_NOT_FORCE_ALLOW_USR_RETRAINING_DURING_PRE_CSTATE, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_A, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_B, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C, DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_C, mask_sh), \
+	HUBBUB_SF(DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D, DCHUBBUB_ARB_USR_RETRAINING_WATERMARK_D, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_A, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_B, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C, DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_C, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D, DCHUBBUB_ARB_UCLK_PSTATE_CHANGE_WATERMARK_D, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A, DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_A, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_B, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C, DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_C, mask_sh),\
+	HUBBUB_SF(DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D, DCHUBBUB_ARB_FCLK_PSTATE_CHANGE_WATERMARK_D, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_ADDR_MSB, DCN_VM_FAULT_ADDR_MSB, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_ADDR_LSB, DCN_VM_FAULT_ADDR_LSB, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_CNTL, DCN_VM_ERROR_STATUS_CLEAR, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_CNTL, DCN_VM_ERROR_STATUS_MODE, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_CNTL, DCN_VM_ERROR_INTERRUPT_ENABLE, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_CNTL, DCN_VM_RANGE_FAULT_DISABLE, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_CNTL, DCN_VM_PRQ_FAULT_DISABLE, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_STATUS, DCN_VM_ERROR_STATUS, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_STATUS, DCN_VM_ERROR_VMID, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_STATUS, DCN_VM_ERROR_TABLE_LEVEL, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_STATUS, DCN_VM_ERROR_PIPE, mask_sh), \
+	HUBBUB_SF(DCN_VM_FAULT_STATUS, DCN_VM_ERROR_INTERRUPT_STATUS, mask_sh)
+
+
+void hubbub32_construct(struct dcn20_hubbub *hubbub2,
+	struct dc_context *ctx,
+	const struct dcn_hubbub_registers *hubbub_regs,
+	const struct dcn_hubbub_shift *hubbub_shift,
+	const struct dcn_hubbub_mask *hubbub_mask,
+	int det_size_kb,
+	int pixel_chunk_size_kb,
+	int config_return_buffer_size_kb);
+
+#endif
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c
new file mode 100644
index 000000000000..0a7d64306481
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.c
@@ -0,0 +1,148 @@
+/*
+ * Copyright 2012-20 Advanced Micro Devices, Inc.
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
+#include "dm_services.h"
+#include "dce_calcs.h"
+#include "reg_helper.h"
+#include "basics/conversion.h"
+#include "dcn32_hubp.h"
+
+#define REG(reg)\
+	hubp2->hubp_regs->reg
+
+#define CTX \
+	hubp2->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hubp2->hubp_shift->field_name, hubp2->hubp_mask->field_name
+
+void hubp32_update_force_pstate_disallow(struct hubp *hubp, bool pstate_disallow)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+	REG_UPDATE_2(UCLK_PSTATE_FORCE,
+			DATA_UCLK_PSTATE_FORCE_EN, pstate_disallow,
+			DATA_UCLK_PSTATE_FORCE_VALUE, 0);
+}
+
+void hubp32_update_mall_sel(struct hubp *hubp, uint32_t mall_sel)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	// Also cache cursor in MALL if using MALL for SS
+	REG_UPDATE_2(DCHUBP_MALL_CONFIG, USE_MALL_SEL, mall_sel,
+			USE_MALL_FOR_CURSOR, mall_sel == 2 ? 1 : 0);
+}
+
+void hubp32_prepare_subvp_buffering(struct hubp *hubp, bool enable)
+{
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+	REG_UPDATE(DCHUBP_VMPG_CONFIG, FORCE_ONE_ROW_FOR_FRAME, enable);
+
+	/* Programming guide suggests CURSOR_REQ_MODE = 1 for SubVP:
+	 * For Pstate change using the MALL with sub-viewport buffering,
+	 * the cursor does not use the MALL (USE_MALL_FOR_CURSOR is ignored)
+	 * and sub-viewport positioning by Display FW has to avoid the cursor
+	 * requests to DRAM (set CURSOR_REQ_MODE = 1 to minimize this exclusion).
+	 *
+	 * CURSOR_REQ_MODE = 1 begins fetching cursor data at the beginning of display prefetch.
+	 * Setting this should allow the sub-viewport position to always avoid the cursor because
+	 * we do not allow the sub-viewport region to overlap with display prefetch (i.e. during blank).
+	 */
+	REG_UPDATE(CURSOR_CONTROL, CURSOR_REQ_MODE, enable);
+}
+
+void hubp32_phantom_hubp_post_enable(struct hubp *hubp)
+{
+	uint32_t reg_val;
+	struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
+
+	REG_UPDATE(DCHUBP_CNTL, HUBP_BLANK_EN, 1);
+	reg_val = REG_READ(DCHUBP_CNTL);
+	if (reg_val) {
+		/* init sequence workaround: in case HUBP is
+		 * power gated, this wait would timeout.
+		 *
+		 * we just wrote reg_val to non-0, if it stay 0
+		 * it means HUBP is gated
+		 */
+		REG_WAIT(DCHUBP_CNTL,
+				HUBP_NO_OUTSTANDING_REQ, 1,
+				1, 200);
+	}
+}
+
+static struct hubp_funcs dcn32_hubp_funcs = {
+	.hubp_enable_tripleBuffer = hubp2_enable_triplebuffer,
+	.hubp_is_triplebuffer_enabled = hubp2_is_triplebuffer_enabled,
+	.hubp_program_surface_flip_and_addr = hubp3_program_surface_flip_and_addr,
+	.hubp_program_surface_config = hubp3_program_surface_config,
+	.hubp_is_flip_pending = hubp2_is_flip_pending,
+	.hubp_setup = hubp3_setup,
+	.hubp_setup_interdependent = hubp2_setup_interdependent,
+	.hubp_set_vm_system_aperture_settings = hubp3_set_vm_system_aperture_settings,
+	.set_blank = hubp2_set_blank,
+	.dcc_control = hubp3_dcc_control,
+	.mem_program_viewport = min_set_viewport,
+	.set_cursor_attributes	= hubp2_cursor_set_attributes,
+	.set_cursor_position	= hubp2_cursor_set_position,
+	.hubp_clk_cntl = hubp2_clk_cntl,
+	.hubp_vtg_sel = hubp2_vtg_sel,
+	.dmdata_set_attributes = hubp3_dmdata_set_attributes,
+	.dmdata_load = hubp2_dmdata_load,
+	.dmdata_status_done = hubp2_dmdata_status_done,
+	.hubp_read_state = hubp3_read_state,
+	.hubp_clear_underflow = hubp2_clear_underflow,
+	.hubp_set_flip_control_surface_gsl = hubp2_set_flip_control_surface_gsl,
+	.hubp_init = hubp3_init,
+	.set_unbounded_requesting = hubp31_set_unbounded_requesting,
+	.hubp_soft_reset = hubp31_soft_reset,
+	.hubp_in_blank = hubp1_in_blank,
+	.hubp_update_force_pstate_disallow = hubp32_update_force_pstate_disallow,
+	.phantom_hubp_post_enable = hubp32_phantom_hubp_post_enable,
+	.hubp_update_mall_sel = hubp32_update_mall_sel,
+	.hubp_prepare_subvp_buffering = hubp32_prepare_subvp_buffering,
+	.hubp_set_flip_int = hubp1_set_flip_int
+};
+
+bool hubp32_construct(
+	struct dcn20_hubp *hubp2,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn_hubp2_registers *hubp_regs,
+	const struct dcn_hubp2_shift *hubp_shift,
+	const struct dcn_hubp2_mask *hubp_mask)
+{
+	hubp2->base.funcs = &dcn32_hubp_funcs;
+	hubp2->base.ctx = ctx;
+	hubp2->hubp_regs = hubp_regs;
+	hubp2->hubp_shift = hubp_shift;
+	hubp2->hubp_mask = hubp_mask;
+	hubp2->base.inst = inst;
+	hubp2->base.opp_id = OPP_ID_INVALID;
+	hubp2->base.mpcc_id = 0xf;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
new file mode 100644
index 000000000000..00b4211389c2
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
@@ -0,0 +1,69 @@
+/*
+ * Copyright 2012-20 Advanced Micro Devices, Inc.
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
+#ifndef __DC_HUBP_DCN32_H__
+#define __DC_HUBP_DCN32_H__
+
+#include "dcn20/dcn20_hubp.h"
+#include "dcn21/dcn21_hubp.h"
+#include "dcn30/dcn30_hubp.h"
+#include "dcn31/dcn31_hubp.h"
+
+#define HUBP_REG_LIST_DCN32(id)\
+	HUBP_REG_LIST_DCN30(id),\
+	SRI(DCHUBP_MALL_CONFIG, HUBP, id),\
+	SRI(DCHUBP_VMPG_CONFIG, HUBP, id),\
+	SRI(UCLK_PSTATE_FORCE, HUBPREQ, id)
+
+#define HUBP_MASK_SH_LIST_DCN32(mask_sh)\
+	HUBP_MASK_SH_LIST_DCN31(mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MALL_CONFIG, USE_MALL_SEL, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_MALL_CONFIG, USE_MALL_FOR_CURSOR, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_VMPG_CONFIG, VMPG_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_VMPG_CONFIG, PTE_BUFFER_MODE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_VMPG_CONFIG, BIGK_FRAGMENT_SIZE, mask_sh),\
+	HUBP_SF(HUBP0_DCHUBP_VMPG_CONFIG, FORCE_ONE_ROW_FOR_FRAME, mask_sh),\
+	HUBP_SF(HUBPREQ0_UCLK_PSTATE_FORCE, DATA_UCLK_PSTATE_FORCE_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_UCLK_PSTATE_FORCE, DATA_UCLK_PSTATE_FORCE_VALUE, mask_sh),\
+	HUBP_SF(HUBPREQ0_UCLK_PSTATE_FORCE, CURSOR_UCLK_PSTATE_FORCE_EN, mask_sh),\
+	HUBP_SF(HUBPREQ0_UCLK_PSTATE_FORCE, CURSOR_UCLK_PSTATE_FORCE_VALUE, mask_sh)
+
+void hubp32_update_force_pstate_disallow(struct hubp *hubp, bool pstate_disallow);
+
+void hubp32_update_mall_sel(struct hubp *hubp, uint32_t mall_sel);
+
+void hubp32_prepare_subvp_buffering(struct hubp *hubp, bool enable);
+
+void hubp32_phantom_hubp_post_enable(struct hubp *hubp);
+
+bool hubp32_construct(
+	struct dcn20_hubp *hubp2,
+	struct dc_context *ctx,
+	uint32_t inst,
+	const struct dcn_hubp2_registers *hubp_regs,
+	const struct dcn_hubp2_shift *hubp_shift,
+	const struct dcn_hubp2_mask *hubp_mask);
+
+#endif /* __DC_HUBP_DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
new file mode 100644
index 000000000000..d0a222f1a09c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.c
@@ -0,0 +1,891 @@
+/*
+ * Copyright 2016 Advanced Micro Devices, Inc.
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
+#include "dm_helpers.h"
+#include "core_types.h"
+#include "resource.h"
+#include "dccg.h"
+#include "dce/dce_hwseq.h"
+#include "dcn30/dcn30_cm_common.h"
+#include "reg_helper.h"
+#include "abm.h"
+#include "hubp.h"
+#include "dchubbub.h"
+#include "timing_generator.h"
+#include "opp.h"
+#include "ipp.h"
+#include "mpc.h"
+#include "mcif_wb.h"
+#include "dc_dmub_srv.h"
+#include "link_hwss.h"
+#include "dpcd_defs.h"
+#include "dcn32_hwseq.h"
+#include "clk_mgr.h"
+#include "dsc.h"
+#include "dcn20/dcn20_optc.h"
+
+#define DC_LOGGER_INIT(logger)
+
+#define CTX \
+	hws->ctx
+#define REG(reg)\
+	hws->regs->reg
+#define DC_LOGGER \
+		dc->ctx->logger
+
+
+#undef FN
+#define FN(reg_name, field_name) \
+	hws->shifts->field_name, hws->masks->field_name
+
+void dcn32_dsc_pg_control(
+		struct dce_hwseq *hws,
+		unsigned int dsc_inst,
+		bool power_on)
+{
+	uint32_t power_gate = power_on ? 0 : 1;
+	uint32_t pwr_status = power_on ? 0 : 2;
+	uint32_t org_ip_request_cntl = 0;
+
+	if (hws->ctx->dc->debug.disable_dsc_power_gate)
+		return;
+
+	REG_GET(DC_IP_REQUEST_CNTL, IP_REQUEST_EN, &org_ip_request_cntl);
+	if (org_ip_request_cntl == 0)
+		REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 1);
+
+	switch (dsc_inst) {
+	case 0: /* DSC0 */
+		REG_UPDATE(DOMAIN16_PG_CONFIG,
+				DOMAIN_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN16_PG_STATUS,
+				DOMAIN_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 1: /* DSC1 */
+		REG_UPDATE(DOMAIN17_PG_CONFIG,
+				DOMAIN_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN17_PG_STATUS,
+				DOMAIN_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 2: /* DSC2 */
+		REG_UPDATE(DOMAIN18_PG_CONFIG,
+				DOMAIN_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN18_PG_STATUS,
+				DOMAIN_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	case 3: /* DSC3 */
+		REG_UPDATE(DOMAIN19_PG_CONFIG,
+				DOMAIN_POWER_GATE, power_gate);
+
+		REG_WAIT(DOMAIN19_PG_STATUS,
+				DOMAIN_PGFSM_PWR_STATUS, pwr_status,
+				1, 1000);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		break;
+	}
+
+	if (org_ip_request_cntl == 0)
+		REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 0);
+}
+
+
+void dcn32_enable_power_gating_plane(
+	struct dce_hwseq *hws,
+	bool enable)
+{
+	bool force_on = true; /* disable power gating */
+
+	if (enable)
+		force_on = false;
+
+	/* DCHUBP0/1/2/3 */
+	REG_UPDATE(DOMAIN0_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN1_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN2_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN3_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+
+	/* DCS0/1/2/3 */
+	REG_UPDATE(DOMAIN16_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN17_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN18_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN19_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+}
+
+void dcn32_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on)
+{
+	uint32_t power_gate = power_on ? 0 : 1;
+	uint32_t pwr_status = power_on ? 0 : 2;
+
+	if (hws->ctx->dc->debug.disable_hubp_power_gate)
+		return;
+
+	if (REG(DOMAIN0_PG_CONFIG) == 0)
+		return;
+
+	switch (hubp_inst) {
+	case 0:
+		REG_SET(DOMAIN0_PG_CONFIG, 0, DOMAIN_POWER_GATE, power_gate);
+		REG_WAIT(DOMAIN0_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, pwr_status, 1, 1000);
+		break;
+	case 1:
+		REG_SET(DOMAIN1_PG_CONFIG, 0, DOMAIN_POWER_GATE, power_gate);
+		REG_WAIT(DOMAIN1_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, pwr_status, 1, 1000);
+		break;
+	case 2:
+		REG_SET(DOMAIN2_PG_CONFIG, 0, DOMAIN_POWER_GATE, power_gate);
+		REG_WAIT(DOMAIN2_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, pwr_status, 1, 1000);
+		break;
+	case 3:
+		REG_SET(DOMAIN3_PG_CONFIG, 0, DOMAIN_POWER_GATE, power_gate);
+		REG_WAIT(DOMAIN3_PG_STATUS, DOMAIN_PGFSM_PWR_STATUS, pwr_status, 1, 1000);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		break;
+	}
+}
+
+static bool dcn32_check_no_memory_request_for_cab(struct dc *dc)
+{
+	int i;
+
+    /* First, check no-memory-request case */
+	for (i = 0; i < dc->current_state->stream_count; i++) {
+		if (dc->current_state->stream_status[i].plane_count)
+			/* Fail eligibility on a visible stream */
+			break;
+	}
+
+	if (i == dc->current_state->stream_count)
+		return true;
+
+	return false;
+}
+
+/* This function takes in the start address and surface size to be cached in CAB
+ * and calculates the total number of cache lines required to store the surface.
+ * The number of cache lines used for each surface is calculated independently of
+ * one another. For example, if there is a primary surface(1), meta surface(2), and
+ * cursor(3), this function should be called 3 times to calculate the number of cache
+ * lines used for each of those surfaces.
+ */
+static uint32_t dcn32_cache_lines_for_surface(struct dc *dc, uint32_t surface_size, uint64_t start_address)
+{
+	uint32_t lines_used = 1;
+	uint32_t num_cached_bytes = 0;
+	uint32_t remaining_size = 0;
+	uint32_t cache_line_size = dc->caps.cache_line_size;
+
+	/* 1. Calculate surface size minus the number of bytes stored
+	 * in the first cache line (all bytes in first cache line might
+	 * not be fully used).
+	 */
+	num_cached_bytes = cache_line_size - (start_address % cache_line_size);
+	remaining_size = surface_size - num_cached_bytes;
+
+	/* 2. Calculate number of cache lines that will be fully used with
+	 * the remaining number of bytes to be stored.
+	 */
+	lines_used += (remaining_size / cache_line_size);
+
+	/* 3. Check if we need an extra line due to the remaining size not being
+	 * a multiple of CACHE_LINE_SIZE.
+	 */
+	if (remaining_size % cache_line_size > 0)
+		lines_used++;
+
+	return lines_used;
+}
+
+/* This function loops through every surface that needs to be cached in CAB for SS,
+ * and calculates the total number of ways required to store all surfaces (primary,
+ * meta, cursor).
+ */
+static uint32_t dcn32_calculate_cab_allocation(struct dc *dc, struct dc_state *ctx)
+{
+	uint8_t i, j;
+	struct dc_stream_state *stream = NULL;
+	struct dc_plane_state *plane = NULL;
+	uint32_t surface_size = 0;
+	uint32_t cursor_size = 0;
+	uint32_t cache_lines_used = 0;
+	uint32_t total_lines = 0;
+	uint32_t lines_per_way = 0;
+	uint32_t num_ways = 0;
+
+	for (i = 0; i < ctx->stream_count; i++) {
+		stream = ctx->streams[i];
+
+		// Don't include PSR surface in the total surface size for CAB allocation
+		if (stream->link->psr_settings.psr_version != DC_PSR_VERSION_UNSUPPORTED)
+			continue;
+
+		if (ctx->stream_status[i].plane_count == 0)
+			continue;
+
+		// For each stream, loop through each plane to calculate the number of cache
+		// lines required to store the surface in CAB
+		for (j = 0; j < ctx->stream_status[i].plane_count; j++) {
+			plane = ctx->stream_status[i].plane_states[j];
+
+			// Calculate total surface size
+			surface_size = plane->plane_size.surface_pitch *
+					plane->plane_size.surface_size.height *
+					(plane->format >= SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616 ? 8 : 4);
+
+			// Convert surface size + starting address to number of cache lines required
+			// (alignment accounted for)
+			cache_lines_used += dcn32_cache_lines_for_surface(dc, surface_size,
+					plane->address.grph.addr.quad_part);
+
+			if (plane->address.grph.meta_addr.quad_part) {
+				// Meta surface
+				cache_lines_used += dcn32_cache_lines_for_surface(dc, surface_size,
+						plane->address.grph.meta_addr.quad_part);
+			}
+		}
+
+		// Include cursor size for CAB allocation
+		if (stream->cursor_position.enable && plane->address.grph.cursor_cache_addr.quad_part) {
+			cursor_size = dc->caps.max_cursor_size * dc->caps.max_cursor_size;
+			switch (stream->cursor_attributes.color_format) {
+			case CURSOR_MODE_MONO:
+				cursor_size /= 2;
+				break;
+			case CURSOR_MODE_COLOR_1BIT_AND:
+			case CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA:
+			case CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA:
+				cursor_size *= 4;
+				break;
+
+			case CURSOR_MODE_COLOR_64BIT_FP_PRE_MULTIPLIED:
+			case CURSOR_MODE_COLOR_64BIT_FP_UN_PRE_MULTIPLIED:
+				cursor_size *= 8;
+				break;
+			}
+			cache_lines_used += dcn32_cache_lines_for_surface(dc, surface_size,
+					plane->address.grph.cursor_cache_addr.quad_part);
+		}
+	}
+
+	// Convert number of cache lines required to number of ways
+	total_lines = dc->caps.max_cab_allocation_bytes / dc->caps.cache_line_size;
+	lines_per_way = total_lines / dc->caps.cache_num_ways;
+	num_ways = cache_lines_used / lines_per_way;
+
+	if (cache_lines_used % lines_per_way > 0)
+		num_ways++;
+
+	return num_ways;
+}
+
+bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable)
+{
+	union dmub_rb_cmd cmd;
+	uint8_t ways;
+
+	if (!dc->ctx->dmub_srv)
+		return false;
+
+	if (enable) {
+		if (dc->current_state) {
+
+			/* 1. Check no memory request case for CAB.
+			 * If no memory request case, send CAB_ACTION NO_DF_REQ DMUB message
+			 */
+			if (dcn32_check_no_memory_request_for_cab(dc)) {
+				/* Enable no-memory-requests case */
+				memset(&cmd, 0, sizeof(cmd));
+				cmd.cab.header.type = DMUB_CMD__CAB_FOR_SS;
+				cmd.cab.header.sub_type = DMUB_CMD__CAB_NO_DCN_REQ;
+				cmd.cab.header.payload_bytes = sizeof(cmd.cab) - sizeof(cmd.cab.header);
+
+				dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+				dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+
+				return true;
+			}
+
+			/* 2. Check if all surfaces can fit in CAB.
+			 * If surfaces can fit into CAB, send CAB_ACTION_ALLOW DMUB message
+			 * and configure HUBP's to fetch from MALL
+			 */
+			ways = dcn32_calculate_cab_allocation(dc, dc->current_state);
+			if (ways <= dc->caps.cache_num_ways) {
+				memset(&cmd, 0, sizeof(cmd));
+				cmd.cab.header.type = DMUB_CMD__CAB_FOR_SS;
+				cmd.cab.header.sub_type = DMUB_CMD__CAB_DCN_SS_FIT_IN_CAB;
+				cmd.cab.header.payload_bytes = sizeof(cmd.cab) - sizeof(cmd.cab.header);
+				cmd.cab.cab_alloc_ways = ways;
+
+				dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+				dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+
+				return true;
+			}
+
+		}
+		return false;
+	}
+
+	/* Disable CAB */
+	memset(&cmd, 0, sizeof(cmd));
+	cmd.cab.header.type = DMUB_CMD__CAB_FOR_SS;
+	cmd.cab.header.sub_type = DMUB_CMD__CAB_NO_IDLE_OPTIMIZATION;
+	cmd.cab.header.payload_bytes =
+			sizeof(cmd.cab) - sizeof(cmd.cab.header);
+
+	dc_dmub_srv_cmd_queue(dc->ctx->dmub_srv, &cmd);
+	dc_dmub_srv_cmd_execute(dc->ctx->dmub_srv);
+	dc_dmub_srv_wait_idle(dc->ctx->dmub_srv);
+
+	return false;
+}
+
+/* Send DMCUB message with SubVP pipe info
+ * - For each pipe in context, populate payload with required SubVP information
+ *   if the pipe is using SubVP for MCLK switch
+ * - This function must be called while the DMUB HW lock is acquired by driver
+ */
+void dcn32_commit_subvp_config(struct dc *dc, struct dc_state *context)
+{
+/*
+	int i;
+	bool enable_subvp = false;
+
+	if (!dc->ctx || !dc->ctx->dmub_srv)
+		return;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe_ctx->stream && pipe_ctx->stream->mall_stream_config.paired_stream &&
+				pipe_ctx->stream->mall_stream_config.type == SUBVP_MAIN) {
+			// There is at least 1 SubVP pipe, so enable SubVP
+			enable_subvp = true;
+			break;
+		}
+	}
+	dc_dmub_setup_subvp_dmub_command(dc, context, enable_subvp);
+*/
+}
+
+static bool dcn32_set_mpc_shaper_3dlut(
+	struct pipe_ctx *pipe_ctx, const struct dc_stream_state *stream)
+{
+	struct dpp *dpp_base = pipe_ctx->plane_res.dpp;
+	int mpcc_id = pipe_ctx->plane_res.hubp->inst;
+	struct mpc *mpc = pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
+	bool result = false;
+
+	const struct pwl_params *shaper_lut = NULL;
+	//get the shaper lut params
+	if (stream->func_shaper) {
+		if (stream->func_shaper->type == TF_TYPE_HWPWL)
+			shaper_lut = &stream->func_shaper->pwl;
+		else if (stream->func_shaper->type == TF_TYPE_DISTRIBUTED_POINTS) {
+			cm_helper_translate_curve_to_hw_format(
+					stream->func_shaper,
+					&dpp_base->shaper_params, true);
+			shaper_lut = &dpp_base->shaper_params;
+		}
+	}
+
+	if (stream->lut3d_func &&
+		stream->lut3d_func->state.bits.initialized == 1) {
+
+		result = mpc->funcs->program_3dlut(mpc,
+								&stream->lut3d_func->lut_3d,
+								mpcc_id);
+
+		result = mpc->funcs->program_shaper(mpc,
+								shaper_lut,
+								mpcc_id);
+	}
+
+	return result;
+}
+bool dcn32_set_output_transfer_func(struct dc *dc,
+				struct pipe_ctx *pipe_ctx,
+				const struct dc_stream_state *stream)
+{
+	int mpcc_id = pipe_ctx->plane_res.hubp->inst;
+	struct mpc *mpc = pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
+	struct pwl_params *params = NULL;
+	bool ret = false;
+
+	/* program OGAM or 3DLUT only for the top pipe*/
+	if (pipe_ctx->top_pipe == NULL) {
+		/*program shaper and 3dlut in MPC*/
+		ret = dcn32_set_mpc_shaper_3dlut(pipe_ctx, stream);
+		if (ret == false && mpc->funcs->set_output_gamma && stream->out_transfer_func) {
+			if (stream->out_transfer_func->type == TF_TYPE_HWPWL)
+				params = &stream->out_transfer_func->pwl;
+			else if (pipe_ctx->stream->out_transfer_func->type ==
+					TF_TYPE_DISTRIBUTED_POINTS &&
+					cm3_helper_translate_curve_to_hw_format(
+					stream->out_transfer_func,
+					&mpc->blender_params, false))
+				params = &mpc->blender_params;
+		 /* there are no ROM LUTs in OUTGAM */
+		if (stream->out_transfer_func->type == TF_TYPE_PREDEFINED)
+			BREAK_TO_DEBUGGER();
+		}
+	}
+
+	mpc->funcs->set_output_gamma(mpc, mpcc_id, params);
+	return ret;
+}
+
+/* Program P-State force value according to if pipe is using SubVP or not:
+ * 1. Reset P-State force on all pipes first
+ * 2. For each main pipe, force P-State disallow (P-State allow moderated by DMUB)
+ */
+void dcn32_subvp_update_force_pstate(struct dc *dc, struct dc_state *context)
+{
+	int i;
+	int num_subvp = 0;
+	/* Unforce p-state for each pipe
+	 */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		struct hubp *hubp = pipe->plane_res.hubp;
+
+		if (hubp && hubp->funcs->hubp_update_force_pstate_disallow)
+			hubp->funcs->hubp_update_force_pstate_disallow(hubp, false);
+		if (pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			num_subvp++;
+	}
+
+	if (num_subvp == 0)
+		return;
+
+	/* Loop through each pipe -- for each subvp main pipe force p-state allow equal to false.
+	 */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe->stream && pipe->plane_state && pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+			struct hubp *hubp = pipe->plane_res.hubp;
+
+			if (hubp && hubp->funcs->hubp_update_force_pstate_disallow)
+				hubp->funcs->hubp_update_force_pstate_disallow(hubp, true);
+		}
+	}
+}
+
+/* Update MALL_SEL register based on if pipe / plane
+ * is a phantom pipe, main pipe, and if using MALL
+ * for SS.
+ */
+void dcn32_update_mall_sel(struct dc *dc, struct dc_state *context)
+{
+	int i;
+	unsigned int num_ways = dcn32_calculate_cab_allocation(dc, context);
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		struct hubp *hubp = pipe->plane_res.hubp;
+
+		if (pipe->stream && pipe->plane_state && hubp && hubp->funcs->hubp_update_mall_sel) {
+			if (pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+					hubp->funcs->hubp_update_mall_sel(hubp, 1);
+			} else {
+				hubp->funcs->hubp_update_mall_sel(hubp,
+					num_ways <= dc->caps.cache_num_ways &&
+					pipe->stream->link->psr_settings.psr_version == DC_PSR_VERSION_UNSUPPORTED ? 2 : 0);
+			}
+		}
+	}
+}
+
+/* Program the sub-viewport pipe configuration after the main / phantom pipes
+ * have been programmed in hardware.
+ * 1. Update force P-State for all the main pipes (disallow P-state)
+ * 2. Update MALL_SEL register
+ * 3. Program FORCE_ONE_ROW_FOR_FRAME for main subvp pipes
+ */
+void dcn32_program_mall_pipe_config(struct dc *dc, struct dc_state *context)
+{
+	int i;
+	struct dce_hwseq *hws = dc->hwseq;
+	// Update force P-state for each pipe accordingly
+	if (hws && hws->funcs.subvp_update_force_pstate)
+		hws->funcs.subvp_update_force_pstate(dc, context);
+
+	// Update MALL_SEL register for each pipe
+	if (hws && hws->funcs.update_mall_sel)
+		hws->funcs.update_mall_sel(dc, context);
+
+	// Program FORCE_ONE_ROW_FOR_FRAME and CURSOR_REQ_MODE for main subvp pipes
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		struct hubp *hubp = pipe->plane_res.hubp;
+
+		if (pipe->stream && hubp && hubp->funcs->hubp_prepare_subvp_buffering) {
+			if (pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+				hubp->funcs->hubp_prepare_subvp_buffering(hubp, true);
+			} else {
+				hubp->funcs->hubp_prepare_subvp_buffering(hubp, false);
+			}
+		}
+	}
+}
+
+void dcn32_init_hw(struct dc *dc)
+{
+	struct abm **abms = dc->res_pool->multiple_abms;
+	struct dce_hwseq *hws = dc->hwseq;
+	struct dc_bios *dcb = dc->ctx->dc_bios;
+	struct resource_pool *res_pool = dc->res_pool;
+	int i;
+	int edp_num;
+	uint32_t backlight = MAX_BACKLIGHT_LEVEL;
+
+	dc->debug.disable_idle_power_optimizations = true;
+	if (dc->clk_mgr && dc->clk_mgr->funcs->init_clocks)
+		dc->clk_mgr->funcs->init_clocks(dc->clk_mgr);
+
+	// Initialize the dccg
+	if (res_pool->dccg->funcs->dccg_init)
+		res_pool->dccg->funcs->dccg_init(res_pool->dccg);
+
+	if (!dcb->funcs->is_accelerated_mode(dcb)) {
+		hws->funcs.bios_golden_init(dc);
+		hws->funcs.disable_vga(dc->hwseq);
+	}
+
+	// Set default OPTC memory power states
+	if (dc->debug.enable_mem_low_power.bits.optc) {
+		// Shutdown when unassigned and light sleep in VBLANK
+		REG_SET_2(ODM_MEM_PWR_CTRL3, 0, ODM_MEM_UNASSIGNED_PWR_MODE, 3, ODM_MEM_VBLANK_PWR_MODE, 1);
+	}
+
+	if (dc->debug.enable_mem_low_power.bits.vga) {
+		// Power down VGA memory
+		REG_UPDATE(MMHUBBUB_MEM_PWR_CNTL, VGA_MEM_PWR_FORCE, 1);
+	}
+
+	if (dc->ctx->dc_bios->fw_info_valid) {
+		res_pool->ref_clocks.xtalin_clock_inKhz =
+				dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency;
+
+		if (res_pool->dccg && res_pool->hubbub) {
+			(res_pool->dccg->funcs->get_dccg_ref_freq)(res_pool->dccg,
+					dc->ctx->dc_bios->fw_info.pll_info.crystal_frequency,
+					&res_pool->ref_clocks.dccg_ref_clock_inKhz);
+
+			(res_pool->hubbub->funcs->get_dchub_ref_freq)(res_pool->hubbub,
+					res_pool->ref_clocks.dccg_ref_clock_inKhz,
+					&res_pool->ref_clocks.dchub_ref_clock_inKhz);
+		} else {
+			// Not all ASICs have DCCG sw component
+			res_pool->ref_clocks.dccg_ref_clock_inKhz =
+					res_pool->ref_clocks.xtalin_clock_inKhz;
+			res_pool->ref_clocks.dchub_ref_clock_inKhz =
+					res_pool->ref_clocks.xtalin_clock_inKhz;
+		}
+	} else
+		ASSERT_CRITICAL(false);
+
+	for (i = 0; i < dc->link_count; i++) {
+		/* Power up AND update implementation according to the
+		 * required signal (which may be different from the
+		 * default signal on connector).
+		 */
+		struct dc_link *link = dc->links[i];
+
+		link->link_enc->funcs->hw_init(link->link_enc);
+
+		/* Check for enabled DIG to identify enabled display */
+		if (link->link_enc->funcs->is_dig_enabled &&
+			link->link_enc->funcs->is_dig_enabled(link->link_enc))
+			link->link_status.link_active = true;
+	}
+
+	/* Power gate DSCs */
+	for (i = 0; i < res_pool->res_cap->num_dsc; i++)
+		if (hws->funcs.dsc_pg_control != NULL)
+			hws->funcs.dsc_pg_control(hws, res_pool->dscs[i]->inst, false);
+
+	/* we want to turn off all dp displays before doing detection */
+	dc_link_blank_all_dp_displays(dc);
+
+	/* If taking control over from VBIOS, we may want to optimize our first
+	 * mode set, so we need to skip powering down pipes until we know which
+	 * pipes we want to use.
+	 * Otherwise, if taking control is not possible, we need to power
+	 * everything down.
+	 */
+	if (dcb->funcs->is_accelerated_mode(dcb) || dc->config.power_down_display_on_boot) {
+		hws->funcs.init_pipes(dc, dc->current_state);
+		if (dc->res_pool->hubbub->funcs->allow_self_refresh_control)
+			dc->res_pool->hubbub->funcs->allow_self_refresh_control(dc->res_pool->hubbub,
+					!dc->res_pool->hubbub->ctx->dc->debug.disable_stutter);
+	}
+
+	/* In headless boot cases, DIG may be turned
+	 * on which causes HW/SW discrepancies.
+	 * To avoid this, power down hardware on boot
+	 * if DIG is turned on and seamless boot not enabled
+	 */
+	if (dc->config.power_down_display_on_boot) {
+		struct dc_link *edp_links[MAX_NUM_EDP];
+		struct dc_link *edp_link;
+
+		get_edp_links(dc, edp_links, &edp_num);
+		if (edp_num) {
+			for (i = 0; i < edp_num; i++) {
+				edp_link = edp_links[i];
+				if (edp_link->link_enc->funcs->is_dig_enabled &&
+						edp_link->link_enc->funcs->is_dig_enabled(edp_link->link_enc) &&
+						dc->hwss.edp_backlight_control &&
+						dc->hwss.power_down &&
+						dc->hwss.edp_power_control) {
+					dc->hwss.edp_backlight_control(edp_link, false);
+					dc->hwss.power_down(dc);
+					dc->hwss.edp_power_control(edp_link, false);
+				}
+			}
+		} else {
+			for (i = 0; i < dc->link_count; i++) {
+				struct dc_link *link = dc->links[i];
+
+				if (link->link_enc->funcs->is_dig_enabled &&
+						link->link_enc->funcs->is_dig_enabled(link->link_enc) &&
+						dc->hwss.power_down) {
+					dc->hwss.power_down(dc);
+					break;
+				}
+
+			}
+		}
+	}
+
+	for (i = 0; i < res_pool->audio_count; i++) {
+		struct audio *audio = res_pool->audios[i];
+
+		audio->funcs->hw_init(audio);
+	}
+
+	for (i = 0; i < dc->link_count; i++) {
+		struct dc_link *link = dc->links[i];
+
+		if (link->panel_cntl)
+			backlight = link->panel_cntl->funcs->hw_init(link->panel_cntl);
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (abms[i] != NULL && abms[i]->funcs != NULL)
+			abms[i]->funcs->abm_init(abms[i], backlight);
+	}
+
+	/* power AFMT HDMI memory TODO: may move to dis/en output save power*/
+	REG_WRITE(DIO_MEM_PWR_CTRL, 0);
+
+	if (!dc->debug.disable_clock_gate) {
+		/* enable all DCN clock gating */
+		REG_WRITE(DCCG_GATE_DISABLE_CNTL, 0);
+
+		REG_WRITE(DCCG_GATE_DISABLE_CNTL2, 0);
+
+		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
+	}
+	if (hws->funcs.enable_power_gating_plane)
+		hws->funcs.enable_power_gating_plane(dc->hwseq, true);
+
+	if (!dcb->funcs->is_accelerated_mode(dcb) && dc->res_pool->hubbub->funcs->init_watermarks)
+		dc->res_pool->hubbub->funcs->init_watermarks(dc->res_pool->hubbub);
+
+	if (dc->clk_mgr->funcs->notify_wm_ranges)
+		dc->clk_mgr->funcs->notify_wm_ranges(dc->clk_mgr);
+
+	if (dc->clk_mgr->funcs->set_hard_max_memclk)
+		dc->clk_mgr->funcs->set_hard_max_memclk(dc->clk_mgr);
+
+	if (dc->res_pool->hubbub->funcs->force_pstate_change_control)
+		dc->res_pool->hubbub->funcs->force_pstate_change_control(
+				dc->res_pool->hubbub, false, false);
+
+	if (dc->res_pool->hubbub->funcs->init_crb)
+		dc->res_pool->hubbub->funcs->init_crb(dc->res_pool->hubbub);
+
+	// Get DMCUB capabilities
+    if (dc->ctx->dmub_srv) {
+	dc_dmub_srv_query_caps_cmd(dc->ctx->dmub_srv->dmub);
+	dc->caps.dmub_caps.psr = dc->ctx->dmub_srv->dmub->feature_caps.psr;
+    }
+}
+
+static int calc_mpc_flow_ctrl_cnt(const struct dc_stream_state *stream,
+		int opp_cnt)
+{
+	bool hblank_halved = optc2_is_two_pixels_per_containter(&stream->timing);
+	int flow_ctrl_cnt;
+
+	if (opp_cnt >= 2)
+		hblank_halved = true;
+
+	flow_ctrl_cnt = stream->timing.h_total - stream->timing.h_addressable -
+			stream->timing.h_border_left -
+			stream->timing.h_border_right;
+
+	if (hblank_halved)
+		flow_ctrl_cnt /= 2;
+
+	/* ODM combine 4:1 case */
+	if (opp_cnt == 4)
+		flow_ctrl_cnt /= 2;
+
+	return flow_ctrl_cnt;
+}
+
+static void update_dsc_on_stream(struct pipe_ctx *pipe_ctx, bool enable)
+{
+	struct display_stream_compressor *dsc = pipe_ctx->stream_res.dsc;
+	struct dc_stream_state *stream = pipe_ctx->stream;
+	struct pipe_ctx *odm_pipe;
+	int opp_cnt = 1;
+
+	ASSERT(dsc);
+	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe)
+		opp_cnt++;
+
+	if (enable) {
+		struct dsc_config dsc_cfg;
+		struct dsc_optc_config dsc_optc_cfg;
+		enum optc_dsc_mode optc_dsc_mode;
+
+		/* Enable DSC hw block */
+		dsc_cfg.pic_width = (stream->timing.h_addressable + stream->timing.h_border_left + stream->timing.h_border_right) / opp_cnt;
+		dsc_cfg.pic_height = stream->timing.v_addressable + stream->timing.v_border_top + stream->timing.v_border_bottom;
+		dsc_cfg.pixel_encoding = stream->timing.pixel_encoding;
+		dsc_cfg.color_depth = stream->timing.display_color_depth;
+		dsc_cfg.is_odm = pipe_ctx->next_odm_pipe ? true : false;
+		dsc_cfg.dc_dsc_cfg = stream->timing.dsc_cfg;
+		ASSERT(dsc_cfg.dc_dsc_cfg.num_slices_h % opp_cnt == 0);
+		dsc_cfg.dc_dsc_cfg.num_slices_h /= opp_cnt;
+
+		dsc->funcs->dsc_set_config(dsc, &dsc_cfg, &dsc_optc_cfg);
+		dsc->funcs->dsc_enable(dsc, pipe_ctx->stream_res.opp->inst);
+		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
+			struct display_stream_compressor *odm_dsc = odm_pipe->stream_res.dsc;
+
+			ASSERT(odm_dsc);
+			odm_dsc->funcs->dsc_set_config(odm_dsc, &dsc_cfg, &dsc_optc_cfg);
+			odm_dsc->funcs->dsc_enable(odm_dsc, odm_pipe->stream_res.opp->inst);
+		}
+		dsc_cfg.dc_dsc_cfg.num_slices_h *= opp_cnt;
+		dsc_cfg.pic_width *= opp_cnt;
+
+		optc_dsc_mode = dsc_optc_cfg.is_pixel_format_444 ? OPTC_DSC_ENABLED_444 : OPTC_DSC_ENABLED_NATIVE_SUBSAMPLED;
+
+		/* Enable DSC in OPTC */
+		DC_LOG_DSC("Setting optc DSC config for tg instance %d:", pipe_ctx->stream_res.tg->inst);
+		pipe_ctx->stream_res.tg->funcs->set_dsc_config(pipe_ctx->stream_res.tg,
+							optc_dsc_mode,
+							dsc_optc_cfg.bytes_per_pixel,
+							dsc_optc_cfg.slice_width);
+	} else {
+		/* disable DSC in OPTC */
+		pipe_ctx->stream_res.tg->funcs->set_dsc_config(
+				pipe_ctx->stream_res.tg,
+				OPTC_DSC_DISABLED, 0, 0);
+
+		/* disable DSC block */
+		dsc->funcs->dsc_disable(pipe_ctx->stream_res.dsc);
+		for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
+			ASSERT(odm_pipe->stream_res.dsc);
+			odm_pipe->stream_res.dsc->funcs->dsc_disable(odm_pipe->stream_res.dsc);
+		}
+	}
+}
+
+void dcn32_update_odm(struct dc *dc, struct dc_state *context, struct pipe_ctx *pipe_ctx)
+{
+	struct pipe_ctx *odm_pipe;
+	int opp_cnt = 1;
+	int opp_inst[MAX_PIPES] = { pipe_ctx->stream_res.opp->inst };
+	bool rate_control_2x_pclk = (pipe_ctx->stream->timing.flags.INTERLACE || optc2_is_two_pixels_per_containter(&pipe_ctx->stream->timing));
+	struct mpc_dwb_flow_control flow_control;
+	struct mpc *mpc = dc->res_pool->mpc;
+	int i;
+
+	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
+		opp_inst[opp_cnt] = odm_pipe->stream_res.opp->inst;
+		opp_cnt++;
+	}
+
+	if (opp_cnt > 1)
+		pipe_ctx->stream_res.tg->funcs->set_odm_combine(
+				pipe_ctx->stream_res.tg,
+				opp_inst, opp_cnt,
+				&pipe_ctx->stream->timing);
+	else
+		pipe_ctx->stream_res.tg->funcs->set_odm_bypass(
+				pipe_ctx->stream_res.tg, &pipe_ctx->stream->timing);
+
+	rate_control_2x_pclk = rate_control_2x_pclk || opp_cnt > 1;
+	flow_control.flow_ctrl_mode = 0;
+	flow_control.flow_ctrl_cnt0 = 0x80;
+	flow_control.flow_ctrl_cnt1 = calc_mpc_flow_ctrl_cnt(pipe_ctx->stream, opp_cnt);
+	if (mpc->funcs->set_out_rate_control) {
+		for (i = 0; i < opp_cnt; ++i) {
+			mpc->funcs->set_out_rate_control(
+					mpc, opp_inst[i],
+					true,
+					rate_control_2x_pclk,
+					&flow_control);
+		}
+	}
+
+	for (odm_pipe = pipe_ctx->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
+		odm_pipe->stream_res.opp->funcs->opp_pipe_clock_control(
+				odm_pipe->stream_res.opp,
+				true);
+	}
+
+	// Don't program pixel clock after link is already enabled
+/*	if (false == pipe_ctx->clock_source->funcs->program_pix_clk(
+			pipe_ctx->clock_source,
+			&pipe_ctx->stream_res.pix_clk_params,
+			&pipe_ctx->pll_settings)) {
+		BREAK_TO_DEBUGGER();
+	}*/
+
+	if (pipe_ctx->stream_res.dsc)
+		update_dsc_on_stream(pipe_ctx, pipe_ctx->stream->timing.flags.DSC);
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
new file mode 100644
index 000000000000..737a7fac5cf9
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hwseq.h
@@ -0,0 +1,64 @@
+/*
+* Copyright 2016 Advanced Micro Devices, Inc.
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
+#ifndef __DC_HWSS_DCN32_H__
+#define __DC_HWSS_DCN32_H__
+
+#include "hw_sequencer_private.h"
+
+struct dc;
+
+void dcn32_dsc_pg_control(
+		struct dce_hwseq *hws,
+		unsigned int dsc_inst,
+		bool power_on);
+
+void dcn32_enable_power_gating_plane(
+	struct dce_hwseq *hws,
+	bool enable);
+
+void dcn32_hubp_pg_control(struct dce_hwseq *hws, unsigned int hubp_inst, bool power_on);
+
+bool dcn32_apply_idle_power_optimizations(struct dc *dc, bool enable);
+
+void dcn32_cab_for_ss_control(struct dc *dc, bool enable);
+
+void dcn32_commit_subvp_config(struct dc *dc, struct dc_state *context);
+
+bool dcn32_set_output_transfer_func(struct dc *dc,
+				struct pipe_ctx *pipe_ctx,
+				const struct dc_stream_state *stream);
+
+void dcn32_init_hw(struct dc *dc);
+
+void dcn32_program_mall_pipe_config(struct dc *dc, struct dc_state *context);
+
+void dcn32_update_mall_sel(struct dc *dc, struct dc_state *context);
+
+void dcn32_subvp_update_force_pstate(struct dc *dc, struct dc_state *context);
+
+void dcn32_update_odm(struct dc *dc, struct dc_state *context, struct pipe_ctx *pipe_ctx);
+
+#endif /* __DC_HWSS_DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
new file mode 100644
index 000000000000..d1e3db1bc488
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
@@ -0,0 +1,155 @@
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
+
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn10/dcn10_hw_sequencer.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn21/dcn21_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dcn31/dcn31_hwseq.h"
+#include "dcn32_hwseq.h"
+
+static const struct hw_sequencer_funcs dcn32_funcs = {
+	.program_gamut_remap = dcn10_program_gamut_remap,
+	.init_hw = dcn32_init_hw,
+	.apply_ctx_to_hw = dce110_apply_ctx_to_hw,
+	.apply_ctx_for_surface = NULL,
+	.program_front_end_for_ctx = dcn20_program_front_end_for_ctx,
+	.wait_for_pending_cleared = dcn10_wait_for_pending_cleared,
+	.post_unlock_program_front_end = dcn20_post_unlock_program_front_end,
+	.update_plane_addr = dcn20_update_plane_addr,
+	.update_dchub = dcn10_update_dchub,
+	.update_pending_status = dcn10_update_pending_status,
+	.program_output_csc = dcn20_program_output_csc,
+	.enable_accelerated_mode = dce110_enable_accelerated_mode,
+	.enable_timing_synchronization = dcn10_enable_timing_synchronization,
+	.enable_per_frame_crtc_position_reset = dcn10_enable_per_frame_crtc_position_reset,
+	.update_info_frame = dcn31_update_info_frame,
+	.send_immediate_sdp_message = dcn10_send_immediate_sdp_message,
+	.enable_stream = dcn20_enable_stream,
+	.disable_stream = dce110_disable_stream,
+	.unblank_stream = dcn20_unblank_stream,
+	.blank_stream = dce110_blank_stream,
+	.enable_audio_stream = dce110_enable_audio_stream,
+	.disable_audio_stream = dce110_disable_audio_stream,
+	.disable_plane = dcn20_disable_plane,
+	.pipe_control_lock = dcn20_pipe_control_lock,
+	.interdependent_update_lock = dcn10_lock_all_pipes,
+	.cursor_lock = dcn10_cursor_lock,
+	.prepare_bandwidth = dcn20_prepare_bandwidth,
+	.optimize_bandwidth = dcn20_optimize_bandwidth,
+	.update_bandwidth = dcn20_update_bandwidth,
+	.set_drr = dcn10_set_drr,
+	.get_position = dcn10_get_position,
+	.set_static_screen_control = dcn10_set_static_screen_control,
+	.setup_stereo = dcn10_setup_stereo,
+	.set_avmute = dcn30_set_avmute,
+	.log_hw_state = dcn10_log_hw_state,
+	.get_hw_state = dcn10_get_hw_state,
+	.clear_status_bits = dcn10_clear_status_bits,
+	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
+	.edp_backlight_control = dce110_edp_backlight_control,
+	.edp_power_control = dce110_edp_power_control,
+	.edp_wait_for_hpd_ready = dce110_edp_wait_for_hpd_ready,
+	.edp_wait_for_T12 = dce110_edp_wait_for_T12,
+	.set_cursor_position = dcn10_set_cursor_position,
+	.set_cursor_attribute = dcn10_set_cursor_attribute,
+	.set_cursor_sdr_white_level = dcn10_set_cursor_sdr_white_level,
+	.setup_periodic_interrupt = dcn10_setup_periodic_interrupt,
+	.set_clock = dcn10_set_clock,
+	.get_clock = dcn10_get_clock,
+	.program_triplebuffer = dcn20_program_triple_buffer,
+	.enable_writeback = dcn30_enable_writeback,
+	.disable_writeback = dcn30_disable_writeback,
+	.update_writeback = dcn30_update_writeback,
+	.mmhubbub_warmup = dcn30_mmhubbub_warmup,
+	.dmdata_status_done = dcn20_dmdata_status_done,
+	.program_dmdata_engine = dcn30_program_dmdata_engine,
+	.set_dmdata_attributes = dcn20_set_dmdata_attributes,
+	.init_sys_ctx = dcn20_init_sys_ctx,
+	.init_vm_ctx = dcn20_init_vm_ctx,
+	.set_flip_control_gsl = dcn20_set_flip_control_gsl,
+	.get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
+	.calc_vupdate_position = dcn10_calc_vupdate_position,
+	.apply_idle_power_optimizations = dcn32_apply_idle_power_optimizations,
+	.does_plane_fit_in_mall = dcn30_does_plane_fit_in_mall,
+	.set_backlight_level = dcn21_set_backlight_level,
+	.set_abm_immediate_disable = dcn21_set_abm_immediate_disable,
+	.hardware_release = dcn30_hardware_release,
+	.set_pipe = dcn21_set_pipe,
+	.set_disp_pattern_generator = dcn30_set_disp_pattern_generator,
+	.get_dcc_en_bits = dcn10_get_dcc_en_bits,
+	.commit_subvp_config = dcn32_commit_subvp_config,
+	.update_visual_confirm_color = dcn20_update_visual_confirm_color,
+};
+
+static const struct hwseq_private_funcs dcn32_private_funcs = {
+	.init_pipes = dcn10_init_pipes,
+	.update_plane_addr = dcn20_update_plane_addr,
+	.plane_atomic_disconnect = dcn10_plane_atomic_disconnect,
+	.update_mpcc = dcn20_update_mpcc,
+	.set_input_transfer_func = dcn30_set_input_transfer_func,
+	.set_output_transfer_func = dcn32_set_output_transfer_func,
+	.power_down = dce110_power_down,
+	.enable_display_power_gating = dcn10_dummy_display_power_gating,
+	.blank_pixel_data = dcn20_blank_pixel_data,
+	.reset_hw_ctx_wrap = dcn20_reset_hw_ctx_wrap,
+	.enable_stream_timing = dcn20_enable_stream_timing,
+	.edp_backlight_control = dce110_edp_backlight_control,
+	.disable_stream_gating = dcn20_disable_stream_gating,
+	.enable_stream_gating = dcn20_enable_stream_gating,
+	.setup_vupdate_interrupt = dcn20_setup_vupdate_interrupt,
+	.did_underflow_occur = dcn10_did_underflow_occur,
+	.init_blank = dcn20_init_blank,
+	.disable_vga = dcn20_disable_vga,
+	.bios_golden_init = dcn10_bios_golden_init,
+	.plane_atomic_disable = dcn20_plane_atomic_disable,
+	.plane_atomic_power_down = dcn10_plane_atomic_power_down,
+	.enable_power_gating_plane = dcn32_enable_power_gating_plane,
+	.hubp_pg_control = dcn32_hubp_pg_control,
+	.program_all_writeback_pipes_in_tree = dcn30_program_all_writeback_pipes_in_tree,
+	.update_odm = dcn32_update_odm,
+	.dsc_pg_control = dcn32_dsc_pg_control,
+	.set_hdr_multiplier = dcn10_set_hdr_multiplier,
+	.verify_allow_pstate_change_high = dcn10_verify_allow_pstate_change_high,
+	.wait_for_blank_complete = dcn20_wait_for_blank_complete,
+	.dccg_init = dcn20_dccg_init,
+	.set_blend_lut = dcn30_set_blend_lut,
+	.set_shaper_3dlut = dcn20_set_shaper_3dlut,
+	.program_mall_pipe_config = dcn32_program_mall_pipe_config,
+	.subvp_update_force_pstate = dcn32_subvp_update_force_pstate,
+	.update_mall_sel = dcn32_update_mall_sel,
+};
+
+void dcn32_hw_sequencer_init_functions(struct dc *dc)
+{
+	dc->hwss = dcn32_funcs;
+	dc->hwseq->funcs = dcn32_private_funcs;
+
+	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+		dc->hwss.init_hw = dcn20_fpga_init_hw;
+		dc->hwseq->funcs.init_pipes = NULL;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.h
new file mode 100644
index 000000000000..89a591eb2c23
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.h
@@ -0,0 +1,33 @@
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
+
+#ifndef __DC_DCN32_INIT_H__
+#define __DC_DCN32_INIT_H__
+
+struct dc;
+
+void dcn32_hw_sequencer_init_functions(struct dc *dc);
+
+#endif /* __DC_DCN32_INIT_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
new file mode 100644
index 000000000000..adf93cc8359c
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.c
@@ -0,0 +1,239 @@
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
+
+
+#include "reg_helper.h"
+#include "resource.h"
+#include "mcif_wb.h"
+#include "dcn32_mmhubbub.h"
+
+
+#define REG(reg)\
+	mcif_wb30->mcif_wb_regs->reg
+
+#define CTX \
+	mcif_wb30->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	mcif_wb30->mcif_wb_shift->field_name, mcif_wb30->mcif_wb_mask->field_name
+
+#define MCIF_ADDR(addr) (((unsigned long long)addr & 0xffffffffff) + 0xFE) >> 8
+#define MCIF_ADDR_HIGH(addr) (unsigned long long)addr >> 40
+
+/* wbif programming guide:
+ * 1. set up wbif parameter:
+ *    unsigned long long   luma_address[4];       //4 frame buffer
+ *    unsigned long long   chroma_address[4];
+ *    unsigned int	   luma_pitch;
+ *    unsigned int	   chroma_pitch;
+ *    unsigned int         warmup_pitch=0x10;     //256B align, the page size is 4KB when it is 0x10
+ *    unsigned int	   slice_lines;           //slice size
+ *    unsigned int         time_per_pixel;        // time per pixel, in ns
+ *    unsigned int         arbitration_slice;     // 0: 2048 bytes 1: 4096 bytes 2: 8192 Bytes
+ *    unsigned int         max_scaled_time;       // used for QOS generation
+ *    unsigned int         swlock=0x0;
+ *    unsigned int         cli_watermark[4];      //4 group urgent watermark
+ *    unsigned int         pstate_watermark[4];   //4 group pstate watermark
+ *    unsigned int         sw_int_en;             // Software interrupt enable, frame end and overflow
+ *    unsigned int         sw_slice_int_en;       // slice end interrupt enable
+ *    unsigned int         sw_overrun_int_en;     // overrun error interrupt enable
+ *    unsigned int         vce_int_en;            // VCE interrupt enable, frame end and overflow
+ *    unsigned int         vce_slice_int_en;      // VCE slice end interrupt enable, frame end and overflow
+ *
+ * 2. configure wbif register
+ *    a. call mmhubbub_config_wbif()
+ *
+ * 3. Enable wbif
+ *    call set_wbif_bufmgr_enable();
+ *
+ * 4. wbif_dump_status(), option, for debug purpose
+ *    the bufmgr status can show the progress of write back, can be used for debug purpose
+ */
+
+static void mmhubbub32_warmup_mcif(struct mcif_wb *mcif_wb,
+		struct mcif_warmup_params *params)
+{
+	struct dcn30_mmhubbub *mcif_wb30 = TO_DCN30_MMHUBBUB(mcif_wb);
+	union large_integer start_address_shift = {.quad_part = params->start_address.quad_part >> 5};
+
+	/* Set base address and region size for warmup */
+	REG_SET(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, 0, MMHUBBUB_WARMUP_BASE_ADDR_HIGH, start_address_shift.high_part);
+	REG_SET(MMHUBBUB_WARMUP_BASE_ADDR_LOW, 0, MMHUBBUB_WARMUP_BASE_ADDR_LOW, start_address_shift.low_part);
+	REG_SET(MMHUBBUB_WARMUP_ADDR_REGION, 0, MMHUBBUB_WARMUP_ADDR_REGION, params->region_size >> 5);
+//	REG_SET(MMHUBBUB_WARMUP_P_VMID, 0, MMHUBBUB_WARMUP_P_VMID, params->p_vmid);
+
+	/* Set address increment and enable warmup */
+	REG_SET_3(MMHUBBUB_WARMUP_CONTROL_STATUS, 0, MMHUBBUB_WARMUP_EN, true,
+			MMHUBBUB_WARMUP_SW_INT_EN, true,
+			MMHUBBUB_WARMUP_INC_ADDR, params->address_increment >> 5);
+
+	/* Wait for an interrupt to signal warmup is completed */
+	REG_WAIT(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_STATUS, 1, 20, 100);
+
+	/* Acknowledge interrupt */
+	REG_UPDATE(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_ACK, 1);
+
+	/* Disable warmup */
+	REG_UPDATE(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_EN, false);
+}
+
+void mmhubbub32_config_mcif_buf(struct mcif_wb *mcif_wb,
+		struct mcif_buf_params *params,
+		unsigned int dest_height)
+{
+	struct dcn30_mmhubbub *mcif_wb30 = TO_DCN30_MMHUBBUB(mcif_wb);
+
+	/* buffer address for packing mode or Luma in planar mode */
+	REG_UPDATE(MCIF_WB_BUF_1_ADDR_Y, MCIF_WB_BUF_1_ADDR_Y, MCIF_ADDR(params->luma_address[0]));
+	REG_UPDATE(MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_ADDR_HIGH(params->luma_address[0]));
+
+	/* buffer address for Chroma in planar mode (unused in packing mode) */
+	REG_UPDATE(MCIF_WB_BUF_1_ADDR_C, MCIF_WB_BUF_1_ADDR_C, MCIF_ADDR(params->chroma_address[0]));
+	REG_UPDATE(MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_ADDR_HIGH(params->chroma_address[0]));
+
+	/* buffer address for packing mode or Luma in planar mode */
+	REG_UPDATE(MCIF_WB_BUF_2_ADDR_Y, MCIF_WB_BUF_2_ADDR_Y, MCIF_ADDR(params->luma_address[1]));
+	REG_UPDATE(MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_ADDR_HIGH(params->luma_address[1]));
+
+	/* buffer address for Chroma in planar mode (unused in packing mode) */
+	REG_UPDATE(MCIF_WB_BUF_2_ADDR_C, MCIF_WB_BUF_2_ADDR_C, MCIF_ADDR(params->chroma_address[1]));
+	REG_UPDATE(MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_ADDR_HIGH(params->chroma_address[1]));
+
+	/* buffer address for packing mode or Luma in planar mode */
+	REG_UPDATE(MCIF_WB_BUF_3_ADDR_Y, MCIF_WB_BUF_3_ADDR_Y, MCIF_ADDR(params->luma_address[2]));
+	REG_UPDATE(MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_ADDR_HIGH(params->luma_address[2]));
+
+	/* buffer address for Chroma in planar mode (unused in packing mode) */
+	REG_UPDATE(MCIF_WB_BUF_3_ADDR_C, MCIF_WB_BUF_3_ADDR_C, MCIF_ADDR(params->chroma_address[2]));
+	REG_UPDATE(MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_ADDR_HIGH(params->chroma_address[2]));
+
+	/* buffer address for packing mode or Luma in planar mode */
+	REG_UPDATE(MCIF_WB_BUF_4_ADDR_Y, MCIF_WB_BUF_4_ADDR_Y, MCIF_ADDR(params->luma_address[3]));
+	REG_UPDATE(MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_ADDR_HIGH(params->luma_address[3]));
+
+	/* buffer address for Chroma in planar mode (unused in packing mode) */
+	REG_UPDATE(MCIF_WB_BUF_4_ADDR_C, MCIF_WB_BUF_4_ADDR_C, MCIF_ADDR(params->chroma_address[3]));
+	REG_UPDATE(MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_ADDR_HIGH(params->chroma_address[3]));
+
+	/* setup luma & chroma size
+	 * should be enough to contain a whole frame Luma data,
+	 * the programmed value is frame buffer size [27:8], 256-byte aligned
+	 */
+	REG_UPDATE(MCIF_WB_BUF_LUMA_SIZE, MCIF_WB_BUF_LUMA_SIZE, (params->luma_pitch>>8) * dest_height);
+	REG_UPDATE(MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB_BUF_CHROMA_SIZE, (params->chroma_pitch>>8) * dest_height);
+
+	/* enable address fence */
+	REG_UPDATE(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUF_ADDR_FENCE_EN, 1);
+
+	/* setup pitch, the programmed value is [15:8], 256B align */
+	REG_UPDATE_2(MCIF_WB_BUF_PITCH, MCIF_WB_BUF_LUMA_PITCH, params->luma_pitch >> 8,
+			MCIF_WB_BUF_CHROMA_PITCH, params->chroma_pitch >> 8);
+}
+
+static void mmhubbub32_config_mcif_arb(struct mcif_wb *mcif_wb,
+		struct mcif_arb_params *params)
+{
+	struct dcn30_mmhubbub *mcif_wb30 = TO_DCN30_MMHUBBUB(mcif_wb);
+
+	/* Programmed by the video driver based on the CRTC timing (for DWB) */
+	REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_TIME_PER_PIXEL, params->time_per_pixel);
+
+	/* Programming dwb watermark */
+	/* Watermark to generate urgent in MCIF_WB_CLI, value is determined by MCIF_WB_CLI_WATERMARK_MASK. */
+	/* Program in ns. A formula will be provided in the pseudo code to calculate the value. */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, 0x0);
+	/* urgent_watermarkA */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK,  params->cli_watermark[0]);
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, 0x1);
+	/* urgent_watermarkB */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK,  params->cli_watermark[1]);
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, 0x2);
+	/* urgent_watermarkC */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK,  params->cli_watermark[2]);
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, 0x3);
+	/* urgent_watermarkD */
+	REG_UPDATE(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK,  params->cli_watermark[3]);
+
+	/* Programming nb pstate watermark */
+	/* nbp_state_change_watermarkA */
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, 0x0);
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK,
+			NB_PSTATE_CHANGE_REFRESH_WATERMARK, params->pstate_watermark[0]);
+	/* nbp_state_change_watermarkB */
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, 0x1);
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK,
+			NB_PSTATE_CHANGE_REFRESH_WATERMARK, params->pstate_watermark[1]);
+	/* nbp_state_change_watermarkC */
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, 0x2);
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK,
+			NB_PSTATE_CHANGE_REFRESH_WATERMARK, params->pstate_watermark[2]);
+	/* nbp_state_change_watermarkD */
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, 0x3);
+	REG_UPDATE(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK,
+			NB_PSTATE_CHANGE_REFRESH_WATERMARK, params->pstate_watermark[3]);
+
+	/* dram_speed_change_duration - register removed */
+	//REG_UPDATE(MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI,
+	//		MCIF_WB_DRAM_SPEED_CHANGE_DURATION_VBI, params->dram_speed_change_duration);
+
+	/* max_scaled_time */
+	REG_UPDATE(MULTI_LEVEL_QOS_CTRL, MAX_SCALED_TIME_TO_URGENT, params->max_scaled_time);
+
+	/* slice_lines */
+	REG_UPDATE(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_SLICE_SIZE, params->slice_lines-1);
+
+	/* Set arbitration unit for Luma/Chroma */
+	/* arb_unit=2 should be chosen for more efficiency */
+	/* Arbitration size, 0: 2048 bytes 1: 4096 bytes 2: 8192 Bytes */
+	REG_UPDATE(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE,  params->arbitration_slice);
+}
+
+const struct mcif_wb_funcs dcn32_mmhubbub_funcs = {
+	.warmup_mcif		= mmhubbub32_warmup_mcif,
+	.enable_mcif		= mmhubbub2_enable_mcif,
+	.disable_mcif		= mmhubbub2_disable_mcif,
+	.config_mcif_buf	= mmhubbub32_config_mcif_buf,
+	.config_mcif_arb	= mmhubbub32_config_mcif_arb,
+	.config_mcif_irq	= mmhubbub2_config_mcif_irq,
+	.dump_frame			= mcifwb2_dump_frame,
+};
+
+void dcn32_mmhubbub_construct(struct dcn30_mmhubbub *mcif_wb30,
+		struct dc_context *ctx,
+		const struct dcn30_mmhubbub_registers *mcif_wb_regs,
+		const struct dcn30_mmhubbub_shift *mcif_wb_shift,
+		const struct dcn30_mmhubbub_mask *mcif_wb_mask,
+		int inst)
+{
+	mcif_wb30->base.ctx = ctx;
+
+	mcif_wb30->base.inst = inst;
+	mcif_wb30->base.funcs = &dcn32_mmhubbub_funcs;
+
+	mcif_wb30->mcif_wb_regs = mcif_wb_regs;
+	mcif_wb30->mcif_wb_shift = mcif_wb_shift;
+	mcif_wb30->mcif_wb_mask = mcif_wb_mask;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h
new file mode 100644
index 000000000000..22355051f5f7
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mmhubbub.h
@@ -0,0 +1,225 @@
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
+#ifndef __DC_MCIF_WB_DCN32_H__
+#define __DC_MCIF_WB_DCN32_H__
+
+#include "dcn20/dcn20_mmhubbub.h"
+#include "dcn30/dcn30_mmhubbub.h"
+
+#define MCIF_WB_COMMON_REG_LIST_DCN32(inst) \
+	SRI2(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUFMGR_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_PITCH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_STATUS2, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_STATUS2, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_STATUS2, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_STATUS, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_STATUS2, MCIF_WB, inst),\
+	SRI2(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_SCLK_CHANGE, MCIF_WB, inst),\
+	SRI2(MCIF_WB_TEST_DEBUG_INDEX, MCIF_WB, inst),\
+	SRI2(MCIF_WB_TEST_DEBUG_DATA, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_ADDR_Y, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_ADDR_C, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_ADDR_Y, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_ADDR_C, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_ADDR_Y, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_ADDR_C, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_ADDR_Y, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_ADDR_C, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, MMHUBBUB, inst),\
+	SRI2(MCIF_WB_NB_PSTATE_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_WATERMARK, MMHUBBUB, inst),\
+	SRI2(MCIF_WB_CLOCK_GATER_CONTROL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_SELF_REFRESH_CONTROL, MCIF_WB, inst),\
+	SRI2(MULTI_LEVEL_QOS_CTRL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_SECURITY_LEVEL, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_LUMA_SIZE, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_1_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_2_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_3_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MCIF_WB_BUF_4_RESOLUTION, MCIF_WB, inst),\
+	SRI2(MMHUBBUB_MEM_PWR_CNTL, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_ADDR_REGION, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_BASE_ADDR_LOW, MMHUBBUB, inst),\
+	SRI2(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB, inst)
+
+
+#define MCIF_WB_COMMON_MASK_SH_LIST_DCN32(mask_sh) \
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_ENABLE, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_INT_ACK, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_SLICE_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_OVERRUN_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUFMGR_SW_LOCK, mask_sh),\
+	SF(MCIF_WB_BUFMGR_SW_CONTROL, MCIF_WB_BUF_ADDR_FENCE_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_VCE_INT_STATUS, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_SW_INT_STATUS, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_SW_OVERRUN_INT_STATUS, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_CUR_BUF, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUFMGR_STATUS, MCIF_WB_BUFMGR_NEXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_PITCH, MCIF_WB_BUF_LUMA_PITCH, mask_sh),\
+	SF(MCIF_WB_BUF_PITCH, MCIF_WB_BUF_CHROMA_PITCH, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_ACTIVE, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_OVERFLOW, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_DISABLE, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_MODE, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_NXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS, MCIF_WB_BUF_1_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_TMZ, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_1_STATUS2, MCIF_WB_BUF_1_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_ACTIVE, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_OVERFLOW, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_DISABLE, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_MODE, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_NXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS, MCIF_WB_BUF_2_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_TMZ, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_2_STATUS2, MCIF_WB_BUF_2_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_ACTIVE, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_OVERFLOW, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_DISABLE, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_MODE, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_NXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS, MCIF_WB_BUF_3_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_TMZ, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_3_STATUS2, MCIF_WB_BUF_3_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_ACTIVE, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_SW_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_VCE_LOCKED, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_OVERFLOW, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_DISABLE, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_MODE, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_BUFTAG, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_NXT_BUF, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS, MCIF_WB_BUF_4_CUR_LINE_L, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_NEW_CONTENT, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_COLOR_DEPTH, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_TMZ_BLACK_PIXEL, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_TMZ, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_Y_OVERRUN, mask_sh),\
+	SF(MCIF_WB_BUF_4_STATUS2, MCIF_WB_BUF_4_C_OVERRUN, mask_sh),\
+	SF(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_CLIENT_ARBITRATION_SLICE, mask_sh),\
+	SF(MCIF_WB_ARBITRATION_CONTROL, MCIF_WB_TIME_PER_PIXEL, mask_sh),\
+	SF(MCIF_WB_SCLK_CHANGE, WM_CHANGE_ACK_FORCE_ON, mask_sh),\
+	SF(MCIF_WB_TEST_DEBUG_INDEX, MCIF_WB_TEST_DEBUG_INDEX, mask_sh),\
+	SF(MCIF_WB_TEST_DEBUG_DATA, MCIF_WB_TEST_DEBUG_DATA, mask_sh),\
+	SF(MCIF_WB_BUF_1_ADDR_Y, MCIF_WB_BUF_1_ADDR_Y, mask_sh),\
+	SF(MCIF_WB_BUF_1_ADDR_C, MCIF_WB_BUF_1_ADDR_C, mask_sh),\
+	SF(MCIF_WB_BUF_2_ADDR_Y, MCIF_WB_BUF_2_ADDR_Y, mask_sh),\
+	SF(MCIF_WB_BUF_2_ADDR_C, MCIF_WB_BUF_2_ADDR_C, mask_sh),\
+	SF(MCIF_WB_BUF_3_ADDR_Y, MCIF_WB_BUF_3_ADDR_Y, mask_sh),\
+	SF(MCIF_WB_BUF_3_ADDR_C, MCIF_WB_BUF_3_ADDR_C, mask_sh),\
+	SF(MCIF_WB_BUF_4_ADDR_Y, MCIF_WB_BUF_4_ADDR_Y, mask_sh),\
+	SF(MCIF_WB_BUF_4_ADDR_C, MCIF_WB_BUF_4_ADDR_C, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_LOCK_IGNORE, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_INT_ACK, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_SLICE_INT_EN, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_VCE_LOCK, mask_sh),\
+	SF(MCIF_WB_BUFMGR_VCE_CONTROL, MCIF_WB_BUFMGR_SLICE_SIZE, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_REFRESH_WATERMARK, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_LATENCY_WATERMARK, NB_PSTATE_CHANGE_WATERMARK_MASK, mask_sh),\
+	SF(MCIF_WB_NB_PSTATE_CONTROL, NB_PSTATE_CHANGE_FORCE_ON, mask_sh),\
+	SF(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK, mask_sh),\
+	SF(MCIF_WB_WATERMARK, MCIF_WB_CLI_WATERMARK_MASK, mask_sh),\
+	SF(MCIF_WB_CLOCK_GATER_CONTROL, MCIF_WB_CLI_CLOCK_GATER_OVERRIDE, mask_sh),\
+	SF(MCIF_WB_SELF_REFRESH_CONTROL, PERFRAME_SELF_REFRESH, mask_sh),\
+	SF(MULTI_LEVEL_QOS_CTRL, MAX_SCALED_TIME_TO_URGENT, mask_sh),\
+	SF(MCIF_WB_SECURITY_LEVEL, MCIF_WB_SECURITY_LEVEL, mask_sh),\
+	SF(MCIF_WB_BUF_LUMA_SIZE, MCIF_WB_BUF_LUMA_SIZE, mask_sh),\
+	SF(MCIF_WB_BUF_CHROMA_SIZE, MCIF_WB_BUF_CHROMA_SIZE, mask_sh),\
+	SF(MCIF_WB_BUF_1_ADDR_Y_HIGH, MCIF_WB_BUF_1_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_1_ADDR_C_HIGH, MCIF_WB_BUF_1_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_2_ADDR_Y_HIGH, MCIF_WB_BUF_2_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_2_ADDR_C_HIGH, MCIF_WB_BUF_2_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_3_ADDR_Y_HIGH, MCIF_WB_BUF_3_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_3_ADDR_C_HIGH, MCIF_WB_BUF_3_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_4_ADDR_Y_HIGH, MCIF_WB_BUF_4_ADDR_Y_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_4_ADDR_C_HIGH, MCIF_WB_BUF_4_ADDR_C_HIGH, mask_sh),\
+	SF(MCIF_WB_BUF_1_RESOLUTION, MCIF_WB_BUF_1_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB_BUF_1_RESOLUTION, MCIF_WB_BUF_1_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB_BUF_2_RESOLUTION, MCIF_WB_BUF_2_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB_BUF_2_RESOLUTION, MCIF_WB_BUF_2_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB_BUF_3_RESOLUTION, MCIF_WB_BUF_3_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB_BUF_3_RESOLUTION, MCIF_WB_BUF_3_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MCIF_WB_BUF_4_RESOLUTION, MCIF_WB_BUF_4_RESOLUTION_WIDTH, mask_sh),\
+	SF(MCIF_WB_BUF_4_RESOLUTION, MCIF_WB_BUF_4_RESOLUTION_HEIGHT, mask_sh),\
+	SF(MMHUBBUB_WARMUP_ADDR_REGION, MMHUBBUB_WARMUP_ADDR_REGION, mask_sh),\
+	SF(MMHUBBUB_WARMUP_BASE_ADDR_HIGH, MMHUBBUB_WARMUP_BASE_ADDR_HIGH, mask_sh),\
+	SF(MMHUBBUB_WARMUP_BASE_ADDR_LOW, MMHUBBUB_WARMUP_BASE_ADDR_LOW, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_EN, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_EN, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_STATUS, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_SW_INT_ACK, mask_sh),\
+	SF(MMHUBBUB_WARMUP_CONTROL_STATUS, MMHUBBUB_WARMUP_INC_ADDR, mask_sh)
+
+
+void dcn32_mmhubbub_construct(struct dcn30_mmhubbub *mcif_wb30,
+	struct dc_context *ctx,
+	const struct dcn30_mmhubbub_registers *mcif_wb_regs,
+	const struct dcn30_mmhubbub_shift *mcif_wb_shift,
+	const struct dcn30_mmhubbub_mask *mcif_wb_mask,
+	int inst);
+
+#endif //__DC_MCIF_WB_DCN32_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
new file mode 100644
index 000000000000..a308f33d3d0d
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.c
@@ -0,0 +1,810 @@
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
+#include "reg_helper.h"
+#include "dcn30/dcn30_mpc.h"
+#include "dcn30/dcn30_cm_common.h"
+#include "dcn30/dcn30_mpc.h"
+#include "basics/conversion.h"
+#include "dcn10/dcn10_cm_common.h"
+#include "dc.h"
+
+#define REG(reg)\
+	mpc30->mpc_regs->reg
+
+#define CTX \
+	mpc30->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	mpc30->mpc_shift->field_name, mpc30->mpc_mask->field_name
+
+
+static void mpc32_mpc_init(struct mpc *mpc)
+{
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+	int mpcc_id;
+
+	mpc1_mpc_init(mpc);
+
+	if (mpc->ctx->dc->debug.enable_mem_low_power.bits.mpc) {
+		if (mpc30->mpc_mask->MPCC_MCM_SHAPER_MEM_LOW_PWR_MODE && mpc30->mpc_mask->MPCC_MCM_3DLUT_MEM_LOW_PWR_MODE) {
+			for (mpcc_id = 0; mpcc_id < mpc30->num_mpcc; mpcc_id++) {
+				REG_UPDATE(MPCC_MCM_MEM_PWR_CTRL[mpcc_id], MPCC_MCM_SHAPER_MEM_LOW_PWR_MODE, 3);
+				REG_UPDATE(MPCC_MCM_MEM_PWR_CTRL[mpcc_id], MPCC_MCM_3DLUT_MEM_LOW_PWR_MODE, 3);
+				REG_UPDATE(MPCC_MCM_MEM_PWR_CTRL[mpcc_id], MPCC_MCM_1DLUT_MEM_LOW_PWR_MODE, 3);
+			}
+		}
+		if (mpc30->mpc_mask->MPCC_OGAM_MEM_LOW_PWR_MODE) {
+			for (mpcc_id = 0; mpcc_id < mpc30->num_mpcc; mpcc_id++)
+				REG_UPDATE(MPCC_MEM_PWR_CTRL[mpcc_id], MPCC_OGAM_MEM_LOW_PWR_MODE, 3);
+		}
+	}
+}
+
+
+static enum dc_lut_mode mpc32_get_shaper_current(struct mpc *mpc, uint32_t mpcc_id)
+{
+	enum dc_lut_mode mode;
+	uint32_t state_mode;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	REG_GET(MPCC_MCM_SHAPER_CONTROL[mpcc_id],
+			MPCC_MCM_SHAPER_MODE_CURRENT, &state_mode);
+
+		switch (state_mode) {
+		case 0:
+			mode = LUT_BYPASS;
+			break;
+		case 1:
+			mode = LUT_RAM_A;
+			break;
+		case 2:
+			mode = LUT_RAM_B;
+			break;
+		default:
+			mode = LUT_BYPASS;
+			break;
+		}
+		return mode;
+}
+
+
+static void mpc32_configure_shaper_lut(
+		struct mpc *mpc,
+		bool is_ram_a,
+		uint32_t mpcc_id)
+{
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	REG_UPDATE(MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK[mpcc_id],
+			MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK, 7);
+	REG_UPDATE(MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK[mpcc_id],
+			MPCC_MCM_SHAPER_LUT_WRITE_SEL, is_ram_a == true ? 0:1);
+	REG_SET(MPCC_MCM_SHAPER_LUT_INDEX[mpcc_id], 0, MPCC_MCM_SHAPER_LUT_INDEX, 0);
+}
+
+
+static void mpc32_program_shaper_luta_settings(
+		struct mpc *mpc,
+		const struct pwl_params *params,
+		uint32_t mpcc_id)
+{
+	const struct gamma_curve *curve;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	REG_SET_2(MPCC_MCM_SHAPER_RAMA_START_CNTL_B[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].blue.custom_float_x,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMA_START_CNTL_G[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].green.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMA_START_CNTL_R[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].red.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+
+	REG_SET_2(MPCC_MCM_SHAPER_RAMA_END_CNTL_B[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].blue.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].blue.custom_float_y);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMA_END_CNTL_G[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].green.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].green.custom_float_y);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMA_END_CNTL_R[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].red.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].red.custom_float_y);
+
+	curve = params->arr_curve_points;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_0_1[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_2_3[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_4_5[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_6_7[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_8_9[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_10_11[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_12_13[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_14_15[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_16_17[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_18_19[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_20_21[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_22_23[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_24_25[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_26_27[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_28_29[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_30_31[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMA_REGION_32_33[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+}
+
+
+static void mpc32_program_shaper_lutb_settings(
+		struct mpc *mpc,
+		const struct pwl_params *params,
+		uint32_t mpcc_id)
+{
+	const struct gamma_curve *curve;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_B[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].blue.custom_float_x,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_G[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].green.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_START_CNTL_R[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, params->corner_points[0].red.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, 0);
+
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_B[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].blue.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].blue.custom_float_y);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_G[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].green.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].green.custom_float_y);
+	REG_SET_2(MPCC_MCM_SHAPER_RAMB_END_CNTL_R[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, params->corner_points[1].red.custom_float_x,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, params->corner_points[1].red.custom_float_y);
+
+	curve = params->arr_curve_points;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_0_1[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_2_3[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_4_5[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_6_7[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_8_9[mpcc_id], 0,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+		MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_10_11[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_12_13[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_14_15[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_16_17[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_18_19[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_20_21[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_22_23[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_24_25[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_26_27[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_28_29[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_30_31[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+
+	curve += 2;
+	REG_SET_4(MPCC_MCM_SHAPER_RAMB_REGION_32_33[mpcc_id], 0,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, curve[0].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, curve[0].segments_num,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, curve[1].offset,
+			MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, curve[1].segments_num);
+}
+
+
+static void mpc32_program_shaper_lut(
+		struct mpc *mpc,
+		const struct pwl_result_data *rgb,
+		uint32_t num,
+		uint32_t mpcc_id)
+{
+	uint32_t i, red, green, blue;
+	uint32_t  red_delta, green_delta, blue_delta;
+	uint32_t  red_value, green_value, blue_value;
+
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	for (i = 0 ; i < num; i++) {
+
+		red   = rgb[i].red_reg;
+		green = rgb[i].green_reg;
+		blue  = rgb[i].blue_reg;
+
+		red_delta   = rgb[i].delta_red_reg;
+		green_delta = rgb[i].delta_green_reg;
+		blue_delta  = rgb[i].delta_blue_reg;
+
+		red_value   = ((red_delta   & 0x3ff) << 14) | (red   & 0x3fff);
+		green_value = ((green_delta & 0x3ff) << 14) | (green & 0x3fff);
+		blue_value  = ((blue_delta  & 0x3ff) << 14) | (blue  & 0x3fff);
+
+		REG_SET(MPCC_MCM_SHAPER_LUT_DATA[mpcc_id], 0, MPCC_MCM_SHAPER_LUT_DATA, red_value);
+		REG_SET(MPCC_MCM_SHAPER_LUT_DATA[mpcc_id], 0, MPCC_MCM_SHAPER_LUT_DATA, green_value);
+		REG_SET(MPCC_MCM_SHAPER_LUT_DATA[mpcc_id], 0, MPCC_MCM_SHAPER_LUT_DATA, blue_value);
+	}
+
+}
+
+
+static void mpc32_power_on_shaper_3dlut(
+		struct mpc *mpc,
+		uint32_t mpcc_id,
+		bool power_on)
+{
+	uint32_t power_status_shaper = 2;
+	uint32_t power_status_3dlut  = 2;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+	int max_retries = 10;
+
+	REG_SET(MPCC_MCM_MEM_PWR_CTRL[mpcc_id], 0,
+	MPCC_MCM_3DLUT_MEM_PWR_DIS, power_on == true ? 1:0);
+	/* wait for memory to fully power up */
+	if (power_on && mpc->ctx->dc->debug.enable_mem_low_power.bits.mpc) {
+		REG_WAIT(MPCC_MCM_MEM_PWR_CTRL[mpcc_id], MPCC_MCM_SHAPER_MEM_PWR_STATE, 0, 1, max_retries);
+		REG_WAIT(MPCC_MCM_MEM_PWR_CTRL[mpcc_id], MPCC_MCM_3DLUT_MEM_PWR_STATE, 0, 1, max_retries);
+	}
+
+	/*read status is not mandatory, it is just for debugging*/
+	REG_GET(MPCC_MCM_MEM_PWR_CTRL[mpcc_id], MPCC_MCM_SHAPER_MEM_PWR_STATE, &power_status_shaper);
+	REG_GET(MPCC_MCM_MEM_PWR_CTRL[mpcc_id], MPCC_MCM_3DLUT_MEM_PWR_STATE, &power_status_3dlut);
+
+	if (power_status_shaper != 0 && power_on == true)
+		BREAK_TO_DEBUGGER();
+
+	if (power_status_3dlut != 0 && power_on == true)
+		BREAK_TO_DEBUGGER();
+}
+
+
+bool mpc32_program_shaper(
+		struct mpc *mpc,
+		const struct pwl_params *params,
+		uint32_t mpcc_id)
+{
+	enum dc_lut_mode current_mode;
+	enum dc_lut_mode next_mode;
+
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	if (params == NULL) {
+		REG_SET(MPCC_MCM_SHAPER_CONTROL[mpcc_id], 0, MPCC_MCM_SHAPER_LUT_MODE, 0);
+		return false;
+	}
+
+	if (mpc->ctx->dc->debug.enable_mem_low_power.bits.mpc)
+		mpc32_power_on_shaper_3dlut(mpc, mpcc_id, true);
+
+	current_mode = mpc32_get_shaper_current(mpc, mpcc_id);
+
+	if (current_mode == LUT_BYPASS || current_mode == LUT_RAM_A)
+		next_mode = LUT_RAM_B;
+	else
+		next_mode = LUT_RAM_A;
+
+	mpc32_configure_shaper_lut(mpc, next_mode == LUT_RAM_A ? true:false, mpcc_id);
+
+	if (next_mode == LUT_RAM_A)
+		mpc32_program_shaper_luta_settings(mpc, params, mpcc_id);
+	else
+		mpc32_program_shaper_lutb_settings(mpc, params, mpcc_id);
+
+	mpc32_program_shaper_lut(
+			mpc, params->rgb_resulted, params->hw_points_num, mpcc_id);
+
+	REG_SET(MPCC_MCM_SHAPER_CONTROL[mpcc_id], 0, MPCC_MCM_SHAPER_LUT_MODE, next_mode == LUT_RAM_A ? 1:2);
+	mpc32_power_on_shaper_3dlut(mpc, mpcc_id, false);
+
+	return true;
+}
+
+
+static enum dc_lut_mode get3dlut_config(
+			struct mpc *mpc,
+			bool *is_17x17x17,
+			bool *is_12bits_color_channel,
+			int mpcc_id)
+{
+	uint32_t i_mode, i_enable_10bits, lut_size;
+	enum dc_lut_mode mode;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	REG_GET(MPCC_MCM_3DLUT_MODE[mpcc_id],
+			MPCC_MCM_3DLUT_MODE_CURRENT,  &i_mode);
+
+	REG_GET(MPCC_MCM_3DLUT_READ_WRITE_CONTROL[mpcc_id],
+			MPCC_MCM_3DLUT_30BIT_EN, &i_enable_10bits);
+
+	switch (i_mode) {
+	case 0:
+		mode = LUT_BYPASS;
+		break;
+	case 1:
+		mode = LUT_RAM_A;
+		break;
+	case 2:
+		mode = LUT_RAM_B;
+		break;
+	default:
+		mode = LUT_BYPASS;
+		break;
+	}
+	if (i_enable_10bits > 0)
+		*is_12bits_color_channel = false;
+	else
+		*is_12bits_color_channel = true;
+
+	REG_GET(MPCC_MCM_3DLUT_MODE[mpcc_id], MPCC_MCM_3DLUT_SIZE, &lut_size);
+
+	if (lut_size == 0)
+		*is_17x17x17 = true;
+	else
+		*is_17x17x17 = false;
+
+	return mode;
+}
+
+
+static void mpc32_select_3dlut_ram(
+		struct mpc *mpc,
+		enum dc_lut_mode mode,
+		bool is_color_channel_12bits,
+		uint32_t mpcc_id)
+{
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	REG_UPDATE_2(MPCC_MCM_3DLUT_READ_WRITE_CONTROL[mpcc_id],
+		MPCC_MCM_3DLUT_RAM_SEL, mode == LUT_RAM_A ? 0 : 1,
+		MPCC_MCM_3DLUT_30BIT_EN, is_color_channel_12bits == true ? 0:1);
+}
+
+
+static void mpc32_select_3dlut_ram_mask(
+		struct mpc *mpc,
+		uint32_t ram_selection_mask,
+		uint32_t mpcc_id)
+{
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	REG_UPDATE(MPCC_MCM_3DLUT_READ_WRITE_CONTROL[mpcc_id], MPCC_MCM_3DLUT_WRITE_EN_MASK,
+			ram_selection_mask);
+	REG_SET(MPCC_MCM_3DLUT_INDEX[mpcc_id], 0, MPCC_MCM_3DLUT_INDEX, 0);
+}
+
+
+static void mpc32_set3dlut_ram12(
+		struct mpc *mpc,
+		const struct dc_rgb *lut,
+		uint32_t entries,
+		uint32_t mpcc_id)
+{
+	uint32_t i, red, green, blue, red1, green1, blue1;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	for (i = 0 ; i < entries; i += 2) {
+		red   = lut[i].red<<4;
+		green = lut[i].green<<4;
+		blue  = lut[i].blue<<4;
+		red1   = lut[i+1].red<<4;
+		green1 = lut[i+1].green<<4;
+		blue1  = lut[i+1].blue<<4;
+
+		REG_SET_2(MPCC_MCM_3DLUT_DATA[mpcc_id], 0,
+				MPCC_MCM_3DLUT_DATA0, red,
+				MPCC_MCM_3DLUT_DATA1, red1);
+
+		REG_SET_2(MPCC_MCM_3DLUT_DATA[mpcc_id], 0,
+				MPCC_MCM_3DLUT_DATA0, green,
+				MPCC_MCM_3DLUT_DATA1, green1);
+
+		REG_SET_2(MPCC_MCM_3DLUT_DATA[mpcc_id], 0,
+				MPCC_MCM_3DLUT_DATA0, blue,
+				MPCC_MCM_3DLUT_DATA1, blue1);
+	}
+}
+
+
+static void mpc32_set3dlut_ram10(
+		struct mpc *mpc,
+		const struct dc_rgb *lut,
+		uint32_t entries,
+		uint32_t mpcc_id)
+{
+	uint32_t i, red, green, blue, value;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	for (i = 0; i < entries; i++) {
+		red   = lut[i].red;
+		green = lut[i].green;
+		blue  = lut[i].blue;
+		//should we shift red 22bit and green 12?
+		value = (red<<20) | (green<<10) | blue;
+
+		REG_SET(MPCC_MCM_3DLUT_DATA_30BIT[mpcc_id], 0, MPCC_MCM_3DLUT_DATA_30BIT, value);
+	}
+
+}
+
+
+static void mpc32_set_3dlut_mode(
+		struct mpc *mpc,
+		enum dc_lut_mode mode,
+		bool is_color_channel_12bits,
+		bool is_lut_size17x17x17,
+		uint32_t mpcc_id)
+{
+	uint32_t lut_mode;
+	struct dcn30_mpc *mpc30 = TO_DCN30_MPC(mpc);
+
+	if (mode == LUT_BYPASS)
+		lut_mode = 0;
+	else if (mode == LUT_RAM_A)
+		lut_mode = 1;
+	else
+		lut_mode = 2;
+
+	REG_UPDATE_2(MPCC_MCM_3DLUT_MODE[mpcc_id],
+			MPCC_MCM_3DLUT_MODE, lut_mode,
+			MPCC_MCM_3DLUT_SIZE, is_lut_size17x17x17 == true ? 0 : 1);
+}
+
+
+bool mpc32_program_3dlut(
+		struct mpc *mpc,
+		const struct tetrahedral_params *params,
+		int mpcc_id)
+{
+	enum dc_lut_mode mode;
+	bool is_17x17x17;
+	bool is_12bits_color_channel;
+	const struct dc_rgb *lut0;
+	const struct dc_rgb *lut1;
+	const struct dc_rgb *lut2;
+	const struct dc_rgb *lut3;
+	int lut_size0;
+	int lut_size;
+
+	if (params == NULL) {
+		mpc32_set_3dlut_mode(mpc, LUT_BYPASS, false, false, mpcc_id);
+		return false;
+	}
+	mpc32_power_on_shaper_3dlut(mpc, mpcc_id, true);
+
+	mode = get3dlut_config(mpc, &is_17x17x17, &is_12bits_color_channel, mpcc_id);
+
+	if (mode == LUT_BYPASS || mode == LUT_RAM_B)
+		mode = LUT_RAM_A;
+	else
+		mode = LUT_RAM_B;
+
+	is_17x17x17 = !params->use_tetrahedral_9;
+	is_12bits_color_channel = params->use_12bits;
+	if (is_17x17x17) {
+		lut0 = params->tetrahedral_17.lut0;
+		lut1 = params->tetrahedral_17.lut1;
+		lut2 = params->tetrahedral_17.lut2;
+		lut3 = params->tetrahedral_17.lut3;
+		lut_size0 = sizeof(params->tetrahedral_17.lut0)/
+					sizeof(params->tetrahedral_17.lut0[0]);
+		lut_size  = sizeof(params->tetrahedral_17.lut1)/
+					sizeof(params->tetrahedral_17.lut1[0]);
+	} else {
+		lut0 = params->tetrahedral_9.lut0;
+		lut1 = params->tetrahedral_9.lut1;
+		lut2 = params->tetrahedral_9.lut2;
+		lut3 = params->tetrahedral_9.lut3;
+		lut_size0 = sizeof(params->tetrahedral_9.lut0)/
+				sizeof(params->tetrahedral_9.lut0[0]);
+		lut_size  = sizeof(params->tetrahedral_9.lut1)/
+				sizeof(params->tetrahedral_9.lut1[0]);
+		}
+
+	mpc32_select_3dlut_ram(mpc, mode,
+				is_12bits_color_channel, mpcc_id);
+	mpc32_select_3dlut_ram_mask(mpc, 0x1, mpcc_id);
+	if (is_12bits_color_channel)
+		mpc32_set3dlut_ram12(mpc, lut0, lut_size0, mpcc_id);
+	else
+		mpc32_set3dlut_ram10(mpc, lut0, lut_size0, mpcc_id);
+
+	mpc32_select_3dlut_ram_mask(mpc, 0x2, mpcc_id);
+	if (is_12bits_color_channel)
+		mpc32_set3dlut_ram12(mpc, lut1, lut_size, mpcc_id);
+	else
+		mpc32_set3dlut_ram10(mpc, lut1, lut_size, mpcc_id);
+
+	mpc32_select_3dlut_ram_mask(mpc, 0x4, mpcc_id);
+	if (is_12bits_color_channel)
+		mpc32_set3dlut_ram12(mpc, lut2, lut_size, mpcc_id);
+	else
+		mpc32_set3dlut_ram10(mpc, lut2, lut_size, mpcc_id);
+
+	mpc32_select_3dlut_ram_mask(mpc, 0x8, mpcc_id);
+	if (is_12bits_color_channel)
+		mpc32_set3dlut_ram12(mpc, lut3, lut_size, mpcc_id);
+	else
+		mpc32_set3dlut_ram10(mpc, lut3, lut_size, mpcc_id);
+
+	mpc32_set_3dlut_mode(mpc, mode, is_12bits_color_channel,
+					is_17x17x17, mpcc_id);
+
+	if (mpc->ctx->dc->debug.enable_mem_low_power.bits.mpc)
+		mpc32_power_on_shaper_3dlut(mpc, mpcc_id, false);
+
+	return true;
+}
+
+const struct mpc_funcs dcn32_mpc_funcs = {
+	.read_mpcc_state = mpc1_read_mpcc_state,
+	.insert_plane = mpc1_insert_plane,
+	.remove_mpcc = mpc1_remove_mpcc,
+	.mpc_init = mpc32_mpc_init,
+	.mpc_init_single_inst = mpc1_mpc_init_single_inst,
+	.update_blending = mpc2_update_blending,
+	.cursor_lock = mpc1_cursor_lock,
+	.get_mpcc_for_dpp = mpc1_get_mpcc_for_dpp,
+	.wait_for_idle = mpc2_assert_idle_mpcc,
+	.assert_mpcc_idle_before_connect = mpc2_assert_mpcc_idle_before_connect,
+	.init_mpcc_list_from_hw = mpc1_init_mpcc_list_from_hw,
+	.set_denorm =  mpc3_set_denorm,
+	.set_denorm_clamp = mpc3_set_denorm_clamp,
+	.set_output_csc = mpc3_set_output_csc,
+	.set_ocsc_default = mpc3_set_ocsc_default,
+	.set_output_gamma = mpc3_set_output_gamma,
+	.insert_plane_to_secondary = NULL,
+	.remove_mpcc_from_secondary =  NULL,
+	.set_dwb_mux = mpc3_set_dwb_mux,
+	.disable_dwb_mux = mpc3_disable_dwb_mux,
+	.is_dwb_idle = mpc3_is_dwb_idle,
+	.set_out_rate_control = mpc3_set_out_rate_control,
+	.set_gamut_remap = mpc3_set_gamut_remap,
+	.program_shaper = mpc32_program_shaper,
+	.program_3dlut = mpc32_program_3dlut,
+	.acquire_rmu = NULL,
+	.release_rmu = NULL,
+	.power_on_mpc_mem_pwr = mpc3_power_on_ogam_lut,
+	.get_mpc_out_mux = mpc1_get_mpc_out_mux,
+	.set_bg_color = mpc1_set_bg_color,
+};
+
+
+void dcn32_mpc_construct(struct dcn30_mpc *mpc30,
+	struct dc_context *ctx,
+	const struct dcn30_mpc_registers *mpc_regs,
+	const struct dcn30_mpc_shift *mpc_shift,
+	const struct dcn30_mpc_mask *mpc_mask,
+	int num_mpcc,
+	int num_rmu)
+{
+	int i;
+
+	mpc30->base.ctx = ctx;
+
+	mpc30->base.funcs = &dcn32_mpc_funcs;
+
+	mpc30->mpc_regs = mpc_regs;
+	mpc30->mpc_shift = mpc_shift;
+	mpc30->mpc_mask = mpc_mask;
+
+	mpc30->mpcc_in_use_mask = 0;
+	mpc30->num_mpcc = num_mpcc;
+	mpc30->num_rmu = num_rmu;
+
+	for (i = 0; i < MAX_MPCC; i++)
+		mpc3_init_mpcc(&mpc30->base.mpcc_array[i], i);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h
new file mode 100644
index 000000000000..d4be3c89ec7b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_mpc.h
@@ -0,0 +1,213 @@
+/* Copyright 2021 Advanced Micro Devices, Inc.
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
+#ifndef __DC_MPCC_DCN32_H__
+#define __DC_MPCC_DCN32_H__
+
+#include "dcn20/dcn20_mpc.h"
+#include "dcn30/dcn30_mpc.h"
+
+#define MPC_MCM_REG_LIST_DCN32(inst) \
+	SRII(MPCC_MCM_SHAPER_CONTROL, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_OFFSET_R, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_OFFSET_G, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_OFFSET_B, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_SCALE_R, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_SCALE_G_B, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_LUT_INDEX, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_LUT_DATA, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_START_CNTL_B, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_START_CNTL_G, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_START_CNTL_R, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_END_CNTL_B, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_END_CNTL_G, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_END_CNTL_R, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_0_1, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_2_3, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_4_5, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_6_7, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_8_9, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_10_11, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_12_13, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_14_15, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_16_17, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_18_19, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_20_21, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_22_23, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_24_25, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_26_27, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_28_29, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_30_31, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMA_REGION_32_33, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_START_CNTL_B, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_START_CNTL_G, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_START_CNTL_R, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_END_CNTL_B, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_END_CNTL_G, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_END_CNTL_R, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_0_1, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_2_3, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_4_5, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_6_7, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_8_9, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_10_11, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_12_13, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_14_15, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_16_17, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_18_19, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_20_21, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_22_23, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_24_25, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_26_27, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_28_29, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_30_31, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_SHAPER_RAMB_REGION_32_33, MPCC_MCM, inst), \
+	SRII(MPCC_MCM_3DLUT_MODE, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_3DLUT_INDEX, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_3DLUT_DATA, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_3DLUT_DATA_30BIT, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_3DLUT_READ_WRITE_CONTROL, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_3DLUT_OUT_NORM_FACTOR, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_3DLUT_OUT_OFFSET_R, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_3DLUT_OUT_OFFSET_G, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_3DLUT_OUT_OFFSET_B, MPCC_MCM, inst),\
+	SRII(MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM, inst)
+
+
+#define MPC_COMMON_MASK_SH_LIST_DCN32(mask_sh) \
+	MPC_COMMON_MASK_SH_LIST_DCN1_0(mask_sh),\
+	SF(MPCC0_MPCC_CONTROL, MPCC_BG_BPC, mask_sh),\
+	SF(MPCC0_MPCC_CONTROL, MPCC_BOT_GAIN_MODE, mask_sh),\
+	SF(MPCC0_MPCC_TOP_GAIN, MPCC_TOP_GAIN, mask_sh),\
+	SF(MPCC0_MPCC_BOT_GAIN_INSIDE, MPCC_BOT_GAIN_INSIDE, mask_sh),\
+	SF(MPCC0_MPCC_BOT_GAIN_OUTSIDE, MPCC_BOT_GAIN_OUTSIDE, mask_sh),\
+	SF(MPC_OUT0_CSC_MODE, MPC_OCSC_MODE, mask_sh),\
+	SF(MPC_OUT0_CSC_C11_C12_A, MPC_OCSC_C11_A, mask_sh),\
+	SF(MPC_OUT0_CSC_C11_C12_A, MPC_OCSC_C12_A, mask_sh),\
+	SF(MPCC0_MPCC_STATUS, MPCC_DISABLED, mask_sh),\
+	SF(MPCC0_MPCC_MEM_PWR_CTRL, MPCC_OGAM_MEM_PWR_FORCE, mask_sh),\
+	SF(MPCC0_MPCC_MEM_PWR_CTRL, MPCC_OGAM_MEM_PWR_DIS, mask_sh),\
+	SF(MPCC0_MPCC_MEM_PWR_CTRL, MPCC_OGAM_MEM_LOW_PWR_MODE, mask_sh),\
+	SF(MPCC0_MPCC_MEM_PWR_CTRL, MPCC_OGAM_MEM_PWR_STATE, mask_sh),\
+	SF(MPC_OUT0_DENORM_CONTROL, MPC_OUT_DENORM_MODE, mask_sh),\
+	SF(MPC_OUT0_DENORM_CONTROL, MPC_OUT_DENORM_CLAMP_MAX_R_CR, mask_sh),\
+	SF(MPC_OUT0_DENORM_CONTROL, MPC_OUT_DENORM_CLAMP_MIN_R_CR, mask_sh),\
+	SF(MPC_OUT0_DENORM_CLAMP_G_Y, MPC_OUT_DENORM_CLAMP_MAX_G_Y, mask_sh),\
+	SF(MPC_OUT0_DENORM_CLAMP_G_Y, MPC_OUT_DENORM_CLAMP_MIN_G_Y, mask_sh),\
+	SF(MPC_OUT0_DENORM_CLAMP_B_CB, MPC_OUT_DENORM_CLAMP_MAX_B_CB, mask_sh),\
+	SF(MPC_OUT0_DENORM_CLAMP_B_CB, MPC_OUT_DENORM_CLAMP_MIN_B_CB, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_GAMUT_REMAP_MODE, MPCC_GAMUT_REMAP_MODE, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_GAMUT_REMAP_MODE, MPCC_GAMUT_REMAP_MODE_CURRENT, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_GAMUT_REMAP_COEF_FORMAT, MPCC_GAMUT_REMAP_COEF_FORMAT, mask_sh),\
+	SF(MPCC_OGAM0_MPC_GAMUT_REMAP_C11_C12_A, MPCC_GAMUT_REMAP_C11_A, mask_sh),\
+	SF(MPCC_OGAM0_MPC_GAMUT_REMAP_C11_C12_A, MPCC_GAMUT_REMAP_C12_A, mask_sh),\
+	SF(MPC_DWB0_MUX, MPC_DWB0_MUX, mask_sh),\
+	SF(MPC_DWB0_MUX, MPC_DWB0_MUX_STATUS, mask_sh),\
+	SF(MPC_OUT0_MUX, MPC_OUT_RATE_CONTROL, mask_sh),\
+	SF(MPC_OUT0_MUX, MPC_OUT_RATE_CONTROL_DISABLE, mask_sh),\
+	SF(MPC_OUT0_MUX, MPC_OUT_FLOW_CONTROL_MODE, mask_sh),\
+	SF(MPC_OUT0_MUX, MPC_OUT_FLOW_CONTROL_COUNT, mask_sh), \
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM_RAMA_EXP_REGION0_LUT_OFFSET, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM_RAMA_EXP_REGION0_NUM_SEGMENTS, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM_RAMA_EXP_REGION1_LUT_OFFSET, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_REGION_0_1, MPCC_OGAM_RAMA_EXP_REGION1_NUM_SEGMENTS, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_END_CNTL2_B, MPCC_OGAM_RAMA_EXP_REGION_END_SLOPE_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_END_CNTL2_B, MPCC_OGAM_RAMA_EXP_REGION_END_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_END_CNTL1_B, MPCC_OGAM_RAMA_EXP_REGION_END_BASE_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_START_SLOPE_CNTL_B, MPCC_OGAM_RAMA_EXP_REGION_START_SLOPE_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_START_BASE_CNTL_B, MPCC_OGAM_RAMA_EXP_REGION_START_BASE_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_START_CNTL_B, MPCC_OGAM_RAMA_EXP_REGION_START_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_START_CNTL_B, MPCC_OGAM_RAMA_EXP_REGION_START_SEGMENT_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_OFFSET_B, MPCC_OGAM_RAMA_OFFSET_B, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_OFFSET_G, MPCC_OGAM_RAMA_OFFSET_G, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_RAMA_OFFSET_R, MPCC_OGAM_RAMA_OFFSET_R, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_INDEX, MPCC_OGAM_LUT_INDEX, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_MODE, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_SELECT, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_PWL_DISABLE, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_MODE_CURRENT, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_CONTROL, MPCC_OGAM_SELECT_CURRENT, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_WRITE_COLOR_MASK, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_READ_COLOR_SEL, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_READ_DBG, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_HOST_SEL, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_CONTROL, MPCC_OGAM_LUT_CONFIG_MODE, mask_sh),\
+	SF(MPCC_OGAM0_MPCC_OGAM_LUT_DATA, MPCC_OGAM_LUT_DATA, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_MODE, MPCC_MCM_3DLUT_MODE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_MODE, MPCC_MCM_3DLUT_SIZE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_MODE, MPCC_MCM_3DLUT_MODE_CURRENT, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_READ_WRITE_CONTROL, MPCC_MCM_3DLUT_WRITE_EN_MASK, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_READ_WRITE_CONTROL, MPCC_MCM_3DLUT_RAM_SEL, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_READ_WRITE_CONTROL, MPCC_MCM_3DLUT_30BIT_EN, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_READ_WRITE_CONTROL, MPCC_MCM_3DLUT_READ_SEL, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_INDEX, MPCC_MCM_3DLUT_INDEX, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_DATA, MPCC_MCM_3DLUT_DATA0, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_DATA, MPCC_MCM_3DLUT_DATA1, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_3DLUT_DATA_30BIT, MPCC_MCM_3DLUT_DATA_30BIT, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_CONTROL, MPCC_MCM_SHAPER_LUT_MODE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_CONTROL, MPCC_MCM_SHAPER_MODE_CURRENT, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_OFFSET_R, MPCC_MCM_SHAPER_OFFSET_R, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_OFFSET_G, MPCC_MCM_SHAPER_OFFSET_G, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_OFFSET_B, MPCC_MCM_SHAPER_OFFSET_B, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_SCALE_R, MPCC_MCM_SHAPER_SCALE_R, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_SCALE_G_B, MPCC_MCM_SHAPER_SCALE_G, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_SCALE_G_B, MPCC_MCM_SHAPER_SCALE_B, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_LUT_INDEX, MPCC_MCM_SHAPER_LUT_INDEX, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_LUT_DATA, MPCC_MCM_SHAPER_LUT_DATA, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK, MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_LUT_WRITE_EN_MASK, MPCC_MCM_SHAPER_LUT_WRITE_SEL, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_RAMA_START_CNTL_B, MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_B, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_RAMA_START_CNTL_B, MPCC_MCM_SHAPER_RAMA_EXP_REGION_START_SEGMENT_B, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_RAMA_END_CNTL_B, MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_B, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_RAMA_END_CNTL_B, MPCC_MCM_SHAPER_RAMA_EXP_REGION_END_BASE_B, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_RAMA_REGION_0_1, MPCC_MCM_SHAPER_RAMA_EXP_REGION0_LUT_OFFSET, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_RAMA_REGION_0_1, MPCC_MCM_SHAPER_RAMA_EXP_REGION0_NUM_SEGMENTS, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_RAMA_REGION_0_1, MPCC_MCM_SHAPER_RAMA_EXP_REGION1_LUT_OFFSET, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_RAMA_REGION_0_1, MPCC_MCM_SHAPER_RAMA_EXP_REGION1_NUM_SEGMENTS, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_SHAPER_MEM_PWR_FORCE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_SHAPER_MEM_PWR_DIS, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_SHAPER_MEM_LOW_PWR_MODE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_3DLUT_MEM_PWR_FORCE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_3DLUT_MEM_PWR_DIS, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_3DLUT_MEM_LOW_PWR_MODE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_1DLUT_MEM_PWR_FORCE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_1DLUT_MEM_PWR_DIS, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_1DLUT_MEM_LOW_PWR_MODE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_SHAPER_MEM_PWR_STATE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_3DLUT_MEM_PWR_STATE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_MEM_PWR_CTRL, MPCC_MCM_1DLUT_MEM_PWR_STATE, mask_sh),\
+	SF(MPCC_MCM0_MPCC_MCM_SHAPER_CONTROL, MPCC_MCM_SHAPER_MODE_CURRENT, mask_sh),\
+	SF(CUR_VUPDATE_LOCK_SET0, CUR_VUPDATE_LOCK_SET, mask_sh)
+
+
+void dcn32_mpc_construct(struct dcn30_mpc *mpc30,
+	struct dc_context *ctx,
+	const struct dcn30_mpc_registers *mpc_regs,
+	const struct dcn30_mpc_shift *mpc_shift,
+	const struct dcn30_mpc_mask *mpc_mask,
+	int num_mpcc,
+	int num_rmu);
+
+#endif		//__DC_MPCC_DCN32_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
new file mode 100644
index 000000000000..f1ed25e972f2
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
@@ -0,0 +1,236 @@
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
+
+#include "dcn32_optc.h"
+
+#include "dcn30/dcn30_optc.h"
+#include "reg_helper.h"
+#include "dc.h"
+#include "dcn_calc_math.h"
+
+#define REG(reg)\
+	optc1->tg_regs->reg
+
+#define CTX \
+	optc1->base.ctx
+
+#undef FN
+#define FN(reg_name, field_name) \
+	optc1->tg_shift->field_name, optc1->tg_mask->field_name
+
+static void optc32_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_cnt,
+		struct dc_crtc_timing *timing)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	uint32_t memory_mask = 0;
+	int h_active = timing->h_addressable + timing->h_border_left + timing->h_border_right;
+	int mpcc_hactive = h_active / opp_cnt;
+	/* Each memory instance is 2048x(32x2) bits to support half line of 4096 */
+	int odm_mem_count = (h_active + 2047) / 2048;
+
+	/*
+	 * display <= 4k : 2 memories + 2 pipes
+	 * 4k < display <= 8k : 4 memories + 2 pipes
+	 * 8k < display <= 12k : 6 memories + 4 pipes
+	 */
+	if (opp_cnt == 4) {
+		if (odm_mem_count <= 2)
+			memory_mask = 0x3;
+		else if (odm_mem_count <= 4)
+			memory_mask = 0xf;
+		else
+			memory_mask = 0x3f;
+	} else {
+		if (odm_mem_count <= 2)
+			memory_mask = 0x1 << (opp_id[0] * 2) | 0x1 << (opp_id[1] * 2);
+		else if (odm_mem_count <= 4)
+			memory_mask = 0x3 << (opp_id[0] * 2) | 0x3 << (opp_id[1] * 2);
+		else
+			memory_mask = 0x77;
+	}
+
+	REG_SET(OPTC_MEMORY_CONFIG, 0,
+		OPTC_MEM_SEL, memory_mask);
+
+	if (opp_cnt == 2) {
+		REG_SET_3(OPTC_DATA_SOURCE_SELECT, 0,
+				OPTC_NUM_OF_INPUT_SEGMENT, 1,
+				OPTC_SEG0_SRC_SEL, opp_id[0],
+				OPTC_SEG1_SRC_SEL, opp_id[1]);
+	} else if (opp_cnt == 4) {
+		REG_SET_5(OPTC_DATA_SOURCE_SELECT, 0,
+				OPTC_NUM_OF_INPUT_SEGMENT, 3,
+				OPTC_SEG0_SRC_SEL, opp_id[0],
+				OPTC_SEG1_SRC_SEL, opp_id[1],
+				OPTC_SEG2_SRC_SEL, opp_id[2],
+				OPTC_SEG3_SRC_SEL, opp_id[3]);
+	}
+
+	REG_UPDATE(OPTC_WIDTH_CONTROL,
+			OPTC_SEGMENT_WIDTH, mpcc_hactive);
+
+	REG_SET(OTG_H_TIMING_CNTL, 0, OTG_H_TIMING_DIV_MODE, opp_cnt - 1);
+	optc1->opp_count = opp_cnt;
+}
+
+/**
+ * Enable CRTC
+ * Enable CRTC - call ASIC Control Object to enable Timing generator.
+ */
+static bool optc32_enable_crtc(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	/* opp instance for OTG, 1 to 1 mapping and odm will adjust */
+	REG_UPDATE(OPTC_DATA_SOURCE_SELECT,
+			OPTC_SEG0_SRC_SEL, optc->inst);
+
+	/* VTG enable first is for HW workaround */
+	REG_UPDATE(CONTROL,
+			VTG0_ENABLE, 1);
+
+	REG_SEQ_START();
+
+	/* Enable CRTC */
+	REG_UPDATE_2(OTG_CONTROL,
+			OTG_DISABLE_POINT_CNTL, 2,
+			OTG_MASTER_EN, 1);
+
+	REG_SEQ_SUBMIT();
+	REG_SEQ_WAIT_DONE();
+
+	return true;
+}
+
+/* disable_crtc */
+static bool optc32_disable_crtc(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	/* disable otg request until end of the first line
+	 * in the vertical blank region
+	 */
+	REG_UPDATE(OTG_CONTROL,
+			OTG_MASTER_EN, 0);
+
+	REG_UPDATE(CONTROL,
+			VTG0_ENABLE, 0);
+
+	/* CRTC disabled, so disable  clock. */
+	REG_WAIT(OTG_CLOCK_CONTROL,
+			OTG_BUSY, 0,
+			1, 100000);
+
+	return true;
+}
+
+void optc32_phantom_crtc_post_enable(struct timing_generator *optc)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+
+	/* Disable immediately. */
+	REG_UPDATE_2(OTG_CONTROL, OTG_DISABLE_POINT_CNTL, 0, OTG_MASTER_EN, 0);
+
+	/* CRTC disabled, so disable  clock. */
+	REG_WAIT(OTG_CLOCK_CONTROL, OTG_BUSY, 0, 1, 100000);
+}
+
+
+static struct timing_generator_funcs dcn32_tg_funcs = {
+		.validate_timing = optc1_validate_timing,
+		.program_timing = optc1_program_timing,
+		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
+		.setup_vertical_interrupt1 = optc1_setup_vertical_interrupt1,
+		.setup_vertical_interrupt2 = optc1_setup_vertical_interrupt2,
+		.program_global_sync = optc1_program_global_sync,
+		.enable_crtc = optc32_enable_crtc,
+		.disable_crtc = optc32_disable_crtc,
+		.phantom_crtc_post_enable = optc32_phantom_crtc_post_enable,
+		/* used by enable_timing_synchronization. Not need for FPGA */
+		.is_counter_moving = optc1_is_counter_moving,
+		.get_position = optc1_get_position,
+		.get_frame_count = optc1_get_vblank_counter,
+		.get_scanoutpos = optc1_get_crtc_scanoutpos,
+		.get_otg_active_size = optc1_get_otg_active_size,
+		.set_early_control = optc1_set_early_control,
+		/* used by enable_timing_synchronization. Not need for FPGA */
+		.wait_for_state = optc1_wait_for_state,
+		.set_blank_color = optc3_program_blank_color,
+		.did_triggered_reset_occur = optc1_did_triggered_reset_occur,
+		.triplebuffer_lock = optc3_triplebuffer_lock,
+		.triplebuffer_unlock = optc2_triplebuffer_unlock,
+		.enable_reset_trigger = optc1_enable_reset_trigger,
+		.enable_crtc_reset = optc1_enable_crtc_reset,
+		.disable_reset_trigger = optc1_disable_reset_trigger,
+		.lock = optc3_lock,
+		.unlock = optc1_unlock,
+		.lock_doublebuffer_enable = optc3_lock_doublebuffer_enable,
+		.lock_doublebuffer_disable = optc3_lock_doublebuffer_disable,
+		.enable_optc_clock = optc1_enable_optc_clock,
+		.set_vrr_m_const = optc3_set_vrr_m_const,
+		.set_drr = optc1_set_drr,
+		.get_last_used_drr_vtotal = optc2_get_last_used_drr_vtotal,
+		.set_vtotal_min_max = optc1_set_vtotal_min_max,
+		.set_static_screen_control = optc1_set_static_screen_control,
+		.program_stereo = optc1_program_stereo,
+		.is_stereo_left_eye = optc1_is_stereo_left_eye,
+		.tg_init = optc3_tg_init,
+		.is_tg_enabled = optc1_is_tg_enabled,
+		.is_optc_underflow_occurred = optc1_is_optc_underflow_occurred,
+		.clear_optc_underflow = optc1_clear_optc_underflow,
+		.setup_global_swap_lock = NULL,
+		.get_crc = optc1_get_crc,
+		.configure_crc = optc1_configure_crc,
+		.set_dsc_config = optc3_set_dsc_config,
+		.get_dsc_status = optc2_get_dsc_status,
+		.set_dwb_source = NULL,
+		.set_odm_bypass = optc3_set_odm_bypass,
+		.set_odm_combine = optc32_set_odm_combine,
+		.get_optc_source = optc2_get_optc_source,
+		.set_out_mux = optc3_set_out_mux,
+		.set_drr_trigger_window = optc3_set_drr_trigger_window,
+		.set_vtotal_change_limit = optc3_set_vtotal_change_limit,
+		.set_gsl = optc2_set_gsl,
+		.set_gsl_source_select = optc2_set_gsl_source_select,
+		.set_vtg_params = optc1_set_vtg_params,
+		.program_manual_trigger = optc2_program_manual_trigger,
+		.setup_manual_trigger = optc2_setup_manual_trigger,
+		.get_hw_timing = optc1_get_hw_timing,
+};
+
+void dcn32_timing_generator_init(struct optc *optc1)
+{
+	optc1->base.funcs = &dcn32_tg_funcs;
+
+	optc1->max_h_total = optc1->tg_mask->OTG_H_TOTAL + 1;
+	optc1->max_v_total = optc1->tg_mask->OTG_V_TOTAL + 1;
+
+	optc1->min_h_blank = 32;
+	optc1->min_v_blank = 3;
+	optc1->min_v_blank_interlace = 5;
+	optc1->min_h_sync_width = 4;
+	optc1->min_v_sync_width = 1;
+}
+
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h
new file mode 100644
index 000000000000..e07b317ed3f4
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.h
@@ -0,0 +1,253 @@
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
+#ifndef __DC_OPTC_DCN32_H__
+#define __DC_OPTC_DCN32_H__
+
+#include "dcn10/dcn10_optc.h"
+
+#define OPTC_COMMON_REG_LIST_DCN3_2(inst) \
+	SRI(OTG_VSTARTUP_PARAM, OTG, inst),\
+	SRI(OTG_VUPDATE_PARAM, OTG, inst),\
+	SRI(OTG_VREADY_PARAM, OTG, inst),\
+	SRI(OTG_MASTER_UPDATE_LOCK, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL0, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL1, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL2, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL4, OTG, inst),\
+	SRI(OTG_DOUBLE_BUFFER_CONTROL, OTG, inst),\
+	SRI(OTG_H_TOTAL, OTG, inst),\
+	SRI(OTG_H_BLANK_START_END, OTG, inst),\
+	SRI(OTG_H_SYNC_A, OTG, inst),\
+	SRI(OTG_H_SYNC_A_CNTL, OTG, inst),\
+	SRI(OTG_H_TIMING_CNTL, OTG, inst),\
+	SRI(OTG_V_TOTAL, OTG, inst),\
+	SRI(OTG_V_BLANK_START_END, OTG, inst),\
+	SRI(OTG_V_SYNC_A, OTG, inst),\
+	SRI(OTG_V_SYNC_A_CNTL, OTG, inst),\
+	SRI(OTG_CONTROL, OTG, inst),\
+	SRI(OTG_STEREO_CONTROL, OTG, inst),\
+	SRI(OTG_3D_STRUCTURE_CONTROL, OTG, inst),\
+	SRI(OTG_STEREO_STATUS, OTG, inst),\
+	SRI(OTG_V_TOTAL_MAX, OTG, inst),\
+	SRI(OTG_V_TOTAL_MIN, OTG, inst),\
+	SRI(OTG_V_TOTAL_CONTROL, OTG, inst),\
+	SRI(OTG_TRIGA_CNTL, OTG, inst),\
+	SRI(OTG_FORCE_COUNT_NOW_CNTL, OTG, inst),\
+	SRI(OTG_STATIC_SCREEN_CONTROL, OTG, inst),\
+	SRI(OTG_STATUS_FRAME_COUNT, OTG, inst),\
+	SRI(OTG_STATUS, OTG, inst),\
+	SRI(OTG_STATUS_POSITION, OTG, inst),\
+	SRI(OTG_NOM_VERT_POSITION, OTG, inst),\
+	SRI(OTG_M_CONST_DTO0, OTG, inst),\
+	SRI(OTG_M_CONST_DTO1, OTG, inst),\
+	SRI(OTG_CLOCK_CONTROL, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT0_CONTROL, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT0_POSITION, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT1_CONTROL, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT1_POSITION, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT2_CONTROL, OTG, inst),\
+	SRI(OTG_VERTICAL_INTERRUPT2_POSITION, OTG, inst),\
+	SRI(OPTC_INPUT_CLOCK_CONTROL, ODM, inst),\
+	SRI(OPTC_DATA_SOURCE_SELECT, ODM, inst),\
+	SRI(OPTC_INPUT_GLOBAL_CONTROL, ODM, inst),\
+	SRI(CONTROL, VTG, inst),\
+	SRI(OTG_VERT_SYNC_CONTROL, OTG, inst),\
+	SRI(OTG_GSL_CONTROL, OTG, inst),\
+	SRI(OTG_CRC_CNTL, OTG, inst),\
+	SRI(OTG_CRC0_DATA_RG, OTG, inst),\
+	SRI(OTG_CRC0_DATA_B, OTG, inst),\
+	SRI(OTG_CRC0_WINDOWA_X_CONTROL, OTG, inst),\
+	SRI(OTG_CRC0_WINDOWA_Y_CONTROL, OTG, inst),\
+	SRI(OTG_CRC0_WINDOWB_X_CONTROL, OTG, inst),\
+	SRI(OTG_CRC0_WINDOWB_Y_CONTROL, OTG, inst),\
+	SR(GSL_SOURCE_SELECT),\
+	SRI(OTG_TRIGA_MANUAL_TRIG, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL1, OTG, inst),\
+	SRI(OTG_GLOBAL_CONTROL2, OTG, inst),\
+	SRI(OTG_GSL_WINDOW_X, OTG, inst),\
+	SRI(OTG_GSL_WINDOW_Y, OTG, inst),\
+	SRI(OTG_VUPDATE_KEEPOUT, OTG, inst),\
+	SRI(OTG_DSC_START_POSITION, OTG, inst),\
+	SRI(OTG_DRR_TRIGGER_WINDOW, OTG, inst),\
+	SRI(OTG_DRR_V_TOTAL_CHANGE, OTG, inst),\
+	SRI(OPTC_DATA_FORMAT_CONTROL, ODM, inst),\
+	SRI(OPTC_BYTES_PER_PIXEL, ODM, inst),\
+	SRI(OPTC_WIDTH_CONTROL, ODM, inst),\
+	SRI(OPTC_MEMORY_CONFIG, ODM, inst),\
+	SRI(OTG_DRR_CONTROL, OTG, inst)
+
+#define OPTC_COMMON_MASK_SH_LIST_DCN3_2(mask_sh)\
+	SF(OTG0_OTG_VSTARTUP_PARAM, VSTARTUP_START, mask_sh),\
+	SF(OTG0_OTG_VUPDATE_PARAM, VUPDATE_OFFSET, mask_sh),\
+	SF(OTG0_OTG_VUPDATE_PARAM, VUPDATE_WIDTH, mask_sh),\
+	SF(OTG0_OTG_VREADY_PARAM, VREADY_OFFSET, mask_sh),\
+	SF(OTG0_OTG_MASTER_UPDATE_LOCK, OTG_MASTER_UPDATE_LOCK, mask_sh),\
+	SF(OTG0_OTG_MASTER_UPDATE_LOCK, UPDATE_LOCK_STATUS, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL0, MASTER_UPDATE_LOCK_DB_START_X, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL0, MASTER_UPDATE_LOCK_DB_END_X, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL0, MASTER_UPDATE_LOCK_DB_EN, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL1, MASTER_UPDATE_LOCK_DB_START_Y, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL1, MASTER_UPDATE_LOCK_DB_END_Y, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL2, OTG_MASTER_UPDATE_LOCK_SEL, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL4, DIG_UPDATE_POSITION_X, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL4, DIG_UPDATE_POSITION_Y, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_UPDATE_PENDING, mask_sh),\
+	SF(OTG0_OTG_H_TOTAL, OTG_H_TOTAL, mask_sh),\
+	SF(OTG0_OTG_H_BLANK_START_END, OTG_H_BLANK_START, mask_sh),\
+	SF(OTG0_OTG_H_BLANK_START_END, OTG_H_BLANK_END, mask_sh),\
+	SF(OTG0_OTG_H_SYNC_A, OTG_H_SYNC_A_START, mask_sh),\
+	SF(OTG0_OTG_H_SYNC_A, OTG_H_SYNC_A_END, mask_sh),\
+	SF(OTG0_OTG_H_SYNC_A_CNTL, OTG_H_SYNC_A_POL, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL, OTG_V_TOTAL, mask_sh),\
+	SF(OTG0_OTG_V_BLANK_START_END, OTG_V_BLANK_START, mask_sh),\
+	SF(OTG0_OTG_V_BLANK_START_END, OTG_V_BLANK_END, mask_sh),\
+	SF(OTG0_OTG_V_SYNC_A, OTG_V_SYNC_A_START, mask_sh),\
+	SF(OTG0_OTG_V_SYNC_A, OTG_V_SYNC_A_END, mask_sh),\
+	SF(OTG0_OTG_V_SYNC_A_CNTL, OTG_V_SYNC_A_POL, mask_sh),\
+	SF(OTG0_OTG_V_SYNC_A_CNTL, OTG_V_SYNC_MODE, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_MASTER_EN, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_START_POINT_CNTL, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_DISABLE_POINT_CNTL, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_FIELD_NUMBER_CNTL, mask_sh),\
+	SF(OTG0_OTG_CONTROL, OTG_OUT_MUX, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_STEREO_EN, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_STEREO_SYNC_OUTPUT_LINE_NUM, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_STEREO_SYNC_OUTPUT_POLARITY, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_STEREO_EYE_FLAG_POLARITY, mask_sh),\
+	SF(OTG0_OTG_STEREO_CONTROL, OTG_DISABLE_STEREOSYNC_OUTPUT_FOR_DP, mask_sh),\
+	SF(OTG0_OTG_STEREO_STATUS, OTG_STEREO_CURRENT_EYE, mask_sh),\
+	SF(OTG0_OTG_3D_STRUCTURE_CONTROL, OTG_3D_STRUCTURE_EN, mask_sh),\
+	SF(OTG0_OTG_3D_STRUCTURE_CONTROL, OTG_3D_STRUCTURE_V_UPDATE_MODE, mask_sh),\
+	SF(OTG0_OTG_3D_STRUCTURE_CONTROL, OTG_3D_STRUCTURE_STEREO_SEL_OVR, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_MAX, OTG_V_TOTAL_MAX, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_MIN, OTG_V_TOTAL_MIN, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_V_TOTAL_MIN_SEL, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_V_TOTAL_MAX_SEL, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_FORCE_LOCK_ON_EVENT, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_SET_V_TOTAL_MIN_MASK, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_VTOTAL_MID_REPLACING_MIN_EN, mask_sh),\
+	SF(OTG0_OTG_V_TOTAL_CONTROL, OTG_VTOTAL_MID_REPLACING_MAX_EN, mask_sh),\
+	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_CLEAR, mask_sh),\
+	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_MODE, mask_sh),\
+	SF(OTG0_OTG_FORCE_COUNT_NOW_CNTL, OTG_FORCE_COUNT_NOW_OCCURRED, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_SOURCE_SELECT, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_SOURCE_PIPE_SELECT, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_RISING_EDGE_DETECT_CNTL, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_FALLING_EDGE_DETECT_CNTL, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_POLARITY_SELECT, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_FREQUENCY_SELECT, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_DELAY, mask_sh),\
+	SF(OTG0_OTG_TRIGA_CNTL, OTG_TRIGA_CLEAR, mask_sh),\
+	SF(OTG0_OTG_STATIC_SCREEN_CONTROL, OTG_STATIC_SCREEN_EVENT_MASK, mask_sh),\
+	SF(OTG0_OTG_STATIC_SCREEN_CONTROL, OTG_STATIC_SCREEN_FRAME_COUNT, mask_sh),\
+	SF(OTG0_OTG_STATUS_FRAME_COUNT, OTG_FRAME_COUNT, mask_sh),\
+	SF(OTG0_OTG_STATUS, OTG_V_BLANK, mask_sh),\
+	SF(OTG0_OTG_STATUS, OTG_V_ACTIVE_DISP, mask_sh),\
+	SF(OTG0_OTG_STATUS_POSITION, OTG_HORZ_COUNT, mask_sh),\
+	SF(OTG0_OTG_STATUS_POSITION, OTG_VERT_COUNT, mask_sh),\
+	SF(OTG0_OTG_NOM_VERT_POSITION, OTG_VERT_COUNT_NOM, mask_sh),\
+	SF(OTG0_OTG_M_CONST_DTO0, OTG_M_CONST_DTO_PHASE, mask_sh),\
+	SF(OTG0_OTG_M_CONST_DTO1, OTG_M_CONST_DTO_MODULO, mask_sh),\
+	SF(OTG0_OTG_CLOCK_CONTROL, OTG_BUSY, mask_sh),\
+	SF(OTG0_OTG_CLOCK_CONTROL, OTG_CLOCK_EN, mask_sh),\
+	SF(OTG0_OTG_CLOCK_CONTROL, OTG_CLOCK_ON, mask_sh),\
+	SF(OTG0_OTG_CLOCK_CONTROL, OTG_CLOCK_GATE_DIS, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT0_CONTROL, OTG_VERTICAL_INTERRUPT0_INT_ENABLE, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT0_POSITION, OTG_VERTICAL_INTERRUPT0_LINE_START, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT0_POSITION, OTG_VERTICAL_INTERRUPT0_LINE_END, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT1_CONTROL, OTG_VERTICAL_INTERRUPT1_INT_ENABLE, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT1_POSITION, OTG_VERTICAL_INTERRUPT1_LINE_START, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT2_CONTROL, OTG_VERTICAL_INTERRUPT2_INT_ENABLE, mask_sh),\
+	SF(OTG0_OTG_VERTICAL_INTERRUPT2_POSITION, OTG_VERTICAL_INTERRUPT2_LINE_START, mask_sh),\
+	SF(ODM0_OPTC_INPUT_CLOCK_CONTROL, OPTC_INPUT_CLK_EN, mask_sh),\
+	SF(ODM0_OPTC_INPUT_CLOCK_CONTROL, OPTC_INPUT_CLK_ON, mask_sh),\
+	SF(ODM0_OPTC_INPUT_CLOCK_CONTROL, OPTC_INPUT_CLK_GATE_DIS, mask_sh),\
+	SF(ODM0_OPTC_INPUT_GLOBAL_CONTROL, OPTC_UNDERFLOW_OCCURRED_STATUS, mask_sh),\
+	SF(ODM0_OPTC_INPUT_GLOBAL_CONTROL, OPTC_UNDERFLOW_CLEAR, mask_sh),\
+	SF(VTG0_CONTROL, VTG0_ENABLE, mask_sh),\
+	SF(VTG0_CONTROL, VTG0_FP2, mask_sh),\
+	SF(VTG0_CONTROL, VTG0_VCOUNT_INIT, mask_sh),\
+	SF(OTG0_OTG_VERT_SYNC_CONTROL, OTG_FORCE_VSYNC_NEXT_LINE_OCCURRED, mask_sh),\
+	SF(OTG0_OTG_VERT_SYNC_CONTROL, OTG_FORCE_VSYNC_NEXT_LINE_CLEAR, mask_sh),\
+	SF(OTG0_OTG_VERT_SYNC_CONTROL, OTG_AUTO_FORCE_VSYNC_MODE, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL0_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL1_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL2_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_MASTER_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_FORCE_DELAY, mask_sh),\
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_CHECK_ALL_FIELDS, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL, OTG_CRC_CONT_EN, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL, OTG_CRC0_SELECT, mask_sh),\
+	SF(OTG0_OTG_CRC_CNTL, OTG_CRC_EN, mask_sh),\
+	SF(OTG0_OTG_CRC0_DATA_RG, CRC0_R_CR, mask_sh),\
+	SF(OTG0_OTG_CRC0_DATA_RG, CRC0_G_Y, mask_sh),\
+	SF(OTG0_OTG_CRC0_DATA_B, CRC0_B_CB, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWA_X_CONTROL, OTG_CRC0_WINDOWA_X_START, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWA_X_CONTROL, OTG_CRC0_WINDOWA_X_END, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWA_Y_CONTROL, OTG_CRC0_WINDOWA_Y_START, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWA_Y_CONTROL, OTG_CRC0_WINDOWA_Y_END, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWB_X_CONTROL, OTG_CRC0_WINDOWB_X_START, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWB_X_CONTROL, OTG_CRC0_WINDOWB_X_END, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWB_Y_CONTROL, OTG_CRC0_WINDOWB_Y_START, mask_sh),\
+	SF(OTG0_OTG_CRC0_WINDOWB_Y_CONTROL, OTG_CRC0_WINDOWB_Y_END, mask_sh),\
+	SF(OTG0_OTG_TRIGA_MANUAL_TRIG, OTG_TRIGA_MANUAL_TRIG, mask_sh),\
+	SF(GSL_SOURCE_SELECT, GSL0_READY_SOURCE_SEL, mask_sh),\
+	SF(GSL_SOURCE_SELECT, GSL1_READY_SOURCE_SEL, mask_sh),\
+	SF(GSL_SOURCE_SELECT, GSL2_READY_SOURCE_SEL, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL2, MANUAL_FLOW_CONTROL_SEL, mask_sh),\
+	SF(OTG0_OTG_GLOBAL_CONTROL2, GLOBAL_UPDATE_LOCK_EN, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_X, OTG_GSL_WINDOW_START_X, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_X, OTG_GSL_WINDOW_END_X, mask_sh), \
+	SF(OTG0_OTG_GSL_WINDOW_Y, OTG_GSL_WINDOW_START_Y, mask_sh),\
+	SF(OTG0_OTG_GSL_WINDOW_Y, OTG_GSL_WINDOW_END_Y, mask_sh),\
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, OTG_MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_EN, mask_sh), \
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_START_OFFSET, mask_sh), \
+	SF(OTG0_OTG_VUPDATE_KEEPOUT, MASTER_UPDATE_LOCK_VUPDATE_KEEPOUT_END_OFFSET, mask_sh), \
+	SF(OTG0_OTG_GSL_CONTROL, OTG_GSL_MASTER_MODE, mask_sh), \
+	SF(OTG0_OTG_GSL_CONTROL, OTG_MASTER_UPDATE_LOCK_GSL_EN, mask_sh), \
+	SF(OTG0_OTG_DSC_START_POSITION, OTG_DSC_START_POSITION_X, mask_sh), \
+	SF(OTG0_OTG_DSC_START_POSITION, OTG_DSC_START_POSITION_LINE_NUM, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG0_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG1_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG2_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_SEG3_SRC_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_SOURCE_SELECT, OPTC_NUM_OF_INPUT_SEGMENT, mask_sh),\
+	SF(ODM0_OPTC_MEMORY_CONFIG, OPTC_MEM_SEL, mask_sh),\
+	SF(ODM0_OPTC_DATA_FORMAT_CONTROL, OPTC_DATA_FORMAT, mask_sh),\
+	SF(ODM0_OPTC_DATA_FORMAT_CONTROL, OPTC_DSC_MODE, mask_sh),\
+	SF(ODM0_OPTC_BYTES_PER_PIXEL, OPTC_DSC_BYTES_PER_PIXEL, mask_sh),\
+	SF(ODM0_OPTC_WIDTH_CONTROL, OPTC_DSC_SLICE_WIDTH, mask_sh),\
+	SF(ODM0_OPTC_WIDTH_CONTROL, OPTC_SEGMENT_WIDTH, mask_sh),\
+	SF(OTG0_OTG_DRR_TRIGGER_WINDOW, OTG_DRR_TRIGGER_WINDOW_START_X, mask_sh),\
+	SF(OTG0_OTG_DRR_TRIGGER_WINDOW, OTG_DRR_TRIGGER_WINDOW_END_X, mask_sh),\
+	SF(OTG0_OTG_DRR_V_TOTAL_CHANGE, OTG_DRR_V_TOTAL_CHANGE_LIMIT, mask_sh),\
+	SF(OTG0_OTG_H_TIMING_CNTL, OTG_H_TIMING_DIV_MODE, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_MODE, mask_sh),\
+	SF(OTG0_OTG_DRR_CONTROL, OTG_V_TOTAL_LAST_USED_BY_DRR, mask_sh)
+
+void dcn32_timing_generator_init(struct optc *optc1);
+
+#endif /* __DC_OPTC_DCN32_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
new file mode 100644
index 000000000000..17a287bc89ce
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -0,0 +1,3976 @@
+// SPDX-License-Identifier: MIT
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
+
+#include "dm_services.h"
+#include "dc.h"
+
+#include "dcn32_init.h"
+
+#include "resource.h"
+#include "include/irq_service_interface.h"
+#include "dcn32_resource.h"
+
+#include "dcn20/dcn20_resource.h"
+#include "dcn30/dcn30_resource.h"
+
+#include "dcn10/dcn10_ipp.h"
+#include "dcn30/dcn30_hubbub.h"
+#include "dcn31/dcn31_hubbub.h"
+#include "dcn32/dcn32_hubbub.h"
+#include "dcn32/dcn32_mpc.h"
+#include "dcn32_hubp.h"
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
+#include "dcn/dcn_3_2_0_offset.h"
+#include "dcn/dcn_3_2_0_sh_mask.h"
+#include "dcn/nbio_4_3_0_offset.h"
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
+#define MAX_INSTANCE                                        6
+#define MAX_SEGMENT                                         6
+
+struct IP_BASE_INSTANCE {
+	unsigned int segment[MAX_SEGMENT];
+};
+
+struct IP_BASE {
+	struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
+};
+
+static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } } } };
+
+#define DC_LOGGER_INIT(logger)
+
+#define DCN3_2_DEFAULT_DET_SIZE 256
+#define DCN3_2_MAX_DET_SIZE 1152
+#define DCN3_2_MIN_DET_SIZE 128
+#define DCN3_2_MIN_COMPBUF_SIZE_KB 128
+
+struct _vcs_dpi_ip_params_st dcn3_2_ip = {
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
+struct _vcs_dpi_soc_bounding_box_st dcn3_2_soc = {
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
+enum dcn32_clk_src_array_id {
+	DCN32_CLK_SRC_PLL0,
+	DCN32_CLK_SRC_PLL1,
+	DCN32_CLK_SRC_PLL2,
+	DCN32_CLK_SRC_PLL3,
+	DCN32_CLK_SRC_PLL4,
+	DCN32_CLK_SRC_TOTAL
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
+	//DPCS_DCN31_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+	LINK_ENCODER_MASK_SH_LIST_DCN31(_MASK), \
+
+	//DPCS_DCN31_MASK_SH_LIST(_MASK)
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
+//#ifdef DIAGS_BUILD
+//static struct dcn_optc_registers optc_regs[] = {
+//#else
+static const struct dcn_optc_registers optc_regs[] = {
+//#endif
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
+static const struct resource_caps res_cap_dcn32 = {
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
+static struct dce_aux *dcn32_aux_engine_create(
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
+static struct dce_i2c_hw *dcn32_i2c_hw_create(
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
+static struct clock_source *dcn32_clock_source_create(
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
+static struct hubbub *dcn32_hubbub_create(struct dc_context *ctx)
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
+	for (i = 0; i < res_cap_dcn32.num_vmid; i++) {
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
+static struct hubp *dcn32_hubp_create(
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
+static void dcn32_dpp_destroy(struct dpp **dpp)
+{
+	kfree(TO_DCN30_DPP(*dpp));
+	*dpp = NULL;
+}
+
+static struct dpp *dcn32_dpp_create(
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
+static struct mpc *dcn32_mpc_create(
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
+static struct output_pixel_processor *dcn32_opp_create(
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
+static struct timing_generator *dcn32_timing_generator_create(
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
+static struct link_encoder *dcn32_link_encoder_create(
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
+struct panel_cntl *dcn32_panel_cntl_create(const struct panel_cntl_init_data *init_data)
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
+static struct audio *dcn32_create_audio(
+		struct dc_context *ctx, unsigned int inst)
+{
+	return dce_audio_create(ctx, inst,
+			&audio_regs[inst], &audio_shift, &audio_mask);
+}
+
+static struct vpg *dcn32_vpg_create(
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
+static struct afmt *dcn32_afmt_create(
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
+static struct stream_encoder *dcn32_stream_encoder_create(
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
+	vpg = dcn32_vpg_create(ctx, vpg_inst);
+	afmt = dcn32_afmt_create(ctx, afmt_inst);
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
+static struct hpo_dp_stream_encoder *dcn32_hpo_dp_stream_encoder_create(
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
+	vpg = dcn32_vpg_create(ctx, vpg_inst);
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
+static struct hpo_dp_link_encoder *dcn32_hpo_dp_link_encoder_create(
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
+static struct dce_hwseq *dcn32_hwseq_create(
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
+	.create_audio = dcn32_create_audio,
+	.create_stream_encoder = dcn32_stream_encoder_create,
+	.create_hpo_dp_stream_encoder = dcn32_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn32_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn32_hwseq_create,
+};
+
+static const struct resource_create_funcs res_create_maximus_funcs = {
+	.read_dce_straps = NULL,
+	.create_audio = NULL,
+	.create_stream_encoder = NULL,
+	.create_hpo_dp_stream_encoder = dcn32_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn32_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn32_hwseq_create,
+};
+
+static void dcn32_resource_destruct(struct dcn32_resource_pool *pool)
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
+			dcn32_dpp_destroy(&pool->base.dpps[i]);
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
+static bool dcn32_dwbc_create(struct dc_context *ctx, struct resource_pool *pool)
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
+static bool dcn32_mmhubbub_create(struct dc_context *ctx, struct resource_pool *pool)
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
+static struct display_stream_compressor *dcn32_dsc_create(
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
+static void dcn32_destroy_resource_pool(struct resource_pool **pool)
+{
+	struct dcn32_resource_pool *dcn32_pool = TO_DCN32_RES_POOL(*pool);
+
+	dcn32_resource_destruct(dcn32_pool);
+	kfree(dcn32_pool);
+	*pool = NULL;
+}
+
+bool dcn32_acquire_post_bldn_3dlut(
+		struct resource_context *res_ctx,
+		const struct resource_pool *pool,
+		int mpcc_id,
+		struct dc_3dlut **lut,
+		struct dc_transfer_func **shaper)
+{
+	bool ret = false;
+	union dc_3dlut_state *state;
+
+	ASSERT(*lut == NULL && *shaper == NULL);
+	*lut = NULL;
+	*shaper = NULL;
+
+	if (!res_ctx->is_mpc_3dlut_acquired[mpcc_id]) {
+		*lut = pool->mpc_lut[mpcc_id];
+		*shaper = pool->mpc_shaper[mpcc_id];
+		state = &pool->mpc_lut[mpcc_id]->state;
+		res_ctx->is_mpc_3dlut_acquired[mpcc_id] = true;
+		ret = true;
+	}
+	return ret;
+}
+
+bool dcn32_release_post_bldn_3dlut(
+		struct resource_context *res_ctx,
+		const struct resource_pool *pool,
+		struct dc_3dlut **lut,
+		struct dc_transfer_func **shaper)
+{
+	int i;
+	bool ret = false;
+
+	for (i = 0; i < pool->res_cap->num_mpc_3dlut; i++) {
+		if (pool->mpc_lut[i] == *lut && pool->mpc_shaper[i] == *shaper) {
+			res_ctx->is_mpc_3dlut_acquired[i] = false;
+			pool->mpc_lut[i]->state.raw = 0;
+			*lut = NULL;
+			*shaper = NULL;
+			ret = true;
+			break;
+		}
+	}
+	return ret;
+}
+
+/**
+ ********************************************************************************************
+ * dcn32_get_num_free_pipes: Calculate number of free pipes
+ *
+ * This function assumes that a "used" pipe is a pipe that has
+ * both a stream and a plane assigned to it.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ *
+ * @return: Number of free pipes available in the context
+ *
+ ********************************************************************************************
+ */
+static unsigned int dcn32_get_num_free_pipes(struct dc *dc, struct dc_state *context)
+{
+	unsigned int i;
+	unsigned int free_pipes = 0;
+	unsigned int num_pipes = 0;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe->stream && pipe->plane_state && !pipe->top_pipe) {
+			while (pipe) {
+				num_pipes++;
+				pipe = pipe->bottom_pipe;
+			}
+		}
+	}
+
+	free_pipes = dc->res_pool->pipe_count - num_pipes;
+	return free_pipes;
+}
+
+/**
+ ********************************************************************************************
+ * dcn32_assign_subvp_pipe: Function to decide which pipe will use Sub-VP.
+ *
+ * We enter this function if we are Sub-VP capable (i.e. enough pipes available)
+ * and regular P-State switching (i.e. VACTIVE/VBLANK) is not supported, or if
+ * we are forcing SubVP P-State switching on the current config.
+ *
+ * The number of pipes used for the chosen surface must be less than or equal to the
+ * number of free pipes available.
+ *
+ * In general we choose surfaces that have ActiveDRAMClockChangeLatencyMargin <= 0 first,
+ * then among those surfaces we choose the one with the smallest VBLANK time. We only consider
+ * surfaces with ActiveDRAMClockChangeLatencyMargin > 0 if we are forcing a Sub-VP config.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [out] index: dc pipe index for the pipe chosen to have phantom pipes assigned
+ *
+ * @return: True if a valid pipe assignment was found for Sub-VP. Otherwise false.
+ *
+ ********************************************************************************************
+ */
+
+static bool dcn32_assign_subvp_pipe(struct dc *dc,
+		struct dc_state *context,
+		unsigned int *index)
+{
+	unsigned int i, pipe_idx;
+	unsigned int min_vblank_us = INT_MAX;
+	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
+	bool valid_assignment_found = false;
+	unsigned int free_pipes = dcn32_get_num_free_pipes(dc, context);
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		unsigned int num_pipes = 0;
+
+		if (!pipe->stream)
+			continue;
+
+		if (pipe->plane_state && !pipe->top_pipe &&
+				pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			while (pipe) {
+				num_pipes++;
+				pipe = pipe->bottom_pipe;
+			}
+
+			pipe = &context->res_ctx.pipe_ctx[i];
+			if (num_pipes <= free_pipes) {
+				struct dc_stream_state *stream = pipe->stream;
+				unsigned int vblank_us = ((stream->timing.v_total - stream->timing.v_addressable) *
+							stream->timing.h_total /
+							(double)(stream->timing.pix_clk_100hz * 100)) * 1000000;
+				if (vba->ActiveDRAMClockChangeLatencyMargin[vba->pipe_plane[pipe_idx]] <= 0 &&
+						vblank_us < min_vblank_us) {
+					*index = i;
+					min_vblank_us = vblank_us;
+					valid_assignment_found = true;
+				} else if (vba->ActiveDRAMClockChangeLatencyMargin[vba->pipe_plane[pipe_idx]] > 0 &&
+						dc->debug.force_subvp_mclk_switch && !valid_assignment_found) {
+					// Handle case for forcing Sub-VP config. In this case we can assign
+					// phantom pipes to a surface that has active margin > 0.
+					*index = i;
+					valid_assignment_found = true;
+				}
+			}
+		}
+		pipe_idx++;
+	}
+	return valid_assignment_found;
+}
+
+/**
+ * ***************************************************************************************
+ * dcn32_enough_pipes_for_subvp: Function to check if there are "enough" pipes for SubVP.
+ *
+ * This function returns true if there are enough free pipes
+ * to create the required phantom pipes for any given stream
+ * (that does not already have phantom pipe assigned).
+ *
+ * e.g. For a 2 stream config where the first stream uses one
+ * pipe and the second stream uses 2 pipes (i.e. pipe split),
+ * this function will return true because there is 1 remaining
+ * pipe which can be used as the phantom pipe for the non pipe
+ * split pipe.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ *
+ * @return: True if there are enough free pipes to assign phantom pipes to at least one
+ *          stream that does not already have phantom pipes assigned. Otherwise false.
+ *
+ * ***************************************************************************************
+ */
+static bool dcn32_enough_pipes_for_subvp(struct dc *dc, struct dc_state *context)
+{
+	unsigned int i, split_cnt, free_pipes;
+	unsigned int min_pipe_split = dc->res_pool->pipe_count + 1; // init as max number of pipes + 1
+	bool subvp_possible = false;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		// Find the minimum pipe split count for non SubVP pipes
+		if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
+				pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			split_cnt = 0;
+			while (pipe) {
+				split_cnt++;
+				pipe = pipe->bottom_pipe;
+			}
+
+			if (split_cnt < min_pipe_split)
+				min_pipe_split = split_cnt;
+		}
+	}
+
+	free_pipes = dcn32_get_num_free_pipes(dc, context);
+
+	// SubVP only possible if at least one pipe is being used (i.e. free_pipes
+	// should not equal to the pipe_count)
+	if (free_pipes >= min_pipe_split && free_pipes < dc->res_pool->pipe_count)
+		subvp_possible = true;
+
+	return subvp_possible;
+}
+
+static void dcn32_enable_phantom_plane(struct dc *dc,
+		struct dc_state *context,
+		struct dc_stream_state *phantom_stream,
+		unsigned int dc_pipe_idx)
+{
+	struct dc_plane_state *phantom_plane = NULL;
+	struct dc_plane_state *prev_phantom_plane = NULL;
+	struct pipe_ctx *curr_pipe = &context->res_ctx.pipe_ctx[dc_pipe_idx];
+
+	while (curr_pipe) {
+		if (curr_pipe->top_pipe && curr_pipe->top_pipe->plane_state == curr_pipe->plane_state)
+			phantom_plane = prev_phantom_plane;
+		else
+			phantom_plane = dc_create_plane_state(dc);
+
+		memcpy(&phantom_plane->address, &curr_pipe->plane_state->address, sizeof(phantom_plane->address));
+		memcpy(&phantom_plane->scaling_quality, &curr_pipe->plane_state->scaling_quality,
+				sizeof(phantom_plane->scaling_quality));
+		memcpy(&phantom_plane->src_rect, &curr_pipe->plane_state->src_rect, sizeof(phantom_plane->src_rect));
+		memcpy(&phantom_plane->dst_rect, &curr_pipe->plane_state->dst_rect, sizeof(phantom_plane->dst_rect));
+		memcpy(&phantom_plane->clip_rect, &curr_pipe->plane_state->clip_rect, sizeof(phantom_plane->clip_rect));
+		memcpy(&phantom_plane->plane_size, &curr_pipe->plane_state->plane_size,
+				sizeof(phantom_plane->plane_size));
+		memcpy(&phantom_plane->tiling_info, &curr_pipe->plane_state->tiling_info,
+				sizeof(phantom_plane->tiling_info));
+		memcpy(&phantom_plane->dcc, &curr_pipe->plane_state->dcc, sizeof(phantom_plane->dcc));
+		phantom_plane->format = curr_pipe->plane_state->format;
+		phantom_plane->rotation = curr_pipe->plane_state->rotation;
+		phantom_plane->visible = curr_pipe->plane_state->visible;
+
+		/* Shadow pipe has small viewport. */
+		phantom_plane->clip_rect.y = 0;
+		phantom_plane->clip_rect.height = phantom_stream->timing.v_addressable;
+
+		dc_add_plane_to_context(dc, phantom_stream, phantom_plane, context);
+
+		curr_pipe = curr_pipe->bottom_pipe;
+		prev_phantom_plane = phantom_plane;
+	}
+}
+
+/**
+ * ***************************************************************************************
+ * dcn32_set_phantom_stream_timing: Set timing params for the phantom stream
+ *
+ * Set timing params of the phantom stream based on calculated output from DML.
+ * This function first gets the DML pipe index using the DC pipe index, then
+ * calls into DML (get_subviewport_lines_needed_in_mall) to get the number of
+ * lines required for SubVP MCLK switching and assigns to the phantom stream
+ * accordingly.
+ *
+ * - The number of SubVP lines calculated in DML does not take into account
+ * FW processing delays and required pstate allow width, so we must include
+ * that separately.
+ *
+ * - Set phantom backporch = vstartup of main pipe
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [in] ref_pipe: Main pipe for the phantom stream
+ * @param [in] pipes: DML pipe params
+ * @param [in] pipe_cnt: number of DML pipes
+ * @param [in] dc_pipe_idx: DC pipe index for the main pipe (i.e. ref_pipe)
+ *
+ * @return: void
+ *
+ * ***************************************************************************************
+ */
+static void dcn32_set_phantom_stream_timing(struct dc *dc,
+		struct dc_state *context,
+		struct pipe_ctx *ref_pipe,
+		struct dc_stream_state *phantom_stream,
+		display_e2e_pipe_params_st *pipes,
+		unsigned int pipe_cnt,
+		unsigned int dc_pipe_idx)
+{
+	unsigned int i, pipe_idx;
+	struct pipe_ctx *pipe;
+	uint32_t phantom_vactive, phantom_bp, pstate_width_fw_delay_lines;
+	unsigned int vlevel = context->bw_ctx.dml.vba.VoltageLevel;
+	unsigned int dcfclk = context->bw_ctx.dml.vba.DCFCLKState[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
+	unsigned int socclk = context->bw_ctx.dml.vba.SOCCLKPerState[vlevel];
+
+	// Find DML pipe index (pipe_idx) using dc_pipe_idx
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (!pipe->stream)
+			continue;
+
+		if (i == dc_pipe_idx)
+			break;
+
+		pipe_idx++;
+	}
+
+	// Calculate lines required for pstate allow width and FW processing delays
+	pstate_width_fw_delay_lines = ((double)(dc->caps.subvp_fw_processing_delay_us +
+			dc->caps.subvp_pstate_allow_width_us) / 1000000) *
+			(ref_pipe->stream->timing.pix_clk_100hz * 100) /
+			(double)ref_pipe->stream->timing.h_total;
+
+	// Update clks_cfg for calling into recalculate
+	pipes[0].clks_cfg.voltage = vlevel;
+	pipes[0].clks_cfg.dcfclk_mhz = dcfclk;
+	pipes[0].clks_cfg.socclk_mhz = socclk;
+
+	// DML calculation for MALL region doesn't take into account FW delay
+	// and required pstate allow width for multi-display cases
+	phantom_vactive = get_subviewport_lines_needed_in_mall(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx) +
+				pstate_width_fw_delay_lines;
+
+	// For backporch of phantom pipe, use vstartup of the main pipe
+	phantom_bp = get_vstartup(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
+
+	phantom_stream->dst.y = 0;
+	phantom_stream->dst.height = phantom_vactive;
+	phantom_stream->src.y = 0;
+	phantom_stream->src.height = phantom_vactive;
+
+	phantom_stream->timing.v_addressable = phantom_vactive;
+	phantom_stream->timing.v_front_porch = 1;
+	phantom_stream->timing.v_total = phantom_stream->timing.v_addressable +
+						phantom_stream->timing.v_front_porch +
+						phantom_stream->timing.v_sync_width +
+						phantom_bp;
+}
+
+static struct dc_stream_state *dcn32_enable_phantom_stream(struct dc *dc,
+		struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		unsigned int pipe_cnt,
+		unsigned int dc_pipe_idx)
+{
+	struct dc_stream_state *phantom_stream = NULL;
+	struct pipe_ctx *ref_pipe = &context->res_ctx.pipe_ctx[dc_pipe_idx];
+
+	phantom_stream = dc_create_stream_for_sink(ref_pipe->stream->sink);
+	phantom_stream->signal = SIGNAL_TYPE_VIRTUAL;
+	phantom_stream->dpms_off = true;
+	phantom_stream->mall_stream_config.type = SUBVP_PHANTOM;
+	phantom_stream->mall_stream_config.paired_stream = ref_pipe->stream;
+	ref_pipe->stream->mall_stream_config.type = SUBVP_MAIN;
+	ref_pipe->stream->mall_stream_config.paired_stream = phantom_stream;
+
+	/* stream has limited viewport and small timing */
+	memcpy(&phantom_stream->timing, &ref_pipe->stream->timing, sizeof(phantom_stream->timing));
+	memcpy(&phantom_stream->src, &ref_pipe->stream->src, sizeof(phantom_stream->src));
+	memcpy(&phantom_stream->dst, &ref_pipe->stream->dst, sizeof(phantom_stream->dst));
+	dcn32_set_phantom_stream_timing(dc, context, ref_pipe, phantom_stream, pipes, pipe_cnt, dc_pipe_idx);
+
+	dc_add_stream_to_ctx(dc, context, phantom_stream);
+	return phantom_stream;
+}
+
+void dcn32_remove_phantom_pipes(struct dc *dc, struct dc_state *context)
+{
+	int i;
+	bool removed_pipe = false;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		// build scaling params for phantom pipes
+		if (pipe->plane_state && pipe->stream && pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			dc_rem_all_planes_for_stream(dc, pipe->stream, context);
+			dc_remove_stream_from_ctx(dc, context, pipe->stream);
+			removed_pipe = true;
+		}
+
+		// Clear all phantom stream info
+		if (pipe->stream) {
+			pipe->stream->mall_stream_config.type = SUBVP_NONE;
+			pipe->stream->mall_stream_config.paired_stream = NULL;
+		}
+	}
+	if (removed_pipe)
+		dc->hwss.apply_ctx_to_hw(dc, context);
+}
+
+/* TODO: Input to this function should indicate which pipe indexes (or streams)
+ * require a phantom pipe / stream
+ */
+void dcn32_add_phantom_pipes(struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		unsigned int pipe_cnt,
+		unsigned int index)
+{
+	struct dc_stream_state *phantom_stream = NULL;
+	unsigned int i;
+
+	// The index of the DC pipe passed into this function is guarenteed to
+	// be a valid candidate for SubVP (i.e. has a plane, stream, doesn't
+	// already have phantom pipe assigned, etc.) by previous checks.
+	phantom_stream = dcn32_enable_phantom_stream(dc, context, pipes, pipe_cnt, index);
+	dcn32_enable_phantom_plane(dc, context, phantom_stream, index);
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		// Build scaling params for phantom pipes which were newly added.
+		// We determine which phantom pipes were added by comparing with
+		// the phantom stream.
+		if (pipe->plane_state && pipe->stream && pipe->stream == phantom_stream &&
+				pipe->stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			pipe->stream->use_dynamic_meta = false;
+			pipe->plane_state->flip_immediate = false;
+			if (!resource_build_scaling_params(pipe)) {
+				// Log / remove phantom pipes since failed to build scaling params
+			}
+		}
+	}
+}
+
+static bool dcn32_split_stream_for_mpc_or_odm(
+		const struct dc *dc,
+		struct resource_context *res_ctx,
+		struct pipe_ctx *pri_pipe,
+		struct pipe_ctx *sec_pipe,
+		bool odm)
+{
+	int pipe_idx = sec_pipe->pipe_idx;
+	const struct resource_pool *pool = dc->res_pool;
+
+	if (pri_pipe->plane_state) {
+		/* ODM + window MPO, where MPO window is on left half only */
+		if (pri_pipe->plane_state->clip_rect.x + pri_pipe->plane_state->clip_rect.width <=
+				pri_pipe->stream->src.x + pri_pipe->stream->src.width/2)
+			return true;
+
+		/* ODM + window MPO, where MPO window is on right half only */
+		if (pri_pipe->plane_state->clip_rect.x >= pri_pipe->stream->src.width/2)
+			return true;
+	}
+
+	*sec_pipe = *pri_pipe;
+
+	sec_pipe->pipe_idx = pipe_idx;
+	sec_pipe->plane_res.mi = pool->mis[pipe_idx];
+	sec_pipe->plane_res.hubp = pool->hubps[pipe_idx];
+	sec_pipe->plane_res.ipp = pool->ipps[pipe_idx];
+	sec_pipe->plane_res.xfm = pool->transforms[pipe_idx];
+	sec_pipe->plane_res.dpp = pool->dpps[pipe_idx];
+	sec_pipe->plane_res.mpcc_inst = pool->dpps[pipe_idx]->inst;
+	sec_pipe->stream_res.dsc = NULL;
+	if (odm) {
+		if (pri_pipe->next_odm_pipe) {
+			ASSERT(pri_pipe->next_odm_pipe != sec_pipe);
+			sec_pipe->next_odm_pipe = pri_pipe->next_odm_pipe;
+			sec_pipe->next_odm_pipe->prev_odm_pipe = sec_pipe;
+		}
+		if (pri_pipe->top_pipe && pri_pipe->top_pipe->next_odm_pipe) {
+			pri_pipe->top_pipe->next_odm_pipe->bottom_pipe = sec_pipe;
+			sec_pipe->top_pipe = pri_pipe->top_pipe->next_odm_pipe;
+		}
+		if (pri_pipe->bottom_pipe && pri_pipe->bottom_pipe->next_odm_pipe) {
+			pri_pipe->bottom_pipe->next_odm_pipe->top_pipe = sec_pipe;
+			sec_pipe->bottom_pipe = pri_pipe->bottom_pipe->next_odm_pipe;
+		}
+		pri_pipe->next_odm_pipe = sec_pipe;
+		sec_pipe->prev_odm_pipe = pri_pipe;
+		ASSERT(sec_pipe->top_pipe == NULL);
+
+		if (!sec_pipe->top_pipe)
+			sec_pipe->stream_res.opp = pool->opps[pipe_idx];
+		else
+			sec_pipe->stream_res.opp = sec_pipe->top_pipe->stream_res.opp;
+		if (sec_pipe->stream->timing.flags.DSC == 1) {
+			dcn20_acquire_dsc(dc, res_ctx, &sec_pipe->stream_res.dsc, pipe_idx);
+			ASSERT(sec_pipe->stream_res.dsc);
+			if (sec_pipe->stream_res.dsc == NULL)
+				return false;
+		}
+	} else {
+		if (pri_pipe->bottom_pipe) {
+			ASSERT(pri_pipe->bottom_pipe != sec_pipe);
+			sec_pipe->bottom_pipe = pri_pipe->bottom_pipe;
+			sec_pipe->bottom_pipe->top_pipe = sec_pipe;
+		}
+		pri_pipe->bottom_pipe = sec_pipe;
+		sec_pipe->top_pipe = pri_pipe;
+
+		ASSERT(pri_pipe->plane_state);
+	}
+
+	return true;
+}
+
+static struct pipe_ctx *dcn32_find_split_pipe(
+		struct dc *dc,
+		struct dc_state *context,
+		int old_index)
+{
+	struct pipe_ctx *pipe = NULL;
+	int i;
+
+	if (old_index >= 0 && context->res_ctx.pipe_ctx[old_index].stream == NULL) {
+		pipe = &context->res_ctx.pipe_ctx[old_index];
+		pipe->pipe_idx = old_index;
+	}
+
+	if (!pipe)
+		for (i = dc->res_pool->pipe_count - 1; i >= 0; i--) {
+			if (dc->current_state->res_ctx.pipe_ctx[i].top_pipe == NULL
+					&& dc->current_state->res_ctx.pipe_ctx[i].prev_odm_pipe == NULL) {
+				if (context->res_ctx.pipe_ctx[i].stream == NULL) {
+					pipe = &context->res_ctx.pipe_ctx[i];
+					pipe->pipe_idx = i;
+					break;
+				}
+			}
+		}
+
+	/*
+	 * May need to fix pipes getting tossed from 1 opp to another on flip
+	 * Add for debugging transient underflow during topology updates:
+	 * ASSERT(pipe);
+	 */
+	if (!pipe)
+		for (i = dc->res_pool->pipe_count - 1; i >= 0; i--) {
+			if (context->res_ctx.pipe_ctx[i].stream == NULL) {
+				pipe = &context->res_ctx.pipe_ctx[i];
+				pipe->pipe_idx = i;
+				break;
+			}
+		}
+
+	return pipe;
+}
+
+
+/**
+ * ***************************************************************************************
+ * subvp_subvp_schedulable: Determine if SubVP + SubVP config is schedulable
+ *
+ * High level algorithm:
+ * 1. Find longest microschedule length (in us) between the two SubVP pipes
+ * 2. Check if the worst case overlap (VBLANK in middle of ACTIVE) for both
+ * pipes still allows for the maximum microschedule to fit in the active
+ * region for both pipes.
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ *
+ * @return: bool - True if the SubVP + SubVP config is schedulable, false otherwise
+ *
+ * ***************************************************************************************
+ */
+static bool subvp_subvp_schedulable(struct dc *dc, struct dc_state *context)
+{
+	struct pipe_ctx *subvp_pipes[2];
+	struct dc_stream_state *phantom = NULL;
+	uint32_t microschedule_lines = 0;
+	uint32_t index = 0;
+	uint32_t i;
+	uint32_t max_microschedule_us = 0;
+	int32_t vactive1_us, vactive2_us, vblank1_us, vblank2_us;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		uint32_t time_us = 0;
+
+		/* Loop to calculate the maximum microschedule time between the two SubVP pipes,
+		 * and also to store the two main SubVP pipe pointers in subvp_pipes[2].
+		 */
+		if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
+				pipe->stream->mall_stream_config.type == SUBVP_MAIN) {
+			phantom = pipe->stream->mall_stream_config.paired_stream;
+			microschedule_lines = (phantom->timing.v_total - phantom->timing.v_front_porch) +
+					phantom->timing.v_addressable;
+
+			// Round up when calculating microschedule time
+			time_us = ((microschedule_lines * phantom->timing.h_total +
+					phantom->timing.pix_clk_100hz * 100 - 1) /
+					(double)(phantom->timing.pix_clk_100hz * 100)) * 1000000 +
+						dc->caps.subvp_prefetch_end_to_mall_start_us +
+						dc->caps.subvp_fw_processing_delay_us;
+			if (time_us > max_microschedule_us)
+				max_microschedule_us = time_us;
+
+			subvp_pipes[index] = pipe;
+			index++;
+
+			// Maximum 2 SubVP pipes
+			if (index == 2)
+				break;
+		}
+	}
+	vactive1_us = ((subvp_pipes[0]->stream->timing.v_addressable * subvp_pipes[0]->stream->timing.h_total) /
+			(double)(subvp_pipes[0]->stream->timing.pix_clk_100hz * 100)) * 1000000;
+	vactive2_us = ((subvp_pipes[1]->stream->timing.v_addressable * subvp_pipes[1]->stream->timing.h_total) /
+				(double)(subvp_pipes[1]->stream->timing.pix_clk_100hz * 100)) * 1000000;
+	vblank1_us = (((subvp_pipes[0]->stream->timing.v_total - subvp_pipes[0]->stream->timing.v_addressable) *
+			subvp_pipes[0]->stream->timing.h_total) /
+			(double)(subvp_pipes[0]->stream->timing.pix_clk_100hz * 100)) * 1000000;
+	vblank2_us = (((subvp_pipes[1]->stream->timing.v_total - subvp_pipes[1]->stream->timing.v_addressable) *
+			subvp_pipes[1]->stream->timing.h_total) /
+			(double)(subvp_pipes[1]->stream->timing.pix_clk_100hz * 100)) * 1000000;
+
+	if ((vactive1_us - vblank2_us) / 2 > max_microschedule_us &&
+			(vactive2_us - vblank1_us) / 2 > max_microschedule_us)
+		return true;
+
+	return false;
+}
+
+/**
+ * ***************************************************************************************
+ * subvp_drr_schedulable: Determine if SubVP + DRR config is schedulable
+ *
+ * High level algorithm:
+ * 1. Get timing for SubVP pipe, phantom pipe, and DRR pipe
+ * 2. Determine the frame time for the DRR display when adding required margin for MCLK switching
+ * (the margin is equal to the MALL region + DRR margin (500us))
+ * 3.If (SubVP Active - Prefetch > Stretched DRR frame + max(MALL region, Stretched DRR frame))
+ * then report the configuration as supported
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [in] drr_pipe: DRR pipe_ctx for the SubVP + DRR config
+ *
+ * @return: bool - True if the SubVP + DRR config is schedulable, false otherwise
+ *
+ * ***************************************************************************************
+ */
+static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struct pipe_ctx *drr_pipe)
+{
+	bool schedulable = false;
+	uint32_t i;
+	struct pipe_ctx *pipe = NULL;
+	struct dc_crtc_timing *main_timing = NULL;
+	struct dc_crtc_timing *phantom_timing = NULL;
+	struct dc_crtc_timing *drr_timing = NULL;
+	int16_t prefetch_us = 0;
+	int16_t mall_region_us = 0;
+	int16_t drr_frame_us = 0;	// nominal frame time
+	int16_t subvp_active_us = 0;
+	int16_t stretched_drr_us = 0;
+	int16_t drr_stretched_vblank_us = 0;
+	int16_t max_vblank_mallregion = 0;
+
+	// Find SubVP pipe
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+
+		// We check for master pipe, but it shouldn't matter since we only need
+		// the pipe for timing info (stream should be same for any pipe splits)
+		if (!pipe->stream || !pipe->plane_state || pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+
+		// Find the SubVP pipe
+		if (pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			break;
+	}
+
+	main_timing = &pipe->stream->timing;
+	phantom_timing = &pipe->stream->mall_stream_config.paired_stream->timing;
+	drr_timing = &drr_pipe->stream->timing;
+	prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
+			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
+			dc->caps.subvp_prefetch_end_to_mall_start_us;
+	subvp_active_us = main_timing->v_addressable * main_timing->h_total /
+			(double)(main_timing->pix_clk_100hz * 100) * 1000000;
+	drr_frame_us = drr_timing->v_total * drr_timing->h_total /
+			(double)(drr_timing->pix_clk_100hz * 100) * 1000000;
+	// P-State allow width and FW delays already included phantom_timing->v_addressable
+	mall_region_us = phantom_timing->v_addressable * phantom_timing->h_total /
+			(double)(phantom_timing->pix_clk_100hz * 100) * 1000000;
+	stretched_drr_us = drr_frame_us + mall_region_us + SUBVP_DRR_MARGIN_US;
+	drr_stretched_vblank_us = (drr_timing->v_total - drr_timing->v_addressable) * drr_timing->h_total /
+			(double)(drr_timing->pix_clk_100hz * 100) * 1000000 + (stretched_drr_us - drr_frame_us);
+	max_vblank_mallregion = drr_stretched_vblank_us > mall_region_us ? drr_stretched_vblank_us : mall_region_us;
+
+	/* We consider SubVP + DRR schedulable if the stretched frame duration of the DRR display (i.e. the
+	 * highest refresh rate + margin that can support UCLK P-State switch) passes the static analysis
+	 * for VBLANK: (VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
+	 * and the max of (VBLANK blanking time, MALL region)).
+	 */
+	if (stretched_drr_us < (1 / (double)drr_timing->min_refresh_in_uhz) * 1000000 * 1000000 &&
+			subvp_active_us - prefetch_us - stretched_drr_us - max_vblank_mallregion > 0)
+		schedulable = true;
+
+	return schedulable;
+}
+
+/**
+ * ***************************************************************************************
+ * subvp_vblank_schedulable: Determine if SubVP + VBLANK config is schedulable
+ *
+ * High level algorithm:
+ * 1. Get timing for SubVP pipe, phantom pipe, and VBLANK pipe
+ * 2. If (SubVP Active - Prefetch > Vblank Frame Time + max(MALL region, Vblank blanking time))
+ * then report the configuration as supported
+ * 3. If the VBLANK display is DRR, then take the DRR static schedulability path
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ *
+ * @return: bool - True if the SubVP + VBLANK/DRR config is schedulable, false otherwise
+ *
+ * ***************************************************************************************
+ */
+static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
+{
+	struct pipe_ctx *pipe = NULL;
+	struct pipe_ctx *subvp_pipe = NULL;
+	bool found = false;
+	bool schedulable = false;
+	uint32_t i = 0;
+	uint8_t vblank_index = 0;
+	int16_t prefetch_us = 0;
+	int16_t mall_region_us = 0;
+	int16_t vblank_frame_us = 0;
+	int16_t subvp_active_us = 0;
+	int16_t vblank_blank_us = 0;
+	int16_t max_vblank_mallregion = 0;
+	struct dc_crtc_timing *main_timing = NULL;
+	struct dc_crtc_timing *phantom_timing = NULL;
+	struct dc_crtc_timing *vblank_timing = NULL;
+
+	/* For SubVP + VBLANK/DRR cases, we assume there can only be
+	 * a single VBLANK/DRR display. If DML outputs SubVP + VBLANK
+	 * is supported, it is either a single VBLANK case or two VBLANK
+	 * displays which are synchronized (in which case they have identical
+	 * timings).
+	 */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		pipe = &context->res_ctx.pipe_ctx[i];
+
+		// We check for master pipe, but it shouldn't matter since we only need
+		// the pipe for timing info (stream should be same for any pipe splits)
+		if (!pipe->stream || !pipe->plane_state || pipe->top_pipe || pipe->prev_odm_pipe)
+			continue;
+
+		if (!found && pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+			// Found pipe which is not SubVP or Phantom (i.e. the VBLANK pipe).
+			vblank_index = i;
+			found = true;
+		}
+
+		if (!subvp_pipe && pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			subvp_pipe = pipe;
+	}
+	// Use ignore_msa_timing_param flag to identify as DRR
+	if (found && pipe->stream->ignore_msa_timing_param) {
+		// SUBVP + DRR case
+		schedulable = subvp_drr_schedulable(dc, context, &context->res_ctx.pipe_ctx[vblank_index]);
+	} else if (found) {
+		main_timing = &subvp_pipe->stream->timing;
+		phantom_timing = &subvp_pipe->stream->mall_stream_config.paired_stream->timing;
+		vblank_timing = &context->res_ctx.pipe_ctx[vblank_index].stream->timing;
+		// Prefetch time is equal to VACTIVE + BP + VSYNC of the phantom pipe
+		// Also include the prefetch end to mallstart delay time
+		prefetch_us = (phantom_timing->v_total - phantom_timing->v_front_porch) * phantom_timing->h_total /
+				(double)(phantom_timing->pix_clk_100hz * 100) * 1000000 +
+				dc->caps.subvp_prefetch_end_to_mall_start_us;
+		// P-State allow width and FW delays already included phantom_timing->v_addressable
+		mall_region_us = phantom_timing->v_addressable * phantom_timing->h_total /
+				(double)(phantom_timing->pix_clk_100hz * 100) * 1000000;
+		vblank_frame_us = vblank_timing->v_total * vblank_timing->h_total /
+				(double)(vblank_timing->pix_clk_100hz * 100) * 1000000;
+		vblank_blank_us =  (vblank_timing->v_total - vblank_timing->v_addressable) * vblank_timing->h_total /
+				(double)(vblank_timing->pix_clk_100hz * 100) * 1000000;
+		subvp_active_us = main_timing->v_addressable * main_timing->h_total /
+				(double)(main_timing->pix_clk_100hz * 100) * 1000000;
+		max_vblank_mallregion = vblank_blank_us > mall_region_us ? vblank_blank_us : mall_region_us;
+
+		// Schedulable if VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
+		// and the max of (VBLANK blanking time, MALL region)
+		// TODO: Possibly add some margin (i.e. the below conditions should be [...] > X instead of [...] > 0)
+		if (subvp_active_us - prefetch_us - vblank_frame_us - max_vblank_mallregion > 0)
+			schedulable = true;
+	}
+	return schedulable;
+}
+
+/**
+ * ********************************************************************************************
+ * subvp_validate_static_schedulability: Check which SubVP case is calculated and handle
+ * static analysis based on the case.
+ *
+ * Three cases:
+ * 1. SubVP + SubVP
+ * 2. SubVP + VBLANK (DRR checked internally)
+ * 3. SubVP + VACTIVE (currently unsupported)
+ *
+ * @param [in] dc: current dc state
+ * @param [in] context: new dc state
+ * @param [in] vlevel: Voltage level calculated by DML
+ *
+ * @return: bool - True if statically schedulable, false otherwise
+ *
+ * ********************************************************************************************
+ */
+static bool subvp_validate_static_schedulability(struct dc *dc,
+				struct dc_state *context,
+				int vlevel)
+{
+	bool schedulable = true;	// true by default for single display case
+	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
+	uint32_t i, pipe_idx;
+	uint8_t subvp_count = 0;
+	uint8_t vactive_count = 0;
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (!pipe->stream)
+			continue;
+
+		if (pipe->plane_state && !pipe->top_pipe &&
+				pipe->stream->mall_stream_config.type == SUBVP_MAIN)
+			subvp_count++;
+
+		// Count how many planes are capable of VACTIVE switching (SubVP + VACTIVE unsupported)
+		if (vba->ActiveDRAMClockChangeLatencyMargin[vba->pipe_plane[pipe_idx]] > 0) {
+			vactive_count++;
+		}
+		pipe_idx++;
+	}
+
+	if (subvp_count == 2) {
+		// Static schedulability check for SubVP + SubVP case
+		schedulable = subvp_subvp_schedulable(dc, context);
+	} else if (vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_vblank_w_mall_sub_vp) {
+		// Static schedulability check for SubVP + VBLANK case. Also handle the case where
+		// DML outputs SubVP + VBLANK + VACTIVE (DML will report as SubVP + VBLANK)
+		if (vactive_count > 0)
+			schedulable = false;
+		else
+			schedulable = subvp_vblank_schedulable(dc, context);
+	} else if (vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_vactive_w_mall_sub_vp) {
+		// SubVP + VACTIVE currently unsupported
+		schedulable = false;
+	}
+	return schedulable;
+}
+
+static void dcn32_full_validate_bw_helper(struct dc *dc,
+		struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int *vlevel,
+		int *split,
+		bool *merge,
+		int *pipe_cnt)
+{
+	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
+	unsigned int dc_pipe_idx = 0;
+	bool found_supported_config = false;
+	struct pipe_ctx *pipe = NULL;
+	uint32_t non_subvp_pipes = 0;
+	bool drr_pipe_found = false;
+	uint32_t drr_pipe_index = 0;
+	uint32_t i = 0;
+
+	/*
+	 * DML favors voltage over p-state, but we're more interested in
+	 * supporting p-state over voltage. We can't support p-state in
+	 * prefetch mode > 0 so try capping the prefetch mode to start.
+	 */
+	context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final =
+			dm_prefetch_support_uclk_fclk_and_stutter;
+	*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
+	/* This may adjust vlevel and maxMpcComb */
+	if (*vlevel < context->bw_ctx.dml.soc.num_states)
+		*vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
+
+	/* Conditions for setting up phantom pipes for SubVP:
+	 * 1. Not force disable SubVP
+	 * 2. Full update (i.e. !fast_validate)
+	 * 3. Enough pipes are available to support SubVP (TODO: Which pipes will use VACTIVE / VBLANK / SUBVP?)
+	 * 4. Display configuration passes validation
+	 * 5. (Config doesn't support MCLK in VACTIVE/VBLANK || dc->debug.force_subvp_mclk_switch)
+	 */
+	if (!dc->debug.force_disable_subvp &&
+			(*vlevel == context->bw_ctx.dml.soc.num_states ||
+			vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported ||
+			dc->debug.force_subvp_mclk_switch)) {
+
+		while (!found_supported_config && dcn32_enough_pipes_for_subvp(dc, context) &&
+				dcn32_assign_subvp_pipe(dc, context, &dc_pipe_idx)) {
+
+			dc->res_pool->funcs->add_phantom_pipes(dc, context, pipes, *pipe_cnt, dc_pipe_idx);
+
+			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
+			*vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, *pipe_cnt);
+
+			if (*vlevel < context->bw_ctx.dml.soc.num_states &&
+					vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] != dm_dram_clock_change_unsupported
+					&& subvp_validate_static_schedulability(dc, context, *vlevel)) {
+				found_supported_config = true;
+			} else if (*vlevel < context->bw_ctx.dml.soc.num_states &&
+					vba->DRAMClockChangeSupport[*vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported) {
+				/* Case where 1 SubVP is added, and DML reports MCLK unsupported. This handles
+				 * the case for SubVP + DRR, where the DRR display does not support MCLK switch
+				 * at it's native refresh rate / timing.
+				 */
+				for (i = 0; i < dc->res_pool->pipe_count; i++) {
+					pipe = &context->res_ctx.pipe_ctx[i];
+					if (pipe->stream && pipe->plane_state && !pipe->top_pipe &&
+							pipe->stream->mall_stream_config.type == SUBVP_NONE) {
+						non_subvp_pipes++;
+						// Use ignore_msa_timing_param flag to identify as DRR
+						if (pipe->stream->ignore_msa_timing_param) {
+							drr_pipe_found = true;
+							drr_pipe_index = i;
+						}
+					}
+				}
+				// If there is only 1 remaining non SubVP pipe that is DRR, check static
+				// schedulability for SubVP + DRR.
+				if (non_subvp_pipes == 1 && drr_pipe_found) {
+					found_supported_config = subvp_drr_schedulable(dc,
+							context, &context->res_ctx.pipe_ctx[drr_pipe_index]);
+				}
+			}
+		}
+
+		// If SubVP pipe config is unsupported (or cannot be used for UCLK switching)
+		// remove phantom pipes and repopulate dml pipes
+		if (!found_supported_config) {
+			dc->res_pool->funcs->remove_phantom_pipes(dc, context);
+			*pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, false);
+		} else {
+			// only call dcn20_validate_apply_pipe_split_flags if we found a supported config
+			memset(split, 0, MAX_PIPES * sizeof(int));
+			memset(merge, 0, MAX_PIPES * sizeof(bool));
+			*vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, *vlevel, split, merge);
+
+			// If found a supported SubVP config, phantom pipes were added to the context.
+			// Program timing for the phantom pipes.
+			dc->hwss.apply_ctx_to_hw(dc, context);
+		}
+	}
+}
+
+static bool dcn32_internal_validate_bw(
+		struct dc *dc,
+		struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int *pipe_cnt_out,
+		int *vlevel_out,
+		bool fast_validate)
+{
+	bool out = false;
+	bool repopulate_pipes = false;
+	int split[MAX_PIPES] = { 0 };
+	bool merge[MAX_PIPES] = { false };
+	bool newly_split[MAX_PIPES] = { false };
+	int pipe_cnt, i, pipe_idx, vlevel;
+	struct vba_vars_st *vba = &context->bw_ctx.dml.vba;
+
+	ASSERT(pipes);
+	if (!pipes)
+		return false;
+
+	// For each full update, remove all existing phantom pipes first
+	dc->res_pool->funcs->remove_phantom_pipes(dc, context);
+
+	dc->res_pool->funcs->update_soc_for_wm_a(dc, context);
+
+	pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+
+	if (!pipe_cnt) {
+		out = true;
+		goto validate_out;
+	}
+
+	dml_log_pipe_params(&context->bw_ctx.dml, pipes, pipe_cnt);
+
+	if (!fast_validate) {
+		dcn32_full_validate_bw_helper(dc, context, pipes, &vlevel, split, merge, &pipe_cnt);
+	}
+
+	if (fast_validate || vlevel == context->bw_ctx.dml.soc.num_states ||
+			vba->DRAMClockChangeSupport[vlevel][vba->maxMpcComb] == dm_dram_clock_change_unsupported) {
+		/*
+		 * If mode is unsupported or there's still no p-state support then
+		 * fall back to favoring voltage.
+		 *
+		 * We don't actually support prefetch mode 2, so require that we
+		 * at least support prefetch mode 1.
+		 */
+		context->bw_ctx.dml.soc.allow_for_pstate_or_stutter_in_vblank_final =
+				dm_prefetch_support_stutter;
+
+		vlevel = dml_get_voltage_level(&context->bw_ctx.dml, pipes, pipe_cnt);
+		if (vlevel < context->bw_ctx.dml.soc.num_states) {
+			memset(split, 0, MAX_PIPES * sizeof(int));
+			memset(merge, 0, MAX_PIPES * sizeof(bool));
+			vlevel = dcn20_validate_apply_pipe_split_flags(dc, context, vlevel, split, merge);
+		}
+	}
+
+	dml_log_mode_support_params(&context->bw_ctx.dml);
+
+	if (vlevel == context->bw_ctx.dml.soc.num_states)
+		goto validate_fail;
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		struct pipe_ctx *mpo_pipe = pipe->bottom_pipe;
+
+		if (!pipe->stream)
+			continue;
+
+		/* We only support full screen mpo with ODM */
+		if (vba->ODMCombineEnabled[vba->pipe_plane[pipe_idx]] != dm_odm_combine_mode_disabled
+				&& pipe->plane_state && mpo_pipe
+				&& memcmp(&mpo_pipe->plane_res.scl_data.recout,
+						&pipe->plane_res.scl_data.recout,
+						sizeof(struct rect)) != 0) {
+			ASSERT(mpo_pipe->plane_state != pipe->plane_state);
+			goto validate_fail;
+		}
+		pipe_idx++;
+	}
+
+	/* merge pipes if necessary */
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		/*skip pipes that don't need merging*/
+		if (!merge[i])
+			continue;
+
+		/* if ODM merge we ignore mpc tree, mpo pipes will have their own flags */
+		if (pipe->prev_odm_pipe) {
+			/*split off odm pipe*/
+			pipe->prev_odm_pipe->next_odm_pipe = pipe->next_odm_pipe;
+			if (pipe->next_odm_pipe)
+				pipe->next_odm_pipe->prev_odm_pipe = pipe->prev_odm_pipe;
+
+			pipe->bottom_pipe = NULL;
+			pipe->next_odm_pipe = NULL;
+			pipe->plane_state = NULL;
+			pipe->stream = NULL;
+			pipe->top_pipe = NULL;
+			pipe->prev_odm_pipe = NULL;
+			if (pipe->stream_res.dsc)
+				dcn20_release_dsc(&context->res_ctx, dc->res_pool, &pipe->stream_res.dsc);
+			memset(&pipe->plane_res, 0, sizeof(pipe->plane_res));
+			memset(&pipe->stream_res, 0, sizeof(pipe->stream_res));
+			repopulate_pipes = true;
+		} else if (pipe->top_pipe && pipe->top_pipe->plane_state == pipe->plane_state) {
+			struct pipe_ctx *top_pipe = pipe->top_pipe;
+			struct pipe_ctx *bottom_pipe = pipe->bottom_pipe;
+
+			top_pipe->bottom_pipe = bottom_pipe;
+			if (bottom_pipe)
+				bottom_pipe->top_pipe = top_pipe;
+
+			pipe->top_pipe = NULL;
+			pipe->bottom_pipe = NULL;
+			pipe->plane_state = NULL;
+			pipe->stream = NULL;
+			memset(&pipe->plane_res, 0, sizeof(pipe->plane_res));
+			memset(&pipe->stream_res, 0, sizeof(pipe->stream_res));
+			repopulate_pipes = true;
+		} else
+			ASSERT(0); /* Should never try to merge master pipe */
+
+	}
+
+	for (i = 0, pipe_idx = -1; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+		struct pipe_ctx *old_pipe = &dc->current_state->res_ctx.pipe_ctx[i];
+		struct pipe_ctx *hsplit_pipe = NULL;
+		bool odm;
+		int old_index = -1;
+
+		if (!pipe->stream || newly_split[i])
+			continue;
+
+		pipe_idx++;
+		odm = vba->ODMCombineEnabled[vba->pipe_plane[pipe_idx]] != dm_odm_combine_mode_disabled;
+
+		if (!pipe->plane_state && !odm)
+			continue;
+
+		if (split[i]) {
+			if (odm) {
+				if (split[i] == 4 && old_pipe->next_odm_pipe && old_pipe->next_odm_pipe->next_odm_pipe)
+					old_index = old_pipe->next_odm_pipe->next_odm_pipe->pipe_idx;
+				else if (old_pipe->next_odm_pipe)
+					old_index = old_pipe->next_odm_pipe->pipe_idx;
+			} else {
+				if (split[i] == 4 && old_pipe->bottom_pipe && old_pipe->bottom_pipe->bottom_pipe &&
+						old_pipe->bottom_pipe->bottom_pipe->plane_state == old_pipe->plane_state)
+					old_index = old_pipe->bottom_pipe->bottom_pipe->pipe_idx;
+				else if (old_pipe->bottom_pipe &&
+						old_pipe->bottom_pipe->plane_state == old_pipe->plane_state)
+					old_index = old_pipe->bottom_pipe->pipe_idx;
+			}
+			hsplit_pipe = dcn32_find_split_pipe(dc, context, old_index);
+			ASSERT(hsplit_pipe);
+			if (!hsplit_pipe)
+				goto validate_fail;
+
+			if (!dcn32_split_stream_for_mpc_or_odm(
+					dc, &context->res_ctx,
+					pipe, hsplit_pipe, odm))
+				goto validate_fail;
+
+			newly_split[hsplit_pipe->pipe_idx] = true;
+			repopulate_pipes = true;
+		}
+		if (split[i] == 4) {
+			struct pipe_ctx *pipe_4to1;
+
+			if (odm && old_pipe->next_odm_pipe)
+				old_index = old_pipe->next_odm_pipe->pipe_idx;
+			else if (!odm && old_pipe->bottom_pipe &&
+						old_pipe->bottom_pipe->plane_state == old_pipe->plane_state)
+				old_index = old_pipe->bottom_pipe->pipe_idx;
+			else
+				old_index = -1;
+			pipe_4to1 = dcn32_find_split_pipe(dc, context, old_index);
+			ASSERT(pipe_4to1);
+			if (!pipe_4to1)
+				goto validate_fail;
+			if (!dcn32_split_stream_for_mpc_or_odm(
+					dc, &context->res_ctx,
+					pipe, pipe_4to1, odm))
+				goto validate_fail;
+			newly_split[pipe_4to1->pipe_idx] = true;
+
+			if (odm && old_pipe->next_odm_pipe && old_pipe->next_odm_pipe->next_odm_pipe
+					&& old_pipe->next_odm_pipe->next_odm_pipe->next_odm_pipe)
+				old_index = old_pipe->next_odm_pipe->next_odm_pipe->next_odm_pipe->pipe_idx;
+			else if (!odm && old_pipe->bottom_pipe && old_pipe->bottom_pipe->bottom_pipe &&
+					old_pipe->bottom_pipe->bottom_pipe->bottom_pipe &&
+					old_pipe->bottom_pipe->bottom_pipe->bottom_pipe->plane_state == old_pipe->plane_state)
+				old_index = old_pipe->bottom_pipe->bottom_pipe->bottom_pipe->pipe_idx;
+			else
+				old_index = -1;
+			pipe_4to1 = dcn32_find_split_pipe(dc, context, old_index);
+			ASSERT(pipe_4to1);
+			if (!pipe_4to1)
+				goto validate_fail;
+			if (!dcn32_split_stream_for_mpc_or_odm(
+					dc, &context->res_ctx,
+					hsplit_pipe, pipe_4to1, odm))
+				goto validate_fail;
+			newly_split[pipe_4to1->pipe_idx] = true;
+		}
+		if (odm)
+			dcn20_build_mapped_resource(dc, context, pipe->stream);
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (pipe->plane_state) {
+			if (!resource_build_scaling_params(pipe))
+				goto validate_fail;
+		}
+	}
+
+	/* Actual dsc count per stream dsc validation*/
+	if (!dcn20_validate_dsc(dc, context)) {
+		vba->ValidationStatus[vba->soc.num_states] = DML_FAIL_DSC_VALIDATION_FAILURE;
+		goto validate_fail;
+	}
+
+	if (repopulate_pipes)
+		pipe_cnt = dc->res_pool->funcs->populate_dml_pipes(dc, context, pipes, fast_validate);
+	*vlevel_out = vlevel;
+	*pipe_cnt_out = pipe_cnt;
+
+	out = true;
+	goto validate_out;
+
+validate_fail:
+	out = false;
+
+validate_out:
+	return out;
+}
+
+bool dcn32_validate_bandwidth(struct dc *dc,
+		struct dc_state *context,
+		bool fast_validate)
+{
+	bool out = false;
+
+	BW_VAL_TRACE_SETUP();
+
+	int vlevel = 0;
+	int pipe_cnt = 0;
+	display_e2e_pipe_params_st *pipes = kzalloc(dc->res_pool->pipe_count * sizeof(display_e2e_pipe_params_st), GFP_KERNEL);
+	DC_LOGGER_INIT(dc->ctx->logger);
+
+	BW_VAL_TRACE_COUNT();
+
+    DC_FP_START();
+	out = dcn32_internal_validate_bw(dc, context, pipes, &pipe_cnt, &vlevel, fast_validate);
+    DC_FP_END();
+
+	if (pipe_cnt == 0)
+		goto validate_out;
+
+	if (!out)
+		goto validate_fail;
+
+	BW_VAL_TRACE_END_VOLTAGE_LEVEL();
+
+	if (fast_validate) {
+		BW_VAL_TRACE_SKIP(fast);
+		goto validate_out;
+	}
+
+	dc->res_pool->funcs->calculate_wm_and_dlg(dc, context, pipes, pipe_cnt, vlevel);
+
+	BW_VAL_TRACE_END_WATERMARKS();
+
+	goto validate_out;
+
+validate_fail:
+	DC_LOG_WARNING("Mode Validation Warning: %s failed validation.\n",
+		dml_get_status_message(context->bw_ctx.dml.vba.ValidationStatus[context->bw_ctx.dml.vba.soc.num_states]));
+
+	BW_VAL_TRACE_SKIP(fail);
+	out = false;
+
+validate_out:
+	kfree(pipes);
+
+	BW_VAL_TRACE_FINISH();
+
+	return out;
+}
+
+
+static bool is_dual_plane(enum surface_pixel_format format)
+{
+	return format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN || format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA;
+}
+
+int dcn32_populate_dml_pipes_from_context(
+	struct dc *dc, struct dc_state *context,
+	display_e2e_pipe_params_st *pipes,
+	bool fast_validate)
+{
+	int i, pipe_cnt;
+	struct resource_context *res_ctx = &context->res_ctx;
+	struct pipe_ctx *pipe;
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
+		pipes[pipe_cnt].pipe.src.gpuvm = true;
+		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_luma = 0;
+		pipes[pipe_cnt].pipe.src.dcc_fraction_of_zs_req_chroma = 0;
+		pipes[pipe_cnt].pipe.dest.vfront_porch = timing->v_front_porch;
+		pipes[pipe_cnt].pipe.src.gpuvm_min_page_size_kbytes = 256; // according to spreadsheet
+		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
+		pipes[pipe_cnt].pipe.scale_ratio_depth.lb_depth = dm_lb_19;
+
+		switch (pipe->stream->mall_stream_config.type) {
+		case SUBVP_MAIN:
+			pipes[pipe_cnt].pipe.src.use_mall_for_pstate_change = dm_use_mall_pstate_change_sub_viewport;
+			break;
+		case SUBVP_PHANTOM:
+			pipes[pipe_cnt].pipe.src.use_mall_for_pstate_change = dm_use_mall_pstate_change_phantom_pipe;
+			pipes[pipe_cnt].pipe.src.use_mall_for_static_screen = dm_use_mall_static_screen_enable;
+			break;
+		case SUBVP_NONE:
+			pipes[pipe_cnt].pipe.src.use_mall_for_pstate_change = dm_use_mall_pstate_change_disable;
+			pipes[pipe_cnt].pipe.src.use_mall_for_static_screen = dm_use_mall_static_screen_disable;
+			break;
+		default:
+			break;
+		}
+
+		pipes[pipe_cnt].dout.dsc_input_bpc = 0;
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
+		pipe_cnt++;
+	}
+	context->bw_ctx.dml.ip.det_buffer_size_kbytes = DCN3_2_DEFAULT_DET_SIZE;
+
+	if (pipe_cnt == 1 && pipe->plane_state && !dc->debug.disable_z9_mpc) {
+		if (!is_dual_plane(pipe->plane_state->format)) {
+			context->bw_ctx.dml.ip.det_buffer_size_kbytes = 192;
+			pipes[0].pipe.src.unbounded_req_mode = true;
+		}
+	}
+
+	return pipe_cnt;
+}
+
+void dcn32_calculate_wm_and_dlg_fp(
+		struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt,
+		int vlevel)
+{
+	int i, pipe_idx, vlevel_temp = 0;
+
+	double dcfclk = dcn3_2_soc.clock_limits[0].dcfclk_mhz;
+	double dcfclk_from_validation = context->bw_ctx.dml.vba.DCFCLKState[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
+	unsigned int min_dram_speed_mts = context->bw_ctx.dml.vba.DRAMSpeed;
+	bool pstate_en = context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb] !=
+			dm_dram_clock_change_unsupported;
+
+	/* Set B:
+	 * For Set B calculations use clocks from clock_limits[2] when available i.e. when SMU is present,
+	 * otherwise use arbitrary low value from spreadsheet for DCFCLK as lower is safer for watermark
+	 * calculations to cover bootup clocks.
+	 * DCFCLK: soc.clock_limits[2] when available
+	 * UCLK: soc.clock_limits[2] when available
+	 */
+	if (dcn3_2_soc.num_states > 2) {
+		vlevel_temp = 2;
+		dcfclk = dcn3_2_soc.clock_limits[2].dcfclk_mhz;
+	} else
+		dcfclk = 615; //DCFCLK Vmin_lv
+
+	pipes[0].clks_cfg.voltage = vlevel_temp;
+	pipes[0].clks_cfg.dcfclk_mhz = dcfclk;
+	pipes[0].clks_cfg.socclk_mhz = context->bw_ctx.dml.soc.clock_limits[vlevel_temp].socclk_mhz;
+
+	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].valid) {
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.pstate_latency_us;
+		context->bw_ctx.dml.soc.fclk_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.fclk_change_latency_us;
+		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_enter_plus_exit_time_us;
+		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_B].dml_input.sr_exit_time_us;
+	}
+	context->bw_ctx.bw.dcn.watermarks.b.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.cstate_pstate.fclk_pstate_change_ns = get_fclk_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.b.usr_retraining_ns = get_usr_retraining_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+
+	/* Set D:
+	 * All clocks min.
+	 * DCFCLK: Min, as reported by PM FW when available
+	 * UCLK  : Min, as reported by PM FW when available
+	 * sr_enter_exit/sr_exit should be lower than used for DRAM (TBD after bringup or later, use as decided in Clk Mgr)
+	 */
+
+	if (dcn3_2_soc.num_states > 2) {
+		vlevel_temp = 0;
+		dcfclk = dc->clk_mgr->bw_params->clk_table.entries[0].dcfclk_mhz;
+	} else
+		dcfclk = 615; //DCFCLK Vmin_lv
+
+	pipes[0].clks_cfg.voltage = vlevel_temp;
+	pipes[0].clks_cfg.dcfclk_mhz = dcfclk;
+	pipes[0].clks_cfg.socclk_mhz = context->bw_ctx.dml.soc.clock_limits[vlevel_temp].socclk_mhz;
+
+	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].valid) {
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.pstate_latency_us;
+		context->bw_ctx.dml.soc.fclk_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.fclk_change_latency_us;
+		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_enter_plus_exit_time_us;
+		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_D].dml_input.sr_exit_time_us;
+	}
+	context->bw_ctx.bw.dcn.watermarks.d.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.cstate_pstate.fclk_pstate_change_ns = get_fclk_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.d.usr_retraining_ns = get_usr_retraining_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+
+	/* Set C, for Dummy P-State:
+	 * All clocks min.
+	 * DCFCLK: Min, as reported by PM FW, when available
+	 * UCLK  : Min,  as reported by PM FW, when available
+	 * pstate latency as per UCLK state dummy pstate latency
+	 */
+
+	if (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].valid) {
+		unsigned int min_dram_speed_mts_margin = 160;
+
+		if ((!pstate_en))
+			min_dram_speed_mts = dc->clk_mgr->bw_params->clk_table.entries[dc->clk_mgr->bw_params->clk_table.num_entries - 1].memclk_mhz * 16;
+
+		/* find largest table entry that is lower than dram speed, but lower than DPM0 still uses DPM0 */
+		for (i = 3; i > 0; i--)
+			if (min_dram_speed_mts + min_dram_speed_mts_margin > dc->clk_mgr->bw_params->dummy_pstate_table[i].dram_speed_mts)
+				break;
+
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->dummy_pstate_table[i].dummy_pstate_latency_us;
+		context->bw_ctx.dml.soc.dummy_pstate_latency_us = dc->clk_mgr->bw_params->dummy_pstate_table[i].dummy_pstate_latency_us;
+		context->bw_ctx.dml.soc.fclk_change_latency_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].dml_input.fclk_change_latency_us;
+		context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_enter_plus_exit_time_us;
+		context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].dml_input.sr_exit_time_us;
+	}
+	context->bw_ctx.bw.dcn.watermarks.c.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.cstate_pstate.fclk_pstate_change_ns = get_fclk_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	context->bw_ctx.bw.dcn.watermarks.c.usr_retraining_ns = get_usr_retraining_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+
+	if ((!pstate_en) && (dc->clk_mgr->bw_params->wm_table.nv_entries[WM_C].valid)) {
+		/* The only difference between A and C is p-state latency, if p-state is not supported
+		 * with full p-state latency we want to calculate DLG based on dummy p-state latency,
+		 * Set A p-state watermark set to 0 on DCN32, when p-state unsupported, for now keep as DCN32.
+		 */
+		context->bw_ctx.bw.dcn.watermarks.a = context->bw_ctx.bw.dcn.watermarks.c;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = 0;
+	} else {
+		/* Set A:
+		 * All clocks min.
+		 * DCFCLK: Min, as reported by PM FW, when available
+		 * UCLK: Min, as reported by PM FW, when available
+		 */
+		dc->res_pool->funcs->update_soc_for_wm_a(dc, context);
+		context->bw_ctx.bw.dcn.watermarks.a.urgent_ns = get_wm_urgent(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_enter_plus_exit_ns = get_wm_stutter_enter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.cstate_exit_ns = get_wm_stutter_exit(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns = get_wm_dram_clock_change(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.pte_meta_urgent_ns = get_wm_memory_trip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_nom = get_fraction_of_urgent_bandwidth(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.frac_urg_bw_flip = get_fraction_of_urgent_bandwidth_imm_flip(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.urgent_latency_ns = get_urgent_latency(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.fclk_pstate_change_ns = get_fclk_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+		context->bw_ctx.bw.dcn.watermarks.a.usr_retraining_ns = get_usr_retraining_watermark(&context->bw_ctx.dml, pipes, pipe_cnt) * 1000;
+	}
+
+	pipes[0].clks_cfg.voltage = vlevel;
+	pipes[0].clks_cfg.dcfclk_mhz = dcfclk_from_validation;
+	pipes[0].clks_cfg.socclk_mhz = context->bw_ctx.dml.soc.clock_limits[vlevel].socclk_mhz;
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		if (!context->res_ctx.pipe_ctx[i].stream)
+			continue;
+
+		pipes[pipe_idx].clks_cfg.dispclk_mhz = get_dispclk_calculated(&context->bw_ctx.dml, pipes, pipe_cnt);
+		pipes[pipe_idx].clks_cfg.dppclk_mhz = get_dppclk_calculated(&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
+
+		if (dc->config.forced_clocks) {
+			pipes[pipe_idx].clks_cfg.dispclk_mhz = context->bw_ctx.dml.soc.clock_limits[0].dispclk_mhz;
+			pipes[pipe_idx].clks_cfg.dppclk_mhz = context->bw_ctx.dml.soc.clock_limits[0].dppclk_mhz;
+		}
+		if (dc->debug.min_disp_clk_khz > pipes[pipe_idx].clks_cfg.dispclk_mhz * 1000)
+			pipes[pipe_idx].clks_cfg.dispclk_mhz = dc->debug.min_disp_clk_khz / 1000.0;
+		if (dc->debug.min_dpp_clk_khz > pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000)
+			pipes[pipe_idx].clks_cfg.dppclk_mhz = dc->debug.min_dpp_clk_khz / 1000.0;
+
+		pipe_idx++;
+	}
+
+	context->perf_params.stutter_period_us = context->bw_ctx.dml.vba.StutterPeriod;
+
+	dcn32_calculate_dlg_params(dc, context, pipes, pipe_cnt, vlevel);
+
+	if (!pstate_en)
+		/* Restore full p-state latency */
+		context->bw_ctx.dml.soc.dram_clock_change_latency_us =
+				dc->clk_mgr->bw_params->wm_table.nv_entries[WM_A].dml_input.pstate_latency_us;
+}
+
+static struct dc_cap_funcs cap_funcs = {
+	.get_dcc_compression_cap = dcn20_get_dcc_compression_cap
+};
+
+
+static void dcn32_get_optimal_dcfclk_fclk_for_uclk(unsigned int uclk_mts,
+		unsigned int *optimal_dcfclk,
+		unsigned int *optimal_fclk)
+{
+	double bw_from_dram, bw_from_dram1, bw_from_dram2;
+
+	bw_from_dram1 = uclk_mts * dcn3_2_soc.num_chans *
+		dcn3_2_soc.dram_channel_width_bytes * (dcn3_2_soc.max_avg_dram_bw_use_normal_percent / 100);
+	bw_from_dram2 = uclk_mts * dcn3_2_soc.num_chans *
+		dcn3_2_soc.dram_channel_width_bytes * (dcn3_2_soc.max_avg_sdp_bw_use_normal_percent / 100);
+
+	bw_from_dram = (bw_from_dram1 < bw_from_dram2) ? bw_from_dram1 : bw_from_dram2;
+
+	if (optimal_fclk)
+		*optimal_fclk = bw_from_dram /
+		(dcn3_2_soc.fabric_datapath_to_dcn_data_return_bytes * (dcn3_2_soc.max_avg_sdp_bw_use_normal_percent / 100));
+
+	if (optimal_dcfclk)
+		*optimal_dcfclk =  bw_from_dram /
+		(dcn3_2_soc.return_bus_width_bytes * (dcn3_2_soc.max_avg_sdp_bw_use_normal_percent / 100));
+}
+
+void dcn32_calculate_wm_and_dlg(
+		struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt,
+		int vlevel)
+{
+    DC_FP_START();
+    dcn32_calculate_wm_and_dlg_fp(
+		dc, context,
+		pipes,
+		pipe_cnt,
+		vlevel);
+    DC_FP_END();
+}
+
+static bool is_dtbclk_required(struct dc *dc, struct dc_state *context)
+{
+	int i;
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		if (!context->res_ctx.pipe_ctx[i].stream)
+			continue;
+		if (is_dp_128b_132b_signal(&context->res_ctx.pipe_ctx[i]))
+			return true;
+	}
+	return false;
+}
+
+void dcn32_calculate_dlg_params(struct dc *dc, struct dc_state *context, display_e2e_pipe_params_st *pipes,
+		int pipe_cnt, int vlevel)
+{
+	int i, pipe_idx;
+	bool usr_retraining_support = false;
+
+	/* Writeback MCIF_WB arbitration parameters */
+	dc->res_pool->funcs->set_mcif_arb_params(dc, context, pipes, pipe_cnt);
+
+	context->bw_ctx.bw.dcn.clk.dispclk_khz = context->bw_ctx.dml.vba.DISPCLK * 1000;
+	context->bw_ctx.bw.dcn.clk.dcfclk_khz = context->bw_ctx.dml.vba.DCFCLK * 1000;
+	context->bw_ctx.bw.dcn.clk.socclk_khz = context->bw_ctx.dml.vba.SOCCLK * 1000;
+	context->bw_ctx.bw.dcn.clk.dramclk_khz = context->bw_ctx.dml.vba.DRAMSpeed * 1000 / 16;
+	context->bw_ctx.bw.dcn.clk.dcfclk_deep_sleep_khz = context->bw_ctx.dml.vba.DCFCLKDeepSleep * 1000;
+	context->bw_ctx.bw.dcn.clk.fclk_khz = context->bw_ctx.dml.vba.FabricClock * 1000;
+	context->bw_ctx.bw.dcn.clk.p_state_change_support =
+			context->bw_ctx.dml.vba.DRAMClockChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb]
+					!= dm_dram_clock_change_unsupported;
+
+	/*
+	 * TODO: needs FAMS
+	 * Pstate change might not be supported by hardware, but it might be
+	 * possible with firmware driven vertical blank stretching.
+	 */
+	// context->bw_ctx.bw.dcn.clk.p_state_change_support |= context->bw_ctx.bw.dcn.clk.fw_based_mclk_switching;
+
+	context->bw_ctx.bw.dcn.clk.dppclk_khz = 0;
+	context->bw_ctx.bw.dcn.clk.dtbclk_en = is_dtbclk_required(dc, context);
+	if (context->bw_ctx.dml.vba.FCLKChangeSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb] == dm_fclock_change_unsupported)
+		context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support = false;
+	else
+		context->bw_ctx.bw.dcn.clk.fclk_p_state_change_support = true;
+
+	usr_retraining_support = context->bw_ctx.dml.vba.USRRetrainingSupport[vlevel][context->bw_ctx.dml.vba.maxMpcComb];
+	ASSERT(usr_retraining_support);
+
+	if (context->bw_ctx.bw.dcn.clk.dispclk_khz < dc->debug.min_disp_clk_khz)
+		context->bw_ctx.bw.dcn.clk.dispclk_khz = dc->debug.min_disp_clk_khz;
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+		if (!context->res_ctx.pipe_ctx[i].stream)
+			continue;
+		pipes[pipe_idx].pipe.dest.vstartup_start = get_vstartup(&context->bw_ctx.dml, pipes, pipe_cnt,
+				pipe_idx);
+		pipes[pipe_idx].pipe.dest.vupdate_offset = get_vupdate_offset(&context->bw_ctx.dml, pipes, pipe_cnt,
+				pipe_idx);
+		pipes[pipe_idx].pipe.dest.vupdate_width = get_vupdate_width(&context->bw_ctx.dml, pipes, pipe_cnt,
+				pipe_idx);
+		pipes[pipe_idx].pipe.dest.vready_offset = get_vready_offset(&context->bw_ctx.dml, pipes, pipe_cnt,
+				pipe_idx);
+		if (context->res_ctx.pipe_ctx[i].stream->mall_stream_config.type == SUBVP_PHANTOM) {
+			// Phantom pipe requires that DET_SIZE = 0 and no unbounded requests
+			context->res_ctx.pipe_ctx[i].det_buffer_size_kb = 0;
+			context->res_ctx.pipe_ctx[i].unbounded_req = false;
+		} else {
+			context->res_ctx.pipe_ctx[i].det_buffer_size_kb =
+					context->bw_ctx.dml.ip.det_buffer_size_kbytes;
+			context->res_ctx.pipe_ctx[i].unbounded_req = pipes[pipe_idx].pipe.src.unbounded_req_mode;
+		}
+		if (context->bw_ctx.bw.dcn.clk.dppclk_khz < pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000)
+			context->bw_ctx.bw.dcn.clk.dppclk_khz = pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
+		context->res_ctx.pipe_ctx[i].plane_res.bw.dppclk_khz = pipes[pipe_idx].clks_cfg.dppclk_mhz * 1000;
+		context->res_ctx.pipe_ctx[i].pipe_dlg_param = pipes[pipe_idx].pipe.dest;
+		pipe_idx++;
+	}
+	/*save a original dppclock copy*/
+	context->bw_ctx.bw.dcn.clk.bw_dppclk_khz = context->bw_ctx.bw.dcn.clk.dppclk_khz;
+	context->bw_ctx.bw.dcn.clk.bw_dispclk_khz = context->bw_ctx.bw.dcn.clk.dispclk_khz;
+	context->bw_ctx.bw.dcn.clk.max_supported_dppclk_khz = context->bw_ctx.dml.soc.clock_limits[vlevel].dppclk_mhz
+			* 1000;
+	context->bw_ctx.bw.dcn.clk.max_supported_dispclk_khz = context->bw_ctx.dml.soc.clock_limits[vlevel].dispclk_mhz
+			* 1000;
+
+	context->bw_ctx.bw.dcn.compbuf_size_kb = context->bw_ctx.dml.ip.config_return_buffer_size_in_kbytes
+			- context->bw_ctx.dml.ip.det_buffer_size_kbytes * pipe_idx;
+
+	for (i = 0, pipe_idx = 0; i < dc->res_pool->pipe_count; i++) {
+
+		if (!context->res_ctx.pipe_ctx[i].stream)
+			continue;
+
+		/* cstate disabled on 201 */
+//		if (dc->ctx->dce_version == DCN_VERSION_2_01)
+//			cstate_en = false;
+
+
+		context->bw_ctx.dml.funcs.rq_dlg_get_dlg_reg_v2(&context->bw_ctx.dml,
+				&context->res_ctx.pipe_ctx[i].dlg_regs, &context->res_ctx.pipe_ctx[i].ttu_regs, pipes,
+				pipe_cnt, pipe_idx);
+
+		context->bw_ctx.dml.funcs.rq_dlg_get_rq_reg_v2(&context->res_ctx.pipe_ctx[i].rq_regs,
+				&context->bw_ctx.dml, pipes, pipe_cnt, pipe_idx);
+
+		pipe_idx++;
+	}
+}
+
+/* dcn32_update_bw_bounding_box
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
+static void dcn32_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
+{
+	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+
+		/* Overrides from dc->config options */
+		dcn3_2_ip.clamp_min_dcfclk = dc->config.clamp_min_dcfclk;
+
+		/* Override from passed dc->bb_overrides if available*/
+		if ((int)(dcn3_2_soc.sr_exit_time_us * 1000) != dc->bb_overrides.sr_exit_time_ns
+				&& dc->bb_overrides.sr_exit_time_ns) {
+			dcn3_2_soc.sr_exit_time_us = dc->bb_overrides.sr_exit_time_ns / 1000.0;
+		}
+
+		if ((int)(dcn3_2_soc.sr_enter_plus_exit_time_us * 1000)
+				!= dc->bb_overrides.sr_enter_plus_exit_time_ns
+				&& dc->bb_overrides.sr_enter_plus_exit_time_ns) {
+			dcn3_2_soc.sr_enter_plus_exit_time_us =
+				dc->bb_overrides.sr_enter_plus_exit_time_ns / 1000.0;
+		}
+
+		if ((int)(dcn3_2_soc.urgent_latency_us * 1000) != dc->bb_overrides.urgent_latency_ns
+			&& dc->bb_overrides.urgent_latency_ns) {
+			dcn3_2_soc.urgent_latency_us = dc->bb_overrides.urgent_latency_ns / 1000.0;
+		}
+
+		if ((int)(dcn3_2_soc.dram_clock_change_latency_us * 1000)
+				!= dc->bb_overrides.dram_clock_change_latency_ns
+				&& dc->bb_overrides.dram_clock_change_latency_ns) {
+			dcn3_2_soc.dram_clock_change_latency_us =
+				dc->bb_overrides.dram_clock_change_latency_ns / 1000.0;
+		}
+
+		if ((int)(dcn3_2_soc.dummy_pstate_latency_us * 1000)
+				!= dc->bb_overrides.dummy_clock_change_latency_ns
+				&& dc->bb_overrides.dummy_clock_change_latency_ns) {
+			dcn3_2_soc.dummy_pstate_latency_us =
+				dc->bb_overrides.dummy_clock_change_latency_ns / 1000.0;
+		}
+
+		/* Override from VBIOS if VBIOS bb_info available */
+		if (dc->ctx->dc_bios->funcs->get_soc_bb_info) {
+			struct bp_soc_bb_info bb_info = {0};
+
+			if (dc->ctx->dc_bios->funcs->get_soc_bb_info(dc->ctx->dc_bios, &bb_info) == BP_RESULT_OK) {
+				if (bb_info.dram_clock_change_latency_100ns > 0)
+					dcn3_2_soc.dram_clock_change_latency_us = bb_info.dram_clock_change_latency_100ns * 10;
+
+			if (bb_info.dram_sr_enter_exit_latency_100ns > 0)
+				dcn3_2_soc.sr_enter_plus_exit_time_us = bb_info.dram_sr_enter_exit_latency_100ns * 10;
+
+			if (bb_info.dram_sr_exit_latency_100ns > 0)
+				dcn3_2_soc.sr_exit_time_us = bb_info.dram_sr_exit_latency_100ns * 10;
+			}
+		}
+
+		/* Override from VBIOS for num_chan */
+		if (dc->ctx->dc_bios->vram_info.num_chans)
+			dcn3_2_soc.num_chans = dc->ctx->dc_bios->vram_info.num_chans;
+
+		if (dc->ctx->dc_bios->vram_info.dram_channel_width_bytes)
+			dcn3_2_soc.dram_channel_width_bytes = dc->ctx->dc_bios->vram_info.dram_channel_width_bytes;
+
+	}
+
+	/* Override dispclk_dppclk_vco_speed_mhz from Clk Mgr */
+	dcn3_2_soc.dispclk_dppclk_vco_speed_mhz = dc->clk_mgr->dentist_vco_freq_khz / 1000.0;
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
+			max_dcfclk_mhz = dcn3_2_soc.clock_limits[0].dcfclk_mhz;
+		if (!max_dispclk_mhz)
+			max_dispclk_mhz = dcn3_2_soc.clock_limits[0].dispclk_mhz;
+		if (!max_dppclk_mhz)
+			max_dppclk_mhz = dcn3_2_soc.clock_limits[0].dppclk_mhz;
+		if (!max_phyclk_mhz)
+			max_phyclk_mhz = dcn3_2_soc.clock_limits[0].phyclk_mhz;
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
+			dcn32_get_optimal_dcfclk_fclk_for_uclk(bw_params->clk_table.entries[i].memclk_mhz * 16,
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
+		dcn3_2_soc.num_states = num_states;
+		for (i = 0; i < dcn3_2_soc.num_states; i++) {
+			dcn3_2_soc.clock_limits[i].state = i;
+			dcn3_2_soc.clock_limits[i].dcfclk_mhz = dcfclk_mhz[i];
+			dcn3_2_soc.clock_limits[i].fabricclk_mhz = dcfclk_mhz[i];
+			dcn3_2_soc.clock_limits[i].dram_speed_mts = dram_speed_mts[i];
+
+			/* Fill all states with max values of all these clocks */
+			dcn3_2_soc.clock_limits[i].dispclk_mhz = max_dispclk_mhz;
+			dcn3_2_soc.clock_limits[i].dppclk_mhz  = max_dppclk_mhz;
+			dcn3_2_soc.clock_limits[i].phyclk_mhz  = max_phyclk_mhz;
+			dcn3_2_soc.clock_limits[i].dscclk_mhz  = max_dispclk_mhz / 3;
+
+			/* Populate from bw_params for DTBCLK, SOCCLK */
+			if (!bw_params->clk_table.entries[i].dtbclk_mhz && i > 0)
+				dcn3_2_soc.clock_limits[i].dtbclk_mhz  = dcn3_2_soc.clock_limits[i-1].dtbclk_mhz;
+			else
+				dcn3_2_soc.clock_limits[i].dtbclk_mhz  = bw_params->clk_table.entries[i].dtbclk_mhz;
+
+			if (!bw_params->clk_table.entries[i].socclk_mhz && i > 0)
+				dcn3_2_soc.clock_limits[i].socclk_mhz = dcn3_2_soc.clock_limits[i-1].socclk_mhz;
+			else
+				dcn3_2_soc.clock_limits[i].socclk_mhz = bw_params->clk_table.entries[i].socclk_mhz;
+
+			/* These clocks cannot come from bw_params, always fill from dcn3_2_soc[0] */
+			/* PHYCLK_D18, PHYCLK_D32 */
+			dcn3_2_soc.clock_limits[i].phyclk_d18_mhz = dcn3_2_soc.clock_limits[0].phyclk_d18_mhz;
+			dcn3_2_soc.clock_limits[i].phyclk_d32_mhz = dcn3_2_soc.clock_limits[0].phyclk_d32_mhz;
+		}
+
+		/* Re-init DML with updated bb */
+		dml_init_instance(&dc->dml, &dcn3_2_soc, &dcn3_2_ip, DML_PROJECT_DCN32);
+		if (dc->current_state)
+			dml_init_instance(&dc->current_state->bw_ctx.dml, &dcn3_2_soc, &dcn3_2_ip, DML_PROJECT_DCN32);
+	}
+}
+
+static struct resource_funcs dcn32_res_pool_funcs = {
+	.destroy = dcn32_destroy_resource_pool,
+	.link_enc_create = dcn32_link_encoder_create,
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
+	.update_bw_bounding_box = dcn32_update_bw_bounding_box,
+	.patch_unknown_plane_state = dcn20_patch_unknown_plane_state,
+	.update_soc_for_wm_a = dcn30_update_soc_for_wm_a,
+	.add_phantom_pipes = dcn32_add_phantom_pipes,
+	.remove_phantom_pipes = dcn32_remove_phantom_pipes,
+};
+
+
+static bool dcn32_resource_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dcn32_resource_pool *pool)
+{
+	int i, j;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+	struct ddc_service_init_data ddc_init_data = {0};
+	uint32_t pipe_fuses = 0;
+	uint32_t num_pipes  = 4;
+
+    DC_FP_START();
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_dcn32;
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
+	dcn3_2_ip.max_num_dpp = num_pipes;
+	dcn3_2_ip.max_num_otg = num_pipes;
+
+	pool->base.funcs = &dcn32_res_pool_funcs;
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
+
+	dc->caps.cache_line_size = 64;
+	dc->caps.cache_num_ways = 16;
+	dc->caps.max_cab_allocation_bytes = 67108864; // 64MB = 1024 * 1024 * 64
+	dc->caps.subvp_fw_processing_delay_us = 15;
+	dc->caps.subvp_prefetch_end_to_mall_start_us = 15;
+	dc->caps.subvp_pstate_allow_width_us = 20;
+	dc->caps.subvp_vertical_int_margin_us = 30;
+
+	dc->caps.max_slave_planes = 2;
+	dc->caps.max_slave_yuv_planes = 2;
+	dc->caps.max_slave_rgb_planes = 2;
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
+	dc->caps.color.dpp.hw_3d_lut = 1;
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
+	/* Use pipe context based otg sync logic */
+	dc->config.use_pipe_ctx_sync_logic = true;
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
+	pool->base.clock_sources[DCN32_CLK_SRC_PLL0] =
+			dcn32_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL0,
+				&clk_src_regs[0], false);
+	pool->base.clock_sources[DCN32_CLK_SRC_PLL1] =
+			dcn32_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL1,
+				&clk_src_regs[1], false);
+	pool->base.clock_sources[DCN32_CLK_SRC_PLL2] =
+			dcn32_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL2,
+				&clk_src_regs[2], false);
+	pool->base.clock_sources[DCN32_CLK_SRC_PLL3] =
+			dcn32_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL3,
+				&clk_src_regs[3], false);
+	pool->base.clock_sources[DCN32_CLK_SRC_PLL4] =
+			dcn32_clock_source_create(ctx, ctx->dc_bios,
+				CLOCK_SOURCE_COMBO_PHY_PLL4,
+				&clk_src_regs[4], false);
+
+	pool->base.clk_src_count = DCN32_CLK_SRC_TOTAL;
+
+	/* todo: not reuse phy_pll registers */
+	pool->base.dp_clock_source =
+			dcn32_clock_source_create(ctx, ctx->dc_bios,
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
+		dml_init_instance(&dc->dml, &dcn3_2_soc, &dcn3_2_ip, DML_PROJECT_DCN32);
+
+	/* IRQ Service */
+	init_data.ctx = dc->ctx;
+	pool->base.irqs = dal_irq_service_dcn32_create(&init_data);
+	if (!pool->base.irqs)
+		goto create_fail;
+
+	/* HUBBUB */
+	pool->base.hubbub = dcn32_hubbub_create(ctx);
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
+		/* HUBPs */
+		pool->base.hubps[j] = dcn32_hubp_create(ctx, i);
+		if (pool->base.hubps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create hubps!\n");
+			goto create_fail;
+		}
+
+		/* DPPs */
+		pool->base.dpps[j] = dcn32_dpp_create(ctx, i);
+		if (pool->base.dpps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create dpps!\n");
+			goto create_fail;
+		}
+
+		/* OPPs */
+		pool->base.opps[j] = dcn32_opp_create(ctx, i);
+		if (pool->base.opps[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC: failed to create output pixel processor!\n");
+			goto create_fail;
+		}
+
+		/* TGs */
+		pool->base.timing_generators[j] = dcn32_timing_generator_create(
+				ctx, i);
+		if (pool->base.timing_generators[j] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create tg!\n");
+			goto create_fail;
+		}
+
+		/* ABMs */
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
+	pool->base.mpc = dcn32_mpc_create(ctx, pool->base.res_cap->num_timing_generator, pool->base.res_cap->num_mpc_3dlut);
+	if (pool->base.mpc == NULL) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mpc!\n");
+		goto create_fail;
+	}
+
+	/* DSCs */
+	for (i = 0; i < pool->base.res_cap->num_dsc; i++) {
+		pool->base.dscs[i] = dcn32_dsc_create(ctx, i);
+		if (pool->base.dscs[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error("DC: failed to create display stream compressor %d!\n", i);
+			goto create_fail;
+		}
+	}
+
+	/* DWB */
+	if (!dcn32_dwbc_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create dwbc!\n");
+		goto create_fail;
+	}
+
+	/* MMHUBBUB */
+	if (!dcn32_mmhubbub_create(ctx, &pool->base)) {
+		BREAK_TO_DEBUGGER();
+		dm_error("DC: failed to create mcif_wb!\n");
+		goto create_fail;
+	}
+
+	/* AUX and I2C */
+	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
+		pool->base.engines[i] = dcn32_aux_engine_create(ctx, i);
+		if (pool->base.engines[i] == NULL) {
+			BREAK_TO_DEBUGGER();
+			dm_error(
+				"DC:failed to create aux engine!!\n");
+			goto create_fail;
+		}
+		pool->base.hw_i2cs[i] = dcn32_i2c_hw_create(ctx, i);
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
+    DC_FP_END();
+
+	return true;
+
+create_fail:
+
+    DC_FP_END();
+
+	dcn32_resource_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn32_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc)
+{
+	struct dcn32_resource_pool *pool =
+		kzalloc(sizeof(struct dcn32_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn32_resource_construct(init_data->num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
new file mode 100644
index 000000000000..10b58f1c724a
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.h
@@ -0,0 +1,88 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+#ifndef _DCN32_RESOURCE_H_
+#define _DCN32_RESOURCE_H_
+
+#include "core_types.h"
+
+#define TO_DCN32_RES_POOL(pool)\
+	container_of(pool, struct dcn32_resource_pool, base)
+
+struct dcn32_resource_pool {
+	struct resource_pool base;
+};
+
+struct resource_pool *dcn32_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc);
+
+void dcn32_calculate_dlg_params(
+		struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt,
+		int vlevel);
+
+struct panel_cntl *dcn32_panel_cntl_create(
+		const struct panel_cntl_init_data *init_data);
+
+bool dcn32_acquire_post_bldn_3dlut(
+		struct resource_context *res_ctx,
+		const struct resource_pool *pool,
+		int mpcc_id,
+		struct dc_3dlut **lut,
+		struct dc_transfer_func **shaper);
+
+bool dcn32_release_post_bldn_3dlut(
+		struct resource_context *res_ctx,
+		const struct resource_pool *pool,
+		struct dc_3dlut **lut,
+		struct dc_transfer_func **shaper);
+
+void dcn32_remove_phantom_pipes(struct dc *dc,
+		struct dc_state *context);
+
+void dcn32_add_phantom_pipes(struct dc *dc,
+		struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		unsigned int pipe_cnt,
+		unsigned int index);
+
+bool dcn32_validate_bandwidth(struct dc *dc,
+		struct dc_state *context,
+		bool fast_validate);
+
+int dcn32_populate_dml_pipes_from_context(
+	struct dc *dc, struct dc_state *context,
+	display_e2e_pipe_params_st *pipes,
+	bool fast_validate);
+
+void dcn32_calculate_wm_and_dlg(
+		struct dc *dc, struct dc_state *context,
+		display_e2e_pipe_params_st *pipes,
+		int pipe_cnt,
+		int vlevel);
+
+#endif /* _DCN32_RESOURCE_H_ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/Makefile b/drivers/gpu/drm/amd/display/dc/dcn321/Makefile
new file mode 100644
index 000000000000..99515cb3ed31
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/Makefile
@@ -0,0 +1,34 @@
+#
+# (c) Copyright 2020 Advanced Micro Devices, Inc. All the rights reserved
+#
+#  All rights reserved.  This notice is intended as a precaution against
+#  inadvertent publication and does not imply publication or any waiver
+#  of confidentiality.  The year included in the foregoing notice is the
+#  year of creation of the work.
+#
+#  Authors: AMD
+#
+# Makefile for dcn321.
+
+DCN321 = dcn321_resource.o
+
+CFLAGS_$(AMDDALPATH)/dc/dcn321/dcn321_resource.o := -mhard-float -msse
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+endif
+
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+CFLAGS_$(AMDDALPATH)/dc/dcn321/dcn321_resource.o += -mpreferred-stack-boundary=4
+else
+CFLAGS_$(AMDDALPATH)/dc/dcn321/dcn321_resource.o += -msse2
+endif
+
+AMD_DAL_DCN321 = $(addprefix $(AMDDALPATH)/dc/dcn321/,$(DCN321))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCN321)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
index a8fb4ab8ced1..6bc477a212b0 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: MIT
 /*
  * Copyright 2019 Advanced Micro Devices, Inc.
  *
@@ -23,7 +24,6 @@
  *
  */
 
-
 #include "dm_services.h"
 #include "dc.h"
 
@@ -98,28 +98,25 @@
 #define MAX_INSTANCE                                        8
 #define MAX_SEGMENT                                         6
 
-
-struct IP_BASE_INSTANCE
-{
-    unsigned int segment[MAX_SEGMENT];
+struct IP_BASE_INSTANCE {
+	unsigned int segment[MAX_SEGMENT];
 };
 
-struct IP_BASE
-{
-    struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
+struct IP_BASE {
+	struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
 };
 
 static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } },
-                                        { { 0, 0, 0, 0, 0, 0 } } } };
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0 } } } };
 
 #define DC_LOGGER_INIT(logger)
-#define fixed16_to_double(x) (((double) x) / ((double) (1 << 16)))
+#define fixed16_to_double(x) (((double)x) / ((double) (1 << 16)))
 #define fixed16_to_double_to_cpu(x) fixed16_to_double(le32_to_cpu(x))
 
 #define DCN3_2_DEFAULT_DET_SIZE 256
@@ -1534,9 +1531,8 @@ static void dcn321_resource_destruct(struct dcn321_resource_pool *pool)
 			pool->base.hubps[i] = NULL;
 		}
 
-		if (pool->base.irqs != NULL) {
+		if (pool->base.irqs != NULL)
 			dal_irq_service_destroy(&pool->base.irqs);
-		}
 	}
 
 	for (i = 0; i < pool->base.res_cap->num_ddc; i++) {
diff --git a/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.h b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.h
new file mode 100644
index 000000000000..2732085a0e88
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn321/dcn321_resource.h
@@ -0,0 +1,42 @@
+/*
+ * Copyright 2020 Advanced Micro Devices, Inc.
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
+#ifndef _DCN321_RESOURCE_H_
+#define _DCN321_RESOURCE_H_
+
+#include "core_types.h"
+
+#define TO_DCN321_RES_POOL(pool)\
+	container_of(pool, struct dcn321_resource_pool, base)
+
+struct dcn321_resource_pool {
+	struct resource_pool base;
+};
+
+struct resource_pool *dcn321_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc);
+
+#endif /* _DCN321_RESOURCE_H_ */
-- 
2.35.3


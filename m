Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE4856C18D
	for <lists+amd-gfx@lfdr.de>; Sat,  9 Jul 2022 00:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4D8A10EDA7;
	Fri,  8 Jul 2022 22:14:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED00D10EDAA
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 Jul 2022 22:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIDyaCLPfvOdXiEmCci+E+zra6GNiORit52K6CYaQ5HoarfCKXzhYv3Dv5YUVdGIHJggjrVuzM3QbUsuCXL9eXtzLLmehjTIHZNRX78ZmCg7AgW5z4iOfx4NLu1c6HEVZ66w+7Qgpa8yUDrf2JbZgtuRcCpJDlGRYwZfYHcJR2x+sf57zT4WZfEow291xVDxZ+jzgXJb8exOMGurWxR5CyX4owo0iSHJx4M95KPCqFwYWy+dYrhZ3Eo5miKODOOedwCFJsZEKknXJm8ZhBNLIA5b57MktQmQdfqWDY3KiZ+Hps6zSbeNGHCq19AtlRBgBQn1eve70py7+uktuDHuTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDHbDfy9JY8tJFYCMN9Xr+W2P5qcfAMHsaA0DpAIe90=;
 b=Y1V30OGbymHYMMXOYJeEtLx1Zd/OP7H5OUpofZdP1Jq9UppxMO/rMVs3z2krzfFCUyXeed7kJC9ZMWMNDlRhhcZEl9mKjWoiDP1ksHkXo9pPRU8ck2SCBKuYOGZham/vG0jRT92/kSfszSpjQV1Vv3yD6nxZnSNobobuN1rsBpSw4/vC2JZu7NzESwB0QKUcnZLS1HEHr+5l5cyBftpht95tVEDXox73InhgCk13V3VUZzV1HvAvs2NQluXwqV3yps7iN3BaC7gDazC2g8eFEL1QCkNEkiF1YNu16mQIqubSONU8PxLrpHXjnukkH9HYIDNNOtVbMpoTM9qoCpNVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDHbDfy9JY8tJFYCMN9Xr+W2P5qcfAMHsaA0DpAIe90=;
 b=WmYONkXENKKKzpivLelt/eGJKTzOlXnQKW7B4HnsDse+3SCLU4vskSS7mhiFE/oFZhIlv3mjXFax23DJzf+AzIQz4mD6vx03yvIlxdrHcISQ4r907JvDdqglay4EIbyeTrJUAyHrduDTH/V2Rh6W3p9xAcVMBkg075Tab/i1cgc=
Received: from DM6PR08CA0027.namprd08.prod.outlook.com (2603:10b6:5:80::40) by
 BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.21; Fri, 8 Jul 2022 22:09:11 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::14) by DM6PR08CA0027.outlook.office365.com
 (2603:10b6:5:80::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 22:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 22:09:10 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 8 Jul
 2022 17:09:09 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/9] drm/amd/display: Add DCN314 DC resources
Date: Fri, 8 Jul 2022 18:08:50 -0400
Message-ID: <20220708220855.1475213-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220708220855.1475213-1-alexander.deucher@amd.com>
References: <20220708220855.1475213-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 769ce019-a8ee-4bd5-eb4d-08da612e7c6f
X-MS-TrafficTypeDiagnostic: BL3PR12MB6378:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T1SbP26xY3dwfW3sbogCmDp43ihKIo+mgq7B1c3jLvpB/USD9k8/ij2QRKzUPmlSgqRczCxA9f5wISA0DA8PPyoLlZclNFYdxXOzKK/cDTt2yjvpH22oI8MvMI/Lh4C2OSQwEqlpnWXLrPU+XZ1dqq5zIWeoChqLa6qja7ovtV8e/MDuhb5vJAc9j9ER8I+ASoweR3HupPU9Rmzhr9TS0lzlcZZJmyz5sYRR0nRI7rTryEMw/rZ5ZaCu8tdYLvwcAKn+wyKXtotka5oIXLSnNk3xaPirrwXK36QTg5rMkyqULI5vEd6vNKNxXq9UwZVv/wnKzSzSPTzAatQOAklwxeB7RkkuYCQYh4Z6qc9JhB0hzHI4fy/gyiu+GUy9S5Sx3fjMOCVQKSnZPfaXZx0nUXo98wbxAUHQmzBOEHjuiPDJ/+03Xbu216kpcFvpr5frA4seKX9PMYg5OaOiR0PPEuCsfG2l7UK7O++K8PDeJ+4RODI93G2Ul4/YVuy3+G6QBhmoM2Pn7Q8QZuceZREzbvfrUPNQG7O6OEIQfN82LSIiLwbPRGwZTLjMWQ8QONx9dyWjBeJo383Hs1LLvXsppG2j84eMFCdCWbcm9htYanCSQGqvXov1Gz2CgGApASw+XdTNPTyxLZ6xWyzY/Lae0r82w0tHhcZQtavbtwDV+j4yNQQ1a4tP1sWpWcEVelVJr6FI4+L1OmaDNM40tjI4ab735/+jKh/IETC35QlR9itDCkedj2QnJFBUf2cp+erjU7GD4W6UpylPWQ/ZWY/IxARlTy9EKgxQW1dKpSzc+SPPnxwAuh8WIDaeKUACPowvn40Uf9FXmhVTsb+cvavcCOPNfNikXnDbVV079O+dBhKm/0WYtcK8bgTJ+fgXjQN6uuqPi9uNFy9pdJKTRSDaTyYyReuBlnZpXN0t5Kp8m94=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(40470700004)(46966006)(336012)(70206006)(47076005)(426003)(70586007)(6666004)(40460700003)(5660300002)(83380400001)(478600001)(2616005)(2906002)(30864003)(41300700001)(8676002)(16526019)(8936002)(4326008)(1076003)(186003)(54906003)(6916009)(7696005)(356005)(81166007)(82740400003)(86362001)(40480700001)(34020700004)(36860700001)(26005)(316002)(36756003)(82310400005)(36900700001)(559001)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 22:09:10.9508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 769ce019-a8ee-4bd5-eb4d-08da612e7c6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Roman Li <roman.li@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Roman Li <roman.li@amd.com>

Display Core support for DCN 3.1.4

v2:(squash)fix non-x86 in dc/dcn314/Makefile
Properly handle PPC as well. (Alex)
v3: minor cleanup (Alex)

Signed-off-by: Roman Li <roman.li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 .../gpu/drm/amd/display/dc/dcn314/Makefile    |   43 +
 .../drm/amd/display/dc/dcn314/dcn314_dccg.c   |  265 ++
 .../drm/amd/display/dc/dcn314/dcn314_dccg.h   |  158 ++
 .../dc/dcn314/dcn314_dio_stream_encoder.c     |  448 ++++
 .../dc/dcn314/dcn314_dio_stream_encoder.h     |  311 +++
 .../drm/amd/display/dc/dcn314/dcn314_hwseq.c  |  341 +++
 .../drm/amd/display/dc/dcn314/dcn314_hwseq.h  |   40 +
 .../drm/amd/display/dc/dcn314/dcn314_init.c   |  158 ++
 .../drm/amd/display/dc/dcn314/dcn314_init.h   |   34 +
 .../drm/amd/display/dc/dcn314/dcn314_optc.c   |  240 ++
 .../drm/amd/display/dc/dcn314/dcn314_optc.h   |  255 ++
 .../amd/display/dc/dcn314/dcn314_resource.c   | 2357 +++++++++++++++++
 .../amd/display/dc/dcn314/dcn314_resource.h   |   43 +
 13 files changed, 4693 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.h
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.h

diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/Makefile b/drivers/gpu/drm/amd/display/dc/dcn314/Makefile
new file mode 100644
index 000000000000..e3b5a95e03b1
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/Makefile
@@ -0,0 +1,43 @@
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
+# Makefile for dcn314.
+
+DCN314 = dcn314_resource.o dcn314_hwseq.o dcn314_init.o \
+		dcn314_dio_stream_encoder.o dcn314_dccg.o dcn314_optc.o
+
+ifdef CONFIG_X86
+CFLAGS_$(AMDDALPATH)/dc/dcn314/dcn314_resource.o := -mhard-float -msse
+endif
+
+ifdef CONFIG_PPC64
+CFLAGS_$(AMDDALPATH)/dc/dcn314/dcn314_resource.o := -mhard-float -maltivec
+endif
+
+ifdef CONFIG_CC_IS_GCC
+ifeq ($(call cc-ifversion, -lt, 0701, y), y)
+IS_OLD_GCC = 1
+endif
+endif
+
+ifdef CONFIG_X86
+ifdef IS_OLD_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+CFLAGS_$(AMDDALPATH)/dc/dcn314/dcn314_resource.o += -mpreferred-stack-boundary=4
+else
+CFLAGS_$(AMDDALPATH)/dc/dcn314/dcn314_resource.o += -msse2
+endif
+endif
+
+AMD_DAL_DCN314 = $(addprefix $(AMDDALPATH)/dc/dcn314/,$(DCN314))
+
+AMD_DISPLAY_FILES += $(AMD_DAL_DCN314)
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
new file mode 100644
index 000000000000..ea78da9c6f8b
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.c
@@ -0,0 +1,265 @@
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
+#include "reg_helper.h"
+#include "core_types.h"
+
+#include "dcn31/dcn31_dccg.h"
+#include "dcn314_dccg.h"
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
+static void dccg314_set_pixel_rate_div(
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
+static void dccg314_set_dtbclk_p_src(
+		struct dccg *dccg,
+		enum streamclk_source src,
+		uint32_t otg_inst)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	uint32_t p_src_sel = 0; /* selects dprefclk */
+
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
+void dccg314_set_dtbclk_dto(
+		struct dccg *dccg,
+		const struct dtbclk_dto_params *params)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+	/* DTO Output Rate / Pixel Rate = 1/4 */
+	int req_dtbclk_khz = params->pixclk_khz / 4;
+
+	if (params->ref_dtbclk_khz && req_dtbclk_khz) {
+		uint32_t modulo, phase;
+
+		// phase / modulo = dtbclk / dtbclk ref
+		modulo = params->ref_dtbclk_khz * 1000;
+		phase = req_dtbclk_khz * 1000;
+
+		REG_WRITE(DTBCLK_DTO_MODULO[params->otg_inst], modulo);
+		REG_WRITE(DTBCLK_DTO_PHASE[params->otg_inst], phase);
+
+		REG_UPDATE(OTG_PIXEL_RATE_CNTL[params->otg_inst],
+				DTBCLK_DTO_ENABLE[params->otg_inst], 1);
+
+		REG_WAIT(OTG_PIXEL_RATE_CNTL[params->otg_inst],
+				DTBCLKDTO_ENABLE_STATUS[params->otg_inst], 1,
+				1, 100);
+
+		/* program OTG_PIXEL_RATE_DIV for DIVK1 and DIVK2 fields */
+		dccg314_set_pixel_rate_div(dccg, params->otg_inst, PIXEL_RATE_DIV_BY_1, PIXEL_RATE_DIV_BY_1);
+
+		/* The recommended programming sequence to enable DTBCLK DTO to generate
+		 * valid pixel HPO DPSTREAM ENCODER, specifies that DTO source select should
+		 * be set only after DTO is enabled
+		 */
+		REG_UPDATE(OTG_PIXEL_RATE_CNTL[params->otg_inst],
+				PIPE_DTO_SRC_SEL[params->otg_inst], 2);
+	} else {
+		REG_UPDATE_2(OTG_PIXEL_RATE_CNTL[params->otg_inst],
+				DTBCLK_DTO_ENABLE[params->otg_inst], 0,
+				PIPE_DTO_SRC_SEL[params->otg_inst], 1);
+
+		REG_WRITE(DTBCLK_DTO_MODULO[params->otg_inst], 0);
+		REG_WRITE(DTBCLK_DTO_PHASE[params->otg_inst], 0);
+	}
+}
+
+void dccg314_set_dpstreamclk(
+		struct dccg *dccg,
+		enum streamclk_source src,
+		int otg_inst)
+{
+	struct dcn_dccg *dccg_dcn = TO_DCN_DCCG(dccg);
+
+	/* set the dtbclk_p source */
+	dccg314_set_dtbclk_p_src(dccg, src, otg_inst);
+
+	/* enabled to select one of the DTBCLKs for pipe */
+	switch (otg_inst) {
+	case 0:
+		REG_UPDATE_2(DPSTREAMCLK_CNTL,
+					DPSTREAMCLK0_EN, (src == REFCLK) ? 0 : 1,
+					DPSTREAMCLK0_SRC_SEL, 0);
+		break;
+	case 1:
+		REG_UPDATE_2(DPSTREAMCLK_CNTL,
+					DPSTREAMCLK1_EN, (src == REFCLK) ? 0 : 1,
+					DPSTREAMCLK1_SRC_SEL, 1);
+		break;
+	case 2:
+		REG_UPDATE_2(DPSTREAMCLK_CNTL,
+					DPSTREAMCLK2_EN, (src == REFCLK) ? 0 : 1,
+					DPSTREAMCLK2_SRC_SEL, 2);
+		break;
+	case 3:
+		REG_UPDATE_2(DPSTREAMCLK_CNTL,
+					DPSTREAMCLK3_EN, (src == REFCLK) ? 0 : 1,
+					DPSTREAMCLK3_SRC_SEL, 3);
+		break;
+	default:
+		BREAK_TO_DEBUGGER();
+		return;
+	}
+}
+
+static const struct dccg_funcs dccg314_funcs = {
+	.update_dpp_dto = dccg31_update_dpp_dto,
+	.get_dccg_ref_freq = dccg31_get_dccg_ref_freq,
+	.dccg_init = dccg31_init,
+	.set_dpstreamclk = dccg314_set_dpstreamclk,
+	.enable_symclk32_se = dccg31_enable_symclk32_se,
+	.disable_symclk32_se = dccg31_disable_symclk32_se,
+	.enable_symclk32_le = dccg31_enable_symclk32_le,
+	.disable_symclk32_le = dccg31_disable_symclk32_le,
+	.set_physymclk = dccg31_set_physymclk,
+	.set_dtbclk_dto = dccg314_set_dtbclk_dto,
+	.set_audio_dtbclk_dto = dccg31_set_audio_dtbclk_dto,
+	.set_fifo_errdet_ovr_en = dccg2_set_fifo_errdet_ovr_en,
+	.otg_add_pixel = dccg31_otg_add_pixel,
+	.otg_drop_pixel = dccg31_otg_drop_pixel,
+	.set_dispclk_change_mode = dccg31_set_dispclk_change_mode,
+	.disable_dsc = dccg31_disable_dscclk,
+	.enable_dsc = dccg31_enable_dscclk,
+};
+
+struct dccg *dccg314_create(
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
+	base->funcs = &dccg314_funcs;
+
+	dccg_dcn->regs = regs;
+	dccg_dcn->dccg_shift = dccg_shift;
+	dccg_dcn->dccg_mask = dccg_mask;
+
+	return &dccg_dcn->base;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h
new file mode 100644
index 000000000000..99ba597bf9b7
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dccg.h
@@ -0,0 +1,158 @@
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
+
+#ifndef __DCN314_DCCG_H__
+#define __DCN314_DCCG_H__
+
+#include "dcn31/dcn31_dccg.h"
+
+#define DCCG_SFII(block, reg_name, field_prefix, field_name, inst, post_fix)\
+	.field_prefix ## _ ## field_name[inst] = block ## inst ## _ ## reg_name ## __ ## field_prefix ## inst ## _ ## field_name ## post_fix
+
+
+#define DCCG_REG_LIST_DCN314() \
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
+	SR(HDMISTREAMCLK_CNTL),\
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
+#define DCCG_MASK_SH_LIST_DCN314(mask_sh) \
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
+	DCCG_SF(HDMISTREAMCLK_CNTL, HDMISTREAMCLK0_DTO_FORCE_DIS, mask_sh),\
+	DCCG_SF(HDMISTREAMCLK_CNTL, HDMISTREAMCLK0_SRC_SEL, mask_sh),\
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
+struct dccg *dccg314_create(
+	struct dc_context *ctx,
+	const struct dccg_registers *regs,
+	const struct dccg_shift *dccg_shift,
+	const struct dccg_mask *dccg_mask);
+
+#endif //__DCN314_DCCG_H__
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
new file mode 100644
index 000000000000..2dbfa1c234dd
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.c
@@ -0,0 +1,448 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+#include "dcn314_dio_stream_encoder.h"
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
+static void enc314_dp_set_odm_combine(
+	struct stream_encoder *enc,
+	bool odm_combine)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	REG_UPDATE(DP_PIXEL_FORMAT, DP_PIXEL_PER_CYCLE_PROCESSING_MODE, odm_combine);
+}
+
+/* setup stream encoder in dvi mode */
+void enc314_stream_encoder_dvi_set_stream_attribute(
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
+static void enc314_stream_encoder_hdmi_set_stream_attribute(
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
+static void enc314_stream_encoder_dp_unblank(
+		struct dc_link *link,
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
+	/*
+	 * DIG Resync FIFO now needs to be explicitly enabled.
+	 * TODO: Confirm if we need to wait for DIG_SYMCLK_FE_ON
+	 */
+	REG_WAIT(DIG_FE_CNTL, DIG_SYMCLK_FE_ON, 1, 10, 5000);
+	REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_RESET, 1);
+	REG_WAIT(DIG_FIFO_CTRL0, DIG_FIFO_RESET_DONE, 1, 10, 5000);
+	REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_RESET, 0);
+	REG_WAIT(DIG_FIFO_CTRL0, DIG_FIFO_RESET_DONE, 0, 10, 5000);
+	REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_ENABLE, 1);
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
+static void enc314_dp_set_dsc_config(struct stream_encoder *enc,
+					enum optc_dsc_mode dsc_mode,
+					uint32_t dsc_bytes_per_pixel,
+					uint32_t dsc_slice_width)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	REG_UPDATE(DP_DSC_CNTL,	DP_DSC_MODE, dsc_mode == OPTC_DSC_DISABLED ? 0 : 1);
+}
+
+/* this function read dsc related register fields to be logged later in dcn10_log_hw_state
+ * into a dcn_dsc_state struct.
+ */
+static void enc314_read_state(struct stream_encoder *enc, struct enc_state *s)
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
+static void enc314_set_dig_input_mode(struct stream_encoder *enc, unsigned int pix_per_container)
+{
+	struct dcn10_stream_encoder *enc1 = DCN10STRENC_FROM_STRENC(enc);
+
+	// The naming of this field is confusing, what it means is the output mode of otg, which
+	// is the input mode of the dig
+	REG_UPDATE(DIG_FIFO_CTRL0, DIG_FIFO_OUTPUT_PIXEL_MODE, pix_per_container == 2 ? 0x1 : 0x0);
+}
+
+
+static const struct stream_encoder_funcs dcn314_str_enc_funcs = {
+	.dp_set_odm_combine =
+		enc314_dp_set_odm_combine,
+	.dp_set_stream_attribute =
+		enc2_stream_encoder_dp_set_stream_attribute,
+	.hdmi_set_stream_attribute =
+		enc314_stream_encoder_hdmi_set_stream_attribute,
+	.dvi_set_stream_attribute =
+		enc314_stream_encoder_dvi_set_stream_attribute,
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
+	.dp_blank =
+		enc1_stream_encoder_dp_blank,
+	.dp_unblank =
+		enc314_stream_encoder_dp_unblank,
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
+	.enc_read_state = enc314_read_state,
+	.dp_set_dsc_config = enc314_dp_set_dsc_config,
+	.dp_set_dsc_pps_info_packet = enc3_dp_set_dsc_pps_info_packet,
+	.set_dynamic_metadata = enc2_set_dynamic_metadata,
+	.hdmi_reset_stream_attribute = enc1_reset_hdmi_stream_attribute,
+
+	.set_input_mode = enc314_set_dig_input_mode,
+};
+
+void dcn314_dio_stream_encoder_construct(
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
+	enc1->base.funcs = &dcn314_str_enc_funcs;
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
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.h b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.h
new file mode 100644
index 000000000000..33dfdf8b4100
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_dio_stream_encoder.h
@@ -0,0 +1,311 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+#ifndef __DC_DIO_STREAM_ENCODER_DCN314_H__
+#define __DC_DIO_STREAM_ENCODER_DCN314_H__
+
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+#include "stream_encoder.h"
+#include "dcn20/dcn20_stream_encoder.h"
+
+/* Register bit field name change */
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS__SHIFT                                        0x8
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN__SHIFT                                              0x9
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON__SHIFT                                        0xa
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP__SHIFT                                                      0xe
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT__SHIFT                                              0xf
+
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_GATE_DIS_MASK                                          0x00000100L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_EN_MASK                                                0x00000200L
+#define RDPCSTX0_RDPCSTX_CLOCK_CNTL__RDPCS_SYMCLK_DIV2_CLOCK_ON_MASK                                          0x00000400L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_SWAP_MASK                                                        0x00004000L
+#define DPCSTX0_DPCSTX_TX_CNTL__DPCS_TX_DATA_ORDER_INVERT_MASK                                                0x00008000L
+
+
+#define SE_DCN314_REG_LIST(id)\
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
+	SRI(DP_SEC_CNTL1, DP, id), \
+	SRI(DP_SEC_CNTL2, DP, id), \
+	SRI(DP_SEC_CNTL5, DP, id), \
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
+	SRI(DIG_CLOCK_PATTERN, DIG, id), \
+	SRI(DIG_FIFO_CTRL0, DIG, id)
+
+
+#define SE_COMMON_MASK_SH_LIST_DCN314(mask_sh)\
+	SE_SF(DP0_DP_PIXEL_FORMAT, DP_PIXEL_ENCODING, mask_sh),\
+	SE_SF(DP0_DP_PIXEL_FORMAT, DP_COMPONENT_DEPTH, mask_sh),\
+	SE_SF(DP0_DP_PIXEL_FORMAT, DP_PIXEL_PER_CYCLE_PROCESSING_MODE, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_PACKET_GEN_VERSION, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_KEEPOUT_MODE, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DEEP_COLOR_ENABLE, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DEEP_COLOR_DEPTH, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_DATA_SCRAMBLE_EN, mask_sh),\
+	SE_SF(DIG0_HDMI_CONTROL, HDMI_NO_EXTRA_NULL_PACKET_FILLED, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_GC_CONT, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_GC_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_NULL_SEND, mask_sh),\
+	SE_SF(DIG0_HDMI_VBI_PACKET_CONTROL, HDMI_ACP_SEND, mask_sh),\
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
+	SE_SF(DIG0_DIG_FE_CNTL, DIG_SYMCLK_FE_ON, mask_sh),\
+	SE_SF(DP0_DP_SEC_FRAMING4, DP_SST_SDP_SPLITTING, mask_sh),\
+	SE_SF(DIG0_DIG_CLOCK_PATTERN, DIG_CLOCK_PATTERN, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_OUTPUT_PIXEL_MODE, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_READ_START_LEVEL, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_ENABLE, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_RESET, mask_sh),\
+	SE_SF(DIG0_DIG_FIFO_CTRL0, DIG_FIFO_RESET_DONE, mask_sh)
+
+void dcn314_dio_stream_encoder_construct(
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
+void enc3_stream_encoder_update_hdmi_info_packets(
+	struct stream_encoder *enc,
+	const struct encoder_info_frame *info_frame);
+
+void enc3_stream_encoder_stop_hdmi_info_packets(
+	struct stream_encoder *enc);
+
+void enc3_stream_encoder_update_dp_info_packets(
+	struct stream_encoder *enc,
+	const struct encoder_info_frame *info_frame);
+
+void enc3_audio_mute_control(
+	struct stream_encoder *enc,
+	bool mute);
+
+void enc3_se_dp_audio_setup(
+	struct stream_encoder *enc,
+	unsigned int az_inst,
+	struct audio_info *info);
+
+void enc3_se_dp_audio_enable(
+	struct stream_encoder *enc);
+
+void enc3_se_hdmi_audio_setup(
+	struct stream_encoder *enc,
+	unsigned int az_inst,
+	struct audio_info *info,
+	struct audio_crtc_info *audio_crtc_info);
+
+void enc3_dp_set_dsc_pps_info_packet(
+	struct stream_encoder *enc,
+	bool enable,
+	uint8_t *dsc_packed_pps,
+	bool immediate_update);
+
+#endif /* __DC_DIO_STREAM_ENCODER_DCN314_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
new file mode 100644
index 000000000000..a0c132666b5f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.c
@@ -0,0 +1,341 @@
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
+
+#include "dm_services.h"
+#include "dm_helpers.h"
+#include "core_types.h"
+#include "resource.h"
+#include "dccg.h"
+#include "dce/dce_hwseq.h"
+#include "clk_mgr.h"
+#include "reg_helper.h"
+#include "abm.h"
+#include "clk_mgr.h"
+#include "hubp.h"
+#include "dchubbub.h"
+#include "timing_generator.h"
+#include "opp.h"
+#include "ipp.h"
+#include "mpc.h"
+#include "mcif_wb.h"
+#include "dc_dmub_srv.h"
+#include "dcn314_hwseq.h"
+#include "link_hwss.h"
+#include "dpcd_defs.h"
+#include "dce/dmub_outbox.h"
+#include "dc_link_dp.h"
+#include "inc/dc_link_dp.h"
+#include "inc/link_dpcd.h"
+#include "dcn10/dcn10_hw_sequencer.h"
+#include "inc/link_enc_cfg.h"
+#include "dcn30/dcn30_vpg.h"
+#include "dce/dce_i2c_hw.h"
+#include "dsc.h"
+#include "dcn20/dcn20_optc.h"
+#include "dcn30/dcn30_cm_common.h"
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
+// Given any pipe_ctx, return the total ODM combine factor, and optionally return
+// the OPPids which are used
+static unsigned int get_odm_config(struct pipe_ctx *pipe_ctx, unsigned int *opp_instances)
+{
+	unsigned int opp_count = 1;
+	struct pipe_ctx *odm_pipe;
+
+	// First get to the top pipe
+	for (odm_pipe = pipe_ctx; odm_pipe->prev_odm_pipe; odm_pipe = odm_pipe->prev_odm_pipe)
+		;
+
+	// First pipe is always used
+	if (opp_instances)
+		opp_instances[0] = odm_pipe->stream_res.opp->inst;
+
+	// Find and count odm pipes, if any
+	for (odm_pipe = odm_pipe->next_odm_pipe; odm_pipe; odm_pipe = odm_pipe->next_odm_pipe) {
+		if (opp_instances)
+			opp_instances[opp_count] = odm_pipe->stream_res.opp->inst;
+		opp_count++;
+	}
+
+	return opp_count;
+}
+
+void dcn314_update_odm(struct dc *dc, struct dc_state *context, struct pipe_ctx *pipe_ctx)
+{
+	struct pipe_ctx *odm_pipe;
+	int opp_cnt = 0;
+	int opp_inst[MAX_PIPES] = {0};
+	bool rate_control_2x_pclk = (pipe_ctx->stream->timing.flags.INTERLACE || optc2_is_two_pixels_per_containter(&pipe_ctx->stream->timing));
+	struct mpc_dwb_flow_control flow_control;
+	struct mpc *mpc = dc->res_pool->mpc;
+	int i;
+
+	opp_cnt = get_odm_config(pipe_ctx, opp_inst);
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
+	if (pipe_ctx->stream_res.dsc) {
+		struct pipe_ctx *current_pipe_ctx = &dc->current_state->res_ctx.pipe_ctx[pipe_ctx->pipe_idx];
+
+		update_dsc_on_stream(pipe_ctx, pipe_ctx->stream->timing.flags.DSC);
+
+		/* Check if no longer using pipe for ODM, then need to disconnect DSC for that pipe */
+		if (!pipe_ctx->next_odm_pipe && current_pipe_ctx->next_odm_pipe &&
+				current_pipe_ctx->next_odm_pipe->stream_res.dsc) {
+			struct display_stream_compressor *dsc = current_pipe_ctx->next_odm_pipe->stream_res.dsc;
+			/* disconnect DSC block from stream */
+			dsc->funcs->dsc_disconnect(dsc);
+		}
+	}
+}
+
+void dcn314_dsc_pg_control(
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
+	if (hws->ctx->dc->debug.root_clock_optimization.bits.dsc &&
+		hws->ctx->dc->res_pool->dccg->funcs->enable_dsc &&
+		power_on)
+		hws->ctx->dc->res_pool->dccg->funcs->enable_dsc(
+			hws->ctx->dc->res_pool->dccg, dsc_inst);
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
+
+	if (hws->ctx->dc->debug.root_clock_optimization.bits.dsc) {
+		if (hws->ctx->dc->res_pool->dccg->funcs->disable_dsc && !power_on)
+			hws->ctx->dc->res_pool->dccg->funcs->disable_dsc(
+				hws->ctx->dc->res_pool->dccg, dsc_inst);
+	}
+
+}
+
+void dcn314_enable_power_gating_plane(struct dce_hwseq *hws, bool enable)
+{
+	bool force_on = true; /* disable power gating */
+	uint32_t org_ip_request_cntl = 0;
+
+	if (enable && !hws->ctx->dc->debug.disable_hubp_power_gate)
+		force_on = false;
+
+	REG_GET(DC_IP_REQUEST_CNTL, IP_REQUEST_EN, &org_ip_request_cntl);
+	if (org_ip_request_cntl == 0)
+		REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 1);
+	/* DCHUBP0/1/2/3/4/5 */
+	REG_UPDATE(DOMAIN0_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN2_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	/* DPP0/1/2/3/4/5 */
+	REG_UPDATE(DOMAIN1_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN3_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+
+	force_on = true; /* disable power gating */
+	if (enable && !hws->ctx->dc->debug.disable_dsc_power_gate)
+		force_on = false;
+
+	/* DCS0/1/2/3/4 */
+	REG_UPDATE(DOMAIN16_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN17_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN18_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+	REG_UPDATE(DOMAIN19_PG_CONFIG, DOMAIN_POWER_FORCEON, force_on);
+
+	if (org_ip_request_cntl == 0)
+		REG_SET(DC_IP_REQUEST_CNTL, 0, IP_REQUEST_EN, 0);
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h
new file mode 100644
index 000000000000..dfdd0b792a52
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_hwseq.h
@@ -0,0 +1,40 @@
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
+
+#ifndef __DC_HWSS_DCN314_H__
+#define __DC_HWSS_DCN314_H__
+
+#include "hw_sequencer_private.h"
+
+struct dc;
+
+void dcn314_update_odm(struct dc *dc, struct dc_state *context, struct pipe_ctx *pipe_ctx);
+
+void dcn314_dsc_pg_control(struct dce_hwseq *hws, unsigned int dsc_inst, bool power_on);
+
+void dcn314_enable_power_gating_plane(struct dce_hwseq *hws, bool enable);
+
+#endif /* __DC_HWSS_DCN314_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
new file mode 100644
index 000000000000..c87b1979b2cc
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.c
@@ -0,0 +1,158 @@
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
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn10/dcn10_hw_sequencer.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn21/dcn21_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dcn301/dcn301_hwseq.h"
+#include "dcn31/dcn31_hwseq.h"
+#include "dcn314/dcn314_hwseq.h"
+
+#include "dcn314_init.h"
+
+static const struct hw_sequencer_funcs dcn314_funcs = {
+	.program_gamut_remap = dcn10_program_gamut_remap,
+	.init_hw = dcn31_init_hw,
+	.power_down_on_boot = dcn10_power_down_on_boot,
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
+	.edp_wait_for_T12 = dce110_edp_wait_for_T12,
+	.edp_wait_for_hpd_ready = dce110_edp_wait_for_hpd_ready,
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
+	.init_sys_ctx = dcn31_init_sys_ctx,
+	.init_vm_ctx = dcn20_init_vm_ctx,
+	.set_flip_control_gsl = dcn20_set_flip_control_gsl,
+	.get_vupdate_offset_from_vsync = dcn10_get_vupdate_offset_from_vsync,
+	.calc_vupdate_position = dcn10_calc_vupdate_position,
+	.power_down = dce110_power_down,
+	.set_backlight_level = dcn21_set_backlight_level,
+	.set_abm_immediate_disable = dcn21_set_abm_immediate_disable,
+	.set_pipe = dcn21_set_pipe,
+	.z10_restore = dcn31_z10_restore,
+	.z10_save_init = dcn31_z10_save_init,
+	.set_disp_pattern_generator = dcn30_set_disp_pattern_generator,
+	.optimize_pwr_state = dcn21_optimize_pwr_state,
+	.exit_optimized_pwr_state = dcn21_exit_optimized_pwr_state,
+	.update_visual_confirm_color = dcn20_update_visual_confirm_color,
+};
+
+static const struct hwseq_private_funcs dcn314_private_funcs = {
+	.init_pipes = dcn10_init_pipes,
+	.update_plane_addr = dcn20_update_plane_addr,
+	.plane_atomic_disconnect = dcn10_plane_atomic_disconnect,
+	.update_mpcc = dcn20_update_mpcc,
+	.set_input_transfer_func = dcn30_set_input_transfer_func,
+	.set_output_transfer_func = dcn30_set_output_transfer_func,
+	.power_down = dce110_power_down,
+	.enable_display_power_gating = dcn10_dummy_display_power_gating,
+	.blank_pixel_data = dcn20_blank_pixel_data,
+	.reset_hw_ctx_wrap = dcn31_reset_hw_ctx_wrap,
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
+	.enable_power_gating_plane = dcn314_enable_power_gating_plane,
+	.hubp_pg_control = dcn31_hubp_pg_control,
+	.program_all_writeback_pipes_in_tree = dcn30_program_all_writeback_pipes_in_tree,
+	.update_odm = dcn314_update_odm,
+	.dsc_pg_control = dcn314_dsc_pg_control,
+	.set_hdr_multiplier = dcn10_set_hdr_multiplier,
+	.verify_allow_pstate_change_high = dcn10_verify_allow_pstate_change_high,
+	.wait_for_blank_complete = dcn20_wait_for_blank_complete,
+	.dccg_init = dcn20_dccg_init,
+	.set_blend_lut = dcn30_set_blend_lut,
+	.set_shaper_3dlut = dcn20_set_shaper_3dlut,
+	.setup_hpo_hw_control = dcn31_setup_hpo_hw_control,
+};
+
+void dcn314_hw_sequencer_construct(struct dc *dc)
+{
+	dc->hwss = dcn314_funcs;
+	dc->hwseq->funcs = dcn314_private_funcs;
+
+	if (IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment)) {
+		dc->hwss.init_hw = dcn20_fpga_init_hw;
+		dc->hwseq->funcs.init_pipes = NULL;
+	}
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.h b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.h
new file mode 100644
index 000000000000..8f92e66577cf
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_init.h
@@ -0,0 +1,34 @@
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
+
+#ifndef __DC_DCN314_INIT_H__
+#define __DC_DCN314_INIT_H__
+
+struct dc;
+
+void dcn314_hw_sequencer_construct(struct dc *dc);
+
+#endif /* __DC_DCN314_INIT_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
new file mode 100644
index 000000000000..4ed6e24b8231
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.c
@@ -0,0 +1,240 @@
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
+#include "dcn314_optc.h"
+#include "dcn314_optc.h"
+
+#include "dcn30/dcn30_optc.h"
+#include "dcn31/dcn31_optc.h"
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
+/**
+ * Enable CRTC
+ * Enable CRTC - call ASIC Control Object to enable Timing generator.
+ */
+
+static void optc314_set_odm_combine(struct timing_generator *optc, int *opp_id, int opp_cnt,
+		struct dc_crtc_timing *timing)
+{
+	struct optc *optc1 = DCN10TG_FROM_TG(optc);
+	uint32_t memory_mask = 0;
+	int h_active = timing->h_addressable + timing->h_border_left + timing->h_border_right;
+	int mpcc_hactive = h_active / opp_cnt;
+	/* Each memory instance is 2048x(314x2) bits to support half line of 4096 */
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
+static bool optc314_enable_crtc(struct timing_generator *optc)
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
+static bool optc314_disable_crtc(struct timing_generator *optc)
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
+void optc314_phantom_crtc_post_enable(struct timing_generator *optc)
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
+static struct timing_generator_funcs dcn314_tg_funcs = {
+		.validate_timing = optc1_validate_timing,
+		.program_timing = optc1_program_timing,
+		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
+		.setup_vertical_interrupt1 = optc1_setup_vertical_interrupt1,
+		.setup_vertical_interrupt2 = optc1_setup_vertical_interrupt2,
+		.program_global_sync = optc1_program_global_sync,
+		.enable_crtc = optc314_enable_crtc,
+		.disable_crtc = optc314_disable_crtc,
+		.phantom_crtc_post_enable = optc314_phantom_crtc_post_enable,
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
+		.set_drr = optc31_set_drr,
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
+		.set_odm_combine = optc314_set_odm_combine,
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
+		.init_odm = optc3_init_odm,
+};
+
+void dcn314_timing_generator_init(struct optc *optc1)
+{
+	optc1->base.funcs = &dcn314_tg_funcs;
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
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.h b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.h
new file mode 100644
index 000000000000..99c098e76116
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_optc.h
@@ -0,0 +1,255 @@
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
+
+#ifndef __DC_OPTC_DCN314_H__
+#define __DC_OPTC_DCN314_H__
+
+#include "dcn10/dcn10_optc.h"
+
+#define OPTC_COMMON_REG_LIST_DCN3_14(inst) \
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
+#define OPTC_COMMON_MASK_SH_LIST_DCN3_14(mask_sh)\
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
+	SF(OTG0_OTG_H_TIMING_CNTL, OTG_H_TIMING_DIV_MODE_MANUAL, mask_sh),\
+	SF(OTG0_OTG_DOUBLE_BUFFER_CONTROL, OTG_DRR_TIMING_DBUF_UPDATE_MODE, mask_sh),\
+	SF(OTG0_OTG_DRR_CONTROL, OTG_V_TOTAL_LAST_USED_BY_DRR, mask_sh)
+
+void dcn314_timing_generator_init(struct optc *optc1);
+
+#endif /* __DC_OPTC_DCN314_H__ */
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
new file mode 100644
index 000000000000..053a06b2fff9
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
@@ -0,0 +1,2357 @@
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
+
+#include "dm_services.h"
+#include "dc.h"
+
+#include "dcn31/dcn31_init.h"
+#include "dcn314/dcn314_init.h"
+
+#include "resource.h"
+#include "include/irq_service_interface.h"
+#include "dcn314_resource.h"
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
+#include "irq/dcn314/irq_service_dcn314.h"
+#include "dcn30/dcn30_dpp.h"
+#include "dcn314/dcn314_optc.h"
+#include "dcn20/dcn20_hwseq.h"
+#include "dcn30/dcn30_hwseq.h"
+#include "dce110/dce110_hw_sequencer.h"
+#include "dcn30/dcn30_opp.h"
+#include "dcn20/dcn20_dsc.h"
+#include "dcn30/dcn30_vpg.h"
+#include "dcn30/dcn30_afmt.h"
+#include "dcn31/dcn31_dio_link_encoder.h"
+#include "dcn314/dcn314_dio_stream_encoder.h"
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
+#include "dcn314/dcn314_dccg.h"
+#include "dcn10/dcn10_resource.h"
+#include "dcn31/dcn31_panel_cntl.h"
+#include "dcn314/dcn314_hwseq.h"
+
+#include "dcn30/dcn30_dwb.h"
+#include "dcn30/dcn30_mmhubbub.h"
+
+#include "dcn/dcn_3_1_4_offset.h"
+#include "dcn/dcn_3_1_4_sh_mask.h"
+#include "dpcs/dpcs_3_1_4_offset.h"
+#include "dpcs/dpcs_3_1_4_sh_mask.h"
+
+#define DCHUBBUB_DEBUG_CTRL_0__DET_DEPTH__SHIFT		0x10
+#define DCHUBBUB_DEBUG_CTRL_0__DET_DEPTH_MASK		0x01FF0000L
+
+#include "reg_helper.h"
+#include "dce/dmub_abm.h"
+#include "dce/dmub_psr.h"
+#include "dce/dce_aux.h"
+#include "dce/dce_i2c.h"
+#include "dml/dcn314/display_mode_vba_314.h"
+#include "vm_helper.h"
+#include "dcn20/dcn20_vmid.h"
+
+#include "link_enc_cfg.h"
+
+#define DCN_BASE__INST0_SEG1				0x000000C0
+#define DCN_BASE__INST0_SEG2				0x000034C0
+#define DCN_BASE__INST0_SEG3				0x00009000
+
+#define NBIO_BASE__INST0_SEG1				0x00000014
+
+#define MAX_INSTANCE					7
+#define MAX_SEGMENT					8
+
+#define regBIF_BX2_BIOS_SCRATCH_2			0x003a
+#define regBIF_BX2_BIOS_SCRATCH_2_BASE_IDX		1
+#define regBIF_BX2_BIOS_SCRATCH_3			0x003b
+#define regBIF_BX2_BIOS_SCRATCH_3_BASE_IDX		1
+#define regBIF_BX2_BIOS_SCRATCH_6			0x003e
+#define regBIF_BX2_BIOS_SCRATCH_6_BASE_IDX		1
+
+struct IP_BASE_INSTANCE {
+	unsigned int segment[MAX_SEGMENT];
+};
+
+struct IP_BASE {
+	struct IP_BASE_INSTANCE instance[MAX_INSTANCE];
+};
+
+static const struct IP_BASE DCN_BASE = { { { { 0x00000012, 0x000000C0, 0x000034C0, 0x00009000, 0x02403C00, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0, 0, 0 } },
+					{ { 0, 0, 0, 0, 0, 0, 0, 0 } } } };
+
+
+#define DC_LOGGER_INIT(logger)
+
+#define DCN3_14_DEFAULT_DET_SIZE 384
+#define DCN3_14_MAX_DET_SIZE 384
+#define DCN3_14_MIN_COMPBUF_SIZE_KB 128
+#define DCN3_14_CRB_SEGMENT_SIZE_KB 64
+struct _vcs_dpi_ip_params_st dcn3_14_ip = {
+	.VBlankNomDefaultUS = 668,
+	.gpuvm_enable = 1,
+	.gpuvm_max_page_table_levels = 1,
+	.hostvm_enable = 1,
+	.hostvm_max_page_table_levels = 2,
+	.rob_buffer_size_kbytes = 64,
+	.det_buffer_size_kbytes = DCN3_14_DEFAULT_DET_SIZE,
+	.config_return_buffer_size_in_kbytes = 1792,
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
+	.num_dsc = 4,
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
+struct _vcs_dpi_soc_bounding_box_st dcn3_14_soc = {
+		/*TODO: correct dispclk/dppclk voltage level determination*/
+	.clock_limits = {
+		{
+			.state = 0,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 600.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 186.0,
+			.dtbclk_mhz = 625.0,
+		},
+		{
+			.state = 1,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 209.0,
+			.dtbclk_mhz = 625.0,
+		},
+		{
+			.state = 2,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 209.0,
+			.dtbclk_mhz = 625.0,
+		},
+		{
+			.state = 3,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
+			.phyclk_mhz = 810.0,
+			.phyclk_d18_mhz = 667.0,
+			.dscclk_mhz = 371.0,
+			.dtbclk_mhz = 625.0,
+		},
+		{
+			.state = 4,
+			.dispclk_mhz = 1200.0,
+			.dppclk_mhz = 1200.0,
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
+		.reg_name = NBIO_BASE(regBIF_BX2_ ## reg_name ## _BASE_IDX) + \
+					regBIF_BX2_ ## reg_name
+
+/* MMHUB */
+#define MMHUB_BASE_INNER(seg) \
+	MMHUB_BASE__INST0_SEG ## seg
+
+#define MMHUB_BASE(seg) \
+	MMHUB_BASE_INNER(seg)
+
+#define MMHUB_SR(reg_name)\
+		.reg_name = MMHUB_BASE(reg ## reg_name ## _BASE_IDX) + \
+					reg ## reg_name
+
+/* CLOCK */
+#define CLK_BASE_INNER(seg) \
+	CLK_BASE__INST0_SEG ## seg
+
+#define CLK_BASE(seg) \
+	CLK_BASE_INNER(seg)
+
+#define CLK_SRI(reg_name, block, inst)\
+	.reg_name = CLK_BASE(reg ## block ## _ ## inst ## _ ## reg_name ## _BASE_IDX) + \
+					reg ## block ## _ ## inst ## _ ## reg_name
+
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
+		CS_COMMON_MASK_SH_LIST_DCN3_1_4(__SHIFT)
+};
+
+static const struct dce110_clk_src_mask cs_mask = {
+		CS_COMMON_MASK_SH_LIST_DCN3_1_4(_MASK)
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
+		SE_DCN314_REG_LIST(id)\
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
+		SE_COMMON_MASK_SH_LIST_DCN314(__SHIFT)
+};
+
+static const struct dcn10_stream_encoder_mask se_mask = {
+		SE_COMMON_MASK_SH_LIST_DCN314(_MASK)
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
+	LINK_ENCODER_MASK_SH_LIST_DCN31(__SHIFT),
+	DPCS_DCN31_MASK_SH_LIST(__SHIFT)
+};
+
+static const struct dcn10_link_enc_mask le_mask = {
+	LINK_ENCODER_MASK_SH_LIST_DCN31(_MASK),
+	DPCS_DCN31_MASK_SH_LIST(_MASK)
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
+#define dsc_regsDCN314(id)\
+[id] = {\
+	DSC_REG_LIST_DCN314(id)\
+}
+
+static const struct dcn20_dsc_registers dsc_regs[] = {
+	dsc_regsDCN314(0),
+	dsc_regsDCN314(1),
+	dsc_regsDCN314(2),
+	dsc_regsDCN314(3)
+};
+
+static const struct dcn20_dsc_shift dsc_shift = {
+	DSC_REG_LIST_SH_MASK_DCN314(__SHIFT)
+};
+
+static const struct dcn20_dsc_mask dsc_mask = {
+	DSC_REG_LIST_SH_MASK_DCN314(_MASK)
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
+[id] = {OPTC_COMMON_REG_LIST_DCN3_14(id)}
+
+static const struct dcn_optc_registers optc_regs[] = {
+	optc_regs(0),
+	optc_regs(1),
+	optc_regs(2),
+	optc_regs(3)
+};
+
+static const struct dcn_optc_shift optc_shift = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_14(__SHIFT)
+};
+
+static const struct dcn_optc_mask optc_mask = {
+	OPTC_COMMON_MASK_SH_LIST_DCN3_14(_MASK)
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
+		DCCG_REG_LIST_DCN314()
+};
+
+static const struct dccg_shift dccg_shift = {
+		DCCG_MASK_SH_LIST_DCN314(__SHIFT)
+};
+
+static const struct dccg_mask dccg_mask = {
+		DCCG_MASK_SH_LIST_DCN314(_MASK)
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
+static const struct resource_caps res_cap_dcn314 = {
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
+	.seamless_boot_odm_combine = true
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
+			dcn3_14_ip.det_buffer_size_kbytes,
+			dcn3_14_ip.pixel_chunk_size_kbytes,
+			dcn3_14_ip.config_return_buffer_size_in_kbytes);
+
+
+	for (i = 0; i < res_cap_dcn314.num_vmid; i++) {
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
+	dcn314_timing_generator_init(tgn10);
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
+static struct stream_encoder *dcn314_stream_encoder_create(
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
+	dcn314_dio_stream_encoder_construct(enc1, ctx, ctx->dc_bios,
+					eng_id, vpg, afmt,
+					&stream_enc_regs[eng_id],
+					&se_shift, &se_mask);
+
+	return &enc1->base;
+}
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
+static struct dce_hwseq *dcn314_hwseq_create(
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
+	.create_stream_encoder = dcn314_stream_encoder_create,
+	.create_hpo_dp_stream_encoder = dcn31_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn31_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn314_hwseq_create,
+};
+
+static const struct resource_create_funcs res_create_maximus_funcs = {
+	.read_dce_straps = NULL,
+	.create_audio = NULL,
+	.create_stream_encoder = NULL,
+	.create_hpo_dp_stream_encoder = dcn31_hpo_dp_stream_encoder_create,
+	.create_hpo_dp_link_encoder = dcn31_hpo_dp_link_encoder_create,
+	.create_hwseq = dcn314_hwseq_create,
+};
+
+static void dcn314_resource_destruct(struct dcn314_resource_pool *pool)
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
+		if (pool->base.irqs != NULL)
+			dal_irq_service_destroy(&pool->base.irqs);
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
+static struct display_stream_compressor *dcn314_dsc_create(
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
+static void dcn314_destroy_resource_pool(struct resource_pool **pool)
+{
+	struct dcn314_resource_pool *dcn314_pool = TO_DCN314_RES_POOL(*pool);
+
+	dcn314_resource_destruct(dcn314_pool);
+	kfree(dcn314_pool);
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
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static bool is_dual_plane(enum surface_pixel_format format)
+{
+	return format >= SURFACE_PIXEL_FORMAT_VIDEO_BEGIN || format == SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA;
+}
+
+static int dcn314_populate_dml_pipes_from_context(
+	struct dc *dc, struct dc_state *context,
+	display_e2e_pipe_params_st *pipes,
+	bool fast_validate)
+{
+	int i, pipe_cnt;
+	struct resource_context *res_ctx = &context->res_ctx;
+	struct pipe_ctx *pipe;
+	bool upscaled = false;
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
+		if (dc_extended_blank_supported(dc) && pipe->stream->adjust.v_total_max == pipe->stream->adjust.v_total_min
+			&& pipe->stream->adjust.v_total_min > timing->v_total)
+			pipes[pipe_cnt].pipe.dest.vtotal = pipe->stream->adjust.v_total_min;
+
+		if (pipe->plane_state &&
+				(pipe->plane_state->src_rect.height < pipe->plane_state->dst_rect.height ||
+				pipe->plane_state->src_rect.width < pipe->plane_state->dst_rect.width))
+			upscaled = true;
+
+		/*
+		 * Immediate flip can be set dynamically after enabling the plane.
+		 * We need to require support for immediate flip or underflow can be
+		 * intermittently experienced depending on peak b/w requirements.
+		 */
+		pipes[pipe_cnt].pipe.src.immediate_flip = true;
+
+		pipes[pipe_cnt].pipe.src.unbounded_req_mode = false;
+		pipes[pipe_cnt].pipe.src.hostvm = dc->res_pool->hubbub->riommu_active;
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
+	context->bw_ctx.dml.ip.det_buffer_size_kbytes = DCN3_14_DEFAULT_DET_SIZE;
+
+	dc->config.enable_4to1MPC = false;
+	if (pipe_cnt == 1 && pipe->plane_state && !dc->debug.disable_z9_mpc) {
+		if (is_dual_plane(pipe->plane_state->format)
+				&& pipe->plane_state->src_rect.width <= 1920 && pipe->plane_state->src_rect.height <= 1080) {
+			dc->config.enable_4to1MPC = true;
+		} else if (!is_dual_plane(pipe->plane_state->format) && pipe->plane_state->src_rect.width <= 5120) {
+			/* Limit to 5k max to avoid forced pipe split when there is not enough detile for swath */
+			context->bw_ctx.dml.ip.det_buffer_size_kbytes = 192;
+			pipes[0].pipe.src.unbounded_req_mode = true;
+		}
+	} else if (context->stream_count >= dc->debug.crb_alloc_policy_min_disp_count
+			&& dc->debug.crb_alloc_policy > DET_SIZE_DEFAULT) {
+		context->bw_ctx.dml.ip.det_buffer_size_kbytes = dc->debug.crb_alloc_policy * 64;
+	} else if (context->stream_count >= 3 && upscaled) {
+		context->bw_ctx.dml.ip.det_buffer_size_kbytes = 192;
+	}
+
+	for (i = 0; i < dc->res_pool->pipe_count; i++) {
+		struct pipe_ctx *pipe = &context->res_ctx.pipe_ctx[i];
+
+		if (!pipe->stream)
+			continue;
+
+		if (pipe->stream->signal == SIGNAL_TYPE_EDP && dc->debug.seamless_boot_odm_combine &&
+				pipe->stream->apply_seamless_boot_optimization) {
+
+			if (pipe->stream->apply_boot_odm_mode == dm_odm_combine_policy_2to1) {
+				context->bw_ctx.dml.vba.ODMCombinePolicy = dm_odm_combine_policy_2to1;
+				break;
+			}
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
+static void dcn314_update_bw_bounding_box(struct dc *dc, struct clk_bw_params *bw_params)
+{
+	struct clk_limit_table *clk_table = &bw_params->clk_table;
+	struct _vcs_dpi_voltage_scaling_st *clock_tmp = dcn3_14_soc._clock_tmp;
+	unsigned int i, closest_clk_lvl;
+	int max_dispclk_mhz = 0, max_dppclk_mhz = 0;
+	int j;
+
+	// Default clock levels are used for diags, which may lead to overclocking.
+	if (!IS_DIAG_DC(dc->ctx->dce_environment)) {
+
+		dcn3_14_ip.max_num_otg = dc->res_pool->res_cap->num_timing_generator;
+		dcn3_14_ip.max_num_dpp = dc->res_pool->pipe_count;
+		dcn3_14_soc.num_chans = bw_params->num_channels;
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
+			for (closest_clk_lvl = 0, j = dcn3_14_soc.num_states - 1; j >= 0; j--) {
+				if ((unsigned int) dcn3_14_soc.clock_limits[j].dcfclk_mhz <= clk_table->entries[i].dcfclk_mhz) {
+					closest_clk_lvl = j;
+					break;
+				}
+			}
+			if (clk_table->num_entries == 1) {
+				/*smu gives one DPM level, let's take the highest one*/
+				closest_clk_lvl = dcn3_14_soc.num_states - 1;
+			}
+
+			clock_tmp[i].state = i;
+
+			/* Clocks dependent on voltage level. */
+			clock_tmp[i].dcfclk_mhz = clk_table->entries[i].dcfclk_mhz;
+			if (clk_table->num_entries == 1 &&
+				clock_tmp[i].dcfclk_mhz < dcn3_14_soc.clock_limits[closest_clk_lvl].dcfclk_mhz) {
+				/*SMU fix not released yet*/
+				clock_tmp[i].dcfclk_mhz = dcn3_14_soc.clock_limits[closest_clk_lvl].dcfclk_mhz;
+			}
+			clock_tmp[i].fabricclk_mhz = clk_table->entries[i].fclk_mhz;
+			clock_tmp[i].socclk_mhz = clk_table->entries[i].socclk_mhz;
+
+			if (clk_table->entries[i].memclk_mhz && clk_table->entries[i].wck_ratio)
+				clock_tmp[i].dram_speed_mts = clk_table->entries[i].memclk_mhz * 2 * clk_table->entries[i].wck_ratio;
+
+			/* Clocks independent of voltage level. */
+			clock_tmp[i].dispclk_mhz = max_dispclk_mhz ? max_dispclk_mhz :
+				dcn3_14_soc.clock_limits[closest_clk_lvl].dispclk_mhz;
+
+			clock_tmp[i].dppclk_mhz = max_dppclk_mhz ? max_dppclk_mhz :
+				dcn3_14_soc.clock_limits[closest_clk_lvl].dppclk_mhz;
+
+			clock_tmp[i].dram_bw_per_chan_gbps = dcn3_14_soc.clock_limits[closest_clk_lvl].dram_bw_per_chan_gbps;
+			clock_tmp[i].dscclk_mhz = dcn3_14_soc.clock_limits[closest_clk_lvl].dscclk_mhz;
+			clock_tmp[i].dtbclk_mhz = dcn3_14_soc.clock_limits[closest_clk_lvl].dtbclk_mhz;
+			clock_tmp[i].phyclk_d18_mhz = dcn3_14_soc.clock_limits[closest_clk_lvl].phyclk_d18_mhz;
+			clock_tmp[i].phyclk_mhz = dcn3_14_soc.clock_limits[closest_clk_lvl].phyclk_mhz;
+		}
+		for (i = 0; i < clk_table->num_entries; i++)
+			dcn3_14_soc.clock_limits[i] = clock_tmp[i];
+		if (clk_table->num_entries)
+			dcn3_14_soc.num_states = clk_table->num_entries;
+	}
+
+	if (max_dispclk_mhz) {
+		dcn3_14_soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
+		dc->dml.soc.dispclk_dppclk_vco_speed_mhz = max_dispclk_mhz * 2;
+	}
+
+	if (!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment))
+		dml_init_instance(&dc->dml, &dcn3_14_soc, &dcn3_14_ip, DML_PROJECT_DCN31);
+	else
+		dml_init_instance(&dc->dml, &dcn3_14_soc, &dcn3_14_ip, DML_PROJECT_DCN31_FPGA);
+}
+
+static struct resource_funcs dcn314_res_pool_funcs = {
+	.destroy = dcn314_destroy_resource_pool,
+	.link_enc_create = dcn31_link_encoder_create,
+	.link_enc_create_minimal = dcn31_link_enc_create_minimal,
+	.link_encs_assign = link_enc_cfg_link_encs_assign,
+	.link_enc_unassign = link_enc_cfg_link_enc_unassign,
+	.panel_cntl_create = dcn31_panel_cntl_create,
+	.validate_bandwidth = dcn31_validate_bandwidth,
+	.calculate_wm_and_dlg = dcn31_calculate_wm_and_dlg,
+	.update_soc_for_wm_a = dcn31_update_soc_for_wm_a,
+	.populate_dml_pipes = dcn314_populate_dml_pipes_from_context,
+	.acquire_idle_pipe_for_layer = dcn20_acquire_idle_pipe_for_layer,
+	.add_stream_to_ctx = dcn30_add_stream_to_ctx,
+	.add_dsc_to_stream_resource = dcn20_add_dsc_to_stream_resource,
+	.remove_stream_from_ctx = dcn20_remove_stream_from_ctx,
+	.populate_dml_writeback_from_context = dcn30_populate_dml_writeback_from_context,
+	.set_mcif_arb_params = dcn30_set_mcif_arb_params,
+	.find_first_free_match_stream_enc_for_link = dcn10_find_first_free_match_stream_enc_for_link,
+	.acquire_post_bldn_3dlut = dcn30_acquire_post_bldn_3dlut,
+	.release_post_bldn_3dlut = dcn30_release_post_bldn_3dlut,
+	.update_bw_bounding_box = dcn314_update_bw_bounding_box,
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
+	if (dcn31_clk_src_construct(clk_src, ctx, bios, id,
+			regs, &cs_shift, &cs_mask)) {
+		clk_src->base.dp_clk_src = dp_clk_src;
+		return &clk_src->base;
+	}
+
+	BREAK_TO_DEBUGGER();
+	return NULL;
+}
+
+static bool dcn314_resource_construct(
+	uint8_t num_virtual_links,
+	struct dc *dc,
+	struct dcn314_resource_pool *pool)
+{
+	int i;
+	struct dc_context *ctx = dc->ctx;
+	struct irq_service_init_data init_data;
+
+	ctx->dc_bios->regs = &bios_regs;
+
+	pool->base.res_cap = &res_cap_dcn314;
+	pool->base.funcs = &dcn314_res_pool_funcs;
+
+	/*************************************************
+	 *  Resource + asic cap harcoding                *
+	 *************************************************/
+	pool->base.underlay_pipe_index = NO_UNDERLAY_PIPE;
+	pool->base.pipe_count = pool->base.res_cap->num_timing_generator;
+	pool->base.mpcc_count = pool->base.res_cap->num_timing_generator;
+	dc->caps.max_downscale_ratio = 600;
+	dc->caps.i2c_speed_in_khz = 100;
+	dc->caps.i2c_speed_in_khz_hdcp = 100;
+	dc->caps.max_cursor_size = 256;
+	dc->caps.min_horizontal_blanking_period = 80;
+	dc->caps.dmdata_alloc_size = 2048;
+	dc->caps.max_slave_planes = 2;
+	dc->caps.max_slave_yuv_planes = 2;
+	dc->caps.max_slave_rgb_planes = 2;
+	dc->caps.post_blend_color_processing = true;
+	dc->caps.force_dp_tps4_for_cp2520 = true;
+	dc->caps.dp_hpo = true;
+	dc->caps.edp_dsc_support = true;
+	dc->caps.extended_aux_timeout_support = true;
+	dc->caps.dmcub_support = true;
+	dc->caps.is_apu = true;
+	dc->caps.seamless_odm = true;
+
+	dc->caps.zstate_support = true;
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
+	else if (dc->ctx->dce_environment == DCE_ENV_FPGA_MAXIMUS)
+		dc->debug = debug_defaults_diags;
+	else
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
+	pool->base.dccg = dccg314_create(ctx, &dccg_regs, &dccg_shift, &dccg_mask);
+	if (pool->base.dccg == NULL) {
+		dm_error("DC: failed to create dccg!\n");
+		BREAK_TO_DEBUGGER();
+		goto create_fail;
+	}
+
+	init_data.ctx = dc->ctx;
+	pool->base.irqs = dal_irq_service_dcn314_create(&init_data);
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
+		pool->base.dscs[i] = dcn314_dsc_create(ctx, i);
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
+	/* DCN314 has 4 DPIA */
+	pool->base.usb4_dpia_count = 4;
+
+	/* Audio, Stream Encoders including HPO and virtual, MPC 3D LUTs */
+	if (!resource_construct(num_virtual_links, dc, &pool->base,
+				(!IS_FPGA_MAXIMUS_DC(dc->ctx->dce_environment) ?
+				 &res_create_funcs : &res_create_maximus_funcs)))
+		goto create_fail;
+
+	/* HW Sequencer and Plane caps */
+	dcn314_hw_sequencer_construct(dc);
+
+	dc->caps.max_planes =  pool->base.pipe_count;
+
+	for (i = 0; i < dc->caps.max_planes; ++i)
+		dc->caps.planes[i] = plane_cap;
+
+	dc->cap_funcs = cap_funcs;
+
+	dc->dcn_ip->max_num_dpp = dcn3_14_ip.max_num_dpp;
+
+	return true;
+
+create_fail:
+
+	dcn314_resource_destruct(pool);
+
+	return false;
+}
+
+struct resource_pool *dcn314_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc)
+{
+	struct dcn314_resource_pool *pool =
+		kzalloc(sizeof(struct dcn314_resource_pool), GFP_KERNEL);
+
+	if (!pool)
+		return NULL;
+
+	if (dcn314_resource_construct(init_data->num_virtual_links, dc, pool))
+		return &pool->base;
+
+	BREAK_TO_DEBUGGER();
+	kfree(pool);
+	return NULL;
+}
diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.h b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.h
new file mode 100644
index 000000000000..c41108847ce0
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.h
@@ -0,0 +1,43 @@
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
+
+#ifndef _DCN314_RESOURCE_H_
+#define _DCN314_RESOURCE_H_
+
+#include "core_types.h"
+
+#define TO_DCN314_RES_POOL(pool)\
+	container_of(pool, struct dcn314_resource_pool, base)
+
+struct dcn314_resource_pool {
+	struct resource_pool base;
+};
+
+struct resource_pool *dcn314_create_resource_pool(
+		const struct dc_init_data *init_data,
+		struct dc *dc);
+
+#endif /* _DCN314_RESOURCE_H_ */
-- 
2.35.3


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E13A416B74
	for <lists+amd-gfx@lfdr.de>; Fri, 24 Sep 2021 08:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76EC6EDE9;
	Fri, 24 Sep 2021 06:11:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F4D6EDE9
 for <amd-gfx@lists.freedesktop.org>; Fri, 24 Sep 2021 06:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfFdXrSvG8X7RYMEkAeQAvUmTlOfcuQUlc9IfV7UJVD/XugDUxX/eBhE1v15n6dcHHTVLc39Cyg9Hq8V1RpaL+YMWVDv23H+s+D0WYPqIkKz7/qOYRIpIcr5Icl3mbhNskze12zlo4V43jB3hsK+9f1pD4z7bv0Z6sICVvJ8qgqXb+ckG7TVqn++FFQ8h+UBPHNjj6wzblIBbPFJQD0vwc48s44uH9fNBZf7JdfR01/n7+CCEIUTZ1EiGgCPwHESvA50qpN2c/sUSNS0KAp/W5XE8VIbUkcCXvMD9ZrlaVBeJyUm1NRHBV8/5O2ACgZZuTMTS/yc0lNseKt7hwkTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=K7TjLuXl9EBU4e0bBUX+cSG0Q625nFKTpNtd7HrBjI4=;
 b=jtwZap+EEQ2HpJXBTZSjEfqEOZTVwys1s52TbUxIomqGpatTEgy7BSnKofo2tOrEpmc+KmI7iRmvvLHiuo7HA/39uBGzVRKpdzqEhgoiLI0GLiMhmJ8N8YxdVKv3iWtf2iP5kRBt9bkQZwY0NXyvA663K09mvSfXOFA2D40pWrOuNc3YDBRRDQi/YB/vo+atp3ZhcnOe1LBP3NO6KuXw9dHDYuaWA5+NCGMywdPPnPGVA7P1FpoIIXM9FoxzsQZXMxyc+uPaF/JCv2FKjNIMBAPDBSQbLSW2XHlWBVPJahLueic7CpDBGSNKPXpLa8qkKthRtIxefVtUaey/KZ4bfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7TjLuXl9EBU4e0bBUX+cSG0Q625nFKTpNtd7HrBjI4=;
 b=JjrH2iCjnxREeXY20G/vqULho5/PY8Q436oHnTr71Mvg6q6buJchZaw5FgcLO7iVDDfMgdQ/RONkcjsDE+mzvRxYqF9SbaiLdKxOBu/PyM8b5RH9tlVa43X0aotV90KOtNJMVteg2eqpPEbKlbyXGZZ7B3hMjxGZ0XRmniDIYD8=
Received: from MWHPR11CA0009.namprd11.prod.outlook.com (2603:10b6:301:1::19)
 by SN1PR12MB2462.namprd12.prod.outlook.com (2603:10b6:802:28::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 06:11:45 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:301:1:cafe::a2) by MWHPR11CA0009.outlook.office365.com
 (2603:10b6:301:1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 06:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 06:11:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 24 Sep
 2021 01:11:44 -0500
Received: from linux-ci-node.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.8 via Frontend
 Transport; Fri, 24 Sep 2021 01:11:37 -0500
From: Qingqing Zhuo <Qingqing.Zhuo@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Anson Jacob <Anson.Jacob@amd.com>, 
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Hersen Wu
 <hersenxs.wu@amd.com>, Harry Wentland <harry.wentland@amd.com>, "Rodrigo
 Siqueira" <Rodrigo.Siqueira@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>
Subject: [PATCH v3] drm/amd/display: move FPU associated DSC code to DML folder
Date: Fri, 24 Sep 2021 14:10:28 +0800
Message-ID: <20210924061028.1099459-1-Qingqing.Zhuo@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd82a204-8c6f-4bfc-6871-08d97f222f85
X-MS-TrafficTypeDiagnostic: SN1PR12MB2462:
X-Microsoft-Antispam-PRVS: <SN1PR12MB246261522AB40F4680464427FBA49@SN1PR12MB2462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dIXFECvFjF9+N0V2LEHQmskHSI+ZXTiwavIZwYA+CPVAurlWKROmirmIudeVz36Hdk9ZXdtYGULihtsoBk0qqO1rnh2YKqbQF3izpj6foN8xX5ArBpo+t1z5OT0WKymvf8m+vgkG09S2cFGxXaUoTrAQkwEHoruWPSZlv0wlH+DMMW70NAZ0VN2hXOVBQmItWjxi3vjU5EEW2MqxKr4FC6GsslprOH29X/8icXVzJtFKhAmC72yKKNO4cDKayhOmmI0Hxm+UgFPVCgS3J/PsGhcjrKsaRTsY4pTuY5XJElMcGIukeLdDWi8b8fzQXj77tMOB7NB7oAXrZvvW/FZPONIXBKaU7mELYKoZu7zz3pcXbcc3QEbOsG2RtMK21ql+xrkrZfXgcI5N3OqqQqYXrXkHtSEJFS0WD5HGohEtmzC9otflT33Lkt5zDA8AKK8U1EDn2Qi4oj9F2xZYeADlwGMFqsoMNppemCIdnQDWuXkxZplueSrWHdYNpKzWejYIBA8b+e942LOfwbbXYPetGzuT8d5YkyXRp47T9DEqzCzONO81Qcm4YL4ekmNM6lVZigAZRJVUK410Dl7kAaH8nbA8uNCNWboNuKmxDhS4x1n4dvtzHrjNthoYtreZOI7QHK3gDGxbhkG0XCbwWHzQY6TFAyV93ZGeUY0IolIeMG7RazXRs4QOH65SjnRzswbYSoFfprAUUHrQz1Dn2//Iu/L23mtQw6/WIF1AtM0JZArOnkIZM0XdghlFPAPn3KXtafY1QA9zG+F48+cenHIbbA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(316002)(70586007)(7696005)(36860700001)(2616005)(426003)(70206006)(966005)(6666004)(508600001)(83380400001)(30864003)(54906003)(8676002)(1076003)(47076005)(26005)(86362001)(82310400003)(356005)(5660300002)(186003)(81166007)(36756003)(66574015)(6916009)(336012)(4326008)(8936002)(2906002)(461764006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 06:11:45.0874 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd82a204-8c6f-4bfc-6871-08d97f222f85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2462
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

As part of the FPU isolation work documented in
https://patchwork.freedesktop.org/series/93042/, isolate
code that uses FPU in DSC to DML, where all FPU code
should locate.

This change does not refactor any fuctions but move code
around.

v2: remove more floating point related flags in dml/Makefile

v3: fix messed up diff.

Cc: Anson Jacob <Anson.Jacob@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Hersen Wu <hersenxs.wu@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Qingqing Zhuo <qingqing.zhuo@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml/Makefile   |   3 +
 .../amd/display/dc/{ => dml}/dsc/qp_tables.h  |   0
 .../drm/amd/display/dc/dml/dsc/rc_calc_fpu.c  | 287 ++++++++++++++++++
 .../drm/amd/display/dc/dml/dsc/rc_calc_fpu.h  |  89 ++++++
 drivers/gpu/drm/amd/display/dc/dsc/Makefile   |  29 --
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c  | 257 ----------------
 drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h  |  50 +--
 .../gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c  |   1 -
 8 files changed, 380 insertions(+), 336 deletions(-)
 rename drivers/gpu/drm/amd/display/dc/{ => dml}/dsc/qp_tables.h (100%)
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
 create mode 100644 drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h

diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 56055df2e8d2..9009b92490f3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -70,6 +70,7 @@ CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_mode_vba_30.o := $(dml_ccflags) $(fram
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_ccflags) $(frame_warn_flag)
 CFLAGS_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_ccflags)
+CFLAGS_$(AMDDALPATH)/dc/dml/dsc/rc_calc_fpu.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_ccflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_vba.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn2x/dcn2x.o := $(dml_rcflags)
@@ -84,6 +85,7 @@ CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn30/display_rq_dlg_calc_30.o := $(dml_rcfla
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/display_mode_vba_31.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dcn31/display_rq_dlg_calc_31.o := $(dml_rcflags)
 CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/display_mode_lib.o := $(dml_rcflags)
+CFLAGS_REMOVE_$(AMDDALPATH)/dc/dml/dsc/rc_calc_fpu.o  := $(dml_rcflags)
 endif
 CFLAGS_$(AMDDALPATH)/dc/dml/dml1_display_rq_dlg_calc.o := $(dml_ccflags)
 CFLAGS_$(AMDDALPATH)/dc/dml/display_rq_dlg_helpers.o := $(dml_ccflags)
@@ -99,6 +101,7 @@ DML += dcn20/display_rq_dlg_calc_20v2.o dcn20/display_mode_vba_20v2.o
 DML += dcn21/display_rq_dlg_calc_21.o dcn21/display_mode_vba_21.o
 DML += dcn30/display_mode_vba_30.o dcn30/display_rq_dlg_calc_30.o
 DML += dcn31/display_mode_vba_31.o dcn31/display_rq_dlg_calc_31.o
+DML += dsc/rc_calc_fpu.o
 endif
 
 AMD_DAL_DML = $(addprefix $(AMDDALPATH)/dc/dml/,$(DML))
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/qp_tables.h b/drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
similarity index 100%
rename from drivers/gpu/drm/amd/display/dc/dsc/qp_tables.h
rename to drivers/gpu/drm/amd/display/dc/dml/dsc/qp_tables.h
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
new file mode 100644
index 000000000000..0436fc64948f
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c
@@ -0,0 +1,287 @@
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
+#include "rc_calc_fpu.h"
+
+#include "qp_tables.h"
+#include "amdgpu_dm/dc_fpu.h"
+
+#define table_hash(mode, bpc, max_min) ((mode << 16) | (bpc << 8) | max_min)
+
+#define MODE_SELECT(val444, val422, val420) \
+	(cm == CM_444 || cm == CM_RGB) ? (val444) : (cm == CM_422 ? (val422) : (val420))
+
+
+#define TABLE_CASE(mode, bpc, max)   case (table_hash(mode, BPC_##bpc, max)): \
+	table = qp_table_##mode##_##bpc##bpc_##max; \
+	table_size = sizeof(qp_table_##mode##_##bpc##bpc_##max)/sizeof(*qp_table_##mode##_##bpc##bpc_##max); \
+	break
+
+static int median3(int a, int b, int c)
+{
+	if (a > b)
+		swap(a, b);
+	if (b > c)
+		swap(b, c);
+	if (a > b)
+		swap(b, c);
+
+	return b;
+}
+
+static double dsc_roundf(double num)
+{
+	if (num < 0.0)
+		num = num - 0.5;
+	else
+		num = num + 0.5;
+
+	return (int)(num);
+}
+
+static double dsc_ceil(double num)
+{
+	double retval = (int)num;
+
+	if (retval != num && num > 0)
+		retval = num + 1;
+
+	return (int)retval;
+}
+
+static void get_qp_set(qp_set qps, enum colour_mode cm, enum bits_per_comp bpc,
+		       enum max_min max_min, float bpp)
+{
+	int mode = MODE_SELECT(444, 422, 420);
+	int sel = table_hash(mode, bpc, max_min);
+	int table_size = 0;
+	int index;
+	const struct qp_entry *table = 0L;
+
+	// alias enum
+	enum { min = DAL_MM_MIN, max = DAL_MM_MAX };
+	switch (sel) {
+		TABLE_CASE(444,  8, max);
+		TABLE_CASE(444,  8, min);
+		TABLE_CASE(444, 10, max);
+		TABLE_CASE(444, 10, min);
+		TABLE_CASE(444, 12, max);
+		TABLE_CASE(444, 12, min);
+		TABLE_CASE(422,  8, max);
+		TABLE_CASE(422,  8, min);
+		TABLE_CASE(422, 10, max);
+		TABLE_CASE(422, 10, min);
+		TABLE_CASE(422, 12, max);
+		TABLE_CASE(422, 12, min);
+		TABLE_CASE(420,  8, max);
+		TABLE_CASE(420,  8, min);
+		TABLE_CASE(420, 10, max);
+		TABLE_CASE(420, 10, min);
+		TABLE_CASE(420, 12, max);
+		TABLE_CASE(420, 12, min);
+	}
+
+	if (table == 0)
+		return;
+
+	index = (bpp - table[0].bpp) * 2;
+
+	/* requested size is bigger than the table */
+	if (index >= table_size) {
+		dm_error("ERROR: Requested rc_calc to find a bpp entry that exceeds the table size\n");
+		return;
+	}
+
+	memcpy(qps, table[index].qps, sizeof(qp_set));
+}
+
+static void get_ofs_set(qp_set ofs, enum colour_mode mode, float bpp)
+{
+	int   *p = ofs;
+
+	if (mode == CM_444 || mode == CM_RGB) {
+		*p++ = (bpp <=  6) ? (0) : ((((bpp >=  8) && (bpp <= 12))) ? (2) : ((bpp >= 15) ? (10) : ((((bpp > 6) && (bpp < 8))) ? (0 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (2 + dsc_roundf((bpp - 12) * (8 / 3.0))))));
+		*p++ = (bpp <=  6) ? (-2) : ((((bpp >=  8) && (bpp <= 12))) ? (0) : ((bpp >= 15) ? (8) : ((((bpp > 6) && (bpp < 8))) ? (-2 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (0 + dsc_roundf((bpp - 12) * (8 / 3.0))))));
+		*p++ = (bpp <=  6) ? (-2) : ((((bpp >=  8) && (bpp <= 12))) ? (0) : ((bpp >= 15) ? (6) : ((((bpp > 6) && (bpp < 8))) ? (-2 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (0 + dsc_roundf((bpp - 12) * (6 / 3.0))))));
+		*p++ = (bpp <=  6) ? (-4) : ((((bpp >=  8) && (bpp <= 12))) ? (-2) : ((bpp >= 15) ? (4) : ((((bpp > 6) && (bpp < 8))) ? (-4 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (-2 + dsc_roundf((bpp - 12) * (6 / 3.0))))));
+		*p++ = (bpp <=  6) ? (-6) : ((((bpp >=  8) && (bpp <= 12))) ? (-4) : ((bpp >= 15) ? (2) : ((((bpp > 6) && (bpp < 8))) ? (-6 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (-4 + dsc_roundf((bpp - 12) * (6 / 3.0))))));
+		*p++ = (bpp <= 12) ? (-6) : ((bpp >= 15) ? (0) : (-6 + dsc_roundf((bpp - 12) * (6 / 3.0))));
+		*p++ = (bpp <= 12) ? (-8) : ((bpp >= 15) ? (-2) : (-8 + dsc_roundf((bpp - 12) * (6 / 3.0))));
+		*p++ = (bpp <= 12) ? (-8) : ((bpp >= 15) ? (-4) : (-8 + dsc_roundf((bpp - 12) * (4 / 3.0))));
+		*p++ = (bpp <= 12) ? (-8) : ((bpp >= 15) ? (-6) : (-8 + dsc_roundf((bpp - 12) * (2 / 3.0))));
+		*p++ = (bpp <= 12) ? (-10) : ((bpp >= 15) ? (-8) : (-10 + dsc_roundf((bpp - 12) * (2 / 3.0))));
+		*p++ = -10;
+		*p++ = (bpp <=  6) ? (-12) : ((bpp >=  8) ? (-10) : (-12 + dsc_roundf((bpp -  6) * (2 / 2.0))));
+		*p++ = -12;
+		*p++ = -12;
+		*p++ = -12;
+	} else if (mode == CM_422) {
+		*p++ = (bpp <=  8) ? (2) : ((bpp >= 10) ? (10) : (2 + dsc_roundf((bpp -  8) * (8 / 2.0))));
+		*p++ = (bpp <=  8) ? (0) : ((bpp >= 10) ? (8) : (0 + dsc_roundf((bpp -  8) * (8 / 2.0))));
+		*p++ = (bpp <=  8) ? (0) : ((bpp >= 10) ? (6) : (0 + dsc_roundf((bpp -  8) * (6 / 2.0))));
+		*p++ = (bpp <=  8) ? (-2) : ((bpp >= 10) ? (4) : (-2 + dsc_roundf((bpp -  8) * (6 / 2.0))));
+		*p++ = (bpp <=  8) ? (-4) : ((bpp >= 10) ? (2) : (-4 + dsc_roundf((bpp -  8) * (6 / 2.0))));
+		*p++ = (bpp <=  8) ? (-6) : ((bpp >= 10) ? (0) : (-6 + dsc_roundf((bpp -  8) * (6 / 2.0))));
+		*p++ = (bpp <=  8) ? (-8) : ((bpp >= 10) ? (-2) : (-8 + dsc_roundf((bpp -  8) * (6 / 2.0))));
+		*p++ = (bpp <=  8) ? (-8) : ((bpp >= 10) ? (-4) : (-8 + dsc_roundf((bpp -  8) * (4 / 2.0))));
+		*p++ = (bpp <=  8) ? (-8) : ((bpp >= 10) ? (-6) : (-8 + dsc_roundf((bpp -  8) * (2 / 2.0))));
+		*p++ = (bpp <=  8) ? (-10) : ((bpp >= 10) ? (-8) : (-10 + dsc_roundf((bpp -  8) * (2 / 2.0))));
+		*p++ = -10;
+		*p++ = (bpp <=  6) ? (-12) : ((bpp >= 7) ? (-10) : (-12 + dsc_roundf((bpp -  6) * (2.0 / 1))));
+		*p++ = -12;
+		*p++ = -12;
+		*p++ = -12;
+	} else {
+		*p++ = (bpp <=  6) ? (2) : ((bpp >=  8) ? (10) : (2 + dsc_roundf((bpp -  6) * (8 / 2.0))));
+		*p++ = (bpp <=  6) ? (0) : ((bpp >=  8) ? (8) : (0 + dsc_roundf((bpp -  6) * (8 / 2.0))));
+		*p++ = (bpp <=  6) ? (0) : ((bpp >=  8) ? (6) : (0 + dsc_roundf((bpp -  6) * (6 / 2.0))));
+		*p++ = (bpp <=  6) ? (-2) : ((bpp >=  8) ? (4) : (-2 + dsc_roundf((bpp -  6) * (6 / 2.0))));
+		*p++ = (bpp <=  6) ? (-4) : ((bpp >=  8) ? (2) : (-4 + dsc_roundf((bpp -  6) * (6 / 2.0))));
+		*p++ = (bpp <=  6) ? (-6) : ((bpp >=  8) ? (0) : (-6 + dsc_roundf((bpp -  6) * (6 / 2.0))));
+		*p++ = (bpp <=  6) ? (-8) : ((bpp >=  8) ? (-2) : (-8 + dsc_roundf((bpp -  6) * (6 / 2.0))));
+		*p++ = (bpp <=  6) ? (-8) : ((bpp >=  8) ? (-4) : (-8 + dsc_roundf((bpp -  6) * (4 / 2.0))));
+		*p++ = (bpp <=  6) ? (-8) : ((bpp >=  8) ? (-6) : (-8 + dsc_roundf((bpp -  6) * (2 / 2.0))));
+		*p++ = (bpp <=  6) ? (-10) : ((bpp >=  8) ? (-8) : (-10 + dsc_roundf((bpp -  6) * (2 / 2.0))));
+		*p++ = -10;
+		*p++ = (bpp <=  4) ? (-12) : ((bpp >=  5) ? (-10) : (-12 + dsc_roundf((bpp -  4) * (2 / 1.0))));
+		*p++ = -12;
+		*p++ = -12;
+		*p++ = -12;
+	}
+}
+
+void _do_calc_rc_params(struct rc_params *rc, enum colour_mode cm,
+			       enum bits_per_comp bpc, u16 drm_bpp,
+			       bool is_navite_422_or_420,
+			       int slice_width, int slice_height,
+			       int minor_version)
+{
+	float bpp;
+	float bpp_group;
+	float initial_xmit_delay_factor;
+	int padding_pixels;
+	int i;
+
+	dc_assert_fp_enabled();
+
+	bpp = ((float)drm_bpp / 16.0);
+	/* in native_422 or native_420 modes, the bits_per_pixel is double the
+	 * target bpp (the latter is what calc_rc_params expects)
+	 */
+	if (is_navite_422_or_420)
+		bpp /= 2.0;
+
+	rc->rc_quant_incr_limit0 = ((bpc == BPC_8) ? 11 : (bpc == BPC_10 ? 15 : 19)) - ((minor_version == 1 && cm == CM_444) ? 1 : 0);
+	rc->rc_quant_incr_limit1 = ((bpc == BPC_8) ? 11 : (bpc == BPC_10 ? 15 : 19)) - ((minor_version == 1 && cm == CM_444) ? 1 : 0);
+
+	bpp_group = MODE_SELECT(bpp, bpp * 2.0, bpp * 2.0);
+
+	switch (cm) {
+	case CM_420:
+		rc->initial_fullness_offset = (bpp >=  6) ? (2048) : ((bpp <=  4) ? (6144) : ((((bpp >  4) && (bpp <=  5))) ? (6144 - dsc_roundf((bpp - 4) * (512))) : (5632 - dsc_roundf((bpp -  5) * (3584)))));
+		rc->first_line_bpg_offset   = median3(0, (12 + (int) (0.09 *  min(34, slice_height - 8))), (int)((3 * bpc * 3) - (3 * bpp_group)));
+		rc->second_line_bpg_offset  = median3(0, 12, (int)((3 * bpc * 3) - (3 * bpp_group)));
+		break;
+	case CM_422:
+		rc->initial_fullness_offset = (bpp >=  8) ? (2048) : ((bpp <=  7) ? (5632) : (5632 - dsc_roundf((bpp - 7) * (3584))));
+		rc->first_line_bpg_offset   = median3(0, (12 + (int) (0.09 *  min(34, slice_height - 8))), (int)((3 * bpc * 4) - (3 * bpp_group)));
+		rc->second_line_bpg_offset  = 0;
+		break;
+	case CM_444:
+	case CM_RGB:
+		rc->initial_fullness_offset = (bpp >= 12) ? (2048) : ((bpp <=  8) ? (6144) : ((((bpp >  8) && (bpp <= 10))) ? (6144 - dsc_roundf((bpp - 8) * (512 / 2))) : (5632 - dsc_roundf((bpp - 10) * (3584 / 2)))));
+		rc->first_line_bpg_offset   = median3(0, (12 + (int) (0.09 *  min(34, slice_height - 8))), (int)(((3 * bpc + (cm == CM_444 ? 0 : 2)) * 3) - (3 * bpp_group)));
+		rc->second_line_bpg_offset  = 0;
+		break;
+	}
+
+	initial_xmit_delay_factor = (cm == CM_444 || cm == CM_RGB) ? 1.0 : 2.0;
+	rc->initial_xmit_delay = dsc_roundf(8192.0/2.0/bpp/initial_xmit_delay_factor);
+
+	if (cm == CM_422 || cm == CM_420)
+		slice_width /= 2;
+
+	padding_pixels = ((slice_width % 3) != 0) ? (3 - (slice_width % 3)) * (rc->initial_xmit_delay / slice_width) : 0;
+	if (3 * bpp_group >= (((rc->initial_xmit_delay + 2) / 3) * (3 + (cm == CM_422)))) {
+		if ((rc->initial_xmit_delay + padding_pixels) % 3 == 1)
+			rc->initial_xmit_delay++;
+	}
+
+	rc->flatness_min_qp     = ((bpc == BPC_8) ?  (3) : ((bpc == BPC_10) ? (7)  : (11))) - ((minor_version == 1 && cm == CM_444) ? 1 : 0);
+	rc->flatness_max_qp     = ((bpc == BPC_8) ? (12) : ((bpc == BPC_10) ? (16) : (20))) - ((minor_version == 1 && cm == CM_444) ? 1 : 0);
+	rc->flatness_det_thresh = 2 << (bpc - 8);
+
+	get_qp_set(rc->qp_min, cm, bpc, DAL_MM_MIN, bpp);
+	get_qp_set(rc->qp_max, cm, bpc, DAL_MM_MAX, bpp);
+	if (cm == CM_444 && minor_version == 1) {
+		for (i = 0; i < QP_SET_SIZE; ++i) {
+			rc->qp_min[i] = rc->qp_min[i] > 0 ? rc->qp_min[i] - 1 : 0;
+			rc->qp_max[i] = rc->qp_max[i] > 0 ? rc->qp_max[i] - 1 : 0;
+		}
+	}
+	get_ofs_set(rc->ofs, cm, bpp);
+
+	/* fixed parameters */
+	rc->rc_model_size    = 8192;
+	rc->rc_edge_factor   = 6;
+	rc->rc_tgt_offset_hi = 3;
+	rc->rc_tgt_offset_lo = 3;
+
+	rc->rc_buf_thresh[0] = 896;
+	rc->rc_buf_thresh[1] = 1792;
+	rc->rc_buf_thresh[2] = 2688;
+	rc->rc_buf_thresh[3] = 3584;
+	rc->rc_buf_thresh[4] = 4480;
+	rc->rc_buf_thresh[5] = 5376;
+	rc->rc_buf_thresh[6] = 6272;
+	rc->rc_buf_thresh[7] = 6720;
+	rc->rc_buf_thresh[8] = 7168;
+	rc->rc_buf_thresh[9] = 7616;
+	rc->rc_buf_thresh[10] = 7744;
+	rc->rc_buf_thresh[11] = 7872;
+	rc->rc_buf_thresh[12] = 8000;
+	rc->rc_buf_thresh[13] = 8064;
+}
+
+u32 _do_bytes_per_pixel_calc(int slice_width, u16 drm_bpp,
+				    bool is_navite_422_or_420)
+{
+	float bpp;
+	u32 bytes_per_pixel;
+	double d_bytes_per_pixel;
+
+	dc_assert_fp_enabled();
+
+	bpp = ((float)drm_bpp / 16.0);
+	d_bytes_per_pixel = dsc_ceil(bpp * slice_width / 8.0) / slice_width;
+	// TODO: Make sure the formula for calculating this is precise (ceiling
+	// vs. floor, and at what point they should be applied)
+	if (is_navite_422_or_420)
+		d_bytes_per_pixel /= 2;
+
+	bytes_per_pixel = (u32)dsc_ceil(d_bytes_per_pixel * 0x10000000);
+
+	return bytes_per_pixel;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h
new file mode 100644
index 000000000000..d3900ff7fa89
--- /dev/null
+++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h
@@ -0,0 +1,89 @@
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
+#ifndef __RC_CALC_FPU_H__
+#define __RC_CALC_FPU_H__
+
+#include "os_types.h"
+
+#define QP_SET_SIZE 15
+
+typedef int qp_set[QP_SET_SIZE];
+
+struct rc_params {
+	int      rc_quant_incr_limit0;
+	int      rc_quant_incr_limit1;
+	int      initial_fullness_offset;
+	int      initial_xmit_delay;
+	int      first_line_bpg_offset;
+	int      second_line_bpg_offset;
+	int      flatness_min_qp;
+	int      flatness_max_qp;
+	int      flatness_det_thresh;
+	qp_set   qp_min;
+	qp_set   qp_max;
+	qp_set   ofs;
+	int      rc_model_size;
+	int      rc_edge_factor;
+	int      rc_tgt_offset_hi;
+	int      rc_tgt_offset_lo;
+	int      rc_buf_thresh[QP_SET_SIZE - 1];
+};
+
+enum colour_mode {
+	CM_RGB,   /* 444 RGB */
+	CM_444,   /* 444 YUV or simple 422 */
+	CM_422,   /* native 422 */
+	CM_420    /* native 420 */
+};
+
+enum bits_per_comp {
+	BPC_8  =  8,
+	BPC_10 = 10,
+	BPC_12 = 12
+};
+
+enum max_min {
+	DAL_MM_MIN = 0,
+	DAL_MM_MAX = 1
+};
+
+struct qp_entry {
+	float         bpp;
+	const qp_set  qps;
+};
+
+typedef struct qp_entry qp_table[];
+
+u32 _do_bytes_per_pixel_calc(int slice_width, u16 drm_bpp,
+				    bool is_navite_422_or_420);
+
+void _do_calc_rc_params(struct rc_params *rc, enum colour_mode cm,
+			       enum bits_per_comp bpc, u16 drm_bpp,
+			       bool is_navite_422_or_420,
+			       int slice_width, int slice_height,
+			       int minor_version);
+
+#endif
\ No newline at end of file
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/Makefile b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
index 8d31eb75c6a6..a2537229ee88 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dsc/Makefile
@@ -1,35 +1,6 @@
 # SPDX-License-Identifier: MIT
 #
 # Makefile for the 'dsc' sub-component of DAL.
-
-ifdef CONFIG_X86
-dsc_ccflags := -mhard-float -msse
-endif
-
-ifdef CONFIG_PPC64
-dsc_ccflags := -mhard-float -maltivec
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
-IS_OLD_GCC = 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-dsc_ccflags += -mpreferred-stack-boundary=4
-else
-dsc_ccflags += -msse2
-endif
-endif
-
-CFLAGS_$(AMDDALPATH)/dc/dsc/rc_calc.o := $(dsc_ccflags)
-CFLAGS_REMOVE_$(AMDDALPATH)/dc/dsc/rc_calc.o := $(dsc_rcflags)
-
 DSC = dc_dsc.o rc_calc.o rc_calc_dpi.o
 
 AMD_DAL_DSC = $(addprefix $(AMDDALPATH)/dc/dsc/,$(DSC))
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c b/drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c
index 7b294f637881..87acec33b8d8 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/rc_calc.c
@@ -25,264 +25,7 @@
  */
 #include <drm/drm_dsc.h>
 
-#include "os_types.h"
 #include "rc_calc.h"
-#include "qp_tables.h"
-
-#define table_hash(mode, bpc, max_min) ((mode << 16) | (bpc << 8) | max_min)
-
-#define MODE_SELECT(val444, val422, val420) \
-	(cm == CM_444 || cm == CM_RGB) ? (val444) : (cm == CM_422 ? (val422) : (val420))
-
-
-#define TABLE_CASE(mode, bpc, max)   case (table_hash(mode, BPC_##bpc, max)): \
-	table = qp_table_##mode##_##bpc##bpc_##max; \
-	table_size = sizeof(qp_table_##mode##_##bpc##bpc_##max)/sizeof(*qp_table_##mode##_##bpc##bpc_##max); \
-	break
-
-
-static void get_qp_set(qp_set qps, enum colour_mode cm, enum bits_per_comp bpc,
-		       enum max_min max_min, float bpp)
-{
-	int mode = MODE_SELECT(444, 422, 420);
-	int sel = table_hash(mode, bpc, max_min);
-	int table_size = 0;
-	int index;
-	const struct qp_entry *table = 0L;
-
-	// alias enum
-	enum { min = DAL_MM_MIN, max = DAL_MM_MAX };
-	switch (sel) {
-		TABLE_CASE(444,  8, max);
-		TABLE_CASE(444,  8, min);
-		TABLE_CASE(444, 10, max);
-		TABLE_CASE(444, 10, min);
-		TABLE_CASE(444, 12, max);
-		TABLE_CASE(444, 12, min);
-		TABLE_CASE(422,  8, max);
-		TABLE_CASE(422,  8, min);
-		TABLE_CASE(422, 10, max);
-		TABLE_CASE(422, 10, min);
-		TABLE_CASE(422, 12, max);
-		TABLE_CASE(422, 12, min);
-		TABLE_CASE(420,  8, max);
-		TABLE_CASE(420,  8, min);
-		TABLE_CASE(420, 10, max);
-		TABLE_CASE(420, 10, min);
-		TABLE_CASE(420, 12, max);
-		TABLE_CASE(420, 12, min);
-	}
-
-	if (table == 0)
-		return;
-
-	index = (bpp - table[0].bpp) * 2;
-
-	/* requested size is bigger than the table */
-	if (index >= table_size) {
-		dm_error("ERROR: Requested rc_calc to find a bpp entry that exceeds the table size\n");
-		return;
-	}
-
-	memcpy(qps, table[index].qps, sizeof(qp_set));
-}
-
-static double dsc_roundf(double num)
-{
-	if (num < 0.0)
-		num = num - 0.5;
-	else
-		num = num + 0.5;
-
-	return (int)(num);
-}
-
-static double dsc_ceil(double num)
-{
-	double retval = (int)num;
-
-	if (retval != num && num > 0)
-		retval = num + 1;
-
-	return (int)retval;
-}
-
-static void get_ofs_set(qp_set ofs, enum colour_mode mode, float bpp)
-{
-	int   *p = ofs;
-
-	if (mode == CM_444 || mode == CM_RGB) {
-		*p++ = (bpp <=  6) ? (0) : ((((bpp >=  8) && (bpp <= 12))) ? (2) : ((bpp >= 15) ? (10) : ((((bpp > 6) && (bpp < 8))) ? (0 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (2 + dsc_roundf((bpp - 12) * (8 / 3.0))))));
-		*p++ = (bpp <=  6) ? (-2) : ((((bpp >=  8) && (bpp <= 12))) ? (0) : ((bpp >= 15) ? (8) : ((((bpp > 6) && (bpp < 8))) ? (-2 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (0 + dsc_roundf((bpp - 12) * (8 / 3.0))))));
-		*p++ = (bpp <=  6) ? (-2) : ((((bpp >=  8) && (bpp <= 12))) ? (0) : ((bpp >= 15) ? (6) : ((((bpp > 6) && (bpp < 8))) ? (-2 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (0 + dsc_roundf((bpp - 12) * (6 / 3.0))))));
-		*p++ = (bpp <=  6) ? (-4) : ((((bpp >=  8) && (bpp <= 12))) ? (-2) : ((bpp >= 15) ? (4) : ((((bpp > 6) && (bpp < 8))) ? (-4 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (-2 + dsc_roundf((bpp - 12) * (6 / 3.0))))));
-		*p++ = (bpp <=  6) ? (-6) : ((((bpp >=  8) && (bpp <= 12))) ? (-4) : ((bpp >= 15) ? (2) : ((((bpp > 6) && (bpp < 8))) ? (-6 + dsc_roundf((bpp -  6) * (2 / 2.0))) : (-4 + dsc_roundf((bpp - 12) * (6 / 3.0))))));
-		*p++ = (bpp <= 12) ? (-6) : ((bpp >= 15) ? (0) : (-6 + dsc_roundf((bpp - 12) * (6 / 3.0))));
-		*p++ = (bpp <= 12) ? (-8) : ((bpp >= 15) ? (-2) : (-8 + dsc_roundf((bpp - 12) * (6 / 3.0))));
-		*p++ = (bpp <= 12) ? (-8) : ((bpp >= 15) ? (-4) : (-8 + dsc_roundf((bpp - 12) * (4 / 3.0))));
-		*p++ = (bpp <= 12) ? (-8) : ((bpp >= 15) ? (-6) : (-8 + dsc_roundf((bpp - 12) * (2 / 3.0))));
-		*p++ = (bpp <= 12) ? (-10) : ((bpp >= 15) ? (-8) : (-10 + dsc_roundf((bpp - 12) * (2 / 3.0))));
-		*p++ = -10;
-		*p++ = (bpp <=  6) ? (-12) : ((bpp >=  8) ? (-10) : (-12 + dsc_roundf((bpp -  6) * (2 / 2.0))));
-		*p++ = -12;
-		*p++ = -12;
-		*p++ = -12;
-	} else if (mode == CM_422) {
-		*p++ = (bpp <=  8) ? (2) : ((bpp >= 10) ? (10) : (2 + dsc_roundf((bpp -  8) * (8 / 2.0))));
-		*p++ = (bpp <=  8) ? (0) : ((bpp >= 10) ? (8) : (0 + dsc_roundf((bpp -  8) * (8 / 2.0))));
-		*p++ = (bpp <=  8) ? (0) : ((bpp >= 10) ? (6) : (0 + dsc_roundf((bpp -  8) * (6 / 2.0))));
-		*p++ = (bpp <=  8) ? (-2) : ((bpp >= 10) ? (4) : (-2 + dsc_roundf((bpp -  8) * (6 / 2.0))));
-		*p++ = (bpp <=  8) ? (-4) : ((bpp >= 10) ? (2) : (-4 + dsc_roundf((bpp -  8) * (6 / 2.0))));
-		*p++ = (bpp <=  8) ? (-6) : ((bpp >= 10) ? (0) : (-6 + dsc_roundf((bpp -  8) * (6 / 2.0))));
-		*p++ = (bpp <=  8) ? (-8) : ((bpp >= 10) ? (-2) : (-8 + dsc_roundf((bpp -  8) * (6 / 2.0))));
-		*p++ = (bpp <=  8) ? (-8) : ((bpp >= 10) ? (-4) : (-8 + dsc_roundf((bpp -  8) * (4 / 2.0))));
-		*p++ = (bpp <=  8) ? (-8) : ((bpp >= 10) ? (-6) : (-8 + dsc_roundf((bpp -  8) * (2 / 2.0))));
-		*p++ = (bpp <=  8) ? (-10) : ((bpp >= 10) ? (-8) : (-10 + dsc_roundf((bpp -  8) * (2 / 2.0))));
-		*p++ = -10;
-		*p++ = (bpp <=  6) ? (-12) : ((bpp >= 7) ? (-10) : (-12 + dsc_roundf((bpp -  6) * (2.0 / 1))));
-		*p++ = -12;
-		*p++ = -12;
-		*p++ = -12;
-	} else {
-		*p++ = (bpp <=  6) ? (2) : ((bpp >=  8) ? (10) : (2 + dsc_roundf((bpp -  6) * (8 / 2.0))));
-		*p++ = (bpp <=  6) ? (0) : ((bpp >=  8) ? (8) : (0 + dsc_roundf((bpp -  6) * (8 / 2.0))));
-		*p++ = (bpp <=  6) ? (0) : ((bpp >=  8) ? (6) : (0 + dsc_roundf((bpp -  6) * (6 / 2.0))));
-		*p++ = (bpp <=  6) ? (-2) : ((bpp >=  8) ? (4) : (-2 + dsc_roundf((bpp -  6) * (6 / 2.0))));
-		*p++ = (bpp <=  6) ? (-4) : ((bpp >=  8) ? (2) : (-4 + dsc_roundf((bpp -  6) * (6 / 2.0))));
-		*p++ = (bpp <=  6) ? (-6) : ((bpp >=  8) ? (0) : (-6 + dsc_roundf((bpp -  6) * (6 / 2.0))));
-		*p++ = (bpp <=  6) ? (-8) : ((bpp >=  8) ? (-2) : (-8 + dsc_roundf((bpp -  6) * (6 / 2.0))));
-		*p++ = (bpp <=  6) ? (-8) : ((bpp >=  8) ? (-4) : (-8 + dsc_roundf((bpp -  6) * (4 / 2.0))));
-		*p++ = (bpp <=  6) ? (-8) : ((bpp >=  8) ? (-6) : (-8 + dsc_roundf((bpp -  6) * (2 / 2.0))));
-		*p++ = (bpp <=  6) ? (-10) : ((bpp >=  8) ? (-8) : (-10 + dsc_roundf((bpp -  6) * (2 / 2.0))));
-		*p++ = -10;
-		*p++ = (bpp <=  4) ? (-12) : ((bpp >=  5) ? (-10) : (-12 + dsc_roundf((bpp -  4) * (2 / 1.0))));
-		*p++ = -12;
-		*p++ = -12;
-		*p++ = -12;
-	}
-}
-
-static int median3(int a, int b, int c)
-{
-	if (a > b)
-		swap(a, b);
-	if (b > c)
-		swap(b, c);
-	if (a > b)
-		swap(b, c);
-
-	return b;
-}
-
-static void _do_calc_rc_params(struct rc_params *rc, enum colour_mode cm,
-			       enum bits_per_comp bpc, u16 drm_bpp,
-			       bool is_navite_422_or_420,
-			       int slice_width, int slice_height,
-			       int minor_version)
-{
-	float bpp;
-	float bpp_group;
-	float initial_xmit_delay_factor;
-	int padding_pixels;
-	int i;
-
-	bpp = ((float)drm_bpp / 16.0);
-	/* in native_422 or native_420 modes, the bits_per_pixel is double the
-	 * target bpp (the latter is what calc_rc_params expects)
-	 */
-	if (is_navite_422_or_420)
-		bpp /= 2.0;
-
-	rc->rc_quant_incr_limit0 = ((bpc == BPC_8) ? 11 : (bpc == BPC_10 ? 15 : 19)) - ((minor_version == 1 && cm == CM_444) ? 1 : 0);
-	rc->rc_quant_incr_limit1 = ((bpc == BPC_8) ? 11 : (bpc == BPC_10 ? 15 : 19)) - ((minor_version == 1 && cm == CM_444) ? 1 : 0);
-
-	bpp_group = MODE_SELECT(bpp, bpp * 2.0, bpp * 2.0);
-
-	switch (cm) {
-	case CM_420:
-		rc->initial_fullness_offset = (bpp >=  6) ? (2048) : ((bpp <=  4) ? (6144) : ((((bpp >  4) && (bpp <=  5))) ? (6144 - dsc_roundf((bpp - 4) * (512))) : (5632 - dsc_roundf((bpp -  5) * (3584)))));
-		rc->first_line_bpg_offset   = median3(0, (12 + (int) (0.09 *  min(34, slice_height - 8))), (int)((3 * bpc * 3) - (3 * bpp_group)));
-		rc->second_line_bpg_offset  = median3(0, 12, (int)((3 * bpc * 3) - (3 * bpp_group)));
-		break;
-	case CM_422:
-		rc->initial_fullness_offset = (bpp >=  8) ? (2048) : ((bpp <=  7) ? (5632) : (5632 - dsc_roundf((bpp - 7) * (3584))));
-		rc->first_line_bpg_offset   = median3(0, (12 + (int) (0.09 *  min(34, slice_height - 8))), (int)((3 * bpc * 4) - (3 * bpp_group)));
-		rc->second_line_bpg_offset  = 0;
-		break;
-	case CM_444:
-	case CM_RGB:
-		rc->initial_fullness_offset = (bpp >= 12) ? (2048) : ((bpp <=  8) ? (6144) : ((((bpp >  8) && (bpp <= 10))) ? (6144 - dsc_roundf((bpp - 8) * (512 / 2))) : (5632 - dsc_roundf((bpp - 10) * (3584 / 2)))));
-		rc->first_line_bpg_offset   = median3(0, (12 + (int) (0.09 *  min(34, slice_height - 8))), (int)(((3 * bpc + (cm == CM_444 ? 0 : 2)) * 3) - (3 * bpp_group)));
-		rc->second_line_bpg_offset  = 0;
-		break;
-	}
-
-	initial_xmit_delay_factor = (cm == CM_444 || cm == CM_RGB) ? 1.0 : 2.0;
-	rc->initial_xmit_delay = dsc_roundf(8192.0/2.0/bpp/initial_xmit_delay_factor);
-
-	if (cm == CM_422 || cm == CM_420)
-		slice_width /= 2;
-
-	padding_pixels = ((slice_width % 3) != 0) ? (3 - (slice_width % 3)) * (rc->initial_xmit_delay / slice_width) : 0;
-	if (3 * bpp_group >= (((rc->initial_xmit_delay + 2) / 3) * (3 + (cm == CM_422)))) {
-		if ((rc->initial_xmit_delay + padding_pixels) % 3 == 1)
-			rc->initial_xmit_delay++;
-	}
-
-	rc->flatness_min_qp     = ((bpc == BPC_8) ?  (3) : ((bpc == BPC_10) ? (7)  : (11))) - ((minor_version == 1 && cm == CM_444) ? 1 : 0);
-	rc->flatness_max_qp     = ((bpc == BPC_8) ? (12) : ((bpc == BPC_10) ? (16) : (20))) - ((minor_version == 1 && cm == CM_444) ? 1 : 0);
-	rc->flatness_det_thresh = 2 << (bpc - 8);
-
-	get_qp_set(rc->qp_min, cm, bpc, DAL_MM_MIN, bpp);
-	get_qp_set(rc->qp_max, cm, bpc, DAL_MM_MAX, bpp);
-	if (cm == CM_444 && minor_version == 1) {
-		for (i = 0; i < QP_SET_SIZE; ++i) {
-			rc->qp_min[i] = rc->qp_min[i] > 0 ? rc->qp_min[i] - 1 : 0;
-			rc->qp_max[i] = rc->qp_max[i] > 0 ? rc->qp_max[i] - 1 : 0;
-		}
-	}
-	get_ofs_set(rc->ofs, cm, bpp);
-
-	/* fixed parameters */
-	rc->rc_model_size    = 8192;
-	rc->rc_edge_factor   = 6;
-	rc->rc_tgt_offset_hi = 3;
-	rc->rc_tgt_offset_lo = 3;
-
-	rc->rc_buf_thresh[0] = 896;
-	rc->rc_buf_thresh[1] = 1792;
-	rc->rc_buf_thresh[2] = 2688;
-	rc->rc_buf_thresh[3] = 3584;
-	rc->rc_buf_thresh[4] = 4480;
-	rc->rc_buf_thresh[5] = 5376;
-	rc->rc_buf_thresh[6] = 6272;
-	rc->rc_buf_thresh[7] = 6720;
-	rc->rc_buf_thresh[8] = 7168;
-	rc->rc_buf_thresh[9] = 7616;
-	rc->rc_buf_thresh[10] = 7744;
-	rc->rc_buf_thresh[11] = 7872;
-	rc->rc_buf_thresh[12] = 8000;
-	rc->rc_buf_thresh[13] = 8064;
-}
-
-static u32 _do_bytes_per_pixel_calc(int slice_width, u16 drm_bpp,
-				    bool is_navite_422_or_420)
-{
-	float bpp;
-	u32 bytes_per_pixel;
-	double d_bytes_per_pixel;
-
-	bpp = ((float)drm_bpp / 16.0);
-	d_bytes_per_pixel = dsc_ceil(bpp * slice_width / 8.0) / slice_width;
-	// TODO: Make sure the formula for calculating this is precise (ceiling
-	// vs. floor, and at what point they should be applied)
-	if (is_navite_422_or_420)
-		d_bytes_per_pixel /= 2;
-
-	bytes_per_pixel = (u32)dsc_ceil(d_bytes_per_pixel * 0x10000000);
-
-	return bytes_per_pixel;
-}
 
 /**
  * calc_rc_params - reads the user's cmdline mode
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h b/drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h
index 262f06afcbf9..c2340e001b57 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h
+++ b/drivers/gpu/drm/amd/display/dc/dsc/rc_calc.h
@@ -27,55 +27,7 @@
 #ifndef __RC_CALC_H__
 #define __RC_CALC_H__
 
-
-#define QP_SET_SIZE 15
-
-typedef int qp_set[QP_SET_SIZE];
-
-struct rc_params {
-	int      rc_quant_incr_limit0;
-	int      rc_quant_incr_limit1;
-	int      initial_fullness_offset;
-	int      initial_xmit_delay;
-	int      first_line_bpg_offset;
-	int      second_line_bpg_offset;
-	int      flatness_min_qp;
-	int      flatness_max_qp;
-	int      flatness_det_thresh;
-	qp_set   qp_min;
-	qp_set   qp_max;
-	qp_set   ofs;
-	int      rc_model_size;
-	int      rc_edge_factor;
-	int      rc_tgt_offset_hi;
-	int      rc_tgt_offset_lo;
-	int      rc_buf_thresh[QP_SET_SIZE - 1];
-};
-
-enum colour_mode {
-	CM_RGB,   /* 444 RGB */
-	CM_444,   /* 444 YUV or simple 422 */
-	CM_422,   /* native 422 */
-	CM_420    /* native 420 */
-};
-
-enum bits_per_comp {
-	BPC_8  =  8,
-	BPC_10 = 10,
-	BPC_12 = 12
-};
-
-enum max_min {
-	DAL_MM_MIN = 0,
-	DAL_MM_MAX = 1
-};
-
-struct qp_entry {
-	float         bpp;
-	const qp_set  qps;
-};
-
-typedef struct qp_entry qp_table[];
+#include "dml/dsc/rc_calc_fpu.h"
 
 void calc_rc_params(struct rc_params *rc, const struct drm_dsc_config *pps);
 u32 calc_dsc_bytes_per_pixel(const struct drm_dsc_config *pps);
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c b/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c
index ef830aded5b1..1e19dd674e5a 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c
@@ -22,7 +22,6 @@
  * Authors: AMD
  *
  */
-#include "os_types.h"
 #include <drm/drm_dsc.h>
 #include "dscc_types.h"
 #include "rc_calc.h"
-- 
2.25.1


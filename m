Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2EB8ECDE
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Sep 2025 04:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC15110E37F;
	Mon, 22 Sep 2025 02:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u5FKyfXf";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010063.outbound.protection.outlook.com [52.101.46.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F1710E37F
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Sep 2025 02:40:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UiAf820Imk+gEmMSaPMncRIHFVF9rYhC3jOpz1J+4m9CFylpBGtkXgVgNqtc5RP8Qvu3MuWvDL95P9NRBX0LdqK6c8sl+9wAsIjZ+Xk7OFNlrpfgCD1h/e3Jo3QfI1zxKu89yurBhPu2ARWgc6FcLOR4MI06vnVuTMH/Cy+g9WK7+fHrgFiuhRs1MUTQ4t2iExUtsLYRM13dW3A7+Yb/vjPOnliCuJtiTFbwAb4P9RI1KUnsMS87qkIx5uC2dfYNN9g9WYzA2tRUr34JtCTGwTtklBarGSwHxdRN6JxBI7smAdfMG8r+lNWyhDlzVREmA76kxAhlmaKq0HlyrdVtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilzP7XZ7EkCx7lMwnTtU6YQUV6podn/4b1dW9yZSxUo=;
 b=k5Q51ICPzqXPjFpw9ig8AfLJlRWw+ViFAUefPcZqsSaqHn9dHA3807q1g0TkcMWMSjoUau/om2MfSqeauBJG7nPnLa+eB02daNwDtpQWu2VRpW56KnJmsfJw6u+m32opIeXuFdFSBYei/nQhxwPFgubhM4uTHHolAijoXpR4Y2bUjCw4/44tGMeW/irPo9NgTVUtYXvGaAbVpGpsDifsyqT0u0WIqVHl6Kj8ztlUICDKdZLeGPISbRYtqLXFfQ22fStvCrhRU0SI2jhR7MuwX7MmrQTUKdRfxmJsDksb5HhYJPObyOGCi1wk8idHlC9B7XmIvAT5or71mwHwXfOeyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilzP7XZ7EkCx7lMwnTtU6YQUV6podn/4b1dW9yZSxUo=;
 b=u5FKyfXfVvJmkm/qLQoOBFe0vyXxZufbp3nGbSTftRlm4B2KQeMOVK6CVgQpawRVxsMIQPjOEZVMVYZHoU12Jgq+wiZ+4inp0Sic2sGQcrzEhTY7R7Y8LyywI7MEky4Cwd06YymP+j9y4wwZWoZgjOAX9qK2YL+tTgD2/cjY7Uk=
Received: from BYAPR01CA0071.prod.exchangelabs.com (2603:10b6:a03:94::48) by
 LV3PR12MB9401.namprd12.prod.outlook.com (2603:10b6:408:21c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 02:40:01 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:a03:94:cafe::72) by BYAPR01CA0071.outlook.office365.com
 (2603:10b6:a03:94::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 02:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Mon, 22 Sep 2025 02:40:00 +0000
Received: from amd-02.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 21 Sep
 2025 19:39:58 -0700
From: YiPeng Chai <YiPeng.Chai@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <yipechai@amd.com>, <Hawking.Zhang@amd.com>, <Tao.Zhou1@amd.com>,
 <Stanley.Yang@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>, Xiang Liu
 <xiang.liu@amd.com>, Tao Zhou <tao.zhou1@amd.com>
Subject: [PATCH V5 18/20] drm/amd/ras: Add cper conversion function
Date: Mon, 22 Sep 2025 10:38:42 +0800
Message-ID: <20250922023844.3108065-18-YiPeng.Chai@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922023844.3108065-1-YiPeng.Chai@amd.com>
References: <20250922023844.3108065-1-YiPeng.Chai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|LV3PR12MB9401:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cda9141-e75f-425c-ee57-08ddf98153dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kamU0Q7IUvjTLxgyTUQDtOy9QstcXu7kthm1S1EP8pstOCc4370RlRdduR/w?=
 =?us-ascii?Q?Hun7pvUaaIZrThbYXYt8figmAYDJbwfQ5ftYpmSND8UJiPOCgljugOmYR95K?=
 =?us-ascii?Q?pOEkoA0Bdt6fdKaL+Beux1jzo7w4N1dBX7oWI9s4Emah2cztN6QJfkJuVoKn?=
 =?us-ascii?Q?B9mc3ykef6UPv/IZ3F1+RsEtAIZ1vp3wK2vprVf3eEuFZLwO2w/uMiJnJ2fk?=
 =?us-ascii?Q?ijasxHTnsQTcDfIp/vMuy+p5j5D8gQWSDvjfwqDuGG2br0XO2JOMTiCvevjX?=
 =?us-ascii?Q?dXIsxN55FbDvnSP/7VCbXK9p4sACEBJpxmDP/iFsimYCweE+k+Tftj+uNQRr?=
 =?us-ascii?Q?D8s/FsKWNqSFANF5xA3bX5TMGZZQUWMIR53shxG3N2GZ8qidHw0vzFb2HGup?=
 =?us-ascii?Q?K1c0dPXDYtvWPuGF0LvYti/a9sERNp+OdTsyb9FbbLRCSmDlWqBr2fAc55GL?=
 =?us-ascii?Q?MQYfF4eh88/wwZW7P25Tu3eXeK4/TfOo3pODdvG88ijXSqBoouCGyzyNCFZI?=
 =?us-ascii?Q?/fya6tAYVQbpPCo0NJeUr8MaSopQcaWeKgKIRYgBrQgTScO1YxZGEcURP68u?=
 =?us-ascii?Q?5ysFIOWnOqzi8NPJtDmHPW4xSPSReguBIHXRhj1aVhpNYu9S6Y7729eKtQ4+?=
 =?us-ascii?Q?xzAU4XLbza5byUBA1/T7XP0hy5XSnxGpcJGz7odu425X80ax/3uIWeeic9It?=
 =?us-ascii?Q?qHJdDlTE7Q+PpnmkkQ2ry+02yMW8iUdGd/+Vc0PpFdrwTBBCKOH+ioTnaq05?=
 =?us-ascii?Q?xsxg/tefL1XTAeGpywsu7rvxDZiM9K0spoeBcwC6YdLIybLgPbCGy1DW0gBO?=
 =?us-ascii?Q?TtMnsznoO/o6fdt0qRLUQmDmzbhZtkPj39Qj4mkaa7TQflo3HoMcmmnW47mw?=
 =?us-ascii?Q?7fAfy820b3QyH9qjwMCDU/qmjclNNt/edNU6aTdmnoxenHus7QshsG+FkXLa?=
 =?us-ascii?Q?gV/4zZC85+cCGEacazqvEI31L6B4jDbyUiSXytV+ljaFCIylrd4cTMJq6fT3?=
 =?us-ascii?Q?+grLmGzd+fs8DT20J7UNueOv+vGzsWQuydhSQif8n47n+zL0rd/6mHiO0zkf?=
 =?us-ascii?Q?Kkmv5wz98e7Ulvw6EqvUULbpBIWbIP5duwmSDejeqmBE71zRLz/1vvdLCWac?=
 =?us-ascii?Q?SGqfnY702kL+V4/Wn1b3fHifCY9Dv+sTvZO1HrFNe+us5ugND9MAwGiiIfq7?=
 =?us-ascii?Q?KFSpMoK6smY+d/ywImgFKTiI8k70oo8XcDA5WLxMw2ATBK6tWUu6CijQ2SRj?=
 =?us-ascii?Q?GGs3JqB1HEXQ8gQwN6p0pVUzkg7bM+2hKqMx50HQDuiYVr+Ns7oGiJb0me/I?=
 =?us-ascii?Q?518+lRBqq+YDGdhlTBN2KjbAdzhCACU6WdBxxl//H2993gVuhEZ9ywlQWluR?=
 =?us-ascii?Q?Ol2ibUsUAo5gu0AKBEroN4gzZaWU7Q6NFlCctnESl7paWGtzx8wAaYntSChc?=
 =?us-ascii?Q?FoxmeQKuZR922PyX4mfhwcqsG4nCst99UsPCCRVm7DAMlG98/dVpHRSdCKW2?=
 =?us-ascii?Q?ZRVqcoRM2w7m7fX4jTIgo8ZI36qp9SOfqyS0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 02:40:00.8227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cda9141-e75f-425c-ee57-08ddf98153dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9401
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

Add cper conversion function.

V3:
  Change commit message and update the calling function.

Signed-off-by: YiPeng Chai <YiPeng.Chai@amd.com>
Signed-off-by: Xiang Liu <xiang.liu@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/ras/rascore/ras_cper.c | 310 +++++++++++++++++++++
 drivers/gpu/drm/amd/ras/rascore/ras_cper.h | 304 ++++++++++++++++++++
 2 files changed, 614 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cper.c
 create mode 100644 drivers/gpu/drm/amd/ras/rascore/ras_cper.h

diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_cper.c b/drivers/gpu/drm/amd/ras/rascore/ras_cper.c
new file mode 100644
index 000000000000..2343991adccf
--- /dev/null
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_cper.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
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
+ */
+#include "ras.h"
+#include "ras_core_status.h"
+#include "ras_log_ring.h"
+#include "ras_cper.h"
+
+static const struct ras_cper_guid MCE	= CPER_NOTIFY__MCE;
+static const struct ras_cper_guid CMC	= CPER_NOTIFY__CMC;
+static const struct ras_cper_guid BOOT	= BOOT__TYPE;
+
+static const struct ras_cper_guid CRASHDUMP = GPU__CRASHDUMP;
+static const struct ras_cper_guid RUNTIME = GPU__NONSTANDARD_ERROR;
+
+static void cper_get_timestamp(struct ras_core_context *ras_core,
+		struct ras_cper_timestamp *timestamp, uint64_t utc_second_timestamp)
+{
+	struct ras_time tm = {0};
+
+	ras_core_convert_timestamp_to_time(ras_core, utc_second_timestamp, &tm);
+	timestamp->seconds = tm.tm_sec;
+	timestamp->minutes = tm.tm_min;
+	timestamp->hours = tm.tm_hour;
+	timestamp->flag = 0;
+	timestamp->day = tm.tm_mday;
+	timestamp->month = tm.tm_mon;
+	timestamp->year = tm.tm_year % 100;
+	timestamp->century = tm.tm_year / 100;
+}
+
+static void fill_section_hdr(struct ras_core_context *ras_core,
+				struct cper_section_hdr *hdr, enum ras_cper_type type,
+				enum ras_cper_severity sev, struct ras_log_info *trace)
+{
+	struct device_system_info dev_info = {0};
+	char record_id[16];
+
+	hdr->signature[0]		= 'C';
+	hdr->signature[1]		= 'P';
+	hdr->signature[2]		= 'E';
+	hdr->signature[3]		= 'R';
+	hdr->revision			= CPER_HDR__REV_1;
+	hdr->signature_end		= 0xFFFFFFFF;
+	hdr->error_severity		= sev;
+
+	hdr->valid_bits.platform_id	= 1;
+	hdr->valid_bits.partition_id	= 1;
+	hdr->valid_bits.timestamp	= 1;
+
+	ras_core_get_device_system_info(ras_core, &dev_info);
+
+	cper_get_timestamp(ras_core, &hdr->timestamp, trace->timestamp);
+
+	snprintf(record_id, 9, "%d:%llX", dev_info.socket_id,
+		    RAS_LOG_SEQNO_TO_BATCH_IDX(trace->seqno));
+	memcpy(hdr->record_id, record_id, 8);
+
+	snprintf(hdr->platform_id, 16, "0x%04X:0x%04X",
+		dev_info.vendor_id, dev_info.device_id);
+	/* pmfw version should be part of creator_id according to CPER spec */
+	snprintf(hdr->creator_id, 16, "%s", CPER_CREATOR_ID__AMDGPU);
+
+	switch (type) {
+	case RAS_CPER_TYPE_BOOT:
+		hdr->notify_type = BOOT;
+		break;
+	case RAS_CPER_TYPE_FATAL:
+	case RAS_CPER_TYPE_RMA:
+		hdr->notify_type = MCE;
+		break;
+	case RAS_CPER_TYPE_RUNTIME:
+		if (sev == RAS_CPER_SEV_NON_FATAL_CE)
+			hdr->notify_type = CMC;
+		else
+			hdr->notify_type = MCE;
+		break;
+	default:
+		RAS_DEV_ERR(ras_core->dev, "Unknown CPER Type\n");
+		break;
+	}
+}
+
+static int fill_section_descriptor(struct ras_core_context *ras_core,
+					struct cper_section_descriptor *descriptor,
+					enum ras_cper_severity sev,
+					struct ras_cper_guid sec_type,
+					uint32_t section_offset,
+					uint32_t section_length)
+{
+	struct device_system_info dev_info = {0};
+
+	descriptor->revision_minor		= CPER_SEC__MINOR_REV_1;
+	descriptor->revision_major		= CPER_SEC__MAJOR_REV_22;
+	descriptor->sec_offset		= section_offset;
+	descriptor->sec_length		= section_length;
+	descriptor->valid_bits.fru_text	= 1;
+	descriptor->flag_bits.primary	= 1;
+	descriptor->severity			= sev;
+	descriptor->sec_type			= sec_type;
+
+	ras_core_get_device_system_info(ras_core, &dev_info);
+
+	snprintf(descriptor->fru_text, 20, "OAM%d", dev_info.socket_id);
+
+	if (sev == RAS_CPER_SEV_RMA)
+		descriptor->flag_bits.exceed_err_threshold = 1;
+
+	if (sev == RAS_CPER_SEV_NON_FATAL_UE)
+		descriptor->flag_bits.latent_err = 1;
+
+	return 0;
+}
+
+static int fill_section_fatal(struct ras_core_context *ras_core,
+		struct cper_section_fatal *fatal, struct ras_log_info *trace)
+{
+	fatal->data.reg_ctx_type = CPER_CTX_TYPE__CRASH;
+	fatal->data.reg_arr_size = sizeof(fatal->data.reg);
+
+	fatal->data.reg.status = trace->aca_reg.regs[RAS_CPER_ACA_REG_STATUS];
+	fatal->data.reg.addr   = trace->aca_reg.regs[RAS_CPER_ACA_REG_ADDR];
+	fatal->data.reg.ipid   = trace->aca_reg.regs[RAS_CPER_ACA_REG_IPID];
+	fatal->data.reg.synd   = trace->aca_reg.regs[RAS_CPER_ACA_REG_SYND];
+
+	return 0;
+}
+
+static int fill_section_runtime(struct ras_core_context *ras_core,
+		struct cper_section_runtime *runtime, struct ras_log_info *trace)
+{
+	runtime->hdr.valid_bits.err_info_cnt = 1;
+	runtime->hdr.valid_bits.err_context_cnt = 1;
+
+	runtime->descriptor.error_type = RUNTIME;
+	runtime->descriptor.ms_chk_bits.err_type_valid = 1;
+
+	runtime->reg.reg_ctx_type = CPER_CTX_TYPE__CRASH;
+	runtime->reg.reg_arr_size = sizeof(runtime->reg.reg_dump);
+
+	runtime->reg.reg_dump[RAS_CPER_ACA_REG_CTL]    = trace->aca_reg.regs[ACA_REG_IDX__CTL];
+	runtime->reg.reg_dump[RAS_CPER_ACA_REG_STATUS] = trace->aca_reg.regs[ACA_REG_IDX__STATUS];
+	runtime->reg.reg_dump[RAS_CPER_ACA_REG_ADDR]   = trace->aca_reg.regs[ACA_REG_IDX__ADDR];
+	runtime->reg.reg_dump[RAS_CPER_ACA_REG_MISC0]  = trace->aca_reg.regs[ACA_REG_IDX__MISC0];
+	runtime->reg.reg_dump[RAS_CPER_ACA_REG_CONFIG] = trace->aca_reg.regs[ACA_REG_IDX__CONFG];
+	runtime->reg.reg_dump[RAS_CPER_ACA_REG_IPID]   = trace->aca_reg.regs[ACA_REG_IDX__IPID];
+	runtime->reg.reg_dump[RAS_CPER_ACA_REG_SYND]   = trace->aca_reg.regs[ACA_REG_IDX__SYND];
+
+	return 0;
+}
+
+static int cper_generate_runtime_record(struct ras_core_context *ras_core,
+	struct cper_section_hdr *hdr, struct ras_log_info **trace_arr, uint32_t arr_num,
+		enum ras_cper_severity sev)
+{
+	struct cper_section_descriptor *descriptor;
+	struct cper_section_runtime *runtime;
+	int i;
+
+	fill_section_hdr(ras_core, hdr, RAS_CPER_TYPE_RUNTIME, sev, trace_arr[0]);
+	hdr->record_length =  RAS_HDR_LEN + ((RAS_SEC_DESC_LEN + RAS_NONSTD_SEC_LEN) * arr_num);
+	hdr->sec_cnt = arr_num;
+	for (i = 0; i < arr_num; i++) {
+		descriptor = (struct cper_section_descriptor *)((uint8_t *)hdr +
+			     RAS_SEC_DESC_OFFSET(i));
+		runtime = (struct cper_section_runtime *)((uint8_t *)hdr +
+			  RAS_NONSTD_SEC_OFFSET(hdr->sec_cnt, i));
+
+		fill_section_descriptor(ras_core, descriptor, sev, RUNTIME,
+			RAS_NONSTD_SEC_OFFSET(hdr->sec_cnt, i),
+			sizeof(struct cper_section_runtime));
+		fill_section_runtime(ras_core, runtime, trace_arr[i]);
+	}
+
+	return 0;
+}
+
+static int cper_generate_fatal_record(struct ras_core_context *ras_core,
+	uint8_t *buffer, struct ras_log_info **trace_arr, uint32_t arr_num)
+{
+	struct ras_cper_fatal_record record = {0};
+	int i = 0;
+
+	for (i = 0; i < arr_num; i++) {
+		fill_section_hdr(ras_core, &record.hdr, RAS_CPER_TYPE_FATAL,
+				 RAS_CPER_SEV_FATAL_UE, trace_arr[i]);
+		record.hdr.record_length =  RAS_HDR_LEN + RAS_SEC_DESC_LEN + RAS_FATAL_SEC_LEN;
+		record.hdr.sec_cnt = 1;
+
+		fill_section_descriptor(ras_core, &record.descriptor, RAS_CPER_SEV_FATAL_UE,
+					CRASHDUMP, offsetof(struct ras_cper_fatal_record, fatal),
+					sizeof(struct cper_section_fatal));
+
+		fill_section_fatal(ras_core, &record.fatal, trace_arr[i]);
+
+		memcpy(buffer + (i * record.hdr.record_length),
+				&record, record.hdr.record_length);
+	}
+
+	return 0;
+}
+
+static int cper_get_record_size(enum ras_cper_type type, uint16_t section_count)
+{
+	int size = 0;
+
+	size += RAS_HDR_LEN;
+	size += (RAS_SEC_DESC_LEN * section_count);
+
+	switch (type) {
+	case RAS_CPER_TYPE_RUNTIME:
+	case RAS_CPER_TYPE_RMA:
+		size += (RAS_NONSTD_SEC_LEN * section_count);
+		break;
+	case RAS_CPER_TYPE_FATAL:
+		size += (RAS_FATAL_SEC_LEN * section_count);
+		size += (RAS_HDR_LEN * (section_count - 1));
+		break;
+	case RAS_CPER_TYPE_BOOT:
+		size += (RAS_BOOT_SEC_LEN * section_count);
+		break;
+	default:
+		/* should never reach here */
+		break;
+	}
+
+	return size;
+}
+
+static enum ras_cper_type cper_ras_log_event_to_cper_type(enum ras_log_event event)
+{
+	switch (event) {
+	case RAS_LOG_EVENT_UE:
+		return RAS_CPER_TYPE_FATAL;
+	case RAS_LOG_EVENT_DE:
+	case RAS_LOG_EVENT_CE:
+	case RAS_LOG_EVENT_POISON_CREATION:
+	case RAS_LOG_EVENT_POISON_CONSUMPTION:
+		return RAS_CPER_TYPE_RUNTIME;
+	case RAS_LOG_EVENT_RMA:
+		return RAS_CPER_TYPE_RMA;
+	default:
+		/* should never reach here */
+		return RAS_CPER_TYPE_RUNTIME;
+	}
+}
+
+int ras_cper_generate_cper(struct ras_core_context *ras_core,
+		struct ras_log_info **trace_list, uint32_t count,
+		uint8_t *buf, uint32_t buf_len, uint32_t *real_data_len)
+{
+	uint8_t *buffer = buf;
+	uint64_t buf_size = buf_len;
+	int record_size, saved_size = 0;
+	struct cper_section_hdr *hdr;
+
+	/* All the batch traces share the same event */
+	record_size = cper_get_record_size(
+			cper_ras_log_event_to_cper_type(trace_list[0]->event), count);
+
+	if ((record_size + saved_size) > buf_size)
+		return -ENOMEM;
+
+	hdr = (struct cper_section_hdr *)(buffer + saved_size);
+
+	switch (trace_list[0]->event) {
+	case RAS_LOG_EVENT_RMA:
+		cper_generate_runtime_record(ras_core, hdr, trace_list, count, RAS_CPER_SEV_RMA);
+		break;
+	case RAS_LOG_EVENT_DE:
+		cper_generate_runtime_record(ras_core,
+			hdr, trace_list, count, RAS_CPER_SEV_NON_FATAL_UE);
+		break;
+	case RAS_LOG_EVENT_CE:
+		cper_generate_runtime_record(ras_core,
+			hdr, trace_list, count, RAS_CPER_SEV_NON_FATAL_CE);
+		break;
+	case RAS_LOG_EVENT_UE:
+		cper_generate_fatal_record(ras_core, buffer + saved_size, trace_list, count);
+		break;
+	default:
+		RAS_DEV_WARN(ras_core->dev, "Unprocessed trace event: %d\n", trace_list[0]->event);
+		break;
+	}
+
+	saved_size += record_size;
+
+	*real_data_len = saved_size;
+	return 0;
+}
diff --git a/drivers/gpu/drm/amd/ras/rascore/ras_cper.h b/drivers/gpu/drm/amd/ras/rascore/ras_cper.h
new file mode 100644
index 000000000000..076c1883c1ce
--- /dev/null
+++ b/drivers/gpu/drm/amd/ras/rascore/ras_cper.h
@@ -0,0 +1,304 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright 2025 Advanced Micro Devices, Inc.
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
+ */
+#ifndef __RAS_CPER_H__
+#define __RAS_CPER_H__
+
+#define CPER_UUID_MAX_SIZE 16
+struct ras_cper_guid {
+	uint8_t b[CPER_UUID_MAX_SIZE];
+};
+
+#define CPER_GUID__INIT(a, b, c, d0, d1, d2, d3, d4, d5, d6, d7)			\
+	((struct ras_cper_guid)								\
+	{{ (a) & 0xff, ((a) >> 8) & 0xff, ((a) >> 16) & 0xff, ((a) >> 24) & 0xff, \
+		(b) & 0xff, ((b) >> 8) & 0xff,					\
+		(c) & 0xff, ((c) >> 8) & 0xff,					\
+		(d0), (d1), (d2), (d3), (d4), (d5), (d6), (d7) }})
+
+#define CPER_HDR__REV_1          (0x100)
+#define CPER_SEC__MINOR_REV_1    (0x01)
+#define CPER_SEC__MAJOR_REV_22   (0x22)
+#define CPER_OAM_MAX_COUNT      (8)
+
+#define CPER_CTX_TYPE__CRASH     (1)
+#define CPER_CTX_TYPE__BOOT      (9)
+
+#define CPER_CREATOR_ID__AMDGPU	"amdgpu"
+
+#define CPER_NOTIFY__MCE                                               \
+	CPER_GUID__INIT(0xE8F56FFE, 0x919C, 0x4cc5, 0xBA, 0x88, 0x65, 0xAB, \
+		  0xE1, 0x49, 0x13, 0xBB)
+#define CPER_NOTIFY__CMC                                               \
+	CPER_GUID__INIT(0x2DCE8BB1, 0xBDD7, 0x450e, 0xB9, 0xAD, 0x9C, 0xF4, \
+		  0xEB, 0xD4, 0xF8, 0x90)
+#define BOOT__TYPE                                                     \
+	CPER_GUID__INIT(0x3D61A466, 0xAB40, 0x409a, 0xA6, 0x98, 0xF3, 0x62, \
+		  0xD4, 0x64, 0xB3, 0x8F)
+
+#define GPU__CRASHDUMP                                                 \
+	CPER_GUID__INIT(0x32AC0C78, 0x2623, 0x48F6, 0xB0, 0xD0, 0x73, 0x65, \
+		  0x72, 0x5F, 0xD6, 0xAE)
+#define GPU__NONSTANDARD_ERROR                                     \
+	CPER_GUID__INIT(0x32AC0C78, 0x2623, 0x48F6, 0x81, 0xA2, 0xAC, 0x69, \
+		  0x17, 0x80, 0x55, 0x1D)
+#define PROC_ERR__SECTION_TYPE                                         \
+	CPER_GUID__INIT(0xDC3EA0B0, 0xA144, 0x4797, 0xB9, 0x5B, 0x53, 0xFA, \
+		  0x24, 0x2B, 0x6E, 0x1D)
+
+enum ras_cper_type {
+	RAS_CPER_TYPE_RUNTIME,
+	RAS_CPER_TYPE_FATAL,
+	RAS_CPER_TYPE_BOOT,
+	RAS_CPER_TYPE_RMA,
+};
+
+enum ras_cper_severity {
+	RAS_CPER_SEV_NON_FATAL_UE   = 0,
+	RAS_CPER_SEV_FATAL_UE       = 1,
+	RAS_CPER_SEV_NON_FATAL_CE   = 2,
+	RAS_CPER_SEV_RMA            = 3,
+
+	RAS_CPER_SEV_UNUSED = 10,
+};
+
+enum ras_cper_aca_reg {
+	RAS_CPER_ACA_REG_CTL    = 0,
+	RAS_CPER_ACA_REG_STATUS = 1,
+	RAS_CPER_ACA_REG_ADDR   = 2,
+	RAS_CPER_ACA_REG_MISC0  = 3,
+	RAS_CPER_ACA_REG_CONFIG = 4,
+	RAS_CPER_ACA_REG_IPID   = 5,
+	RAS_CPER_ACA_REG_SYND   = 6,
+	RAS_CPER_ACA_REG_DESTAT	= 8,
+	RAS_CPER_ACA_REG_DEADDR	= 9,
+	RAS_CPER_ACA_REG_MASK	= 10,
+
+	RAS_CPER_ACA_REG_COUNT     = 16,
+};
+
+#pragma pack(push, 1)
+
+struct ras_cper_timestamp {
+	uint8_t seconds;
+	uint8_t minutes;
+	uint8_t hours;
+	uint8_t flag;
+	uint8_t day;
+	uint8_t month;
+	uint8_t year;
+	uint8_t century;
+};
+
+struct cper_section_hdr {
+	char                     signature[4];  /* "CPER"  */
+	uint16_t                 revision;
+	uint32_t                 signature_end; /* 0xFFFFFFFF */
+	uint16_t                 sec_cnt;
+	enum ras_cper_severity error_severity;
+	union {
+		struct {
+			uint32_t platform_id	: 1;
+			uint32_t timestamp	: 1;
+			uint32_t partition_id	: 1;
+			uint32_t reserved	: 29;
+		} valid_bits;
+		uint32_t valid_mask;
+	};
+	uint32_t		record_length;    /* Total size of CPER Entry */
+	struct ras_cper_timestamp timestamp;
+	char			platform_id[16];
+	struct ras_cper_guid			partition_id;     /* Reserved */
+	char			creator_id[16];
+	struct ras_cper_guid			notify_type;      /* CMC, MCE */
+	char			record_id[8];     /* Unique CPER Entry ID */
+	uint32_t		flags;            /* Reserved */
+	uint64_t		persistence_info; /* Reserved */
+	uint8_t			reserved[12];     /* Reserved */
+};
+
+struct cper_section_descriptor {
+	uint32_t sec_offset;     /* Offset from the start of CPER entry */
+	uint32_t sec_length;
+	uint8_t  revision_minor; /* CPER_SEC_MINOR_REV_1 */
+	uint8_t  revision_major; /* CPER_SEC_MAJOR_REV_22 */
+	union {
+		struct {
+			uint8_t fru_id		: 1;
+			uint8_t fru_text	: 1;
+			uint8_t reserved	: 6;
+		} valid_bits;
+		uint8_t valid_mask;
+	};
+	uint8_t reserved;
+	union {
+		struct {
+			uint32_t primary		: 1;
+			uint32_t reserved1		: 2;
+			uint32_t exceed_err_threshold	: 1;
+			uint32_t latent_err		: 1;
+			uint32_t reserved2		: 27;
+		} flag_bits;
+		uint32_t flag_mask;
+	};
+	struct ras_cper_guid			sec_type;
+	char				fru_id[16];
+	enum ras_cper_severity severity;
+	char				fru_text[20];
+};
+
+struct runtime_hdr {
+	union {
+		struct {
+			uint64_t apic_id		: 1;
+			uint64_t fw_id			: 1;
+			uint64_t err_info_cnt		: 6;
+			uint64_t err_context_cnt	: 6;
+		} valid_bits;
+		uint64_t valid_mask;
+	};
+	uint64_t apic_id;
+	char     fw_id[48];
+};
+
+struct runtime_descriptor {
+	struct ras_cper_guid error_type;
+	union {
+		struct {
+			uint64_t ms_chk			: 1;
+			uint64_t target_addr_id		: 1;
+			uint64_t req_id			: 1;
+			uint64_t resp_id		: 1;
+			uint64_t instr_ptr		: 1;
+			uint64_t reserved		: 59;
+		} valid_bits;
+		uint64_t        valid_mask;
+	};
+	union {
+		struct {
+			uint64_t err_type_valid		: 1;
+			uint64_t pcc_valid		: 1;
+			uint64_t uncorr_valid		: 1;
+			uint64_t precise_ip_valid	: 1;
+			uint64_t restartable_ip_valid	: 1;
+			uint64_t overflow_valid		: 1;
+			uint64_t reserved1		: 10;
+			uint64_t err_type		: 2;
+			uint64_t pcc			: 1;
+			uint64_t uncorr			: 1;
+			uint64_t precised_ip		: 1;
+			uint64_t restartable_ip		: 1;
+			uint64_t overflow		: 1;
+			uint64_t reserved2		: 41;
+		} ms_chk_bits;
+		uint64_t ms_chk_mask;
+	};
+	uint64_t target_addr_id;
+	uint64_t req_id;
+	uint64_t resp_id;
+	uint64_t instr_ptr;
+};
+
+struct runtime_error_reg {
+	uint16_t reg_ctx_type;
+	uint16_t reg_arr_size;
+	uint32_t msr_addr;
+	uint64_t mm_reg_addr;
+	uint64_t reg_dump[RAS_CPER_ACA_REG_COUNT];
+};
+
+struct cper_section_runtime {
+	struct runtime_hdr  hdr;
+	struct runtime_descriptor descriptor;
+	struct runtime_error_reg  reg;
+};
+
+struct crashdump_hdr {
+	uint64_t reserved1;
+	uint64_t reserved2;
+	char     fw_id[48];
+	uint64_t reserved3[8];
+};
+
+struct fatal_reg_info {
+	uint64_t status;
+	uint64_t addr;
+	uint64_t ipid;
+	uint64_t synd;
+};
+
+struct crashdump_fatal {
+	uint16_t reg_ctx_type;
+	uint16_t reg_arr_size;
+	uint32_t reserved1;
+	uint64_t reserved2;
+	struct fatal_reg_info reg;
+};
+
+struct crashdump_boot {
+	uint16_t reg_ctx_type;
+	uint16_t reg_arr_size;
+	uint32_t reserved1;
+	uint64_t reserved2;
+	uint64_t msg[CPER_OAM_MAX_COUNT];
+};
+
+struct cper_section_fatal {
+	struct crashdump_hdr    hdr;
+	struct crashdump_fatal  data;
+};
+
+struct cper_section_boot {
+	struct crashdump_hdr  hdr;
+	struct crashdump_boot data;
+};
+
+struct ras_cper_fatal_record {
+	struct cper_section_hdr hdr;
+	struct cper_section_descriptor descriptor;
+	struct cper_section_fatal fatal;
+};
+#pragma pack(pop)
+
+#define RAS_HDR_LEN				(sizeof(struct cper_section_hdr))
+#define RAS_SEC_DESC_LEN			(sizeof(struct cper_sec_desc))
+
+#define RAS_BOOT_SEC_LEN			(sizeof(struct cper_sec_crashdump_boot))
+#define RAS_FATAL_SEC_LEN			(sizeof(struct cper_sec_crashdump_fatal))
+#define RAS_NONSTD_SEC_LEN			(sizeof(struct cper_sec_nonstd_err))
+
+#define RAS_SEC_DESC_OFFSET(idx)		(RAS_HDR_LEN + (RAS_SEC_DESC_LEN * idx))
+
+#define RAS_BOOT_SEC_OFFSET(count, idx) \
+	(RAS_HDR_LEN + (RAS_SEC_DESC_LEN * count) + (RAS_BOOT_SEC_LEN * idx))
+#define RAS_FATAL_SEC_OFFSET(count, idx) \
+	(RAS_HDR_LEN + (RAS_SEC_DESC_LEN * count) + (RAS_FATAL_SEC_LEN * idx))
+#define RAS_NONSTD_SEC_OFFSET(count, idx) \
+	(RAS_HDR_LEN + (RAS_SEC_DESC_LEN * count) + (RAS_NONSTD_SEC_LEN * idx))
+
+struct ras_core_context;
+struct ras_log_info;
+int ras_cper_generate_cper(struct ras_core_context *ras_core,
+		struct ras_log_info **trace_list, uint32_t count,
+		uint8_t *buf, uint32_t buf_len, uint32_t *real_data_len);
+#endif
-- 
2.34.1


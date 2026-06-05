Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wwqqBcHSImpceAEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 15:44:33 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B454A648A07
	for <lists+amd-gfx@lfdr.de>; Fri, 05 Jun 2026 15:44:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=y3hmNnoq;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8B10E642;
	Fri,  5 Jun 2026 13:44:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B3F10E561
 for <amd-gfx@lists.freedesktop.org>; Fri,  5 Jun 2026 13:44:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UC2PpiNDEygkjav6RQS5lgOlGdeCyHX30GolS7/nuWs1XraXmqyQOXHFwN6Ev0MStN9I+oG0oD3msGrnU4C67h1t/tWDw9FsLtO5cQ8OEmV+XDwozN1B22EyvGzn0ps0MtaZuzrqzXRmaNj3GuVLWnuQLWUm1PL6EnJfJuwjkrEVVaYVcgGkUGZ3CY3G/HXLXXw9pr67H8v6l8f7dysD2/nA/vWRBX0Tmb2YfM+gVTgvHKu3j80KHRK2nGjjP4nNZ35FZww/OCjSQApqBKQk+t5kV2c0eWiwCicoP832yH54snIAR0zJXcA9sARkXPNbOc614N4PR9SD4kyH298GPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jue8PTfiX2L4QvXl/02pthukXeqZsoa6/C9/GLA+1MM=;
 b=wj/XYATWUE5QSqAyw+IGAYRO/ZrRv/mRzq15lWeoxSDbMWgVLGRDk6WDO3Jo4H07JNL3DVVf7PmE0QEBtw9R6JDJ8Jf/TM1KnxwFasSbnbhmso5MsDbwbuUKH0sBe+B+2PDLQPmkN5c7tLOX1/+78IJtSESvlztfU/znXCNjFujFVh8GV+oVrYDGt+TS/KLD/5VmXDkPy0a523569R62VjYjQN+Aq7oKJd1rfSzGBV7HOf5erVK6UcQBqAC6H+HmwBXD0SbyqOusNB96kC7StEk9s/xno3mIZuqgezoFKCVXl6T/oGyRBZHS5HX1pBDXtjoyCyexpZcFiFMp0uMKog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jue8PTfiX2L4QvXl/02pthukXeqZsoa6/C9/GLA+1MM=;
 b=y3hmNnoqFfnoYrWrWvfk5NEvmyrnpm9RkU5se05+vI9eld8xsYn0eDgyezohaKdy4iQxTQRgvVGVD7/XbmV/d6gPWfYZsqVvGBv/unUOd//P/TOLIdkn3DB0Egr4WFQaf2vVgrljG3+W3f2zdxpLnrNxsEpl8O6S2EIYQNeGzBo=
Received: from CH0P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::21)
 by DS5PPF016FC81DF.namprd12.prod.outlook.com (2603:10b6:f:fc00::644)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 13:44:19 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::76) by CH0P221CA0039.outlook.office365.com
 (2603:10b6:610:11d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.10 via Frontend Transport; Fri, 5
 Jun 2026 13:44:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 13:44:19 +0000
Received: from amd-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 5 Jun
 2026 08:44:15 -0500
From: Shahyan Soltani <shahyan.soltani@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Shahyan Soltani <shahyan.soltani@amd.com>
Subject: [PATCH 05/11] drm/amdgpu: move struct amdgpu_mqd and helpers into
 header file
Date: Fri, 5 Jun 2026 09:43:17 -0400
Message-ID: <20260605134400.956791-6-shahyan.soltani@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260605134400.956791-1-shahyan.soltani@amd.com>
References: <20260605134400.956791-1-shahyan.soltani@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|DS5PPF016FC81DF:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf367f9-e313-4177-ea12-08dec3088b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vFRoeioWkJb8+8SzDmPviAn1zdIrt+JbgFnzxsP9ncGJRSo0meFqSEGEbdeckA/SMchMlNPMmx3yK75OHUFVhCOtSA24Sns7GBxG1+Bikb3uLTAc2FLXvK4f+O4XVgAlmnlU/8ZVIADq3Q440WnMaQcr7TJjd6/N+dfSdroaPa+Nw5Gkvye4zaKBSrxJxrK6dro/zcYhbhEpAQUcFakvuZ9iOs5Chzdu4IcuACq+6fk/n84mqWff0Cs4tlP/t0TTJjI/zwg1fUMoTUhk+8Du8N4XEHu+x+6jlftvp6C24V6xvBxSGzzlMtOpFJ+zhUQnvbQWvNHZJcjItAhNTTCVPW5C42ksaXYs0iWfIP7D9T7Zh+mYc3ewtoYeIqvILIL864G81IqxT/y/8iy6BZvpTvPYqN89mfAQDgZoUlgyFWejcyjBasPsJMdXmHABAnmDxj/qgn035C5uCx6IIwb1Y5D7Y3HHFJ9E6sruT1uubFEH90b5jaejl3krDDHd4m89iSAS9+s4ZMcYzrSKn2ROBuK1d9B9AP22AIaByLNVgx44AQZ5DWqML5bNpgiEBCnHz7kDVRQktnDo4Gl8pTL4wC2dU76SiNXSaXiiBeEJteMjqOsHYO1vpnCTg5vbaLwCGpkuwVLbzQbV1vER3Mek4NQtILTOp1WW6s46HQeLpomjjtXQs5wXrvj+EPVrAs5hRxIx2vBIk3kbE1neYT2Fpns43cAp3CmMAN8iEDrG6yI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sZ/Q7oXZP05kMpY6YGu7r+xXqs07mKjgnN+2dLlsVoAf/yHBAeH5cjUA6X+o2xQXi1pmsMpoQwTDWePBWDnkrYzq0vJW8qty3UinHoFss2xT5RqR4Q7AUSAmbVFyt60m4Yb0YLibfPC2gqUEw02Yu5yoQdSdE4/C7nu0WxQuHsu0GgTKdATg4ghoH91OCp7zgQ38BABDUf0kw2SxEXQu7ng+TzLq4othiEEBTj+vB4XcE2Ik18s2UyqXnYXPx0RHMjOfWHPffyxR3ZuBCd9lSpA3t12RH+scsieR8ln5gvvnVrmED+aOlD/rcdouTFMku5GRE5MtDse2WYAmrn9tMuMgz6jbIQ2ACaxn822aChRMDF8uk2oOZYLVWWV95UVxXcb5hXPWMEWB73ge4uy4Q/yO2oW7P3gguoZq/n/LYVFZhS2RwyOmZQIxc9tyogpo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 13:44:19.5035 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf367f9-e313-4177-ea12-08dec3088b34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF016FC81DF
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[shahyan.soltani@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:from_smtp,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B454A648A07

Move struct amdgpu_mqd_prop, struct amdgpu_mqd, and helpers from the monolithic amdgpu.h into
a new amdgpu_mqd.h file.

This is part of the ongoing effort to reduce the size of amdgpu.h into their own respective
separate headers.

Signed-off-by: Shahyan Soltani <shahyan.soltani@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 47 +---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mqd.h | 75 +++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 46 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_mqd.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 8fb70731ea58..9473626ea96f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -114,6 +114,7 @@
 #include "amdgpu_sa.h"
 #include "amdgpu_wb.h"
 #include "amdgpu_ip.h"
+#include "amdgpu_mqd.h"
 #include "amdgpu_uid.h"
 #include "amdgpu_video_codecs.h"
 #if defined(CONFIG_DRM_AMD_ISP)
@@ -611,44 +612,6 @@ struct amd_powerplay {
 					  (rid == 0x01) || \
 					  (rid == 0x10))))
 
-enum amdgpu_mqd_update_flag {
-       AMDGPU_UPDATE_FLAG_DBG_WA_ENABLE = 1,
-       AMDGPU_UPDATE_FLAG_DBG_WA_DISABLE = 2,
-       AMDGPU_UPDATE_FLAG_IS_GWS = 4, /* quirk for gfx9 IP */
-};
-
-struct amdgpu_mqd_prop {
-	uint64_t mqd_gpu_addr;
-	uint64_t hqd_base_gpu_addr;
-	uint64_t rptr_gpu_addr;
-	uint64_t wptr_gpu_addr;
-	uint32_t queue_size;
-	bool use_doorbell;
-	uint32_t doorbell_index;
-	uint64_t eop_gpu_addr;
-	uint32_t hqd_pipe_priority;
-	uint32_t hqd_queue_priority;
-	uint32_t mqd_stride_size;
-	bool allow_tunneling;
-	bool hqd_active;
-	uint64_t shadow_addr;
-	uint64_t gds_bkup_addr;
-	uint64_t csa_addr;
-	uint64_t fence_address;
-	bool tmz_queue;
-	bool kernel_queue;
-	uint32_t *cu_mask;
-	uint32_t cu_mask_count;
-	uint32_t cu_flags;
-	bool is_user_cu_masked;
-};
-
-struct amdgpu_mqd {
-	unsigned mqd_size;
-	int (*init_mqd)(struct amdgpu_device *adev, void *mqd,
-			struct amdgpu_mqd_prop *p);
-};
-
 struct amdgpu_pcie_reset_ctx {
 	bool in_link_reset;
 	bool occurs_dpc;
@@ -1035,14 +998,6 @@ struct amdgpu_device {
 	struct amdgpu_kfd_dev		kfd;
 };
 
-/*
- * MES FW uses address(mqd_addr + sizeof(struct mqd) + 3*sizeof(uint32_t))
- * as fence address and writes a 32 bit fence value to this address.
- * Driver needs to allocate at least 4 DWs extra memory in addition to
- * sizeof(struct mqd). Add 8 DWs and align to AMDGPU_GPU_PAGE_SIZE for safety.
- */
-#define AMDGPU_MQD_SIZE_ALIGN(mqd_size) AMDGPU_GPU_PAGE_ALIGN(((mqd_size) + 32))
-
 static inline uint32_t amdgpu_ip_version(const struct amdgpu_device *adev,
 					 uint8_t ip, uint8_t inst)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mqd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mqd.h
new file mode 100644
index 000000000000..3806ade5fa71
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mqd.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT
+ *
+ * Copyright 2026 Advanced Micro Devices, Inc.
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
+ */
+#ifndef __AMDGPU_MQD_H__
+#define __AMDGPU_MQD_H__
+
+#include <linux/types.h>
+
+struct amdgpu_device;
+
+enum amdgpu_mqd_update_flag {
+	AMDGPU_UPDATE_FLAG_DBG_WA_ENABLE = 1,
+	AMDGPU_UPDATE_FLAG_DBG_WA_DISABLE = 2,
+	AMDGPU_UPDATE_FLAG_IS_GWS = 4, /* quirk for gfx9 IP */
+};
+
+struct amdgpu_mqd_prop {
+	uint64_t mqd_gpu_addr;
+	uint64_t hqd_base_gpu_addr;
+	uint64_t rptr_gpu_addr;
+	uint64_t wptr_gpu_addr;
+	uint32_t queue_size;
+	bool use_doorbell;
+	uint32_t doorbell_index;
+	uint64_t eop_gpu_addr;
+	uint32_t hqd_pipe_priority;
+	uint32_t hqd_queue_priority;
+	uint32_t mqd_stride_size;
+	bool allow_tunneling;
+	bool hqd_active;
+	uint64_t shadow_addr;
+	uint64_t gds_bkup_addr;
+	uint64_t csa_addr;
+	uint64_t fence_address;
+	bool tmz_queue;
+	bool kernel_queue;
+	uint32_t *cu_mask;
+	uint32_t cu_mask_count;
+	uint32_t cu_flags;
+	bool is_user_cu_masked;
+};
+
+struct amdgpu_mqd {
+	unsigned mqd_size;
+	int (*init_mqd)(struct amdgpu_device *adev, void *mqd,
+			struct amdgpu_mqd_prop *p);
+};
+
+/*
+ * MES FW uses address(mqd_addr + sizeof(struct mqd) + 3*sizeof(uint32_t))
+ * as fence address and writes a 32 bit fence value to this address.
+ * Driver needs to allocate at least 4 DWs extra memory in addition to
+ * sizeof(struct mqd). Add 8 DWs and align to AMDGPU_GPU_PAGE_SIZE for safety.
+ */
+#define AMDGPU_MQD_SIZE_ALIGN(mqd_size) AMDGPU_GPU_PAGE_ALIGN(((mqd_size) + 32))
+#endif
-- 
2.54.0


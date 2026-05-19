Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APwvBhkgDGqoWgUAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 10:32:25 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF957A21D
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2026 10:32:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDC310EB53;
	Tue, 19 May 2026 08:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pEAUfUkg";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013052.outbound.protection.outlook.com
 [40.93.196.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1629710EB4F;
 Tue, 19 May 2026 08:32:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zD/dg0LHRtH5W9yth52UVvVj/tdKsBu8ok2Sgr7hKuulq7n93C0SQFRNZy9uXwt1ETpVE4htmMT/t0lo3DByQGPV8HUy1CEuIYpdPy6FT42KeLHMQTg1tMcVCNFdE+z/vpVSgH5dDNcSgiSDKgsIwSNM+Ze0g5dBXDfeEfO+Uj2arS2tP355Lq9JkHhKGl6emA46yLZGjyJJ5d8rT0eVkcwA0nfJ4tAuMzVfQv+7muvuCD8NXXg0PBv1sOkN19xi70/TZ6kiiDvYBuIbm2wB8AS4VjrF64EGRDtTeZXvzp9IfAESmXRIzwzyAURzSdnVxTZStz2HN6GcUfdeaa0ncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mHQA5pFmhSPv1li6zid3ZrnTpOubpppjckAw+r+0rU=;
 b=FcRIBswxz9/WqflNDBIhnBimO7h/TcCMF+0Ikoe3deNhqwXCvhhtDgqXBEyXCNH77apg3+swVqup9EL7xv8aJYXG2Ir6nybowBQGVm8fwQfVCbOKZl67paJoaLq//hl2AQILsS5A6GUk3EzCtG4lseddO5tI1+7DjvPtsWqBT/HoYf+s+qBY4Vwk2Pyx7XrCRNbo8etbZm95qn/S3RkMqBogrki/fsdYtBgtLpzP9KRmJoRHVPlBSSRvuvXSOANjwLl/kETEYYBYssOnGTg77WXzmaF6KdKupR/uHRiDBTuDUf60Y39Dwwigtd4Mqlq+HZs3wjf7KNXND7qBcZVoaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mHQA5pFmhSPv1li6zid3ZrnTpOubpppjckAw+r+0rU=;
 b=pEAUfUkg7LJ+RCz+ZE4zNg/UQ7Iu7VqyNFdp6n7aa8svKvjVcl5/SSEAxzhWtp9pCSXxI1QnQfd7C1nBjHBM7KbILNAXeME8h3Qu9LfhJDE8KlZfiO5eZvRWNK8GPk+YQxpX/UMhJRBxHgiwJT4v7ZUed/SJPvoiCO+dd9Gogdg=
Received: from CH0PR03CA0390.namprd03.prod.outlook.com (2603:10b6:610:119::14)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 08:32:12 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::15) by CH0PR03CA0390.outlook.office365.com
 (2603:10b6:610:119::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 08:32:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:32:11 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 03:32:06 -0500
From: Honglei Huang <honglei1.huang@amd.com>
To: <Alexander.Deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <Christian.Koenig@amd.com>, <Oak.Zeng@amd.com>, <Jenny-Jing.Liu@amd.com>,
 <Philip.Yang@amd.com>, <Xiaogang.Chen@amd.com>, <Ray.Huang@amd.com>,
 <Lingshan.Zhu@amd.com>, <Junhua.Shen@amd.com>, <Yiru.Ma@amd.com>,
 <sima@ffwll.ch>, <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <dakr@kernel.org>, <aliceryhl@google.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <honghuan@amd.com>
Subject: [RFC V6 06/12] drm/amdgpu: add SVM range types and work queue
 interface
Date: Tue, 19 May 2026 16:30:51 +0800
Message-ID: <20260519083057.3108087-7-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519083057.3108087-1-honglei1.huang@amd.com>
References: <20260519083057.3108087-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6406fb-7ce4-4436-4aae-08deb5811f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|921020|3023799003|11063799005|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: apchwjvTEqtcK5El2KYomKj77Q8llmJby2e1jX/603veXA1DRhaPdgYuvH4w8joF/HWNcSuyZ5rQHaRMaKERLVOqxDDqSZM1pgdX+DReTdfrEhZMVAOYu84v4TLzRkA8J5yBXeSUasqI/Cu4ku3u6R59YzuIRPIlzwG7jOzmBs2QbrBYmRgUsPos6E5HV56JqXpPrdg7lazxRpt4v1leIeSYampTdvF26+1XyV1+MKFujV4YjFIXhKyVzaMQEQKt4VbWIKPf4HyNzq5TKJvUOn9aAa56qnuypG3G1mMH7yGF62ZU3he1ycwkyTMlAYJ6vK3zWms25iNHCgZ/vOB0+z18Inu3xfPOO1Uerleq1EccH/tko+J3Zc4KL5ZJhb6j3celvZ+iN+qs5RB9i5rxWrFjSwdVr8Jx3WU7slHVTHehLdJy/gDf3WnAvzLbKZJgcUamphYvFOi9cdtRRIvF5GUFQunFzjXXieb8WJYYGXUUJdgVMM8huDuuHX4o9V2BQaNOL9n6e/sUccSqiYVpNLn9DLHYwEXc+NTImphxsQE+WE6M3fOYHXK+Yds8zeHO9KDlKwUdsPlUDt2VNWZgG42QC5VcZz7tmasgmOLhhRJknvyVoXpEoA748MDBtBu0m08OtUPZD1RTWgE/G7Z4eePcL+7Q8uIWT9XIdiWCgiSz8Aoy0PwcJb0rlD9ryS8Y7FX8ZontisbL9+QNEJWw7RnmmPnH9o/5cDu/Q/zYDmwKQDYmtZMR564BTO5BSE4uRt5p3dLyn0qRfQtq/teq2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(921020)(3023799003)(11063799005)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6NiWYJhf9whuoO5yLD9rA91G0X45Lj/IE1wzJuaQKBvf/TfON/Vr8IxWGmqnOX8o7ZWYwF78skKmqG4sXtpUDWt6dQpa9ssSl1xBcV1ttzZuhV7Spi7e8SLttxJNgSmpwxMhYNAzI3uJMeKhTrP8dNO0LhtDmzofFTqUim0pIFG3PT+TsV+hmv7lglvD39wVyjvGkHzMHhQfUCPjzORrfYx53wC5ppZd6FlYcUfyf/d7Z8UUHwj6lgIB50N5mVRmltQlC6OYVnyyydl1n0F3ms4nhpezPHG56eYW4FYvPYVdAKoRSYUgO5JueANJnUuM5LvUf/wu1332IopmKVAAFOPDeMrkDjut+ylyaUAwSnJ+zYEMiA49baL31l9iueXAihb0dKUw+MMQh3vDLk5L5lZqzWppgRMzDlYj7rgf5VMLluPIcmvl/31KvC+pCjSO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:32:11.4175 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6406fb-7ce4-4436-4aae-08deb5811f5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: B9DF957A21D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Honglei Huang <honghuan@amd.com>

Add amdgpu_svm_range.h with GPU-mapped range types and interfaces:
- enum amdgpu_svm_range_queue_state: NOT_QUEUED, IN_GC, IN_RESTORE,
  PROCESSING states for work queue management
- struct amdgpu_svm_range: extends drm_gpusvm_range with gpu_mapped
  state, queue_state, attribute flags, work queue node, pending
  ops/pages, and validation timestamp.  PTE flags are not cached on
  the range; they are recomputed per DMA segment from the segment's
  drm_pagemap protocol when the mapping is programmed.
- enum amdgpu_svm_range_op: NONE, UNMAP operation types
- struct amdgpu_svm_range_op_ctx: dequeue context for GC processing
- Helper macro: UNMAP_WORK
- Inline helper: amdgpu_svm_range_invalidate_gpu_mapping
- AMDGPU_SVM_RANGE_DEBUG trace macro with range details
- Full range API declarations: find_or_insert, get_pages,
  update_mapping, update_gpu_range, lock_vm_pd, invalidate,
  map_attrs, notifier_event_begin, dequeue/put helpers,
  zap_ptes (page-range based), and evict (devmem-aware wrapper).
  attr_pte_flags takes an enum drm_interconnect_protocol; is_valid,
  update_gpu_range and update_mapping take the attribute set plus a
  read_only flag instead of a pre-computed pte_flags value.

Include <drm/drm_pagemap.h> for enum drm_interconnect_protocol.

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.h | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.h

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.h
new file mode 100644
index 000000000..82d4b353b
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.h
@@ -0,0 +1,166 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
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
+ *
+ */
+
+#ifndef __AMDGPU_SVM_RANGE_H__
+#define __AMDGPU_SVM_RANGE_H__
+
+#include <drm/drm_gpusvm.h>
+#include <drm/drm_pagemap.h>
+
+#include "amdgpu_svm.h"
+#include "amdgpu_vm.h"
+
+#include <linux/ktime.h>
+#include <linux/list.h>
+#include <linux/types.h>
+
+struct amdgpu_svm;
+struct amdgpu_svm_attr_range;
+struct amdgpu_svm_attrs;
+struct dma_fence;
+struct drm_exec;
+struct drm_gpusvm_notifier;
+struct drm_gpusvm_range;
+struct mmu_notifier_range;
+
+enum amdgpu_svm_range_queue_state {
+	AMDGPU_SVM_RANGE_NOT_QUEUED = 0,
+	AMDGPU_SVM_RANGE_IN_GC,
+	AMDGPU_SVM_RANGE_IN_RESTORE,
+	AMDGPU_SVM_RANGE_PROCESSING,
+};
+
+struct amdgpu_svm_range {
+	struct drm_gpusvm_range base;
+	struct list_head work_node;
+	bool gpu_mapped;
+	u8 queue_state;
+	u8 pending_ops;
+	unsigned long pending_start_page;
+	unsigned long pending_last_page;
+	uint32_t attr_flags;
+	ktime_t validate_timestamp;
+};
+
+static inline struct amdgpu_svm_range *
+to_amdgpu_svm_range(struct drm_gpusvm_range *range)
+{
+	return container_of(range, struct amdgpu_svm_range, base);
+}
+
+static inline void
+amdgpu_svm_range_invalidate_gpu_mapping(struct amdgpu_svm_range *range)
+{
+	WRITE_ONCE(range->gpu_mapped, false);
+}
+
+#define AMDGPU_SVM_RANGE_DEBUG(r__, op__)                                      \
+	AMDGPU_SVM_TRACE("%s: pasid=%u, gpusvm=%p, mapped=%d, "                \
+			 "seqno=%lu, range: [0x%lx-0x%lx]-"                    \
+			 "0x%lx\n",                                            \
+			 (op__), to_amdgpu_svm((r__)->base.gpusvm)->vm->pasid, \
+			 (r__)->base.gpusvm, READ_ONCE((r__)->gpu_mapped),     \
+			 (r__)->base.pages.notifier_seq,                       \
+			 drm_gpusvm_range_start(&(r__)->base) >> PAGE_SHIFT,   \
+			 drm_gpusvm_range_end(&(r__)->base) >> PAGE_SHIFT,     \
+			 (drm_gpusvm_range_end(&(r__)->base) -                 \
+			  drm_gpusvm_range_start(&(r__)->base)) >> PAGE_SHIFT)
+
+enum amdgpu_svm_range_op {
+	AMDGPU_SVM_RANGE_OP_NONE    = 0,
+	AMDGPU_SVM_RANGE_OP_UNMAP   = BIT(0),
+};
+
+struct amdgpu_svm_range_op_ctx {
+	struct amdgpu_svm_range *range;
+	unsigned long start_page;
+	unsigned long last_page;
+	uint8_t pending_ops;
+};
+
+#define UNMAP_WORK(ops)		((ops) & AMDGPU_SVM_RANGE_OP_UNMAP)
+
+void amdgpu_svm_capture_checkpoint_ts(struct amdgpu_svm *svm);
+
+uint64_t amdgpu_svm_range_attr_pte_flags(struct amdgpu_svm *svm,
+					 const struct amdgpu_svm_attrs *attrs,
+					 bool read_only,
+					 enum drm_interconnect_protocol proto);
+int amdgpu_svm_range_lock_vm_pd(struct amdgpu_svm *svm,
+				struct drm_exec *exec,
+				bool intr);
+bool amdgpu_svm_range_pages_valid(struct amdgpu_svm *svm,
+				  struct amdgpu_svm_range *range);
+bool amdgpu_svm_range_is_valid(struct amdgpu_svm *svm,
+			       struct amdgpu_svm_range *range,
+			       const struct amdgpu_svm_attrs *attrs);
+int amdgpu_svm_range_update_gpu_range(struct amdgpu_svm *svm,
+				      struct amdgpu_svm_range *range,
+				      const struct amdgpu_svm_attrs *attrs,
+				      bool read_only,
+				      bool flush_tlb, bool wait,
+				      struct dma_fence **fence);
+int amdgpu_svm_range_update_mapping(struct amdgpu_svm *svm,
+				    struct amdgpu_svm_range *range,
+				    const struct amdgpu_svm_attrs *attrs,
+				    bool read_only,
+				    bool intr, bool wait,
+				    bool flush_tlb);
+bool amdgpu_svm_range_dequeue_locked(struct amdgpu_svm *svm,
+				     struct list_head *work_list,
+				     struct amdgpu_svm_range_op_ctx *op_ctx);
+void amdgpu_svm_range_put_if_dequeued(struct amdgpu_svm *svm,
+				      struct amdgpu_svm_range *range);
+void amdgpu_svm_range_remove(struct amdgpu_svm *svm,
+			     struct amdgpu_svm_range *range,
+			     struct drm_gpusvm_ctx *ctx);
+int amdgpu_svm_range_map_attrs(struct amdgpu_svm *svm,
+			       const struct amdgpu_svm_attrs *attrs,
+			       unsigned long start, unsigned long end);
+int amdgpu_svm_range_invalidate_interval(struct amdgpu_svm *svm,
+					 unsigned long start_page,
+					 unsigned long last_page);
+int amdgpu_svm_range_zap_ptes(struct amdgpu_svm *svm,
+			      struct amdgpu_svm_range *range,
+			      unsigned long start_page,
+			      unsigned long last_page);
+void amdgpu_svm_range_evict(struct amdgpu_svm *svm,
+			    struct drm_gpusvm_range *range);
+void amdgpu_svm_range_invalidate(struct amdgpu_svm *svm,
+				 struct drm_gpusvm_notifier *notifier,
+				 const struct mmu_notifier_range *mmu_range,
+				 struct drm_gpusvm_range *first,
+				 uint64_t adj_start, uint64_t adj_end);
+bool amdgpu_svm_range_notifier_event_begin(struct amdgpu_svm *svm,
+					   struct drm_gpusvm_range *range,
+					   const struct mmu_notifier_range *mmu_range);
+struct amdgpu_svm_range *
+amdgpu_svm_range_find_or_insert(struct amdgpu_svm *svm, unsigned long addr,
+				unsigned long gpuva_start, unsigned long gpuva_end,
+				struct drm_gpusvm_ctx *ctx);
+int amdgpu_svm_range_get_pages(struct amdgpu_svm *svm,
+			       struct drm_gpusvm_range *range,
+			       struct drm_gpusvm_ctx *ctx);
+
+#endif /* __AMDGPU_SVM_RANGE_H__ */
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFI7FOAoGWpXrQgAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 07:49:20 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045585FD90A
	for <lists+amd-gfx@lfdr.de>; Fri, 29 May 2026 07:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F82610F8F8;
	Fri, 29 May 2026 05:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TknJ61lE";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010006.outbound.protection.outlook.com [52.101.46.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34DF10F8F3;
 Fri, 29 May 2026 05:49:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XruTjZ0Y2WriIdtSUJYoJJ+xITYsL5KP9pc3OqHUZa1E0giCFFdXr26hwhD/6CHmiJSzpWHLzU4Kjc968TzEvjTFm8FwQjNYwIXPSoTup56JtXgv+QJ8CA3TQmwKiLS9bZqPZS/EExgc9VJ8Rx8iTWWeAoQ3rGHfmFGsBQ7h2GzePZ7FvbxCNzFwkV94yKCNRxhKgmdoABOccRaTC+S1S/kAvcE078oQ8ia7z1PmvcVRuu5qoNcLjFzqgkdF6VDt/S1bN20FU5xEFq9XT5agxdvkgf260c5z+VbROL2NWAvYUwi95r6RrfYzhLQnGf7TqbgCFfjcUD90GdhchXHWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DkjdEFtMDdkWE0YmdmAAkl6zbR9G3Rl8MvwdBSwDztg=;
 b=UG+VroBZoDctl/2j/JlDit02MucdJUkqNheyBQ4hhnKk6mE1rNJitAaGn7ay9HPYCWfBaRYbbvIXcx3Qar77BWGXK3JaQ1UyZ8h9kmMhenCVxVkg0rZ4kMwyGc4rurPS0w9gyNxO1XQdHzPEZ5T8IeiluycdfmYcYGNG/cphw/ErY3zCArLrrDmB8YIFoARSN3AfEg5wX7HCDzv1iQEzqDrunNZ95WzbcSYt6eVSN62ni9Y/0qVFvoRZBrVISup1NcU//PAMQLsRENGSQ7rkPwkm024FbfTBtK/BeBXhBKOUbyyD0OH2qyzUvoLbZQMAyiuqGx+YRwma0kbDisHvhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkjdEFtMDdkWE0YmdmAAkl6zbR9G3Rl8MvwdBSwDztg=;
 b=TknJ61lEZ5AOz+TNmjArLXcVWVxvA/IRqCNKDSrhjNMyevlV6cwK9EZJgPOZpWd589Om4tklbGDwp4L+YBKBDAqPwlRDetyHthx/VJsYOmf+4oZDBuYCefLbDJguquFPSa9QeyqjVucsA1ExAg47mD4+4OHyi3i0nPaJzAy5ffI=
Received: from CH0P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::26)
 by PH8PR12MB7208.namprd12.prod.outlook.com (2603:10b6:510:224::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Fri, 29 May
 2026 05:49:04 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::10) by CH0P221CA0042.outlook.office365.com
 (2603:10b6:610:11d::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 05:49:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 05:49:04 +0000
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 29 May
 2026 00:48:58 -0500
From: Honglei Huang <honglei1.huang@amd.com>
To: <Alexander.Deucher@amd.com>, <Felix.Kuehling@amd.com>,
 <Christian.Koenig@amd.com>, <Oak.Zeng@amd.com>, <Jenny-Jing.Liu@amd.com>,
 <Philip.Yang@amd.com>, <Xiaogang.Chen@amd.com>, <Ray.Huang@amd.com>,
 <Lingshan.Zhu@amd.com>, <Junhua.Shen@amd.com>, <Yiru.Ma@amd.com>,
 <sima@ffwll.ch>, <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <dakr@kernel.org>, <aliceryhl@google.com>
CC: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <honghuan@amd.com>
Subject: [RFC V7 09/12] drm/amdgpu: add SVM notifier invalidate callback and
 checkpoint
Date: Fri, 29 May 2026 13:48:01 +0800
Message-ID: <20260529054804.596214-10-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529054804.596214-1-honglei1.huang@amd.com>
References: <20260529054804.596214-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|PH8PR12MB7208:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d355bcc-7dba-4482-29e5-08debd45fe15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|921020|18002099003|22082099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 08bkAjhfv+SxTUjBu1hpcfBh2LHY4CI5F6G8d1Jmk8m/banL+wmKmED2BYkNvmV43ZhvOkuWCe6kHHHPgDFqbTqD+ArT7PqZdTjUKATEPDVjtWASG4F9stcvmgPtNC6tqjm8K1z6+Yu1Qkpmca7OcPZaUovpIAeQZk34h5UnnSBsPtca6+mYYN3wjU3rD2tVTBa1WZw8wDBN5uLabKV73IK94VQHpzmgTHgl9m7D//GV18bdQujrmMBum4oO22nuXu5eEjE9foMXt0F2HIo0rLiKWRv/klVzcafjj2UR4XMnvYLP1304l9vT2u1KtCQUacXcFebhdsbre5yB6GFYXa1hmFsz/NV0Int7Gi2WNAgkQ/586vW1m+WClreIxWAsRflbGsQ/7ZiwlJBZ2P9Z8qoIM5p4FQx9Xd8E7YhSoxna3omM104k2H4XwxlXflFMKwo/qXbxA5uNO/vYCExVBk1Qik8cjMdLWHKfFgANzlZVYCFm+4w6Mp0EfLBO0hFkiOvh3ZqCVfcOt/MsPtDqJ04w07wqoAGCXWsx0qDcDVlyEmo/ve8BAOWa6CAXY2w8vXw1diEcbZxCQp6G58KtqumDT6THoImUpTwWqt+xumPrexprFqOIl/dvdo5hFChzvl7nPUMt4VqTRCZBy519ISIjCDguDkQxl1ZpANrp0sPE+otee4RPg/7Im+FY2IMTRhFna48wib3Yl1fAPf+KqT2nCQ+42fvxlv9NlL1EAkb6VFA3UqfgAVcr6CuEbGDIX1E1tsi/Bwc5/drVQ6B1Rg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(921020)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0TeMfKDiGdKxSVWLacGHzTvLoGZbx03ximmJFE312rI5bI4kWcm1ADk5fuI0DIW1PkAAs5sM5vvZkiFNQ4edb28ttkRTEOZYb3XXYvCtYJ8fkXUPqo6uWYmZa+vzJDnEWO47rqME1z3CcVgNMCSct3EvqCLHbdMj82ONQat01U5hNUmi7CUKYnlA9CrOpzYVv3mK0YjT4HKwn8s8FnKDiG4n3lzBMt6PkrNmOpbooPzv9g+msXHDReEijIt0Dlyi6wox9LVEPG8SX5xuIVx1AVpsiOtsc++xre1UZd9hXoj2kvQrr8BdjalkwnSO1+Z1f+KvLvpDMPmcFWAGz4JWbBCLV+FdT1vMjNKRdSord/SG2hYVimPAy9cbPTYgXdUPzWA9QsBsmUxEHGZ86AcSJyhLuCMoruAN8bByKh3DLvByLhFU8IrnBUf9sEVjQkzl
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 05:49:04.5824 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d355bcc-7dba-4482-29e5-08debd45fe15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7208
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 045585FD90A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Honglei Huang <honghuan@amd.com>

Add invalidate_ranges callback and checkpoint timestamp:
- amdgpu_svm_capture_checkpoint_ts: capture interrupt handler write
  pointer timestamp for stale retry fault filtering
- amdgpu_svm_range_invalidate: invalidate_ranges callback dispatching
  per-range notifier begin/end with TLB flush batching, checkpoint
  timestamp capture on MMU_NOTIFY_UNMAP events

These complete the invalidation path: attribute changes trigger
invalidate_interval, while MMU notifier events flow through
amdgpu_svm_invalidate (in amdgpu_svm.c) which dispatches to this
callback via svm->invalidate_ranges() to perform PTE zap, TLB flush,
and GC queueing.

Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.c | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.c
index 17c0a9941..f1be2f2d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_svm_range.c
@@ -723,3 +723,52 @@ amdgpu_svm_range_put_if_dequeued(struct amdgpu_svm *svm,
 	if (release_kref)
 		drm_gpusvm_range_put(&range->base);
 }
+
+void amdgpu_svm_capture_checkpoint_ts(struct amdgpu_svm *svm)
+{
+	struct amdgpu_device *adev = svm->adev;
+	struct amdgpu_ih_ring *ih;
+	uint32_t checkpoint_wptr;
+
+	if (!adev->irq.retry_cam_enabled && adev->irq.ih1.ring_size) {
+		ih = &adev->irq.ih1;
+		checkpoint_wptr = amdgpu_ih_get_wptr(adev, ih);
+		if (ih->rptr != checkpoint_wptr) {
+			WRITE_ONCE(svm->checkpoint_ts,
+				   amdgpu_ih_decode_iv_ts(adev, ih,
+							  checkpoint_wptr, -1));
+			return;
+		}
+	}
+
+	ih = &adev->irq.ih_soft;
+	checkpoint_wptr = amdgpu_ih_get_wptr(adev, ih);
+	if (ih->rptr != checkpoint_wptr)
+		WRITE_ONCE(svm->checkpoint_ts,
+			   amdgpu_ih_decode_iv_ts(adev, ih,
+						  checkpoint_wptr, -1));
+}
+
+void amdgpu_svm_range_invalidate(struct amdgpu_svm *svm,
+				 struct drm_gpusvm_notifier *notifier,
+				 const struct mmu_notifier_range *mmu_range,
+				 struct drm_gpusvm_range *first,
+				 uint64_t adj_start, uint64_t adj_end)
+{
+	struct drm_gpusvm_range *r;
+	bool needs_flush = false;
+
+	if (mmu_range->event == MMU_NOTIFY_UNMAP)
+		amdgpu_svm_capture_checkpoint_ts(svm);
+
+	r = first;
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+		needs_flush |= amdgpu_svm_range_notifier_event_begin(svm, r,
+								     mmu_range);
+	if (needs_flush)
+		svm->flush_tlb(svm);
+
+	r = first;
+	drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end)
+		amdgpu_svm_range_notifier_event_end(svm, r, mmu_range);
+}
-- 
2.34.1


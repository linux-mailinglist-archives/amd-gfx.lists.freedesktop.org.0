Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6MJKGdSnM2oCEwYAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 10:09:56 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1057169E5A7
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2026 10:09:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=E2wyTbM9;
	spf=pass (mail.lfdr.de: domain of amd-gfx-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=amd-gfx-bounces@lists.freedesktop.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876C110F1EA;
	Thu, 18 Jun 2026 08:09:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010032.outbound.protection.outlook.com [52.101.201.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18D610F1EA;
 Thu, 18 Jun 2026 08:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gt6lEknQF+PQVOXrbR8y3LcK5tonECCZF9kvXshbsTDEi3P7cuFeUWTfezY7mcEjgd3i5Fh95sqt1ofvgQJzNY3E8il3FLQquMeuPjgkor/4mNUyyAnKh+GJcWYEXlFoQzPW+edvHfmJWiWHEaG6Ltv5Imkn7WQpCQkz/Af+O/4zNGkUvADRA3olWLf7ddsY0OMJ6fMWtT6vUUyiC1tHCU2/FOKTGPPjumEaW43/TsMgXBCDsR7pImpy61zf0S87riX3HX6PWBsBcXfUZgwYbFC4fIoVFuB+EzyFvmsXMVWnMftg4pu+dLzv9LJXUQfzAJMQKh37XkDbifv/dZEf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEn314D2VQSbdmI+R/R3PB/wZqf4tDlmMUjGjRqqyO8=;
 b=dIwRMFyL2IGY0Qti4xTLxy64lTPlIkdVCGBWz/3B/w889rhVicXTJdI6oa6mMQPwG8mcp3LiZtB8pBYRhY/e7ZOOe3LGk8eodAMn74QSAMP8hOMpR0hlRvUd4mJHm3WWp/trMT7dxe3UmNG2uQsimqKKnpHqcuheqGmsrZkiJ0058qYSVl7UTTuvz8FvQa2VjGiFT+NLcdzjKA2aWJbiCJfpPep6vQwAu8N5eh8RP/1PBrB6mZ1oUq1dekyPRN798jUd1LIIfxkNQsOzD/Bi2iSXypPeQYoZjrvDTOOvTkN1jPUtmewaxiGPfVGxAH4AltnVlbCBSj6olBAy7UHuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEn314D2VQSbdmI+R/R3PB/wZqf4tDlmMUjGjRqqyO8=;
 b=E2wyTbM9sThqViONhfT8C7S9zj8lzhTIYFV/oashB4iK1uVgXXCNUCiYO1/Kfy299i3FA+uL8g9lUP2bw2T38v4lga1clgBuR4X5GPobnR644vOVpUH9T1dR8UWBVFtpm3wF71MiIdfg1KS8ev5laGumzOEryphkPf1loxq+9xw=
Received: from PH8P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::16)
 by BL4PR12MB9535.namprd12.prod.outlook.com (2603:10b6:208:591::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 08:09:49 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:2d8:cafe::45) by PH8P221CA0001.outlook.office365.com
 (2603:10b6:510:2d8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Thu,
 18 Jun 2026 08:09:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Thu, 18 Jun 2026 08:09:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 03:09:49 -0500
Received: from honglei-remote.amd.com (10.180.168.240) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 18 Jun
 2026 01:09:44 -0700
From: Honglei Huang <honglei1.huang@amd.com>
To: <sima@ffwll.ch>, <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <dakr@kernel.org>
CC: <aliceryhl@google.com>, <Alexander.Deucher@amd.com>,
 <Felix.Kuehling@amd.com>, <Christian.Koenig@amd.com>, <Oak.Zeng@amd.com>,
 <Jenny-Jing.Liu@amd.com>, <Philip.Yang@amd.com>, <Xiaogang.Chen@amd.com>,
 <Ray.Huang@amd.com>, <Lingshan.Zhu@amd.com>, <Junhua.Shen@amd.com>,
 <Yiru.Ma@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <honghuan@amd.com>
Subject: [PATCH v3 5/5] drm/gpusvm: let the drm_gpusvm core context purely MM
 level
Date: Thu, 18 Jun 2026 16:09:02 +0800
Message-ID: <20260618080902.1527255-6-honglei1.huang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618080902.1527255-1-honglei1.huang@amd.com>
References: <20260618080902.1527255-1-honglei1.huang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|BL4PR12MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: 268ca04b-84f4-4b21-a203-08decd10f7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|23010399003|36860700016|376014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: vKyDDMO7mWkiP7LR8TeKFRVoU8OEX/4xfjJ22blhY2xkGYwlTVKc5yLWY3ZQgwO2yF/iJ5ZIw63g8ddPzdCcl/xEdLveL72WPNJvnkOxdbDqqHg/ndc3vLd+DKxlAVUmCrp5rcUwZgkwOH/rNBIz3cR8iAsgeMUxbR+pt3iNRm3OljT0I36TrjYa8yfO2TQ8EJJTeM+uhWee+DhhxMj9nSeKQueizqoAhskjFLTMLXzNFaEuw/Dv/o5LYl3hpW1tKaC0Qh8DjcpcYut8sSjJr2xCfcl2YJbshGV3DbPWcHJ1htYjtc0VDeoEXKPR9pWrY1tDeS03NygEPk2zO3aZbFnMLzavAv8WnUGdkhGCCbOQWErst1bkmlnlaO6gzWutralpkZ6B1i76L+1FYvN2ERCUTqbl90hZo2uHnN9mtqoz4JNaClrNmxSHQ0HbjqcHL1KX30tDHi9SouMtnALg9UQCkjwtvggmisteXli5j7JaX+rgEb0E1docylDY60/5jBsuKuFggBpIv5yOUCnC18qaDP6g6LLhKYisLg7DET34i6cJ4R/xmC7PXjhl88ijz2Ir6YgN4tdW5vRSWWzXPPzKLiyjR7FK2D6IQUPRZYJrtAxwuv0nSRXsfLSSbOA2WpCvfxrR8Gz5wXxruABBKXFK6/u/U+v2DP2omPQSzzbsd0ztIlWhTAvD7LHQUC5LN1N8clvQiAf/nDe0Xiyr83IecjkxztEXMNIm7Wo64ZU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(23010399003)(36860700016)(376014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sZZOV315JZfRn3LDtelxcS0zGYTusTY6COjWm6ipCBUqOBFtR2OPdneMIWU9Cs/6Yz2YX889WxxXOJYdRF7fl2xQE6aH0xyNeW9eIs0/47wPs1ABl3deNl8trsCPDKYFjTozPjfWMZ/rB/3KL+2aMWO0pedRlXspcKdKVqZwEd/atAxT/Jq1kNzpJYDLxZCkhKiLpEljPZd7dAxPRjEW8WiNJgrL/0EZKosG0wsS/uZC18CMcI1bT6RUk3phYdFP15hJGR6FVEA3dMErst8sAZkpMweKem54SpAomLBd7ZbsZUtdCdnKkaHJo9tfFiHngmHXzrkScS2RCXiXHTwr2IJk76GtP+aG16Z0yZc868Ea86rzXRJUPEaRV5bjzxraQLDKxdL0Mue3cYDnST8xKLg08Y9we2G3cVGA0ZQxl1gpUQLXLtEe1RcQa6wRb2CA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 08:09:49.2944 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 268ca04b-84f4-4b21-a203-08decd10f7cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9535
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[honglei1.huang@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	HAS_XOIP(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,intel.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lists.freedesktop.org:from_smtp];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_RCPT(0.00)[amd-gfx];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1057169E5A7

From: Honglei Huang <honghuan@amd.com>

The core mechanism of drm_gpusvm is HMM, which is fundamentally an
MM side subsystem. A drm_device, enters the picture on the device side at
DMA mapping / GPU bind.

So move struct drm_device from struct drm_gpusvm in drm_gpusvm. Let
drm_gpusvm keep its core neutral and leave device side decisions to
the driver. Make drm_gpusvm a pure MM level object.

  - Move the drm_device from struct drm_gpusvm. drm_device now stored in
    drm_gpusvm_pages.
  - Drop the drm parameter from drm_gpusvm_init()
  - Update the xe call sites in xe_svm_init() and other callers.

drm_device does not disappear from the framework, it is
relocated onto each drm_gpusvm_pages where DMA actually happens.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Honglei Huang <honghuan@amd.com>
---
 drivers/gpu/drm/drm_gpusvm.c | 8 ++++----
 drivers/gpu/drm/xe/xe_svm.c  | 4 ++--
 drivers/gpu/drm/xe/xe_svm.h  | 2 +-
 include/drm/drm_gpusvm.h     | 4 +---
 4 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 842bfb37a36..9d5badb038a 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -433,7 +433,6 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  * drm_gpusvm_init() - Initialize the GPU SVM.
  * @gpusvm: Pointer to the GPU SVM structure.
  * @name: Name of the GPU SVM.
- * @drm: Pointer to the DRM device structure.
  * @mm: Pointer to the mm_struct for the address space.
  * @mm_start: Start address of GPU SVM.
  * @mm_range: Range of the GPU SVM.
@@ -447,7 +446,9 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  * This function initializes the GPU SVM.
  *
  * Note: If only using the simple drm_gpusvm_pages API (get/unmap/free),
- * then only @gpusvm, @name, and @drm are expected. However, the same base
+ * then only @gpusvm and @name are expected. The @drm drm_device for dma
+ * mappings is bound per-pages via drm_gpusvm_init_pages() before the first
+ * drm_gpusvm_get_pages() call. However, the same base
  * @gpusvm can also be used with both modes together in which case the full
  * setup is needed, where the core drm_gpusvm_pages API will simply never use
  * the other fields.
@@ -455,7 +456,7 @@ static const struct mmu_interval_notifier_ops drm_gpusvm_notifier_ops = {
  * Return: 0 on success, a negative error code on failure.
  */
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-		    const char *name, struct drm_device *drm,
+		    const char *name,
 		    struct mm_struct *mm,
 		    unsigned long mm_start, unsigned long mm_range,
 		    unsigned long notifier_size,
@@ -473,7 +474,6 @@ int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
 	}
 
 	gpusvm->name = name;
-	gpusvm->drm = drm;
 	gpusvm->mm = mm;
 	gpusvm->mm_start = mm_start;
 	gpusvm->mm_range = mm_range;
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 77af0a8de63..7c4e40809e6 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -906,7 +906,7 @@ int xe_svm_init(struct xe_vm *vm)
 			return err;
 		}
 
-		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM", &vm->xe->drm,
+		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM",
 				      current->mm, 0, vm->size,
 				      xe_modparam.svm_notifier_size * SZ_1M,
 				      &gpusvm_ops, fault_chunk_sizes,
@@ -920,7 +920,7 @@ int xe_svm_init(struct xe_vm *vm)
 		}
 	} else {
 		err = drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
-				      &vm->xe->drm, NULL, 0, 0, 0, NULL,
+				      NULL, 0, 0, 0, NULL,
 				      NULL, 0);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
index 1423ab2f1d6..63ea991e2cb 100644
--- a/drivers/gpu/drm/xe/xe_svm.h
+++ b/drivers/gpu/drm/xe/xe_svm.h
@@ -235,7 +235,7 @@ static inline
 int xe_svm_init(struct xe_vm *vm)
 {
 #if IS_ENABLED(CONFIG_DRM_GPUSVM)
-	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)", &vm->xe->drm,
+	return drm_gpusvm_init(&vm->svm.gpusvm, "Xe SVM (simple)",
 			       NULL, 0, 0, 0, NULL, NULL, 0);
 #else
 	return 0;
diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
index 5edfa7d0c36..f40b52e3ae7 100644
--- a/include/drm/drm_gpusvm.h
+++ b/include/drm/drm_gpusvm.h
@@ -195,7 +195,6 @@ struct drm_gpusvm_range {
  * struct drm_gpusvm - GPU SVM structure
  *
  * @name: Name of the GPU SVM
- * @drm: Pointer to the DRM device structure
  * @mm: Pointer to the mm_struct for the address space
  * @mm_start: Start address of GPU SVM
  * @mm_range: Range of the GPU SVM
@@ -219,7 +218,6 @@ struct drm_gpusvm_range {
  */
 struct drm_gpusvm {
 	const char *name;
-	struct drm_device *drm;
 	struct mm_struct *mm;
 	unsigned long mm_start;
 	unsigned long mm_range;
@@ -271,7 +269,7 @@ struct drm_gpusvm_ctx {
 };
 
 int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
-		    const char *name, struct drm_device *drm,
+		    const char *name,
 		    struct mm_struct *mm,
 		    unsigned long mm_start, unsigned long mm_range,
 		    unsigned long notifier_size,
-- 
2.34.1


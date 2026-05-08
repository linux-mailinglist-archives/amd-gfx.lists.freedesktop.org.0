Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMTfGHCK/WnWfgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Fri, 08 May 2026 09:02:08 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E23744F2B99
	for <lists+amd-gfx@lfdr.de>; Fri, 08 May 2026 09:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F8010F369;
	Fri,  8 May 2026 07:02:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CAA10F369
 for <amd-gfx@lists.freedesktop.org>; Fri,  8 May 2026 07:02:04 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 64871p5o1504510; Fri, 8 May 2026 12:31:51 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 64871pI11504503;
 Fri, 8 May 2026 12:31:51 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu/userq: use drm_exec in amdgpu_userq_fence_read_wptr
Date: Fri,  8 May 2026 12:31:50 +0530
Message-Id: <20260508070150.1504484-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: E23744F2B99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:sunil.khatri@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sunil.khatri@amd.com,amd-gfx-bounces@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.629];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

To access the bo from vm mapping first lock the root bo and
then the object bo of the mapping to make sure both locks
are taken safely.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   | 50 +++++++++----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 35ced3c26c8c..e5522e953edc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -370,34 +370,35 @@ static int amdgpu_userq_fence_read_wptr(struct amdgpu_device *adev,
 {
 	struct amdgpu_bo_va_mapping *mapping;
 	struct amdgpu_bo *bo;
+	struct drm_exec exec;
 	u64 addr, *ptr;
-	int r;
-
-	r = amdgpu_bo_reserve(queue->vm->root.bo, false);
-	if (r)
-		return r;
+	int ret;
 
 	addr = queue->userq_prop->wptr_gpu_addr;
 	addr &= AMDGPU_GMC_HOLE_MASK;
 
-	mapping = amdgpu_vm_bo_lookup_mapping(queue->vm, addr >> PAGE_SHIFT);
-	if (!mapping) {
-		amdgpu_bo_unreserve(queue->vm->root.bo);
-		DRM_ERROR("Failed to lookup amdgpu_bo_va_mapping\n");
-		return -EINVAL;
-	}
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 2);
+	drm_exec_until_all_locked(&exec) {
+		ret = amdgpu_vm_lock_pd(queue->vm, &exec, 1);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(ret))
+			goto lock_error;
 
-	bo = amdgpu_bo_ref(mapping->bo_va->base.bo);
-	amdgpu_bo_unreserve(queue->vm->root.bo);
-	r = amdgpu_bo_reserve(bo, true);
-	if (r) {
-		amdgpu_bo_unref(&bo);
-		DRM_ERROR("Failed to reserve userqueue wptr bo");
-		return r;
+		mapping = amdgpu_vm_bo_lookup_mapping(queue->vm, addr >> PAGE_SHIFT);
+		if (!mapping) {
+			ret = -EINVAL;
+			goto lock_error;
+		}
+
+		ret = drm_exec_lock_obj(&exec, &mapping->bo_va->base.bo->tbo.base);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(ret))
+			goto lock_error;
 	}
 
-	r = amdgpu_bo_kmap(bo, (void **)&ptr);
-	if (r) {
+	bo = amdgpu_bo_ref(mapping->bo_va->base.bo);
+	ret = amdgpu_bo_kmap(bo, (void **)&ptr);
+	if (ret) {
 		DRM_ERROR("Failed mapping the userqueue wptr bo");
 		goto map_error;
 	}
@@ -405,16 +406,15 @@ static int amdgpu_userq_fence_read_wptr(struct amdgpu_device *adev,
 	*wptr = le64_to_cpu(*ptr);
 
 	amdgpu_bo_kunmap(bo);
-	amdgpu_bo_unreserve(bo);
 	amdgpu_bo_unref(&bo);
-
+	drm_exec_fini(&exec);
 	return 0;
 
 map_error:
-	amdgpu_bo_unreserve(bo);
 	amdgpu_bo_unref(&bo);
-
-	return r;
+lock_error:
+	drm_exec_fini(&exec);
+	return ret;
 }
 
 static void
-- 
2.34.1


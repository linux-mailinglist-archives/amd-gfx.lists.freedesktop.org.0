Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIbLJJeX+GknwwIAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 04 May 2026 14:56:55 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBF24BD4A9
	for <lists+amd-gfx@lfdr.de>; Mon, 04 May 2026 14:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC7510E3CF;
	Mon,  4 May 2026 12:56:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from rtg-sunil-navi33.amd.com (unknown [165.204.156.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40C510E3CF
 for <amd-gfx@lists.freedesktop.org>; Mon,  4 May 2026 12:56:51 +0000 (UTC)
Received: from rtg-sunil-navi33.amd.com (localhost [127.0.0.1])
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTP id
 644Cukk8091856; Mon, 4 May 2026 18:26:46 +0530
Received: (from sunil@localhost)
 by rtg-sunil-navi33.amd.com (8.15.2/8.15.2/Submit) id 644CuklH091855;
 Mon, 4 May 2026 18:26:46 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH] drm/amdgpu/userq: fix access to stale wptr mapping
Date: Mon,  4 May 2026 18:26:45 +0530
Message-Id: <20260504125645.91836-1-sunil.khatri@amd.com>
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
X-Rspamd-Queue-Id: EFBF24BD4A9
X-Rspamd-Action: no action
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
	NEURAL_HAM(-0.00)[-0.895];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]

Use drm_exec to take both locks i.e vm root bo and
wptr_obj bo to access the mapping data properly.

This fixes the security issue of unmap the wptr_obj while
a queue creation is in progress and passing other
bo at same address.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c | 122 ++++++++++-----------
 1 file changed, 57 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
index 501e2e10b4a6..3d4f83015488 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_userqueue.c
@@ -30,34 +30,6 @@
 #define AMDGPU_USERQ_PROC_CTX_SZ PAGE_SIZE
 #define AMDGPU_USERQ_GANG_CTX_SZ PAGE_SIZE
 
-static int
-mes_userq_map_gtt_bo_to_gart(struct amdgpu_bo *bo)
-{
-	int ret;
-
-	ret = amdgpu_bo_reserve(bo, true);
-	if (ret) {
-		DRM_ERROR("Failed to reserve bo. ret %d\n", ret);
-		goto err_reserve_bo_failed;
-	}
-
-	ret = amdgpu_ttm_alloc_gart(&bo->tbo);
-	if (ret) {
-		DRM_ERROR("Failed to bind bo to GART. ret %d\n", ret);
-		goto err_map_bo_gart_failed;
-	}
-
-	amdgpu_bo_unreserve(bo);
-	bo = amdgpu_bo_ref(bo);
-
-	return 0;
-
-err_map_bo_gart_failed:
-	amdgpu_bo_unreserve(bo);
-err_reserve_bo_failed:
-	return ret;
-}
-
 static int
 mes_userq_create_wptr_mapping(struct amdgpu_device *adev,
 			      struct amdgpu_userq_mgr *uq_mgr,
@@ -65,55 +37,75 @@ mes_userq_create_wptr_mapping(struct amdgpu_device *adev,
 			      uint64_t wptr)
 {
 	struct amdgpu_bo_va_mapping *wptr_mapping;
-	struct amdgpu_vm *wptr_vm;
 	struct amdgpu_userq_obj *wptr_obj = &queue->wptr_obj;
+	struct amdgpu_bo *obj;
+	struct amdgpu_vm *vm = queue->vm;
+	struct drm_exec exec;
 	int ret;
 
-	wptr_vm = queue->vm;
-	ret = amdgpu_bo_reserve(wptr_vm->root.bo, false);
-	if (ret)
-		return ret;
-
 	wptr &= AMDGPU_GMC_HOLE_MASK;
-	wptr_mapping = amdgpu_vm_bo_lookup_mapping(wptr_vm, wptr >> PAGE_SHIFT);
-	amdgpu_bo_unreserve(wptr_vm->root.bo);
-	if (!wptr_mapping) {
-		DRM_ERROR("Failed to lookup wptr bo\n");
-		return -EINVAL;
-	}
 
-	wptr_obj->obj = wptr_mapping->bo_va->base.bo;
-	if (wptr_obj->obj->tbo.base.size > PAGE_SIZE) {
-		DRM_ERROR("Requested GART mapping for wptr bo larger than one page\n");
-		return -EINVAL;
-	}
+	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
+	drm_exec_until_all_locked(&exec) {
+		ret = amdgpu_vm_lock_pd(vm, &exec, 1);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(ret))
+			goto fail_lock;
+
+		wptr_mapping = amdgpu_vm_bo_lookup_mapping(vm, wptr >> PAGE_SHIFT);
+		if (!wptr_mapping) {
+			DRM_ERROR("Failed to lock up wptr bo\n");
+			ret = -EINVAL;
+			goto fail_lock;
+		}
 
-	ret = mes_userq_map_gtt_bo_to_gart(wptr_obj->obj);
-	if (ret) {
-		DRM_ERROR("Failed to map wptr bo to GART\n");
-		return ret;
-	}
+		obj = wptr_mapping->bo_va->base.bo;
+		ret = drm_exec_prepare_obj(&exec, &obj->tbo.base, 1);
+		drm_exec_retry_on_contention(&exec);
+		if (unlikely(ret)) {
+			DRM_ERROR("Failed to prepare wptr bo\n");
+			goto fail_lock;
+		}
 
-	ret = amdgpu_bo_reserve(wptr_obj->obj, true);
-	if (ret) {
-		DRM_ERROR("Failed to reserve wptr bo\n");
-		return ret;
-	}
+		/* mapping now should be stable since both the locks are held */
+		wptr_mapping = amdgpu_vm_bo_lookup_mapping(vm, wptr >> PAGE_SHIFT);
+		if (!wptr_mapping) {
+			DRM_ERROR("Failed to lock up wptr bo\n");
+			ret = -EINVAL;
+			goto fail_lock;
+		}
 
-	/* TODO use eviction fence instead of pinning. */
-	ret = amdgpu_bo_pin(wptr_obj->obj, AMDGPU_GEM_DOMAIN_GTT);
-	if (ret) {
-		drm_file_err(uq_mgr->file, "[Usermode queues] Failed to pin wptr bo\n");
-		goto unresv_bo;
-	}
+		wptr_obj->obj = amdgpu_bo_ref(wptr_mapping->bo_va->base.bo);
+
+		if (wptr_obj->obj->tbo.base.size > PAGE_SIZE) {
+			DRM_ERROR("Requested wptr bo size is larger than one page\n");
+			ret = -EINVAL;
+			goto fail_map;
+		}
+
+		ret = amdgpu_ttm_alloc_gart(&wptr_obj->obj->tbo);
+		if (ret) {
+			DRM_ERROR("Failed to bind bo to GART. ret %d\n", ret);
+			goto fail_map;
+		}
+
+		/* TODO use eviction fence instead of pinning. */
+		ret = amdgpu_bo_pin(wptr_obj->obj, AMDGPU_GEM_DOMAIN_GTT);
+		if (ret) {
+			DRM_ERROR("Failed to pin wptr bo. ret %d\n", ret);
+			goto fail_map;
+		}
 
-	queue->wptr_obj.gpu_addr = amdgpu_bo_gpu_offset(wptr_obj->obj);
-	amdgpu_bo_unreserve(wptr_obj->obj);
+		queue->wptr_obj.gpu_addr = amdgpu_bo_gpu_offset(wptr_obj->obj);
+	}
 
+	drm_exec_fini(&exec);
 	return 0;
 
-unresv_bo:
-	amdgpu_bo_unreserve(wptr_obj->obj);
+fail_map:
+	amdgpu_bo_unref(&wptr_obj->obj);
+fail_lock:
+	drm_exec_fini(&exec);
 	return ret;
 
 }
-- 
2.34.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA408B5F5A
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2024 18:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786C710F486;
	Mon, 29 Apr 2024 16:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FGSinlWh";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAC710F453
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Apr 2024 16:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+VTiIhyFxhOZ42lREnvxIAa+NZP09ue3mmoelO1mqc4=; b=FGSinlWht/0u+PXdiLQdqF2k7N
 UQzrqO67Y1ZnrV3L5W4wwrqxoxSQvoJUI6wrWN7sn1y6JZHWzbLLgTyl622aeknXTqRtwxo0Bm4pO
 j6aCjoNVg2Sl6+ero9HS0C5uuQrQlBhDOAE6KuaTAPT57bdlodUNlnug4UzD5imnY1T/umVDmeTrh
 6DgedQ1Z5VLg/gNO55NM+i91tpiw6O4ttYS4YoMo5W2O9xnscLWBT/JjV6ylasJKc/KNqViFR0JBt
 19uBmfoMmNIJgkCAKL5CXcb0kjUV36FGPkudToUseul9jOoK07gYh7wWGdvya28zd9qRwascwkpGz
 f8gTbZ/w==;
Received: from [84.65.0.132] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s1U9m-001Nvy-F4; Mon, 29 Apr 2024 18:47:10 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH 1/3] drm/amdgpu: Add amdgpu_bo_is_vm_bo helper
Date: Mon, 29 Apr 2024 17:47:05 +0100
Message-ID: <20240429164707.49196-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Help code readability by replacing a bunch of:

bo->tbo.base.resv == vm->root.bo->tbo.base.resv

With:

amdgpu_vm_is_bo_always_valid(vm, bo)

No functional changes.

v2:
 * Rename helper and move to amdgpu_vm. (Christian)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 40 +++++++++++++++----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  2 ++
 3 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 67c234bcf89f..e698d65e9508 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -174,7 +174,7 @@ static int amdgpu_gem_object_open(struct drm_gem_object *obj,
 		return -EPERM;
 
 	if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID &&
-	    abo->tbo.base.resv != vm->root.bo->tbo.base.resv)
+	    !amdgpu_vm_is_bo_always_valid(vm, abo))
 		return -EPERM;
 
 	r = amdgpu_bo_reserve(abo, false);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 8af3f0fd3073..01ca4b35b369 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -333,7 +333,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 	base->next = bo->vm_bo;
 	bo->vm_bo = base;
 
-	if (bo->tbo.base.resv != vm->root.bo->tbo.base.resv)
+	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
 		return;
 
 	dma_resv_assert_held(vm->root.bo->tbo.base.resv);
@@ -1101,13 +1101,13 @@ static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
 	 * For now ignore BOs which are currently locked and potentially
 	 * changing their location.
 	 */
-	if (bo->tbo.base.resv != vm->root.bo->tbo.base.resv &&
+	if (!amdgpu_vm_is_bo_always_valid(vm, bo) &&
 	    !dma_resv_trylock(bo->tbo.base.resv))
 		return;
 
 	amdgpu_bo_get_memory(bo, stats);
-	if (bo->tbo.base.resv != vm->root.bo->tbo.base.resv)
-	    dma_resv_unlock(bo->tbo.base.resv);
+	if (amdgpu_vm_is_bo_always_valid(vm, bo))
+		dma_resv_unlock(bo->tbo.base.resv);
 }
 
 void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
@@ -1203,8 +1203,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 		uncached = false;
 	}
 
-	if (clear || (bo && bo->tbo.base.resv ==
-		      vm->root.bo->tbo.base.resv))
+	if (clear || amdgpu_vm_is_bo_always_valid(vm, bo))
 		last_update = &vm->last_update;
 	else
 		last_update = &bo_va->last_pt_update;
@@ -1246,7 +1245,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
 	 * the evicted list so that it gets validated again on the
 	 * next command submission.
 	 */
-	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
+	if (amdgpu_vm_is_bo_always_valid(vm, bo)) {
 		uint32_t mem_type = bo->tbo.resource->mem_type;
 
 		if (!(bo->preferred_domains &
@@ -1640,10 +1639,9 @@ static void amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,
 	if (mapping->flags & AMDGPU_PTE_PRT)
 		amdgpu_vm_prt_get(adev);
 
-	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
-	    !bo_va->base.moved) {
+	if (amdgpu_vm_is_bo_always_valid(vm, bo) && !bo_va->base.moved)
 		amdgpu_vm_bo_moved(&bo_va->base);
-	}
+
 	trace_amdgpu_vm_bo_map(bo_va, mapping);
 }
 
@@ -1922,7 +1920,7 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
 		if (before->flags & AMDGPU_PTE_PRT)
 			amdgpu_vm_prt_get(adev);
 
-		if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
+		if (amdgpu_vm_is_bo_always_valid(vm, bo) &&
 		    !before->bo_va->base.moved)
 			amdgpu_vm_bo_moved(&before->bo_va->base);
 	} else {
@@ -1937,7 +1935,7 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
 		if (after->flags & AMDGPU_PTE_PRT)
 			amdgpu_vm_prt_get(adev);
 
-		if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
+		if (amdgpu_vm_is_bo_always_valid(vm, bo) &&
 		    !after->bo_va->base.moved)
 			amdgpu_vm_bo_moved(&after->bo_va->base);
 	} else {
@@ -2017,7 +2015,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
 
 	if (bo) {
 		dma_resv_assert_held(bo->tbo.base.resv);
-		if (bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
+		if (amdgpu_vm_is_bo_always_valid(vm, bo))
 			ttm_bo_set_bulk_move(&bo->tbo, NULL);
 
 		for (base = &bo_va->base.bo->vm_bo; *base;
@@ -2111,7 +2109,7 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
 	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
 		struct amdgpu_vm *vm = bo_base->vm;
 
-		if (evicted && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
+		if (evicted && amdgpu_vm_is_bo_always_valid(vm, bo)) {
 			amdgpu_vm_bo_evicted(bo_base);
 			continue;
 		}
@@ -2122,7 +2120,7 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
 
 		if (bo->tbo.type == ttm_bo_type_kernel)
 			amdgpu_vm_bo_relocated(bo_base);
-		else if (bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
+		else if (amdgpu_vm_is_bo_always_valid(vm, bo))
 			amdgpu_vm_bo_moved(bo_base);
 		else
 			amdgpu_vm_bo_invalidated(bo_base);
@@ -2986,3 +2984,15 @@ void amdgpu_vm_update_fault_cache(struct amdgpu_device *adev,
 	xa_unlock_irqrestore(&adev->vm_manager.pasids, flags);
 }
 
+/**
+ * amdgpu_vm_is_bo_always_valid - check if the BO is VM always valid
+ *
+ * @vm: VM to test against.
+ * @abo: BO to be tested.
+ *
+ * Returns true if the BO is VM always valid.
+ */
+bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo)
+{
+	return bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv;
+}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 54d7da396de0..ec688a47dec1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -561,6 +561,8 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m);
 
 int amdgpu_vm_pt_map_tables(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 
+bool amdgpu_vm_is_bo_always_valid(struct amdgpu_vm *vm, struct amdgpu_bo *bo);
+
 /**
  * amdgpu_vm_tlb_seq - return tlb flush sequence number
  * @vm: the amdgpu_vm structure to query
-- 
2.44.0


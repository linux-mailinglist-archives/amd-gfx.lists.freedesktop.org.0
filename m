Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3B88FE16A
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2024 10:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC8710E06B;
	Thu,  6 Jun 2024 08:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jGxl/OXA";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4132110E056
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2024 08:47:35 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4215afa33b7so7703695e9.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2024 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717663653; x=1718268453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BSNX8gPiKi+VDpzyGMdgGD0PW5GPXFQyFWmvMNQ7RlE=;
 b=jGxl/OXAg0++J5NkvgkPGl2oL2GSqtVT3ITJT3TF0f2MSg1tFfT7jabpzU5EmIfQaC
 mYUqUQuQwr6auLkhqM8y/Lm+yY9pmyVU62v7lTCzxDX5O0pJUN/uM6fPPOxP/2j6WIXa
 tvedbJ3dQ5+afeDtEprnLYxqJjOh0Xwn5Qnad1/QU0OWxKvH6pcREupA+7uSKGBST2AQ
 BIzHFSts5an5XAms7iU/Edj5cBmbWiQjxy9J0h0Xm+WugPuopT5kDl6fiA41yocq7G+6
 bd3KvQvSnkiodBV+gsdAhm1Nik6Mko8NTszdoUAuR77mv/utT7mFdGpdBpju+DRQBqTl
 J8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717663653; x=1718268453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BSNX8gPiKi+VDpzyGMdgGD0PW5GPXFQyFWmvMNQ7RlE=;
 b=O8Fc/fATiak3jt/IdMXFqt8oSFl9meRKpzoTjVrLDH4GExxLy4d7Sv4mJwe8yoDWMl
 QCdCkrITiqPi9RETvjvEhXBBjnV5UUMiuRicFVYTuiLequMNssakW4Omrz1IButtKRNV
 151wkyvsRIcctsF0ed9QJHp5yjPgzIUW5eAyEz2YzJl2nXbC9XBAzKqig8B3uLgfkEv4
 2LqI+PL0Eq3TXoFv9cjuk4yIuymJO6d8z9zMIY6bpaKf6a+8R0UQNPm6tEbKsp2bCblA
 HXp01BTWpUh3Jh0QcBTe/QWnD8ucFnkbWmplMXap9qebe8uh3TW24BGrowIE2Lb12xM8
 JBFg==
X-Gm-Message-State: AOJu0YycJAHLSpMV+OtD75tBlDTQZHnZ+KnBe/74iIAwzc6JaA3mXZHS
 iSZ/h5aC9YzyJii+2C1oZV5xv9vRrlBnWlllwZyQwvkEvGGlwqgSuDpbz9mt
X-Google-Smtp-Source: AGHT+IFZ1GN2UMIxBZr83+wFqMT5xJ59KJU798AdHb2cTDzlzJKulp82jjZkzmZaB582BI3npWx1fQ==
X-Received: by 2002:a05:600c:1c12:b0:41d:d406:9416 with SMTP id
 5b1f17b1804b1-4215634de28mr42917565e9.34.1717663653214; 
 Thu, 06 Jun 2024 01:47:33 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:15a8:ad00:2659:1fc3:a820:90f4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fc47ebsm963781f8f.108.2024.06.06.01.47.32
 for <amd-gfx@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jun 2024 01:47:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: nuke the VM PD/PT shadow handling
Date: Thu,  6 Jun 2024 10:47:30 +0200
Message-Id: <20240606084730.96581-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606084730.96581-1-christian.koenig@amd.com>
References: <20240606084730.96581-1-christian.koenig@amd.com>
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

This was only used as workaround for recovering the page tables after
VRAM was lost and is no longer necessary after the function
amdgpu_vm_bo_reset_state_machine() started to do the same.

Compute never used shadows either, so the only proplematic case left is
SVM and that is most likely not recoverable in any way when VRAM is
lost.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  4 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  | 87 +--------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 67 +---------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  | 21 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 17 ----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c   | 56 +------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 19 +----
 7 files changed, 6 insertions(+), 265 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 1f71c7b98d77..c50e591aae5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1093,10 +1093,6 @@ struct amdgpu_device {
 
 	struct amdgpu_virt	virt;
 
-	/* link all shadow bo */
-	struct list_head                shadow_list;
-	struct mutex                    shadow_list_lock;
-
 	/* record hw reset is performed */
 	bool has_hw_reset;
 	u8				reset_magic[AMDGPU_RESET_MAGIC_NUM];
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 4096cb3e937e..be30ed4d456a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4073,9 +4073,6 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 	spin_lock_init(&adev->mm_stats.lock);
 	spin_lock_init(&adev->wb.lock);
 
-	INIT_LIST_HEAD(&adev->shadow_list);
-	mutex_init(&adev->shadow_list_lock);
-
 	INIT_LIST_HEAD(&adev->reset_list);
 
 	INIT_LIST_HEAD(&adev->ras_list);
@@ -4980,80 +4977,6 @@ static int amdgpu_device_ip_post_soft_reset(struct amdgpu_device *adev)
 	return 0;
 }
 
-/**
- * amdgpu_device_recover_vram - Recover some VRAM contents
- *
- * @adev: amdgpu_device pointer
- *
- * Restores the contents of VRAM buffers from the shadows in GTT.  Used to
- * restore things like GPUVM page tables after a GPU reset where
- * the contents of VRAM might be lost.
- *
- * Returns:
- * 0 on success, negative error code on failure.
- */
-static int amdgpu_device_recover_vram(struct amdgpu_device *adev)
-{
-	struct dma_fence *fence = NULL, *next = NULL;
-	struct amdgpu_bo *shadow;
-	struct amdgpu_bo_vm *vmbo;
-	long r = 1, tmo;
-
-	if (amdgpu_sriov_runtime(adev))
-		tmo = msecs_to_jiffies(8000);
-	else
-		tmo = msecs_to_jiffies(100);
-
-	dev_info(adev->dev, "recover vram bo from shadow start\n");
-	mutex_lock(&adev->shadow_list_lock);
-	list_for_each_entry(vmbo, &adev->shadow_list, shadow_list) {
-		/* If vm is compute context or adev is APU, shadow will be NULL */
-		if (!vmbo->shadow)
-			continue;
-		shadow = vmbo->shadow;
-
-		/* No need to recover an evicted BO */
-		if (!shadow->tbo.resource ||
-		    shadow->tbo.resource->mem_type != TTM_PL_TT ||
-		    shadow->tbo.resource->start == AMDGPU_BO_INVALID_OFFSET ||
-		    shadow->parent->tbo.resource->mem_type != TTM_PL_VRAM)
-			continue;
-
-		r = amdgpu_bo_restore_shadow(shadow, &next);
-		if (r)
-			break;
-
-		if (fence) {
-			tmo = dma_fence_wait_timeout(fence, false, tmo);
-			dma_fence_put(fence);
-			fence = next;
-			if (tmo == 0) {
-				r = -ETIMEDOUT;
-				break;
-			} else if (tmo < 0) {
-				r = tmo;
-				break;
-			}
-		} else {
-			fence = next;
-		}
-	}
-	mutex_unlock(&adev->shadow_list_lock);
-
-	if (fence)
-		tmo = dma_fence_wait_timeout(fence, false, tmo);
-	dma_fence_put(fence);
-
-	if (r < 0 || tmo <= 0) {
-		dev_err(adev->dev, "recover vram bo from shadow failed, r is %ld, tmo is %ld\n", r, tmo);
-		return -EIO;
-	}
-
-	dev_info(adev->dev, "recover vram bo from shadow done\n");
-	return 0;
-}
-
-
 /**
  * amdgpu_device_reset_sriov - reset ASIC for SR-IOV vf
  *
@@ -5113,12 +5036,8 @@ static int amdgpu_device_reset_sriov(struct amdgpu_device *adev,
 	if (r)
 		return r;
 
-	if (adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST) {
+	if (adev->virt.gim_feature & AMDGIM_FEATURE_GIM_FLR_VRAMLOST)
 		amdgpu_inc_vram_lost(adev);
-		r = amdgpu_device_recover_vram(adev);
-	}
-	if (r)
-		return r;
 
 	/* need to be called during full access so we can't do it later like
 	 * bare-metal does.
@@ -5535,9 +5454,7 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 			}
 		}
 
-		if (!r)
-			r = amdgpu_device_recover_vram(tmp_adev);
-		else
+		if (r)
 			tmp_adev->asic_reset_res = r;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 9227634b6173..2ee783217017 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -76,24 +76,6 @@ static void amdgpu_bo_user_destroy(struct ttm_buffer_object *tbo)
 	amdgpu_bo_destroy(tbo);
 }
 
-static void amdgpu_bo_vm_destroy(struct ttm_buffer_object *tbo)
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(tbo->bdev);
-	struct amdgpu_bo *shadow_bo = ttm_to_amdgpu_bo(tbo), *bo;
-	struct amdgpu_bo_vm *vmbo;
-
-	bo = shadow_bo->parent;
-	vmbo = to_amdgpu_bo_vm(bo);
-	/* in case amdgpu_device_recover_vram got NULL of bo->parent */
-	if (!list_empty(&vmbo->shadow_list)) {
-		mutex_lock(&adev->shadow_list_lock);
-		list_del_init(&vmbo->shadow_list);
-		mutex_unlock(&adev->shadow_list_lock);
-	}
-
-	amdgpu_bo_destroy(tbo);
-}
-
 /**
  * amdgpu_bo_is_amdgpu_bo - check if the buffer object is an &amdgpu_bo
  * @bo: buffer object to be checked
@@ -107,8 +89,7 @@ static void amdgpu_bo_vm_destroy(struct ttm_buffer_object *tbo)
 bool amdgpu_bo_is_amdgpu_bo(struct ttm_buffer_object *bo)
 {
 	if (bo->destroy == &amdgpu_bo_destroy ||
-	    bo->destroy == &amdgpu_bo_user_destroy ||
-	    bo->destroy == &amdgpu_bo_vm_destroy)
+	    bo->destroy == &amdgpu_bo_user_destroy)
 		return true;
 
 	return false;
@@ -718,52 +699,6 @@ int amdgpu_bo_create_vm(struct amdgpu_device *adev,
 	return r;
 }
 
-/**
- * amdgpu_bo_add_to_shadow_list - add a BO to the shadow list
- *
- * @vmbo: BO that will be inserted into the shadow list
- *
- * Insert a BO to the shadow list.
- */
-void amdgpu_bo_add_to_shadow_list(struct amdgpu_bo_vm *vmbo)
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(vmbo->bo.tbo.bdev);
-
-	mutex_lock(&adev->shadow_list_lock);
-	list_add_tail(&vmbo->shadow_list, &adev->shadow_list);
-	vmbo->shadow->parent = amdgpu_bo_ref(&vmbo->bo);
-	vmbo->shadow->tbo.destroy = &amdgpu_bo_vm_destroy;
-	mutex_unlock(&adev->shadow_list_lock);
-}
-
-/**
- * amdgpu_bo_restore_shadow - restore an &amdgpu_bo shadow
- *
- * @shadow: &amdgpu_bo shadow to be restored
- * @fence: dma_fence associated with the operation
- *
- * Copies a buffer object's shadow content back to the object.
- * This is used for recovering a buffer from its shadow in case of a gpu
- * reset where vram context may be lost.
- *
- * Returns:
- * 0 for success or a negative error code on failure.
- */
-int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow, struct dma_fence **fence)
-
-{
-	struct amdgpu_device *adev = amdgpu_ttm_adev(shadow->tbo.bdev);
-	struct amdgpu_ring *ring = adev->mman.buffer_funcs_ring;
-	uint64_t shadow_addr, parent_addr;
-
-	shadow_addr = amdgpu_bo_gpu_offset(shadow);
-	parent_addr = amdgpu_bo_gpu_offset(shadow->parent);
-
-	return amdgpu_copy_buffer(ring, shadow_addr, parent_addr,
-				  amdgpu_bo_size(shadow), NULL, fence,
-				  true, false, 0);
-}
-
 /**
  * amdgpu_bo_kmap - map an &amdgpu_bo buffer object
  * @bo: &amdgpu_bo buffer object to be mapped
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 29a86f17fac8..5a81ee7dc633 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -130,8 +130,6 @@ struct amdgpu_bo_user {
 
 struct amdgpu_bo_vm {
 	struct amdgpu_bo		bo;
-	struct amdgpu_bo		*shadow;
-	struct list_head		shadow_list;
 	struct amdgpu_vm_bo_base        entries[];
 };
 
@@ -269,22 +267,6 @@ static inline bool amdgpu_bo_encrypted(struct amdgpu_bo *bo)
 	return bo->flags & AMDGPU_GEM_CREATE_ENCRYPTED;
 }
 
-/**
- * amdgpu_bo_shadowed - check if the BO is shadowed
- *
- * @bo: BO to be tested.
- *
- * Returns:
- * NULL if not shadowed or else return a BO pointer.
- */
-static inline struct amdgpu_bo *amdgpu_bo_shadowed(struct amdgpu_bo *bo)
-{
-	if (bo->tbo.type == ttm_bo_type_kernel)
-		return to_amdgpu_bo_vm(bo)->shadow;
-
-	return NULL;
-}
-
 bool amdgpu_bo_is_amdgpu_bo(struct ttm_buffer_object *bo);
 void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain);
 
@@ -341,9 +323,6 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
 u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
 void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
 			  struct amdgpu_mem_stats *stats);
-void amdgpu_bo_add_to_shadow_list(struct amdgpu_bo_vm *vmbo);
-int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow,
-			     struct dma_fence **fence);
 uint32_t amdgpu_bo_get_preferred_domain(struct amdgpu_device *adev,
 					    uint32_t domain);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3abfa66d72a2..b497b345e44a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -464,7 +464,6 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		       void *param)
 {
 	struct amdgpu_vm_bo_base *bo_base;
-	struct amdgpu_bo *shadow;
 	struct amdgpu_bo *bo;
 	int r;
 
@@ -485,16 +484,10 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		spin_unlock(&vm->status_lock);
 
 		bo = bo_base->bo;
-		shadow = amdgpu_bo_shadowed(bo);
 
 		r = validate(param, bo);
 		if (r)
 			return r;
-		if (shadow) {
-			r = validate(param, shadow);
-			if (r)
-				return r;
-		}
 
 		if (bo->tbo.type != ttm_bo_type_kernel) {
 			amdgpu_vm_bo_moved(bo_base);
@@ -2122,10 +2115,6 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
 {
 	struct amdgpu_vm_bo_base *bo_base;
 
-	/* shadow bo doesn't have bo base, its validation needs its parent */
-	if (bo->parent && (amdgpu_bo_shadowed(bo->parent) == bo))
-		bo = bo->parent;
-
 	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
 		struct amdgpu_vm *vm = bo_base->vm;
 
@@ -2453,7 +2442,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	root_bo = amdgpu_bo_ref(&root->bo);
 	r = amdgpu_bo_reserve(root_bo, true);
 	if (r) {
-		amdgpu_bo_unref(&root->shadow);
 		amdgpu_bo_unref(&root_bo);
 		goto error_free_delayed;
 	}
@@ -2545,11 +2533,6 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	vm->last_update = dma_fence_get_stub();
 	vm->is_compute_context = true;
 
-	/* Free the shadow bo for compute VM */
-	amdgpu_bo_unref(&to_amdgpu_bo_vm(vm->root.bo)->shadow);
-
-	goto unreserve_bo;
-
 unreserve_bo:
 	amdgpu_bo_unreserve(vm->root.bo);
 	return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index e39d6e7643bf..c8e0b8cfd336 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -383,14 +383,6 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (r)
 		return r;
 
-	if (vmbo->shadow) {
-		struct amdgpu_bo *shadow = vmbo->shadow;
-
-		r = ttm_bo_validate(&shadow->tbo, &shadow->placement, &ctx);
-		if (r)
-			return r;
-	}
-
 	if (!drm_dev_enter(adev_to_drm(adev), &idx))
 		return -ENODEV;
 
@@ -448,10 +440,7 @@ int amdgpu_vm_pt_create(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			int32_t xcp_id)
 {
 	struct amdgpu_bo_param bp;
-	struct amdgpu_bo *bo;
-	struct dma_resv *resv;
 	unsigned int num_entries;
-	int r;
 
 	memset(&bp, 0, sizeof(bp));
 
@@ -484,42 +473,7 @@ int amdgpu_vm_pt_create(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	if (vm->root.bo)
 		bp.resv = vm->root.bo->tbo.base.resv;
 
-	r = amdgpu_bo_create_vm(adev, &bp, vmbo);
-	if (r)
-		return r;
-
-	bo = &(*vmbo)->bo;
-	if (vm->is_compute_context || (adev->flags & AMD_IS_APU)) {
-		(*vmbo)->shadow = NULL;
-		return 0;
-	}
-
-	if (!bp.resv)
-		WARN_ON(dma_resv_lock(bo->tbo.base.resv,
-				      NULL));
-	resv = bp.resv;
-	memset(&bp, 0, sizeof(bp));
-	bp.size = amdgpu_vm_pt_size(adev, level);
-	bp.domain = AMDGPU_GEM_DOMAIN_GTT;
-	bp.flags = AMDGPU_GEM_CREATE_CPU_GTT_USWC;
-	bp.type = ttm_bo_type_kernel;
-	bp.resv = bo->tbo.base.resv;
-	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
-	bp.xcp_id_plus1 = xcp_id + 1;
-
-	r = amdgpu_bo_create(adev, &bp, &(*vmbo)->shadow);
-
-	if (!resv)
-		dma_resv_unlock(bo->tbo.base.resv);
-
-	if (r) {
-		amdgpu_bo_unref(&bo);
-		return r;
-	}
-
-	amdgpu_bo_add_to_shadow_list(*vmbo);
-
-	return 0;
+	return amdgpu_bo_create_vm(adev, &bp, vmbo);
 }
 
 /**
@@ -569,7 +523,6 @@ static int amdgpu_vm_pt_alloc(struct amdgpu_device *adev,
 	return 0;
 
 error_free_pt:
-	amdgpu_bo_unref(&pt->shadow);
 	amdgpu_bo_unref(&pt_bo);
 	return r;
 }
@@ -581,17 +534,10 @@ static int amdgpu_vm_pt_alloc(struct amdgpu_device *adev,
  */
 static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
 {
-	struct amdgpu_bo *shadow;
-
 	if (!entry->bo)
 		return;
 
 	entry->bo->vm_bo = NULL;
-	shadow = amdgpu_bo_shadowed(entry->bo);
-	if (shadow) {
-		ttm_bo_set_bulk_move(&shadow->tbo, NULL);
-		amdgpu_bo_unref(&shadow);
-	}
 	ttm_bo_set_bulk_move(&entry->bo->tbo, NULL);
 
 	spin_lock(&entry->vm->status_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index 9b748d7058b5..390432a22ddd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -35,16 +35,7 @@
  */
 static int amdgpu_vm_sdma_map_table(struct amdgpu_bo_vm *table)
 {
-	int r;
-
-	r = amdgpu_ttm_alloc_gart(&table->bo.tbo);
-	if (r)
-		return r;
-
-	if (table->shadow)
-		r = amdgpu_ttm_alloc_gart(&table->shadow->tbo);
-
-	return r;
+	return amdgpu_ttm_alloc_gart(&table->bo.tbo);
 }
 
 /* Allocate a new job for @count PTE updates */
@@ -273,17 +264,13 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 
 		if (!p->pages_addr) {
 			/* set page commands needed */
-			if (vmbo->shadow)
-				amdgpu_vm_sdma_set_ptes(p, vmbo->shadow, pe, addr,
-							count, incr, flags);
 			amdgpu_vm_sdma_set_ptes(p, bo, pe, addr, count,
 						incr, flags);
 			return 0;
 		}
 
 		/* copy commands needed */
-		ndw -= p->adev->vm_manager.vm_pte_funcs->copy_pte_num_dw *
-			(vmbo->shadow ? 2 : 1);
+		ndw -= p->adev->vm_manager.vm_pte_funcs->copy_pte_num_dw;
 
 		/* for padding */
 		ndw -= 7;
@@ -298,8 +285,6 @@ static int amdgpu_vm_sdma_update(struct amdgpu_vm_update_params *p,
 			pte[i] |= flags;
 		}
 
-		if (vmbo->shadow)
-			amdgpu_vm_sdma_copy_ptes(p, vmbo->shadow, pe, nptes);
 		amdgpu_vm_sdma_copy_ptes(p, bo, pe, nptes);
 
 		pe += nptes * 8;
-- 
2.34.1


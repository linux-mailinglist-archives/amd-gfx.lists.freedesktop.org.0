Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890626375DC
	for <lists+amd-gfx@lfdr.de>; Thu, 24 Nov 2022 11:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054610E6C1;
	Thu, 24 Nov 2022 10:03:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF97E10E6BF;
 Thu, 24 Nov 2022 10:02:57 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id m19so617615edj.8;
 Thu, 24 Nov 2022 02:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DvwAqYih0xMYu99f2rWcvtNJO6gVq+yaho5oL0bMyFk=;
 b=b4EFYM9JWJKKff590imBv3Y8DfVdtCVE/UyIg1UvuQU8nZVDjTG4viQQiYKM3cxXN0
 t2xFlkdrelELUahogAzrCsOHXJXUwR5GRIDLgOn8qCg088HIPhV4ptfiNfM/2CGByGaU
 i1i//wrcxaE5H4FqWO56Q3RZP9hozY1WPAokfWdLddjpg+NN1ch5QmnKQLRmMKqzsXwV
 xLp5OURrqn8lJUssSRtyT3/XUDnFNbw/J/L7L/QJDlGuIKq0EvvOx/u8vUeNWTRJ9fQZ
 kinQmKMYWYZ+uNVUYRriEeiwKbXsiI+o9aOJzxr6FNi1iq9DA0FlQCULLeRv3e9313G3
 lyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DvwAqYih0xMYu99f2rWcvtNJO6gVq+yaho5oL0bMyFk=;
 b=avdIpi35FHX7SrPwpDANVEZE65TPOdByWV2xU4bwzy1Ksrw6TLTWvtC85obANbU9SU
 PqQ2vkcaa/bSqGruL8cgzFKlkm1Gv7j54SCyNa9MT3pIa3UHoskqk0LOaFOkfz7CbRAT
 jslpcaaZb8YEgDiR0njLDGRZj9nSimMErkpLvQb38ApofjRcIFMe/x0zppvMBPTVTNaF
 NHz0HcoMOCwG+2W9RPznfl4+J6ERyA5UcH9aQJVu59+VRVjmvq2F+ngSIYv94J2mBRk8
 e2iL6Q7tLsh56m05uOu1T7Amz1ZNhqYseWybiHi6QVp3XTDcfiKQBO7+Qe7oknXlvSfQ
 iSqA==
X-Gm-Message-State: ANoB5pl0mFEFoQApsX9JPGCgLLY6TZ5K6x1HYzPgSG9NFfaDhawESW7K
 AOcZPaorNAzzGTNYpHkVMlNoYCBFTiI=
X-Google-Smtp-Source: AA0mqf6Re/CGAtZy1nEqK/3xKlcMkygKQZSf4iHWwsQRMf/eFISLeBFXlO7vsgHDeUQVjXD0iIElYw==
X-Received: by 2002:a05:6402:4286:b0:458:7489:34ea with SMTP id
 g6-20020a056402428600b00458748934eamr16037622edc.264.1669284176442; 
 Thu, 24 Nov 2022 02:02:56 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 ey3-20020a0564022a0300b00461816beef9sm328907edb.14.2022.11.24.02.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 02:02:55 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alexander.Deucher@amd.com, Marek.Olsak@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/ttm: use per BO cleanup workers
Date: Thu, 24 Nov 2022 11:02:51 +0100
Message-Id: <20221124100252.2744-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221124100252.2744-1-christian.koenig@amd.com>
References: <20221124100252.2744-1-christian.koenig@amd.com>
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
Cc: Amaranath.Somalapuram@amd.com, Arunpravin.PaneerSelvam@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Instead of a single worker going over the list of delete BOs in regular
intervals use a per BO worker which blocks for the resv object and
locking of the BO.

This not only simplifies the handling massively, but also results in
much better response time when cleaning up buffers.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   2 +-
 drivers/gpu/drm/i915/i915_gem.c            |   2 +-
 drivers/gpu/drm/i915/intel_region_ttm.c    |   2 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 112 ++++++++-------------
 drivers/gpu/drm/ttm/ttm_bo_util.c          |   1 -
 drivers/gpu/drm/ttm/ttm_device.c           |  24 ++---
 include/drm/ttm/ttm_bo_api.h               |  18 +---
 include/drm/ttm/ttm_device.h               |   7 +-
 8 files changed, 57 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ff2ae0be2c28..05f458d67eb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3966,7 +3966,7 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_fence_driver_hw_fini(adev);
 
 	if (adev->mman.initialized)
-		flush_delayed_work(&adev->mman.bdev.wq);
+		drain_workqueue(adev->mman.bdev.wq);
 
 	if (adev->pm_sysfs_en)
 		amdgpu_pm_sysfs_fini(adev);
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 299f94a9fb87..413c9dbe5be1 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1099,7 +1099,7 @@ void i915_gem_drain_freed_objects(struct drm_i915_private *i915)
 {
 	while (atomic_read(&i915->mm.free_count)) {
 		flush_work(&i915->mm.free_work);
-		flush_delayed_work(&i915->bdev.wq);
+		drain_workqueue(i915->bdev.wq);
 		rcu_barrier();
 	}
 }
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index cf89d0c2a2d9..657bbc16a48a 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -132,7 +132,7 @@ int intel_region_ttm_fini(struct intel_memory_region *mem)
 			break;
 
 		msleep(20);
-		flush_delayed_work(&mem->i915->bdev.wq);
+		drain_workqueue(mem->i915->bdev.wq);
 	}
 
 	/* If we leaked objects, Don't free the region causing use after free */
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index b77262a623e0..4749b65bedc4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -280,14 +280,13 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 		ret = 0;
 	}
 
-	if (ret || unlikely(list_empty(&bo->ddestroy))) {
+	if (ret) {
 		if (unlock_resv)
 			dma_resv_unlock(bo->base.resv);
 		spin_unlock(&bo->bdev->lru_lock);
 		return ret;
 	}
 
-	list_del_init(&bo->ddestroy);
 	spin_unlock(&bo->bdev->lru_lock);
 	ttm_bo_cleanup_memtype_use(bo);
 
@@ -300,47 +299,21 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
 }
 
 /*
- * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
- * encountered buffers.
+ * Block for the dma_resv object to become idle, lock the buffer and clean up
+ * the resource and tt object.
  */
-bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
+static void ttm_bo_delayed_delete(struct work_struct *work)
 {
-	struct list_head removed;
-	bool empty;
-
-	INIT_LIST_HEAD(&removed);
-
-	spin_lock(&bdev->lru_lock);
-	while (!list_empty(&bdev->ddestroy)) {
-		struct ttm_buffer_object *bo;
-
-		bo = list_first_entry(&bdev->ddestroy, struct ttm_buffer_object,
-				      ddestroy);
-		list_move_tail(&bo->ddestroy, &removed);
-		if (!ttm_bo_get_unless_zero(bo))
-			continue;
-
-		if (remove_all || bo->base.resv != &bo->base._resv) {
-			spin_unlock(&bdev->lru_lock);
-			dma_resv_lock(bo->base.resv, NULL);
-
-			spin_lock(&bdev->lru_lock);
-			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
-
-		} else if (dma_resv_trylock(bo->base.resv)) {
-			ttm_bo_cleanup_refs(bo, false, !remove_all, true);
-		} else {
-			spin_unlock(&bdev->lru_lock);
-		}
+	struct ttm_buffer_object *bo;
 
-		ttm_bo_put(bo);
-		spin_lock(&bdev->lru_lock);
-	}
-	list_splice_tail(&removed, &bdev->ddestroy);
-	empty = list_empty(&bdev->ddestroy);
-	spin_unlock(&bdev->lru_lock);
+	bo = container_of(work, typeof(*bo), delayed_delete);
 
-	return empty;
+	dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP, false,
+			      MAX_SCHEDULE_TIMEOUT);
+	dma_resv_lock(bo->base.resv, NULL);
+	ttm_bo_cleanup_memtype_use(bo);
+	dma_resv_unlock(bo->base.resv);
+	ttm_bo_put(bo);
 }
 
 static void ttm_bo_release(struct kref *kref)
@@ -369,44 +342,40 @@ static void ttm_bo_release(struct kref *kref)
 
 		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
 		ttm_mem_io_free(bdev, bo->resource);
-	}
-
-	if (!dma_resv_test_signaled(bo->base.resv, DMA_RESV_USAGE_BOOKKEEP) ||
-	    !dma_resv_trylock(bo->base.resv)) {
-		/* The BO is not idle, resurrect it for delayed destroy */
-		ttm_bo_flush_all_fences(bo);
-		bo->deleted = true;
 
-		spin_lock(&bo->bdev->lru_lock);
+		if (!dma_resv_test_signaled(bo->base.resv,
+					    DMA_RESV_USAGE_BOOKKEEP) ||
+		    !dma_resv_trylock(bo->base.resv)) {
+			/* The BO is not idle, resurrect it for delayed destroy */
+			ttm_bo_flush_all_fences(bo);
+			bo->deleted = true;
 
-		/*
-		 * Make pinned bos immediately available to
-		 * shrinkers, now that they are queued for
-		 * destruction.
-		 *
-		 * FIXME: QXL is triggering this. Can be removed when the
-		 * driver is fixed.
-		 */
-		if (bo->pin_count) {
-			bo->pin_count = 0;
-			ttm_resource_move_to_lru_tail(bo->resource);
-		}
+			spin_lock(&bo->bdev->lru_lock);
 
-		kref_init(&bo->kref);
-		list_add_tail(&bo->ddestroy, &bdev->ddestroy);
-		spin_unlock(&bo->bdev->lru_lock);
+			/*
+			 * Make pinned bos immediately available to
+			 * shrinkers, now that they are queued for
+			 * destruction.
+			 *
+			 * FIXME: QXL is triggering this. Can be removed when the
+			 * driver is fixed.
+			 */
+			if (bo->pin_count) {
+				bo->pin_count = 0;
+				ttm_resource_move_to_lru_tail(bo->resource);
+			}
 
-		schedule_delayed_work(&bdev->wq,
-				      ((HZ / 100) < 1) ? 1 : HZ / 100);
-		return;
-	}
+			kref_init(&bo->kref);
+			spin_unlock(&bo->bdev->lru_lock);
 
-	spin_lock(&bo->bdev->lru_lock);
-	list_del(&bo->ddestroy);
-	spin_unlock(&bo->bdev->lru_lock);
+			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
+			queue_work(bdev->wq, &bo->delayed_delete);
+			return;
+		}
 
-	ttm_bo_cleanup_memtype_use(bo);
-	dma_resv_unlock(bo->base.resv);
+		ttm_bo_cleanup_memtype_use(bo);
+		dma_resv_unlock(bo->base.resv);
+	}
 
 	atomic_dec(&ttm_glob.bo_count);
 	bo->destroy(bo);
@@ -946,7 +915,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
 	int ret;
 
 	kref_init(&bo->kref);
-	INIT_LIST_HEAD(&bo->ddestroy);
 	bo->bdev = bdev;
 	bo->type = type;
 	bo->page_alignment = alignment;
diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ba3aa0a0fc43..ae4b7922ee1a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -230,7 +230,6 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
 	 */
 
 	atomic_inc(&ttm_glob.bo_count);
-	INIT_LIST_HEAD(&fbo->base.ddestroy);
 	drm_vma_node_reset(&fbo->base.base.vma_node);
 
 	kref_init(&fbo->base.kref);
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7147e304637..e9bedca4dfdc 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -175,16 +175,6 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 }
 EXPORT_SYMBOL(ttm_device_swapout);
 
-static void ttm_device_delayed_workqueue(struct work_struct *work)
-{
-	struct ttm_device *bdev =
-		container_of(work, struct ttm_device, wq.work);
-
-	if (!ttm_bo_delayed_delete(bdev, false))
-		schedule_delayed_work(&bdev->wq,
-				      ((HZ / 100) < 1) ? 1 : HZ / 100);
-}
-
 /**
  * ttm_device_init
  *
@@ -215,15 +205,19 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	if (ret)
 		return ret;
 
+	bdev->wq = alloc_workqueue("ttm", WQ_MEM_RECLAIM | WQ_HIGHPRI, 16);
+	if (!bdev->wq) {
+		ttm_global_release();
+		return -ENOMEM;
+	}
+
 	bdev->funcs = funcs;
 
 	ttm_sys_man_init(bdev);
 	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
 
 	bdev->vma_manager = vma_manager;
-	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
 	spin_lock_init(&bdev->lru_lock);
-	INIT_LIST_HEAD(&bdev->ddestroy);
 	INIT_LIST_HEAD(&bdev->pinned);
 	bdev->dev_mapping = mapping;
 	mutex_lock(&ttm_global_mutex);
@@ -247,10 +241,8 @@ void ttm_device_fini(struct ttm_device *bdev)
 	list_del(&bdev->device_list);
 	mutex_unlock(&ttm_global_mutex);
 
-	cancel_delayed_work_sync(&bdev->wq);
-
-	if (ttm_bo_delayed_delete(bdev, true))
-		pr_debug("Delayed destroy list was clean\n");
+	drain_workqueue(bdev->wq);
+	destroy_workqueue(bdev->wq);
 
 	spin_lock(&bdev->lru_lock);
 	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index 7758347c461c..69e62bbb01e3 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -92,7 +92,6 @@ struct ttm_tt;
  * @ttm: TTM structure holding system pages.
  * @evicted: Whether the object was evicted without user-space knowing.
  * @deleted: True if the object is only a zombie and already deleted.
- * @ddestroy: List head for the delayed destroy list.
  * @swap: List head for swap LRU list.
  * @offset: The current GPU offset, which can have different meanings
  * depending on the memory type. For SYSTEM type memory, it should be 0.
@@ -135,19 +134,14 @@ struct ttm_buffer_object {
 	struct ttm_tt *ttm;
 	bool deleted;
 	struct ttm_lru_bulk_move *bulk_move;
+	unsigned priority;
+	unsigned pin_count;
 
 	/**
-	 * Members protected by the bdev::lru_lock.
-	 */
-
-	struct list_head ddestroy;
-
-	/**
-	 * Members protected by a bo reservation.
+	 * @delayed_delete: Work item used when we can't delete the BO
+	 * immediately
 	 */
-
-	unsigned priority;
-	unsigned pin_count;
+	struct work_struct delayed_delete;
 
 	/**
 	 * Special members that are protected by the reserve lock
@@ -448,8 +442,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
 
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
-bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
-
 vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
 
 #endif
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 95b3c04b1ab9..4f3e81eac6f3 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -251,11 +251,6 @@ struct ttm_device {
 	 */
 	spinlock_t lru_lock;
 
-	/**
-	 * @ddestroy: Destroyed but not yet cleaned up buffer objects.
-	 */
-	struct list_head ddestroy;
-
 	/**
 	 * @pinned: Buffer objects which are pinned and so not on any LRU list.
 	 */
@@ -270,7 +265,7 @@ struct ttm_device {
 	/**
 	 * @wq: Work queue structure for the delayed delete workqueue.
 	 */
-	struct delayed_work wq;
+	struct workqueue_struct *wq;
 };
 
 int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
-- 
2.34.1


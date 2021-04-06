Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33240354F7E
	for <lists+amd-gfx@lfdr.de>; Tue,  6 Apr 2021 11:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831EA6E7D5;
	Tue,  6 Apr 2021 09:09:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3CB46E0AC;
 Tue,  6 Apr 2021 09:09:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54C48B317;
 Tue,  6 Apr 2021 09:09:07 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Subject: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
Date: Tue,  6 Apr 2021 11:08:58 +0200
Message-Id: <20210406090903.7019-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406090903.7019-1-tzimmermann@suse.de>
References: <20210406090903.7019-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Moving the driver-specific mmap code into a GEM object function allows
for using DRM helpers for various mmap callbacks.

This change resolves several inconsistencies between regular mmap and
prime-based mmap. The vm_ops field in vma is now set for all mmap'ed
areas. Previously it way only set for regular mmap calls, prime-based
mmap used TTM's default vm_ops. The check for kfd_bo has been taken
from amdgpu_verify_access(), which is not called any longer and has
been removed.

As a side effect, amdgpu_ttm_vm_ops and amdgpu_ttm_fault() are now
implemented in amdgpu's GEM code.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 64 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 71 ---------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
 6 files changed, 66 insertions(+), 122 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index e0c4f7c7f1b9..19c5ab08d9ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -42,52 +42,6 @@
 #include <linux/pci-p2pdma.h>
 #include <linux/pm_runtime.h>
 
-/**
- * amdgpu_gem_prime_mmap - &drm_driver.gem_prime_mmap implementation
- * @obj: GEM BO
- * @vma: Virtual memory area
- *
- * Sets up a userspace mapping of the BO's memory in the given
- * virtual memory area.
- *
- * Returns:
- * 0 on success or a negative error code on failure.
- */
-int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
-			  struct vm_area_struct *vma)
-{
-	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
-	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
-	unsigned asize = amdgpu_bo_size(bo);
-	int ret;
-
-	if (!vma->vm_file)
-		return -ENODEV;
-
-	if (adev == NULL)
-		return -ENODEV;
-
-	/* Check for valid size. */
-	if (asize < vma->vm_end - vma->vm_start)
-		return -EINVAL;
-
-	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
-	    (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)) {
-		return -EPERM;
-	}
-	vma->vm_pgoff += amdgpu_bo_mmap_offset(bo) >> PAGE_SHIFT;
-
-	/* prime mmap does not need to check access, so allow here */
-	ret = drm_vma_node_allow(&obj->vma_node, vma->vm_file->private_data);
-	if (ret)
-		return ret;
-
-	ret = ttm_bo_mmap(vma->vm_file, vma, &adev->mman.bdev);
-	drm_vma_node_revoke(&obj->vma_node, vma->vm_file->private_data);
-
-	return ret;
-}
-
 static int
 __dma_resv_make_exclusive(struct dma_resv *obj)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
index 39b5b9616fd8..3e93b9b407a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h
@@ -31,8 +31,6 @@ struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
 					    struct dma_buf *dma_buf);
 bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_device *adev,
 				      struct amdgpu_bo *bo);
-int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,
-			  struct vm_area_struct *vma);
 
 extern const struct dma_buf_ops amdgpu_dmabuf_ops;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 76f48f79c70b..e96d2758f4bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1656,7 +1656,7 @@ static const struct file_operations amdgpu_driver_kms_fops = {
 	.flush = amdgpu_flush,
 	.release = drm_release,
 	.unlocked_ioctl = amdgpu_drm_ioctl,
-	.mmap = amdgpu_mmap,
+	.mmap = drm_gem_mmap,
 	.poll = drm_poll,
 	.read = drm_read,
 #ifdef CONFIG_COMPAT
@@ -1719,7 +1719,7 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_mmap = amdgpu_gem_prime_mmap,
+	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index fb7171e5507c..fe93faad05f2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -41,6 +41,36 @@
 
 static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
 
+static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
+{
+	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
+	vm_fault_t ret;
+
+	ret = ttm_bo_vm_reserve(bo, vmf);
+	if (ret)
+		return ret;
+
+	ret = amdgpu_bo_fault_reserve_notify(bo);
+	if (ret)
+		goto unlock;
+
+	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+				       TTM_BO_VM_NUM_PREFAULT, 1);
+	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
+		return ret;
+
+unlock:
+	dma_resv_unlock(bo->base.resv);
+	return ret;
+}
+
+static const struct vm_operations_struct amdgpu_ttm_vm_ops = {
+	.fault = amdgpu_ttm_fault,
+	.open = ttm_bo_vm_open,
+	.close = ttm_bo_vm_close,
+	.access = ttm_bo_vm_access
+};
+
 static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
 {
 	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
@@ -201,6 +231,38 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	ttm_eu_backoff_reservation(&ticket, &list);
 }
 
+static int amdgpu_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
+	unsigned long asize = amdgpu_bo_size(bo);
+
+	if (!vma->vm_file)
+		return -ENODEV;
+
+	if (!adev)
+		return -ENODEV;
+
+	/* Check for valid size. */
+	if (asize < vma->vm_end - vma->vm_start)
+		return -EINVAL;
+
+	/*
+	 * Don't verify access for KFD BOs. They don't have a GEM
+	 * object associated with them.
+	 */
+	if (bo->kfd_bo)
+		goto out;
+
+	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
+	    (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)) {
+		return -EPERM;
+	}
+
+out:
+	return drm_gem_ttm_mmap(obj, vma);
+}
+
 static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
 	.free = amdgpu_gem_object_free,
 	.open = amdgpu_gem_object_open,
@@ -208,6 +270,8 @@ static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
 	.export = amdgpu_gem_prime_export,
 	.vmap = drm_gem_ttm_vmap,
 	.vunmap = drm_gem_ttm_vunmap,
+	.mmap = amdgpu_gem_prime_mmap,
+	.vm_ops = &amdgpu_ttm_vm_ops,
 };
 
 /*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1c6131489a85..d9de91a517c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -152,32 +152,6 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	*placement = abo->placement;
 }
 
-/**
- * amdgpu_verify_access - Verify access for a mmap call
- *
- * @bo:	The buffer object to map
- * @filp: The file pointer from the process performing the mmap
- *
- * This is called by ttm_bo_mmap() to verify whether a process
- * has the right to mmap a BO to their process space.
- */
-static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
-{
-	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
-
-	/*
-	 * Don't verify access for KFD BOs. They don't have a GEM
-	 * object associated with them.
-	 */
-	if (abo->kfd_bo)
-		return 0;
-
-	if (amdgpu_ttm_tt_get_usermm(bo->ttm))
-		return -EPERM;
-	return drm_vma_node_verify_access(&abo->tbo.base.vma_node,
-					  filp->private_data);
-}
-
 /**
  * amdgpu_ttm_map_buffer - Map memory into the GART windows
  * @bo: buffer object to map
@@ -1531,7 +1505,6 @@ static struct ttm_device_funcs amdgpu_bo_driver = {
 	.eviction_valuable = amdgpu_ttm_bo_eviction_valuable,
 	.evict_flags = &amdgpu_evict_flags,
 	.move = &amdgpu_bo_move,
-	.verify_access = &amdgpu_verify_access,
 	.delete_mem_notify = &amdgpu_bo_delete_mem_notify,
 	.release_notify = &amdgpu_bo_release_notify,
 	.io_mem_reserve = &amdgpu_ttm_io_mem_reserve,
@@ -1906,50 +1879,6 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 	adev->mman.buffer_funcs_enabled = enable;
 }
 
-static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
-{
-	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
-	vm_fault_t ret;
-
-	ret = ttm_bo_vm_reserve(bo, vmf);
-	if (ret)
-		return ret;
-
-	ret = amdgpu_bo_fault_reserve_notify(bo);
-	if (ret)
-		goto unlock;
-
-	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-				       TTM_BO_VM_NUM_PREFAULT, 1);
-	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
-		return ret;
-
-unlock:
-	dma_resv_unlock(bo->base.resv);
-	return ret;
-}
-
-static const struct vm_operations_struct amdgpu_ttm_vm_ops = {
-	.fault = amdgpu_ttm_fault,
-	.open = ttm_bo_vm_open,
-	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
-};
-
-int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma)
-{
-	struct drm_file *file_priv = filp->private_data;
-	struct amdgpu_device *adev = drm_to_adev(file_priv->minor->dev);
-	int r;
-
-	r = ttm_bo_mmap(filp, vma, &adev->mman.bdev);
-	if (unlikely(r != 0))
-		return r;
-
-	vma->vm_ops = &amdgpu_ttm_vm_ops;
-	return 0;
-}
-
 int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
 		       uint64_t dst_offset, uint32_t byte_count,
 		       struct dma_resv *resv,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index dec0db8b0b13..6e51faad7371 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -146,7 +146,6 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
 			struct dma_resv *resv,
 			struct dma_fence **fence);
 
-int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
 int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
 int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
 uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev, uint32_t type);
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

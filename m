Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AC626A814
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Sep 2020 17:01:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BF26E8BE;
	Tue, 15 Sep 2020 15:00:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9386E893;
 Tue, 15 Sep 2020 15:00:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D59BB146;
 Tue, 15 Sep 2020 15:00:30 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
 heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
Subject: [PATCH v2 15/21] drm/vc4: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:52 +0200
Message-Id: <20200915145958.19993-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in vc4. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Eric Anholt <eric@anholt.net>
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 21 ++++++++++++++++++++-
 drivers/gpu/drm/vc4/vc4_drv.c | 12 ------------
 drivers/gpu/drm/vc4/vc4_drv.h |  1 -
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 74ceebd62fbc..f432278173cd 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -21,6 +21,8 @@
 #include "vc4_drv.h"
 #include "uapi/drm/vc4_drm.h"
 
+static vm_fault_t vc4_fault(struct vm_fault *vmf);
+
 static const char * const bo_type_names[] = {
 	"kernel",
 	"V3D",
@@ -374,6 +376,21 @@ static struct vc4_bo *vc4_bo_get_from_cache(struct drm_device *dev,
 	return bo;
 }
 
+static const struct vm_operations_struct vc4_vm_ops = {
+	.fault = vc4_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs vc4_gem_object_funcs = {
+	.free = vc4_free_object,
+	.export = vc4_prime_export,
+	.get_sg_table = drm_gem_cma_prime_get_sg_table,
+	.vmap = vc4_prime_vmap,
+	.vunmap = drm_gem_cma_prime_vunmap,
+	.vm_ops = &vc4_vm_ops,
+};
+
 /**
  * vc4_gem_create_object - Implementation of driver->gem_create_object.
  * @dev: DRM device
@@ -400,6 +417,8 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 	vc4->bo_labels[VC4_BO_TYPE_KERNEL].size_allocated += size;
 	mutex_unlock(&vc4->bo_lock);
 
+	bo->base.base.funcs = &vc4_gem_object_funcs;
+
 	return &bo->base.base;
 }
 
@@ -684,7 +703,7 @@ struct dma_buf * vc4_prime_export(struct drm_gem_object *obj, int flags)
 	return dmabuf;
 }
 
-vm_fault_t vc4_fault(struct vm_fault *vmf)
+static vm_fault_t vc4_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index f1a5fd5dab6f..d27eaa2d0cfe 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -140,12 +140,6 @@ static void vc4_close(struct drm_device *dev, struct drm_file *file)
 	kfree(vc4file);
 }
 
-static const struct vm_operations_struct vc4_vm_ops = {
-	.fault = vc4_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static const struct file_operations vc4_drm_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
@@ -195,16 +189,10 @@ static struct drm_driver vc4_drm_driver = {
 #endif
 
 	.gem_create_object = vc4_create_object,
-	.gem_free_object_unlocked = vc4_free_object,
-	.gem_vm_ops = &vc4_vm_ops,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = vc4_prime_export,
-	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
 	.gem_prime_import_sg_table = vc4_prime_import_sg_table,
-	.gem_prime_vmap = vc4_prime_vmap,
-	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
 	.gem_prime_mmap = vc4_prime_mmap,
 
 	.dumb_create = vc4_dumb_create,
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 8c8d96b6289f..a22478a35199 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -799,7 +799,6 @@ int vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 			     struct drm_file *file_priv);
 int vc4_label_bo_ioctl(struct drm_device *dev, void *data,
 		       struct drm_file *file_priv);
-vm_fault_t vc4_fault(struct vm_fault *vmf);
 int vc4_mmap(struct file *filp, struct vm_area_struct *vma);
 int vc4_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *vc4_prime_import_sg_table(struct drm_device *dev,
-- 
2.28.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

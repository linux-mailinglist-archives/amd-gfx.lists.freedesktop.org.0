Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C69535A05
	for <lists+amd-gfx@lfdr.de>; Fri, 27 May 2022 09:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A63D10EE65;
	Fri, 27 May 2022 07:15:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0426810F5F3;
 Thu, 26 May 2022 23:54:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id BA73A1F459E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653609294;
 bh=DfGpDB1iV1ixwCzh/Jz+qOPyTI739+QNjEbh7MI3SKc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TtPQEs40wcntc109HGqx7J6Vxp8aB2CXxucraiEqf5LZPHlZlp2OW2gLyoYDpZbmO
 AbgqfWCH145/vjTZsxB4cKHKs9hY8/jZUtwEQHsc7eVQ6WWuURoxif8ihnjPG+hTeG
 LwSNEx/+z71LhNjEj3Qwgz1qKH7vEBxl+8WqKWL+XTXGYxEoD5UxseCKU4jrKI/lC5
 wCB1C4w9W5rIcNwiJaY8P4XrxD9C6Ik2oQuo5gHN+uKBP7i+M+NtxR1Sfx5cteq/qL
 RSZrapHCuZkU/SVh9GChNxqHwFsnpkgTemN/DKvexkGBvMDjt05Qf0JA5R3g6dxJXS
 AtGHXemB5AkNQ==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Qiang Yu <yuq825@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH v6 13/22] drm/virtio: Improve DMA API usage for shmem BOs
Date: Fri, 27 May 2022 02:50:31 +0300
Message-Id: <20220526235040.678984-14-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 May 2022 07:15:10 +0000
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

DRM API requires the DRM's driver to be backed with the device that can
be used for generic DMA operations. The VirtIO-GPU device can't perform
DMA operations if it uses PCI transport because PCI device driver creates
a virtual VirtIO-GPU device that isn't associated with the PCI. Use PCI's
GPU device for the DRM's device instead of the VirtIO-GPU device and drop
DMA-related hacks from the VirtIO-GPU driver.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c    | 51 ++++++----------------
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  5 +--
 drivers/gpu/drm/virtio/virtgpu_kms.c    |  7 ++--
 drivers/gpu/drm/virtio/virtgpu_object.c | 56 +++++--------------------
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 13 +++---
 5 files changed, 32 insertions(+), 100 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 5f25a8d15464..0141b7df97ec 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -46,12 +46,11 @@ static int virtio_gpu_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-static int virtio_gpu_pci_quirk(struct drm_device *dev, struct virtio_device *vdev)
+static int virtio_gpu_pci_quirk(struct drm_device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(vdev->dev.parent);
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	const char *pname = dev_name(&pdev->dev);
 	bool vga = (pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA;
-	char unique[20];
 	int ret;
 
 	DRM_INFO("pci: %s detected at %s\n",
@@ -63,39 +62,7 @@ static int virtio_gpu_pci_quirk(struct drm_device *dev, struct virtio_device *vd
 			return ret;
 	}
 
-	/*
-	 * Normally the drm_dev_set_unique() call is done by core DRM.
-	 * The following comment covers, why virtio cannot rely on it.
-	 *
-	 * Unlike the other virtual GPU drivers, virtio abstracts the
-	 * underlying bus type by using struct virtio_device.
-	 *
-	 * Hence the dev_is_pci() check, used in core DRM, will fail
-	 * and the unique returned will be the virtio_device "virtio0",
-	 * while a "pci:..." one is required.
-	 *
-	 * A few other ideas were considered:
-	 * - Extend the dev_is_pci() check [in drm_set_busid] to
-	 *   consider virtio.
-	 *   Seems like a bigger hack than what we have already.
-	 *
-	 * - Point drm_device::dev to the parent of the virtio_device
-	 *   Semantic changes:
-	 *   * Using the wrong device for i2c, framebuffer_alloc and
-	 *     prime import.
-	 *   Visual changes:
-	 *   * Helpers such as DRM_DEV_ERROR, dev_info, drm_printer,
-	 *     will print the wrong information.
-	 *
-	 * We could address the latter issues, by introducing
-	 * drm_device::bus_dev, ... which would be used solely for this.
-	 *
-	 * So for the moment keep things as-is, with a bulky comment
-	 * for the next person who feels like removing this
-	 * drm_dev_set_unique() quirk.
-	 */
-	snprintf(unique, sizeof(unique), "pci:%s", pname);
-	return drm_dev_set_unique(dev, unique);
+	return 0;
 }
 
 static int virtio_gpu_probe(struct virtio_device *vdev)
@@ -109,18 +76,24 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
 	if (virtio_gpu_modeset == 0)
 		return -EINVAL;
 
-	dev = drm_dev_alloc(&driver, &vdev->dev);
+	/*
+	 * The virtio-gpu device is a virtual device that doesn't have DMA
+	 * ops assigned to it, nor DMA mask set and etc. Its parent device
+	 * is actual GPU device we want to use it for the DRM's device in
+	 * order to benefit from using generic DRM APIs.
+	 */
+	dev = drm_dev_alloc(&driver, vdev->dev.parent);
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 	vdev->priv = dev;
 
 	if (!strcmp(vdev->dev.parent->bus->name, "pci")) {
-		ret = virtio_gpu_pci_quirk(dev, vdev);
+		ret = virtio_gpu_pci_quirk(dev);
 		if (ret)
 			goto err_free;
 	}
 
-	ret = virtio_gpu_init(dev);
+	ret = virtio_gpu_init(vdev, dev);
 	if (ret)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0a194aaad419..b2d93cb12ebf 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -100,8 +100,6 @@ struct virtio_gpu_object {
 
 struct virtio_gpu_object_shmem {
 	struct virtio_gpu_object base;
-	struct sg_table *pages;
-	uint32_t mapped;
 };
 
 struct virtio_gpu_object_vram {
@@ -214,7 +212,6 @@ struct virtio_gpu_drv_cap_cache {
 };
 
 struct virtio_gpu_device {
-	struct device *dev;
 	struct drm_device *ddev;
 
 	struct virtio_device *vdev;
@@ -282,7 +279,7 @@ extern struct drm_ioctl_desc virtio_gpu_ioctls[DRM_VIRTIO_NUM_IOCTLS];
 void virtio_gpu_create_context(struct drm_device *dev, struct drm_file *file);
 
 /* virtgpu_kms.c */
-int virtio_gpu_init(struct drm_device *dev);
+int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev);
 void virtio_gpu_deinit(struct drm_device *dev);
 void virtio_gpu_release(struct drm_device *dev);
 int virtio_gpu_driver_open(struct drm_device *dev, struct drm_file *file);
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 3313b92db531..0d1e3eb61bee 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -110,7 +110,7 @@ static void virtio_gpu_get_capsets(struct virtio_gpu_device *vgdev,
 	vgdev->num_capsets = num_capsets;
 }
 
-int virtio_gpu_init(struct drm_device *dev)
+int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
 {
 	static vq_callback_t *callbacks[] = {
 		virtio_gpu_ctrl_ack, virtio_gpu_cursor_ack
@@ -123,7 +123,7 @@ int virtio_gpu_init(struct drm_device *dev)
 	u32 num_scanouts, num_capsets;
 	int ret = 0;
 
-	if (!virtio_has_feature(dev_to_virtio(dev->dev), VIRTIO_F_VERSION_1))
+	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1))
 		return -ENODEV;
 
 	vgdev = kzalloc(sizeof(struct virtio_gpu_device), GFP_KERNEL);
@@ -132,8 +132,7 @@ int virtio_gpu_init(struct drm_device *dev)
 
 	vgdev->ddev = dev;
 	dev->dev_private = vgdev;
-	vgdev->vdev = dev_to_virtio(dev->dev);
-	vgdev->dev = dev->dev;
+	vgdev->vdev = vdev;
 
 	spin_lock_init(&vgdev->display_info_lock);
 	spin_lock_init(&vgdev->resource_export_lock);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 18f70ef6b4d0..8d7728181de0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -67,21 +67,6 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 
 	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
 	if (virtio_gpu_is_shmem(bo)) {
-		struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
-
-		if (shmem->pages) {
-			if (shmem->mapped) {
-				dma_unmap_sgtable(vgdev->vdev->dev.parent,
-					     shmem->pages, DMA_TO_DEVICE, 0);
-				shmem->mapped = 0;
-			}
-
-			sg_free_table(shmem->pages);
-			kfree(shmem->pages);
-			shmem->pages = NULL;
-			drm_gem_shmem_unpin(&bo->base);
-		}
-
 		drm_gem_shmem_free(&bo->base);
 	} else if (virtio_gpu_is_vram(bo)) {
 		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
@@ -153,37 +138,18 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 					unsigned int *nents)
 {
 	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
-	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 	struct scatterlist *sg;
-	int si, ret;
+	struct sg_table *pages;
+	int si;
 
-	ret = drm_gem_shmem_pin(&bo->base);
-	if (ret < 0)
-		return -EINVAL;
-
-	/*
-	 * virtio_gpu uses drm_gem_shmem_get_sg_table instead of
-	 * drm_gem_shmem_get_pages_sgt because virtio has it's own set of
-	 * dma-ops. This is discouraged for other drivers, but should be fine
-	 * since virtio_gpu doesn't support dma-buf import from other devices.
-	 */
-	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base);
-	ret = PTR_ERR_OR_ZERO(shmem->pages);
-	if (ret) {
-		drm_gem_shmem_unpin(&bo->base);
-		shmem->pages = NULL;
-		return ret;
-	}
+	pages = drm_gem_shmem_get_pages_sgt(&bo->base);
+	if (IS_ERR(pages))
+		return PTR_ERR(pages);
 
-	if (use_dma_api) {
-		ret = dma_map_sgtable(vgdev->vdev->dev.parent,
-				      shmem->pages, DMA_TO_DEVICE, 0);
-		if (ret)
-			return ret;
-		*nents = shmem->mapped = shmem->pages->nents;
-	} else {
-		*nents = shmem->pages->orig_nents;
-	}
+	if (use_dma_api)
+		*nents = pages->nents;
+	else
+		*nents = pages->orig_nents;
 
 	*ents = kvmalloc_array(*nents,
 			       sizeof(struct virtio_gpu_mem_entry),
@@ -194,13 +160,13 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	}
 
 	if (use_dma_api) {
-		for_each_sgtable_dma_sg(shmem->pages, sg, si) {
+		for_each_sgtable_dma_sg(pages, sg, si) {
 			(*ents)[si].addr = cpu_to_le64(sg_dma_address(sg));
 			(*ents)[si].length = cpu_to_le32(sg_dma_len(sg));
 			(*ents)[si].padding = 0;
 		}
 	} else {
-		for_each_sgtable_sg(shmem->pages, sg, si) {
+		for_each_sgtable_sg(pages, sg, si) {
 			(*ents)[si].addr = cpu_to_le64(sg_phys(sg));
 			(*ents)[si].length = cpu_to_le32(sg->length);
 			(*ents)[si].padding = 0;
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 2edf31806b74..06566e44307d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -593,11 +593,10 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_transfer_to_host_2d *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
-	struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
 
 	if (virtio_gpu_is_shmem(bo) && use_dma_api)
-		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
-					    shmem->pages, DMA_TO_DEVICE);
+		dma_sync_sgtable_for_device(&vgdev->vdev->dev,
+					    bo->base.sgt, DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
@@ -1017,11 +1016,9 @@ void virtio_gpu_cmd_transfer_to_host_3d(struct virtio_gpu_device *vgdev,
 	struct virtio_gpu_vbuffer *vbuf;
 	bool use_dma_api = !virtio_has_dma_quirk(vgdev->vdev);
 
-	if (virtio_gpu_is_shmem(bo) && use_dma_api) {
-		struct virtio_gpu_object_shmem *shmem = to_virtio_gpu_shmem(bo);
-		dma_sync_sgtable_for_device(vgdev->vdev->dev.parent,
-					    shmem->pages, DMA_TO_DEVICE);
-	}
+	if (virtio_gpu_is_shmem(bo) && use_dma_api)
+		dma_sync_sgtable_for_device(&vgdev->vdev->dev,
+					    bo->base.sgt, DMA_TO_DEVICE);
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
-- 
2.35.3


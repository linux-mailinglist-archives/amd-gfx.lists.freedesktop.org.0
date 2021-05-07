Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6327376A35
	for <lists+amd-gfx@lfdr.de>; Fri,  7 May 2021 20:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8A16EE74;
	Fri,  7 May 2021 18:57:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673D26E0F3;
 Fri,  7 May 2021 18:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA199B080;
 Fri,  7 May 2021 18:57:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 2/4] drm/radeon: Move AGP data structures into radeon
Date: Fri,  7 May 2021 20:57:07 +0200
Message-Id: <20210507185709.22797-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210507185709.22797-1-tzimmermann@suse.de>
References: <20210507185709.22797-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

With the AGP code already duplicated, move over the AGP structures
from the legacy code base in to radeon. The AGP data structures that
are required by radeon are now declared within the driver. The AGP
instance is stored in struct radeon_device.agp.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon.h     | 38 +++++++++++++++-
 drivers/gpu/drm/radeon/radeon_agp.c | 70 ++++++++++++++---------------
 drivers/gpu/drm/radeon/radeon_drv.c | 13 ------
 drivers/gpu/drm/radeon/radeon_kms.c | 18 +++++---
 drivers/gpu/drm/radeon/radeon_ttm.c |  6 +--
 5 files changed, 86 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 4f9e8dc460be..80d7637f0c27 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -60,6 +60,7 @@
  *                          are considered as fatal)
  */
 
+#include <linux/agp_backend.h>
 #include <linux/atomic.h>
 #include <linux/wait.h>
 #include <linux/list.h>
@@ -1110,10 +1111,42 @@ typedef int (*radeon_packet0_check_t)(struct radeon_cs_parser *p,
 /*
  * AGP
  */
+
+struct radeon_agp_mode {
+	unsigned long mode;	/**< AGP mode */
+};
+
+struct radeon_agp_info {
+	int agp_version_major;
+	int agp_version_minor;
+	unsigned long mode;
+	unsigned long aperture_base;	/* physical address */
+	unsigned long aperture_size;	/* bytes */
+	unsigned long memory_allowed;	/* bytes */
+	unsigned long memory_used;
+
+	/* PCI information */
+	unsigned short id_vendor;
+	unsigned short id_device;
+};
+
+struct radeon_agp_head {
+	struct agp_kern_info agp_info;
+	struct list_head memory;
+	unsigned long mode;
+	struct agp_bridge_data *bridge;
+	int enabled;
+	int acquired;
+	unsigned long base;
+	int agp_mtrr;
+	int cant_use_aperture;
+	unsigned long page_mask;
+};
+
 #if IS_ENABLED(CONFIG_AGP)
-struct drm_agp_head *radeon_agp_head_init(struct drm_device *dev);
+struct radeon_agp_head *radeon_agp_head_init(struct drm_device *dev);
 #else
-static inline struct drm_agp_head *radeon_agp_head_init(struct drm_device *dev)
+static inline struct radeon_agp_head *radeon_agp_head_init(struct drm_device *dev)
 {
 	return NULL;
 }
@@ -2310,6 +2343,7 @@ struct radeon_device {
 #ifdef __alpha__
 	struct pci_controller		*hose;
 #endif
+	struct radeon_agp_head		*agp;
 	struct rw_semaphore		exclusive_lock;
 	/* ASIC */
 	union radeon_asic_config	config;
diff --git a/drivers/gpu/drm/radeon/radeon_agp.c b/drivers/gpu/drm/radeon/radeon_agp.c
index 398be13c8e2b..d124600b5f58 100644
--- a/drivers/gpu/drm/radeon/radeon_agp.c
+++ b/drivers/gpu/drm/radeon/radeon_agp.c
@@ -27,7 +27,6 @@
 
 #include <linux/pci.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/radeon_drm.h>
 
@@ -128,10 +127,10 @@ static struct radeon_agpmode_quirk radeon_agpmode_quirk_list[] = {
 	{ 0, 0, 0, 0, 0, 0, 0 },
 };
 
-struct drm_agp_head *radeon_agp_head_init(struct drm_device *dev)
+struct radeon_agp_head *radeon_agp_head_init(struct drm_device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
-	struct drm_agp_head *head = NULL;
+	struct radeon_agp_head *head = NULL;
 
 	head = kzalloc(sizeof(*head), GFP_KERNEL);
 	if (!head)
@@ -160,49 +159,50 @@ struct drm_agp_head *radeon_agp_head_init(struct drm_device *dev)
 	return head;
 }
 
-static int radeon_agp_head_acquire(struct drm_device *dev)
+static int radeon_agp_head_acquire(struct radeon_device *rdev)
 {
+	struct drm_device *dev = rdev->ddev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	if (!dev->agp)
+	if (!rdev->agp)
 		return -ENODEV;
-	if (dev->agp->acquired)
+	if (rdev->agp->acquired)
 		return -EBUSY;
-	dev->agp->bridge = agp_backend_acquire(pdev);
-	if (!dev->agp->bridge)
+	rdev->agp->bridge = agp_backend_acquire(pdev);
+	if (!rdev->agp->bridge)
 		return -ENODEV;
-	dev->agp->acquired = 1;
+	rdev->agp->acquired = 1;
 	return 0;
 }
 
-static int radeon_agp_head_release(struct drm_device *dev)
+static int radeon_agp_head_release(struct radeon_device *rdev)
 {
-	if (!dev->agp || !dev->agp->acquired)
+	if (!rdev->agp || !rdev->agp->acquired)
 		return -EINVAL;
-	agp_backend_release(dev->agp->bridge);
-	dev->agp->acquired = 0;
+	agp_backend_release(rdev->agp->bridge);
+	rdev->agp->acquired = 0;
 	return 0;
 }
 
-static int radeon_agp_head_enable(struct drm_device *dev, struct drm_agp_mode mode)
+static int radeon_agp_head_enable(struct radeon_device *rdev, struct radeon_agp_mode mode)
 {
-	if (!dev->agp || !dev->agp->acquired)
+	if (!rdev->agp || !rdev->agp->acquired)
 		return -EINVAL;
 
-	dev->agp->mode = mode.mode;
-	agp_enable(dev->agp->bridge, mode.mode);
-	dev->agp->enabled = 1;
+	rdev->agp->mode = mode.mode;
+	agp_enable(rdev->agp->bridge, mode.mode);
+	rdev->agp->enabled = 1;
 	return 0;
 }
 
-static int radeon_agp_head_info(struct drm_device *dev, struct drm_agp_info *info)
+static int radeon_agp_head_info(struct radeon_device *rdev, struct radeon_agp_info *info)
 {
 	struct agp_kern_info *kern;
 
-	if (!dev->agp || !dev->agp->acquired)
+	if (!rdev->agp || !rdev->agp->acquired)
 		return -EINVAL;
 
-	kern = &dev->agp->agp_info;
+	kern = &rdev->agp->agp_info;
 	info->agp_version_major = kern->version.major;
 	info->agp_version_minor = kern->version.minor;
 	info->mode = kern->mode;
@@ -221,32 +221,32 @@ int radeon_agp_init(struct radeon_device *rdev)
 {
 #if IS_ENABLED(CONFIG_AGP)
 	struct radeon_agpmode_quirk *p = radeon_agpmode_quirk_list;
-	struct drm_agp_mode mode;
-	struct drm_agp_info info;
+	struct radeon_agp_mode mode;
+	struct radeon_agp_info info;
 	uint32_t agp_status;
 	int default_mode;
 	bool is_v3;
 	int ret;
 
 	/* Acquire AGP. */
-	ret = radeon_agp_head_acquire(rdev->ddev);
+	ret = radeon_agp_head_acquire(rdev);
 	if (ret) {
 		DRM_ERROR("Unable to acquire AGP: %d\n", ret);
 		return ret;
 	}
 
-	ret = radeon_agp_head_info(rdev->ddev, &info);
+	ret = radeon_agp_head_info(rdev, &info);
 	if (ret) {
-		radeon_agp_head_release(rdev->ddev);
+		radeon_agp_head_release(rdev);
 		DRM_ERROR("Unable to get AGP info: %d\n", ret);
 		return ret;
 	}
 
-	if (rdev->ddev->agp->agp_info.aper_size < 32) {
-		radeon_agp_head_release(rdev->ddev);
+	if (rdev->agp->agp_info.aper_size < 32) {
+		radeon_agp_head_release(rdev);
 		dev_warn(rdev->dev, "AGP aperture too small (%zuM) "
 			"need at least 32M, disabling AGP\n",
-			rdev->ddev->agp->agp_info.aper_size);
+			rdev->agp->agp_info.aper_size);
 		return -EINVAL;
 	}
 
@@ -327,15 +327,15 @@ int radeon_agp_init(struct radeon_device *rdev)
 	}
 
 	mode.mode &= ~RADEON_AGP_FW_MODE; /* disable fw */
-	ret = radeon_agp_head_enable(rdev->ddev, mode);
+	ret = radeon_agp_head_enable(rdev, mode);
 	if (ret) {
 		DRM_ERROR("Unable to enable AGP (mode = 0x%lx)\n", mode.mode);
-		radeon_agp_head_release(rdev->ddev);
+		radeon_agp_head_release(rdev);
 		return ret;
 	}
 
-	rdev->mc.agp_base = rdev->ddev->agp->agp_info.aper_base;
-	rdev->mc.gtt_size = rdev->ddev->agp->agp_info.aper_size << 20;
+	rdev->mc.agp_base = rdev->agp->agp_info.aper_base;
+	rdev->mc.gtt_size = rdev->agp->agp_info.aper_size << 20;
 	rdev->mc.gtt_start = rdev->mc.agp_base;
 	rdev->mc.gtt_end = rdev->mc.gtt_start + rdev->mc.gtt_size - 1;
 	dev_info(rdev->dev, "GTT: %lluM 0x%08llX - 0x%08llX\n",
@@ -366,8 +366,8 @@ void radeon_agp_resume(struct radeon_device *rdev)
 void radeon_agp_fini(struct radeon_device *rdev)
 {
 #if IS_ENABLED(CONFIG_AGP)
-	if (rdev->ddev->agp && rdev->ddev->agp->acquired) {
-		radeon_agp_head_release(rdev->ddev);
+	if (rdev->agp && rdev->agp->acquired) {
+		radeon_agp_head_release(rdev);
 	}
 #endif
 }
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7a9cd590d0de..31d3dd0e5258 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -39,7 +39,6 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -345,15 +344,6 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 
 	pci_set_drvdata(pdev, dev);
 
-	if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
-		dev->agp = radeon_agp_head_init(dev);
-	if (dev->agp) {
-		dev->agp->agp_mtrr = arch_phys_wc_add(
-			dev->agp->agp_info.aper_base,
-			dev->agp->agp_info.aper_size *
-			1024 * 1024);
-	}
-
 	ret = drm_dev_register(dev, ent->driver_data);
 	if (ret)
 		goto err_agp;
@@ -361,9 +351,6 @@ static int radeon_pci_probe(struct pci_dev *pdev,
 	return 0;
 
 err_agp:
-	if (dev->agp)
-		arch_phys_wc_del(dev->agp->agp_mtrr);
-	kfree(dev->agp);
 	pci_disable_device(pdev);
 err_free:
 	drm_dev_put(dev);
diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 58876bb4ef2a..0473583dcdac 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -32,7 +32,6 @@
 #include <linux/uaccess.h>
 #include <linux/vga_switcheroo.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
@@ -80,10 +79,10 @@ void radeon_driver_unload_kms(struct drm_device *dev)
 	radeon_modeset_fini(rdev);
 	radeon_device_fini(rdev);
 
-	if (dev->agp)
-		arch_phys_wc_del(dev->agp->agp_mtrr);
-	kfree(dev->agp);
-	dev->agp = NULL;
+	if (rdev->agp)
+		arch_phys_wc_del(rdev->agp->agp_mtrr);
+	kfree(rdev->agp);
+	rdev->agp = NULL;
 
 done_free:
 	kfree(rdev);
@@ -119,6 +118,15 @@ int radeon_driver_load_kms(struct drm_device *dev, unsigned long flags)
 	rdev->hose = pdev->sysdata;
 #endif
 
+	if (pci_find_capability(pdev, PCI_CAP_ID_AGP))
+		rdev->agp = radeon_agp_head_init(rdev->ddev);
+	if (rdev->agp) {
+		rdev->agp->agp_mtrr = arch_phys_wc_add(
+			rdev->agp->agp_info.aper_base,
+			rdev->agp->agp_info.aper_size *
+			1024 * 1024);
+	}
+
 	/* update BUS flag */
 	if (pci_find_capability(pdev, PCI_CAP_ID_AGP)) {
 		flags |= RADEON_IS_AGP;
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 380b3007fd0b..3361d11769a2 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -38,7 +38,6 @@
 #include <linux/swap.h>
 #include <linux/swiotlb.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_prime.h>
@@ -291,7 +290,7 @@ static int radeon_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resourc
 			/* RADEON_IS_AGP is set only if AGP is active */
 			mem->bus.offset = (mem->start << PAGE_SHIFT) +
 				rdev->mc.agp_base;
-			mem->bus.is_iomem = !rdev->ddev->agp->cant_use_aperture;
+			mem->bus.is_iomem = !rdev->agp->cant_use_aperture;
 			mem->bus.caching = ttm_write_combined;
 		}
 #endif
@@ -513,8 +512,7 @@ static struct ttm_tt *radeon_ttm_tt_create(struct ttm_buffer_object *bo,
 	struct radeon_device *rdev = radeon_get_rdev(bo->bdev);
 
 	if (rdev->flags & RADEON_IS_AGP) {
-		return ttm_agp_tt_create(bo, rdev->ddev->agp->bridge,
-					 page_flags);
+		return ttm_agp_tt_create(bo, rdev->agp->bridge, page_flags);
 	}
 #endif
 	rbo = container_of(bo, struct radeon_bo, tbo);
-- 
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

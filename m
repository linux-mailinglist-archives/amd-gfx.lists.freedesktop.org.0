Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911EF376A30
	for <lists+amd-gfx@lfdr.de>; Fri,  7 May 2021 20:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229536EDE7;
	Fri,  7 May 2021 18:57:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ADC96EDE7;
 Fri,  7 May 2021 18:57:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F30FFB22C;
 Fri,  7 May 2021 18:57:12 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com
Subject: [PATCH 4/4] drm: Mark AGP implementation and ioctls as legacy
Date: Fri,  7 May 2021 20:57:09 +0200
Message-Id: <20210507185709.22797-5-tzimmermann@suse.de>
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

Only UMs drivers use DRM's core AGP code and ioctls. Mark the icotls
as legacy. Add the _legacy_ infix to all AGP functions. Move the
declarations to the public and internal legacy header files. The agp
field in struct drm_device is now located in the structure's legacy
section. Adapt drivers to the changes.

AGP code now depends on CONFIG_DRM_LEGACY.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile          |   6 +-
 drivers/gpu/drm/drm_agpsupport.c  |  99 +++++++++++++------------
 drivers/gpu/drm/drm_bufs.c        |   1 -
 drivers/gpu/drm/drm_ioc32.c       |  19 +++--
 drivers/gpu/drm/drm_ioctl.c       |  24 +++---
 drivers/gpu/drm/drm_legacy.h      |  24 ++++++
 drivers/gpu/drm/drm_legacy_misc.c |   1 -
 drivers/gpu/drm/drm_memory.c      |   1 -
 drivers/gpu/drm/drm_pci.c         |   3 +-
 drivers/gpu/drm/drm_vm.c          |   2 -
 drivers/gpu/drm/i810/i810_dma.c   |   3 +-
 drivers/gpu/drm/mga/mga_dma.c     |  16 ++--
 drivers/gpu/drm/mga/mga_drv.h     |   1 -
 drivers/gpu/drm/r128/r128_cce.c   |   2 +-
 drivers/gpu/drm/via/via_dma.c     |   1 -
 include/drm/drm_agpsupport.h      | 117 ------------------------------
 include/drm/drm_device.h          |   6 +-
 include/drm/drm_legacy.h          |  82 +++++++++++++++++++++
 18 files changed, 198 insertions(+), 210 deletions(-)
 delete mode 100644 include/drm/drm_agpsupport.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 89e747fedc00..a91cc7684904 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -20,15 +20,15 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
 		drm_managed.o drm_vblank_work.o
 
-drm-$(CONFIG_DRM_LEGACY) += drm_bufs.o drm_context.o drm_dma.o drm_legacy_misc.o drm_lock.o \
-		drm_memory.o drm_scatter.o drm_vm.o
+drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
+			    drm_legacy_misc.o drm_lock.o drm_memory.o drm_scatter.o \
+			    drm_vm.o
 drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
 drm-$(CONFIG_COMPAT) += drm_ioc32.o
 drm-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_gem_cma_helper.o
 drm-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_gem_shmem_helper.o
 drm-$(CONFIG_DRM_PANEL) += drm_panel.o
 drm-$(CONFIG_OF) += drm_of.o
-drm-$(CONFIG_AGP) += drm_agpsupport.o
 drm-$(CONFIG_PCI) += drm_pci.o
 drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
diff --git a/drivers/gpu/drm/drm_agpsupport.c b/drivers/gpu/drm/drm_agpsupport.c
index 5311d03d49cc..07c10443770e 100644
--- a/drivers/gpu/drm/drm_agpsupport.c
+++ b/drivers/gpu/drm/drm_agpsupport.c
@@ -37,7 +37,6 @@
 
 #include <asm/agp.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -45,6 +44,8 @@
 
 #include "drm_legacy.h"
 
+#if IS_ENABLED(CONFIG_AGP)
+
 /*
  * Get AGP information.
  *
@@ -53,7 +54,7 @@
  * Verifies the AGP device has been initialized and acquired and fills in the
  * drm_agp_info structure with the information in drm_agp_head::agp_info.
  */
-int drm_agp_info(struct drm_device *dev, struct drm_agp_info *info)
+int drm_legacy_agp_info(struct drm_device *dev, struct drm_agp_info *info)
 {
 	struct agp_kern_info *kern;
 
@@ -73,15 +74,15 @@ int drm_agp_info(struct drm_device *dev, struct drm_agp_info *info)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_agp_info);
+EXPORT_SYMBOL(drm_legacy_agp_info);
 
-int drm_agp_info_ioctl(struct drm_device *dev, void *data,
-		       struct drm_file *file_priv)
+int drm_legacy_agp_info_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file_priv)
 {
 	struct drm_agp_info *info = data;
 	int err;
 
-	err = drm_agp_info(dev, info);
+	err = drm_legacy_agp_info(dev, info);
 	if (err)
 		return err;
 
@@ -97,7 +98,7 @@ int drm_agp_info_ioctl(struct drm_device *dev, void *data,
  * Verifies the AGP device hasn't been acquired before and calls
  * \c agp_backend_acquire.
  */
-int drm_agp_acquire(struct drm_device *dev)
+int drm_legacy_agp_acquire(struct drm_device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
@@ -111,7 +112,7 @@ int drm_agp_acquire(struct drm_device *dev)
 	dev->agp->acquired = 1;
 	return 0;
 }
-EXPORT_SYMBOL(drm_agp_acquire);
+EXPORT_SYMBOL(drm_legacy_agp_acquire);
 
 /*
  * Acquire the AGP device (ioctl).
@@ -121,10 +122,10 @@ EXPORT_SYMBOL(drm_agp_acquire);
  * Verifies the AGP device hasn't been acquired before and calls
  * \c agp_backend_acquire.
  */
-int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
-			  struct drm_file *file_priv)
+int drm_legacy_agp_acquire_ioctl(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv)
 {
-	return drm_agp_acquire((struct drm_device *) file_priv->minor->dev);
+	return drm_legacy_agp_acquire((struct drm_device *)file_priv->minor->dev);
 }
 
 /*
@@ -135,7 +136,7 @@ int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
  *
  * Verifies the AGP device has been acquired and calls \c agp_backend_release.
  */
-int drm_agp_release(struct drm_device *dev)
+int drm_legacy_agp_release(struct drm_device *dev)
 {
 	if (!dev->agp || !dev->agp->acquired)
 		return -EINVAL;
@@ -143,12 +144,12 @@ int drm_agp_release(struct drm_device *dev)
 	dev->agp->acquired = 0;
 	return 0;
 }
-EXPORT_SYMBOL(drm_agp_release);
+EXPORT_SYMBOL(drm_legacy_agp_release);
 
-int drm_agp_release_ioctl(struct drm_device *dev, void *data,
-			  struct drm_file *file_priv)
+int drm_legacy_agp_release_ioctl(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv)
 {
-	return drm_agp_release(dev);
+	return drm_legacy_agp_release(dev);
 }
 
 /*
@@ -161,7 +162,7 @@ int drm_agp_release_ioctl(struct drm_device *dev, void *data,
  * Verifies the AGP device has been acquired but not enabled, and calls
  * \c agp_enable.
  */
-int drm_agp_enable(struct drm_device *dev, struct drm_agp_mode mode)
+int drm_legacy_agp_enable(struct drm_device *dev, struct drm_agp_mode mode)
 {
 	if (!dev->agp || !dev->agp->acquired)
 		return -EINVAL;
@@ -171,14 +172,14 @@ int drm_agp_enable(struct drm_device *dev, struct drm_agp_mode mode)
 	dev->agp->enabled = 1;
 	return 0;
 }
-EXPORT_SYMBOL(drm_agp_enable);
+EXPORT_SYMBOL(drm_legacy_agp_enable);
 
-int drm_agp_enable_ioctl(struct drm_device *dev, void *data,
-			 struct drm_file *file_priv)
+int drm_legacy_agp_enable_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv)
 {
 	struct drm_agp_mode *mode = data;
 
-	return drm_agp_enable(dev, *mode);
+	return drm_legacy_agp_enable(dev, *mode);
 }
 
 /*
@@ -189,7 +190,7 @@ int drm_agp_enable_ioctl(struct drm_device *dev, void *data,
  * Verifies the AGP device is present and has been acquired, allocates the
  * memory via agp_allocate_memory() and creates a drm_agp_mem entry for it.
  */
-int drm_agp_alloc(struct drm_device *dev, struct drm_agp_buffer *request)
+int drm_legacy_agp_alloc(struct drm_device *dev, struct drm_agp_buffer *request)
 {
 	struct drm_agp_mem *entry;
 	struct agp_memory *memory;
@@ -221,15 +222,15 @@ int drm_agp_alloc(struct drm_device *dev, struct drm_agp_buffer *request)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_agp_alloc);
+EXPORT_SYMBOL(drm_legacy_agp_alloc);
 
 
-int drm_agp_alloc_ioctl(struct drm_device *dev, void *data,
+int drm_legacy_agp_alloc_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
 	struct drm_agp_buffer *request = data;
 
-	return drm_agp_alloc(dev, request);
+	return drm_legacy_agp_alloc(dev, request);
 }
 
 /*
@@ -241,8 +242,8 @@ int drm_agp_alloc_ioctl(struct drm_device *dev, void *data,
  *
  * Walks through drm_agp_head::memory until finding a matching handle.
  */
-static struct drm_agp_mem *drm_agp_lookup_entry(struct drm_device *dev,
-						unsigned long handle)
+static struct drm_agp_mem *drm_legacy_agp_lookup_entry(struct drm_device *dev,
+						       unsigned long handle)
 {
 	struct drm_agp_mem *entry;
 
@@ -261,14 +262,14 @@ static struct drm_agp_mem *drm_agp_lookup_entry(struct drm_device *dev,
  * Verifies the AGP device is present and acquired, looks-up the AGP memory
  * entry and passes it to the unbind_agp() function.
  */
-int drm_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request)
+int drm_legacy_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request)
 {
 	struct drm_agp_mem *entry;
 	int ret;
 
 	if (!dev->agp || !dev->agp->acquired)
 		return -EINVAL;
-	entry = drm_agp_lookup_entry(dev, request->handle);
+	entry = drm_legacy_agp_lookup_entry(dev, request->handle);
 	if (!entry || !entry->bound)
 		return -EINVAL;
 	ret = agp_unbind_memory(entry->memory);
@@ -276,15 +277,15 @@ int drm_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request)
 		entry->bound = 0;
 	return ret;
 }
-EXPORT_SYMBOL(drm_agp_unbind);
+EXPORT_SYMBOL(drm_legacy_agp_unbind);
 
 
-int drm_agp_unbind_ioctl(struct drm_device *dev, void *data,
-			 struct drm_file *file_priv)
+int drm_legacy_agp_unbind_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv)
 {
 	struct drm_agp_binding *request = data;
 
-	return drm_agp_unbind(dev, request);
+	return drm_legacy_agp_unbind(dev, request);
 }
 
 /*
@@ -296,7 +297,7 @@ int drm_agp_unbind_ioctl(struct drm_device *dev, void *data,
  * is currently bound into the GATT. Looks-up the AGP memory entry and passes
  * it to bind_agp() function.
  */
-int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
+int drm_legacy_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
 {
 	struct drm_agp_mem *entry;
 	int retcode;
@@ -304,7 +305,7 @@ int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
 
 	if (!dev->agp || !dev->agp->acquired)
 		return -EINVAL;
-	entry = drm_agp_lookup_entry(dev, request->handle);
+	entry = drm_legacy_agp_lookup_entry(dev, request->handle);
 	if (!entry || entry->bound)
 		return -EINVAL;
 	page = DIV_ROUND_UP(request->offset, PAGE_SIZE);
@@ -316,15 +317,15 @@ int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request)
 		  dev->agp->base, entry->bound);
 	return 0;
 }
-EXPORT_SYMBOL(drm_agp_bind);
+EXPORT_SYMBOL(drm_legacy_agp_bind);
 
 
-int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
-		       struct drm_file *file_priv)
+int drm_legacy_agp_bind_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file_priv)
 {
 	struct drm_agp_binding *request = data;
 
-	return drm_agp_bind(dev, request);
+	return drm_legacy_agp_bind(dev, request);
 }
 
 /*
@@ -337,13 +338,13 @@ int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
  * unbind_agp(). Frees it via free_agp() as well as the entry itself
  * and unlinks from the doubly linked list it's inserted in.
  */
-int drm_agp_free(struct drm_device *dev, struct drm_agp_buffer *request)
+int drm_legacy_agp_free(struct drm_device *dev, struct drm_agp_buffer *request)
 {
 	struct drm_agp_mem *entry;
 
 	if (!dev->agp || !dev->agp->acquired)
 		return -EINVAL;
-	entry = drm_agp_lookup_entry(dev, request->handle);
+	entry = drm_legacy_agp_lookup_entry(dev, request->handle);
 	if (!entry)
 		return -EINVAL;
 	if (entry->bound)
@@ -355,15 +356,15 @@ int drm_agp_free(struct drm_device *dev, struct drm_agp_buffer *request)
 	kfree(entry);
 	return 0;
 }
-EXPORT_SYMBOL(drm_agp_free);
+EXPORT_SYMBOL(drm_legacy_agp_free);
 
 
-int drm_agp_free_ioctl(struct drm_device *dev, void *data,
-		       struct drm_file *file_priv)
+int drm_legacy_agp_free_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file_priv)
 {
 	struct drm_agp_buffer *request = data;
 
-	return drm_agp_free(dev, request);
+	return drm_legacy_agp_free(dev, request);
 }
 
 /*
@@ -378,7 +379,7 @@ int drm_agp_free_ioctl(struct drm_device *dev, void *data,
  * Note that final cleanup of the kmalloced structure is directly done in
  * drm_pci_agp_destroy.
  */
-struct drm_agp_head *drm_agp_init(struct drm_device *dev)
+struct drm_agp_head *drm_legacy_agp_init(struct drm_device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct drm_agp_head *head = NULL;
@@ -409,7 +410,7 @@ struct drm_agp_head *drm_agp_init(struct drm_device *dev)
 	return head;
 }
 /* Only exported for i810.ko */
-EXPORT_SYMBOL(drm_agp_init);
+EXPORT_SYMBOL(drm_legacy_agp_init);
 
 /**
  * drm_legacy_agp_clear - Clear AGP resource list
@@ -439,8 +440,10 @@ void drm_legacy_agp_clear(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->agp->memory);
 
 	if (dev->agp->acquired)
-		drm_agp_release(dev);
+		drm_legacy_agp_release(dev);
 
 	dev->agp->acquired = 0;
 	dev->agp->enabled = 0;
 }
+
+#endif
diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 311dbd3e45e0..4805726b34ac 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -40,7 +40,6 @@
 
 #include <asm/shmparam.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 33390f02f5eb..d29907955ff7 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -31,7 +31,6 @@
 #include <linux/ratelimit.h>
 #include <linux/export.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>
 
@@ -619,6 +618,7 @@ static int compat_drm_dma(struct file *file, unsigned int cmd,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_DRM_LEGACY)
 #if IS_ENABLED(CONFIG_AGP)
 typedef struct drm_agp_mode32 {
 	u32 mode;	/**< AGP mode */
@@ -633,7 +633,7 @@ static int compat_drm_agp_enable(struct file *file, unsigned int cmd,
 	if (get_user(mode.mode, &argp->mode))
 		return -EFAULT;
 
-	return drm_ioctl_kernel(file,  drm_agp_enable_ioctl, &mode,
+	return drm_ioctl_kernel(file,  drm_legacy_agp_enable_ioctl, &mode,
 				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
 }
 
@@ -659,7 +659,7 @@ static int compat_drm_agp_info(struct file *file, unsigned int cmd,
 	struct drm_agp_info info;
 	int err;
 
-	err = drm_ioctl_kernel(file, drm_agp_info_ioctl, &info, DRM_AUTH);
+	err = drm_ioctl_kernel(file, drm_legacy_agp_info_ioctl, &info, DRM_AUTH);
 	if (err)
 		return err;
 
@@ -698,7 +698,7 @@ static int compat_drm_agp_alloc(struct file *file, unsigned int cmd,
 
 	request.size = req32.size;
 	request.type = req32.type;
-	err = drm_ioctl_kernel(file, drm_agp_alloc_ioctl, &request,
+	err = drm_ioctl_kernel(file, drm_legacy_agp_alloc_ioctl, &request,
 				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
 	if (err)
 		return err;
@@ -706,7 +706,7 @@ static int compat_drm_agp_alloc(struct file *file, unsigned int cmd,
 	req32.handle = request.handle;
 	req32.physical = request.physical;
 	if (copy_to_user(argp, &req32, sizeof(req32))) {
-		drm_ioctl_kernel(file, drm_agp_free_ioctl, &request,
+		drm_ioctl_kernel(file, drm_legacy_agp_free_ioctl, &request,
 				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
 		return -EFAULT;
 	}
@@ -723,7 +723,7 @@ static int compat_drm_agp_free(struct file *file, unsigned int cmd,
 	if (get_user(request.handle, &argp->handle))
 		return -EFAULT;
 
-	return drm_ioctl_kernel(file, drm_agp_free_ioctl, &request,
+	return drm_ioctl_kernel(file, drm_legacy_agp_free_ioctl, &request,
 				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
 }
 
@@ -744,7 +744,7 @@ static int compat_drm_agp_bind(struct file *file, unsigned int cmd,
 
 	request.handle = req32.handle;
 	request.offset = req32.offset;
-	return drm_ioctl_kernel(file, drm_agp_bind_ioctl, &request,
+	return drm_ioctl_kernel(file, drm_legacy_agp_bind_ioctl, &request,
 				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
 }
 
@@ -757,12 +757,11 @@ static int compat_drm_agp_unbind(struct file *file, unsigned int cmd,
 	if (get_user(request.handle, &argp->handle))
 		return -EFAULT;
 
-	return drm_ioctl_kernel(file, drm_agp_unbind_ioctl, &request,
+	return drm_ioctl_kernel(file, drm_legacy_agp_unbind_ioctl, &request,
 				DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY);
 }
 #endif /* CONFIG_AGP */
 
-#if IS_ENABLED(CONFIG_DRM_LEGACY)
 typedef struct drm_scatter_gather32 {
 	u32 size;	/**< In bytes -- will round to page boundary */
 	u32 handle;	/**< Used for mapping / unmapping */
@@ -935,7 +934,6 @@ static struct {
 	DRM_IOCTL32_DEF(DRM_IOCTL_GET_SAREA_CTX, compat_drm_getsareactx),
 	DRM_IOCTL32_DEF(DRM_IOCTL_RES_CTX, compat_drm_resctx),
 	DRM_IOCTL32_DEF(DRM_IOCTL_DMA, compat_drm_dma),
-#endif
 #if IS_ENABLED(CONFIG_AGP)
 	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_ENABLE, compat_drm_agp_enable),
 	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_INFO, compat_drm_agp_info),
@@ -944,6 +942,7 @@ static struct {
 	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_BIND, compat_drm_agp_bind),
 	DRM_IOCTL32_DEF(DRM_IOCTL_AGP_UNBIND, compat_drm_agp_unbind),
 #endif
+#endif
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 	DRM_IOCTL32_DEF(DRM_IOCTL_SG_ALLOC, compat_drm_sg_alloc),
 	DRM_IOCTL32_DEF(DRM_IOCTL_SG_FREE, compat_drm_sg_free),
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d273d1a8603a..b0856c139693 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -33,7 +33,6 @@
 #include <linux/pci.h>
 #include <linux/uaccess.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_auth.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
@@ -627,14 +626,21 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_CONTROL, drm_legacy_irq_control, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 
 #if IS_ENABLED(CONFIG_AGP)
-	DRM_IOCTL_DEF(DRM_IOCTL_AGP_ACQUIRE, drm_agp_acquire_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF(DRM_IOCTL_AGP_RELEASE, drm_agp_release_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF(DRM_IOCTL_AGP_ENABLE, drm_agp_enable_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF(DRM_IOCTL_AGP_INFO, drm_agp_info_ioctl, DRM_AUTH),
-	DRM_IOCTL_DEF(DRM_IOCTL_AGP_ALLOC, drm_agp_alloc_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF(DRM_IOCTL_AGP_FREE, drm_agp_free_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF(DRM_IOCTL_AGP_BIND, drm_agp_bind_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF(DRM_IOCTL_AGP_UNBIND, drm_agp_unbind_ioctl, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ACQUIRE, drm_legacy_agp_acquire_ioctl,
+			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_RELEASE, drm_legacy_agp_release_ioctl,
+			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ENABLE, drm_legacy_agp_enable_ioctl,
+			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_INFO, drm_legacy_agp_info_ioctl, DRM_AUTH),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_ALLOC, drm_legacy_agp_alloc_ioctl,
+			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_FREE, drm_legacy_agp_free_ioctl,
+			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_BIND, drm_legacy_agp_bind_ioctl,
+			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
+	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_AGP_UNBIND, drm_legacy_agp_unbind_ioctl,
+			     DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 #endif
 
 	DRM_LEGACY_IOCTL_DEF(DRM_IOCTL_SG_ALLOC, drm_legacy_sg_alloc, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
diff --git a/drivers/gpu/drm/drm_legacy.h b/drivers/gpu/drm/drm_legacy.h
index ae2d7d2a31c7..7080d2538421 100644
--- a/drivers/gpu/drm/drm_legacy.h
+++ b/drivers/gpu/drm/drm_legacy.h
@@ -148,6 +148,30 @@ struct drm_agp_mem {
 	struct list_head head;
 };
 
+/* drm_agpsupport.c */
+#if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_AGP)
+void drm_legacy_agp_clear(struct drm_device *dev);
+
+int drm_legacy_agp_acquire_ioctl(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv);
+int drm_legacy_agp_release_ioctl(struct drm_device *dev, void *data,
+				 struct drm_file *file_priv);
+int drm_legacy_agp_enable_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv);
+int drm_legacy_agp_info_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file_priv);
+int drm_legacy_agp_alloc_ioctl(struct drm_device *dev, void *data,
+			       struct drm_file *file_priv);
+int drm_legacy_agp_free_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file_priv);
+int drm_legacy_agp_unbind_ioctl(struct drm_device *dev, void *data,
+				struct drm_file *file_priv);
+int drm_legacy_agp_bind_ioctl(struct drm_device *dev, void *data,
+			      struct drm_file *file_priv);
+#else
+static inline void drm_legacy_agp_clear(struct drm_device *dev) {}
+#endif
+
 /* drm_lock.c */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 int drm_legacy_lock(struct drm_device *d, void *v, struct drm_file *f);
diff --git a/drivers/gpu/drm/drm_legacy_misc.c b/drivers/gpu/drm/drm_legacy_misc.c
index 8f54e6a78b6f..83db43b7a25e 100644
--- a/drivers/gpu/drm/drm_legacy_misc.c
+++ b/drivers/gpu/drm/drm_legacy_misc.c
@@ -33,7 +33,6 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_irq.h>
diff --git a/drivers/gpu/drm/drm_memory.c b/drivers/gpu/drm/drm_memory.c
index e4f20a2eb6e7..d2e1dccd8113 100644
--- a/drivers/gpu/drm/drm_memory.c
+++ b/drivers/gpu/drm/drm_memory.c
@@ -38,7 +38,6 @@
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_device.h>
 
diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 6e9af8b40419..38c3cb72e7e6 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -30,7 +30,6 @@
 #include <linux/slab.h>
 
 #include <drm/drm.h>
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 
@@ -135,7 +134,7 @@ static void drm_legacy_pci_agp_init(struct drm_device *dev)
 {
 	if (drm_core_check_feature(dev, DRIVER_USE_AGP)) {
 		if (pci_find_capability(to_pci_dev(dev->dev), PCI_CAP_ID_AGP))
-			dev->agp = drm_agp_init(dev);
+			dev->agp = drm_legacy_agp_init(dev);
 		if (dev->agp) {
 			dev->agp->agp_mtrr = arch_phys_wc_add(
 				dev->agp->agp_info.aper_base,
diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 9b3b989d7cad..e957d4851dc0 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -45,8 +45,6 @@
 #endif
 #include <linux/mem_encrypt.h>
 
-
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
index 8a728273d625..d78c82af367c 100644
--- a/drivers/gpu/drm/i810/i810_dma.c
+++ b/drivers/gpu/drm/i810/i810_dma.c
@@ -34,7 +34,6 @@
 #include <linux/mman.h>
 #include <linux/pci.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -1199,7 +1198,7 @@ int i810_driver_load(struct drm_device *dev, unsigned long flags)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	dev->agp = drm_agp_init(dev);
+	dev->agp = drm_legacy_agp_init(dev);
 	if (dev->agp) {
 		dev->agp->agp_mtrr = arch_phys_wc_add(
 			dev->agp->agp_info.aper_base,
diff --git a/drivers/gpu/drm/mga/mga_dma.c b/drivers/gpu/drm/mga/mga_dma.c
index 53a119a761df..403efc1f1a7c 100644
--- a/drivers/gpu/drm/mga/mga_dma.c
+++ b/drivers/gpu/drm/mga/mga_dma.c
@@ -469,20 +469,20 @@ static int mga_do_agp_dma_bootstrap(struct drm_device *dev,
 	struct drm_agp_binding bind_req;
 
 	/* Acquire AGP. */
-	err = drm_agp_acquire(dev);
+	err = drm_legacy_agp_acquire(dev);
 	if (err) {
 		DRM_ERROR("Unable to acquire AGP: %d\n", err);
 		return err;
 	}
 
-	err = drm_agp_info(dev, &info);
+	err = drm_legacy_agp_info(dev, &info);
 	if (err) {
 		DRM_ERROR("Unable to get AGP info: %d\n", err);
 		return err;
 	}
 
 	mode.mode = (info.mode & ~0x07) | dma_bs->agp_mode;
-	err = drm_agp_enable(dev, mode);
+	err = drm_legacy_agp_enable(dev, mode);
 	if (err) {
 		DRM_ERROR("Unable to enable AGP (mode = 0x%lx)\n", mode.mode);
 		return err;
@@ -502,7 +502,7 @@ static int mga_do_agp_dma_bootstrap(struct drm_device *dev,
 	/* Allocate and bind AGP memory. */
 	agp_req.size = agp_size;
 	agp_req.type = 0;
-	err = drm_agp_alloc(dev, &agp_req);
+	err = drm_legacy_agp_alloc(dev, &agp_req);
 	if (err) {
 		dev_priv->agp_size = 0;
 		DRM_ERROR("Unable to allocate %uMB AGP memory\n",
@@ -515,7 +515,7 @@ static int mga_do_agp_dma_bootstrap(struct drm_device *dev,
 
 	bind_req.handle = agp_req.handle;
 	bind_req.offset = 0;
-	err = drm_agp_bind(dev, &bind_req);
+	err = drm_legacy_agp_bind(dev, &bind_req);
 	if (err) {
 		DRM_ERROR("Unable to bind AGP memory: %d\n", err);
 		return err;
@@ -972,10 +972,10 @@ static int mga_do_cleanup_dma(struct drm_device *dev, int full_cleanup)
 				struct drm_agp_buffer free_req;
 
 				unbind_req.handle = dev_priv->agp_handle;
-				drm_agp_unbind(dev, &unbind_req);
+				drm_legacy_agp_unbind(dev, &unbind_req);
 
 				free_req.handle = dev_priv->agp_handle;
-				drm_agp_free(dev, &free_req);
+				drm_legacy_agp_free(dev, &free_req);
 
 				dev_priv->agp_textures = NULL;
 				dev_priv->agp_size = 0;
@@ -983,7 +983,7 @@ static int mga_do_cleanup_dma(struct drm_device *dev, int full_cleanup)
 			}
 
 			if ((dev->agp != NULL) && dev->agp->acquired)
-				err = drm_agp_release(dev);
+				err = drm_legacy_agp_release(dev);
 #endif
 		}
 
diff --git a/drivers/gpu/drm/mga/mga_drv.h b/drivers/gpu/drm/mga/mga_drv.h
index 66df51607896..84395d81ab9b 100644
--- a/drivers/gpu/drm/mga/mga_drv.h
+++ b/drivers/gpu/drm/mga/mga_drv.h
@@ -35,7 +35,6 @@
 #include <linux/pci.h>
 #include <linux/slab.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
diff --git a/drivers/gpu/drm/r128/r128_cce.c b/drivers/gpu/drm/r128/r128_cce.c
index 138af32480d4..2a2933c16308 100644
--- a/drivers/gpu/drm/r128/r128_cce.c
+++ b/drivers/gpu/drm/r128/r128_cce.c
@@ -37,10 +37,10 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/drm_irq.h>
+#include <drm/drm_legacy.h>
 #include <drm/drm_print.h>
 #include <drm/r128_drm.h>
 
diff --git a/drivers/gpu/drm/via/via_dma.c b/drivers/gpu/drm/via/via_dma.c
index cd56ffa3df58..177b0499abf1 100644
--- a/drivers/gpu/drm/via/via_dma.c
+++ b/drivers/gpu/drm/via/via_dma.c
@@ -38,7 +38,6 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm.h>
-#include <drm/drm_agpsupport.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
 #include <drm/via_drm.h>
diff --git a/include/drm/drm_agpsupport.h b/include/drm/drm_agpsupport.h
deleted file mode 100644
index f3136750c490..000000000000
--- a/include/drm/drm_agpsupport.h
+++ /dev/null
@@ -1,117 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _DRM_AGPSUPPORT_H_
-#define _DRM_AGPSUPPORT_H_
-
-#include <linux/agp_backend.h>
-#include <linux/kernel.h>
-#include <linux/list.h>
-#include <linux/mm.h>
-#include <linux/mutex.h>
-#include <linux/types.h>
-#include <uapi/drm/drm.h>
-
-struct drm_device;
-struct drm_file;
-
-struct drm_agp_head {
-	struct agp_kern_info agp_info;
-	struct list_head memory;
-	unsigned long mode;
-	struct agp_bridge_data *bridge;
-	int enabled;
-	int acquired;
-	unsigned long base;
-	int agp_mtrr;
-	int cant_use_aperture;
-	unsigned long page_mask;
-};
-
-#if IS_ENABLED(CONFIG_AGP)
-
-struct drm_agp_head *drm_agp_init(struct drm_device *dev);
-void drm_legacy_agp_clear(struct drm_device *dev);
-int drm_agp_acquire(struct drm_device *dev);
-int drm_agp_acquire_ioctl(struct drm_device *dev, void *data,
-			  struct drm_file *file_priv);
-int drm_agp_release(struct drm_device *dev);
-int drm_agp_release_ioctl(struct drm_device *dev, void *data,
-			  struct drm_file *file_priv);
-int drm_agp_enable(struct drm_device *dev, struct drm_agp_mode mode);
-int drm_agp_enable_ioctl(struct drm_device *dev, void *data,
-			 struct drm_file *file_priv);
-int drm_agp_info(struct drm_device *dev, struct drm_agp_info *info);
-int drm_agp_info_ioctl(struct drm_device *dev, void *data,
-		       struct drm_file *file_priv);
-int drm_agp_alloc(struct drm_device *dev, struct drm_agp_buffer *request);
-int drm_agp_alloc_ioctl(struct drm_device *dev, void *data,
-			struct drm_file *file_priv);
-int drm_agp_free(struct drm_device *dev, struct drm_agp_buffer *request);
-int drm_agp_free_ioctl(struct drm_device *dev, void *data,
-		       struct drm_file *file_priv);
-int drm_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request);
-int drm_agp_unbind_ioctl(struct drm_device *dev, void *data,
-			 struct drm_file *file_priv);
-int drm_agp_bind(struct drm_device *dev, struct drm_agp_binding *request);
-int drm_agp_bind_ioctl(struct drm_device *dev, void *data,
-		       struct drm_file *file_priv);
-
-#else /* CONFIG_AGP */
-
-static inline struct drm_agp_head *drm_agp_init(struct drm_device *dev)
-{
-	return NULL;
-}
-
-static inline void drm_legacy_agp_clear(struct drm_device *dev)
-{
-}
-
-static inline int drm_agp_acquire(struct drm_device *dev)
-{
-	return -ENODEV;
-}
-
-static inline int drm_agp_release(struct drm_device *dev)
-{
-	return -ENODEV;
-}
-
-static inline int drm_agp_enable(struct drm_device *dev,
-				 struct drm_agp_mode mode)
-{
-	return -ENODEV;
-}
-
-static inline int drm_agp_info(struct drm_device *dev,
-			       struct drm_agp_info *info)
-{
-	return -ENODEV;
-}
-
-static inline int drm_agp_alloc(struct drm_device *dev,
-				struct drm_agp_buffer *request)
-{
-	return -ENODEV;
-}
-
-static inline int drm_agp_free(struct drm_device *dev,
-			       struct drm_agp_buffer *request)
-{
-	return -ENODEV;
-}
-
-static inline int drm_agp_unbind(struct drm_device *dev,
-				 struct drm_agp_binding *request)
-{
-	return -ENODEV;
-}
-
-static inline int drm_agp_bind(struct drm_device *dev,
-			       struct drm_agp_binding *request)
-{
-	return -ENODEV;
-}
-
-#endif /* CONFIG_AGP */
-
-#endif /* _DRM_AGPSUPPORT_H_ */
diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index e5d6305e64a2..f588f967bb14 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -276,9 +276,6 @@ struct drm_device {
 	 */
 	spinlock_t event_lock;
 
-	/** @agp: AGP data */
-	struct drm_agp_head *agp;
-
 	/** @num_crtcs: Number of CRTCs on this device */
 	unsigned int num_crtcs;
 
@@ -326,6 +323,9 @@ struct drm_device {
 	struct pci_controller *hose;
 #endif
 
+	/* AGP data */
+	struct drm_agp_head *agp;
+
 	/* Context handle management - linked list of context handles */
 	struct list_head ctxlist;
 
diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
index faf64319be76..b17e79e12bc2 100644
--- a/include/drm/drm_legacy.h
+++ b/include/drm/drm_legacy.h
@@ -33,6 +33,8 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/agp_backend.h>
+
 #include <drm/drm.h>
 #include <drm/drm_auth.h>
 #include <drm/drm_hashtab.h>
@@ -225,6 +227,86 @@ static inline void drm_legacy_pci_exit(const struct drm_driver *driver,
 
 #endif
 
+/*
+ * AGP Support
+ */
+
+struct drm_agp_head {
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
+#if IS_ENABLED(CONFIG_DRM_LEGACY) && IS_ENABLED(CONFIG_AGP)
+struct drm_agp_head *drm_legacy_agp_init(struct drm_device *dev);
+int drm_legacy_agp_acquire(struct drm_device *dev);
+int drm_legacy_agp_release(struct drm_device *dev);
+int drm_legacy_agp_enable(struct drm_device *dev, struct drm_agp_mode mode);
+int drm_legacy_agp_info(struct drm_device *dev, struct drm_agp_info *info);
+int drm_legacy_agp_alloc(struct drm_device *dev, struct drm_agp_buffer *request);
+int drm_legacy_agp_free(struct drm_device *dev, struct drm_agp_buffer *request);
+int drm_legacy_agp_unbind(struct drm_device *dev, struct drm_agp_binding *request);
+int drm_legacy_agp_bind(struct drm_device *dev, struct drm_agp_binding *request);
+#else
+static inline struct drm_agp_head *drm_legacy_agp_init(struct drm_device *dev)
+{
+	return NULL;
+}
+
+static inline int drm_legacy_agp_acquire(struct drm_device *dev)
+{
+	return -ENODEV;
+}
+
+static inline int drm_legacy_agp_release(struct drm_device *dev)
+{
+	return -ENODEV;
+}
+
+static inline int drm_legacy_agp_enable(struct drm_device *dev,
+					struct drm_agp_mode mode)
+{
+	return -ENODEV;
+}
+
+static inline int drm_legacy_agp_info(struct drm_device *dev,
+				      struct drm_agp_info *info)
+{
+	return -ENODEV;
+}
+
+static inline int drm_legacy_agp_alloc(struct drm_device *dev,
+				       struct drm_agp_buffer *request)
+{
+	return -ENODEV;
+}
+
+static inline int drm_legacy_agp_free(struct drm_device *dev,
+				      struct drm_agp_buffer *request)
+{
+	return -ENODEV;
+}
+
+static inline int drm_legacy_agp_unbind(struct drm_device *dev,
+					struct drm_agp_binding *request)
+{
+	return -ENODEV;
+}
+
+static inline int drm_legacy_agp_bind(struct drm_device *dev,
+				      struct drm_agp_binding *request)
+{
+	return -ENODEV;
+}
+#endif
+
 /* drm_memory.c */
 void drm_legacy_ioremap(struct drm_local_map *map, struct drm_device *dev);
 void drm_legacy_ioremap_wc(struct drm_local_map *map, struct drm_device *dev);
-- 
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

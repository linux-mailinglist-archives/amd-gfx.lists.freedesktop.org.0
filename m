Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4920051987E
	for <lists+amd-gfx@lfdr.de>; Wed,  4 May 2022 09:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07BB10EDCA;
	Wed,  4 May 2022 07:44:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B512410ED6B;
 Wed,  4 May 2022 07:44:15 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id z19so744192edx.9;
 Wed, 04 May 2022 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xek4S3sn5Tsx1LGJkpy/bTRGS+fODRaiY+eQVBptcPE=;
 b=GXSds8wC2qc7LMx04mIC1KGPDrftAIc94nFpXP+L54dy5oODy3MFNInIVYND20YaaL
 SG3FyRcTk2QyZVcS4VbwMS0Nivc5PpjJY0qPU1iulKadZNiJlBJgPLsQ6u0ncvji9FzL
 g7bkXZi8dajCht0pVaJEErZuhOxahlFuw3vqZv9/ulIEZxF3TNXi3o6I7hmFNVOL2eJy
 N7kRWsUh2xfznLT1x/lZakOC3VeVQtdpvoVxMpTZvsujLm/vPaY3Haa7KlbcdK4NQkrs
 3tESxJcTHaydRlP4qghZTVsz5gbRwY0yoi1Z2G1Zy8s/gya4vw3prV/F1QrNjnKKjHEr
 VsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xek4S3sn5Tsx1LGJkpy/bTRGS+fODRaiY+eQVBptcPE=;
 b=XncpIwsGJGJ/qOQAWUzyOtQmjJNh66VrcpjWnohYfuAwe2ZN1Dd4l75GfSWpgEgS3l
 m84njnD1MibfD8aIogN1OreH1M1wteZo+9RqEvCJ6PEwW0+jL6suraeoEiAIyTqFm2x2
 4POmwlX9WjroFtkgeVYUVWmEZEFCsAODFnfWtMiopeOCPa8B6UG5tUPWmhhYVJ5Cyh6h
 ME1BsYqAlyNK204bfS3JGDny+mp00NUMcPZdsbasmMGSHqQbz0QDMD/a38ep4B8cVgaz
 2UEW8zi2VeiQBaYsLdb5XSxRstHQ4FF2lWuUvUc0JxZvb4ytz1JDCnnTGY93G303Yta/
 keig==
X-Gm-Message-State: AOAM532VHBxQI1znOcrhtq9ap6kMFHlujjgOCeMkDSLeFvuFwM99THIr
 eFV7zrjSb7rx6qeYcxUm3ZPevyEmLhs=
X-Google-Smtp-Source: ABdhPJw1VS3ns74mImKuYP39KCk4bDRDa7i3uNBlCHvLSA3jvrWNIKuHqjZ6uhxkCcePxL+c4pSd/g==
X-Received: by 2002:a05:6402:4241:b0:428:177b:5fd with SMTP id
 g1-20020a056402424100b00428177b05fdmr833570edb.193.1651650254040; 
 Wed, 04 May 2022 00:44:14 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 jz26-20020a17090775fa00b006f3ef214e49sm5369646ejc.175.2022.05.04.00.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:44:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 1/8] drm: execution context for GEM buffers v2
Date: Wed,  4 May 2022 09:44:05 +0200
Message-Id: <20220504074412.2180-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This adds the infrastructure for an execution context for GEM buffers
which is similar to the existinc TTMs execbuf util and intended to replace
it in the long term.

The basic functionality is that we abstracts the necessary loop to lock
many different GEM buffers with automated deadlock and duplicate handling.

v2: drop xarray and use dynamic resized array instead, the locking
    overhead is unecessary and measureable.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 Documentation/gpu/drm-mm.rst |  12 ++
 drivers/gpu/drm/Kconfig      |   7 +
 drivers/gpu/drm/Makefile     |   2 +
 drivers/gpu/drm/drm_exec.c   | 295 +++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h       | 144 +++++++++++++++++
 5 files changed, 460 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index f32ccce5722d..bf7dd2a78e9b 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -493,6 +493,18 @@ DRM Sync Objects
 .. kernel-doc:: drivers/gpu/drm/drm_syncobj.c
    :export:
 
+DRM Execution context
+=====================
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :doc: Overview
+
+.. kernel-doc:: include/drm/drm_exec.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_exec.c
+   :export:
+
 GPU Scheduler
 =============
 
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e88c497fa010..1b35c10df263 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -179,6 +179,12 @@ config DRM_TTM
 	  GPU memory types. Will be enabled automatically if a device driver
 	  uses it.
 
+config DRM_EXEC
+	tristate
+	depends on DRM
+	help
+	  Execution context for command submissions
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
@@ -252,6 +258,7 @@ config DRM_AMDGPU
 	select DRM_SCHED
 	select DRM_TTM
 	select DRM_TTM_HELPER
+	select DRM_EXEC
 	select POWER_SUPPLY
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 15fe3163f822..ee8573b683f3 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -37,6 +37,8 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 # Memory-management helpers
 #
+#
+obj-$(CONFIG_DRM_EXEC) += drm_exec.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
new file mode 100644
index 000000000000..ed2106c22786
--- /dev/null
+++ b/drivers/gpu/drm/drm_exec.c
@@ -0,0 +1,295 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#include <drm/drm_exec.h>
+#include <drm/drm_gem.h>
+#include <linux/dma-resv.h>
+
+/**
+ * DOC: Overview
+ *
+ * This component mainly abstracts the retry loop necessary for locking
+ * multiple GEM objects while preparing hardware operations (e.g. command
+ * submissions, page table updates etc..).
+ *
+ * If a contention is detected while locking a GEM object the cleanup procedure
+ * unlocks all previously locked GEM objects and locks the contended one first
+ * before locking any further objects.
+ *
+ * After an object is locked fences slots can optionally be reserved on the
+ * dma_resv object inside the GEM object.
+ *
+ * A typical usage pattern should look like this::
+ *
+ *	struct drm_gem_object *obj;
+ *	struct drm_exec exec;
+ *	unsigned long index;
+ *	int ret;
+ *
+ *	drm_exec_init(&exec, true);
+ *	drm_exec_while_not_all_locked(&exec) {
+ *		ret = drm_exec_prepare_obj(&exec, boA, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *
+ *		ret = drm_exec_lock(&exec, boB, 1);
+ *		drm_exec_continue_on_contention(&exec);
+ *		if (ret)
+ *			goto error;
+ *	}
+ *
+ *	drm_exec_for_each_locked_object(&exec, index, obj) {
+ *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
+ *		...
+ *	}
+ *	drm_exec_fini(&exec);
+ *
+ * See struct dma_exec for more details.
+ */
+
+/* Dummy value used to initially enter the retry loop */
+#define DRM_EXEC_DUMMY (void*)~0
+
+/* Initialize the drm_exec_objects container */
+static void drm_exec_objects_init(struct drm_exec_objects *container)
+{
+	container->objects = kmalloc(PAGE_SIZE, GFP_KERNEL);
+
+	/* If allocation here fails, just delay that till the first use */
+	container->max_objects = container->objects ?
+		PAGE_SIZE / sizeof(void *) : 0;
+	container->num_objects = 0;
+}
+
+/* Cleanup the drm_exec_objects container */
+static void drm_exec_objects_fini(struct drm_exec_objects *container)
+{
+	kvfree(container->objects);
+}
+
+/* Make sure we have enough room and add an object the container */
+static int drm_exec_objects_add(struct drm_exec_objects *container,
+				struct drm_gem_object *obj)
+{
+	if (unlikely(container->num_objects == container->max_objects)) {
+		size_t size = container->max_objects * sizeof(void *);
+		void *tmp;
+
+		tmp = kvrealloc(container->objects, size, size + PAGE_SIZE,
+				GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		container->objects = tmp;
+		container->max_objects += PAGE_SIZE / sizeof(void *);
+	}
+	drm_gem_object_get(obj);
+	container->objects[container->num_objects++] = obj;
+	return 0;
+}
+
+/* Unlock all objects and drop references */
+static void drm_exec_unlock_all(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj;
+	unsigned long index;
+
+	drm_exec_for_each_duplicate_object(exec, index, obj)
+		drm_gem_object_put(obj);
+
+	drm_exec_for_each_locked_object(exec, index, obj) {
+		dma_resv_unlock(obj->resv);
+		drm_gem_object_put(obj);
+	}
+}
+
+/**
+ * drm_exec_init - initialize a drm_exec object
+ * @exec: the drm_exec object to initialize
+ * @interruptible: if locks should be acquired interruptible
+ *
+ * Initialize the object and make sure that we can track locked and duplicate
+ * objects.
+ */
+void drm_exec_init(struct drm_exec *exec, bool interruptible)
+{
+	exec->interruptible = interruptible;
+	drm_exec_objects_init(&exec->locked);
+	drm_exec_objects_init(&exec->duplicates);
+	exec->contended = DRM_EXEC_DUMMY;
+}
+EXPORT_SYMBOL(drm_exec_init);
+
+/**
+ * drm_exec_fini - finalize a drm_exec object
+ * @exec: the drm_exec object to finilize
+ *
+ * Unlock all locked objects, drop the references to objects and free all memory
+ * used for tracking the state.
+ */
+void drm_exec_fini(struct drm_exec *exec)
+{
+	drm_exec_unlock_all(exec);
+	drm_exec_objects_fini(&exec->locked);
+	drm_exec_objects_fini(&exec->duplicates);
+	if (exec->contended != DRM_EXEC_DUMMY) {
+		drm_gem_object_put(exec->contended);
+		ww_acquire_fini(&exec->ticket);
+	}
+}
+EXPORT_SYMBOL(drm_exec_fini);
+
+/**
+ * drm_exec_cleanup - cleanup when contention is detected
+ * @exec: the drm_exec object to cleanup
+ *
+ * Cleanup the current state and return true if we should stay inside the retry
+ * loop, false if there wasn't any contention detected and we can keep the
+ * objects locked.
+ */
+bool drm_exec_cleanup(struct drm_exec *exec)
+{
+	if (likely(!exec->contended)) {
+		ww_acquire_done(&exec->ticket);
+		return false;
+	}
+
+	if (likely(exec->contended == DRM_EXEC_DUMMY)) {
+		exec->contended = NULL;
+		ww_acquire_init(&exec->ticket, &reservation_ww_class);
+		return true;
+	}
+
+	drm_exec_unlock_all(exec);
+	exec->locked.num_objects = 0;
+	exec->duplicates.num_objects = 0;
+	return true;
+}
+EXPORT_SYMBOL(drm_exec_cleanup);
+
+/* Track the locked object in the xa and reserve fences */
+static int drm_exec_obj_locked(struct drm_exec_objects *container,
+			       struct drm_gem_object *obj,
+			       unsigned int num_fences)
+{
+	int ret;
+
+	if (container) {
+		ret = drm_exec_objects_add(container, obj);
+		if (ret)
+			return ret;
+	}
+
+	if (num_fences) {
+		ret = dma_resv_reserve_fences(obj->resv, num_fences);
+		if (ret)
+			goto error_erase;
+	}
+
+	return 0;
+
+error_erase:
+	if (container) {
+		--container->num_objects;
+		drm_gem_object_put(obj);
+	}
+	return ret;
+}
+
+/* Make sure the contended object is locked first */
+static int drm_exec_lock_contended(struct drm_exec *exec)
+{
+	struct drm_gem_object *obj = exec->contended;
+	int ret;
+
+	if (likely(!obj))
+		return 0;
+
+	if (exec->interruptible) {
+		ret = dma_resv_lock_slow_interruptible(obj->resv,
+						       &exec->ticket);
+		if (unlikely(ret))
+			goto error_dropref;
+	} else {
+		dma_resv_lock_slow(obj->resv, &exec->ticket);
+	}
+
+	ret = drm_exec_obj_locked(&exec->locked, obj, 0);
+	if (unlikely(ret))
+		dma_resv_unlock(obj->resv);
+
+error_dropref:
+	/* Always cleanup the contention so that error handling can kick in */
+	drm_gem_object_put(obj);
+	exec->contended = NULL;
+	return ret;
+}
+
+/**
+ * drm_exec_prepare_obj - prepare a GEM object for use
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to prepare
+ * @num_fences: how many fences to reserve
+ *
+ * Prepare a GEM object for use by locking it and reserving fence slots. All
+ * succesfully locked objects are put into the locked container. Duplicates
+ * detected as well and automatically moved into the duplicates container.
+ *
+ * Returns: -EDEADLK if a contention is detected, -ENOMEM when memory
+ * allocation failed and zero for success.
+ */
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences)
+{
+	int ret;
+
+	ret = drm_exec_lock_contended(exec);
+	if (unlikely(ret))
+		return ret;
+
+	if (exec->interruptible)
+		ret = dma_resv_lock_interruptible(obj->resv, &exec->ticket);
+	else
+		ret = dma_resv_lock(obj->resv, &exec->ticket);
+
+	if (unlikely(ret == -EDEADLK)) {
+		drm_gem_object_get(obj);
+		exec->contended = obj;
+		return -EDEADLK;
+	}
+
+	if (unlikely(ret == -EALREADY)) {
+		struct drm_exec_objects *container = &exec->duplicates;
+
+		/*
+		 * If this is the first locked GEM object it was most likely
+		 * just contended. So don't add it to the duplicates, just
+		 * reserve the fence slots.
+		 */
+		if (exec->locked.num_objects && exec->locked.objects[0] == obj)
+			container = NULL;
+
+		ret = drm_exec_obj_locked(container, obj, num_fences);
+		if (ret)
+			return ret;
+
+	} else if (unlikely(ret)) {
+		return ret;
+
+	} else {
+		ret = drm_exec_obj_locked(&exec->locked, obj, num_fences);
+		if (ret)
+			goto error_unlock;
+	}
+
+	drm_gem_object_get(obj);
+	return 0;
+
+error_unlock:
+	dma_resv_unlock(obj->resv);
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_prepare_obj);
+
+MODULE_DESCRIPTION("DRM execution context");
+MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
new file mode 100644
index 000000000000..f73981c6292e
--- /dev/null
+++ b/include/drm/drm_exec.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef __DRM_EXEC_H__
+#define __DRM_EXEC_H__
+
+#include <linux/ww_mutex.h>
+
+struct drm_gem_object;
+
+/**
+ * struct drm_exec_objects - Container for GEM objects in a drm_exec
+ */
+struct drm_exec_objects {
+	unsigned int		num_objects;
+	unsigned int		max_objects;
+	struct drm_gem_object	**objects;
+};
+
+/**
+ * drm_exec_objects_for_each - iterate over all the objects inside the container
+ */
+#define drm_exec_objects_for_each(array, index, obj)		\
+	for (index = 0, obj = (array)->objects[0];		\
+	     index < (array)->num_objects;			\
+	     ++index, obj = (array)->objects[index])
+
+/**
+ * struct drm_exec - Execution context
+ */
+struct drm_exec {
+	/**
+	 * @interruptible: If locks should be taken interruptible
+	 */
+	bool			interruptible;
+
+	/**
+	 * @ticket: WW ticket used for acquiring locks
+	 */
+	struct ww_acquire_ctx	ticket;
+
+	/**
+	 * @locked: container for the locked GEM objects
+	 */
+	struct drm_exec_objects	locked;
+
+	/**
+	 * @duplicates: container for the duplicated GEM objects
+	 */
+	struct drm_exec_objects	duplicates;
+
+	/**
+	 * @contended: contended GEM object we backet of for.
+	 */
+	struct drm_gem_object	*contended;
+};
+
+/**
+ * drm_exec_for_each_locked_object - iterate over all the locked objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the locked GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_locked_object(exec, index, obj)	\
+	drm_exec_objects_for_each(&(exec)->locked, index, obj)
+
+/**
+ * drm_exec_for_each_duplicate_object - iterate over all the duplicate objects
+ * @exec: drm_exec object
+ * @index: unsigned long index for the iteration
+ * @obj: the current GEM object
+ *
+ * Iterate over all the duplicate GEM objects inside the drm_exec object.
+ */
+#define drm_exec_for_each_duplicate_object(exec, index, obj)	\
+	drm_exec_objects_for_each(&(exec)->duplicates, index, obj)
+
+/**
+ * drm_exec_while_not_all_locked - loop until all GEM objects are prepared
+ * @exec: drm_exec object
+ *
+ * Core functionality of the drm_exec object. Loops until all GEM objects are
+ * prepared and no more contention exists.
+ *
+ * At the beginning of the loop it is guaranteed that no GEM object is locked.
+ */
+#define drm_exec_while_not_all_locked(exec)	\
+	while (drm_exec_cleanup(exec))
+
+/**
+ * drm_exec_continue_on_contention - continue the loop when we need to cleanup
+ * @exec: drm_exec object
+ *
+ * Control flow helper to continue when a contention was detected and we need to
+ * clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_continue_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		continue
+
+/**
+ * drm_exec_break_on_contention - break a subordinal loop on contention
+ * @exec: drm_exec object
+ *
+ * Control flow helper to break a subordinal loop when a contention was detected
+ * and we need to clean up and re-start the loop to prepare all GEM objects.
+ */
+#define drm_exec_break_on_contention(exec)		\
+	if (unlikely(drm_exec_is_contended(exec)))	\
+		break
+
+/**
+ * drm_exec_is_contended - check for contention
+ * @exec: drm_exec object
+ *
+ * Returns true if the drm_exec object has run into some contention while
+ * locking a GEM object and needs to clean up.
+ */
+static inline bool drm_exec_is_contended(struct drm_exec *exec)
+{
+	return !!exec->contended;
+}
+
+/**
+ * drm_exec_has_duplicates - check for duplicated GEM object
+ * @exec: drm_exec object
+ *
+ * Return true if the drm_exec object has encountered some already locked GEM
+ * objects while trying to lock them. This can happen if multiple GEM objects
+ * share the same underlying resv object.
+ */
+static inline bool drm_exec_has_duplicates(struct drm_exec *exec)
+{
+	return exec->duplicates.num_objects > 0;
+}
+
+void drm_exec_init(struct drm_exec *exec, bool interruptible);
+void drm_exec_fini(struct drm_exec *exec);
+bool drm_exec_cleanup(struct drm_exec *exec);
+int drm_exec_prepare_obj(struct drm_exec *exec, struct drm_gem_object *obj,
+			 unsigned int num_fences);
+
+#endif
-- 
2.25.1


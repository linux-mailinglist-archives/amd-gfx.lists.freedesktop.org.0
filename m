Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5DF6015AE
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Oct 2022 19:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFAE210E6CE;
	Mon, 17 Oct 2022 17:48:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632EC10E69B;
 Mon, 17 Oct 2022 17:24:25 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AC9E66602382;
 Mon, 17 Oct 2022 18:24:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666027464;
 bh=ghI5AiSI3Ee3iycfzFTUQ1zGkQZkzfIBe/GkUYYMJ/8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V5mI4GUhRIVk7viOMvhG8HZPfs1pIOkJ81rO8Lw8uMe5YcPGWK7XI3/ucLE2eguaw
 jfc3Fxym82UMxt4iqjzn+9RLcOW9mUNSnNuTSJP8L+ceRE/wr3fatUXEcd/C1ECT4l
 ejmoavQySixyPXtW5mgFONBXEYMNejhTAHL1eIgA3LM+0qI2ko+MOOiXNryP+UcnLS
 bK7SVwcrWgF0htZ0xWFnxrVo6jcKPxYdM2I4JuaX8vj/Mm5ITks9RVldyqM47RD7gB
 bIrdJKlxHwD/AfYhO//5n2kbjoBEcMLoHWmxVal36C74Q+2q2CRyhCv2V8F/g3oUCC
 q/yjQIchxwjrw==
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Clark <robdclark@gmail.com>,
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 Qiang Yu <yuq825@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Tomi Valkeinen <tomba@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Ruhl Michael J <michael.j.ruhl@intel.com>
Subject: [PATCH v7 03/21] drm/gem: Take reservation lock for vmap/vunmap
 operations
Date: Mon, 17 Oct 2022 20:22:11 +0300
Message-Id: <20221017172229.42269-4-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
References: <20221017172229.42269-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Oct 2022 17:48:37 +0000
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
Cc: linux-rdma@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com,
 linux-media@vger.kernel.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The new common dma-buf locking convention will require buffer importers
to hold the reservation lock around mapping operations. Make DRM GEM core
to take the lock around the vmapping operations and update DRM drivers to
use the locked functions for the case where DRM core now holds the lock.
This patch prepares DRM core and drivers to the common dynamic dma-buf
locking convention.

Acked-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_client.c                 |  4 ++--
 drivers/gpu/drm/drm_gem.c                    | 24 ++++++++++++++++++++
 drivers/gpu/drm/drm_gem_dma_helper.c         |  6 ++---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c |  6 ++---
 drivers/gpu/drm/drm_gem_ttm_helper.c         |  9 +-------
 drivers/gpu/drm/lima/lima_sched.c            |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_dump.c     |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c  |  6 ++---
 drivers/gpu/drm/qxl/qxl_object.c             | 17 +++++++-------
 drivers/gpu/drm/qxl/qxl_prime.c              |  4 ++--
 include/drm/drm_gem.h                        |  3 +++
 11 files changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 2b230b4d6942..fbcb1e995384 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -323,7 +323,7 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
 	 * fd_install step out of the driver backend hooks, to make that
 	 * final step optional for internal users.
 	 */
-	ret = drm_gem_vmap(buffer->gem, map);
+	ret = drm_gem_vmap_unlocked(buffer->gem, map);
 	if (ret)
 		return ret;
 
@@ -345,7 +345,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
 	struct iosys_map *map = &buffer->map;
 
-	drm_gem_vunmap(buffer->gem, map);
+	drm_gem_vunmap_unlocked(buffer->gem, map);
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 86d670c71286..dbee4863e4f7 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1171,6 +1171,8 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
 
+	dma_resv_assert_held(obj->resv);
+
 	if (!obj->funcs->vmap)
 		return -EOPNOTSUPP;
 
@@ -1186,6 +1188,8 @@ EXPORT_SYMBOL(drm_gem_vmap);
 
 void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
+	dma_resv_assert_held(obj->resv);
+
 	if (iosys_map_is_null(map))
 		return;
 
@@ -1197,6 +1201,26 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
 }
 EXPORT_SYMBOL(drm_gem_vunmap);
 
+int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	int ret;
+
+	dma_resv_lock(obj->resv, NULL);
+	ret = drm_gem_vmap(obj, map);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_vmap_unlocked);
+
+void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	dma_resv_lock(obj->resv, NULL);
+	drm_gem_vunmap(obj, map);
+	dma_resv_unlock(obj->resv);
+}
+EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
+
 /**
  * drm_gem_lock_reservations - Sets up the ww context and acquires
  * the lock on an array of GEM objects.
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index f6901ff97bbb..1e658c448366 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -230,7 +230,7 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 
 	if (gem_obj->import_attach) {
 		if (dma_obj->vaddr)
-			dma_buf_vunmap(gem_obj->import_attach->dmabuf, &map);
+			dma_buf_vunmap_unlocked(gem_obj->import_attach->dmabuf, &map);
 		drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
 	} else if (dma_obj->vaddr) {
 		if (dma_obj->map_noncoherent)
@@ -581,7 +581,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 	struct iosys_map map;
 	int ret;
 
-	ret = dma_buf_vmap(attach->dmabuf, &map);
+	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
 	if (ret) {
 		DRM_ERROR("Failed to vmap PRIME buffer\n");
 		return ERR_PTR(ret);
@@ -589,7 +589,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	obj = drm_gem_dma_prime_import_sg_table(dev, attach, sgt);
 	if (IS_ERR(obj)) {
-		dma_buf_vunmap(attach->dmabuf, &map);
+		dma_buf_vunmap_unlocked(attach->dmabuf, &map);
 		return obj;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 880a4975507f..e35e224e6303 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -354,7 +354,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
 			ret = -EINVAL;
 			goto err_drm_gem_vunmap;
 		}
-		ret = drm_gem_vmap(obj, &map[i]);
+		ret = drm_gem_vmap_unlocked(obj, &map[i]);
 		if (ret)
 			goto err_drm_gem_vunmap;
 	}
@@ -376,7 +376,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
 		obj = drm_gem_fb_get_obj(fb, i);
 		if (!obj)
 			continue;
-		drm_gem_vunmap(obj, &map[i]);
+		drm_gem_vunmap_unlocked(obj, &map[i]);
 	}
 	return ret;
 }
@@ -403,7 +403,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct iosys_map *map)
 			continue;
 		if (iosys_map_is_null(&map[i]))
 			continue;
-		drm_gem_vunmap(obj, &map[i]);
+		drm_gem_vunmap_unlocked(obj, &map[i]);
 	}
 }
 EXPORT_SYMBOL(drm_gem_fb_vunmap);
diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index e5fc875990c4..d5962a34c01d 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -64,13 +64,8 @@ int drm_gem_ttm_vmap(struct drm_gem_object *gem,
 		     struct iosys_map *map)
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
-	int ret;
-
-	dma_resv_lock(gem->resv, NULL);
-	ret = ttm_bo_vmap(bo, map);
-	dma_resv_unlock(gem->resv);
 
-	return ret;
+	return ttm_bo_vmap(bo, map);
 }
 EXPORT_SYMBOL(drm_gem_ttm_vmap);
 
@@ -87,9 +82,7 @@ void drm_gem_ttm_vunmap(struct drm_gem_object *gem,
 {
 	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gem);
 
-	dma_resv_lock(gem->resv, NULL);
 	ttm_bo_vunmap(bo, map);
-	dma_resv_unlock(gem->resv);
 }
 EXPORT_SYMBOL(drm_gem_ttm_vunmap);
 
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index e82931712d8a..ff003403fbbc 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -371,7 +371,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 		} else {
 			buffer_chunk->size = lima_bo_size(bo);
 
-			ret = drm_gem_shmem_vmap(&bo->base, &map);
+			ret = drm_gem_vmap_unlocked(&bo->base.base, &map);
 			if (ret) {
 				kvfree(et);
 				goto out;
@@ -379,7 +379,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
 
 			memcpy(buffer_chunk + 1, map.vaddr, buffer_chunk->size);
 
-			drm_gem_shmem_vunmap(&bo->base, &map);
+			drm_gem_vunmap_unlocked(&bo->base.base, &map);
 		}
 
 		buffer_chunk = (void *)(buffer_chunk + 1) + buffer_chunk->size;
diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
index 89056a1aac7d..f62a019cc523 100644
--- a/drivers/gpu/drm/panfrost/panfrost_dump.c
+++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
@@ -209,7 +209,7 @@ void panfrost_core_dump(struct panfrost_job *job)
 			goto dump_header;
 		}
 
-		ret = drm_gem_shmem_vmap(&bo->base, &map);
+		ret = drm_gem_vmap_unlocked(&bo->base.base, &map);
 		if (ret) {
 			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
 			iter.hdr->bomap.valid = 0;
@@ -236,7 +236,7 @@ void panfrost_core_dump(struct panfrost_job *job)
 		vaddr = map.vaddr;
 		memcpy(iter.data, vaddr, bo->base.base.size);
 
-		drm_gem_shmem_vunmap(&bo->base, &map);
+		drm_gem_vunmap_unlocked(&bo->base.base, &map);
 
 		iter.hdr->bomap.valid = cpu_to_le32(1);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index bc0df93f7f21..ba9b6e2b2636 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -106,7 +106,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 		goto err_close_bo;
 	}
 
-	ret = drm_gem_shmem_vmap(bo, &map);
+	ret = drm_gem_vmap_unlocked(&bo->base, &map);
 	if (ret)
 		goto err_put_mapping;
 	perfcnt->buf = map.vaddr;
@@ -165,7 +165,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	return 0;
 
 err_vunmap:
-	drm_gem_shmem_vunmap(bo, &map);
+	drm_gem_vunmap_unlocked(&bo->base, &map);
 err_put_mapping:
 	panfrost_gem_mapping_put(perfcnt->mapping);
 err_close_bo:
@@ -195,7 +195,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
 
 	perfcnt->user = NULL;
-	drm_gem_shmem_vunmap(&perfcnt->mapping->obj->base, &map);
+	drm_gem_vunmap_unlocked(&perfcnt->mapping->obj->base.base, &map);
 	perfcnt->buf = NULL;
 	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
 	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
index 695d9308d1f0..06a58dad5f5c 100644
--- a/drivers/gpu/drm/qxl/qxl_object.c
+++ b/drivers/gpu/drm/qxl/qxl_object.c
@@ -168,9 +168,16 @@ int qxl_bo_vmap_locked(struct qxl_bo *bo, struct iosys_map *map)
 		bo->map_count++;
 		goto out;
 	}
-	r = ttm_bo_vmap(&bo->tbo, &bo->map);
+
+	r = __qxl_bo_pin(bo);
 	if (r)
 		return r;
+
+	r = ttm_bo_vmap(&bo->tbo, &bo->map);
+	if (r) {
+		__qxl_bo_unpin(bo);
+		return r;
+	}
 	bo->map_count = 1;
 
 	/* TODO: Remove kptr in favor of map everywhere. */
@@ -192,12 +199,6 @@ int qxl_bo_vmap(struct qxl_bo *bo, struct iosys_map *map)
 	if (r)
 		return r;
 
-	r = __qxl_bo_pin(bo);
-	if (r) {
-		qxl_bo_unreserve(bo);
-		return r;
-	}
-
 	r = qxl_bo_vmap_locked(bo, map);
 	qxl_bo_unreserve(bo);
 	return r;
@@ -247,6 +248,7 @@ void qxl_bo_vunmap_locked(struct qxl_bo *bo)
 		return;
 	bo->kptr = NULL;
 	ttm_bo_vunmap(&bo->tbo, &bo->map);
+	__qxl_bo_unpin(bo);
 }
 
 int qxl_bo_vunmap(struct qxl_bo *bo)
@@ -258,7 +260,6 @@ int qxl_bo_vunmap(struct qxl_bo *bo)
 		return r;
 
 	qxl_bo_vunmap_locked(bo);
-	__qxl_bo_unpin(bo);
 	qxl_bo_unreserve(bo);
 	return 0;
 }
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 142d01415acb..9169c26357d3 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -59,7 +59,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 	int ret;
 
-	ret = qxl_bo_vmap(bo, map);
+	ret = qxl_bo_vmap_locked(bo, map);
 	if (ret < 0)
 		return ret;
 
@@ -71,5 +71,5 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
-	qxl_bo_vunmap(bo);
+	qxl_bo_vunmap_locked(bo);
 }
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 58a18a17c67e..ed82039bfd5b 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -408,6 +408,9 @@ struct page **drm_gem_get_pages(struct drm_gem_object *obj);
 void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
 		bool dirty, bool accessed);
 
+int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
+void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
+
 int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 			   int count, struct drm_gem_object ***objs_out);
 struct drm_gem_object *drm_gem_object_lookup(struct drm_file *filp, u32 handle);
-- 
2.37.3


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9706015B4
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Oct 2022 19:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033E910E719;
	Mon, 17 Oct 2022 17:48:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6C410E689;
 Mon, 17 Oct 2022 17:24:37 +0000 (UTC)
Received: from dimapc.. (109-252-119-114.nat.spd-mgts.ru [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 12D196602392;
 Mon, 17 Oct 2022 18:24:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666027476;
 bh=bkOPdhT4KmbBTi13gT/RrmSvnfk+bsHbwFQx3BLv4fk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZTl8vQ6RNKg4tkH3j//rMDlPsKNpFYgTzEw3glhFR6TsD4QrNExdA04WJryFTSqV1
 d3gY6dgj4fMfQ46nQ0hXVezV69DyIEwKSnYDlVb6chnk4+1JXq7w3L59BrPTshDw7I
 uivybEYIgLoEbm0g0CG3dVhxOT1ZZy3Zh40hEfIW/3SnAF1siV3rM+Ln3UDX8L4FHY
 QKPGhJK3gZPCInCfam6pxxFs8MAPmgh+mTN2eNGfbB6/7VRGYeorz67fVg9MN85FAa
 +Cz+BvSc/RYc6+T3UkIE3ca7gs7JYAK/SvuVz8KT6DBYAUYNf6yNk4Amq6bC+JTVG2
 OKiYEqGMD8wOw==
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
Subject: [PATCH v7 06/21] drm/i915: Prepare to dynamic dma-buf locking
 specification
Date: Mon, 17 Oct 2022 20:22:14 +0300
Message-Id: <20221017172229.42269-7-dmitry.osipenko@collabora.com>
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

Prepare i915 driver to the common dynamic dma-buf locking convention
by starting to use the unlocked versions of dma-buf API functions
and handling cases where importer now holds the reservation lock.

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c       |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c       | 14 ++++++++++++++
 .../gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 16 ++++++++--------
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index f5062d0c6333..07eee1c09aaf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -72,7 +72,7 @@ static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf,
 	struct drm_i915_gem_object *obj = dma_buf_to_obj(dma_buf);
 	void *vaddr;
 
-	vaddr = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map(obj, I915_MAP_WB);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 85482a04d158..7cab89618bad 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -290,7 +290,21 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 	__i915_gem_object_free_mmaps(obj);
 
 	atomic_set(&obj->mm.pages_pin_count, 0);
+
+	/*
+	 * dma_buf_unmap_attachment() requires reservation to be
+	 * locked. The imported GEM shouldn't share reservation lock
+	 * and ttm_bo_cleanup_memtype_use() shouldn't be invoked for
+	 * dma-buf, so it's safe to take the lock.
+	 */
+	if (obj->base.import_attach)
+		i915_gem_object_lock(obj, NULL);
+
 	__i915_gem_object_put_pages(obj);
+
+	if (obj->base.import_attach)
+		i915_gem_object_unlock(obj);
+
 	GEM_BUG_ON(i915_gem_object_has_pages(obj));
 }
 
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 51ed824b020c..f2f3cfad807b 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -213,7 +213,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		goto out_import;
 	}
 
-	st = dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
+	st = dma_buf_map_attachment_unlocked(import_attach, DMA_BIDIRECTIONAL);
 	if (IS_ERR(st)) {
 		err = PTR_ERR(st);
 		goto out_detach;
@@ -226,7 +226,7 @@ static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
 		timeout = -ETIME;
 	}
 	err = timeout > 0 ? 0 : timeout;
-	dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
+	dma_buf_unmap_attachment_unlocked(import_attach, st, DMA_BIDIRECTIONAL);
 out_detach:
 	dma_buf_detach(dmabuf, import_attach);
 out_import:
@@ -296,7 +296,7 @@ static int igt_dmabuf_import(void *arg)
 		goto out_obj;
 	}
 
-	err = dma_buf_vmap(dmabuf, &map);
+	err = dma_buf_vmap_unlocked(dmabuf, &map);
 	dma_map = err ? NULL : map.vaddr;
 	if (!dma_map) {
 		pr_err("dma_buf_vmap failed\n");
@@ -337,7 +337,7 @@ static int igt_dmabuf_import(void *arg)
 
 	err = 0;
 out_dma_map:
-	dma_buf_vunmap(dmabuf, &map);
+	dma_buf_vunmap_unlocked(dmabuf, &map);
 out_obj:
 	i915_gem_object_put(obj);
 out_dmabuf:
@@ -358,7 +358,7 @@ static int igt_dmabuf_import_ownership(void *arg)
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
 
-	err = dma_buf_vmap(dmabuf, &map);
+	err = dma_buf_vmap_unlocked(dmabuf, &map);
 	ptr = err ? NULL : map.vaddr;
 	if (!ptr) {
 		pr_err("dma_buf_vmap failed\n");
@@ -367,7 +367,7 @@ static int igt_dmabuf_import_ownership(void *arg)
 	}
 
 	memset(ptr, 0xc5, PAGE_SIZE);
-	dma_buf_vunmap(dmabuf, &map);
+	dma_buf_vunmap_unlocked(dmabuf, &map);
 
 	obj = to_intel_bo(i915_gem_prime_import(&i915->drm, dmabuf));
 	if (IS_ERR(obj)) {
@@ -418,7 +418,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 	}
 	i915_gem_object_put(obj);
 
-	err = dma_buf_vmap(dmabuf, &map);
+	err = dma_buf_vmap_unlocked(dmabuf, &map);
 	ptr = err ? NULL : map.vaddr;
 	if (!ptr) {
 		pr_err("dma_buf_vmap failed\n");
@@ -435,7 +435,7 @@ static int igt_dmabuf_export_vmap(void *arg)
 	memset(ptr, 0xc5, dmabuf->size);
 
 	err = 0;
-	dma_buf_vunmap(dmabuf, &map);
+	dma_buf_vunmap_unlocked(dmabuf, &map);
 out:
 	dma_buf_put(dmabuf);
 	return err;
-- 
2.37.3


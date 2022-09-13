Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFA85B7B4E
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Sep 2022 21:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0243810E424;
	Tue, 13 Sep 2022 19:30:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34C10E1DF;
 Tue, 13 Sep 2022 19:30:04 +0000 (UTC)
Received: from dimapc.. (109-252-122-187.nat.spd-mgts.ru [109.252.122.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C9DD6601FF1;
 Tue, 13 Sep 2022 20:29:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663097403;
 bh=32DT79p8L1K15f6adhGbahiu94xS3zGj4oLq3s2Q/bk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RMDqnedVbqHb7nXTgtvUlemkGPaw5x7Ocza7HJwGwRyBSTSUoRCggPri0A1KoTJfR
 hl6alpo8d9bxRC3Nl8mOBteOffY+Vgq+A2938CkdExRpcrvoNHA5EDYPTWxR7Dfl+b
 57IsuZXJkgU+dsV9E9BYBQL3VBYcipoEMavmX+EJfPqfoficwCz+uIuqDVh8R+l9Rk
 Srhijm0Ziy1k77ovcr3QnJx52fLHMAQ5+EHO2TLApf6k9a1uKpeCz4DbkaLraZP17O
 YL5KE+sqZx/bRhDyqJzBd/K6NKc9HsD6DTBN/P5oC7axUA7QEOpLF9GNyaDCJeFQl5
 RioIt2Y0cPdeQ==
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
Subject: [PATCH v5 21/21] dma-buf: Remove obsoleted internal lock
Date: Tue, 13 Sep 2022 22:27:57 +0300
Message-Id: <20220913192757.37727-22-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913192757.37727-1-dmitry.osipenko@collabora.com>
References: <20220913192757.37727-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 13 Sep 2022 19:30:32 +0000
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

The internal dma-buf lock isn't needed anymore because the updated
locking specification claims that dma-buf reservation must be locked
by importers, and thus, the internal data is already protected by the
reservation lock. Remove the obsoleted internal lock.

Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 14 ++++----------
 include/linux/dma-buf.h   |  9 ---------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index c359bdbdf5be..45462b988aec 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -657,7 +657,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 
 	dmabuf->file = file;
 
-	mutex_init(&dmabuf->lock);
 	INIT_LIST_HEAD(&dmabuf->attachments);
 
 	mutex_lock(&db_list.lock);
@@ -1503,7 +1502,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
 int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 {
 	struct iosys_map ptr;
-	int ret = 0;
+	int ret;
 
 	iosys_map_clear(map);
 
@@ -1515,28 +1514,25 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	if (!dmabuf->ops->vmap)
 		return -EINVAL;
 
-	mutex_lock(&dmabuf->lock);
 	if (dmabuf->vmapping_counter) {
 		dmabuf->vmapping_counter++;
 		BUG_ON(iosys_map_is_null(&dmabuf->vmap_ptr));
 		*map = dmabuf->vmap_ptr;
-		goto out_unlock;
+		return 0;
 	}
 
 	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
 
 	ret = dmabuf->ops->vmap(dmabuf, &ptr);
 	if (WARN_ON_ONCE(ret))
-		goto out_unlock;
+		return ret;
 
 	dmabuf->vmap_ptr = ptr;
 	dmabuf->vmapping_counter = 1;
 
 	*map = dmabuf->vmap_ptr;
 
-out_unlock:
-	mutex_unlock(&dmabuf->lock);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
 
@@ -1578,13 +1574,11 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
 	BUG_ON(dmabuf->vmapping_counter == 0);
 	BUG_ON(!iosys_map_is_equal(&dmabuf->vmap_ptr, map));
 
-	mutex_lock(&dmabuf->lock);
 	if (--dmabuf->vmapping_counter == 0) {
 		if (dmabuf->ops->vunmap)
 			dmabuf->ops->vunmap(dmabuf, map);
 		iosys_map_clear(&dmabuf->vmap_ptr);
 	}
-	mutex_unlock(&dmabuf->lock);
 }
 EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
 
diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
index f11b5bbc2f37..6fa8d4e29719 100644
--- a/include/linux/dma-buf.h
+++ b/include/linux/dma-buf.h
@@ -326,15 +326,6 @@ struct dma_buf {
 	/** @ops: dma_buf_ops associated with this buffer object. */
 	const struct dma_buf_ops *ops;
 
-	/**
-	 * @lock:
-	 *
-	 * Used internally to serialize list manipulation, attach/detach and
-	 * vmap/unmap. Note that in many cases this is superseeded by
-	 * dma_resv_lock() on @resv.
-	 */
-	struct mutex lock;
-
 	/**
 	 * @vmapping_counter:
 	 *
-- 
2.37.3


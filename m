Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD415B7B3A
	for <lists+amd-gfx@lfdr.de>; Tue, 13 Sep 2022 21:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5756B10E26D;
	Tue, 13 Sep 2022 19:30:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C5210E1CF;
 Tue, 13 Sep 2022 19:29:44 +0000 (UTC)
Received: from dimapc.. (109-252-122-187.nat.spd-mgts.ru [109.252.122.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0550E6601FFD;
 Tue, 13 Sep 2022 20:29:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1663097383;
 bh=KXnLT1zxHK6U6noEjkHRO2Mfpv2Yq4iTZhk9Iiw0LNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PQyGcACbXOTNIgk0irg1P6NcYmxhJujzFOXE6Ef69JU5AzWwVFi7exXLF2mnvwUiB
 U6eAiHHbYb+Hxz0eHy+lpvBCT4eIvX0QaZ8+u6Rm/T+IkVvmFYnZJcPRS5hfBJKdNA
 NEmTX/AUUCVZH7BKy8T/A0CORL8IZ6KLqa6Abrihbt9xQSZ9BMBOyaNjiBJjkyJXuh
 n7tVhmliMWXj3IQ2im87fTlaYDbNTjLjQ33VTpcqARrbt3JYHn/df0U0UAxtjzLAaL
 9qy9nFA1JqFjSN8LOlgO2lVU8Xe9SAtAqJZnBk7uMKM5QtiavHcl6uzt3Z/oHiN9sG
 0PYhKji8YIX4g==
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
Subject: [PATCH v5 17/21] dma-buf: Move dma_buf_map_attachment() to dynamic
 locking specification
Date: Tue, 13 Sep 2022 22:27:53 +0300
Message-Id: <20220913192757.37727-18-dmitry.osipenko@collabora.com>
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

Move dma-buf attachment mapping functions to the dynamic locking
specification by asserting that the reservation lock is held.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/dma-buf/dma-buf.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index b406f42d1ebe..8873315d6edc 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1038,8 +1038,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	if (WARN_ON(!attach || !attach->dmabuf))
 		return ERR_PTR(-EINVAL);
 
-	if (dma_buf_attachment_is_dynamic(attach))
-		dma_resv_assert_held(attach->dmabuf->resv);
+	dma_resv_assert_held(attach->dmabuf->resv);
 
 	if (attach->sgt) {
 		/*
@@ -1054,7 +1053,6 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 	}
 
 	if (dma_buf_is_dynamic(attach->dmabuf)) {
-		dma_resv_assert_held(attach->dmabuf->resv);
 		if (!IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY)) {
 			r = attach->dmabuf->ops->pin(attach);
 			if (r)
@@ -1143,15 +1141,11 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	if (WARN_ON(!attach || !attach->dmabuf || !sg_table))
 		return;
 
-	if (dma_buf_attachment_is_dynamic(attach))
-		dma_resv_assert_held(attach->dmabuf->resv);
+	dma_resv_assert_held(attach->dmabuf->resv);
 
 	if (attach->sgt == sg_table)
 		return;
 
-	if (dma_buf_is_dynamic(attach->dmabuf))
-		dma_resv_assert_held(attach->dmabuf->resv);
-
 	__unmap_dma_buf(attach, sg_table, direction);
 
 	if (dma_buf_is_dynamic(attach->dmabuf) &&
-- 
2.37.3


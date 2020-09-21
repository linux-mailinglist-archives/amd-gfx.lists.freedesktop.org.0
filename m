Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F0227251E
	for <lists+amd-gfx@lfdr.de>; Mon, 21 Sep 2020 15:14:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DF3489E11;
	Mon, 21 Sep 2020 13:14:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7A689DD3;
 Mon, 21 Sep 2020 13:10:01 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A250F2907FB90E859727;
 Mon, 21 Sep 2020 21:09:57 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:09:49 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amdgpu: simplify the return expression
Date: Mon, 21 Sep 2020 21:10:13 +0800
Message-ID: <20200921131013.91326-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 21 Sep 2020 13:14:30 +0000
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
Cc: Qinglang Miao <miaoqinglang@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/cik_ih.c   |  7 +------
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 10 ++--------
 2 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 401c99f0b..db953e95f 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -316,14 +316,9 @@ static int cik_ih_sw_fini(void *handle)
 
 static int cik_ih_hw_init(void *handle)
 {
-	int r;
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	r = cik_ih_irq_init(adev);
-	if (r)
-		return r;
-
-	return 0;
+	return cik_ih_irq_init(adev);
 }
 
 static int cik_ih_hw_fini(void *handle)
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 20d8a03ca..56ed108b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -2198,7 +2198,6 @@ static int gfx_v9_0_gpu_early_init(struct amdgpu_device *adev)
 static int gfx_v9_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 				      int mec, int pipe, int queue)
 {
-	int r;
 	unsigned irq_type;
 	struct amdgpu_ring *ring = &adev->gfx.compute_ring[ring_id];
 	unsigned int hw_prio;
@@ -2223,13 +2222,8 @@ static int gfx_v9_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
 	hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring->queue) ?
 			AMDGPU_GFX_PIPE_PRIO_HIGH : AMDGPU_GFX_PIPE_PRIO_NORMAL;
 	/* type-2 packets are deprecated on MEC, use type-3 instead */
-	r = amdgpu_ring_init(adev, ring, 1024,
-			     &adev->gfx.eop_irq, irq_type, hw_prio);
-	if (r)
-		return r;
-
-
-	return 0;
+	return amdgpu_ring_init(adev, ring, 1024,
+				&adev->gfx.eop_irq, irq_type, hw_prio);
 }
 
 static int gfx_v9_0_sw_init(void *handle)
-- 
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

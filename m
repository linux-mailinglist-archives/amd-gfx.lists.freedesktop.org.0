Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C56B5FC61A
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Oct 2022 15:13:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E514110E4D7;
	Wed, 12 Oct 2022 13:13:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA89710E396;
 Wed, 12 Oct 2022 07:37:36 +0000 (UTC)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MnPWZ109nzlXYp;
 Wed, 12 Oct 2022 15:32:58 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 12 Oct 2022 15:37:32 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 12 Oct
 2022 15:37:32 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm/amdgpu/si_dma: remove unused variable in
 si_dma_stop()
Date: Wed, 12 Oct 2022 15:37:07 +0800
Message-ID: <20221012073707.3456008-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 12 Oct 2022 13:12:59 +0000
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
Cc: alexander.deucher@amd.com, yangyingliang@huawei.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

After commit 571c05365892 ("drm/amdgpu: switch sdma buffer function
tear down to a helper"), the variable 'ring' is not used anymore, it
can be removed.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/amd/amdgpu/si_dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 4d5e718540aa..abca8b529721 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -112,14 +112,12 @@ static void si_dma_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 seq,
 
 static void si_dma_stop(struct amdgpu_device *adev)
 {
-	struct amdgpu_ring *ring;
 	u32 rb_cntl;
 	unsigned i;
 
 	amdgpu_sdma_unset_buffer_funcs_helper(adev);
 
 	for (i = 0; i < adev->sdma.num_instances; i++) {
-		ring = &adev->sdma.instance[i].ring;
 		/* dma0 */
 		rb_cntl = RREG32(DMA_RB_CNTL + sdma_offsets[i]);
 		rb_cntl &= ~DMA_RB_ENABLE;
-- 
2.25.1


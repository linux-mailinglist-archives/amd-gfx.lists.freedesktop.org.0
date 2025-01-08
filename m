Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A7A055E6
	for <lists+amd-gfx@lfdr.de>; Wed,  8 Jan 2025 09:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773310E81B;
	Wed,  8 Jan 2025 08:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="e+9dNiVz";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3504610E815
 for <amd-gfx@lists.freedesktop.org>; Wed,  8 Jan 2025 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1736326578; h=From:To:Subject:Date:Message-ID:MIME-Version;
 bh=N2VVC4ZVNX6xfAIbIbsDBqx0kPOfxd55mrJFqrxJlTs=;
 b=e+9dNiVzbOuE3SpvSg+J0nm+oGV1jnfZmH9ceFKteXX7uQ3Bhe7dDc2ErQkOHjYeH9h+Rr4oRKbemaW6UjVmDuY0B1gh0wzZtLvAV61+uR3AcJDPe2n6J/EPhWBUy0b8t3GuRuCmqw/EUkhwy44apBkLOuIda0PvoOogiOfNFMU=
Received: from i32d02263.sqa.eu95.tbsite.net(mailfrom:gerry@linux.alibaba.com
 fp:SMTPD_---0WNDU-xZ_1736326577 cluster:ay36) by smtp.aliyun-inc.com;
 Wed, 08 Jan 2025 16:56:17 +0800
From: Jiang Liu <gerry@linux.alibaba.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, sunil.khatri@amd.com,
 lijo.lazar@amd.com, Hawking.Zhang@amd.com, mario.limonciello@amd.com,
 Jun.Ma2@amd.com, xiaogang.chen@amd.com, Kent.Russell@amd.com,
 shuox.liu@linux.alibaba.com, amd-gfx@lists.freedesktop.org
Cc: Jiang Liu <gerry@linux.alibaba.com>
Subject: [v3 5/6] drm/amdgpu: fix invalid memory access in
 amdgpu_fence_driver_sw_fini()
Date: Wed,  8 Jan 2025 16:56:03 +0800
Message-ID: <ab8e42d18be2d9555ccd3b03762d9a4b76e33a60.1736325561.git.gerry@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1736325561.git.gerry@linux.alibaba.com>
References: <cover.1736325561.git.gerry@linux.alibaba.com>
MIME-Version: 1.0
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Function detects initialization status by checking sched->ops, so set
sched->ops to non-NULL just before return in function
amdgpu_fence_driver_sw_fini() and amdgpu_device_init_schedulers()
to avoid possible invalid memory access on error recover path.

Signed-off-by: Jiang Liu <gerry@linux.alibaba.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 510074a9074e..741807a1fd2e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2857,6 +2857,7 @@ static int amdgpu_device_init_schedulers(struct amdgpu_device *adev)
 		if (r) {
 			DRM_ERROR("Failed to create scheduler on ring %s.\n",
 				  ring->name);
+			ring->sched.ops = NULL;
 			return r;
 		}
 		r = amdgpu_uvd_entity_init(adev, ring);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 2f24a6aa13bf..b5e87b515139 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -656,8 +656,10 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
 		 * The natural check would be sched.ready, which is
 		 * set as drm_sched_init() finishes...
 		 */
-		if (ring->sched.ops)
+		if (ring->sched.ops) {
 			drm_sched_fini(&ring->sched);
+			ring->sched.ops = NULL;
+		}
 
 		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)
 			dma_fence_put(ring->fence_drv.fences[j]);
-- 
2.43.5


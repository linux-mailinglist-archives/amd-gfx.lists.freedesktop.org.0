Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F14720F6DD
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jun 2020 16:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8806E288;
	Tue, 30 Jun 2020 14:10:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 435 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jun 2020 07:43:27 UTC
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D67A889E14
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jun 2020 07:43:27 +0000 (UTC)
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_2li6_peWehMAA--.614S2;
 Tue, 30 Jun 2020 15:36:03 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] gpu/drm: Replace "%p" with "%pK"
Date: Tue, 30 Jun 2020 15:36:01 +0800
Message-Id: <1593502561-15190-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx_2li6_peWehMAA--.614S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4kKryDKr1DWw1kXF1UWrg_yoW8KrWfpF
 48GF90kr95Zw1jv347AFyUXFyFkw47Xay8KF17C34S9w45ZFy8tr13Jw47XrW8Wa92yrsF
 qr1Du3yrWF1qkrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUyab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l4I8I
 3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
 WUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
 wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
 k0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
 Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8iL0UUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Mailman-Approved-At: Tue, 30 Jun 2020 14:10:45 +0000
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

When I update the latest kernel, I see the following "____ptrval____" boot
messages. Use "%pK" instead of "%p" so that the cpu address can be printed
when the kptr_restrict sysctl is set to 1.

Both radeon_fence_driver_start_ring() and amdgpu_fence_driver_start_ring()
have this similar issue, fix them.

[    1.872600] radeon 0000:01:05.0: fence driver on ring 0 use gpu addr 0x0000000048000c00 and cpu addr 0x(____ptrval____)
[    1.879095] radeon 0000:01:05.0: fence driver on ring 5 use gpu addr 0x0000000040056038 and cpu addr 0x(____ptrval____)

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 5 ++---
 drivers/gpu/drm/radeon/radeon_fence.c     | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index d878fe7..d4d1e8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -422,9 +422,8 @@ int amdgpu_fence_driver_start_ring(struct amdgpu_ring *ring,
 	ring->fence_drv.irq_type = irq_type;
 	ring->fence_drv.initialized = true;
 
-	DRM_DEV_DEBUG(adev->dev, "fence driver on ring %s use gpu addr "
-		      "0x%016llx, cpu addr 0x%p\n", ring->name,
-		      ring->fence_drv.gpu_addr, ring->fence_drv.cpu_addr);
+	DRM_DEV_DEBUG(adev->dev, "fence driver on ring %s use gpu addr 0x%016llx, cpu addr 0x%pK\n",
+		      ring->name, ring->fence_drv.gpu_addr, ring->fence_drv.cpu_addr);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/radeon/radeon_fence.c
index 43f2f93..c51b094 100644
--- a/drivers/gpu/drm/radeon/radeon_fence.c
+++ b/drivers/gpu/drm/radeon/radeon_fence.c
@@ -865,7 +865,7 @@ int radeon_fence_driver_start_ring(struct radeon_device *rdev, int ring)
 	}
 	radeon_fence_write(rdev, atomic64_read(&rdev->fence_drv[ring].last_seq), ring);
 	rdev->fence_drv[ring].initialized = true;
-	dev_info(rdev->dev, "fence driver on ring %d use gpu addr 0x%016llx and cpu addr 0x%p\n",
+	dev_info(rdev->dev, "fence driver on ring %d use gpu addr 0x%016llx and cpu addr 0x%pK\n",
 		 ring, rdev->fence_drv[ring].gpu_addr, rdev->fence_drv[ring].cpu_addr);
 	return 0;
 }
-- 
2.1.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

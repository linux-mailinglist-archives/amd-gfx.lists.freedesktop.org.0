Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7A6A881D1
	for <lists+amd-gfx@lfdr.de>; Mon, 14 Apr 2025 15:26:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B92010E5B2;
	Mon, 14 Apr 2025 13:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="au0Gxc5f";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F79510E5B2;
 Mon, 14 Apr 2025 13:26:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D17516116E;
 Mon, 14 Apr 2025 13:26:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F0AC4CEE2;
 Mon, 14 Apr 2025 13:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744637205;
 bh=w+wzz9N0HtAkSHaKTsvXQVrxM/kEqooV/Kw3QMQhOEE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=au0Gxc5fP5efVd9Mwzko2CM9yDK9bfpnd154VL1EYbSiNbZsYpXARX1SJl2InwqaD
 aDkyDEN/8rWzCfUkPR9FUlx+KP+BNQvtR9Mrq2RFRQcK3pq2kDzxFq8qMB+VuKcGtg
 P/ZTx/fiq3WC1JUX8WWko00mB2rg3SWD0YSZs2ZON4wutUR9IcjDskQrXDnGcTG/I7
 DcK6+znNaaZTWOoJp7As2yPH+skuAi4uD93ZGqWlyUIKJqNU/UXmJpP9ll+bvLQrsR
 5ZpMle+F6h+xCRWCDrdGfB6n85lGMPlVE/uAAndt491Cw6CkqoI+SE3eFgTfbc5u8w
 UU4cC93Jcf8Ew==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jay Cornwall <jay.cornwall@amd.com>, Kent Russell <kent.russell@amd.com>,
 Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 lijo.lazar@amd.com, Hawking.Zhang@amd.com, srinivasan.shanmugam@amd.com,
 sunil.khatri@amd.com, Jesse.zhang@amd.com, linux@treblig.org,
 zhangzekun11@huawei.com, victor.skvortsov@amd.com,
 rajneesh.bhardwaj@amd.com, Yunxiang.Li@amd.com, tim.huang@amd.com,
 Jack.Xiao@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 14/34] drm/amdgpu: Increase KIQ invalidate_tlbs
 timeout
Date: Mon, 14 Apr 2025 09:25:50 -0400
Message-Id: <20250414132610.677644-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414132610.677644-1-sashal@kernel.org>
References: <20250414132610.677644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.2
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

From: Jay Cornwall <jay.cornwall@amd.com>

[ Upstream commit 3666ed821832f42baaf25f362680dda603cde732 ]

KIQ invalidate_tlbs request has been seen to marginally exceed the
configured 100 ms timeout on systems under load.

All other KIQ requests in the driver use a 10 second timeout. Use a
similar timeout implementation on the invalidate_tlbs path.

v2: Poll once before msleep
v3: Fix return value

Signed-off-by: Jay Cornwall <jay.cornwall@amd.com>
Cc: Kent Russell <kent.russell@amd.com>
Reviewed-by: Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 19 ++++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 69895fccb474a..ab04d56b4fe36 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -352,7 +352,6 @@ enum amdgpu_kiq_irq {
 	AMDGPU_CP_KIQ_IRQ_DRIVER0 = 0,
 	AMDGPU_CP_KIQ_IRQ_LAST
 };
-#define SRIOV_USEC_TIMEOUT  1200000 /* wait 12 * 100ms for SRIOV */
 #define MAX_KIQ_REG_WAIT       5000 /* in usecs, 5ms */
 #define MAX_KIQ_REG_BAILOUT_INTERVAL   5 /* in msecs, 5ms */
 #define MAX_KIQ_REG_TRY 1000
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index 1c19a65e65533..ef74259c448d7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -678,12 +678,10 @@ int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
 				   uint32_t flush_type, bool all_hub,
 				   uint32_t inst)
 {
-	u32 usec_timeout = amdgpu_sriov_vf(adev) ? SRIOV_USEC_TIMEOUT :
-		adev->usec_timeout;
 	struct amdgpu_ring *ring = &adev->gfx.kiq[inst].ring;
 	struct amdgpu_kiq *kiq = &adev->gfx.kiq[inst];
 	unsigned int ndw;
-	int r;
+	int r, cnt = 0;
 	uint32_t seq;
 
 	/*
@@ -740,10 +738,21 @@ int amdgpu_gmc_flush_gpu_tlb_pasid(struct amdgpu_device *adev, uint16_t pasid,
 
 		amdgpu_ring_commit(ring);
 		spin_unlock(&adev->gfx.kiq[inst].ring_lock);
-		if (amdgpu_fence_wait_polling(ring, seq, usec_timeout) < 1) {
+
+		r = amdgpu_fence_wait_polling(ring, seq, MAX_KIQ_REG_WAIT);
+
+		might_sleep();
+		while (r < 1 && cnt++ < MAX_KIQ_REG_TRY &&
+		       !amdgpu_reset_pending(adev->reset_domain)) {
+			msleep(MAX_KIQ_REG_BAILOUT_INTERVAL);
+			r = amdgpu_fence_wait_polling(ring, seq, MAX_KIQ_REG_WAIT);
+		}
+
+		if (cnt > MAX_KIQ_REG_TRY) {
 			dev_err(adev->dev, "timeout waiting for kiq fence\n");
 			r = -ETIME;
-		}
+		} else
+			r = 0;
 	}
 
 error_unlock_reset:
-- 
2.39.5


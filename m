Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A8050DF52
	for <lists+amd-gfx@lfdr.de>; Mon, 25 Apr 2022 13:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC7410E5E0;
	Mon, 25 Apr 2022 11:47:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB5E10E5DD
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Apr 2022 11:47:46 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id v10so2109318pgl.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 25 Apr 2022 04:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=pj1cPYqN6UgP7VQtCM6r2tPUyJvhHHsnVAGo/cCoobI=;
 b=TL32cqptTAdC2LQIH6eYuvssDD//rlYbZdo60/tzl5FqOxCxIYeA5zEe24SF2lgsWL
 11Z3dbq/WJycl/kID422TlTy0PBEKxGjPC0B/H5AwXgNfKZAVmubZ6iJWAR8ZhFTy4Fe
 9HSrZ5Lw2g7GnJvS1rg6gy1aAxT16MoqqE59jgucsJRw+a+aU4lvvditg4WACQeZU62Y
 7UUYPxjgcp+C4ba0LeMEj+4oodBOSneZSSLEvIRy0k5yRmu42pJm99NKbg5ZLG3kByjA
 nc9wNdsHFNhltH8Fuaaa6gaHWiSVOUuV3ZYuz3QILK7CZ3Fl1R5T3hzxaF+l1UArfD46
 icYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=pj1cPYqN6UgP7VQtCM6r2tPUyJvhHHsnVAGo/cCoobI=;
 b=dSrMBhi0adtFZEEDV0MlsUoYOwn1tm9f6u0+L5NIfBJciqyPkyVtcWUJDLnQnN0y5V
 KPGm5OVLBLbiNTfTseDu0Q/w1K0eLtY+AmfAJBCMrqofRk/r6HBJd+JklHNKM+R1+cHX
 ALetzBzpWGt88G6Db/GeW1KZD6jFTEP3BlGVxAiIm829YCESYVzWOVNzcxz0xMTXLyQ2
 z64UL787x1xsZNgJrlGKhtFLS/SbZoun/FbThWMIuqnY/wUnkGzx9ZMCnJo7SOcuX/w0
 KtWfU/Do3PnTpswLKlYAK7EXl7wG0GNt2dykPJ/ucEuueG29sMeER37M+r0+25scP1UE
 f+ZQ==
X-Gm-Message-State: AOAM532MP9JwRcnyCJKVGDl4D1dU5LDvm0WpHWMz37i4Yp7mgE2ZLKBV
 NcccWQKNu51roXH0d0PZy7zVyRyr/+sdZwMU+xge59yE6XPGNw==
X-Google-Smtp-Source: ABdhPJzvjhLXqjyL/Sj0W+UEjuCJlOafibcrOHEtY/9r8eGRxneRVaUnUnXVQKRhOSN/nDe2T0mVqeqEolTlxULNSDw=
X-Received: by 2002:a05:6a00:188c:b0:50d:167f:1b62 with SMTP id
 x12-20020a056a00188c00b0050d167f1b62mr12143892pfh.49.1650887266206; Mon, 25
 Apr 2022 04:47:46 -0700 (PDT)
MIME-Version: 1.0
From: Haohui Mai <ricetons@gmail.com>
Date: Mon, 25 Apr 2022 19:47:35 +0800
Message-ID: <CAHpOOhHgvsM0YzuhP+9j=PsJLp5s2t9xCmcCOg+LvSiQX8rqug@mail.gmail.com>
Subject: [PATCH 1/2] Fix incorrect calculations of the wptr of the doorbells
To: amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: ckoenig.leichtzumerken@gmail.com, emily.deng@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Updated the commit messages based on the previous discussion.

Signed-off-by: Haohui Mai <ricetons@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/cik_sdma.c  | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 8 ++++----
 drivers/gpu/drm/amd/amdgpu/si_dma.c    | 4 ++--
 7 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
index c8ebd108548d..df863d346995 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
@@ -195,7 +195,7 @@ static void cik_sdma_ring_set_wptr(struct amdgpu_ring *ring)
  struct amdgpu_device *adev = ring->adev;

  WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[ring->me],
-        (lower_32_bits(ring->wptr) << 2) & 0x3fffc);
+        (lower_32_bits(ring->wptr << 2)) & 0x3fffc);
 }

 static void cik_sdma_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
@@ -487,7 +487,7 @@ static int cik_sdma_gfx_resume(struct amdgpu_device *adev)
  WREG32(mmSDMA0_GFX_RB_BASE_HI + sdma_offsets[i], ring->gpu_addr >> 40);

  ring->wptr = 0;
- WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[i], lower_32_bits(ring->wptr) << 2);
+ WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[i], lower_32_bits(ring->wptr << 2));

  /* enable DMA RB */
  WREG32(mmSDMA0_GFX_RB_CNTL + sdma_offsets[i],
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
index 1d8bbcbd7a37..b83fd00466fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
@@ -223,7 +223,7 @@ static void sdma_v2_4_ring_set_wptr(struct
amdgpu_ring *ring)
 {
  struct amdgpu_device *adev = ring->adev;

- WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[ring->me],
lower_32_bits(ring->wptr) << 2);
+ WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[ring->me],
lower_32_bits(ring->wptr << 2));
 }

 static void sdma_v2_4_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
@@ -465,7 +465,7 @@ static int sdma_v2_4_gfx_resume(struct amdgpu_device *adev)
  WREG32(mmSDMA0_GFX_RB_BASE_HI + sdma_offsets[i], ring->gpu_addr >> 40);

  ring->wptr = 0;
- WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[i], lower_32_bits(ring->wptr) << 2);
+ WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[i], lower_32_bits(ring->wptr << 2));

  /* enable DMA RB */
  rb_cntl = REG_SET_FIELD(rb_cntl, SDMA0_GFX_RB_CNTL, RB_ENABLE, 1);
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
index 4ef4feff5649..557a7d5174b0 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
@@ -389,14 +389,14 @@ static void sdma_v3_0_ring_set_wptr(struct
amdgpu_ring *ring)
  if (ring->use_doorbell) {
  u32 *wb = (u32 *)&adev->wb.wb[ring->wptr_offs];
  /* XXX check if swapping is necessary on BE */
- WRITE_ONCE(*wb, (lower_32_bits(ring->wptr) << 2));
- WDOORBELL32(ring->doorbell_index, lower_32_bits(ring->wptr) << 2);
+ WRITE_ONCE(*wb, (lower_32_bits(ring->wptr << 2)));
+ WDOORBELL32(ring->doorbell_index, lower_32_bits(ring->wptr << 2));
  } else if (ring->use_pollmem) {
  u32 *wb = (u32 *)&adev->wb.wb[ring->wptr_offs];

- WRITE_ONCE(*wb, (lower_32_bits(ring->wptr) << 2));
+ WRITE_ONCE(*wb, (lower_32_bits(ring->wptr << 2)));
  } else {
- WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[ring->me],
lower_32_bits(ring->wptr) << 2);
+ WREG32(mmSDMA0_GFX_RB_WPTR + sdma_offsets[ring->me],
lower_32_bits(ring->wptr << 2));
  }
 }

diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
index d7e8f7232364..ff86c43b63d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
@@ -772,8 +772,8 @@ static void sdma_v4_0_ring_set_wptr(struct
amdgpu_ring *ring)

  DRM_DEBUG("Using doorbell -- "
  "wptr_offs == 0x%08x "
- "lower_32_bits(ring->wptr) << 2 == 0x%08x "
- "upper_32_bits(ring->wptr) << 2 == 0x%08x\n",
+ "lower_32_bits(ring->wptr << 2) == 0x%08x "
+ "upper_32_bits(ring->wptr << 2) == 0x%08x\n",
  ring->wptr_offs,
  lower_32_bits(ring->wptr << 2),
  upper_32_bits(ring->wptr << 2));
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
index a8d49c005f73..627eb1f147c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
@@ -394,8 +394,8 @@ static void sdma_v5_0_ring_set_wptr(struct
amdgpu_ring *ring)
  if (ring->use_doorbell) {
  DRM_DEBUG("Using doorbell -- "
  "wptr_offs == 0x%08x "
- "lower_32_bits(ring->wptr) << 2 == 0x%08x "
- "upper_32_bits(ring->wptr) << 2 == 0x%08x\n",
+ "lower_32_bits(ring->wptr << 2) == 0x%08x "
+ "upper_32_bits(ring->wptr << 2) == 0x%08x\n",
  ring->wptr_offs,
  lower_32_bits(ring->wptr << 2),
  upper_32_bits(ring->wptr << 2));
@@ -774,9 +774,9 @@ static int sdma_v5_0_gfx_resume(struct amdgpu_device *adev)

  if (!amdgpu_sriov_vf(adev)) { /* only bare-metal use register write
for wptr */
  WREG32(sdma_v5_0_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR),
-        lower_32_bits(ring->wptr) << 2);
+        lower_32_bits(ring->wptr << 2));
  WREG32(sdma_v5_0_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR_HI),
-        upper_32_bits(ring->wptr) << 2);
+        upper_32_bits(ring->wptr << 2));
  }

  doorbell = RREG32_SOC15_IP(GC, sdma_v5_0_get_reg_offset(adev, i,
mmSDMA0_GFX_DOORBELL));
diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
index 824eace69884..a5eb82bfeaa8 100644
--- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
+++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
@@ -295,8 +295,8 @@ static void sdma_v5_2_ring_set_wptr(struct
amdgpu_ring *ring)
  if (ring->use_doorbell) {
  DRM_DEBUG("Using doorbell -- "
  "wptr_offs == 0x%08x "
- "lower_32_bits(ring->wptr) << 2 == 0x%08x "
- "upper_32_bits(ring->wptr) << 2 == 0x%08x\n",
+ "lower_32_bits(ring->wptr << 2) == 0x%08x "
+ "upper_32_bits(ring->wptr << 2) == 0x%08x\n",
  ring->wptr_offs,
  lower_32_bits(ring->wptr << 2),
  upper_32_bits(ring->wptr << 2));
@@ -672,8 +672,8 @@ static int sdma_v5_2_gfx_resume(struct amdgpu_device *adev)
  WREG32_SOC15_IP(GC, sdma_v5_2_get_reg_offset(adev, i,
mmSDMA0_GFX_MINOR_PTR_UPDATE), 1);

  if (!amdgpu_sriov_vf(adev)) { /* only bare-metal use register write
for wptr */
- WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR),
lower_32_bits(ring->wptr) << 2);
- WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR_HI),
upper_32_bits(ring->wptr) << 2);
+ WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR),
lower_32_bits(ring->wptr << 2));
+ WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_GFX_RB_WPTR_HI),
upper_32_bits(ring->wptr << 2));
  }

  doorbell = RREG32_SOC15_IP(GC, sdma_v5_2_get_reg_offset(adev, i,
mmSDMA0_GFX_DOORBELL));
diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c
b/drivers/gpu/drm/amd/amdgpu/si_dma.c
index 195b45bcb8ad..0af11d3b00e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
@@ -57,7 +57,7 @@ static void si_dma_ring_set_wptr(struct amdgpu_ring *ring)
  u32 me = (ring == &adev->sdma.instance[0].ring) ? 0 : 1;

  WREG32(DMA_RB_WPTR + sdma_offsets[me],
-        (lower_32_bits(ring->wptr) << 2) & 0x3fffc);
+        (lower_32_bits(ring->wptr << 2)) & 0x3fffc);
 }

 static void si_dma_ring_emit_ib(struct amdgpu_ring *ring,
@@ -175,7 +175,7 @@ static int si_dma_start(struct amdgpu_device *adev)
  WREG32(DMA_CNTL + sdma_offsets[i], dma_cntl);

  ring->wptr = 0;
- WREG32(DMA_RB_WPTR + sdma_offsets[i], lower_32_bits(ring->wptr) << 2);
+ WREG32(DMA_RB_WPTR + sdma_offsets[i], lower_32_bits(ring->wptr << 2));
  WREG32(DMA_RB_CNTL + sdma_offsets[i], rb_cntl | DMA_RB_ENABLE);

  ring->sched.ready = true;
--
2.25.1

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C72C903F
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Nov 2020 22:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8711A6E8CD;
	Mon, 30 Nov 2020 21:49:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C826E8CD
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 21:49:25 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id e60so9442595qtd.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 13:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4yt6viOrUaH2FeHBx2xYP5gcZdEk0jSFz9i/IICbsok=;
 b=o5O1IvMbIyS6TO3N10hT0yEqpQj4m1xBERwa+aym2nvjsgoun5r4U3iAinZdWDArvh
 Q0+bbawACIjix9RtsrmObYoT0llV74YNRSQWmBqbTxcusQQ7rUMp/mtuaA2ri/8gAQOi
 xRC5Qi7/gIj1FgAqiVT2iEYBhgr6TL5M7Ofkq2ghRkfgh6/zxvFBw95zNTExq47jd700
 fhyIlN32lGf8hw8/6M/cXIJCFGUHmM9AE5DRHygul3cvY9MN6VPV7f0T6tNGjjfSkWRO
 Xt3aN8XwmMZa3ja228JHvMHGJmLppUqiXe4jQYsJWvVHszVq9aEFzlE2wS6xBtQrwQt/
 CDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4yt6viOrUaH2FeHBx2xYP5gcZdEk0jSFz9i/IICbsok=;
 b=BpsIHjCRT0wtFo4FkgNyDIXJM8/UEr04L1MW2Hcjhj9sLMoTCDu9B7Nr7dnKRJYCBf
 PhIDUXN4ikIav+zqVF3QWFWTOPMx4pzat/kXLVsCeRumuEYW/tUlVy4nEggMoGpQ+0xX
 Q+41zgZot3FFlyjdN89eb44jxlJa31v/ogMVGz0uqHJHi/pLcBQcX3GzjsgEiy96h+93
 rFn3k6ICVSCWovbJP/d/XUS0nkBuBYGW+zQ9Php7QzfszQevle8nbgFBCjWCOmrkIHUY
 O6wPeXFcUNgrxhF/XyMY0ABAeSBY7VIdhkf0biuJs1l535m5TC08X2ZtFO8F8ugnbAqx
 zPbQ==
X-Gm-Message-State: AOAM532iT2dpEmN7xXNp/QaRYw+tOF5+bhsGL0sR9JT00s+yogKJPZei
 vIpluOkcytDNhHf1+kxUu0E+BBS9yMk=
X-Google-Smtp-Source: ABdhPJxyeby4uOkCcaaqhGphji2p5JDc5lEE0PEUVsvBpe5X9Jm0jj1ZKYVfvk4xZwCBKEQwjocOig==
X-Received: by 2002:ac8:5196:: with SMTP id c22mr24707521qtn.387.1606772964216; 
 Mon, 30 Nov 2020 13:49:24 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id o23sm2691131qkk.84.2020.11.30.13.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 13:49:23 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: enable AGP aperture on gmc10.x (v2)
Date: Mon, 30 Nov 2020 16:49:16 -0500
Message-Id: <20201130214916.3621-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Just a small optimization for accessing system pages directly.
Was missed for gmc v10 since the feature landed for older gmcs
while we were still on the emulator or gmc10 and we use the AGP
aperture for zfb on the emulator.

v2: fix up the system aperture as well

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c   |  1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c  | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c  |  8 ++++----
 5 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
index 456360bf58fa..2aecc6a243e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
@@ -153,16 +153,16 @@ static void gfxhub_v2_0_init_system_aperture_regs(struct amdgpu_device *adev)
 	uint64_t value;
 
 	if (!amdgpu_sriov_vf(adev)) {
-		/* Disable AGP. */
+		/* Program the AGP BAR */
 		WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_BASE, 0);
-		WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_TOP, 0);
-		WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_BOT, 0x00FFFFFF);
+		WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
+		WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
 
 		/* Program the system aperture low logical page number. */
 		WREG32_SOC15(GC, 0, mmGCMC_VM_SYSTEM_APERTURE_LOW_ADDR,
-			     adev->gmc.vram_start >> 18);
+			     min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
 		WREG32_SOC15(GC, 0, mmGCMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
-			     adev->gmc.vram_end >> 18);
+			     max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18);
 
 		/* Set default page address. */
 		value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
index 724bb29e9bb4..410fd3a1a388 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
@@ -152,16 +152,16 @@ static void gfxhub_v2_1_init_system_aperture_regs(struct amdgpu_device *adev)
 {
 	uint64_t value;
 
-	/* Disable AGP. */
+	/* Program the AGP BAR */
 	WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_BASE, 0);
-	WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_TOP, 0);
-	WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_BOT, 0x00FFFFFF);
+	WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
+	WREG32_SOC15(GC, 0, mmGCMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
 
 	/* Program the system aperture low logical page number. */
 	WREG32_SOC15(GC, 0, mmGCMC_VM_SYSTEM_APERTURE_LOW_ADDR,
-		     adev->gmc.vram_start >> 18);
+		     min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
 	WREG32_SOC15(GC, 0, mmGCMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
-		     adev->gmc.vram_end >> 18);
+		     max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18);
 
 	/* Set default page address. */
 	value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
index 4f6e44e21691..518233d71e6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -738,6 +738,7 @@ static void gmc_v10_0_vram_gtt_location(struct amdgpu_device *adev,
 
 	amdgpu_gmc_vram_location(adev, &adev->gmc, base);
 	amdgpu_gmc_gart_location(adev, mc);
+	amdgpu_gmc_agp_location(adev, mc);
 
 	/* base offset of vram pages */
 	adev->vm_manager.vram_base_offset = adev->gfxhub.funcs->get_mc_fb_offset(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
index 4ac8ac0c56c8..57d5f8ffb764 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
@@ -195,17 +195,17 @@ static void mmhub_v2_0_init_system_aperture_regs(struct amdgpu_device *adev)
 	uint64_t value;
 	uint32_t tmp;
 
-	/* Disable AGP. */
+	/* Program the AGP BAR */
 	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BASE, 0);
-	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_TOP, 0);
-	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BOT, 0x00FFFFFF);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
 
 	if (!amdgpu_sriov_vf(adev)) {
 		/* Program the system aperture low logical page number. */
 		WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_LOW_ADDR,
-			     adev->gmc.vram_start >> 18);
+			     min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
 		WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
-			     adev->gmc.vram_end >> 18);
+			     max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18);
 	}
 
 	/* Set default page address. */
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
index 3a248c8cd0b9..fa77eae6cf47 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -152,14 +152,14 @@ static void mmhub_v2_3_init_system_aperture_regs(struct amdgpu_device *adev)
 
 	/* Disable AGP. */
 	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BASE, 0);
-	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_TOP, 0);
-	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BOT, 0x00FFFFFF);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
 
 	/* Program the system aperture low logical page number. */
 	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_LOW_ADDR,
-		     adev->gmc.vram_start >> 18);
+		     min(adev->gmc.fb_start, adev->gmc.agp_start) >> 18);
 	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_HIGH_ADDR,
-		     adev->gmc.vram_end >> 18);
+		     max(adev->gmc.fb_end, adev->gmc.agp_end) >> 18);
 
 	/* Set default page address. */
 	value = adev->vram_scratch.gpu_addr - adev->gmc.vram_start +
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

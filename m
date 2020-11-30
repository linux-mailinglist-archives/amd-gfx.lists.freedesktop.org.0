Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA37C2C888F
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Nov 2020 16:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919B76E4D4;
	Mon, 30 Nov 2020 15:47:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D1D6E4D4
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 15:47:28 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id e60so8458842qtd.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 07:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R8/rp214Fxp9WaJpok4TJvOBQPrm4CyNbou/gQiieC8=;
 b=t7n+RWpnHog/1sprYbo/1bHXm2K5W2uEPS36ucdoKXxhwbSrNJBsUyxOzMRv5OAqxJ
 63l6qDBfjcl0vv5DXnSrtyx49zUl43iOp+1HzA6Lpn8G0HoX3/uGkb4legBBq0RI4UP1
 uzXAVxrD8TGnby//sUwdxSXJdG+DaUa+TGzRCXYrAidAdZgQRqd96TuTM3Phti5Q4eNg
 ba+a3OlzDwk00DgmFQYsqV/cJ1hYjIxZxt4J3NVWBaFH+WlWlppGcw2YsyG9lYNSOSiU
 bAySTp59JdJ4DRFWikVwtsRMnuVQskVt2Io1eISxowEZHGLxp+bDcOhlPleIa13DiNQT
 AXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R8/rp214Fxp9WaJpok4TJvOBQPrm4CyNbou/gQiieC8=;
 b=ajr7exCYj75F4cb5bHsHGWp4TvLqR7AuulrQegr6FF7Sr0Vnu7w39vzIsCfVb0CP5C
 yFkiObz0CfH72kXoH8HBVA8UVCKGaSCIGwLQSJluUXND68gdbq2Bs0Oej0RXNMPEzH2z
 Oyl3NB+wzzPlWCzosx3pAu/Cj4fG3QhgNU/n+hkIETR9b4ywJEeiMuDh+BA24Bc38tY7
 jP3SyWWaEO4ARrgQOva6NU+ZWhqmI4WD3RY6UHFE4oqD0oJRcGn4ABALLMKPjgVurJlv
 UGhLygaaZRIBVFZR1FhLigy2+Av9b4vUG0ucD1p9tTjV9/IfpsEiJrquBn0lm1mfA1b8
 Z2Eg==
X-Gm-Message-State: AOAM533MA5s/euQKlLCAHS+EFzd4DjzBBo8HAP5dgfK1zerVoAOP0YH9
 jv/9oUd6KUJLWfZakvmLRH6j7m+LyDs=
X-Google-Smtp-Source: ABdhPJwoF1FS8/aiAAWVzmbcYIiKe5gq3VFo98/Nrt7qZxamWb/CPJmBPObBVss+v59P66vn4AULqQ==
X-Received: by 2002:ac8:75d6:: with SMTP id z22mr21959377qtq.255.1606751247710; 
 Mon, 30 Nov 2020 07:47:27 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id v204sm16082577qka.4.2020.11.30.07.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 07:47:27 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: enable AGP aperture on gmc10.x
Date: Mon, 30 Nov 2020 10:47:14 -0500
Message-Id: <20201130154714.82710-1-alexander.deucher@amd.com>
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

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c | 6 +++---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c   | 1 +
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c  | 6 +++---
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c  | 4 ++--
 5 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
index 456360bf58fa..51606d2c346c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
@@ -153,10 +153,10 @@ static void gfxhub_v2_0_init_system_aperture_regs(struct amdgpu_device *adev)
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
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
index 724bb29e9bb4..95a50fadbd54 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_1.c
@@ -152,10 +152,10 @@ static void gfxhub_v2_1_init_system_aperture_regs(struct amdgpu_device *adev)
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
index 4ac8ac0c56c8..c539685948de 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
@@ -195,10 +195,10 @@ static void mmhub_v2_0_init_system_aperture_regs(struct amdgpu_device *adev)
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
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
index 3a248c8cd0b9..5372704889cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_3.c
@@ -152,8 +152,8 @@ static void mmhub_v2_3_init_system_aperture_regs(struct amdgpu_device *adev)
 
 	/* Disable AGP. */
 	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BASE, 0);
-	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_TOP, 0);
-	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BOT, 0x00FFFFFF);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_BOT, adev->gmc.agp_start >> 24);
+	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_AGP_TOP, adev->gmc.agp_end >> 24);
 
 	/* Program the system aperture low logical page number. */
 	WREG32_SOC15(MMHUB, 0, mmMMMC_VM_SYSTEM_APERTURE_LOW_ADDR,
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

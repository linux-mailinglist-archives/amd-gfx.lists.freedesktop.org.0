Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A72BB2315BC
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 00:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9316E43A;
	Tue, 28 Jul 2020 22:46:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067506E438
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 22:46:45 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id ed14so9982992qvb.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 15:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6A6EeC92mScQ5kVqaBaCrtyWgLedIomxp/oWsuCD/8E=;
 b=GZWfl5we7wKGXIQ1Pq4dtS/EBdTAj1tatmGISk98/ydSd43oKNdrEb+eUng+/yVxSr
 0hqp3gQGtjpQ9N70v7YvVCf2Eo6kwzI8UF0x48BoaH7PpFtLBcM1waxQeAlLlBC9w9Wc
 vfw1OZQ3DO6lhwVEPNbViFo74X6jc7MGhHDQwbsrnFi11L1ho0CDeDWcZ66elPCxN1Q5
 zNjXFk3PjBu/ZTMENUtzT0e0ifGyuRKf9vDXtSQYIQRnkyktMPh5vTjq88P9tqBpJPgJ
 Pa16WBrMjNVWIJZWhiammVURn0Pgw9I6AsZLRmiwa+gtyGVXirynhNw6nZ9OdMJLEgZG
 QxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6A6EeC92mScQ5kVqaBaCrtyWgLedIomxp/oWsuCD/8E=;
 b=Wj+c9Xnz4TDktuT+OR8sBw6Pe2h0RNHTqLyK0+z5iwIaX83pUBELZ5/PUlG17KCFCt
 /sRg4WkLTYIBBNiow2nC3s2sQ4U/Yc/W+WJIKtATjQhoYgYxYRIs/204WQTt08Uce6JD
 wdWizwnk+mRQWEuEPWYbjkNo9H4vs88hNrY55+LI+YVep9WcgpkwilSZVSb5AtW262V0
 cvKXJU/irQyoNV0UlMuN9zEIR+Coh11/5y6vfS9GJlKzIEamRBZ74HJQO74A6osaYVIR
 9Vr+gq8BMcwIb6tIHViBESupIiwCm9i63YcnkUz2W2c8p2BZyMcILuxESlmNijIwYpbU
 VglA==
X-Gm-Message-State: AOAM530SDmY3oNMa/YHWgotwD64svWAlpo6UZPGkbrqAezFMTM2kqjs8
 QYUgE386TRbxmL4Rcn+3zFQ5Es7W
X-Google-Smtp-Source: ABdhPJycO3DhWK/BqTqdjpsHIXKupu2AlwIiqLyICaJGs7C1+8oC9+EC6d2pBVxlcmwHw9sudH0BJQ==
X-Received: by 2002:a0c:e1c6:: with SMTP id v6mr17030417qvl.45.1595976403945; 
 Tue, 28 Jul 2020 15:46:43 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id o17sm189233qtr.13.2020.07.28.15.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:46:43 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/14] drm/amdgpu: drop the CPU pointers for the stolen vga bos
Date: Tue, 28 Jul 2020 18:46:04 -0400
Message-Id: <20200728224605.3919-14-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200728224605.3919-1-alexander.deucher@amd.com>
References: <20200728224605.3919-1-alexander.deucher@amd.com>
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

We never use them.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index ec975251b171..3df9d5a53741 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1915,7 +1915,6 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	uint64_t gtt_size;
 	int r;
 	u64 vis_vram_limit;
-	void *stolen_vga_buf, *stolen_extended_buf;
 
 	mutex_init(&adev->mman.gtt_window_lock);
 
@@ -1982,14 +1981,14 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	r = amdgpu_bo_create_kernel_at(adev, 0, adev->gmc.stolen_vga_size,
 				       AMDGPU_GEM_DOMAIN_VRAM,
 				       &adev->gmc.stolen_vga_memory,
-				       &stolen_vga_buf);
+				       NULL);
 	if (r)
 		return r;
 	r = amdgpu_bo_create_kernel_at(adev, adev->gmc.stolen_vga_size,
 				       adev->gmc.stolen_extended_size,
 				       AMDGPU_GEM_DOMAIN_VRAM,
 				       &adev->gmc.stolen_extended_memory,
-				       &stolen_extended_buf);
+				       NULL);
 	if (r)
 		return r;
 
@@ -2048,13 +2047,10 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
  */
 void amdgpu_ttm_late_init(struct amdgpu_device *adev)
 {
-	void *stolen_vga_buf, *stolen_extended_buf;
-
 	/* return the VGA stolen memory (if any) back to VRAM */
 	if (!adev->gmc.keep_stolen_vga_memory)
-		amdgpu_bo_free_kernel(&adev->gmc.stolen_vga_memory, NULL, &stolen_vga_buf);
-	amdgpu_bo_free_kernel(&adev->gmc.stolen_extended_memory, NULL,
-			      &stolen_extended_buf);
+		amdgpu_bo_free_kernel(&adev->gmc.stolen_vga_memory, NULL, NULL);
+	amdgpu_bo_free_kernel(&adev->gmc.stolen_extended_memory, NULL, NULL);
 }
 
 /**
@@ -2062,15 +2058,13 @@ void amdgpu_ttm_late_init(struct amdgpu_device *adev)
  */
 void amdgpu_ttm_fini(struct amdgpu_device *adev)
 {
-	void *stolen_vga_buf;
-
 	if (!adev->mman.initialized)
 		return;
 
 	amdgpu_ttm_training_reserve_vram_fini(adev);
 	/* return the stolen vga memory back to VRAM */
 	if (adev->gmc.keep_stolen_vga_memory)
-		amdgpu_bo_free_kernel(&adev->gmc.stolen_vga_memory, NULL, &stolen_vga_buf);
+		amdgpu_bo_free_kernel(&adev->gmc.stolen_vga_memory, NULL, NULL);
 	/* return the IP Discovery TMR memory back to VRAM */
 	amdgpu_bo_free_kernel(&adev->discovery_memory, NULL, NULL);
 	amdgpu_ttm_fw_reserve_vram_fini(adev);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

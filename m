Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A023236D
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 19:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9466E5BE;
	Wed, 29 Jul 2020 17:34:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BEE6E5BE
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 17:34:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x12so9744942qtp.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 10:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vCsveup/UB3GnF/sJkYurQqQfgnup4NtlLKuGeVb1/g=;
 b=OEpy776lrJczJXUmk3hWxE89+iOyTT+DcUpzywQ78wjtM+ISV9PTrpYXrW9WKbFm+H
 kgUM/txE08EOe+cSeoKNkEA2z21o+Wh8w3yUScbBZTTWOG1CyxZ6ZmlqYA0IixoxQSic
 7fGVypusnER+nY/Hm5sLN9vldHUntPXvuJBMaInHW8G5CzdMsDrEJLQajucdB9Qw813t
 cAO7nENS+oyOk/RV0s9FA7b9DA/W/wdup/9IiB1kviZS0pIDvlbxsk7Tvd4HJDM8/9sE
 ZvkyOAljIxPAkK1Ig0AbdlT9sCLluSSDPX9xA1emXf6D/p23fdH09942/FcQlD7bbADz
 Q8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vCsveup/UB3GnF/sJkYurQqQfgnup4NtlLKuGeVb1/g=;
 b=XEGQFHH0nk4aOSEmvOaoEmp2kWgy7QokUQ1vgXUVuoqG02E+jf5Nir1OcOt1R8n7ys
 1ZeUfSl/lKIeISeKe8DHkZpOXJV6jeCITMvqWEEW3znCwydrl1g80L7V0pSqiYW1GsrN
 jcA/duSpk5RSXXU8o83t+3egKIT+5TgtZRUJ3aXO35PwmwDZUJF3ydlvcE3RSfPufr6I
 09VSmLFjYLjz8CgjoRK7eT5STvy+6w3SQhNFbLMEzA2IAl2XvwVHfu/Sve8nD6TixPFK
 M7LhUAa6nYTLsXf8tcMYVm8BQV2tcLd7wkT5Zdg0UyyndH8mWG5hjfR/U46Yfjf9PUI/
 oS/Q==
X-Gm-Message-State: AOAM533sCS045IAySJXCDWK646UqS4bp1qOowshM5FasqaE87XKfv24d
 Hj9hS5DwomT5xf8kSJyDjRDTBXY3
X-Google-Smtp-Source: ABdhPJxwWyoMCsODEOzg5wCyBWhhBoazfvSs7yYwl5nsfbucfdeFnpzxIVYu/Sp4VsEmdKtGGuZw+A==
X-Received: by 2002:ac8:32d6:: with SMTP id a22mr24750739qtb.157.1596044091530; 
 Wed, 29 Jul 2020 10:34:51 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id z72sm2132956qka.107.2020.07.29.10.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 10:34:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/17] drm/amdgpu: move keep stolen memory check into gmc core
Date: Wed, 29 Jul 2020 13:34:27 -0400
Message-Id: <20200729173439.3698-6-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200729173439.3698-1-alexander.deucher@amd.com>
References: <20200729173439.3698-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rather than leaving this as a gmc v9 specific hack.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  9 ++++++++-
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 11 +++--------
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
index ddb64be670c2..0cf18f01e67a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
@@ -215,6 +215,7 @@ struct amdgpu_gmc {
 	bool			prt_warning;
 	uint64_t		stolen_vga_size;
 	struct amdgpu_bo	*stolen_vga_memory;
+	bool			keep_stolen_vga_memory;
 	uint32_t		sdpif_register;
 	/* apertures */
 	u64			shared_aperture_start;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 39781127d059..fd61769202b3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2042,8 +2042,10 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 void amdgpu_ttm_late_init(struct amdgpu_device *adev)
 {
 	void *stolen_vga_buf;
+
 	/* return the VGA stolen memory (if any) back to VRAM */
-	amdgpu_bo_free_kernel(&adev->gmc.stolen_vga_memory, NULL, &stolen_vga_buf);
+	if (!adev->gmc.keep_stolen_vga_memory)
+		amdgpu_bo_free_kernel(&adev->gmc.stolen_vga_memory, NULL, &stolen_vga_buf);
 }
 
 /**
@@ -2051,10 +2053,15 @@ void amdgpu_ttm_late_init(struct amdgpu_device *adev)
  */
 void amdgpu_ttm_fini(struct amdgpu_device *adev)
 {
+	void *stolen_vga_buf;
+
 	if (!adev->mman.initialized)
 		return;
 
 	amdgpu_ttm_training_reserve_vram_fini(adev);
+	/* return the stolen vga memory back to VRAM */
+	if (adev->gmc.keep_stolen_vga_memory)
+		amdgpu_bo_free_kernel(&adev->gmc.stolen_vga_memory, NULL, &stolen_vga_buf);
 	/* return the IP Discovery TMR memory back to VRAM */
 	amdgpu_bo_free_kernel(&adev->discovery_memory, NULL, NULL);
 	amdgpu_ttm_fw_reserve_vram_fini(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index b66c60680dba..c5d2e4390fba 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -932,8 +932,7 @@ static int gmc_v9_0_late_init(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 	int r;
 
-	if (!gmc_v9_0_keep_stolen_memory(adev))
-		amdgpu_bo_late_init(adev);
+	amdgpu_bo_late_init(adev);
 
 	r = amdgpu_gmc_allocate_vm_inv_eng(adev);
 	if (r)
@@ -1076,7 +1075,7 @@ static unsigned gmc_v9_0_get_vbios_fb_size(struct amdgpu_device *adev)
 	 * TODO Remove once GART corruption is resolved
 	 * Check related code in gmc_v9_0_sw_fini
 	 * */
-	if (gmc_v9_0_keep_stolen_memory(adev))
+	if (adev->gmc.keep_stolen_vga_memory)
 		return AMDGPU_VBIOS_VGA_ALLOCATION;
 
 	d1vga_control = RREG32_SOC15(DCE, 0, mmD1VGA_CONTROL);
@@ -1243,6 +1242,7 @@ static int gmc_v9_0_sw_init(void *handle)
 	if (r)
 		return r;
 
+	adev->gmc.keep_stolen_vga_memory = gmc_v9_0_keep_stolen_memory(adev);
 	adev->gmc.stolen_vga_size = gmc_v9_0_get_vbios_fb_size(adev);
 
 	/* Memory manager */
@@ -1275,15 +1275,10 @@ static int gmc_v9_0_sw_init(void *handle)
 static int gmc_v9_0_sw_fini(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
-	void *stolen_vga_buf;
 
 	amdgpu_gmc_ras_fini(adev);
 	amdgpu_gem_force_release(adev);
 	amdgpu_vm_manager_fini(adev);
-
-	if (gmc_v9_0_keep_stolen_memory(adev))
-		amdgpu_bo_free_kernel(&adev->gmc.stolen_vga_memory, NULL, &stolen_vga_buf);
-
 	amdgpu_gart_table_vram_free(adev);
 	amdgpu_bo_fini(adev);
 	amdgpu_gart_fini(adev);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

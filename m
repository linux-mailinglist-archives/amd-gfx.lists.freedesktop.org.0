Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1F232373
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 19:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E87936E5C8;
	Wed, 29 Jul 2020 17:35:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6BF6E5C8
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 17:34:57 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d27so18248711qtg.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jul 2020 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hsaPWRZPPWCGsyXT4Tgs6cVV5lF4SXPXEroEBRBlo+c=;
 b=RaaMTWmK2ec0NDO8SbnmoCX6sBCv/IhJohTZPEFEjKX4fgqktviQOGiRzwXbpcOC7A
 YS7As9ZTfIs1RYeIrdmZ93YIrg1s7/CZ8ZtUukCTb2jWlVR5g95M3vU+PSzDeGQWGzH8
 Ceh+JT2059vRlg1mKyZ/UUhuQkQkV1XT3xzuJyzcU2yU0tXyuDYf8hGrjh27LN9CVSK2
 oYaTNn2wLX3WsOsTldDWGlEXSUspqrHfZUCGBjim2uQfY+gbDXOvWrC7cWewBGMcv+gS
 +SG/S/KVjGuQLnTQVAqjG23HyKPur4qM+S/KfzTj49oe5kScuY1mlxdel28UhYt47/a/
 I7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hsaPWRZPPWCGsyXT4Tgs6cVV5lF4SXPXEroEBRBlo+c=;
 b=no/j+ufWiJxP/ht+D8HMwXblpTQUa77JgX79UTxdmH+mQlwMS8q7gZNv6lADGtqhKr
 9LB170AcKSgGjVzNIN+AvVZOsSjylcgJkktXt9cioYuoFX0cipsgcDV6lruIXdbTfO/D
 TK6WipDMAPc8wehwjvRvwLVfvJ2WFj+s+s4dGwlJ3l8QwXZ2Sgouex1lLOEeUtBDNTED
 Q+j9OPtMGMZpYdwn7zVL6HJqO//03QpNKC2KLV+b79DU+/Mn1BCQE6IZa8cmJ+IH1cK7
 vx/ypIIrj7KfZjzj3zwsz5PhRop9YCMtJ7YsWPDQRR3PGjiLK+AbCO/6pl97LOYeZ8Yf
 iOdA==
X-Gm-Message-State: AOAM532rYb1pBrEqgZPHV7mStlF2ydoXz+Gs8eSC6sHkZIE8QKwkR3Qa
 +q72bPtDmYfUIA+7DRcVcM4X62G6
X-Google-Smtp-Source: ABdhPJx3zamt57fdgob4F+jqlFdwWMMc62k05TjycakcEze89eiEfl4ZPYe4A1SNp7TWgnxonGqDIQ==
X-Received: by 2002:ac8:24d9:: with SMTP id t25mr26097272qtt.15.1596044096562; 
 Wed, 29 Jul 2020 10:34:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id z72sm2132956qka.107.2020.07.29.10.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 10:34:56 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/17] drm/amdgpu/gmc8: switch to using
 amdgpu_gmc_get_vbios_allocations
Date: Wed, 29 Jul 2020 13:34:32 -0400
Message-Id: <20200729173439.3698-11-alexander.deucher@amd.com>
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

The new helper centralizes the logic in one place.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 8e3763ec268f..9ab65ca7df77 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1094,9 +1094,7 @@ static unsigned gmc_v8_0_get_vbios_fb_size(struct amdgpu_device *adev)
 			REG_GET_FIELD(viewport, VIEWPORT_SIZE, VIEWPORT_WIDTH) *
 			4);
 	}
-	/* return 0 if the pre-OS buffer uses up most of vram */
-	if ((adev->gmc.real_vram_size - size) < (8 * 1024 * 1024))
-		return 0;
+
 	return size;
 }
 
@@ -1160,7 +1158,7 @@ static int gmc_v8_0_sw_init(void *handle)
 	if (r)
 		return r;
 
-	adev->gmc.stolen_vga_size = gmc_v8_0_get_vbios_fb_size(adev);
+	amdgpu_gmc_get_vbios_allocations(adev);
 
 	/* Memory manager */
 	r = amdgpu_bo_init(adev);
@@ -1739,7 +1737,8 @@ static const struct amdgpu_gmc_funcs gmc_v8_0_gmc_funcs = {
 	.emit_pasid_mapping = gmc_v8_0_emit_pasid_mapping,
 	.set_prt = gmc_v8_0_set_prt,
 	.get_vm_pde = gmc_v8_0_get_vm_pde,
-	.get_vm_pte = gmc_v8_0_get_vm_pte
+	.get_vm_pte = gmc_v8_0_get_vm_pte,
+	.get_vbios_fb_size = gmc_v8_0_get_vbios_fb_size,
 };
 
 static const struct amdgpu_irq_src_funcs gmc_v8_0_irq_funcs = {
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

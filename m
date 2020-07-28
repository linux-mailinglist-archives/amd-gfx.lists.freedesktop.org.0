Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2222315B1
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jul 2020 00:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AFD6E42D;
	Tue, 28 Jul 2020 22:46:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07236E42C
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 22:46:34 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l64so13629308qkb.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 28 Jul 2020 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZIx0WKFVP8Bk0HAjf9lodcvIA8liCjia5eMO840ZwMw=;
 b=eEmOZaRXZsK77U6hv59PB5O1MX9WeNRqfzubDOEUjs0LUziXIMIogGBnKt4JjNIE3b
 REqnLVcb0DWaz9PZwsPml9TuH+pzWaAA8EcPGqZuuUYHM/vdHLvU2ZMch3dyl/7uHkiA
 sLZtM8V3NDVbjIG3Xft4Vzgj0iIIDGKl6CHSRxNmvcmCfK4Pd3RFIOtWcJb9/iFSz+3E
 vOJQTnf4hZymKPT2gfIV1/yFRo3gWhae6edpx2aCFFidoBGBqM5pm+0+so363z6IMsae
 ygBgR0S5EcIixA+5zTPjdcyV45tjAZGPtCXsMl9N31EoPY5LgixVK9l524miuc63koaC
 ZWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZIx0WKFVP8Bk0HAjf9lodcvIA8liCjia5eMO840ZwMw=;
 b=XCJBYS5UN/09y8OMweji3hBsr/wVSCK0VhMSZGWxIJ7ASR1k5fa8Jr6BF9c1ix6YPG
 FohG9OyPm7ICbTJMNyd7iDC1ZQ+X8Uk2fbsrkn4TuJQ1mMwIBFwPV42HIRJxIxV48izf
 snfbvCOt80+/Hpbw9VyUe4RAdWw+Uoy1IVGHd4FrjTGA/Dz6JRiP2UuSyG9OxNfWlBuF
 i9/m/3NHLK/Z4oXkb50Z7JAw5VVIEOuUWi0LW9qfImf+zbUUD5zwquiEgqQ+fCo42f63
 LucavYEUWclXjuTmkMAqMso0RS6g6ZeJqNS0fhQYJKgabzx/ppy7rrRCb6rXoJUn5EJ6
 v8WA==
X-Gm-Message-State: AOAM533yqjG3uQRHpoeE1z8EAazS9MCUJIKWFSy1hqqJrxtOUbcI2YjS
 swZEUNb4fI97IlhpLM6c21Y3EfCL
X-Google-Smtp-Source: ABdhPJyqmEUHNVGdnACykBE5ruZuHn/BBUPKaveVYYFbNNxk5D4GZ18CPeHvfCmd+VnDX6TpyVF4wA==
X-Received: by 2002:a37:afc2:: with SMTP id
 y185mr29665383qke.308.1595976393829; 
 Tue, 28 Jul 2020 15:46:33 -0700 (PDT)
Received: from localhost.localdomain ([71.219.66.138])
 by smtp.gmail.com with ESMTPSA id o17sm189233qtr.13.2020.07.28.15.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jul 2020 15:46:33 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/14] drm/amdgpu: use create_at for the stolen pre-OS buffer
Date: Tue, 28 Jul 2020 18:45:53 -0400
Message-Id: <20200728224605.3919-3-alexander.deucher@amd.com>
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

Should be functionally the same since nothing else is
allocated at that point, but let's be exact.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 605d266754f6..a188216bccc2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1979,10 +1979,10 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	 * This is used for VGA emulation and pre-OS scanout buffers to
 	 * avoid display artifacts while transitioning between pre-OS
 	 * and driver.  */
-	r = amdgpu_bo_create_kernel(adev, adev->gmc.stolen_size, PAGE_SIZE,
-				    AMDGPU_GEM_DOMAIN_VRAM,
-				    &adev->stolen_vga_memory,
-				    NULL, &stolen_vga_buf);
+	r = amdgpu_bo_create_kernel_at(adev, 0, adev->gmc.stolen_size,
+				       AMDGPU_GEM_DOMAIN_VRAM,
+				       &adev->stolen_vga_memory,
+				       &stolen_vga_buf);
 	if (r)
 		return r;
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

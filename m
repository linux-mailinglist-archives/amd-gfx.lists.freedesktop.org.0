Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2631DF1B6
	for <lists+amd-gfx@lfdr.de>; Sat, 23 May 2020 00:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53E786E8B4;
	Fri, 22 May 2020 22:17:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74B46E8B4
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 May 2020 22:17:37 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id p4so5456436qvr.10
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 May 2020 15:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Mt6b1uoH/JCWSktKh+EGQWP9kfTIChdilDArnDpe2Q=;
 b=STcA9y1yUGOQ5bowGp0LCxZ8Fim/5+hWcHlJq0/msvVzd3M28ngDg3XwFxbyeh0M2y
 pPk14tyUS5wUI8b0dBmnShiRnwrVvS8NxvJrPFK2BCE9vqYDPAwEAHPq7knWD4cwbAWQ
 QotmleBztzL+7xVG1emAlA1iSI6QAiU2Hj47O7DTrnBU4smpYU8EPbDOsiVyGrHEH0W8
 P1tGpCYHgWO+i8hPUbI8TOsjOuKpPRMqbb2Z8c+nl0rs/oNgWi2J8qVMNKzMkZbP/+SH
 CT7hR5c9sboFtY5JiDk5kOlS9Zo0VP2OgQTg0YO6GDvYXc08/vewe36LUX45smz61wm3
 qj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Mt6b1uoH/JCWSktKh+EGQWP9kfTIChdilDArnDpe2Q=;
 b=oYiH+hJqRgOlrO+zLygrAZcxtxf3kHIpq9/2mgXWvxlZiRCFxddWwYZ2r/sEtEugAJ
 hyXiYNYnzH1dXqDapeJRhzRkkfw9dyn7T3DQFe8a+Tkgnj16PzjGL5uxvleAGNzWbwN3
 uJvgF6QGrt4vuCP/8XHZ/KqalFG08CAvgdGoGLoDgYIvL87/NcaBLPf2d6KtXN4YTbh4
 iz3E6VDYfQPyT6KO+C57uvOdu7S6or1O2BsraKYKoOWM4KNNrB2BO0YB7n2/4SK9kZzK
 anuP8kzuvlL9sFgU0unGY7V3TWIz4+T2qzoHsV9HUPdYvIuWDGYXoHNkUpuiOKd6m+vp
 hQ5Q==
X-Gm-Message-State: AOAM533MuOcKbIz2ZA0xSdgWzOP6GOboQcuCd2fwQqgGFSh8N4640d2e
 oOHi//P//gT3k7XnheBsJzBilKNW
X-Google-Smtp-Source: ABdhPJxS9whSZVMUtW4+VFFWs5/JXB6LFR/n4qzc0/qWXNIdAArhSkdHeZ1k74lFptcXIfHywRd+GQ==
X-Received: by 2002:a05:6214:a0c:: with SMTP id
 dw12mr4067586qvb.219.1590185856646; 
 Fri, 22 May 2020 15:17:36 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l2sm8186679qkd.57.2020.05.22.15.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 15:17:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/gmc10: program the smallK fragment size
Date: Fri, 22 May 2020 18:17:28 -0400
Message-Id: <20200522221728.808568-1-alexander.deucher@amd.com>
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

Explicitly set the smallk size to 0 (4k).  This is the hw
default, but set it anyway just in case something else
changed it.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c | 4 ++++
 drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c  | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
index cc866c367939..6939edfc5232 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
@@ -181,6 +181,10 @@ static void gfxhub_v2_0_init_cache_regs(struct amdgpu_device *adev)
 	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4, VMC_TAP_PDE_REQUEST_PHYSICAL, 0);
 	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL4, VMC_TAP_PTE_REQUEST_PHYSICAL, 0);
 	WREG32_SOC15(GC, 0, mmGCVM_L2_CNTL4, tmp);
+
+	tmp = mmGCVM_L2_CNTL5_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, GCVM_L2_CNTL5, L2_CACHE_SMALLK_FRAGMENT_SIZE, 0);
+	WREG32_SOC15(GC, 0, mmGCVM_L2_CNTL5, tmp);
 }
 
 static void gfxhub_v2_0_enable_system_domain(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
index fb3f228458e5..616309e85d6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v2_0.c
@@ -164,6 +164,10 @@ static void mmhub_v2_0_init_cache_regs(struct amdgpu_device *adev)
 	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL4, VMC_TAP_PDE_REQUEST_PHYSICAL, 0);
 	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL4, VMC_TAP_PTE_REQUEST_PHYSICAL, 0);
 	WREG32_SOC15(MMHUB, 0, mmMMVM_L2_CNTL4, tmp);
+
+	tmp = mmMMVM_L2_CNTL5_DEFAULT;
+	tmp = REG_SET_FIELD(tmp, MMVM_L2_CNTL5, L2_CACHE_SMALLK_FRAGMENT_SIZE, 0);
+	WREG32_SOC15(GC, 0, mmMMVM_L2_CNTL5, tmp);
 }
 
 static void mmhub_v2_0_enable_system_domain(struct amdgpu_device *adev)
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

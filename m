Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4B1EABA2
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E666E313;
	Mon,  1 Jun 2020 18:21:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BD16E314
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:37 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w1so10015168qkw.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLaT+F90+hbjAK+KYrtyQsRP4W0zoGpAVYMlBYGcLi0=;
 b=nSsvBinkTEZuo+zAeapHJxVDT6GtspM/knhLx03UM08lhj29I721JjE9X/ZeM/Mhw7
 7LDWM6tEHrb2O8/EBpXVxOjkyXNeZRJq8Xv1oq+GJF3GyebUdKO+Dap91WqKyTaXC1dY
 yahqsCV6FL3tDMu9PK6ynyxysOVy4s4Eqip5bgZ34AbMbZx9pxVm+k7i/PzZw80MZMgx
 eQRXXgYV18YFo4BVywN3TixvgE32lFFIrK8ZnkN8TbBlONl0GVda96Zk5iCx4u53MzCX
 iRwmNcA7P3h5VkcIkIA+v9wRfIL6k0Q2IYRz8AKZhSfM3whW24AYPzyppm2Iqhn/NdBj
 P1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLaT+F90+hbjAK+KYrtyQsRP4W0zoGpAVYMlBYGcLi0=;
 b=FtqKqAFIPljpHRWmbDduNqg9MGbJSyBxohZIzWxYk2rI4ko/EeXz8p5qf5jvC4tqnt
 kGgQUW5EMMo4BTFBmN6oXqE7AH4l/L0Ard7rGCq1YBjk4jLnRKd/nvccKtGAW3jgFwN9
 r3LOgFhVLgaV6rrwIwWFAOxxJJjHZAA7jir0Y1sYFFH/KXa7YEBgzsHbbgUWZKhX1gTg
 8l6y+Bme44qSgzJrbJYh6kq1u3e7zqT0quS9wPyhLDlepySjGIHgEEgdXI+K8ua7tjfR
 jsvqGo59zpvc9YH8DxGaRyD9wswyexkidkkRGZXuAxJWVhzlBjcIogW7eev7Xvm3wPtZ
 vXwQ==
X-Gm-Message-State: AOAM530v6/jut4yZxVCq9Seg9fvATP3ZOVw6DZvcVzFSbb1blQPTFdvJ
 04IRXDKgktMfRBkYpveDJiXSh0G0
X-Google-Smtp-Source: ABdhPJwG6WSUKUggjNCfiP+Pw8xciuTLgRXRo+0qu8PyFMkT6HlOIt0yVMixhvMgf5h8UhYX8zD14Q==
X-Received: by 2002:a05:620a:9d8:: with SMTP id
 y24mr3085136qky.274.1591035696952; 
 Mon, 01 Jun 2020 11:21:36 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:36 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 115/207] drm/amdgpu/dc: Add missing Sienna_Cichlid chip id
Date: Mon,  1 Jun 2020 14:19:22 -0400
Message-Id: <20200601182054.1267858-26-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601182054.1267858-1-alexander.deucher@amd.com>
References: <20200601182054.1267858-1-alexander.deucher@amd.com>
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
 "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: "Jerry (Fangzhi) Zuo" <Jerry.Zuo@amd.com>

Signed-off-by: Jerry (Fangzhi) Zuo <Jerry.Zuo@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 3b6588e15c6b..15de344438d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2782,6 +2782,9 @@ bool amdgpu_device_asic_has_dc_support(enum amd_asic_type asic_type)
 	case CHIP_NAVI14:
 	case CHIP_NAVI12:
 	case CHIP_RENOIR:
+#endif
+#if defined(CONFIG_DRM_AMD_DC_DCN3_0)
+	case CHIP_SIENNA_CICHLID:
 #endif
 		return amdgpu_dc != 0;
 #endif
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

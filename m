Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 388818BCB74
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2024 12:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2DC112F30;
	Mon,  6 May 2024 10:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fwFVglgz";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5307610F1CA
 for <amd-gfx@lists.freedesktop.org>; Sat,  4 May 2024 11:39:08 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51f74fa2a82so531890e87.0
 for <amd-gfx@lists.freedesktop.org>; Sat, 04 May 2024 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714822746; x=1715427546; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qJQr+N2iqh0CtzNmBbGY4L46Wh//FbWkaD2H/7huYvs=;
 b=fwFVglgzYqq7H2zqYDZ/UmffysYbLnE2pbiWll/GBkNLsC89/1yuRKgS8HWzVpRZPz
 TJ75FrKVcVp2Iy7V8q0H9taSb3gD3KCeM+TzZTuW4+YUUGMsI4hUbbpg6rHmmLAU2aTV
 vRM9WH8qSyiaCxp5X8f05OiAI5/z1UYLqHdzvfWfJx++rcVlbEqfHMra9mqoTWmCjdrJ
 UpG75ifWdTpGGN8pF/cASALS2juJIvpfpQvoaaEjBXzU6CE8srUh9TlegyoUyalo+Cbn
 4i9K+8N7+NiHzYC/M5YOXS5d5Esa5B1nNAe2IeJGcAxZpmsyQkLsEfceAVN/Ex/r7D8M
 jPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714822746; x=1715427546;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qJQr+N2iqh0CtzNmBbGY4L46Wh//FbWkaD2H/7huYvs=;
 b=QjAWqIheqh03sdtTDP+Y1NiwFYoCqwiIYAMM6Z2xTHkbo7fDWoyJLdZwPhEvwx9qpy
 iVSCnz3YisAtw5525qg3cQSODZDRai/C68vIydy5CqgRcUv+XumHJjB2tE9nMSTGCPIc
 WTW0gywmcHEHtXXIe52oRbBzdii/xg+nV5kS7XqIL4o5fGDBuwxnaA0P5HykL11watUr
 ipZXS5ghEefNbaE1CR5iuUZOB+DGJAS5LjbOaNX0hBcB/ViitwWsbV1FEhNMyq+4b7kX
 DR3bVUoV+9yLuaAHOSbQah2VVJOiyUA+H9hVo9UeRylK2M/6b45ebSRcSsl2528FPWYa
 137Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRDLLvHJtAFeCo/1enpbB07wBkargD1W+09d8ZUWfANv8s6ZKtvB+dhZ1G8KHQ4mpyeTJyPCArA1/6Wq5oAd1mQclKhM+KbVKftoFiOQ==
X-Gm-Message-State: AOJu0YyZevE9QSxbo3yxrNtuYWnHYtmcYr/b+rlQVF6nRNc5Pfywpwp4
 JwziYXOcE64dqqp2X/whsf8TgQWSr/HzMHPrjSooWJDaPu0QUPrnE6SMr2LhNpI=
X-Google-Smtp-Source: AGHT+IF7aOCE2HjYaAJh5yWG3SZAbTJBfjHo58pHIPQhrrqnKxi6kzUXvdANtDldvdgnmxcG20+dZA==
X-Received: by 2002:a19:4311:0:b0:51c:d8f6:4e6f with SMTP id
 q17-20020a194311000000b0051cd8f64e6fmr3921509lfa.40.1714822746039; 
 Sat, 04 May 2024 04:39:06 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 ay2-20020a05600c1e0200b00418948a5eb0sm12776941wmb.32.2024.05.04.04.39.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 May 2024 04:39:05 -0700 (PDT)
Date: Sat, 4 May 2024 14:39:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Yang Wang <kevinyang.wang@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, Candice Li <candice.li@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: delete unnecessary check
Message-ID: <3f9ce1f6-c7fe-401d-b958-395948f4c6ae@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Mon, 06 May 2024 09:59:59 +0000
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

The "ret" variable is zero.  No need to check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index a037e8fba29f..4d50fb039509 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -2807,7 +2807,7 @@ static void amdgpu_ras_do_page_retirement(struct work_struct *work)
 static void amdgpu_ras_poison_creation_handler(struct amdgpu_device *adev,
 				uint32_t timeout_ms)
 {
-	int ret = 0;
+	int ret;
 	struct ras_ecc_log_info *ecc_log;
 	struct ras_query_if info;
 	uint32_t timeout = timeout_ms;
@@ -2836,8 +2836,7 @@ static void amdgpu_ras_poison_creation_handler(struct amdgpu_device *adev,
 		return;
 	}
 
-	if (!ret)
-		schedule_delayed_work(&ras->page_retirement_dwork, 0);
+	schedule_delayed_work(&ras->page_retirement_dwork, 0);
 }
 
 static int amdgpu_ras_poison_consumption_handler(struct amdgpu_device *adev,
-- 
2.43.0


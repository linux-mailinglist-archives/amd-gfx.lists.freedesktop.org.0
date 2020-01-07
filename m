Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ADE1332BE
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jan 2020 22:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEE326E13A;
	Tue,  7 Jan 2020 21:13:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 329446E13A
 for <amd-gfx@lists.freedesktop.org>; Tue,  7 Jan 2020 21:13:49 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id t141so350230ywc.11
 for <amd-gfx@lists.freedesktop.org>; Tue, 07 Jan 2020 13:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C/PGl5fBy/jn1DIBSEjENmfNSny76jA7ovmt2DSkeBM=;
 b=qJXGd1mE2qUdA1rVP+zU8wjlB6fvwFi1KFc5xsqNYCyUSaGTwdjSqRcvV1YvsFN3n+
 Jb0nLnpUsMhc6cg6ijGjqN2cVLFtF3RHf77F77VkKQ5t1SQxcTDcRWcsFfF79zNy9Yx3
 TATZOe72wnex/XQLeEy4dnBcqKL4833guPTw06Tv1m8YtUPeflbsAgeZZuajzyGTJU1I
 z8BNuEfC00wihVIcfc3Foqk8x3adfHvGavUXAv/88XTjU7Rgsxu/pf1pibK3RJeGzv+p
 T/Z7iqxooEx4C9WhNNJzhJYHmJX2Fv30i+nUWQizxJrlriVzE1sE4kiQwVUkbosXjupu
 Tu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C/PGl5fBy/jn1DIBSEjENmfNSny76jA7ovmt2DSkeBM=;
 b=bo67Xh8HVQAI0O0XQzWwdCEUCFlEn1F3TjD2vzTW0cJdhs8l3BvEpuI5WaOvttEI7l
 J9YAmQRa+IxIewf3btJL1a2SU6FGiU7gNBMiXAYZ0BJQpytSWIOgvDyPJ6l0W88xgDRN
 tJhrwTI9fS858PS4WfDkGplsSyxbxwJdkDKs0t7Yc4iRimqI2bwW5VyAW+bnNpec1Vj/
 tmqIynNTqJ7xb53XK0ihcVSRVouWCPcmxDsARBTQS7YodDS9AOhMlIKzbZfCWkkMbR1N
 52YjzAqlp+ymsBa0RUZcSXeDz7z66JOm7fjOegSxjpeVhbLY07Ka+bU5/rnjZtCjtINd
 dUlA==
X-Gm-Message-State: APjAAAWNJ/nArw21h9mpj0qLVM/VCVCALOUQVW8lFOS4hlJk49lR1K02
 +6GovLbOV+7q2N8FDdrL8Y7jxnP+
X-Google-Smtp-Source: APXvYqyP+5e034ckHObILmA3ZMT/fU8ho0fBxtQEjA8ZrODJ9/XrXL7zfqQVQnUuRGXm6TQmEQ+TSQ==
X-Received: by 2002:a81:6d17:: with SMTP id i23mr1159488ywc.58.1578431628257; 
 Tue, 07 Jan 2020 13:13:48 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w142sm382229ywa.87.2020.01.07.13.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 13:13:47 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu: enable S/G display for renoir
Date: Tue,  7 Jan 2020 16:13:20 -0500
Message-Id: <20200107211320.1820393-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107211320.1820393-1-alexander.deucher@amd.com>
References: <20200107211320.1820393-1-alexander.deucher@amd.com>
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

Everything is in place so go ahead and enable this for
renoir.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---

I don't have a renoir board handy.  Can someone test this?

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index 6d520a3eec40..318605ca9bc3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -519,6 +519,7 @@ uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
 		switch (adev->asic_type) {
 		case CHIP_CARRIZO:
 		case CHIP_STONEY:
+		case CHIP_RENOIR:
 			domain |= AMDGPU_GEM_DOMAIN_GTT;
 			break;
 		case CHIP_RAVEN:
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 05118c8860f9..3be7ab0ce9e3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -909,6 +909,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	switch (adev->asic_type) {
 	case CHIP_CARRIZO:
 	case CHIP_STONEY:
+	case CHIP_RENOIR:
 		init_data.flags.gpu_vm_support = true;
 		break;
 	case CHIP_RAVEN:
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

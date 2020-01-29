Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FCB14D043
	for <lists+amd-gfx@lfdr.de>; Wed, 29 Jan 2020 19:18:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5326F61F;
	Wed, 29 Jan 2020 18:18:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4857A6F61F
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jan 2020 18:18:00 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id v25so220771qto.7
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Jan 2020 10:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKL2sqi2EL4mq8psKYKolWdZLh6vJTuTy7MFp7cI8oM=;
 b=N7epFMFGOKQhgWLBqNCtYLI20nkHUAMLIOkjXTgK1jyn6WSp+5r5w/uGCKjvsDBWow
 9MlW9vMCMFN9iiQ79goXHc3icxpb+jA1tZvs66eTUs09/kOK0dCkKE7q9Il0uWZPuVD7
 Ua1s+PwBk71BtN1L7j4QToKs4YRAXkf9kQOyKBjlBvryMOGlYp2NzDyINpznrH9MYCjj
 JrClB/kKL6OMVHr6V+K5TUGMS9sBImTKOJO3VdIuf76QCJMBJid58ebSmcfJGJnZVrl0
 5a+hu4Io71vtrdYUM42vt2j0U+gOg1jbsmw2SgkDSkZ3VTC6SaKot/DWVRTTCnZOH87U
 vg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKL2sqi2EL4mq8psKYKolWdZLh6vJTuTy7MFp7cI8oM=;
 b=aSR/sRRX0pVvZ7EL5szTEJqryYm2GEB7PqEKQ0RaqLje/r8rwiBWAziZlbNR0bcuLE
 RnBvCNHGkVpPkzM0LPpwitf8mJOhuUXFfhxaJubmkfeYAlZc+s1Yglce8v0gGIs1U7xO
 xE4PDHxrqDVKnBBY0i84w5Yc9YId01b7O4VmlTMwXIvcLaMZrG6cLXkKiC4nI1DueB8I
 6jdHVAheFvTdyAAO6tKVkaMFevTQjk1uCxzNY/OXqUzquvAp3PPrc0n/H+Zg9LuXiqut
 Bu8T+Clf9dx6sJDaDvzx9+z+RuJG0osJbPQqoOOZRw7Whm/DZk3PAVgoCI6ZkZXx1GG5
 QG3g==
X-Gm-Message-State: APjAAAWP2tYT1wxxRNztokdJAvm1suN7IKftsWdGDQ/rpeSy7SXyUtu6
 mXXhQf9fu8SNPnuSs+KGluVAoHH7
X-Google-Smtp-Source: APXvYqwp2bxWkGYOjvoemCMo12DwPYqoVuHIEnwIVzauo90kQuidY66Krc1XsM16oMEC4Ub6L+VaHQ==
X-Received: by 2002:ac8:a8b:: with SMTP id d11mr503547qti.94.1580321879273;
 Wed, 29 Jan 2020 10:17:59 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id v55sm1510114qtc.1.2020.01.29.10.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 10:17:58 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/amdgpu/navi: fix index for OD MCLK
Date: Wed, 29 Jan 2020 13:17:50 -0500
Message-Id: <20200129181752.609344-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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

You can only adjust the max mclk, not the min.

Bug: https://gitlab.freedesktop.org/drm/amd/issues/1020
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
index f1b27fc20c19..c8f09874c2ec 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -843,7 +843,7 @@ static int navi10_print_clk_levels(struct smu_context *smu,
 		if (!navi10_od_feature_is_supported(od_settings, SMU_11_0_ODFEATURE_UCLK_MAX))
 			break;
 		size += sprintf(buf + size, "OD_MCLK:\n");
-		size += sprintf(buf + size, "0: %uMHz\n", od_table->UclkFmax);
+		size += sprintf(buf + size, "1: %uMHz\n", od_table->UclkFmax);
 		break;
 	case SMU_OD_VDDC_CURVE:
 		if (!smu->od_enabled || !od_table || !od_settings)
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

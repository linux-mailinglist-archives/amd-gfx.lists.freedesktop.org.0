Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110D231E029
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Feb 2021 21:26:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B446E9D9;
	Wed, 17 Feb 2021 20:26:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD856E9D9
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Feb 2021 20:26:15 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id w19so14088168qki.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Feb 2021 12:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=afrO7CI3SPXzdOt7BE1MnB2xbiq7Yctx0axL9xV7bBg=;
 b=L83c+TZ8hGBtMlqnbJGbwTlvpxaSf+NLCIzIJWXkIJUYHjwKarMPJoKJDj18Ajt8aM
 2359piIlCmlzaynrM3OhP7LG1G66kDBHQpggvbRc5vpympRpuK+BJd/x94V335260MzA
 3g5+EL0xt3wCTlMyowHcS5sFWnHIbWjrKRSCfpoC2FIKZ/VxLum3nu9xK39C6FLnENgZ
 ihgbcSlnYfODoRl4DhflcT4UsD39bZyvZmfbMDyqk6qeO8QZQIJU50taCeTMNYCEEYoV
 SJp/wgoJZIgh1RqyhPP1KtTqNM3Kcp2chL0H+NqNRgNr5KAh2NaAmp9akswL/gB6sB7j
 9kSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=afrO7CI3SPXzdOt7BE1MnB2xbiq7Yctx0axL9xV7bBg=;
 b=ZiF7RQbLzDqgNeKsUjiP8a+WbadkvLVkhRT8ibbqQIN62WEQHuDOzCR0aMpeMkZVr9
 8ojZBt04QvLqKH9IsFKH13iZSEnAjvnnaiIV/ogcpE7p9NWe05kkbBNLnl5w59mps1Kx
 pPQmxMoq/VRNgJFpTTs9Hc3QCnz6mKuaAVJF6GQnY3DmPC0UIEzNPTBMp62K262KCDL0
 vfy07EhrZp+OLnBZ5dJx/YyJDo7CChfojaAh7pO2Uhp8wabKsEliRGbANkmF4lZurmM/
 ercA1tDhecakvOV1pHrkOwmBjSNmCZdqz9WoCtB5/LroWy0vV+zvTR2QjMRpBGfV+AOD
 XV1w==
X-Gm-Message-State: AOAM530bgGqrJd2nN0IrYDC0mjCu/7MfYfzNwKsX7Fb+5vQ2lG8D5gZx
 fEylP1hKE+rWWmkX7yBoiFmiNA9ZNKc=
X-Google-Smtp-Source: ABdhPJyGjwyBYQZvAhblYRzo7AXoPijV4pk05Od7f2JgGgZ8itaPO4RR4AwTiNZkGQac6n3w8nILeg==
X-Received: by 2002:a37:e20b:: with SMTP id g11mr1000867qki.292.1613593574634; 
 Wed, 17 Feb 2021 12:26:14 -0800 (PST)
Received: from localhost.localdomain ([192.161.79.229])
 by smtp.gmail.com with ESMTPSA id h186sm2348004qke.129.2021.02.17.12.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:26:14 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/admgpu: Set reference clock to 100Mhz on Renoir
Date: Wed, 17 Feb 2021 15:26:06 -0500
Message-Id: <20210217202606.2100403-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.29.2
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

Fixes the rlc reference clock used for GPU timestamps.
Hardcode for now.  The proper fix would be to look up
the values from the proper vbios table.  This will be
in a follow up patch.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1480
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index c7d0e0e98391..230caaa3513f 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -463,6 +463,8 @@ static u32 soc15_get_xclk(struct amdgpu_device *adev)
 {
 	u32 reference_clock = adev->clock.spll.reference_freq;
 
+	if (adev->asic_type == CHIP_RENOIR)
+		return 10000;
 	if (adev->asic_type == CHIP_RAVEN)
 		return reference_clock / 4;
 
-- 
2.29.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

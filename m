Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A49C921F950
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC856E85F;
	Tue, 14 Jul 2020 18:24:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FC36E862
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:57 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id c30so16500714qka.10
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTcYm+YIUORuMVyj1YF01JsIFjcEbI/NO64aPXAwwoc=;
 b=XJA5ZukQjQIKPwMBKZbr/i5JY4smMKeTwvL2SXVf6aOwpGAN9IzvcqkRes5ufqYCbH
 I4S6F0/WW+ggju/ikHJvxUZJY3JmhuI2oUvlLUGcem4tCZ+piDLOeYZeF0eE0hQ7fhrP
 30hBOdgkCsKTElATQDnCOqt9fyMRv5086rmnkFJa/FpyJIvGjCVuIQ/g0NhxjDjMRInL
 7QBWJIC4ExbWpQUAst/aA5kCfK2+hvEUCa3S1ivdgze+CSFOSntOAQokqJngvuhZpX6O
 lR/TXJi29CKaXWTno7YwDfchqNauHW8As8/WL73DJHQ6PEEA50RmV68nnAT1ObY469FT
 k2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTcYm+YIUORuMVyj1YF01JsIFjcEbI/NO64aPXAwwoc=;
 b=GWMMSWgRGV4WtZet2a1VGpNAU/J7PnwNHCGX6Y8HYTUC81ui5r/blO6STptcKCye9U
 5tKqR9nyStm1R2EBhQtGrsjBtDvN1ZcEqu7/x0k14B+c60Gs2gLxek3BIPxEqHpKsR9V
 kqlTi8eYZEz8+3NyByMxcASg6uZxUB6JKYRlY5D8k/w/TjGJXe0Ls1ABaD4W3UTZPrjO
 FEOlPqwj0USJmHV9JZMEfvXcJudwCkY+ELX0Q3lF1wcFKatEfhlhXWV63DqLHTl3oC2N
 powpskwjOHAvGYSsYH4kXdADP9azoEUKUtyW+7X764yZnNK044jCwrYUv5u8LSFrX+/M
 iS8A==
X-Gm-Message-State: AOAM531YMbhnIBuG+h3wF3gc095M004O96ljyvGIwvd7Bfb2gacNpSPK
 rOS6mfi/20ujulT7RZz5pitkZb+E
X-Google-Smtp-Source: ABdhPJwKINr85kZhKuJ0ysZ/FhPe/076ooVYk2URK6YVfuOknRm6kvTODUVvx6ODXGMsdhNlIyPywg==
X-Received: by 2002:a37:48c7:: with SMTP id v190mr5649019qka.153.1594751096183; 
 Tue, 14 Jul 2020 11:24:56 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 36/42] drm/amdgpu: support athub cg setting for navy_flounder
Date: Tue, 14 Jul 2020 14:23:47 -0400
Message-Id: <20200714182353.2164930-37-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200714182353.2164930-1-alexander.deucher@amd.com>
References: <20200714182353.2164930-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Jiansong Chen <Jiansong.Chen@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Jiansong Chen <Jiansong.Chen@amd.com>

navy_flounder has athub ip v2.1.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/athub_v2_1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
index 0219bd6ce1b2..939eca63b094 100644
--- a/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/athub_v2_1.c
@@ -73,6 +73,7 @@ int athub_v2_1_set_clockgating(struct amdgpu_device *adev,
 
 	switch (adev->asic_type) {
 	case CHIP_SIENNA_CICHLID:
+	case CHIP_NAVY_FLOUNDER:
 		athub_v2_1_update_medium_grain_clock_gating(adev,
 				state == AMD_CG_STATE_GATE ? true : false);
 		athub_v2_1_update_medium_grain_light_sleep(adev,
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

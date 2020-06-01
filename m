Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D41801EA98C
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596B56E271;
	Mon,  1 Jun 2020 18:03:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290746E271
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:03:34 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id v79so9906987qkb.10
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7ff1kpHm6G/XcLPrENNGAd2XI615DzOGSb3UHKGTbE=;
 b=rB3ICZhFKgPuHZcCVGnIGSWvS3SGV2pjH+wzL0DrTnE5TQ6//UWZuY3wioCIKOBZfr
 CEiX/1lpKSN+pem/IfEkeo3X4weSs36xrbPHHKtfJdRZ4CYWMQixRMehVrRNmrO2DU9G
 o7CUG++LD6R3AuV65qUWx8HT52ccakJS9FWnreEatkXH0qwR8+jwkLC/uSvnblWjLDC9
 QOjX/trA55t2hEcl13kltIFieRaGeDYQPtqfm9YZh5TUFcC+K6SU+rEOD2i7/HYVFwcO
 Drv3tEwQucBTonNXx242NshFNlaO7A9+tf8FgDKL/ktHcKK6nFa3eaEdywRymsLBZKLv
 1j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7ff1kpHm6G/XcLPrENNGAd2XI615DzOGSb3UHKGTbE=;
 b=HBIHh85YwQoW3cr2ZfmAgzR1Y9b6TlWgW0kzf1zpOdayb8kNopzwSkByLkv+g7zt4A
 xE627dqvB3+xgQ9VQ8SJ+YPPANus3z4ju1mrCOqwymoazcGTSv7UtLImjwsBI/ky+O5y
 kCiGu1TmMPgm/2bX5sjBZ/MId21M2ZGj2GAe3sA1tZUQvthazvTecFfoHQEawTDxb9v1
 Pq9Bc2dDmvjNYxr+OvzYXWOlnnu8yxUCxDIhAiPeJXT3TZNFTAlhzIoUD1fs6JwFw2QL
 LnOdbyfSlWcfO8CiDgiXIeWMcYClcaS7sIybdIcTa4tNtQi0xHxWE8OQNZmwus9vJ7Je
 HCPw==
X-Gm-Message-State: AOAM533rCdbTixDReHwMCCIKW5wsP/tvpPDlQM/cDjtkvib/LZFBe956
 TVMcsZAMSS1QXMs96UZiRkFkKp2d
X-Google-Smtp-Source: ABdhPJyAHRPrjPJT3b6nlBrLfInm3gKlU9m4xL/hXOsDu/zdBfWLNb2vHQn/xguA/ZiB1IAUMrmRuQ==
X-Received: by 2002:a37:a6c2:: with SMTP id
 p185mr21302422qke.474.1591034612953; 
 Mon, 01 Jun 2020 11:03:32 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:03:32 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 031/207] drm/amd/powerplay: enable SOC Clock Deep Sleep for
 sienna_cichlid
Date: Mon,  1 Jun 2020 13:59:43 -0400
Message-Id: <20200601180239.1267430-28-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200601180239.1267430-1-alexander.deucher@amd.com>
References: <20200601180239.1267430-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

Enable System On Chip Clock Deep Sleep for sienna_cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 82d38eb7ba58..a046fb4db610 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -270,7 +270,8 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
 
 	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_PREFETCHER_BIT)
 				| FEATURE_MASK(FEATURE_DPM_FCLK_BIT)
-				| FEATURE_MASK(FEATURE_DS_GFXCLK_BIT);
+				| FEATURE_MASK(FEATURE_DS_GFXCLK_BIT)
+				| FEATURE_MASK(FEATURE_DS_SOCCLK_BIT);
 
 	if (adev->pm.pp_feature & PP_SCLK_DPM_MASK)
 		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E11EA989
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24AE6E265;
	Mon,  1 Jun 2020 18:03:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05006E0DB
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:03:30 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id w3so9931836qkb.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xwWW6w36BY33kC5ZMhKkqNvbZX4t1QxkVBAhzinnR4M=;
 b=RVAc6KDpx45clazAMM5ELdI6EAK087gvDYr34jscPHhKt0xaDKp1ouM/0Ndayg6vDc
 wt4T1xWROFdUK6cttPpH0sMgGZ1zL83k+585S7LZaXHY00k51953gaEX20RDFRhROFh9
 Ahs4Vs/mvNxq9Z1UTR4pVCBIU+aJsbE9ajJjEaLlgRKnZiXghMA8IPKIm79vNTxbhzKg
 4GZvP0z7UF1YrRl0gGHzOEMYgD3hF06S9iIKA2GPntZX3OcoWLwDFXbJQyLAXjMemfF8
 gz0odaJeNO6FZdmJQXMe8vAp1nzBBt0WlDfPrO+kfy/gCZjG96BSQRT7THYgLanOQT5r
 qE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xwWW6w36BY33kC5ZMhKkqNvbZX4t1QxkVBAhzinnR4M=;
 b=INk/1+Nkuru3bJKkEQ56OafswuSEPwLM3O0B98iIc09yG3noXOonCv2S2Do4IGRwsi
 vYWWJ/O8q6wKZmNd4TYbH81YdxulrQoa/69mPHQaW3d1YFSI/9JqCvFrpGFnlLGFwQW8
 C/QNepXyPwoszZ2fQhiJ/FTFfKmmT7iOr/bALqlTntX6OmYCp7lN4XsUDtcPXZ+tIv+0
 xnKRa8DSkhrew8xhuorIdDO0C9gHM1FAlTwyE6ZKCmxhr8qrQkmd4z6N4oofdh6uIBMk
 Mdco5dU2VNgrZXHmvSDOrBzokISmEpVc/BNfBhPo95fwtl2eMvtHRXgTbaxrMIkXU7wG
 jMXg==
X-Gm-Message-State: AOAM531RUptiPsDxHZ4oyUE1QEcn2jGfONslCJcD/YIhXAmD273etIo2
 2zijPiiOm+Kf6I0zcorzIojgrevM
X-Google-Smtp-Source: ABdhPJx20ye2gH8qG1vJ/CGsDHiCZTC/Hh+hFY0S7Tl3+QcYOqR2AWL1CEFBIXQErTx+at6wZlPJJQ==
X-Received: by 2002:a37:a89:: with SMTP id 131mr20711525qkk.92.1591034609635; 
 Mon, 01 Jun 2020 11:03:29 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id h16sm42164qtp.1.2020.06.01.11.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:03:29 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 028/207] drm/amd/powerplay: set FCLK DPM for sienna_cichlid
Date: Mon,  1 Jun 2020 13:59:40 -0400
Message-Id: <20200601180239.1267430-25-alexander.deucher@amd.com>
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

Support for FCLK DPM for sienna_cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 4a60b688d3c3..f1aeef79e204 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -43,7 +43,8 @@
 #define SMC_DPM_FEATURE ( \
 	FEATURE_MASK(FEATURE_DPM_PREFETCHER_BIT) | \
 	FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT)     | \
-	FEATURE_MASK(FEATURE_DPM_SOCCLK_BIT))
+	FEATURE_MASK(FEATURE_DPM_SOCCLK_BIT)     | \
+	FEATURE_MASK(FEATURE_DPM_FCLK_BIT))
 
 #define MSG_MAP(msg, index) \
 	[SMU_MSG_##msg] = {1, (index)}
@@ -267,7 +268,8 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
 
 	memset(feature_mask, 0, sizeof(uint32_t) * num);
 
-	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_PREFETCHER_BIT);
+	*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_PREFETCHER_BIT)
+				| FEATURE_MASK(FEATURE_DPM_FCLK_BIT);
 
 	if (adev->pm.pp_feature & PP_SCLK_DPM_MASK)
 		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5331EABB6
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFE66E332;
	Mon,  1 Jun 2020 18:22:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CDC6E330
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:22:01 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w3so9993898qkb.6
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H3hECY6xT48ZpNkTO/ZVmR7bDudiChB1TBekOHyaQ0c=;
 b=RMciMBROve3SgTf2/ycZvMWfSlI6UDSsZHpJMPU2CgVRmikWyU40OfNIKbQIR4KbaC
 Olqo6owa2xlrT/VFMULmAiReW0+T6p6LLzofSEXnkqVOQ29F15HJ3Bs/w6ole09m+ZjR
 ag+CUTcB077SIrqa9ONZjmEZH+ROZgYzcy4CIE7+NIrszk8b2i5r2G1sfEPujKu8e0Z2
 SREHgJNxWMFqbwpVBU0eERkesOJInC7ra4jjvOU4XsgoDnVjoQ8TpU/aMQl2WrNsbvVm
 1JVgpXy158dQB9F9xO+4YXwvYnljUS/6pkR0G5KG56pxd/raE5lfU4SWBJk5N1W7DQ+U
 GWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H3hECY6xT48ZpNkTO/ZVmR7bDudiChB1TBekOHyaQ0c=;
 b=AydvRw6y0t9AG3YeSLYzYxSOuKftsWX6Y9M/V27qjxJ3KYm//lTLXJh9RS8RUzhLCQ
 4EsCpBpiEJMTHvplpZ5H5phm9CGm7Uh2grWDsLOhjW9HjoMuikhha67T1pP2CvZQ8ddP
 xL/NsHiDPWG3xm8Bl8iiM3Z9lq5cxUqOzBdiknP2imyENa/4avQCWKEQqz5pctAes6Bh
 2nBilXzH+7MRmsortY0jJxasjHavvDjkyEynWXrruhjeI2RoGGPQdonjz6ikak+W5FHD
 x3rA7hw4MAo5ZhOvcGmc05OeKscZ5381REYxVousvL+sjG4B4RtkU/M5DIovY8LXxbvC
 mMmg==
X-Gm-Message-State: AOAM531j0ErJqsC88PRbIp3XsWVNDgDPnBtEDNVxis9I7l8YkZvgSQ7J
 ugTzcuP3ntmfDlDRFhf0uOtD+tTv
X-Google-Smtp-Source: ABdhPJyL6cDXVnhmeV2CiJJTpiAYDp2FlaGThYeLQRDQdUdH4kdIYkmnyG9GV/po1E5ae6w3nKtdFw==
X-Received: by 2002:a37:845:: with SMTP id 66mr20761263qki.67.1591035720599;
 Mon, 01 Jun 2020 11:22:00 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:22:00 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 133/207] drm/amd/powerplay: enable athub pg
Date: Mon,  1 Jun 2020 14:19:40 -0400
Message-Id: <20200601182054.1267858-44-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

enable athub pg and the status can be checked in
ATHUB_MISC_CNTL.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c                    | 3 ++-
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index f4d4d91ebee2..6ca4c6f043c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -725,7 +725,8 @@ static int nv_common_early_init(void *handle)
 			AMD_CG_SUPPORT_IH_CG |
 			AMD_CG_SUPPORT_MC_LS;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
-			AMD_PG_SUPPORT_JPEG;
+			AMD_PG_SUPPORT_JPEG |
+			AMD_PG_SUPPORT_ATHUB;
 		adev->external_rev_id = adev->rev_id + 0x28;
 		break;
 	default:
diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 2843e1be4289..f7e67c446ae0 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -332,6 +332,9 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
 	if (adev->pm.pp_feature & PP_SCLK_DEEP_SLEEP_MASK)
 		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DS_GFXCLK_BIT);
 
+	if (smu->adev->pg_flags & AMD_PG_SUPPORT_ATHUB)
+		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_ATHUB_PG_BIT);
+
 	if (smu->adev->pg_flags & AMD_PG_SUPPORT_VCN ||
 	    smu->adev->pg_flags & AMD_PG_SUPPORT_JPEG)
 		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_MM_DPM_PG_BIT);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

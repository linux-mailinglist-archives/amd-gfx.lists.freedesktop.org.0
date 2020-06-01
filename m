Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1E51EABBB
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9986E33A;
	Mon,  1 Jun 2020 18:22:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6A96E339
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:22:09 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id w1so10016863qkw.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cvuCA9+4TftEiAZiZ9YL7YROab1p+8rSODe20DuQiJo=;
 b=KrebCMqISxdl0l+ZZGreFluGmy69lMtZ2DvX9X6YDB92jp66gVjsS8npacbaUSzVfI
 KtcZtMMlR6AKIZ0bZNcytxyd6WJQxQf0p3WMUZkkx/uWuIxrxC+S/skhxyLnr7fuZZu+
 RIb6ZsdXb0Jo4D/V3UMsDVVRWQ9d2kzxoyqlgj5qpPD5q7p5HkdJilmMY2lokxxPeO+c
 7ePaeQ3PCYHvzESI+OJbjCSu8inVeyOAtyc4jGyDLQcZQV59rNuc3asK7uO2XWBJoyeG
 11hwQk1e3uESpJS0QhR7dG08+Ef6RFbjEkEkfnGgGra7aVm8RSpiXRAQZiTAHPXm+BSn
 NJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cvuCA9+4TftEiAZiZ9YL7YROab1p+8rSODe20DuQiJo=;
 b=BJ3IfSZRYnRQA2VxWnBmOdFoHXWsInU2nnNgStrkKri/s7mJ7BQJaUEyni7CUY1Pu1
 hn3mdSZt7Z20L7STBdNeeSXYlRYUSb5mr97OT7+o/Pq9hcomf7zt9a5tHNQGJlMkmULC
 c/2nq3oRODZcFbLikCb3dVvo7jftvcNydBv+Z3UWLgh3N+s3EjLIjZlvj5FRxXJbEqxk
 PSWakbpCIM3UtG9KcH7Td2citbvfkwtBC0ATiLtEKJMz2ofLOjItQ9AhtTVTuk1OR+X+
 kophJSWRCQS8VpVf42YhlG/FXPidGDzhOUfPaokhjbBV+FBZJTzmWJufWs57NM+jLivz
 emQA==
X-Gm-Message-State: AOAM530X+yjUNuoYQLMGo55n7N0HSvJq78CGc/ElAWixwavxp/0ZBSz7
 R9A0DE4tZesh5RxPtcwueyg1Nwzx
X-Google-Smtp-Source: ABdhPJyYP1kpPsl+uBcsjCW6Hhr+pN51ea/+9T49SXjSHAY9Zp3fy21hNz7xzsATx8gkpEnmL816Bg==
X-Received: by 2002:a37:9c57:: with SMTP id f84mr21154749qke.128.1591035728082; 
 Mon, 01 Jun 2020 11:22:08 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:22:07 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 139/207] drm/am/powerplay: enable OUT OF BAND MONITER for
 sienna_cichlid
Date: Mon,  1 Jun 2020 14:19:46 -0400
Message-Id: <20200601182054.1267858-50-alexander.deucher@amd.com>
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

From: Likun Gao <Likun.Gao@amd.com>

Enable OUT OF BAND MONITER for sienna_cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index 9ac562b7c5cf..545b4efc2bfa 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -311,7 +311,8 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
 				| FEATURE_MASK(FEATURE_BACO_BIT)
 				| FEATURE_MASK(FEATURE_APCC_DFLL_BIT)
 				| FEATURE_MASK(FEATURE_FAN_CONTROL_BIT)
-				| FEATURE_MASK(FEATURE_THERMAL_BIT);
+				| FEATURE_MASK(FEATURE_THERMAL_BIT)
+				| FEATURE_MASK(FEATURE_OUT_OF_BAND_MONITOR_BIT);
 
 	if (adev->pm.pp_feature & PP_SCLK_DPM_MASK) {
 		*(uint64_t *)feature_mask |= FEATURE_MASK(FEATURE_DPM_GFXCLK_BIT);
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

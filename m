Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCCF1EABAF
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602246E32B;
	Mon,  1 Jun 2020 18:21:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7186E329
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:54 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z1so8520110qtn.2
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tI93ytZFbAX69UEQhvn9NSgq75ZGdrnz11CFat+Xzno=;
 b=HjnE+b++HgIR0mDQqg+w9xtmwGZtcsmooEi1Ypf4K9Iac5UnU/1By0Vx6MFrc783Jj
 4VTuFpvDOHnKSkm0GUs8bxZaVKxTC1k0BCFd0Wq/U7nJs0J6fKvbq5iLEV7H7re/wSHu
 RCfBZ6LnKrwQ2bQ84hyJbJAge3WJivBLgEd76zCD6MrzKnL1F90NHeRtB/zkcAWsXmw8
 5AwfwnpyPcTjrV5VVXvEaQcrJPdxku4D8NG6HqtJxklw470YFWUmfTjN4GIveECgj7gn
 shwG0KHWrrCQYgSn7KWeaa4AKZoL1F/p2shAoAsdSLcj8kWQkE12c77eFoaQu+FlSP5r
 07ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tI93ytZFbAX69UEQhvn9NSgq75ZGdrnz11CFat+Xzno=;
 b=HnyCEvHZcdvYzZrHISWsO/uPNk5H+vMGBuqzR3tycrgHFrL7eiOdhCDBCqCSHEwt2K
 2qPabMOMWU5eZOsrXHXiLCCJFkTy0Z9zmBPw1GFkSI2k2viXgPd6UXmVx8s181YMhK9v
 iVqzgLtROSUK+NoENthpXbeZblo70UCaTBlIvVIODweQEcPrr2UrQaUH2EBNseaEJLKR
 s9NANOULcZbFDHBiR6vE/bFAQqzNdsu0N+A+6uTy8vweZPY4FLsVPjEPpAUNaDIWYk7I
 ywtMts/+twqI9Ei8u4pfG8kcTBqaWDkjeoyglUfcs0hDBxKbeEOFBBqg8nzjggg3bwCG
 cftg==
X-Gm-Message-State: AOAM532bIYic8P5aJjGFPy926jvK5Y9J1+VlcEyZ8h9L7koza/h4rMKQ
 UlR+tbkz2FbV5h1U/OXtnBIWiG28
X-Google-Smtp-Source: ABdhPJxAjd0f4QKsGNHldURIFloWKcxKnH0ZiSPQaNUDAp1Ye7agwror1MjuMacnfHwvoD8ZJ598cg==
X-Received: by 2002:ac8:548b:: with SMTP id h11mr24455504qtq.66.1591035713501; 
 Mon, 01 Jun 2020 11:21:53 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:53 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 127/207] drm/amd/powerplay: enable APCC DFLL for sienna_cichlid
Date: Mon,  1 Jun 2020 14:19:34 -0400
Message-Id: <20200601182054.1267858-38-alexander.deucher@amd.com>
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

Enable APCC DFLL for sienna_cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
index e0067921a3e9..2db4b3fb0cf9 100644
--- a/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/sienna_cichlid_ppt.c
@@ -162,6 +162,7 @@ static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_feature_mask_map[SMU_FEAT
 	FEA_MAP(TEMP_DEPENDENT_VMIN),
 	FEA_MAP(MMHUB_PG),
 	FEA_MAP(ATHUB_PG),
+	FEA_MAP(APCC_DFLL),
 };
 
 static struct smu_11_0_cmn2aisc_mapping sienna_cichlid_table_map[SMU_TABLE_COUNT] = {
@@ -306,6 +307,7 @@ sienna_cichlid_get_allowed_feature_mask(struct smu_context *smu,
 				| FEATURE_MASK(FEATURE_PPT_BIT)
 				| FEATURE_MASK(FEATURE_TDC_BIT)
 				| FEATURE_MASK(FEATURE_BACO_BIT)
+				| FEATURE_MASK(FEATURE_APCC_DFLL_BIT)
 				| FEATURE_MASK(FEATURE_FAN_CONTROL_BIT)
 				| FEATURE_MASK(FEATURE_THERMAL_BIT);
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

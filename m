Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E2B137A8C
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Jan 2020 01:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE6F6E1E9;
	Sat, 11 Jan 2020 00:22:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439556E1E9
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Jan 2020 00:22:41 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id i126so1408909ywe.7
 for <amd-gfx@lists.freedesktop.org>; Fri, 10 Jan 2020 16:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vi4eywTi74x0RCv5T+MShfJ6x0fF6Bzw2+1eMCQv58M=;
 b=r4v0YrDANPz/YWkSRXqP8ImGxvpQhpImLQpr72GLgjarmZ+izFy2FpBTRerUO2hwcp
 lcIaefkUPWo/b7ID/dDuCwGSFPYgL4uiNY4TsMczYq2L4aMIeR2qdkc4t/S+jR+hlbm5
 Gw0zH08yqZBcRrUja3Ni7uXJ0vZrsBLD5yq4HcEeqO4nu/7boSgbhQMtLesI6OdaJNfr
 ZarPTzpDmfFqharaQsu6QxDgOFgdSis4gFBDc3YEf9dGETxad5kb6VUBKbSsEz9RoE8T
 Wchx8WfRKh40kJd7IXrRuNuW7mpEnduQ8TZPCbajitM9z8Tm0Jw3r7Riuu+8d5YDjeqG
 i6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vi4eywTi74x0RCv5T+MShfJ6x0fF6Bzw2+1eMCQv58M=;
 b=NCu+NzWqo0THcp4wfzlBe7TceNFPlEXYEdwzS1E1m01M9ZP9Q6Q4ZXHesjd/Xe5v5p
 zkyxU9a5Dr+RZnPO35TcDVFe/lWAkN1zOq8YyvSVbGrbZECKMs4vHT2fIZinedpkmkfy
 TOooHjB0/JBnDkhe14fviTeeEcxcFhbg3ibA/SbyYLQKasPq5hVqjjZxbcJi7XIImcGa
 fZFG9mejC8wVOFTSou97i4bKE7h79CvAqL9C6IhWwp/UBBG8DUG5W7PJEqsbn7qW0BkI
 k7vwlJ7A2sHflq5wrgD2JaLnmoCg6G/cuFZzyntgdvFltR2ZDHvgASjMUnYPrsyPMKRn
 WUrg==
X-Gm-Message-State: APjAAAWRdwRvrx3/mfqRlMSV8SYkhqVc0oPamV3Xnb90UYxF8pYYuLT8
 x1URzXNy4y7xPJs4XIJafPjZArzk
X-Google-Smtp-Source: APXvYqxbSAVsmMHMw6brnYXOwsmhhqy9C2N5d61vW0Kp0zLrkSN84fkvJWXy3RKMPWSpun+7HT1BBg==
X-Received: by 2002:a81:7016:: with SMTP id l22mr4963390ywc.69.1578702160249; 
 Fri, 10 Jan 2020 16:22:40 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id a74sm1756153ywe.42.2020.01.10.16.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 16:22:39 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu/df3.6: remove unused variable
Date: Fri, 10 Jan 2020 19:22:32 -0500
Message-Id: <20200111002232.247789-1-alexander.deucher@amd.com>
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

Unused so drop it.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/df_v3_6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
index 3761c8cc1156..f51326598a8c 100644
--- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
+++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
@@ -264,7 +264,7 @@ static DEVICE_ATTR(df_cntr_avail, S_IRUGO, df_v3_6_get_df_cntr_avail, NULL);
 
 static void df_v3_6_query_hashes(struct amdgpu_device *adev)
 {
-	u32 chan_cfg, tmp;
+	u32 tmp;
 
 	adev->df.hash_status.hash_64k = false;
 	adev->df.hash_status.hash_2m = false;
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D11EABA0
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2F46E312;
	Mon,  1 Jun 2020 18:21:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9061E6E312
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:35 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id w1so10015064qkw.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51et0gGhRP7go7mZ5mL/BaI8ECB8m8w6oWwsNA2D7Kk=;
 b=NumfaMOqsIlOgVs9TG72o8lzfRHYzrMQpEzxcA9136tQnIb/k7N/v2u328/KZ5D1xq
 CUW+7AifXCTdqijWWRtbJjp8wkxPsjLjv6ssQtKfaotGBl0Y2jWEEvXTN0Umx4BUajN9
 sfs4zizxFFwIR3ydpsd+hP0A4eZy4qU6T5S/j1CGAktMNEM7WqCJLQnbCl5t+W1w/1gA
 SLqnrroISCuAYN3+nt9Y7VM5qUvANIHTgeHlE75hXCr9wOPmfAabk7EPHFPJ2Yb40doK
 9m3O4h+f4mIvMZLTxXcUCP6I4iGuU70Mi+s67CiLB+9bWSEZlnBvKRsWbRFlQQ54/7nI
 CU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51et0gGhRP7go7mZ5mL/BaI8ECB8m8w6oWwsNA2D7Kk=;
 b=Y9hRCtz9et3aj8+kdi2pABVf+r4HURrBGgVkUSpsH5CfZiPD5KJMXgSRCyhdojN0aM
 ajUhsdDcmy+ufuXM4ezjJRs7lef+uC3Hk8/Ey39fduNBT2p/+ntKGhoZFjvVc04gQENb
 cerkIC6x4su7UC4mkCukTbeD2ytP7AbNyE3Upfu6ISPVJLszvrGOY9cxswhTgVjgnX5E
 +Z9ucUbNdI2w1XiXRWuo1rCHSp5J7K7lbPhL9YenD3NcCwywfD1khYn8nE26TQOLbQka
 Ot2g6pMoDisf/SBxqZ+w2cM6waHlubobji+26Dn/SMh/1xGgD32H5ITjPKzu9Y3axmQx
 3LHQ==
X-Gm-Message-State: AOAM531+hHAZU6y8itz5DFMsRnGTIc5Qu+GX2UTOnMigF/JP9hBGf0Iz
 zkM1xH3lyJLWD2+3rMFYanbdWAgu
X-Google-Smtp-Source: ABdhPJzgNPGia9dCkOECgxNRZQM2+GbKU84qALRceZeeIx1wWHdYl6JXciiX9cFN4JRnn4o8Y3SpEw==
X-Received: by 2002:a37:5c47:: with SMTP id q68mr9675527qkb.495.1591035694516; 
 Mon, 01 Jun 2020 11:21:34 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 113/207] drm/amdgpu: enable 3D pipe 1 on Sienna_Cichlid
Date: Mon,  1 Jun 2020 14:19:20 -0400
Message-Id: <20200601182054.1267858-24-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Feifei Xu <Feifei.Xu@amd.com>,
 Likun Gao <Likun.Gao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

Only disable 3D pipe 1 on navi1x, enable 3D pipe 1 on Sienna_Cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
index 752032eba6ec..6c52363d5662 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -55,6 +55,7 @@
  * 2. Async ring
  */
 #define GFX10_NUM_GFX_RINGS_NV1X	1
+#define GFX10_NUM_GFX_RINGS_Sienna_Cichlid	2
 #define GFX10_MEC_HPD_SIZE	2048
 
 #define F32_CE_PROGRAM_RAM_SIZE		65536
@@ -7057,7 +7058,18 @@ static int gfx_v10_0_early_init(void *handle)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
-	adev->gfx.num_gfx_rings = GFX10_NUM_GFX_RINGS_NV1X;
+	switch (adev->asic_type) {
+	case CHIP_NAVI10:
+	case CHIP_NAVI14:
+	case CHIP_NAVI12:
+		adev->gfx.num_gfx_rings = GFX10_NUM_GFX_RINGS_NV1X;
+		break;
+	case CHIP_SIENNA_CICHLID:
+		adev->gfx.num_gfx_rings = GFX10_NUM_GFX_RINGS_Sienna_Cichlid;
+		break;
+	default:
+		break;
+	}
 
 	adev->gfx.num_compute_rings = AMDGPU_MAX_COMPUTE_RINGS;
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

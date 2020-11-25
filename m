Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D032C44CE
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Nov 2020 17:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969C76EA17;
	Wed, 25 Nov 2020 16:21:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C346EA17
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 16:21:42 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id q5so5131853qkc.12
 for <amd-gfx@lists.freedesktop.org>; Wed, 25 Nov 2020 08:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GRXr1CqZgyEqXWZebBoKXdTlwt5bVIw0lOrWvopkLgs=;
 b=MiuhkleFbPYs7YKJV/tOeFQ2uJM/31XcZdb3h0bVsxPyRbDeKelAMXv4iF6mUp8ZQW
 kvieH4WzRvKwH29ScpjaqFAFbo/7fYrHeFPv2sF+UnjxkEfJjoWo1mb0IX+k8JEOl5mx
 6V0bpO6CnpR0YGmar2qUJQe4YAO1L2YaPNp+i3iu4GX4LdCpbcDrqBtpeZ0DHg9+u491
 eS29I3+4OULW3bAcOJyj0dptfgIyoLoY3a8vloDXh/c9WGdqhdPgQGk7pXKA+5K0diC+
 l4m1gGEC90ouY6QMXPSyiPsZvkfwgZ7+pfSshGirIcEdxd7kTzQKPNRfD+VUOM7SPA+z
 KHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GRXr1CqZgyEqXWZebBoKXdTlwt5bVIw0lOrWvopkLgs=;
 b=tSrD29IrYKhzFvpE2qqo+WCR8JKj0oXam1tFZ+n998/FiztEkDTNln2hvyQKxWEv2R
 fIqzlas/UJoEY+C8/jwStgWzdAG+9pvJbhrWfFQ3HS8UhvoZV0FTK68S4RHt9C6Y6c3i
 yr5XXZPXaRRkzOGtTXQhqzPp6ALw3gEj5R7Oq3iSHUeXD8DFPBNUcZuMfn1Mcs57YH7M
 BF+rTzmSxMwEtiMPtCG7JqIKd6K11JZE0NNAUIE3VL7AAkgJskYNuDAMl0uc8ZC2bMfC
 hwLULgBsQ2O8hVDHLX8DIFREh6G/tdSig9xAMCFEKlzOABYdQZj1JgSLDvSmiuQHj3mA
 VCuQ==
X-Gm-Message-State: AOAM530wBTt7ETdJi+as3vpWpwgYjtKywQa+625Fx/JWnrK5VJovwzrS
 FkCYC7/1mI9Dp7LYuMKiqSzPN5DPmRA=
X-Google-Smtp-Source: ABdhPJzJ6LlvedglALd3xVFrSzr+2hdOwg5m4Pyno40WdWdMkcRcwuwrPvlAlPCEWp/S3O2SxX0piw==
X-Received: by 2002:a37:b4e:: with SMTP id 75mr3952962qkl.78.1606321301215;
 Wed, 25 Nov 2020 08:21:41 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id u24sm3093367qtb.33.2020.11.25.08.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 08:21:40 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu/nv: add mode2 reset handling
Date: Wed, 25 Nov 2020 11:21:30 -0500
Message-Id: <20201125162132.237264-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201125162132.237264-1-alexander.deucher@amd.com>
References: <20201125162132.237264-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Vangogh will use mode2 reset, so plumb it through the nv
soc driver.

Acked-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index ac02dd707c44..221a29cdc0aa 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -352,6 +352,7 @@ nv_asic_reset_method(struct amdgpu_device *adev)
 	struct smu_context *smu = &adev->smu;
 
 	if (amdgpu_reset_method == AMD_RESET_METHOD_MODE1 ||
+	    amdgpu_reset_method == AMD_RESET_METHOD_MODE2 ||
 	    amdgpu_reset_method == AMD_RESET_METHOD_BACO)
 		return amdgpu_reset_method;
 
@@ -360,6 +361,8 @@ nv_asic_reset_method(struct amdgpu_device *adev)
 				  amdgpu_reset_method);
 
 	switch (adev->asic_type) {
+	case CHIP_VANGOGH:
+		return AMD_RESET_METHOD_MODE2;
 	case CHIP_SIENNA_CICHLID:
 	case CHIP_NAVY_FLOUNDER:
 		return AMD_RESET_METHOD_MODE1;
@@ -376,7 +379,8 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 	int ret = 0;
 	struct smu_context *smu = &adev->smu;
 
-	if (nv_asic_reset_method(adev) == AMD_RESET_METHOD_BACO) {
+	switch (nv_asic_reset_method(adev)) {
+	case AMD_RESET_METHOD_BACO:
 		dev_info(adev->dev, "BACO reset\n");
 
 		ret = smu_baco_enter(smu);
@@ -385,9 +389,15 @@ static int nv_asic_reset(struct amdgpu_device *adev)
 		ret = smu_baco_exit(smu);
 		if (ret)
 			return ret;
-	} else {
+		break;
+	case AMD_RESET_METHOD_MODE2:
+		dev_info(adev->dev, "MODE2 reset\n");
+		ret = amdgpu_dpm_mode2_reset(adev);
+		break;
+	default:
 		dev_info(adev->dev, "MODE1 reset\n");
 		ret = nv_asic_mode1_reset(adev);
+		break;
 	}
 
 	return ret;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

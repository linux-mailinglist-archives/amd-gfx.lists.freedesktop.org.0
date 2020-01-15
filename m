Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CDE13CFF8
	for <lists+amd-gfx@lfdr.de>; Wed, 15 Jan 2020 23:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9216EB67;
	Wed, 15 Jan 2020 22:15:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A571C6EB67
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2020 22:15:55 +0000 (UTC)
Received: by mail-yw1-xc44.google.com with SMTP id n184so11770572ywc.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Jan 2020 14:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukn3Iwgbm/4rO/9J1QQ8H2EsVIYcgitGbKiY6XWiLOE=;
 b=bz55XMMFX3Yhzjcky+wmYDVb3Si3wBaSKZtVZd0Z/EhutDlpiTqmb+edML3TjNws/y
 4fNsHy2bDi3DABf3mO9Lxm8EhhXMsBk0vZS+OcKhOtmcPwy1Fp8wgZVCXA+OIudsnvE7
 eRJ+NXgRC8+Vn06ev2reEjxjuZAvTvhrFsEFsblBuOHsh5LNIZaHm3eC20TXQZsDn/Kl
 4NFaWXJoEy0OKVF5GaRwAxFGp2RNIt7lxb+AK6Rl8DTMArJYfBwTbtTUJ1A6aWwfvG1V
 LJ8bxqTH5tCx92HuXeId28B6MeNDeW6/UHvbuEnIiogxad10jQ5EdDInBRmkb4JmZDxb
 Y7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukn3Iwgbm/4rO/9J1QQ8H2EsVIYcgitGbKiY6XWiLOE=;
 b=Ua/iKTedNYy6KyFTjrV4KCZzmxNabw46NEshmlNzx1OgLWq3KHSauw7GDDS9Z/nFSI
 JA9ITEsV4TkJbMi0rPqf0EOQpM+urCWOjVge/6szapYnTnKwct3xFNUsXHQ8ZD1VgNFh
 jnr5f8BjZUld+ELgirSO9I0BWvYJu2xZ62bx5sUQAi80snhF2HoKGy1sF+WHdh2YY+4I
 dxHyROPpU0bOic1gDt6e4Z3H78H+eUjqeJ2/zxiZTxls2MrKHjvVvkT6iR/eaVBM5IBv
 BpUaYxX4w3ckr3SdHwMaIDfAvk/UEZSUu/92Lefvpd+85tNXa/C+0bXabEDrspSGZmXr
 kfrA==
X-Gm-Message-State: APjAAAUvKlfCwaaR7uY519won2ykgREo86XZ1jbmv0qhtTjNiD1DKS80
 UbpnO9Xsed13TEQbnUdiCzJDEuuj
X-Google-Smtp-Source: APXvYqwHJbAFsiWcJo8TPgfJVwTARwgYXS1zuNPSBVWjvglpA11PUt2NBt8jfVDtHORxlNUcVUXmdA==
X-Received: by 2002:a81:29ce:: with SMTP id
 p197mr22311192ywp.276.1579126554226; 
 Wed, 15 Jan 2020 14:15:54 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id g29sm9112315ywk.31.2020.01.15.14.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 14:15:53 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/amdgpu/vcn1.0: remove duplicate defines
Date: Wed, 15 Jan 2020 17:15:44 -0500
Message-Id: <20200115221544.1712687-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115221544.1712687-1-alexander.deucher@amd.com>
References: <20200115221544.1712687-1-alexander.deucher@amd.com>
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

These were added to amdgpu_vcn.h so remove the duplicates
in this file.  Fixes a warning.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
index a70351f2740c..2b9e3098d4e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c
@@ -39,11 +39,6 @@
 #include "ivsrcid/vcn/irqsrcs_vcn_1_0.h"
 #include "jpeg_v1_0.h"
 
-#define mmUVD_RBC_XX_IB_REG_CHECK				0x05ab
-#define mmUVD_RBC_XX_IB_REG_CHECK_BASE_IDX	1
-#define mmUVD_REG_XX_MASK							0x05ac
-#define mmUVD_REG_XX_MASK_BASE_IDX				1
-
 static int vcn_v1_0_stop(struct amdgpu_device *adev);
 static void vcn_v1_0_set_dec_ring_funcs(struct amdgpu_device *adev);
 static void vcn_v1_0_set_enc_ring_funcs(struct amdgpu_device *adev);
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

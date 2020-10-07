Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D5C28645C
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E96E6E0E7;
	Wed,  7 Oct 2020 16:32:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27006E969
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:32:35 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q63so3488480qkf.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gaoQ6QGXmMi6+lMt4QbxmEwb75bJkOumWjpe5Ex9/hE=;
 b=rm4BDnbM6MaBfkzi08kX21hKmRcvv7dHNabjUGi5tbKxnYZPhScS1Wzw5GBYraOuL7
 kpRTrQeBknN+wakRf2788Dep9qUb5CJokjvUoFS7VpZcuFzKpAutml8MohwT+WIYr17I
 Y13B91Sq9wePT8RY80tyEvsO75NWOvg1s2J1ImOoaGwiig2jir7Va2ulzfJgSmV5NHP3
 Jkm6yLbKvrVsZtnkJfpWsGHVKgZf7yFDSNTDVhsVflBJUWy0cJV3ux/bgoUhwmv8hBVD
 nPR+NS3AGNh+96mRzYpHDg+u2Ha1M+dyy+GjRBTMGY9IPCqbGTxSNbO3JxxWR7C3Kebz
 ffkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gaoQ6QGXmMi6+lMt4QbxmEwb75bJkOumWjpe5Ex9/hE=;
 b=Fx6o3S2zVzND4uS1dB6q5Wi5hvYTvIoD9z9WtxAh3yum27Eyhva1ETYQJWdU1I9YhS
 KO23V76OeTjz+iVd3WTmE3dpVkZU3fgO97NJ4K8LdKe2ACUYHXfmV+mXQnoIr4CDQHLg
 vtbRUTacYKJYfrqRaH6FJToL21u+CdWn86h8mdwdlQx4ks4wgPpbL5I6e4ujBHGOPIvU
 +4FIXYDmKLv0z9+CPf8Bk25lxMzztvOhwBoDt/35Qq4reKNGE4ByFonUl0hdawyAPP6a
 omRH2w6ucHIWXnPn4s7x2LZqLlc9DJDcDFaPg6Q+trBt3T4LaizTdhD2ViXVFMLfktXU
 vUEg==
X-Gm-Message-State: AOAM533IyMMobjokeezH56cmBJcN7B2DI4VzePVf3A317YGFJWJVAAdI
 pWWvugyZMgWpv9xJMVN9Ed9KaJtIzUE=
X-Google-Smtp-Source: ABdhPJz7uSMbtoyLrH9gEEVlwUB0fdjVw9yX6t3u7tJ1UHQ/DOzVFpc+ESf1HISH9Dw7lNbYoCpbQg==
X-Received: by 2002:a37:dc03:: with SMTP id v3mr3784244qki.300.1602088354733; 
 Wed, 07 Oct 2020 09:32:34 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:32:34 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 32/50] drm/amdgpu: enable jpeg3.0 PG and CG for
 dimgrey_cavefish
Date: Wed,  7 Oct 2020 12:31:17 -0400
Message-Id: <20201007163135.1944186-33-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201007163135.1944186-1-alexander.deucher@amd.com>
References: <20201007163135.1944186-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: James Zhu <James.Zhu@amd.com>

Enable JPEG3.0 PG and CG for dimgrey_cavefish.

Signed-off-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Leo Liu <leo.liu@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 45177edee516..12dc78bb2e25 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -904,9 +904,11 @@ static int nv_common_early_init(void *handle)
 		adev->external_rev_id = adev->rev_id + 0x01;
 		break;
 	case CHIP_DIMGREY_CAVEFISH:
-		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG;
+		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG |
+			AMD_CG_SUPPORT_JPEG_MGCG;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
-			AMD_PG_SUPPORT_VCN_DPG;
+			AMD_PG_SUPPORT_VCN_DPG |
+			AMD_PG_SUPPORT_JPEG;
 		adev->external_rev_id = adev->rev_id + 0x3c;
 		break;
 	default:
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

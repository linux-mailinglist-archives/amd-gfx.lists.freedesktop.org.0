Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF688286462
	for <lists+amd-gfx@lfdr.de>; Wed,  7 Oct 2020 18:32:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF006E972;
	Wed,  7 Oct 2020 16:32:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357A6E972
 for <amd-gfx@lists.freedesktop.org>; Wed,  7 Oct 2020 16:32:41 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id s7so3419572qkh.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 07 Oct 2020 09:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gww/zJth1/Nh7knA7tK1/IBVxGqJxUTZus+rdvGkNpk=;
 b=XKxtqtsq/KXfs53bs8xc7jOQ5Bee3p8sq2W2zENML1roaMeNXn1v3GBD05DJV5mgbG
 3h+Uenc0Xw8XAzpjU6U4Z6YsLvKd6REadzrAKMWxgbXTP5GpM0zZjn+of8lpmyASQZlR
 wrbLSSqTW03XaKmW5m1oOGVa9yaj3cuBdTuWWyTG6Vgd4bqWWPcdkvP2LTqVZkfyw65y
 ReLt1Spz5ZQOO4+VTQUCD+WP9doiItMAZ2Mlq4savqUGpDPur8+o210v1EEjZZpv3JPk
 XLOwPPt4RJunNAc7GFm5YDLH0bFkt64xZ3UhB9d6tHb//538eXQdxuQoGyYs3eDwXDFY
 vO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gww/zJth1/Nh7knA7tK1/IBVxGqJxUTZus+rdvGkNpk=;
 b=AbR7R9MIOX9zeDXS8UYDaIpc6236xWIH9aLzQQaYPVVfzYUI3QL+rKdNxRVp/oNJHZ
 GPBuF4O7yCssKkvSAueI06xEovZbacKLDU5pbNr3y9z9c8Y18IbbeKOeW4OGM8CVi1eq
 QC+mQy2ui0zEFbguxu2TH8ds71NIef2j2zQq/bzGbkmJI6TqcpDUT4z1ZiG6Dz4uEwou
 FAYZyMMIUV9dy8gtg3MG7QMVMuCtxR/H8EnfxydLtt51jxpSnmOXPoPFV/vk+kqvxaAh
 1esdu1JlHFnsW7IHb8J6cnQTiIXkKc6S4D617gAaqhR4Y5UNdbc4BlkxMmIbqNFkHJmu
 LDDw==
X-Gm-Message-State: AOAM530XqZHsQoBVMJcaD8EFsZWnSXk27SHiTQdzC3OT96JDefAvSCGL
 zeTzjNvOg6LjA6yRdxYaHf/T4VezvfY=
X-Google-Smtp-Source: ABdhPJwgPmPZ7Ii9XiKpp8eUJ7EFyTj07lDmTRpbUq7QNEw5ndzRh3xtS112SNNaASiY6hoJB/i/vA==
X-Received: by 2002:ae9:ed13:: with SMTP id c19mr3658702qkg.196.1602088360249; 
 Wed, 07 Oct 2020 09:32:40 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id l19sm1725576qkk.99.2020.10.07.09.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:32:39 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 37/50] drm/amdgpu: enable mc CG and LS for dimgrey_cavefish
Date: Wed,  7 Oct 2020 12:31:22 -0400
Message-Id: <20201007163135.1944186-38-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Tao Zhou <tao.zhou1@amd.com>

Set mc CG and LS flag for dimgrey_cavefish.

Signed-off-by: Tao Zhou <tao.zhou1@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 371646f6cd8a..111637bb3ee5 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -908,7 +908,9 @@ static int nv_common_early_init(void *handle)
 			AMD_CG_SUPPORT_GFX_CGCG |
 			AMD_CG_SUPPORT_GFX_3D_CGCG |
 			AMD_CG_SUPPORT_VCN_MGCG |
-			AMD_CG_SUPPORT_JPEG_MGCG;
+			AMD_CG_SUPPORT_JPEG_MGCG |
+			AMD_CG_SUPPORT_MC_MGCG |
+			AMD_CG_SUPPORT_MC_LS;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
 			AMD_PG_SUPPORT_VCN_DPG |
 			AMD_PG_SUPPORT_JPEG;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

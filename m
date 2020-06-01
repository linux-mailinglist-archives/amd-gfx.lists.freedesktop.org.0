Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99A01EAB95
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4308C6E2F2;
	Mon,  1 Jun 2020 18:21:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E686E2F8
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:21 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id i68so8489950qtb.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2M/n8vtNCrMup63dZf/7HezfJ1FGeXwT6f8i7uuDrxI=;
 b=NexQuKw81p+8aupzXNVfPMUmS8eYTeSJY+2Yg9D9X3MrVfIA+6DcVXUvsMtgBQrjTh
 qyndGpKSQ8XbwIS5L1fLDeO+3tTCLSpxeiAVHMaUhpyBoo+NBrqg8CoCY6CZQsHnnNBR
 n1TiP2dF5KG46GMqFijDOMp7Jhbhw0Tny6v2COaGJrrb2QR2CbG+ykXrvaQIx57W8K91
 Snjw9BCkdhu/gP5gRFjtpkoEm8XkP0YTUtFNL5dat+nbC2c8mUVkF37VoqO42Q/X8xSz
 BGN/qZPTHp/ORQwT+gvi8e3YkauZx2YY7M8/kUOwZYp8kBJFE7SRjH5sQZAex5R5drBn
 kAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2M/n8vtNCrMup63dZf/7HezfJ1FGeXwT6f8i7uuDrxI=;
 b=eMLR0iCHpBwVimYme74BO/UfyiwhzzfU2IYTUbSyaBt/EAnM3a/E/G2MbzlSOBcn27
 FyHTJJMsb5lzlG+VS6VDK795chzk64QH/4fnxlVPBYn6v/fJfLqGkKgZYB/5Osygr77J
 APHBQaSOIqwzDm6mmFJfyWGH992waFBgrE1XqvMAbqVNCely01RbO9iuYO/MgEy+Lpno
 MrzsHVyMNzs5xuBu0PcYLAKws5BfEb2Ln0fjgUpvkUb+TPApwO/HURhEt/5K/k01FIOO
 QsoIT8I+a2eDqlQpI8VF+hBGbGQ+e0h8fMjrIB8Ckbu9ejBZZsL04yTT6XIScr5QWbTY
 6e1w==
X-Gm-Message-State: AOAM5307ymRzNN8e2QIZrKb/iyTYEti4h0hTH+gCC7I9VygPbDqlLQc3
 Y3Wx3Dpft4kw2mVkqyeMAKwnNyXI
X-Google-Smtp-Source: ABdhPJzbomkqZv1XpEyDdkDJJGSSNy5kit4qgsGg4e3SQBiNu4kEND9dClN/tTKZeugCNm7T9BMnIA==
X-Received: by 2002:aed:38e4:: with SMTP id k91mr8814761qte.376.1591035680513; 
 Mon, 01 Jun 2020 11:21:20 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:20 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 102/207] drm/amdgpu: open GFX clock gating for sienna_cichlid
Date: Mon,  1 Jun 2020 14:19:09 -0400
Message-Id: <20200601182054.1267858-13-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Likun Gao <Likun.Gao@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Likun Gao <Likun.Gao@amd.com>

Open GFX MGCG, CGCG and 3DCG for sienna_cichlid.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 320d4db471cb..5d1c2eba3412 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -714,7 +714,10 @@ static int nv_common_early_init(void *handle)
 		adev->external_rev_id = adev->rev_id + 0xa;
 		break;
 	case CHIP_SIENNA_CICHLID:
-		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG |
+		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
+			AMD_CG_SUPPORT_GFX_CGCG |
+			AMD_CG_SUPPORT_GFX_3D_CGCG |
+			AMD_CG_SUPPORT_VCN_MGCG |
 			AMD_CG_SUPPORT_JPEG_MGCG;
 		adev->pg_flags = AMD_PG_SUPPORT_VCN |
 			AMD_PG_SUPPORT_JPEG;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B91EAB9E
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D55AF6E2F9;
	Mon,  1 Jun 2020 18:21:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14666E2F9
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:21:32 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id x29so8500489qtv.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sf+rlxAq+SOEdkJOIUX+enMcucxwpwq/xmEqFUnwIGA=;
 b=B3m5DG+LSCvbtLc/f0hMShfZzIUy58vZbSnOPpl+x2vLDTWaPIEO5unaHtA2K6h8Qb
 wHKGxozL5gZ63V56ahydvl3YS8fyrjGZDqv/cBf9J+QLq3nseO9zEGXmE9LRppz4mO0o
 fFIVKgElufkdBfgnQAn03WM4nZCHevQTcnZ+34cLVhjAx5PLOHk8QravwxvzD9SMnqF4
 Tp57qAECx0TcsQQnIj7H/cPTtf9sgnO6H1VwIrFSI1iMQVcSMgwyCAecgdrMBlW81RLs
 KvxVC5ji3qE8fovamNBvZd7EHLV/vhJOrQkX/KygI1HqN0mqPCBAYFOsed3bHLctb8n8
 kY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sf+rlxAq+SOEdkJOIUX+enMcucxwpwq/xmEqFUnwIGA=;
 b=aPmh+acAyMt/GR85muJk3bUTqDmXWkYSsYyCDsMqTJ2dV+cSlGBiBjM4DV0kKMt4mn
 Y5wxfk29QPQlDfifk2sfEgR3ZEYDotKXJLJL1MXrnc1cWWKNFhNfD7LFP7B3gxB6DUoA
 vyX7gnO9ATtLRz8RIVDt/NSQsAC9tSMYleFb50SYiLmQEfmLCpejffFBL7Y84swk6103
 DCjPoHLTL7ardPm8ApTp7LkhADmNohiQ3+g1dbKKAu7x0Rh24JWFXBgvMDfBDdPT3oq6
 G5ZyIim37roj7OtKpsWix6FdVw+c/PJ4BoIj8jojEj12WjqHYyRykKnYIcfDDiagyuQp
 TX5g==
X-Gm-Message-State: AOAM533mQeeQYXzHokADkX//r1BCsxtnWIJWS9WYWL4If02OToxzFc8v
 94yKinru4eDuqRu6nbZEyzr813rU
X-Google-Smtp-Source: ABdhPJxHUdWb/BwX7x+OffQ9j6/Cowkjh5yHYlEMc1BtLhfBu6VFG0wnceC9RI0GVyPC98Tg8M0JLw==
X-Received: by 2002:aed:3b56:: with SMTP id q22mr23051838qte.345.1591035691986; 
 Mon, 01 Jun 2020 11:21:31 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:21:31 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 111/207] drm/amdgpu: Enable Multi Media Hub (MMHUB) Clock
 Gating for sienna_cichlid.
Date: Mon,  1 Jun 2020 14:19:18 -0400
Message-Id: <20200601182054.1267858-22-alexander.deucher@amd.com>
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

Enable mmhub clockgating.

Signed-off-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Kenneth Feng <kenneth.feng@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 451557544b85..89c3727b7a8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -717,6 +717,7 @@ static int nv_common_early_init(void *handle)
 		adev->cg_flags = AMD_CG_SUPPORT_GFX_MGCG |
 			AMD_CG_SUPPORT_GFX_CGCG |
 			AMD_CG_SUPPORT_GFX_3D_CGCG |
+			AMD_CG_SUPPORT_MC_MGCG |
 			AMD_CG_SUPPORT_VCN_MGCG |
 			AMD_CG_SUPPORT_JPEG_MGCG |
 			AMD_CG_SUPPORT_HDP_MGCG |
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

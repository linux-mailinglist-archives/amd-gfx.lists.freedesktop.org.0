Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF9E1EABD4
	for <lists+amd-gfx@lfdr.de>; Mon,  1 Jun 2020 20:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E70076E358;
	Mon,  1 Jun 2020 18:22:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913E06E369
 for <amd-gfx@lists.freedesktop.org>; Mon,  1 Jun 2020 18:22:40 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id u17so7371656qtq.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 01 Jun 2020 11:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZkC9GRyoqhBrbAZbEAAhh3ucXJBNXj9Z2TGjvybWqQ=;
 b=VQv3T28/BkRrw5ZdqPB30d4UCTDGIIlwYfoq06Wk6avVLdUYUcXqOL73yNpmR4mrgU
 j3HzshYrVBY2lDF4giiX8xWYz8exieFsmkrvpihp905i/YkMGAoSImX6beoR7Zs02YJ3
 kC0Ed5HDw9bkHNUrEa7ni1sxdi5+U2G+eQLqkU2EHbblw9c+gfHWNBpnuVV6ajX+jCTy
 yagTo3s3oSzp7fZ0QbDMCiN6RDki9ItBkaJMzAXIdUaOVkv7bVucuoCOf0MNBPazqbt6
 r6X6gWPH2dopaD71ovKo1bTqoJjfB3njC2GuN4LIcniuFE8vIyFn4cO0k+w6TmI0QMSh
 tK0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NZkC9GRyoqhBrbAZbEAAhh3ucXJBNXj9Z2TGjvybWqQ=;
 b=gN7xVQCAE5AvEfilpcHLPpK+kKmotODNFxBu1ohMGhgrSS70gFvA/nA+e3i+nZKJKt
 xJ5GHjCH9uVJvrW32qAG2x8SNM/0rOx6XVA3pCk2nNss4gcNsOEpKxXmZ//pIPfgg08k
 WljcopHybJ0D4t91T8Tn7yzg+S98NIsLn6LfcD6uqpeAX5smPzOGn2AHH6uHcHpNTGgd
 HK5UDz043QuDrv0J/0ztwhhJOwGmRjYRSlfATxswbiPnWgtjGB2r2GIDvGINB7JZoNNc
 ryOOZVOZFu23zZaEwjDh8e16Q0N+FtKxNSHvMwFxtgoX3sELos5WBrhQWRMIY19oFb17
 bGPQ==
X-Gm-Message-State: AOAM532qYOMxxdqgHVInwqamr+GodXDVkRRpOtlwjaFLwbnt6cleG+tu
 oaaOY98uWu+mwQ2VtNYYgske8PWj
X-Google-Smtp-Source: ABdhPJxvUn+86LZ8j/tkn3WEIE8L4Ks/t5bk+16Ocn61koOlxJoy8baMJ+/wUSC1X1gepCyZFSBzBQ==
X-Received: by 2002:aed:3b56:: with SMTP id q22mr23056647qte.345.1591035759606; 
 Mon, 01 Jun 2020 11:22:39 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id w10sm106849qtc.15.2020.06.01.11.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 11:22:38 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 163/207] drm/amdgpu/sriov : Add sriov detection for
 sienna_cichlid
Date: Mon,  1 Jun 2020 14:20:10 -0400
Message-Id: <20200601182054.1267858-74-alexander.deucher@amd.com>
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
 Hawking Zhang <Hawking.Zhang@amd.com>, shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: shaoyunl <shaoyun.liu@amd.com>

This is a regression due to the rebase , add sienna_cichlid sriov detection back

Signed-off-by: shaoyunl <shaoyun.liu@amd.com>
Reviewed-by: Likun Gao <Likun.Gao@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index f3b38c9e04ca..bab9286021a7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -321,6 +321,7 @@ void amdgpu_detect_virtualization(struct amdgpu_device *adev)
 	case CHIP_VEGA20:
 	case CHIP_NAVI10:
 	case CHIP_NAVI12:
+	case CHIP_SIENNA_CICHLID:
 	case CHIP_ARCTURUS:
 		reg = RREG32(mmRCC_IOV_FUNC_IDENTIFIER);
 		break;
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

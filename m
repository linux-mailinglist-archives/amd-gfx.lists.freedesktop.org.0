Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B9021F94C
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Jul 2020 20:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD5D56E860;
	Tue, 14 Jul 2020 18:24:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173966E85F
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 18:24:52 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id e12so13570464qtr.9
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Jul 2020 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3aJA8RK6rEapZev2nQIOrFpjQzqg7WpqUPv70kLZ/fg=;
 b=ZMBpXkVgNMLIdmvOoiVb73WisZF1INqi7YBAaphoGGEEyXExyv2SYddS8jRi6ho163
 aoML4PQYgWMwaatk7ekidhJ57xLj2nFEqKUfLz5cc1lz2owytHssNDbVw3hBAtvHhs1y
 C0w8Vm/Es/t5JiHP9XSPtcusb/Tvj5E6FeJY4DuoBtgKnRzMHVnhn8lGg6vOitk7BfQm
 uvuwGtvdauQKEmk9gWgdT7hUFAvd6dIGeGG/JixyqN5HC8EsHwrinRQnahD9nCXVa+89
 JnfVPfELc8p6hAMh6tYPMtME7vnJpvPTdWAB70FsLQcBSgpm0mATffXL9RitXbhoFINt
 PSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3aJA8RK6rEapZev2nQIOrFpjQzqg7WpqUPv70kLZ/fg=;
 b=ZzMleaZKu7BhqNNgyFOuxL/YgAp7HuYblH3j80QAE9c3VZLceIpK7+C+U25v45kmiQ
 zaOXqcYrq2El9cyyyiKvlwHSEanV/+nv+cpewml4hSiVJbsn0dUxrg+dXgzn0oNXqTf4
 tBi9FfpSLq7GTRwz73LKzErRhiVqXqpggLu5mF13mVLIiXYtUwjuUcBKBWU2uUzVE6Iq
 iFJEOff+N/dGQT/EbXSFnUpRmwolpiXR4x373ou0WwXLspDvYBzGZg+pzNQxVSprhboo
 vJvgkRfzqQVRBl3O1LBs4ioD1zoGfP/7oj93QIK49HSb1ZyRyDMX4a2adLqNCSOKjCRB
 jybg==
X-Gm-Message-State: AOAM531JlWJwv1ZIccBqNum59TGzf9eTkWNex4oWDzLPXpiKBxNX7GNg
 1xDuMr4NhROz+b5B+76xtEdTiZYL
X-Google-Smtp-Source: ABdhPJwHLWkOpeR3IR9NNrUFIHtSTJ6a15c6j29033iohwlh2neKr4MXEMkEqruImQVdW/kBYUm7VQ==
X-Received: by 2002:ac8:7a9a:: with SMTP id x26mr5981418qtr.161.1594751091109; 
 Tue, 14 Jul 2020 11:24:51 -0700 (PDT)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id d53sm26046456qtc.47.2020.07.14.11.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:24:50 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 32/42] drm/amdgpu: enable VCN3.0 PG and CG for navy_flounder
Date: Tue, 14 Jul 2020 14:23:43 -0400
Message-Id: <20200714182353.2164930-33-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200714182353.2164930-1-alexander.deucher@amd.com>
References: <20200714182353.2164930-1-alexander.deucher@amd.com>
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
 Boyuan Zhang <boyuan.zhang@amd.com>, Leo Liu <leo.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Boyuan Zhang <boyuan.zhang@amd.com>

Enable VCN3.0 PG and CG for navy_flounder by setting up the flags to the ASIC

Signed-off-by: Boyuan Zhang <boyuan.zhang@amd.com>
Reviewed-by: Leo Liu <leo.liu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/nv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu/nv.c
index 0f567b4b94b1..5f8fa4994c97 100644
--- a/drivers/gpu/drm/amd/amdgpu/nv.c
+++ b/drivers/gpu/drm/amd/amdgpu/nv.c
@@ -755,8 +755,8 @@ static int nv_common_early_init(void *handle)
 		adev->external_rev_id = adev->rev_id + 0x28;
 		break;
 	case CHIP_NAVY_FLOUNDER:
-		adev->cg_flags = 0;
-		adev->pg_flags = 0;
+		adev->cg_flags = AMD_CG_SUPPORT_VCN_MGCG;
+		adev->pg_flags = AMD_PG_SUPPORT_VCN;
 		adev->external_rev_id = adev->rev_id + 0x32;
 		break;
 
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

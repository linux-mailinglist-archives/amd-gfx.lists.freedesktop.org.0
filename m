Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F02C8E05
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Nov 2020 20:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590E36E804;
	Mon, 30 Nov 2020 19:25:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925386E804
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 19:25:23 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id q7so6147158qvt.12
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Nov 2020 11:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I/cApoyy98PFxn/lmPQPnmxeXWv8XI/VCBjmZK0r4wU=;
 b=SPyc/Gt/IasbcimMIBVnQdZlyC6KVPVQFvoOMiu+gsp+vWKWotKCUdxvhbH4kt9Hfr
 EfRaTDPzsc/5omwjNBwJPPpiaQxkLza66YhRO7MvrRSieBgs7DREG7kPewNnwE6fhKF3
 +rKmuyal3bvBIO2qkSOd3fnMwjtskU0UgRgYELhFeJJYxXWNQnjMA3gsfO6tUyccpsAq
 sVmuk+gaINuIy9bymrrAi4klnkj0DGYa2+Jd6bam9ZLaQ1UhrIxXYZFVfiAiaPNoMQCF
 nTUi8PQZ1/xwKiTZc9kFEkc4AHUiPoVsk4VTJAEVIz3CUIzBD1PtzXP0PMtXglmRw5Ke
 SLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I/cApoyy98PFxn/lmPQPnmxeXWv8XI/VCBjmZK0r4wU=;
 b=RMH30BWb1uf3NiFvmTpb+YaarJY6hgEpbZDGIpMfpHcn6oAnKeMvhd3ewB/eBuvWHE
 qSP5QHTgb4xBZpPmmzFN4XuiD0tcQdsR72lorul/O8l4nJGYrtXFDOIZd9rcak/bTGwp
 a9yYrbcr8DbHTn7zhLq2VOaEi6k+L+OCHg7ypMWj2WU3EiSXGwxBfK3H+ldrCSV9sqte
 Ig7BXSs+ga6EbNLQ/qzvyL9tMX1o5dblAGw71lDLvdJRbmkuDaDTLiQ1H0Dc50WJArLz
 n+rm71aTm+rxvvgY8KORHQsatQKtBukanmV+60B7zEh/rmWvwEpvZP1RwOiR1fQR3+pA
 9H3A==
X-Gm-Message-State: AOAM533ExTn5rFDvA/wrBXKYcdGfEOXI6Mlgt72rPL+5pb0FK93sZJz7
 BtPLaORhAwb8+PBup3rg1AdIj1CUxxE=
X-Google-Smtp-Source: ABdhPJz+ibD4YVtpk7b+9V5VPxqjwDGSWruLoxjQuiUkTKOorznTodSdsdbj8gg5z1EpbV2/E56Juw==
X-Received: by 2002:a0c:f791:: with SMTP id s17mr23976472qvn.7.1606764322547; 
 Mon, 30 Nov 2020 11:25:22 -0800 (PST)
Received: from localhost.localdomain ([192.161.78.5])
 by smtp.gmail.com with ESMTPSA id b64sm15861759qkg.19.2020.11.30.11.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 11:25:22 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: default noretry=0 for navi1x and newer (v2)
Date: Mon, 30 Nov 2020 14:25:15 -0500
Message-Id: <20201130192515.305306-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.25.4
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

There are no performance advantages to setting it to 1 and
it causes stability issues in some cases.

v2: simplify the code

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1374
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
index fede84509dbc..b07c47cacd28 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
@@ -422,11 +422,6 @@ void amdgpu_gmc_noretry_set(struct amdgpu_device *adev)
 
 	switch (adev->asic_type) {
 	case CHIP_VEGA20:
-	case CHIP_NAVI10:
-	case CHIP_NAVI14:
-	case CHIP_SIENNA_CICHLID:
-	case CHIP_NAVY_FLOUNDER:
-	case CHIP_DIMGREY_CAVEFISH:
 		/*
 		 * noretry = 0 will cause kfd page fault tests fail
 		 * for some ASICs, so set default to 1 for these ASICs.
-- 
2.25.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

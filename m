Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E46B915AA6D
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Feb 2020 14:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741666E096;
	Wed, 12 Feb 2020 13:53:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 105F46E096
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Feb 2020 13:53:37 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id p129so1073035ybc.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Feb 2020 05:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EAl+nRlSIVzgXw8RyDkV/my68OWWfEjgIho1ofcsEzM=;
 b=doBeikaVOjccs3WxZ8Rg6EbimOHp1aJ8HriZPg0M86xVWWv9lxS+KnpB7ru4QW0xfT
 K/oBOcDxYja7NpW22rOmJ7bgzKomwAaMbgNF+9giovOJVH8HEyxKdDXtUrovxXajVoHd
 +rLoLc1UhmVu2zsfxGwy9pUaA75k3lWsfxMw95YZkRQkG58c1Db6//NTIUMW9FG70AJB
 ao+mdkimJEs0QqZu4Z4iBV4x2WkixKAyz8G2801XIsjDyWRDxc3s1SfNbLA0/rr6DtXm
 ZbHIINDlNjA9+Ee041FSyc0k6Bw7CRSAzkiKjJUfMTvJvB+cQXjr30VsWjGdGcPdqAIl
 q8+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EAl+nRlSIVzgXw8RyDkV/my68OWWfEjgIho1ofcsEzM=;
 b=qI2KMt7Q5UFrhMqefsjPhPV7FV/jJZeXKWAjFO0c88NDTKHxHSpDLUhSf7UjNbKGdx
 J6XP8UZJkURqNKMeQ1mb6t1rqLDZl5oyXttOvd3mUpOG5pFzFx/UJUFIdS3qUdJc2DTp
 PlamD+33X+rcZdPP2KOZG7MS4fryhCsAXFjTw+61+x/UW6XsCliNIrB71W8Clg/bRMl/
 fuQJqB+TAMowQGnd59B6s8WS4wi/4317nR/vSqm6elebQvvNZVe348HNgv3KYBfWYket
 IgeuySUuP6j4G9pXaTdLHtHXO9B6UDdnSPY4BTTKGTHoTcRRDw4QktcNCn2lbMiIcIy6
 FqFw==
X-Gm-Message-State: APjAAAUpBQKXtcUyGPBnPidmY8aJ8kaQg9VY8X+ynyVWp9Sx6/6sUWkF
 pUwHBDBgkbNArmXkJpWql1LmlOpa
X-Google-Smtp-Source: APXvYqzokT9mLBeCuzC+TWEqB0yf8oqzabA0kLy6xls2AhJayziY/d1XI4xsmCyzWoWPhAsEbbHzbQ==
X-Received: by 2002:a25:afc2:: with SMTP id d2mr1632832ybj.308.1581515616025; 
 Wed, 12 Feb 2020 05:53:36 -0800 (PST)
Received: from tr4.amd.com (atlvpn.amd.com. [165.204.84.11])
 by smtp.gmail.com with ESMTPSA id j184sm185309ywa.39.2020.02.12.05.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 05:53:35 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdgpu/gfx9: disable gfxoff when reading rlc clock
Date: Wed, 12 Feb 2020 08:53:25 -0500
Message-Id: <20200212135326.1165548-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
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

Otherwise we readback all ones.  Fixes rlc counter
readback while gfxoff is active.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 82476f6acfad..108b9e5319f7 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -3959,6 +3959,7 @@ static uint64_t gfx_v9_0_get_gpu_clock_counter(struct amdgpu_device *adev)
 {
 	uint64_t clock;
 
+	amdgpu_gfx_off_ctrl(adev, false);
 	mutex_lock(&adev->gfx.gpu_clock_mutex);
 	if (adev->asic_type == CHIP_VEGA10 && amdgpu_sriov_runtime(adev)) {
 		uint32_t tmp, lsb, msb, i = 0;
@@ -3977,6 +3978,7 @@ static uint64_t gfx_v9_0_get_gpu_clock_counter(struct amdgpu_device *adev)
 			((uint64_t)RREG32_SOC15(GC, 0, mmRLC_GPU_CLOCK_COUNT_MSB) << 32ULL);
 	}
 	mutex_unlock(&adev->gfx.gpu_clock_mutex);
+	amdgpu_gfx_off_ctrl(adev, true);
 	return clock;
 }
 
-- 
2.24.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B07330183
	for <lists+amd-gfx@lfdr.de>; Sun,  7 Mar 2021 14:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735446E145;
	Sun,  7 Mar 2021 13:58:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CC06E145;
 Sun,  7 Mar 2021 13:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0163865111;
 Sun,  7 Mar 2021 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615125485;
 bh=YKt1LXGSyxpuPifHhhxpZ+S1YLgBmWcQUOqe7nLhOq0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WqSK8JUX/29n3s4p+BOjOaPQWdjnQU1tJ+CcDryDmwwOHJdsKLPwFcdj2QksriMWs
 0GEXGs3V4XWuuh617v0HkwHTL/aYexmXjtXP3qLLAQNSPG9XvbR2p/w+Atizgx2o9Y
 hdE2cpQHkxmiR4HNfPL7gt+iJFdvc4LTEwSTIsVnqpOkDWNS83HyB4lzAcvvxuTlXN
 lqZGlccH3sq7SH9COBeXgBDKqJa7RdX//3jMLmwxFeUYPXtnOFcLc25FugXFfBtj0+
 cXgeWXmrBfk61X87x/xBCxM6dgvpV/skpS/pGFH5RGum6U+K/3x+ouYTU19fg9Udne
 H8iwy2UHjF5wQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 3/8] drm/amdgpu: enable BACO runpm by default on
 sienna cichlid and navy flounder
Date: Sun,  7 Mar 2021 08:57:56 -0500
Message-Id: <20210307135801.967583-3-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210307135801.967583-1-sashal@kernel.org>
References: <20210307135801.967583-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 25951362db7b3791488ec45bf56c0043f107b94b ]

It works fine and was only disabled because primary GPUs
don't enter runpm if there is a console bound to the fbdev due
to the kmap.  This will at least allow runpm on secondary cards.

Reviewed-by: Evan Quan <evan.quan@amd.com>
Reviewed-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index efda38349a03..48cd9109ec97 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -169,8 +169,6 @@ int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
 #endif
 		case CHIP_VEGA20:
 		case CHIP_ARCTURUS:
-		case CHIP_SIENNA_CICHLID:
-		case CHIP_NAVY_FLOUNDER:
 			/* enable runpm if runpm=1 */
 			if (amdgpu_runtime_pm > 0)
 				adev->runpm = true;
-- 
2.30.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

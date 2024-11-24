Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE789D709A
	for <lists+amd-gfx@lfdr.de>; Sun, 24 Nov 2024 14:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE05D10E4E2;
	Sun, 24 Nov 2024 13:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gPpWuRCs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D1810E4E2;
 Sun, 24 Nov 2024 13:36:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7C308A40AC6;
 Sun, 24 Nov 2024 13:34:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D44C4CED1;
 Sun, 24 Nov 2024 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732455410;
 bh=2Kl0frRTSpeSxs8adDTnrwdbyKJvtH2WS6/Cb/idmxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gPpWuRCsj9XW3OSn/hKRgozWcMAvnLRJ19k6EOirIpuqshE87mwZxe2uUF8m9B2kY
 KQ6fs8OCSARZ4MIA7hWs11pymkXTXh9ubUaeMVI+AE1sP5ElHHjyNUtLZ48Rk9GZcS
 +sIaYiBERHNHA+heni45u60nXCq5pz1WRAitny/JpIt09UbPkN0V/QbU6ZyymqTzsw
 9677Dg8qtA026HhdAJBil3GnscndRVGzaPWavz+XKiym96nel5pHuBrZpD1PuQJKmm
 ezMQJHM1klO45ICh3otXVesD0tygoWOQpvVSHBghJHE2wet9QNA0rrMJ6446BzuYEw
 WRIBZFGPP0HLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Lang Yu <lang.yu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sasha Levin <sashal@kernel.org>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, simona@ffwll.ch, Frank.Min@amd.com,
 Hawking.Zhang@amd.com, Philip.Yang@amd.com, shashank.sharma@amd.com,
 mdaenzer@redhat.com, Arunpravin.PaneerSelvam@amd.com,
 Amaranath.Somalapuram@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.12 064/107] drm/amdgpu: refine error handling in
 amdgpu_ttm_tt_pin_userptr
Date: Sun, 24 Nov 2024 08:29:24 -0500
Message-ID: <20241124133301.3341829-64-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124133301.3341829-1-sashal@kernel.org>
References: <20241124133301.3341829-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Lang Yu <lang.yu@amd.com>

[ Upstream commit 46186667f98fb7158c98f4ff5da62c427761ffcd ]

Free sg table when dma_map_sgtable() failed to avoid memory leak.

Signed-off-by: Lang Yu <lang.yu@amd.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 74adb983ab03e..0637414fc70e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -812,7 +812,7 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_device *bdev,
 	/* Map SG to device */
 	r = dma_map_sgtable(adev->dev, ttm->sg, direction, 0);
 	if (r)
-		goto release_sg;
+		goto release_sg_table;
 
 	/* convert SG to linear array of pages and dma addresses */
 	drm_prime_sg_to_dma_addr_array(ttm->sg, gtt->ttm.dma_address,
@@ -820,6 +820,8 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_device *bdev,
 
 	return 0;
 
+release_sg_table:
+	sg_free_table(ttm->sg);
 release_sg:
 	kfree(ttm->sg);
 	ttm->sg = NULL;
-- 
2.43.0


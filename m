Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10344491748
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jan 2022 03:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13ED6112900;
	Tue, 18 Jan 2022 02:39:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FCB112900;
 Tue, 18 Jan 2022 02:39:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5148660C96;
 Tue, 18 Jan 2022 02:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92769C36AF2;
 Tue, 18 Jan 2022 02:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473546;
 bh=Evjdvma7DpXHpludweJifTmE2JUT8KCAToNGDJW3x2k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r2GA96LNZI/Dn8wGmInW3pYk+QAkyyt6Bts6LNHJqpZkI2MQrsgAjyM0RA/mqMQw/
 /2eSZomtmlP6glvIg6gTYFfom/aXMOtyo4zl0rkzp5B/IuH21N2tuY7vehEp4IFKtZ
 sPJCOuRKYjukIMm7JdR/CVSpU/aT10CktEbVQy7pWIWWQpG//jXQRzUs5RoJu8hotP
 APFuaFyfcC6jeCE7xylscxkY1pA/KSVsACCYr+QkDrtana6+o3N2B7asnTY9xgnsMb
 gOH4w4PqQl5lXH52z45y3VhVWa1MT12Zmrqy2hDotKy9XB5vMS/XMwult+FWnXYxDH
 w/boNu0wbTHig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 159/188] drm/amdgpu: fixup bad vram size on gmc v8
Date: Mon, 17 Jan 2022 21:31:23 -0500
Message-Id: <20220118023152.1948105-159-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, andrey.grodzovsky@amd.com,
 Oak.Zeng@amd.com, airlied@linux.ie, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Zongmin Zhou <zhouzongmin@kylinos.cn>,
 nirmoy.das@amd.com, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

[ Upstream commit 11544d77e3974924c5a9c8a8320b996a3e9b2f8b ]

Some boards(like RX550) seem to have garbage in the upper
16 bits of the vram size register.  Check for
this and clamp the size properly.  Fixes
boards reporting bogus amounts of vram.

after add this patch,the maximum GPU VRAM size is 64GB,
otherwise only 64GB vram size will be used.

Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index 492ebed2915be..63b890f1e8afb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -515,10 +515,10 @@ static void gmc_v8_0_mc_program(struct amdgpu_device *adev)
 static int gmc_v8_0_mc_init(struct amdgpu_device *adev)
 {
 	int r;
+	u32 tmp;
 
 	adev->gmc.vram_width = amdgpu_atombios_get_vram_width(adev);
 	if (!adev->gmc.vram_width) {
-		u32 tmp;
 		int chansize, numchan;
 
 		/* Get VRAM informations */
@@ -562,8 +562,15 @@ static int gmc_v8_0_mc_init(struct amdgpu_device *adev)
 		adev->gmc.vram_width = numchan * chansize;
 	}
 	/* size in MB on si */
-	adev->gmc.mc_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
-	adev->gmc.real_vram_size = RREG32(mmCONFIG_MEMSIZE) * 1024ULL * 1024ULL;
+	tmp = RREG32(mmCONFIG_MEMSIZE);
+	/* some boards may have garbage in the upper 16 bits */
+	if (tmp & 0xffff0000) {
+		DRM_INFO("Probable bad vram size: 0x%08x\n", tmp);
+		if (tmp & 0xffff)
+			tmp &= 0xffff;
+	}
+	adev->gmc.mc_vram_size = tmp * 1024ULL * 1024ULL;
+	adev->gmc.real_vram_size = adev->gmc.mc_vram_size;
 
 	if (!(adev->flags & AMD_IS_APU)) {
 		r = amdgpu_device_resize_fb_bar(adev);
-- 
2.34.1


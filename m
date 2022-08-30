Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1E75A6A2C
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Aug 2022 19:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0501010E29C;
	Tue, 30 Aug 2022 17:26:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB2DD10E2BD;
 Tue, 30 Aug 2022 17:26:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42BB6617A0;
 Tue, 30 Aug 2022 17:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D366C433D6;
 Tue, 30 Aug 2022 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661880400;
 bh=pVGX3lUAokxnhXBJdkUrS/2va8kh1ON7b6FM2FZm/c0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B8ih82nwZRVXfs0yyFn8Tw4IYdPK8j5hwC8BTssGhAQRqiovMvjdjM7DW1TBqTq0M
 Rn1iJZaCWdAnByod1iiYvQalXUM2LQ50d2L1q19OH3+0tJ62fGCEPwKtgD/pexz2Ri
 63xuu0Q17IziF072E/0vSGvZpd3i1tHNMF5AKEHb9jXkWbNZ8GvoDc53INat3CcrYO
 z8N5i9+5OEcyQLjRArLp/ByY7X4RePWGwbH/2yr1J3v/SvKK0WtyC5Y/t4FdzS2xtj
 y6/ZbfPj89mwn9VsZDhFO8a026Cp07I0W+sAIGh6YiHnlNztcKQ0NnRW4PXu19UecA
 dqu1bVdRXEhYQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 2/8] drm/amdgpu: Check num_gfx_rings for gfx v9_0
 rb setup.
Date: Tue, 30 Aug 2022 13:26:25 -0400
Message-Id: <20220830172631.581969-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172631.581969-1-sashal@kernel.org>
References: <20220830172631.581969-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tao.zhou1@amd.com, airlied@linux.ie,
 Xinhui.Pan@amd.com, ricetons@gmail.com, amd-gfx@lists.freedesktop.org,
 desowin@gmail.com, victor.skvortsov@amd.com, YiPeng.Chai@amd.com,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 Alex Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Candice Li <candice.li@amd.com>

[ Upstream commit c351938350ab9b5e978dede2c321da43de7eb70c ]

No need to set up rb when no gfx rings.

Signed-off-by: Candice Li <candice.li@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 53186c5e1066b..bb0d32b4be74d 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -1514,7 +1514,8 @@ static void gfx_v9_0_gpu_init(struct amdgpu_device *adev)
 
 	gfx_v9_0_tiling_mode_table_init(adev);
 
-	gfx_v9_0_setup_rb(adev);
+	if (adev->gfx.num_gfx_rings)
+		gfx_v9_0_setup_rb(adev);
 	gfx_v9_0_get_cu_info(adev, &adev->gfx.cu_info);
 
 	/* XXX SH_MEM regs */
-- 
2.35.1


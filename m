Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4C775E691
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jul 2023 03:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E2710E237;
	Mon, 24 Jul 2023 01:21:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBB510E237;
 Mon, 24 Jul 2023 01:21:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0F4360F0C;
 Mon, 24 Jul 2023 01:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAC5C433C7;
 Mon, 24 Jul 2023 01:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690161688;
 bh=FS5dgbmr+6SVZbHKPQXKRgXJLpF3aIlCH4IzeFGohZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MEi5pBMKRjRiclXDVEentJ0RIBC1/r2MkAL3wq+BTKpxy5tNXNuJ17B+VwbmLAjb/
 BYV7bUPDifnznDYQnMBZztLzYXQ324sojsvcF6n3dxBilndL/jJ8zgfon9af/3a2M1
 GYBht8UjHfQ97VJyxpQbGqpXN1b0fm03kiKqxZEB8R1OgjXnT1+0cyr+D3EkOkh8R6
 y9kdMu3y5bnKdihwQB9VNwWgsDJSkFqVtp0Z0ozIrqBXGHmx6yHoEJzRYx8XmRnzjD
 ArzECOu0nDX/cVFm4rwXvsXASjFawegoj+If1pmHwFJyHzDtZbG86Auh0QR6T3p9TJ
 4xOuPi2l3uAiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 02/41] drm/amdgpu: fix calltrace warning in
 amddrm_buddy_fini
Date: Sun, 23 Jul 2023 21:20:35 -0400
Message-Id: <20230724012118.2316073-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
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
Cc: Sasha Levin <sashal@kernel.org>, katrinzhou@tencent.com, Jack.Gui@amd.com,
 Guchun Chen <guchun.chen@amd.com>, Longlong Yao <Longlong.Yao@amd.com>,
 Feifei Xu <Feifei.Xu@amd.com>, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, YiPeng.Chai@amd.com,
 mario.limonciello@amd.com, daniel@ffwll.ch, Lyndon.Li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, candice.li@amd.com,
 airlied@gmail.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Longlong Yao <Longlong.Yao@amd.com>

[ Upstream commit 01382501509871d0799bab6bd412c228486af5bf ]

The following call trace is observed when removing the amdgpu driver, which
is caused by that BOs allocated for psp are not freed until removing.

[61811.450562] RIP: 0010:amddrm_buddy_fini.cold+0x29/0x47 [amddrm_buddy]
[61811.450577] Call Trace:
[61811.450577]  <TASK>
[61811.450579]  amdgpu_vram_mgr_fini+0x135/0x1c0 [amdgpu]
[61811.450728]  amdgpu_ttm_fini+0x207/0x290 [amdgpu]
[61811.450870]  amdgpu_bo_fini+0x27/0xa0 [amdgpu]
[61811.451012]  gmc_v9_0_sw_fini+0x4a/0x60 [amdgpu]
[61811.451166]  amdgpu_device_fini_sw+0x117/0x520 [amdgpu]
[61811.451306]  amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
[61811.451447]  devm_drm_dev_init_release+0x4d/0x80 [drm]
[61811.451466]  devm_action_release+0x15/0x20
[61811.451469]  release_nodes+0x40/0xb0
[61811.451471]  devres_release_all+0x9b/0xd0
[61811.451473]  __device_release_driver+0x1bb/0x2a0
[61811.451476]  driver_detach+0xf3/0x140
[61811.451479]  bus_remove_driver+0x6c/0xf0
[61811.451481]  driver_unregister+0x31/0x60
[61811.451483]  pci_unregister_driver+0x40/0x90
[61811.451486]  amdgpu_exit+0x15/0x447 [amdgpu]

For smu v13_0_2, if the GPU supports xgmi, refer to

commit f5c7e7797060 ("drm/amdgpu: Adjust removal control flow for smu v13_0_2"),

it will run gpu recover in AMDGPU_RESET_FOR_DEVICE_REMOVE mode when removing,
which makes all devices in hive list have hw reset but no resume except the
basic ip blocks, then other ip blocks will not call .hw_fini according to
ip_block.status.hw.

Since psp_free_shared_bufs just includes some software operations, so move
it to psp_sw_fini.

Reviewed-by: Guchun Chen <guchun.chen@amd.com>
Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Signed-off-by: Longlong Yao <Longlong.Yao@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index a3cd816f98a14..9e6719a561587 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -514,6 +514,8 @@ static int psp_sw_fini(void *handle)
 	kfree(cmd);
 	cmd = NULL;
 
+	psp_free_shared_bufs(psp);
+
 	if (psp->km_ring.ring_mem)
 		amdgpu_bo_free_kernel(&adev->firmware.rbuf,
 				      &psp->km_ring.ring_mem_mc_addr,
@@ -2671,8 +2673,6 @@ static int psp_hw_fini(void *handle)
 
 	psp_ring_destroy(psp, PSP_RING_TYPE__KM);
 
-	psp_free_shared_bufs(psp);
-
 	return 0;
 }
 
-- 
2.39.2


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6B0985A31
	for <lists+amd-gfx@lfdr.de>; Wed, 25 Sep 2024 14:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62D210E9B8;
	Wed, 25 Sep 2024 12:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WjLtkE6/";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7C010E9B6;
 Wed, 25 Sep 2024 12:06:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9118C5C5B1F;
 Wed, 25 Sep 2024 12:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA29C4CEC3;
 Wed, 25 Sep 2024 12:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265965;
 bh=RnRQaCfxna+JYck5F1g62zVfD6VK1LmF1xVZdgTzab8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WjLtkE6/KEZx5BoNB6rm8W/nLI+bhKVZMFR5Yh2RMns2jog7P2yhSs0f/AOxTY3QD
 Mn3O8O+t3dFqtrGZDxSWK3o/vFbFTKFRC6uKUlRrZxnsI3hCYvQwWlG5GeKiRK5jj5
 liExn6pJtvNM1S1/FiLE5IeXcsWjeacKcNVuuIgf5bHvLjPF4AD3g0v5H9hPPmSm8L
 oiwRcEXqFaCQnfTYEGfPDph8N5/JBT8haYwUj3Y48aqEPg9qVQlx9hplgEY0Y3wlVL
 u85I09h3iuxiWOcoI0kD1iwgYsPheyfE89e6dP/Sp/ac+GRWrf0H3OqDztBfNf+xbQ
 K7JVZQRVAB/vA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tim Huang <tim.huang@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Roman Li <roman.li@amd.com>, Daniel Wheeler <daniel.wheeler@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, lewis.huang@amd.com, chiahsuan.chung@amd.com,
 alex.hung@amd.com, dennis.chan@amd.com, srinivasan.shanmugam@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 133/197] drm/amd/display: fix double free issue
 during amdgpu module unload
Date: Wed, 25 Sep 2024 07:52:32 -0400
Message-ID: <20240925115823.1303019-133-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925115823.1303019-1-sashal@kernel.org>
References: <20240925115823.1303019-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.11
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

From: Tim Huang <tim.huang@amd.com>

[ Upstream commit 20b5a8f9f4670a8503aa9fa95ca632e77c6bf55d ]

Flexible endpoints use DIGs from available inflexible endpoints,
so only the encoders of inflexible links need to be freed.
Otherwise, a double free issue may occur when unloading the
amdgpu module.

[  279.190523] RIP: 0010:__slab_free+0x152/0x2f0
[  279.190577] Call Trace:
[  279.190580]  <TASK>
[  279.190582]  ? show_regs+0x69/0x80
[  279.190590]  ? die+0x3b/0x90
[  279.190595]  ? do_trap+0xc8/0xe0
[  279.190601]  ? do_error_trap+0x73/0xa0
[  279.190605]  ? __slab_free+0x152/0x2f0
[  279.190609]  ? exc_invalid_op+0x56/0x70
[  279.190616]  ? __slab_free+0x152/0x2f0
[  279.190642]  ? asm_exc_invalid_op+0x1f/0x30
[  279.190648]  ? dcn10_link_encoder_destroy+0x19/0x30 [amdgpu]
[  279.191096]  ? __slab_free+0x152/0x2f0
[  279.191102]  ? dcn10_link_encoder_destroy+0x19/0x30 [amdgpu]
[  279.191469]  kfree+0x260/0x2b0
[  279.191474]  dcn10_link_encoder_destroy+0x19/0x30 [amdgpu]
[  279.191821]  link_destroy+0xd7/0x130 [amdgpu]
[  279.192248]  dc_destruct+0x90/0x270 [amdgpu]
[  279.192666]  dc_destroy+0x19/0x40 [amdgpu]
[  279.193020]  amdgpu_dm_fini+0x16e/0x200 [amdgpu]
[  279.193432]  dm_hw_fini+0x26/0x40 [amdgpu]
[  279.193795]  amdgpu_device_fini_hw+0x24c/0x400 [amdgpu]
[  279.194108]  amdgpu_driver_unload_kms+0x4f/0x70 [amdgpu]
[  279.194436]  amdgpu_pci_remove+0x40/0x80 [amdgpu]
[  279.194632]  pci_device_remove+0x3a/0xa0
[  279.194638]  device_remove+0x40/0x70
[  279.194642]  device_release_driver_internal+0x1ad/0x210
[  279.194647]  driver_detach+0x4e/0xa0
[  279.194650]  bus_remove_driver+0x6f/0xf0
[  279.194653]  driver_unregister+0x33/0x60
[  279.194657]  pci_unregister_driver+0x44/0x90
[  279.194662]  amdgpu_exit+0x19/0x1f0 [amdgpu]
[  279.194939]  __do_sys_delete_module.isra.0+0x198/0x2f0
[  279.194946]  __x64_sys_delete_module+0x16/0x20
[  279.194950]  do_syscall_64+0x58/0x120
[  279.194954]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  279.194980]  </TASK>

Reviewed-by: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
Signed-off-by: Tim Huang <tim.huang@amd.com>
Reviewed-by: Roman Li <roman.li@amd.com>
Signed-off-by: Roman Li <roman.li@amd.com>
Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/link/link_factory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_factory.c b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
index 72df9bdfb23ff..608491f860b29 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_factory.c
@@ -385,7 +385,7 @@ static void link_destruct(struct dc_link *link)
 	if (link->panel_cntl)
 		link->panel_cntl->funcs->destroy(&link->panel_cntl);
 
-	if (link->link_enc) {
+	if (link->link_enc && !link->is_dig_mapping_flexible) {
 		/* Update link encoder resource tracking variables. These are used for
 		 * the dynamic assignment of link encoders to streams. Virtual links
 		 * are not assigned encoder resources on creation.
-- 
2.43.0


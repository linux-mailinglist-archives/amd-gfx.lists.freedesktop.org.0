Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465493E638
	for <lists+amd-gfx@lfdr.de>; Sun, 28 Jul 2024 17:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A711310E232;
	Sun, 28 Jul 2024 15:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RYvSkXXT";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D974010E231;
 Sun, 28 Jul 2024 15:45:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 15B9DCE0947;
 Sun, 28 Jul 2024 15:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 299BFC116B1;
 Sun, 28 Jul 2024 15:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722181509;
 bh=O5pZSmZAC6PFWnxmSF9InmTmJ6r4hyQQJF/rOn0H8xQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RYvSkXXTHVa2+TVkII9A7jxSxtnhi/moJ3VuDPeSLEI7CmAuv4+nI8cA+yJuJ9rbD
 HmkM50RK7OtcbpfGl7yO7G70iqQXghI+kCxd6YMUyMX3zMsqTki94uF51666ulBqyO
 4tqnTNcRIv7AIYoyqqlMsIxLK7Afs3PjMkJuijM/4P1sB9/yPYI6GwYQqxTyQ9kJg0
 ChpJO5TjiFqOqv1PlDEI8ei0MoF2Gm++iQ4ORtCLfGOhK9iaGZrwZnzWpbdyvq8f3N
 y3X7iK903Z+YpnBc/aZukH6fEWueypL6NfhNXHlCyKzcAuQcitGefOWfJzXDFo4LWJ
 yhGWtZOCiI2fA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 harry.wentland@amd.com, sunpeng.li@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 wenjing.liu@amd.com, hamza.mahfooz@amd.com, moadhuri@amd.com,
 dillon.varone@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 31/34] drm/amd/display: Fix null pointer deref in
 dcn20_resource.c
Date: Sun, 28 Jul 2024 11:40:55 -0400
Message-ID: <20240728154230.2046786-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728154230.2046786-1-sashal@kernel.org>
References: <20240728154230.2046786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: Aurabindo Pillai <aurabindo.pillai@amd.com>

[ Upstream commit ecbf60782662f0a388493685b85a645a0ba1613c ]

Fixes a hang thats triggered when MPV is run on a DCN401 dGPU:

mpv --hwdec=vaapi --vo=gpu --hwdec-codecs=all

and then enabling fullscreen playback (double click on the video)

The following calltrace will be seen:

[  181.843989] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  181.843997] #PF: supervisor instruction fetch in kernel mode
[  181.844003] #PF: error_code(0x0010) - not-present page
[  181.844009] PGD 0 P4D 0
[  181.844020] Oops: 0010 [#1] PREEMPT SMP NOPTI
[  181.844028] CPU: 6 PID: 1892 Comm: gnome-shell Tainted: G        W  OE      6.5.0-41-generic #41~22.04.2-Ubuntu
[  181.844038] Hardware name: System manufacturer System Product Name/CROSSHAIR VI HERO, BIOS 6302 10/23/2018
[  181.844044] RIP: 0010:0x0
[  181.844079] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[  181.844084] RSP: 0018:ffffb593c2b8f7b0 EFLAGS: 00010246
[  181.844093] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000004
[  181.844099] RDX: ffffb593c2b8f804 RSI: ffffb593c2b8f7e0 RDI: ffff9e3c8e758400
[  181.844105] RBP: ffffb593c2b8f7b8 R08: ffffb593c2b8f9c8 R09: ffffb593c2b8f96c
[  181.844110] R10: 0000000000000000 R11: 0000000000000000 R12: ffffb593c2b8f9c8
[  181.844115] R13: 0000000000000001 R14: ffff9e3c88000000 R15: 0000000000000005
[  181.844121] FS:  00007c6e323bb5c0(0000) GS:ffff9e3f85f80000(0000) knlGS:0000000000000000
[  181.844128] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  181.844134] CR2: ffffffffffffffd6 CR3: 0000000140fbe000 CR4: 00000000003506e0
[  181.844141] Call Trace:
[  181.844146]  <TASK>
[  181.844153]  ? show_regs+0x6d/0x80
[  181.844167]  ? __die+0x24/0x80
[  181.844179]  ? page_fault_oops+0x99/0x1b0
[  181.844192]  ? do_user_addr_fault+0x31d/0x6b0
[  181.844204]  ? exc_page_fault+0x83/0x1b0
[  181.844216]  ? asm_exc_page_fault+0x27/0x30
[  181.844237]  dcn20_get_dcc_compression_cap+0x23/0x30 [amdgpu]
[  181.845115]  amdgpu_dm_plane_validate_dcc.constprop.0+0xe5/0x180 [amdgpu]
[  181.845985]  amdgpu_dm_plane_fill_plane_buffer_attributes+0x300/0x580 [amdgpu]
[  181.846848]  fill_dc_plane_info_and_addr+0x258/0x350 [amdgpu]
[  181.847734]  fill_dc_plane_attributes+0x162/0x350 [amdgpu]
[  181.848748]  dm_update_plane_state.constprop.0+0x4e3/0x6b0 [amdgpu]
[  181.849791]  ? dm_update_plane_state.constprop.0+0x4e3/0x6b0 [amdgpu]
[  181.850840]  amdgpu_dm_atomic_check+0xdfe/0x1760 [amdgpu]

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/display/dc/resource/dcn20/dcn20_resource.c   | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
index 0a939437e19f1..6b380e037e3f8 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn20/dcn20_resource.c
@@ -2193,10 +2193,11 @@ bool dcn20_get_dcc_compression_cap(const struct dc *dc,
 		const struct dc_dcc_surface_param *input,
 		struct dc_surface_dcc_cap *output)
 {
-	return dc->res_pool->hubbub->funcs->get_dcc_compression_cap(
-			dc->res_pool->hubbub,
-			input,
-			output);
+	if (dc->res_pool->hubbub->funcs->get_dcc_compression_cap)
+		return dc->res_pool->hubbub->funcs->get_dcc_compression_cap(
+			dc->res_pool->hubbub, input, output);
+
+	return false;
 }
 
 static void dcn20_destroy_resource_pool(struct resource_pool **pool)
-- 
2.43.0


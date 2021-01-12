Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE922F2F72
	for <lists+amd-gfx@lfdr.de>; Tue, 12 Jan 2021 13:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BD789740;
	Tue, 12 Jan 2021 12:56:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC9489740;
 Tue, 12 Jan 2021 12:56:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48B7023332;
 Tue, 12 Jan 2021 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456189;
 bh=3XhID+lQXIbC7KEa0u5lBp9TJQnuiHMFLMIuY4elX3Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dIKWV/eEUIg0ydFVcW1xgYLyC9W7DhHmcQPvsErohxwhy1jsO+yB5LO5WRAFQ/B0v
 WIhxzZx9bluL2xwiwuiFUNxhobnCJ2S4OdVF9YYRwpM4jQ6c04rE2w/Te21WCs7q6V
 kpcp2e+u21OBzI+Ad5y+fWa7oNCw7u2O8PxayqNOcLPJ01IUR8Z7TyOiREc+In3DYO
 n/G83yYIqTzGHNwInHJM2yAiDhGn6oXyQdx/WhoyuKA29elbHkOdvIOa0OkIXDSDTA
 V0l9t+TNGrD2qOqtlJnDGc/URSsM2w3QMHRcyNtkNdP6j3tjZDC2TmoPm5l/wYbVoK
 0iMbNM+sdIElQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 41/51] drm/amd/display: fix sysfs
 amdgpu_current_backlight_pwm NULL pointer issue
Date: Tue, 12 Jan 2021 07:55:23 -0500
Message-Id: <20210112125534.70280-41-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125534.70280-1-sashal@kernel.org>
References: <20210112125534.70280-1-sashal@kernel.org>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Kevin Wang <kevin1.wang@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Kevin Wang <kevin1.wang@amd.com>

[ Upstream commit a7b5d9dd57298333e6e9f4c167f01385d922bbfb ]

fix NULL pointer issue when read sysfs amdgpu_current_backlight_pwm sysfs node.

Call Trace:
[  248.273833] BUG: kernel NULL pointer dereference, address: 0000000000000130
[  248.273930] #PF: supervisor read access in kernel mode
[  248.273993] #PF: error_code(0x0000) - not-present page
[  248.274054] PGD 0 P4D 0
[  248.274092] Oops: 0000 [#1] SMP PTI
[  248.274138] CPU: 2 PID: 1377 Comm: cat Tainted: G           OE     5.9.0-rc5-drm-next-5.9+ #1
[  248.274233] Hardware name: System manufacturer System Product Name/Z170-A, BIOS 3802 03/15/2018
[  248.274641] RIP: 0010:dc_link_get_backlight_level+0x5/0x70 [amdgpu]
[  248.274718] Code: 67 ff ff ff 41 b9 03 00 00 00 e9 45 ff ff ff d1 ea e9 55 ff ff ff 0f 1f 44 00 00 66 2e
0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 <48> 8b 87 30 01 00 00 48 8b 00 48 8b 88 88 03 00 00 48 8d 81 e8 01
[  248.274919] RSP: 0018:ffffb5ad809b3df0 EFLAGS: 00010203
[  248.274982] RAX: ffffa0f77d1c0010 RBX: ffffa0f793ae9168 RCX: 0000000000000001
[  248.275064] RDX: ffffa0f79753db00 RSI: 0000000000000001 RDI: 0000000000000000
[  248.275145] RBP: ffffb5ad809b3e00 R08: ffffb5ad809b3da0 R09: 0000000000000000
[  248.275225] R10: ffffb5ad809b3e68 R11: 0000000000000000 R12: ffffa0f793ae9190
[  248.275306] R13: ffffb5ad809b3ef0 R14: 0000000000000001 R15: ffffa0f793ae9168
[  248.275388] FS:  00007f5f1ec4d540(0000) GS:ffffa0f79ec80000(0000) knlGS:0000000000000000
[  248.275480] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  248.275547] CR2: 0000000000000130 CR3: 000000042a03c005 CR4: 00000000003706e0
[  248.275628] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[  248.275708] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[  248.275789] Call Trace:
[  248.276124]  ? current_backlight_read+0x24/0x40 [amdgpu]
[  248.276194]  seq_read+0xc3/0x3f0
[  248.276240]  full_proxy_read+0x5c/0x90
[  248.276290]  vfs_read+0xa7/0x190
[  248.276334]  ksys_read+0xa7/0xe0
[  248.276379]  __x64_sys_read+0x1a/0x20
[  248.276429]  do_syscall_64+0x37/0x80
[  248.276477]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  248.276538] RIP: 0033:0x7f5f1e75c191
[  248.276585] Code: fe ff ff 48 8d 3d b7 9d 0a 00 48 83 ec 08 e8 46 4d 02 00 66 0f 1f 44 00 00 48 8d 05 71 07
2e 00 8b 00 85 c0 75 13 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 57 f3 c3 0f 1f 44 00 00 41 54 55 49 89 d4 53Hw
[  248.276784] RSP: 002b:00007ffcb1fc3f38 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[  248.276872] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f5f1e75c191
[  248.276953] RDX: 0000000000020000 RSI: 00007f5f1ec2b000 RDI: 0000000000000003
[  248.277034] RBP: 0000000000020000 R08: 00000000ffffffff R09: 0000000000000000
[  248.277115] R10: 0000000000000022 R11: 0000000000000246 R12: 00007f5f1ec2b000
[  248.277195] R13: 0000000000000003 R14: 00007f5f1ec2b00f R15: 0000000000020000
[  248.277279] Modules linked in: amdgpu(OE) iommu_v2 gpu_sched ttm(OE) drm_kms_helper cec drm
i2c_algo_bit fb_sys_fops syscopyarea sysfillrect sysimgblt rpcsec_gss_krb5 auth_rpcgss nfsv4 nfs
lockd grace fscache nls_iso8859_1 snd_hda_codec_realtek snd_hda_codec_hdmi snd_hda_codec_generic
ledtrig_audio intel_rapl_msr intel_rapl_common snd_hda_intel snd_intel_dspcfg x86_pkg_temp_thermal
intel_powerclamp snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event mei_hdcp
coretemp snd_rawmidi snd_seq kvm_intel kvm snd_seq_device snd_timer irqbypass joydev snd input_leds soundcore
crct10dif_pclmul crc32_pclmul ghash_clmulni_intel aesni_intel crypto_simd cryptd glue_helper rapl intel_cstate
mac_hid mei_me serio_raw mei eeepc_wmi wmi_bmof asus_wmi mxm_wmi intel_wmi_thunderbolt acpi_pad sparse_keymap
efi_pstore sch_fq_codel parport_pc ppdev lp parport sunrpc ip_tables x_tables autofs4 hid_logitech_hidpp
hid_logitech_dj hid_generic usbhid hid e1000e psmouse ahci libahci wmi video
[  248.278211] CR2: 0000000000000130
[  248.278221] ---[ end trace 1fbe72fe6f91091d ]---
[  248.357226] RIP: 0010:dc_link_get_backlight_level+0x5/0x70 [amdgpu]
[  248.357272] Code: 67 ff ff ff 41 b9 03 00 00 00 e9 45 ff ff ff d1 ea e9 55 ff ff ff 0f 1f 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 <48> 8b 87 30 01 00 00 48 8b 00 48 8b 88 88 03 00 00 48 8d 81 e8 01

Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 5b0cedfa824a9..e1e5d81a5e438 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -2471,9 +2471,14 @@ enum dc_status dc_link_validate_mode_timing(
 static struct abm *get_abm_from_stream_res(const struct dc_link *link)
 {
 	int i;
-	struct dc *dc = link->ctx->dc;
+	struct dc *dc = NULL;
 	struct abm *abm = NULL;
 
+	if (!link || !link->ctx)
+		return NULL;
+
+	dc = link->ctx->dc;
+
 	for (i = 0; i < MAX_PIPES; i++) {
 		struct pipe_ctx pipe_ctx = dc->current_state->res_ctx.pipe_ctx[i];
 		struct dc_stream_state *stream = pipe_ctx.stream;
-- 
2.27.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

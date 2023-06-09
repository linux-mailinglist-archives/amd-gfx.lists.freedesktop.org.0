Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6D8729C24
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Jun 2023 16:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C9A10E054;
	Fri,  9 Jun 2023 14:04:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FFF10E054;
 Fri,  9 Jun 2023 14:03:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C5AB1FDF7;
 Fri,  9 Jun 2023 14:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686319438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2K5qIBxg8pLVO3ZFchLutStvegOnUM3eEMZ391+lJH8=;
 b=DGoL2PVxn9C4C4I5PLOJcY8dYMEOSZ0e7NNqWJ600x7GEHeJk9lCoKNoP6vK3tRxl5pvD9
 u9fCEQ2/ySZEZksfxV1dQxcqnGGCyfxhEbisHGrL1q/Y3NwL8MjnAZydPKFrMnIN5uMv6I
 FXkRw85xskqMIK3jiTdidbPBlPnuMFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686319438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2K5qIBxg8pLVO3ZFchLutStvegOnUM3eEMZ391+lJH8=;
 b=kE4S+CCS0vvOz22jDnd1k1lY3gQcMKoAFscZZv+xmiDo9aQHbA4pFYJFfk75pkaPEZfCu+
 ahZm2SC1DDeR/hBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07BCF139C8;
 Fri,  9 Jun 2023 14:03:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NizHAE4xg2RrZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 09 Jun 2023 14:03:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 bp@alien8.de, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: Disable outputs when releasing fbdev client
Date: Fri,  9 Jun 2023 16:03:56 +0200
Message-Id: <20230609140356.16846-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Disable the modesetting pipeline before release the radeon's fbdev
client. Fixes the following error:

[   17.217408] WARNING: CPU: 5 PID: 1464 at drivers/gpu/drm/ttm/ttm_bo.c:326 ttm_bo_release+0x27e/0x2d0 [ttm]
[   17.217418] Modules linked in: edac_mce_amd radeon(+) drm_ttm_helper ttm video drm_suballoc_helper drm_display_helper kvm irqbypass drm_kms_helper syscopyarea crc32_pclmul sysfillrect sha512_ssse3 sysimgblt sha512_generic cfbfillrect cfbimgblt wmi_bmof aesni_intel cfbcopyarea crypto_simd cryptd k10temp acpi_cpufreq wmi dm_mod
[   17.217432] CPU: 5 PID: 1464 Comm: systemd-udevd Not tainted 6.4.0-rc4+ #1
[   17.217436] Hardware name: Micro-Star International Co., Ltd. MS-7A38/B450M PRO-VDH MAX (MS-7A38), BIOS B.G0 07/26/2022
[   17.217438] RIP: 0010:ttm_bo_release+0x27e/0x2d0 [ttm]
[   17.217444] Code: 48 89 43 38 48 89 43 40 48 8b 5c 24 30 48 8b b5 40 08 00 00 48 8b 6c 24 38 48 83 c4 58 e9 7a 49 f7 e0 48 89 ef e9 6c fe ff ff <0f> 0b 48 83 7b 20 00 0f 84 b7 fd ff ff 0f 0b 0f 1f 00 e9 ad fd ff
[   17.217448] RSP: 0018:ffffc9000095fbb0 EFLAGS: 00010202
[   17.217451] RAX: 0000000000000001 RBX: ffff8881052c8de0 RCX: 0000000000000000
[   17.217453] RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8881052c8de0
[   17.217455] RBP: ffff888104a66e00 R08: ffff8881052c8de0 R09: ffff888104a7cf08
[   17.217457] R10: ffffc9000095fbe0 R11: ffffc9000095fbe8 R12: ffff8881052c8c78
[   17.217458] R13: ffff8881052c8c78 R14: dead000000000100 R15: ffff88810528b108
[   17.217460] FS:  00007f319fcbb8c0(0000) GS:ffff88881a540000(0000) knlGS:0000000000000000
[   17.217463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   17.217464] CR2: 000055dc8b0224a0 CR3: 000000010373d000 CR4: 0000000000750ee0
[   17.217466] PKRU: 55555554
[   17.217468] Call Trace:
[   17.217470]  <TASK>
[   17.217472]  ? __warn+0x97/0x160
[   17.217476]  ? ttm_bo_release+0x27e/0x2d0 [ttm]
[   17.217481]  ? report_bug+0x1ec/0x200
[   17.217487]  ? handle_bug+0x3c/0x70
[   17.217490]  ? exc_invalid_op+0x1f/0x90
[   17.217493]  ? preempt_count_sub+0xb5/0x100
[   17.217496]  ? asm_exc_invalid_op+0x16/0x20
[   17.217500]  ? ttm_bo_release+0x27e/0x2d0 [ttm]
[   17.217505]  ? ttm_resource_move_to_lru_tail+0x1ab/0x1d0 [ttm]
[   17.217511]  radeon_bo_unref+0x1a/0x30 [radeon]
[   17.217547]  radeon_gem_object_free+0x20/0x30 [radeon]
[   17.217579]  radeon_fbdev_fb_destroy+0x57/0x90 [radeon]
[   17.217616]  unregister_framebuffer+0x72/0x110
[   17.217620]  drm_client_dev_unregister+0x6d/0xe0
[   17.217623]  drm_dev_unregister+0x2e/0x90
[   17.217626]  drm_put_dev+0x26/0x90
[   17.217628]  pci_device_remove+0x44/0xc0
[   17.217631]  really_probe+0x257/0x340
[   17.217635]  __driver_probe_device+0x73/0x120
[   17.217638]  driver_probe_device+0x2c/0xb0
[   17.217641]  __driver_attach+0xa0/0x150
[   17.217643]  ? __pfx___driver_attach+0x10/0x10
[   17.217646]  bus_for_each_dev+0x67/0xa0
[   17.217649]  bus_add_driver+0x10e/0x210
[   17.217651]  driver_register+0x5c/0x120
[   17.217653]  ? __pfx_radeon_module_init+0x10/0x10 [radeon]
[   17.217681]  do_one_initcall+0x44/0x220
[   17.217684]  ? kmalloc_trace+0x37/0xc0
[   17.217688]  do_init_module+0x64/0x240
[   17.217691]  __do_sys_finit_module+0xb2/0x100
[   17.217694]  do_syscall_64+0x3b/0x90
[   17.217697]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[   17.217700] RIP: 0033:0x7f319feaa5a9
[   17.217702] Code: 08 89 e8 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 27 08 0d 00 f7 d8 64 89 01 48
[   17.217706] RSP: 002b:00007ffc6bf3e7f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   17.217709] RAX: ffffffffffffffda RBX: 00005607204f3170 RCX: 00007f319feaa5a9
[   17.217710] RDX: 0000000000000000 RSI: 00007f31a002eefd RDI: 0000000000000018
[   17.217712] RBP: 00007f31a002eefd R08: 0000000000000000 R09: 00005607204f1860
[   17.217714] R10: 0000000000000018 R11: 0000000000000246 R12: 0000000000020000
[   17.217716] R13: 0000000000000000 R14: 0000560720522450 R15: 0000560720255899
[   17.217718]  </TASK>
[   17.217719] ---[ end trace 0000000000000000 ]---

The buffer object backing the fbdev emulation got pinned twice: by the
fb_probe helper radeon_fbdev_create_pinned_object() and the modesetting
code when the framebuffer got displayed. It only got unpinned once by
the fbdev helper radeon_fbdev_destroy_pinned_object(). Hence TTM's BO-
release function complains about the pin counter. Forcing the outputs
off also undoes the modesettings pin increment.

Reported-by: Borislav Petkov <bp@alien8.de>
Closes: https://lore.kernel.org/dri-devel/20230603174814.GCZHt83pN+wNjf63sC@fat_crate.local/
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: e317a69fe891 ("drm/radeon: Implement client-based fbdev emulation")
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/radeon/radeon_fbdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
index 28212c2d6c98..ab9c1abbac97 100644
--- a/drivers/gpu/drm/radeon/radeon_fbdev.c
+++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
@@ -304,6 +304,7 @@ static void radeon_fbdev_client_unregister(struct drm_client_dev *client)
 
 	if (fb_helper->info) {
 		vga_switcheroo_client_fb_set(rdev->pdev, NULL);
+		drm_helper_force_disable_all(dev);
 		drm_fb_helper_unregister_info(fb_helper);
 	} else {
 		drm_client_release(&fb_helper->client);
-- 
2.40.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32457592E48
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Aug 2022 13:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98D197A14;
	Mon, 15 Aug 2022 11:40:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD882AC57;
 Mon, 15 Aug 2022 11:39:56 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4M5slJ0jsYzDqK1;
 Mon, 15 Aug 2022 11:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1660563596; bh=Ivqcw69hFHNcDctihAUBvHj1D0kLXqB98wgJ/RA5tWE=;
 h=From:To:Cc:Subject:Date:From;
 b=hKrothk0wjrhN77qvM5nwlFVUnPyBG6Gbz9tj2cPbPNlwTbeLgpbDKHll+fKJYuz2
 UruRzIjQdpkqLe+YoFeGrrqecsiNljTaXfjbnAJ43yAadII+ppcHhoNaNOYz410+Qt
 NJxrcGf7fQjCE75hcS7puQXfHehhuzau4/9Hxyog=
X-Riseup-User-ID: 5C95B1E76654EB79FDDDDCF7BCA1D906FA5A58BFC84BF5DDBD905CEDE6B5A695
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4M5slD0M1kz5vXT;
 Mon, 15 Aug 2022 11:39:51 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdgpu: Fix use-after-free on amdgpu_bo_list mutex
Date: Mon, 15 Aug 2022 08:39:31 -0300
Message-Id: <20220815113931.53226-1-mairacanal@riseup.net>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mwen@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 amd-gfx@lists.freedesktop.org, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

If amdgpu_cs_vm_handling returns r != 0, then it will unlock the
bo_list_mutex inside the function amdgpu_cs_vm_handling and again on
amdgpu_cs_parser_fini. This problem results in the following
use-after-free problem:

[ 220.280990] ------------[ cut here ]------------
[ 220.281000] refcount_t: underflow; use-after-free.
[ 220.281019] WARNING: CPU: 1 PID: 3746 at lib/refcount.c:28 refcount_warn_saturate+0xba/0x110
[ 220.281029] ------------[ cut here ]------------
[ 220.281415] CPU: 1 PID: 3746 Comm: chrome:cs0 Tainted: G W L ------- --- 5.20.0-0.rc0.20220812git7ebfc85e2cd7.10.fc38.x86_64 #1
[ 220.281421] Hardware name: System manufacturer System Product Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
[ 220.281426] RIP: 0010:refcount_warn_saturate+0xba/0x110
[ 220.281431] Code: 01 01 e8 79 4a 6f 00 0f 0b e9 42 47 a5 00 80 3d de
7e be 01 00 75 85 48 c7 c7 f8 98 8e 98 c6 05 ce 7e be 01 01 e8 56 4a
6f 00 <0f> 0b e9 1f 47 a5 00 80 3d b9 7e be 01 00 0f 85 5e ff ff ff 48
c7
[ 220.281437] RSP: 0018:ffffb4b0d18d7a80 EFLAGS: 00010282
[ 220.281443] RAX: 0000000000000026 RBX: 0000000000000003 RCX: 0000000000000000
[ 220.281448] RDX: 0000000000000001 RSI: ffffffff988d06dc RDI: 00000000ffffffff
[ 220.281452] RBP: 00000000ffffffff R08: 0000000000000000 R09: ffffb4b0d18d7930
[ 220.281457] R10: 0000000000000003 R11: ffffa0672e2fffe8 R12: ffffa058ca360400
[ 220.281461] R13: ffffa05846c50a18 R14: 00000000fffffe00 R15: 0000000000000003
[ 220.281465] FS: 00007f82683e06c0(0000) GS:ffffa066e2e00000(0000) knlGS:0000000000000000
[ 220.281470] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 220.281475] CR2: 00003590005cc000 CR3: 00000001fca46000 CR4: 0000000000350ee0
[ 220.281480] Call Trace:
[ 220.281485] <TASK>
[ 220.281490] amdgpu_cs_ioctl+0x4e2/0x2070 [amdgpu]
[ 220.281806] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
[ 220.282028] drm_ioctl_kernel+0xa4/0x150
[ 220.282043] drm_ioctl+0x21f/0x420
[ 220.282053] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
[ 220.282275] ? lock_release+0x14f/0x460
[ 220.282282] ? _raw_spin_unlock_irqrestore+0x30/0x60
[ 220.282290] ? _raw_spin_unlock_irqrestore+0x30/0x60
[ 220.282297] ? lockdep_hardirqs_on+0x7d/0x100
[ 220.282305] ? _raw_spin_unlock_irqrestore+0x40/0x60
[ 220.282317] amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
[ 220.282534] __x64_sys_ioctl+0x90/0xd0
[ 220.282545] do_syscall_64+0x5b/0x80
[ 220.282551] ? futex_wake+0x6c/0x150
[ 220.282568] ? lock_is_held_type+0xe8/0x140
[ 220.282580] ? do_syscall_64+0x67/0x80
[ 220.282585] ? lockdep_hardirqs_on+0x7d/0x100
[ 220.282592] ? do_syscall_64+0x67/0x80
[ 220.282597] ? do_syscall_64+0x67/0x80
[ 220.282602] ? lockdep_hardirqs_on+0x7d/0x100
[ 220.282609] entry_SYSCALL_64_after_hwframe+0x63/0xcd
[ 220.282616] RIP: 0033:0x7f8282a4f8bf
[ 220.282639] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
00
[ 220.282644] RSP: 002b:00007f82683df410 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[ 220.282651] RAX: ffffffffffffffda RBX: 00007f82683df588 RCX: 00007f8282a4f8bf
[ 220.282655] RDX: 00007f82683df4d0 RSI: 00000000c0186444 RDI: 0000000000000018
[ 220.282659] RBP: 00007f82683df4d0 R08: 00007f82683df5e0 R09: 00007f82683df4b0
[ 220.282663] R10: 00001d04000a0600 R11: 0000000000000246 R12: 00000000c0186444
[ 220.282667] R13: 0000000000000018 R14: 00007f82683df588 R15: 0000000000000003
[ 220.282689] </TASK>
[ 220.282693] irq event stamp: 6232311
[ 220.282697] hardirqs last enabled at (6232319): [<ffffffff9718cd7e>] __up_console_sem+0x5e/0x70
[ 220.282704] hardirqs last disabled at (6232326): [<ffffffff9718cd63>] __up_console_sem+0x43/0x70
[ 220.282709] softirqs last enabled at (6232072): [<ffffffff970ff669>] __irq_exit_rcu+0xf9/0x170
[ 220.282716] softirqs last disabled at (6232061): [<ffffffff970ff669>] __irq_exit_rcu+0xf9/0x170
[ 220.282722] ---[ end trace 0000000000000000 ]---

Therefore, remove the mutex_unlock from the amdgpu_cs_vm_handling
function, so that amdgpu_cs_submit and amdgpu_cs_parser_fini can handle
the unlock.

Fixes: 90af0ca047f3 ("drm/amdgpu: Protect the amdgpu_bo_list list with a mutex v2")
Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
Thanks Melissa and Christian for the feedback on mutex_unlock.
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d8f1335bc68f..b7bae833c804 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -837,16 +837,12 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			continue;
 
 		r = amdgpu_vm_bo_update(adev, bo_va, false);
-		if (r) {
-			mutex_unlock(&p->bo_list->bo_list_mutex);
+		if (r)
 			return r;
-		}
 
 		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
-		if (r) {
-			mutex_unlock(&p->bo_list->bo_list_mutex);
+		if (r)
 			return r;
-		}
 	}
 
 	r = amdgpu_vm_handle_moved(adev, vm);
-- 
2.37.2


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DE1897638
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Apr 2024 19:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB594112DD5;
	Wed,  3 Apr 2024 17:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="T8Tz3moS";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF38112DCE;
 Wed,  3 Apr 2024 17:18:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8748E61387;
 Wed,  3 Apr 2024 17:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D93C433F1;
 Wed,  3 Apr 2024 17:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712164736;
 bh=TyMGtHSLj2QIfBWLxoiQSRp9ctx1hgIzhP7C3KwDGm8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T8Tz3moSHjlEKXCOzcUOcbnwbBa3QPkx6vxAJrSIqYlYn/NL0z0LTOzxESc2hti7h
 7yOK37jbv6owptE7ZGU0YkWdvQFzud/oBF76wNB2BtiNRKeJKKodLFTTsOffTru9Uk
 kpJaP93SuXqM9Eju3xpkusAe6Lou9xjovmsDzzBnnEmXhzqe03I0ilVOEpv3MWn/sU
 2rAOEMxMtKklrB51Rp+ierSMeGjBWVg5Q/uGhn8I4yB25Q4s1T4B4fR4iMNYp5x9vN
 /d7GIbGiiD+Yu8BrF860AREhGiIUpsSAMOZKCDFU2VZLQ2wYhjB7DD0LxrKJwKkc+F
 qwbrBlL60qFmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Dokyung Song <dokyungs@yonsei.ac.kr>,
 jisoo.jang@yonsei.ac.kr, yw9865@yonsei.ac.kr,
 Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Felix.Kuehling@amd.com, James.Zhu@amd.com,
 Philip.Yang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 20/20] drm/amdgpu: fix use-after-free bug
Date: Wed,  3 Apr 2024 13:18:01 -0400
Message-ID: <20240403171815.342668-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240403171815.342668-1-sashal@kernel.org>
References: <20240403171815.342668-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.24
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

[ Upstream commit 22207fd5c80177b860279653d017474b2812af5e ]

The bug can be triggered by sending a single amdgpu_gem_userptr_ioctl
to the AMDGPU DRM driver on any ASICs with an invalid address and size.
The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
For example the following code:

static void Syzkaller1(int fd)
{
	struct drm_amdgpu_gem_userptr arg;
	int ret;

	arg.addr = 0xffffffffffff0000;
	arg.size = 0x80000000; /*2 Gb*/
	arg.flags = 0x7;
	ret = drmIoctl(fd, 0xc1186451/*amdgpu_gem_userptr_ioctl*/, &arg);
}

Due to the address and size are not valid there is a failure in
amdgpu_hmm_register->mmu_interval_notifier_insert->__mmu_interval_notifier_insert->
check_shl_overflow, but we even the amdgpu_hmm_register failure we still call
amdgpu_hmm_unregister into  amdgpu_gem_object_free which causes access to a bad address.
The following stack is below when the issue is reproduced when Kazan is enabled:

[  +0.000014] Hardware name: ASUS System Product Name/ROG STRIX B550-F GAMING (WI-FI), BIOS 1401 12/03/2020
[  +0.000009] RIP: 0010:mmu_interval_notifier_remove+0x327/0x340
[  +0.000017] Code: ff ff 49 89 44 24 08 48 b8 00 01 00 00 00 00 ad de 4c 89 f7 49 89 47 40 48 83 c0 22 49 89 47 48 e8 ce d1 2d 01 e9 32 ff ff ff <0f> 0b e9 16 ff ff ff 4c 89 ef e8 fa 14 b3 ff e9 36 ff ff ff e8 80
[  +0.000014] RSP: 0018:ffffc90002657988 EFLAGS: 00010246
[  +0.000013] RAX: 0000000000000000 RBX: 1ffff920004caf35 RCX: ffffffff8160565b
[  +0.000011] RDX: dffffc0000000000 RSI: 0000000000000004 RDI: ffff8881a9f78260
[  +0.000010] RBP: ffffc90002657a70 R08: 0000000000000001 R09: fffff520004caf25
[  +0.000010] R10: 0000000000000003 R11: ffffffff8161d1d6 R12: ffff88810e988c00
[  +0.000010] R13: ffff888126fb5a00 R14: ffff88810e988c0c R15: ffff8881a9f78260
[  +0.000011] FS:  00007ff9ec848540(0000) GS:ffff8883cc880000(0000) knlGS:0000000000000000
[  +0.000012] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000010] CR2: 000055b3f7e14328 CR3: 00000001b5770000 CR4: 0000000000350ef0
[  +0.000010] Call Trace:
[  +0.000006]  <TASK>
[  +0.000007]  ? show_regs+0x6a/0x80
[  +0.000018]  ? __warn+0xa5/0x1b0
[  +0.000019]  ? mmu_interval_notifier_remove+0x327/0x340
[  +0.000018]  ? report_bug+0x24a/0x290
[  +0.000022]  ? handle_bug+0x46/0x90
[  +0.000015]  ? exc_invalid_op+0x19/0x50
[  +0.000016]  ? asm_exc_invalid_op+0x1b/0x20
[  +0.000017]  ? kasan_save_stack+0x26/0x50
[  +0.000017]  ? mmu_interval_notifier_remove+0x23b/0x340
[  +0.000019]  ? mmu_interval_notifier_remove+0x327/0x340
[  +0.000019]  ? mmu_interval_notifier_remove+0x23b/0x340
[  +0.000020]  ? __pfx_mmu_interval_notifier_remove+0x10/0x10
[  +0.000017]  ? kasan_save_alloc_info+0x1e/0x30
[  +0.000018]  ? srso_return_thunk+0x5/0x5f
[  +0.000014]  ? __kasan_kmalloc+0xb1/0xc0
[  +0.000018]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __kasan_check_read+0x11/0x20
[  +0.000020]  amdgpu_hmm_unregister+0x34/0x50 [amdgpu]
[  +0.004695]  amdgpu_gem_object_free+0x66/0xa0 [amdgpu]
[  +0.004534]  ? __pfx_amdgpu_gem_object_free+0x10/0x10 [amdgpu]
[  +0.004291]  ? do_syscall_64+0x5f/0xe0
[  +0.000023]  ? srso_return_thunk+0x5/0x5f
[  +0.000017]  drm_gem_object_free+0x3b/0x50 [drm]
[  +0.000489]  amdgpu_gem_userptr_ioctl+0x306/0x500 [amdgpu]
[  +0.004295]  ? __pfx_amdgpu_gem_userptr_ioctl+0x10/0x10 [amdgpu]
[  +0.004270]  ? srso_return_thunk+0x5/0x5f
[  +0.000014]  ? __this_cpu_preempt_check+0x13/0x20
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? sysvec_apic_timer_interrupt+0x57/0xc0
[  +0.000020]  ? srso_return_thunk+0x5/0x5f
[  +0.000014]  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
[  +0.000022]  ? drm_ioctl_kernel+0x17b/0x1f0 [drm]
[  +0.000496]  ? __pfx_amdgpu_gem_userptr_ioctl+0x10/0x10 [amdgpu]
[  +0.004272]  ? drm_ioctl_kernel+0x190/0x1f0 [drm]
[  +0.000492]  drm_ioctl_kernel+0x140/0x1f0 [drm]
[  +0.000497]  ? __pfx_amdgpu_gem_userptr_ioctl+0x10/0x10 [amdgpu]
[  +0.004297]  ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
[  +0.000489]  ? srso_return_thunk+0x5/0x5f
[  +0.000011]  ? __kasan_check_write+0x14/0x20
[  +0.000016]  drm_ioctl+0x3da/0x730 [drm]
[  +0.000475]  ? __pfx_amdgpu_gem_userptr_ioctl+0x10/0x10 [amdgpu]
[  +0.004293]  ? __pfx_drm_ioctl+0x10/0x10 [drm]
[  +0.000506]  ? __pfx_rpm_resume+0x10/0x10
[  +0.000016]  ? srso_return_thunk+0x5/0x5f
[  +0.000011]  ? __kasan_check_write+0x14/0x20
[  +0.000010]  ? srso_return_thunk+0x5/0x5f
[  +0.000011]  ? _raw_spin_lock_irqsave+0x99/0x100
[  +0.000015]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? srso_return_thunk+0x5/0x5f
[  +0.000011]  ? srso_return_thunk+0x5/0x5f
[  +0.000011]  ? preempt_count_sub+0x18/0xc0
[  +0.000013]  ? srso_return_thunk+0x5/0x5f
[  +0.000010]  ? _raw_spin_unlock_irqrestore+0x27/0x50
[  +0.000019]  amdgpu_drm_ioctl+0x7e/0xe0 [amdgpu]
[  +0.004272]  __x64_sys_ioctl+0xcd/0x110
[  +0.000020]  do_syscall_64+0x5f/0xe0
[  +0.000021]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  +0.000015] RIP: 0033:0x7ff9ed31a94f
[  +0.000012] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
[  +0.000013] RSP: 002b:00007fff25f66790 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[  +0.000016] RAX: ffffffffffffffda RBX: 000055b3f7e133e0 RCX: 00007ff9ed31a94f
[  +0.000012] RDX: 000055b3f7e133e0 RSI: 00000000c1186451 RDI: 0000000000000003
[  +0.000010] RBP: 00000000c1186451 R08: 0000000000000000 R09: 0000000000000000
[  +0.000009] R10: 0000000000000008 R11: 0000000000000246 R12: 00007fff25f66ca8
[  +0.000009] R13: 0000000000000003 R14: 000055b3f7021ba8 R15: 00007ff9ed7af040
[  +0.000024]  </TASK>
[  +0.000007] ---[ end trace 0000000000000000 ]---

v2: Consolidate any error handling into amdgpu_hmm_register
    which applied to kfd_bo also. (Christian)
v3: Improve syntax and comment (Christian)

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Felix Kuehling <felix.kuehling@amd.com>
Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
Cc: Dokyung Song <dokyungs@yonsei.ac.kr>
Cc: <jisoo.jang@yonsei.ac.kr>
Cc: <yw9865@yonsei.ac.kr>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
index 081267161d401..57516a8c5db34 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
@@ -129,13 +129,25 @@ static const struct mmu_interval_notifier_ops amdgpu_hmm_hsa_ops = {
  */
 int amdgpu_hmm_register(struct amdgpu_bo *bo, unsigned long addr)
 {
+	int r;
+
 	if (bo->kfd_bo)
-		return mmu_interval_notifier_insert(&bo->notifier, current->mm,
+		r = mmu_interval_notifier_insert(&bo->notifier, current->mm,
 						    addr, amdgpu_bo_size(bo),
 						    &amdgpu_hmm_hsa_ops);
-	return mmu_interval_notifier_insert(&bo->notifier, current->mm, addr,
-					    amdgpu_bo_size(bo),
-					    &amdgpu_hmm_gfx_ops);
+	else
+		r = mmu_interval_notifier_insert(&bo->notifier, current->mm, addr,
+							amdgpu_bo_size(bo),
+							&amdgpu_hmm_gfx_ops);
+	if (r)
+		/*
+		 * Make sure amdgpu_hmm_unregister() doesn't call
+		 * mmu_interval_notifier_remove() when the notifier isn't properly
+		 * initialized.
+		 */
+		bo->notifier.mm = NULL;
+
+	return r;
 }
 
 /**
-- 
2.43.0


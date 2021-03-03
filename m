Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BAF32B85E
	for <lists+amd-gfx@lfdr.de>; Wed,  3 Mar 2021 14:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D06166E990;
	Wed,  3 Mar 2021 13:52:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 319 seconds by postgrey-1.36 at gabe;
 Wed, 03 Mar 2021 13:48:20 UTC
Received: from node0.talpidae.net (mail.talpidae.net [176.9.32.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F88289EB1
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Mar 2021 13:48:20 +0000 (UTC)
Received: from talpidae.net (localhost [127.0.0.1])
 by node0.talpidae.net (mail.talpidae.net) with ESMTP id 7C9441475C3
 for <amd-gfx@lists.freedesktop.org>; Wed,  3 Mar 2021 14:42:59 +0100 (CET)
MIME-Version: 1.0
Date: Wed, 03 Mar 2021 14:42:57 +0100
From: Jonas Zeiger <jonas.zeiger@talpidae.net>
To: amd-gfx@lists.freedesktop.org
Subject: AMDGPU Linux 5.11.0 freezes (divide error)
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <84c1be4bb2e60dd8e19256dd51945ca2@talpidae.net>
X-Sender: jonas.zeiger@talpidae.net
Organization: talpidae.net
X-Mailman-Approved-At: Wed, 03 Mar 2021 13:52:11 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi all,

I am experiencing random system freezes (about once per day) after updating to Linux 5.11 (vanilla kernel).

Only a manual power-cycle makes the system usable again afterwards.

These freezes didn't occur on 5.10.x but I hadn't assigned "nohz_full=2-16" and "cpuidle.governor=teo" back then.

Hardware:

ThinkPad T14 (gen1)
CPU: AMD Ryzen 7 PRO 4750U with Radeon Graphics

Kernel cmdline:

BOOT_IMAGE=/vmlinuz-5.11.0zlinux-svr-docker-wg root=/dev/nvme0n1p2 ro nohz_full=2-16 cpuidle.governor=teo rootfstype=ext4 rootwait ivrs_ioapic[4]=00:14.0 ivrs_ioapic[5]=00:00.2

This is logged to the journal:

kernel: divide error: 0000 [#1] PREEMPT SMP
kernel: CPU: 8 PID: 2914 Comm: Xorg Not tainted 5.11.0zlinux-svr-docker-wg #8
kernel: Hardware name: LENOVO 20UD0013GE/20UD0013GE, BIOS R1BET58W(1.27 ) 10/20/2020
kernel: RIP: 0010:Calculate256BBlockSizes+0x50/0xc1 [amdgpu]
kernel: Code: 83 ff 02 75 09 41 c7 00 04 00 00 00 eb 15 83 ff 08 75 09 41 c7 00 10 00 00 00 eb 07 4>
kernel: RSP: 0018:ffffa35e815fb688 EFLAGS: 00010246
kernel: RAX: 0000000000000100 RBX: ffff98afc1debaf8 RCX: 0000000000000000
kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000001
kernel: RBP: ffff98afc1de2090 R08: ffff98afc1debab8 R09: ffff98afc1debad8
kernel: R10: 0000000000000002 R11: ffff98afc1debb18 R12: ffff98a8d9ddd000
kernel: R13: 0000000000000000 R14: ffff98afc1de31c8 R15: ffff98afc1de2090
kernel: FS:  00007f41f3ff0a40(0000) GS:ffff98b35fa00000(0000) knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 00007f0486175000 CR3: 0000000116542000 CR4: 0000000000350ee0
kernel: Call Trace:
kernel:  DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation+0xdb8/0x>
kernel:  ? ModeSupportAndSystemConfiguration+0x77/0xe7 [amdgpu]
kernel:  ? dcn_bw_ceil2+0x19/0x3b [amdgpu]
kernel:  ? dml21_recalculate+0x59c/0x5b3 [amdgpu]
kernel:  get_wm_urgent+0x9/0x13 [amdgpu]
kernel:  dml21_rq_dlg_get_dlg_reg+0x6c/0x1804 [amdgpu]
kernel:  ? dcn_bw_ceil2+0x19/0x3b [amdgpu]
kernel:  ? DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation+0x3e06>
kernel:  dcn20_calculate_dlg_params+0x333/0x3af [amdgpu]
kernel:  dcn21_validate_bandwidth+0x4cd/0x581 [amdgpu]
kernel:  dc_validate_global_state+0x1a7/0x1c5 [amdgpu]
kernel:  amdgpu_dm_atomic_check+0x84c/0xa00 [amdgpu]
kernel:  ? __radix_tree_lookup+0x2a/0x91
kernel:  drm_atomic_check_only+0x5bb/0x6b7
kernel:  ? drm_mode_object_put+0x21/0x2d
kernel:  ? drm_atomic_set_property+0x7b3/0x7c5
kernel:  drm_atomic_commit+0xe/0x44
kernel:  drm_mode_obj_set_property_ioctl+0x112/0x268
kernel:  ? __fpu__restore_sig+0x21e/0x46d
kernel:  ? drm_mode_obj_find_prop_id+0x23/0x23
kernel:  drm_ioctl_kernel+0x7d/0xbc
kernel:  drm_ioctl+0x1f2/0x2c9
kernel:  ? drm_mode_obj_find_prop_id+0x23/0x23
kernel:  ? rpm_resume+0x43e/0x450
kernel:  amdgpu_drm_ioctl+0x45/0x71 [amdgpu]
kernel:  vfs_ioctl+0x1a/0x28
kernel:  __do_sys_ioctl+0x51/0x74
kernel:  do_syscall_64+0x33/0x40
kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
kernel: RIP: 0033:0x7f41f445bcc7
kernel: Code: 00 00 00 48 8b 05 c9 91 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1>
kernel: RSP: 002b:00007ffd7b9f4db8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
kernel: RAX: ffffffffffffffda RBX: 00007ffd7b9f4df0 RCX: 00007f41f445bcc7
kernel: RDX: 00007ffd7b9f4df0 RSI: 00000000c01864ba RDI: 000000000000000f
kernel: RBP: 00000000c01864ba R08: 0000000000000073 R09: 00000000cccccccc
kernel: R10: 0000000000000fff R11: 0000000000000246 R12: 0000561f30685480
kernel: R13: 000000000000000f R14: 0000000000000000 R15: 0000000000000003
kernel: Modules linked in: iwlmvm iwlwifi amdgpu drm_ttm_helper ttm mfd_core gpu_sched r8169
kernel: ---[ end trace 7e898fd18a4b26cd ]---
kernel: ------------[ cut here ]------------
kernel: WARNING: CPU: 8 PID: 2914 at rcu_note_context_switch+0x3a/0x2d5
kernel: Modules linked in: iwlmvm iwlwifi amdgpu drm_ttm_helper ttm mfd_core gpu_sched r8169
kernel: CPU: 8 PID: 2914 Comm: Xorg Tainted: G      D           5.11.0zlinux-svr-docker-wg #8
kernel: Hardware name: LENOVO 20UD0013GE/20UD0013GE, BIOS R1BET58W(1.27 ) 10/20/2020
kernel: RIP: 0010:rcu_note_context_switch+0x3a/0x2d5
kernel: Code: 40 65 02 00 55 53 89 fb 65 4c 03 25 ff cb ed 68 48 8b 3d c8 af b0 01 e8 3d cd ff ff 8>
kernel: RSP: 0018:ffffa35e815fb160 EFLAGS: 00010002
kernel: RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000002
kernel: RDX: 0000000000000002 RSI: ffffa35e815fb230 RDI: ffffffff9884fce6
kernel: RBP: ffffa35e815fb1c0 R08: ffffffff9884fce6 R09: ffff98a880060020
kernel: R10: ffff98a880060000 R11: ffffa35e815fb37b R12: ffff98b35fa26540
kernel: R13: ffff98a884cf6900 R14: 0000000000000000 R15: ffffffff97ac8616
kernel: FS:  00007f41f3ff0a40(0000) GS:ffff98b35fa00000(0000) knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 00007f0486175000 CR3: 0000000116542000 CR4: 0000000000350ee0
kernel: Call Trace:
kernel:  __schedule+0x87/0x522
kernel:  ? __default_send_IPI_dest_field+0x1c/0x44
kernel:  ? usleep_range+0x4f/0x4f
kernel:  schedule+0x81/0xa7
kernel:  schedule_timeout+0x1c/0xb4
kernel:  ? try_to_wake_up+0x1ba/0x1e8
kernel:  __wait_for_common+0xaa/0x10a
kernel:  virt_efi_query_variable_info+0xff/0x135
kernel:  efi_query_variable_store+0x7e/0x166
kernel:  efivar_entry_set_safe+0x148/0x1b5
kernel:  efi_pstore_write+0xdc/0x10c
kernel:  pstore_dump+0x1f5/0x239
kernel:  kmsg_dump+0x8b/0xa0
kernel:  oops_end+0x3d/0x8d
kernel:  do_trap+0x77/0xf6
kernel:  ? Calculate256BBlockSizes+0x50/0xc1 [amdgpu]
kernel:  ? Calculate256BBlockSizes+0x50/0xc1 [amdgpu]
kernel:  do_error_trap+0x6a/0x90
kernel:  ? dcn_bw_ceil2+0x19/0x3b [amdgpu]
kernel:  ? dml21_recalculate+0x59c/0x5b3 [amdgpu]
kernel:  get_wm_urgent+0x9/0x13 [amdgpu]
kernel:  dml21_rq_dlg_get_dlg_reg+0x6c/0x1804 [amdgpu]
kernel:  ? dcn_bw_ceil2+0x19/0x3b [amdgpu]
kernel:  ? DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation+0x3e06/0x3eba [amdgpu]
kernel:  dcn20_calculate_dlg_params+0x333/0x3af [amdgpu]
kernel:  dcn21_validate_bandwidth+0x4cd/0x581 [amdgpu]
kernel:  dc_validate_global_state+0x1a7/0x1c5 [amdgpu]
kernel:  amdgpu_dm_atomic_check+0x84c/0xa00 [amdgpu]
kernel:  ? __radix_tree_lookup+0x2a/0x91
kernel:  drm_atomic_check_only+0x5bb/0x6b7
kernel:  ? drm_mode_object_put+0x21/0x2d
kernel:  ? drm_atomic_set_property+0x7b3/0x7c5
kernel:  drm_atomic_commit+0xe/0x44
kernel:  drm_mode_obj_set_property_ioctl+0x112/0x268
kernel:  ? __fpu__restore_sig+0x21e/0x46d
kernel:  ? drm_mode_obj_find_prop_id+0x23/0x23
kernel:  drm_ioctl_kernel+0x7d/0xbc
kernel:  drm_ioctl+0x1f2/0x2c9
kernel:  ? drm_mode_obj_find_prop_id+0x23/0x23
kernel:  ? rpm_resume+0x43e/0x450
kernel:  amdgpu_drm_ioctl+0x45/0x71 [amdgpu]
kernel:  vfs_ioctl+0x1a/0x28
kernel:  __do_sys_ioctl+0x51/0x74
kernel:  do_syscall_64+0x33/0x40
kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xa9
kernel: RIP: 0033:0x7f41f445bcc7
kernel: Code: 00 00 00 48 8b 05 c9 91 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 99 91 0c 00 f7 d8 64 89 01 48
kernel: RSP: 002b:00007ffd7b9f4db8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
kernel: RAX: ffffffffffffffda RBX: 00007ffd7b9f4df0 RCX: 00007f41f445bcc7
kernel: RDX: 00007ffd7b9f4df0 RSI: 00000000c01864ba RDI: 000000000000000f
kernel: RBP: 00000000c01864ba R08: 0000000000000073 R09: 00000000cccccccc
kernel: R10: 0000000000000fff R11: 0000000000000246 R12: 0000561f30685480
kernel: R13: 000000000000000f R14: 0000000000000000 R15: 0000000000000003
kernel: ---[ end trace 7e898fd18a4b26ce ]---
kernel: RIP: 0010:Calculate256BBlockSizes+0x50/0xc1 [amdgpu]
kernel: Code: 83 ff 02 75 09 41 c7 00 04 00 00 00 eb 15 83 ff 08 75 09 41 c7 00 10 00 00 00 eb 07 41 c7 00 08 00 00 00 b8 00 01 00 00 31 d2 <f7> f6 31 d2 41 f7 30 89 03 41 c7 01 00 00 00 00 41 c7 03 00 00 00
kernel: RSP: 0018:ffffa35e815fb688 EFLAGS: 00010246
kernel: RAX: 0000000000000100 RBX: ffff98afc1debaf8 RCX: 0000000000000000
kernel: RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000001
kernel: RBP: ffff98afc1de2090 R08: ffff98afc1debab8 R09: ffff98afc1debad8
kernel: R10: 0000000000000002 R11: ffff98afc1debb18 R12: ffff98a8d9ddd000
kernel: R13: 0000000000000000 R14: ffff98afc1de31c8 R15: ffff98afc1de2090
kernel: FS:  00007f41f3ff0a40(0000) GS:ffff98b35fb80000(0000) knlGS:0000000000000000
kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: CR2: 00007f79e14ed000 CR3: 0000000116542000 CR4: 0000000000350ee0

Feel free to contact me if you think I can help narrow down this issue.

Thank you for your great work on the AMDGPU driver and Linux kernel.

Kind regards,
Jonas Zeiger
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

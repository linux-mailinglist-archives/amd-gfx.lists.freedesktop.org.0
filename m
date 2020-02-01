Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7514F91F
	for <lists+amd-gfx@lfdr.de>; Sat,  1 Feb 2020 18:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548D36E0F2;
	Sat,  1 Feb 2020 17:11:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Sat, 01 Feb 2020 04:37:50 UTC
Received: from r3-22.sinamail.sina.com.cn (r3-22.sinamail.sina.com.cn
 [202.108.3.22])
 by gabe.freedesktop.org (Postfix) with SMTP id 0E3236E2E6
 for <amd-gfx@lists.freedesktop.org>; Sat,  1 Feb 2020 04:37:49 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.3.106])
 by sina.com with ESMTP
 id 5E34FF530000FF7A; Sat, 1 Feb 2020 12:32:24 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 304770628802
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com>
Subject: Re: KASAN: use-after-free Read in vgem_gem_dumb_create
Date: Sat,  1 Feb 2020 12:32:09 +0800
Message-Id: <20200201043209.13412-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 01 Feb 2020 17:11:52 +0000
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
Cc: robdclark@chromium.org, Hillf Danton <hdanton@sina.com>,
 davem@davemloft.net, airlied@linux.ie, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 linaro-mm-sig@lists.linaro.org, eric@anholt.net, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>


Fri, 31 Jan 2020 14:28:10 -0800 (PST)
> syzbot found the following crash on:
> 
> HEAD commit:    39bed42d Merge tag 'for-linus-hmm' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=179465bee00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2646535f8818ae25
> dashboard link: https://syzkaller.appspot.com/bug?extid=0dc4444774d419e916c8
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16251279e00000
> 
> The bug was bisected to:
> 
> commit 7611750784664db46d0db95631e322aeb263dde7
> Author: Alex Deucher <alexander.deucher@amd.com>
> Date:   Wed Jun 21 16:31:41 2017 +0000
> 
>     drm/amdgpu: use kernel is_power_of_2 rather than local version
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11628df1e00000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=13628df1e00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=15628df1e00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com
> Fixes: 761175078466 ("drm/amdgpu: use kernel is_power_of_2 rather than local version")
> 
> ==================================================================
> BUG: KASAN: use-after-free in vgem_gem_dumb_create+0x238/0x250 drivers/gpu/drm/vgem/vgem_drv.c:221
> Read of size 8 at addr ffff88809fa67908 by task syz-executor.0/14871
> 
> CPU: 0 PID: 14871 Comm: syz-executor.0 Not tainted 5.5.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x197/0x210 lib/dump_stack.c:118
>  print_address_description.constprop.0.cold+0xd4/0x30b mm/kasan/report.c:374
>  __kasan_report.cold+0x1b/0x32 mm/kasan/report.c:506
>  kasan_report+0x12/0x20 mm/kasan/common.c:639
>  __asan_report_load8_noabort+0x14/0x20 mm/kasan/generic_report.c:135
>  vgem_gem_dumb_create+0x238/0x250 drivers/gpu/drm/vgem/vgem_drv.c:221
>  drm_mode_create_dumb+0x282/0x310 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_mode_create_dumb_ioctl+0x26/0x30 drivers/gpu/drm/drm_dumb_buffers.c:100
>  drm_ioctl_kernel+0x244/0x300 drivers/gpu/drm/drm_ioctl.c:786
>  drm_ioctl+0x54e/0xa60 drivers/gpu/drm/drm_ioctl.c:886
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  ksys_ioctl+0x123/0x180 fs/ioctl.c:747
>  __do_sys_ioctl fs/ioctl.c:756 [inline]
>  __se_sys_ioctl fs/ioctl.c:754 [inline]
>  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x45b349
> Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f871af46c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f871af476d4 RCX: 000000000045b349
> RDX: 0000000020000180 RSI: 00000000c02064b2 RDI: 0000000000000003
> RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
> R13: 0000000000000285 R14: 00000000004d14d0 R15: 000000000075bf2c
> 
> Allocated by task 14871:
>  save_stack+0x23/0x90 mm/kasan/common.c:72
>  set_track mm/kasan/common.c:80 [inline]
>  __kasan_kmalloc mm/kasan/common.c:513 [inline]
>  __kasan_kmalloc.constprop.0+0xcf/0xe0 mm/kasan/common.c:486
>  kasan_kmalloc+0x9/0x10 mm/kasan/common.c:527
>  kmem_cache_alloc_trace+0x158/0x790 mm/slab.c:3551
>  kmalloc include/linux/slab.h:556 [inline]
>  kzalloc include/linux/slab.h:670 [inline]
>  __vgem_gem_create+0x49/0x100 drivers/gpu/drm/vgem/vgem_drv.c:165
>  vgem_gem_create drivers/gpu/drm/vgem/vgem_drv.c:194 [inline]
>  vgem_gem_dumb_create+0xd7/0x250 drivers/gpu/drm/vgem/vgem_drv.c:217
>  drm_mode_create_dumb+0x282/0x310 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_mode_create_dumb_ioctl+0x26/0x30 drivers/gpu/drm/drm_dumb_buffers.c:100
>  drm_ioctl_kernel+0x244/0x300 drivers/gpu/drm/drm_ioctl.c:786
>  drm_ioctl+0x54e/0xa60 drivers/gpu/drm/drm_ioctl.c:886
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  ksys_ioctl+0x123/0x180 fs/ioctl.c:747
>  __do_sys_ioctl fs/ioctl.c:756 [inline]
>  __se_sys_ioctl fs/ioctl.c:754 [inline]
>  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> Freed by task 14871:
>  save_stack+0x23/0x90 mm/kasan/common.c:72
>  set_track mm/kasan/common.c:80 [inline]
>  kasan_set_free_info mm/kasan/common.c:335 [inline]
>  __kasan_slab_free+0x102/0x150 mm/kasan/common.c:474
>  kasan_slab_free+0xe/0x10 mm/kasan/common.c:483
>  __cache_free mm/slab.c:3426 [inline]
>  kfree+0x10a/0x2c0 mm/slab.c:3757
>  vgem_gem_free_object+0xbe/0xe0 drivers/gpu/drm/vgem/vgem_drv.c:68
>  drm_gem_object_free+0x100/0x220 drivers/gpu/drm/drm_gem.c:983
>  kref_put include/linux/kref.h:65 [inline]
>  drm_gem_object_put_unlocked drivers/gpu/drm/drm_gem.c:1017 [inline]
>  drm_gem_object_put_unlocked+0x196/0x1c0 drivers/gpu/drm/drm_gem.c:1002
>  vgem_gem_create drivers/gpu/drm/vgem/vgem_drv.c:199 [inline]
>  vgem_gem_dumb_create+0x115/0x250 drivers/gpu/drm/vgem/vgem_drv.c:217
>  drm_mode_create_dumb+0x282/0x310 drivers/gpu/drm/drm_dumb_buffers.c:94
>  drm_mode_create_dumb_ioctl+0x26/0x30 drivers/gpu/drm/drm_dumb_buffers.c:100
>  drm_ioctl_kernel+0x244/0x300 drivers/gpu/drm/drm_ioctl.c:786
>  drm_ioctl+0x54e/0xa60 drivers/gpu/drm/drm_ioctl.c:886
>  vfs_ioctl fs/ioctl.c:47 [inline]
>  ksys_ioctl+0x123/0x180 fs/ioctl.c:747
>  __do_sys_ioctl fs/ioctl.c:756 [inline]
>  __se_sys_ioctl fs/ioctl.c:754 [inline]
>  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> The buggy address belongs to the object at ffff88809fa67800
>  which belongs to the cache kmalloc-1k of size 1024
> The buggy address is located 264 bytes inside of
>  1024-byte region [ffff88809fa67800, ffff88809fa67c00)
> The buggy address belongs to the page:
> page:ffffea00027e99c0 refcount:1 mapcount:0 mapping:ffff8880aa400c40 index:0x0
> raw: 00fffe0000000200 ffffea0002293548 ffffea00023e1f08 ffff8880aa400c40
> raw: 0000000000000000 ffff88809fa67000 0000000100000002 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffff88809fa67800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff88809fa67880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >ffff88809fa67900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                       ^
>  ffff88809fa67980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff88809fa67a00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================

Release obj in error path.

--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -196,10 +196,10 @@ static struct drm_gem_object *vgem_gem_c
 		return ERR_CAST(obj);
 
 	ret = drm_gem_handle_create(file, &obj->base, handle);
-	drm_gem_object_put_unlocked(&obj->base);
-	if (ret)
+	if (ret) {
+		drm_gem_object_put_unlocked(&obj->base);
 		return ERR_PTR(ret);
-
+	}
 	return &obj->base;
 }
 

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

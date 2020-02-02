Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2C314FD3A
	for <lists+amd-gfx@lfdr.de>; Sun,  2 Feb 2020 14:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1F46EAC2;
	Sun,  2 Feb 2020 13:19:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0970D6EAC1
 for <amd-gfx@lists.freedesktop.org>; Sun,  2 Feb 2020 13:19:30 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id z2so12140499oih.6
 for <amd-gfx@lists.freedesktop.org>; Sun, 02 Feb 2020 05:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=esjZbRL64Ccgbj9YOP49AtHLAi98mTzbYwtf057c6ZA=;
 b=BFwjzgfg3h2SkO8H6FmPahxECa4EHi1ETW2WB/uucHTua143MXQmO6OHMe6RNZDOwu
 fEfIXeCwXX79C0JiBaJAFh3ANEp1C1nt60M6ttnCCNd/OF+v0sZ9wMgQl0GLAvuV16oZ
 wtW0tbajQWxyPam4yZpq/DxX5vNNMyxqbpx04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=esjZbRL64Ccgbj9YOP49AtHLAi98mTzbYwtf057c6ZA=;
 b=fMjKNlXHbULt/9CPSQIY7s2muzmltH3QX6ynaFJsREAVdFQBggOuf6ZZtwBOdTsQL7
 xueJCXiI0GXse7VXSCT9DIl0PGnf34PRIfIM+2IlltJARDAnoL5K6w0caDZ/WanBrCqq
 ta2ICzp7fOFfWFNwQAuURN6vUa0E8DlaOi65Y5vhi/Jtz1J46rkPD9eqOU81FjhuJN0A
 bTpBagNmAHZ0D4/7LCxtgpGubxj+w+04Lg5ojrZmBwuFnciNGxZV3sbpTFkXG6LjZc0o
 JIsK9RN0caaQ04XHuDYtmKDpagbbwx40uPQIVYjXS3IPZTNxfJrXJXyCxun4RLocQQ0t
 tCvQ==
X-Gm-Message-State: APjAAAVXoV4dSTmqobBLpuJECsXf6SpUW0B5N3oXscQ2c45Tk9P7g6L+
 QTwHiACatDfukHEgFaYF2pQG/ek7/9uEpU1JF8P7RA==
X-Google-Smtp-Source: APXvYqxLHhNRnKKLddGy9cYMcZ941NP0L7oxQDwxYEt01b2dUsWhWmLW89mJ6FCJ4/ZjnA37381+bbtuTJiJH++YEec=
X-Received: by 2002:aca:2407:: with SMTP id n7mr11960492oic.14.1580649569194; 
 Sun, 02 Feb 2020 05:19:29 -0800 (PST)
MIME-Version: 1.0
References: <000000000000ae2f81059d7716b8@google.com>
In-Reply-To: <000000000000ae2f81059d7716b8@google.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 2 Feb 2020 14:19:18 +0100
Message-ID: <CAKMK7uGivsYzP6h9rg0eN34YuOVbee6gnhdOxiys=M=4phK+kw@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in vgem_gem_dumb_create
To: syzbot <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Dave Airlie <airlied@linux.ie>, netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "Anholt, Eric" <eric@anholt.net>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Sumit Semwal <sumit.semwal@linaro.org>,
 David Miller <davem@davemloft.net>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jan 31, 2020 at 11:28 PM syzbot
<syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
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

Aside: This bisect line is complete nonsense ... I'm kinda at the
point where I'm assuming that syzbot bisect results are garbage, which
is maybe not what we want. I guess much stricter filtering for noise
is needed, dunno.
-Danile

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
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

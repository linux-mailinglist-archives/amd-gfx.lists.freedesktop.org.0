Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34887658F1C
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Dec 2022 17:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5C710E3F9;
	Thu, 29 Dec 2022 16:37:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473E610E1EB
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Dec 2022 06:26:37 +0000 (UTC)
Received: by mail-il1-f198.google.com with SMTP id
 g3-20020a056e021a2300b00305e3da9585so11394663ile.16
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Dec 2022 22:26:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BhbflDOV2k1KLyHwZs0cA13pq6md2aueXIcWzsW7/xQ=;
 b=p9XQGMRy24Ok0RG9ycaYjno1gwZImGqaDpb3EmQ5aQI2RGDzgp/GOAkOwi2M0CTZeb
 URRr0BpblF0vmUYnp+1OegbAvu5H2BH2LCBL1WR4AOM+aIIG9L6A0XRAz7CRO1ZIO1hn
 vOVZr9uGqU1MzQ85n+3Y4MaklhHU9Qcg36rILKPNO7nZpm/J8qDBne0mrTDGVAoa+owR
 bZCY9b7SgjDqu1tYZKpBOlI1Ycn37oHg8Z1HKNf7qM2JmM5YFxBQaM1OcXrqzO8TzfD6
 5s3QYPKIwQAsk6apyh3J7ch2YnkHlilx5Ur3MpRJ+VN0VWrpJRfq/ai/IuBXX067nMAG
 t01Q==
X-Gm-Message-State: AFqh2krun1r/gWTRfMoPlsTDFnl0nuugtO2Nk2sQ8JEw+5YAv/Flyb0p
 cPO54JwmAymmE/6CvuXcVW/WD9re4eUx4UpPjxQsVeHBjFis
X-Google-Smtp-Source: AMrXdXtEXNg77rqsguWCrJD35UlA6mDxsEdnkiJQx9de80ndRMBTEEGwG/IbtoSUP4YA+jNL5E5JiryM/qq7CbLOIJW1ese8qpQL
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:803:b0:304:c661:f53 with SMTP id
 u3-20020a056e02080300b00304c6610f53mr2292911ilm.155.1672295196843; Wed, 28
 Dec 2022 22:26:36 -0800 (PST)
Date: Wed, 28 Dec 2022 22:26:36 -0800
In-Reply-To: <00000000000033a0120588fac894@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002ae67f05f0f191aa@google.com>
Subject: Re: [syzbot] WARNING: locking bug in inet_autobind
From: syzbot <syzbot+94cc2a66fc228b23f360@syzkaller.appspotmail.com>
To: Alexander.Deucher@amd.com, Christian.Koenig@amd.com, David1.Zhou@amd.com, 
 Evan.Quan@amd.com, Felix.Kuehling@amd.com, Harry.Wentland@amd.com, 
 Oak.Zeng@amd.com, Ray.Huang@amd.com, Yong.Zhao@amd.com, airlied@linux.ie, 
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org, ast@kernel.org, 
 boqun.feng@gmail.com, bpf@vger.kernel.org, christian.koenig@amd.com, 
 daniel@ffwll.ch, daniel@iogearbox.net, davem@davemloft.net, 
 david1.zhou@amd.com, dri-devel@lists.freedesktop.org, dsahern@kernel.org, 
 edumazet@google.com, evan.quan@amd.com, felix.kuehling@amd.com, 
 gautammenghani201@gmail.com, harry.wentland@amd.com, jakub@cloudflare.com, 
 kafai@fb.com, kuba@kernel.org, kuznet@ms2.inr.ac.ru, 
 linux-kernel@vger.kernel.org, longman@redhat.com, mingo@redhat.com, 
 netdev@vger.kernel.org, ozeng@amd.com, pabeni@redhat.com, 
 penguin-kernel@I-love.SAKURA.ne.jp, penguin-kernel@i-love.sakura.ne.jp, 
 peterz@infradead.org, ray.huang@amd.com, rex.zhu@amd.com, 
 songliubraving@fb.com, syzkaller-bugs@googlegroups.com, will@kernel.org, 
 yhs@fb.com, yong.zhao@amd.com, yoshfuji@linux-ipv6.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 29 Dec 2022 16:37:06 +0000
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    1b929c02afd3 Linux 6.2-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=145c6a68480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2651619a26b4d687
dashboard link: https://syzkaller.appspot.com/bug?extid=94cc2a66fc228b23f360
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e13e32480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13790f08480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d1849f1ca322/disk-1b929c02.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/924cb8aa4ada/vmlinux-1b929c02.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8c7330dae0a0/bzImage-1b929c02.xz

The issue was bisected to:

commit c0d9271ecbd891cdeb0fad1edcdd99ee717a655f
Author: Yong Zhao <Yong.Zhao@amd.com>
Date:   Fri Feb 1 23:36:21 2019 +0000

    drm/amdgpu: Delete user queue doorbell variables

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1433ece4a00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1633ece4a00000
console output: https://syzkaller.appspot.com/x/log.txt?x=1233ece4a00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+94cc2a66fc228b23f360@syzkaller.appspotmail.com
Fixes: c0d9271ecbd8 ("drm/amdgpu: Delete user queue doorbell variables")

------------[ cut here ]------------
Looking for class "l2tp_sock" with key l2tp_socket_class, but found a different class "slock-AF_INET6" with the same key
WARNING: CPU: 0 PID: 7280 at kernel/locking/lockdep.c:937 look_up_lock_class+0x97/0x110 kernel/locking/lockdep.c:937
Modules linked in:
CPU: 0 PID: 7280 Comm: syz-executor835 Not tainted 6.2.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:look_up_lock_class+0x97/0x110 kernel/locking/lockdep.c:937
Code: 17 48 81 fa e0 e5 f6 8f 74 59 80 3d 5d bc 57 04 00 75 50 48 c7 c7 00 4d 4c 8a 48 89 04 24 c6 05 49 bc 57 04 01 e8 a9 42 b9 ff <0f> 0b 48 8b 04 24 eb 31 9c 5a 80 e6 02 74 95 e8 45 38 02 fa 85 c0
RSP: 0018:ffffc9000b5378b8 EFLAGS: 00010082
RAX: 0000000000000000 RBX: ffffffff91c06a00 RCX: 0000000000000000
RDX: ffff8880292d0000 RSI: ffffffff8166721c RDI: fffff520016a6f09
RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000201 R11: 20676e696b6f6f4c R12: 0000000000000000
R13: ffff88802a5820b0 R14: 0000000000000000 R15: 0000000000000000
FS:  00007f1fd7a97700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020000100 CR3: 0000000078ab4000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 register_lock_class+0xbe/0x1120 kernel/locking/lockdep.c:1289
 __lock_acquire+0x109/0x56d0 kernel/locking/lockdep.c:4934
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
 __raw_spin_lock_bh include/linux/spinlock_api_smp.h:126 [inline]
 _raw_spin_lock_bh+0x33/0x40 kernel/locking/spinlock.c:178
 spin_lock_bh include/linux/spinlock.h:355 [inline]
 lock_sock_nested+0x5f/0xf0 net/core/sock.c:3473
 lock_sock include/net/sock.h:1725 [inline]
 inet_autobind+0x1a/0x190 net/ipv4/af_inet.c:177
 inet_send_prepare net/ipv4/af_inet.c:813 [inline]
 inet_send_prepare+0x325/0x4e0 net/ipv4/af_inet.c:807
 inet6_sendmsg+0x43/0xe0 net/ipv6/af_inet6.c:655
 sock_sendmsg_nosec net/socket.c:714 [inline]
 sock_sendmsg+0xd3/0x120 net/socket.c:734
 __sys_sendto+0x23a/0x340 net/socket.c:2117
 __do_sys_sendto net/socket.c:2129 [inline]
 __se_sys_sendto net/socket.c:2125 [inline]
 __x64_sys_sendto+0xe1/0x1b0 net/socket.c:2125
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f1fd78538b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f1fd7a971f8 EFLAGS: 00000212 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 00007f1fd78f0038 RCX: 00007f1fd78538b9
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007f1fd78f0030 R08: 0000000020000100 R09: 000000000000001c
R10: 0000000004008000 R11: 0000000000000212 R12: 00007f1fd78f003c
R13: 00007f1fd79ffc8f R14: 00007f1fd7a97300 R15: 0000000000022000
 </TASK>


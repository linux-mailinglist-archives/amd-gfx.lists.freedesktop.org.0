Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14A875F6C
	for <lists+amd-gfx@lfdr.de>; Fri,  8 Mar 2024 09:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59D6A112D6F;
	Fri,  8 Mar 2024 08:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="tFDT3ZKy";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1A010F5BC
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Mar 2024 22:16:16 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-7884124b06aso69134885a.2
 for <amd-gfx@lists.freedesktop.org>; Thu, 07 Mar 2024 14:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1709849776; x=1710454576;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2zp3v54goojmEVAqqcqwPv6cH3vUgepVgSAhLnj7GBU=;
 b=tFDT3ZKyOIaMU1Gm2PHSR3El4qMGgtBsfXujlyXlGF+pQMCkt/NZTh4oP+GKMNRqFD
 h4APFCnKbzZdCgAQowi724nUN9ZQ8MxkuvQuIvAlkb08AuRk+sA/L+X8FJHFuLDh7Rb9
 xgWOHTN8nIZR86+kWCNu9jEAVWkgtsppeC+lOJrvdfgeic5cAlSTcjo/eUdhqUVGew+R
 BIOAZu4mwdnn5eWiczwYVffl7u4N9ohRdELyHmi4zyj9/Aq+dAI29NGJx7ViRPrMVJgV
 /DI+K4TwtKDT7kb+X2TGft/ykm1v05mQz3PJ6BWD+xNiiY97jKFdEkIkv0OQQZrBzQc7
 o8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709849776; x=1710454576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2zp3v54goojmEVAqqcqwPv6cH3vUgepVgSAhLnj7GBU=;
 b=aHpvDYjzgFdMScPxMtbT9XGxYChhD3TyFvyEbWWOdQdJtTDJmNWcLpPCcpOfNWlErr
 bdkJzwrh24zVszQI1dEOFmgmyFTuIBziwQNlb9DAbcyhkEjqSIQy3alsmqHM8Wx2WoaE
 PKHHW5C3zcoYccelapnEbgwspC7Od5C52avTa5A6A23fFFrgPwJi5n6+k1MBiCvkfxKK
 XcqlltBujEPee+B7Ql553ahvjvQdyWFl/nODtBmYPNR+IK52mTegwO30oXrgl7JD6xi4
 Emdk5G/Euc+jEa9RExYaUHxZonswjM1eo7Owc5GkZeZMyB2yyDwhxgeXtqjZtqweGXMu
 n/IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpjj3PbfkG03K7xGcAzZk/Cki5HiJSWrNRT1MWOhoNk7w9nXS4m8eS5gr4tW3osC/is5SI23Ruw/J2QNEhi6THN/c89j6H1oNRyXhlPA==
X-Gm-Message-State: AOJu0YxsDdukRAMuhDZ0WweEkqCEh9PhSiIfD5WD9d3OEu/yBLH/A+Kg
 PCFzWnIu8HkK1JHsFi3tonl3DH2aaicaCMlX3vIJu7kQsW/Sky3hxFQG7OHtHFk=
X-Google-Smtp-Source: AGHT+IFkuf7HU47twIpvKZWFZeZI65WwFJHBcwQNWMYK70wy0RsqZDzkLqFS92cL0KO6OyA+B+oJNQ==
X-Received: by 2002:a05:620a:5361:b0:788:1a1c:dcb6 with SMTP id
 op33-20020a05620a536100b007881a1cdcb6mr10975285qkn.5.1709849775724; 
 Thu, 07 Mar 2024 14:16:15 -0800 (PST)
Received: from localhost
 (2603-7000-0c01-2716-da5e-d3ff-fee7-26e7.res6.spectrum.com.
 [2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
 by smtp.gmail.com with ESMTPSA id
 bp9-20020a05620a458900b0078812f8a042sm6498316qkb.90.2024.03.07.14.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 14:16:14 -0800 (PST)
From: Johannes Weiner <hannes@cmpxchg.org>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: fix deadlock while reading mqd from debugfs
Date: Thu,  7 Mar 2024 17:07:37 -0500
Message-ID: <20240307221609.7651-1-hannes@cmpxchg.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 08 Mar 2024 08:26:38 +0000
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

An errant disk backup on my desktop got into debugfs and triggered the
following deadlock scenario in the amdgpu debugfs files. The machine
also hard-resets immediately after those lines are printed (although I
wasn't able to reproduce that part when reading by hand):

[ 1318.016074][ T1082] ======================================================
[ 1318.016607][ T1082] WARNING: possible circular locking dependency detected
[ 1318.017107][ T1082] 6.8.0-rc7-00015-ge0c8221b72c0 #17 Not tainted
[ 1318.017598][ T1082] ------------------------------------------------------
[ 1318.018096][ T1082] tar/1082 is trying to acquire lock:
[ 1318.018585][ T1082] ffff98c44175d6a0 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x40/0x80
[ 1318.019084][ T1082]
[ 1318.019084][ T1082] but task is already holding lock:
[ 1318.020052][ T1082] ffff98c4c13f55f8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: amdgpu_debugfs_mqd_read+0x6a/0x250 [amdgpu]
[ 1318.020607][ T1082]
[ 1318.020607][ T1082] which lock already depends on the new lock.
[ 1318.020607][ T1082]
[ 1318.022081][ T1082]
[ 1318.022081][ T1082] the existing dependency chain (in reverse order) is:
[ 1318.023083][ T1082]
[ 1318.023083][ T1082] -> #2 (reservation_ww_class_mutex){+.+.}-{3:3}:
[ 1318.024114][ T1082]        __ww_mutex_lock.constprop.0+0xe0/0x12f0
[ 1318.024639][ T1082]        ww_mutex_lock+0x32/0x90
[ 1318.025161][ T1082]        dma_resv_lockdep+0x18a/0x330
[ 1318.025683][ T1082]        do_one_initcall+0x6a/0x350
[ 1318.026210][ T1082]        kernel_init_freeable+0x1a3/0x310
[ 1318.026728][ T1082]        kernel_init+0x15/0x1a0
[ 1318.027242][ T1082]        ret_from_fork+0x2c/0x40
[ 1318.027759][ T1082]        ret_from_fork_asm+0x11/0x20
[ 1318.028281][ T1082]
[ 1318.028281][ T1082] -> #1 (reservation_ww_class_acquire){+.+.}-{0:0}:
[ 1318.029297][ T1082]        dma_resv_lockdep+0x16c/0x330
[ 1318.029790][ T1082]        do_one_initcall+0x6a/0x350
[ 1318.030263][ T1082]        kernel_init_freeable+0x1a3/0x310
[ 1318.030722][ T1082]        kernel_init+0x15/0x1a0
[ 1318.031168][ T1082]        ret_from_fork+0x2c/0x40
[ 1318.031598][ T1082]        ret_from_fork_asm+0x11/0x20
[ 1318.032011][ T1082]
[ 1318.032011][ T1082] -> #0 (&mm->mmap_lock){++++}-{3:3}:
[ 1318.032778][ T1082]        __lock_acquire+0x14bf/0x2680
[ 1318.033141][ T1082]        lock_acquire+0xcd/0x2c0
[ 1318.033487][ T1082]        __might_fault+0x58/0x80
[ 1318.033814][ T1082]        amdgpu_debugfs_mqd_read+0x103/0x250 [amdgpu]
[ 1318.034181][ T1082]        full_proxy_read+0x55/0x80
[ 1318.034487][ T1082]        vfs_read+0xa7/0x360
[ 1318.034788][ T1082]        ksys_read+0x70/0xf0
[ 1318.035085][ T1082]        do_syscall_64+0x94/0x180
[ 1318.035375][ T1082]        entry_SYSCALL_64_after_hwframe+0x46/0x4e
[ 1318.035664][ T1082]
[ 1318.035664][ T1082] other info that might help us debug this:
[ 1318.035664][ T1082]
[ 1318.036487][ T1082] Chain exists of:
[ 1318.036487][ T1082]   &mm->mmap_lock --> reservation_ww_class_acquire --> reservation_ww_class_mutex
[ 1318.036487][ T1082]
[ 1318.037310][ T1082]  Possible unsafe locking scenario:
[ 1318.037310][ T1082]
[ 1318.037838][ T1082]        CPU0                    CPU1
[ 1318.038101][ T1082]        ----                    ----
[ 1318.038350][ T1082]   lock(reservation_ww_class_mutex);
[ 1318.038590][ T1082]                                lock(reservation_ww_class_acquire);
[ 1318.038839][ T1082]                                lock(reservation_ww_class_mutex);
[ 1318.039083][ T1082]   rlock(&mm->mmap_lock);
[ 1318.039328][ T1082]
[ 1318.039328][ T1082]  *** DEADLOCK ***
[ 1318.039328][ T1082]
[ 1318.040029][ T1082] 1 lock held by tar/1082:
[ 1318.040259][ T1082]  #0: ffff98c4c13f55f8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: amdgpu_debugfs_mqd_read+0x6a/0x250 [amdgpu]
[ 1318.040560][ T1082]
[ 1318.040560][ T1082] stack backtrace:
[ 1318.041053][ T1082] CPU: 22 PID: 1082 Comm: tar Not tainted 6.8.0-rc7-00015-ge0c8221b72c0 #17 3316c85d50e282c5643b075d1f01a4f6365e39c2
[ 1318.041329][ T1082] Hardware name: Gigabyte Technology Co., Ltd. B650 AORUS PRO AX/B650 AORUS PRO AX, BIOS F20 12/14/2023
[ 1318.041614][ T1082] Call Trace:
[ 1318.041895][ T1082]  <TASK>
[ 1318.042175][ T1082]  dump_stack_lvl+0x4a/0x80
[ 1318.042460][ T1082]  check_noncircular+0x145/0x160
[ 1318.042743][ T1082]  __lock_acquire+0x14bf/0x2680
[ 1318.043022][ T1082]  lock_acquire+0xcd/0x2c0
[ 1318.043301][ T1082]  ? __might_fault+0x40/0x80
[ 1318.043580][ T1082]  ? __might_fault+0x40/0x80
[ 1318.043856][ T1082]  __might_fault+0x58/0x80
[ 1318.044131][ T1082]  ? __might_fault+0x40/0x80
[ 1318.044408][ T1082]  amdgpu_debugfs_mqd_read+0x103/0x250 [amdgpu 8fe2afaa910cbd7654c8cab23563a94d6caebaab]
[ 1318.044749][ T1082]  full_proxy_read+0x55/0x80
[ 1318.045042][ T1082]  vfs_read+0xa7/0x360
[ 1318.045333][ T1082]  ksys_read+0x70/0xf0
[ 1318.045623][ T1082]  do_syscall_64+0x94/0x180
[ 1318.045913][ T1082]  ? do_syscall_64+0xa0/0x180
[ 1318.046201][ T1082]  ? lockdep_hardirqs_on+0x7d/0x100
[ 1318.046487][ T1082]  ? do_syscall_64+0xa0/0x180
[ 1318.046773][ T1082]  ? do_syscall_64+0xa0/0x180
[ 1318.047057][ T1082]  ? do_syscall_64+0xa0/0x180
[ 1318.047337][ T1082]  ? do_syscall_64+0xa0/0x180
[ 1318.047611][ T1082]  entry_SYSCALL_64_after_hwframe+0x46/0x4e
[ 1318.047887][ T1082] RIP: 0033:0x7f480b70a39d
[ 1318.048162][ T1082] Code: 91 ba 0d 00 f7 d8 64 89 02 b8 ff ff ff ff eb b2 e8 18 a3 01 00 0f 1f 84 00 00 00 00 00 80 3d a9 3c 0e 00 00 74 17 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 5b c3 66 2e 0f 1f 84 00 00 00 00 00 53 48 83
[ 1318.048769][ T1082] RSP: 002b:00007ffde77f5c68 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[ 1318.049083][ T1082] RAX: ffffffffffffffda RBX: 0000000000000800 RCX: 00007f480b70a39d
[ 1318.049392][ T1082] RDX: 0000000000000800 RSI: 000055c9f2120c00 RDI: 0000000000000008
[ 1318.049703][ T1082] RBP: 0000000000000800 R08: 000055c9f2120a94 R09: 0000000000000007
[ 1318.050011][ T1082] R10: 0000000000000000 R11: 0000000000000246 R12: 000055c9f2120c00
[ 1318.050324][ T1082] R13: 0000000000000008 R14: 0000000000000008 R15: 0000000000000800
[ 1318.050638][ T1082]  </TASK>

amdgpu_debugfs_mqd_read() holds a reservation when it calls
put_user(), which may fault and acquire the mmap_sem. This violates
the established locking order.

Bounce the mqd data through a kernel buffer to get put_user() out of
the illegal section.

Fixes: 445d85e3c1df ("drm/amdgpu: add debugfs interface for reading MQDs")
Cc: stable@vger.kernel.org		[v6.5+]
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 46 +++++++++++++++---------
 1 file changed, 29 insertions(+), 17 deletions(-)

This fixes the lockdep splat for me, and the hexdump of the output
looks sane after the patch. However, I'm not at all familiar with this
code to say for sure that this is the right solution. The mqd seems
small enough that the kmalloc won't get crazy. I'm also assuming that
ring->mqd_size is safe to access before the reserve & kmap. Lastly I
went with an open loop instead of a memcpy() as I wasn't sure if that
memory is safe to address a byte at at time.

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
index 5505d646f43a..06f0a6534a94 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
@@ -524,46 +524,58 @@ static ssize_t amdgpu_debugfs_mqd_read(struct file *f, char __user *buf,
 {
 	struct amdgpu_ring *ring = file_inode(f)->i_private;
 	volatile u32 *mqd;
-	int r;
+	u32 *kbuf;
+	int r, i;
 	uint32_t value, result;
 
 	if (*pos & 3 || size & 3)
 		return -EINVAL;
 
-	result = 0;
+	kbuf = kmalloc(ring->mqd_size, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
 
 	r = amdgpu_bo_reserve(ring->mqd_obj, false);
 	if (unlikely(r != 0))
-		return r;
+		goto err_free;
 
 	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&mqd);
-	if (r) {
-		amdgpu_bo_unreserve(ring->mqd_obj);
-		return r;
-	}
+	if (r)
+		goto err_unreserve;
 
+	/*
+	 * Copy to local buffer to avoid put_user(), which might fault
+	 * and acquire mmap_sem, under reservation_ww_class_mutex.
+	 */
+	for (i = 0; i < ring->mqd_size/sizeof(u32); i++)
+		kbuf[i] = mqd[i];
+
+	amdgpu_bo_kunmap(ring->mqd_obj);
+	amdgpu_bo_unreserve(ring->mqd_obj);
+
+	result = 0;
 	while (size) {
 		if (*pos >= ring->mqd_size)
-			goto done;
+			break;
 
-		value = mqd[*pos/4];
+		value = kbuf[*pos/4];
 		r = put_user(value, (uint32_t *)buf);
 		if (r)
-			goto done;
+			goto err_free;
 		buf += 4;
 		result += 4;
 		size -= 4;
 		*pos += 4;
 	}
 
-done:
-	amdgpu_bo_kunmap(ring->mqd_obj);
-	mqd = NULL;
-	amdgpu_bo_unreserve(ring->mqd_obj);
-	if (r)
-		return r;
-
+	kfree(kbuf);
 	return result;
+
+err_unreserve:
+	amdgpu_bo_unreserve(ring->mqd_obj);
+err_free:
+	kfree(kbuf);
+	return r;
 }
 
 static const struct file_operations amdgpu_debugfs_mqd_fops = {
-- 
2.44.0


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0584371211
	for <lists+amd-gfx@lfdr.de>; Mon,  3 May 2021 09:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB606E87D;
	Mon,  3 May 2021 07:35:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268646E873
 for <amd-gfx@lists.freedesktop.org>; Mon,  3 May 2021 05:06:13 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id t22so2870815pgu.0
 for <amd-gfx@lists.freedesktop.org>; Sun, 02 May 2021 22:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pVqxsKdZNmIQysPubTq9p7CFRU9YZoyXXmqQDJ0c1MQ=;
 b=Sf6z8jJBfI2i1v8Sb+7tGDSnTSkTDzDWLr46vwP7qZUzWBwnv5o8NBRrvANjKMIAmn
 719PyMRpOcwXNWe4uO8X77hu8o+UTQCZKkDGyIkECFc414JYztFv32r6D/3rviniNDVz
 LzApdoWbxyPaPRX62FtU4lLThWaH6BZCI10hI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pVqxsKdZNmIQysPubTq9p7CFRU9YZoyXXmqQDJ0c1MQ=;
 b=rwfYtCT3bJrNW4f+LZxG6vTyokgha0F43c4wgHh5HImqXRQZEGNt8fKUBsZiqbvws6
 D616+q15JpckpaAlVse972whN1Tz2Z/ZcNZCU+NFHxLyfFMxeqgv0zYmNJR506q0XRVu
 11cCNIFthz6QFZ1q+0MiK/AdlQ685Or+og4fpJGKJ346sBx2KZzlFb1+0sUqGj25DjN/
 iYwEzhWXKWD+cSylTd7w7v60s0KYxvDqMfV7O2XKbfVxqK8/KrtqS9mRu7eVVX52DEo1
 eJ3/gpzDz63RMCSZJhFkOZ+G/Q3JalUEaClO2HIHTC3R7LUwGf8GXegfHuFJeNzmCrWy
 Y+JA==
X-Gm-Message-State: AOAM5319B18K7QUeZDGj7SewieUOgxyQMDktE7/94fIZABMsjyZn+N20
 v1LRHPiDqJv0/2Gplt2lUJBrug==
X-Google-Smtp-Source: ABdhPJzShW8zEqoCSpFn+UGASwwa5sJ7zfQedpBeUuV81tceAuqT0sv5LGPxm03xlOWbF9DLo4hMWw==
X-Received: by 2002:a63:2226:: with SMTP id i38mr16491544pgi.215.1620018372724; 
 Sun, 02 May 2021 22:06:12 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d12sm8217896pjj.50.2021.05.02.22.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 22:06:11 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/2] drm/radeon: Fix off-by-one power_state index heap
 overwrite
Date: Sun,  2 May 2021 22:06:07 -0700
Message-Id: <20210503050608.2158996-2-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503050608.2158996-1-keescook@chromium.org>
References: <20210503050608.2158996-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=05b6d926bf702cdd36c72facf24e469ed0f3f885;
 i=ATo4oIxne5TtIhxJQIU9bVs0eopqERSalAsNiFFI+i0=;
 m=0DOYn21+MXxG3X9K27NCqL7Ujg+0ti5EfF/4Sjw+wg4=;
 p=eCtdoEb9RysCSplQASV5/K6OePRPLbYt1dd68R0Sj+4=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmCPhL8ACgkQiXL039xtwCZEthAAl21
 wTw2YxrKrKiS+S0CjWXiB1XbzslMpV5YCqcjbhBDbt2Zft8ke8gDpn+MJaednKSoLl+dAHc9ij3fl
 iVTbbG2sJ667YKaHCZtIMT0xHY3wfczbefigwIXtlKlA0ueqLjosDhVUI1/S8vW8PmLaC1Khy4+ZZ
 iHU8RZvNi9h0NKYYmbw+Cu5JiGgU99JLbpFPAzrU98T7O0iuQvXeUgf3AAMsqyLztRCtBuhz5FvZ0
 HelmlgjaTh8GU/kOcCoz48x12qCQk12E7oHnXi5D5Xo246ybjsq3JP/jPowKGZQKYMIB3utj/czt7
 loH0MeOUEddBTTWyNDzPkWwqQahtlsfbAPJCWWJEMQKjEyIn1BJuyYsQx+jv4u1FXmbsTAn+wLbec
 3HRlMvVdl1dLJozoq52ltvckOR8frWex3bJ67KSi+xykrZy1TrCtbfQruCucIVG1+mifLhMDDtB86
 9N10k4K0DkCpLSSnxDTtcdrx1W6HND8OnOgqbgwk/2Y34bq81p3GyuKlrsZsfJxHof6yqCikfB6tU
 UnKRQ1YaT/EhVjeex8epzS7ehNOmD56GkTlyfmmZFax+kKC2SEm4uhAyKHsqth8n+2qQMFuJNaTax
 PwlaPjB4Y+zlgKVDjUyZL8qI0NvHY83KZURO3ysWUsziN9k5zP/CPyP2hFWxreZc=
X-Mailman-Approved-At: Mon, 03 May 2021 07:35:12 +0000
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
Cc: "Erhard F ." <erhard_f@mailbox.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

An out of bounds write happens when setting the default power state.
KASAN sees this as:

[drm] radeon: 512M of GTT memory ready.
[drm] GART: num cpu pages 131072, num gpu pages 131072
==================================================================
BUG: KASAN: slab-out-of-bounds in
radeon_atombios_parse_power_table_1_3+0x1837/0x1998 [radeon]
Write of size 4 at addr ffff88810178d858 by task systemd-udevd/157

CPU: 0 PID: 157 Comm: systemd-udevd Not tainted 5.12.0-E620 #50
Hardware name: eMachines        eMachines E620  /Nile       , BIOS V1.03 09/30/2008
Call Trace:
 dump_stack+0xa5/0xe6
 print_address_description.constprop.0+0x18/0x239
 kasan_report+0x170/0x1a8
 radeon_atombios_parse_power_table_1_3+0x1837/0x1998 [radeon]
 radeon_atombios_get_power_modes+0x144/0x1888 [radeon]
 radeon_pm_init+0x1019/0x1904 [radeon]
 rs690_init+0x76e/0x84a [radeon]
 radeon_device_init+0x1c1a/0x21e5 [radeon]
 radeon_driver_load_kms+0xf5/0x30b [radeon]
 drm_dev_register+0x255/0x4a0 [drm]
 radeon_pci_probe+0x246/0x2f6 [radeon]
 pci_device_probe+0x1aa/0x294
 really_probe+0x30e/0x850
 driver_probe_device+0xe6/0x135
 device_driver_attach+0xc1/0xf8
 __driver_attach+0x13f/0x146
 bus_for_each_dev+0xfa/0x146
 bus_add_driver+0x2b3/0x447
 driver_register+0x242/0x2c1
 do_one_initcall+0x149/0x2fd
 do_init_module+0x1ae/0x573
 load_module+0x4dee/0x5cca
 __do_sys_finit_module+0xf1/0x140
 do_syscall_64+0x33/0x40
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Without KASAN, this will manifest later when the kernel attempts to
allocate memory that was stomped, since it collides with the inline slab
freelist pointer:

invalid opcode: 0000 [#1] SMP NOPTI
CPU: 0 PID: 781 Comm: openrc-run.sh Tainted: G        W 5.10.12-gentoo-E620 #2
Hardware name: eMachines        eMachines E620  /Nile , BIOS V1.03       09/30/2008
RIP: 0010:kfree+0x115/0x230
Code: 89 c5 e8 75 ea ff ff 48 8b 00 0f ba e0 09 72 63 e8 1f f4 ff ff 41 89 c4 48 8b 45 00 0f ba e0 10 72 0a 48 8b 45 08 a8 01 75 02 <0f> 0b 44 89 e1 48 c7 c2 00 f0 ff ff be 06 00 00 00 48 d3 e2 48 c7
RSP: 0018:ffffb42f40267e10 EFLAGS: 00010246
RAX: ffffd61280ee8d88 RBX: 0000000000000004 RCX: 000000008010000d
RDX: 4000000000000000 RSI: ffffffffba1360b0 RDI: ffffd61280ee8d80
RBP: ffffd61280ee8d80 R08: ffffffffb91bebdf R09: 0000000000000000
R10: ffff8fe2c1047ac8 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000100
FS:  00007fe80eff6b68(0000) GS:ffff8fe339c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe80eec7bc0 CR3: 0000000038012000 CR4: 00000000000006f0
Call Trace:
 __free_fdtable+0x16/0x1f
 put_files_struct+0x81/0x9b
 do_exit+0x433/0x94d
 do_group_exit+0xa6/0xa6
 __x64_sys_exit_group+0xf/0xf
 do_syscall_64+0x33/0x40
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fe80ef64bea
Code: Unable to access opcode bytes at RIP 0x7fe80ef64bc0.
RSP: 002b:00007ffdb1c47528 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fe80ef64bea
RDX: 00007fe80ef64f60 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 00007fe80ee2c620 R11: 0000000000000246 R12: 00007fe80eff41e0
R13: 00000000ffffffff R14: 0000000000000024 R15: 00007fe80edf9cd0
Modules linked in: radeon(+) ath5k(+) snd_hda_codec_realtek ...

Use a valid power_state index when initializing the "flags" and "misc"
and "misc2" fields.

Reported-by: Erhard F. <erhard_f@mailbox.org>
Fixes: a48b9b4edb8b ("drm/radeon/kms/pm: add asic specific callbacks for getting power state (v2)")
Fixes: 79daedc94281 ("drm/radeon/kms: minor pm cleanups")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/radeon/radeon_atombios.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 42301b4e56f5..f9f4efa1738c 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -2250,10 +2250,10 @@ static int radeon_atombios_parse_power_table_1_3(struct radeon_device *rdev)
 		rdev->pm.default_power_state_index = state_index - 1;
 		rdev->pm.power_state[state_index - 1].default_clock_mode =
 			&rdev->pm.power_state[state_index - 1].clock_info[0];
-		rdev->pm.power_state[state_index].flags &=
+		rdev->pm.power_state[state_index - 1].flags &=
 			~RADEON_PM_STATE_SINGLE_DISPLAY_ONLY;
-		rdev->pm.power_state[state_index].misc = 0;
-		rdev->pm.power_state[state_index].misc2 = 0;
+		rdev->pm.power_state[state_index - 1].misc = 0;
+		rdev->pm.power_state[state_index - 1].misc2 = 0;
 	}
 	return state_index;
 }
-- 
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

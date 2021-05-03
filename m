Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4AE371AC9
	for <lists+amd-gfx@lfdr.de>; Mon,  3 May 2021 18:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0616A6E9B0;
	Mon,  3 May 2021 16:40:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B4C6E9B0;
 Mon,  3 May 2021 16:40:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6603E613CD;
 Mon,  3 May 2021 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060056;
 bh=AAcA8OdPJl+ilu/dPnGtwVxONE61/5EAHLfi0bMQ3Q8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ey6+lYEivDTB65CSN4sdL44wKl+hzkY8b/dLBk/gUCb+9iyfDQtuKAQSszrmhHal0
 i+1W0taPOV55npy1rqAZCEz6zl31/gUSBo/zfUrMjvdgkXwasPUKPh9p5azJH8Zy8N
 4nCgL/IerMx04cuXPOmMCrgsAiIKl5BQ+a/scSjMo0Y/5dvqEJ0+F2DfLEi0+v7UNa
 +siu8IxdB1WxXqAE1RU3FqN+8roOmgryFGPZVznH3icV/HDu6y95sKoFRWP8Ts5WFh
 lOPbu1n2QRmP4pBDfND7ecziTFdcvCcnfU5S4BNYSXdkM/DizLzhZ4PNWs+5z8q7qP
 qsMMZQh4PtjRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 49/57] drm/amdkfd: Fix cat debugfs hang_hws file
 causes system crash bug
Date: Mon,  3 May 2021 12:39:33 -0400
Message-Id: <20210503163941.2853291-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503163941.2853291-1-sashal@kernel.org>
References: <20210503163941.2853291-1-sashal@kernel.org>
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
 Qu Huang <jinsdb@126.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Qu Huang <jinsdb@126.com>

[ Upstream commit d73610211eec8aa027850982b1a48980aa1bc96e ]

Here is the system crash log:
[ 1272.884438] BUG: unable to handle kernel NULL pointer dereference at
(null)
[ 1272.884444] IP: [<          (null)>]           (null)
[ 1272.884447] PGD 825b09067 PUD 8267c8067 PMD 0
[ 1272.884452] Oops: 0010 [#1] SMP
[ 1272.884509] CPU: 13 PID: 3485 Comm: cat Kdump: loaded Tainted: G
[ 1272.884515] task: ffff9a38dbd4d140 ti: ffff9a37cd3b8000 task.ti:
ffff9a37cd3b8000
[ 1272.884517] RIP: 0010:[<0000000000000000>]  [<          (null)>]
(null)
[ 1272.884520] RSP: 0018:ffff9a37cd3bbe68  EFLAGS: 00010203
[ 1272.884522] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000014d5f
[ 1272.884524] RDX: fffffffffffffff4 RSI: 0000000000000001 RDI:
ffff9a38aca4d200
[ 1272.884526] RBP: ffff9a37cd3bbed0 R08: ffff9a38dcd5f1a0 R09:
ffff9a31ffc07300
[ 1272.884527] R10: ffff9a31ffc07300 R11: ffffffffaddd5e9d R12:
ffff9a38b4e0fb00
[ 1272.884529] R13: 0000000000000001 R14: ffff9a37cd3bbf18 R15:
ffff9a38aca4d200
[ 1272.884532] FS:  00007feccaa67740(0000) GS:ffff9a38dcd40000(0000)
knlGS:0000000000000000
[ 1272.884534] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1272.884536] CR2: 0000000000000000 CR3: 00000008267c0000 CR4:
00000000003407e0
[ 1272.884537] Call Trace:
[ 1272.884544]  [<ffffffffade68940>] ? seq_read+0x130/0x440
[ 1272.884548]  [<ffffffffade40f8f>] vfs_read+0x9f/0x170
[ 1272.884552]  [<ffffffffade41e4f>] SyS_read+0x7f/0xf0
[ 1272.884557]  [<ffffffffae374ddb>] system_call_fastpath+0x22/0x27
[ 1272.884558] Code:  Bad RIP value.
[ 1272.884562] RIP  [<          (null)>]           (null)
[ 1272.884564]  RSP <ffff9a37cd3bbe68>
[ 1272.884566] CR2: 0000000000000000

Signed-off-by: Qu Huang <jinsdb@126.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c b/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
index 511712c2e382..673d5e34f213 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_debugfs.c
@@ -33,6 +33,11 @@ static int kfd_debugfs_open(struct inode *inode, struct file *file)
 
 	return single_open(file, show, NULL);
 }
+static int kfd_debugfs_hang_hws_read(struct seq_file *m, void *data)
+{
+	seq_printf(m, "echo gpu_id > hang_hws\n");
+	return 0;
+}
 
 static ssize_t kfd_debugfs_hang_hws_write(struct file *file,
 	const char __user *user_buf, size_t size, loff_t *ppos)
@@ -94,7 +99,7 @@ void kfd_debugfs_init(void)
 	debugfs_create_file("rls", S_IFREG | 0444, debugfs_root,
 			    kfd_debugfs_rls_by_device, &kfd_debugfs_fops);
 	debugfs_create_file("hang_hws", S_IFREG | 0200, debugfs_root,
-			    NULL, &kfd_debugfs_hang_hws_fops);
+			    kfd_debugfs_hang_hws_read, &kfd_debugfs_hang_hws_fops);
 }
 
 void kfd_debugfs_fini(void)
-- 
2.30.2

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

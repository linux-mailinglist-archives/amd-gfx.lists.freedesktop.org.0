Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 182119B0320
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2024 14:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE4610EABF;
	Fri, 25 Oct 2024 12:48:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD0610E949;
 Thu, 24 Oct 2024 13:41:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XZ68p08H7z4f3jdS;
 Thu, 24 Oct 2024 21:24:58 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 7952E1A0568;
 Thu, 24 Oct 2024 21:25:15 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgD3LMmxShpnmfz6Ew--.42902S10;
 Thu, 24 Oct 2024 21:25:15 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: stable@vger.kernel.org, gregkh@linuxfoundation.org, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, viro@zeniv.linux.org.uk, brauner@kernel.org,
 Liam.Howlett@oracle.com, akpm@linux-foundation.org, hughd@google.com,
 willy@infradead.org, sashal@kernel.org, srinivasan.shanmugam@amd.com,
 chiahsuan.chung@amd.com, mingo@kernel.org, mgorman@techsingularity.net,
 yukuai3@huawei.com, chengming.zhou@linux.dev, zhangpeng.00@bytedance.com,
 chuck.lever@oracle.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 maple-tree@lists.infradead.org, linux-mm@kvack.org,
 yukuai1@huaweicloud.com, yi.zhang@huawei.com, yangerkun@huawei.com
Subject: [PATCH 6.6 22/28] libfs: Re-arrange locking in offset_iterate_dir()
Date: Thu, 24 Oct 2024 21:22:19 +0800
Message-Id: <20241024132225.2271667-7-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241024132225.2271667-1-yukuai1@huaweicloud.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
 <20241024132225.2271667-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgD3LMmxShpnmfz6Ew--.42902S10
X-Coremail-Antispam: 1UD129KBjvJXoWxAFWktw1Uur1UZFy8Zw4DCFg_yoW5AFyUpF
 9xGasrGr4fW3WjkaykJF1kZ34S93Z0gr47W395Wwn8XFy3trZ8t3ZFyr4Y9ayUZFZ3Cr47
 XF45t3WS9w4UArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
 xdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
 CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI
 42IY6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
 CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnI
 WIevJa73UjIFyTuYvjTRGg4SUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-Mailman-Approved-At: Fri, 25 Oct 2024 12:48:03 +0000
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

From: Chuck Lever <chuck.lever@oracle.com>

commit 3f6d810665dfde0d33785420618ceb03fba0619d upstream.

Liam and Matthew say that once the RCU read lock is released,
xa_state is not safe to re-use for the next xas_find() call. But the
RCU read lock must be released on each loop iteration so that
dput(), which might_sleep(), can be called safely.

Thus we are forced to walk the offset tree with fresh state for each
directory entry. xa_find() can do this for us, though it might be a
little less efficient than maintaining xa_state locally.

We believe that in the current code base, inode->i_rwsem provides
protection for the xa_state maintained in
offset_iterate_dir(). However, there is no guarantee that will
continue to be the case in the future.

Since offset_iterate_dir() doesn't build xa_state locally any more,
there's no longer a strong need for offset_find_next(). Clean up by
rolling these two helpers together.

Suggested-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Message-ID: <170785993027.11135.8830043889278631735.stgit@91.116.238.104.host.secureserver.net>
Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
Link: https://lore.kernel.org/r/170820142021.6328.15047865406275957018.stgit@91.116.238.104.host.secureserver.net
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/libfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index dc0f7519045f..430f7c95336c 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -401,12 +401,13 @@ static loff_t offset_dir_llseek(struct file *file, loff_t offset, int whence)
 	return vfs_setpos(file, offset, U32_MAX);
 }
 
-static struct dentry *offset_find_next(struct xa_state *xas)
+static struct dentry *offset_find_next(struct offset_ctx *octx, loff_t offset)
 {
 	struct dentry *child, *found = NULL;
+	XA_STATE(xas, &octx->xa, offset);
 
 	rcu_read_lock();
-	child = xas_next_entry(xas, U32_MAX);
+	child = xas_next_entry(&xas, U32_MAX);
 	if (!child)
 		goto out;
 	spin_lock(&child->d_lock);
@@ -429,12 +430,11 @@ static bool offset_dir_emit(struct dir_context *ctx, struct dentry *dentry)
 
 static void *offset_iterate_dir(struct inode *inode, struct dir_context *ctx)
 {
-	struct offset_ctx *so_ctx = inode->i_op->get_offset_ctx(inode);
-	XA_STATE(xas, &so_ctx->xa, ctx->pos);
+	struct offset_ctx *octx = inode->i_op->get_offset_ctx(inode);
 	struct dentry *dentry;
 
 	while (true) {
-		dentry = offset_find_next(&xas);
+		dentry = offset_find_next(octx, ctx->pos);
 		if (!dentry)
 			return ERR_PTR(-ENOENT);
 
@@ -443,8 +443,8 @@ static void *offset_iterate_dir(struct inode *inode, struct dir_context *ctx)
 			break;
 		}
 
+		ctx->pos = dentry2offset(dentry) + 1;
 		dput(dentry);
-		ctx->pos = xas.xa_index + 1;
 	}
 	return NULL;
 }
-- 
2.39.2


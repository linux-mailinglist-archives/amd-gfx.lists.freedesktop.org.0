Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5FD9B030A
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2024 14:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B9D10EAB0;
	Fri, 25 Oct 2024 12:48:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2095410E94C;
 Thu, 24 Oct 2024 13:41:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XZ6661sy8z4f3jdc;
 Thu, 24 Oct 2024 21:22:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id B4AD81A0359;
 Thu, 24 Oct 2024 21:22:55 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgCHusYpShpn7tb6Ew--.444S5;
 Thu, 24 Oct 2024 21:22:54 +0800 (CST)
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
Subject: [PATCH 6.6 01/28] maple_tree: add mt_free_one() and mt_attr() helpers
Date: Thu, 24 Oct 2024 21:19:42 +0800
Message-Id: <20241024132009.2267260-2-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHusYpShpn7tb6Ew--.444S5
X-Coremail-Antispam: 1UD129KBjvJXoWxZryUtF17GFWUCw4xuw48WFg_yoWrur4kpr
 ZrK345tFsavr18G3yxKa1UJ34rXFs3X3yjqa4qkw1DA3Z8Ar1SqFyIv3yrZFWfu3ykG3W3
 Ar4qgw18CF4qyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
 A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
 0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
 IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
 Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
 xKxwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
 kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
 cVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
 IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnI
 WIevJa73UjIFyTuYvjTRCpBTUUUUU
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

From: Peng Zhang <zhangpeng.00@bytedance.com>

commit 4f2267b58a22d972be98edef8e6b3c7a67c9fb91 upstream.

Patch series "Introduce __mt_dup() to improve the performance of fork()", v7.

This series introduces __mt_dup() to improve the performance of fork().
During the duplication process of mmap, all VMAs are traversed and
inserted one by one into the new maple tree, causing the maple tree to be
rebalanced multiple times.  Balancing the maple tree is a costly
operation.  To duplicate VMAs more efficiently, mtree_dup() and __mt_dup()
are introduced for the maple tree.  They can efficiently duplicate a maple
tree.

Here are some algorithmic details about {mtree,__mt}_dup().  We perform a
DFS pre-order traversal of all nodes in the source maple tree.  During
this process, we fully copy the nodes from the source tree to the new
tree.  This involves memory allocation, and when encountering a new node,
if it is a non-leaf node, all its child nodes are allocated at once.

This idea was originally from Liam R.  Howlett's Maple Tree Work email,
and I added some of my own ideas to implement it.  Some previous
discussions can be found in [1].  For a more detailed analysis of the
algorithm, please refer to the logs for patch [3/10] and patch [10/10].

There is a "spawn" in byte-unixbench[2], which can be used to test the
performance of fork().  I modified it slightly to make it work with
different number of VMAs.

Below are the test results.  The first row shows the number of VMAs.  The
second and third rows show the number of fork() calls per ten seconds,
corresponding to next-20231006 and the this patchset, respectively.  The
test results were obtained with CPU binding to avoid scheduler load
balancing that could cause unstable results.  There are still some
fluctuations in the test results, but at least they are better than the
original performance.

21     121   221    421    821    1621   3221   6421   12821  25621  51221
112100 76261 54227  34035  20195  11112  6017   3161   1606   802    393
114558 83067 65008  45824  28751  16072  8922   4747   2436   1233   599
2.19%  8.92% 19.88% 34.64% 42.37% 44.64% 48.28% 50.17% 51.68% 53.74% 52.42%

Thanks to Liam and Matthew for the review.

This patch (of 10):

Add two helpers:
1. mt_free_one(), used to free a maple node.
2. mt_attr(), used to obtain the attributes of maple tree.

Link: https://lkml.kernel.org/r/20231027033845.90608-1-zhangpeng.00@bytedance.com
Link: https://lkml.kernel.org/r/20231027033845.90608-2-zhangpeng.00@bytedance.com
Signed-off-by: Peng Zhang <zhangpeng.00@bytedance.com>
Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mateusz Guzik <mjguzik@gmail.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Mike Christie <michael.christie@oracle.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 lib/maple_tree.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 4e05511c8d1e..e7228bb86ef6 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -165,6 +165,11 @@ static inline int mt_alloc_bulk(gfp_t gfp, size_t size, void **nodes)
 	return kmem_cache_alloc_bulk(maple_node_cache, gfp, size, nodes);
 }
 
+static inline void mt_free_one(struct maple_node *node)
+{
+	kmem_cache_free(maple_node_cache, node);
+}
+
 static inline void mt_free_bulk(size_t size, void __rcu **nodes)
 {
 	kmem_cache_free_bulk(maple_node_cache, size, (void **)nodes);
@@ -205,6 +210,11 @@ static unsigned int mas_mt_height(struct ma_state *mas)
 	return mt_height(mas->tree);
 }
 
+static inline unsigned int mt_attr(struct maple_tree *mt)
+{
+	return mt->ma_flags & ~MT_FLAGS_HEIGHT_MASK;
+}
+
 static inline enum maple_type mte_node_type(const struct maple_enode *entry)
 {
 	return ((unsigned long)entry >> MAPLE_NODE_TYPE_SHIFT) &
@@ -5584,7 +5594,7 @@ void mas_destroy(struct ma_state *mas)
 			mt_free_bulk(count, (void __rcu **)&node->slot[1]);
 			total -= count;
 		}
-		kmem_cache_free(maple_node_cache, node);
+		mt_free_one(ma_mnode_ptr(node));
 		total--;
 	}
 
-- 
2.39.2


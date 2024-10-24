Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A39F9B0302
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2024 14:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE4210EA9D;
	Fri, 25 Oct 2024 12:48:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184EE10E94A;
 Thu, 24 Oct 2024 13:41:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XZ66Q16hFz4f3jdn;
 Thu, 24 Oct 2024 21:22:54 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 9A2AB1A058E;
 Thu, 24 Oct 2024 21:23:11 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgCHusYpShpn7tb6Ew--.444S19;
 Thu, 24 Oct 2024 21:23:11 +0800 (CST)
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
Subject: [PATCH 6.6 15/28] maple_tree: remove mas_searchable()
Date: Thu, 24 Oct 2024 21:19:56 +0800
Message-Id: <20241024132009.2267260-16-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHusYpShpn7tb6Ew--.444S19
X-Coremail-Antispam: 1UD129KBjvJXoWxGr48Jw1UAw1xGFyruw1Dtrb_yoWrAr13pa
 4fCF95tan2qr1UGr4vgw10yr909r97Xw4I9an8Gwn5AFy3tw1Sqr1Yva4FvFZaq34IvF13
 GF1Yqw15Ca17XrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
 xdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
 CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI
 42IY6xIIjxv20xvEc7CjxVAFwI0_Cr1j6rxdMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
 CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnI
 WIevJa73UjIFyTuYvjTRAR6zUUUUU
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

From: "Liam R. Howlett" <Liam.Howlett@oracle.com>

commit 9a40d45c1f2c49273c04938ec3d7849f685eb3c1 upstream.

Now that the status of the maple state is outside of the node, the
mas_searchable() function can be dropped for easier open-coding of what is
going on.

Link: https://lkml.kernel.org/r/20231101171629.3612299-10-Liam.Howlett@oracle.com
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Peng Zhang <zhangpeng.00@bytedance.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 lib/maple_tree.c                 | 66 ++++++++------------------------
 tools/testing/radix-tree/maple.c |  4 +-
 2 files changed, 19 insertions(+), 51 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index f7a1c1cc18eb..f73e3772c883 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -285,17 +285,6 @@ static inline bool mas_is_underflow(struct ma_state *mas)
 	return mas->status == ma_underflow;
 }
 
-static inline bool mas_searchable(struct ma_state *mas)
-{
-	if (mas_is_none(mas))
-		return false;
-
-	if (mas_is_ptr(mas))
-		return false;
-
-	return true;
-}
-
 static __always_inline struct maple_node *mte_to_node(
 		const struct maple_enode *entry)
 {
@@ -6041,12 +6030,11 @@ static __always_inline bool mas_find_setup(struct ma_state *mas, unsigned long m
 
 	}
 
-	if (unlikely(!mas_searchable(mas))) {
-		if (unlikely(mas_is_ptr(mas)))
-			goto ptr_out_of_range;
+	if (unlikely(mas_is_ptr(mas)))
+		goto ptr_out_of_range;
 
+	if (unlikely(mas_is_none(mas)))
 		return true;
-	}
 
 	if (mas->index == max)
 		return true;
@@ -6173,20 +6161,18 @@ static bool mas_find_rev_setup(struct ma_state *mas, unsigned long min,
 			return true;
 	}
 
-	if (unlikely(!mas_searchable(mas))) {
-		if (mas_is_ptr(mas))
-			goto none;
+	if (unlikely(mas_is_ptr(mas)))
+		goto none;
 
-		if (mas_is_none(mas)) {
-			/*
-			 * Walked to the location, and there was nothing so the
-			 * previous location is 0.
-			 */
-			mas->last = mas->index = 0;
-			mas->status = ma_root;
-			*entry = mas_root(mas);
-			return true;
-		}
+	if (unlikely(mas_is_none(mas))) {
+		/*
+		 * Walked to the location, and there was nothing so the previous
+		 * location is 0.
+		 */
+		mas->last = mas->index = 0;
+		mas->status = ma_root;
+		*entry = mas_root(mas);
+		return true;
 	}
 
 active:
@@ -6916,7 +6902,7 @@ void *mt_find(struct maple_tree *mt, unsigned long *index, unsigned long max)
 	if (entry)
 		goto unlock;
 
-	while (mas_searchable(&mas) && (mas.last < max)) {
+	while (mas_is_active(&mas) && (mas.last < max)) {
 		entry = mas_next_entry(&mas, max);
 		if (likely(entry && !xa_is_zero(entry)))
 			break;
@@ -6998,26 +6984,6 @@ unsigned int mt_nr_allocated(void)
 	return kmem_cache_nr_allocated(maple_node_cache);
 }
 
-/*
- * mas_dead_node() - Check if the maple state is pointing to a dead node.
- * @mas: The maple state
- * @index: The index to restore in @mas.
- *
- * Used in test code.
- * Return: 1 if @mas has been reset to MAS_START, 0 otherwise.
- */
-static inline int mas_dead_node(struct ma_state *mas, unsigned long index)
-{
-	if (unlikely(!mas_searchable(mas) || mas_is_start(mas)))
-		return 0;
-
-	if (likely(!mte_dead_node(mas->node)))
-		return 0;
-
-	mas_rewalk(mas, index);
-	return 1;
-}
-
 void mt_cache_shrink(void)
 {
 }
@@ -7569,7 +7535,7 @@ void mt_validate(struct maple_tree *mt)
 	MA_STATE(mas, mt, 0, 0);
 	rcu_read_lock();
 	mas_start(&mas);
-	if (!mas_searchable(&mas))
+	if (!mas_is_active(&mas))
 		goto done;
 
 	while (!mte_is_leaf(mas.node))
diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index d630e86052f9..35cc8c2a10f4 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -974,8 +974,10 @@ static inline void *mas_range_load(struct ma_state *mas,
 	if (likely(mas->offset != MAPLE_NODE_SLOTS))
 		entry = mas_get_slot(mas, mas->offset);
 
-	if (mas_dead_node(mas, index))
+	if (mas_is_active(mas) && mte_dead_node(mas->node)) {
+		mas_set(mas, index);
 		goto retry;
+	}
 
 	return entry;
 }
-- 
2.39.2


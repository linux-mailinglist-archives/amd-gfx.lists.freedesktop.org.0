Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0EF9B0306
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2024 14:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC17410EAAA;
	Fri, 25 Oct 2024 12:48:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A85E10E258;
 Thu, 24 Oct 2024 13:41:38 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4XZ66N2wY2z4f3l8R;
 Thu, 24 Oct 2024 21:22:52 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id C06A61A0194;
 Thu, 24 Oct 2024 21:23:04 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgCHusYpShpn7tb6Ew--.444S13;
 Thu, 24 Oct 2024 21:23:04 +0800 (CST)
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
Subject: [PATCH 6.6 09/28] maple_tree: add end of node tracking to the maple
 state
Date: Thu, 24 Oct 2024 21:19:50 +0800
Message-Id: <20241024132009.2267260-10-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHusYpShpn7tb6Ew--.444S13
X-Coremail-Antispam: 1UD129KBjvJXoWxAFW8WFyDWFyDKFWrAF4fKrg_yoW5try8pa
 1kuryUKrW7tr1xKrZaka18Z348Zrn8Jr4Sq3sFkrnYvF9rt34Sqr1FyFy0vFs0v392vF43
 AF4Y9r48Cws7J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
 bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
 AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1l
 IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
 1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
 CTnIWIevJa73UjIFyTuYvjTRAR6zUUUUU
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

commit 31c532a8af57513228c2b12d281104198ff412b8 upstream.

Analysis of the mas_for_each() iteration showed that there is a
significant time spent finding the end of a node.  This time can be
greatly reduced if the end of the node is cached in the maple state.  Care
must be taken to update & invalidate as necessary.

Link: https://lkml.kernel.org/r/20231101171629.3612299-5-Liam.Howlett@oracle.com
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Peng Zhang <zhangpeng.00@bytedance.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 include/linux/maple_tree.h       | 1 +
 lib/maple_tree.c                 | 7 +++++++
 tools/testing/radix-tree/maple.c | 1 +
 3 files changed, 9 insertions(+)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index b5d5992578c9..0b82efe0cf1e 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -393,6 +393,7 @@ struct ma_state {
 	unsigned char depth;		/* depth of tree descent during write */
 	unsigned char offset;
 	unsigned char mas_flags;
+	unsigned char end;		/* The end of the node */
 };
 
 struct ma_wr_state {
diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index e4d0df3980e0..d19fb14a9635 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -2843,6 +2843,7 @@ static inline void *mtree_range_walk(struct ma_state *mas)
 			goto dead_node;
 	} while (!ma_is_leaf(type));
 
+	mas->end = end;
 	mas->offset = offset;
 	mas->index = min;
 	mas->last = max;
@@ -3509,6 +3510,7 @@ static noinline_for_kasan int mas_commit_b_node(struct ma_wr_state *wr_mas,
 	mas_replace_node(wr_mas->mas, old_enode);
 reuse_node:
 	mas_update_gap(wr_mas->mas);
+	wr_mas->mas->end = b_end;
 	return 1;
 }
 
@@ -4010,6 +4012,7 @@ static inline bool mas_wr_node_store(struct ma_wr_state *wr_mas,
 	}
 	trace_ma_write(__func__, mas, 0, wr_mas->entry);
 	mas_update_gap(mas);
+	mas->end = new_end;
 	return true;
 }
 
@@ -4190,6 +4193,7 @@ static inline bool mas_wr_append(struct ma_wr_state *wr_mas,
 	if (!wr_mas->content || !wr_mas->entry)
 		mas_update_gap(mas);
 
+	mas->end = new_end;
 	trace_ma_write(__func__, mas, new_end, wr_mas->entry);
 	return  true;
 }
@@ -4428,6 +4432,7 @@ static inline int mas_prev_node(struct ma_state *mas, unsigned long min)
 	if (unlikely(mte_dead_node(mas->node)))
 		return 1;
 
+	mas->end = mas->offset;
 	return 0;
 
 no_entry:
@@ -5074,6 +5079,7 @@ int mas_empty_area(struct ma_state *mas, unsigned long min,
 	if (mas->index < min)
 		mas->index = min;
 	mas->last = mas->index + size - 1;
+	mas->end = mas_data_end(mas);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mas_empty_area);
@@ -5134,6 +5140,7 @@ int mas_empty_area_rev(struct ma_state *mas, unsigned long min,
 		mas->last = max;
 
 	mas->index = mas->last - size + 1;
+	mas->end = mas_data_end(mas);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mas_empty_area_rev);
diff --git a/tools/testing/radix-tree/maple.c b/tools/testing/radix-tree/maple.c
index 576b825d6bb1..27a3a31ba662 100644
--- a/tools/testing/radix-tree/maple.c
+++ b/tools/testing/radix-tree/maple.c
@@ -945,6 +945,7 @@ static inline bool mas_tree_walk(struct ma_state *mas, unsigned long *range_min,
 		goto retry;
 	}
 
+	mas->end = mas_data_end(mas);
 	return ret;
 
 not_found:
-- 
2.39.2


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B09B02FA
	for <lists+amd-gfx@lfdr.de>; Fri, 25 Oct 2024 14:48:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72EA10E2BF;
	Fri, 25 Oct 2024 12:48:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 209DD10E94D;
 Thu, 24 Oct 2024 13:41:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.93.142])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XZ66G1Czlz4f3jdY;
 Thu, 24 Oct 2024 21:22:46 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
 by mail.maildlp.com (Postfix) with ESMTP id 9EDAB1A07B6;
 Thu, 24 Oct 2024 21:23:03 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgCHusYpShpn7tb6Ew--.444S12;
 Thu, 24 Oct 2024 21:23:03 +0800 (CST)
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
Subject: [PATCH 6.6 08/28] maple_tree: move debug check to __mas_set_range()
Date: Thu, 24 Oct 2024 21:19:49 +0800
Message-Id: <20241024132009.2267260-9-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
References: <20241024132009.2267260-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCHusYpShpn7tb6Ew--.444S12
X-Coremail-Antispam: 1UD129KBjvJXoWfJw1fuw4UGr1DXr4kKw43GFg_yoWkGFyfpw
 s8GFyUtFWI9F43K34kJa1rXa45CwsIkw10k398Kr1kZ34SkwnaqF1Fk3W2yF45Gay8ArWf
 Cay5t348C3ZrJFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

commit bf857ddd21d0bffc1edafc317e8e2ce0d6d5950c upstream.

__mas_set_range() was created to shortcut resetting the maple state and a
debug check was added to the caller (the vma iterator) to ensure the
internal maple state remains safe to use.  Move the debug check from the
vma iterator into the maple tree itself so other users do not incorrectly
use the advanced maple state modification.

Fallout from this change include a large amount of debug setup needed to
be moved to earlier in the header, and the maple_tree.h radix-tree test
code needed to move the inclusion of the header to after the atomic
define.  None of those changes have functional changes.

Link: https://lkml.kernel.org/r/20231101171629.3612299-4-Liam.Howlett@oracle.com
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Cc: Peng Zhang <zhangpeng.00@bytedance.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 include/linux/maple_tree.h                  | 255 ++++++++++----------
 mm/internal.h                               |   2 -
 tools/testing/radix-tree/linux/maple_tree.h |   2 +-
 3 files changed, 130 insertions(+), 129 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index a452dd8a1e5c..b5d5992578c9 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -557,6 +557,131 @@ static inline void mas_reset(struct ma_state *mas)
  */
 #define mas_for_each(__mas, __entry, __max) \
 	while (((__entry) = mas_find((__mas), (__max))) != NULL)
+
+#ifdef CONFIG_DEBUG_MAPLE_TREE
+enum mt_dump_format {
+	mt_dump_dec,
+	mt_dump_hex,
+};
+
+extern atomic_t maple_tree_tests_run;
+extern atomic_t maple_tree_tests_passed;
+
+void mt_dump(const struct maple_tree *mt, enum mt_dump_format format);
+void mas_dump(const struct ma_state *mas);
+void mas_wr_dump(const struct ma_wr_state *wr_mas);
+void mt_validate(struct maple_tree *mt);
+void mt_cache_shrink(void);
+#define MT_BUG_ON(__tree, __x) do {					\
+	atomic_inc(&maple_tree_tests_run);				\
+	if (__x) {							\
+		pr_info("BUG at %s:%d (%u)\n",				\
+		__func__, __LINE__, __x);				\
+		mt_dump(__tree, mt_dump_hex);				\
+		pr_info("Pass: %u Run:%u\n",				\
+			atomic_read(&maple_tree_tests_passed),		\
+			atomic_read(&maple_tree_tests_run));		\
+		dump_stack();						\
+	} else {							\
+		atomic_inc(&maple_tree_tests_passed);			\
+	}								\
+} while (0)
+
+#define MAS_BUG_ON(__mas, __x) do {					\
+	atomic_inc(&maple_tree_tests_run);				\
+	if (__x) {							\
+		pr_info("BUG at %s:%d (%u)\n",				\
+		__func__, __LINE__, __x);				\
+		mas_dump(__mas);					\
+		mt_dump((__mas)->tree, mt_dump_hex);			\
+		pr_info("Pass: %u Run:%u\n",				\
+			atomic_read(&maple_tree_tests_passed),		\
+			atomic_read(&maple_tree_tests_run));		\
+		dump_stack();						\
+	} else {							\
+		atomic_inc(&maple_tree_tests_passed);			\
+	}								\
+} while (0)
+
+#define MAS_WR_BUG_ON(__wrmas, __x) do {				\
+	atomic_inc(&maple_tree_tests_run);				\
+	if (__x) {							\
+		pr_info("BUG at %s:%d (%u)\n",				\
+		__func__, __LINE__, __x);				\
+		mas_wr_dump(__wrmas);					\
+		mas_dump((__wrmas)->mas);				\
+		mt_dump((__wrmas)->mas->tree, mt_dump_hex);		\
+		pr_info("Pass: %u Run:%u\n",				\
+			atomic_read(&maple_tree_tests_passed),		\
+			atomic_read(&maple_tree_tests_run));		\
+		dump_stack();						\
+	} else {							\
+		atomic_inc(&maple_tree_tests_passed);			\
+	}								\
+} while (0)
+
+#define MT_WARN_ON(__tree, __x)  ({					\
+	int ret = !!(__x);						\
+	atomic_inc(&maple_tree_tests_run);				\
+	if (ret) {							\
+		pr_info("WARN at %s:%d (%u)\n",				\
+		__func__, __LINE__, __x);				\
+		mt_dump(__tree, mt_dump_hex);				\
+		pr_info("Pass: %u Run:%u\n",				\
+			atomic_read(&maple_tree_tests_passed),		\
+			atomic_read(&maple_tree_tests_run));		\
+		dump_stack();						\
+	} else {							\
+		atomic_inc(&maple_tree_tests_passed);			\
+	}								\
+	unlikely(ret);							\
+})
+
+#define MAS_WARN_ON(__mas, __x) ({					\
+	int ret = !!(__x);						\
+	atomic_inc(&maple_tree_tests_run);				\
+	if (ret) {							\
+		pr_info("WARN at %s:%d (%u)\n",				\
+		__func__, __LINE__, __x);				\
+		mas_dump(__mas);					\
+		mt_dump((__mas)->tree, mt_dump_hex);			\
+		pr_info("Pass: %u Run:%u\n",				\
+			atomic_read(&maple_tree_tests_passed),		\
+			atomic_read(&maple_tree_tests_run));		\
+		dump_stack();						\
+	} else {							\
+		atomic_inc(&maple_tree_tests_passed);			\
+	}								\
+	unlikely(ret);							\
+})
+
+#define MAS_WR_WARN_ON(__wrmas, __x) ({					\
+	int ret = !!(__x);						\
+	atomic_inc(&maple_tree_tests_run);				\
+	if (ret) {							\
+		pr_info("WARN at %s:%d (%u)\n",				\
+		__func__, __LINE__, __x);				\
+		mas_wr_dump(__wrmas);					\
+		mas_dump((__wrmas)->mas);				\
+		mt_dump((__wrmas)->mas->tree, mt_dump_hex);		\
+		pr_info("Pass: %u Run:%u\n",				\
+			atomic_read(&maple_tree_tests_passed),		\
+			atomic_read(&maple_tree_tests_run));		\
+		dump_stack();						\
+	} else {							\
+		atomic_inc(&maple_tree_tests_passed);			\
+	}								\
+	unlikely(ret);							\
+})
+#else
+#define MT_BUG_ON(__tree, __x)		BUG_ON(__x)
+#define MAS_BUG_ON(__mas, __x)		BUG_ON(__x)
+#define MAS_WR_BUG_ON(__mas, __x)	BUG_ON(__x)
+#define MT_WARN_ON(__tree, __x)		WARN_ON(__x)
+#define MAS_WARN_ON(__mas, __x)		WARN_ON(__x)
+#define MAS_WR_WARN_ON(__mas, __x)	WARN_ON(__x)
+#endif /* CONFIG_DEBUG_MAPLE_TREE */
+
 /**
  * __mas_set_range() - Set up Maple Tree operation state to a sub-range of the
  * current location.
@@ -570,6 +695,9 @@ static inline void mas_reset(struct ma_state *mas)
 static inline void __mas_set_range(struct ma_state *mas, unsigned long start,
 		unsigned long last)
 {
+	/* Ensure the range starts within the current slot */
+	MAS_WARN_ON(mas, mas_is_active(mas) &&
+		   (mas->index > start || mas->last < start));
 	mas->index = start;
 	mas->last = last;
 }
@@ -587,8 +715,8 @@ static inline void __mas_set_range(struct ma_state *mas, unsigned long start,
 static inline
 void mas_set_range(struct ma_state *mas, unsigned long start, unsigned long last)
 {
-	__mas_set_range(mas, start, last);
 	mas->node = MAS_START;
+	__mas_set_range(mas, start, last);
 }
 
 /**
@@ -713,129 +841,4 @@ void *mt_next(struct maple_tree *mt, unsigned long index, unsigned long max);
 	for (__entry = mt_find(__tree, &(__index), __max); \
 		__entry; __entry = mt_find_after(__tree, &(__index), __max))
 
-
-#ifdef CONFIG_DEBUG_MAPLE_TREE
-enum mt_dump_format {
-	mt_dump_dec,
-	mt_dump_hex,
-};
-
-extern atomic_t maple_tree_tests_run;
-extern atomic_t maple_tree_tests_passed;
-
-void mt_dump(const struct maple_tree *mt, enum mt_dump_format format);
-void mas_dump(const struct ma_state *mas);
-void mas_wr_dump(const struct ma_wr_state *wr_mas);
-void mt_validate(struct maple_tree *mt);
-void mt_cache_shrink(void);
-#define MT_BUG_ON(__tree, __x) do {					\
-	atomic_inc(&maple_tree_tests_run);				\
-	if (__x) {							\
-		pr_info("BUG at %s:%d (%u)\n",				\
-		__func__, __LINE__, __x);				\
-		mt_dump(__tree, mt_dump_hex);				\
-		pr_info("Pass: %u Run:%u\n",				\
-			atomic_read(&maple_tree_tests_passed),		\
-			atomic_read(&maple_tree_tests_run));		\
-		dump_stack();						\
-	} else {							\
-		atomic_inc(&maple_tree_tests_passed);			\
-	}								\
-} while (0)
-
-#define MAS_BUG_ON(__mas, __x) do {					\
-	atomic_inc(&maple_tree_tests_run);				\
-	if (__x) {							\
-		pr_info("BUG at %s:%d (%u)\n",				\
-		__func__, __LINE__, __x);				\
-		mas_dump(__mas);					\
-		mt_dump((__mas)->tree, mt_dump_hex);			\
-		pr_info("Pass: %u Run:%u\n",				\
-			atomic_read(&maple_tree_tests_passed),		\
-			atomic_read(&maple_tree_tests_run));		\
-		dump_stack();						\
-	} else {							\
-		atomic_inc(&maple_tree_tests_passed);			\
-	}								\
-} while (0)
-
-#define MAS_WR_BUG_ON(__wrmas, __x) do {				\
-	atomic_inc(&maple_tree_tests_run);				\
-	if (__x) {							\
-		pr_info("BUG at %s:%d (%u)\n",				\
-		__func__, __LINE__, __x);				\
-		mas_wr_dump(__wrmas);					\
-		mas_dump((__wrmas)->mas);				\
-		mt_dump((__wrmas)->mas->tree, mt_dump_hex);		\
-		pr_info("Pass: %u Run:%u\n",				\
-			atomic_read(&maple_tree_tests_passed),		\
-			atomic_read(&maple_tree_tests_run));		\
-		dump_stack();						\
-	} else {							\
-		atomic_inc(&maple_tree_tests_passed);			\
-	}								\
-} while (0)
-
-#define MT_WARN_ON(__tree, __x)  ({					\
-	int ret = !!(__x);						\
-	atomic_inc(&maple_tree_tests_run);				\
-	if (ret) {							\
-		pr_info("WARN at %s:%d (%u)\n",				\
-		__func__, __LINE__, __x);				\
-		mt_dump(__tree, mt_dump_hex);				\
-		pr_info("Pass: %u Run:%u\n",				\
-			atomic_read(&maple_tree_tests_passed),		\
-			atomic_read(&maple_tree_tests_run));		\
-		dump_stack();						\
-	} else {							\
-		atomic_inc(&maple_tree_tests_passed);			\
-	}								\
-	unlikely(ret);							\
-})
-
-#define MAS_WARN_ON(__mas, __x) ({					\
-	int ret = !!(__x);						\
-	atomic_inc(&maple_tree_tests_run);				\
-	if (ret) {							\
-		pr_info("WARN at %s:%d (%u)\n",				\
-		__func__, __LINE__, __x);				\
-		mas_dump(__mas);					\
-		mt_dump((__mas)->tree, mt_dump_hex);			\
-		pr_info("Pass: %u Run:%u\n",				\
-			atomic_read(&maple_tree_tests_passed),		\
-			atomic_read(&maple_tree_tests_run));		\
-		dump_stack();						\
-	} else {							\
-		atomic_inc(&maple_tree_tests_passed);			\
-	}								\
-	unlikely(ret);							\
-})
-
-#define MAS_WR_WARN_ON(__wrmas, __x) ({					\
-	int ret = !!(__x);						\
-	atomic_inc(&maple_tree_tests_run);				\
-	if (ret) {							\
-		pr_info("WARN at %s:%d (%u)\n",				\
-		__func__, __LINE__, __x);				\
-		mas_wr_dump(__wrmas);					\
-		mas_dump((__wrmas)->mas);				\
-		mt_dump((__wrmas)->mas->tree, mt_dump_hex);		\
-		pr_info("Pass: %u Run:%u\n",				\
-			atomic_read(&maple_tree_tests_passed),		\
-			atomic_read(&maple_tree_tests_run));		\
-		dump_stack();						\
-	} else {							\
-		atomic_inc(&maple_tree_tests_passed);			\
-	}								\
-	unlikely(ret);							\
-})
-#else
-#define MT_BUG_ON(__tree, __x)		BUG_ON(__x)
-#define MAS_BUG_ON(__mas, __x)		BUG_ON(__x)
-#define MAS_WR_BUG_ON(__mas, __x)	BUG_ON(__x)
-#define MT_WARN_ON(__tree, __x)		WARN_ON(__x)
-#define MAS_WARN_ON(__mas, __x)		WARN_ON(__x)
-#define MAS_WR_WARN_ON(__mas, __x)	WARN_ON(__x)
-#endif /* CONFIG_DEBUG_MAPLE_TREE */
-
 #endif /*_LINUX_MAPLE_TREE_H */
diff --git a/mm/internal.h b/mm/internal.h
index ef8d787a510c..8212179b8566 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1068,8 +1068,6 @@ static inline bool vma_soft_dirty_enabled(struct vm_area_struct *vma)
 static inline void vma_iter_config(struct vma_iterator *vmi,
 		unsigned long index, unsigned long last)
 {
-	MAS_BUG_ON(&vmi->mas, vmi->mas.node != MAS_START &&
-		   (vmi->mas.index > index || vmi->mas.last < index));
 	__mas_set_range(&vmi->mas, index, last - 1);
 }
 
diff --git a/tools/testing/radix-tree/linux/maple_tree.h b/tools/testing/radix-tree/linux/maple_tree.h
index 7d8d1f445b89..06c89bdcc515 100644
--- a/tools/testing/radix-tree/linux/maple_tree.h
+++ b/tools/testing/radix-tree/linux/maple_tree.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 #define atomic_t int32_t
-#include "../../../../include/linux/maple_tree.h"
 #define atomic_inc(x) uatomic_inc(x)
 #define atomic_read(x) uatomic_read(x)
 #define atomic_set(x, y) do {} while (0)
 #define U8_MAX UCHAR_MAX
+#include "../../../../include/linux/maple_tree.h"
-- 
2.39.2


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A2491513
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jan 2022 03:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C13701128CB;
	Tue, 18 Jan 2022 02:26:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1A41128CB;
 Tue, 18 Jan 2022 02:26:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4BD76112E;
 Tue, 18 Jan 2022 02:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A77C36AE3;
 Tue, 18 Jan 2022 02:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642472764;
 bh=Z9z2k7+ea3Dsq7vTSGa3vYhfE6fXQi4kHtwHMBIPnx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OnOZ1wrglM/3kiw5fZIqIv3om39Y3rDRpQvCs93MTHQKOuOTGwzlpdoM+bWxi1i2r
 zSjdgJ4lWlXnLG85uSJUh6y9sjAm4FZ7M3EQQggS+fSDYo3LzlvcNeV62ujwBIPsV+
 thDQsXG2Yq+tw5ylRri0wEWr4KAmYf8pBrwnOzGMaIfhe2zuwZHUFmZMl8JNbe7lWR
 RfpA6FSSE0vAHg47DTHJzvCglLMPZ0QE6G3ggYzo/8I/YSXedJ6zBxDcJQU3CTHS+J
 sT0xhIRAh3OuJG4YtLq8TmVvXfVF4AqoCagSAyMzJ4phyYc44eRQnRINx8fnSSzXJh
 iJ2T6yfIXSQDw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 130/217] drm/amdkfd: Fix error handling in
 svm_range_add
Date: Mon, 17 Jan 2022 21:18:13 -0500
Message-Id: <20220118021940.1942199-130-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118021940.1942199-1-sashal@kernel.org>
References: <20220118021940.1942199-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 airlied@linux.ie, Felix Kuehling <Felix.Kuehling@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, Alex Deucher <alexander.deucher@amd.com>,
 Zhou Qingyang <zhou1615@umn.edu>, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

From: Felix Kuehling <Felix.Kuehling@amd.com>

[ Upstream commit 726be40607264b180a2b336c81e1dcff941de618 ]

Add null-pointer check after the last svm_range_new call. This was
originally reported by Zhou Qingyang <zhou1615@umn.edu> based on a
static analyzer.

To avoid duplicating the unwinding code from svm_range_handle_overlap,
I merged the two functions into one.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Zhou Qingyang <zhou1615@umn.edu>
Reviewed-by: Philip Yang <Philip.Yang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 138 ++++++++++-----------------
 1 file changed, 49 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 3cb4681c5f539..c0b8f4ff80b8a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -943,7 +943,7 @@ svm_range_split(struct svm_range *prange, uint64_t start, uint64_t last,
 }
 
 static int
-svm_range_split_tail(struct svm_range *prange, struct svm_range *new,
+svm_range_split_tail(struct svm_range *prange,
 		     uint64_t new_last, struct list_head *insert_list)
 {
 	struct svm_range *tail;
@@ -955,7 +955,7 @@ svm_range_split_tail(struct svm_range *prange, struct svm_range *new,
 }
 
 static int
-svm_range_split_head(struct svm_range *prange, struct svm_range *new,
+svm_range_split_head(struct svm_range *prange,
 		     uint64_t new_start, struct list_head *insert_list)
 {
 	struct svm_range *head;
@@ -1764,49 +1764,54 @@ static struct svm_range *svm_range_clone(struct svm_range *old)
 }
 
 /**
- * svm_range_handle_overlap - split overlap ranges
- * @svms: svm range list header
- * @new: range added with this attributes
- * @start: range added start address, in pages
- * @last: range last address, in pages
- * @update_list: output, the ranges attributes are updated. For set_attr, this
- *               will do validation and map to GPUs. For unmap, this will be
- *               removed and unmap from GPUs
- * @insert_list: output, the ranges will be inserted into svms, attributes are
- *               not changes. For set_attr, this will add into svms.
- * @remove_list:output, the ranges will be removed from svms
- * @left: the remaining range after overlap, For set_attr, this will be added
- *        as new range.
+ * svm_range_add - add svm range and handle overlap
+ * @p: the range add to this process svms
+ * @start: page size aligned
+ * @size: page size aligned
+ * @nattr: number of attributes
+ * @attrs: array of attributes
+ * @update_list: output, the ranges need validate and update GPU mapping
+ * @insert_list: output, the ranges need insert to svms
+ * @remove_list: output, the ranges are replaced and need remove from svms
  *
- * Total have 5 overlap cases.
+ * Check if the virtual address range has overlap with any existing ranges,
+ * split partly overlapping ranges and add new ranges in the gaps. All changes
+ * should be applied to the range_list and interval tree transactionally. If
+ * any range split or allocation fails, the entire update fails. Therefore any
+ * existing overlapping svm_ranges are cloned and the original svm_ranges left
+ * unchanged.
  *
- * This function handles overlap of an address interval with existing
- * struct svm_ranges for applying new attributes. This may require
- * splitting existing struct svm_ranges. All changes should be applied to
- * the range_list and interval tree transactionally. If any split operation
- * fails, the entire update fails. Therefore the existing overlapping
- * svm_ranges are cloned and the original svm_ranges left unchanged. If the
- * transaction succeeds, the modified clones are added and the originals
- * freed. Otherwise the clones are removed and the old svm_ranges remain.
+ * If the transaction succeeds, the caller can update and insert clones and
+ * new ranges, then free the originals.
  *
- * Context: The caller must hold svms->lock
+ * Otherwise the caller can free the clones and new ranges, while the old
+ * svm_ranges remain unchanged.
+ *
+ * Context: Process context, caller must hold svms->lock
+ *
+ * Return:
+ * 0 - OK, otherwise error code
  */
 static int
-svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
-			 unsigned long start, unsigned long last,
-			 struct list_head *update_list,
-			 struct list_head *insert_list,
-			 struct list_head *remove_list,
-			 unsigned long *left)
+svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
+	      uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs,
+	      struct list_head *update_list, struct list_head *insert_list,
+	      struct list_head *remove_list)
 {
+	unsigned long last = start + size - 1UL;
+	struct svm_range_list *svms = &p->svms;
 	struct interval_tree_node *node;
+	struct svm_range new = {0};
 	struct svm_range *prange;
 	struct svm_range *tmp;
 	int r = 0;
 
+	pr_debug("svms 0x%p [0x%llx 0x%lx]\n", &p->svms, start, last);
+
 	INIT_LIST_HEAD(update_list);
 	INIT_LIST_HEAD(insert_list);
 	INIT_LIST_HEAD(remove_list);
+	svm_range_apply_attrs(p, &new, nattr, attrs);
 
 	node = interval_tree_iter_first(&svms->objects, start, last);
 	while (node) {
@@ -1834,14 +1839,14 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 
 			if (node->start < start) {
 				pr_debug("change old range start\n");
-				r = svm_range_split_head(prange, new, start,
+				r = svm_range_split_head(prange, start,
 							 insert_list);
 				if (r)
 					goto out;
 			}
 			if (node->last > last) {
 				pr_debug("change old range last\n");
-				r = svm_range_split_tail(prange, new, last,
+				r = svm_range_split_tail(prange, last,
 							 insert_list);
 				if (r)
 					goto out;
@@ -1853,7 +1858,7 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 			prange = old;
 		}
 
-		if (!svm_range_is_same_attrs(prange, new))
+		if (!svm_range_is_same_attrs(prange, &new))
 			list_add(&prange->update_list, update_list);
 
 		/* insert a new node if needed */
@@ -1873,8 +1878,16 @@ svm_range_handle_overlap(struct svm_range_list *svms, struct svm_range *new,
 		start = next_start;
 	}
 
-	if (left && start <= last)
-		*left = last - start + 1;
+	/* add a final range at the end if needed */
+	if (start <= last) {
+		prange = svm_range_new(svms, start, last);
+		if (!prange) {
+			r = -ENOMEM;
+			goto out;
+		}
+		list_add(&prange->insert_list, insert_list);
+		list_add(&prange->update_list, update_list);
+	}
 
 out:
 	if (r)
@@ -2894,59 +2907,6 @@ svm_range_is_valid(struct kfd_process *p, uint64_t start, uint64_t size)
 				  NULL);
 }
 
-/**
- * svm_range_add - add svm range and handle overlap
- * @p: the range add to this process svms
- * @start: page size aligned
- * @size: page size aligned
- * @nattr: number of attributes
- * @attrs: array of attributes
- * @update_list: output, the ranges need validate and update GPU mapping
- * @insert_list: output, the ranges need insert to svms
- * @remove_list: output, the ranges are replaced and need remove from svms
- *
- * Check if the virtual address range has overlap with the registered ranges,
- * split the overlapped range, copy and adjust pages address and vram nodes in
- * old and new ranges.
- *
- * Context: Process context, caller must hold svms->lock
- *
- * Return:
- * 0 - OK, otherwise error code
- */
-static int
-svm_range_add(struct kfd_process *p, uint64_t start, uint64_t size,
-	      uint32_t nattr, struct kfd_ioctl_svm_attribute *attrs,
-	      struct list_head *update_list, struct list_head *insert_list,
-	      struct list_head *remove_list)
-{
-	uint64_t last = start + size - 1UL;
-	struct svm_range_list *svms;
-	struct svm_range new = {0};
-	struct svm_range *prange;
-	unsigned long left = 0;
-	int r = 0;
-
-	pr_debug("svms 0x%p [0x%llx 0x%llx]\n", &p->svms, start, last);
-
-	svm_range_apply_attrs(p, &new, nattr, attrs);
-
-	svms = &p->svms;
-
-	r = svm_range_handle_overlap(svms, &new, start, last, update_list,
-				     insert_list, remove_list, &left);
-	if (r)
-		return r;
-
-	if (left) {
-		prange = svm_range_new(svms, last - left + 1, last);
-		list_add(&prange->insert_list, insert_list);
-		list_add(&prange->update_list, update_list);
-	}
-
-	return 0;
-}
-
 /**
  * svm_range_best_prefetch_location - decide the best prefetch location
  * @prange: svm range structure
-- 
2.34.1


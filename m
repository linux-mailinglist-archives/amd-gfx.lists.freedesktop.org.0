Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA65453AC6
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Nov 2021 21:18:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8236E15C;
	Tue, 16 Nov 2021 20:18:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 448806E15C;
 Tue, 16 Nov 2021 20:18:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkTczWUOw5HmoJPuipZXMmaGjekhpPxKqaFhrxwX2VKRnAEr8+q/wDe5Q45GsKRVXbo1qTlpF6k3fEDZNgUGO0V8R0k3uw45NQ9EF7D5MMYnrQRsDObBAnPXILyYGCz7bd2baPWX0QoNtXjlSsQG+8fPYVJm6/kqSolaFn2O60smBYTwVv51g9QYbo/yTuIg5h/PR4iDGSLY4dBnDipRCL5f6yCiSKG3XKnNj+/mWp4PjzmSO9tRSrIUgLCC9plekacZqHRFXIbG6emEpdgXTp12zKgYXMAIJwIV6pT2PhZxuUCf/0NoMnT5Exv/jHLHArWGYyrUSBtOe675tH4kUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KR2YatewmtMoyJ+Bn9B4t5Db4aXAJsBzwmbL4b8W0s=;
 b=miZo48OrUxAewnFzILSlL2iahOuVWbuvIiEazZ8S3S0XAhjeB7uw8hACff35apApW30XP+RZmXKiYJ4PX9QwX/Bcsmbm9gIhtriQqgDQwvN95xRw84Q7XzRVGfgbTRqlAl0GWm3bnNFMQ2IMpd49sChw1JZMH9u0nbzO2xFxdyofo9lJmVWGVt2rqjzAJqPB0QOegiJPM6un4g6cmD6wYRxIIL5NyQYgopdJC+v/7mAQbSlNbdKLrM1RIEu8qT8m/BCf27fpHmDtskTdEzXfB/9TynZIyNCkmlDrD7/zYDQDkdkIxmnIBtr+KDWFxjj2CzxVy8t2H+e8P9AyyoofdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KR2YatewmtMoyJ+Bn9B4t5Db4aXAJsBzwmbL4b8W0s=;
 b=3EyOhCNU0aN9kLKI4iJrn4rHxrxUWpdpuo+ddIN+R8YZeDkE/PVrXZo3oKgCRP9zEcoPl1+ZxaeGwQ3OrFzMZoYuFrrln+97AxI27kZDw3uQiPc3SW2h5ncnLl3E7w3AxnLGXVyjdHSieA5kPC66G5lmk4/nDMKBUmm2DSzVcHU=
Received: from CO2PR04CA0099.namprd04.prod.outlook.com (2603:10b6:104:6::25)
 by DM6PR12MB3931.namprd12.prod.outlook.com (2603:10b6:5:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 20:18:33 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:6:cafe::ef) by CO2PR04CA0099.outlook.office365.com
 (2603:10b6:104:6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17 via Frontend
 Transport; Tue, 16 Nov 2021 20:18:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.15 via Frontend Transport; Tue, 16 Nov 2021 20:18:32 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 16 Nov
 2021 14:18:29 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 2/6] drm: improve drm_buddy_alloc function
Date: Wed, 17 Nov 2021 01:48:03 +0530
Message-ID: <20211116201807.147486-2-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
References: <20211116201807.147486-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e65fc3ba-03ef-4981-09cd-08d9a93e42f4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3931:
X-Microsoft-Antispam-PRVS: <DM6PR12MB393168DF5A2A37294B79EABFE4999@DM6PR12MB3931.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBXz+FBnxpWmeTApGH1vG5hOiz3IOm5fIwR/M9xkrLPpJfjEB84rwYUNgYDkUIPGgyHKeOlvI0BLXy07qL4xvwg9Yl65QPKaDE6Ijo3SK70luyKQlMCTzDmJ4qnbpqv0BDuEaTXKxz4E4hAZmXV1gHQRdbPaMwai1RhuGwOhReX1MVPDPZS2UtJ2EEC4IR5SFfUo+5/a8K0cYREEKEckJYSY0P6kKoOEnboXcRYaKMV4/W8+AIUoI6QR5SlnbfoHe3pzbspZ2zxjimEETjzBX1tvd7Y9Nm6yTryltTiu8CwcZh/QVn46OqyuC1T+TSBK4u29nv573iYgqVZcljcm+FtT6SCmuEPu0SzK3V/vxDu4qea6CN14bGnWgEZBaglX9l0asvvY34jD9zLwJ4m0gEk2IA/KDOh+YZTCtCBp4jzVzRqbkyG45rK06ynXznoFhw+MevuiwBck3xDG2Yd+TFbZDR3fCQ66oVV8ffPvX3kDjTEIOe1XoOt0XLeOd02TxOcknCrmrv2KoE2ShHuM/9QHpu34NvmNeUmwC4hCHAQNCPt8rbQsk/EtiOUhvPZh9RpC4RSwsZP44jm2zYsMTT198p6nPJL//kyUZ/th7XIfSdJfwCr61fLDbnH81Gn9sLeMEbc6Zefd+B+5b0mS8xdTBLpG2PWKheJcAIwBbAg326GNVdlD0lrjOSX0kcOf61r0cFz4EK9W1GCBS9vqvN89ewaOOEW5ALycI68Zw9Y=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(5660300002)(83380400001)(2906002)(81166007)(4326008)(1076003)(70586007)(36756003)(508600001)(82310400003)(6666004)(316002)(16526019)(70206006)(426003)(30864003)(336012)(2616005)(36860700001)(186003)(7696005)(26005)(47076005)(110136005)(8676002)(86362001)(54906003)(8936002)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 20:18:32.4402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e65fc3ba-03ef-4981-09cd-08d9a93e42f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3931
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
Cc: daniel@ffwll.ch, Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 jani.nikula@linux.intel.com, matthew.auld@intel.com, tzimmermann@suse.de,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

- Make drm_buddy_alloc a single function to handle
  range allocation and non-range allocation demands

- Implemented a new function alloc_range() which allocates
  the requested power-of-two block comply with range limitations

- Moved order computation and memory alignment logic from
  i915 driver to drm buddy

v2:
  merged below changes to keep the build unbroken
   - drm_buddy_alloc_range() becomes obsolete and may be removed
   - enable ttm range allocation (fpfn / lpfn) support in i915 driver
   - apply enhanced drm_buddy_alloc() function to i915 driver

v3(Matthew Auld):
  - Fix alignment issues and remove unnecessary list_empty check
  - add more validation checks for input arguments
  - make alloc_range() block allocations as bottom-up
  - optimize order computation logic
  - replace uint64_t with u64, which is preferred in the kernel

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 259 ++++++++++--------
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  69 ++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
 include/drm/drm_buddy.h                       |  22 +-
 4 files changed, 203 insertions(+), 149 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index 39eb1d224bec..c9b18a29f8d1 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -274,63 +274,6 @@ void drm_buddy_free_list(struct drm_buddy_mm *mm, struct list_head *objects)
 }
 EXPORT_SYMBOL(drm_buddy_free_list);
 
-/**
- * drm_buddy_alloc - allocate power-of-two blocks
- *
- * @mm: DRM buddy manager to allocate from
- * @order: size of the allocation
- *
- * The order value here translates to:
- *
- * 0 = 2^0 * mm->chunk_size
- * 1 = 2^1 * mm->chunk_size
- * 2 = 2^2 * mm->chunk_size
- *
- * Returns:
- * allocated ptr to the &drm_buddy_block on success
- */
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order)
-{
-	struct drm_buddy_block *block = NULL;
-	unsigned int i;
-	int err;
-
-	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct drm_buddy_block,
-						 link);
-		if (block)
-			break;
-	}
-
-	if (!block)
-		return ERR_PTR(-ENOSPC);
-
-	BUG_ON(!drm_buddy_block_is_free(block));
-
-	while (i != order) {
-		err = split_block(mm, block);
-		if (unlikely(err))
-			goto out_free;
-
-		/* Go low */
-		block = block->left;
-		i--;
-	}
-
-	mark_allocated(block);
-	mm->avail -= drm_buddy_block_size(mm, block);
-	kmemleak_update_trace(block);
-	return block;
-
-out_free:
-	if (i != order)
-		__drm_buddy_free(mm, block);
-	return ERR_PTR(err);
-}
-EXPORT_SYMBOL(drm_buddy_alloc);
-
 static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
 {
 	return s1 <= e2 && e1 >= s2;
@@ -341,52 +284,22 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
 	return s1 <= s2 && e1 >= e2;
 }
 
-/**
- * drm_buddy_alloc_range - allocate range
- *
- * @mm: DRM buddy manager to allocate from
- * @blocks: output list head to add allocated blocks
- * @start: start of the allowed range for this block
- * @size: size of the allocation
- *
- * Intended for pre-allocating portions of the address space, for example to
- * reserve a block for the initial framebuffer or similar, hence the expectation
- * here is that drm_buddy_alloc() is still the main vehicle for
- * allocations, so if that's not the case then the drm_mm range allocator is
- * probably a much better fit, and so you should probably go use that instead.
- *
- * Note that it's safe to chain together multiple alloc_ranges
- * with the same blocks list
- *
- * Returns:
- * 0 on success, error code on failure.
- */
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size)
+static struct drm_buddy_block *
+alloc_range(struct drm_buddy_mm *mm,
+	    u64 start, u64 end,
+	    unsigned int order)
 {
 	struct drm_buddy_block *block;
 	struct drm_buddy_block *buddy;
-	LIST_HEAD(allocated);
 	LIST_HEAD(dfs);
-	u64 end;
 	int err;
 	int i;
 
-	if (size < mm->chunk_size)
-		return -EINVAL;
-
-	if (!IS_ALIGNED(size | start, mm->chunk_size))
-		return -EINVAL;
-
-	if (range_overflows(start, size, mm->size))
-		return -EINVAL;
+	end = end - 1;
 
 	for (i = 0; i < mm->n_roots; ++i)
 		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
 
-	end = start + size - 1;
-
 	do {
 		u64 block_start;
 		u64 block_end;
@@ -399,26 +312,26 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 
 		list_del(&block->tmp_link);
 
+		if (drm_buddy_block_order(block) < order)
+			continue;
+
 		block_start = drm_buddy_block_offset(block);
 		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
 
 		if (!overlaps(start, end, block_start, block_end))
 			continue;
 
-		if (drm_buddy_block_is_allocated(block)) {
-			err = -ENOSPC;
-			goto err_free;
-		}
+		if (drm_buddy_block_is_allocated(block))
+			continue;
 
-		if (contains(start, end, block_start, block_end)) {
-			if (!drm_buddy_block_is_free(block)) {
-				err = -ENOSPC;
-				goto err_free;
-			}
+		if (contains(start, end, block_start, block_end) &&
+		    order == drm_buddy_block_order(block)) {
+			/*
+			 * Find the free block within the range.
+			 */
+			if (drm_buddy_block_is_free(block))
+				return block;
 
-			mark_allocated(block);
-			mm->avail -= drm_buddy_block_size(mm, block);
-			list_add_tail(&block->link, &allocated);
 			continue;
 		}
 
@@ -432,8 +345,7 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 		list_add(&block->left->tmp_link, &dfs);
 	} while (1);
 
-	list_splice_tail(&allocated, blocks);
-	return 0;
+	return ERR_PTR(-ENOSPC);
 
 err_undo:
 	/*
@@ -446,12 +358,145 @@ int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
 	    (drm_buddy_block_is_free(block) &&
 	     drm_buddy_block_is_free(buddy)))
 		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+
+static struct drm_buddy_block *
+alloc_from_freelist(struct drm_buddy_mm *mm,
+		    unsigned int order,
+		    unsigned long flags)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int i;
+	int err;
+
+	for (i = order; i <= mm->max_order; ++i) {
+		block = list_first_entry_or_null(&mm->free_list[i],
+						 struct drm_buddy_block,
+						 link);
+		if (block)
+			break;
+	}
+
+	if (!block)
+		return ERR_PTR(-ENOSPC);
+
+	BUG_ON(!drm_buddy_block_is_free(block));
+
+	while (i != order) {
+		err = split_block(mm, block);
+		if (unlikely(err))
+			goto err_undo;
+
+		block = block->right;
+		i--;
+	}
+	return block;
+
+err_undo:
+	if (i != order)
+		__drm_buddy_free(mm, block);
+	return ERR_PTR(err);
+}
+
+/**
+ * drm_buddy_alloc - allocate power-of-two blocks
+ *
+ * @mm: DRM buddy manager to allocate from
+ * @start: start of the allowed range for this block
+ * @end: end of the allowed range for this block
+ * @size: size of the allocation
+ * @min_page_size: alignment of the allocation
+ * @blocks: output list head to add allocated blocks
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
+ *
+ * alloc_range() called on range limitations, which traverses
+ * the tree and returns the desired block.
+ *
+ * alloc_from_freelist() called when *no* range restrictions
+ * are enforced, which picks the block from the freelist.
+ *
+ * blocks are allocated in order, the order value here translates to:
+ *
+ * 0 = 2^0 * mm->chunk_size
+ * 1 = 2^1 * mm->chunk_size
+ * 2 = 2^2 * mm->chunk_size
+ *
+ * Returns:
+ * 0 on success, error code on failure.
+ */
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags)
+{
+	struct drm_buddy_block *block = NULL;
+	unsigned int min_order, order;
+	unsigned long pages;
+	LIST_HEAD(allocated);
+	int err;
+
+	if (size < mm->chunk_size)
+		return -EINVAL;
+
+	if (min_page_size < mm->chunk_size)
+		return -EINVAL;
+
+	if (!is_power_of_2(min_page_size))
+		return -EINVAL;
+
+	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
+		return -EINVAL;
+
+	if (check_range_overflow(start, end, size, mm->size))
+		return -EINVAL;
+
+	pages = size >> ilog2(mm->chunk_size);
+	order = fls(pages) - 1;
+	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
+
+	do {
+		order = min(order, (unsigned int)fls(pages) - 1);
+		BUG_ON(order > mm->max_order);
+		BUG_ON(order < min_order);
+
+		do {
+			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
+				/* Allocate traversing within the range */
+				block = alloc_range(mm, start, end, order);
+			else
+				/* Allocate from freelist */
+				block = alloc_from_freelist(mm, order, flags);
+
+			if (!IS_ERR(block))
+				break;
+
+			if (order-- == min_order) {
+				err = -ENOSPC;
+				goto err_free;
+			}
+		} while (1);
+
+		mark_allocated(block);
+		mm->avail -= drm_buddy_block_size(mm, block);
+		kmemleak_update_trace(block);
+		list_add_tail(&block->link, &allocated);
+
+		pages -= BIT(order);
+
+		if (!pages)
+			break;
+	} while (1);
+
+	list_splice_tail(&allocated, blocks);
+	return 0;
 
 err_free:
 	drm_buddy_free_list(mm, &allocated);
 	return err;
 }
-EXPORT_SYMBOL(drm_buddy_alloc_range);
+EXPORT_SYMBOL(drm_buddy_alloc);
 
 /**
  * drm_buddy_block_print - print block information
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index c4b70cb8c248..9e3d130c3f42 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct i915_ttm_buddy_resource *bman_res;
 	struct drm_buddy_mm *mm = &bman->mm;
-	unsigned long n_pages;
-	unsigned int min_order;
+	unsigned long n_pages, lpfn;
 	u64 min_page_size;
 	u64 size;
 	int err;
 
-	GEM_BUG_ON(place->fpfn || place->lpfn);
+	lpfn = place->lpfn;
+	if (!lpfn)
+		lpfn = man->size;
 
 	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
 	if (!bman_res)
@@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->fpfn || lpfn != man->size)
+		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
 	GEM_BUG_ON(!bman_res->base.num_pages);
 	size = bman_res->base.num_pages << PAGE_SHIFT;
 
@@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		min_page_size = bo->page_alignment << PAGE_SHIFT;
 
 	GEM_BUG_ON(min_page_size < mm->chunk_size);
-	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
+
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
+		unsigned long pages;
+
 		size = roundup_pow_of_two(size);
-		min_order = ilog2(size) - ilog2(mm->chunk_size);
+		min_page_size = size;
+
+		pages = size >> ilog2(mm->chunk_size);
+		if (pages > lpfn)
+			lpfn = pages;
 	}
 
 	if (size > mm->size) {
@@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 
 	n_pages = size >> ilog2(mm->chunk_size);
 
-	do {
-		struct drm_buddy_block *block;
-		unsigned int order;
-
-		order = fls(n_pages) - 1;
-		GEM_BUG_ON(order > mm->max_order);
-		GEM_BUG_ON(order < min_order);
-
-		do {
-			mutex_lock(&bman->lock);
-			block = drm_buddy_alloc(mm, order);
-			mutex_unlock(&bman->lock);
-			if (!IS_ERR(block))
-				break;
-
-			if (order-- == min_order) {
-				err = -ENOSPC;
-				goto err_free_blocks;
-			}
-		} while (1);
-
-		n_pages -= BIT(order);
-
-		list_add_tail(&block->link, &bman_res->blocks);
-
-		if (!n_pages)
-			break;
-	} while (1);
+	mutex_lock(&bman->lock);
+	err = drm_buddy_alloc(mm, (u64)place->fpfn << PAGE_SHIFT,
+			(u64)place->lpfn << PAGE_SHIFT,
+			(u64)n_pages << PAGE_SHIFT,
+			 min_page_size,
+			 &bman_res->blocks,
+			 bman_res->flags);
+	mutex_unlock(&bman->lock);
+	if (unlikely(err))
+		goto err_free_blocks;
 
 	*res = &bman_res->base;
 	return 0;
@@ -266,10 +258,19 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
 {
 	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
 	struct drm_buddy_mm *mm = &bman->mm;
+	unsigned long flags = 0;
+	u64 min_size;
 	int ret;
 
+	min_size = size;
+	flags |= DRM_BUDDY_RANGE_ALLOCATION;
+
 	mutex_lock(&bman->lock);
-	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
+	ret = drm_buddy_alloc(mm, start,
+			start + size,
+			size, min_size,
+			&bman->reserved,
+			flags);
 	mutex_unlock(&bman->lock);
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
index fa644b512c2e..5ba490875f66 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
@@ -20,6 +20,7 @@ struct drm_buddy_mm;
  *
  * @base: struct ttm_resource base class we extend
  * @blocks: the list of struct i915_buddy_block for this resource/allocation
+ * @flags: DRM_BUDDY_*_ALLOCATION flags
  * @mm: the struct i915_buddy_mm for this resource
  *
  * Extends the struct ttm_resource to manage an address space allocation with
@@ -28,6 +29,7 @@ struct drm_buddy_mm;
 struct i915_ttm_buddy_resource {
 	struct ttm_resource base;
 	struct list_head blocks;
+	unsigned long flags;
 	struct drm_buddy_mm *mm;
 };
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 5ce3fc702f80..2ec3cbc9d5d7 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -13,15 +13,22 @@
 
 #include <drm/drm_print.h>
 
-#define range_overflows(start, size, max) ({ \
+#define check_range_overflow(start, end, size, max) ({ \
 	typeof(start) start__ = (start); \
+	typeof(end) end__ = (end);\
 	typeof(size) size__ = (size); \
 	typeof(max) max__ = (max); \
 	(void)(&start__ == &size__); \
 	(void)(&start__ == &max__); \
-	start__ >= max__ || size__ > max__ - start__; \
+	(void)(&start__ == &end__); \
+	(void)(&end__ == &size__); \
+	(void)(&end__ == &max__); \
+	start__ >= max__ || end__ > max__ || \
+	size__ > end__ - start__; \
 })
 
+#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
 #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
@@ -131,12 +138,11 @@ int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size);
 
 void drm_buddy_fini(struct drm_buddy_mm *mm);
 
-struct drm_buddy_block *
-drm_buddy_alloc(struct drm_buddy_mm *mm, unsigned int order);
-
-int drm_buddy_alloc_range(struct drm_buddy_mm *mm,
-			  struct list_head *blocks,
-			  u64 start, u64 size);
+int drm_buddy_alloc(struct drm_buddy_mm *mm,
+		    u64 start, u64 end, u64 size,
+		    u64 min_page_size,
+		    struct list_head *blocks,
+		    unsigned long flags);
 
 void drm_buddy_free(struct drm_buddy_mm *mm, struct drm_buddy_block *block);
 
-- 
2.25.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7034DC7DC
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Mar 2022 14:50:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4852E10EBC4;
	Thu, 17 Mar 2022 13:50:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B6310EBD0
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Mar 2022 13:50:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id x34so5478723ede.8
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Mar 2022 06:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4x9kakREUnd9erTm4ObaOh2jUoicNSoXfh7dLu9EZAQ=;
 b=hQT+NgE5SreVoZhDs2RbRgg5kiuE7W5pfVhGzybX5014sJ6x6Ie+fsN3BRfiG8t3Gh
 G6N6j6zUWwQmjBrFDmjx9YT6ZK3s3zaK2J84+Jf8wmUSwRNQSyToMCdh4KLAM+50XD/S
 eeEtrGlra3StI+fSV21yqftZSfVk02kB79/yp3DY93hQcDBCV+0THeUTrnSSnW0puu/j
 qFgZzt3sHjTmkMK5qTZ7ZvTn7jvUfK8uFL5At3iCFCR5YjLfZ9oTQVKTfstdncXxJp5p
 cFpypa8jx3O5qaqW9iMWwdfynoyobX4mm8p33B4eiv53kpNnyU0WdvhhP3nQyNwE43H0
 g/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4x9kakREUnd9erTm4ObaOh2jUoicNSoXfh7dLu9EZAQ=;
 b=H+1qDOw86/FTBlAGAJZZi/dLqSChGal1DKLs0BBDI05OhN0J2erdExR5Irun6iYY6x
 YD5if8s6XfEwhupDQQQXfXuWN2TEMvgtwiObofZadYo8GFyfhs0l6I81nyEAJEL5WK2L
 XbnX1Vjej34xpig2LiqryJpCI52ba3CW3N/9rGKIjtCkYA5nrAAFyM/ki7QV6E8a4UAx
 traymY5VRSRrAkDhCX7vzlFSZW+wNFg2LeI8sBJsK7msIxUIQ0k+SmuSGBn/g7I7k4+X
 W2eOybedCt6gaUVc0Q5iFfJ2E0E7Zh3KlDV3sYN/EUu55NRRE5HCRkVqok8pa0iDq+83
 EKjg==
X-Gm-Message-State: AOAM533wls2sgR6+Jvd2t+eynwFDkKU1ivVpwdmIxkJDE5CzXRThW9/Z
 zqRYDwGHSqiAikMdHikFrJ3LIUr04OE=
X-Google-Smtp-Source: ABdhPJycGj46KiwXlQ/9X84RcEyJVfzWvcLzUtbflVGJRF8B/RuNqxnsRyDD8Afe1CMv914ogdCtDg==
X-Received: by 2002:a05:6402:486:b0:413:bd00:4f3f with SMTP id
 k6-20020a056402048600b00413bd004f3fmr4532211edv.103.1647525047216; 
 Thu, 17 Mar 2022 06:50:47 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a056402254900b00416b0ec98b5sm2706721edb.45.2022.03.17.06.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 06:50:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	Felix.Kuehling@amd.com
Subject: [PATCH 2/7] drm/amdgpu: separate VM PT handling into amdgpu_vm_pt.c
Date: Thu, 17 Mar 2022 14:50:39 +0100
Message-Id: <20220317135044.2099-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317135044.2099-1-christian.koenig@amd.com>
References: <20220317135044.2099-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Separate the VM page table backend operations from the state machine since
the amdgpu_vm.c file is becoming to complex.

The allocating, freeing and updating page tables and page directories can
easily be moved into a separate file.

While at it cleanup everything checkpatch.pl reported and rename the
functions a bit to make more clear that they belong together.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Makefile       |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    | 953 +--------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h    |  16 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 979 ++++++++++++++++++++++
 4 files changed, 1006 insertions(+), 944 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c

diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 5dfe08cb045e..9221cc4520a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -49,7 +49,7 @@ amdgpu-y += amdgpu_device.o amdgpu_kms.o \
 	amdgpu_cs.o amdgpu_bios.o amdgpu_benchmark.o \
 	atombios_dp.o amdgpu_afmt.o amdgpu_trace_points.o \
 	atombios_encoders.o amdgpu_sa.o atombios_i2c.o \
-	amdgpu_dma_buf.o amdgpu_vm.o amdgpu_ib.o amdgpu_pll.o \
+	amdgpu_dma_buf.o amdgpu_vm.o amdgpu_vm_pt.o amdgpu_ib.o amdgpu_pll.o \
 	amdgpu_ucode.o amdgpu_bo_list.o amdgpu_ctx.o amdgpu_sync.o \
 	amdgpu_gtt_mgr.o amdgpu_preempt_mgr.o amdgpu_vram_mgr.o amdgpu_virt.o \
 	amdgpu_atomfirmware.o amdgpu_vf_error.o amdgpu_sched.o \
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index eb9b86466336..accebbac2f29 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -154,108 +154,6 @@ static inline void amdgpu_vm_eviction_unlock(struct amdgpu_vm *vm)
 	mutex_unlock(&vm->eviction_lock);
 }
 
-/**
- * amdgpu_vm_level_shift - return the addr shift for each level
- *
- * @adev: amdgpu_device pointer
- * @level: VMPT level
- *
- * Returns:
- * The number of bits the pfn needs to be right shifted for a level.
- */
-static unsigned amdgpu_vm_level_shift(struct amdgpu_device *adev,
-				      unsigned level)
-{
-	switch (level) {
-	case AMDGPU_VM_PDB2:
-	case AMDGPU_VM_PDB1:
-	case AMDGPU_VM_PDB0:
-		return 9 * (AMDGPU_VM_PDB0 - level) +
-			adev->vm_manager.block_size;
-	case AMDGPU_VM_PTB:
-		return 0;
-	default:
-		return ~0;
-	}
-}
-
-/**
- * amdgpu_vm_num_entries - return the number of entries in a PD/PT
- *
- * @adev: amdgpu_device pointer
- * @level: VMPT level
- *
- * Returns:
- * The number of entries in a page directory or page table.
- */
-static unsigned amdgpu_vm_num_entries(struct amdgpu_device *adev,
-				      unsigned level)
-{
-	unsigned shift = amdgpu_vm_level_shift(adev,
-					       adev->vm_manager.root_level);
-
-	if (level == adev->vm_manager.root_level)
-		/* For the root directory */
-		return round_up(adev->vm_manager.max_pfn, 1ULL << shift)
-			>> shift;
-	else if (level != AMDGPU_VM_PTB)
-		/* Everything in between */
-		return 512;
-	else
-		/* For the page tables on the leaves */
-		return AMDGPU_VM_PTE_COUNT(adev);
-}
-
-/**
- * amdgpu_vm_num_ats_entries - return the number of ATS entries in the root PD
- *
- * @adev: amdgpu_device pointer
- *
- * Returns:
- * The number of entries in the root page directory which needs the ATS setting.
- */
-static unsigned amdgpu_vm_num_ats_entries(struct amdgpu_device *adev)
-{
-	unsigned shift;
-
-	shift = amdgpu_vm_level_shift(adev, adev->vm_manager.root_level);
-	return AMDGPU_GMC_HOLE_START >> (shift + AMDGPU_GPU_PAGE_SHIFT);
-}
-
-/**
- * amdgpu_vm_entries_mask - the mask to get the entry number of a PD/PT
- *
- * @adev: amdgpu_device pointer
- * @level: VMPT level
- *
- * Returns:
- * The mask to extract the entry number of a PD/PT from an address.
- */
-static uint32_t amdgpu_vm_entries_mask(struct amdgpu_device *adev,
-				       unsigned int level)
-{
-	if (level <= adev->vm_manager.root_level)
-		return 0xffffffff;
-	else if (level != AMDGPU_VM_PTB)
-		return 0x1ff;
-	else
-		return AMDGPU_VM_PTE_COUNT(adev) - 1;
-}
-
-/**
- * amdgpu_vm_bo_size - returns the size of the BOs in bytes
- *
- * @adev: amdgpu_device pointer
- * @level: VMPT level
- *
- * Returns:
- * The size of the BO for a page directory or page table in bytes.
- */
-static unsigned amdgpu_vm_bo_size(struct amdgpu_device *adev, unsigned level)
-{
-	return AMDGPU_GPU_PAGE_ALIGN(amdgpu_vm_num_entries(adev, level) * 8);
-}
-
 /**
  * amdgpu_vm_bo_evicted - vm_bo is evicted
  *
@@ -358,9 +256,8 @@ static void amdgpu_vm_bo_done(struct amdgpu_vm_bo_base *vm_bo)
  * Initialize a bo_va_base structure and add it to the appropriate lists
  *
  */
-static void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
-				   struct amdgpu_vm *vm,
-				   struct amdgpu_bo *bo)
+void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
+			    struct amdgpu_vm *vm, struct amdgpu_bo *bo)
 {
 	base->vm = vm;
 	base->bo = bo;
@@ -395,228 +292,6 @@ static void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
 	amdgpu_vm_bo_evicted(base);
 }
 
-/**
- * amdgpu_vm_pt_parent - get the parent page directory
- *
- * @pt: child page table
- *
- * Helper to get the parent entry for the child page table. NULL if we are at
- * the root page directory.
- */
-static struct amdgpu_vm_bo_base *amdgpu_vm_pt_parent(struct amdgpu_vm_bo_base *pt)
-{
-	struct amdgpu_bo *parent = pt->bo->parent;
-
-	if (!parent)
-		return NULL;
-
-	return parent->vm_bo;
-}
-
-/*
- * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
- */
-struct amdgpu_vm_pt_cursor {
-	uint64_t pfn;
-	struct amdgpu_vm_bo_base *parent;
-	struct amdgpu_vm_bo_base *entry;
-	unsigned level;
-};
-
-/**
- * amdgpu_vm_pt_start - start PD/PT walk
- *
- * @adev: amdgpu_device pointer
- * @vm: amdgpu_vm structure
- * @start: start address of the walk
- * @cursor: state to initialize
- *
- * Initialize a amdgpu_vm_pt_cursor to start a walk.
- */
-static void amdgpu_vm_pt_start(struct amdgpu_device *adev,
-			       struct amdgpu_vm *vm, uint64_t start,
-			       struct amdgpu_vm_pt_cursor *cursor)
-{
-	cursor->pfn = start;
-	cursor->parent = NULL;
-	cursor->entry = &vm->root;
-	cursor->level = adev->vm_manager.root_level;
-}
-
-/**
- * amdgpu_vm_pt_descendant - go to child node
- *
- * @adev: amdgpu_device pointer
- * @cursor: current state
- *
- * Walk to the child node of the current node.
- * Returns:
- * True if the walk was possible, false otherwise.
- */
-static bool amdgpu_vm_pt_descendant(struct amdgpu_device *adev,
-				    struct amdgpu_vm_pt_cursor *cursor)
-{
-	unsigned mask, shift, idx;
-
-	if ((cursor->level == AMDGPU_VM_PTB) || !cursor->entry ||
-	    !cursor->entry->bo)
-		return false;
-
-	mask = amdgpu_vm_entries_mask(adev, cursor->level);
-	shift = amdgpu_vm_level_shift(adev, cursor->level);
-
-	++cursor->level;
-	idx = (cursor->pfn >> shift) & mask;
-	cursor->parent = cursor->entry;
-	cursor->entry = &to_amdgpu_bo_vm(cursor->entry->bo)->entries[idx];
-	return true;
-}
-
-/**
- * amdgpu_vm_pt_sibling - go to sibling node
- *
- * @adev: amdgpu_device pointer
- * @cursor: current state
- *
- * Walk to the sibling node of the current node.
- * Returns:
- * True if the walk was possible, false otherwise.
- */
-static bool amdgpu_vm_pt_sibling(struct amdgpu_device *adev,
-				 struct amdgpu_vm_pt_cursor *cursor)
-{
-	unsigned shift, num_entries;
-
-	/* Root doesn't have a sibling */
-	if (!cursor->parent)
-		return false;
-
-	/* Go to our parents and see if we got a sibling */
-	shift = amdgpu_vm_level_shift(adev, cursor->level - 1);
-	num_entries = amdgpu_vm_num_entries(adev, cursor->level - 1);
-
-	if (cursor->entry == &to_amdgpu_bo_vm(cursor->parent->bo)->entries[num_entries - 1])
-		return false;
-
-	cursor->pfn += 1ULL << shift;
-	cursor->pfn &= ~((1ULL << shift) - 1);
-	++cursor->entry;
-	return true;
-}
-
-/**
- * amdgpu_vm_pt_ancestor - go to parent node
- *
- * @cursor: current state
- *
- * Walk to the parent node of the current node.
- * Returns:
- * True if the walk was possible, false otherwise.
- */
-static bool amdgpu_vm_pt_ancestor(struct amdgpu_vm_pt_cursor *cursor)
-{
-	if (!cursor->parent)
-		return false;
-
-	--cursor->level;
-	cursor->entry = cursor->parent;
-	cursor->parent = amdgpu_vm_pt_parent(cursor->parent);
-	return true;
-}
-
-/**
- * amdgpu_vm_pt_next - get next PD/PT in hieratchy
- *
- * @adev: amdgpu_device pointer
- * @cursor: current state
- *
- * Walk the PD/PT tree to the next node.
- */
-static void amdgpu_vm_pt_next(struct amdgpu_device *adev,
-			      struct amdgpu_vm_pt_cursor *cursor)
-{
-	/* First try a newborn child */
-	if (amdgpu_vm_pt_descendant(adev, cursor))
-		return;
-
-	/* If that didn't worked try to find a sibling */
-	while (!amdgpu_vm_pt_sibling(adev, cursor)) {
-		/* No sibling, go to our parents and grandparents */
-		if (!amdgpu_vm_pt_ancestor(cursor)) {
-			cursor->pfn = ~0ll;
-			return;
-		}
-	}
-}
-
-/**
- * amdgpu_vm_pt_first_dfs - start a deep first search
- *
- * @adev: amdgpu_device structure
- * @vm: amdgpu_vm structure
- * @start: optional cursor to start with
- * @cursor: state to initialize
- *
- * Starts a deep first traversal of the PD/PT tree.
- */
-static void amdgpu_vm_pt_first_dfs(struct amdgpu_device *adev,
-				   struct amdgpu_vm *vm,
-				   struct amdgpu_vm_pt_cursor *start,
-				   struct amdgpu_vm_pt_cursor *cursor)
-{
-	if (start)
-		*cursor = *start;
-	else
-		amdgpu_vm_pt_start(adev, vm, 0, cursor);
-	while (amdgpu_vm_pt_descendant(adev, cursor));
-}
-
-/**
- * amdgpu_vm_pt_continue_dfs - check if the deep first search should continue
- *
- * @start: starting point for the search
- * @entry: current entry
- *
- * Returns:
- * True when the search should continue, false otherwise.
- */
-static bool amdgpu_vm_pt_continue_dfs(struct amdgpu_vm_pt_cursor *start,
-				      struct amdgpu_vm_bo_base *entry)
-{
-	return entry && (!start || entry != start->entry);
-}
-
-/**
- * amdgpu_vm_pt_next_dfs - get the next node for a deep first search
- *
- * @adev: amdgpu_device structure
- * @cursor: current state
- *
- * Move the cursor to the next node in a deep first search.
- */
-static void amdgpu_vm_pt_next_dfs(struct amdgpu_device *adev,
-				  struct amdgpu_vm_pt_cursor *cursor)
-{
-	if (!cursor->entry)
-		return;
-
-	if (!cursor->parent)
-		cursor->entry = NULL;
-	else if (amdgpu_vm_pt_sibling(adev, cursor))
-		while (amdgpu_vm_pt_descendant(adev, cursor));
-	else
-		amdgpu_vm_pt_ancestor(cursor);
-}
-
-/*
- * for_each_amdgpu_vm_pt_dfs_safe - safe deep first search of all PDs/PTs
- */
-#define for_each_amdgpu_vm_pt_dfs_safe(adev, vm, start, cursor, entry)		\
-	for (amdgpu_vm_pt_first_dfs((adev), (vm), (start), &(cursor)),		\
-	     (entry) = (cursor).entry, amdgpu_vm_pt_next_dfs((adev), &(cursor));\
-	     amdgpu_vm_pt_continue_dfs((start), (entry));			\
-	     (entry) = (cursor).entry, amdgpu_vm_pt_next_dfs((adev), &(cursor)))
-
 /**
  * amdgpu_vm_get_pd_bo - add the VM PD to a validation list
  *
@@ -783,312 +458,6 @@ bool amdgpu_vm_ready(struct amdgpu_vm *vm)
 	return ret && list_empty(&vm->evicted);
 }
 
-/**
- * amdgpu_vm_clear_bo - initially clear the PDs/PTs
- *
- * @adev: amdgpu_device pointer
- * @vm: VM to clear BO from
- * @vmbo: BO to clear
- * @immediate: use an immediate update
- *
- * Root PD needs to be reserved when calling this.
- *
- * Returns:
- * 0 on success, errno otherwise.
- */
-static int amdgpu_vm_clear_bo(struct amdgpu_device *adev,
-			      struct amdgpu_vm *vm,
-			      struct amdgpu_bo_vm *vmbo,
-			      bool immediate)
-{
-	struct ttm_operation_ctx ctx = { true, false };
-	unsigned level = adev->vm_manager.root_level;
-	struct amdgpu_vm_update_params params;
-	struct amdgpu_bo *ancestor = &vmbo->bo;
-	struct amdgpu_bo *bo = &vmbo->bo;
-	unsigned entries, ats_entries;
-	uint64_t addr;
-	int r, idx;
-
-	/* Figure out our place in the hierarchy */
-	if (ancestor->parent) {
-		++level;
-		while (ancestor->parent->parent) {
-			++level;
-			ancestor = ancestor->parent;
-		}
-	}
-
-	entries = amdgpu_bo_size(bo) / 8;
-	if (!vm->pte_support_ats) {
-		ats_entries = 0;
-
-	} else if (!bo->parent) {
-		ats_entries = amdgpu_vm_num_ats_entries(adev);
-		ats_entries = min(ats_entries, entries);
-		entries -= ats_entries;
-
-	} else {
-		struct amdgpu_vm_bo_base *pt;
-
-		pt = ancestor->vm_bo;
-		ats_entries = amdgpu_vm_num_ats_entries(adev);
-		if ((pt - to_amdgpu_bo_vm(vm->root.bo)->entries) >= ats_entries) {
-			ats_entries = 0;
-		} else {
-			ats_entries = entries;
-			entries = 0;
-		}
-	}
-
-	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
-	if (r)
-		return r;
-
-	if (vmbo->shadow) {
-		struct amdgpu_bo *shadow = vmbo->shadow;
-
-		r = ttm_bo_validate(&shadow->tbo, &shadow->placement, &ctx);
-		if (r)
-			return r;
-	}
-
-	if (!drm_dev_enter(adev_to_drm(adev), &idx))
-		return -ENODEV;
-
-	r = vm->update_funcs->map_table(vmbo);
-	if (r)
-		goto exit;
-
-	memset(&params, 0, sizeof(params));
-	params.adev = adev;
-	params.vm = vm;
-	params.immediate = immediate;
-
-	r = vm->update_funcs->prepare(&params, NULL, AMDGPU_SYNC_EXPLICIT);
-	if (r)
-		goto exit;
-
-	addr = 0;
-	if (ats_entries) {
-		uint64_t value = 0, flags;
-
-		flags = AMDGPU_PTE_DEFAULT_ATC;
-		if (level != AMDGPU_VM_PTB) {
-			/* Handle leaf PDEs as PTEs */
-			flags |= AMDGPU_PDE_PTE;
-			amdgpu_gmc_get_vm_pde(adev, level, &value, &flags);
-		}
-
-		r = vm->update_funcs->update(&params, vmbo, addr, 0, ats_entries,
-					     value, flags);
-		if (r)
-			goto exit;
-
-		addr += ats_entries * 8;
-	}
-
-	if (entries) {
-		uint64_t value = 0, flags = 0;
-
-		if (adev->asic_type >= CHIP_VEGA10) {
-			if (level != AMDGPU_VM_PTB) {
-				/* Handle leaf PDEs as PTEs */
-				flags |= AMDGPU_PDE_PTE;
-				amdgpu_gmc_get_vm_pde(adev, level,
-						      &value, &flags);
-			} else {
-				/* Workaround for fault priority problem on GMC9 */
-				flags = AMDGPU_PTE_EXECUTABLE;
-			}
-		}
-
-		r = vm->update_funcs->update(&params, vmbo, addr, 0, entries,
-					     value, flags);
-		if (r)
-			goto exit;
-	}
-
-	r = vm->update_funcs->commit(&params, NULL);
-exit:
-	drm_dev_exit(idx);
-	return r;
-}
-
-/**
- * amdgpu_vm_pt_create - create bo for PD/PT
- *
- * @adev: amdgpu_device pointer
- * @vm: requesting vm
- * @level: the page table level
- * @immediate: use a immediate update
- * @vmbo: pointer to the buffer object pointer
- */
-static int amdgpu_vm_pt_create(struct amdgpu_device *adev,
-			       struct amdgpu_vm *vm,
-			       int level, bool immediate,
-			       struct amdgpu_bo_vm **vmbo)
-{
-	struct amdgpu_bo_param bp;
-	struct amdgpu_bo *bo;
-	struct dma_resv *resv;
-	unsigned int num_entries;
-	int r;
-
-	memset(&bp, 0, sizeof(bp));
-
-	bp.size = amdgpu_vm_bo_size(adev, level);
-	bp.byte_align = AMDGPU_GPU_PAGE_SIZE;
-	bp.domain = AMDGPU_GEM_DOMAIN_VRAM;
-	bp.domain = amdgpu_bo_get_preferred_domain(adev, bp.domain);
-	bp.flags = AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS |
-		AMDGPU_GEM_CREATE_CPU_GTT_USWC;
-
-	if (level < AMDGPU_VM_PTB)
-		num_entries = amdgpu_vm_num_entries(adev, level);
-	else
-		num_entries = 0;
-
-	bp.bo_ptr_size = struct_size((*vmbo), entries, num_entries);
-
-	if (vm->use_cpu_for_update)
-		bp.flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
-
-	bp.type = ttm_bo_type_kernel;
-	bp.no_wait_gpu = immediate;
-	if (vm->root.bo)
-		bp.resv = vm->root.bo->tbo.base.resv;
-
-	r = amdgpu_bo_create_vm(adev, &bp, vmbo);
-	if (r)
-		return r;
-
-	bo = &(*vmbo)->bo;
-	if (vm->is_compute_context || (adev->flags & AMD_IS_APU)) {
-		(*vmbo)->shadow = NULL;
-		return 0;
-	}
-
-	if (!bp.resv)
-		WARN_ON(dma_resv_lock(bo->tbo.base.resv,
-				      NULL));
-	resv = bp.resv;
-	memset(&bp, 0, sizeof(bp));
-	bp.size = amdgpu_vm_bo_size(adev, level);
-	bp.domain = AMDGPU_GEM_DOMAIN_GTT;
-	bp.flags = AMDGPU_GEM_CREATE_CPU_GTT_USWC;
-	bp.type = ttm_bo_type_kernel;
-	bp.resv = bo->tbo.base.resv;
-	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
-
-	r = amdgpu_bo_create(adev, &bp, &(*vmbo)->shadow);
-
-	if (!resv)
-		dma_resv_unlock(bo->tbo.base.resv);
-
-	if (r) {
-		amdgpu_bo_unref(&bo);
-		return r;
-	}
-
-	(*vmbo)->shadow->parent = amdgpu_bo_ref(bo);
-	amdgpu_bo_add_to_shadow_list(*vmbo);
-
-	return 0;
-}
-
-/**
- * amdgpu_vm_alloc_pts - Allocate a specific page table
- *
- * @adev: amdgpu_device pointer
- * @vm: VM to allocate page tables for
- * @cursor: Which page table to allocate
- * @immediate: use an immediate update
- *
- * Make sure a specific page table or directory is allocated.
- *
- * Returns:
- * 1 if page table needed to be allocated, 0 if page table was already
- * allocated, negative errno if an error occurred.
- */
-static int amdgpu_vm_alloc_pts(struct amdgpu_device *adev,
-			       struct amdgpu_vm *vm,
-			       struct amdgpu_vm_pt_cursor *cursor,
-			       bool immediate)
-{
-	struct amdgpu_vm_bo_base *entry = cursor->entry;
-	struct amdgpu_bo *pt_bo;
-	struct amdgpu_bo_vm *pt;
-	int r;
-
-	if (entry->bo)
-		return 0;
-
-	r = amdgpu_vm_pt_create(adev, vm, cursor->level, immediate, &pt);
-	if (r)
-		return r;
-
-	/* Keep a reference to the root directory to avoid
-	 * freeing them up in the wrong order.
-	 */
-	pt_bo = &pt->bo;
-	pt_bo->parent = amdgpu_bo_ref(cursor->parent->bo);
-	amdgpu_vm_bo_base_init(entry, vm, pt_bo);
-	r = amdgpu_vm_clear_bo(adev, vm, pt, immediate);
-	if (r)
-		goto error_free_pt;
-
-	return 0;
-
-error_free_pt:
-	amdgpu_bo_unref(&pt->shadow);
-	amdgpu_bo_unref(&pt_bo);
-	return r;
-}
-
-/**
- * amdgpu_vm_free_table - fre one PD/PT
- *
- * @entry: PDE to free
- */
-static void amdgpu_vm_free_table(struct amdgpu_vm_bo_base *entry)
-{
-	struct amdgpu_bo *shadow;
-
-	if (!entry->bo)
-		return;
-	shadow = amdgpu_bo_shadowed(entry->bo);
-	entry->bo->vm_bo = NULL;
-	list_del(&entry->vm_status);
-	amdgpu_bo_unref(&shadow);
-	amdgpu_bo_unref(&entry->bo);
-}
-
-/**
- * amdgpu_vm_free_pts - free PD/PT levels
- *
- * @adev: amdgpu device structure
- * @vm: amdgpu vm structure
- * @start: optional cursor where to start freeing PDs/PTs
- *
- * Free the page directory or page table level and all sub levels.
- */
-static void amdgpu_vm_free_pts(struct amdgpu_device *adev,
-			       struct amdgpu_vm *vm,
-			       struct amdgpu_vm_pt_cursor *start)
-{
-	struct amdgpu_vm_pt_cursor cursor;
-	struct amdgpu_vm_bo_base *entry;
-
-	vm->bulk_moveable = false;
-
-	for_each_amdgpu_vm_pt_dfs_safe(adev, vm, start, cursor, entry)
-		amdgpu_vm_free_table(entry);
-
-	if (start)
-		amdgpu_vm_free_table(start->entry);
-}
-
 /**
  * amdgpu_vm_check_compute_bug - check whether asic has compute vm bug
  *
@@ -1335,34 +704,6 @@ uint64_t amdgpu_vm_map_gart(const dma_addr_t *pages_addr, uint64_t addr)
 	return result;
 }
 
-/**
- * amdgpu_vm_update_pde - update a single level in the hierarchy
- *
- * @params: parameters for the update
- * @vm: requested vm
- * @entry: entry to update
- *
- * Makes sure the requested entry in parent is up to date.
- */
-static int amdgpu_vm_update_pde(struct amdgpu_vm_update_params *params,
-				struct amdgpu_vm *vm,
-				struct amdgpu_vm_bo_base *entry)
-{
-	struct amdgpu_vm_bo_base *parent = amdgpu_vm_pt_parent(entry);
-	struct amdgpu_bo *bo = parent->bo, *pbo;
-	uint64_t pde, pt, flags;
-	unsigned level;
-
-	for (level = 0, pbo = bo->parent; pbo; ++level)
-		pbo = pbo->parent;
-
-	level += params->adev->vm_manager.root_level;
-	amdgpu_gmc_get_pde_for_bo(entry->bo, level, &pt, &flags);
-	pde = (entry - to_amdgpu_bo_vm(parent->bo)->entries) * 8;
-	return vm->update_funcs->update(params, to_amdgpu_bo_vm(bo), pde, pt,
-					1, 0, flags);
-}
-
 /**
  * amdgpu_vm_update_pdes - make sure that all directories are valid
  *
@@ -1398,7 +739,7 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
 		goto error;
 
 	list_for_each_entry(entry, &vm->relocated, vm_status) {
-		r = amdgpu_vm_update_pde(&params, vm, entry);
+		r = amdgpu_vm_pde_update(&params, entry);
 		if (r)
 			goto error;
 	}
@@ -1419,252 +760,6 @@ int amdgpu_vm_update_pdes(struct amdgpu_device *adev,
 	return r;
 }
 
-/*
- * amdgpu_vm_update_flags - figure out flags for PTE updates
- *
- * Make sure to set the right flags for the PTEs at the desired level.
- */
-static void amdgpu_vm_update_flags(struct amdgpu_vm_update_params *params,
-				   struct amdgpu_bo_vm *pt, unsigned int level,
-				   uint64_t pe, uint64_t addr,
-				   unsigned int count, uint32_t incr,
-				   uint64_t flags)
-
-{
-	if (level != AMDGPU_VM_PTB) {
-		flags |= AMDGPU_PDE_PTE;
-		amdgpu_gmc_get_vm_pde(params->adev, level, &addr, &flags);
-
-	} else if (params->adev->asic_type >= CHIP_VEGA10 &&
-		   !(flags & AMDGPU_PTE_VALID) &&
-		   !(flags & AMDGPU_PTE_PRT)) {
-
-		/* Workaround for fault priority problem on GMC9 */
-		flags |= AMDGPU_PTE_EXECUTABLE;
-	}
-
-	params->vm->update_funcs->update(params, pt, pe, addr, count, incr,
-					 flags);
-}
-
-/**
- * amdgpu_vm_fragment - get fragment for PTEs
- *
- * @params: see amdgpu_vm_update_params definition
- * @start: first PTE to handle
- * @end: last PTE to handle
- * @flags: hw mapping flags
- * @frag: resulting fragment size
- * @frag_end: end of this fragment
- *
- * Returns the first possible fragment for the start and end address.
- */
-static void amdgpu_vm_fragment(struct amdgpu_vm_update_params *params,
-			       uint64_t start, uint64_t end, uint64_t flags,
-			       unsigned int *frag, uint64_t *frag_end)
-{
-	/**
-	 * The MC L1 TLB supports variable sized pages, based on a fragment
-	 * field in the PTE. When this field is set to a non-zero value, page
-	 * granularity is increased from 4KB to (1 << (12 + frag)). The PTE
-	 * flags are considered valid for all PTEs within the fragment range
-	 * and corresponding mappings are assumed to be physically contiguous.
-	 *
-	 * The L1 TLB can store a single PTE for the whole fragment,
-	 * significantly increasing the space available for translation
-	 * caching. This leads to large improvements in throughput when the
-	 * TLB is under pressure.
-	 *
-	 * The L2 TLB distributes small and large fragments into two
-	 * asymmetric partitions. The large fragment cache is significantly
-	 * larger. Thus, we try to use large fragments wherever possible.
-	 * Userspace can support this by aligning virtual base address and
-	 * allocation size to the fragment size.
-	 *
-	 * Starting with Vega10 the fragment size only controls the L1. The L2
-	 * is now directly feed with small/huge/giant pages from the walker.
-	 */
-	unsigned max_frag;
-
-	if (params->adev->asic_type < CHIP_VEGA10)
-		max_frag = params->adev->vm_manager.fragment_size;
-	else
-		max_frag = 31;
-
-	/* system pages are non continuously */
-	if (params->pages_addr) {
-		*frag = 0;
-		*frag_end = end;
-		return;
-	}
-
-	/* This intentionally wraps around if no bit is set */
-	*frag = min((unsigned)ffs(start) - 1, (unsigned)fls64(end - start) - 1);
-	if (*frag >= max_frag) {
-		*frag = max_frag;
-		*frag_end = end & ~((1ULL << max_frag) - 1);
-	} else {
-		*frag_end = start + (1 << *frag);
-	}
-}
-
-/**
- * amdgpu_vm_update_ptes - make sure that page tables are valid
- *
- * @params: see amdgpu_vm_update_params definition
- * @start: start of GPU address range
- * @end: end of GPU address range
- * @dst: destination address to map to, the next dst inside the function
- * @flags: mapping flags
- *
- * Update the page tables in the range @start - @end.
- *
- * Returns:
- * 0 for success, -EINVAL for failure.
- */
-static int amdgpu_vm_update_ptes(struct amdgpu_vm_update_params *params,
-				 uint64_t start, uint64_t end,
-				 uint64_t dst, uint64_t flags)
-{
-	struct amdgpu_device *adev = params->adev;
-	struct amdgpu_vm_pt_cursor cursor;
-	uint64_t frag_start = start, frag_end;
-	unsigned int frag;
-	int r;
-
-	/* figure out the initial fragment */
-	amdgpu_vm_fragment(params, frag_start, end, flags, &frag, &frag_end);
-
-	/* walk over the address space and update the PTs */
-	amdgpu_vm_pt_start(adev, params->vm, start, &cursor);
-	while (cursor.pfn < end) {
-		unsigned shift, parent_shift, mask;
-		uint64_t incr, entry_end, pe_start;
-		struct amdgpu_bo *pt;
-
-		if (!params->unlocked) {
-			/* make sure that the page tables covering the
-			 * address range are actually allocated
-			 */
-			r = amdgpu_vm_alloc_pts(params->adev, params->vm,
-						&cursor, params->immediate);
-			if (r)
-				return r;
-		}
-
-		shift = amdgpu_vm_level_shift(adev, cursor.level);
-		parent_shift = amdgpu_vm_level_shift(adev, cursor.level - 1);
-		if (params->unlocked) {
-			/* Unlocked updates are only allowed on the leaves */
-			if (amdgpu_vm_pt_descendant(adev, &cursor))
-				continue;
-		} else if (adev->asic_type < CHIP_VEGA10 &&
-			   (flags & AMDGPU_PTE_VALID)) {
-			/* No huge page support before GMC v9 */
-			if (cursor.level != AMDGPU_VM_PTB) {
-				if (!amdgpu_vm_pt_descendant(adev, &cursor))
-					return -ENOENT;
-				continue;
-			}
-		} else if (frag < shift) {
-			/* We can't use this level when the fragment size is
-			 * smaller than the address shift. Go to the next
-			 * child entry and try again.
-			 */
-			if (amdgpu_vm_pt_descendant(adev, &cursor))
-				continue;
-		} else if (frag >= parent_shift) {
-			/* If the fragment size is even larger than the parent
-			 * shift we should go up one level and check it again.
-			 */
-			if (!amdgpu_vm_pt_ancestor(&cursor))
-				return -EINVAL;
-			continue;
-		}
-
-		pt = cursor.entry->bo;
-		if (!pt) {
-			/* We need all PDs and PTs for mapping something, */
-			if (flags & AMDGPU_PTE_VALID)
-				return -ENOENT;
-
-			/* but unmapping something can happen at a higher
-			 * level.
-			 */
-			if (!amdgpu_vm_pt_ancestor(&cursor))
-				return -EINVAL;
-
-			pt = cursor.entry->bo;
-			shift = parent_shift;
-			frag_end = max(frag_end, ALIGN(frag_start + 1,
-				   1ULL << shift));
-		}
-
-		/* Looks good so far, calculate parameters for the update */
-		incr = (uint64_t)AMDGPU_GPU_PAGE_SIZE << shift;
-		mask = amdgpu_vm_entries_mask(adev, cursor.level);
-		pe_start = ((cursor.pfn >> shift) & mask) * 8;
-		entry_end = ((uint64_t)mask + 1) << shift;
-		entry_end += cursor.pfn & ~(entry_end - 1);
-		entry_end = min(entry_end, end);
-
-		do {
-			struct amdgpu_vm *vm = params->vm;
-			uint64_t upd_end = min(entry_end, frag_end);
-			unsigned nptes = (upd_end - frag_start) >> shift;
-			uint64_t upd_flags = flags | AMDGPU_PTE_FRAG(frag);
-
-			/* This can happen when we set higher level PDs to
-			 * silent to stop fault floods.
-			 */
-			nptes = max(nptes, 1u);
-
-			trace_amdgpu_vm_update_ptes(params, frag_start, upd_end,
-						    min(nptes, 32u), dst, incr, upd_flags,
-						    vm->task_info.pid,
-						    vm->immediate.fence_context);
-			amdgpu_vm_update_flags(params, to_amdgpu_bo_vm(pt),
-					       cursor.level, pe_start, dst,
-					       nptes, incr, upd_flags);
-
-			pe_start += nptes * 8;
-			dst += nptes * incr;
-
-			frag_start = upd_end;
-			if (frag_start >= frag_end) {
-				/* figure out the next fragment */
-				amdgpu_vm_fragment(params, frag_start, end,
-						   flags, &frag, &frag_end);
-				if (frag < shift)
-					break;
-			}
-		} while (frag_start < entry_end);
-
-		if (amdgpu_vm_pt_descendant(adev, &cursor)) {
-			/* Free all child entries.
-			 * Update the tables with the flags and addresses and free up subsequent
-			 * tables in the case of huge pages or freed up areas.
-			 * This is the maximum you can free, because all other page tables are not
-			 * completely covered by the range and so potentially still in use.
-			 */
-			while (cursor.pfn < frag_start) {
-				/* Make sure previous mapping is freed */
-				if (cursor.entry->bo) {
-					params->table_freed = true;
-					amdgpu_vm_free_pts(adev, params->vm, &cursor);
-				}
-				amdgpu_vm_pt_next(adev, &cursor);
-			}
-
-		} else if (frag >= shift) {
-			/* or just move on to the next on the same level. */
-			amdgpu_vm_pt_next(adev, &cursor);
-		}
-	}
-
-	return 0;
-}
-
 /**
  * amdgpu_vm_bo_update_mapping - update a mapping in the vm page table
  *
@@ -1785,7 +880,7 @@ int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 		}
 
 		tmp = start + num_entries;
-		r = amdgpu_vm_update_ptes(&params, start, tmp, addr, flags);
+		r = amdgpu_vm_ptes_update(&params, start, tmp, addr, flags);
 		if (r)
 			goto error_unlock;
 
@@ -2964,7 +2059,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 
 	amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
 
-	r = amdgpu_vm_clear_bo(adev, vm, root, false);
+	r = amdgpu_vm_pt_clear(adev, vm, root, false);
 	if (r)
 		goto error_unreserve;
 
@@ -2992,34 +2087,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	return r;
 }
 
-/**
- * amdgpu_vm_check_clean_reserved - check if a VM is clean
- *
- * @adev: amdgpu_device pointer
- * @vm: the VM to check
- *
- * check all entries of the root PD, if any subsequent PDs are allocated,
- * it means there are page table creating and filling, and is no a clean
- * VM
- *
- * Returns:
- *	0 if this VM is clean
- */
-static int amdgpu_vm_check_clean_reserved(struct amdgpu_device *adev,
-					  struct amdgpu_vm *vm)
-{
-	enum amdgpu_vm_level root = adev->vm_manager.root_level;
-	unsigned int entries = amdgpu_vm_num_entries(adev, root);
-	unsigned int i = 0;
-
-	for (i = 0; i < entries; i++) {
-		if (to_amdgpu_bo_vm(vm->root.bo)->entries[i].bo)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 /**
  * amdgpu_vm_make_compute - Turn a GFX VM into a compute VM
  *
@@ -3049,17 +2116,17 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		return r;
 
 	/* Sanity checks */
-	r = amdgpu_vm_check_clean_reserved(adev, vm);
-	if (r)
+	if (!amdgpu_vm_pt_is_root_clean(adev, vm)) {
+		r = -EINVAL;
 		goto unreserve_bo;
+	}
 
 	/* Check if PD needs to be reinitialized and do it before
 	 * changing any other state, in case it fails.
 	 */
 	if (pte_support_ats != vm->pte_support_ats) {
 		vm->pte_support_ats = pte_support_ats;
-		r = amdgpu_vm_clear_bo(adev, vm,
-				       to_amdgpu_bo_vm(vm->root.bo),
+		r = amdgpu_vm_pt_clear(adev, vm, to_amdgpu_bo_vm(vm->root.bo),
 				       false);
 		if (r)
 			goto unreserve_bo;
@@ -3147,7 +2214,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 		amdgpu_vm_free_mapping(adev, vm, mapping, NULL);
 	}
 
-	amdgpu_vm_free_pts(adev, vm, NULL);
+	amdgpu_vm_pt_free_root(adev, vm);
 	amdgpu_bo_unreserve(root);
 	amdgpu_bo_unref(&root);
 	WARN_ON(vm->root.bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index a40a6a993bb0..1731681914f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -397,6 +397,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
 			  struct dma_fence **fence);
 int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
 			   struct amdgpu_vm *vm);
+void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
+			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
 int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 				struct amdgpu_device *bo_adev,
 				struct amdgpu_vm *vm, bool immediate,
@@ -458,6 +460,20 @@ void amdgpu_vm_del_from_lru_notify(struct ttm_buffer_object *bo);
 void amdgpu_vm_get_memory(struct amdgpu_vm *vm, uint64_t *vram_mem,
 				uint64_t *gtt_mem, uint64_t *cpu_mem);
 
+int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+		       struct amdgpu_bo_vm *vmbo, bool immediate);
+int amdgpu_vm_pt_create(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+			int level, bool immediate, struct amdgpu_bo_vm **vmbo);
+void amdgpu_vm_pt_free_root(struct amdgpu_device *adev, struct amdgpu_vm *vm);
+bool amdgpu_vm_pt_is_root_clean(struct amdgpu_device *adev,
+				struct amdgpu_vm *vm);
+
+int amdgpu_vm_pde_update(struct amdgpu_vm_update_params *params,
+			 struct amdgpu_vm_bo_base *entry);
+int amdgpu_vm_ptes_update(struct amdgpu_vm_update_params *params,
+			  uint64_t start, uint64_t end,
+			  uint64_t dst, uint64_t flags);
+
 #if defined(CONFIG_DEBUG_FS)
 void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m);
 #endif
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
new file mode 100644
index 000000000000..a821ada5f8ca
--- /dev/null
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -0,0 +1,979 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <drm/drm_drv.h>
+
+#include "amdgpu.h"
+#include "amdgpu_trace.h"
+#include "amdgpu_vm.h"
+
+/*
+ * amdgpu_vm_pt_cursor - state for for_each_amdgpu_vm_pt
+ */
+struct amdgpu_vm_pt_cursor {
+	uint64_t pfn;
+	struct amdgpu_vm_bo_base *parent;
+	struct amdgpu_vm_bo_base *entry;
+	unsigned int level;
+};
+
+/**
+ * amdgpu_vm_pt_level_shift - return the addr shift for each level
+ *
+ * @adev: amdgpu_device pointer
+ * @level: VMPT level
+ *
+ * Returns:
+ * The number of bits the pfn needs to be right shifted for a level.
+ */
+static unsigned int amdgpu_vm_pt_level_shift(struct amdgpu_device *adev,
+					     unsigned int level)
+{
+	switch (level) {
+	case AMDGPU_VM_PDB2:
+	case AMDGPU_VM_PDB1:
+	case AMDGPU_VM_PDB0:
+		return 9 * (AMDGPU_VM_PDB0 - level) +
+			adev->vm_manager.block_size;
+	case AMDGPU_VM_PTB:
+		return 0;
+	default:
+		return ~0;
+	}
+}
+
+/**
+ * amdgpu_vm_pt_num_entries - return the number of entries in a PD/PT
+ *
+ * @adev: amdgpu_device pointer
+ * @level: VMPT level
+ *
+ * Returns:
+ * The number of entries in a page directory or page table.
+ */
+static unsigned int amdgpu_vm_pt_num_entries(struct amdgpu_device *adev,
+					     unsigned int level)
+{
+	unsigned int shift;
+
+	shift = amdgpu_vm_pt_level_shift(adev, adev->vm_manager.root_level);
+	if (level == adev->vm_manager.root_level)
+		/* For the root directory */
+		return round_up(adev->vm_manager.max_pfn, 1ULL << shift)
+			>> shift;
+	else if (level != AMDGPU_VM_PTB)
+		/* Everything in between */
+		return 512;
+
+	/* For the page tables on the leaves */
+	return AMDGPU_VM_PTE_COUNT(adev);
+}
+
+/**
+ * amdgpu_vm_pt_num_ats_entries - return the number of ATS entries in the root PD
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Returns:
+ * The number of entries in the root page directory which needs the ATS setting.
+ */
+static unsigned int amdgpu_vm_pt_num_ats_entries(struct amdgpu_device *adev)
+{
+	unsigned int shift;
+
+	shift = amdgpu_vm_pt_level_shift(adev, adev->vm_manager.root_level);
+	return AMDGPU_GMC_HOLE_START >> (shift + AMDGPU_GPU_PAGE_SHIFT);
+}
+
+/**
+ * amdgpu_vm_pt_entries_mask - the mask to get the entry number of a PD/PT
+ *
+ * @adev: amdgpu_device pointer
+ * @level: VMPT level
+ *
+ * Returns:
+ * The mask to extract the entry number of a PD/PT from an address.
+ */
+static uint32_t amdgpu_vm_pt_entries_mask(struct amdgpu_device *adev,
+					  unsigned int level)
+{
+	if (level <= adev->vm_manager.root_level)
+		return 0xffffffff;
+	else if (level != AMDGPU_VM_PTB)
+		return 0x1ff;
+	else
+		return AMDGPU_VM_PTE_COUNT(adev) - 1;
+}
+
+/**
+ * amdgpu_vm_pt_size - returns the size of the page table in bytes
+ *
+ * @adev: amdgpu_device pointer
+ * @level: VMPT level
+ *
+ * Returns:
+ * The size of the BO for a page directory or page table in bytes.
+ */
+static unsigned int amdgpu_vm_pt_size(struct amdgpu_device *adev,
+				      unsigned int level)
+{
+	return AMDGPU_GPU_PAGE_ALIGN(amdgpu_vm_pt_num_entries(adev, level) * 8);
+}
+
+/**
+ * amdgpu_vm_pt_parent - get the parent page directory
+ *
+ * @pt: child page table
+ *
+ * Helper to get the parent entry for the child page table. NULL if we are at
+ * the root page directory.
+ */
+static struct amdgpu_vm_bo_base *
+amdgpu_vm_pt_parent(struct amdgpu_vm_bo_base *pt)
+{
+	struct amdgpu_bo *parent = pt->bo->parent;
+
+	if (!parent)
+		return NULL;
+
+	return parent->vm_bo;
+}
+
+/**
+ * amdgpu_vm_pt_start - start PD/PT walk
+ *
+ * @adev: amdgpu_device pointer
+ * @vm: amdgpu_vm structure
+ * @start: start address of the walk
+ * @cursor: state to initialize
+ *
+ * Initialize a amdgpu_vm_pt_cursor to start a walk.
+ */
+static void amdgpu_vm_pt_start(struct amdgpu_device *adev,
+			       struct amdgpu_vm *vm, uint64_t start,
+			       struct amdgpu_vm_pt_cursor *cursor)
+{
+	cursor->pfn = start;
+	cursor->parent = NULL;
+	cursor->entry = &vm->root;
+	cursor->level = adev->vm_manager.root_level;
+}
+
+/**
+ * amdgpu_vm_pt_descendant - go to child node
+ *
+ * @adev: amdgpu_device pointer
+ * @cursor: current state
+ *
+ * Walk to the child node of the current node.
+ * Returns:
+ * True if the walk was possible, false otherwise.
+ */
+static bool amdgpu_vm_pt_descendant(struct amdgpu_device *adev,
+				    struct amdgpu_vm_pt_cursor *cursor)
+{
+	unsigned int mask, shift, idx;
+
+	if ((cursor->level == AMDGPU_VM_PTB) || !cursor->entry ||
+	    !cursor->entry->bo)
+		return false;
+
+	mask = amdgpu_vm_pt_entries_mask(adev, cursor->level);
+	shift = amdgpu_vm_pt_level_shift(adev, cursor->level);
+
+	++cursor->level;
+	idx = (cursor->pfn >> shift) & mask;
+	cursor->parent = cursor->entry;
+	cursor->entry = &to_amdgpu_bo_vm(cursor->entry->bo)->entries[idx];
+	return true;
+}
+
+/**
+ * amdgpu_vm_pt_sibling - go to sibling node
+ *
+ * @adev: amdgpu_device pointer
+ * @cursor: current state
+ *
+ * Walk to the sibling node of the current node.
+ * Returns:
+ * True if the walk was possible, false otherwise.
+ */
+static bool amdgpu_vm_pt_sibling(struct amdgpu_device *adev,
+				 struct amdgpu_vm_pt_cursor *cursor)
+{
+
+	unsigned int shift, num_entries;
+	struct amdgpu_bo_vm *parent;
+
+	/* Root doesn't have a sibling */
+	if (!cursor->parent)
+		return false;
+
+	/* Go to our parents and see if we got a sibling */
+	shift = amdgpu_vm_pt_level_shift(adev, cursor->level - 1);
+	num_entries = amdgpu_vm_pt_num_entries(adev, cursor->level - 1);
+	parent = to_amdgpu_bo_vm(cursor->parent->bo);
+
+	if (cursor->entry == &parent->entries[num_entries - 1])
+		return false;
+
+	cursor->pfn += 1ULL << shift;
+	cursor->pfn &= ~((1ULL << shift) - 1);
+	++cursor->entry;
+	return true;
+}
+
+/**
+ * amdgpu_vm_pt_ancestor - go to parent node
+ *
+ * @cursor: current state
+ *
+ * Walk to the parent node of the current node.
+ * Returns:
+ * True if the walk was possible, false otherwise.
+ */
+static bool amdgpu_vm_pt_ancestor(struct amdgpu_vm_pt_cursor *cursor)
+{
+	if (!cursor->parent)
+		return false;
+
+	--cursor->level;
+	cursor->entry = cursor->parent;
+	cursor->parent = amdgpu_vm_pt_parent(cursor->parent);
+	return true;
+}
+
+/**
+ * amdgpu_vm_pt_next - get next PD/PT in hieratchy
+ *
+ * @adev: amdgpu_device pointer
+ * @cursor: current state
+ *
+ * Walk the PD/PT tree to the next node.
+ */
+static void amdgpu_vm_pt_next(struct amdgpu_device *adev,
+			      struct amdgpu_vm_pt_cursor *cursor)
+{
+	/* First try a newborn child */
+	if (amdgpu_vm_pt_descendant(adev, cursor))
+		return;
+
+	/* If that didn't worked try to find a sibling */
+	while (!amdgpu_vm_pt_sibling(adev, cursor)) {
+		/* No sibling, go to our parents and grandparents */
+		if (!amdgpu_vm_pt_ancestor(cursor)) {
+			cursor->pfn = ~0ll;
+			return;
+		}
+	}
+}
+
+/**
+ * amdgpu_vm_pt_first_dfs - start a deep first search
+ *
+ * @adev: amdgpu_device structure
+ * @vm: amdgpu_vm structure
+ * @start: optional cursor to start with
+ * @cursor: state to initialize
+ *
+ * Starts a deep first traversal of the PD/PT tree.
+ */
+static void amdgpu_vm_pt_first_dfs(struct amdgpu_device *adev,
+				   struct amdgpu_vm *vm,
+				   struct amdgpu_vm_pt_cursor *start,
+				   struct amdgpu_vm_pt_cursor *cursor)
+{
+	if (start)
+		*cursor = *start;
+	else
+		amdgpu_vm_pt_start(adev, vm, 0, cursor);
+
+	while (amdgpu_vm_pt_descendant(adev, cursor))
+		;
+}
+
+/**
+ * amdgpu_vm_pt_continue_dfs - check if the deep first search should continue
+ *
+ * @start: starting point for the search
+ * @entry: current entry
+ *
+ * Returns:
+ * True when the search should continue, false otherwise.
+ */
+static bool amdgpu_vm_pt_continue_dfs(struct amdgpu_vm_pt_cursor *start,
+				      struct amdgpu_vm_bo_base *entry)
+{
+	return entry && (!start || entry != start->entry);
+}
+
+/**
+ * amdgpu_vm_pt_next_dfs - get the next node for a deep first search
+ *
+ * @adev: amdgpu_device structure
+ * @cursor: current state
+ *
+ * Move the cursor to the next node in a deep first search.
+ */
+static void amdgpu_vm_pt_next_dfs(struct amdgpu_device *adev,
+				  struct amdgpu_vm_pt_cursor *cursor)
+{
+	if (!cursor->entry)
+		return;
+
+	if (!cursor->parent)
+		cursor->entry = NULL;
+	else if (amdgpu_vm_pt_sibling(adev, cursor))
+		while (amdgpu_vm_pt_descendant(adev, cursor))
+			;
+	else
+		amdgpu_vm_pt_ancestor(cursor);
+}
+
+/*
+ * for_each_amdgpu_vm_pt_dfs_safe - safe deep first search of all PDs/PTs
+ */
+#define for_each_amdgpu_vm_pt_dfs_safe(adev, vm, start, cursor, entry)		\
+	for (amdgpu_vm_pt_first_dfs((adev), (vm), (start), &(cursor)),		\
+	     (entry) = (cursor).entry, amdgpu_vm_pt_next_dfs((adev), &(cursor));\
+	     amdgpu_vm_pt_continue_dfs((start), (entry));			\
+	     (entry) = (cursor).entry, amdgpu_vm_pt_next_dfs((adev), &(cursor)))
+
+/**
+ * amdgpu_vm_pt_clear - initially clear the PDs/PTs
+ *
+ * @adev: amdgpu_device pointer
+ * @vm: VM to clear BO from
+ * @vmbo: BO to clear
+ * @immediate: use an immediate update
+ *
+ * Root PD needs to be reserved when calling this.
+ *
+ * Returns:
+ * 0 on success, errno otherwise.
+ */
+int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+		       struct amdgpu_bo_vm *vmbo, bool immediate)
+{
+	unsigned int level = adev->vm_manager.root_level;
+	struct ttm_operation_ctx ctx = { true, false };
+	struct amdgpu_vm_update_params params;
+	struct amdgpu_bo *ancestor = &vmbo->bo;
+	unsigned int entries, ats_entries;
+	struct amdgpu_bo *bo = &vmbo->bo;
+	uint64_t addr;
+	int r, idx;
+
+	/* Figure out our place in the hierarchy */
+	if (ancestor->parent) {
+		++level;
+		while (ancestor->parent->parent) {
+			++level;
+			ancestor = ancestor->parent;
+		}
+	}
+
+	entries = amdgpu_bo_size(bo) / 8;
+	if (!vm->pte_support_ats) {
+		ats_entries = 0;
+
+	} else if (!bo->parent) {
+		ats_entries = amdgpu_vm_pt_num_ats_entries(adev);
+		ats_entries = min(ats_entries, entries);
+		entries -= ats_entries;
+
+	} else {
+		struct amdgpu_vm_bo_base *pt;
+
+		pt = ancestor->vm_bo;
+		ats_entries = amdgpu_vm_pt_num_ats_entries(adev);
+		if ((pt - to_amdgpu_bo_vm(vm->root.bo)->entries) >=
+		    ats_entries) {
+			ats_entries = 0;
+		} else {
+			ats_entries = entries;
+			entries = 0;
+		}
+	}
+
+	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+	if (r)
+		return r;
+
+	if (vmbo->shadow) {
+		struct amdgpu_bo *shadow = vmbo->shadow;
+
+		r = ttm_bo_validate(&shadow->tbo, &shadow->placement, &ctx);
+		if (r)
+			return r;
+	}
+
+	if (!drm_dev_enter(adev_to_drm(adev), &idx))
+		return -ENODEV;
+
+	r = vm->update_funcs->map_table(vmbo);
+	if (r)
+		goto exit;
+
+	memset(&params, 0, sizeof(params));
+	params.adev = adev;
+	params.vm = vm;
+	params.immediate = immediate;
+
+	r = vm->update_funcs->prepare(&params, NULL, AMDGPU_SYNC_EXPLICIT);
+	if (r)
+		goto exit;
+
+	addr = 0;
+	if (ats_entries) {
+		uint64_t value = 0, flags;
+
+		flags = AMDGPU_PTE_DEFAULT_ATC;
+		if (level != AMDGPU_VM_PTB) {
+			/* Handle leaf PDEs as PTEs */
+			flags |= AMDGPU_PDE_PTE;
+			amdgpu_gmc_get_vm_pde(adev, level, &value, &flags);
+		}
+
+		r = vm->update_funcs->update(&params, vmbo, addr, 0,
+					     ats_entries, value, flags);
+		if (r)
+			goto exit;
+
+		addr += ats_entries * 8;
+	}
+
+	if (entries) {
+		uint64_t value = 0, flags = 0;
+
+		if (adev->asic_type >= CHIP_VEGA10) {
+			if (level != AMDGPU_VM_PTB) {
+				/* Handle leaf PDEs as PTEs */
+				flags |= AMDGPU_PDE_PTE;
+				amdgpu_gmc_get_vm_pde(adev, level,
+						      &value, &flags);
+			} else {
+				/* Workaround for fault priority problem on GMC9 */
+				flags = AMDGPU_PTE_EXECUTABLE;
+			}
+		}
+
+		r = vm->update_funcs->update(&params, vmbo, addr, 0, entries,
+					     value, flags);
+		if (r)
+			goto exit;
+	}
+
+	r = vm->update_funcs->commit(&params, NULL);
+exit:
+	drm_dev_exit(idx);
+	return r;
+}
+
+/**
+ * amdgpu_vm_pt_create - create bo for PD/PT
+ *
+ * @adev: amdgpu_device pointer
+ * @vm: requesting vm
+ * @level: the page table level
+ * @immediate: use a immediate update
+ * @vmbo: pointer to the buffer object pointer
+ */
+int amdgpu_vm_pt_create(struct amdgpu_device *adev, struct amdgpu_vm *vm,
+			int level, bool immediate, struct amdgpu_bo_vm **vmbo)
+{
+	struct amdgpu_bo_param bp;
+	struct amdgpu_bo *bo;
+	struct dma_resv *resv;
+	unsigned int num_entries;
+	int r;
+
+	memset(&bp, 0, sizeof(bp));
+
+	bp.size = amdgpu_vm_pt_size(adev, level);
+	bp.byte_align = AMDGPU_GPU_PAGE_SIZE;
+	bp.domain = AMDGPU_GEM_DOMAIN_VRAM;
+	bp.domain = amdgpu_bo_get_preferred_domain(adev, bp.domain);
+	bp.flags = AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS |
+		AMDGPU_GEM_CREATE_CPU_GTT_USWC;
+
+	if (level < AMDGPU_VM_PTB)
+		num_entries = amdgpu_vm_pt_num_entries(adev, level);
+	else
+		num_entries = 0;
+
+	bp.bo_ptr_size = struct_size((*vmbo), entries, num_entries);
+
+	if (vm->use_cpu_for_update)
+		bp.flags |= AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
+
+	bp.type = ttm_bo_type_kernel;
+	bp.no_wait_gpu = immediate;
+	if (vm->root.bo)
+		bp.resv = vm->root.bo->tbo.base.resv;
+
+	r = amdgpu_bo_create_vm(adev, &bp, vmbo);
+	if (r)
+		return r;
+
+	bo = &(*vmbo)->bo;
+	if (vm->is_compute_context || (adev->flags & AMD_IS_APU)) {
+		(*vmbo)->shadow = NULL;
+		return 0;
+	}
+
+	if (!bp.resv)
+		WARN_ON(dma_resv_lock(bo->tbo.base.resv,
+				      NULL));
+	resv = bp.resv;
+	memset(&bp, 0, sizeof(bp));
+	bp.size = amdgpu_vm_pt_size(adev, level);
+	bp.domain = AMDGPU_GEM_DOMAIN_GTT;
+	bp.flags = AMDGPU_GEM_CREATE_CPU_GTT_USWC;
+	bp.type = ttm_bo_type_kernel;
+	bp.resv = bo->tbo.base.resv;
+	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
+
+	r = amdgpu_bo_create(adev, &bp, &(*vmbo)->shadow);
+
+	if (!resv)
+		dma_resv_unlock(bo->tbo.base.resv);
+
+	if (r) {
+		amdgpu_bo_unref(&bo);
+		return r;
+	}
+
+	(*vmbo)->shadow->parent = amdgpu_bo_ref(bo);
+	amdgpu_bo_add_to_shadow_list(*vmbo);
+
+	return 0;
+}
+
+/**
+ * amdgpu_vm_pt_alloc - Allocate a specific page table
+ *
+ * @adev: amdgpu_device pointer
+ * @vm: VM to allocate page tables for
+ * @cursor: Which page table to allocate
+ * @immediate: use an immediate update
+ *
+ * Make sure a specific page table or directory is allocated.
+ *
+ * Returns:
+ * 1 if page table needed to be allocated, 0 if page table was already
+ * allocated, negative errno if an error occurred.
+ */
+static int amdgpu_vm_pt_alloc(struct amdgpu_device *adev,
+			      struct amdgpu_vm *vm,
+			      struct amdgpu_vm_pt_cursor *cursor,
+			      bool immediate)
+{
+	struct amdgpu_vm_bo_base *entry = cursor->entry;
+	struct amdgpu_bo *pt_bo;
+	struct amdgpu_bo_vm *pt;
+	int r;
+
+	if (entry->bo)
+		return 0;
+
+	r = amdgpu_vm_pt_create(adev, vm, cursor->level, immediate, &pt);
+	if (r)
+		return r;
+
+	/* Keep a reference to the root directory to avoid
+	 * freeing them up in the wrong order.
+	 */
+	pt_bo = &pt->bo;
+	pt_bo->parent = amdgpu_bo_ref(cursor->parent->bo);
+	amdgpu_vm_bo_base_init(entry, vm, pt_bo);
+	r = amdgpu_vm_pt_clear(adev, vm, pt, immediate);
+	if (r)
+		goto error_free_pt;
+
+	return 0;
+
+error_free_pt:
+	amdgpu_bo_unref(&pt->shadow);
+	amdgpu_bo_unref(&pt_bo);
+	return r;
+}
+
+/**
+ * amdgpu_vm_free_table - fre one PD/PT
+ *
+ * @entry: PDE to free
+ */
+static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
+{
+	struct amdgpu_bo *shadow;
+
+	if (!entry->bo)
+		return;
+	shadow = amdgpu_bo_shadowed(entry->bo);
+	entry->bo->vm_bo = NULL;
+	list_del(&entry->vm_status);
+	amdgpu_bo_unref(&shadow);
+	amdgpu_bo_unref(&entry->bo);
+}
+
+/**
+ * amdgpu_vm_pt_free_dfs - free PD/PT levels
+ *
+ * @adev: amdgpu device structure
+ * @vm: amdgpu vm structure
+ * @start: optional cursor where to start freeing PDs/PTs
+ *
+ * Free the page directory or page table level and all sub levels.
+ */
+static void amdgpu_vm_pt_free_dfs(struct amdgpu_device *adev,
+				  struct amdgpu_vm *vm,
+				  struct amdgpu_vm_pt_cursor *start)
+{
+	struct amdgpu_vm_pt_cursor cursor;
+	struct amdgpu_vm_bo_base *entry;
+
+	vm->bulk_moveable = false;
+
+	for_each_amdgpu_vm_pt_dfs_safe(adev, vm, start, cursor, entry)
+		amdgpu_vm_pt_free(entry);
+
+	if (start)
+		amdgpu_vm_pt_free(start->entry);
+}
+
+/**
+ * amdgpu_vm_pt_free_root - free root PD
+ * @adev: amdgpu device structure
+ * @vm: amdgpu vm structure
+ *
+ * Free the root page directory and everything below it.
+ */
+void amdgpu_vm_pt_free_root(struct amdgpu_device *adev, struct amdgpu_vm *vm)
+{
+	amdgpu_vm_pt_free_dfs(adev, vm, NULL);
+}
+
+/**
+ * amdgpu_vm_pt_is_root_clean - check if a root PD is clean
+ *
+ * @adev: amdgpu_device pointer
+ * @vm: the VM to check
+ *
+ * Check all entries of the root PD, if any subsequent PDs are allocated,
+ * it means there are page table creating and filling, and is no a clean
+ * VM
+ *
+ * Returns:
+ *	0 if this VM is clean
+ */
+bool amdgpu_vm_pt_is_root_clean(struct amdgpu_device *adev,
+				struct amdgpu_vm *vm)
+{
+	enum amdgpu_vm_level root = adev->vm_manager.root_level;
+	unsigned int entries = amdgpu_vm_pt_num_entries(adev, root);
+	unsigned int i = 0;
+
+	for (i = 0; i < entries; i++) {
+		if (to_amdgpu_bo_vm(vm->root.bo)->entries[i].bo)
+			return false;
+	}
+	return true;
+}
+
+/**
+ * amdgpu_vm_pde_update - update a single level in the hierarchy
+ *
+ * @params: parameters for the update
+ * @entry: entry to update
+ *
+ * Makes sure the requested entry in parent is up to date.
+ */
+int amdgpu_vm_pde_update(struct amdgpu_vm_update_params *params,
+			 struct amdgpu_vm_bo_base *entry)
+{
+	struct amdgpu_vm_bo_base *parent = amdgpu_vm_pt_parent(entry);
+	struct amdgpu_bo *bo = parent->bo, *pbo;
+	struct amdgpu_vm *vm = params->vm;
+	uint64_t pde, pt, flags;
+	unsigned int level;
+
+	for (level = 0, pbo = bo->parent; pbo; ++level)
+		pbo = pbo->parent;
+
+	level += params->adev->vm_manager.root_level;
+	amdgpu_gmc_get_pde_for_bo(entry->bo, level, &pt, &flags);
+	pde = (entry - to_amdgpu_bo_vm(parent->bo)->entries) * 8;
+	return vm->update_funcs->update(params, to_amdgpu_bo_vm(bo), pde, pt,
+					1, 0, flags);
+}
+
+/*
+ * amdgpu_vm_pte_update_flags - figure out flags for PTE updates
+ *
+ * Make sure to set the right flags for the PTEs at the desired level.
+ */
+static void amdgpu_vm_pte_update_flags(struct amdgpu_vm_update_params *params,
+				       struct amdgpu_bo_vm *pt,
+				       unsigned int level,
+				       uint64_t pe, uint64_t addr,
+				       unsigned int count, uint32_t incr,
+				       uint64_t flags)
+
+{
+	if (level != AMDGPU_VM_PTB) {
+		flags |= AMDGPU_PDE_PTE;
+		amdgpu_gmc_get_vm_pde(params->adev, level, &addr, &flags);
+
+	} else if (params->adev->asic_type >= CHIP_VEGA10 &&
+		   !(flags & AMDGPU_PTE_VALID) &&
+		   !(flags & AMDGPU_PTE_PRT)) {
+
+		/* Workaround for fault priority problem on GMC9 */
+		flags |= AMDGPU_PTE_EXECUTABLE;
+	}
+
+	params->vm->update_funcs->update(params, pt, pe, addr, count, incr,
+					 flags);
+}
+
+/**
+ * amdgpu_vm_pte_fragment - get fragment for PTEs
+ *
+ * @params: see amdgpu_vm_update_params definition
+ * @start: first PTE to handle
+ * @end: last PTE to handle
+ * @flags: hw mapping flags
+ * @frag: resulting fragment size
+ * @frag_end: end of this fragment
+ *
+ * Returns the first possible fragment for the start and end address.
+ */
+static void amdgpu_vm_pte_fragment(struct amdgpu_vm_update_params *params,
+				   uint64_t start, uint64_t end, uint64_t flags,
+				   unsigned int *frag, uint64_t *frag_end)
+{
+	/**
+	 * The MC L1 TLB supports variable sized pages, based on a fragment
+	 * field in the PTE. When this field is set to a non-zero value, page
+	 * granularity is increased from 4KB to (1 << (12 + frag)). The PTE
+	 * flags are considered valid for all PTEs within the fragment range
+	 * and corresponding mappings are assumed to be physically contiguous.
+	 *
+	 * The L1 TLB can store a single PTE for the whole fragment,
+	 * significantly increasing the space available for translation
+	 * caching. This leads to large improvements in throughput when the
+	 * TLB is under pressure.
+	 *
+	 * The L2 TLB distributes small and large fragments into two
+	 * asymmetric partitions. The large fragment cache is significantly
+	 * larger. Thus, we try to use large fragments wherever possible.
+	 * Userspace can support this by aligning virtual base address and
+	 * allocation size to the fragment size.
+	 *
+	 * Starting with Vega10 the fragment size only controls the L1. The L2
+	 * is now directly feed with small/huge/giant pages from the walker.
+	 */
+	unsigned int max_frag;
+
+	if (params->adev->asic_type < CHIP_VEGA10)
+		max_frag = params->adev->vm_manager.fragment_size;
+	else
+		max_frag = 31;
+
+	/* system pages are non continuously */
+	if (params->pages_addr) {
+		*frag = 0;
+		*frag_end = end;
+		return;
+	}
+
+	/* This intentionally wraps around if no bit is set */
+	*frag = min_t(unsigned int, ffs(start) - 1, fls64(end - start) - 1);
+	if (*frag >= max_frag) {
+		*frag = max_frag;
+		*frag_end = end & ~((1ULL << max_frag) - 1);
+	} else {
+		*frag_end = start + (1 << *frag);
+	}
+}
+
+/**
+ * amdgpu_vm_ptes_update - make sure that page tables are valid
+ *
+ * @params: see amdgpu_vm_update_params definition
+ * @start: start of GPU address range
+ * @end: end of GPU address range
+ * @dst: destination address to map to, the next dst inside the function
+ * @flags: mapping flags
+ *
+ * Update the page tables in the range @start - @end.
+ *
+ * Returns:
+ * 0 for success, -EINVAL for failure.
+ */
+int amdgpu_vm_ptes_update(struct amdgpu_vm_update_params *params,
+			  uint64_t start, uint64_t end,
+			  uint64_t dst, uint64_t flags)
+{
+	struct amdgpu_device *adev = params->adev;
+	struct amdgpu_vm_pt_cursor cursor;
+	uint64_t frag_start = start, frag_end;
+	unsigned int frag;
+	int r;
+
+	/* figure out the initial fragment */
+	amdgpu_vm_pte_fragment(params, frag_start, end, flags, &frag,
+			       &frag_end);
+
+	/* walk over the address space and update the PTs */
+	amdgpu_vm_pt_start(adev, params->vm, start, &cursor);
+	while (cursor.pfn < end) {
+		unsigned int shift, parent_shift, mask;
+		uint64_t incr, entry_end, pe_start;
+		struct amdgpu_bo *pt;
+
+		if (!params->unlocked) {
+			/* make sure that the page tables covering the
+			 * address range are actually allocated
+			 */
+			r = amdgpu_vm_pt_alloc(params->adev, params->vm,
+					       &cursor, params->immediate);
+			if (r)
+				return r;
+		}
+
+		shift = amdgpu_vm_pt_level_shift(adev, cursor.level);
+		parent_shift = amdgpu_vm_pt_level_shift(adev, cursor.level - 1);
+		if (params->unlocked) {
+			/* Unlocked updates are only allowed on the leaves */
+			if (amdgpu_vm_pt_descendant(adev, &cursor))
+				continue;
+		} else if (adev->asic_type < CHIP_VEGA10 &&
+			   (flags & AMDGPU_PTE_VALID)) {
+			/* No huge page support before GMC v9 */
+			if (cursor.level != AMDGPU_VM_PTB) {
+				if (!amdgpu_vm_pt_descendant(adev, &cursor))
+					return -ENOENT;
+				continue;
+			}
+		} else if (frag < shift) {
+			/* We can't use this level when the fragment size is
+			 * smaller than the address shift. Go to the next
+			 * child entry and try again.
+			 */
+			if (amdgpu_vm_pt_descendant(adev, &cursor))
+				continue;
+		} else if (frag >= parent_shift) {
+			/* If the fragment size is even larger than the parent
+			 * shift we should go up one level and check it again.
+			 */
+			if (!amdgpu_vm_pt_ancestor(&cursor))
+				return -EINVAL;
+			continue;
+		}
+
+		pt = cursor.entry->bo;
+		if (!pt) {
+			/* We need all PDs and PTs for mapping something, */
+			if (flags & AMDGPU_PTE_VALID)
+				return -ENOENT;
+
+			/* but unmapping something can happen at a higher
+			 * level.
+			 */
+			if (!amdgpu_vm_pt_ancestor(&cursor))
+				return -EINVAL;
+
+			pt = cursor.entry->bo;
+			shift = parent_shift;
+			frag_end = max(frag_end, ALIGN(frag_start + 1,
+				   1ULL << shift));
+		}
+
+		/* Looks good so far, calculate parameters for the update */
+		incr = (uint64_t)AMDGPU_GPU_PAGE_SIZE << shift;
+		mask = amdgpu_vm_pt_entries_mask(adev, cursor.level);
+		pe_start = ((cursor.pfn >> shift) & mask) * 8;
+		entry_end = ((uint64_t)mask + 1) << shift;
+		entry_end += cursor.pfn & ~(entry_end - 1);
+		entry_end = min(entry_end, end);
+
+		do {
+			struct amdgpu_vm *vm = params->vm;
+			uint64_t upd_end = min(entry_end, frag_end);
+			unsigned int nptes = (upd_end - frag_start) >> shift;
+			uint64_t upd_flags = flags | AMDGPU_PTE_FRAG(frag);
+
+			/* This can happen when we set higher level PDs to
+			 * silent to stop fault floods.
+			 */
+			nptes = max(nptes, 1u);
+
+			trace_amdgpu_vm_update_ptes(params, frag_start, upd_end,
+						    min(nptes, 32u), dst, incr,
+						    upd_flags,
+						    vm->task_info.pid,
+						    vm->immediate.fence_context);
+			amdgpu_vm_pte_update_flags(params, to_amdgpu_bo_vm(pt),
+						   cursor.level, pe_start, dst,
+						   nptes, incr, upd_flags);
+
+			pe_start += nptes * 8;
+			dst += nptes * incr;
+
+			frag_start = upd_end;
+			if (frag_start >= frag_end) {
+				/* figure out the next fragment */
+				amdgpu_vm_pte_fragment(params, frag_start, end,
+						       flags, &frag, &frag_end);
+				if (frag < shift)
+					break;
+			}
+		} while (frag_start < entry_end);
+
+		if (amdgpu_vm_pt_descendant(adev, &cursor)) {
+			/* Free all child entries.
+			 * Update the tables with the flags and addresses and free up subsequent
+			 * tables in the case of huge pages or freed up areas.
+			 * This is the maximum you can free, because all other page tables are not
+			 * completely covered by the range and so potentially still in use.
+			 */
+			while (cursor.pfn < frag_start) {
+				/* Make sure previous mapping is freed */
+				if (cursor.entry->bo) {
+					params->table_freed = true;
+					amdgpu_vm_pt_free_dfs(adev, params->vm,
+							      &cursor);
+				}
+				amdgpu_vm_pt_next(adev, &cursor);
+			}
+
+		} else if (frag >= shift) {
+			/* or just move on to the next on the same level. */
+			amdgpu_vm_pt_next(adev, &cursor);
+		}
+	}
+
+	return 0;
+}
-- 
2.25.1


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7319E4F80F2
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Apr 2022 15:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C2610E9E7;
	Thu,  7 Apr 2022 13:47:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A766210EA45;
 Thu,  7 Apr 2022 13:47:39 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aef77.dynamic.kabel-deutschland.de
 [95.90.239.119])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id D82C161EA1929;
 Thu,  7 Apr 2022 15:47:36 +0200 (CEST)
Message-ID: <e6738702-c93d-8d4c-02e0-4b0d53b60e92@molgen.mpg.de>
Date: Thu, 7 Apr 2022 15:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v12] drm/amdgpu: add drm buddy support to amdgpu
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220407054651.3924-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: alexander.deucher@amd.com, Daniel Stone <daniel@fooishbar.org>,
 christian.koenig@amd.com, daniel@ffwll.ch, matthew.auld@intel.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear Arunpravin,


Thank you for your patch.

Am 07.04.22 um 07:46 schrieb Arunpravin Paneer Selvam:
> - Switch to drm buddy allocator
> - Add resource cursor support for drm buddy

I though after the last long discussion, you would actually act on the 
review comments. Daniel wrote a good summary, you could more or less 
copy and past. So why didn’t you?

So, I really wish to not have the patch commit as is.

The summary should also say something about using mutex over spinlocks. 
For me the version change summaries below are just for reviewers of 
earlier iterations to see what changed, and not something to be read easily.


Kind regards,

Paul


> v2(Matthew Auld):
>    - replace spinlock with mutex as we call kmem_cache_zalloc
>      (..., GFP_KERNEL) in drm_buddy_alloc() function
> 
>    - lock drm_buddy_block_trim() function as it calls
>      mark_free/mark_split are all globally visible
> 
> v3(Matthew Auld):
>    - remove trim method error handling as we address the failure case
>      at drm_buddy_block_trim() function
> 
> v4:
>    - fix warnings reported by kernel test robot <lkp@intel.com>
> 
> v5:
>    - fix merge conflict issue
> 
> v6:
>    - fix warnings reported by kernel test robot <lkp@intel.com>
> 
> v7:
>    - remove DRM_BUDDY_RANGE_ALLOCATION flag usage
> 
> v8:
>    - keep DRM_BUDDY_RANGE_ALLOCATION flag usage
>    - resolve conflicts created by drm/amdgpu: remove VRAM accounting v2
> 
> v9(Christian):
>    - merged the below patch
>       - drm/amdgpu: move vram inline functions into a header
>    - rename label name as fallback
>    - move struct amdgpu_vram_mgr to amdgpu_vram_mgr.h
>    - remove unnecessary flags from struct amdgpu_vram_reservation
>    - rewrite block NULL check condition
>    - change else style as per coding standard
>    - rewrite the node max size
>    - add a helper function to fetch the first entry from the list
> 
> v10(Christian):
>     - rename amdgpu_get_node() function name as amdgpu_vram_mgr_first_block
> 
> v11:
>     - if size is not aligned with min_page_size, enable is_contiguous flag,
>       therefore, the size round up to the power of two and trimmed to the
>       original size.
> v12:
>     - rename the function names having prefix as amdgpu_vram_mgr_*()
>     - modify the round_up() logic conforming to contiguous flag enablement
>       or if size is not aligned to min_block_size
>     - modify the trim logic
>     - rename node as block wherever applicable
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/Kconfig                       |   1 +
>   .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |  97 ++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |  10 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  | 359 ++++++++++--------
>   4 files changed, 291 insertions(+), 176 deletions(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f1422bee3dcc..5133c3f028ab 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -280,6 +280,7 @@ config DRM_AMDGPU
>   	select HWMON
>   	select BACKLIGHT_CLASS_DEVICE
>   	select INTERVAL_TREE
> +	select DRM_BUDDY
>   	help
>   	  Choose this option if you have a recent AMD Radeon graphics card.
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index acfa207cf970..6546552e596c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -30,12 +30,15 @@
>   #include <drm/ttm/ttm_resource.h>
>   #include <drm/ttm/ttm_range_manager.h>
>   
> +#include "amdgpu_vram_mgr.h"
> +
>   /* state back for walking over vram_mgr and gtt_mgr allocations */
>   struct amdgpu_res_cursor {
>   	uint64_t		start;
>   	uint64_t		size;
>   	uint64_t		remaining;
> -	struct drm_mm_node	*node;
> +	void			*node;
> +	uint32_t		mem_type;
>   };
>   
>   /**
> @@ -52,27 +55,63 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   				    uint64_t start, uint64_t size,
>   				    struct amdgpu_res_cursor *cur)
>   {
> +	struct drm_buddy_block *block;
> +	struct list_head *head, *next;
>   	struct drm_mm_node *node;
>   
> -	if (!res || res->mem_type == TTM_PL_SYSTEM) {
> -		cur->start = start;
> -		cur->size = size;
> -		cur->remaining = size;
> -		cur->node = NULL;
> -		WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
> -		return;
> -	}
> +	if (!res)
> +		goto fallback;
>   
>   	BUG_ON(start + size > res->num_pages << PAGE_SHIFT);
>   
> -	node = to_ttm_range_mgr_node(res)->mm_nodes;
> -	while (start >= node->size << PAGE_SHIFT)
> -		start -= node++->size << PAGE_SHIFT;
> +	cur->mem_type = res->mem_type;
> +
> +	switch (cur->mem_type) {
> +	case TTM_PL_VRAM:
> +		head = &to_amdgpu_vram_mgr_resource(res)->blocks;
> +
> +		block = list_first_entry_or_null(head,
> +						 struct drm_buddy_block,
> +						 link);
> +		if (!block)
> +			goto fallback;
> +
> +		while (start >= amdgpu_vram_mgr_block_size(block)) {
> +			start -= amdgpu_vram_mgr_block_size(block);
> +
> +			next = block->link.next;
> +			if (next != head)
> +				block = list_entry(next, struct drm_buddy_block, link);
> +		}
> +
> +		cur->start = amdgpu_vram_mgr_block_start(block) + start;
> +		cur->size = min(amdgpu_vram_mgr_block_size(block) - start, size);
> +		cur->remaining = size;
> +		cur->node = block;
> +		break;
> +	case TTM_PL_TT:
> +		node = to_ttm_range_mgr_node(res)->mm_nodes;
> +		while (start >= node->size << PAGE_SHIFT)
> +			start -= node++->size << PAGE_SHIFT;
> +
> +		cur->start = (node->start << PAGE_SHIFT) + start;
> +		cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +		cur->remaining = size;
> +		cur->node = node;
> +		break;
> +	default:
> +		goto fallback;
> +	}
>   
> -	cur->start = (node->start << PAGE_SHIFT) + start;
> -	cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +	return;
> +
> +fallback:
> +	cur->start = start;
> +	cur->size = size;
>   	cur->remaining = size;
> -	cur->node = node;
> +	cur->node = NULL;
> +	WARN_ON(res && start + size > res->num_pages << PAGE_SHIFT);
> +	return;
>   }
>   
>   /**
> @@ -85,7 +124,9 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>    */
>   static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   {
> -	struct drm_mm_node *node = cur->node;
> +	struct drm_buddy_block *block;
> +	struct drm_mm_node *node;
> +	struct list_head *next;
>   
>   	BUG_ON(size > cur->remaining);
>   
> @@ -99,9 +140,27 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   		return;
>   	}
>   
> -	cur->node = ++node;
> -	cur->start = node->start << PAGE_SHIFT;
> -	cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +	switch (cur->mem_type) {
> +	case TTM_PL_VRAM:
> +		block = cur->node;
> +
> +		next = block->link.next;
> +		block = list_entry(next, struct drm_buddy_block, link);
> +
> +		cur->node = block;
> +		cur->start = amdgpu_vram_mgr_block_start(block);
> +		cur->size = min(amdgpu_vram_mgr_block_size(block), cur->remaining);
> +		break;
> +	case TTM_PL_TT:
> +		node = cur->node;
> +
> +		cur->node = ++node;
> +		cur->start = node->start << PAGE_SHIFT;
> +		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +		break;
> +	default:
> +		return;
> +	}
>   }
>   
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 9120ae80ef52..6a70818039dd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -26,6 +26,7 @@
>   
>   #include <linux/dma-direction.h>
>   #include <drm/gpu_scheduler.h>
> +#include "amdgpu_vram_mgr.h"
>   #include "amdgpu.h"
>   
>   #define AMDGPU_PL_GDS		(TTM_PL_PRIV + 0)
> @@ -38,15 +39,6 @@
>   
>   #define AMDGPU_POISON	0xd0bed0be
>   
> -struct amdgpu_vram_mgr {
> -	struct ttm_resource_manager manager;
> -	struct drm_mm mm;
> -	spinlock_t lock;
> -	struct list_head reservations_pending;
> -	struct list_head reserved_pages;
> -	atomic64_t vis_usage;
> -};
> -
>   struct amdgpu_gtt_mgr {
>   	struct ttm_resource_manager manager;
>   	struct drm_mm mm;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 0a7611648573..49e4092f447f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -32,8 +32,10 @@
>   #include "atom.h"
>   
>   struct amdgpu_vram_reservation {
> -	struct list_head node;
> -	struct drm_mm_node mm_node;
> +	u64 start;
> +	u64 size;
> +	struct list_head allocated;
> +	struct list_head blocks;
>   };
>   
>   static inline struct amdgpu_vram_mgr *
> @@ -186,18 +188,18 @@ const struct attribute_group amdgpu_vram_mgr_attr_group = {
>   };
>   
>   /**
> - * amdgpu_vram_mgr_vis_size - Calculate visible node size
> + * amdgpu_vram_mgr_vis_size - Calculate visible block size
>    *
>    * @adev: amdgpu_device pointer
> - * @node: MM node structure
> + * @block: DRM BUDDY block structure
>    *
> - * Calculate how many bytes of the MM node are inside visible VRAM
> + * Calculate how many bytes of the DRM BUDDY block are inside visible VRAM
>    */
>   static u64 amdgpu_vram_mgr_vis_size(struct amdgpu_device *adev,
> -				    struct drm_mm_node *node)
> +				    struct drm_buddy_block *block)
>   {
> -	uint64_t start = node->start << PAGE_SHIFT;
> -	uint64_t end = (node->size + node->start) << PAGE_SHIFT;
> +	u64 start = amdgpu_vram_mgr_block_start(block);
> +	u64 end = start + amdgpu_vram_mgr_block_size(block);
>   
>   	if (start >= adev->gmc.visible_vram_size)
>   		return 0;
> @@ -218,9 +220,9 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>   	struct ttm_resource *res = bo->tbo.resource;
> -	unsigned pages = res->num_pages;
> -	struct drm_mm_node *mm;
> -	u64 usage;
> +	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
> +	struct drm_buddy_block *block;
> +	u64 usage = 0;
>   
>   	if (amdgpu_gmc_vram_full_visible(&adev->gmc))
>   		return amdgpu_bo_size(bo);
> @@ -228,9 +230,8 @@ u64 amdgpu_vram_mgr_bo_visible_size(struct amdgpu_bo *bo)
>   	if (res->start >= adev->gmc.visible_vram_size >> PAGE_SHIFT)
>   		return 0;
>   
> -	mm = &container_of(res, struct ttm_range_mgr_node, base)->mm_nodes[0];
> -	for (usage = 0; pages; pages -= mm->size, mm++)
> -		usage += amdgpu_vram_mgr_vis_size(adev, mm);
> +	list_for_each_entry(block, &vres->blocks, link)
> +		usage += amdgpu_vram_mgr_vis_size(adev, block);
>   
>   	return usage;
>   }
> @@ -240,23 +241,30 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> -	struct drm_mm *mm = &mgr->mm;
> +	struct drm_buddy *mm = &mgr->mm;
>   	struct amdgpu_vram_reservation *rsv, *temp;
> +	struct drm_buddy_block *block;
>   	uint64_t vis_usage;
>   
> -	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node) {
> -		if (drm_mm_reserve_node(mm, &rsv->mm_node))
> +	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks) {
> +		if (drm_buddy_alloc_blocks(mm, rsv->start, rsv->start + rsv->size,
> +					   rsv->size, mm->chunk_size, &rsv->allocated,
> +					   DRM_BUDDY_RANGE_ALLOCATION))
> +			continue;
> +
> +		block = amdgpu_vram_mgr_first_block(&rsv->allocated);
> +		if (!block)
>   			continue;
>   
>   		dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
> -			rsv->mm_node.start, rsv->mm_node.size);
> +			rsv->start, rsv->size);
>   
> -		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
> +		vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
>   		atomic64_add(vis_usage, &mgr->vis_usage);
>   		spin_lock(&man->bdev->lru_lock);
> -		man->usage += rsv->mm_node.size << PAGE_SHIFT;
> +		man->usage += rsv->size;
>   		spin_unlock(&man->bdev->lru_lock);
> -		list_move(&rsv->node, &mgr->reserved_pages);
> +		list_move(&rsv->blocks, &mgr->reserved_pages);
>   	}
>   }
>   
> @@ -278,14 +286,16 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>   	if (!rsv)
>   		return -ENOMEM;
>   
> -	INIT_LIST_HEAD(&rsv->node);
> -	rsv->mm_node.start = start >> PAGE_SHIFT;
> -	rsv->mm_node.size = size >> PAGE_SHIFT;
> +	INIT_LIST_HEAD(&rsv->allocated);
> +	INIT_LIST_HEAD(&rsv->blocks);
>   
> -	spin_lock(&mgr->lock);
> -	list_add_tail(&rsv->node, &mgr->reservations_pending);
> +	rsv->start = start;
> +	rsv->size = size;
> +
> +	mutex_lock(&mgr->lock);
> +	list_add_tail(&rsv->blocks, &mgr->reservations_pending);
>   	amdgpu_vram_mgr_do_reserve(&mgr->manager);
> -	spin_unlock(&mgr->lock);
> +	mutex_unlock(&mgr->lock);
>   
>   	return 0;
>   }
> @@ -307,19 +317,19 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>   	struct amdgpu_vram_reservation *rsv;
>   	int ret;
>   
> -	spin_lock(&mgr->lock);
> +	mutex_lock(&mgr->lock);
>   
> -	list_for_each_entry(rsv, &mgr->reservations_pending, node) {
> -		if ((rsv->mm_node.start <= start) &&
> -		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
> +	list_for_each_entry(rsv, &mgr->reservations_pending, blocks) {
> +		if (rsv->start <= start &&
> +		    (start < (rsv->start + rsv->size))) {
>   			ret = -EBUSY;
>   			goto out;
>   		}
>   	}
>   
> -	list_for_each_entry(rsv, &mgr->reserved_pages, node) {
> -		if ((rsv->mm_node.start <= start) &&
> -		    (start < (rsv->mm_node.start + rsv->mm_node.size))) {
> +	list_for_each_entry(rsv, &mgr->reserved_pages, blocks) {
> +		if (rsv->start <= start &&
> +		    (start < (rsv->start + rsv->size))) {
>   			ret = 0;
>   			goto out;
>   		}
> @@ -327,32 +337,10 @@ int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>   
>   	ret = -ENOENT;
>   out:
> -	spin_unlock(&mgr->lock);
> +	mutex_unlock(&mgr->lock);
>   	return ret;
>   }
>   
> -/**
> - * amdgpu_vram_mgr_virt_start - update virtual start address
> - *
> - * @mem: ttm_resource to update
> - * @node: just allocated node
> - *
> - * Calculate a virtual BO start address to easily check if everything is CPU
> - * accessible.
> - */
> -static void amdgpu_vram_mgr_virt_start(struct ttm_resource *mem,
> -				       struct drm_mm_node *node)
> -{
> -	unsigned long start;
> -
> -	start = node->start + node->size;
> -	if (start > mem->num_pages)
> -		start -= mem->num_pages;
> -	else
> -		start = 0;
> -	mem->start = max(mem->start, start);
> -}
> -
>   /**
>    * amdgpu_vram_mgr_new - allocate new ranges
>    *
> @@ -368,46 +356,44 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   			       const struct ttm_place *place,
>   			       struct ttm_resource **res)
>   {
> -	unsigned long lpfn, num_nodes, pages_per_node, pages_left, pages;
> +	u64 vis_usage = 0, max_bytes, cur_size, min_block_size;
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> -	uint64_t vis_usage = 0, mem_bytes, max_bytes;
> -	struct ttm_range_mgr_node *node;
> -	struct drm_mm *mm = &mgr->mm;
> -	enum drm_mm_insert_mode mode;
> -	unsigned i;
> +	struct amdgpu_vram_mgr_resource *vres;
> +	u64 size, remaining_size, lpfn, fpfn;
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
> +	unsigned long pages_per_block;
>   	int r;
>   
> -	lpfn = place->lpfn;
> +	lpfn = place->lpfn << PAGE_SHIFT;
>   	if (!lpfn)
> -		lpfn = man->size >> PAGE_SHIFT;
> +		lpfn = man->size;
> +
> +	fpfn = place->fpfn << PAGE_SHIFT;
>   
>   	max_bytes = adev->gmc.mc_vram_size;
>   	if (tbo->type != ttm_bo_type_kernel)
>   		max_bytes -= AMDGPU_VM_RESERVED_VRAM;
>   
> -	mem_bytes = tbo->base.size;
>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> -		pages_per_node = ~0ul;
> -		num_nodes = 1;
> +		pages_per_block = ~0ul;
>   	} else {
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -		pages_per_node = HPAGE_PMD_NR;
> +		pages_per_block = HPAGE_PMD_NR;
>   #else
>   		/* default to 2MB */
> -		pages_per_node = 2UL << (20UL - PAGE_SHIFT);
> +		pages_per_block = 2UL << (20UL - PAGE_SHIFT);
>   #endif
> -		pages_per_node = max_t(uint32_t, pages_per_node,
> -				       tbo->page_alignment);
> -		num_nodes = DIV_ROUND_UP_ULL(PFN_UP(mem_bytes), pages_per_node);
> +		pages_per_block = max_t(uint32_t, pages_per_block,
> +					tbo->page_alignment);
>   	}
>   
> -	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
> -			GFP_KERNEL | __GFP_ZERO);
> -	if (!node)
> +	vres = kzalloc(sizeof(*vres), GFP_KERNEL);
> +	if (!vres)
>   		return -ENOMEM;
>   
> -	ttm_resource_init(tbo, place, &node->base);
> +	ttm_resource_init(tbo, place, &vres->base);
>   
>   	/* bail out quickly if there's likely not enough VRAM for this BO */
>   	if (ttm_resource_manager_usage(man) > max_bytes) {
> @@ -415,66 +401,130 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		goto error_fini;
>   	}
>   
> -	mode = DRM_MM_INSERT_BEST;
> +	INIT_LIST_HEAD(&vres->blocks);
> +
>   	if (place->flags & TTM_PL_FLAG_TOPDOWN)
> -		mode = DRM_MM_INSERT_HIGH;
> -
> -	pages_left = node->base.num_pages;
> -
> -	/* Limit maximum size to 2GB due to SG table limitations */
> -	pages = min(pages_left, 2UL << (30 - PAGE_SHIFT));
> -
> -	i = 0;
> -	spin_lock(&mgr->lock);
> -	while (pages_left) {
> -		uint32_t alignment = tbo->page_alignment;
> -
> -		if (pages >= pages_per_node)
> -			alignment = pages_per_node;
> -
> -		r = drm_mm_insert_node_in_range(mm, &node->mm_nodes[i], pages,
> -						alignment, 0, place->fpfn,
> -						lpfn, mode);
> -		if (unlikely(r)) {
> -			if (pages > pages_per_node) {
> -				if (is_power_of_2(pages))
> -					pages = pages / 2;
> -				else
> -					pages = rounddown_pow_of_two(pages);
> -				continue;
> +		vres->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
> +
> +	if (fpfn || lpfn != man->size)
> +		/* Allocate blocks in desired range */
> +		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> +
> +	remaining_size = vres->base.num_pages << PAGE_SHIFT;
> +
> +	mutex_lock(&mgr->lock);
> +	while (remaining_size) {
> +		if (tbo->page_alignment)
> +			min_block_size = tbo->page_alignment << PAGE_SHIFT;
> +		else
> +			min_block_size = mgr->default_page_size;
> +
> +		BUG_ON(min_block_size < mm->chunk_size);
> +
> +		/* Limit maximum size to 2GiB due to SG table limitations */
> +		size = min(remaining_size, 2ULL << 30);
> +
> +		if (size >= pages_per_block << PAGE_SHIFT)
> +			min_block_size = pages_per_block << PAGE_SHIFT;
> +
> +		cur_size = size;
> +
> +		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
> +			/*
> +			 * Except for actual range allocation, modify the size and
> +			 * min_block_size conforming to continuous flag enablement
> +			 */
> +			if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +				size = roundup_pow_of_two(size);
> +				min_block_size = size;
> +			/*
> +			 * Modify the size value if size is not
> +			 * aligned with min_block_size
> +			 */
> +			} else if (!IS_ALIGNED(size, min_block_size)) {
> +				size = round_up(size, min_block_size);
>   			}
> -			goto error_free;
>   		}
>   
> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, &node->mm_nodes[i]);
> -		amdgpu_vram_mgr_virt_start(&node->base, &node->mm_nodes[i]);
> -		pages_left -= pages;
> -		++i;
> +		r = drm_buddy_alloc_blocks(mm, fpfn,
> +					   lpfn,
> +					   size,
> +					   min_block_size,
> +					   &vres->blocks,
> +					   vres->flags);
> +		if (unlikely(r))
> +			goto error_free_blocks;
> +
> +		if (size > remaining_size)
> +			remaining_size = 0;
> +		else
> +			remaining_size -= size;
> +	}
> +	mutex_unlock(&mgr->lock);
> +
> +	if (cur_size != size) {
> +		struct drm_buddy_block *block;
> +		struct list_head *trim_list;
> +		u64 original_size;
> +		LIST_HEAD(temp);
> +
> +		trim_list = &vres->blocks;
> +		original_size = vres->base.num_pages << PAGE_SHIFT;
> +
> +		/*
> +		 * If size value is rounded up to min_block_size, trim the last
> +		 * block to the required size
> +		 */
> +		if (!list_is_singular(&vres->blocks)) {
> +			block = list_last_entry(&vres->blocks, typeof(*block), link);
> +			list_move_tail(&block->link, &temp);
> +			trim_list = &temp;
> +			/*
> +			 * Compute the original_size value by subtracting the
> +			 * last block size with (aligned size - original size)
> +			 */
> +			original_size = amdgpu_vram_mgr_block_size(block) - (size - cur_size);
> +		}
>   
> -		if (pages > pages_left)
> -			pages = pages_left;
> +		mutex_lock(&mgr->lock);
> +		drm_buddy_block_trim(mm,
> +				     original_size,
> +				     trim_list);
> +		mutex_unlock(&mgr->lock);
> +
> +		if (!list_empty(&temp))
> +			list_splice_tail(trim_list, &vres->blocks);
> +	}
> +
> +	list_for_each_entry(block, &vres->blocks, link)
> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
> +
> +	block = amdgpu_vram_mgr_first_block(&vres->blocks);
> +	if (!block) {
> +		r = -EINVAL;
> +		goto error_fini;
>   	}
> -	spin_unlock(&mgr->lock);
>   
> -	if (i == 1)
> -		node->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
> +	vres->base.start = amdgpu_vram_mgr_block_start(block) >> PAGE_SHIFT;
> +
> +	if (amdgpu_is_vram_mgr_blocks_contiguous(&vres->blocks))
> +		vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>   
>   	if (adev->gmc.xgmi.connected_to_cpu)
> -		node->base.bus.caching = ttm_cached;
> +		vres->base.bus.caching = ttm_cached;
>   	else
> -		node->base.bus.caching = ttm_write_combined;
> +		vres->base.bus.caching = ttm_write_combined;
>   
>   	atomic64_add(vis_usage, &mgr->vis_usage);
> -	*res = &node->base;
> +	*res = &vres->base;
>   	return 0;
>   
> -error_free:
> -	while (i--)
> -		drm_mm_remove_node(&node->mm_nodes[i]);
> -	spin_unlock(&mgr->lock);
> +error_free_blocks:
> +	drm_buddy_free_list(mm, &vres->blocks);
> +	mutex_unlock(&mgr->lock);
>   error_fini:
> -	ttm_resource_fini(man, &node->base);
> -	kvfree(node);
> +	ttm_resource_fini(man, &vres->base);
> +	kfree(vres);
>   
>   	return r;
>   }
> @@ -490,27 +540,26 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   				struct ttm_resource *res)
>   {
> -	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
> +	struct amdgpu_vram_mgr_resource *vres = to_amdgpu_vram_mgr_resource(res);
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	struct amdgpu_device *adev = to_amdgpu_device(mgr);
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
>   	uint64_t vis_usage = 0;
> -	unsigned i, pages;
>   
> -	spin_lock(&mgr->lock);
> -	for (i = 0, pages = res->num_pages; pages;
> -	     pages -= node->mm_nodes[i].size, ++i) {
> -		struct drm_mm_node *mm = &node->mm_nodes[i];
> +	mutex_lock(&mgr->lock);
> +	list_for_each_entry(block, &vres->blocks, link)
> +		vis_usage += amdgpu_vram_mgr_vis_size(adev, block);
>   
> -		drm_mm_remove_node(mm);
> -		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
> -	}
>   	amdgpu_vram_mgr_do_reserve(man);
> -	spin_unlock(&mgr->lock);
> +
> +	drm_buddy_free_list(mm, &vres->blocks);
> +	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
>   
>   	ttm_resource_fini(man, res);
> -	kvfree(node);
> +	kfree(vres);
>   }
>   
>   /**
> @@ -542,7 +591,7 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
>   	if (!*sgt)
>   		return -ENOMEM;
>   
> -	/* Determine the number of DRM_MM nodes to export */
> +	/* Determine the number of DRM_BUDDY blocks to export */
>   	amdgpu_res_first(res, offset, length, &cursor);
>   	while (cursor.remaining) {
>   		num_entries++;
> @@ -558,10 +607,10 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
>   		sg->length = 0;
>   
>   	/*
> -	 * Walk down DRM_MM nodes to populate scatterlist nodes
> -	 * @note: Use iterator api to get first the DRM_MM node
> +	 * Walk down DRM_BUDDY blocks to populate scatterlist nodes
> +	 * @note: Use iterator api to get first the DRM_BUDDY block
>   	 * and the number of bytes from it. Access the following
> -	 * DRM_MM node(s) if more buffer needs to exported
> +	 * DRM_BUDDY block(s) if more buffer needs to exported
>   	 */
>   	amdgpu_res_first(res, offset, length, &cursor);
>   	for_each_sgtable_sg((*sgt), sg, i) {
> @@ -648,13 +697,22 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
>   				  struct drm_printer *printer)
>   {
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
> +	struct drm_buddy *mm = &mgr->mm;
> +	struct drm_buddy_block *block;
>   
>   	drm_printf(printer, "  vis usage:%llu\n",
>   		   amdgpu_vram_mgr_vis_usage(mgr));
>   
> -	spin_lock(&mgr->lock);
> -	drm_mm_print(&mgr->mm, printer);
> -	spin_unlock(&mgr->lock);
> +	mutex_lock(&mgr->lock);
> +	drm_printf(printer, "default_page_size: %lluKiB\n",
> +		   mgr->default_page_size >> 10);
> +
> +	drm_buddy_print(mm, printer);
> +
> +	drm_printf(printer, "reserved:\n");
> +	list_for_each_entry(block, &mgr->reserved_pages, link)
> +		drm_buddy_block_print(mm, block, printer);
> +	mutex_unlock(&mgr->lock);
>   }
>   
>   static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
> @@ -674,16 +732,21 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>   {
>   	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>   	struct ttm_resource_manager *man = &mgr->manager;
> +	int err;
>   
>   	ttm_resource_manager_init(man, &adev->mman.bdev,
>   				  adev->gmc.real_vram_size);
>   
>   	man->func = &amdgpu_vram_mgr_func;
>   
> -	drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
> -	spin_lock_init(&mgr->lock);
> +	err = drm_buddy_init(&mgr->mm, man->size, PAGE_SIZE);
> +	if (err)
> +		return err;
> +
> +	mutex_init(&mgr->lock);
>   	INIT_LIST_HEAD(&mgr->reservations_pending);
>   	INIT_LIST_HEAD(&mgr->reserved_pages);
> +	mgr->default_page_size = PAGE_SIZE;
>   
>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
>   	ttm_resource_manager_set_used(man, true);
> @@ -711,16 +774,16 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>   	if (ret)
>   		return;
>   
> -	spin_lock(&mgr->lock);
> -	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, node)
> +	mutex_lock(&mgr->lock);
> +	list_for_each_entry_safe(rsv, temp, &mgr->reservations_pending, blocks)
>   		kfree(rsv);
>   
> -	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, node) {
> -		drm_mm_remove_node(&rsv->mm_node);
> +	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
> +		drm_buddy_free_list(&mgr->mm, &rsv->blocks);
>   		kfree(rsv);
>   	}
> -	drm_mm_takedown(&mgr->mm);
> -	spin_unlock(&mgr->lock);
> +	drm_buddy_fini(&mgr->mm);
> +	mutex_unlock(&mgr->lock);
>   
>   	ttm_resource_manager_cleanup(man);
>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, NULL);
> 
> base-commit: bc38e5d45dd513fa384bbedab3c0749f2e46771b

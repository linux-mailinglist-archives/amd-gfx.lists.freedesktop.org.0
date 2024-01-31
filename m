Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947D0844701
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jan 2024 19:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203FA10F5EE;
	Wed, 31 Jan 2024 18:22:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB2210F5EE;
 Wed, 31 Jan 2024 18:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706725349; x=1738261349;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BwG0nGw9NWrhX4lgsdZmPry9sJmJHnNKghItlbz0WF8=;
 b=NPPDUwmgjvJ4cDMTIpe4+7imauJzWIXZu9XgsyFo5O8hZZf21rj+nF/8
 ccxp0PYWGnbjkZnam5UnQ85HNELEVULHfREVKhke0uqwsX6AjrwE2W+Gu
 icOpYGtd2rLKUqTeEpUA00481dHpY0uXavKGDNjHNKb4fED9R+jVus1qE
 EtpS2bb+WGGQh8iK1eGKEpv3mFR/ztV3r7AnGryKP0hQTtEFvhjRgUGiw
 OenJks+5ojf5wfrZz/cSmYx2+HDBbeglgsjLOU0UaOLkBLmaW3NTZ6gD1
 PjOPzEkn03NIf7MzFHEfvFTlXZ3mLMJjaPgmJ8SmcP/b+DB5Hl/MPyH7n g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10441238"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10441238"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:22:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931932781"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931932781"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO [10.252.19.208])
 ([10.252.19.208])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 10:22:26 -0800
Message-ID: <a9ff4f53-52d2-4b0e-aedb-eefdcc92f931@intel.com>
Date: Wed, 31 Jan 2024 18:22:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] drm/buddy: Implement tracking clear page feature
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20240130194826.398208-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240130194826.398208-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 30/01/2024 19:48, Arunpravin Paneer Selvam wrote:
> - Add tracking clear page feature.
> 
> - Driver should enable the DRM_BUDDY_CLEARED flag if it
>    successfully clears the blocks in the free path. On the otherhand,
>    DRM buddy marks each block as cleared.
> 
> - Track the available cleared pages size
> 
> - If driver requests cleared memory we prefer cleared memory
>    but fallback to uncleared if we can't find the cleared blocks.
>    when driver requests uncleared memory we try to use uncleared but
>    fallback to cleared memory if necessary.
> 
> - When a block gets freed we clear it and mark the freed block as cleared,
>    when there are buddies which are cleared as well we can merge them.
>    Otherwise, we prefer to keep the blocks as separated.
> 
> v1: (Christian)
>    - Depends on the flag check DRM_BUDDY_CLEARED, enable the block as
>      cleared. Else, reset the clear flag for each block in the list.
> 
>    - For merging the 2 cleared blocks compare as below,
>      drm_buddy_is_clear(block) != drm_buddy_is_clear(buddy)
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   6 +-
>   drivers/gpu/drm/drm_buddy.c                   | 169 +++++++++++++++---
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   6 +-
>   drivers/gpu/drm/tests/drm_buddy_test.c        |  10 +-
>   include/drm/drm_buddy.h                       |  18 +-
>   5 files changed, 168 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 08916538a615..d0e199cc8f17 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -556,7 +556,7 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	return 0;
>   
>   error_free_blocks:
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   error_fini:
>   	ttm_resource_fini(man, &vres->base);
> @@ -589,7 +589,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
>   
>   	amdgpu_vram_mgr_do_reserve(man);
>   
> -	drm_buddy_free_list(mm, &vres->blocks);
> +	drm_buddy_free_list(mm, &vres->blocks, 0);
>   	mutex_unlock(&mgr->lock);
>   
>   	atomic64_sub(vis_usage, &mgr->vis_usage);
> @@ -897,7 +897,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>   		kfree(rsv);
>   
>   	list_for_each_entry_safe(rsv, temp, &mgr->reserved_pages, blocks) {
> -		drm_buddy_free_list(&mgr->mm, &rsv->allocated);
> +		drm_buddy_free_list(&mgr->mm, &rsv->allocated, 0);
>   		kfree(rsv);
>   	}
>   	if (!adev->gmc.is_app_apu)
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index f57e6d74fb0e..d44172f23f05 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -57,6 +57,16 @@ static void list_insert_sorted(struct drm_buddy *mm,
>   	__list_add(&block->link, node->link.prev, &node->link);
>   }
>   
> +static void clear_reset(struct drm_buddy_block *block)
> +{
> +	block->header &= ~DRM_BUDDY_HEADER_CLEAR;
> +}
> +
> +static void mark_cleared(struct drm_buddy_block *block)
> +{
> +	block->header |= DRM_BUDDY_HEADER_CLEAR;
> +}
> +
>   static void mark_allocated(struct drm_buddy_block *block)
>   {
>   	block->header &= ~DRM_BUDDY_HEADER_STATE;
> @@ -223,6 +233,12 @@ static int split_block(struct drm_buddy *mm,
>   	mark_free(mm, block->left);
>   	mark_free(mm, block->right);
>   
> +	if (drm_buddy_block_is_clear(block)) {
> +		mark_cleared(block->left);
> +		mark_cleared(block->right);
> +		clear_reset(block);
> +	}
> +
>   	mark_split(block);
>   
>   	return 0;
> @@ -273,6 +289,13 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>   		if (!drm_buddy_block_is_free(buddy))
>   			break;
>   
> +		if (drm_buddy_block_is_clear(block) !=
> +		    drm_buddy_block_is_clear(buddy))
> +			break;
> +
> +		if (drm_buddy_block_is_clear(block))
> +			mark_cleared(parent);
> +
>   		list_del(&buddy->link);
>   
>   		drm_block_free(mm, block);
> @@ -295,6 +318,9 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>   {
>   	BUG_ON(!drm_buddy_block_is_allocated(block));
>   	mm->avail += drm_buddy_block_size(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail += drm_buddy_block_size(mm, block);
> +
>   	__drm_buddy_free(mm, block);
>   }
>   EXPORT_SYMBOL(drm_buddy_free_block);
> @@ -305,10 +331,20 @@ EXPORT_SYMBOL(drm_buddy_free_block);
>    * @mm: DRM buddy manager
>    * @objects: input list head to free blocks
>    */
> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
> +void drm_buddy_free_list(struct drm_buddy *mm,
> +			 struct list_head *objects,
> +			 unsigned long flags)
>   {
>   	struct drm_buddy_block *block, *on;
>   
> +	if (flags & DRM_BUDDY_CLEARED) {
> +		list_for_each_entry(block, objects, link)
> +			mark_cleared(block);
> +	} else {
> +		list_for_each_entry(block, objects, link)
> +			clear_reset(block);
> +	}
> +

Can we not merge this into the list iteration below? Thinking we also 
should try to not trample the clear bit here for "internal" freeing. 
Otherwise internal free will mark it as dirty everytime. Or is that 
intentional?

>   	list_for_each_entry_safe(block, on, objects, link) {
>   		drm_buddy_free_block(mm, block);
>   		cond_resched();
> @@ -328,9 +364,11 @@ static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>   }
>   
>   static struct drm_buddy_block *
> -alloc_range_bias(struct drm_buddy *mm,
> -		 u64 start, u64 end,
> -		 unsigned int order)
> +__alloc_range_bias(struct drm_buddy *mm,
> +		   u64 start, u64 end,
> +		   unsigned int order,
> +		   unsigned long flags,
> +		   bool fallback)
>   {
>   	struct drm_buddy_block *block;
>   	struct drm_buddy_block *buddy;
> @@ -369,6 +407,15 @@ alloc_range_bias(struct drm_buddy *mm,
>   
>   		if (contains(start, end, block_start, block_end) &&
>   		    order == drm_buddy_block_order(block)) {
> +			if (!fallback) {
> +				if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
> +					if (!drm_buddy_block_is_clear(block))
> +						continue;
> +				} else {
> +					if (drm_buddy_block_is_clear(block))
> +						continue;

Maybe wrap this into a helper?

Also looks like we missed updating Xe driver here.

What about something like this (completely untested):
https://gitlab.freedesktop.org/mwa/kernel/-/commit/bf71cd468796dfab2ac40318aa323b6e1f31e4a2

> +				}
> +			}
>   			/*
>   			 * Find the free block within the range.
>   			 */
> @@ -405,25 +452,58 @@ alloc_range_bias(struct drm_buddy *mm,
>   }
>   
>   static struct drm_buddy_block *
> -get_maxblock(struct drm_buddy *mm, unsigned int order)
> +__drm_buddy_alloc_range_bias(struct drm_buddy *mm,
> +			     u64 start, u64 end,
> +			     unsigned int order,
> +			     unsigned long flags)
> +{
> +	struct drm_buddy_block *block;
> +	bool fallback = 0;
> +
> +	block = __alloc_range_bias(mm, start, end, order,
> +				   flags, fallback);
> +	if (IS_ERR(block))
> +		return __alloc_range_bias(mm, start, end, order,
> +					  flags, !fallback);
> +
> +	return block;
> +}
> +
> +static struct drm_buddy_block *
> +get_maxblock(struct drm_buddy *mm, unsigned int order,
> +	     unsigned long flags)
>   {
> -	struct drm_buddy_block *max_block = NULL, *node;
> +	struct drm_buddy_block *max_block = NULL, *block = NULL;
>   	unsigned int i;
>   
>   	for (i = order; i <= mm->max_order; ++i) {
> -		if (!list_empty(&mm->free_list[i])) {
> -			node = list_last_entry(&mm->free_list[i],
> -					       struct drm_buddy_block,
> -					       link);
> -			if (!max_block) {
> -				max_block = node;
> -				continue;
> +		struct drm_buddy_block *tmp_block;
> +
> +		list_for_each_entry_reverse(tmp_block, &mm->free_list[i], link) {
> +			if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
> +				/* Find a cleared block */
> +				if (!drm_buddy_block_is_clear(tmp_block))
> +					continue;
> +			} else {
> +				if (drm_buddy_block_is_clear(tmp_block))
> +					continue;
>   			}
>   
> -			if (drm_buddy_block_offset(node) >
> -			    drm_buddy_block_offset(max_block)) {
> -				max_block = node;
> -			}
> +			block = tmp_block;
> +			break;
> +		}
> +
> +		if (!block)
> +			continue;
> +
> +		if (!max_block) {
> +			max_block = block;
> +			continue;
> +		}
> +
> +		if (drm_buddy_block_offset(block) >
> +		    drm_buddy_block_offset(max_block)) {
> +			max_block = block;
>   		}
>   	}
>   
> @@ -440,11 +520,35 @@ alloc_from_freelist(struct drm_buddy *mm,
>   	int err;
>   
>   	if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
> -		block = get_maxblock(mm, order);
> +		block = get_maxblock(mm, order, flags);
>   		if (block)
>   			/* Store the obtained block order */
>   			tmp = drm_buddy_block_order(block);
>   	} else {
> +		for (tmp = order; tmp <= mm->max_order; ++tmp) {
> +			struct drm_buddy_block *tmp_block;
> +
> +			list_for_each_entry_reverse(tmp_block, &mm->free_list[tmp], link) {
> +				if (flags & DRM_BUDDY_CLEAR_ALLOCATION) {
> +					/* Find a cleared block */
> +					if (!drm_buddy_block_is_clear(tmp_block))
> +						continue;
> +				} else {
> +					if (drm_buddy_block_is_clear(tmp_block))
> +						continue;
> +				}
> +
> +				block = tmp_block;
> +				break;
> +			}
> +
> +			if (block)
> +				break;
> +		}
> +	}
> +
> +	if (!block) {
> +		/* Fallback method */
>   		for (tmp = order; tmp <= mm->max_order; ++tmp) {
>   			if (!list_empty(&mm->free_list[tmp])) {
>   				block = list_last_entry(&mm->free_list[tmp],
> @@ -454,10 +558,10 @@ alloc_from_freelist(struct drm_buddy *mm,
>   					break;
>   			}
>   		}
> -	}
>   
> -	if (!block)
> -		return ERR_PTR(-ENOSPC);
> +		if (!block)
> +			return ERR_PTR(-ENOSPC);
> +	}
>   
>   	BUG_ON(!drm_buddy_block_is_free(block));
>   
> @@ -524,6 +628,8 @@ static int __alloc_range(struct drm_buddy *mm,
>   			mark_allocated(block);
>   			total_allocated += drm_buddy_block_size(mm, block);
>   			mm->avail -= drm_buddy_block_size(mm, block);
> +			if (drm_buddy_block_is_clear(block))
> +				mm->clear_avail -= drm_buddy_block_size(mm, block);
>   			list_add_tail(&block->link, &allocated);
>   			continue;
>   		}
> @@ -558,7 +664,7 @@ static int __alloc_range(struct drm_buddy *mm,
>   		list_splice_tail(&allocated, blocks);
>   		*total_allocated_on_err = total_allocated;
>   	} else {
> -		drm_buddy_free_list(mm, &allocated);
> +		drm_buddy_free_list(mm, &allocated, 0);
>   	}
>   
>   	return err;
> @@ -624,11 +730,11 @@ static int __alloc_contig_try_harder(struct drm_buddy *mm,
>   			list_splice(&blocks_lhs, blocks);
>   			return 0;
>   		} else if (err != -ENOSPC) {
> -			drm_buddy_free_list(mm, blocks);
> +			drm_buddy_free_list(mm, blocks, 0);
>   			return err;
>   		}
>   		/* Free blocks for the next iteration */
> -		drm_buddy_free_list(mm, blocks);
> +		drm_buddy_free_list(mm, blocks, 0);
>   	}
>   
>   	return -ENOSPC;
> @@ -684,6 +790,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	list_del(&block->link);
>   	mark_free(mm, block);
>   	mm->avail += drm_buddy_block_size(mm, block);
> +	if (drm_buddy_block_is_clear(block))
> +		mm->clear_avail += drm_buddy_block_size(mm, block);
>   
>   	/* Prevent recursively freeing this node */
>   	parent = block->parent;
> @@ -695,6 +803,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   	if (err) {
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> +		if (drm_buddy_block_is_clear(block))
> +			mm->clear_avail -= drm_buddy_block_size(mm, block);
>   		list_add(&block->link, blocks);
>   	}
>   
> @@ -782,7 +892,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   		do {
>   			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>   				/* Allocate traversing within the range */
> -				block = alloc_range_bias(mm, start, end, order);
> +				block = __drm_buddy_alloc_range_bias(mm, start, end,
> +								     order, flags);
>   			else
>   				/* Allocate from freelist */
>   				block = alloc_from_freelist(mm, order, flags);
> @@ -808,6 +919,8 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   
>   		mark_allocated(block);
>   		mm->avail -= drm_buddy_block_size(mm, block);
> +		if (drm_buddy_block_is_clear(block))
> +			mm->clear_avail -= drm_buddy_block_size(mm, block);
>   		kmemleak_update_trace(block);
>   		list_add_tail(&block->link, &allocated);
>   
> @@ -846,7 +959,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	return 0;
>   
>   err_free:
> -	drm_buddy_free_list(mm, &allocated);
> +	drm_buddy_free_list(mm, &allocated, 0);
>   	return err;
>   }
>   EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> @@ -879,8 +992,8 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>   {
>   	int order;
>   
> -	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB\n",
> -		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20);
> +	drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: %lluMiB, clear_free: %lluMiB\n",
> +		   mm->chunk_size >> 10, mm->size >> 20, mm->avail >> 20, mm->clear_avail >> 20);
>   
>   	for (order = mm->max_order; order >= 0; order--) {
>   		struct drm_buddy_block *block;
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 0d735d5c2b35..942345548bc3 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -126,7 +126,7 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	return 0;
>   
>   err_free_blocks:
> -	drm_buddy_free_list(mm, &bman_res->blocks);
> +	drm_buddy_free_list(mm, &bman_res->blocks, 0);
>   	mutex_unlock(&bman->lock);
>   err_free_res:
>   	ttm_resource_fini(man, &bman_res->base);
> @@ -141,7 +141,7 @@ static void i915_ttm_buddy_man_free(struct ttm_resource_manager *man,
>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>   
>   	mutex_lock(&bman->lock);
> -	drm_buddy_free_list(&bman->mm, &bman_res->blocks);
> +	drm_buddy_free_list(&bman->mm, &bman_res->blocks, 0);
>   	bman->visible_avail += bman_res->used_visible_size;
>   	mutex_unlock(&bman->lock);
>   
> @@ -345,7 +345,7 @@ int i915_ttm_buddy_man_fini(struct ttm_device *bdev, unsigned int type)
>   	ttm_set_driver_manager(bdev, type, NULL);
>   
>   	mutex_lock(&bman->lock);
> -	drm_buddy_free_list(mm, &bman->reserved);
> +	drm_buddy_free_list(mm, &bman->reserved, 0);
>   	drm_buddy_fini(mm);
>   	bman->visible_avail += bman->visible_reserved;
>   	WARN_ON_ONCE(bman->visible_avail != bman->visible_size);
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index ea2af6bd9abe..e0860fce9ebd 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -83,7 +83,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   							  top, max_order);
>   	}
>   
> -	drm_buddy_free_list(&mm, &holes);
> +	drm_buddy_free_list(&mm, &holes, 0);
>   
>   	/* Nothing larger than blocks of chunk_size now available */
>   	for (order = 1; order <= max_order; order++) {
> @@ -95,7 +95,7 @@ static void drm_test_buddy_alloc_pathological(struct kunit *test)
>   	}
>   
>   	list_splice_tail(&holes, &blocks);
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -190,7 +190,7 @@ static void drm_test_buddy_alloc_pessimistic(struct kunit *test)
>   
>   	list_del(&block->link);
>   	drm_buddy_free_block(&mm, block);
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -236,7 +236,7 @@ static void drm_test_buddy_alloc_optimistic(struct kunit *test)
>   							   size, size, &tmp, flags),
>   						  "buddy_alloc unexpectedly succeeded, it should be full!");
>   
> -	drm_buddy_free_list(&mm, &blocks);
> +	drm_buddy_free_list(&mm, &blocks, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> @@ -271,7 +271,7 @@ static void drm_test_buddy_alloc_limit(struct kunit *test)
>   						drm_buddy_block_size(&mm, block),
>   						BIT_ULL(mm.max_order) * PAGE_SIZE);
>   
> -	drm_buddy_free_list(&mm, &allocated);
> +	drm_buddy_free_list(&mm, &allocated, 0);
>   	drm_buddy_fini(&mm);
>   }
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index a5b39fc01003..f7311b59f2b0 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -6,6 +6,7 @@
>   #ifndef __DRM_BUDDY_H__
>   #define __DRM_BUDDY_H__
>   
> +#include <linux/bitfield.h>
>   #include <linux/bitops.h>
>   #include <linux/list.h>
>   #include <linux/slab.h>
> @@ -25,15 +26,19 @@
>   #define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
>   #define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
> +#define DRM_BUDDY_CLEAR_ALLOCATION		BIT(3)
> +#define DRM_BUDDY_CLEARED			BIT(4)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
> +#define DRM_BUDDY_HEADER_CLEAR  GENMASK_ULL(9, 9)
> +
>   #define   DRM_BUDDY_ALLOCATED	   (1 << 10)
>   #define   DRM_BUDDY_FREE	   (2 << 10)
>   #define   DRM_BUDDY_SPLIT	   (3 << 10)
>   /* Free to be used, if needed in the future */
> -#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(9, 6)
> +#define DRM_BUDDY_HEADER_UNUSED GENMASK_ULL(8, 6)
>   #define DRM_BUDDY_HEADER_ORDER  GENMASK_ULL(5, 0)
>   	u64 header;
>   
> @@ -86,6 +91,7 @@ struct drm_buddy {
>   	u64 chunk_size;
>   	u64 size;
>   	u64 avail;
> +	u64 clear_avail;
>   };
>   
>   static inline u64
> @@ -112,6 +118,12 @@ drm_buddy_block_is_allocated(struct drm_buddy_block *block)
>   	return drm_buddy_block_state(block) == DRM_BUDDY_ALLOCATED;
>   }
>   
> +static inline bool
> +drm_buddy_block_is_clear(struct drm_buddy_block *block)
> +{
> +	return block->header & DRM_BUDDY_HEADER_CLEAR;
> +}
> +
>   static inline bool
>   drm_buddy_block_is_free(struct drm_buddy_block *block)
>   {
> @@ -150,7 +162,9 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>   
>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>   
> -void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects);
> +void drm_buddy_free_list(struct drm_buddy *mm,
> +			 struct list_head *objects,
> +			 unsigned long flags);
>   
>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>   void drm_buddy_block_print(struct drm_buddy *mm,

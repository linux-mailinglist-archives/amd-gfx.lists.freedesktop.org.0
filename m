Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA14F5DE5
	for <lists+amd-gfx@lfdr.de>; Wed,  6 Apr 2022 14:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA32210E0FB;
	Wed,  6 Apr 2022 12:39:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996C710E391
 for <amd-gfx@lists.freedesktop.org>; Wed,  6 Apr 2022 12:39:52 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p23so2438080edi.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 06 Apr 2022 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=hTP5mVVeAGYIWIAmxlFSmXaYmmnctFIIvQNz4xRmqUE=;
 b=PHtg37kQWVBsJnaGIr7WoHjt2hyMxd1B7VR5E32WDBKhWPZuF9qUf2S2YUZLC3g8il
 jFl9HiMAAG8o8niYRAKHSpFmtbYp5aa13Bfliyyh5FlFPcTWs9Tzr++F34SILEoDWUTD
 b/X+fx6jy036f9NBjlMH5rWnCYl7Ea0afvznM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hTP5mVVeAGYIWIAmxlFSmXaYmmnctFIIvQNz4xRmqUE=;
 b=N21Vl0tm4+Q99nNvzdG1rfJgY4s9dF5XeTRb0onMRl+umr5LqXz1mMmM4g6ztcJtT8
 jJ4X95zInsJhk4Qvt+DphVC6rZnNncsyIpWyw08a8gmFXc7PctOGNMTI5kLY8XnS1EIy
 ADrgnUhQLwoGhZNkv3gGaNG2lb/1Uoojnc8UsskBafmLCkcapTMNmnH6wd+JUNyhMzh+
 eawsHokdDJBy/ZjLa0kX467utsf3uqiXJjQyhhi6ihcBAqn6l7NxD6eps9WgH86bcYT/
 hOIlMKkbUaYfFCeakFWVkfDFKGj2bq3nfHIS9WDQpAJ2IQvOv8/VY4w2sW3SZve5e3Bn
 lKRw==
X-Gm-Message-State: AOAM531+1/HbT6GpMQPajcEls/bueAp0qTlLwU3nXYTscv/TfhoF4EyB
 ERiTKR+F0GAGAaP37ZHMUJ5PHw==
X-Google-Smtp-Source: ABdhPJy2sph038QQOPc+7LThV8HWybuSN6BJN4DA2PLSuStBOABrWbvwM5cLRvZ3ETIcG/S22yElbw==
X-Received: by 2002:a50:99c7:0:b0:419:225:80b6 with SMTP id
 n7-20020a5099c7000000b00419022580b6mr8693980edb.240.1649248790708; 
 Wed, 06 Apr 2022 05:39:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a17090651d100b006dfa26428bcsm6523009ejk.108.2022.04.06.05.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:39:50 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:39:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re: [PATCH 04/16] dma-buf & drm/amdgpu: remove dma_resv workaround
Message-ID: <Yk2KFAWD5o0qJN+V@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 09:51:20AM +0200, Christian K�nig wrote:
> Rework the internals of the dma_resv object to allow adding more than one
> write fence and remember for each fence what purpose it had.
> 
> This allows removing the workaround from amdgpu which used a container for
> this instead.
> 
> Signed-off-by: Christian K�nig <christian.koenig@amd.com>
> Cc: amd-gfx@lists.freedesktop.org

It is honestly all getting rather blurry, I think when it's all landed I
need to audit the entire tree and see what we missed. Anyway:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-resv.c                  | 353 ++++++++------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  53 +--
>  include/linux/dma-resv.h                    |  47 +--
>  4 files changed, 157 insertions(+), 297 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 543dae6566d2..378d47e1cfea 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -44,12 +44,12 @@
>  /**
>   * DOC: Reservation Object Overview
>   *
> - * The reservation object provides a mechanism to manage shared and
> - * exclusive fences associated with a buffer.  A reservation object
> - * can have attached one exclusive fence (normally associated with
> - * write operations) or N shared fences (read operations).  The RCU
> - * mechanism is used to protect read access to fences from locked
> - * write-side updates.
> + * The reservation object provides a mechanism to manage a container of
> + * dma_fence object associated with a resource. A reservation object
> + * can have any number of fences attaches to it. Each fence carries an usage
> + * parameter determining how the operation represented by the fence is using the
> + * resource. The RCU mechanism is used to protect read access to fences from
> + * locked write-side updates.
>   *
>   * See struct dma_resv for more details.
>   */
> @@ -57,39 +57,59 @@
>  DEFINE_WD_CLASS(reservation_ww_class);
>  EXPORT_SYMBOL(reservation_ww_class);
>  
> +/* Mask for the lower fence pointer bits */
> +#define DMA_RESV_LIST_MASK	0x3
> +
>  struct dma_resv_list {
>  	struct rcu_head rcu;
> -	u32 shared_count, shared_max;
> -	struct dma_fence __rcu *shared[];
> +	u32 num_fences, max_fences;
> +	struct dma_fence __rcu *table[];
>  };
>  
> -/**
> - * dma_resv_list_alloc - allocate fence list
> - * @shared_max: number of fences we need space for
> - *
> +/* Extract the fence and usage flags from an RCU protected entry in the list. */
> +static void dma_resv_list_entry(struct dma_resv_list *list, unsigned int index,
> +				struct dma_resv *resv, struct dma_fence **fence,
> +				enum dma_resv_usage *usage)
> +{
> +	long tmp;
> +
> +	tmp = (long)rcu_dereference_check(list->table[index],
> +					  resv ? dma_resv_held(resv) : true);
> +	*fence = (struct dma_fence *)(tmp & ~DMA_RESV_LIST_MASK);
> +	if (usage)
> +		*usage = tmp & DMA_RESV_LIST_MASK;
> +}
> +
> +/* Set the fence and usage flags at the specific index in the list. */
> +static void dma_resv_list_set(struct dma_resv_list *list,
> +			      unsigned int index,
> +			      struct dma_fence *fence,
> +			      enum dma_resv_usage usage)
> +{
> +	long tmp = ((long)fence) | usage;
> +
> +	RCU_INIT_POINTER(list->table[index], (struct dma_fence *)tmp);
> +}
> +
> +/*
>   * Allocate a new dma_resv_list and make sure to correctly initialize
> - * shared_max.
> + * max_fences.
>   */
> -static struct dma_resv_list *dma_resv_list_alloc(unsigned int shared_max)
> +static struct dma_resv_list *dma_resv_list_alloc(unsigned int max_fences)
>  {
>  	struct dma_resv_list *list;
>  
> -	list = kmalloc(struct_size(list, shared, shared_max), GFP_KERNEL);
> +	list = kmalloc(struct_size(list, table, max_fences), GFP_KERNEL);
>  	if (!list)
>  		return NULL;
>  
> -	list->shared_max = (ksize(list) - offsetof(typeof(*list), shared)) /
> -		sizeof(*list->shared);
> +	list->max_fences = (ksize(list) - offsetof(typeof(*list), table)) /
> +		sizeof(*list->table);
>  
>  	return list;
>  }
>  
> -/**
> - * dma_resv_list_free - free fence list
> - * @list: list to free
> - *
> - * Free a dma_resv_list and make sure to drop all references.
> - */
> +/* Free a dma_resv_list and make sure to drop all references. */
>  static void dma_resv_list_free(struct dma_resv_list *list)
>  {
>  	unsigned int i;
> @@ -97,9 +117,12 @@ static void dma_resv_list_free(struct dma_resv_list *list)
>  	if (!list)
>  		return;
>  
> -	for (i = 0; i < list->shared_count; ++i)
> -		dma_fence_put(rcu_dereference_protected(list->shared[i], true));
> +	for (i = 0; i < list->num_fences; ++i) {
> +		struct dma_fence *fence;
>  
> +		dma_resv_list_entry(list, i, NULL, &fence, NULL);
> +		dma_fence_put(fence);
> +	}
>  	kfree_rcu(list, rcu);
>  }
>  
> @@ -112,8 +135,7 @@ void dma_resv_init(struct dma_resv *obj)
>  	ww_mutex_init(&obj->lock, &reservation_ww_class);
>  	seqcount_ww_mutex_init(&obj->seq, &obj->lock);
>  
> -	RCU_INIT_POINTER(obj->fence, NULL);
> -	RCU_INIT_POINTER(obj->fence_excl, NULL);
> +	RCU_INIT_POINTER(obj->fences, NULL);
>  }
>  EXPORT_SYMBOL(dma_resv_init);
>  
> @@ -123,46 +145,32 @@ EXPORT_SYMBOL(dma_resv_init);
>   */
>  void dma_resv_fini(struct dma_resv *obj)
>  {
> -	struct dma_resv_list *fobj;
> -	struct dma_fence *excl;
> -
>  	/*
>  	 * This object should be dead and all references must have
>  	 * been released to it, so no need to be protected with rcu.
>  	 */
> -	excl = rcu_dereference_protected(obj->fence_excl, 1);
> -	if (excl)
> -		dma_fence_put(excl);
> -
> -	fobj = rcu_dereference_protected(obj->fence, 1);
> -	dma_resv_list_free(fobj);
> +	dma_resv_list_free(rcu_dereference_protected(obj->fences, true));
>  	ww_mutex_destroy(&obj->lock);
>  }
>  EXPORT_SYMBOL(dma_resv_fini);
>  
> -static inline struct dma_fence *
> -dma_resv_excl_fence(struct dma_resv *obj)
> -{
> -       return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
> -}
> -
> -static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
> +/* Dereference the fences while ensuring RCU rules */
> +static inline struct dma_resv_list *dma_resv_fences_list(struct dma_resv *obj)
>  {
> -	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
> +	return rcu_dereference_check(obj->fences, dma_resv_held(obj));
>  }
>  
>  /**
> - * dma_resv_reserve_fences - Reserve space to add shared fences to
> - * a dma_resv.
> + * dma_resv_reserve_fences - Reserve space to add fences to a dma_resv object.
>   * @obj: reservation object
>   * @num_fences: number of fences we want to add
>   *
> - * Should be called before dma_resv_add_shared_fence().  Must
> - * be called with @obj locked through dma_resv_lock().
> + * Should be called before dma_resv_add_fence().  Must be called with @obj
> + * locked through dma_resv_lock().
>   *
>   * Note that the preallocated slots need to be re-reserved if @obj is unlocked
> - * at any time before calling dma_resv_add_shared_fence(). This is validated
> - * when CONFIG_DEBUG_MUTEXES is enabled.
> + * at any time before calling dma_resv_add_fence(). This is validated when
> + * CONFIG_DEBUG_MUTEXES is enabled.
>   *
>   * RETURNS
>   * Zero for success, or -errno
> @@ -174,11 +182,11 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
>  
>  	dma_resv_assert_held(obj);
>  
> -	old = dma_resv_shared_list(obj);
> -	if (old && old->shared_max) {
> -		if ((old->shared_count + num_fences) <= old->shared_max)
> +	old = dma_resv_fences_list(obj);
> +	if (old && old->max_fences) {
> +		if ((old->num_fences + num_fences) <= old->max_fences)
>  			return 0;
> -		max = max(old->shared_count + num_fences, old->shared_max * 2);
> +		max = max(old->num_fences + num_fences, old->max_fences * 2);
>  	} else {
>  		max = max(4ul, roundup_pow_of_two(num_fences));
>  	}
> @@ -193,27 +201,27 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
>  	 * references from the old struct are carried over to
>  	 * the new.
>  	 */
> -	for (i = 0, j = 0, k = max; i < (old ? old->shared_count : 0); ++i) {
> +	for (i = 0, j = 0, k = max; i < (old ? old->num_fences : 0); ++i) {
> +		enum dma_resv_usage usage;
>  		struct dma_fence *fence;
>  
> -		fence = rcu_dereference_protected(old->shared[i],
> -						  dma_resv_held(obj));
> +		dma_resv_list_entry(old, i, obj, &fence, &usage);
>  		if (dma_fence_is_signaled(fence))
> -			RCU_INIT_POINTER(new->shared[--k], fence);
> +			RCU_INIT_POINTER(new->table[--k], fence);
>  		else
> -			RCU_INIT_POINTER(new->shared[j++], fence);
> +			dma_resv_list_set(new, j++, fence, usage);
>  	}
> -	new->shared_count = j;
> +	new->num_fences = j;
>  
>  	/*
>  	 * We are not changing the effective set of fences here so can
>  	 * merely update the pointer to the new array; both existing
>  	 * readers and new readers will see exactly the same set of
> -	 * active (unsignaled) shared fences. Individual fences and the
> +	 * active (unsignaled) fences. Individual fences and the
>  	 * old array are protected by RCU and so will not vanish under
>  	 * the gaze of the rcu_read_lock() readers.
>  	 */
> -	rcu_assign_pointer(obj->fence, new);
> +	rcu_assign_pointer(obj->fences, new);
>  
>  	if (!old)
>  		return 0;
> @@ -222,7 +230,7 @@ int dma_resv_reserve_fences(struct dma_resv *obj, unsigned int num_fences)
>  	for (i = k; i < max; ++i) {
>  		struct dma_fence *fence;
>  
> -		fence = rcu_dereference_protected(new->shared[i],
> +		fence = rcu_dereference_protected(new->table[i],
>  						  dma_resv_held(obj));
>  		dma_fence_put(fence);
>  	}
> @@ -234,38 +242,39 @@ EXPORT_SYMBOL(dma_resv_reserve_fences);
>  
>  #ifdef CONFIG_DEBUG_MUTEXES
>  /**
> - * dma_resv_reset_max_fences - reset shared fences for debugging
> + * dma_resv_reset_max_fences - reset fences for debugging
>   * @obj: the dma_resv object to reset
>   *
> - * Reset the number of pre-reserved shared slots to test that drivers do
> + * Reset the number of pre-reserved fence slots to test that drivers do
>   * correct slot allocation using dma_resv_reserve_fences(). See also
> - * &dma_resv_list.shared_max.
> + * &dma_resv_list.max_fences.
>   */
>  void dma_resv_reset_max_fences(struct dma_resv *obj)
>  {
> -	struct dma_resv_list *fences = dma_resv_shared_list(obj);
> +	struct dma_resv_list *fences = dma_resv_fences_list(obj);
>  
>  	dma_resv_assert_held(obj);
>  
> -	/* Test shared fence slot reservation */
> +	/* Test fence slot reservation */
>  	if (fences)
> -		fences->shared_max = fences->shared_count;
> +		fences->max_fences = fences->num_fences;
>  }
>  EXPORT_SYMBOL(dma_resv_reset_max_fences);
>  #endif
>  
>  /**
> - * dma_resv_add_shared_fence - Add a fence to a shared slot
> + * dma_resv_add_fence - Add a fence to the dma_resv obj
>   * @obj: the reservation object
> - * @fence: the shared fence to add
> + * @fence: the fence to add
> + * @usage: how the fence is used, see enum dma_resv_usage
>   *
> - * Add a fence to a shared slot, @obj must be locked with dma_resv_lock(), and
> + * Add a fence to a slot, @obj must be locked with dma_resv_lock(), and
>   * dma_resv_reserve_fences() has been called.
>   *
>   * See also &dma_resv.fence for a discussion of the semantics.
>   */
> -static void dma_resv_add_shared_fence(struct dma_resv *obj,
> -				      struct dma_fence *fence)
> +void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
> +			enum dma_resv_usage usage)
>  {
>  	struct dma_resv_list *fobj;
>  	struct dma_fence *old;
> @@ -280,32 +289,33 @@ static void dma_resv_add_shared_fence(struct dma_resv *obj,
>  	 */
>  	WARN_ON(dma_fence_is_container(fence));
>  
> -	fobj = dma_resv_shared_list(obj);
> -	count = fobj->shared_count;
> +	fobj = dma_resv_fences_list(obj);
> +	count = fobj->num_fences;
>  
>  	write_seqcount_begin(&obj->seq);
>  
>  	for (i = 0; i < count; ++i) {
> +		enum dma_resv_usage old_usage;
>  
> -		old = rcu_dereference_protected(fobj->shared[i],
> -						dma_resv_held(obj));
> -		if (old->context == fence->context ||
> +		dma_resv_list_entry(fobj, i, obj, &old, &old_usage);
> +		if ((old->context == fence->context && old_usage >= usage) ||
>  		    dma_fence_is_signaled(old))
>  			goto replace;
>  	}
>  
> -	BUG_ON(fobj->shared_count >= fobj->shared_max);
> +	BUG_ON(fobj->num_fences >= fobj->max_fences);
>  	old = NULL;
>  	count++;
>  
>  replace:
> -	RCU_INIT_POINTER(fobj->shared[i], fence);
> -	/* pointer update must be visible before we extend the shared_count */
> -	smp_store_mb(fobj->shared_count, count);
> +	dma_resv_list_set(fobj, i, fence, usage);
> +	/* pointer update must be visible before we extend the num_fences */
> +	smp_store_mb(fobj->num_fences, count);
>  
>  	write_seqcount_end(&obj->seq);
>  	dma_fence_put(old);
>  }
> +EXPORT_SYMBOL(dma_resv_add_fence);
>  
>  /**
>   * dma_resv_replace_fences - replace fences in the dma_resv obj
> @@ -326,128 +336,63 @@ void dma_resv_replace_fences(struct dma_resv *obj, uint64_t context,
>  			     enum dma_resv_usage usage)
>  {
>  	struct dma_resv_list *list;
> -	struct dma_fence *old;
>  	unsigned int i;
>  
> -	/* Only readers supported for now */
> -	WARN_ON(usage != DMA_RESV_USAGE_READ);
> -
>  	dma_resv_assert_held(obj);
>  
> +	list = dma_resv_fences_list(obj);
>  	write_seqcount_begin(&obj->seq);
> +	for (i = 0; list && i < list->num_fences; ++i) {
> +		struct dma_fence *old;
>  
> -	old = dma_resv_excl_fence(obj);
> -	if (old->context == context) {
> -		RCU_INIT_POINTER(obj->fence_excl, dma_fence_get(replacement));
> -		dma_fence_put(old);
> -	}
> -
> -	list = dma_resv_shared_list(obj);
> -	for (i = 0; list && i < list->shared_count; ++i) {
> -		old = rcu_dereference_protected(list->shared[i],
> -						dma_resv_held(obj));
> +		dma_resv_list_entry(list, i, obj, &old, NULL);
>  		if (old->context != context)
>  			continue;
>  
> -		rcu_assign_pointer(list->shared[i], dma_fence_get(replacement));
> +		dma_resv_list_set(list, i, replacement, usage);
>  		dma_fence_put(old);
>  	}
> -
>  	write_seqcount_end(&obj->seq);
>  }
>  EXPORT_SYMBOL(dma_resv_replace_fences);
>  
> -/**
> - * dma_resv_add_excl_fence - Add an exclusive fence.
> - * @obj: the reservation object
> - * @fence: the exclusive fence to add
> - *
> - * Add a fence to the exclusive slot. @obj must be locked with dma_resv_lock().
> - * See also &dma_resv.fence_excl for a discussion of the semantics.
> - */
> -static void dma_resv_add_excl_fence(struct dma_resv *obj,
> -				    struct dma_fence *fence)
> -{
> -	struct dma_fence *old_fence = dma_resv_excl_fence(obj);
> -
> -	dma_resv_assert_held(obj);
> -
> -	dma_fence_get(fence);
> -
> -	write_seqcount_begin(&obj->seq);
> -	/* write_seqcount_begin provides the necessary memory barrier */
> -	RCU_INIT_POINTER(obj->fence_excl, fence);
> -	write_seqcount_end(&obj->seq);
> -
> -	dma_fence_put(old_fence);
> -}
> -
> -/**
> - * dma_resv_add_fence - Add a fence to the dma_resv obj
> - * @obj: the reservation object
> - * @fence: the fence to add
> - * @usage: how the fence is used, see enum dma_resv_usage
> - *
> - * Add a fence to a slot, @obj must be locked with dma_resv_lock(), and
> - * dma_resv_reserve_fences() has been called.
> - *
> - * See also &dma_resv.fence for a discussion of the semantics.
> - */
> -void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
> -			enum dma_resv_usage usage)
> -{
> -	if (usage == DMA_RESV_USAGE_WRITE)
> -		dma_resv_add_excl_fence(obj, fence);
> -	else
> -		dma_resv_add_shared_fence(obj, fence);
> -}
> -EXPORT_SYMBOL(dma_resv_add_fence);
> -
> -/* Restart the iterator by initializing all the necessary fields, but not the
> - * relation to the dma_resv object. */
> +/* Restart the unlocked iteration by initializing the cursor object. */
>  static void dma_resv_iter_restart_unlocked(struct dma_resv_iter *cursor)
>  {
>  	cursor->seq = read_seqcount_begin(&cursor->obj->seq);
> -	cursor->index = -1;
> -	cursor->shared_count = 0;
> -	if (cursor->usage >= DMA_RESV_USAGE_READ) {
> -		cursor->fences = dma_resv_shared_list(cursor->obj);
> -		if (cursor->fences)
> -			cursor->shared_count = cursor->fences->shared_count;
> -	} else {
> -		cursor->fences = NULL;
> -	}
> +	cursor->index = 0;
> +	cursor->num_fences = 0;
> +	cursor->fences = dma_resv_fences_list(cursor->obj);
> +	if (cursor->fences)
> +		cursor->num_fences = cursor->fences->num_fences;
>  	cursor->is_restarted = true;
>  }
>  
>  /* Walk to the next not signaled fence and grab a reference to it */
>  static void dma_resv_iter_walk_unlocked(struct dma_resv_iter *cursor)
>  {
> -	struct dma_resv *obj = cursor->obj;
> +	if (!cursor->fences)
> +		return;
>  
>  	do {
>  		/* Drop the reference from the previous round */
>  		dma_fence_put(cursor->fence);
>  
> -		if (cursor->index == -1) {
> -			cursor->fence = dma_resv_excl_fence(obj);
> -			cursor->index++;
> -			if (!cursor->fence)
> -				continue;
> -
> -		} else if (!cursor->fences ||
> -			   cursor->index >= cursor->shared_count) {
> +		if (cursor->index >= cursor->num_fences) {
>  			cursor->fence = NULL;
>  			break;
>  
> -		} else {
> -			struct dma_resv_list *fences = cursor->fences;
> -			unsigned int idx = cursor->index++;
> -
> -			cursor->fence = rcu_dereference(fences->shared[idx]);
>  		}
> +
> +		dma_resv_list_entry(cursor->fences, cursor->index++,
> +				    cursor->obj, &cursor->fence,
> +				    &cursor->fence_usage);
>  		cursor->fence = dma_fence_get_rcu(cursor->fence);
> -		if (!cursor->fence || !dma_fence_is_signaled(cursor->fence))
> +		if (!cursor->fence)
> +			break;
> +
> +		if (!dma_fence_is_signaled(cursor->fence) &&
> +		    cursor->usage >= cursor->fence_usage)
>  			break;
>  	} while (true);
>  }
> @@ -522,15 +467,9 @@ struct dma_fence *dma_resv_iter_first(struct dma_resv_iter *cursor)
>  	dma_resv_assert_held(cursor->obj);
>  
>  	cursor->index = 0;
> -	if (cursor->usage >= DMA_RESV_USAGE_READ)
> -		cursor->fences = dma_resv_shared_list(cursor->obj);
> -	else
> -		cursor->fences = NULL;
> -
> -	fence = dma_resv_excl_fence(cursor->obj);
> -	if (!fence)
> -		fence = dma_resv_iter_next(cursor);
> +	cursor->fences = dma_resv_fences_list(cursor->obj);
>  
> +	fence = dma_resv_iter_next(cursor);
>  	cursor->is_restarted = true;
>  	return fence;
>  }
> @@ -545,17 +484,22 @@ EXPORT_SYMBOL_GPL(dma_resv_iter_first);
>   */
>  struct dma_fence *dma_resv_iter_next(struct dma_resv_iter *cursor)
>  {
> -	unsigned int idx;
> +	struct dma_fence *fence;
>  
>  	dma_resv_assert_held(cursor->obj);
>  
>  	cursor->is_restarted = false;
> -	if (!cursor->fences || cursor->index >= cursor->fences->shared_count)
> -		return NULL;
>  
> -	idx = cursor->index++;
> -	return rcu_dereference_protected(cursor->fences->shared[idx],
> -					 dma_resv_held(cursor->obj));
> +	do {
> +		if (!cursor->fences ||
> +		    cursor->index >= cursor->fences->num_fences)
> +			return NULL;
> +
> +		dma_resv_list_entry(cursor->fences, cursor->index++,
> +				    cursor->obj, &fence, &cursor->fence_usage);
> +	} while (cursor->fence_usage > cursor->usage);
> +
> +	return fence;
>  }
>  EXPORT_SYMBOL_GPL(dma_resv_iter_next);
>  
> @@ -570,57 +514,43 @@ int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src)
>  {
>  	struct dma_resv_iter cursor;
>  	struct dma_resv_list *list;
> -	struct dma_fence *f, *excl;
> +	struct dma_fence *f;
>  
>  	dma_resv_assert_held(dst);
>  
>  	list = NULL;
> -	excl = NULL;
>  
>  	dma_resv_iter_begin(&cursor, src, DMA_RESV_USAGE_READ);
>  	dma_resv_for_each_fence_unlocked(&cursor, f) {
>  
>  		if (dma_resv_iter_is_restarted(&cursor)) {
>  			dma_resv_list_free(list);
> -			dma_fence_put(excl);
> -
> -			if (cursor.shared_count) {
> -				list = dma_resv_list_alloc(cursor.shared_count);
> -				if (!list) {
> -					dma_resv_iter_end(&cursor);
> -					return -ENOMEM;
> -				}
>  
> -				list->shared_count = 0;
> -
> -			} else {
> -				list = NULL;
> +			list = dma_resv_list_alloc(cursor.num_fences);
> +			if (!list) {
> +				dma_resv_iter_end(&cursor);
> +				return -ENOMEM;
>  			}
> -			excl = NULL;
> +			list->num_fences = 0;
>  		}
>  
>  		dma_fence_get(f);
> -		if (dma_resv_iter_usage(&cursor) == DMA_RESV_USAGE_WRITE)
> -			excl = f;
> -		else
> -			RCU_INIT_POINTER(list->shared[list->shared_count++], f);
> +		dma_resv_list_set(list, list->num_fences++, f,
> +				  dma_resv_iter_usage(&cursor));
>  	}
>  	dma_resv_iter_end(&cursor);
>  
>  	write_seqcount_begin(&dst->seq);
> -	excl = rcu_replace_pointer(dst->fence_excl, excl, dma_resv_held(dst));
> -	list = rcu_replace_pointer(dst->fence, list, dma_resv_held(dst));
> +	list = rcu_replace_pointer(dst->fences, list, dma_resv_held(dst));
>  	write_seqcount_end(&dst->seq);
>  
>  	dma_resv_list_free(list);
> -	dma_fence_put(excl);
> -
>  	return 0;
>  }
>  EXPORT_SYMBOL(dma_resv_copy_fences);
>  
>  /**
> - * dma_resv_get_fences - Get an object's shared and exclusive
> + * dma_resv_get_fences - Get an object's fences
>   * fences without update side lock held
>   * @obj: the reservation object
>   * @usage: controls which fences to include, see enum dma_resv_usage.
> @@ -649,7 +579,7 @@ int dma_resv_get_fences(struct dma_resv *obj, enum dma_resv_usage usage,
>  			while (*num_fences)
>  				dma_fence_put((*fences)[--(*num_fences)]);
>  
> -			count = cursor.shared_count + 1;
> +			count = cursor.num_fences + 1;
>  
>  			/* Eventually re-allocate the array */
>  			*fences = krealloc_array(*fences, count,
> @@ -723,8 +653,7 @@ int dma_resv_get_singleton(struct dma_resv *obj, enum dma_resv_usage usage,
>  EXPORT_SYMBOL_GPL(dma_resv_get_singleton);
>  
>  /**
> - * dma_resv_wait_timeout - Wait on reservation's objects
> - * shared and/or exclusive fences.
> + * dma_resv_wait_timeout - Wait on reservation's objects fences
>   * @obj: the reservation object
>   * @usage: controls which fences to include, see enum dma_resv_usage.
>   * @intr: if true, do interruptible wait
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> index 044b41f0bfd9..529d52a204cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> @@ -34,7 +34,6 @@ struct amdgpu_fpriv;
>  struct amdgpu_bo_list_entry {
>  	struct ttm_validate_buffer	tv;
>  	struct amdgpu_bo_va		*bo_va;
> -	struct dma_fence_chain		*chain;
>  	uint32_t			priority;
>  	struct page			**user_pages;
>  	bool				user_invalidated;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 76fd916424d6..8de283997769 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -574,14 +574,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  		struct amdgpu_bo *bo = ttm_to_amdgpu_bo(e->tv.bo);
>  
>  		e->bo_va = amdgpu_vm_bo_find(vm, bo);
> -
> -		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
> -			e->chain = dma_fence_chain_alloc();
> -			if (!e->chain) {
> -				r = -ENOMEM;
> -				goto error_validate;
> -			}
> -		}
>  	}
>  
>  	/* Move fence waiting after getting reservation lock of
> @@ -642,13 +634,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  	}
>  
>  error_validate:
> -	if (r) {
> -		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -			dma_fence_chain_free(e->chain);
> -			e->chain = NULL;
> -		}
> +	if (r)
>  		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
> -	}
>  out:
>  	return r;
>  }
> @@ -688,17 +675,9 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_parser *parser, int error,
>  {
>  	unsigned i;
>  
> -	if (error && backoff) {
> -		struct amdgpu_bo_list_entry *e;
> -
> -		amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
> -			dma_fence_chain_free(e->chain);
> -			e->chain = NULL;
> -		}
> -
> +	if (error && backoff)
>  		ttm_eu_backoff_reservation(&parser->ticket,
>  					   &parser->validated);
> -	}
>  
>  	for (i = 0; i < parser->num_post_deps; i++) {
>  		drm_syncobj_put(parser->post_deps[i].syncobj);
> @@ -1272,31 +1251,9 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  
>  	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>  
> -	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -		struct dma_resv *resv = e->tv.bo->base.resv;
> -		struct dma_fence_chain *chain = e->chain;
> -		struct dma_resv_iter cursor;
> -		struct dma_fence *fence;
> -
> -		if (!chain)
> -			continue;
> -
> -		/*
> -		 * Temporary workaround dma_resv shortcommings by wrapping up
> -		 * the submission in a dma_fence_chain and add it as exclusive
> -		 * fence.
> -		 *
> -		 * TODO: Remove together with dma_resv rework.
> -		 */
> -		dma_resv_for_each_fence(&cursor, resv,
> -					DMA_RESV_USAGE_WRITE,
> -					fence) {
> -			break;
> -		}
> -		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);
> -		rcu_assign_pointer(resv->fence_excl, &chain->base);
> -		e->chain = NULL;
> -	}
> +	/* Make sure all BOs are remembered as writers */
> +	amdgpu_bo_list_for_each_entry(e, p->bo_list)
> +		e->tv.num_shared = 0;
>  
>  	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>  	mutex_unlock(&p->adev->notifier_lock);
> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 98dc5234b487..7bb7e7edbb6f 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -99,8 +99,8 @@ static inline enum dma_resv_usage dma_resv_usage_rw(bool write)
>  /**
>   * struct dma_resv - a reservation object manages fences for a buffer
>   *
> - * There are multiple uses for this, with sometimes slightly different rules in
> - * how the fence slots are used.
> + * This is a container for dma_fence objects which needs to handle multiple use
> + * cases.
>   *
>   * One use is to synchronize cross-driver access to a struct dma_buf, either for
>   * dynamic buffer management or just to handle implicit synchronization between
> @@ -130,47 +130,22 @@ struct dma_resv {
>  	 * @seq:
>  	 *
>  	 * Sequence count for managing RCU read-side synchronization, allows
> -	 * read-only access to @fence_excl and @fence while ensuring we take a
> -	 * consistent snapshot.
> +	 * read-only access to @fences while ensuring we take a consistent
> +	 * snapshot.
>  	 */
>  	seqcount_ww_mutex_t seq;
>  
>  	/**
> -	 * @fence_excl:
> +	 * @fences:
>  	 *
> -	 * The exclusive fence, if there is one currently.
> +	 * Array of fences which where added to the dma_resv object
>  	 *
> -	 * To guarantee that no fences are lost, this new fence must signal
> -	 * only after the previous exclusive fence has signalled. If
> -	 * semantically only a new access is added without actually treating the
> -	 * previous one as a dependency the exclusive fences can be strung
> -	 * together using struct dma_fence_chain.
> -	 *
> -	 * Note that actual semantics of what an exclusive or shared fence mean
> -	 * is defined by the user, for reservation objects shared across drivers
> -	 * see &dma_buf.resv.
> -	 */
> -	struct dma_fence __rcu *fence_excl;
> -
> -	/**
> -	 * @fence:
> -	 *
> -	 * List of current shared fences.
> -	 *
> -	 * There are no ordering constraints of shared fences against the
> -	 * exclusive fence slot. If a waiter needs to wait for all access, it
> -	 * has to wait for both sets of fences to signal.
> -	 *
> -	 * A new fence is added by calling dma_resv_add_shared_fence(). Since
> -	 * this often needs to be done past the point of no return in command
> +	 * A new fence is added by calling dma_resv_add_fence(). Since this
> +	 * often needs to be done past the point of no return in command
>  	 * submission it cannot fail, and therefore sufficient slots need to be
>  	 * reserved by calling dma_resv_reserve_fences().
> -	 *
> -	 * Note that actual semantics of what an exclusive or shared fence mean
> -	 * is defined by the user, for reservation objects shared across drivers
> -	 * see &dma_buf.resv.
>  	 */
> -	struct dma_resv_list __rcu *fence;
> +	struct dma_resv_list __rcu *fences;
>  };
>  
>  /**
> @@ -207,8 +182,8 @@ struct dma_resv_iter {
>  	/** @fences: the shared fences; private, *MUST* not dereference  */
>  	struct dma_resv_list *fences;
>  
> -	/** @shared_count: number of shared fences */
> -	unsigned int shared_count;
> +	/** @num_fences: number of fences */
> +	unsigned int num_fences;
>  
>  	/** @is_restarted: true if this is the first returned fence */
>  	bool is_restarted;
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

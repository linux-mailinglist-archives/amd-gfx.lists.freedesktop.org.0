Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 322385E99E0
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Sep 2022 08:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C0010E53A;
	Mon, 26 Sep 2022 06:49:24 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4BE10E53A
 for <amd-gfx@lists.freedesktop.org>; Mon, 26 Sep 2022 06:49:20 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a26so11968405ejc.4
 for <amd-gfx@lists.freedesktop.org>; Sun, 25 Sep 2022 23:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=1y/A9xMpL/pyJ+VXP/zmnUsJjwqR8tJKJkusY3zksOQ=;
 b=B7yldOx5VkIMP9OcFyXig4hiaC9Uv1WMNzuwS+8pdUrvstYKgLlyvlVJfrWaf2Rq2g
 eLI6rDtL/PAce4kSiyY0s+ATCNwP45YdLHYBkvkDWiB4ilBVwWLEK4BqRNEg6e3l9pId
 gD029UfSQ2qUkCVZaexEQ318ieugtfSq6+gCgnlU+RTxE5rE4Ck51cc9B5s6eqc9Sv53
 C71JOP+0Ph22fDAYyZAEl2aMWuxvaG5NWrVWRiGY0UK5hNVLAoLPehlW6QW9DIpxEqFb
 Ooi8TDgKT25leQJ3Cf8BaSyAkAr0CyYXCVQ2KmdpTc1S+7adtNcc7PVRgHlrwIVDJSdz
 bmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=1y/A9xMpL/pyJ+VXP/zmnUsJjwqR8tJKJkusY3zksOQ=;
 b=otJ2TBUJKUYll+JDyyj7uUAruBma/HaNhpYxknmweantyOWcTul6WgGcbeerPbw1uD
 0c0+/yu6OqWZpYvqkFdL8uwC/XI4AAahgsaeS+qeLuexhsXlwNGs6d5dFganVUuhOyWJ
 Gkdxi5W5+NNghRhIpYHWXxKkK2KBGSLiNE49UpfwqxsKTkFNT+XY7jfCD6192fXRQiVB
 0+Xhxic9+tZJu/owEewCSmYzHD9wmpbEzcbG6ByM5TCgV122K89RIAbORJVTSOgshV7U
 pWPrZx22v6YhxBZ7yTfrnJEqceSGzelDC3kRVniCRh/k1h8v61JyHv5aByIJNnrbRyZH
 UxLg==
X-Gm-Message-State: ACrzQf3gtGivMgsVgeRug4/+7MhxaUNuG4a1dmiZYwFEOusRMu2ciJWY
 TfrE72imTJo46+r4ZTJmpxI=
X-Google-Smtp-Source: AMsMyM7Zv/2Uw+UZEBUyuMJaA6buJx/Pexzlvivi1slzThhT966ZMIQ1mi7jZNjv4lEiYxWZ88DCKQ==
X-Received: by 2002:a17:906:2bc7:b0:72f:dc70:a3c6 with SMTP id
 n7-20020a1709062bc700b0072fdc70a3c6mr17275857ejg.645.1664174958711; 
 Sun, 25 Sep 2022 23:49:18 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:8c17:40b5:7692:cdfc?
 ([2a02:908:1256:79a0:8c17:40b5:7692:cdfc])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a170906538d00b0073100dfa7b0sm7793950ejo.8.2022.09.25.23.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 23:49:18 -0700 (PDT)
Message-ID: <3d88b423-1d14-2954-e3ce-0c50887cf621@gmail.com>
Date: Mon, 26 Sep 2022 08:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] drm/amdgpu: MCBP based on DRM scheduler (v6)
Content-Language: en-US
To: jiadong.zhu@amd.com, amd-gfx@lists.freedesktop.org
References: <20220923131630.1260501-1-jiadong.zhu@amd.com>
 <20220923131630.1260501-4-jiadong.zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220923131630.1260501-4-jiadong.zhu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <Christian.Koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 23.09.22 um 15:16 schrieb jiadong.zhu@amd.com:
> From: "Jiadong.Zhu" <Jiadong.Zhu@amd.com>
>
> Trigger Mid-Command Buffer Preemption according to the priority of the software
> rings and the hw fence signalling condition.
>
> The muxer saves the locations of the indirect buffer frames from the software
> ring together with the fence sequence number in its fifo queue, and pops out
> those records when the fences are signalled. The locations are used to resubmit
> packages in preemption scenarios by coping the chunks from the software ring.
>
> v2: Update comment style.
> v3: Fix conflict caused by previous modifications.
> v4: Remove unnecessary prints.
> v5: Fix corner cases for resubmission cases.
> v6: Refactor functions for resubmission, calling fence_process in irq handler.
>
> Cc: Christian Koenig <Christian.Koenig@amd.com>
> Cc: Luben Tuikov <Luben.Tuikov@amd.com>
> Cc: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
> Acked-by: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Jiadong.Zhu <Jiadong.Zhu@amd.com>

I need more time for an in deep review of this, but form the one mile 
high view it looks correct to me now.

Can we do some pre-commit qa testing with this?

Thanks,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c       |   2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c     |  13 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h     |   3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c | 323 ++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h |  30 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sw_ring.c  |  26 ++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       |   2 +
>   drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c        |  10 +-
>   8 files changed, 368 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> index 258cffe3c06a..af86d87e2f3b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> @@ -211,6 +211,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
>   		}
>   	}
>   
> +	amdgpu_ring_ib_begin(ring);
>   	if (job && ring->funcs->init_cond_exec)
>   		patch_offset = amdgpu_ring_init_cond_exec(ring);
>   
> @@ -285,6 +286,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
>   	    ring->hw_prio == AMDGPU_GFX_PIPE_PRIO_HIGH)
>   		ring->funcs->emit_wave_limit(ring, false);
>   
> +	amdgpu_ring_ib_end(ring);
>   	amdgpu_ring_commit(ring);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index 13db99d653bd..84b0b3c7d40f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -33,6 +33,7 @@
>   
>   #include <drm/amdgpu_drm.h>
>   #include "amdgpu.h"
> +#include "amdgpu_sw_ring.h"
>   #include "atom.h"
>   
>   /*
> @@ -569,3 +570,15 @@ int amdgpu_ring_init_mqd(struct amdgpu_ring *ring)
>   
>   	return mqd_mgr->init_mqd(adev, ring->mqd_ptr, &prop);
>   }
> +
> +void amdgpu_ring_ib_begin(struct amdgpu_ring *ring)
> +{
> +	if (ring->is_sw_ring)
> +		amdgpu_sw_ring_ib_begin(ring);
> +}
> +
> +void amdgpu_ring_ib_end(struct amdgpu_ring *ring)
> +{
> +	if (ring->is_sw_ring)
> +		amdgpu_sw_ring_ib_end(ring);
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index e90d327a589e..6fbc1627dab7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -312,6 +312,9 @@ struct amdgpu_ring {
>   #define amdgpu_ring_preempt_ib(r) (r)->funcs->preempt_ib(r)
>   
>   int amdgpu_ring_alloc(struct amdgpu_ring *ring, unsigned ndw);
> +void amdgpu_ring_ib_begin(struct amdgpu_ring *ring);
> +void amdgpu_ring_ib_end(struct amdgpu_ring *ring);
> +
>   void amdgpu_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count);
>   void amdgpu_ring_generic_pad_ib(struct amdgpu_ring *ring, struct amdgpu_ib *ib);
>   void amdgpu_ring_commit(struct amdgpu_ring *ring);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
> index 662aadebf111..788567e3b743 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c
> @@ -28,23 +28,146 @@
>   
>   #define AMDGPU_MUX_RESUBMIT_JIFFIES_TIMEOUT (HZ / 2)
>   
> +static struct kmem_cache *amdgpu_mux_chunk_slab;
> +
> +static inline struct amdgpu_mux_entry *amdgpu_ring_mux_sw_entry(struct amdgpu_ring_mux *mux,
> +								struct amdgpu_ring *ring)
> +{
> +	return ring->entry_index < mux->ring_entry_size ?
> +			&mux->ring_entry[ring->entry_index] : NULL;
> +}
> +
> +/* copy packages on sw ring range[begin, end) */
> +static void amdgpu_ring_mux_copy_pkt_from_sw_ring(struct amdgpu_ring_mux *mux,
> +						  struct amdgpu_ring *ring,
> +						  u64 s_start, u64 s_end)
> +{
> +	u64 start, end;
> +	struct amdgpu_ring *real_ring = mux->real_ring;
> +
> +	start = s_start & ring->buf_mask;
> +	end = s_end & ring->buf_mask;
> +
> +	if (start == end) {
> +		DRM_ERROR("no more data copied from sw ring\n");
> +		return;
> +	}
> +	if (start > end) {
> +		amdgpu_ring_alloc(real_ring, (ring->ring_size >> 2) + end - start);
> +		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[start],
> +					   (ring->ring_size >> 2) - start);
> +		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[0], end);
> +	} else {
> +		amdgpu_ring_alloc(real_ring, end - start);
> +		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[start], end - start);
> +	}
> +}
> +
> +static void amdgpu_mux_resubmit_chunks(struct amdgpu_ring_mux *mux, bool is_fallback)
> +{
> +	struct amdgpu_mux_entry *e = NULL;
> +	struct amdgpu_mux_chunk *chunk;
> +	uint32_t seq, last_seq;
> +	int i;
> +
> +	if (is_fallback) {
> +		if (!spin_trylock(&mux->lock)) {
> +			amdgpu_ring_mux_schedule_resubmit(mux);
> +			DRM_ERROR("reschedule resubmit\n");
> +			return;
> +		}
> +	} else {
> +		spin_lock(&mux->lock);
> +	}
> +
> +	/*find low priority entries:*/
> +	if (!mux->s_resubmit) {
> +		spin_unlock(&mux->lock);
> +		return;
> +	}
> +
> +	for (i = 0; i < mux->num_ring_entries; i++) {
> +		if (mux->ring_entry[i].ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT) {
> +			e = &mux->ring_entry[i];
> +			break;
> +		}
> +	}
> +
> +	if (!e) {
> +		DRM_ERROR("%s no low priority ring found\n", __func__);
> +		spin_unlock(&mux->lock);
> +		return;
> +	}
> +
> +	last_seq = atomic_read(&e->ring->fence_drv.last_seq);
> +	seq = mux->seqno_to_resubmit;
> +	if (last_seq < seq) {
> +		/*resubmit all the fences between (last_seq, seq]*/
> +		list_for_each_entry(chunk, &e->list, entry) {
> +			if (chunk->sync_seq > last_seq && chunk->sync_seq <= seq) {
> +				amdgpu_ring_mux_copy_pkt_from_sw_ring(mux, e->ring,
> +								      chunk->start,
> +								      chunk->end);
> +				mux->wptr_resubmit = chunk->end;
> +				amdgpu_ring_commit(mux->real_ring);
> +			}
> +		}
> +	}
> +
> +	del_timer(&mux->resubmit_timer);
> +	mux->s_resubmit = false;
> +	spin_unlock(&mux->lock);
> +}
> +
> +static void amdgpu_mux_resubmit_fallback(struct timer_list *t)
> +{
> +	struct amdgpu_ring_mux *mux = from_timer(mux, t, resubmit_timer);
> +
> +	DRM_INFO("calling %s\n", __func__);
> +	amdgpu_mux_resubmit_chunks(mux, true);
> +}
> +
>   int amdgpu_ring_mux_init(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring,
>   			 unsigned int entry_size)
>   {
>   	mux->real_ring = ring;
>   	mux->num_ring_entries = 0;
> +
>   	mux->ring_entry = kcalloc(entry_size, sizeof(struct amdgpu_mux_entry), GFP_KERNEL);
>   	if (!mux->ring_entry)
>   		return -ENOMEM;
>   
>   	mux->ring_entry_size = entry_size;
> +	mux->s_resubmit = false;
> +
> +	amdgpu_mux_chunk_slab = kmem_cache_create("amdgpu_mux_chunk",
> +						  sizeof(struct amdgpu_mux_chunk), 0,
> +						  SLAB_HWCACHE_ALIGN, NULL);
> +	if (!amdgpu_mux_chunk_slab) {
> +		DRM_ERROR("create amdgpu_mux_chunk cache failed\n");
> +		return -ENOMEM;
> +	}
> +
>   	spin_lock_init(&mux->lock);
> +	timer_setup(&mux->resubmit_timer, amdgpu_mux_resubmit_fallback, 0);
>   
>   	return 0;
>   }
>   
>   void amdgpu_ring_mux_fini(struct amdgpu_ring_mux *mux)
>   {
> +	struct amdgpu_mux_entry *e;
> +	struct amdgpu_mux_chunk *chunk, *chunk2;
> +	int i;
> +
> +	for (i = 0; i < mux->num_ring_entries; i++) {
> +		e = &mux->ring_entry[i];
> +		list_for_each_entry_safe(chunk, chunk2, &e->list, entry) {
> +			list_del(&chunk->entry);
> +			kmem_cache_free(amdgpu_mux_chunk_slab, chunk);
> +		}
> +	}
> +	kmem_cache_destroy(amdgpu_mux_chunk_slab);
>   	kfree(mux->ring_entry);
>   	mux->ring_entry = NULL;
>   	mux->num_ring_entries = 0;
> @@ -64,62 +187,46 @@ int amdgpu_ring_mux_add_sw_ring(struct amdgpu_ring_mux *mux, struct amdgpu_ring
>   	ring->entry_index = mux->num_ring_entries;
>   	e->ring = ring;
>   
> +	INIT_LIST_HEAD(&e->list);
>   	mux->num_ring_entries += 1;
>   	return 0;
>   }
>   
> -static inline struct amdgpu_mux_entry *amdgpu_ring_mux_sw_entry(struct amdgpu_ring_mux *mux,
> -								struct amdgpu_ring *ring)
> -{
> -	return ring->entry_index < mux->ring_entry_size ?
> -			&mux->ring_entry[ring->entry_index] : NULL;
> -}
> -
> -/* copy packages on sw ring range[begin, end) */
> -static void amdgpu_ring_mux_copy_pkt_from_sw_ring(struct amdgpu_ring_mux *mux,
> -						  struct amdgpu_ring *ring,
> -						  u64 s_start, u64 s_end)
> -{
> -	u64 start, end;
> -	struct amdgpu_ring *real_ring = mux->real_ring;
> -
> -	start = s_start & ring->buf_mask;
> -	end = s_end & ring->buf_mask;
> -
> -	if (start == end) {
> -		DRM_ERROR("no more data copied from sw ring\n");
> -		return;
> -	}
> -	if (start > end) {
> -		amdgpu_ring_alloc(real_ring, (ring->ring_size >> 2) + end - start);
> -		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[start],
> -					   (ring->ring_size >> 2) - start);
> -		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[0], end);
> -	} else {
> -		amdgpu_ring_alloc(real_ring, end - start);
> -		amdgpu_ring_write_multiple(real_ring, (void *)&ring->ring[start], end - start);
> -	}
> -}
> -
>   void amdgpu_ring_mux_set_wptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring, u64 wptr)
>   {
>   	struct amdgpu_mux_entry *e;
>   
> +	if (ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT)
> +		amdgpu_mux_resubmit_chunks(mux, false);
> +
>   	e = amdgpu_ring_mux_sw_entry(mux, ring);
>   	if (!e) {
>   		DRM_ERROR("cannot find entry for sw ring\n");
>   		return;
>   	}
>   
> +	/* We could skip this set wptr as preemption in process. */
> +	if (ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT && mux->pending_trailing_fence_signaled) {
> +		DRM_ERROR("amdgpu_ring_mux_set_wptr skipped\n");
> +		return;
> +	}
> +
>   	spin_lock(&mux->lock);
>   	e->sw_cptr = e->sw_wptr;
> +	/* Update cptr if the package already copied in resubmit functions */
> +	if (ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT && e->sw_cptr < mux->wptr_resubmit)
> +		e->sw_cptr = mux->wptr_resubmit;
>   	e->sw_wptr = wptr;
>   	e->start_ptr_in_hw_ring = mux->real_ring->wptr;
>   
> -	amdgpu_ring_mux_copy_pkt_from_sw_ring(mux, ring, e->sw_cptr, wptr);
> -	e->end_ptr_in_hw_ring = mux->real_ring->wptr;
> -	amdgpu_ring_commit(mux->real_ring);
> -
> +	/* Skip copying for the packages already resubmitted.*/
> +	if (ring->hw_prio > AMDGPU_RING_PRIO_DEFAULT || mux->wptr_resubmit < wptr) {
> +		amdgpu_ring_mux_copy_pkt_from_sw_ring(mux, ring, e->sw_cptr, wptr);
> +		e->end_ptr_in_hw_ring = mux->real_ring->wptr;
> +		amdgpu_ring_commit(mux->real_ring);
> +	} else {
> +		e->end_ptr_in_hw_ring = mux->real_ring->wptr;
> +	}
>   	spin_unlock(&mux->lock);
>   }
>   
> @@ -181,3 +288,145 @@ u64 amdgpu_ring_mux_get_rptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ri
>   
>   	return e->sw_rptr;
>   }
> +
> +void amdgpu_ring_mux_schedule_resubmit(struct amdgpu_ring_mux *mux)
> +{
> +	mod_timer(&mux->resubmit_timer, jiffies + AMDGPU_MUX_RESUBMIT_JIFFIES_TIMEOUT);
> +}
> +
> +void amdgpu_ring_mux_start_ib(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring)
> +{
> +	struct amdgpu_mux_entry *e;
> +	struct amdgpu_mux_chunk *chunk;
> +
> +	amdgpu_mux_resubmit_chunks(mux, false);
> +
> +	e = amdgpu_ring_mux_sw_entry(mux, ring);
> +	if (!e) {
> +		DRM_ERROR("cannot find entry!\n");
> +		return;
> +	}
> +
> +	chunk = kmem_cache_alloc(amdgpu_mux_chunk_slab, GFP_KERNEL);
> +	if (!chunk) {
> +		DRM_ERROR("alloc amdgpu_mux_chunk_slab failed\n");
> +		return;
> +	}
> +
> +	chunk->start = ring->wptr;
> +	list_add_tail(&chunk->entry, &e->list);
> +}
> +
> +static void scan_and_remove_signaled_chunk(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring)
> +{
> +	uint32_t last_seq, size = 0;
> +	struct amdgpu_mux_entry *e;
> +	struct amdgpu_mux_chunk *chunk, *tmp;
> +
> +	e = amdgpu_ring_mux_sw_entry(mux, ring);
> +	if (!e) {
> +		DRM_ERROR("cannot find entry!\n");
> +		return;
> +	}
> +
> +	last_seq = atomic_read(&ring->fence_drv.last_seq);
> +
> +	list_for_each_entry_safe(chunk, tmp, &e->list, entry) {
> +		if (chunk->sync_seq <= last_seq) {
> +			list_del(&chunk->entry);
> +			kmem_cache_free(amdgpu_mux_chunk_slab, chunk);
> +		} else {
> +			size++;
> +		}
> +	}
> +}
> +
> +void amdgpu_ring_mux_end_ib(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring)
> +{
> +	struct amdgpu_mux_entry *e;
> +	struct amdgpu_mux_chunk *chunk;
> +
> +	e = amdgpu_ring_mux_sw_entry(mux, ring);
> +	if (!e) {
> +		DRM_ERROR("cannot find entry!\n");
> +		return;
> +	}
> +
> +	chunk = list_last_entry(&e->list, struct amdgpu_mux_chunk, entry);
> +	if (!chunk) {
> +		DRM_ERROR("cannot find chunk!\n");
> +		return;
> +	}
> +
> +	chunk->end = ring->wptr;
> +	chunk->sync_seq = READ_ONCE(ring->fence_drv.sync_seq);
> +
> +	scan_and_remove_signaled_chunk(mux, ring);
> +}
> +
> +/* Trigger Mid-Command Buffer Preemption (MCBP) and find if we need to resubmit. */
> +int amdgpu_mcbp_trigger_preempt(struct amdgpu_ring_mux *mux)
> +{
> +	int r;
> +
> +	spin_lock(&mux->lock);
> +	mux->pending_trailing_fence_signaled = true;
> +	r = amdgpu_ring_preempt_ib(mux->real_ring);
> +	spin_unlock(&mux->lock);
> +	return r;
> +}
> +
> +bool amdgpu_mcbp_handle_trailing_fence_irq(struct amdgpu_ring_mux *mux)
> +{
> +	struct amdgpu_mux_entry *e;
> +	struct amdgpu_ring *ring = NULL;
> +	int i;
> +
> +	if (!mux->pending_trailing_fence_signaled)
> +		return false;
> +
> +	if (mux->real_ring->trail_seq != le32_to_cpu(*mux->real_ring->trail_fence_cpu_addr))
> +		return false;
> +
> +	for (i = 0; i < mux->num_ring_entries; i++) {
> +		e = &mux->ring_entry[i];
> +		if (e->ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT) {
> +			ring = e->ring;
> +			break;
> +		}
> +	}
> +
> +	if (!ring) {
> +		DRM_ERROR("cannot find low priority ring\n");
> +		return false;
> +	}
> +
> +	amdgpu_fence_process(ring);
> +	if (amdgpu_fence_count_emitted(ring) > 0) {
> +		mux->s_resubmit = true;
> +		mux->seqno_to_resubmit = ring->fence_drv.sync_seq;
> +		amdgpu_ring_mux_schedule_resubmit(mux);
> +	}
> +
> +	mux->pending_trailing_fence_signaled = false;
> +	return true;
> +}
> +
> +/*scan on low prio rings to have unsignaled fence and high ring has no fence.*/
> +int amdgpu_mcbp_scan(struct amdgpu_ring_mux *mux)
> +{
> +	struct amdgpu_ring *ring;
> +	int i, need_preempt;
> +
> +	need_preempt = 0;
> +	for (i = 0; i < mux->num_ring_entries; i++) {
> +		ring = mux->ring_entry[i].ring;
> +		if (ring->hw_prio > AMDGPU_RING_PRIO_DEFAULT &&
> +			amdgpu_fence_count_emitted(ring) > 0)
> +			return 0;
> +		if (ring->hw_prio <= AMDGPU_RING_PRIO_DEFAULT &&
> +			amdgpu_fence_count_emitted(ring) > 0)
> +			need_preempt = 1;
> +	}
> +	return need_preempt && !mux->s_resubmit;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h
> index 8c1691e11b1c..bf8f5ca61605 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.h
> @@ -29,6 +29,7 @@
>   #include "amdgpu_ring.h"
>   
>   struct amdgpu_ring;
> +
>   /**
>    * struct amdgpu_mux_entry - the entry recording software rings copying information.
>    * @ring: the pointer to the software ring.
> @@ -37,6 +38,7 @@ struct amdgpu_ring;
>    * @sw_cptr: the position of the copy pointer in the sw ring.
>    * @sw_rptr: the read pointer in software ring.
>    * @sw_wptr: the write pointer in software ring.
> + * @list: list head for amdgpu_mux_chunk
>    */
>   struct amdgpu_mux_entry {
>   	struct                  amdgpu_ring *ring;
> @@ -45,6 +47,7 @@ struct amdgpu_mux_entry {
>   	u64                     sw_cptr;
>   	u64                     sw_rptr;
>   	u64                     sw_wptr;
> +	struct list_head        list;
>   };
>   
>   struct amdgpu_ring_mux {
> @@ -55,6 +58,26 @@ struct amdgpu_ring_mux {
>   	unsigned int            ring_entry_size;
>   	/*the lock for copy data from different software rings*/
>   	spinlock_t              lock;
> +	bool                    s_resubmit;
> +	uint32_t                seqno_to_resubmit;
> +	u64                     wptr_resubmit;
> +	struct timer_list       resubmit_timer;
> +
> +	bool                    pending_trailing_fence_signaled;
> +};
> +
> +/**
> + * struct amdgpu_mux_chunk - save the location of indirect buffer's package on softare rings.
> + * @entry: the list entry.
> + * @sync_seq: the fence seqno related with the saved IB.
> + * @start:- start location on the software ring.
> + * @end:- end location on the software ring.
> + */
> +struct amdgpu_mux_chunk {
> +	struct list_head        entry;
> +	uint32_t                sync_seq;
> +	u64                     start;
> +	u64                     end;
>   };
>   
>   int amdgpu_ring_mux_init(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring,
> @@ -65,4 +88,11 @@ void amdgpu_ring_mux_set_wptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *r
>   u64 amdgpu_ring_mux_get_wptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring);
>   u64 amdgpu_ring_mux_get_rptr(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring);
>   
> +void amdgpu_ring_mux_start_ib(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring);
> +void amdgpu_ring_mux_end_ib(struct amdgpu_ring_mux *mux, struct amdgpu_ring *ring);
> +void amdgpu_ring_mux_schedule_resubmit(struct amdgpu_ring_mux *mux);
> +
> +int amdgpu_mcbp_trigger_preempt(struct amdgpu_ring_mux *mux);
> +int amdgpu_mcbp_scan(struct amdgpu_ring_mux *mux);
> +bool amdgpu_mcbp_handle_trailing_fence_irq(struct amdgpu_ring_mux *mux);
>   #endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sw_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sw_ring.c
> index 5ae12d6641ca..a3ec7bdf72a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sw_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sw_ring.c
> @@ -59,3 +59,29 @@ void amdgpu_sw_ring_insert_nop(struct amdgpu_ring *ring, uint32_t count)
>   {
>   	WARN_ON(!ring->is_sw_ring);
>   }
> +
> +void amdgpu_sw_ring_ib_begin(struct amdgpu_ring *ring)
> +{
> +	struct amdgpu_device *adev = ring->adev;
> +	struct amdgpu_ring_mux *mux = &adev->gfx.muxer;
> +
> +	WARN_ON(!ring->is_sw_ring);
> +	if (ring->hw_prio > AMDGPU_RING_PRIO_DEFAULT) {
> +		if (amdgpu_mcbp_scan(mux) > 0)
> +			amdgpu_mcbp_trigger_preempt(mux);
> +		return;
> +	}
> +
> +	amdgpu_ring_mux_start_ib(mux, ring);
> +}
> +
> +void amdgpu_sw_ring_ib_end(struct amdgpu_ring *ring)
> +{
> +	struct amdgpu_device *adev = ring->adev;
> +	struct amdgpu_ring_mux *mux = &adev->gfx.muxer;
> +
> +	WARN_ON(!ring->is_sw_ring);
> +	if (ring->hw_prio > AMDGPU_RING_PRIO_DEFAULT)
> +		return;
> +	amdgpu_ring_mux_end_ib(mux, ring);
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9596c22fded6..b7e94553f4fb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -601,6 +601,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
>   	if (!vm_flush_needed && !gds_switch_needed && !need_pipe_sync)
>   		return 0;
>   
> +	amdgpu_ring_ib_begin(ring);
>   	if (ring->funcs->init_cond_exec)
>   		patch_offset = amdgpu_ring_init_cond_exec(ring);
>   
> @@ -661,6 +662,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
>   		amdgpu_ring_emit_switch_buffer(ring);
>   		amdgpu_ring_emit_switch_buffer(ring);
>   	}
> +	amdgpu_ring_ib_end(ring);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 669532f658da..1620300f0dde 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -5619,7 +5619,7 @@ static int gfx_v9_0_ring_preempt_ib(struct amdgpu_ring *ring)
>   	ring->trail_seq += 1;
>   	amdgpu_ring_alloc(ring, 13);
>   	gfx_v9_0_ring_emit_fence(ring, ring->trail_fence_gpu_addr,
> -				 ring->trail_seq, AMDGPU_FENCE_FLAG_EXEC);
> +				 ring->trail_seq, AMDGPU_FENCE_FLAG_EXEC | AMDGPU_FENCE_FLAG_INT);
>   	/*reset the CP_VMID_PREEMPT after trailing fence*/
>   	amdgpu_ring_emit_wreg(ring,
>   			      SOC15_REG_OFFSET(GC, 0, mmCP_VMID_PREEMPT),
> @@ -6045,9 +6045,11 @@ static int gfx_v9_0_eop_irq(struct amdgpu_device *adev,
>   
>   	switch (me_id) {
>   	case 0:
> -		/* Fence signals are handled on the software rings*/
> -		for (i = 0; i < GFX9_NUM_SW_GFX_RINGS; i++)
> -			amdgpu_fence_process(&adev->gfx.sw_gfx_ring[i]);
> +		if (!amdgpu_mcbp_handle_trailing_fence_irq(&adev->gfx.muxer)) {
> +			/* Fence signals are handled on the software rings*/
> +			for (i = 0; i < GFX9_NUM_SW_GFX_RINGS; i++)
> +				amdgpu_fence_process(&adev->gfx.sw_gfx_ring[i]);
> +		}
>   		break;
>   	case 1:
>   	case 2:


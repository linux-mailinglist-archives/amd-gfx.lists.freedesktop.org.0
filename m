Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0FD3A447D
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Jun 2021 16:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D086EE9D;
	Fri, 11 Jun 2021 14:56:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86B86EE9D
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Jun 2021 14:56:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a20so6437216wrc.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Jun 2021 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8DRpAbZduS79BSsvw/21IEqRxTOXXVsO5GTYrDtXz8A=;
 b=QpdW63PZD+qUoNhTIJedLSwsTTNDS7c2V8LoFcZvWjmlH7zp1Naz9sP44Yb7xBjAar
 9z/bVd9rGuqlhdklQjAbBR3j4Ths2Vw4vXbY4wz0GGmvGryl40seSQdQ2WMgJRjCJkyb
 x1Yy3v66N34En8KtOas/ZkBQ8klTYyEDMD/7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8DRpAbZduS79BSsvw/21IEqRxTOXXVsO5GTYrDtXz8A=;
 b=MITV3YRSUkrAktqtzuBb7haMMVfeE75v060Zpu+9zGzcXf+kgJ756mNAaL2t7wVC6r
 0un7NDFZfOa6ye0BLFbvrDV3w7vGeW/epleKunBDmTTtEMqjV/ixQh1ANsk3oBgiqzXn
 7Km2AnrC4VxFTz8l1p3mztJb9pFvKkSP/L2RpshTKNJUzz6mVxhzvVaKAtJMAu031AYV
 pmvazrsYOs8UfmyKPht/0EtT6NPQhyzLCxckbfsm94bnDkpaifqphP1a7aO4ybnaF5x9
 04vCM+V87lhmmiE8pye4TNUwx6Nv/FU5aUkMYkhT0+2sUvGJj6e3knbJRLRBlQWkIklW
 A+kA==
X-Gm-Message-State: AOAM532FblbCBIaBIBbG9GEv/sv8ZnsNdJBwCDhfee2DgXVn+by60Rhd
 0mtGPLk3PKoDxIYzNG98F5WpQ9aMTYSeZg==
X-Google-Smtp-Source: ABdhPJzQ6QGantOia3ULU/v66l5mxvnr4z3V244nOCvHqEtLUuODB8OSt/Smtx3S34WtegALCtGSKg==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr4628989wrv.100.1623423398383; 
 Fri, 11 Jun 2021 07:56:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a3sm7656498wra.4.2021.06.11.07.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 07:56:37 -0700 (PDT)
Date: Fri, 11 Jun 2021 16:56:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: rework dma_resv handling v2
Message-ID: <YMN5pJ3mm3wjQemi@phenom.ffwll.local>
References: <20210611120301.10595-1-christian.koenig@amd.com>
 <20210611120301.10595-5-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210611120301.10595-5-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 02:03:01PM +0200, Christian K=F6nig wrote:
> Drop the workaround and instead implement a better solution.
> =

> Basically we are now chaining all submissions using a dma_fence_chain
> container and adding them as exclusive fence to the dma_resv object.
> =

> This way other drivers can still sync to the single exclusive fence
> while amdgpu only sync to fences from different processes.
> =

> v2: polish kerneldoc a bit

There is no kerneldoc here, and otherwise this patch looks unchanged from
the previous round. Hit send a bit too quickly?
-Daniel

> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 54 +++++++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 65 ---------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 -
>  6 files changed, 47 insertions(+), 79 deletions(-)
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_bo_list.h
> index a130e766cbdb..c905a4cfc173 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> @@ -34,6 +34,7 @@ struct amdgpu_fpriv;
>  struct amdgpu_bo_list_entry {
>  	struct ttm_validate_buffer	tv;
>  	struct amdgpu_bo_va		*bo_va;
> +	struct dma_fence_chain		*chain;
>  	uint32_t			priority;
>  	struct page			**user_pages;
>  	bool				user_invalidated;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_cs.c
> index 325e82621467..f6f3029f958d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -587,6 +587,20 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
ser *p,
>  		goto out;
>  	}
>  =

> +	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +		struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(e->tv.bo);
> +
> +		e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
> +
> +		if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
> +			e->chain =3D dma_fence_chain_alloc();
> +			if (!e->chain) {
> +				r =3D -ENOMEM;
> +				goto error_validate;
> +			}
> +		}
> +	}
> +
>  	amdgpu_cs_get_threshold_for_moves(p->adev, &p->bytes_moved_threshold,
>  					  &p->bytes_moved_vis_threshold);
>  	p->bytes_moved =3D 0;
> @@ -614,15 +628,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
ser *p,
>  	gws =3D p->bo_list->gws_obj;
>  	oa =3D p->bo_list->oa_obj;
>  =

> -	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -		struct amdgpu_bo *bo =3D ttm_to_amdgpu_bo(e->tv.bo);
> -
> -		/* Make sure we use the exclusive slot for shared BOs */
> -		if (bo->prime_shared_count)
> -			e->tv.num_shared =3D 0;
> -		e->bo_va =3D amdgpu_vm_bo_find(vm, bo);
> -	}
> -
>  	if (gds) {
>  		p->job->gds_base =3D amdgpu_bo_gpu_offset(gds) >> PAGE_SHIFT;
>  		p->job->gds_size =3D amdgpu_bo_size(gds) >> PAGE_SHIFT;
> @@ -644,8 +649,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
ser *p,
>  	}
>  =

>  error_validate:
> -	if (r)
> +	if (r) {
> +		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +			dma_fence_chain_free(e->chain);
> +			e->chain =3D NULL;
> +		}
>  		ttm_eu_backoff_reservation(&p->ticket, &p->validated);
> +	}
>  out:
>  	return r;
>  }
> @@ -685,9 +695,17 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_p=
arser *parser, int error,
>  {
>  	unsigned i;
>  =

> -	if (error && backoff)
> +	if (error && backoff) {
> +		struct amdgpu_bo_list_entry *e;
> +
> +		amdgpu_bo_list_for_each_entry(e, parser->bo_list) {
> +			dma_fence_chain_free(e->chain);
> +			e->chain =3D NULL;
> +		}
> +
>  		ttm_eu_backoff_reservation(&parser->ticket,
>  					   &parser->validated);
> +	}
>  =

>  	for (i =3D 0; i < parser->num_post_deps; i++) {
>  		drm_syncobj_put(parser->post_deps[i].syncobj);
> @@ -1260,6 +1278,20 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parse=
r *p,
>  =

>  	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
>  =

> +	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> +		struct dma_resv *resv =3D e->tv.bo->base.resv;
> +		struct dma_fence_chain *chain =3D e->chain;
> +
> +		if (!chain)
> +			continue;
> +
> +		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
> +				     dma_fence_get(p->fence), 1);
> +
> +		rcu_assign_pointer(resv->fence_excl, &chain->base);
> +		e->chain =3D NULL;
> +	}
> +
>  	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
>  	mutex_unlock(&p->adev->notifier_lock);
>  =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index c3053b83b80c..23219fc3b28c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -42,48 +42,6 @@
>  #include <linux/pci-p2pdma.h>
>  #include <linux/pm_runtime.h>
>  =

> -static int
> -__dma_resv_make_exclusive(struct dma_resv *obj)
> -{
> -	struct dma_fence **fences;
> -	unsigned int count;
> -	int r;
> -
> -	if (!dma_resv_shared_list(obj)) /* no shared fences to convert */
> -		return 0;
> -
> -	r =3D dma_resv_get_fences(obj, NULL, &count, &fences);
> -	if (r)
> -		return r;
> -
> -	if (count =3D=3D 0) {
> -		/* Now that was unexpected. */
> -	} else if (count =3D=3D 1) {
> -		dma_resv_add_excl_fence(obj, fences[0]);
> -		dma_fence_put(fences[0]);
> -		kfree(fences);
> -	} else {
> -		struct dma_fence_array *array;
> -
> -		array =3D dma_fence_array_create(count, fences,
> -					       dma_fence_context_alloc(1), 0,
> -					       false);
> -		if (!array)
> -			goto err_fences_put;
> -
> -		dma_resv_add_excl_fence(obj, &array->base);
> -		dma_fence_put(&array->base);
> -	}
> -
> -	return 0;
> -
> -err_fences_put:
> -	while (count--)
> -		dma_fence_put(fences[count]);
> -	kfree(fences);
> -	return -ENOMEM;
> -}
> -
>  /**
>   * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
>   *
> @@ -110,24 +68,6 @@ static int amdgpu_dma_buf_attach(struct dma_buf *dmab=
uf,
>  	if (r < 0)
>  		goto out;
>  =

> -	r =3D amdgpu_bo_reserve(bo, false);
> -	if (unlikely(r !=3D 0))
> -		goto out;
> -
> -	/*
> -	 * We only create shared fences for internal use, but importers
> -	 * of the dmabuf rely on exclusive fences for implicitly
> -	 * tracking write hazards. As any of the current fences may
> -	 * correspond to a write, we need to convert all existing
> -	 * fences on the reservation object into a single exclusive
> -	 * fence.
> -	 */
> -	r =3D __dma_resv_make_exclusive(bo->tbo.base.resv);
> -	if (r)
> -		goto out;
> -
> -	bo->prime_shared_count++;
> -	amdgpu_bo_unreserve(bo);
>  	return 0;
>  =

>  out:
> @@ -150,9 +90,6 @@ static void amdgpu_dma_buf_detach(struct dma_buf *dmab=
uf,
>  	struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
>  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bo->tbo.bdev);
>  =

> -	if (attach->dev->driver !=3D adev->dev->driver && bo->prime_shared_coun=
t)
> -		bo->prime_shared_count--;
> -
>  	pm_runtime_mark_last_busy(adev_to_drm(adev)->dev);
>  	pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>  }
> @@ -406,8 +343,6 @@ amdgpu_dma_buf_create_obj(struct drm_device *dev, str=
uct dma_buf *dma_buf)
>  	bo =3D gem_to_amdgpu_bo(gobj);
>  	bo->allowed_domains =3D AMDGPU_GEM_DOMAIN_GTT;
>  	bo->preferred_domains =3D AMDGPU_GEM_DOMAIN_GTT;
> -	if (dma_buf->ops !=3D &amdgpu_dmabuf_ops)
> -		bo->prime_shared_count =3D 1;
>  =

>  	dma_resv_unlock(resv);
>  	return gobj;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 1c3e3b608332..5d82120fc160 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -829,7 +829,8 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev, void =
*data,
>  		break;
>  	}
>  	case AMDGPU_GEM_OP_SET_PLACEMENT:
> -		if (robj->prime_shared_count && (args->value & AMDGPU_GEM_DOMAIN_VRAM)=
) {
> +		if (robj->tbo.base.import_attach &&
> +		    args->value & AMDGPU_GEM_DOMAIN_VRAM) {
>  			r =3D -EINVAL;
>  			amdgpu_bo_unreserve(robj);
>  			break;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 96447e1d4c9c..30951b593809 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -871,7 +871,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u3=
2 domain,
>  		return -EINVAL;
>  =

>  	/* A shared bo cannot be migrated to VRAM */
> -	if (bo->prime_shared_count || bo->tbo.base.import_attach) {
> +	if (bo->tbo.base.import_attach) {
>  		if (domain & AMDGPU_GEM_DOMAIN_GTT)
>  			domain =3D AMDGPU_GEM_DOMAIN_GTT;
>  		else
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.h
> index b35962702278..55d7e90eaa72 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -98,7 +98,6 @@ struct amdgpu_bo {
>  	struct ttm_buffer_object	tbo;
>  	struct ttm_bo_kmap_obj		kmap;
>  	u64				flags;
> -	unsigned			prime_shared_count;
>  	/* per VM structure for page tables and with virtual addresses */
>  	struct amdgpu_vm_bo_base	*vm_bo;
>  	/* Constant after initialization */
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

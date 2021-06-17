Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25C73ABCF7
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Jun 2021 21:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319E46E2EF;
	Thu, 17 Jun 2021 19:37:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DF26E2EF
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Jun 2021 19:37:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id n7so8047364wri.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Jun 2021 12:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TQGgiu0y0sSp4sadu59D2BnPiKcH/uskZo+IAahUNCE=;
 b=GL2c1C6TEzU6GsXIIrecg3sYTWm1+Zv+j7YpD2Q0m8pfGfxaR97OfFnJNES1pusXnr
 o0Uxjs5SkhEp2Az2PBHpIIWiLvwziygSkE5U9sUR3WzMNFJzGVutlr4FJR+dIXaA1nb8
 H5hGQ3ai0OXWBBMvpXOwKlAg3WieB182ykpL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TQGgiu0y0sSp4sadu59D2BnPiKcH/uskZo+IAahUNCE=;
 b=e9qZ6Mfvc5hNujNJOTXl5XE+HdT6Stc7Tzh7/CwOTU9FQeic9+MJY/uX76azXTqhdL
 pxroDXEN7+9JxVDR8fBcaDt/nHZi5x6yHouyWapSq9GQGFmk42XrHot0K01/8HNB1z2U
 ko7BC+245qWSugU0akKX0hUFbPt6gNGAxxqBIIT/cjqO85xvc9gDgOessMF/hfwwbLwO
 MXPC2Nol10WUUnH+Ji1Dtuit2EykFkkCEjyUYSvELxVxlZe1k0XPYOexD9dMPAe8ypJ+
 d4p7ErQcKIU20dC+3JMctZ9tiHeuGQRxozvlOI06/vR23SRdLYd8YDadQuE4+2X525Oc
 1/Xg==
X-Gm-Message-State: AOAM530u0kHhvb2Czugit2AdAWRVAM2WtfdQ7CoVqVpE7+vT10ijWL2W
 ONeHeMV9DOGmFqFOW8LjiIVYig==
X-Google-Smtp-Source: ABdhPJzsWPwtJMH0tVqEzkROJEkQTOd4aWc12VVPJIwvN3+G4xwru8wkk3Q4llp2t2a/wJnaIgKpHQ==
X-Received: by 2002:adf:de87:: with SMTP id w7mr7761285wrl.333.1623958659296; 
 Thu, 17 Jun 2021 12:37:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a12sm6117338wmj.36.2021.06.17.12.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:37:38 -0700 (PDT)
Date: Thu, 17 Jun 2021 21:37:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: rework dma_resv handling v3
Message-ID: <YMukgVwPPX7SbYz8@phenom.ffwll.local>
References: <20210614174536.5188-1-christian.koenig@amd.com>
 <20210614174536.5188-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210614174536.5188-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Jun 14, 2021 at 07:45:36PM +0200, Christian K=F6nig wrote:
> Drop the workaround and instead implement a better solution.
> =

> Basically we are now chaining all submissions using a dma_fence_chain
> container and adding them as exclusive fence to the dma_resv object.
> =

> This way other drivers can still sync to the single exclusive fence
> while amdgpu only sync to fences from different processes.
> =

> v3: add the shared fence first before the exclusive one
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 62 ++++++++++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 65 ---------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     |  3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 -
>  6 files changed, 55 insertions(+), 79 deletions(-)
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
> index 9ce649a1a8d3..25655414e9c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -572,6 +572,20 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
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
> @@ -599,15 +613,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
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
> @@ -629,8 +634,13 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_par=
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
> @@ -670,9 +680,17 @@ static void amdgpu_cs_parser_fini(struct amdgpu_cs_p=
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
> @@ -1245,6 +1263,28 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parse=
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
> +		/*
> +		 * Work around dma_resv shortcommings by wrapping up the
> +		 * submission in a dma_fence_chain and add it as exclusive
> +		 * fence, but first add the submission as shared fence to make
> +		 * sure that shared fences never signal before the exclusive
> +		 * one.
> +		 */
> +		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
> +				     dma_fence_get(p->fence), 1);
> +
> +		dma_resv_add_shared_fence(resv, p->fence);
> +		rcu_assign_pointer(resv->fence_excl, &chain->base);

Ok I should have looked more carefully, +/- memory barriers this looks
correct.

So my idea behind the dma_resv_add_shared_exclusive_fence helper was that
it would give us more flexibility for changing the internals. Since I do
like your idea from a few weeks back of just storing exclusive fences as
shared ones, but with a marker, and then the interface functions picking
the right set of fences depending what the caller wants. But for that we'd
need to drop a lot more abstraction of the internals into dma_resv and
make sure everyone is using it.

Because looking at drivers there's indeed both the concept of a truly
exclusive fence, and the "it's actually a shared fence but stuff it into
the exclusive fence slot for implicit sync" variety. And from what I can
see, everyone gets it wrong, but in lots of different ways.

Hence the wrapper for this concept, and then making sure we roll it out to
all the drivers. I think all the ones with a NO_IMPLICIT flag (or
equivalent, i915 and msm have it the other way round iirc) would need this
to not break the dma_resv contract too badly.

But also I guess we can bikeshed this later on even more.

On this: Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>


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
> index 9cf4beaf646c..0780e8d18992 100644
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
> index b7a2070d90af..d13490975ac3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -892,7 +892,7 @@ int amdgpu_bo_pin_restricted(struct amdgpu_bo *bo, u3=
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
> index 126df03a7066..c03dfd298f45 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
> @@ -99,7 +99,6 @@ struct amdgpu_bo {
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

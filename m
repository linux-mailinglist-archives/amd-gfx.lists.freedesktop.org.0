Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D69F3ABAA7
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Jun 2021 19:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22036E957;
	Thu, 17 Jun 2021 17:30:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ACDB6E955
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Jun 2021 17:30:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id y7so7631005wrh.7
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Jun 2021 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=VKjsPb3fMCD82yCubTQnXQ11fo4UZaoUuAoRoa8fU+s=;
 b=LYE64+gU6GsbdZ3ljaR6NDVdeEdfR+hMQQMkPf8dNum9Pj2oGudcfZ/RS/JzmQMVLT
 Mm63h+ZyUo16OQRJNuRNG9ADWmJNgcmPdWfiXzP3oPSdbCbJ8ZtntEfAu9RkKoK6Lf3m
 CVVxpkCtbzXivnTmMEXhXEGHBp6NjvZ1TuKZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VKjsPb3fMCD82yCubTQnXQ11fo4UZaoUuAoRoa8fU+s=;
 b=lnRdXWbz3J1jIpvnjVhvWlW3ileyv8GtHiryM3Ku3hooXo0Bjdr+lWJ8AlYKLBKGz2
 5iz/2ysWvuT3qb/bAQR1Tw2LAK85lHop+9q1Wbg3mDMwZCbOe8sil0V+UDxsKWXRONaB
 anFjCpQFxF2B4TsSYudZUCAgVtaOe97VGyQO0tVkxhZEkKQ2Bm1DZPnK6pGPWRMa0ee4
 EgwvTUwm+Tpm/33opfaRsDrTuxW+BuOUNbSmYkVTsCHnymXBqKTdKKYqyJ9hU2VklAG3
 2wUioubjpXCa6Go4Yw9WLHzUq2WL3YUe6ZPrXV7YJJ+lePHfS2tncdZoCvqBis3bGsux
 XehA==
X-Gm-Message-State: AOAM5334kvwpJEW0aFagE+LEjNARRkGWxdUEZDRXhR5tEgdZrwNff+yC
 JRdrnUPsmNugIJlQBuBeAOviFg==
X-Google-Smtp-Source: ABdhPJxKfIxjyPPs3id05Sig8SzR4i9jB56N51cHg3b/UeqChuSBHD1Fh+6wA4472aFmIly7PvwuZQ==
X-Received: by 2002:a05:6000:188:: with SMTP id
 p8mr7257378wrx.296.1623951026952; 
 Thu, 17 Jun 2021 10:30:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n6sm8004282wme.21.2021.06.17.10.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:30:26 -0700 (PDT)
Date: Thu, 17 Jun 2021 19:30:24 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: unwrap fence chains in the explicit sync
 fence
Message-ID: <YMuGsGN/mxY+WU+q@phenom.ffwll.local>
References: <20210614174536.5188-1-christian.koenig@amd.com>
 <c474a0e1-e725-be64-0730-57231b5a8d15@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c474a0e1-e725-be64-0730-57231b5a8d15@gmail.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 09:44:25AM +0200, Christian K=F6nig wrote:
> Alex do want to review those so that we can close the ticket?

Maybe I'm behind on mails, but 2nd patch still has the issues I think I'm
seeing ...
-Daniel

> =

> Thanks,
> Christian.
> =

> Am 14.06.21 um 19:45 schrieb Christian K=F6nig:
> > Unwrap the explicit fence if it is a dma_fence_chain and
> > sync to the first fence not matching the owner rules.
> > =

> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 118 +++++++++++++----------
> >   1 file changed, 68 insertions(+), 50 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_sync.c
> > index 1b2ceccaf5b0..862eb3c1c4c5 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
> > @@ -28,6 +28,8 @@
> >    *    Christian K=F6nig <christian.koenig@amd.com>
> >    */
> > +#include <linux/dma-fence-chain.h>
> > +
> >   #include "amdgpu.h"
> >   #include "amdgpu_trace.h"
> >   #include "amdgpu_amdkfd.h"
> > @@ -186,6 +188,55 @@ int amdgpu_sync_vm_fence(struct amdgpu_sync *sync,=
 struct dma_fence *fence)
> >   	return amdgpu_sync_fence(sync, fence);
> >   }
> > +/* Determine based on the owner and mode if we should sync to a fence =
or not */
> > +static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
> > +				   enum amdgpu_sync_mode mode,
> > +				   void *owner, struct dma_fence *f)
> > +{
> > +	void *fence_owner =3D amdgpu_sync_get_owner(f);
> > +
> > +	/* Always sync to moves, no matter what */
> > +	if (fence_owner =3D=3D AMDGPU_FENCE_OWNER_UNDEFINED)
> > +		return true;
> > +
> > +	/* We only want to trigger KFD eviction fences on
> > +	 * evict or move jobs. Skip KFD fences otherwise.
> > +	 */
> > +	if (fence_owner =3D=3D AMDGPU_FENCE_OWNER_KFD &&
> > +	    owner !=3D AMDGPU_FENCE_OWNER_UNDEFINED)
> > +		return false;
> > +
> > +	/* Never sync to VM updates either. */
> > +	if (fence_owner =3D=3D AMDGPU_FENCE_OWNER_VM &&
> > +	    owner !=3D AMDGPU_FENCE_OWNER_UNDEFINED)
> > +		return false;
> > +
> > +	/* Ignore fences depending on the sync mode */
> > +	switch (mode) {
> > +	case AMDGPU_SYNC_ALWAYS:
> > +		return true;
> > +
> > +	case AMDGPU_SYNC_NE_OWNER:
> > +		if (amdgpu_sync_same_dev(adev, f) &&
> > +		    fence_owner =3D=3D owner)
> > +			return false;
> > +		break;
> > +
> > +	case AMDGPU_SYNC_EQ_OWNER:
> > +		if (amdgpu_sync_same_dev(adev, f) &&
> > +		    fence_owner !=3D owner)
> > +			return false;
> > +		break;
> > +
> > +	case AMDGPU_SYNC_EXPLICIT:
> > +		return false;
> > +	}
> > +
> > +	WARN(debug_evictions && fence_owner =3D=3D AMDGPU_FENCE_OWNER_KFD,
> > +	     "Adding eviction fence to sync obj");
> > +	return true;
> > +}
> > +
> >   /**
> >    * amdgpu_sync_resv - sync to a reservation object
> >    *
> > @@ -211,67 +262,34 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, =
struct amdgpu_sync *sync,
> >   	/* always sync to the exclusive fence */
> >   	f =3D dma_resv_excl_fence(resv);
> > -	r =3D amdgpu_sync_fence(sync, f);
> > +	dma_fence_chain_for_each(f, f) {
> > +		struct dma_fence_chain *chain =3D to_dma_fence_chain(f);
> > +
> > +		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
> > +					   chain->fence : f)) {
> > +			r =3D amdgpu_sync_fence(sync, f);
> > +			dma_fence_put(f);
> > +			if (r)
> > +				return r;
> > +			break;
> > +		}
> > +	}
> >   	flist =3D dma_resv_shared_list(resv);
> > -	if (!flist || r)
> > -		return r;
> > +	if (!flist)
> > +		return 0;
> >   	for (i =3D 0; i < flist->shared_count; ++i) {
> > -		void *fence_owner;
> > -
> >   		f =3D rcu_dereference_protected(flist->shared[i],
> >   					      dma_resv_held(resv));
> > -		fence_owner =3D amdgpu_sync_get_owner(f);
> > -
> > -		/* Always sync to moves, no matter what */
> > -		if (fence_owner =3D=3D AMDGPU_FENCE_OWNER_UNDEFINED) {
> > +		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
> >   			r =3D amdgpu_sync_fence(sync, f);
> >   			if (r)
> > -				break;
> > -		}
> > -
> > -		/* We only want to trigger KFD eviction fences on
> > -		 * evict or move jobs. Skip KFD fences otherwise.
> > -		 */
> > -		if (fence_owner =3D=3D AMDGPU_FENCE_OWNER_KFD &&
> > -		    owner !=3D AMDGPU_FENCE_OWNER_UNDEFINED)
> > -			continue;
> > -
> > -		/* Never sync to VM updates either. */
> > -		if (fence_owner =3D=3D AMDGPU_FENCE_OWNER_VM &&
> > -		    owner !=3D AMDGPU_FENCE_OWNER_UNDEFINED)
> > -			continue;
> > -
> > -		/* Ignore fences depending on the sync mode */
> > -		switch (mode) {
> > -		case AMDGPU_SYNC_ALWAYS:
> > -			break;
> > -
> > -		case AMDGPU_SYNC_NE_OWNER:
> > -			if (amdgpu_sync_same_dev(adev, f) &&
> > -			    fence_owner =3D=3D owner)
> > -				continue;
> > -			break;
> > -
> > -		case AMDGPU_SYNC_EQ_OWNER:
> > -			if (amdgpu_sync_same_dev(adev, f) &&
> > -			    fence_owner !=3D owner)
> > -				continue;
> > -			break;
> > -
> > -		case AMDGPU_SYNC_EXPLICIT:
> > -			continue;
> > +				return r;
> >   		}
> > -
> > -		WARN(debug_evictions && fence_owner =3D=3D AMDGPU_FENCE_OWNER_KFD,
> > -		     "Adding eviction fence to sync obj");
> > -		r =3D amdgpu_sync_fence(sync, f);
> > -		if (r)
> > -			break;
> >   	}
> > -	return r;
> > +	return 0;
> >   }
> >   /**
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

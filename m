Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C892033DB
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jun 2020 11:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD1C6E13B;
	Mon, 22 Jun 2020 09:45:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6CB6E13B
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2020 09:45:07 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g10so14206755wmh.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jun 2020 02:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/ftU2gSku7NZN2uC3yYZ7DaLCQbv/W8k5a7cXfzGVPQ=;
 b=ClM38zkXMfila4GTWaR0koJ6Z+K88gt7XyKYuJ7uCiVxo8Z/PK8yVy77Lr58qkZtyH
 qnJk82SfN5IGCmOsGvtYvCb+SnHi0UvDkoOUu4kArTU9pM6c4yKaTZlFJDOGuG42k3JK
 F4/5YwKAPdur3+YtuRReb3+lOoGqrIj3hdeaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ftU2gSku7NZN2uC3yYZ7DaLCQbv/W8k5a7cXfzGVPQ=;
 b=C0nnYmCoekLMyurkZSqGulsZfic2IXGHB25BrbrH4jw4WqDp3sySOnZkMEfyZf7UHf
 AbD3005ydsWDO36yTZBcvv29NSBfFMa91YbDUfEJW8V4Lr3IBOZnQeDZnjRwTg0CT6GC
 nMOYZlaZq1WqCmqlBtpb6rJLSZBFNq4DLbNkiLXN7gP3DFPRIUTa6Aq2BgjQCJ2glVIH
 2GdP4b4ZkyZ7T/IliP0JPbFt9f/ffGbeytQFiX1DYDdSSDininuAKBVPLjD6mdPJvNUm
 coEHCl3pqHH0UJAIpRrLTfadXLkH/atHp+r3hJX+H7F95BWFwprPDQ219r/ovQlgOoW7
 S3pA==
X-Gm-Message-State: AOAM531Rxga1KDs5ObRpesxJ14AGVUY1u+kRo57pVP3lHATk+99OTaux
 v7nQIOLZj8FlFKtM7Dc8AKsLXw==
X-Google-Smtp-Source: ABdhPJyVOHsYJSF0sFKYspRGumZbHZkrv985Utl2NMcS/xTxIOHoqzb439u0niKWjPgRWNjyCaxiIw==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr10062657wmi.99.1592819105573; 
 Mon, 22 Jun 2020 02:45:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n16sm11399867wrq.39.2020.06.22.02.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 02:45:04 -0700 (PDT)
Date: Mon, 22 Jun 2020 11:45:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v2 3/8] drm/ttm: Add unampping of the entire device
 address space
Message-ID: <20200622094502.GB20149@phenom.ffwll.local>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-4-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1592719388-13819-4-git-send-email-andrey.grodzovsky@amd.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 ppaalanen@gmail.com, amd-gfx@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, alexdeucher@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sun, Jun 21, 2020 at 02:03:03AM -0400, Andrey Grodzovsky wrote:
> Helper function to be used to invalidate all BOs CPU mappings
> once device is removed.
> 
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>

This seems to be missing the code to invalidate all the dma-buf mmaps?

Probably needs more testcases if you're not yet catching this. Or am I
missing something, and we're exchanging the the address space also for
dma-buf?
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c    | 8 ++++++--
>  include/drm/ttm/ttm_bo_driver.h | 7 +++++++
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c5b516f..926a365 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1750,10 +1750,14 @@ void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
>  	ttm_bo_unmap_virtual_locked(bo);
>  	ttm_mem_io_unlock(man);
>  }
> -
> -
>  EXPORT_SYMBOL(ttm_bo_unmap_virtual);
>  
> +void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev)
> +{
> +	unmap_mapping_range(bdev->dev_mapping, 0, 0, 1);
> +}
> +EXPORT_SYMBOL(ttm_bo_unmap_virtual_address_space);
> +
>  int ttm_bo_wait(struct ttm_buffer_object *bo,
>  		bool interruptible, bool no_wait)
>  {
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index c9e0fd0..39ea44f 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -601,6 +601,13 @@ int ttm_bo_device_init(struct ttm_bo_device *bdev,
>  void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo);
>  
>  /**
> + * ttm_bo_unmap_virtual_address_space
> + *
> + * @bdev: tear down all the virtual mappings for this device
> + */
> +void ttm_bo_unmap_virtual_address_space(struct ttm_bo_device *bdev);
> +
> +/**
>   * ttm_bo_unmap_virtual
>   *
>   * @bo: tear down the virtual mappings for this BO
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CB651FFB1
	for <lists+amd-gfx@lfdr.de>; Mon,  9 May 2022 16:33:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3347C10E754;
	Mon,  9 May 2022 14:33:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 503E510EA15
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 May 2022 14:33:20 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ba17so16539718edb.5
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 May 2022 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vB9fvsYNF+MRJ+OzewjBCcyr9I8udPyly7AX+BSwf0k=;
 b=DOvuEghOyyfUq7d2+Y/Kxe4A1QCis8rUXabkMf0CFlHkV1Jm/PVFmq6qqEidJb/8NJ
 Dh0BsEWCnfmzvizSHSAnGWRm/YI/sG/0ztAz/jEs5NNgebznmaF27fvrAv1eDB3hOcgT
 8eQUk1Azfhq3xv22ZgWhpQ4N+MwdixWi6DhMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vB9fvsYNF+MRJ+OzewjBCcyr9I8udPyly7AX+BSwf0k=;
 b=f5D9pWnSfotQjRTemHJ7RUVLme6+uR7oCausIr3CHuEx+/45YCNFi5x7Ubt8CADyXN
 OBbw6ijioQML5JgVV/SU0sngEnLLrJ5AJ/fd+uzblcK+cN5CmQwDZf5Vcqf4nVLqmuRN
 nJLsDcb34h1KJwOJY7Y2uUvlFsi1zTijt3llRbsS3Zg8i6gk64D1jijzPswxoMhdd8p+
 964k+JrkhGnp5bEI9srJAhArKkuuxQNaDBmBbQC04IWgtA+B4jpWQKraRU8+JAnUz2Vm
 HnabRXtUGSyyBOzquHH2Mg2g4qTiMn7dD6G3+GRXNL/GgUeJ3DS8QYJa7ocSwVlCyJw6
 Vufg==
X-Gm-Message-State: AOAM531w7Gq8cFQ6V4Yk5xIDGOIyjo+TVLpakJfFXg/4uZTIUXlyTciI
 dN1Uoglo1Q8gXcSEVMTIkIx8Cw==
X-Google-Smtp-Source: ABdhPJx3gJdzpTRFkOJU2gYYfuVxElrMW0OeA/0RqIimx25r6owo4ljB4s7QppXCV+4Lb9AhozLPXg==
X-Received: by 2002:aa7:dd87:0:b0:425:c104:71bf with SMTP id
 g7-20020aa7dd87000000b00425c10471bfmr17817626edv.110.1652106798532; 
 Mon, 09 May 2022 07:33:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hz18-20020a1709072cf200b006f3ef214e0dsm5194266ejc.115.2022.05.09.07.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:33:17 -0700 (PDT)
Date: Mon, 9 May 2022 16:33:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 8/8] drm: move ttm_execbuf_util into vmwgfx
Message-ID: <YnkmLI1C7yc31eW2@phenom.ffwll.local>
References: <20220504074739.2231-1-christian.koenig@amd.com>
 <20220504074739.2231-9-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220504074739.2231-9-christian.koenig@amd.com>
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
Cc: daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 09:47:39AM +0200, Christian K�nig wrote:
> VMWGFX is the only remaining user of this and should probably moved over
> to drm_exec when it starts using GEM as well.
> 
> Signed-off-by: Christian K�nig <christian.koenig@amd.com>

I guess this is a bit annoying since it means we can't require drm_exec in
ttm eviction, but we can make it an optional pointer in the ttm ctx. Needs
to be optional anyway since we won't roll this out to all drivers, and
then we can optionally use it to handle the locking in eviction instead of
the current lock dropping tricks.

I'm assuming at least that's your goal here, or is there a different one?
-Daniel

> ---
>  drivers/gpu/drm/ttm/Makefile                                  | 4 ++--
>  drivers/gpu/drm/vmwgfx/Makefile                               | 2 +-
>  drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c            | 3 ++-
>  .../drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h     | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                           | 2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_validation.h                    | 2 +-
>  6 files changed, 8 insertions(+), 7 deletions(-)
>  rename drivers/gpu/drm/{ttm => vmwgfx}/ttm_execbuf_util.c (99%)
>  rename {include/drm/ttm => drivers/gpu/drm/vmwgfx}/ttm_execbuf_util.h (99%)
> 
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index f906b22959cf..b05a8477d0d0 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -3,8 +3,8 @@
>  # Makefile for the drm device driver.  This driver provides support for the
>  
>  ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
> -	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
> -	ttm_device.o ttm_sys_manager.o
> +	ttm_range_manager.o ttm_resource.o ttm_pool.o ttm_device.o \
> +	ttm_sys_manager.o
>  ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>  
>  obj-$(CONFIG_DRM_TTM) += ttm.o
> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
> index eee73b9aa404..c2c836103b23 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_hashtab.o vmwgfx_kms.o vmwgfx_drv.o \
> -	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
> +	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o ttm_execbuf_util.o \
>  	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
>  	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
>  	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
> similarity index 99%
> rename from drivers/gpu/drm/ttm/ttm_execbuf_util.c
> rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
> index dbee34a058df..1030f263ba07 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.c
> @@ -26,13 +26,14 @@
>   *
>   **************************************************************************/
>  
> -#include <drm/ttm/ttm_execbuf_util.h>
>  #include <drm/ttm/ttm_bo_driver.h>
>  #include <drm/ttm/ttm_placement.h>
>  #include <linux/wait.h>
>  #include <linux/sched.h>
>  #include <linux/module.h>
>  
> +#include "ttm_execbuf_util.h"
> +
>  static void ttm_eu_backoff_reservation_reverse(struct list_head *list,
>  					      struct ttm_validate_buffer *entry)
>  {
> diff --git a/include/drm/ttm/ttm_execbuf_util.h b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
> similarity index 99%
> rename from include/drm/ttm/ttm_execbuf_util.h
> rename to drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
> index a99d7fdf2964..47553bf31c73 100644
> --- a/include/drm/ttm/ttm_execbuf_util.h
> +++ b/drivers/gpu/drm/vmwgfx/ttm_execbuf_util.h
> @@ -33,7 +33,7 @@
>  
>  #include <linux/list.h>
>  
> -#include "ttm_bo_api.h"
> +#include <drm/ttm/ttm_bo_api.h>
>  
>  /**
>   * struct ttm_validate_buffer
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index be19aa6e1f13..cae306c60af9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -37,8 +37,8 @@
>  #include <drm/drm_rect.h>
>  
>  #include <drm/ttm/ttm_bo_driver.h>
> -#include <drm/ttm/ttm_execbuf_util.h>
>  
> +#include "ttm_execbuf_util.h"
>  #include "ttm_object.h"
>  
>  #include "vmwgfx_fence.h"
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
> index f21df053882b..3613a3d52528 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.h
> @@ -31,7 +31,7 @@
>  #include <linux/list.h>
>  #include <linux/ww_mutex.h>
>  
> -#include <drm/ttm/ttm_execbuf_util.h>
> +#include "ttm_execbuf_util.h"
>  
>  #include "vmwgfx_hashtab.h"
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

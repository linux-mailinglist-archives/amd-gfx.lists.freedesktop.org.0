Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F18226C22C
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Sep 2020 13:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 011306E9AE;
	Wed, 16 Sep 2020 11:35:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506296E9AE
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 11:35:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id b79so2622290wmb.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Sep 2020 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DdTA+P9lRhC68qI4dpVtWpzlyCIniGzxdHE1O+Q7zUU=;
 b=VZm53vKzP2cW6qF7XV0KSRt5PPELHpk07zG//Mxa2CBTIBDdZdST/S+s0rdEQKVsZW
 gTZ1OWjoGqV/1N91UgOzFqec1vf3PElY/ngrFrKXGmjuOOcYrYiRpj5tf2Kdv9HG27Xk
 tCQbqYKzbNGq1n8DixVR/dUuMsm1DSxiACKH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DdTA+P9lRhC68qI4dpVtWpzlyCIniGzxdHE1O+Q7zUU=;
 b=CYvvkX1I0elf74M5LkmdiClxrpWya3jhmALpyoqEHXGjHc3aZB5I+Ajm3WLAGrTpNN
 ww2U7RceX04ejBLWJZtQGcG4T6jbE/SxsIn25xNEQ5bcwy+BPlXR2OwcTxC/fiTUuRbn
 /mhn3Zcks8WgX1jT9VvaaClFDavIYczwrA2mzbVV8b0vuaEYYpIWPUO2wtlF3lRV9OIW
 cg32z6LLrmYiO9iIjaQk2Xz61LQIfKpP4IQ23qL6typzKi6Mw8Djh3TYG7NkKs+GbE38
 HJxLnK7O0lNbjRaWjrR73guffRKqqouq6yM7X7mtqdewxWmrd6EmqpVSg2gS7lJ7i0HT
 ovvg==
X-Gm-Message-State: AOAM531aahLyh7opEZj9NSnA4H70PlERI9Kxh9+N0b0Jn7ME2gNK+VrN
 KIOuj21dx3YR7GIrFvLUqCkz2A==
X-Google-Smtp-Source: ABdhPJylkcOBbGgEGGZKZhaBAwyH9kqk9RFSGhRv17hk61GEhNulx96NJ9Vhx8cdjXcbwhCg7LMEDQ==
X-Received: by 2002:a05:600c:2109:: with SMTP id
 u9mr3990398wml.147.1600256118887; 
 Wed, 16 Sep 2020 04:35:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g14sm4163583wrv.25.2020.09.16.04.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 04:35:18 -0700 (PDT)
Date: Wed, 16 Sep 2020 13:35:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 07/21] drm/mediatek: Introduce GEM object functions
Message-ID: <20200916113514.GK438822@phenom.ffwll.local>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915145958.19993-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: hamohammed.sa@gmail.com, heiko@sntech.de, andrey.grodzovsky@amd.com,
 airlied@linux.ie, nouveau@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, eric@anholt.net, thierry.reding@gmail.com,
 robdclark@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 sumit.semwal@linaro.org, emil.velikov@collabora.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, tomi.valkeinen@ti.com,
 linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 patrik.r.jakobsson@gmail.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, miaoqinglang@huawei.com,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 jani.nikula@linux.intel.com, inki.dae@samsung.com, hdegoede@redhat.com,
 christian.gmeiner@gmail.com, linux-mediatek@lists.infradead.org,
 mripard@kernel.org, rodrigo.vivi@intel.com, matthias.bgg@gmail.com,
 evan.quan@amd.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org,
 tvrtko.ursulin@linux.intel.com, amd-gfx@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, hyun.kwon@xilinx.com,
 rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, sw0312.kim@samsung.com, hjc@rock-chips.com,
 chris@chris-wilson.co.uk, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 p.zabel@pengutronix.de, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 l.stach@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 04:59:44PM +0200, Thomas Zimmermann wrote:
> GEM object functions deprecate several similar callback interfaces in
> struct drm_driver. This patch replaces the per-driver callbacks with
> per-instance callbacks in mediatek. The only exception is gem_prime_mmap,
> which is non-trivial to convert.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c |  5 -----
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 11 +++++++++++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 040a8f393fe2..2f8d0043fca7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -301,18 +301,13 @@ struct drm_gem_object *mtk_drm_gem_prime_import(struct drm_device *dev,
>  static struct drm_driver mtk_drm_driver = {
>  	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
>  
> -	.gem_free_object_unlocked = mtk_drm_gem_free_object,
> -	.gem_vm_ops = &drm_gem_cma_vm_ops,
>  	.dumb_create = mtk_drm_gem_dumb_create,
>  
>  	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>  	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>  	.gem_prime_import = mtk_drm_gem_prime_import,
> -	.gem_prime_get_sg_table = mtk_gem_prime_get_sg_table,
>  	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
>  	.gem_prime_mmap = mtk_drm_gem_mmap_buf,
> -	.gem_prime_vmap = mtk_drm_gem_prime_vmap,
> -	.gem_prime_vunmap = mtk_drm_gem_prime_vunmap,
>  	.fops = &mtk_drm_fops,
>  
>  	.name = DRIVER_NAME,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> index 6190cc3b7b0d..591b90410e4a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -8,11 +8,20 @@
>  #include <drm/drm.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_prime.h>
>  
>  #include "mtk_drm_drv.h"
>  #include "mtk_drm_gem.h"
>  
> +static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs = {
> +	.free = mtk_drm_gem_free_object,
> +	.get_sg_table = mtk_gem_prime_get_sg_table,
> +	.vmap = mtk_drm_gem_prime_vmap,
> +	.vunmap = mtk_drm_gem_prime_vunmap,
> +	.vm_ops = &drm_gem_cma_vm_ops,
> +};
> +
>  static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>  						unsigned long size)
>  {
> @@ -25,6 +34,8 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
>  	if (!mtk_gem_obj)
>  		return ERR_PTR(-ENOMEM);
>  
> +	mtk_gem_obj->base.funcs = &mtk_drm_gem_object_funcs;
> +
>  	ret = drm_gem_object_init(dev, &mtk_gem_obj->base, size);
>  	if (ret < 0) {
>  		DRM_ERROR("failed to initialize gem object\n");
> -- 
> 2.28.0

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

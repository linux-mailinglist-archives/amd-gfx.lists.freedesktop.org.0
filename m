Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A03751A5E6
	for <lists+amd-gfx@lfdr.de>; Wed,  4 May 2022 18:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9473D10F7DF;
	Wed,  4 May 2022 16:48:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E2110F7D5
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 May 2022 16:47:59 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id i19so3993021eja.11
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 May 2022 09:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7QoAexJnCtYzwZ0WeLg3cAwNHVz7c0ALx0AyO85RDwY=;
 b=axX99n9UaBUGYwjGuhs64hgo+EMDyGgXb/UXVyxlmt5TkFegHoz0c++agVG8sEdGE3
 IxmiAwwv9LCoaaorppwuhk6gGwsYVJLCg1AmE3LPg/r8TpzKcJVxodKcJJF1Bq1PTBm7
 vT2ISxaPCee8LI7i9XetRNsHmKVrHz4SXgxAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7QoAexJnCtYzwZ0WeLg3cAwNHVz7c0ALx0AyO85RDwY=;
 b=uEpItc6SCc+PgLJ3y0QDKQt0B+v7AIGgHeEISOpe8ZU+wp3a4mYSB28phA5Zsn7kWj
 S4syrkztuwAJt/wcbmzE4rk8o2VfU2BkFFpaN3qxn7wbYB7ofsGPZaLf0R9oCb1hoWNf
 6tyLGMjt9CXQ1lSDnxn5OYj5B8ExeiflNMalIoQFm+sm4H+Ay5/LKxs50j5c326Xh5VE
 vwnol+ZNN6SUiKJj0AwY315LwTF9AgJ7O7EPs5nccosQ4l6O2S4n2g2lXe5k9WKRPHui
 QwrC4HexzByxA0px1MO417jFE7cTe9CACnk3F3AkKgv4Zv8O5bxHTiugt5SbNyEK60z9
 Gesw==
X-Gm-Message-State: AOAM530FrtV6mawWKDQBrKuhfMlX7H6qTPKQtKNkLnoRtoR+b+WRBg4h
 8eKbu1n7KXxT0HGROvbxlkn5aQ==
X-Google-Smtp-Source: ABdhPJyG2+V1BgZCSdIYstdav2b+PSpQ43NCbwYeqBLM5g0h1a0/SSPivJC8cxdxHjCGWUE3wg4Q8g==
X-Received: by 2002:a17:907:2cc2:b0:6f3:7657:7eb3 with SMTP id
 hg2-20020a1709072cc200b006f376577eb3mr21975332ejc.403.1651682877568; 
 Wed, 04 May 2022 09:47:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 gv8-20020a1709072bc800b006f3ef214e5csm5895992ejc.194.2022.05.04.09.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 09:47:57 -0700 (PDT)
Date: Wed, 4 May 2022 18:47:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH 1/2] Revert "drm/amdgpu: disable runpm if we are the
 primary adapter"
Message-ID: <YnKuO+QDhNdp6qBv@phenom.ffwll.local>
References: <20220504134833.1672728-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504134833.1672728-1-alexander.deucher@amd.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, May 04, 2022 at 09:48:32AM -0400, Alex Deucher wrote:
> This reverts commit b95dc06af3e683d6b7ddbbae178b2b2a21ee8b2b.
> 
> This workaround is no longer necessary.  We have a better workaround
> in commit f95af4a9236695 ("drm/amdgpu: don't runtime suspend if there are displays attached (v3)").

I looked at this patch here quickly, and you still have a bit a design
issue. The trouble is that this is a pretty nasty locking inversion
compared to any other drivers, because you check modeset locks within
runtime pm callbacks.

The way this is meant to work with atomic is that in your atomic commit
you grab/drop runtime pm references as needed (simple for pci devices, but
the arm-soc have a rpm domain pretty much per plane/crtc/encoder
sometimes), in conjunction with drm_atomic_helper_commit_tail_rpm - if
you're using the default commit functions at least, so that ordering is
correct. Which doesn't apply to amdgpu.

I think in general it's a antipattern to check whether you're in use in
your suspend callback - it's gone boom wrt locking in a few places and
also once you reject I think there's nothing really that tries again. The
autosuspend (if enabled) only kicks in when the refcount drops to zero.

Anyway nothing terrible, just more work to do here I guess, it's good to
drop the earlier approaches still.

On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 28 -------------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  6 ------
>  3 files changed, 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index d557f4db2565..682ec660f2c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -981,7 +981,6 @@ struct amdgpu_device {
>  	bool                            runpm;
>  	bool                            in_runpm;
>  	bool                            has_pr3;
> -	bool                            is_fw_fb;
>  
>  	bool                            pm_sysfs_en;
>  	bool                            ucode_sysfs_en;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index ebd37fb19cdb..3c198b2a86db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -38,7 +38,6 @@
>  #include <linux/mmu_notifier.h>
>  #include <linux/suspend.h>
>  #include <linux/cc_platform.h>
> -#include <linux/fb.h>
>  
>  #include "amdgpu.h"
>  #include "amdgpu_irq.h"
> @@ -1950,26 +1949,6 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
>  
>  static const struct drm_driver amdgpu_kms_driver;
>  
> -static bool amdgpu_is_fw_framebuffer(resource_size_t base,
> -				     resource_size_t size)
> -{
> -	bool found = false;
> -#if IS_REACHABLE(CONFIG_FB)
> -	struct apertures_struct *a;
> -
> -	a = alloc_apertures(1);
> -	if (!a)
> -		return false;
> -
> -	a->ranges[0].base = base;
> -	a->ranges[0].size = size;
> -
> -	found = is_firmware_framebuffer(a);
> -	kfree(a);
> -#endif
> -	return found;
> -}
> -
>  static void amdgpu_get_secondary_funcs(struct amdgpu_device *adev)
>  {
>  	struct pci_dev *p = NULL;
> @@ -2000,8 +1979,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	unsigned long flags = ent->driver_data;
>  	int ret, retry = 0, i;
>  	bool supports_atomic = false;
> -	bool is_fw_fb;
> -	resource_size_t base, size;
>  
>  	/* skip devices which are owned by radeon */
>  	for (i = 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
> @@ -2068,10 +2045,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	}
>  #endif
>  
> -	base = pci_resource_start(pdev, 0);
> -	size = pci_resource_len(pdev, 0);
> -	is_fw_fb = amdgpu_is_fw_framebuffer(base, size);
> -
>  	/* Get rid of things like offb */
>  	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &amdgpu_kms_driver);
>  	if (ret)
> @@ -2084,7 +2057,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>  	adev->dev  = &pdev->dev;
>  	adev->pdev = pdev;
>  	ddev = adev_to_drm(adev);
> -	adev->is_fw_fb = is_fw_fb;
>  
>  	if (!supports_atomic)
>  		ddev->driver_features &= ~DRIVER_ATOMIC;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 51bb977154eb..497478f8a5d3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -185,12 +185,6 @@ int amdgpu_driver_load_kms(struct amdgpu_device *adev, unsigned long flags)
>  			adev->runpm = true;
>  			break;
>  		}
> -		/* XXX: disable runtime pm if we are the primary adapter
> -		 * to avoid displays being re-enabled after DPMS.
> -		 * This needs to be sorted out and fixed properly.
> -		 */
> -		if (adev->is_fw_fb)
> -			adev->runpm = false;
>  
>  		amdgpu_runtime_pm_quirk(adev);
>  
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

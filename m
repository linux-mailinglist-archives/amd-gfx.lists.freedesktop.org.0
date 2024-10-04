Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012D7992C96
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2024 15:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986AA10E345;
	Mon,  7 Oct 2024 13:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="YFV4lxKL";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 337 seconds by postgrey-1.36 at gabe;
 Fri, 04 Oct 2024 09:07:46 UTC
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com
 [95.215.58.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A170A10E9BF
 for <amd-gfx@lists.freedesktop.org>; Fri,  4 Oct 2024 09:07:46 +0000 (UTC)
Message-ID: <41c46ac0-23e5-4566-8808-f0ad84a58ca0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1728032527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/q7TCKWkBRa2jleMeAwpZZBWHheD5FpO/n7jqw+l1m0=;
 b=YFV4lxKLCDKae389/8VdPDsh8vRn+pLK9YtOk17Z2dP5w1db+xISdDxHgXFQkfpjM17hVs
 hQqv9zsx6atEPCZJDZuavDaQUhsvZ1h5oLKEJyzKQkQxuTU+ARCdX39GXq1fy2BmznpBb8
 qQkaXngwVnTofn1S0sSBOXvuSssONo8=
Date: Fri, 4 Oct 2024 17:01:55 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 08/28] drm/loongson: Use video aperture helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240930130921.689876-1-tzimmermann@suse.de>
 <20240930130921.689876-9-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240930130921.689876-9-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 07 Oct 2024 13:06:21 +0000
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

On 2024/9/30 21:03, Thomas Zimmermann wrote:
> DRM's aperture functions have long been implemented as helpers
> under drivers/video/ for use with fbdev. Avoid the DRM wrappers by
> calling the video functions directly.


Okay!

Sometimes the aperture_remove_conflicting_devices() is more easier
to use, as it doesn't need direct reference to the struct drm_driver.

The third argument of aperture_remove_conflicting_devices() does not
get used, so we can actually pass a casual string.


> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   drivers/gpu/drm/loongson/lsdc_drv.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
> index a19dce35c839..b350bdcf1645 100644
> --- a/drivers/gpu/drm/loongson/lsdc_drv.c
> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
> @@ -3,10 +3,10 @@
>    * Copyright (C) 2023 Loongson Technology Corporation Limited
>    */
>   
> +#include <linux/aperture.h>
>   #include <linux/pci.h>
>   #include <linux/vgaarb.h>
>   
> -#include <drm/drm_aperture.h>
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_client_setup.h>
> @@ -215,9 +215,9 @@ lsdc_create_device(struct pci_dev *pdev,
>   		return ERR_PTR(ret);
>   	}
>   
> -	ret = drm_aperture_remove_conflicting_framebuffers(ldev->vram_base,
> -							   ldev->vram_size,
> -							   driver);
> +	ret = aperture_remove_conflicting_devices(ldev->vram_base,
> +						  ldev->vram_size,
> +						  driver->name);
>   	if (ret) {
>   		drm_err(ddev, "Remove firmware framebuffers failed: %d\n", ret);
>   		return ERR_PTR(ret);

-- 
Best regards,
Sui


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5492D72A5
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Dec 2020 10:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781B6ECDE;
	Fri, 11 Dec 2020 09:09:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03A856ECDE
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Dec 2020 09:09:58 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id b9so11365563ejy.0
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Dec 2020 01:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LFT8zj/RBxVU1oV9tYOccJwjkYSdSqU2n3Lg20rXSq4=;
 b=tu9qZ8Rx0lAX/4mCK032JO99Qd4hKRbuR3kyIbya6D4XFlIl4AXW1u45Y8HuUbQfsh
 H38gIn52Q43h1BLWaYaTe0P+sAL0qFCF7mOmTXNsgXpc4+v5IS3iyLaEWZyfWsd2UIh/
 8Q9rInf6O2QXbw1ukqy9tM6uNaMtrOF8BMAhSGdq2o8zfsh28orlK8TNAk2YESblLloL
 6WVNfP6sNeYRdHIIHbdpVM8dDtVrWqJumSk+OZ1wpwGaa39Mvxh92UQuauZO5d3JLNmv
 8KjksK6sct+lYFoKzDuherfm1D5BaMwj2qYeSvqoMVM+byZDyU3upF9VtXs4RGRuLWXa
 2C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LFT8zj/RBxVU1oV9tYOccJwjkYSdSqU2n3Lg20rXSq4=;
 b=VYG4K0hAVr9HATR/Ywir3YiPoFrEvCEBZ1ieeem66++N4rxjqlRVALqTYC6KywJVCG
 UM3uvTKcIqawUkoSlB2ifr+1VRFom7HRwYUntHMRioCBVAZmsZZ4D9pHaWuPa79zk032
 Eky10Mmx2oHe8d73FSA+KHbuOxn6/1TfDpynjuw92mtKgXPGoJEG++moQbi0I1KBb0xn
 EBaDT22nZkRFY6b/Fonqv9LBELOLjT4col8WchPSHKdmyIjtVqnRX7Rmb3Ub92FjOEqp
 +BwMu1a5sthHV28by3b3bw8wlmZwNnaTtKe8kxOrrMO79nhl/Nw9Gao0GJoYl1iA6F4c
 3c6g==
X-Gm-Message-State: AOAM532eMDEsrt+wnnMagK3sfHnUdjVl5JQ0kNZ9F4lkZ5+T3SJ4kN0v
 Ia5uIksNDFy/mSODHWleZ2eCy6IAc2s=
X-Google-Smtp-Source: ABdhPJyf+OrgsZqgUD9FItK06I133lGjk1zpA0CVvvhGt6zKnkBxiZyF5DMExLxsExbH8GOrjownxA==
X-Received: by 2002:a17:907:9627:: with SMTP id
 gb39mr10127709ejc.267.1607677796539; 
 Fri, 11 Dec 2020 01:09:56 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id p24sm4418711edr.65.2020.12.11.01.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Dec 2020 01:09:56 -0800 (PST)
Subject: Re: [PATCH 4/7] amdgpu: module option controlling whether BAR0
 resizing is done
To: Darren Salt <devspam@moreofthesa.me.uk>, amd-gfx@lists.freedesktop.org
References: <20201211005506.4554-1-devspam@moreofthesa.me.uk>
 <20201211005506.4554-5-devspam@moreofthesa.me.uk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c6695ed1-31bf-29eb-1787-300824bd0707@gmail.com>
Date: Fri, 11 Dec 2020 10:09:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201211005506.4554-5-devspam@moreofthesa.me.uk>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

NAK, that is exactly what we are trying to avoid.

Am 11.12.20 um 01:55 schrieb Darren Salt:
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 9 +++++++++
>   3 files changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index c228e7470d51..2efce7fa6a4b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -201,6 +201,7 @@ static const bool __maybe_unused no_system_mem_limit;
>   
>   extern int amdgpu_tmz;
>   extern int amdgpu_reset_method;
> +extern bool amdgpu_resize_bar;
>   
>   #ifdef CONFIG_DRM_AMDGPU_SI
>   extern int amdgpu_si_support;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 1e99ca62a4d2..292796e9f83d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1115,6 +1115,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>   	int r;
>   	bool nospc = false;
>   
> +	if (!amdgpu_resize_bar)
> +		return 0;
> +
>   	/* Bypass for VF */
>   	if (amdgpu_sriov_vf(adev))
>   		return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index cac2724e7615..6df33df74775 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -161,6 +161,7 @@ int amdgpu_force_asic_type = -1;
>   int amdgpu_tmz;
>   int amdgpu_reset_method = -1; /* auto */
>   int amdgpu_num_kcq = -1;
> +bool amdgpu_resize_bar = true;
>   
>   struct amdgpu_mgpu_info mgpu_info = {
>   	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
> @@ -807,6 +808,14 @@ module_param_named(bad_page_threshold, amdgpu_bad_page_threshold, int, 0444);
>   MODULE_PARM_DESC(num_kcq, "number of kernel compute queue user want to setup (8 if set to greater than 8 or less than 0, only affect gfx 8+)");
>   module_param_named(num_kcq, amdgpu_num_kcq, int, 0444);
>   
> +/**
> + * DOC: resize_bar (bool)
> + * Control whether FB BAR should be resized.
> + * Enabled by default.
> + */
> +module_param_named(resize_bar, amdgpu_resize_bar, bool, 0444);
> +MODULE_PARM_DESC(resize_bar, "Controls whether the FB BAR should be resized (default = true).");
> +
>   static const struct pci_device_id pciidlist[] = {
>   #ifdef  CONFIG_DRM_AMDGPU_SI
>   	{0x1002, 0x6780, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TAHITI},

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

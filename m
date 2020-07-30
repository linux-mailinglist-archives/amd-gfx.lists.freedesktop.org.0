Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D0C233068
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Jul 2020 12:31:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA6B6E8CB;
	Thu, 30 Jul 2020 10:31:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106E6E8CB
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jul 2020 10:31:01 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id qc22so12648229ejb.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Jul 2020 03:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zQ+731pPNIQ2Qi9W6e/jdQ44NzsunfECvwEYIRDQkA4=;
 b=S6qGTYM8P8l/nGUqBuJMFK0zENOMnYQVvwKXzpicz8swNuSzkv5ReAtiHhiWHMMhEI
 ro543/CR34y9X1aBcLLQtqWRwPrWGz/v3T1cd4TLLzKO5sE7A0/rl3f6w5rDiDIUSzUY
 ArP+0C9Z4b7PDjINSVchVSGhVb8sjFnphUumja82hKoOeD092COItaMVS3aiJ2QK9Vnt
 qBG2O/Wp7LK4cDt7YYrVgcouzspXTN+DqXAjEXNt9o1SM4JM8zwjZzeaWp9t0TRu/Fgg
 DEO0GfAD/r398p6QD6EMvSdWOLIyEx/JlPOOKDX9RZ4lZ6iysyLx4Uv1XRZ77Sh8eOjM
 ui5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zQ+731pPNIQ2Qi9W6e/jdQ44NzsunfECvwEYIRDQkA4=;
 b=mgXFUIEbNcQoVkrjWGea9/0cxboEXBAKbW3709KOltKURTSyFjntURmFaMrN7YcpQI
 t9XXqwnFnN4fQphoED/4aqqWXG8XTRwzH5OT8m5mLb7rXZTTEYnnN+49dbGdCyazOyb2
 eLVoFBX2JDKQxNaVzuDgi9SUgdKrtAm+n/6GrqqYjWg+UcdZe7QHzmBw8GxiZBbYNK0P
 E7CU9qARcx8q8m8fnnhR0MTff0HKElpChzmbdQyfXaI1l09lOQM3oC8/7mNSzMtaQwb2
 TZPBFEz67xhNQoHsZDZ6sKjs20jPFw1jQO7OjlTucVJsfBo5v+wJ9rcSepjmCcTZsvHH
 2rwg==
X-Gm-Message-State: AOAM531MnUWVyf0AwAH41aFL1lZpBLs2Osv2nsrPagoO/gsaDgm0fgtp
 bxGE9neatYRnnEegEtdrft8wBGcN
X-Google-Smtp-Source: ABdhPJwae8YYnTYk7LujS8SQTLaPmdK4hb1JuHmKy9ZqEehxBLTU3v2448tuq5TvISkQU9r4nLY2qA==
X-Received: by 2002:a17:906:694b:: with SMTP id
 c11mr1868630ejs.232.1596105060340; 
 Thu, 30 Jul 2020 03:31:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s16sm5202055ejr.31.2020.07.30.03.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 03:30:59 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: new ids flag for tmz
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20200730102500.23479-1-pierre-eric.pelloux-prayer@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b3a50466-04e1-29ef-b0f2-90d26a282805@gmail.com>
Date: Thu, 30 Jul 2020 12:30:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730102500.23479-1-pierre-eric.pelloux-prayer@amd.com>
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

Am 30.07.20 um 12:25 schrieb Pierre-Eric Pelloux-Prayer:
> Allows UMD to know if TMZ is supported and enabled.
> This commit also bumps KMS_DRIVER_MINOR so UMD knows if it can rely on
> AMDGPU_IDS_FLAGS_TMZ.
> ---
> Patch for using it in Mesa is at https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6049
> (ac/gpu_info: add detection of TMZ support).
>
> Pierre-Eric
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 ++
>   include/uapi/drm/amdgpu_drm.h           | 1 +
>   3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 6291f5f0d223..6dcab25914cf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -88,9 +88,10 @@
>    * - 3.37.0 - L2 is invalidated before SDMA IBs, needed for correctness
>    * - 3.38.0 - Add AMDGPU_IB_FLAG_EMIT_MEM_SYNC
>    * - 3.39.0 - DMABUF implicit sync does a full pipeline sync
> + * - 3.40.0 - Add AMDGPU_IDS_FLAGS_TMZ
>    */
>   #define KMS_DRIVER_MAJOR	3
> -#define KMS_DRIVER_MINOR	39
> +#define KMS_DRIVER_MINOR	40

I don't think we need this. Unused ids_flags should be zero on older 
kernels.

That's why we have this in the first place.

Christian.

>   #define KMS_DRIVER_PATCHLEVEL	0
>   
>   int amdgpu_vram_limit = 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index eebbe2103e32..d92ee30bc06c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -736,6 +736,8 @@ static int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file
>   			dev_info.ids_flags |= AMDGPU_IDS_FLAGS_FUSION;
>   		if (amdgpu_mcbp || amdgpu_sriov_vf(adev))
>   			dev_info.ids_flags |= AMDGPU_IDS_FLAGS_PREEMPTION;
> +		if (adev->gmc.tmz_enabled)
> +			dev_info.ids_flags |= AMDGPU_IDS_FLAGS_TMZ;
>   
>   		vm_size = adev->vm_manager.max_pfn * AMDGPU_GPU_PAGE_SIZE;
>   		vm_size -= AMDGPU_VA_RESERVED_SIZE;
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 765a94ec4420..b826f2d6efe1 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -676,6 +676,7 @@ struct drm_amdgpu_cs_chunk_data {
>    */
>   #define AMDGPU_IDS_FLAGS_FUSION         0x1
>   #define AMDGPU_IDS_FLAGS_PREEMPTION     0x2
> +#define AMDGPU_IDS_FLAGS_TMZ            0x4
>   
>   /* indicate if acceleration can be working */
>   #define AMDGPU_INFO_ACCEL_WORKING		0x00

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

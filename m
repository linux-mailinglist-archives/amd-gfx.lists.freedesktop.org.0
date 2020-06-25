Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF1209B38
	for <lists+amd-gfx@lfdr.de>; Thu, 25 Jun 2020 10:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445696E528;
	Thu, 25 Jun 2020 08:19:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C496E528
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2020 08:19:42 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 22so4662794wmg.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 25 Jun 2020 01:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=l5vtR4M/Qq8VT4pI6NlzQC3kOCk4EU9ukfxTL0YOm5U=;
 b=QEvUjD0ka0UTz5krMTgGuPOowxQ8HSAk8BXMoZNoKhOfgm+BW5B8Fd/NDQJSTj0L9Z
 FP0h/Aw5s2Wk35OXScdogFPe8F080Ywn3ZLX9F0ckKCNq361672X2dduBXCoTohg6/vk
 SOJ0pXcEvieatujccPq7poDww6V+mQW6AUZvoBX+Dd/iOt0sGdRg9NC/Bj1vPYbzzGUB
 B0KFgrxSo1CH3qdr89AcG6iQu4l9PO07FIkFIow0FTc6ABOyx2IkRCa0kA8vck+detgk
 e415aIFSbGIIcygxsjWwKdw0/amkNSK/8t9lwNnvtlKgattQLyfbda1gCdjBcX1leAhO
 lvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=l5vtR4M/Qq8VT4pI6NlzQC3kOCk4EU9ukfxTL0YOm5U=;
 b=hXSzaDm+LWQvKcF2Zp0uDZyqtRI1p5yDqmIM3G0HjUEzteRInJFq1arAypnZL/Qj3w
 zN218h4kdw9jJADybTCIqfyPklT/b0JXotVYOHAwR1QoJsRtMnHRBimSNmE/1ttQETPs
 0Gng5fp89dXN6ruMo8khAmfQaI8jLqYiy7Dbn8mCWdZvkIqSH9Q6Xk0+Y0xXTuO54tTc
 mHoTiCv3xuDkj/ldnsjKW10UodlK1tNGH0gOvzhERMX5OVFrVZESZaGJkj/1v2Zlg0Ep
 zY6AenS1RMmkPGGRb1GM0zCL+ORlno4uzutp7utgrZj/KEbnZwjT7Mmb1snrYY3YPDYP
 kV+Q==
X-Gm-Message-State: AOAM533ssJa8BoUGabo/bxmcX84GJuGD59S1p1WNPSeBVWLe5+nbZP/U
 jqrF59gV2DOA47ssWgn0yHvIz+jj
X-Google-Smtp-Source: ABdhPJwruIyCoQ7cloj9lKb1dFqG0gpZPz3hbdF2Zk5vLfkh5zBNOfCvnqJlXkhNqXug+05QXK3iYg==
X-Received: by 2002:a1c:9896:: with SMTP id a144mr2014448wme.75.1593073180585; 
 Thu, 25 Jun 2020 01:19:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d13sm15923929wrn.61.2020.06.25.01.19.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jun 2020 01:19:40 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: Let KFD use more VMIDs on Arcturus
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200625031834.16122-1-Felix.Kuehling@amd.com>
 <20200625031834.16122-2-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <48a11576-b734-7525-dc39-c4aef67d5d35@gmail.com>
Date: Thu, 25 Jun 2020 10:19:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200625031834.16122-2-Felix.Kuehling@amd.com>
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

Am 25.06.20 um 05:18 schrieb Felix Kuehling:
> When there is no graphics support, KFD can use more of the VMIDs. Graphics
> VMIDs are only used for video decoding/encoding and post processing. With
> two VCE engines, there is no reason to reserve more than 2 VMIDs for that.

IIRC the expectation is that we still use the compute queues for post 
processing and not the KFD.

So we will need at least VMIDs for that as well.

>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 6e10b42c57e5..3470929e5b8e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1245,10 +1245,15 @@ static int gmc_v9_0_sw_init(void *handle)
>   	/*
>   	 * number of VMs
>   	 * VMID 0 is reserved for System
> -	 * amdgpu graphics/compute will use VMIDs 1-7
> -	 * amdkfd will use VMIDs 8-15
> +	 * amdgpu graphics/compute will use VMIDs 1..n-1
> +	 * amdkfd will use VMIDs n..15
> +	 *
> +	 * The first KFD VMID is 8 for GPUs with graphics, 3 for
> +	 * compute-only GPUs. On compute-only GPUs that leaves 2 VMIDs
> +	 * for video processing.
>   	 */
> -	adev->vm_manager.first_kfd_vmid = 8;
> +	adev->vm_manager.first_kfd_vmid =
> +		adev->asic_type == CHIP_ARCTURUS ? 3 : 8;
>   
>   	amdgpu_vm_manager_init(adev);
>   

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

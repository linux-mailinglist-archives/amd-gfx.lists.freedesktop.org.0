Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E720236C87E
	for <lists+amd-gfx@lfdr.de>; Tue, 27 Apr 2021 17:16:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFFC6E25B;
	Tue, 27 Apr 2021 15:16:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7B36E25B
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Apr 2021 15:16:40 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c22so6746434edn.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 27 Apr 2021 08:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Wrs1YqETT9kPr16Z8FsRNF0drzM3OetXksgVa7Q5B+I=;
 b=WQWZjSu25cZF4C4u2/wItNopoFy6l3taSAhaL0qjV15cFmg8/2AaEiN0aAAF8wnGRt
 HC2A1i7JHDZjVhYYNWpQytZPBjQW4if2epaiCTeJauZLiDAE9oqweg+FUVBbwutikkZw
 9SAyiyxFoKD8/kSeJmXZJejgMDgRNX6PqPJ1I6GlhyKYcNTkSREtWR7F0c669bZDh2RP
 c4oGP5xAsdnp/Uq4l/pj75VsY3jGVQ1f9tlipO44IZuVf2DW2jcNee8MLPu03hY8eQHF
 TC/rIKh91QfiK3U8GCfMv6LrmdZIQbizlYpvbifMhA7dhTZePdHrt0t2bUvAFbr3GERg
 kitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Wrs1YqETT9kPr16Z8FsRNF0drzM3OetXksgVa7Q5B+I=;
 b=Z1EJRDgPUHfd6Dfcq7ZMYSAQleGbPNceryH4dhaIQP5V+HA+bbY9ixgXN3hQ2sCS+I
 kiiqNEEuIzR1LpIQaYw1eWBtg1IRrcvjqpRqmwZucsrlNafx6HsEgxEU6/yMakvgBAOW
 3Z7SQGesumgq0h26s7MDE+HriwGuCXeuGczCZUaqeqs/uHlXvdECBPQsDwtCLfdqnmrv
 +Cv3sODqI3ri8rwj1yE1k3jZM/gBEuOcoLGxeJgU4FMNzafi2zNHQJIXd9N5/73jASs7
 KcB/LD2X6D+/w90KcbngmpyJzfo33CAt+f3ALBZkEoSNDkao7MzWX6x/S2uVZWZ2VBh9
 4eYw==
X-Gm-Message-State: AOAM532ekjH+TrJd4bRjlMDSdDm3siJytYVdDglCs4jeS9JvORfp1des
 DcNrev265wXNqpm1v9GL0KxXI9KbGLU=
X-Google-Smtp-Source: ABdhPJzRDtrO/g/XBqj8cS5dN8k8jAEREUa378Ft06XYZDkKDDu7aJtHzxDUTLbOCP3KzY+BS6hnjg==
X-Received: by 2002:a50:fd07:: with SMTP id i7mr4980094eds.92.1619536599185;
 Tue, 27 Apr 2021 08:16:39 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5565:6656:893b:2618?
 ([2a02:908:1252:fb60:5565:6656:893b:2618])
 by smtp.gmail.com with ESMTPSA id s8sm2795086edj.25.2021.04.27.08.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 08:16:38 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix no full coverage issue for gprs
 initialization
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Li, Dennis" <Dennis.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20210427143756.8628-1-Dennis.Li@amd.com>
 <BN9PR12MB53682204CA3E3B9AC63FD72FFC419@BN9PR12MB5368.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b12f3f8b-c92f-ee57-4c07-2554db1f3598@gmail.com>
Date: Tue, 27 Apr 2021 17:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BN9PR12MB53682204CA3E3B9AC63FD72FFC419@BN9PR12MB5368.namprd12.prod.outlook.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is only done during bootup, isn't it?

Wouldn't it be better to use the normal IB pool instead of the direct 
one? Or do we also need to do this during GPU reset?

Regards,
Christian.

Am 27.04.21 um 16:55 schrieb Zhang, Hawking:
> [AMD Public Use]
>
> Please split the following into another patch when you commit the one. Other than that, the patch is
>
> Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
>
> Regards,
> Hawking
>
> @@ -479,8 +710,6 @@ void gfx_v9_4_2_init_golden_registers(struct amdgpu_device *adev,
>   			 die_id);
>   		break;
>   	}
> -
> -	return;
>   }
>
> -----Original Message-----
> From: Dennis Li <Dennis.Li@amd.com>
> Sent: Tuesday, April 27, 2021 22:38
> To: amd-gfx@lists.freedesktop.org; Deucher, Alexander <Alexander.Deucher@amd.com>; Kuehling, Felix <Felix.Kuehling@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
> Cc: Li, Dennis <Dennis.Li@amd.com>
> Subject: [PATCH] drm/amdgpu: fix no full coverage issue for gprs initialization
>
> The number of waves is changed to 8, so it is impossible to use old solution to cover all sgprs.
>
> Signed-off-by: Dennis Li <Dennis.Li@amd.com>
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> index a2fe2dac32c1..2e6789a7dc46 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> @@ -328,7 +328,7 @@ int amdgpu_ib_pool_init(struct amdgpu_device *adev)
>   
>   	for (i = 0; i < AMDGPU_IB_POOL_MAX; i++) {
>   		if (i == AMDGPU_IB_POOL_DIRECT)
> -			size = PAGE_SIZE * 2;
> +			size = PAGE_SIZE * 6;
>   		else
>   			size = AMDGPU_IB_POOL_SIZE;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> index d17e57dea178..77948c033c45 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_4_2.c
> @@ -32,6 +32,11 @@
>   #include "amdgpu_ras.h"
>   #include "amdgpu_gfx.h"
>   
> +#define SE_ID_MAX 8
> +#define CU_ID_MAX 16
> +#define SIMD_ID_MAX 4
> +#define WAVE_ID_MAX 10
> +
>   enum gfx_v9_4_2_utc_type {
>   	VML2_MEM,
>   	VML2_WALKER_MEM,
> @@ -81,100 +86,100 @@ static const struct soc15_reg_golden golden_settings_gc_9_4_2_alde[] = {  };
>   
>   static const u32 vgpr_init_compute_shader_aldebaran[] = {
> -	0xb8840904, 0xb8851a04, 0xb8861344, 0x9207c006, 0x92088405, 0x81070807,
> -	0x81070407, 0x8e078207, 0xbe88008f, 0xc0410200, 0x00000007, 0xd3d94000,
> -	0x18000080, 0xd3d94001, 0x18000080, 0xd3d94002, 0x18000080, 0xd3d94003,
> -	0x18000080, 0xd3d94004, 0x18000080, 0xd3d94005, 0x18000080, 0xd3d94006,
> -	0x18000080, 0xd3d94007, 0x18000080, 0xd3d94008, 0x18000080, 0xd3d94009,
> -	0x18000080, 0xd3d9400a, 0x18000080, 0xd3d9400b, 0x18000080, 0xd3d9400c,
> -	0x18000080, 0xd3d9400d, 0x18000080, 0xd3d9400e, 0x18000080, 0xd3d9400f,
> -	0x18000080, 0xd3d94010, 0x18000080, 0xd3d94011, 0x18000080, 0xd3d94012,
> -	0x18000080, 0xd3d94013, 0x18000080, 0xd3d94014, 0x18000080, 0xd3d94015,
> -	0x18000080, 0xd3d94016, 0x18000080, 0xd3d94017, 0x18000080, 0xd3d94018,
> -	0x18000080, 0xd3d94019, 0x18000080, 0xd3d9401a, 0x18000080, 0xd3d9401b,
> -	0x18000080, 0xd3d9401c, 0x18000080, 0xd3d9401d, 0x18000080, 0xd3d9401e,
> -	0x18000080, 0xd3d9401f, 0x18000080, 0xd3d94020, 0x18000080, 0xd3d94021,
> -	0x18000080, 0xd3d94022, 0x18000080, 0xd3d94023, 0x18000080, 0xd3d94024,
> -	0x18000080, 0xd3d94025, 0x18000080, 0xd3d94026, 0x18000080, 0xd3d94027,
> -	0x18000080, 0xd3d94028, 0x18000080, 0xd3d94029, 0x18000080, 0xd3d9402a,
> -	0x18000080, 0xd3d9402b, 0x18000080, 0xd3d9402c, 0x18000080, 0xd3d9402d,
> -	0x18000080, 0xd3d9402e, 0x18000080, 0xd3d9402f, 0x18000080, 0xd3d94030,
> -	0x18000080, 0xd3d94031, 0x18000080, 0xd3d94032, 0x18000080, 0xd3d94033,
> -	0x18000080, 0xd3d94034, 0x18000080, 0xd3d94035, 0x18000080, 0xd3d94036,
> -	0x18000080, 0xd3d94037, 0x18000080, 0xd3d94038, 0x18000080, 0xd3d94039,
> -	0x18000080, 0xd3d9403a, 0x18000080, 0xd3d9403b, 0x18000080, 0xd3d9403c,
> -	0x18000080, 0xd3d9403d, 0x18000080, 0xd3d9403e, 0x18000080, 0xd3d9403f,
> -	0x18000080, 0xd3d94040, 0x18000080, 0xd3d94041, 0x18000080, 0xd3d94042,
> -	0x18000080, 0xd3d94043, 0x18000080, 0xd3d94044, 0x18000080, 0xd3d94045,
> -	0x18000080, 0xd3d94046, 0x18000080, 0xd3d94047, 0x18000080, 0xd3d94048,
> -	0x18000080, 0xd3d94049, 0x18000080, 0xd3d9404a, 0x18000080, 0xd3d9404b,
> -	0x18000080, 0xd3d9404c, 0x18000080, 0xd3d9404d, 0x18000080, 0xd3d9404e,
> -	0x18000080, 0xd3d9404f, 0x18000080, 0xd3d94050, 0x18000080, 0xd3d94051,
> -	0x18000080, 0xd3d94052, 0x18000080, 0xd3d94053, 0x18000080, 0xd3d94054,
> -	0x18000080, 0xd3d94055, 0x18000080, 0xd3d94056, 0x18000080, 0xd3d94057,
> -	0x18000080, 0xd3d94058, 0x18000080, 0xd3d94059, 0x18000080, 0xd3d9405a,
> -	0x18000080, 0xd3d9405b, 0x18000080, 0xd3d9405c, 0x18000080, 0xd3d9405d,
> -	0x18000080, 0xd3d9405e, 0x18000080, 0xd3d9405f, 0x18000080, 0xd3d94060,
> -	0x18000080, 0xd3d94061, 0x18000080, 0xd3d94062, 0x18000080, 0xd3d94063,
> -	0x18000080, 0xd3d94064, 0x18000080, 0xd3d94065, 0x18000080, 0xd3d94066,
> -	0x18000080, 0xd3d94067, 0x18000080, 0xd3d94068, 0x18000080, 0xd3d94069,
> -	0x18000080, 0xd3d9406a, 0x18000080, 0xd3d9406b, 0x18000080, 0xd3d9406c,
> -	0x18000080, 0xd3d9406d, 0x18000080, 0xd3d9406e, 0x18000080, 0xd3d9406f,
> -	0x18000080, 0xd3d94070, 0x18000080, 0xd3d94071, 0x18000080, 0xd3d94072,
> -	0x18000080, 0xd3d94073, 0x18000080, 0xd3d94074, 0x18000080, 0xd3d94075,
> -	0x18000080, 0xd3d94076, 0x18000080, 0xd3d94077, 0x18000080, 0xd3d94078,
> -	0x18000080, 0xd3d94079, 0x18000080, 0xd3d9407a, 0x18000080, 0xd3d9407b,
> -	0x18000080, 0xd3d9407c, 0x18000080, 0xd3d9407d, 0x18000080, 0xd3d9407e,
> -	0x18000080, 0xd3d9407f, 0x18000080, 0xd3d94080, 0x18000080, 0xd3d94081,
> -	0x18000080, 0xd3d94082, 0x18000080, 0xd3d94083, 0x18000080, 0xd3d94084,
> -	0x18000080, 0xd3d94085, 0x18000080, 0xd3d94086, 0x18000080, 0xd3d94087,
> -	0x18000080, 0xd3d94088, 0x18000080, 0xd3d94089, 0x18000080, 0xd3d9408a,
> -	0x18000080, 0xd3d9408b, 0x18000080, 0xd3d9408c, 0x18000080, 0xd3d9408d,
> -	0x18000080, 0xd3d9408e, 0x18000080, 0xd3d9408f, 0x18000080, 0xd3d94090,
> -	0x18000080, 0xd3d94091, 0x18000080, 0xd3d94092, 0x18000080, 0xd3d94093,
> -	0x18000080, 0xd3d94094, 0x18000080, 0xd3d94095, 0x18000080, 0xd3d94096,
> -	0x18000080, 0xd3d94097, 0x18000080, 0xd3d94098, 0x18000080, 0xd3d94099,
> -	0x18000080, 0xd3d9409a, 0x18000080, 0xd3d9409b, 0x18000080, 0xd3d9409c,
> -	0x18000080, 0xd3d9409d, 0x18000080, 0xd3d9409e, 0x18000080, 0xd3d9409f,
> -	0x18000080, 0xd3d940a0, 0x18000080, 0xd3d940a1, 0x18000080, 0xd3d940a2,
> -	0x18000080, 0xd3d940a3, 0x18000080, 0xd3d940a4, 0x18000080, 0xd3d940a5,
> -	0x18000080, 0xd3d940a6, 0x18000080, 0xd3d940a7, 0x18000080, 0xd3d940a8,
> -	0x18000080, 0xd3d940a9, 0x18000080, 0xd3d940aa, 0x18000080, 0xd3d940ab,
> -	0x18000080, 0xd3d940ac, 0x18000080, 0xd3d940ad, 0x18000080, 0xd3d940ae,
> -	0x18000080, 0xd3d940af, 0x18000080, 0xd3d940b0, 0x18000080, 0xd3d940b1,
> -	0x18000080, 0xd3d940b2, 0x18000080, 0xd3d940b3, 0x18000080, 0xd3d940b4,
> -	0x18000080, 0xd3d940b5, 0x18000080, 0xd3d940b6, 0x18000080, 0xd3d940b7,
> -	0x18000080, 0xd3d940b8, 0x18000080, 0xd3d940b9, 0x18000080, 0xd3d940ba,
> -	0x18000080, 0xd3d940bb, 0x18000080, 0xd3d940bc, 0x18000080, 0xd3d940bd,
> -	0x18000080, 0xd3d940be, 0x18000080, 0xd3d940bf, 0x18000080, 0xd3d940c0,
> -	0x18000080, 0xd3d940c1, 0x18000080, 0xd3d940c2, 0x18000080, 0xd3d940c3,
> -	0x18000080, 0xd3d940c4, 0x18000080, 0xd3d940c5, 0x18000080, 0xd3d940c6,
> -	0x18000080, 0xd3d940c7, 0x18000080, 0xd3d940c8, 0x18000080, 0xd3d940c9,
> -	0x18000080, 0xd3d940ca, 0x18000080, 0xd3d940cb, 0x18000080, 0xd3d940cc,
> -	0x18000080, 0xd3d940cd, 0x18000080, 0xd3d940ce, 0x18000080, 0xd3d940cf,
> -	0x18000080, 0xd3d940d0, 0x18000080, 0xd3d940d1, 0x18000080, 0xd3d940d2,
> -	0x18000080, 0xd3d940d3, 0x18000080, 0xd3d940d4, 0x18000080, 0xd3d940d5,
> -	0x18000080, 0xd3d940d6, 0x18000080, 0xd3d940d7, 0x18000080, 0xd3d940d8,
> -	0x18000080, 0xd3d940d9, 0x18000080, 0xd3d940da, 0x18000080, 0xd3d940db,
> -	0x18000080, 0xd3d940dc, 0x18000080, 0xd3d940dd, 0x18000080, 0xd3d940de,
> -	0x18000080, 0xd3d940df, 0x18000080, 0xd3d940e0, 0x18000080, 0xd3d940e1,
> -	0x18000080, 0xd3d940e2, 0x18000080, 0xd3d940e3, 0x18000080, 0xd3d940e4,
> -	0x18000080, 0xd3d940e5, 0x18000080, 0xd3d940e6, 0x18000080, 0xd3d940e7,
> -	0x18000080, 0xd3d940e8, 0x18000080, 0xd3d940e9, 0x18000080, 0xd3d940ea,
> -	0x18000080, 0xd3d940eb, 0x18000080, 0xd3d940ec, 0x18000080, 0xd3d940ed,
> -	0x18000080, 0xd3d940ee, 0x18000080, 0xd3d940ef, 0x18000080, 0xd3d940f0,
> -	0x18000080, 0xd3d940f1, 0x18000080, 0xd3d940f2, 0x18000080, 0xd3d940f3,
> -	0x18000080, 0xd3d940f4, 0x18000080, 0xd3d940f5, 0x18000080, 0xd3d940f6,
> -	0x18000080, 0xd3d940f7, 0x18000080, 0xd3d940f8, 0x18000080, 0xd3d940f9,
> -	0x18000080, 0xd3d940fa, 0x18000080, 0xd3d940fb, 0x18000080, 0xd3d940fc,
> -	0x18000080, 0xd3d940fd, 0x18000080, 0xd3d940fe, 0x18000080, 0xd3d940ff,
> -	0x18000080, 0xb07c0000, 0xbe8a00ff, 0x000000f8, 0xbf11080a, 0x7e000280,
> -	0x7e020280, 0x7e040280, 0x7e060280, 0x7e080280, 0x7e0a0280, 0x7e0c0280,
> -	0x7e0e0280, 0x808a880a, 0xbe80320a, 0xbf84fff5, 0xbf9c0000, 0xd28c0001,
> -	0x0001007f, 0xd28d0001, 0x0002027e, 0x10020288, 0xb88b0904, 0xb78b4000,
> -	0xd1196a01, 0x00001701, 0xbe8a0087, 0xbefc00c1, 0xd89c4000, 0x00020201,
> -	0xd89cc080, 0x00040401, 0x320202ff, 0x00000800, 0x808a810a, 0xbf84fff8,
> -	0xbf810000,
> +	0xb8840904, 0xb8851a04, 0xb8861344, 0xb8831804, 0x9208ff06, 0x00000280,
> +	0x9209a805, 0x920a8a04, 0x81080908, 0x81080a08, 0x81080308, 0x8e078208,
> +	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xd3d94000, 0x18000080,
> +	0xd3d94001, 0x18000080, 0xd3d94002, 0x18000080, 0xd3d94003, 0x18000080,
> +	0xd3d94004, 0x18000080, 0xd3d94005, 0x18000080, 0xd3d94006, 0x18000080,
> +	0xd3d94007, 0x18000080, 0xd3d94008, 0x18000080, 0xd3d94009, 0x18000080,
> +	0xd3d9400a, 0x18000080, 0xd3d9400b, 0x18000080, 0xd3d9400c, 0x18000080,
> +	0xd3d9400d, 0x18000080, 0xd3d9400e, 0x18000080, 0xd3d9400f, 0x18000080,
> +	0xd3d94010, 0x18000080, 0xd3d94011, 0x18000080, 0xd3d94012, 0x18000080,
> +	0xd3d94013, 0x18000080, 0xd3d94014, 0x18000080, 0xd3d94015, 0x18000080,
> +	0xd3d94016, 0x18000080, 0xd3d94017, 0x18000080, 0xd3d94018, 0x18000080,
> +	0xd3d94019, 0x18000080, 0xd3d9401a, 0x18000080, 0xd3d9401b, 0x18000080,
> +	0xd3d9401c, 0x18000080, 0xd3d9401d, 0x18000080, 0xd3d9401e, 0x18000080,
> +	0xd3d9401f, 0x18000080, 0xd3d94020, 0x18000080, 0xd3d94021, 0x18000080,
> +	0xd3d94022, 0x18000080, 0xd3d94023, 0x18000080, 0xd3d94024, 0x18000080,
> +	0xd3d94025, 0x18000080, 0xd3d94026, 0x18000080, 0xd3d94027, 0x18000080,
> +	0xd3d94028, 0x18000080, 0xd3d94029, 0x18000080, 0xd3d9402a, 0x18000080,
> +	0xd3d9402b, 0x18000080, 0xd3d9402c, 0x18000080, 0xd3d9402d, 0x18000080,
> +	0xd3d9402e, 0x18000080, 0xd3d9402f, 0x18000080, 0xd3d94030, 0x18000080,
> +	0xd3d94031, 0x18000080, 0xd3d94032, 0x18000080, 0xd3d94033, 0x18000080,
> +	0xd3d94034, 0x18000080, 0xd3d94035, 0x18000080, 0xd3d94036, 0x18000080,
> +	0xd3d94037, 0x18000080, 0xd3d94038, 0x18000080, 0xd3d94039, 0x18000080,
> +	0xd3d9403a, 0x18000080, 0xd3d9403b, 0x18000080, 0xd3d9403c, 0x18000080,
> +	0xd3d9403d, 0x18000080, 0xd3d9403e, 0x18000080, 0xd3d9403f, 0x18000080,
> +	0xd3d94040, 0x18000080, 0xd3d94041, 0x18000080, 0xd3d94042, 0x18000080,
> +	0xd3d94043, 0x18000080, 0xd3d94044, 0x18000080, 0xd3d94045, 0x18000080,
> +	0xd3d94046, 0x18000080, 0xd3d94047, 0x18000080, 0xd3d94048, 0x18000080,
> +	0xd3d94049, 0x18000080, 0xd3d9404a, 0x18000080, 0xd3d9404b, 0x18000080,
> +	0xd3d9404c, 0x18000080, 0xd3d9404d, 0x18000080, 0xd3d9404e, 0x18000080,
> +	0xd3d9404f, 0x18000080, 0xd3d94050, 0x18000080, 0xd3d94051, 0x18000080,
> +	0xd3d94052, 0x18000080, 0xd3d94053, 0x18000080, 0xd3d94054, 0x18000080,
> +	0xd3d94055, 0x18000080, 0xd3d94056, 0x18000080, 0xd3d94057, 0x18000080,
> +	0xd3d94058, 0x18000080, 0xd3d94059, 0x18000080, 0xd3d9405a, 0x18000080,
> +	0xd3d9405b, 0x18000080, 0xd3d9405c, 0x18000080, 0xd3d9405d, 0x18000080,
> +	0xd3d9405e, 0x18000080, 0xd3d9405f, 0x18000080, 0xd3d94060, 0x18000080,
> +	0xd3d94061, 0x18000080, 0xd3d94062, 0x18000080, 0xd3d94063, 0x18000080,
> +	0xd3d94064, 0x18000080, 0xd3d94065, 0x18000080, 0xd3d94066, 0x18000080,
> +	0xd3d94067, 0x18000080, 0xd3d94068, 0x18000080, 0xd3d94069, 0x18000080,
> +	0xd3d9406a, 0x18000080, 0xd3d9406b, 0x18000080, 0xd3d9406c, 0x18000080,
> +	0xd3d9406d, 0x18000080, 0xd3d9406e, 0x18000080, 0xd3d9406f, 0x18000080,
> +	0xd3d94070, 0x18000080, 0xd3d94071, 0x18000080, 0xd3d94072, 0x18000080,
> +	0xd3d94073, 0x18000080, 0xd3d94074, 0x18000080, 0xd3d94075, 0x18000080,
> +	0xd3d94076, 0x18000080, 0xd3d94077, 0x18000080, 0xd3d94078, 0x18000080,
> +	0xd3d94079, 0x18000080, 0xd3d9407a, 0x18000080, 0xd3d9407b, 0x18000080,
> +	0xd3d9407c, 0x18000080, 0xd3d9407d, 0x18000080, 0xd3d9407e, 0x18000080,
> +	0xd3d9407f, 0x18000080, 0xd3d94080, 0x18000080, 0xd3d94081, 0x18000080,
> +	0xd3d94082, 0x18000080, 0xd3d94083, 0x18000080, 0xd3d94084, 0x18000080,
> +	0xd3d94085, 0x18000080, 0xd3d94086, 0x18000080, 0xd3d94087, 0x18000080,
> +	0xd3d94088, 0x18000080, 0xd3d94089, 0x18000080, 0xd3d9408a, 0x18000080,
> +	0xd3d9408b, 0x18000080, 0xd3d9408c, 0x18000080, 0xd3d9408d, 0x18000080,
> +	0xd3d9408e, 0x18000080, 0xd3d9408f, 0x18000080, 0xd3d94090, 0x18000080,
> +	0xd3d94091, 0x18000080, 0xd3d94092, 0x18000080, 0xd3d94093, 0x18000080,
> +	0xd3d94094, 0x18000080, 0xd3d94095, 0x18000080, 0xd3d94096, 0x18000080,
> +	0xd3d94097, 0x18000080, 0xd3d94098, 0x18000080, 0xd3d94099, 0x18000080,
> +	0xd3d9409a, 0x18000080, 0xd3d9409b, 0x18000080, 0xd3d9409c, 0x18000080,
> +	0xd3d9409d, 0x18000080, 0xd3d9409e, 0x18000080, 0xd3d9409f, 0x18000080,
> +	0xd3d940a0, 0x18000080, 0xd3d940a1, 0x18000080, 0xd3d940a2, 0x18000080,
> +	0xd3d940a3, 0x18000080, 0xd3d940a4, 0x18000080, 0xd3d940a5, 0x18000080,
> +	0xd3d940a6, 0x18000080, 0xd3d940a7, 0x18000080, 0xd3d940a8, 0x18000080,
> +	0xd3d940a9, 0x18000080, 0xd3d940aa, 0x18000080, 0xd3d940ab, 0x18000080,
> +	0xd3d940ac, 0x18000080, 0xd3d940ad, 0x18000080, 0xd3d940ae, 0x18000080,
> +	0xd3d940af, 0x18000080, 0xd3d940b0, 0x18000080, 0xd3d940b1, 0x18000080,
> +	0xd3d940b2, 0x18000080, 0xd3d940b3, 0x18000080, 0xd3d940b4, 0x18000080,
> +	0xd3d940b5, 0x18000080, 0xd3d940b6, 0x18000080, 0xd3d940b7, 0x18000080,
> +	0xd3d940b8, 0x18000080, 0xd3d940b9, 0x18000080, 0xd3d940ba, 0x18000080,
> +	0xd3d940bb, 0x18000080, 0xd3d940bc, 0x18000080, 0xd3d940bd, 0x18000080,
> +	0xd3d940be, 0x18000080, 0xd3d940bf, 0x18000080, 0xd3d940c0, 0x18000080,
> +	0xd3d940c1, 0x18000080, 0xd3d940c2, 0x18000080, 0xd3d940c3, 0x18000080,
> +	0xd3d940c4, 0x18000080, 0xd3d940c5, 0x18000080, 0xd3d940c6, 0x18000080,
> +	0xd3d940c7, 0x18000080, 0xd3d940c8, 0x18000080, 0xd3d940c9, 0x18000080,
> +	0xd3d940ca, 0x18000080, 0xd3d940cb, 0x18000080, 0xd3d940cc, 0x18000080,
> +	0xd3d940cd, 0x18000080, 0xd3d940ce, 0x18000080, 0xd3d940cf, 0x18000080,
> +	0xd3d940d0, 0x18000080, 0xd3d940d1, 0x18000080, 0xd3d940d2, 0x18000080,
> +	0xd3d940d3, 0x18000080, 0xd3d940d4, 0x18000080, 0xd3d940d5, 0x18000080,
> +	0xd3d940d6, 0x18000080, 0xd3d940d7, 0x18000080, 0xd3d940d8, 0x18000080,
> +	0xd3d940d9, 0x18000080, 0xd3d940da, 0x18000080, 0xd3d940db, 0x18000080,
> +	0xd3d940dc, 0x18000080, 0xd3d940dd, 0x18000080, 0xd3d940de, 0x18000080,
> +	0xd3d940df, 0x18000080, 0xd3d940e0, 0x18000080, 0xd3d940e1, 0x18000080,
> +	0xd3d940e2, 0x18000080, 0xd3d940e3, 0x18000080, 0xd3d940e4, 0x18000080,
> +	0xd3d940e5, 0x18000080, 0xd3d940e6, 0x18000080, 0xd3d940e7, 0x18000080,
> +	0xd3d940e8, 0x18000080, 0xd3d940e9, 0x18000080, 0xd3d940ea, 0x18000080,
> +	0xd3d940eb, 0x18000080, 0xd3d940ec, 0x18000080, 0xd3d940ed, 0x18000080,
> +	0xd3d940ee, 0x18000080, 0xd3d940ef, 0x18000080, 0xd3d940f0, 0x18000080,
> +	0xd3d940f1, 0x18000080, 0xd3d940f2, 0x18000080, 0xd3d940f3, 0x18000080,
> +	0xd3d940f4, 0x18000080, 0xd3d940f5, 0x18000080, 0xd3d940f6, 0x18000080,
> +	0xd3d940f7, 0x18000080, 0xd3d940f8, 0x18000080, 0xd3d940f9, 0x18000080,
> +	0xd3d940fa, 0x18000080, 0xd3d940fb, 0x18000080, 0xd3d940fc, 0x18000080,
> +	0xd3d940fd, 0x18000080, 0xd3d940fe, 0x18000080, 0xd3d940ff, 0x18000080,
> +	0xb07c0000, 0xbe8a00ff, 0x000000f8, 0xbf11080a, 0x7e000280, 0x7e020280,
> +	0x7e040280, 0x7e060280, 0x7e080280, 0x7e0a0280, 0x7e0c0280, 0x7e0e0280,
> +	0x808a880a, 0xbe80320a, 0xbf84fff5, 0xbf9c0000, 0xd28c0001, 0x0001007f,
> +	0xd28d0001, 0x0002027e, 0x10020288, 0xbe8b0004, 0xb78b4000, 0xd1196a01,
> +	0x00001701, 0xbe8a0087, 0xbefc00c1, 0xd89c4000, 0x00020201, 0xd89cc080,
> +	0x00040401, 0x320202ff, 0x00000800, 0x808a810a, 0xbf84fff8,
> +0xbf810000,
>   };
>   
>   const struct soc15_reg_entry vgpr_init_regs_aldebaran[] = { @@ -183,7 +188,7 @@ const struct soc15_reg_entry vgpr_init_regs_aldebaran[] = {
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Y), 4 },
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Z), 1 },
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC1), 0xbf },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC2), 0x400004 },  /* 64KB LDS */
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC2), 0x400006 },  /* 64KB
> +LDS */
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC3), 0x3F }, /*  63 - accum-offset = 256 */
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE0), 0xffffffff },
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE1), 0xffffffff }, @@ -195,262 +200,488 @@ const struct soc15_reg_entry vgpr_init_regs_aldebaran[] = {
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7), 0xffffffff },  };
>   
> -static const u32 sgpr_init_compute_shader_aldebaran[] = {
> -	0xb8840904, 0xb8851a04, 0xb8861344, 0x9207c006, 0x92088405, 0x81070807,
> -	0x81070407, 0x8e078207, 0xbefc0006, 0xbf800000, 0xbf900001, 0xbe88008f,
> -	0xc0410200, 0x00000007, 0xb07c0000, 0xbe8000ff, 0x0000005f, 0xbee50080,
> -	0xbe812c65, 0xbe822c65, 0xbe832c65, 0xbe842c65, 0xbe852c65, 0xb77c0005,
> -	0x80808500, 0xbf84fff8, 0xbe800080, 0xbf810000,
> +static const u32 sgpr112_init_compute_shader_aldebaran[] = {
> +	0xb8840904, 0xb8851a04, 0xb8861344, 0xb8831804, 0x9208ff06, 0x00000280,
> +	0x9209a805, 0x920a8a04, 0x81080908, 0x81080a08, 0x81080308, 0x8e078208,
> +	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8e003f, 0xc0030200,
> +	0x00000000, 0xbf8c0000, 0xbf06ff08, 0xdeadbeaf, 0xbf84fff9, 0x81028102,
> +	0xc0410080, 0x00000007, 0xbf8c0000, 0xbefc0080, 0xbe880080, 0xbe890080,
> +	0xbe8a0080, 0xbe8b0080, 0xbe8c0080, 0xbe8d0080, 0xbe8e0080, 0xbe8f0080,
> +	0xbe900080, 0xbe910080, 0xbe920080, 0xbe930080, 0xbe940080, 0xbe950080,
> +	0xbe960080, 0xbe970080, 0xbe980080, 0xbe990080, 0xbe9a0080, 0xbe9b0080,
> +	0xbe9c0080, 0xbe9d0080, 0xbe9e0080, 0xbe9f0080, 0xbea00080, 0xbea10080,
> +	0xbea20080, 0xbea30080, 0xbea40080, 0xbea50080, 0xbea60080, 0xbea70080,
> +	0xbea80080, 0xbea90080, 0xbeaa0080, 0xbeab0080, 0xbeac0080, 0xbead0080,
> +	0xbeae0080, 0xbeaf0080, 0xbeb00080, 0xbeb10080, 0xbeb20080, 0xbeb30080,
> +	0xbeb40080, 0xbeb50080, 0xbeb60080, 0xbeb70080, 0xbeb80080, 0xbeb90080,
> +	0xbeba0080, 0xbebb0080, 0xbebc0080, 0xbebd0080, 0xbebe0080, 0xbebf0080,
> +	0xbec00080, 0xbec10080, 0xbec20080, 0xbec30080, 0xbec40080, 0xbec50080,
> +	0xbec60080, 0xbec70080, 0xbec80080, 0xbec90080, 0xbeca0080, 0xbecb0080,
> +	0xbecc0080, 0xbecd0080, 0xbece0080, 0xbecf0080, 0xbed00080, 0xbed10080,
> +	0xbed20080, 0xbed30080, 0xbed40080, 0xbed50080, 0xbed60080, 0xbed70080,
> +	0xbed80080, 0xbed90080, 0xbeda0080, 0xbedb0080, 0xbedc0080, 0xbedd0080,
> +	0xbede0080, 0xbedf0080, 0xbee00080, 0xbee10080, 0xbee20080, 0xbee30080,
> +	0xbee40080, 0xbee50080, 0xbf810000
>   };
>   
> -static const struct soc15_reg_entry sgpr1_init_regs_aldebaran[] = {
> +const struct soc15_reg_entry sgpr112_init_regs_aldebaran[] = {
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_RESOURCE_LIMITS), 0x0000000 },
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_X), 0x40 },
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Y), 8 },
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Z), 1 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC1), 0x240 }, /* (80 GPRS): SGPRS[9:6] VGPRS[5:0] */
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC2), 0x4 }, /* USER_SGPR[5:1]*/
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC3), 0x3F }, /*  63 - accum-offset = 256 */
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE0), 0x000000ff },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE1), 0x000000ff },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE2), 0x000000ff },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE3), 0x000000ff },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE4), 0x000000ff },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE5), 0x000000ff },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE6), 0x000000ff },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7), 0x000000ff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC1), 0x2c0 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC2), 0x6 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC3), 0x0 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE0), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE1), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE2), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE3), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE4), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE5), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE6), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7),
> +0xffffffff }, };
> +
> +static const u32 sgpr96_init_compute_shader_aldebaran[] = {
> +	0xb8840904, 0xb8851a04, 0xb8861344, 0xb8831804, 0x9208ff06, 0x00000280,
> +	0x9209a805, 0x920a8a04, 0x81080908, 0x81080a08, 0x81080308, 0x8e078208,
> +	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xbf8e003f, 0xc0030200,
> +	0x00000000, 0xbf8c0000, 0xbf06ff08, 0xdeadbeaf, 0xbf84fff9, 0x81028102,
> +	0xc0410080, 0x00000007, 0xbf8c0000, 0xbefc0080, 0xbe880080, 0xbe890080,
> +	0xbe8a0080, 0xbe8b0080, 0xbe8c0080, 0xbe8d0080, 0xbe8e0080, 0xbe8f0080,
> +	0xbe900080, 0xbe910080, 0xbe920080, 0xbe930080, 0xbe940080, 0xbe950080,
> +	0xbe960080, 0xbe970080, 0xbe980080, 0xbe990080, 0xbe9a0080, 0xbe9b0080,
> +	0xbe9c0080, 0xbe9d0080, 0xbe9e0080, 0xbe9f0080, 0xbea00080, 0xbea10080,
> +	0xbea20080, 0xbea30080, 0xbea40080, 0xbea50080, 0xbea60080, 0xbea70080,
> +	0xbea80080, 0xbea90080, 0xbeaa0080, 0xbeab0080, 0xbeac0080, 0xbead0080,
> +	0xbeae0080, 0xbeaf0080, 0xbeb00080, 0xbeb10080, 0xbeb20080, 0xbeb30080,
> +	0xbeb40080, 0xbeb50080, 0xbeb60080, 0xbeb70080, 0xbeb80080, 0xbeb90080,
> +	0xbeba0080, 0xbebb0080, 0xbebc0080, 0xbebd0080, 0xbebe0080, 0xbebf0080,
> +	0xbec00080, 0xbec10080, 0xbec20080, 0xbec30080, 0xbec40080, 0xbec50080,
> +	0xbec60080, 0xbec70080, 0xbec80080, 0xbec90080, 0xbeca0080, 0xbecb0080,
> +	0xbecc0080, 0xbecd0080, 0xbece0080, 0xbecf0080, 0xbed00080, 0xbed10080,
> +	0xbed20080, 0xbed30080, 0xbed40080, 0xbed50080, 0xbed60080, 0xbed70080,
> +	0xbed80080, 0xbed90080, 0xbf810000,
>   };
>   
> -static const struct soc15_reg_entry sgpr2_init_regs_aldebaran[] = {
> +const struct soc15_reg_entry sgpr96_init_regs_aldebaran[] = {
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_RESOURCE_LIMITS), 0x0000000 },
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_X), 0x40 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Y), 8 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Y), 0xc },
>   	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Z), 1 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC1), 0x240 }, /* (80 GPRS) */
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC2), 0x4 }, /* USER_SGPR[5:1]*/
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC3), 0x3F }, /*  63 - accum-offset = 256 */
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE0), 0x0000ff00 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE1), 0x0000ff00 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE2), 0x0000ff00 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE3), 0x0000ff00 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE4), 0x0000ff00 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE5), 0x0000ff00 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE6), 0x0000ff00 },
> -	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7), 0x0000ff00 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC1), 0x240 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC2), 0x6 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC3), 0x0 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE0), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE1), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE2), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE3), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE4), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE5), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE6), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7),
> +0xffffffff },
>   };
>   
> -static int gfx_v9_4_2_check_gprs_init_coverage(struct amdgpu_device *adev,
> -					       uint32_t *wb)
> -{
> -	uint32_t se_id, cu_id, simd_id;
> -	uint32_t simd_cnt = 0;
> -	uint32_t se_offset, cu_offset, data;
> -
> -	for (se_id = 0; se_id < adev->gfx.config.max_shader_engines; se_id++) {
> -		se_offset = se_id * 16 * 4;
> -		for (cu_id = 0; cu_id < 16; cu_id++) {
> -			cu_offset = cu_id * 4;
> -			for (simd_id = 0; simd_id < 4; simd_id++) {
> -				data = wb[se_offset + cu_offset + simd_id];
> -				if (data == 0xF)
> -					simd_cnt++;
> -			}
> -		}
> -	}
> -
> -	if (adev->gfx.cu_info.number * 4 == simd_cnt)
> -		return 0;
> -
> -	dev_warn(adev->dev, "SIMD Count: %d, %d\n",
> -		 adev->gfx.cu_info.number * 4, simd_cnt);
> -
> -	for (se_id = 0; se_id < adev->gfx.config.max_shader_engines; se_id++) {
> -		se_offset = se_id * 16 * 4;
> -		for (cu_id = 0; cu_id < 16; cu_id++) {
> -			cu_offset = cu_id * 4;
> -			for (simd_id = 0; simd_id < 4; simd_id++) {
> -				data = wb[se_offset + cu_offset + simd_id];
> -				if (data != 0xF)
> -					dev_warn(adev->dev, "SE[%d]CU[%d]SIMD[%d]: isn't inited\n",
> -						se_id, cu_id, simd_id);
> -			}
> -		}
> -	}
> +static const u32 sgpr64_init_compute_shader_aldebaran[] = {
> +	0xb8840904, 0xb8851a04, 0xb8861344, 0xb8831804, 0x9208ff06, 0x00000280,
> +	0x9209a805, 0x920a8a04, 0x81080908, 0x81080a08, 0x81080308, 0x8e078208,
> +	0x81078407, 0xc0410080, 0x00000007, 0xbf8c0000, 0xbefc0080, 0xbe880080,
> +	0xbe890080, 0xbe8a0080, 0xbe8b0080, 0xbe8c0080, 0xbe8d0080, 0xbe8e0080,
> +	0xbe8f0080, 0xbe900080, 0xbe910080, 0xbe920080, 0xbe930080, 0xbe940080,
> +	0xbe950080, 0xbe960080, 0xbe970080, 0xbe980080, 0xbe990080, 0xbe9a0080,
> +	0xbe9b0080, 0xbe9c0080, 0xbe9d0080, 0xbe9e0080, 0xbe9f0080, 0xbea00080,
> +	0xbea10080, 0xbea20080, 0xbea30080, 0xbea40080, 0xbea50080, 0xbea60080,
> +	0xbea70080, 0xbea80080, 0xbea90080, 0xbeaa0080, 0xbeab0080, 0xbeac0080,
> +	0xbead0080, 0xbeae0080, 0xbeaf0080, 0xbeb00080, 0xbeb10080, 0xbeb20080,
> +	0xbeb30080, 0xbeb40080, 0xbeb50080, 0xbeb60080, 0xbeb70080, 0xbeb80080,
> +	0xbeb90080, 0xbf810000,
> +};
>   
> -	return -EFAULT;
> -}
> +const struct soc15_reg_entry sgpr64_init_regs_aldebaran[] = {
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_RESOURCE_LIMITS), 0x0000000 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_X), 0x40 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Y), 0x10 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_NUM_THREAD_Z), 1 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC1), 0x1c0 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC2), 0x6 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_PGM_RSRC3), 0x0 },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE0), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE1), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE2), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE3), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE4), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE5), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE6), 0xffffffff },
> +	{ SOC15_REG_ENTRY(GC, 0, regCOMPUTE_STATIC_THREAD_MGMT_SE7),
> +0xffffffff }, };
>   
>   static int gfx_v9_4_2_run_shader(struct amdgpu_device *adev,
> -				 const uint32_t *shader_ptr, uint32_t shader_size,
> -				 const struct soc15_reg_entry *init_regs, uint32_t regs_size,
> -				 uint32_t compute_dim_x, u64 wb_gpu_addr)
> +				 struct amdgpu_ring *ring,
> +				 struct amdgpu_ib *ib,
> +				 const u32 *shader_ptr, u32 shader_size,
> +				 const struct soc15_reg_entry *init_regs, u32 regs_size,
> +				 u32 compute_dim_x, u64 wb_gpu_addr, u32 pattern,
> +				 struct dma_fence **fence_ptr)
>   {
> -	struct amdgpu_ring *ring = &adev->gfx.compute_ring[0];
> -	struct amdgpu_ib ib;
> -	struct dma_fence *f = NULL;
>   	int r, i;
>   	uint32_t total_size, shader_offset;
>   	u64 gpu_addr;
>   
> -	total_size = (regs_size * 3 + 4 + 4 + 5 + 2) * 4;
> +	total_size = (regs_size * 3 + 4 + 5 + 5) * 4;
>   	total_size = ALIGN(total_size, 256);
>   	shader_offset = total_size;
>   	total_size += ALIGN(shader_size, 256);
>   
>   	/* allocate an indirect buffer to put the commands in */
> -	memset(&ib, 0, sizeof(ib));
> +	memset(ib, 0, sizeof(*ib));
>   	r = amdgpu_ib_get(adev, NULL, total_size,
> -					AMDGPU_IB_POOL_DIRECT, &ib);
> +					AMDGPU_IB_POOL_DIRECT, ib);
>   	if (r) {
> -		DRM_ERROR("amdgpu: failed to get ib (%d).\n", r);
> +		dev_err(adev->dev, "failed to get ib (%d).\n", r);
>   		return r;
>   	}
>   
>   	/* load the compute shaders */
>   	for (i = 0; i < shader_size/sizeof(u32); i++)
> -		ib.ptr[i + (shader_offset / 4)] = shader_ptr[i];
> +		ib->ptr[i + (shader_offset / 4)] = shader_ptr[i];
>   
>   	/* init the ib length to 0 */
> -	ib.length_dw = 0;
> +	ib->length_dw = 0;
>   
>   	/* write the register state for the compute dispatch */
>   	for (i = 0; i < regs_size; i++) {
> -		ib.ptr[ib.length_dw++] = PACKET3(PACKET3_SET_SH_REG, 1);
> -		ib.ptr[ib.length_dw++] = SOC15_REG_ENTRY_OFFSET(init_regs[i])
> +		ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 1);
> +		ib->ptr[ib->length_dw++] = SOC15_REG_ENTRY_OFFSET(init_regs[i])
>   								- PACKET3_SET_SH_REG_START;
> -		ib.ptr[ib.length_dw++] = init_regs[i].reg_value;
> +		ib->ptr[ib->length_dw++] = init_regs[i].reg_value;
>   	}
>   
>   	/* write the shader start address: mmCOMPUTE_PGM_LO, mmCOMPUTE_PGM_HI */
> -	gpu_addr = (ib.gpu_addr + (u64)shader_offset) >> 8;
> -	ib.ptr[ib.length_dw++] = PACKET3(PACKET3_SET_SH_REG, 2);
> -	ib.ptr[ib.length_dw++] = SOC15_REG_OFFSET(GC, 0, regCOMPUTE_PGM_LO)
> +	gpu_addr = (ib->gpu_addr + (u64)shader_offset) >> 8;
> +	ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 2);
> +	ib->ptr[ib->length_dw++] = SOC15_REG_OFFSET(GC, 0, regCOMPUTE_PGM_LO)
>   							- PACKET3_SET_SH_REG_START;
> -	ib.ptr[ib.length_dw++] = lower_32_bits(gpu_addr);
> -	ib.ptr[ib.length_dw++] = upper_32_bits(gpu_addr);
> +	ib->ptr[ib->length_dw++] = lower_32_bits(gpu_addr);
> +	ib->ptr[ib->length_dw++] = upper_32_bits(gpu_addr);
>   
>   	/* write the wb buffer address */
> -	ib.ptr[ib.length_dw++] = PACKET3(PACKET3_SET_SH_REG, 2);
> -	ib.ptr[ib.length_dw++] = SOC15_REG_OFFSET(GC, 0, regCOMPUTE_USER_DATA_0)
> +	ib->ptr[ib->length_dw++] = PACKET3(PACKET3_SET_SH_REG, 3);
> +	ib->ptr[ib->length_dw++] = SOC15_REG_OFFSET(GC, 0,
> +regCOMPUTE_USER_DATA_0)
>   							- PACKET3_SET_SH_REG_START;
> -	ib.ptr[ib.length_dw++] = lower_32_bits(wb_gpu_addr);
> -	ib.ptr[ib.length_dw++] = upper_32_bits(wb_gpu_addr);
> +	ib->ptr[ib->length_dw++] = lower_32_bits(wb_gpu_addr);
> +	ib->ptr[ib->length_dw++] = upper_32_bits(wb_gpu_addr);
> +	ib->ptr[ib->length_dw++] = pattern;
>   
>   	/* write dispatch packet */
> -	ib.ptr[ib.length_dw++] = PACKET3(PACKET3_DISPATCH_DIRECT, 3);
> -	ib.ptr[ib.length_dw++] = compute_dim_x; /* x */
> -	ib.ptr[ib.length_dw++] = 1; /* y */
> -	ib.ptr[ib.length_dw++] = 1; /* z */
> -	ib.ptr[ib.length_dw++] =
> +	ib->ptr[ib->length_dw++] = PACKET3(PACKET3_DISPATCH_DIRECT, 3);
> +	ib->ptr[ib->length_dw++] = compute_dim_x; /* x */
> +	ib->ptr[ib->length_dw++] = 1; /* y */
> +	ib->ptr[ib->length_dw++] = 1; /* z */
> +	ib->ptr[ib->length_dw++] =
>   		REG_SET_FIELD(0, COMPUTE_DISPATCH_INITIATOR, COMPUTE_SHADER_EN, 1);
>   
> -	/* write CS partial flush packet */
> -	ib.ptr[ib.length_dw++] = PACKET3(PACKET3_EVENT_WRITE, 0);
> -	ib.ptr[ib.length_dw++] = EVENT_TYPE(7) | EVENT_INDEX(4);
> -
>   	/* shedule the ib on the ring */
> -	r = amdgpu_ib_schedule(ring, 1, &ib, NULL, &f);
> +	r = amdgpu_ib_schedule(ring, 1, ib, NULL, fence_ptr);
>   	if (r) {
> -		DRM_ERROR("amdgpu: ib submit failed (%d).\n", r);
> -		goto fail;
> +		dev_err(adev->dev, "ib submit failed (%d).\n", r);
> +		amdgpu_ib_free(adev, ib, NULL);
>   	}
> +	return r;
> +}
>   
> -	/* wait for the GPU to finish processing the IB */
> -	r = dma_fence_wait(f, false);
> -	if (r) {
> -		DRM_ERROR("amdgpu: fence wait failed (%d).\n", r);
> -		goto fail;
> +static void gfx_v9_4_2_log_wave_assignment(struct amdgpu_device *adev,
> +uint32_t *wb_ptr) {
> +	uint32_t se, cu, simd, wave;
> +	uint32_t offset = 0;
> +	char *str;
> +	int size;
> +
> +	str = kmalloc(256, GFP_KERNEL);
> +	if (!str)
> +		return;
> +
> +	dev_dbg(adev->dev, "wave assignment:\n");
> +
> +	for (se = 0; se < adev->gfx.config.max_shader_engines; se++) {
> +		for (cu = 0; cu < CU_ID_MAX; cu++) {
> +			memset(str, 0, 256);
> +			size = sprintf(str, "SE[%02d]CU[%02d]: ", se, cu);
> +			for (simd = 0; simd < SIMD_ID_MAX; simd++) {
> +				size += sprintf(str + size, "[");
> +				for (wave = 0; wave < WAVE_ID_MAX; wave++) {
> +					size += sprintf(str + size, "%x", wb_ptr[offset]);
> +					offset++;
> +				}
> +				size += sprintf(str + size, "]  ");
> +			}
> +			dev_dbg(adev->dev, "%s\n", str);
> +		}
>   	}
> -fail:
> -	amdgpu_ib_free(adev, &ib, NULL);
> -	dma_fence_put(f);
>   
> -	return r;
> +	kfree(str);
>   }
>   
> -int gfx_v9_4_2_do_edc_gpr_workarounds(struct amdgpu_device *adev)
> +static int gfx_v9_4_2_wait_for_waves_assigned(struct amdgpu_device *adev,
> +					      uint32_t *wb_ptr, uint32_t mask,
> +					      uint32_t pattern, uint32_t num_wave, bool wait)
>   {
> -	struct amdgpu_ring *ring = &adev->gfx.compute_ring[0];
> -	int r;
> -	int compute_dim_x = adev->gfx.config.max_shader_engines *
> -			    adev->gfx.config.max_cu_per_sh *
> -			    adev->gfx.config.max_sh_per_se;
> -	int sgpr_work_group_size = 5;
> -	/* CU_ID: 0~15, SIMD_ID: 0~3 */
> -	int wb_size = adev->gfx.config.max_shader_engines * 16 * 4;
> -	struct amdgpu_ib ib;
> +	uint32_t se, cu, simd, wave;
> +	uint32_t loop = 0;
> +	uint32_t wave_cnt;
> +	uint32_t offset;
>   
> -	/* only support when RAS is enabled */
> -	if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
> -		return 0;
> +	do {
> +		wave_cnt = 0;
> +		offset = 0;
> +
> +		for (se = 0; se < adev->gfx.config.max_shader_engines; se++)
> +			for (cu = 0; cu < CU_ID_MAX; cu++)
> +				for (simd = 0; simd < SIMD_ID_MAX; simd++)
> +					for (wave = 0; wave < WAVE_ID_MAX; wave++) {
> +						if (((1 << wave) & mask) &&
> +						    (wb_ptr[offset] == pattern))
> +							wave_cnt++;
> +
> +						offset++;
> +					}
> +
> +		if (wave_cnt == num_wave)
> +			return 0;
> +
> +		mdelay(1);
> +	} while (++loop < 2000 && wait);
> +
> +	dev_err(adev->dev, "actual wave num: %d, expected wave num: %d\n",
> +		wave_cnt, num_wave);
> +
> +	gfx_v9_4_2_log_wave_assignment(adev, wb_ptr);
> +
> +	return -EBADSLT;
> +}
> +
> +static int gfx_v9_4_2_do_sgprs_init(struct amdgpu_device *adev) {
> +	int r;
> +	int wb_size = adev->gfx.config.max_shader_engines *
> +			 CU_ID_MAX * SIMD_ID_MAX * WAVE_ID_MAX;
> +	struct amdgpu_ib wb_ib;
> +	struct amdgpu_ib disp_ibs[3];
> +	struct dma_fence *fences[3];
> +	u32 pattern[3] = { 0x1, 0x5, 0xa };
>   
>   	/* bail if the compute ring is not ready */
> -	if (!ring->sched.ready)
> +	if (!adev->gfx.compute_ring[0].sched.ready ||
> +		 !adev->gfx.compute_ring[1].sched.ready)
>   		return 0;
>   
> -	/* allocate an indirect buffer to put the commands in */
> -	memset(&ib, 0, sizeof(ib));
> -	r = amdgpu_ib_get(adev, NULL, wb_size * sizeof(uint32_t),
> -			  AMDGPU_IB_POOL_DIRECT, &ib);
> +	/* allocate the write-back buffer from IB */
> +	memset(&wb_ib, 0, sizeof(wb_ib));
> +	r = amdgpu_ib_get(adev, NULL, (1 + wb_size) * sizeof(uint32_t),
> +			  AMDGPU_IB_POOL_DIRECT, &wb_ib);
>   	if (r) {
> -		DRM_ERROR("amdgpu: failed to get ib (%d).\n", r);
> +		dev_err(adev->dev, "failed to get ib (%d) for wb\n", r);
>   		return r;
>   	}
> +	memset(wb_ib.ptr, 0, (1 + wb_size) * sizeof(uint32_t));
> +
> +	r = gfx_v9_4_2_run_shader(adev,
> +			&adev->gfx.compute_ring[0],
> +			&disp_ibs[0],
> +			sgpr112_init_compute_shader_aldebaran,
> +			sizeof(sgpr112_init_compute_shader_aldebaran),
> +			sgpr112_init_regs_aldebaran,
> +			ARRAY_SIZE(sgpr112_init_regs_aldebaran),
> +			adev->gfx.cu_info.number,
> +			wb_ib.gpu_addr, pattern[0], &fences[0]);
> +	if (r) {
> +		dev_err(adev->dev, "failed to clear first 224 sgprs\n");
> +		goto pro_end;
> +	}
>   
> -	memset(ib.ptr, 0, wb_size * sizeof(uint32_t));
> -	r = gfx_v9_4_2_run_shader(adev, vgpr_init_compute_shader_aldebaran,
> -				  sizeof(vgpr_init_compute_shader_aldebaran),
> -				  vgpr_init_regs_aldebaran,
> -				  ARRAY_SIZE(vgpr_init_regs_aldebaran),
> -				  compute_dim_x * 2, ib.gpu_addr);
> +	r = gfx_v9_4_2_wait_for_waves_assigned(adev,
> +			&wb_ib.ptr[1], 0b11,
> +			pattern[0],
> +			adev->gfx.cu_info.number * SIMD_ID_MAX * 2,
> +			true);
>   	if (r) {
> -		dev_err(adev->dev, "Init VGPRS: failed to run shader\n");
> -		goto failed;
> +		dev_err(adev->dev, "wave coverage failed when clear first 224 sgprs\n");
> +		wb_ib.ptr[0] = 0xdeadbeaf; /* stop waves */
> +		goto disp0_failed;
>   	}
>   
> -	r = gfx_v9_4_2_check_gprs_init_coverage(adev, ib.ptr);
> +	r = gfx_v9_4_2_run_shader(adev,
> +			&adev->gfx.compute_ring[1],
> +			&disp_ibs[1],
> +			sgpr96_init_compute_shader_aldebaran,
> +			sizeof(sgpr96_init_compute_shader_aldebaran),
> +			sgpr96_init_regs_aldebaran,
> +			ARRAY_SIZE(sgpr96_init_regs_aldebaran),
> +			adev->gfx.cu_info.number * 2,
> +			wb_ib.gpu_addr, pattern[1], &fences[1]);
>   	if (r) {
> -		dev_err(adev->dev, "Init VGPRS: failed to cover all SIMDs\n");
> -		goto failed;
> -	} else {
> -		dev_info(adev->dev, "Init VGPRS Successfully\n");
> +		dev_err(adev->dev, "failed to clear next 576 sgprs\n");
> +		goto disp0_failed;
> +	}
> +
> +	r = gfx_v9_4_2_wait_for_waves_assigned(adev,
> +			&wb_ib.ptr[1], 0b11111100,
> +			pattern[1], adev->gfx.cu_info.number * SIMD_ID_MAX * 6,
> +			true);
> +	if (r) {
> +		dev_err(adev->dev, "wave coverage failed when clear first 576 sgprs\n");
> +		wb_ib.ptr[0] = 0xdeadbeaf; /* stop waves */
> +		goto disp1_failed;
>   	}
>   
> -	memset(ib.ptr, 0, wb_size * sizeof(uint32_t));
> -	r = gfx_v9_4_2_run_shader(adev, sgpr_init_compute_shader_aldebaran,
> -				  sizeof(sgpr_init_compute_shader_aldebaran),
> -				  sgpr1_init_regs_aldebaran,
> -				  ARRAY_SIZE(sgpr1_init_regs_aldebaran),
> -				  compute_dim_x / 2 * sgpr_work_group_size,
> -				  ib.gpu_addr);
> +	wb_ib.ptr[0] = 0xdeadbeaf; /* stop waves */
> +
> +	/* wait for the GPU to finish processing the IB */
> +	r = dma_fence_wait(fences[0], false);
>   	if (r) {
> -		dev_err(adev->dev, "Init SGPRS Part1: failed to run shader\n");
> -		goto failed;
> +		dev_err(adev->dev, "timeout to clear first 224 sgprs\n");
> +		goto disp1_failed;
>   	}
>   
> -	r = gfx_v9_4_2_run_shader(adev, sgpr_init_compute_shader_aldebaran,
> -				  sizeof(sgpr_init_compute_shader_aldebaran),
> -				  sgpr2_init_regs_aldebaran,
> -				  ARRAY_SIZE(sgpr2_init_regs_aldebaran),
> -				  compute_dim_x / 2 * sgpr_work_group_size,
> -				  ib.gpu_addr);
> +	r = dma_fence_wait(fences[1], false);
>   	if (r) {
> -		dev_err(adev->dev, "Init SGPRS Part2: failed to run shader\n");
> -		goto failed;
> +		dev_err(adev->dev, "timeout to clear first 576 sgprs\n");
> +		goto disp1_failed;
>   	}
>   
> -	r = gfx_v9_4_2_check_gprs_init_coverage(adev, ib.ptr);
> +	memset(wb_ib.ptr, 0, (1 + wb_size) * sizeof(uint32_t));
> +	r = gfx_v9_4_2_run_shader(adev,
> +			&adev->gfx.compute_ring[0],
> +			&disp_ibs[2],
> +			sgpr64_init_compute_shader_aldebaran,
> +			sizeof(sgpr64_init_compute_shader_aldebaran),
> +			sgpr64_init_regs_aldebaran,
> +			ARRAY_SIZE(sgpr64_init_regs_aldebaran),
> +			adev->gfx.cu_info.number,
> +			wb_ib.gpu_addr, pattern[2], &fences[2]);
> +	if (r) {
> +		dev_err(adev->dev, "failed to clear first 256 sgprs\n");
> +		goto disp1_failed;
> +	}
> +
> +	r = dma_fence_wait(fences[2], false);
> +	if (r) {
> +		dev_err(adev->dev, "timeout to clear first 256 sgprs\n");
> +		goto disp2_failed;
> +	}
> +
> +	r = gfx_v9_4_2_wait_for_waves_assigned(adev,
> +			&wb_ib.ptr[1], 0b1111,
> +			pattern[2],
> +			adev->gfx.cu_info.number * SIMD_ID_MAX * 4,
> +			false);
> +	if (r) {
> +		dev_err(adev->dev, "wave coverage failed when clear first 256 sgprs\n");
> +		goto disp2_failed;
> +	}
> +
> +disp2_failed:
> +	amdgpu_ib_free(adev, &disp_ibs[2], NULL);
> +	dma_fence_put(fences[2]);
> +disp1_failed:
> +	amdgpu_ib_free(adev, &disp_ibs[1], NULL);
> +	dma_fence_put(fences[1]);
> +disp0_failed:
> +	amdgpu_ib_free(adev, &disp_ibs[0], NULL);
> +	dma_fence_put(fences[0]);
> +pro_end:
> +	amdgpu_ib_free(adev, &wb_ib, NULL);
> +
>   	if (r)
> -		dev_err(adev->dev,
> -			"Init SGPRS: failed to cover all SIMDs\n");
> +		dev_info(adev->dev, "Init SGPRS Failed\n");
>   	else
>   		dev_info(adev->dev, "Init SGPRS Successfully\n");
>   
> -failed:
> -	amdgpu_ib_free(adev, &ib, NULL);
>   	return r;
>   }
>   
> +static int gfx_v9_4_2_do_vgprs_init(struct amdgpu_device *adev) {
> +	int r;
> +	/* CU_ID: 0~15, SIMD_ID: 0~3, WAVE_ID: 0 ~ 9 */
> +	int wb_size = adev->gfx.config.max_shader_engines *
> +			 CU_ID_MAX * SIMD_ID_MAX * WAVE_ID_MAX;
> +	struct amdgpu_ib wb_ib;
> +	struct amdgpu_ib disp_ib;
> +	struct dma_fence *fence;
> +	u32 pattern = 0xa;
> +
> +	/* bail if the compute ring is not ready */
> +	if (!adev->gfx.compute_ring[0].sched.ready)
> +		return 0;
> +
> +	/* allocate the write-back buffer from IB */
> +	memset(&wb_ib, 0, sizeof(wb_ib));
> +	r = amdgpu_ib_get(adev, NULL, (1 + wb_size) * sizeof(uint32_t),
> +			  AMDGPU_IB_POOL_DIRECT, &wb_ib);
> +	if (r) {
> +		dev_err(adev->dev, "failed to get ib (%d) for wb.\n", r);
> +		return r;
> +	}
> +	memset(wb_ib.ptr, 0, (1 + wb_size) * sizeof(uint32_t));
> +
> +	r = gfx_v9_4_2_run_shader(adev,
> +			&adev->gfx.compute_ring[0],
> +			&disp_ib,
> +			vgpr_init_compute_shader_aldebaran,
> +			sizeof(vgpr_init_compute_shader_aldebaran),
> +			vgpr_init_regs_aldebaran,
> +			ARRAY_SIZE(vgpr_init_regs_aldebaran),
> +			adev->gfx.cu_info.number,
> +			wb_ib.gpu_addr, pattern, &fence);
> +	if (r) {
> +		dev_err(adev->dev, "failed to clear vgprs\n");
> +		goto pro_end;
> +	}
> +
> +	/* wait for the GPU to finish processing the IB */
> +	r = dma_fence_wait(fence, false);
> +	if (r) {
> +		dev_err(adev->dev, "timeout to clear vgprs\n");
> +		goto disp_failed;
> +	}
> +
> +	r = gfx_v9_4_2_wait_for_waves_assigned(adev,
> +			&wb_ib.ptr[1], 0b1,
> +			pattern,
> +			adev->gfx.cu_info.number * SIMD_ID_MAX,
> +			false);
> +	if (r) {
> +		dev_err(adev->dev, "failed to cover all simds when clearing vgprs\n");
> +		goto disp_failed;
> +	}
> +
> +disp_failed:
> +	amdgpu_ib_free(adev, &disp_ib, NULL);
> +	dma_fence_put(fence);
> +pro_end:
> +	amdgpu_ib_free(adev, &wb_ib, NULL);
> +
> +	if (r)
> +		dev_info(adev->dev, "Init VGPRS Failed\n");
> +	else
> +		dev_info(adev->dev, "Init VGPRS Successfully\n");
> +
> +	return r;
> +}
> +
> +int gfx_v9_4_2_do_edc_gpr_workarounds(struct amdgpu_device *adev) {
> +	/* only support when RAS is enabled */
> +	if (!amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__GFX))
> +		return 0;
> +
> +	gfx_v9_4_2_do_sgprs_init(adev);
> +
> +	gfx_v9_4_2_do_vgprs_init(adev);
> +
> +	return 0;
> +}
> +
>   static void gfx_v9_4_2_query_sq_timeout_status(struct amdgpu_device *adev);  static void gfx_v9_4_2_reset_sq_timeout_status(struct amdgpu_device *adev);
>   
> @@ -479,8 +710,6 @@ void gfx_v9_4_2_init_golden_registers(struct amdgpu_device *adev,
>   			 die_id);
>   		break;
>   	}
> -
> -	return;
>   }
>   
>   void gfx_v9_4_2_debug_trap_config_init(struct amdgpu_device *adev,
> --
> 2.17.1
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

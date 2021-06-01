Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AA6396DBC
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Jun 2021 09:05:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CEB8912A;
	Tue,  1 Jun 2021 07:05:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36888912A
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Jun 2021 07:05:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id jt22so20053018ejb.7
 for <amd-gfx@lists.freedesktop.org>; Tue, 01 Jun 2021 00:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=pEC7w66xBzo5BxRYNZEyK+Bvh5ytZBeFPN8DZOJJK6k=;
 b=K9h5Yhxg428AL0BJBiHKvR/fTHnnrH8V6y4a4LETsA6ikCBMgfIMwaU9VKhouGR51b
 keNtSzKpeyHAA4wws1FILpRP76Jr/tb6FLLEmbLisGxt0YIfT4EbjEV/To1WNyG12aiQ
 D4f96P8weE2vD5mQeGzfm57hkGdMBjRPYC66WnOx43AJxx1joWlDh3aw9RCIU6uAU90J
 nRaXJW2F3uWolAPHR3H/IviI2pa4+MgezDPeg/bsltj/UJAX32Is73qrvTuxvfGEoJc8
 STB8MFVVZaRywWyeUA7sKPefxEkOje/CJfYgJ2Cai5Qut2RccPTLns9eMm7gaohb8x3P
 jKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pEC7w66xBzo5BxRYNZEyK+Bvh5ytZBeFPN8DZOJJK6k=;
 b=CKowQfQdz1Lrm2uRYnTW2VTWPg5a80sSfCawnbeK2zX35ubg+VQi5q6c0V8qNg+EJ0
 vs/r19pMD3SDkuCBdFJ/VaE1Oq3DeaZQQxq3Fvo7gXFWLCy4T6rFOcqShD34ARQzsdci
 jxo5cVOq0+vMTkNf/IKewCo7k06pF0d5eRS7nFYo2M85/X9PlSbSHUJ/9zV0zCUlqqrC
 /YtdHoEYuVksxd60C4QG6UJ4BEjHTX0rUA5xWpJw5Tn0I7qyX95YDVduDb/a6WWoBwq1
 8QIIBkGu3+WN5DcihewhXgZHeE9QTkJxDkLrwss4Rd04zU1QdmHL0hkwtTud95gPbjOl
 m3Zw==
X-Gm-Message-State: AOAM531SDUjm/SIIOreue1S7B1Z/fakjK1USVGOXiuQoViqjGh1PEmMk
 VPbJ/Xn39k8tq+gGWyZ1GKeL0W40et4=
X-Google-Smtp-Source: ABdhPJyGjty/X3wI/+5irkxIXUhIwmnNwQMkqTCryvoHyUysjxb1W5I9HCFaTkwI0LdcqdR0Vuikug==
X-Received: by 2002:a17:906:d7a8:: with SMTP id
 pk8mr27999937ejb.74.1622531107588; 
 Tue, 01 Jun 2021 00:05:07 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5ee0:b6d9:de45:97bd?
 ([2a02:908:1252:fb60:5ee0:b6d9:de45:97bd])
 by smtp.gmail.com with ESMTPSA id b16sm8012542edu.53.2021.06.01.00.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 00:05:07 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Don't flush HDP on A+A
To: Eric Huang <jinhuieric.huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210601000625.551445-1-jinhuieric.huang@amd.com>
 <20210601000625.551445-2-jinhuieric.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <21f80a3a-b48d-3ee3-fabb-d1b377a51600@gmail.com>
Date: Tue, 1 Jun 2021 09:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601000625.551445-2-jinhuieric.huang@amd.com>
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

Am 01.06.21 um 02:06 schrieb Eric Huang:
> With XGMI connection flushing HDP on PCIe is unnecessary,
> it is also to optimize memory allocation latency.
>
> Signed-off-by: Eric Huang <jinhuieric.huang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c  | 3 ++-
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 1 +
>   drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c   | 3 +++
>   4 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h
> index 7ec99d591584..1ca23f2f51d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.h
> @@ -44,6 +44,7 @@ struct amdgpu_hdp {
>   	struct ras_common_if			*ras_if;
>   	const struct amdgpu_hdp_funcs		*funcs;
>   	const struct amdgpu_hdp_ras_funcs	*ras_funcs;
> +	bool	no_flush;
>   };
>   
>   int amdgpu_hdp_ras_late_init(struct amdgpu_device *adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> index aaa2574ce9bc..f31eae2931f3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> @@ -226,7 +226,8 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
>   	if (!(adev->flags & AMD_IS_APU))
>   #endif
>   	{
> -		if (ring->funcs->emit_hdp_flush)
> +		if (ring->funcs->emit_hdp_flush &&
> +			!adev->hdp.no_flush)

This still emits the flush through MMIO.

What you need to do is to initialize the hdp.no_flush field for all 
asics and architectures and then use that here in the if above this one.

>   			amdgpu_ring_emit_hdp_flush(ring);
>   		else
>   			amdgpu_asic_flush_hdp(adev, ring);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> index 2749621d5f63..6e1eab615914 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1223,6 +1223,7 @@ static int gmc_v9_0_early_init(void *handle)
>   		adev->gmc.xgmi.supported = true;
>   		adev->gmc.xgmi.connected_to_cpu =
>   			adev->smuio.funcs->is_host_gpu_xgmi_supported(adev);
> +		adev->hdp.no_flush = adev->gmc.xgmi.connected_to_cpu;
>   	}
>   
>   	gmc_v9_0_set_gmc_funcs(adev);
> diff --git a/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c b/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
> index 74b90cc2bf48..e1b2face8656 100644
> --- a/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c
> @@ -40,6 +40,9 @@
>   static void hdp_v4_0_flush_hdp(struct amdgpu_device *adev,
>   				struct amdgpu_ring *ring)
>   {
> +	if (adev->hdp.no_flush)
> +		return;
> +

Just to be clear once more, this approach is a NAK.

Checks like this should not be in the hardware specific function.

Regards,
Christian.

>   	if (!ring || !ring->funcs->emit_wreg)
>   		WREG32_NO_KIQ((adev->rmmio_remap.reg_offset + KFD_MMIO_REMAP_HDP_MEM_FLUSH_CNTL) >> 2, 0);
>   	else

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B834D2B1EED
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 16:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DBE6E52C;
	Fri, 13 Nov 2020 15:38:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124986E52C
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 15:38:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id o20so11211607eds.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mQ+fW2XvxC+USf9WFEAuslf3qMwVYeQXvJhyLe0k9JI=;
 b=bp/eO+18mvlASlvEW212JnXaVeoFU78WOQHtztW//cLHS/1iXyUAGQaXXrN1MdAnrS
 cS0vHofZfgW+Sz/1wDNYXVEGYwomZX7S6xT+C98lePMdhc/zTrNbLee+YWPH3iGMARME
 U+jGU1/P9BjLErSa/NvA70vEwlso4caGs4xWTc24RQL4LqvsI6dlAsl7I2sLlTOQlHSo
 qbiT5dbrTBJCxiCOLqtydYCkYWB+xulHEpbgjre1voJusx/EwutRxCY/cfRdq4axFNgx
 3ONwfbox4hc8Th5Or8BcHrOontYz+1kCcfdo9b3xgY7LYzPhe8485KvuGHEOnJOXh9hV
 lQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mQ+fW2XvxC+USf9WFEAuslf3qMwVYeQXvJhyLe0k9JI=;
 b=UvKUX5pz7rF3rxc8bqJ9j/PPFpUIdJ6d+pRFsCRDODqUsRiZ1lx31uMFjuZJMjBR+D
 OHRCzFjCHCMp7mu/FTkwFJEzuZ/feWmIHaFOJ3KXpXw0u+quGvCWE8c2Bkl/1k5VoYKF
 uib4Y8nWrzMoXdkIn/MYJ15OWT6nnvw2+c2P7oWt+AbBJca7I+yn+rErx2ibtdBA0Jbw
 qu9Mmn47u7NfUkg1NzSnwxl4Kxpi2X+HcpOCNGWfIP6/6FHVBwkvTNNY/KlPzOXpocVs
 +79i4BPnYLEO3lQ1k9uqqZqcWa9MddtoUWJVCEljTUe45D9h5Q5oE6+LBhUrGCUbZbRt
 h6zA==
X-Gm-Message-State: AOAM530BjYVisR4ZTZPSdYyxACTVuKriTjiBGNQyrhf4e6ADdcYIwKhl
 0nR8VIj2XSJA5Td3uBCdl70o1/XReIs=
X-Google-Smtp-Source: ABdhPJwlpptXnPHkhAghNxoQTBqNB+YvxZHXLiAPgOXfD+lDTgrzAQmPtz+1tJ7PJlrWzflkv2KI+w==
X-Received: by 2002:aa7:c546:: with SMTP id s6mr3005006edr.114.1605281922463; 
 Fri, 13 Nov 2020 07:38:42 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id v1sm1346460eds.25.2020.11.13.07.38.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 07:38:41 -0800 (PST)
Subject: Re: [PATCH 1/5] drm/amdgpu: add vcn dec software ring enabled
 parameter
To: James Zhu <James.Zhu@amd.com>, amd-gfx@lists.freedesktop.org
References: <1605133674-21093-1-git-send-email-James.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <89c5c873-b098-3cec-fc47-446b7c07c7d6@gmail.com>
Date: Mon, 16 Nov 2020 12:38:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605133674-21093-1-git-send-email-James.Zhu@amd.com>
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

Am 11.11.20 um 23:27 schrieb James Zhu:
> This allows us to enable dec software ring feature on VCN.
> The default is 0 for all asics, and it is only valid for
> asics with vcn3.0 and above.

Is that only supposed to be used for testing or do you really want to 
upstream this?

A module parameter is always something the end user should be able to 
change to get a certain result.

But if this is only used by a developer for testing then a define 
somewhere in the code would be the more appropriate approach.

Christian.

>
> Signed-off-by: James Zhu <James.Zhu@amd.com>
> Reviewed-by: Leo Liu <leo.liu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++++++
>   2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 20400ec..cc47da6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -209,6 +209,7 @@ extern int amdgpu_si_support;
>   extern int amdgpu_cik_support;
>   #endif
>   extern int amdgpu_num_kcq;
> +extern int amdgpu_dec_sw_ring_enabled;
>   
>   #define AMDGPU_VM_MAX_NUM_CTX			4096
>   #define AMDGPU_SG_THRESHOLD			(256*1024*1024)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 999f84d..570088f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -160,6 +160,7 @@ int amdgpu_force_asic_type = -1;
>   int amdgpu_tmz;
>   int amdgpu_reset_method = -1; /* auto */
>   int amdgpu_num_kcq = -1;
> +int amdgpu_dec_sw_ring_enabled;
>   
>   struct amdgpu_mgpu_info mgpu_info = {
>   	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
> @@ -806,6 +807,13 @@ module_param_named(bad_page_threshold, amdgpu_bad_page_threshold, int, 0444);
>   MODULE_PARM_DESC(num_kcq, "number of kernel compute queue user want to setup (8 if set to greater than 8 or less than 0, only affect gfx 8+)");
>   module_param_named(num_kcq, amdgpu_num_kcq, int, 0444);
>   
> +/**
> + * DOC: dec_sw_ring_enabled (uint)
> + * Override vcn decode software ring features enabled.
> + */
> +MODULE_PARM_DESC(dec_sw_ring_enabled, "vcn dec sw ring support (1 = enable, 0 = disable (default))");
> +module_param_named(dec_sw_ring_enabled, amdgpu_dec_sw_ring_enabled, int, 0444);
> +
>   static const struct pci_device_id pciidlist[] = {
>   #ifdef  CONFIG_DRM_AMDGPU_SI
>   	{0x1002, 0x6780, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_TAHITI},

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

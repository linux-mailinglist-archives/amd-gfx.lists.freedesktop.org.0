Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D2174EBE0
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jul 2023 12:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C0A10E368;
	Tue, 11 Jul 2023 10:43:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85FC810E357
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jul 2023 10:09:31 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso8744034e87.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jul 2023 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689070169; x=1691662169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7dRYhDe8BiVEV0EBlHbMEnxi5wvB4qWMFbFVB8lXRts=;
 b=aFgnj794CZ/PSLsUzrOXSBGzhI4B7HswMutmsFqschHSz8cORA+/pDetACQMnLtiVf
 SmrzCFCT/cs+yM6BikKD/fqtRXullzc+RV31vTmrAL7rMnzI7g16FM72t2KqZivXVtiL
 fMRV7ruLnrIMLDcjsLJWEglSNQS1EXdKxUdtJ7xeV2OpYxq6LtL3o6/GCUCTxNGksEAq
 OaXuZwr3JCMIQ1l/iQaAsAXZe5TMsMdztIpr3EeEXtf9nprw/1zwlBw+P4lNXSRt+M6k
 rXc9W4f0n7upozPz3dJJtgCxGq6YYdfg3Q3boXohjB+hDA1PLH4SmzjbP61YS/E3XkvU
 pJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689070169; x=1691662169;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7dRYhDe8BiVEV0EBlHbMEnxi5wvB4qWMFbFVB8lXRts=;
 b=UEyuZ0EGLb7/KAe4+11NBWpDtazf3xCxOALuGj8SQmY4hGO/io2LvOukEuVeMWrpTh
 V5jf7ELFnB7nKn7nhXlBLXp4oHxvDdijx+6dL422p0DisFnNxGkpTO1vZIEJ5l3Fn1qX
 N7hG93F42XfRQko9lM8XpfwuxjfmgIdeZMd05wUofr2G50lAI/y2MEPfX0Lx7IJceu9C
 ZNUmyOH5JFb2W37cmz2wTMIhc8JJ2ADAbRj2kvVKVPd5/+0Q88egfxLJ1O4AjFa/KQwu
 VY2CUtB9Oof4O48rjm1zjNT4rwsxDVqug32mC8JrCvhmLpJvswXlVRpN6n/9akmOVdX0
 DaTg==
X-Gm-Message-State: ABy/qLZOcal8WZxggmH32C8HKp0pLnvFfdR7Jvd8NfzRvs7C398yiJKu
 h82IGi59IvymbzZPQSi9ayB7cA==
X-Google-Smtp-Source: APBJJlHdaYP6KQEeXomKRN9uoCu1+yo8uHO71sdRJ/mNUCNoupGWQiJZQ4tH2nJN9kqa4WSAGURoBQ==
X-Received: by 2002:a05:6512:2346:b0:4fb:7be5:8f4e with SMTP id
 p6-20020a056512234600b004fb7be58f4emr3008339lfu.6.1689070168929; 
 Tue, 11 Jul 2023 03:09:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 15-20020ac2482f000000b004fb88fffd19sm256372lft.146.2023.07.11.03.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 03:09:28 -0700 (PDT)
Message-ID: <1090089b-2fa9-9781-51a8-38957e261bfd@linaro.org>
Date: Tue, 11 Jul 2023 13:09:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/client: Send hotplug event after registering a client
Content-Language: en-GB
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 noralf@tronnes.org
References: <20230710091029.27503-1-tzimmermann@suse.de>
 <325dad0e-38ff-9f60-efc9-0fd711d63267@linaro.org>
 <117aea3d-c316-509d-7be7-ade155b4ae85@suse.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <117aea3d-c316-509d-7be7-ade155b4ae85@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Jul 2023 10:43:33 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Paul Schyska <pschyska@gmail.com>,
 Torsten Krah <krah.tm@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Moritz Duge <MoritzDuge@kolahilft.de>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 11/07/2023 09:07, Thomas Zimmermann wrote:
> Hi
> 
> Am 10.07.23 um 23:11 schrieb Dmitry Baryshkov:
> [...]
>>> ---
>>>   drivers/gpu/drm/armada/armada_fbdev.c     |  4 ----
>>>   drivers/gpu/drm/drm_client.c              | 21 +++++++++++++++++++++
>>>   drivers/gpu/drm/drm_fbdev_dma.c           |  4 ----
>>>   drivers/gpu/drm/drm_fbdev_generic.c       |  4 ----
>>>   drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  4 ----
>>>   drivers/gpu/drm/gma500/fbdev.c            |  4 ----
>>>   drivers/gpu/drm/msm/msm_fbdev.c           |  4 ----
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm
> 
> Thanks.
> 
>>
>>>   drivers/gpu/drm/omapdrm/omap_fbdev.c      |  4 ----
>>>   drivers/gpu/drm/radeon/radeon_fbdev.c     |  4 ----
>>>   drivers/gpu/drm/tegra/fbdev.c             |  4 ----
>>>   10 files changed, 21 insertions(+), 36 deletions(-)
>>
>> BTW: As you have been clearing this area. I see that significant 
>> amount of DRM drivers use exactly the same code for 
>> msm_fbdev_client_funcs and for the significant part of 
>> foo_fbdev_setup(). Do you have any plans for moving that into a 
>> library / generic code? If not, I can take a look at crafting the patch.
>>
> 
> You're not the first to ask. :) I've so far not attempted to address 
> this duplication. I've been bitten by premature helperization before, so 
> I wanted to wait a bit longer. A lot of the fbdev and client code is 
> changing quite a bit. After things stabilized, I want to to try to do 
> some more code sharing.

Ack, thank you for sharing this.

-- 
With best wishes
Dmitry


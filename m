Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D609234E8A0
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Mar 2021 15:12:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637476E8DB;
	Tue, 30 Mar 2021 13:12:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F08C6E8DB
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Mar 2021 13:12:34 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id b7so24768696ejv.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Mar 2021 06:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=lDJcVl+fsCiz6/FuiXNHjjrbJlnsyeMA/oi4IjPnWfs=;
 b=dPA8lAiZzDvNd8tPsHAymUIRa6gbFc42tRMy5seXR/lIG92Mh0MA4UH8uuEA3S6I0q
 CxJw92qjhfev09qzzcTx5fLREoXzMpfl75d/kX9TR5kXvMpZp/TuH8CPAhF9ZVwlrlrF
 a0CLDni19bCjjDg++zD69FSQ98rAnSgtCl6O/YaiUTGvihU9Qat8irdzQYENehPGnjQx
 q/4gZzYcBNW3evcSver8kU7HNqSZxZhoCRqqwSlDsFrDbceQQKsqbDvPZHwvs4nXFJFq
 7+1+VWI2AN/SxtRIZ3RZKsL8AskXCX8JwDthVHfly6uY7oW3hNxzp5zsU7kWZZ7apJ3z
 rajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=lDJcVl+fsCiz6/FuiXNHjjrbJlnsyeMA/oi4IjPnWfs=;
 b=VA/uDmvRVRc1bxjKllHyZAg3uhBlB5Nuo00GSaogazPNO0mznBwGTo7jICtmw5J+mW
 d4UdfZ7O3FwG7Qh+eAScgIjkqpubFOE4ATJC64nUHZ2sDlG+vtG6gBMsTApgBMlWr7Hz
 ZSFLFSBSmw65CazRbT//AkbTXduyBjcv8V5n4rBlAED7Unqq2/sqalR/gOUmeBXHAnar
 RwtT3HPUpHnc59xQ9xOMLsW/IQcM2lrFTnofN2S2r0Argqk1OvdlkstXZu/sktDNnKrG
 6pgOm09UdW5llc+6BuzgoyjadCtvG/DsqYEvXhvWmtFGr3fS4ZA9UZssuHLySNzEDxkq
 OIbw==
X-Gm-Message-State: AOAM530RCMRltr6XAzusn8NsIsQomPQXEj67fddkks9aFxwYdC+cxm10
 OpNsoADjKgiYQDVeD5GiXXk=
X-Google-Smtp-Source: ABdhPJwQKckVtJujSXtLN2Kj0IY3TqkKJtWnTF+lXcXkTENg9JjNJFDD7gHoahYvR+g3sC5pMOxrJg==
X-Received: by 2002:a17:906:170d:: with SMTP id
 c13mr32430196eje.491.1617109953382; 
 Tue, 30 Mar 2021 06:12:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8ca4:a46e:6aa7:208c?
 ([2a02:908:1252:fb60:8ca4:a46e:6aa7:208c])
 by smtp.gmail.com with ESMTPSA id y12sm10100233ejb.104.2021.03.30.06.12.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 06:12:32 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/amdgpu: fix compiler warning
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
References: <20210330100229.26435-1-guchun.chen@amd.com>
 <20210330100229.26435-2-guchun.chen@amd.com>
 <a8fc10aa-b410-efd5-ae29-7c4bbb76d05d@amd.com>
 <CY4PR12MB1287918442BA6CF42D844932F17D9@CY4PR12MB1287.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7eebe982-a6c6-814f-2e30-c355d35912c7@gmail.com>
Date: Tue, 30 Mar 2021 15:12:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CY4PR12MB1287918442BA6CF42D844932F17D9@CY4PR12MB1287.namprd12.prod.outlook.com>
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

Am 30.03.21 um 15:10 schrieb Chen, Guchun:
> [AMD Public Use]
>
> Inline comments after yours'.
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Tuesday, March 30, 2021 6:40 PM
> To: Chen, Guchun <Guchun.Chen@amd.com>; amd-gfx@lists.freedesktop.org; Zhang, Hawking <Hawking.Zhang@amd.com>
> Subject: Re: [PATCH 2/2] drm/amdgpu: fix compiler warning
>
> Am 30.03.21 um 12:02 schrieb Guchun Chen:
>> warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
>>     int write = !(gtt->userflags & AMDGPU_GEM_USERPTR_READONLY);
> Well there seems to be some kind of bug in the compiler if it complains about the code below.
> [Guchun]From linux coding style's perspective, we shall put the declarations together, separated from code by one blank line, right?

Correct, yes. I don't mind blank lines when you have for example some 
consts, but others sometimes complain about that.

>
>> Signed-off-by: Guchun Chen <guchun.chen@amd.com>
>> ---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 --
>>    1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> index 722efd86718e..2a6fc0556386 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>> @@ -824,7 +824,6 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_device *bdev,
>>    	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>>    	struct amdgpu_ttm_tt *gtt = (void *)ttm;
>>    	int r;
>> -
> Better have variable like "r" and "i" declared last.
> [Guchun]Will send v2 to address this if you don't have objection to this patch.

Thanks,
Christian.

>
> Christian.
>
>>    	int write = !(gtt->userflags & AMDGPU_GEM_USERPTR_READONLY);
>>    	enum dma_data_direction direction = write ?
>>    		DMA_BIDIRECTIONAL : DMA_TO_DEVICE; @@ -861,7 +860,6 @@ static void
>> amdgpu_ttm_tt_unpin_userptr(struct ttm_device *bdev,
>>    {
>>    	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>>    	struct amdgpu_ttm_tt *gtt = (void *)ttm;
>> -
>>    	int write = !(gtt->userflags & AMDGPU_GEM_USERPTR_READONLY);
>>    	enum dma_data_direction direction = write ?
>>    		DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

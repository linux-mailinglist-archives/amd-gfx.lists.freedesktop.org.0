Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254892B2006
	for <lists+amd-gfx@lfdr.de>; Fri, 13 Nov 2020 17:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DB46E529;
	Fri, 13 Nov 2020 16:22:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A28D06E529
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 16:22:05 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t9so11352008edq.8
 for <amd-gfx@lists.freedesktop.org>; Fri, 13 Nov 2020 08:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WWAh2bzlNvsBXvXQhpdHhKkdyK15I/8V04Dyus8mMOQ=;
 b=JebTfokmqlsuUji3Drr9cP5JN0kGmZwOw7Dvb+G1EsdMzQ6DqWa/n9n5rvsXq7K3HG
 rDFRw2FkKUfYyHsOTVNp157fwmG85p25hdO9TAhLdYfYDHXUk6WLAXV3dNt+wSDjMH5M
 nX829Xgn0L/RShoZlhX3Gr0ri2AHN/V2d5ODX7E1wrRTLqCXcJKNQVHKEBVUZxCj5D+X
 PToYzmenUSqQWpy/MRwMk5QlG17TaUxv/fd10bRsfB3i3aU74PqTzjard8aCfON5xqm9
 smqgseFz3tk/wlWvYEyTsj0Kp6FeMIHGY8DvPBJ+hoIWe/WYQskJ75NuV4fY77LbCcDP
 T+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=WWAh2bzlNvsBXvXQhpdHhKkdyK15I/8V04Dyus8mMOQ=;
 b=bPKHpgPwkHtoE0lzb6kZZZHrFM5wBY0PrP72+yEYkU7adPuw1LSg5MaLE8eQ2EEnaR
 2iWHuGSqfbUc3PeoZQsnBX9oQwTI2pO+e8RLyu1ZEHnb2cH4a+ULyUM6YT2Xroqp4QB4
 fSH8LKVMqRUOfPXvU/cDxgZQFYWWDge+ofyXONqg0THqDeYQXjPJcYF7SDCKVgVSvRZZ
 XneW3YkqIzWvvd28C3NOyCK0AkhJP4ztPZjOvadOjwp80TyWgM/cUc/ycXnPLVl3+UEd
 PFS2DLtfgy8wM7hMSgDww+so805VKynmMl85bCKeFLbW7q9ixXiKoL5n+RkiY/2dxMqB
 OhKQ==
X-Gm-Message-State: AOAM532BQaxnEfHCT9UntvhajA0sV4U9FV2DsrIHU6OM4ICLA3svYQ8b
 rcXMGjJQbZ4soUj7NwB/Xfw=
X-Google-Smtp-Source: ABdhPJzR/ziAwkHO5No3PuLTaKjMQ0rOhDhzLvQjryIfihhAvQxJmJvkpp/GCwiQxB1OBc+lBi93vg==
X-Received: by 2002:aa7:db48:: with SMTP id n8mr3386436edt.123.1605284519426; 
 Fri, 13 Nov 2020 08:21:59 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id hj13sm4050925ejb.125.2020.11.13.08.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 08:21:58 -0800 (PST)
Subject: Re: [RFC PATCH 1/1] drm/amdgpu: fix usable gart size calculation
To: Nirmoy Das <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org
References: <20201113161740.20685-1-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <46bfa315-227c-47c2-d950-47a9a866b070@gmail.com>
Date: Fri, 13 Nov 2020 17:21:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201113161740.20685-1-nirmoy.das@amd.com>
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
Cc: alexander.deucher@amd.com, Christian.Koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 13.11.20 um 17:17 schrieb Nirmoy Das:
> amdgpu_do_test_moves() is failing because of wrong
> usable gart size calculation and throwing:
>
> [drm:amdgpu_do_test_moves [amdgpu]] *ERROR* 0000000020bdc9f3 bind failed
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>
> This still doesn't work. As per my calculation 1st 4MB of GART is not
> accounted for in adev->gmc.gart_size - atomic64_read(&adev->gart_pin_size).

The member gart_pin_size should probably be renamed to gtt_pin_size, but 
since a gtt pin is also automatically visible in the GART that should 
probably be ok for now.

> What am I missing ?

The two 2MB windows in the GART which are used for buffer moves.

See AMDGPU_GTT_MAX_TRANSFER_SIZE and AMDGPU_GTT_NUM_TRANSFER_WINDOWS.

Regards,
Christian.

>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_test.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_test.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_test.c
> index 6042b3b81a4c..d983c729997f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_test.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_test.c
> @@ -42,16 +42,9 @@ static void amdgpu_do_test_moves(struct amdgpu_device *adev)
>   	size = 1024 * 1024;
>
>   	/* Number of tests =
> -	 * (Total GTT - IB pool - writeback page - ring buffers) / test size
> +	 * (Total GTT - gart_pin_size) / test size
>   	 */
> -	n = adev->gmc.gart_size - AMDGPU_IB_POOL_SIZE;
> -	for (i = 0; i < AMDGPU_MAX_RINGS; ++i)
> -		if (adev->rings[i])
> -			n -= adev->rings[i]->ring_size;
> -	if (adev->wb.wb_obj)
> -		n -= AMDGPU_GPU_PAGE_SIZE;
> -	if (adev->irq.ih.ring_obj)
> -		n -= adev->irq.ih.ring_size;
> +	n = adev->gmc.gart_size - atomic64_read(&adev->gart_pin_size);
>   	n /= size;
>
>   	gtt_obj = kcalloc(n, sizeof(*gtt_obj), GFP_KERNEL);
> --
> 2.29.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF182F778B
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Jan 2021 12:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBE26E241;
	Fri, 15 Jan 2021 11:22:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D991F6E241
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Jan 2021 11:22:46 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id u19so9143356edx.2
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Jan 2021 03:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ZwxG/YjKVJfXN3DPsMp3yXd/32IeiKIKoPjRn3EaO7E=;
 b=VL2m1MIWZHXuGELaEqCG1xSm67r8IOUf6M4MlctZ0fBXaTuQ8lvYKu4ea5hbOnop4X
 cXDnZkIox1hhZSmfGh49e4vLSNhi5lBrUj6D4B9CIF6hF+mKDwkAeZTkbXGbnF1f/UNZ
 aO42jI3vWbSnKoYBGJ+ER6uy7rnhJKtq9ijiYuW3OKO7an00etSKE4/VOkzpPtSfqJbA
 PZk1zn4pg9MB4rz8rEvzvUCqx6eynH2mgTOhf7H23z80/83QUfyfv5OvGY/+otTKLbNH
 RHasjNuZI3Bddd+YfsyjOBAJR5BLM2WpD4dORay77R20GNMK+LTLH3oSjgT279bH/tvU
 Jv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ZwxG/YjKVJfXN3DPsMp3yXd/32IeiKIKoPjRn3EaO7E=;
 b=l/Zl+R0jnW7Hadx6WwnJxzOqIHDZVd6lgLITWIRbH0n1ZiiwTuK0qz6jwfGCXD5mjP
 4/vb7bUQzWVAhSYvUd2Eu6GzNevNOgh2C2Yx1kOZDTXPVC+HypHbdky73JpfOuZ3S78f
 EGXEBIixCME5PUaxsSRcVerz/OCe9Cxkicd58dFtWfjqqDBfBYSkfSoPTI1m76jxnvP6
 GiZJX3ocnRIzKXaRX0Q/eYsItc4Ti8MhlmtlYZ2k/DMEeyWA0Pf7PkBRxVfyad/jyPdX
 B9Dj5Ho38NQB+U+qa6BjB+ksszUbsga0BRor561EllzImR9OG0rXN5py1nQiFfLb+Jqm
 Pquw==
X-Gm-Message-State: AOAM530cR/i9OViisKddtkvd+4qVV81A/QgW7HYk8LXvdAS1Ae7bAfHE
 x5sRnJ4yYnjHbdB0FsavEuk=
X-Google-Smtp-Source: ABdhPJxaZFBgPF+zSo0GscBU/IZTSyWEtLFt8rLbHJFM+WWyHyOXW4ay2OPBLNXRcC1Dk18UdeLOLw==
X-Received: by 2002:aa7:c358:: with SMTP id j24mr9286945edr.265.1610709765582; 
 Fri, 15 Jan 2021 03:22:45 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id lh26sm3190863ejb.119.2021.01.15.03.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 03:22:44 -0800 (PST)
Subject: Re: [PATCH] drm/amd/display: fix the system memory page fault because
 of copy overflow
To: Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210115184658.513045-1-ray.huang@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1c67eae5-a77c-b6af-4f80-94b5b80733eb@gmail.com>
Date: Fri, 15 Jan 2021 12:22:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210115184658.513045-1-ray.huang@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Jinzhou Su <Jinzhou.Su@amd.com>,
 Lee Jones <lee.jones@linaro.org>, changfeng.zhu@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 15.01.21 um 19:46 schrieb Huang Rui:
> The buffer is allocated with the size of pointer and copy with the size of
> data structure. Then trigger the system memory page fault. Use the
> orignal data structure to get the object size.
>
> Fixes: a8e30005b drm/amd/display/dc/core/dc_link: Move some local data
> from the stack to the heap
>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/gpu/drm/amd/display/dc/core/dc_link.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index 69573d67056d..73178978ae74 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1380,7 +1380,7 @@ static bool dc_link_construct(struct dc_link *link,
>   
>   	DC_LOGGER_INIT(dc_ctx->logger);
>   
> -	info = kzalloc(sizeof(info), GFP_KERNEL);
> +	info = kzalloc(sizeof(struct integrated_info), GFP_KERNEL);

That should probably be sizeof(*info) instead, we usually try to avoid 
sizeof(struct ...) in the kernel.

There are some automated scripts in place which will send you a patch to 
change it otherwise.

>   	if (!info)
>   		goto create_fail;
>   
> @@ -1545,7 +1545,7 @@ static bool dc_link_construct(struct dc_link *link,
>   	}
>   
>   	if (bios->integrated_info)
> -		memcpy(info, bios->integrated_info, sizeof(*info));
> +		memcpy(info, bios->integrated_info, sizeof(struct integrated_info));

This can then also stay as it is.

Apart from that good catch.

Regards,
Christian.

>   
>   	/* Look for channel mapping corresponding to connector and device tag */
>   	for (i = 0; i < MAX_NUMBER_OF_EXT_DISPLAY_PATH; i++) {

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

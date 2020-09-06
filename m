Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D925ED68
	for <lists+amd-gfx@lfdr.de>; Sun,  6 Sep 2020 10:54:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A18989E47;
	Sun,  6 Sep 2020 08:54:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994BE89E47
 for <amd-gfx@lists.freedesktop.org>; Sun,  6 Sep 2020 08:53:58 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so10397923wmj.2
 for <amd-gfx@lists.freedesktop.org>; Sun, 06 Sep 2020 01:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8LuwHSFNQuK6omYloO824m6QGE19xYxe9f60oYW6x4E=;
 b=Drn1/8t8UTRfswnpPMT8d3HdJY/1D7DINJo1sBG9xF8nynDwrsCa1bCmO3c1RaoAb7
 XaSt1Y7IbPJlnfpPuCh3n7dbjBk+B7befbad6U0yXRTnLEsynMtHZJXKtChIFwE8F1bQ
 25LV62qjXBdig6N2zqgaO6jJSjhCDffzxMTOMY+hIQEAL6WSythU4keKSNd8WEeMxJCx
 O4iCqEd9g5MWbjnG0DBgbS3fSzJt/NMqS6MbUa1bQfbn5UotMUOeFhnOMLP4w2k9zZ/C
 vmwnObyl8qLZYLfNmw6iIjoPqiEGQdo58FmadIN3N07oU2H0fzGECNpNF0ltQE+ffzc8
 294g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=8LuwHSFNQuK6omYloO824m6QGE19xYxe9f60oYW6x4E=;
 b=m9PIPm9ivYy8ShJwCL+Sa9K2pX6sCov6Rg+uWyi0tyDtxMv12yZTgQLOVz/fEM3Fni
 4/0zQ56mAbyhLfVvsXCEuotcLvukAAXzXEDF4cXz19YRiqcROUWzo/kxyFnWoXQjHGso
 bYe1UCoxUZ/oSlg6jm1u3pJ8Gxn2og0xL+eOkIP6vkUKQmDXccmb/jCEZ2yvw+Yo750x
 OF0nrOdNwk3gPa8Fb3SpnWJkdaFNG8ccihthEEuoORB38Sd42aqBvYKaN6rwRirixx96
 2vQrZa4YlvlKWNiK8bmkK8XLA/rTUcwHAlftUsnIVOjnQN440G2yZwnZ4DBLEevZz/Wp
 LWuw==
X-Gm-Message-State: AOAM533ASjuMUPABMutBjnBai2DDU7KzuBPMPIwj6G3AebEMBjx68JBN
 j5LW2ogVvz4r8TXGr9ZWS7CVT9D2eXg=
X-Google-Smtp-Source: ABdhPJzt0l6tMO8WCYjDdkAol9lU/WOOr/kaoRW9WcKtWy+5cwWyhNZj6cz7ZNF4U9dMpIJSOeNyBw==
X-Received: by 2002:a1c:4e08:: with SMTP id g8mr15173412wmh.53.1599382436959; 
 Sun, 06 Sep 2020 01:53:56 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b1sm22464200wru.54.2020.09.06.01.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Sep 2020 01:53:56 -0700 (PDT)
Subject: Re: [PATCH] radeon: Use only a single work queue thread for crt
To: Andi Kleen <andi@firstfloor.org>, alexander.deucher@amd.com
References: <20190803000908.5310-1-andi@firstfloor.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <47558836-612d-75e3-c4a8-7b8baf53036d@gmail.com>
Date: Sun, 6 Sep 2020 10:53:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20190803000908.5310-1-andi@firstfloor.org>
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
Cc: Andi Kleen <ak@linux.intel.com>, amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 03.08.19 um 02:09 schrieb Andi Kleen:
> From: Andi Kleen <ak@linux.intel.com>
>
> I got tired of seeing a lot of radeon-crt kernel threads in ps on my
> workstation, one for each CPU and one for each display, which never use any CPU time.
> Surely a single kernel thread is enough to handle the display.

NAK, radeon blocks inside the kernel thread and those need to run in 
parallel or otherwise the hardware can hang.

Christian.

>
> Signed-off-by: Andi Kleen <ak@linux.intel.com>
> ---
>   drivers/gpu/drm/radeon/radeon_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/radeon/radeon_display.c
> index bd52f15e6330..fb0ca688f6fe 100644
> --- a/drivers/gpu/drm/radeon/radeon_display.c
> +++ b/drivers/gpu/drm/radeon/radeon_display.c
> @@ -682,7 +682,7 @@ static void radeon_crtc_init(struct drm_device *dev, int index)
>   
>   	drm_mode_crtc_set_gamma_size(&radeon_crtc->base, 256);
>   	radeon_crtc->crtc_id = index;
> -	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc", WQ_HIGHPRI, 0);
> +	radeon_crtc->flip_queue = alloc_workqueue("radeon-crtc", WQ_HIGHPRI|WQ_UNBOUND, 0);
>   	rdev->mode_info.crtcs[index] = radeon_crtc;
>   
>   	if (rdev->family >= CHIP_BONAIRE) {

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

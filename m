Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D80407580
	for <lists+amd-gfx@lfdr.de>; Sat, 11 Sep 2021 09:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4416EB56;
	Sat, 11 Sep 2021 07:45:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C2D6EB57
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Sep 2021 07:45:41 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso3034804wme.4
 for <amd-gfx@lists.freedesktop.org>; Sat, 11 Sep 2021 00:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QDs3glCRs3/Hbx6zP6/cgmiaxsU9f/DEdxlZL/9xfjg=;
 b=YFAP7dwaAGa5tjsCrWt5nz8kKxOg/6Rq52DP6OcPjvrjQydECqNX8Q0tT+GgU8vjbU
 UU92NORj6FPDtcnU17TI6fhnGprkSFtOpixUIPw4KaNtfhwvceR46a0Od0dkerR+O8Ff
 zFGKBLIC+fJhIQ7AZu+03hBHVmMm71DbXdY9DDEc5LPjeUu0Wwr6X514++qpynTww5BJ
 0trgKOX0Zo+FazmRRBF+OBk3N2d1YqVichiXAXG/3kpwQ4FYWjbj904plSIKCo++rV70
 HMcxlIkQj8xqM4Syh/skgcPtp0dMxO4JyzF86c0hVArfetlRgPoyxLCA+N8eyWzvKglO
 wfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QDs3glCRs3/Hbx6zP6/cgmiaxsU9f/DEdxlZL/9xfjg=;
 b=IoLZVs8EFI92vghkeyWFtyar1ZOmopXn7XJ2+Zj9eIpkMi0mvuPsuM1ZSBZcqIk5ET
 XJ3MhRDN5taVYaHrLndYA4TLtu7doaRJ621FbcUtpLBk6j+lkBKWDM+5GiO1RhPhSlLs
 5Kll/lVhTqU/hCb+w7jWNp0R+AH89UpRAdnYChi4QccNhSna7AYTTKobmQwVjh6Uct34
 SDfLD4+XekfmWSLf6J+wqW/TeY8m9wgbQN6P3LeMfzuwdQl8rKEuPBvPH1DtVkqN/jWY
 8tCriZYXUIOT2YlVKh6pa3WwAVetU0fTObLx5Id3tzU19LXON4AfJOHq46ryUbdgh/7Z
 cpyA==
X-Gm-Message-State: AOAM53109aOLXt6T8AbIaVYORDzN4abC0lXw+fo2y9Ex+qdcWPfXXo1F
 6zKWIkCLm/Q/0lLQxIqR/sE=
X-Google-Smtp-Source: ABdhPJyCblOHLhczMYKksQ6DXUgIb4S17gd5484k3YwxPdeWfgxKk5OLXnzJahZmK6ThNe5h3QjplA==
X-Received: by 2002:a05:600c:246:: with SMTP id
 6mr1589465wmj.118.1631346340364; 
 Sat, 11 Sep 2021 00:45:40 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:654b:42ee:6091:abad?
 ([2a02:908:1252:fb60:654b:42ee:6091:abad])
 by smtp.gmail.com with ESMTPSA id j7sm1132365wrr.27.2021.09.11.00.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 00:45:39 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix a race of IB test
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
References: <20210911015513.3822-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d983949c-6386-cb32-d361-c70efc206e2c@gmail.com>
Date: Sat, 11 Sep 2021 09:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210911015513.3822-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



Am 11.09.21 um 03:55 schrieb xinhui pan:
> Direct IB submission should be exclusive. So use write lock.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> index 19323b4cce7b..acbe02928791 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> @@ -1358,10 +1358,15 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>   	}
>   
>   	/* Avoid accidently unparking the sched thread during GPU reset */
> -	r = down_read_killable(&adev->reset_sem);
> +	r = down_write_killable(&adev->reset_sem);
>   	if (r)
>   		return r;
>   
> +	/* Avoid concurrently IB test but not cancel it as I don't know whether we
> +	 * would add more code in the delayed init work.
> +	 */
> +	flush_delayed_work(&adev->delayed_init_work);
> +

That won't work. It's at least theoretical possible that the delayed 
init work waits for the reset_sem which we are holding here.

Very unlikely to happen, but lockdep might be able to point that out 
with a nice backtrace in the logs.

On the other hand delayed init work and direct IB test through this 
interface should work at the same time, so I would just drop it.

Christian.

>   	/* hold on the scheduler */
>   	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
>   		struct amdgpu_ring *ring = adev->rings[i];
> @@ -1387,7 +1392,7 @@ static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unused)
>   		kthread_unpark(ring->sched.thread);
>   	}
>   
> -	up_read(&adev->reset_sem);
> +	up_write(&adev->reset_sem);
>   
>   	pm_runtime_mark_last_busy(dev->dev);
>   	pm_runtime_put_autosuspend(dev->dev);


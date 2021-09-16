Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D87B240D33C
	for <lists+amd-gfx@lfdr.de>; Thu, 16 Sep 2021 08:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9CE6EAAC;
	Thu, 16 Sep 2021 06:28:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58FE56EAAC
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 Sep 2021 06:28:35 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w29so7626768wra.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 15 Sep 2021 23:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gunFpoGPNy7scpBMxBV6rBteFKURLcykF99bEzH8I20=;
 b=godOO46n4A57ZHe6eOq57dp/RbqUSitjORcMRbHnVkSTO27YlAOGKknxOh41dS9LZV
 pRHTRUfGGR7VROKtKlejgdmoCO3AlNSqRnTvju7t5x1Fc0GtVy/3P5rg+qdB8Tdk1QSi
 g6oCJNDpIOVreAU765Wl+iWbkP1BnImu1oLEB9Qdt3KTIt0G52GMrZ9H1XSCORjiEQgH
 pBl13tD/yvkcImyWkqQnh9uTsVCggEd4pmidsNCWWL+WUD//AojAjTzzmmpvHSCryB8O
 +Z1VdII7FdD6Z1UqM3/0yKIZo9RYDRahQG6JnvTFNQD4EjXhIOg79hnn8OeLnD7HxSGb
 NljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gunFpoGPNy7scpBMxBV6rBteFKURLcykF99bEzH8I20=;
 b=uZVhrDiVEvVPNWAlBn9aFyyFFd/tZXxs/f+18LjGewCfWtTI1s01of+FWT/POk329A
 3OhkRvNfGbRNrT5XtzNojRunnYUxw8qXRNu0k+UGsqzGNQheQJmbAaUTTUzx9ThN3rtB
 VjvAcYCaM+zB+W/S5XrsiGb1uEG1zAeaEcazp1HVChlHqUwh666fkANE4pm0Yu9lE27s
 Z3JVaCyvWIFv9iAlWuyo8f9yV9sfiKYYpj7F45TArRhIiJCzEoFpCh8yR8NCFbfkaVvB
 XLBd7GQe6P/5qpfbUeSH33rO26jNb46A/kxynE5pZU/1ZJsxoG6PeFrI9sveQppIMKGQ
 3bsg==
X-Gm-Message-State: AOAM531NEnWqT0BFy9/U4+ALGC/lbL3Zr3bRL2K+OydFkhmWdxUw18ad
 iOlEkj46L6Nn8ncREdpIU+g=
X-Google-Smtp-Source: ABdhPJw4CFT5RFk+Yr7rmgsOrzRJRgSxiX7J9d2+LmZw5pIE4xro+yxJJXm0T5QAGgYx/gSYdnqgnA==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr4141248wro.264.1631773713704; 
 Wed, 15 Sep 2021 23:28:33 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id v17sm2145289wrr.69.2021.09.15.23.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 23:28:33 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix uvd ib test timeout when use
 pre-allocated BO
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, leo.liu@amd.com
References: <20210916061907.12347-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cb57ce4f-559d-1af4-e11b-77b195974b6c@gmail.com>
Date: Thu, 16 Sep 2021 08:28:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916061907.12347-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 16.09.21 um 08:19 schrieb xinhui pan:
> Now we use same BO for create/destroy msg. So destroy will wait for the
> fence returned from create to be signaled. The default timeout value in
> destroy is 10ms which is too short.
>
> Lets wait both fences with the specific timeout.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> index b6e2abf26e18..8a26459bd80b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> @@ -1336,10 +1336,17 @@ int amdgpu_uvd_ring_test_ib(struct amdgpu_ring *ring, long timeout)
>   	struct dma_fence *fence;
>   	long r;
>   
> -	r = amdgpu_uvd_get_create_msg(ring, 1, NULL);
> +	r = amdgpu_uvd_get_create_msg(ring, 1, &fence);
>   	if (r)
>   		goto error;
>   
> +	r = dma_fence_wait_timeout(fence, false, timeout);
> +	dma_fence_put(fence);
> +	if (r == 0)
> +		r = -ETIMEDOUT;
> +	if (r < 0)
> +		goto error;
> +
>   	r = amdgpu_uvd_get_destroy_msg(ring, 1, true, &fence);
>   	if (r)
>   		goto error;


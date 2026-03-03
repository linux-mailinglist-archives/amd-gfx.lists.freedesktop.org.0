Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMivN1Gspmn9SgAAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 03 Mar 2026 10:39:29 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674551EBFDA
	for <lists+amd-gfx@lfdr.de>; Tue, 03 Mar 2026 10:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B253F10E74A;
	Tue,  3 Mar 2026 09:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="BVpZ1UBo";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="sxFzxb8k";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E8010E754
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Mar 2026 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1772530754;
 bh=myJZhfTJg6D/JuEDTfueF/W
 beCqCrrGBhdgRApCpHec=; b=BVpZ1UBoi3fFVrhnKE1EcjWX9GSxjtCbnSKLOlu9dwvyX/pv/v
 we+lnGgst4T/HZPMbW5ZTAO8TAMREAscNXDr2KhnOlwXsvtwPBi2KoLMOZEiEayKYPsJRaFA7oe
 f3kJEwB7griupVuHgCReBbezj3EkqO+zazWprnGzpFgRXZzqopH0SdEpZScXnVplbWgfWy02sGL
 8VtbFMpOiwVx8yCy2LkmFYIwmQ44V8ogtyBuAFFr40Ire0fq8mIkPJPh34T6kfGGuKXr25wruty
 MwQpKPGKn0t1WbXoX0Ox6PhUN19a6nQeaaTdYMQg2XpACU2u7DjtFcBV1uJDu+DtnSA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1772530754; bh=myJZhfTJg6D/JuEDTfueF/W
 beCqCrrGBhdgRApCpHec=; b=sxFzxb8kPLHa0MDecmDVywVJR7P3RRyDKWUjQN10rh5ZkpDuN5
 oN97TrnuSOM1+ksBBmuyv6ujEqVItBJbpdAw==;
Message-ID: <aad012f4-8d99-4a58-8ca9-a3b984ad09f6@damsy.net>
Date: Tue, 3 Mar 2026 10:39:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/amdgpu: Fix mutex handling in
 amdgpu_benchmark_do_move() v3
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, Dan Carpenter <dan.carpenter@linaro.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20260302152630.1736760-1-srinivasan.shanmugam@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <20260302152630.1736760-1-srinivasan.shanmugam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Queue-Id: 674551EBFDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[damsy.net:s=202408r,damsy.net:s=202408e];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[damsy.net];
	FORGED_RECIPIENTS(0.00)[m:srinivasan.shanmugam@amd.com,m:christian.koenig@amd.com,m:alexander.deucher@amd.com,m:dan.carpenter@linaro.org,m:pierre-eric.pelloux-prayer@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierre-eric@damsy.net,amd-gfx-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric@damsy.net,amd-gfx-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[damsy.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:email]
X-Rspamd-Action: no action



Le 02/03/2026 à 16:26, Srinivasan Shanmugam a écrit :
> amdgpu_benchmark_do_move() can exit the loop early if
> amdgpu_copy_buffer() or dma_fence_wait() fails.
> 
> In the error path, the function jumps to the exit label
> without releasing adev->mman.default_entity.lock, which
> leaves the mutex held and results in a lock imbalance.
> 
> This can block subsequent users of default_entity and
> potentially cause deadlocks.
> 
> Move the mutex_unlock() to the common exit path so the
> lock is released on both success and error returns.
> 
> This fixes:
> drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:57 amdgpu_benchmark_do_move()
> warn: inconsistent returns '&adev->mman.default_entity.lock'.
> 
> v2:
> - Drop unrelated initialization of 'r'
> - Keep the change focused on the mutex imbalance fix (Pierre).
> 
> v3:
> - Remove empty line

Reviewed-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Thanks!

> 
> Fixes: 64c9e5ec16fa ("drm/amdgpu: add missing lock in amdgpu_benchmark_do_move")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 98ccd7ab9e9a..6f3c68cde75e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -48,9 +48,9 @@ static int amdgpu_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
>   		if (r)
>   			goto exit_do_move;
>   	}
> -	mutex_unlock(&adev->mman.default_entity.lock);
>   
>   exit_do_move:
> +	mutex_unlock(&adev->mman.default_entity.lock);
>   	etime = ktime_get();
>   	*time_ms = ktime_ms_delta(etime, stime);
>   

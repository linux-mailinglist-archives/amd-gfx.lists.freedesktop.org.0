Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C895175A11
	for <lists+amd-gfx@lfdr.de>; Mon,  2 Mar 2020 13:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D676E25A;
	Mon,  2 Mar 2020 12:10:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F146E25A
 for <amd-gfx@lists.freedesktop.org>; Mon,  2 Mar 2020 12:10:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j16so12308597wrt.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 02 Mar 2020 04:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=TeDKpauHqmlo+vHvlRrKBVKluLPeX/ULRiin+YCEJaY=;
 b=cNDfA98wYYqmGwFHHisCu5DNfNIGwBxj+eRL8MvKmI0hSl1bDLtr3ES7Arnq2hJVgI
 7xUyR2Si2xIH0SUUMp7zkj7nFJ2zP/6pBCCgqxamzQThJdBOCqusBYPHItCzz/KMmWdE
 9wZf0v2yb9902yg2e4XZdwINKPv/T5iTSDBPILZUSlSvqAIwPouUaABIUo60UsJZzNDY
 LCZI80mzBNLMlRnN1vhvW8VMMNFhZ3payKkYRmq1sI2FTKKET8elg6KRM91QmtxAtYJG
 lgzziH83jjvJXQKF1Fw0w4Tn1oTrtqWMy8PDXFUHijHNyv9aAQqYIA4sOwXdHhtAWxfd
 xyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=TeDKpauHqmlo+vHvlRrKBVKluLPeX/ULRiin+YCEJaY=;
 b=rkFjOgQfg8rPMRXyWjLIKrO36d/SpgMdcnaIzcLW2XA1i8B4uMJXGZ6nsZDQ7OG10r
 GHbPqHcGJ4RKylcJ8vIxaro8R7dvk03Bolr7BewEd0uUvYIbX2vNNGv5OEBy+trO5u2J
 2zYjMpvuwpNEw0F4hpaRqpAAy4UUkjNES9ZRZdtQ+8UauJx7+KWO6yIzOkRbUtxkQBCY
 mlkfQxJjYvUzjqAgB3Cgp4jeiiiQRy0KRXFwJG8L/UF4A6Lt+oT1rlwwis2gdAe2WOln
 p84MjUBbco18n0djHWVh8TiiqlW47ZSm+nrZHBz2DdJfZlBL0XGhbQe04wO4Ol+MpFEL
 MbmQ==
X-Gm-Message-State: APjAAAUq3snrTe60P/6JgdCRSTFOljKTaY6fGRt2NNq8UcphirygOApp
 850FAHSsxclZkUk1AOMDegXCyrb/
X-Google-Smtp-Source: APXvYqzYpT+dovW/Pgj6qte0yZJRKh4oAdtFSFHjBR8AibeyyCuvA26jZ3jjonyGjC5vDvH9DNAWaw==
X-Received: by 2002:adf:ec50:: with SMTP id w16mr22818094wrn.9.1583151015353; 
 Mon, 02 Mar 2020 04:10:15 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f17sm7308342wrm.3.2020.03.02.04.10.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 04:10:14 -0800 (PST)
Subject: Re: [PATCH v3 3/4] drm/amdgpu: change hw sched list on ctx priority
 override
To: Nirmoy Das <nirmoy.aiemd@gmail.com>, amd-gfx@lists.freedesktop.org
References: <20200302095234.3638-1-nirmoy.das@amd.com>
 <20200302095234.3638-3-nirmoy.das@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e3cd9281-fa33-2050-f69a-261444f26bf5@gmail.com>
Date: Mon, 2 Mar 2020 13:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200302095234.3638-3-nirmoy.das@amd.com>
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
Cc: alexander.deucher@amd.com, Ray.Huang@amd.com, nirmoy.das@amd.com,
 christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 02.03.20 um 10:52 schrieb Nirmoy Das:
> Switch to appropriate sched list for an entity on priority override.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 30 +++++++++++++++++++++----
>   1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index 4266da1f3977..57445a61a4cd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -522,6 +522,30 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,
>   	return fence;
>   }
>
> +static void amdgpu_ctx_set_entity_priority(struct amdgpu_ctx *ctx,
> +				   struct amdgpu_ctx_entity *aentity,
> +				   int hw_ip, enum drm_sched_priority priority)
> +{
> +	struct amdgpu_device *adev = ctx->adev;
> +	enum gfx_pipe_priority compute_priority;

Maybe use some shorter name, e.g. hw_prio or something like that.

> +	struct drm_gpu_scheduler **scheds = NULL;
> +	unsigned num_scheds = 0;

Don't initialize those here.

> +
> +	switch (hw_ip) {
> +	case AMDGPU_HW_IP_COMPUTE:
> +		compute_priority =
> +                                amdgpu_ctx_sched_prio_to_compute_prio(priority);
> +		scheds = adev->gfx.compute_prio_sched[compute_priority];
> +		num_scheds = adev->gfx.num_compute_sched[compute_priority];
> +		break;
> +	default:
> +		return;
> +	}
> +
> +	drm_sched_entity_modify_sched(&aentity->entity, scheds, num_scheds);

That needs to be under the "case AMDGPU_HW_IP_COMPUTE" or otherwise we 
set the schedulers to NULL for SDMA.

Regards,
Christian.

> +	drm_sched_entity_set_priority(&aentity->entity, priority);
> +}
> +
>   void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
>   				  enum drm_sched_priority priority)
>   {
> @@ -534,13 +558,11 @@ void amdgpu_ctx_priority_override(struct AMDGPU_GFX_PIPE_PRIO_MAX
> amdgpu_ctx *ctx,
>   			ctx->init_priority : ctx->override_priority;
>   	for (i = 0; i < AMDGPU_HW_IP_NUM; ++i) {
>   		for (j = 0; j < amdgpu_ctx_num_entities[i]; ++j) {
> -			struct drm_sched_entity *entity;
> -
>   			if (!ctx->entities[i][j])
>   				continue;
>
> -			entity = &ctx->entities[i][j]->entity;
> -			drm_sched_entity_set_priority(entity, ctx_prio);
> +			amdgpu_ctx_set_entity_priority(ctx, ctx->entities[i][j],
> +						       i, ctx_prio);
>   		}
>   	}
>   }
> --
> 2.25.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

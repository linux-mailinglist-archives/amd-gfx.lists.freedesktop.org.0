Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1673CF96B
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Jul 2021 14:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 292A26E1D7;
	Tue, 20 Jul 2021 12:13:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A966E1D7
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 12:13:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d2so25813248wrn.0
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Jul 2021 05:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QzNB3q1ZMkpU6iQmimhq5xy6eqqoPNC0XhhLRgciq44=;
 b=sFiF1rJXfAfdZZmCxR14+tFbmd6j4oQiNDX2+V/5s0hDe6D5PmuoV0e4zUdgkLiDL0
 VdUD5jWhe2cyznh61LIApNMIZt9v36zSQdehspuen1EWK3denP2Z7Vq0rtT+IJRZHEnw
 vPJq8aIm3V/NtqcCY58VlY70FSB3VjhBN6wyCnekA2lI1v2sSlnfMTGlmduvPZnZuCbD
 P/uzY9O0Y+zyGLaOnGwRgz6p/qe+1cXkaZDG+kCO4PRZKmvh5CI06sULPdpSq+yaDP+x
 FmX6qNflmMSJvtnVkrbPT142ccXpz8Y3nF0s87UNsTOk8uinZIS6/R6rKY9batCYwv0z
 88yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QzNB3q1ZMkpU6iQmimhq5xy6eqqoPNC0XhhLRgciq44=;
 b=OkZcXWqFQWBVQFSHg9/PHhGGd6ZHGLvwX3MQke/kGSFpuYDWtvk/uiEwiXBjqUyWUb
 10++Wwf6JJBZQsI5/TFZRlQHZty/SVJXxTCQzgomiQdbToJzv/I95CpShX5LPwQul/Ie
 I0qBHzXTV35V5jUS/+uhwoYSDO8CKX4viUhy/FXalVnaDCK+gHF1cmxn6pmuB91Fvah3
 1pdpfjgwRTaBHaM4LP4b53JOLWAWb/+k6DHcsuYWFnJSWyix1aECvwlCLMPByQuOXQDg
 U+zsgJXzv+3GQMWx+oEEAIx/fkP4VacYcIDyW5gN2HQwY1QE5gKuaqqYTj/C23jdWdK9
 /Agw==
X-Gm-Message-State: AOAM5310dhs72a0INum34kziZEIkXEzMZnhKuo+IkcXHp6TVZg+Srmpn
 oKp8yLWSlECxlNzCjverlqA=
X-Google-Smtp-Source: ABdhPJyX8FCHtCukfBYDCm8BighiKr/10+HQwNPtJkGmTkrC4X2BPA4eGcH3aog5Srda9u/Oed2mUQ==
X-Received: by 2002:adf:e582:: with SMTP id l2mr35565590wrm.101.1626783207434; 
 Tue, 20 Jul 2021 05:13:27 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8651:5b5e:8648:2fd0?
 ([2a02:908:1252:fb60:8651:5b5e:8648:2fd0])
 by smtp.gmail.com with ESMTPSA id h20sm2357569wmb.17.2021.07.20.05.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jul 2021 05:13:27 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: consider paging job always not guilty
To: Jingwen Chen <Jingwen.Chen2@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210720110250.356504-1-Jingwen.Chen2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <8bb33313-c9da-0008-e578-832e8ab9933e@gmail.com>
Date: Tue, 20 Jul 2021 14:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720110250.356504-1-Jingwen.Chen2@amd.com>
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
Cc: horace.chen@amd.com, monk.liu@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



Am 20.07.21 um 13:02 schrieb Jingwen Chen:
> [Why]
> Currently all timedout job will be considered to be guilty. In SRIOV
> multi-vf use case, the vf flr happens first and then job time out is
> found. There can be several jobs timeout during a very small time slice.
> And if the innocent sdma job time out is found before the real bad
> job, then the innocent sdma job will be set to guilty. This will lead
> to a page fault after resubmitting job.
>
> [How]
> If the job is a paging job, we will always consider it not guilty

Don't say "paging job", better "kernel job". Since the PTE updates we 
are using here are not even remotely related to paging.

Regards,
Christian.

>
> Signed-off-by: Jingwen Chen <Jingwen.Chen2@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 37fa199be8b3..40461547701a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4410,7 +4410,7 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   		amdgpu_fence_driver_force_completion(ring);
>   	}
>   
> -	if(job)
> +	if (job && job->vm)
>   		drm_sched_increase_karma(&job->base);
>   
>   	r = amdgpu_reset_prepare_hwcontext(adev, reset_context);
> @@ -4874,7 +4874,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   			DRM_INFO("Bailing on TDR for s_job:%llx, hive: %llx as another already in progress",
>   				job ? job->base.id : -1, hive->hive_id);
>   			amdgpu_put_xgmi_hive(hive);
> -			if (job)
> +			if (job && job->vm)
>   				drm_sched_increase_karma(&job->base);
>   			return 0;
>   		}
> @@ -4898,7 +4898,7 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   					job ? job->base.id : -1);
>   
>   		/* even we skipped this reset, still need to set the job to guilty */
> -		if (job)
> +		if (job && job->vm)
>   			drm_sched_increase_karma(&job->base);
>   		goto skip_recovery;
>   	}

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

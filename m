Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F5A2883DE
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Oct 2020 09:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B7D6EC6C;
	Fri,  9 Oct 2020 07:47:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2266EC6C
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Oct 2020 07:47:29 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id qp15so11752844ejb.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 09 Oct 2020 00:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=vY7O0nG1QQcxa59kXBzLWTp5phJjKoYq+IN5KaJSGyc=;
 b=JojjaHMeWR7EjG9HO2IhEYpyCxQuH+C22ta01t6lvSOF8/2j2kP9B1RO8D7Iw8dcXu
 c0R70u0jLXObLbUQ8mUDhwG9dtSI0cLsYe7M/KYXzGdU3BsKzTaRFtII50wvvxi7Gp67
 vVV8xyChw73m/szZ0pBuDGV7ru1hqvURoVx0Dgpqe5Sc3ccPCiHY7/6w0M7XbmtokJV7
 Q77QttFAkJefU8KJX/xRi6fucjxIgUrbT+2Wb7hPc7MSYyAJn14HcBdC18ahC7p7cIR4
 y1Z4aCNVp0b5f65VTWBzFxI6hZ/uzCBeL4e0SIgtLvPqT52Yl5pzuzOLePEyy9+wrR1m
 2aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vY7O0nG1QQcxa59kXBzLWTp5phJjKoYq+IN5KaJSGyc=;
 b=VyY5OYUZ8GRezJhtzpTC9yFGL3/wnkHDrYr+5a61K4nh6SrPKuRuzb2zpIJekMcS4t
 4pjeT3R1ycykdTmZBKXPMd2QKZMzSWN63R+bV91Ug7nCdZFQRfmLLeEJhQs2xzzT6dvV
 UeWWfgAhRPxtVdaiE+fA221td+ojEoORQisy7FCX5Z5bIHsrOmC8B8Ro15eDg8smFh73
 VlC0TlspTa9aUs3EnAWsh3RQ0Bz8R6Yd5eXp8U5Wmg4RyvYJFsrQHCiRol3Cl5r5kI7m
 2Mmq+OZwR38NNMjLPgf1PPNuaf7hXsmnOkvZUd/SfQWKbjv4meoFEzDfo5xDQ4IGWo1S
 hyqg==
X-Gm-Message-State: AOAM531HpNi44LximHEVMzAUjnW6hB4zBBm6wtfiSh3t78yMtcmssiBb
 sAG3QjBwgmF6FvpToJ0TyD0=
X-Google-Smtp-Source: ABdhPJz/v+yHEJYQ8vLgQx5pP36w1sC7BUtq9g931ygepRAWXMWOgU7kGZobt6Wetket/5ZmDEh4+g==
X-Received: by 2002:a17:906:a387:: with SMTP id
 k7mr13838916ejz.167.1602229648469; 
 Fri, 09 Oct 2020 00:47:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id r21sm5742607eda.3.2020.10.09.00.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 00:47:27 -0700 (PDT)
Subject: Re: [PATCH] Revert "drm/scheduler: improve job distribution with
 multiple queues"
To: Changfeng <Changfeng.Zhu@amd.com>, amd-gfx@lists.freedesktop.org,
 Aaron.Liu@amd.com
References: <20201009061631.15383-1-Changfeng.Zhu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <52e05e79-94f1-9a99-c4d4-ba84a6e97521@gmail.com>
Date: Fri, 9 Oct 2020 09:47:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009061631.15383-1-Changfeng.Zhu@amd.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

The patch itself is correct, but it was reported numerous times that 
this surfaces problems elsewhere.

So just reverting it is probably not the right approach.

Christian.

Am 09.10.20 um 08:16 schrieb Changfeng:
> From: changzhu <Changfeng.Zhu@amd.com>
>
> From: Changfeng <Changfeng.Zhu@amd.com>
>
> It needs to revert this patch to avoid amdgpu_test compute hang problem
> on picasso/raven1
>
> Change-Id: I5c298bb0c6cd64c67de712db551d15974c41493e
> Signed-off-by: Changfeng <Changfeng.Zhu@amd.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
>   drivers/gpu/drm/scheduler/sched_main.c   | 14 ++++++--------
>   include/drm/gpu_scheduler.h              |  6 +++---
>   3 files changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 146380118962..c803e14eed91 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -486,7 +486,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job,
>   	bool first;
>   
>   	trace_drm_sched_job(sched_job, entity);
> -	atomic_inc(&entity->rq->sched->score);
> +	atomic_inc(&entity->rq->sched->num_jobs);
>   	WRITE_ONCE(entity->last_user, current->group_leader);
>   	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
>   
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 9a0d77a68018..851443a19ee0 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -92,7 +92,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>   	if (!list_empty(&entity->list))
>   		return;
>   	spin_lock(&rq->lock);
> -	atomic_inc(&rq->sched->score);
>   	list_add_tail(&entity->list, &rq->entities);
>   	spin_unlock(&rq->lock);
>   }
> @@ -111,7 +110,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>   	if (list_empty(&entity->list))
>   		return;
>   	spin_lock(&rq->lock);
> -	atomic_dec(&rq->sched->score);
>   	list_del_init(&entity->list);
>   	if (rq->current_entity == entity)
>   		rq->current_entity = NULL;
> @@ -649,7 +647,7 @@ static void drm_sched_process_job(struct dma_fence *f, struct dma_fence_cb *cb)
>   	struct drm_gpu_scheduler *sched = s_fence->sched;
>   
>   	atomic_dec(&sched->hw_rq_count);
> -	atomic_dec(&sched->score);
> +	atomic_dec(&sched->num_jobs);
>   
>   	trace_drm_sched_process_job(s_fence);
>   
> @@ -714,7 +712,7 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   {
>   	struct drm_gpu_scheduler *sched, *picked_sched = NULL;
>   	int i;
> -	unsigned int min_score = UINT_MAX, num_score;
> +	unsigned int min_jobs = UINT_MAX, num_jobs;
>   
>   	for (i = 0; i < num_sched_list; ++i) {
>   		sched = sched_list[i];
> @@ -725,9 +723,9 @@ drm_sched_pick_best(struct drm_gpu_scheduler **sched_list,
>   			continue;
>   		}
>   
> -		num_score = atomic_read(&sched->score);
> -		if (num_score < min_score) {
> -			min_score = num_score;
> +		num_jobs = atomic_read(&sched->num_jobs);
> +		if (num_jobs < min_jobs) {
> +			min_jobs = num_jobs;
>   			picked_sched = sched;
>   		}
>   	}
> @@ -861,7 +859,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	spin_lock_init(&sched->job_list_lock);
>   	atomic_set(&sched->hw_rq_count, 0);
>   	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> -	atomic_set(&sched->score, 0);
> +	atomic_set(&sched->num_jobs, 0);
>   	atomic64_set(&sched->job_id_count, 0);
>   
>   	/* Each scheduler will run on a seperate kernel thread */
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 92436553fd6a..a33590e62108 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -264,7 +264,7 @@ struct drm_sched_backend_ops {
>    * @job_list_lock: lock to protect the ring_mirror_list.
>    * @hang_limit: once the hangs by a job crosses this limit then it is marked
>    *              guilty and it will be considered for scheduling further.
> - * @score: score to help loadbalancer pick a idle sched
> + * @num_jobs: the number of jobs in queue in the scheduler
>    * @ready: marks if the underlying HW is ready to work
>    * @free_guilty: A hit to time out handler to free the guilty job.
>    *
> @@ -285,8 +285,8 @@ struct drm_gpu_scheduler {
>   	struct list_head		ring_mirror_list;
>   	spinlock_t			job_list_lock;
>   	int				hang_limit;
> -	atomic_t                        score;
> -	bool				ready;
> +	atomic_t                        num_jobs;
> +	bool			ready;
>   	bool				free_guilty;
>   };
>   

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

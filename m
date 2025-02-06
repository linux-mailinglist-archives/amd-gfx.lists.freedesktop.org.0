Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF6A2ADBB
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Feb 2025 17:30:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954F310E8C2;
	Thu,  6 Feb 2025 16:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ZSYuqwlp";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D660A10E2F8
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Feb 2025 13:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pHCOHdgl1CQdb5aZavhcZ9eMIMNN8nWCipVX7+dPp6I=; b=ZSYuqwlp6c2H4s89K3pl7F+YVY
 vIQSq10xd0dM2t2XLctEUUIXG1G1mBBUTOjgP9w7m+gebhEGUSuVJxXadgmjUhqMzorcxbCpi6Bf9
 rBK+mcXVgowm9qgRe2pqC3l3UugMn50QU9wUlj4YQH/5UySiRmXYSenvZnaydp9Nu61+OVEhg0yZW
 8B9E6CkbidiZ5HpXQxLQDZ46+ExnuhSJA1NXYIhBbF9TaAB99GUaiEKuxlidFuaLLDS7UGxc6eoJG
 3wiR5hGucBUu76YGcgP9SvL7t2LR/SqNQkt7xaAsV05qF7M7KkUrs3PXXF2unoJG5f28+eooaY09+
 b/Ae0NOA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tg29L-004r7u-Tq; Thu, 06 Feb 2025 14:42:41 +0100
Message-ID: <2fa9cf6f-1b0b-426f-9ca3-8f12240c6b5f@igalia.com>
Date: Thu, 6 Feb 2025 13:42:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/scheduler: Add drm_sched_cancel_all_jobs helper
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250205153332.14852-1-tvrtko.ursulin@igalia.com>
 <20250205153332.14852-2-tvrtko.ursulin@igalia.com>
 <67d2ebf31e78c7819fee6f8de917829957091a0d.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <67d2ebf31e78c7819fee6f8de917829957091a0d.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 06 Feb 2025 16:29:33 +0000
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


On 06/02/2025 13:35, Philipp Stanner wrote:
> On Wed, 2025-02-05 at 15:33 +0000, Tvrtko Ursulin wrote:
>> The helper copies code from the existing
>> amdgpu_job_stop_all_jobs_on_sched
>> with the purpose of reducing the amount of driver code which directly
>> touch scheduler internals.
>>
>> If or when amdgpu manages to change the approach for handling the
>> permanently wedged state this helper can be removed.
> 
> Have you checked how many other drivers might need such a helper?
> 
> I have a bit mixed feelings about this, because, AFAICT, in the past
> helpers have been added for just 1 driver, such as
> drm_sched_wqueue_ready(), and then they have stayed for almost a
> decade.
> 
> AFAIU this is just code move, and only really "decouples" amdgpu in the
> sense of having an official scheduler function that does what amdgpu
> used to do.
> 
> So my tendency here would be to continue "allowing" amdgpu to touch the
> scheduler internals until amdgpu fixes this "permanently wedged
> state". And if that's too difficult, couldn't the helper reside in a
> amdgpu/sched_helpers.c or similar?
> 
> I think that's better than adding 1 helper for just 1 driver and then
> supposedly removing it again in the future.

I was 50% nudging Christian into providing a more concrete idea on how 
to fix amdgpu ;) and other 50% I want to get rid of three copies of 
to_drm_sched_job and remove the hidden "queue node must be first" 
dependency.

So let it marinate a bit and we will see if a nicer solution shows up.

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 44
>> ++++++++++++++++++++++++++
>>   include/drm/gpu_scheduler.h            |  1 +
>>   2 files changed, 45 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index a48be16ab84f..0363655db22d 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -703,6 +703,50 @@ void drm_sched_start(struct drm_gpu_scheduler
>> *sched, int errno)
>>   }
>>   EXPORT_SYMBOL(drm_sched_start);
>>   
>> +/**
>> + * drm_sched_cancel_all_jobs - Cancel all queued and scheduled jobs
>> + *
>> + * @sched: scheduler instance
>> + * @errno: error value to set on signaled fences
>> + *
>> + * Signal all queued and scheduled jobs and set them to error state.
>> + *
>> + * Scheduler must be stopped before calling this.
>> + */
>> +void drm_sched_cancel_all_jobs(struct drm_gpu_scheduler *sched, int
>> errno)
>> +{
>> +	struct drm_sched_entity *entity;
>> +	struct drm_sched_fence *s_fence;
>> +	struct drm_sched_job *job;
>> +	enum drm_sched_priority p;
>> +
>> +	drm_WARN_ON_ONCE(sched, !sched->pause_submit);
>> +
>> +	/* Signal all jobs not yet scheduled */
>> +	for (p = DRM_SCHED_PRIORITY_KERNEL; p < sched->num_rqs; p++)
>> {
>> +		struct drm_sched_rq *rq = sched->sched_rq[p];
>> +
>> +		spin_lock(&rq->lock);
>> +		list_for_each_entry(entity, &rq->entities, list) {
>> +			while ((job =
>> to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
>> +				s_fence = job->s_fence;
>> +				dma_fence_signal(&s_fence-
>>> scheduled);
>> +				dma_fence_set_error(&s_fence-
>>> finished, errno);
>> +				dma_fence_signal(&s_fence-
>>> finished);
>> +			}
>> +		}
>> +		spin_unlock(&rq->lock);
>> +	}
>> +
>> +	/* Signal all jobs already scheduled to HW */
>> +	list_for_each_entry(job, &sched->pending_list, list) {
>> +		s_fence = job->s_fence;
>> +		dma_fence_set_error(&s_fence->finished, errno);
>> +		dma_fence_signal(&s_fence->finished);
>> +	}
>> +}
>> +EXPORT_SYMBOL(drm_sched_cancel_all_jobs);
>> +
>>   /**
>>    * drm_sched_resubmit_jobs - Deprecated, don't use in new code!
>>    *
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index a0ff08123f07..298513f8c327 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -579,6 +579,7 @@ void drm_sched_wqueue_stop(struct
>> drm_gpu_scheduler *sched);
>>   void drm_sched_wqueue_start(struct drm_gpu_scheduler *sched);
>>   void drm_sched_stop(struct drm_gpu_scheduler *sched, struct
>> drm_sched_job *bad);
>>   void drm_sched_start(struct drm_gpu_scheduler *sched, int errno);
>> +void drm_sched_cancel_all_jobs(struct drm_gpu_scheduler *sched, int
>> errno);
>>   void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
>>   void drm_sched_increase_karma(struct drm_sched_job *bad);
>>   void drm_sched_reset_karma(struct drm_sched_job *bad);
> 

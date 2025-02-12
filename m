Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE078A32800
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Feb 2025 15:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F228B10E372;
	Wed, 12 Feb 2025 14:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="osJm8Hxs";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1567010E1D3;
 Wed, 12 Feb 2025 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+bHpORab0cpD2gSIkz9+/Rf8s/pD3BFO3UOsPtRwoag=; b=osJm8Hxsfghf1zhC+UEmjFKUwh
 BsI8OQ1/IjE97+94i/YLuf58hwAhI7+Oov5/ePySSXq+IH0p6qkfGwGZ9AWRIwXd3QuljWk8MxxtD
 ExgDE5GyIM/GtYcZRv/tl9xjyttdvcwtWxXpW473jleeZkZxcmMNRTceEOsTsU9oW1larUZfeMLiN
 wukShsORafdxcoxi2F+PGovHxG4qcgaYNz4UHI6k2OG1dJsHQUdPZOrB3WIp0UT1XoN9AxZJgZocr
 nNUT5YxFu1NbzFbaoWMnpB+HVjMMzEjh0fwLKpWDRGjR5NCMGh5Emae6XqAq20lbOPs3mb9OfwFKI
 u9ji6PSw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tiBsR-008EtL-N0; Wed, 12 Feb 2025 13:30:09 +0100
Message-ID: <54da7c5c-a66c-4410-880c-2efebbb66214@igalia.com>
Date: Wed, 12 Feb 2025 12:30:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/sched: Add internal job peek/pop API
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250207145104.60455-1-tvrtko.ursulin@igalia.com>
 <20250207145104.60455-2-tvrtko.ursulin@igalia.com>
 <73ffd26bdd66ec25c01f820366a63f9ceedad2c8.camel@mailbox.org>
 <8ce06914-f8ec-4b28-9cc2-6ff9d9fe47db@igalia.com>
 <30be58cb90e95af0d9404082ea5c63eb8f7e9dad.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <30be58cb90e95af0d9404082ea5c63eb8f7e9dad.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Feb 2025 14:08:23 +0000
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


On 12/02/2025 10:40, Philipp Stanner wrote:
> On Wed, 2025-02-12 at 09:32 +0000, Tvrtko Ursulin wrote:
>>
>> On 12/02/2025 09:02, Philipp Stanner wrote:
>>> On Fri, 2025-02-07 at 14:50 +0000, Tvrtko Ursulin wrote:
>>>> Idea is to add helpers for peeking and popping jobs from entities
>>>> with
>>>> the goal of decoupling the hidden assumption in the code that
>>>> queue_node
>>>> is the first element in struct drm_sched_job.
>>>>
>>>> That assumption usually comes in the form of:
>>>>
>>>>     while ((job = to_drm_sched_job(spsc_queue_pop(&entity-
>>>>> job_queue))))
>>>>
>>>> Which breaks if the queue_node is re-positioned due
>>>> to_drm_sched_job
>>>> being implemented with a container_of.
>>>>
>>>> This also allows us to remove duplicate definitions of
>>>> to_drm_sched_job.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c   | 11 +++---
>>>>    drivers/gpu/drm/scheduler/sched_internal.h | 46
>>>> ++++++++++++++++++++++
>>>>    drivers/gpu/drm/scheduler/sched_main.c     |  7 ++--
>>>>    3 files changed, 54 insertions(+), 10 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/scheduler/sched_internal.h
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index 69bcf0e99d57..a171f05ad761 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -28,11 +28,10 @@
>>>>    #include <drm/drm_print.h>
>>>>    #include <drm/gpu_scheduler.h>
>>>>    
>>>> +#include "sched_internal.h"
>>>> +
>>>>    #include "gpu_scheduler_trace.h"
>>>>    
>>>> -#define to_drm_sched_job(sched_job)		\
>>>> -		container_of((sched_job), struct drm_sched_job,
>>>> queue_node)
>>>> -
>>>>    /**
>>>>     * drm_sched_entity_init - Init a context entity used by
>>>> scheduler
>>>> when
>>>>     * submit to HW ring.
>>>> @@ -255,7 +254,7 @@ static void drm_sched_entity_kill(struct
>>>> drm_sched_entity *entity)
>>>>    	/* The entity is guaranteed to not be used by the
>>>> scheduler
>>>> */
>>>>    	prev = rcu_dereference_check(entity->last_scheduled,
>>>> true);
>>>>    	dma_fence_get(prev);
>>>> -	while ((job = to_drm_sched_job(spsc_queue_pop(&entity-
>>>>> job_queue)))) {
>>>> +	while ((job = drm_sched_entity_queue_pop(entity))) {
>>>>    		struct drm_sched_fence *s_fence = job->s_fence;
>>>>    
>>>>    		dma_fence_get(&s_fence->finished);
>>>> @@ -477,7 +476,7 @@ struct drm_sched_job
>>>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>    {
>>>>    	struct drm_sched_job *sched_job;
>>>>    
>>>> -	sched_job = to_drm_sched_job(spsc_queue_peek(&entity-
>>>>> job_queue));
>>>> +	sched_job = drm_sched_entity_queue_peek(entity);
>>>>    	if (!sched_job)
>>>>    		return NULL;
>>>>    
>>>> @@ -513,7 +512,7 @@ struct drm_sched_job
>>>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>    	if (drm_sched_policy == DRM_SCHED_POLICY_FIFO) {
>>>>    		struct drm_sched_job *next;
>>>>    
>>>> -		next = to_drm_sched_job(spsc_queue_peek(&entity-
>>>>> job_queue));
>>>> +		next = drm_sched_entity_queue_peek(entity);
>>>>    		if (next) {
>>>>    			struct drm_sched_rq *rq;
>>>>    
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_internal.h
>>>> b/drivers/gpu/drm/scheduler/sched_internal.h
>>>> new file mode 100644
>>>> index 000000000000..25ac62ac2bf3
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/scheduler/sched_internal.h
>>>> @@ -0,0 +1,46 @@
>>>> +#ifndef _DRM_GPU_SCHEDULER_INTERNAL_H_
>>>> +#define _DRM_GPU_SCHEDULER_INTERNAL_H_
>>>> +
>>>> +/**
>>>> + * drm_sched_entity_queue_pop - Low level helper for popping
>>>> queued
>>>> jobs
>>>> + *
>>>> + * @entity: scheduler entity
>>>> + *
>>>> + * Low level helper for popping queued jobs.
>>>> + *
>>>> + * Returns the job dequeued or NULL.
>>>> + */
>>>> +static inline struct drm_sched_job *
>>>> +drm_sched_entity_queue_pop(struct drm_sched_entity *entity)
>>>> +{
>>>> +	struct spsc_node *node;
>>>> +
>>>> +	node = spsc_queue_pop(&entity->job_queue);
>>>> +	if (!node)
>>>> +		return NULL;
>>>> +
>>>> +	return container_of(node, struct drm_sched_job,
>>>> queue_node);
>>>> +}
>>>> +
>>>> +/**
>>>> + * drm_sched_entity_queue_peek - Low level helper for peeking at
>>>> the
>>>> job queue
>>>> + *
>>>> + * @entity: scheduler entity
>>>> + *
>>>> + * Low level helper for peeking at the job queue
>>>> + *
>>>> + * Returns the job at the head of the queue or NULL.
>>>
>>> I would like to (slowly) work towards a unified style regarding the
>>> docstrings. They're currently relatively inconsistent in drm/sched.
>>>
>>> I think we should do it that way:
>>>
>>> ""
>>> @entity: scheduler entity
>>>
>>> Returns: the job at the head of the queue or NULL.
>>>
>>> Low level helper for peeking at the the job queue.
>>> ""
>>
>> Returns before the description would be yet another new style, no?
>> I's
>> say that if we are churning lets follow
>> Documentation/doc-guide/kernel-doc.rst.
> 
> Oh yes, you are right – official guideline demands "Return:" at the
> end. So let's go for that for contributions.

So you want me to respin or are you okay with doing all scheduler kernel 
doc in one patch afterwards?

Regards,

Tvrtko

>>   Or even consider sending a patch
>> which churns everything at once.
>>
>> Regards,
>>
>> Tvrtko
>>
>>>> + */
>>>> +static inline struct drm_sched_job *
>>>> +drm_sched_entity_queue_peek(struct drm_sched_entity *entity)
>>>> +{
>>>> +	struct spsc_node *node;
>>>> +
>>>> +	node = spsc_queue_peek(&entity->job_queue);
>>>> +	if (!node)
>>>> +		return NULL;
>>>> +
>>>> +	return container_of(node, struct drm_sched_job,
>>>> queue_node);
>>>> +}
>>>> +
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>> index a48be16ab84f..9f614a775c49 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>> @@ -78,6 +78,8 @@
>>>>    #include <drm/gpu_scheduler.h>
>>>>    #include <drm/spsc_queue.h>
>>>>    
>>>> +#include "sched_internal.h"
>>>> +
>>>>    #define CREATE_TRACE_POINTS
>>>>    #include "gpu_scheduler_trace.h"
>>>>    
>>>> @@ -87,9 +89,6 @@ static struct lockdep_map drm_sched_lockdep_map
>>>> = {
>>>>    };
>>>>    #endif
>>>>    
>>>> -#define to_drm_sched_job(sched_job)		\
>>>> -		container_of((sched_job), struct drm_sched_job,
>>>> queue_node)
>>>> -
>>>>    int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>>>>    
>>>>    /**
>>>> @@ -123,7 +122,7 @@ static bool drm_sched_can_queue(struct
>>>> drm_gpu_scheduler *sched,
>>>>    {
>>>>    	struct drm_sched_job *s_job;
>>>>    
>>>> -	s_job = to_drm_sched_job(spsc_queue_peek(&entity-
>>>>> job_queue));
>>>> +	s_job = drm_sched_entity_queue_peek(entity);
>>>>    	if (!s_job)
>>>>    		return false;
>>>>    
>>>
>>
> 


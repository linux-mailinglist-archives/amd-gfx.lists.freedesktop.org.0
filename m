Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAqMMKDSAmpJxwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2026 09:11:28 +0200
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B851B85D
	for <lists+amd-gfx@lfdr.de>; Tue, 12 May 2026 09:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E0810E1A2;
	Tue, 12 May 2026 07:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="l3F7AfJ6";
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="UhP0azxZ";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D90C10E989
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 May 2026 07:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; r=y; 
 h=From:To:Subject:Date:Message-ID; t=1778569873; bh=gB967kMoFBU79CAvgGO3kXD
 qsn2sIDWBY6JVGo4Lmf0=; b=l3F7AfJ6OSikEHW9WZBwzfWsa/ok1CKQJBaR4VxJYVADGrtgxy
 6l+cXh3rlDJ3Em2TIfDPzQepxrYbJ+hIsjAg==;
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed;
 r=y; 
 h=From:To:Subject:Date:Message-ID; t=1778569873; bh=gB967kMoFBU79CAvgGO3kXD
 qsn2sIDWBY6JVGo4Lmf0=; b=UhP0azxZZyrkz8SsrBai73Os9VIo+Q/kCej+CliMVl65C/6wLk
 uueM7K8ilrVno64zpwJk6t5QmPfAeoZEKQlDl4UEX+HMBbL7oTLBgl0/DjEt3GQVyydPnXN6sHa
 jy5AcqxxxooYY+TWolQ+r4wGDYJujcCIaIKTp7M9wJ2Io+rH9gULCY+/j4FX8BqNBJGVsbeEsll
 assPscMWxIGdxXm+37XOLCbxwLWWC3WnAmM7DbznKdJCP/JxGGeWo/1YM8Mnm1d8iTxU5wYJqKq
 BsYldRr1JD34j+fweU2C92H4RsmaK6jVebWt/AOiZyJkgfrML5uY5lCEcPr3AvJ9PVA==;
Message-ID: <660f56b2-7a64-4f45-af69-3fb07c4bb848@damsy.net>
Date: Tue, 12 May 2026 09:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/amdgpu: add userq create and destroy tracepoints
To: "Khatri, Sunil" <sukhatri@amd.com>, Prike Liang <Prike.Liang@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: Alexander.Deucher@amd.com, Christian.Koenig@amd.com,
 "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
References: <20260511135435.3818345-1-Prike.Liang@amd.com>
 <c4c71c7d-01f0-4249-9f8b-c10662f16b64@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <c4c71c7d-01f0-4249-9f8b-c10662f16b64@amd.com>
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
X-Rspamd-Queue-Id: 253B851B85D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[damsy.net:s=202408e,damsy.net:s=202408r];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[damsy.net];
	FORGED_RECIPIENTS(0.00)[m:sukhatri@amd.com,m:Prike.Liang@amd.com,m:Alexander.Deucher@amd.com,m:Christian.Koenig@amd.com,m:Pierre-eric.Pelloux-prayer@amd.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,damsy.net:mid,damsy.net:dkim]
X-Rspamd-Action: no action



Le 11/05/2026 à 15:57, Khatri, Sunil a écrit :
> If i am not wrong Pierre eric did work on the traces for user queues. I have dropped my patches for 
> the same reason but not sure if the traces patches are merged. Could you check with him once ?

No my patches aren't merged; their scope is to expose something similar to gpu_scheduler events to 
be able to observe user queues activity.

> 
> On 11-05-2026 07:24 pm, Prike Liang wrote:
>> Add ftrace events around user queue creation and destruction to profile
>> queue setup and teardown latency.

IMO these events look like something that could be done with the function tracer (optionally using 
the func-args feature) by tracing amdgpu_userq_destroy / amdgpu_userq_create entry and exit.

Pierre-Eric


>>
>> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h | 58 +++++++++++++++++++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 11 +++++
>>   2 files changed, 69 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> index d13e64a69e25..5a01f63d1f32 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h
>> @@ -578,6 +578,64 @@ TRACE_EVENT(amdgpu_reset_reg_dumps,
>>                 __entry->value)
>>   );
>> +DECLARE_EVENT_CLASS(amdgpu_userq_queue,
>> +        TP_PROTO(struct amdgpu_usermode_queue *queue),
>> +        TP_ARGS(queue),
>> +        TP_STRUCT__entry(
>> +                 __field(struct amdgpu_usermode_queue *, queue)
>> +                 __field(u64, doorbell_index)
>> +                 __field(int, queue_type)
>> +                 __field(int, state)
>> +                 __field(u32, xcp_id)
>> +                 ),
>> +        TP_fast_assign(
>> +               __entry->queue = queue;
>> +               __entry->doorbell_index = queue ? queue->doorbell_index : 0;
>> +               __entry->queue_type = queue ? queue->queue_type : -1;
>> +               __entry->state = queue ? queue->state : -1;
>> +               __entry->xcp_id = queue ? queue->xcp_id : 0;
>> +               ),
>> +        TP_printk("queue=%p, doorbell=%llu, type=%d, state=%d, xcp_id=%u",
>> +              __entry->queue, __entry->doorbell_index,
>> +              __entry->queue_type, __entry->state, __entry->xcp_id)
>> +);
>> +DEFINE_EVENT(amdgpu_userq_queue, amdgpu_userq_create_start,
>> +         TP_PROTO(struct amdgpu_usermode_queue *queue),
>> +         TP_ARGS(queue));
>> +DEFINE_EVENT(amdgpu_userq_queue, amdgpu_userq_destroy_start,
>> +         TP_PROTO(struct amdgpu_usermode_queue *queue),
>> +         TP_ARGS(queue));
>> +DECLARE_EVENT_CLASS(amdgpu_userq_queue_result,
>> +        TP_PROTO(struct amdgpu_usermode_queue *queue, int result),
>> +        TP_ARGS(queue, result),
>> +        TP_STRUCT__entry(
>> +                 __field(struct amdgpu_usermode_queue *, queue)
>> +                 __field(u64, doorbell_index)
>> +                 __field(int, queue_type)
>> +                 __field(int, state)
>> +                 __field(u32, xcp_id)
>> +                 __field(int, result)
>> +                 ),
>> +        TP_fast_assign(
>> +               __entry->queue = queue;
>> +               __entry->doorbell_index = queue ? queue->doorbell_index : 0;
>> +               __entry->queue_type = queue ? queue->queue_type : -1;
>> +               __entry->state = queue ? queue->state : -1;
>> +               __entry->xcp_id = queue ? queue->xcp_id : 0;
>> +               __entry->result = result;
>> +               ),
>> +        TP_printk("queue=%p, doorbell=%llu, type=%d, state=%d, xcp_id=%u, result=%d",
>> +              __entry->queue, __entry->doorbell_index,
>> +              __entry->queue_type, __entry->state,
>> +              __entry->xcp_id, __entry->result)
>> +);
>> +DEFINE_EVENT(amdgpu_userq_queue_result, amdgpu_userq_create_end,
>> +         TP_PROTO(struct amdgpu_usermode_queue *queue, int result),
>> +         TP_ARGS(queue, result));
>> +DEFINE_EVENT(amdgpu_userq_queue_result, amdgpu_userq_destroy_end,
>> +         TP_PROTO(struct amdgpu_usermode_queue *queue, int result),
>> +         TP_ARGS(queue, result));
>> +
>>   #undef AMDGPU_JOB_GET_TIMELINE_NAME
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>> index 3077ca4e27a0..50c46d31fbae 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
>> @@ -33,6 +33,7 @@
>>   #include "amdgpu_userq.h"
>>   #include "amdgpu_hmm.h"
>>   #include "amdgpu_userq_fence.h"
>> +#include "amdgpu_trace.h"
>>   u32 amdgpu_userq_get_supported_ip_mask(struct amdgpu_device *adev)
>>   {
>> @@ -617,6 +618,8 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
>>       int r = 0;
>> +    trace_amdgpu_userq_destroy_start(queue);
>> +
>>       cancel_delayed_work_sync(&uq_mgr->resume_work);
>>       /* Cancel any pending hang detection work and cleanup */
>> @@ -625,6 +628,7 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
>>       r = amdgpu_bo_reserve(vm->root.bo, false);
>>       if (r) {
>>           drm_file_err(uq_mgr->file, "Failed to reserve root bo during userqueue destroy\n");
>> +        trace_amdgpu_userq_destroy_end(queue, r);
>>           return r;
>>       }
>>       amdgpu_userq_buffer_vas_list_cleanup(adev, queue);
>> @@ -650,6 +654,7 @@ amdgpu_userq_destroy(struct amdgpu_userq_mgr *uq_mgr, struct amdgpu_usermode_que
>>       amdgpu_bo_unpin(queue->wptr_obj.obj);
>>       amdgpu_bo_unreserve(queue->wptr_obj.obj);
>>       amdgpu_bo_unref(&queue->wptr_obj.obj);
>> +    trace_amdgpu_userq_destroy_end(queue, r);
>>       kfree(queue);
>>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
>> @@ -754,6 +759,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>>       mutex_init(&queue->fence_drv_lock);
>>       xa_init_flags(&queue->fence_drv_xa, XA_FLAGS_ALLOC);
>> +    trace_amdgpu_userq_create_start(queue);
>>       r = amdgpu_userq_fence_driver_alloc(adev, &queue->fence_drv);
>>       if (r)
>>           goto free_queue;
>> @@ -809,6 +815,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>>            * This drops the extra and last reference which should take
>>            * care of all cleanup.
>>            */
>> +        trace_amdgpu_userq_create_end(queue, r);
>>           amdgpu_userq_put(queue);
>>           amdgpu_userq_put(queue);
>>           return r;
>> @@ -826,6 +833,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>>           r = amdgpu_userq_map_helper(queue);
>>           if (r) {
>>               drm_file_err(uq_mgr->file, "Failed to map Queue\n");
>> +            trace_amdgpu_userq_create_end(queue, r);
>>               mutex_unlock(&uq_mgr->userq_mutex);
>>               /* Prevent racing with close */
>>               if (xa_erase(&uq_mgr->userq_xa, qid) == queue)
>> @@ -839,6 +847,7 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>>       atomic_inc(&uq_mgr->userq_count[queue->queue_type]);
>>       amdgpu_debugfs_userq_init(filp, queue, qid);
>> +    trace_amdgpu_userq_create_end(queue, 0);
>>       amdgpu_userq_put(queue);
>>       args->out.queue_id = qid;
>>       return 0;
>> @@ -853,6 +862,8 @@ amdgpu_userq_create(struct drm_file *filp, union drm_amdgpu_userq *args)
>>   free_fence_drv:
>>       amdgpu_userq_fence_driver_free(queue);
>>   free_queue:
>> +    if (queue)
>> +        trace_amdgpu_userq_create_end(queue, r);
>>       kfree(queue);
>>   err_pm_runtime:
>>       pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
Delivered-To: lists+amd-gfx@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KgSIQcTuGk7YwEAu9opvQ
	(envelope-from <amd-gfx-bounces@lists.freedesktop.org>)
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2026 15:26:15 +0100
X-Original-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E239429B4E3
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Mar 2026 15:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8354410E4C1;
	Mon, 16 Mar 2026 14:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Ss2r5/kx";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9603C10E258
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Mar 2026 14:26:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4853f2826f7so49714975e9.1
 for <amd-gfx@lists.freedesktop.org>; Mon, 16 Mar 2026 07:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1773671171; x=1774275971; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lUMjjKArKDz97Vxi0wkgrIvjmi+uynrAa1Cbkv56j+E=;
 b=Ss2r5/kxGBdOPlJ3vkL2iQP71bjXP0O+h07fIrrjz0vxccaYrfdkQCJ1cN7Zsq0DiF
 CCJAKM24BhW0jNDaG11F1++jJUoOUbzye7tm0t8EpEDgm7yIM3ge+ZvUVHxcZN03+jE/
 ks6YYe1zTpp5RSe1SixUTxJa30ODz5r3n4XQscOgeDFAw0meBh8kWGBMv25EUSWjfc0G
 4BNGwHiwImyPmpyEeEY0vavEdLdhUfPEM0k2TRl7evakOgLccMZnsl/CdBcDwrhnCoLw
 WhOJvaUVCzPPhfAVRFbfJ07xtm7hs5GqtGT2c95vu1+Ao51XXmIDUUcGd4GEPdwBbUS+
 axaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773671171; x=1774275971;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lUMjjKArKDz97Vxi0wkgrIvjmi+uynrAa1Cbkv56j+E=;
 b=YL2FEEncGkck4saa4+GQW6iP/EmlM+6MYZdIhgbzX5X3laY+ECr4kkhjxexvVrNGTP
 JNC3DqkIHN9LIyAJSAwMMcFSk/8BEiyh+O1TahWqzU1S7XlLrdsV2EvwM4++j+Qvo9KZ
 y5CnEYJdAGFiPMAuGfWPrPTI5qO/L7VRulzqAyJnRPUJRP4lrtTk9GyaQ3/w8aiju59u
 J9sOu3w35aUl3zIiDpvpxS0NNvUZFcPXhXA6ToyGC0vxpTI2JhBAUtNKsAeIhQVvNBGI
 tKSeJ7/Wo6IHEg8EV1ntBKZt1SzMWI1ZqH6zqckIy195AgKe/WIUNbQaiQJp4XbVy+rV
 M8Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHrOD7JheNJy251dZoW85FXcfeEusKgsmUHUzyedB0H+Af1qaQFjn72R2CvH9YXimVAmR6+FCV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkCHU1upQgZEJCNqJ/uJMmU3ZFJ9lhwq/SrJd99o5+g8HSmCTJ
 lSxBkf2e46tq+b5VNyn4F2ok5eB7Vf5PJzpNi6QH/TFkidcyfkonU0qDFh9HN821lXA=
X-Gm-Gg: ATEYQzy4kCcBUNPhUtPS0mIxHM4Nv60wuokXwKZZMiKSVMPVcznptkQzQif+oSxNLNB
 37qcG7lJux6WR/+LF0cHl/M4IopVuKJPggHPp1BpL8or+wGACA2SDEjbD7HXixoH85oJq2KuANT
 w3XVFNnO6zrd3XWeFnfMkQazwKpIABxvz5kQkXzlOzWyFbzc2JTpt/vCyyLNTEnv5Dzp2H34BFJ
 C5fG33UyeMnZ+G+LuKeH0/g6lcFwWzDLHJtc1eVxJolfn/YjQe67EiJ7RyvvvCNyXTAXVQx5+z5
 +ZDqyLaLetF/RejHDHKcPUrRDlIWG46e/1RA/sqSlo+a1GqkIAnuk7YjGgFpePAkeoxIRTgYKoa
 xXwH8ZO3VKNwrpMoJNTEG/mxY+uYDGOw3p+UanM6jzOteJvzy/zI3kbuosYb8VbixDqrikuJ352
 /MpjCsVaf8oiyONymLL8cHP+aOdYXqudGGq3xAb2FO6TKR
X-Received: by 2002:a05:600c:8b45:b0:485:30d4:6b9e with SMTP id
 5b1f17b1804b1-48556702853mr217298095e9.21.1773671170106; 
 Mon, 16 Mar 2026 07:26:10 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b65fed7sm400382775e9.11.2026.03.16.07.26.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2026 07:26:09 -0700 (PDT)
Message-ID: <da586f1e-747f-4991-93b8-21c2a0eac962@ursulin.net>
Date: Mon, 16 Mar 2026 14:26:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] drm/amdgpu: restructure VM state machine
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alexander.Deucher@amd.com, Prike.Liang@amd.com,
 Yogesh.Mohanmarimuthu@amd.com, SRINIVASAN.SHANMUGAM@amd.com,
 Sunil.Khatri@amd.com, amd-gfx@lists.freedesktop.org
References: <20260310191327.2279-1-christian.koenig@amd.com>
 <20260310191327.2279-2-christian.koenig@amd.com>
 <b0a6f3b1-c11e-4b5d-ba12-a4e7564518a4@ursulin.net>
 <cd5f4df5-e532-4512-861b-5bf361b25f0e@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <cd5f4df5-e532-4512-861b-5bf361b25f0e@amd.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ursulin.net:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[ursulin.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:Alexander.Deucher@amd.com,m:Prike.Liang@amd.com,m:Yogesh.Mohanmarimuthu@amd.com,m:SRINIVASAN.SHANMUGAM@amd.com,m:Sunil.Khatri@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[amd-gfx@lists.freedesktop.org];
	DKIM_TRACE(0.00)[ursulin.net:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[amd-gfx@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tursulin@ursulin.net,amd-gfx-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[amd-gfx];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ursulin.net:dkim,ursulin.net:mid]
X-Rspamd-Queue-Id: E239429B4E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 16/03/2026 13:44, Christian König wrote:
> Hi,
> 
> On 3/12/26 15:32, Tvrtko Ursulin wrote:
>>
>> On 10/03/2026 19:13, Christian König wrote:
>>> Instead of comming up with more sophisticated names for states a VM BO
>>
>> s/comming/coming/, and maybe a comma after "in" in the row below.
>>
>>> can be in group them by the type of BO first and then by the state.
>>>
>>> So we end with BO type kernel, shared_resv and individual_resv and then
>>> states evicted, moved and idle.
>>>
>>> Not much functional change, except that evicted_user is moved back
>>> together with the other BOs again which makes the handling in
>>> amdgpu_vm_validate() a bit more complex. Also fixes a problem with user
>>> queues and amdgpu_vm_ready().
>>
>> It would be good to describe the problem at least a little bit, especially if it was a significant reason for the patch.
> 
> Thanks for the comments, fixed in the next version.
> 
>>> -static void amdgpu_vm_bo_invalidated(struct amdgpu_vm_bo_base *vm_bo)
>>> +/* Eventually unlock the status list lock again */
>>> +static void amdgpu_vm_bo_unlock_lists(struct amdgpu_vm_bo_base *vm_bo)
>>>    {
>>> -    spin_lock(&vm_bo->vm->invalidated_lock);
>>> -    list_move(&vm_bo->vm_status, &vm_bo->vm->invalidated);
>>> -    spin_unlock(&vm_bo->vm->invalidated_lock);
>>> +    if (!amdgpu_vm_is_bo_always_valid(vm_bo->vm, vm_bo->bo))
>>> +        spin_unlock(&vm_bo->vm->invalidated_lock);
>>
>> Worth putting an assert vm is locked on the else path? Could be given the new API (amdgpu_vm_bo_lock_lists) is a bit odd in that for always valid it expects vm already locked and for other takes a different lock.
> 
> Good point, fixed as well.
> 
>>> @@ -412,14 +384,16 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>>>        amdgpu_vm_update_stats_locked(base, bo->tbo.resource, +1);
>>>        spin_unlock(&vm->stats_lock);
>>>    -    if (!amdgpu_vm_is_bo_always_valid(vm, bo))
>>> +    if (!amdgpu_vm_is_bo_always_valid(vm, bo)) {
>>> +        amdgpu_vm_bo_idle(base);
>>
>> Hm on what list is it today?
> 
> None, the status member was just initialized with INIT_LIST_HEAD().
> 
> Since it doesn't has any mappings yet putting it on the idle list sounds perfectly valid to me.

Sounds plausible. I asked becuase I detected an unexpected change.

> 
>>>    int amdgpu_vm_lock_done_list(struct amdgpu_vm *vm, struct drm_exec *exec,
>>>                     unsigned int num_fences)
>>>    {
>>> -    struct list_head *prev = &vm->done;
>>> +    struct list_head *prev = &vm->individual_resv.idle;
>>
>> Should this access be under the lock?
> 
> No, prev is the pointer which is always valid. In this case here pointing to the list head.

Ah okay, I see now that the prev local is overloaded, which I initially 
missed.

> 
> Only prev->next can only be trusted while holding the spinlock. That is also documented by the comment below.
> 
>>>        struct amdgpu_bo_va *bo_va;
>>>        struct amdgpu_bo *bo;
>>>        int ret;
>>>          /* We can only trust prev->next while holding the lock */
>>>        spin_lock(&vm->invalidated_lock);
>>> -    while (!list_is_head(prev->next, &vm->done)) {
>>> +    while (!list_is_head(prev->next, &vm->individual_resv.idle)) {
>>>            bo_va = list_entry(prev->next, typeof(*bo_va), base.vm_status);
>>>              bo = bo_va->base.bo;
>>> @@ -584,7 +558,6 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>    {
>>>        uint64_t new_vm_generation = amdgpu_vm_generation(adev, vm);
>>>        struct amdgpu_vm_bo_base *bo_base, *tmp;
>>> -    struct amdgpu_bo *bo;
>>>        int r;
>>>          if (vm->generation != new_vm_generation) {
>>> @@ -596,38 +569,52 @@ int amdgpu_vm_validate(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>>                return r;
>>>        }
>>>    -    list_for_each_entry_safe(bo_base, tmp, &vm->evicted, vm_status) {
>>> -        bo = bo_base->bo;
>>> -
>>> -        r = validate(param, bo);
>>> +    list_for_each_entry_safe(bo_base, tmp, &vm->kernel.evicted, vm_status) {
>>> +        r = validate(param, bo_base->bo);
>>>            if (r)
>>>                return r;
>>>    -        if (bo->tbo.type != ttm_bo_type_kernel) {
>>> -            amdgpu_vm_bo_moved(bo_base);
>>> -        } else {
>>> -            vm->update_funcs->map_table(to_amdgpu_bo_vm(bo));
>>> -            amdgpu_vm_bo_relocated(bo_base);
>>> -        }
>>> +        vm->update_funcs->map_table(to_amdgpu_bo_vm(bo_base->bo));
>>> +        amdgpu_vm_bo_moved(bo_base);
>>>        }
>>>    -    if (ticket) {
>>> -        list_for_each_entry_safe(bo_base, tmp, &vm->evicted_user,
>>> -                     vm_status) {
>>> -            bo = bo_base->bo;
>>> -            dma_resv_assert_held(bo->tbo.base.resv);
>>> +    amdgpu_vm_eviction_lock(vm);
>>> +    vm->evicting = false;
>>> +    amdgpu_vm_eviction_unlock(vm);
>>
>> Is there a specific reason this block is right here and not at the end as today?
> 
> The evicting status reflects if the page tables are at the location where they should be for an updated (VRAM/GTT, accessible by the GPU).
> 
> The status of the always_valid/per VM BOs doesn't matter for that.

Got it. Could be worth putting a comment to that effect above the 
lock-evicting=false-unlock block.

> This has caused a few problems for userqueues and is the issue I described in the commit message.
> 
>>
>>>    -            r = validate(param, bo);
>>> -            if (r)
>>> -                return r;
>>> +    list_for_each_entry_safe(bo_base, tmp, &vm->shared_resv.evicted,
>>> +                 vm_status) {
>>> +        r = validate(param, bo_base->bo);
>>> +        if (r)
>>> +            return r;
>>>    -            amdgpu_vm_bo_invalidated(bo_base);
>>> -        }
>>> +        amdgpu_vm_bo_moved(bo_base);
>>>        }
>>>    -    amdgpu_vm_eviction_lock(vm);
>>> -    vm->evicting = false;
>>> -    amdgpu_vm_eviction_unlock(vm);
>>> +    if (!ticket)
>>> +        return 0;
>>> +
>>> +    spin_lock(&vm->invalidated_lock);
>>> +    list_for_each_entry(bo_base, &vm->individual_resv.evicted, vm_status) {
>>> +        struct amdgpu_bo *bo = bo_base->bo;
>>> +
>>> +        if (dma_resv_locking_ctx(bo->tbo.base.resv) != ticket)
>>> +            continue;
>>
>> What is this for?
> 
> Only certain elements on the list are locked, we skip the ones which aren't.

Also is probably worth a comment.

>>> +
>>> +        spin_unlock(&vm->invalidated_lock);
>>> +
>>> +        r = validate(param, bo);
>>> +        if (r)
>>> +            return r;
>>> +
>>> +        /* need to grab the invalidated lock to trust prev here */
>>> +        spin_lock(&vm->invalidated_lock);
>>> +        tmp = list_entry(bo_base->vm_status.prev, typeof(*tmp),
>>> +                 vm_status);
>>
>> Why is this safe? Lock was dropped while the current element was left in the list so anything could have happened. Even if current element was unlinked before dropping the lock, I don't see how it is safe to assume the previous element is still valid. Does it rely on dma-resve being held over the whole function? The current method of restarting from the head is certainly easier to understand.
> 
> The whole list is protected by the spinlock, but individual elements can only move while holding their resv lock.
> 
> Now what we do is to walk the list until we find one where the resv lock is locked individually, so that we know that it is save to drop the spinlock.
> 
> We then validate the entry we found and try restart from the entry before the one we found.
> 
> Going over the list again until we can't find any more is probably easier to understand but also less effective.

If prev wasn't locked with the same resv (so would be skipped) it 
couldn't have been unlinked and freed in the meantime?

> 
>>>    -    seq_puts(m, "\tRelocated BOs:\n");
>>> -    list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status) {
>>> -        if (!bo_va->base.bo)
>>> -            continue;
>>> -        total_relocated += amdgpu_bo_print_info(id++, bo_va->base.bo, m);
>>> +        amdgpu_bo_print_info(id++, base->bo, m);
>>
>> Probably just thinking out loud - given the format of the debugfs file is changing anyway, and that this id is both unstable cat-to-cat and also has no relation to the user handle which is output by the only other caller so could be confusing/misleading, I wonder if it is even worth bothering with it. For example you could pass zero and even modify (or not, optional) amdgpu_bo_print_info to skip it if handle is zero.
> 
> Yeah I was thinking the same thing. The id is really completely pointless.
> 
> But I think that is for a different patch.

Yep.

>>>         *
>>>         * Lists are protected by the invalidated_lock.
>>>         */
>>>        spinlock_t        invalidated_lock;
>>>    -    /* BOs for user mode queues that need a validation */
>>> -    struct list_head    evicted_user;
>>> -
>>> -    /* regular invalidated BOs, but not yet updated in the PT */
>>> -    struct list_head    invalidated;
>>> -
>>> -    /* BOs which are invalidated, has been updated in the PTs */
>>> -    struct list_head        done;
>>> +    /* Userspace BOs with individual resv object */
>>> +    struct amdgpu_vm_bo_status    individual_resv;
>>
>> Are all state transitions valid for all lists? If not it would be good to put that info in the respective comments.
> 
> Yes they are.

Okay. I think I had a specific reason why I asked this but it evaporated 
from my head since Thursday. Never mind.

What is btw the difference between vm_bo->moved == true and fact of 
being on the moved list, or not?

Regards,

Tvrtko

> 
> Thanks for the review,
> Christian.
> 
>>
>>>          /*
>>>         * This list contains amdgpu_bo_va_mapping objects which have been freed
>>
>> Regards,
>>
>> Tvrtko
> 


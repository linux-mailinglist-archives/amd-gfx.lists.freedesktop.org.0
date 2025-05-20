Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B04FAABE08E
	for <lists+amd-gfx@lfdr.de>; Tue, 20 May 2025 18:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFC410E561;
	Tue, 20 May 2025 16:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KSvJyocr";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E815E10E561
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 May 2025 16:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oTIQb6r7pAb0TwCugJo440l/xBUJzEQmKSkb2STzgjY=; b=KSvJyocr2sD/8VXIdYKRUMdJfM
 JFeHA94rwsiorWDGBCO9zbJeltAFYCKrUsKXkDh1UB7CJ8EnkIV2oQF6vSg6sz+8HagGiiLz/WXeH
 DzCdrSoNj3ZmVtW18wITgdmJqM3OupuEE76xF9llWFOTBFzjsy73k5BTYx3Aqhhs7d517BYatfLwM
 of6C+Ib6wDsr7hh+60yXXPr6ofs08xmxWXmozbMTIlSlrwUx43YyVsTpElxlTgGPf8FsLqB2WD7H6
 JdNTTUIHWw1VTn5EtY6+fdHVD1W9+DMQkC/R3qLmvgkbZc1Rd3rEwxLRNQzft2evaSC2pBeeKLMZJ
 j0esYQ8A==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uHPku-00An36-2K; Tue, 20 May 2025 18:23:52 +0200
Message-ID: <1047ffa9-46aa-478e-96a0-f26c833b62c5@igalia.com>
Date: Tue, 20 May 2025 17:23:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] drm/amdgpu: Add locking to amdgpu_ctx_mgr_entity_fini()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
References: <20250519163713.11367-1-tvrtko.ursulin@igalia.com>
 <20250519163713.11367-4-tvrtko.ursulin@igalia.com>
 <71accc22-29d1-47ff-909e-e8eb2bdd528a@amd.com>
 <03033981-c9bd-46ba-8855-06127c95567c@igalia.com>
 <3c03620e-43ca-45c8-b099-706b129315bf@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3c03620e-43ca-45c8-b099-706b129315bf@amd.com>
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


On 20/05/2025 09:40, Christian König wrote:
> On 5/20/25 09:50, Tvrtko Ursulin wrote:
>>
>> On 20/05/2025 08:39, Christian König wrote:
>>> On 5/19/25 18:37, Tvrtko Ursulin wrote:
>>>> Amdgpu_ctx_mgr_entity_fini() walks the context IDR unlocked so question is
>>>> could it in theory see a stale entry and attempt to destroy the
>>>> drm_sched_entity twice?
>>>
>>> No, when this function is called when the file descriptor is freed up.
>>>
>>> So there should never ever be any concurrent user of this.
>>>
>>>> Problem is I have hit this on a KASAN enabled kernel only _once_ and never
>>>> since. In that case it reported amdgpu_ctx_ioctl() had freed the entity
>>>> already which would mean the question is could we possibly go through the
>>>> mutex_unlock() on one CPU, and another CPU to follow immediately with
>>>> file->release (DRM postclose) and see the stale entry.
>>>
>>> Mhm, it would basically mean that the file descriptor can be closed while some IOCTL on it is still ongoing.
>>
>> I know, like if the VFS side of things was broken.
>>
>>> I think that this would be extremely ugly and should never ever happen in the first place. Adding the mutex just band aids the issue, but not really fixes it.
>>
>> So the part I wasn't sure about was not the ->release() running actually in parallel with ->ioctl(), but straight afterwards, but on a different CPU.
>>
>> If there is any chance the missing mutex_lock() before the IDR walk could mean a lacking memory barrier, so the entry that was just removed by ->ioctl() is seen in ->release().
>>
>>   Thread A        Thread B
>>   amdgpu_ctx_ioctl
>>    -> amdgpu_ctx_free
>>        mutex_lock
>>        idr_remove
>>        mutex_unlock
>>         fput()        fput()
>>              ->release()
>>              amdgpu_ctx_mgr_fini
>>               -> amdgpu_ctx_mgr_entity_fini
>>                    idr_for_each_entry
>>                  stale entry ??? -> BOOM
>>
>> Question is does the mutex_unlock() in Thread A ensures that the write into the IDR array would be seen in Thread B, given no mutex_lock() in the latter.
> 
> Oh, good question! I have absolutely no idea.
> 
> The mutex_unlock() certainly doesn't provide any memory barrier for the other CPU which does the _fini, but the fput() or the ->release code path might.
> 
> As far as I know it is rather common to not lock anything in the destroy path. I will try to double check.

FWIW I tried to provoke this with a freshly made IGT today but failed. I 
will park it for now since it does not feel a very plausible race.

Regards,

Tvrtko

>>   >> Throwing it out there not to forget about it, since I have manage to
>>>> lose the KASAN trace already..
>>>
>>> If you manage to trigger that again please send it to me ASAP.
>>>
>>> Thanks,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>>> index 85567d0d9545..95b005ed839e 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>>> @@ -927,6 +927,7 @@ static void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr)
>>>>          idp = &mgr->ctx_handles;
>>>>    +    mutex_lock(&mgr->lock);
>>>>        idr_for_each_entry(idp, ctx, id) {
>>>>            if (kref_read(&ctx->refcount) != 1) {
>>>>                DRM_ERROR("ctx %p is still alive\n", ctx);
>>>> @@ -945,6 +946,7 @@ static void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr)
>>>>                }
>>>>            }
>>>>        }
>>>> +    mutex_unlock(&mgr->lock);
>>>>    }
>>>>      void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr)
>>>
>>
> 


Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCDE857FB5
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Feb 2024 15:47:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E4010EB65;
	Fri, 16 Feb 2024 14:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwFWJt/6";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7CB10E187;
 Fri, 16 Feb 2024 14:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708094847; x=1739630847;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DNAuPXv6JxlUaW3Xr66U65esL5oN4rzbajoe41zRXSo=;
 b=bwFWJt/6Fv45M0ygjva3Y8cMzwlZXNGZ4BpoCj6tJ51sEBEeuUbSCcCy
 7dD7KU4RlUBRRs6bfU24pS5yU3ym3cqjfMbto0OcGFS8OOBHhMaWHylzt
 D3h3lIN5+6CN7iP/lB2UN1vBxB5v4MeMlZjwhjLyfN/Pp7wOxlJKkV5a2
 +C75e/IiXFMlXvg1W8PH4nxjXGsGb2mvbE/Z1OnvMZxAX7gruFQkl+1q0
 kp05Lc/xZ86LsHcx7nyy4Ild03EeU3PStY5zz1g5kDRmZnGX41zKaSNJ6
 meKfjKO+7Hms+4dZHt5F+vej8908K4nJtWge9wopDKlc16fmKqTAoD7uq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2356337"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2356337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 06:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="8517817"
Received: from fcrowe-mobl2.ger.corp.intel.com (HELO [10.252.21.243])
 ([10.252.21.243])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 06:47:18 -0800
Message-ID: <8224c34a-aca5-415e-9d6f-c061471f0cff@intel.com>
Date: Fri, 16 Feb 2024 14:47:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/buddy: Add defragmentation support
Content-Language: en-GB
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com,
 mario.limonciello@amd.com
References: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
 <20240208155000.339325-3-Arunpravin.PaneerSelvam@amd.com>
 <af43196c-d926-454b-8914-c5753f5d3799@intel.com>
 <8f218231-68ae-4a9f-880c-11a37fac91f2@amd.com>
 <292710a7-27be-497d-b6a7-67f964e41ed5@intel.com>
 <26d13e0c-c52a-4681-bea8-4a631b514edd@gmail.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <26d13e0c-c52a-4681-bea8-4a631b514edd@gmail.com>
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

On 16/02/2024 14:02, Christian König wrote:
> Am 16.02.24 um 14:21 schrieb Matthew Auld:
>> On 16/02/2024 12:33, Christian König wrote:
>>> Am 16.02.24 um 13:23 schrieb Matthew Auld:
>>>> On 08/02/2024 15:50, Arunpravin Paneer Selvam wrote:
>>>>> Add a function to support defragmentation.
>>>>>
>>>>> v1: Defragment the memory beginning from min_order
>>>>>      till the required memory space is available.
>>>>>
>>>>> Signed-off-by: Arunpravin Paneer Selvam 
>>>>> <Arunpravin.PaneerSelvam@amd.com>
>>>>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/drm_buddy.c | 67 
>>>>> +++++++++++++++++++++++++++++++------
>>>>>   include/drm/drm_buddy.h     |  3 ++
>>>>
>>>> No users?
>>>
>>> Other question is how can a buddy allocator fragment in the first place?
>>
>> The fragmentation is due to pages now being tracked as dirty/clear. 
>> Should the allocator merge together a page that is dirty with a page 
>> that is cleared? When should it do that? User wants to be able to keep 
>> the two separate if possible. For example, freeing one single dirty 
>> page can dirty a huge swathe of your already cleared pages if they are 
>> merged together. Or do you have some some other ideas here?
> 
> Sorry, that was not what I meant. I should probably have been clearer.
> 
> That dirty and clean pages are now kept separated is obvious, but why do 
> you need to de-fragment them at some point?

Ah, right. At the very least we need to do something similar to this at 
fini(), just to ensure we properly merge everything back together so we 
can correctly tear down the mm. Outside of that the thinking was that it 
might be useful to call when allocating larger min page-sizes. You might 
now be failing the allocation due to fragmentation, and so in some cases 
might be better off running some kind of defrag step first, instead of 
failing the allocation and trying to evict stuff. Anyway, if that is not 
a concern for amdgpu, then we just need to handle the fini() case and 
can keep this internal.

> 
> Christian.
> 
>>
>>>
>>> Christian.
>>>
>>>>
>>>>>   2 files changed, 59 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>>>> index 33ad0cfbd54c..fac423d2cb73 100644
>>>>> --- a/drivers/gpu/drm/drm_buddy.c
>>>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>>>> @@ -276,10 +276,12 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>>>   }
>>>>>   EXPORT_SYMBOL(drm_get_buddy);
>>>>>   -static void __drm_buddy_free(struct drm_buddy *mm,
>>>>> -                 struct drm_buddy_block *block)
>>>>> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>>>>> +                     struct drm_buddy_block *block,
>>>>> +                     bool defrag)
>>>>>   {
>>>>>       struct drm_buddy_block *parent;
>>>>> +    unsigned int order;
>>>>>         while ((parent = block->parent)) {
>>>>>           struct drm_buddy_block *buddy;
>>>>> @@ -289,12 +291,14 @@ static void __drm_buddy_free(struct drm_buddy 
>>>>> *mm,
>>>>>           if (!drm_buddy_block_is_free(buddy))
>>>>>               break;
>>>>>   -        if (drm_buddy_block_is_clear(block) !=
>>>>> -            drm_buddy_block_is_clear(buddy))
>>>>> -            break;
>>>>> +        if (!defrag) {
>>>>> +            if (drm_buddy_block_is_clear(block) !=
>>>>> +                drm_buddy_block_is_clear(buddy))
>>>>> +                break;
>>>>>   -        if (drm_buddy_block_is_clear(block))
>>>>> -            mark_cleared(parent);
>>>>> +            if (drm_buddy_block_is_clear(block))
>>>>> +                mark_cleared(parent);
>>>>> +        }
>>>>
>>>> Maybe check if the two blocks are incompatible and chuck a warn if 
>>>> they are not? Main thing is not to hide issues with split blocks 
>>>> that should have been merged before.
>>>>
>>>>> list_del(&buddy->link);
>>>>>   @@ -304,8 +308,49 @@ static void __drm_buddy_free(struct 
>>>>> drm_buddy *mm,
>>>>>           block = parent;
>>>>>       }
>>>>>   +    order = drm_buddy_block_order(block);
>>>>>       mark_free(mm, block);
>>>>> +
>>>>> +    return order;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * drm_buddy_defrag - Defragmentation routine
>>>>> + *
>>>>> + * @mm: DRM buddy manager
>>>>> + * @min_order: minimum order in the freelist to begin
>>>>> + * the defragmentation process
>>>>> + *
>>>>> + * Driver calls the defragmentation function when the
>>>>> + * requested memory allocation returns -ENOSPC.
>>>>> + */
>>>>> +void drm_buddy_defrag(struct drm_buddy *mm,
>>>>> +              unsigned int min_order)
>>>>
>>>> Just wondering if we need "full defag" also? We would probably need 
>>>> to call this at fini() anyway.
>>>>
>>>>> +{
>>>>> +    struct drm_buddy_block *block;
>>>>> +    struct list_head *list;
>>>>> +    unsigned int order;
>>>>> +    int i;
>>>>> +
>>>>> +    if (min_order > mm->max_order)
>>>>> +        return;
>>>>> +
>>>>> +    for (i = min_order - 1; i >= 0; i--) {
>>>>
>>>> Need to be careful with min_order = 0 ?
>>>>
>>>>> +        list = &mm->free_list[i];
>>>>> +        if (list_empty(list))
>>>>> +            continue;
>>>>> +
>>>>> +        list_for_each_entry_reverse(block, list, link) {
>>>>
>>>> Don't we need the safe_reverse() variant here, since this is 
>>>> removing from the list?
>>>>
>>>>> +            if (!block->parent)
>>>>> +                continue;
>>>>> +
>>>>> +            order = __drm_buddy_free(mm, block, 1);
>>>>> +            if (order >= min_order)
>>>>> +                return;
>>>>> +        }
>>>>> +    }
>>>>>   }
>>>>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>>>>     /**
>>>>>    * drm_buddy_free_block - free a block
>>>>> @@ -321,7 +366,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>>>>       if (drm_buddy_block_is_clear(block))
>>>>>           mm->clear_avail += drm_buddy_block_size(mm, block);
>>>>>   -    __drm_buddy_free(mm, block);
>>>>> +    __drm_buddy_free(mm, block, 0);
>>>>>   }
>>>>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>>>>   @@ -470,7 +515,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>>>>>       if (buddy &&
>>>>>           (drm_buddy_block_is_free(block) &&
>>>>>            drm_buddy_block_is_free(buddy)))
>>>>> -        __drm_buddy_free(mm, block);
>>>>> +        __drm_buddy_free(mm, block, 0);
>>>>>       return ERR_PTR(err);
>>>>>   }
>>>>>   @@ -588,7 +633,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>>>>     err_undo:
>>>>>       if (tmp != order)
>>>>> -        __drm_buddy_free(mm, block);
>>>>> +        __drm_buddy_free(mm, block, 0);
>>>>>       return ERR_PTR(err);
>>>>>   }
>>>>>   @@ -668,7 +713,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>>>>       if (buddy &&
>>>>>           (drm_buddy_block_is_free(block) &&
>>>>>            drm_buddy_block_is_free(buddy)))
>>>>> -        __drm_buddy_free(mm, block);
>>>>> +        __drm_buddy_free(mm, block, 0);
>>>>>     err_free:
>>>>>       if (err == -ENOSPC && total_allocated_on_err) {
>>>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>>>> index d81c596dfa38..d0f63e7b5915 100644
>>>>> --- a/include/drm/drm_buddy.h
>>>>> +++ b/include/drm/drm_buddy.h
>>>>> @@ -166,6 +166,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
>>>>>                struct list_head *objects,
>>>>>                unsigned int flags);
>>>>>   +void drm_buddy_defrag(struct drm_buddy *mm,
>>>>> +              unsigned int min_order);
>>>>> +
>>>>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>>>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>>>>                  struct drm_buddy_block *block,
>>>
> 

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC975023B4
	for <lists+amd-gfx@lfdr.de>; Fri, 15 Apr 2022 07:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F5210E2CC;
	Fri, 15 Apr 2022 05:14:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E7E10E2CC
 for <amd-gfx@lists.freedesktop.org>; Fri, 15 Apr 2022 05:14:08 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5ae925.dynamic.kabel-deutschland.de
 [95.90.233.37])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3427361EA1928;
 Fri, 15 Apr 2022 07:14:06 +0200 (CEST)
Message-ID: <aac8e868-3a1d-7eca-8c85-65d8972add40@molgen.mpg.de>
Date: Fri, 15 Apr 2022 07:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/amdkfd: only allow heavy-weight TLB flush on some
 ASICs for SVM too
Content-Language: en-US
To: Lang Yu <Lang.Yu@amd.com>
References: <20220414081909.796653-1-Lang.Yu@amd.com>
 <e0a1119a-3cb4-4449-142d-a51baa8ad396@molgen.mpg.de>
 <Yljkf/yGk8YFEV9R@lang-desktop>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <Yljkf/yGk8YFEV9R@lang-desktop>
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
Cc: Eric Huang <jinhuieric.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>,
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Dear Lang,


Am 15.04.22 um 05:20 schrieb Lang Yu:
> On 04/14/ , Paul Menzel wrote:

>> Am 14.04.22 um 10:19 schrieb Lang Yu:
>>> The idea is from commit a50fe7078035 ("drm/amdkfd: Only apply heavy-weight
>>> TLB flush on Aldebaran") and commit f61c40c0757a ("drm/amdkfd: enable
>>> heavy-weight TLB flush on Arcturus"). Otherwise, we will run into problems
>>> on some ASICs when running SVM applications.
>>
>> Please list the ASICs, you know of having problems, and even add how to
>> reproduce this.
> 
> Actually, this is ported from previous commits. You can find more details
> from the commits I mentioned. At the moment the ASICs except Aldebaran
> and Arcturus probably have the problem.

I think, it’s always good to make it as easy as possible for reviewers 
and, later, people reading a commit, and include the necessary 
information directly in the commit message. It’d be great if you amended 
the commit message.

> And running a SVM application could reproduce the issue.

Thanks. How will it fail though?

(Also, a small implementation note would be nice to have. Maybe: Move 
the helper function into the header `kfd_priv.h`, and use in 
`svm_range_unmap_from_gpus()`.)


Kind regards,

Paul


>>> Signed-off-by: Lang Yu <Lang.Yu@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 --------
>>>    drivers/gpu/drm/amd/amdkfd/kfd_priv.h    | 8 ++++++++
>>>    drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 4 +++-
>>>    3 files changed, 11 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> index 91f82a9ccdaf..459f59e3d0ed 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>> @@ -1128,14 +1128,6 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
>>>    	return ret;
>>>    }
>>> -static bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
>>> -{
>>> -	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
>>> -		(KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 1) &&
>>> -		dev->adev->sdma.instance[0].fw_version >= 18) ||
>>> -		KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0);
>>> -}
>>> -
>>>    static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
>>>    					struct kfd_process *p, void *data)
>>>    {
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>>> index 8a43def1f638..aff6f598ff2c 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
>>> @@ -1328,6 +1328,14 @@ void kfd_signal_poison_consumed_event(struct kfd_dev *dev, u32 pasid);
>>>    void kfd_flush_tlb(struct kfd_process_device *pdd, enum TLB_FLUSH_TYPE type);
>>> +static inline bool kfd_flush_tlb_after_unmap(struct kfd_dev *dev)
>>> +{
>>> +	return KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 2) ||
>>> +	       (KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 1) &&
>>> +	       dev->adev->sdma.instance[0].fw_version >= 18) ||
>>> +	       KFD_GC_VERSION(dev) == IP_VERSION(9, 4, 0);
>>> +}
>>> +
>>>    bool kfd_is_locked(void);
>>>    /* Compute profile */
>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> index 459fa07a3bcc..5afe216cf099 100644
>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>> @@ -1229,7 +1229,9 @@ svm_range_unmap_from_gpus(struct svm_range *prange, unsigned long start,
>>>    			if (r)
>>>    				break;
>>>    		}
>>> -		kfd_flush_tlb(pdd, TLB_FLUSH_HEAVYWEIGHT);
>>> +
>>> +		if (kfd_flush_tlb_after_unmap(pdd->dev))
>>> +			kfd_flush_tlb(pdd, TLB_FLUSH_HEAVYWEIGHT);
>>>    	}
>>>    	return r;

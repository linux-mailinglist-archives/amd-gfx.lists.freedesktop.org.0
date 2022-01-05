Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F108D484EF2
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jan 2022 08:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D991F10FD37;
	Wed,  5 Jan 2022 07:59:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842B410FD36;
 Wed,  5 Jan 2022 07:59:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j18so81174982wrd.2;
 Tue, 04 Jan 2022 23:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NlRkaQJtNmP5KYf3PY05yJHQrcTMvRX9BmFv7qSB3xk=;
 b=VU91GLRk+VW83+fXY7X8UK+xnkEQoJY5ravbM7siVN33urOvb9RvArOZ8Yqzo2oyYb
 uWmxiNc49JwDDCly9PtivZMW9nMGQEVugwnjD2OEVs1mEdTDUD4a/kyD1XimHlRlMTNQ
 El+yVI5vx4NUu8BqTmYJBApa+NDhWLsJo7Pw8WRy6NK3551Ym9kFt9Q+r+oGl/b6w92g
 mMGp2G/PgTzXVtTQPvopVCon3VGuNSgO14HviefzjTIrGjvEk/6GKdIxXf4qiER5Lp7W
 eZd6Jv+jcbFNRxeiY5+1Z9U67yAN+BQmGfEbR8tHBDpxUz2LuWn1KXdntJ6UUmiRzJFa
 CSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=NlRkaQJtNmP5KYf3PY05yJHQrcTMvRX9BmFv7qSB3xk=;
 b=jIO+KcrbMx2K7QDbnuzJImFDsEeVQFAvCavwNESwsBfw319Jh4e6fYMPJXuj3eYtvn
 QZOEq9eUkNIbO3XRrOFdcRQTdOgOOOOIC6Yn0tHs3Y8pWPkKmF9vS/bPzQyIljkIfW9D
 IChytqtogyNhsYWzAfHjLPJIWoLuXDAJJfPxWbQWIo6GrBF30tLtyGZr+DrCNS2Od+M9
 dj6a8WvX2u0Rqju0iAHmhSXCULe3CtNN2UFer8zr/KSOL4sTYHssGwKxynMkTUazfuBe
 NyBfakTUZ11EPtbvi1xS8Lb4XULhKFFR4Vzc1iUdmoPbGuPIScmbDNSODEvdZ/irte7b
 SyNQ==
X-Gm-Message-State: AOAM530ldCbJQxT08AB7pdmotgAH4udc5O4yqEbz5OmZy/8xoS0s4CqT
 q0GExS/hcXFGRS43E1zQnL9CuFoOTMk=
X-Google-Smtp-Source: ABdhPJyvUulPk5aEFPHGFn2bF/G7x+wtOpC6myNcawE+nudyC38aNBhfA3uf9GEUeoRo8zLXVXgU0w==
X-Received: by 2002:adf:df09:: with SMTP id y9mr44872197wrl.594.1641369548004; 
 Tue, 04 Jan 2022 23:59:08 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:9ec1:88f9:78a5:dade?
 ([2a02:908:1252:fb60:9ec1:88f9:78a5:dade])
 by smtp.gmail.com with ESMTPSA id d13sm40339496wru.41.2022.01.04.23.59.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 23:59:07 -0800 (PST)
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: JingWen Chen <jingwech@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
 <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
 <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
 <20363a4e-b282-232d-34d0-14867bad4931@amd.com>
 <BL1PR12MB5269922395096810CC79E66D844A9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
 <a74c1198-6027-6a0f-55a8-24227c868704@amd.com>
 <c41f0294-fd64-cf16-8c22-994a7a2ed157@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <821c0b66-8c9c-9dff-a328-bfbc2233d4ef@gmail.com>
Date: Wed, 5 Jan 2022 08:59:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c41f0294-fd64-cf16-8c22-994a7a2ed157@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 05.01.22 um 08:34 schrieb JingWen Chen:
> On 2022/1/5 上午12:56, Andrey Grodzovsky wrote:
>> On 2022-01-04 6:36 a.m., Christian König wrote:
>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>> [AMD Official Use Only]
>>>>
>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>
>>> Then we have a major design issue in the SRIOV protocol and really need to question this.
>>>
>>> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>>>
>>> As far as I can see the procedure should be:
>>> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
>>> 2. For each of those potential reset sources a work item is send to the single workqueue.
>>> 3. One of those work items execute first and prepares the reset.
>>> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
>>> 5. Cleanup after the reset, eventually resubmit jobs etc..
>>> 6. Cancel work items which might have been scheduled from other reset sources.
>>>
>>> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.
>>
>> Monk, just to add to this - if indeed as you say that 'FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long'
>> and there is no strict waiting from the hypervisor for IDH_READY_TO_RESET to be recived from guest before starting the reset then setting in_gpu_reset and locking reset_sem from guest side is not really full proof
>> protection from MMIO accesses by the guest - it only truly helps if hypervisor waits for that message before initiation of HW reset.
>>
> Hi Andrey, this cannot be done. If somehow guest kernel hangs and never has the chance to send the response back, then other VFs will have to wait it reset. All the vfs will hang in this case. Or sometimes the mailbox has some delay and other VFs will also wait. The user of other VFs will be affected in this case.

Yeah, agree completely with JingWen. The hypervisor is the one in charge 
here, not the guest.

What the hypervisor should do (and it already seems to be designed that 
way) is to send the guest a message that a reset is about to happen and 
give it some time to response appropriately.

The guest on the other hand then tells the hypervisor that all 
processing has stopped and it is ready to restart. If that doesn't 
happen in time the hypervisor should eliminate the guest probably 
trigger even more severe consequences, e.g. restart the whole VM etc...

Christian.

>> Andrey
>>
>>
>>> Regards,
>>> Christian.
>>>
>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>> [AMD Official Use Only]
>>>>
>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>
>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>> It makes the code to crash ... how could it be a fix ?
>>>>
>>>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>>>
>>>> Thanks
>>>> -------------------------------------------------------------------
>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>> -------------------------------------------------------------------
>>>> we are hiring software manager for CVS core team
>>>> -------------------------------------------------------------------
>>>>
>>>> -----Original Message-----
>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>> Sent: Tuesday, January 4, 2022 6:19 PM
>>>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
>>>> Cc: daniel@ffwll.ch
>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>>>
>>>> Hi Jingwen,
>>>>
>>>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>>>
>>>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>>>
>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>
>>>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>>>
>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>>>> Hi Christian,
>>>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>>>
>>>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>>>
>>>>>    From my point of view, we can directly use amdgpu_device_lock_adev
>>>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>>>
>>>>> Best Regards,
>>>>> Jingwen Chen
>>>>>
>>>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>>>
>>>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>>>
>>>>>> Christian.
>>>>>>
>>>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>>>> Sure, I guess i can drop this patch then.
>>>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>>>
>>>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>>>
>>>>>>>>> Best wishes
>>>>>>>>> Emily Deng
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>> protection for SRIOV
>>>>>>>>>>
>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>
>>>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>>>
>>>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>>>
>>>>>>>>>> Thanks
>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>> -- 
>>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>> protection for SRIOV
>>>>>>>>>>
>>>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>>>> need for this.
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>
>>>>>>>>>>> ---
>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>>>       2 files changed, 22 deletions(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>> work_struct *work)
>>>>>>>>>>>           struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>           int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>
>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>> -     */
>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>> -        return;
>>>>>>>>>>> -
>>>>>>>>>>>           amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>
>>>>>>>>>>>           xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>> 0, 0);
>>>>>>>>>>>
>>>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>> work_struct *work)
>>>>>>>>>>>           } while (timeout > 1);
>>>>>>>>>>>
>>>>>>>>>>>       flr_done:
>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>> -
>>>>>>>>>>>           /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>> */
>>>>>>>>>>>           if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>               && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>> work_struct *work)
>>>>>>>>>>>           struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>           int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>
>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>> -     */
>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>> -        return;
>>>>>>>>>>> -
>>>>>>>>>>>           amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>
>>>>>>>>>>>           xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>> 0, 0);
>>>>>>>>>>>
>>>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>> work_struct *work)
>>>>>>>>>>>           } while (timeout > 1);
>>>>>>>>>>>
>>>>>>>>>>>       flr_done:
>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>> -
>>>>>>>>>>>           /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>> */
>>>>>>>>>>>           if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>               && (!amdgpu_device_has_job_running(adev) ||


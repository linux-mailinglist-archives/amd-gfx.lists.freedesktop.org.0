Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47177FA88
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Aug 2023 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB81310E4C7;
	Thu, 17 Aug 2023 15:17:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5176410E4C7;
 Thu, 17 Aug 2023 15:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xtf1+F99I69nSRhwPNidOBjKYhYnddXLhkniPjo8Y3I=; b=es0PuuDPVH2MKNnfMl/ZDt02GM
 9cXAOntaAOHXNC884acGkSfMXTYN+a7NXzSKpOpcweUrQ3FGM6UypYf46sExKhtvV3ogl5dNnT4Rx
 K85vVs8228zE8022b37wPZraU627olxbDr179Ws4rK6fYF+ev3rUbrPskEu+MndmwGZQBDaL347kT
 hR6tMjd9YjeBYi3LkzbyyI5wMGY8r5bfCopcQuYXjNyBe+ltyxbgVGsfdcX40GY6ZHmNPBEbG48mR
 HHzgnyg1UvQtGGXuqt50bJTS+0MRCe2uxg9SbYuzkAEr3UmN1SouBUOFuTzCuHxmEMgFn7NqL00GB
 RdVRQjng==;
Received: from [191.193.179.209] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qWekl-001xjX-IH; Thu, 17 Aug 2023 17:17:39 +0200
Message-ID: <43f2df2f-46ff-4240-a86b-eff5f0c08888@igalia.com>
Date: Thu, 17 Aug 2023 12:17:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Rework coredump to use memory
 dynamically
Content-Language: en-US
To: Shashank Sharma <shashank.sharma@amd.com>
References: <20230815195100.294458-1-andrealmeid@igalia.com>
 <20230815195100.294458-3-andrealmeid@igalia.com>
 <07ef59db-da17-15cf-789a-7f5d01b2c9c9@amd.com>
 <a6e90991-91bb-4da9-ab67-d0ec28a29680@igalia.com>
 <eaef1599-4da3-ac10-a03e-4f2d8304c60d@amd.com>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <eaef1599-4da3-ac10-a03e-4f2d8304c60d@amd.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



Em 17/08/2023 12:04, Shashank Sharma escreveu:
> 
> On 17/08/2023 15:45, André Almeida wrote:
>> Hi Shashank,
>>
>> Em 17/08/2023 03:41, Shashank Sharma escreveu:
>>> Hello Andre,
>>>
>>> On 15/08/2023 21:50, André Almeida wrote:
>>>> Instead of storing coredump information inside amdgpu_device struct,
>>>> move if to a proper separated struct and allocate it dynamically. This
>>>> will make it easier to further expand the logged information.
>>>>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>> ---
>>>> v4: change kmalloc to kzalloc
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 63 
>>>> ++++++++++++++--------
>>>>   2 files changed, 49 insertions(+), 28 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> index 9c6a332261ab..0d560b713948 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>>> @@ -1088,11 +1088,6 @@ struct amdgpu_device {
>>>>       uint32_t                        *reset_dump_reg_list;
>>>>       uint32_t            *reset_dump_reg_value;
>>>>       int                             num_regs;
>>>> -#ifdef CONFIG_DEV_COREDUMP
>>>> -    struct amdgpu_task_info         reset_task_info;
>>>> -    bool                            reset_vram_lost;
>>>> -    struct timespec64               reset_time;
>>>> -#endif
>>>>       bool                            scpm_enabled;
>>>>       uint32_t                        scpm_status;
>>>> @@ -1105,6 +1100,15 @@ struct amdgpu_device {
>>>>       uint32_t            aid_mask;
>>>>   };
>>>> +#ifdef CONFIG_DEV_COREDUMP
>>>> +struct amdgpu_coredump_info {
>>>> +    struct amdgpu_device        *adev;
>>>> +    struct amdgpu_task_info         reset_task_info;
>>>> +    struct timespec64               reset_time;
>>>> +    bool                            reset_vram_lost;
>>>> +};
>>>
>>> The patch looks good to me in general, but I would recommend slightly 
>>> different arrangement and segregation of GPU reset information.
>>>
>>> Please consider a higher level structure adev->gpu_reset_info, and 
>>> move everything related to reset dump info into that, including this 
>>> new coredump_info structure, something like this:
>>>
>>> struct amdgpu_reset_info {
>>>
>>>      uint32_t *reset_dump_reg_list;
>>>
>>>      uint32_t *reset_dump_reg_value;
>>>
>>>      int num_regs;
>>>
>>
>> Right, I can encapsulate there reset_dump members,
>>
>>> #ifdef CONFIG_DEV_COREDUMP
>>>
>>>     struct amdgpu_coredump_info *coredump_info;/* keep this dynamic 
>>> allocation */
>>
>> but we don't need a pointer for amdgpu_coredump_info inside 
>> amdgpu_device or inside of amdgpu_device->gpu_reset_info, right?
> 
> I think it would be better if we keep all of the GPU reset related data 
> in the same structure, so adev->gpu_reset_info->coredump_info sounds 
> about right to me.
> 

But after patch 2/4, we don't need to store a coredump_info pointer 
inside adev, this is what I meant. What would be the purpose of having 
this pointer? It's freed by amdgpu_devcoredump_free(), so we don't need 
to keep track of it.

> - Shashank
> 
>>
>>>
>>> #endif
>>>
>>> }
>>>
>>>
>>> This will make sure that all the relevant information is at the same 
>>> place.
>>>
>>> - Shashank
>>>
>>        amdgpu_inc_vram_lost(tmp_adev);

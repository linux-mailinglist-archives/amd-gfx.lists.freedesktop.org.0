Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD03474877
	for <lists+amd-gfx@lfdr.de>; Tue, 14 Dec 2021 17:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143E410E5BF;
	Tue, 14 Dec 2021 16:46:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539AA10E5BF
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Dec 2021 16:46:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id a9so33415498wrr.8
 for <amd-gfx@lists.freedesktop.org>; Tue, 14 Dec 2021 08:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9rEHFFTEy5f42hkskdWJaEcQbhdeHVHsNhNOkHMUAHA=;
 b=hX/qF6XO9J8SKkaJ9NEVqkMTLf+WyndY6RavhQwl7D1jYjK9RUXSXvKBspyFgv7xw/
 xwD61au/PctOiOGRtAVhad+f++BAAcifDLi0F/ruNO29l2H/AjSTCfHjs/Tou/34gA2W
 aLwrliZFNWUbAJSWJqaO2xJGiAW0LEfZlSEjaxwETbo3tKVr8wtpaQDKYsAmAAzk1npZ
 a8EMg2vM2fwOrdIJj5AEbLv/9cIpdzic6vOy6XS7aPAReSMoPTWBoPOFYYcV8rQuOUj9
 elqU58phmKMVnQO50YnmFqf2zyg/+JzP8hvSVx0X+3KdIOqp8qRRnl0AWgyQaDMgidIm
 Hf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9rEHFFTEy5f42hkskdWJaEcQbhdeHVHsNhNOkHMUAHA=;
 b=bLcddTzXmKMPhbBdwLRuiA+1KGxVSM6eD750Lk2iSnxrBELxW+O90XK/Jlw/jFRXv+
 HSL9iPUQ/JxpfFzWl/zpecATWACb8ppjOcgdPjoDF8PufcSxYx6emUSRLE0RClc7KZgO
 UpyZfQBxxpc7YVBVpWbocnxn5So4qrR6zQlosQ/nz1aMc/bJjAB1K/wZKfL6DJuLll2M
 uhTEJqvCFL0DoHkc+Y9SmX9ySh4o9HAJ4NQDjlE5ReVd6J3j01sho+5h6GQwgn5IWLom
 dz2q09FLLzuReXgc85lxWfqofDss17Ljm64NBahJaaBp3lMTd9+ECcWmoYcbs9ElxJve
 wVCg==
X-Gm-Message-State: AOAM531xC4ezQQf9g52dbqXV3cGqFyWKpkxN7ZApFY+ZnYZJDt6e9IhG
 Cjk0YhsIiLgf189CLgWJlvGbrLV9lDg=
X-Google-Smtp-Source: ABdhPJzpehqvRioFgY1ZJOaVQcP9m1AnEWreQmpJXfC/ThF7MMU5RMQDzgxDAlRirOfVMpMJN4ClWA==
X-Received: by 2002:a5d:5912:: with SMTP id v18mr155128wrd.144.1639500409830; 
 Tue, 14 Dec 2021 08:46:49 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:608a:f9a1:bd6b:103b?
 ([2a02:908:1252:fb60:608a:f9a1:bd6b:103b])
 by smtp.gmail.com with ESMTPSA id m20sm3048854wmq.11.2021.12.14.08.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 08:46:48 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] drm/amdgpu/UAPI: add new PROFILE IOCTL
To: Alex Deucher <alexdeucher@gmail.com>
References: <20211202191912.6148-1-alexander.deucher@amd.com>
 <b05f1327-b26d-ac47-4bac-f94979bd3741@gmail.com>
 <CADnq5_OgW3vfG5kjV-67KYc4RxavJeZOWvNEo5vm9siHj2B0HA@mail.gmail.com>
 <79ab8197-890a-494d-6687-de0f3d467360@gmail.com>
 <CADnq5_MX7C83XHo7Ft-eC4wqfYzgVaSM_inkk-QCOz1DonFUag@mail.gmail.com>
 <ee8b884c-7b75-813f-930b-86b79342aa9d@gmail.com>
 <CADnq5_NrEU+vKx6z8R8V8UHqVYx02vmo2LLDc6WpbPom2O4LLQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0661ca2f-f3d0-abee-0f73-fc324a99d38f@gmail.com>
Date: Tue, 14 Dec 2021 17:46:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_NrEU+vKx6z8R8V8UHqVYx02vmo2LLDc6WpbPom2O4LLQ@mail.gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 14.12.21 um 16:12 schrieb Alex Deucher:
> On Tue, Dec 14, 2021 at 9:57 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 14.12.21 um 15:53 schrieb Alex Deucher:
>>> On Sun, Dec 5, 2021 at 4:23 AM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 03.12.21 um 17:13 schrieb Alex Deucher:
>>>>> On Fri, Dec 3, 2021 at 7:15 AM Christian König
>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>> Am 02.12.21 um 20:19 schrieb Alex Deucher:
>>>>>>> This adds a new IOCTL currently used to implement querying
>>>>>>> and setting the stable power state for GPU profiling.  The
>>>>>>> stable pstates use fixed clocks and disable certain power
>>>>>>> features in order to get accurate pipeline profiling.
>>>>>>>
>>>>>>> Currently this is handled via sysfs, and that is still
>>>>>>> available, but this makes it easier for applications
>>>>>>> to utilize.  Note that the power state is global so
>>>>>>> setting it will affect all applications.  There are currently
>>>>>>> no checks in place to prevent multiple applications from
>>>>>>> using this interface, but it doesn't make sense to do
>>>>>>> profiling while you have multiple applications running in the
>>>>>>> first place, so it's up to the user to ensure this in order
>>>>>>> to get good results.
>>>>>>>
>>>>>>> This patch add an interface to query what profiling mode is
>>>>>>> currently active and to set enable a profiling mode.
>>>>>> First of all I wouldn't call this profiling mode. Profiling is the use
>>>>>> case, but performance and power management are what is controlled here.
>>>>>>
>>>>> Ok.
>>>>>
>>>>>> Then we already have functionality for process and context priority
>>>>>> override for the SW scheduler in amdgpu_sched.c. I think we should add
>>>>>> this functionality there.
>>>>> I'm not sure I follow.  Do you mean to integrate this with the
>>>>> rendering context?  That was what my original patch did (attached).
>>>>> Or were you thinking it would be better to make this part of the sched
>>>>> ioctl?
>>>> The later,
>>>>
>>>> The scheduler IOCTLs are all about adjusting the default priority of a
>>>> process (and optionally a context as well).
>>>>
>>>> Putting the hardware power management control alongside that kind of
>>>> makes sense I think.
>>>>
>>>> Something like AMDGPU_SCHED_OP_POWER.
>>> The problem is that the sched ioctl is currently DRM_MASTER only.
>>> That kind of defeats the purpose of putting this in a user ioctl in
>>> the first place.
>> My recollection was that we wanted to double check if DRM_MASTER
>> wouldn't be sufficient. Mhm, so we really need to open that up for
>> everybody?
> Tools and UMD teams don't want to require that, otherwise, they could
> just use the existing sysfs interface.
>
>> If the scheduler IOCTL really doesn't fit we can still add another
>> IOCTL. I would just try to avoid adding another file just for another
>> feature, otherwise we will quickly end up with quite a lot of them.
> That's why I originally thought it made sense as part of the context
> ioctl since it's sort of related to the context in that the user wants
> to apply it to their rendering context (even though it is global).

Yeah, I know what you mean. Maybe that's the best option then.

I mean the kernel needs some policy what to do when with oposing 
requests from userspace anyway.

I just thought that doing it on a per fd basis would move at least a 
little bit of those decisions to userspace.

Christian.

>
> Alex
>
>> Christian.
>>
>>> Alex
>>>
>>>
>>>> Christian.
>>>>
>>>>> Alex
>>>>>
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/amd/amdgpu/Makefile         |   2 +-
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |   2 +
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_profile.c | 112 ++++++++++++++++++++
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_profile.h |  30 ++++++
>>>>>>>      include/uapi/drm/amdgpu_drm.h               |  28 +++++
>>>>>>>      5 files changed, 173 insertions(+), 1 deletion(-)
>>>>>>>      create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_profile.c
>>>>>>>      create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_profile.h
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>> index 7fedbb725e17..4cf5bf637a9e 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
>>>>>>> @@ -58,7 +58,7 @@ amdgpu-y += amdgpu_device.o amdgpu_kms.o \
>>>>>>>          amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbio.o \
>>>>>>>          amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
>>>>>>>          amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_hdp.o \
>>>>>>> -     amdgpu_eeprom.o amdgpu_mca.o
>>>>>>> +     amdgpu_eeprom.o amdgpu_mca.o amdgpu_profile.o
>>>>>>>
>>>>>>>      amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> index bc1355c6248d..0e27f9673f8f 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>>>> @@ -46,6 +46,7 @@
>>>>>>>      #include "amdgpu_sched.h"
>>>>>>>      #include "amdgpu_fdinfo.h"
>>>>>>>      #include "amdgpu_amdkfd.h"
>>>>>>> +#include "amdgpu_profile.h"
>>>>>>>
>>>>>>>      #include "amdgpu_ras.h"
>>>>>>>      #include "amdgpu_xgmi.h"
>>>>>>> @@ -2467,6 +2468,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>>>>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>          DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>> +     DRM_IOCTL_DEF_DRV(AMDGPU_PROFILE, amdgpu_profile_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>>>      };
>>>>>>>
>>>>>>>      static const struct drm_driver amdgpu_kms_driver = {
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_profile.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_profile.c
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..94fe408e810f
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_profile.c
>>>>>>> @@ -0,0 +1,112 @@
>>>>>>> +/*
>>>>>>> + * Copyright 2021 Advanced Micro Devices, Inc.
>>>>>>> + *
>>>>>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>>>>>> + * copy of this software and associated documentation files (the "Software"),
>>>>>>> + * to deal in the Software without restriction, including without limitation
>>>>>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>>>>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>>>>>> + * Software is furnished to do so, subject to the following conditions:
>>>>>>> + *
>>>>>>> + * The above copyright notice and this permission notice shall be included in
>>>>>>> + * all copies or substantial portions of the Software.
>>>>>>> + *
>>>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>>>> + *
>>>>>>> + */
>>>>>>> +
>>>>>>> +#include <drm/amdgpu_drm.h>
>>>>>>> +#include "amdgpu.h"
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * amdgpu_profile_ioctl - Manages settings for profiling.
>>>>>>> + *
>>>>>>> + * @dev: drm device pointer
>>>>>>> + * @data: drm_amdgpu_vm
>>>>>>> + * @filp: drm file pointer
>>>>>>> + *
>>>>>>> + * Returns:
>>>>>>> + * 0 for success, -errno for errors.
>>>>>>> + */
>>>>>>> +int amdgpu_profile_ioctl(struct drm_device *dev, void *data,
>>>>>>> +                      struct drm_file *filp)
>>>>>>> +{
>>>>>>> +     union drm_amdgpu_profile *args = data;
>>>>>>> +     struct amdgpu_device *adev = drm_to_adev(dev);
>>>>>>> +     const struct amd_pm_funcs *pp_funcs = adev->powerplay.pp_funcs;
>>>>>>> +     enum amd_dpm_forced_level current_level, requested_level;
>>>>>>> +     int r;
>>>>>>> +
>>>>>>> +     if (pp_funcs->get_performance_level)
>>>>>>> +             current_level = amdgpu_dpm_get_performance_level(adev);
>>>>>>> +     else
>>>>>>> +             current_level = adev->pm.dpm.forced_level;
>>>>>>> +
>>>>>>> +     switch (args->in.op) {
>>>>>>> +     case AMDGPU_PROFILE_OP_GET_STABLE_PSTATE:
>>>>>>> +             if (args->in.flags)
>>>>>>> +                     return -EINVAL;
>>>>>>> +             switch (current_level) {
>>>>>>> +             case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
>>>>>>> +                     args->out.flags = AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_STANDARD;
>>>>>>> +                     break;
>>>>>>> +             case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
>>>>>>> +                     args->out.flags = AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MIN_SCLK;
>>>>>>> +                     break;
>>>>>>> +             case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
>>>>>>> +                     args->out.flags = AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MIN_MCLK;
>>>>>>> +                     break;
>>>>>>> +             case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
>>>>>>> +                     args->out.flags = AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_PEAK;
>>>>>>> +                     break;
>>>>>>> +             default:
>>>>>>> +                     args->out.flags = AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_NONE;
>>>>>>> +                     break;
>>>>>>> +             }
>>>>>>> +             break;
>>>>>>> +     case AMDGPU_PROFILE_OP_SET_STABLE_PSTATE:
>>>>>>> +             if (args->in.flags & ~AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MASK)
>>>>>>> +                     return -EINVAL;
>>>>>>> +             switch (args->in.flags & AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MASK) {
>>>>>>> +             case AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_STANDARD:
>>>>>>> +                     requested_level = AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD;
>>>>>>> +                     break;
>>>>>>> +             case AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MIN_SCLK:
>>>>>>> +                     requested_level = AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK;
>>>>>>> +                     break;
>>>>>>> +             case AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MIN_MCLK:
>>>>>>> +                     requested_level = AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK;
>>>>>>> +                     break;
>>>>>>> +             case AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_PEAK:
>>>>>>> +                     requested_level = AMD_DPM_FORCED_LEVEL_PROFILE_PEAK;
>>>>>>> +                     break;
>>>>>>> +             case AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_NONE:
>>>>>>> +                     requested_level = AMD_DPM_FORCED_LEVEL_AUTO;
>>>>>>> +                     break;
>>>>>>> +             default:
>>>>>>> +                     return -EINVAL;
>>>>>>> +             }
>>>>>>> +
>>>>>>> +             if ((current_level != requested_level) && pp_funcs->force_performance_level) {
>>>>>>> +                     mutex_lock(&adev->pm.mutex);
>>>>>>> +                     r = amdgpu_dpm_force_performance_level(adev, requested_level);
>>>>>>> +                     if (!r)
>>>>>>> +                             adev->pm.dpm.forced_level = requested_level;
>>>>>>> +                     mutex_unlock(&adev->pm.mutex);
>>>>>>> +                     if (r)
>>>>>>> +                             return r;
>>>>>>> +             }
>>>>>>> +             break;
>>>>>>> +     default:
>>>>>>> +             return -EINVAL;
>>>>>>> +     }
>>>>>>> +
>>>>>>> +     return 0;
>>>>>>> +}
>>>>>>> +
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_profile.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_profile.h
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..cd1c597bae11
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_profile.h
>>>>>>> @@ -0,0 +1,30 @@
>>>>>>> +/*
>>>>>>> + * Copyright 2021 Advanced Micro Devices, Inc.
>>>>>>> + *
>>>>>>> + * Permission is hereby granted, free of charge, to any person obtaining a
>>>>>>> + * copy of this software and associated documentation files (the "Software"),
>>>>>>> + * to deal in the Software without restriction, including without limitation
>>>>>>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>>>>>>> + * and/or sell copies of the Software, and to permit persons to whom the
>>>>>>> + * Software is furnished to do so, subject to the following conditions:
>>>>>>> + *
>>>>>>> + * The above copyright notice and this permission notice shall be included in
>>>>>>> + * all copies or substantial portions of the Software.
>>>>>>> + *
>>>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>>>>>>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>>>>>>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>>>>>>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>>>>>>> + * OTHER DEALINGS IN THE SOFTWARE.
>>>>>>> + *
>>>>>>> + */
>>>>>>> +
>>>>>>> +#ifndef __AMDGPU_PROFILE_H__
>>>>>>> +#define __AMDGPU_PROFILE_H__
>>>>>>> +
>>>>>>> +int amdgpu_profile_ioctl(struct drm_device *dev, void *data,
>>>>>>> +                      struct drm_file *filp);
>>>>>>> +
>>>>>>> +#endif
>>>>>>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
>>>>>>> index 26e45fc5eb1a..b6edf4a826f9 100644
>>>>>>> --- a/include/uapi/drm/amdgpu_drm.h
>>>>>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>>>>>> @@ -54,6 +54,7 @@ extern "C" {
>>>>>>>      #define DRM_AMDGPU_VM                       0x13
>>>>>>>      #define DRM_AMDGPU_FENCE_TO_HANDLE  0x14
>>>>>>>      #define DRM_AMDGPU_SCHED            0x15
>>>>>>> +#define DRM_AMDGPU_PROFILE           0x16
>>>>>>>
>>>>>>>      #define DRM_IOCTL_AMDGPU_GEM_CREATE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>>>>>>>      #define DRM_IOCTL_AMDGPU_GEM_MMAP   DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
>>>>>>> @@ -71,6 +72,7 @@ extern "C" {
>>>>>>>      #define DRM_IOCTL_AMDGPU_VM         DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
>>>>>>>      #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>>>>>>>      #define DRM_IOCTL_AMDGPU_SCHED              DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
>>>>>>> +#define DRM_IOCTL_AMDGPU_PROFILE     DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_PROFILE, union drm_amdgpu_profile)
>>>>>>>
>>>>>>>      /**
>>>>>>>       * DOC: memory domains
>>>>>>> @@ -1120,6 +1122,32 @@ struct drm_amdgpu_info_video_caps {
>>>>>>>          struct drm_amdgpu_info_video_codec_info codec_info[AMDGPU_INFO_VIDEO_CAPS_CODEC_IDX_COUNT];
>>>>>>>      };
>>>>>>>
>>>>>>> +/* profile ioctl */
>>>>>>> +#define AMDGPU_PROFILE_OP_GET_STABLE_PSTATE  1
>>>>>>> +#define AMDGPU_PROFILE_OP_SET_STABLE_PSTATE  2
>>>>>>> +
>>>>>>> +#define AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MASK      0xf
>>>>>>> +#define AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_NONE      0
>>>>>>> +#define AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_STANDARD  1
>>>>>>> +#define AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MIN_SCLK  2
>>>>>>> +#define AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_MIN_MCLK  3
>>>>>>> +#define AMDGPU_PROFILE_FLAGS_STABLE_PSTATE_PEAK      4
>>>>>>> +
>>>>>>> +struct drm_amdgpu_profile_in {
>>>>>>> +     /** AMDGPU_PROFILE_OP_* */
>>>>>>> +     __u32   op;
>>>>>>> +     __u32   flags;
>>>>>>> +};
>>>>>>> +
>>>>>>> +struct drm_amdgpu_profile_out {
>>>>>>> +     __u64   flags;
>>>>>>> +};
>>>>>>> +
>>>>>>> +union drm_amdgpu_profile {
>>>>>>> +     struct drm_amdgpu_profile_in in;
>>>>>>> +     struct drm_amdgpu_profile_out out;
>>>>>>> +};
>>>>>>> +
>>>>>>>      /*
>>>>>>>       * Supported GPU families
>>>>>>>       */


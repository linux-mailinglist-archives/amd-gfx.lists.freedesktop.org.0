Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B11A039F0
	for <lists+amd-gfx@lfdr.de>; Tue,  7 Jan 2025 09:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8021210E3C1;
	Tue,  7 Jan 2025 08:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="WZFW/gwL";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B648D10E251;
 Tue,  7 Jan 2025 07:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1736233598; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=E2yAups8bmYAoZtYYL+hKuLGlTv3Ay875Q08Y1yWntA=;
 b=WZFW/gwLHO23ljFeQxzRHVLPYSSkpk1plRnGzT1oL6XGyBVfntRDSntGu3arqJPJYpdcRN/wNs2XGNUF1tosphBYJ6kAcAyzpA8nHh2KWe57FDm1yCpL/E8xKL0RDvm7ApdBQKhOLHKLLCYRxYr5Si64JwiVDiS1Wext20TjEKw=
Received: from 30.246.161.230(mailfrom:xueshuai@linux.alibaba.com
 fp:SMTPD_---0WN9p.qF_1736233595 cluster:ay36) by smtp.aliyun-inc.com;
 Tue, 07 Jan 2025 15:06:37 +0800
Message-ID: <dbaaac26-9df2-49c2-8591-7ceb7b8f5e40@linux.alibaba.com>
Date: Tue, 7 Jan 2025 15:06:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: [PATCH] drm/amdgpu: Enable runtime modification of
 gpu_recovery parameter with validation
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Ma, Le" <Le.Ma@amd.com>, "hamza.mahfooz@amd.com" <hamza.mahfooz@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Jun.Ma2@amd.com" <Jun.Ma2@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tianruidong@linux.alibaba.com" <tianruidong@linux.alibaba.com>
References: <20241228063245.61874-1-xueshuai@linux.alibaba.com>
 <563b1797-5524-44c5-89b0-754f245e6b8f@amd.com>
 <63938ba2-dcb5-456f-bf82-bd8c893549c0@linux.alibaba.com>
 <PH7PR12MB5685C307737F826039EEE48583152@PH7PR12MB5685.namprd12.prod.outlook.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <PH7PR12MB5685C307737F826039EEE48583152@PH7PR12MB5685.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Jan 2025 08:42:01 +0000
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



在 2025/1/3 16:21, Koenig, Christian 写道:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Shuai,
> 
> setting gpu_recovery=0 is not even remotely related to RAS. If that option affects RAS behavior in any way then that is a bug.
> 
> The purpose of setting gpu_recovery=0 is to disable resets after a submission timeout most likely caused by an unrecoverable HW error.
> 
> This is necessary for JTAG debugging in our labs during HW bringup and should *NEVER* be used on any production system.
> 
> We already discussed with upstream maintainers that we should probably mark the kernel as tainted to indicate that it might be in an unreliable HW state. I will push for this now since there seems to be a big misunderstanding what this option does.
> 
> Regards,
> Christian.


Hi, Christian,

Got the purpose of setting gpu_recovery=0. Thanks for the your patient explanation.

When a ECC error occurs, the AMD GPU driver auto resets all GPUs and all jobs
are terminated. My ultimate goal is provide error isolation between independent
jobs which use a different GPU. Any suggestion?

Thank you.
Best Regards,

> 
> ________________________________________
> Von: Shuai Xue <xueshuai@linux.alibaba.com>
> Gesendet: Montag, 30. Dezember 2024 09:50
> An: Koenig, Christian; Deucher, Alexander; Pan, Xinhui; airlied@gmail.com; simona@ffwll.ch; Lazar, Lijo; Ma, Le; hamza.mahfooz@amd.com; tzimmermann@suse.de; Liu, Shaoyun; Jun.Ma2@amd.com
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; tianruidong@linux.alibaba.com
> Betreff: Re: [PATCH] drm/amdgpu: Enable runtime modification of gpu_recovery parameter with validation
> 
> 
> 
> 在 2024/12/30 04:11, Christian König 写道:
>> Am 28.12.24 um 07:32 schrieb Shuai Xue:
>>> It's observed that most GPU jobs utilize less than one server, typically
>>> with each GPU being used by an independent job. If a job consumed poisoned
>>> data, a SIGBUS signal will be sent to terminate it. Meanwhile, the
>>> gpu_recovery parameter is set to -1 by default, the amdgpu driver resets
>>> all GPUs on the server. As a result, all jobs are terminated. Setting
>>> gpu_recovery to 0 provides an opportunity to preemptively evacuate other
>>> jobs and subsequently manually reset all GPUs.
>>
>> *BIG* NAK to this whole approach!
>>
>> Setting gpu_recovery to 0 in a production environment is *NOT* supported at all and should never be done.
>>
>> This is a pure debugging feature for JTAG debugging and can result in random crashes and/or compromised data.
>>
>> Please don't tell me that you tried to use this in a production environment.
>>
>> Regards,
>> Christian.
> 
> Hi, Christian,
> 
> Thank you for your quick reply.
> 
> When an application encounters uncorrected error, it will be terminate by a
> SIGBUS signal. The related bad pages are retired. I did not figure why
> gpu_recovery=0 can result in random crashes and/or compromised data.
> 
> I test with error injection in my dev enviroment:
> 
> 1. load driver with gpu_recovery=0
> #cat /sys/bus/pci/drivers/amdgpu/module/parameters/gpu_recovery
> 0
> 
> 2. inject a Uncorrectable ECC error to UMC
> #sudo amdgpuras -d 0 -b 2 -t 8
> Poison inject, logical addr:0x7f2b495f9000 physical addr:0x27f5d4b000 vmid:5
> Bus error
> 
> 3. GPU 0000:0a:00.0 reports error address with PA
> #dmesg | grep 27f5
> [424443.174154] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d43080 Row:0x1fd7 Col:0x0  Bank:0xa Channel:0x30
> [424443.174156] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d4b080 Row:0x1fd7 Col:0x4  Bank:0xa Channel:0x30
> [424443.174158] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d53080 Row:0x1fd7 Col:0x8  Bank:0xa Channel:0x30
> [424443.174160] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5d5b080 Row:0x1fd7 Col:0xc  Bank:0xa Channel:0x30
> [424443.174162] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f43080 Row:0x1fd7 Col:0x10 Bank:0xa Channel:0x30
> [424443.174169] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f4b080 Row:0x1fd7 Col:0x14 Bank:0xa Channel:0x30
> [424443.174172] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f53080 Row:0x1fd7 Col:0x18 Bank:0xa Channel:0x30
> [424443.174174] amdgpu 0000:0a:00.0: amdgpu: Error Address(PA):0x27f5f5b080 Row:0x1fd7 Col:0x1c Bank:0xa Channel:0x30
> 
> 4. All the related bad pages are AMDGPU_RAS_RETIRE_PAGE_RESERVED.
> #cat /sys/devices/pci0000:05/0000:05:01.0/0000:06:00.0/0000:07:00.0/0000:08:00.0/0000:09:00.0/0000:0a:00.0/ras/gpu_vram_bad_pages | grep 27f5
> 0x027f5d43 : 0x00001000 : R
> 0x027f5d4b : 0x00001000 : R
> 0x027f5d53 : 0x00001000 : R
> 0x027f5d5b : 0x00001000 : R
> 0x027f5f43 : 0x00001000 : R
> 0x027f5f4b : 0x00001000 : R
> 0x027f5f53 : 0x00001000 : R
> 0x027f5f5b : 0x00001000 : R
> 
> AFAIK, the reserved bad pages will not be used any more.  Please correct me if
> I missed anything.
> 
> DRAM ECC issues are the most common problems. When it occurs, the kernel will
> attempt to hard-offline the page, by trying to unmap the page or killing any
> owner, or triggering IO errors if needed.
> 
> ECC error is also common for HBM and error isolation from each user's job is a
> basic requirement in public cloud. For NVIDIA GPU, a ECC error could be
> contained to a process.
> 
>> XID 94: Contained ECC error
>> XID 95: UnContained ECC error
>>
>> For Xid 94, these errors are contained to one application, and the application
>> that encountered this error must be restarted. All other applications running
>> at the time of the Xid are unaffected. It is recommended to reset the GPU when
>> convenient. Applications can continue to be run until the reset can be
>> performed.
>>
>> For Xid 95, these errors affect multiple applications, and the affected GPU
>> must be reset before applications can restart.
>>
>> https://docs.nvidia.com/deploy/xid-errors/
> 
> Does AMD GPU provide a similar way to achieve error isolation requirement?
> 
> Best Regards,
> Shuai
> 
>>
>>>    However, this parameter is
>>> read-only, necessitating correct settings at driver load. And reloading the
>>> GPU driver in a production environment can be challenging due to reference
>>> counts maintained by various monitoring services.
>>>
>>> Set the gpu_recovery parameter with read-write permission to enable runtime
>>> modification. It will enables users to dynamically manage GPU recovery
>>> mechanisms based on real-time requirements or conditions.
>>>
>>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 26 ++++++++++++++++++++++++-
>>>    1 file changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> index 38686203bea6..03dd902e1cec 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -563,12 +563,36 @@ module_param_named(lbpw, amdgpu_lbpw, int, 0444);
>>>    MODULE_PARM_DESC(compute_multipipe, "Force compute queues to be spread across pipes (1 = enable, 0 = disable, -1 = auto)");
>>>    module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
>>> +static int amdgpu_set_gpu_recovery(const char *buf,
>>> +                   const struct kernel_param *kp)
>>> +{
>>> +    unsigned long val;
>>> +    int ret;
>>> +
>>> +    ret = kstrtol(buf, 10, &val);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    if (val != 1 && val != 0 && val != -1) {
>>> +        pr_err("Invalid value for gpu_recovery: %ld, excepted 0,1,-1\n",
>>> +               val);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    return param_set_int(buf, kp);
>>> +}
>>> +
>>> +static const struct kernel_param_ops amdgpu_gpu_recovery_ops = {
>>> +    .set = amdgpu_set_gpu_recovery,
>>> +    .get = param_get_int,
>>> +};
>>> +
>>>    /**
>>>     * DOC: gpu_recovery (int)
>>>     * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). The default is -1 (auto, disabled except SRIOV).
>>>     */
>>>    MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
>>> -module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>>> +module_param_cb(gpu_recovery, &amdgpu_gpu_recovery_ops, &amdgpu_gpu_recovery, 0644);
>>>    /**
>>>     * DOC: emu_mode (int)

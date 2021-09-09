Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D64404757
	for <lists+amd-gfx@lfdr.de>; Thu,  9 Sep 2021 10:50:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28F16E4A1;
	Thu,  9 Sep 2021 08:50:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8176E4A1
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 Sep 2021 08:50:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x6so1373703wrv.13
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 Sep 2021 01:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MHG54aa7mwgQVCTtc0CLgFD+I5rkVaDXOzuiyUmdGpI=;
 b=QUdbllfjGSXgZ7utYSkD18sjMU2twHaget1yJ1UnjnBXjDQEYZrvaazM9niAh3SnMQ
 /08ObDGtoP5l1LH3cOSmcSpkQjArEvc3/rtX7wuAR0aFLKYekL7yQE6NeQITaIn7Pa+d
 uFaEc/81KvHNN0m53rVMhQOy1DKWLE/PDrbMXUNdZxlZyqeK4qDON+y/o63ApyMndRsn
 STcgG3oq2Fj9M4SB7dRFcMeElaI6ZNnBoNjqrHan0hY1u9hNrD8cZheo3a4UmPMmi+Wf
 AsdaMwmK1haEtH7hrH5TLffaUfaCkspd9hm++FhB+tyM0l67KN7DcWbD7f0AvDA7wdlE
 FKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MHG54aa7mwgQVCTtc0CLgFD+I5rkVaDXOzuiyUmdGpI=;
 b=YBi92kBN6WoIdG/762TfZgDKZdKOHzc0Xzk06OGNv3w2pYmLrzPGqFwXxGSQwif9fN
 COzdK0oHiAeVnkc5rEkKQcOIp0aHdkCMvFN06QiQslIwWNDMcaNL6DWKTUx4Bnf25hWN
 j1HmspLebC/rlA/7D30xft23KiSIg/IVAB2oGxpwkW4r5YXoQ8Cc4ENSv6xM3SxX3f3U
 eQlHMmEAuEr1TJhJgGXTrKFZjcf8Aq0Hz+ytC/nPsn3G5vpx5j2zJuz0kvyoRNoA0zkR
 UajBcxcBuj6bI8zb62618p1j2V08/6XPxZY7mZswOP+n734k8OccKcaCP7Huk7xTKYUJ
 naRg==
X-Gm-Message-State: AOAM532EyWUzz4Flf1qdA/Y1RTqNsMOX2pxjBhPFWRx7r0HRbYYNyVAw
 YzOk/sHZDs5TUyZRCkf298U=
X-Google-Smtp-Source: ABdhPJwsNUs29AQ11xaM87E9hRpuXyKQVbfuMIfPecfTZ3DtMWj0voWf36YUAG9EZ+wvuV7w9xbL8g==
X-Received: by 2002:adf:b781:: with SMTP id s1mr2122844wre.319.1631177409876; 
 Thu, 09 Sep 2021 01:50:09 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7140:364b:3af8:f004?
 ([2a02:908:1252:fb60:7140:364b:3af8:f004])
 by smtp.gmail.com with ESMTPSA id x18sm1015535wmj.36.2021.09.09.01.50.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Sep 2021 01:50:09 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix sysfs_emit/sysfs_emit_at warnings
To: "Lazar, Lijo" <lijo.lazar@amd.com>, "Yu, Lang" <Lang.Yu@amd.com>,
 "Powell, Darren" <Darren.Powell@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>, Tian Tao <tiantao6@hisilicon.com>
References: <20210908055615.3781901-1-lang.yu@amd.com>
 <e8b39f62-ca0c-d4e0-92a9-52487fa0da81@gmail.com>
 <47ed143e-b9ab-a80e-dac0-cfa1ec39d033@amd.com>
 <DM6PR12MB425086A1FFE0D1609581DFBAFBD49@DM6PR12MB4250.namprd12.prod.outlook.com>
 <39d2443b-c90e-b5c6-85ee-b44bbfd818d3@amd.com>
 <DM6PR12MB4250831801024A782408C280FBD49@DM6PR12MB4250.namprd12.prod.outlook.com>
 <332d81e6-a518-a155-cdfc-008e0bdb324c@amd.com>
 <5edd4df2-c49c-3b87-90d4-8d8b822641f9@gmail.com>
 <1fa7224f-de58-6864-6cb2-16a7b8968f54@amd.com>
 <4e6c0a19-0476-d8ca-c233-6f143cca511c@gmail.com>
 <CH0PR12MB5387C11CD331985AB96F0DCEF0D49@CH0PR12MB5387.namprd12.prod.outlook.com>
 <DM6PR12MB4250EC35F696D19098E9642AFBD59@DM6PR12MB4250.namprd12.prod.outlook.com>
 <3c02e758-1d36-ce2a-11df-eedd82a30c33@amd.com>
 <58d5fbbc-dd57-85ff-f627-8479d7db8128@gmail.com>
 <f94f20c4-b7f4-3cc5-f631-3160796bc31f@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <75d66c25-f47a-dfbb-e49b-e65a5b3f5f4e@gmail.com>
Date: Thu, 9 Sep 2021 10:50:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f94f20c4-b7f4-3cc5-f631-3160796bc31f@amd.com>
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Am 09.09.21 um 10:36 schrieb Lazar, Lijo:
> On 9/9/2021 1:31 PM, Christian König wrote:
>> Am 09.09.21 um 05:28 schrieb Lazar, Lijo:
>>> On 9/9/2021 8:13 AM, Yu, Lang wrote:
>>>> [AMD Official Use Only]
>>>>
>>>> So the final decision is rollback to scnprintf().
>>>>
>>>> If we can define our own helper functions like 
>>>> sysfs_emit/sysfs_emit_at
>>>>
>>>> but without page boundary aligned limitation to make life easier?
>>>>
>>>
>>> No, we do want to make it clear that this function is used for sysfs 
>>> files and make use of the extra checks provided by the sysfs_emit* 
>>> functions. Looking at the origins of sysf_emit_at() specifically, 
>>> there are indeed some cases of printing more than one values per 
>>> file and multi-line usage.
>>
>> Correct, but those are rather limited and well documented special 
>> cases. E.g. for example if you need to grab a lock to get multiple 
>> values which are supposed to be coherent to each other.
>>
>> I think that's the case here, so printing multiple values is probably 
>> ok in general. But we still need to get the implementation straight.
>>
>>> So I'm fine with your original patch. Maybe, you can make the 
>>> intention explicit by keeping the offset and buf start calculations 
>>> in a separate inline function.
>>>     smu_get_sysfs_buf()
>>
>> Exactly that is what is not ok. So once more the intended use case of 
>> those functions is:
>>
>> offs = sysfs_emit(page, ...);
>> offs += sysfs_emit_at(page, offs, ....);
>> offs += sysfs_emit_at(page, offs, ....);
>> ...
>>
>> Another possible alternative which I think should be allowed is:
>>
>> offs = 0;
>> for_each_clock_in_my_device(..) {
>>      offs += sysfs_emit_at(page, offs, ....);
>> }
>>
>> But when you are calculating the initial offset manually then there 
>> is certainly something wrong here and that is not the intended usage 
>> pattern.
>>
>
> Actually, the issue is not within one function invocation. The issue 
> is at the caller side with multiple invocations -
>
>                  size = amdgpu_dpm_print_clock_levels(adev, OD_SCLK, 
> buf);
>                  size += amdgpu_dpm_print_clock_levels(adev, OD_MCLK,
> buf+size);
>
> Having amdgpu_dpm_print_clock_levels() helped to consolidate sysfs 
> calls in single function for different parameters and used for 
> different nodes. However in this case, different parameters are 
> presented as a single "logical entity" in a sysfs node and the 
> function is called multiple times for different parameters 
> (questionable as per sysfs guidelines, Alex needs to come back on this).

Yes, exactly that. But as I noted above multiple values are ok when you 
need to keep them coherent, e.g. returning SCLK and MCLK without a 
performance level switch in between.

> Within one invocation of amdgpu_dpm_print_clock_levels(), the APIs are 
> used correctly. For the second call, it needs to pass the page aligned 
> buf pointer correctly to sysfs_emit* calls.
>
> Presently, amdgpu_dpm_print_clock_levels() takes only buff pointer as 
> argument and probably it is that way since the function existed before 
> sysfs_emit* patches got added and was originally using sprintfs.
>
> Now, two possible options are -
>
> 1) Make a pre-requisite that this function is always going to print to 
> sysfs files. For that use sysfs_emit*. Also, as with a sysfs buffer 
> calculate the page aligned start address of buf and offset for use 
> with sysfs_emit* in the beginning. At least for now, this assumption 
> is inline with the buffer start address requirement in sysfs_emit* 
> patches. This is what the original patch does. That said, if the 
> buffer properties change in future this will not hold good.
>
> 2) Pass the offset along with the buff in API. That will be extensive 
> since it affects older powerplay based HWs also.

I think that should be the way to go then.

> There may be other ways, but those could be even more extensive than 2).

 From a high level view my feeling says me that returning the values as 
numbers and printing them in the higher level function is a better 
design, but there might as well be reason against that.

Regards,
Christian.

>
> Thanks,
> Lijo
>
>> Regards,
>> Christian.
>>
>>>
>>> Thanks,
>>> Lijo
>>>
>>>> Regards,
>>>>
>>>> Lang
>>>>
>>>> *From:* Powell, Darren <Darren.Powell@amd.com>
>>>> *Sent:* Thursday, September 9, 2021 6:18 AM
>>>> *To:* Christian König <ckoenig.leichtzumerken@gmail.com>; Lazar, 
>>>> Lijo <Lijo.Lazar@amd.com>; Yu, Lang <Lang.Yu@amd.com>; 
>>>> amd-gfx@lists.freedesktop.org
>>>> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; Huang, Ray 
>>>> <Ray.Huang@amd.com>; Tian Tao <tiantao6@hisilicon.com>
>>>> *Subject:* Re: [PATCH] drm/amdgpu: fix sysfs_emit/sysfs_emit_at 
>>>> warnings
>>>>
>>>> [AMD Official Use Only]
>>>>
>>>> ------------------------------------------------------------------------ 
>>>>
>>>>
>>>> *From:*Christian König <ckoenig.leichtzumerken@gmail.com 
>>>> <mailto:ckoenig.leichtzumerken@gmail.com>>
>>>> *Sent:* Wednesday, September 8, 2021 8:43 AM
>>>> *To:* Lazar, Lijo <Lijo.Lazar@amd.com <mailto:Lijo.Lazar@amd.com>>; 
>>>> Yu, Lang <Lang.Yu@amd.com <mailto:Lang.Yu@amd.com>>; 
>>>> amd-gfx@lists.freedesktop.org 
>>>> <mailto:amd-gfx@lists.freedesktop.org> 
>>>> <amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>>
>>>> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com 
>>>> <mailto:Alexander.Deucher@amd.com>>; Huang, Ray <Ray.Huang@amd.com 
>>>> <mailto:Ray.Huang@amd.com>>; Tian Tao <tiantao6@hisilicon.com 
>>>> <mailto:tiantao6@hisilicon.com>>; Powell, Darren 
>>>> <Darren.Powell@amd.com <mailto:Darren.Powell@amd.com>>
>>>> *Subject:* Re: [PATCH] drm/amdgpu: fix sysfs_emit/sysfs_emit_at 
>>>> warnings
>>>>
>>>> Am 08.09.21 um 12:22 schrieb Lazar, Lijo:
>>>>  > On 9/8/2021 3:08 PM, Christian König wrote:
>>>>  >> Am 08.09.21 um 11:29 schrieb Lazar, Lijo:
>>>>  >>> On 9/8/2021 2:32 PM, Yu, Lang wrote:
>>>>  >>>> [AMD Official Use Only]
>>>>  >>>>> -----Original Message-----
>>>>  >>>>> From: Lazar, Lijo <Lijo.Lazar@amd.com 
>>>> <mailto:Lijo.Lazar@amd.com>>
>>>>  >>>>> Sent: Wednesday, September 8, 2021 4:55 PM
>>>>  >>>>> To: Yu, Lang <Lang.Yu@amd.com <mailto:Lang.Yu@amd.com>>; 
>>>> Christian König
>>>>  >>>>> <ckoenig.leichtzumerken@gmail.com 
>>>> <mailto:ckoenig.leichtzumerken@gmail.com>>; 
>>>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
>>>>  >>>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com 
>>>> <mailto:Alexander.Deucher@amd.com>>; Huang, Ray
>>>>  >>>>> <Ray.Huang@amd.com <mailto:Ray.Huang@amd.com>>; Tian Tao 
>>>> <tiantao6@hisilicon.com <mailto:tiantao6@hisilicon.com>>
>>>>  >>>>> Subject: Re: [PATCH] drm/amdgpu: fix sysfs_emit/sysfs_emit_at
>>>>  >>>>> warnings
>>>>  >>>>>
>>>>  >>>>>
>>>>  >>>>>
>>>>  >>>>> On 9/8/2021 1:14 PM, Yu, Lang wrote:
>>>>  >>>>>> [AMD Official Use Only]
>>>>  >>>>>>
>>>>  >>>>>>
>>>>  >>>>>>
>>>>  >>>>>>> -----Original Message-----
>>>>  >>>>>>> From: Lazar, Lijo <Lijo.Lazar@amd.com 
>>>> <mailto:Lijo.Lazar@amd.com>>
>>>>  >>>>>>> Sent: Wednesday, September 8, 2021 3:36 PM
>>>>  >>>>>>> To: Christian König <ckoenig.leichtzumerken@gmail.com 
>>>> <mailto:ckoenig.leichtzumerken@gmail.com>>; Yu, Lang
>>>>  >>>>>>> <Lang.Yu@amd.com <mailto:Lang.Yu@amd.com>>; 
>>>> amd-gfx@lists.freedesktop.org <mailto:amd-gfx@lists.freedesktop.org>
>>>>  >>>>>>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com 
>>>> <mailto:Alexander.Deucher@amd.com>>; Huang, Ray
>>>>  >>>>>>> <Ray.Huang@amd.com <mailto:Ray.Huang@amd.com>>; Tian Tao 
>>>> <tiantao6@hisilicon.com <mailto:tiantao6@hisilicon.com>>
>>>>  >>>>>>> Subject: Re: [PATCH] drm/amdgpu: fix sysfs_emit/sysfs_emit_at
>>>>  >>>>>>> warnings
>>>>  >>>>>>>
>>>>  >>>>>>>
>>>>  >>>>>>>
>>>>  >>>>>>> On 9/8/2021 12:07 PM, Christian König wrote:
>>>>  >>>>>>>> Am 08.09.21 um 07:56 schrieb Lang Yu:
>>>>  >>>>>>>>> sysfs_emit and sysfs_emit_at requrie a page boundary 
>>>> aligned buf
>>>>  >>>>>>>>> address. Make them happy!
>>>>  >>>>>>>>>
>>>>  >>>>>>>>> Warning Log:
>>>>  >>>>>>>>> [  492.545174] invalid sysfs_emit_at: 
>>>> buf:00000000f19bdfde at:0 [
>>>>  >>>>>>>>> 492.546416] WARNING: CPU: 7 PID: 1304 at 
>>>> fs/sysfs/file.c:765
>>>>  >>>>>>>>> sysfs_emit_at+0x4a/0xa0
>>>>  >>>>>>>>> [  492.654805] Call Trace:
>>>>  >>>>>>>>> [  492.655353]  ? smu_cmn_get_metrics_table+0x40/0x50 
>>>> [amdgpu] [
>>>>  >>>>>>>>> 492.656780] vangogh_print_clk_levels+0x369/0x410 [amdgpu] [
>>>>  >>>>>>>>> 492.658245] vangogh_common_print_clk_levels+0x77/0x80 
>>>> [amdgpu] [
>>>>  >>>>>>>>> 492.659733]  ? preempt_schedule_common+0x18/0x30 [ 
>>>> 492.660713]
>>>>  >>>>>>>>> smu_print_ppclk_levels+0x65/0x90 [amdgpu] [ 492.662107]
>>>>  >>>>>>>>> amdgpu_get_pp_od_clk_voltage+0x13d/0x190 [amdgpu] [ 
>>>> 492.663620]
>>>>  >>>>>>>>> dev_attr_show+0x1d/0x40
>>>>  >>>>>>>>
>>>>  >>>>>>>> Mhm, that at least partially doesn't looks like the right
>>>>  >>>>>>>> approach to me.
>>>>  >>>>>>>>
>>>>  >>>>>>>> Why do we have string printing and sysfs code in the 
>>>> hardware
>>>>  >>>>>>>> version specific backend in the first place?
>>>>  >>>>>>>>
>>>>  >>>>>>>
>>>>  >>>>>>> This is a callback meant for printing ASIC specific 
>>>> information to
>>>>  >>>>>>> sysfs node. The buffer passed in sysfs read is passed as 
>>>> it is
>>>>  >>>>>>> to the callback API.
>>>>  >>>>>>>
>>>>  >>>>>>>> That stuff needs to be implemented for each hardware 
>>>> generation
>>>>  >>>>>>>> and
>>>>  >>>>>>>> is now cluttered with sysfs buffer offset calculations.
>>>>  >>>>>>>>
>>>>  >>>>>>>
>>>>  >>>>>>> Looks like the warning happened because of this usage.
>>>>  >>>>>>>
>>>>  >>>>>>>                   size = amdgpu_dpm_print_clock_levels(adev,
>>>>  >>>>>>> OD_SCLK, buf);
>>>>  >>>>>>>                   size += amdgpu_dpm_print_clock_levels(adev,
>>>>  >>>>>>> OD_MCLK,
>>>>  >>>>>>> buf+size);
>>>>  >>>>>>>                   size += amdgpu_dpm_print_clock_levels(adev,
>>>>  >>>>>>> OD_VDDC_CURVE, buf+size);
>>>>  >>>>>>>                   size += amdgpu_dpm_print_clock_levels(adev,
>>>>  >>>>>>> OD_VDDGFX_OFFSET, buf+size);
>>>>  >>>>>>>                   size += amdgpu_dpm_print_clock_levels(adev,
>>>>  >>>>>>> OD_RANGE,
>>>>  >>>>>>> buf+size);
>>>>  >>>>>>>                   size += amdgpu_dpm_print_clock_levels(adev,
>>>>  >>>>>>> OD_CCLK,
>>>>  >>>>>>> buf+size);
>>>>  >>>>>>>
>>>>  >>>>>>>
>>>>  >>>>>> [Yu, Lang]
>>>>  >>>>>> Yes. So it is fine we just fix the caller
>>>>  >>>>>> amdgpu_get_pp_od_clk_voltage like
>>>>  >>>>> following:
>>>>  >>>>>>
>>>>  >>>>>> static ssize_t amdgpu_get_pp_od_clk_voltage(struct device 
>>>> *dev,
>>>>  >>>>>>         struct device_attribute *attr,
>>>>  >>>>>>         char *buf)
>>>>  >>>>>> {
>>>>  >>>>>>     struct drm_device *ddev = dev_get_drvdata(dev);
>>>>  >>>>>>     struct amdgpu_device *adev = drm_to_adev(ddev);
>>>>  >>>>>>     ssize_t size, offset;
>>>>  >>>>>>     int ret, i;
>>>>  >>>>>>     char temp_buf[512];
>>>>  >>>>>>     char clock_type[] = {OD_SCLK, OD_MCLK, OD_VDDC_CURVE,
>>>>  >>>>>> OD_VDDGFX_OFFSET, OD_RANGE, OD_CCLK};
>>>>  >>>>>>
>>>>  >>>>>>     if (amdgpu_in_reset(adev))
>>>>  >>>>>>         return -EPERM;
>>>>  >>>>>>     if (adev->in_suspend && !adev->in_runpm)
>>>>  >>>>>>         return -EPERM;
>>>>  >>>>>>
>>>>  >>>>>>     ret = pm_runtime_get_sync(ddev->dev);
>>>>  >>>>>>     if (ret < 0) {
>>>>  >>>>>> pm_runtime_put_autosuspend(ddev->dev);
>>>>  >>>>>>         return ret;
>>>>  >>>>>>     }
>>>>  >>>>>>
>>>>  >>>>>>     offset = 0;
>>>>  >>>>>>
>>>>  >>>>>>     if (adev->powerplay.pp_funcs->print_clock_levels) {
>>>>  >>>>>>         for (i = 0; i < ARRAY_SIZE(clock_type); i++) {
>>>>  >>>>>>             size = amdgpu_dpm_print_clock_levels(adev,
>>>>  >>>>> clock_type[i], buf);
>>>>  >>>>>>             if (offset + size > PAGE_SIZE)
>>>>  >>>>>>                 break;
>>>>  >>>>>>             memcpy(temp_buf + offset, buf, size);
>>>>  >>>>>>             offset += size;
>>>>  >>>>>>         }
>>>>  >>>>>>         memcpy(buf, temp_buf, offset);
>>>>  >>>>>>         size = offset;
>>>>  >>>>>>     } else {
>>>>  >>>>>>         size = sysfs_emit(buf, "\n");
>>>>  >>>>>>     }
>>>>  >>>>>>     pm_runtime_mark_last_busy(ddev->dev);
>>>>  >>>>>>     pm_runtime_put_autosuspend(ddev->dev);
>>>>  >>>>>>
>>>>  >>>>>>     return size;
>>>>  >>>>>> }
>>>>  >>>>>>
>>>>  >>>>> Prefer to avoid any extra stack or heap usage for buffer. Maybe
>>>>  >>>>> another arg to
>>>>  >>>>> pass offset along with buf?
>>>>  >>>>>
>>>>  >>>> [Yu, Lang]
>>>>  >>>> Actually, the buf address contains the 
>>>> offset(offset_in_page(buf)) .
>>>>  >>>
>>>>  >>> Though it's not a problem based on codeflow, static analysis 
>>>> tools
>>>>  >>> might complain.
>>>>  >>>
>>>>  >>>> Or we just rollback to sprintf/snprintf.
>>>>  >>>>
>>>>  >>>
>>>>  >>> snprintf with (PAGE_SIZE-size) may be simpler. I think Darren 
>>>> took
>>>>  >>> the effort to convert these, he may have some other ideas.
>>>> The changes I made were intended to simply replace snprintf with 
>>>> sysfs_emit as per
>>>>
>>>> linux/Documentation/filesystems/sysfs.rst:246,247
>>>>
>>>>   -  show() should only use sysfs_emit() or sysfs_emit_at() when 
>>>> formatting
>>>>
>>>>      the value to be returned to user space.
>>>>
>>>> I specifically tried not to change the design, but only as I didn't 
>>>> have
>>>>
>>>> background in Power Management.
>>>>
>>>>  >>
>>>>  >> This is not what I meant. See from the design point of view the
>>>>  >> print_clock_levels() callback is the bad idea to begin with.
>>>>  >>
>>>>  >> What we should have instead is a callback which returns the 
>>>> clock as
>>>>  >> a value which is then printed in the 
>>>> amdgpu_get_pp_od_clk_voltage()
>>>>  >> function.
>>>>  >>
>>>>  >> This avoids passing around the buffer and remaining size 
>>>> everywhere
>>>>  >> and also guarantees that the sysfs have unified printing over all
>>>>  >> hardware generations.
>>>>  >>
>>>>  >
>>>>  > The scenario is one node used for multiple parameters - OD_SCLK,
>>>>  > OD_CCLK, OD_VDDGFX_OFFSET etc.(mostly to avoid cluttering sysfs 
>>>> with
>>>>  > lots of nodes). On top of it, the parameters supported (for ex: 
>>>> CCLK
>>>>  > is not valid on dGPUs),  the number of levels supported etc. vary
>>>>  > across ASICs. There has to be multiple calls or the call needs to
>>>>  > return multiple values for a single parameter (for ex: up to 4, 
>>>> 8 or
>>>>  > 16 levels of GFXCLK depending on ASIC).
>>>>
>>>> Well exactly that is questionable design for sysfs.
>>>>
>>>> See the sysfs_emit() and sysfs_emit_at() functions are designed the 
>>>> way
>>>> they are because you should have only one value per file, which is 
>>>> then
>>>> printed at exactly one location.
>>>>
>>>> Take a look at the documentation for sysfs for more details.
>>>>
>>>>  > I don't know the history of the callback, mostly it was considered
>>>>  > more efficient to print it directly rather than fetch and print.
>>>>  > Alex/Evan may know the details.
>>>>
>>>> Yeah, somebody with a bit more background in power management needs to
>>>> take a closer look at this here. Just keep me looped in.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>  >
>>>>  > Thanks,
>>>>  > Lijo
>>>>  >
>>>>  >> Regards,
>>>>  >> Christian.
>>>>  >>
>>>>
>>


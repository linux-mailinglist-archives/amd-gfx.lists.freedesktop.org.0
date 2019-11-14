Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C18FFAB16
	for <lists+amd-gfx@lfdr.de>; Wed, 13 Nov 2019 08:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BBED6E11C;
	Wed, 13 Nov 2019 07:37:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40BF76E11C
 for <amd-gfx@lists.freedesktop.org>; Wed, 13 Nov 2019 07:36:57 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b3so1060086wrs.13
 for <amd-gfx@lists.freedesktop.org>; Tue, 12 Nov 2019 23:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language;
 bh=YQh5aboevxXG3ZbeJ+pYOApV9OJwqGWm4BhKPzEBfGg=;
 b=gNSOUmn7dvDyADMBD5CziIqFKVt8ZRYTwJUXu+w0++OQlcbZQ1jGFDdRegxubeLUDk
 E7feQR+IfdV3D8X/sAM3pQThvw1oJSktySKw9Afivwoi7UOttyKPDLc8/0D/2V82u6L/
 GBw3srgIK5xtXP/Rl/wsQDsDbw/khJsdJVT3gzOf9XOnWYSYyAKrqF1HVDLDOG8kjGMI
 LQwx0jw3BDvQYBHExcVnISwhAOLztByJRKgp8QbpkRUdYPApZwSdMUkXtC9Td3wDKG5Q
 5RLBYyWMwIvde167PboIeOc9yTcvdogeeiFSr05QBUs4DHqAMjhezE2Mdo8az+tT7Mzs
 WfxA==
X-Gm-Message-State: APjAAAUqSB3VzvxCEjOGBbt9QV+i7xE5g3r9o4TclkNwM6mnHDCo1DA2
 V/pKTdvJKa3DSfW/GzWSyO4B/noD
X-Google-Smtp-Source: APXvYqzWSYab8rsjiwtJXkG/kgp2crLkFJ5/vH4RDaeemaef4dEjJCOtKo4kniXgCluFGpxnvEBFHg==
X-Received: by 2002:adf:f5c6:: with SMTP id k6mr1287215wrp.245.1573630615477; 
 Tue, 12 Nov 2019 23:36:55 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f67sm1400223wme.16.2019.11.12.23.36.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Nov 2019 23:36:54 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1573122349-22080-1-git-send-email-Emily.Deng@amd.com>
 <MN2PR12MB2975E26D8A8352863BA01FCA8F7B0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <c01acb29-72ce-a109-3ca5-166706327d61@amd.com>
 <MN2PR12MB29755CFCE09CEC0D9EB999D18F7B0@MN2PR12MB2975.namprd12.prod.outlook.com>
 <70c2c1cc-40b8-30da-7aee-f59fbc4d0d42@amd.com>
 <DM6PR12MB2971859C1BF16EE7E65B35B18F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <d6f9c508-3c23-c797-1cbc-7502dc4c0b13@amd.com>
 <DM6PR12MB29714AB9AD16FA3ABD7D62C28F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <dcc1124b-5e19-b018-7449-659a8b7d74ea@amd.com>
 <DM6PR12MB29710DFE90F22F5903499AFE8F7B0@DM6PR12MB2971.namprd12.prod.outlook.com>
 <91f4a0c4-23e3-a399-5cb1-fb01da922784@amd.com>
 <MWHPR12MB1453817C6F05A57FD431E159EA770@MWHPR12MB1453.namprd12.prod.outlook.com>
 <MN2PR12MB29750EDB35E27DF9CD63152C8F770@MN2PR12MB2975.namprd12.prod.outlook.com>
 <2f035f22-4057-dd9e-27ef-0f5612113e29@amd.com>
 <9269d447-ed32-81f7-ab43-cb16139096e2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <33ffe2f1-32b6-a238-3752-cee67cd9e141@gmail.com>
Date: Wed, 13 Nov 2019 08:36:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <9269d447-ed32-81f7-ab43-cb16139096e2@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=YQh5aboevxXG3ZbeJ+pYOApV9OJwqGWm4BhKPzEBfGg=;
 b=jfTlPay5boyUyH+x7s9AU4e7D1Far9UFVp6NkFasa6cZdzIINM5uQYGcfKEJhoGMHm
 myN05fxW9UVFy0qG5zaG44AomZpVlYp5NE0PFKWz0N0sm6QW+tDGFyDimie2hUyzIA0J
 wUf27x1YdrlFziCjxsU4+/IvcOEO0r4wXG8S0uHcR9t+rmuMDLywAQJmLjkv+dstYAq3
 hwiLZEt5Z+d0UPfGaUQ8sqTJyS3RgKbcKr4Dpny/sOwnBHftErYkGr3vxub1xCAy5r/U
 crg4bdxovgDMe8zgaaM0X0tZl5WWw0w05TcyrjdNnTfYvx9knGX/cqarNxGsVsev8dyW
 B4YA==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Reply-To: christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0761989273=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0761989273==
Content-Type: multipart/alternative;
 boundary="------------76F2BAA5ED3003DCF53B1335"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------76F2BAA5ED3003DCF53B1335
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

The question is where do we rearm the timer for this problem to occur?

Regards,
Christian.

Am 12.11.19 um 20:21 schrieb Andrey Grodzovsky:
>
> I was able to reproduce the crash by using the attached 
> simulate_crash.patch - waiting on guilty job to signal in reset work 
> and artificially rearming the timeout timer just before the check for 
> !cancel_delayed_work(&sched->work_tdr)  in drm_sched_cleanup_jobs - 
> crash log attached in crash.log. This I think confirms my theory i 
> described earlier in this thread.
>
> basic_fix.patch handles this by testing whether another timer already 
> armed ob this scheduler or is there a timeout work in execution right 
> now (see documentation for work_busy) - obviously  this is not a full 
> solution as this will not protect from races if for example there is 
> immediate work scheduling such as in drm_sched_fault -  so we probably 
> need to account for this by making drm_sched_cleanup_jobs (at least in 
> the part where it iterates ring mirror list and frees jobs) and GPU 
> reset really mutually exclusive and not like now.
>
> Andrey
>
>
> On 11/11/19 4:11 PM, Christian König wrote:
>> Hi Emily,
>>
>> you need to print which scheduler instance is freeing the jobs and 
>> which one is triggering the reset. The TID and PID is completely 
>> meaningless here since we are called from different worker threads 
>> and the TID/PID can change on each call.
>>
>> Apart from that I will look into this a bit deeper when I have time.
>>
>> Regards,
>> Christian.
>>
>> Am 12.11.19 um 07:02 schrieb Deng, Emily:
>>> Hi Christian,
>>>     I add the follow print in function drm_sched_cleanup_jobs. From 
>>> the log it shows that only use cancel_delayed_work could not avoid 
>>> to free job when the sched is in reset. But don’t know exactly where 
>>> it is wrong about the driver. Do you have any suggestion about this?
>>> + printk("Emily:drm_sched_cleanup_jobs:begin,tid:%lu, pid:%lu\n", 
>>> current->tgid, current->pid);
>>>         /*
>>>          * Don't destroy jobs while the timeout worker is running  
>>> OR thread
>>>          * is being parked and hence assumed to not touch 
>>> ring_mirror_list
>>>          */
>>>          if ((sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>> !cancel_delayed_work(&sched->work_tdr)))
>>>                 return;
>>> +       printk("Emily:drm_sched_cleanup_jobs,tid:%lu, pid:%lu\n", 
>>> current->tgid, current->pid);
>>> Best wishes
>>> Emily Deng
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11380.695091] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11380.695104] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11380.695105] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11380.695107] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11380.695107] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.222954] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma0 
>>> timeout, signaled seq=78585, emitted seq=78587
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.224275] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process 
>>> information: process  pid 0 thread  pid 0, 
>>> s_job:00000000fe75ab36,tid=15603, pid=15603
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225413] amdgpu 0000:00:08.0: GPU reset begin!
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225417] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225425] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225425] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225428] Emily:amdgpu_job_free_cb,Process information: 
>>> process  pid 0 thread  pid 0, s_job:00000000fe75ab36, tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225429] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225430] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225473] Emily:drm_sched_cleanup_jobs:begin,tid:2253, pid:2253
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225486] Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225489] Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262
>>> Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02 kernel: 
>>> [11381.225494] Emily:amdgpu_job_free_cb,Process information: 
>>> process  pid 0 thread  pid 0, s_job:00000000f086ec84, tid:2262, pid:2262
>>> >-----Original Message-----
>>> >From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
>>> >Sent: Tuesday, November 12, 2019 11:28 AM
>>> >To: Koenig, Christian <Christian.Koenig@amd.com>; Deng, Emily
>>> ><Emily.Deng@amd.com>; amd-gfx@lists.freedesktop.org
>>> >Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
>>> >
>>> >Thinking more about this claim - we assume here that if cancel_delayed_work
>>> >returned true it guarantees that timeout work is not running but, it merely
>>> >means there was a pending timeout work which was removed from the
>>> >workqueue before it's timer elapsed and so it didn't have a chance to be
>>> >dequeued and executed, it doesn't cover already executing work. So there is a
>>> >possibility where while timeout work started executing another timeout work
>>> >already got enqueued (maybe through earlier cleanup jobs or through
>>> >drm_sched_fault) and if at this point another drm_sched_cleanup_jobs runs
>>> >cancel_delayed_work(&sched->work_tdr) will return true even while there is a
>>> >timeout job in progress.
>>> >Unfortunately we cannot change cancel_delayed_work to
>>> >cancel_delayed_work_sync to flush the timeout work as timeout work itself
>>> >waits for schedule thread  to be parked again when calling park_thread.
>>> >
>>> >Andrey
>>> >
>>> >________________________________________
>>> >From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of
>>> >Koenig, Christian <Christian.Koenig@amd.com>
>>> >Sent: 08 November 2019 05:35:18
>>> >To: Deng, Emily; amd-gfx@lists.freedesktop.org
>>> >Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
>>> >
>>> >Hi Emily,
>>> >
>>> >exactly that can't happen. See here:
>>> >
>>> >>         /* Don't destroy jobs while the timeout worker is running */
>>> >>         if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>>> >>            !cancel_delayed_work(&sched->work_tdr))
>>> >>                 return NULL;
>>> >
>>> >We never free jobs while the timeout working is running to prevent exactly
>>> >that issue.
>>> >
>>> >Regards,
>>> >Christian.
>>> >
>>> >Am 08.11.19 um 11:32 schrieb Deng, Emily:
>>> >> Hi Christian,
>>> >>       The drm_sched_job_timedout-> amdgpu_job_timedout call
>>> >amdgpu_device_gpu_recover. I mean the main scheduler free the jobs while
>>> >in amdgpu_device_gpu_recover, and before calling drm_sched_stop.
>>> >>
>>> >> Best wishes
>>> >> Emily Deng
>>> >>
>>> >>
>>> >>
>>> >>> -----Original Message-----
>>> >>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> >>> Sent: Friday, November 8, 2019 6:26 PM
>>> >>> To: Deng, Emily <Emily.Deng@amd.com>; amd-gfx@lists.freedesktop.org
>>> >>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
>>> >>>
>>> >>> Hi Emily,
>>> >>>
>>> >>> well who is calling amdgpu_device_gpu_recover() in this case?
>>> >>>
>>> >>> When it's not the scheduler we shouldn't have a guilty job in the first place.
>>> >>>
>>> >>> Regards,
>>> >>> Christian.
>>> >>>
>>> >>> Am 08.11.19 um 11:22 schrieb Deng, Emily:
>>> >>>> Hi Chrisitan,
>>> >>>>        No, I am with the new branch and also has the patch. Even it
>>> >>>> are freed by
>>> >>> main scheduler, how we could avoid main scheduler to free jobs while
>>> >>> enter to function amdgpu_device_gpu_recover?
>>> >>>> Best wishes
>>> >>>> Emily Deng
>>> >>>>
>>> >>>>
>>> >>>>
>>> >>>>> -----Original Message-----
>>> >>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> >>>>> Sent: Friday, November 8, 2019 6:15 PM
>>> >>>>> To: Deng, Emily <Emily.Deng@amd.com>; amd-
>>> >gfx@lists.freedesktop.org
>>> >>>>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for tdr
>>> >>>>>
>>> >>>>> Hi Emily,
>>> >>>>>
>>> >>>>> in this case you are on an old code branch.
>>> >>>>>
>>> >>>>> Jobs are freed now by the main scheduler thread and only if no
>>> >>>>> timeout handler is running.
>>> >>>>>
>>> >>>>> See this patch here:
>>> >>>>>> commit 5918045c4ed492fb5813f980dcf89a90fefd0a4e
>>> >>>>>> Author: Christian König <christian.koenig@amd.com>
>>> >>>>>> Date:   Thu Apr 18 11:00:21 2019 -0400
>>> >>>>>>
>>> >>>>>>       drm/scheduler: rework job destruction
>>> >>>>> Regards,
>>> >>>>> Christian.
>>> >>>>>
>>> >>>>> Am 08.11.19 um 11:11 schrieb Deng, Emily:
>>> >>>>>> Hi Christian,
>>> >>>>>>         Please refer to follow log, when it enter to
>>> >>>>>> amdgpu_device_gpu_recover
>>> >>>>> function, the bad job 000000005086879e is freeing in function
>>> >>>>> amdgpu_job_free_cb  at the same time, because of the hardware fence
>>> >>> signal.
>>> >>>>> But amdgpu_device_gpu_recover goes faster, at this case, the
>>> >>>>> s_fence is already freed, but job is not freed in time. Then this issue
>>> >occurs.
>>> >>>>>> [  449.792189] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring
>>> >>> sdma0
>>> >>>>>> timeout, signaled seq=2481, emitted seq=2483 [  449.793202]
>>> >>>>>> [drm:amdgpu_job_timedout [amdgpu]] *ERROR* Process information:
>>> >>>>> process  pid 0 thread  pid 0, s_job:000000005086879e [  449.794163]
>>> >>>>> amdgpu
>>> >>>>> 0000:00:08.0: GPU reset begin!
>>> >>>>>> [  449.794175] Emily:amdgpu_job_free_cb,Process information:
>>> >>>>>> process pid 0 thread  pid 0, s_job:000000005086879e [  449.794221]
>>> >>>>>> Emily:amdgpu_job_free_cb,Process information: process pid 0
>>> >>>>>> thread pid 0, s_job:0000000066eb74ab [  449.794222]
>>> >>>>>> Emily:amdgpu_job_free_cb,Process information: process pid 0
>>> >>>>>> thread pid 0, s_job:00000000d4438ad9 [  449.794255]
>>> >>>>>> Emily:amdgpu_job_free_cb,Process information: process pid 0
>>> >>>>>> thread pid 0, s_job:00000000b6d69c65 [  449.794257]
>>> >>>>>> Emily:amdgpu_job_free_cb,Process information: process pid 0
>>> >>>>>> thread pid 0,
>>> >>>>> s_job:00000000ea85e922 [ 449.794287]
>>> >>>>> Emily:amdgpu_job_free_cb,Process
>>> >>>>> information: process  pid 0 thread  pid 0, s_job:00000000ed3a5ac6 [
>>> >>>>> 449.794366] BUG: unable to handle kernel NULL pointer dereference
>>> >>>>> at
>>> >>>>> 00000000000000c0 [  449.800818] PGD 0 P4D 0 [  449.801040] Oops:
>>> >>>>> 0000 [#1] SMP PTI
>>> >>>>>> [  449.801338] CPU: 3 PID: 55 Comm: kworker/3:1 Tainted: G           OE
>>> >>>>> 4.18.0-15-generic #16~18.04.1-Ubuntu
>>> >>>>>> [  449.802157] Hardware name: QEMU Standard PC (i440FX + PIIX,
>>> >>>>>> 1996), BIOS Ubuntu-1.8.2-1ubuntu1 04/01/2014 [  449.802944]
>>> >>>>>> Workqueue: events drm_sched_job_timedout [amd_sched] [
>>> >>>>>> 449.803488]
>>> >>> RIP:
>>> >>>>> 0010:amdgpu_device_gpu_recover+0x1da/0xb60 [amdgpu]
>>> >>>>>> [  449.804020] Code: dd ff ff 49 39 c5 48 89 55 a8 0f 85 56 ff ff
>>> >>>>>> ff
>>> >>>>>> 45 85 e4 0f
>>> >>>>> 85 a1 00 00 00 48 8b 45 b0 48 85 c0 0f 84 60 01 00 00 48 8b 40 10
>>> >>>>> <48> 8b
>>> >>> 98
>>> >>>>> c0 00         00 00 48 85 db 0f 84 4c 01 00 00 48 8b 43 48 a8 01
>>> >>>>>> [  449.805593] RSP: 0018:ffffb4c7c08f7d68 EFLAGS: 00010286 [
>>> >>>>>> 449.806032] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
>>> >>>>>> 0000000000000000 [ 449.806625] RDX: ffffb4c7c08f5ac0 RSI:
>>> >>>>>> 0000000fffffffe0 RDI: 0000000000000246 [  449.807224] RBP:
>>> >>>>>> ffffb4c7c08f7de0 R08: 00000068b9d54000 R09: 0000000000000000 [
>>> >>>>>> 449.807818] R10: 0000000000000000 R11: 0000000000000148 R12:
>>> >>>>>> 0000000000000000 [ 449.808411] R13: ffffb4c7c08f7da0 R14:
>>> >>>>>> ffff8d82b8525d40 R15: ffff8d82b8525d40 [  449.809004] FS:
>>> >>>>>> 0000000000000000(0000) GS:ffff8d82bfd80000(0000)
>>> >>>>>> knlGS:0000000000000000 [ 449.809674] CS:  0010 DS: 0000 ES: 0000
>>> >CR0:
>>> >>>>>> 0000000080050033 [ 449.810153] CR2: 00000000000000c0 CR3:
>>> >>>>>> 000000003cc0a001 CR4: 00000000003606e0 [  449.810747] DR0:
>>> >>>>> 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000 [
>>> >>>>> 449.811344] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
>>> >>>>> 0000000000000400 [  449.811937] Call Trace:
>>> >>>>>> [  449.812206] amdgpu_job_timedout+0x114/0x140 [amdgpu] [
>>> >>>>>> 449.812635] drm_sched_job_timedout+0x44/0x90 [amd_sched] [
>>> >>>>>> 449.813139]  ? amdgpu_cgs_destroy_device+0x10/0x10 [amdgpu] [
>>> >>>>>> 449.813609]  ? drm_sched_job_timedout+0x44/0x90 [amd_sched] [
>>> >>>>>> 449.814077] process_one_work+0x1fd/0x3f0 [  449.814417]
>>> >>>>>> worker_thread+0x34/0x410 [ 449.814728]  kthread+0x121/0x140 [
>>> >>>>>> 449.815004]  ? process_one_work+0x3f0/0x3f0 [  449.815374]  ?
>>> >>>>>> kthread_create_worker_on_cpu+0x70/0x70
>>> >>>>>> [  449.815799] ret_from_fork+0x35/0x40
>>> >>>>>>
>>> >>>>>>> -----Original Message-----
>>> >>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> >>>>>>> Sent: Friday, November 8, 2019 5:43 PM
>>> >>>>>>> To: Deng, Emily <Emily.Deng@amd.com>; amd-
>>> >>> gfx@lists.freedesktop.org
>>> >>>>>>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for
>>> >>>>>>> tdr
>>> >>>>>>>
>>> >>>>>>> Am 08.11.19 um 10:39 schrieb Deng, Emily:
>>> >>>>>>>> Sorry, please take your time.
>>> >>>>>>> Have you seen my other response a bit below?
>>> >>>>>>>
>>> >>>>>>> I can't follow how it would be possible for job->s_fence to be
>>> >>>>>>> NULL without the job also being freed.
>>> >>>>>>>
>>> >>>>>>> So it looks like this patch is just papering over some bigger issues.
>>> >>>>>>>
>>> >>>>>>> Regards,
>>> >>>>>>> Christian.
>>> >>>>>>>
>>> >>>>>>>> Best wishes
>>> >>>>>>>> Emily Deng
>>> >>>>>>>>
>>> >>>>>>>>
>>> >>>>>>>>
>>> >>>>>>>>> -----Original Message-----
>>> >>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>> >>>>>>>>> Sent: Friday, November 8, 2019 5:08 PM
>>> >>>>>>>>> To: Deng, Emily <Emily.Deng@amd.com>; amd-
>>> >>>>> gfx@lists.freedesktop.org
>>> >>>>>>>>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue for
>>> >>>>>>>>> tdr
>>> >>>>>>>>>
>>> >>>>>>>>> Am 08.11.19 um 09:52 schrieb Deng, Emily:
>>> >>>>>>>>>> Ping.....
>>> >>>>>>>>> You need to give me at least enough time to wake up :)
>>> >>>>>>>>>
>>> >>>>>>>>>> Best wishes
>>> >>>>>>>>>> Emily Deng
>>> >>>>>>>>>>
>>> >>>>>>>>>>
>>> >>>>>>>>>>
>>> >>>>>>>>>>> -----Original Message-----
>>> >>>>>>>>>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On
>>> >>> Behalf
>>> >>>>>>>>>>> Of Deng, Emily
>>> >>>>>>>>>>> Sent: Friday, November 8, 2019 10:56 AM
>>> >>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; amd-
>>> >>>>>>>>>>> gfx@lists.freedesktop.org
>>> >>>>>>>>>>> Subject: RE: [PATCH] drm/amdgpu: Fix the null pointer issue
>>> >>>>>>>>>>> for tdr
>>> >>>>>>>>>>>
>>> >>>>>>>>>>>> -----Original Message-----
>>> >>>>>>>>>>>> From: Christian König <ckoenig.leichtzumerken@gmail.com>
>>> >>>>>>>>>>>> Sent: Thursday, November 7, 2019 7:28 PM
>>> >>>>>>>>>>>> To: Deng, Emily <Emily.Deng@amd.com>;
>>> >>>>>>>>>>>> amd-gfx@lists.freedesktop.org
>>> >>>>>>>>>>>> Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer issue
>>> >>>>>>>>>>>> for tdr
>>> >>>>>>>>>>>>
>>> >>>>>>>>>>>> Am 07.11.19 um 11:25 schrieb Emily Deng:
>>> >>>>>>>>>>>>> When the job is already signaled, the s_fence is freed.
>>> >>>>>>>>>>>>> Then it will has null pointer in amdgpu_device_gpu_recover.
>>> >>>>>>>>>>>> NAK, the s_fence is only set to NULL when the job is destroyed.
>>> >>>>>>>>>>>> See drm_sched_job_cleanup().
>>> >>>>>>>>>>> I know it is set to NULL in drm_sched_job_cleanup. But in one
>>> >>>>>>>>>>> case, when it enter into the amdgpu_device_gpu_recover, it
>>> >>>>>>>>>>> already in drm_sched_job_cleanup, and at this time, it will
>>> >>>>>>>>>>> go to free
>>> >>>>> job.
>>> >>>>>>>>>>> But the amdgpu_device_gpu_recover sometimes is faster. At
>>> >>>>>>>>>>> that time, job is not freed, but s_fence is already NULL.
>>> >>>>>>>>> No, that case can't happen. See here:
>>> >>>>>>>>>
>>> >>>>>>>>>>            drm_sched_job_cleanup(s_job);
>>> >>>>>>>>>>
>>> >>>>>>>>>>            amdgpu_ring_priority_put(ring, s_job->s_priority);
>>> >>>>>>>>>>            dma_fence_put(job->fence);
>>> >>>>>>>>>>            amdgpu_sync_free(&job->sync);
>>> >>>>>>>>>>            amdgpu_sync_free(&job->sched_sync);
>>> >>>>>>>>>>            kfree(job);
>>> >>>>>>>>> The job itself is freed up directly after freeing the reference
>>> >>>>>>>>> to the
>>> >>>>> s_fence.
>>> >>>>>>>>> So you are just papering over a much bigger problem here. This
>>> >>>>>>>>> patch is a clear NAK.
>>> >>>>>>>>>
>>> >>>>>>>>> Regards,
>>> >>>>>>>>> Christian.
>>> >>>>>>>>>
>>> >>>>>>>>>>>> When you see a job without an s_fence then that means the
>>> >>>>>>>>>>>> problem is somewhere else.
>>> >>>>>>>>>>>>
>>> >>>>>>>>>>>> Regards,
>>> >>>>>>>>>>>> Christian.
>>> >>>>>>>>>>>>
>>> >>>>>>>>>>>>> Signed-off-by: Emily Deng <Emily.Deng@amd.com>
>>> >>>>>>>>>>>>> ---
>>> >>>>>>>>>>>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-
>>> >>>>>>>>>>>>>       drivers/gpu/drm/scheduler/sched_main.c     | 11 ++++++---
>>> >--
>>> >>>>>>>>>>>>>       2 files changed, 7 insertions(+), 6 deletions(-)
>>> >>>>>>>>>>>>>
>>> >>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> >>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> >>>>>>>>>>>>> index e6ce949..5a8f08e 100644
>>> >>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> >>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> >>>>>>>>>>>>> @@ -4075,7 +4075,7 @@ int
>>> >>> amdgpu_device_gpu_recover(struct
>>> >>>>>>>>>>>> amdgpu_device *adev,
>>> >>>>>>>>>>>>>            *
>>> >>>>>>>>>>>>>            * job->base holds a reference to parent fence
>>> >>>>>>>>>>>>>            */
>>> >>>>>>>>>>>>> -  if (job && job->base.s_fence->parent &&
>>> >>>>>>>>>>>>> +  if (job && job->base.s_fence &&
>>> >>>>>>>>>>>>> + job->base.s_fence->parent
>>> >>>>>>> &&
>>> >>>>>>>>>>>>>               dma_fence_is_signaled(job->base.s_fence->parent))
>>> >>>>>>>>>>>>>                   job_signaled = true;
>>> >>>>>>>>>>>>>
>>> >>>>>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> >>>>>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> >>>>>>>>>>>>> index 31809ca..56cc10e 100644
>>> >>>>>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> >>>>>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> >>>>>>>>>>>>> @@ -334,8 +334,8 @@ void
>>> >drm_sched_increase_karma(struct
>>> >>>>>>>>>>>> drm_sched_job
>>> >>>>>>>>>>>>> *bad)
>>> >>>>>>>>>>>>>
>>> >>>>>>>>>>>>>                           spin_lock(&rq->lock);
>>> >>>>>>>>>>>>>                           list_for_each_entry_safe(entity,
>>> >>>>>>>>>>>>> tmp,
>>> >>> &rq-
>>> >>>>>>>> entities,
>>> >>>>>>>>>>>> list) {
>>> >>>>>>>>>>>>> -                          if (bad->s_fence->scheduled.context
>>> >>>>>>> ==
>>> >>>>>>>>>>>>> -                              entity->fence_context) {
>>> >>>>>>>>>>>>> +                          if (bad->s_fence &&
>>> >>>>>>>>>>>>> + (bad->s_fence-
>>> >>>>>>>>>>>>> scheduled.context ==
>>> >>>>>>>>>>>>> + entity->fence_context)) {
>>> >>>>>>>>>>>>>                                           if
>>> >>>>>>>>>>>>> (atomic_read(&bad-
>>> >>>>>>>> karma) >
>>> >>>>>>>>>>>>>                                               bad->sched-
>>> >>>> hang_limit)
>>> >>>>>>>>>>>>>                                                   if
>>> >>>>>>>>>>>>> (entity-
>>> >>>> guilty) @@ -376,7 +376,7 @@ void
>>> >>>>>>>>>>>>> drm_sched_stop(struct
>>> >>>>>>> drm_gpu_scheduler
>>> >>>>>>>>>>>> *sched, struct drm_sched_job *bad)
>>> >>>>>>>>>>>>>            * This iteration is thread safe as sched thread
>>> >>>>>>>>>>>>> is
>>> >>> stopped.
>>> >>>>>>>>>>>>>            */
>>> >>>>>>>>>>>>>           list_for_each_entry_safe_reverse(s_job, tmp,
>>> >>>>>>>>>>>>> &sched- ring_mirror_list, node) {
>>> >>>>>>>>>>>>> -          if (s_job->s_fence->parent &&
>>> >>>>>>>>>>>>> +          if (s_job->s_fence && s_job->s_fence->parent &&
>>> >>>>>>>>>>>>>                       dma_fence_remove_callback(s_job-
>>> >>>> s_fence-
>>> >>>>>>>> parent,
>>> >>>>>>>>>>>>>                                                 &s_job->cb)) {
>>> >>>>>>>>>>>>>                           atomic_dec(&sched->hw_rq_count);
>>> >>> @@ -
>>> >>>>>>> 395,7
>>> >>>>>>>>>>> +395,8 @@ void
>>> >>>>>>>>>>>>> drm_sched_stop(struct drm_gpu_scheduler
>>> >>>>>>>>>>>> *sched, struct drm_sched_job *bad)
>>> >>>>>>>>>>>>>                            *
>>> >>>>>>>>>>>>>                            * Job is still alive so fence
>>> >>>>>>>>>>>>> refcount at
>>> >>> least 1
>>> >>>>>>>>>>>>>                            */
>>> >>>>>>>>>>>>> - dma_fence_wait(&s_job->s_fence->finished,
>>> >>>>>>> false);
>>> >>>>>>>>>>>>> +                  if (s_job->s_fence)
>>> >>>>>>>>>>>>> + dma_fence_wait(&s_job->s_fence-
>>> >>>>>>>> finished,
>>> >>>>>>>>>>>> false);
>>> >>>>>>>>>>>>>                           /*
>>> >>>>>>>>>>>>>                            * We must keep bad job alive
>>> >>>>>>>>>>>>> for later
>>> >>> use
>>> >>>>>>> during @@
>>> >>>>>>>>>>>> -438,7
>>> >>>>>>>>>>>>> +439,7 @@ void drm_sched_start(struct drm_gpu_scheduler
>>> >>>>> *sched,
>>> >>>>>>>>>>>>> +bool
>>> >>>>>>>>>>>> full_recovery)
>>> >>>>>>>>>>>>>            * GPU recovers can't run in parallel.
>>> >>>>>>>>>>>>>            */
>>> >>>>>>>>>>>>>           list_for_each_entry_safe(s_job, tmp,
>>> >>>>>>>>>>>>> &sched->ring_mirror_list,
>>> >>>>>>>>>>>>> node)
>>> >>>>>>>>>>>> {
>>> >>>>>>>>>>>>> -          struct dma_fence *fence = s_job->s_fence->parent;
>>> >>>>>>>>>>>>> +          struct dma_fence *fence = s_job->s_fence ?
>>> >>>>>>>>>>>>> + s_job-
>>> >>>>>>>> s_fence-
>>> >>>>>>>>>>>>> parent :
>>> >>>>>>>>>>>>> +NULL;
>>> >>>>>>>>>>>>>
>>> >>>>>>>>>>>>>                   atomic_inc(&sched->hw_rq_count);
>>> >>>>>>>>>>>>>
>>> >>>>>>>>>>> _______________________________________________
>>> >>>>>>>>>>> amd-gfx mailing list
>>> >>>>>>>>>>> amd-gfx@lists.freedesktop.org
>>> >>>>>>>>>>> https://lists.freedesktop.org/mailman/listinfo/amd-gfx 
>>> <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>
>>> >
>>> >_______________________________________________
>>> >amd-gfx mailing list
>>> >amd-gfx@lists.freedesktop.org
>>> >https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------76F2BAA5ED3003DCF53B1335
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">The question is where do we rearm the
      timer for this problem to occur?<br>
      <br>
      Regards,<br>
      Christian. <br>
      <br>
      Am 12.11.19 um 20:21 schrieb Andrey Grodzovsky:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9269d447-ed32-81f7-ab43-cb16139096e2@amd.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>I was able to reproduce the crash by using the attached
        simulate_crash.patch - waiting on guilty job to signal in reset
        work and artificially rearming the timeout timer just before the
        check for !cancel_delayed_work(&amp;sched-&gt;work_tdr)  in
        drm_sched_cleanup_jobs - crash log attached in crash.log. This I
        think confirms my theory i described earlier in this thread.</p>
      <p>basic_fix.patch handles this by testing whether another timer
        already armed ob this scheduler or is there a timeout work in
        execution right now (see documentation for work_busy) -
        obviously  this is not a full solution as this will not protect
        from races if for example there is immediate work scheduling
        such as in <font size="2" face="Calibri"><span
            style="font-size:11pt;">drm_sched_fault -  so we probably
            need to account for this by making drm_sched_cleanup_jobs
            (at least in the part where it iterates ring mirror list and
            frees jobs) and GPU reset really mutually exclusive and not
            like now.</span></font></p>
      <p><font size="2" face="Calibri"><span style="font-size:11pt;">Andrey<br>
          </span></font></p>
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 11/11/19 4:11 PM, Christian König
        wrote:<br>
      </div>
      <blockquote type="cite"
        cite="mid:2f035f22-4057-dd9e-27ef-0f5612113e29@amd.com">
        <div class="moz-cite-prefix">Hi Emily,<br>
          <br>
          you need to print which scheduler instance is freeing the jobs
          and which one is triggering the reset. The TID and PID is
          completely meaningless here since we are called from different
          worker threads and the TID/PID can change on each call.<br>
          <br>
          Apart from that I will look into this a bit deeper when I have
          time.<br>
          <br>
          Regards,<br>
          Christian.<br>
          <br>
          Am 12.11.19 um 07:02 schrieb Deng, Emily:<br>
        </div>
        <blockquote type="cite"
cite="mid:MN2PR12MB29750EDB35E27DF9CD63152C8F770@MN2PR12MB2975.namprd12.prod.outlook.com">
          <meta name="Generator" content="Microsoft Exchange Server">
          <!-- converted from rtf -->
          <style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left: #800000 2px solid; } --></style>
          <font size="2" face="Calibri"><span style="font-size:11pt;">
              <div>Hi Christian,</div>
              <div>    I add the follow print in function
                drm_sched_cleanup_jobs. From the log it shows that only
                use cancel_delayed_work could not avoid to free job when
                the sched is in reset. But don’t know exactly where it
                is wrong about the driver. Do you have any suggestion
                about this?</div>
              <div><font face="Times New Roman"> </font></div>
              <div>+      
                printk("Emily:drm_sched_cleanup_jobs:begin,tid:%lu,
                pid:%lu\n", current-&gt;tgid, current-&gt;pid);</div>
              <div> </div>
              <div>        /*</div>
              <div>         * Don't destroy jobs while the timeout
                worker is running  OR thread</div>
              <div>         * is being parked and hence assumed to not
                touch ring_mirror_list</div>
              <div>         */</div>
              <div>         if ((sched-&gt;timeout !=
                MAX_SCHEDULE_TIMEOUT &amp;&amp;</div>
              <div>           
                !cancel_delayed_work(&amp;sched-&gt;work_tdr)))</div>
              <div>                return;</div>
              <div>+       printk("Emily:drm_sched_cleanup_jobs,tid:%lu,
                pid:%lu\n", current-&gt;tgid, current-&gt;pid);</div>
              <div><font face="Times New Roman"> </font></div>
              <div><font face="Times New Roman"> </font></div>
              <div><font face="Calibri">Best wishes</font></div>
              <div><font face="Calibri">Emily Deng</font></div>
              <div><font face="Times New Roman"> </font></div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11380.695091]
                Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11380.695104]
                Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11380.695105]
                Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11380.695107]
                Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11380.695107]
                Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.222954] [drm:amdgpu_job_timedout
                [amdgpu]] *ERROR* ring sdma0 timeout, signaled
                seq=78585, emitted seq=78587</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.224275] [drm:amdgpu_job_timedout
                [amdgpu]] *ERROR* Process information: process  pid 0
                thread  pid 0, s_job:00000000fe75ab36,tid=15603,
                pid=15603</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225413] amdgpu 0000:00:08.0: <font
                  color="#00B050">GPU reset begin</font>!</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225417]
                Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225425]
                Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225425]
                Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225428] Emily:<font color="#00B050">amdgpu_job_free_cb</font>,Process
                information: process  pid 0 thread  pid 0,
                s_job:00000000fe75ab36, tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225429]
                Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225430]
                Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225473]
                Emily:drm_sched_cleanup_jobs:begin,tid:2253, pid:2253</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225486]
                Emily:drm_sched_cleanup_jobs:begin,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225489]
                Emily:drm_sched_cleanup_jobs,tid:2262, pid:2262</div>
              <div>Nov 12 12:58:20 ubuntu-drop-August-2018-rc2-gpu0-vf02
                kernel: [11381.225494] Emily:amdgpu_job_free_cb,Process
                information: process  pid 0 thread  pid 0,
                s_job:00000000f086ec84, tid:2262, pid:2262</div>
              <div>&gt;-----Original Message-----</div>
              <div>&gt;From: Grodzovsky, Andrey <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Andrey.Grodzovsky@amd.com"
                  moz-do-not-send="true">&lt;Andrey.Grodzovsky@amd.com&gt;</a></div>
              <div>&gt;Sent: Tuesday, November 12, 2019 11:28 AM</div>
              <div>&gt;To: Koenig, Christian <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Christian.Koenig@amd.com"
                  moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>;
                Deng, Emily</div>
              <div>&gt;<a class="moz-txt-link-rfc2396E"
                  href="mailto:Emily.Deng@amd.com"
                  moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a>;
                <a class="moz-txt-link-abbreviated"
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a></div>
              <div>&gt;Subject: Re: [PATCH] drm/amdgpu: Fix the null
                pointer issue for tdr</div>
              <div>&gt;</div>
              <div>&gt;Thinking more about this claim - we assume here
                that if cancel_delayed_work</div>
              <div>&gt;returned true it guarantees that timeout work is
                not running but, it merely</div>
              <div>&gt;means there was a pending timeout work which was
                removed from the</div>
              <div>&gt;workqueue before it's timer elapsed and so it
                didn't have a chance to be</div>
              <div>&gt;dequeued and executed, it doesn't cover already
                executing work. So there is a</div>
              <div>&gt;possibility where while timeout work started
                executing another timeout work</div>
              <div>&gt;already got enqueued (maybe through earlier
                cleanup jobs or through</div>
              <div>&gt;drm_sched_fault) and if at this point another
                drm_sched_cleanup_jobs runs</div>
              <div>&gt;cancel_delayed_work(&amp;sched-&gt;work_tdr) will
                return true even while there is a</div>
              <div>&gt;timeout job in progress.</div>
              <div>&gt;Unfortunately we cannot change
                cancel_delayed_work to</div>
              <div>&gt;cancel_delayed_work_sync to flush the timeout
                work as timeout work itself</div>
              <div>&gt;waits for schedule thread  to be parked again
                when calling park_thread.</div>
              <div>&gt;</div>
              <div>&gt;Andrey</div>
              <div>&gt;</div>
              <div>&gt;________________________________________</div>
              <div>&gt;From: amd-gfx <a class="moz-txt-link-rfc2396E"
                  href="mailto:amd-gfx-bounces@lists.freedesktop.org"
                  moz-do-not-send="true">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a>
                on behalf of</div>
              <div>&gt;Koenig, Christian <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Christian.Koenig@amd.com"
                  moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a></div>
              <div>&gt;Sent: 08 November 2019 05:35:18</div>
              <div>&gt;To: Deng, Emily; <a
                  class="moz-txt-link-abbreviated"
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a></div>
              <div>&gt;Subject: Re: [PATCH] drm/amdgpu: Fix the null
                pointer issue for tdr</div>
              <div>&gt;</div>
              <div>&gt;Hi Emily,</div>
              <div>&gt;</div>
              <div>&gt;exactly that can't happen. See here:</div>
              <div>&gt;</div>
              <div>&gt;&gt;         /* Don't destroy jobs while the
                timeout worker is running */</div>
              <div>&gt;&gt;         if (sched-&gt;timeout !=
                MAX_SCHEDULE_TIMEOUT &amp;&amp;</div>
              <div>&gt;&gt;            
                !cancel_delayed_work(&amp;sched-&gt;work_tdr))</div>
              <div>&gt;&gt;                 return NULL;</div>
              <div>&gt;</div>
              <div>&gt;We never free jobs while the timeout working is
                running to prevent exactly</div>
              <div>&gt;that issue.</div>
              <div>&gt;</div>
              <div>&gt;Regards,</div>
              <div>&gt;Christian.</div>
              <div>&gt;</div>
              <div>&gt;Am 08.11.19 um 11:32 schrieb Deng, Emily:</div>
              <div>&gt;&gt; Hi Christian,</div>
              <div>&gt;&gt;       The drm_sched_job_timedout-&gt;
                amdgpu_job_timedout call</div>
              <div>&gt;amdgpu_device_gpu_recover. I mean the main
                scheduler free the jobs while</div>
              <div>&gt;in amdgpu_device_gpu_recover, and before calling
                drm_sched_stop.</div>
              <div>&gt;&gt;</div>
              <div>&gt;&gt; Best wishes</div>
              <div>&gt;&gt; Emily Deng</div>
              <div>&gt;&gt;</div>
              <div>&gt;&gt;</div>
              <div>&gt;&gt;</div>
              <div>&gt;&gt;&gt; -----Original Message-----</div>
              <div>&gt;&gt;&gt; From: Koenig, Christian <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Christian.Koenig@amd.com"
                  moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a></div>
              <div>&gt;&gt;&gt; Sent: Friday, November 8, 2019 6:26 PM</div>
              <div>&gt;&gt;&gt; To: Deng, Emily <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Emily.Deng@amd.com"
                  moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a>;
                <a class="moz-txt-link-abbreviated"
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a></div>
              <div>&gt;&gt;&gt; Subject: Re: [PATCH] drm/amdgpu: Fix the
                null pointer issue for tdr</div>
              <div>&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt; Hi Emily,</div>
              <div>&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt; well who is calling
                amdgpu_device_gpu_recover() in this case?</div>
              <div>&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt; When it's not the scheduler we shouldn't
                have a guilty job in the first place.</div>
              <div>&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt; Regards,</div>
              <div>&gt;&gt;&gt; Christian.</div>
              <div>&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt; Am 08.11.19 um 11:22 schrieb Deng,
                Emily:</div>
              <div>&gt;&gt;&gt;&gt; Hi Chrisitan,</div>
              <div>&gt;&gt;&gt;&gt;        No, I am with the new branch
                and also has the patch. Even it</div>
              <div>&gt;&gt;&gt;&gt; are freed by</div>
              <div>&gt;&gt;&gt; main scheduler, how we could avoid main
                scheduler to free jobs while</div>
              <div>&gt;&gt;&gt; enter to function
                amdgpu_device_gpu_recover?</div>
              <div>&gt;&gt;&gt;&gt; Best wishes</div>
              <div>&gt;&gt;&gt;&gt; Emily Deng</div>
              <div>&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt; -----Original Message-----</div>
              <div>&gt;&gt;&gt;&gt;&gt; From: Koenig, Christian <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Christian.Koenig@amd.com"
                  moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a></div>
              <div>&gt;&gt;&gt;&gt;&gt; Sent: Friday, November 8, 2019
                6:15 PM</div>
              <div>&gt;&gt;&gt;&gt;&gt; To: Deng, Emily <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Emily.Deng@amd.com"
                  moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a>;
                amd-</div>
              <div>&gt;<a class="moz-txt-link-abbreviated"
                  href="mailto:gfx@lists.freedesktop.org"
                  moz-do-not-send="true">gfx@lists.freedesktop.org</a></div>
              <div>&gt;&gt;&gt;&gt;&gt; Subject: Re: [PATCH] drm/amdgpu:
                Fix the null pointer issue for tdr</div>
              <div>&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt; Hi Emily,</div>
              <div>&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt; in this case you are on an old
                code branch.</div>
              <div>&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt; Jobs are freed now by the main
                scheduler thread and only if no</div>
              <div>&gt;&gt;&gt;&gt;&gt; timeout handler is running.</div>
              <div>&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt; See this patch here:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; commit
                5918045c4ed492fb5813f980dcf89a90fefd0a4e</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; Author: Christian König <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:christian.koenig@amd.com"
                  moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; Date:   Thu Apr 18 11:00:21
                2019 -0400</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;       drm/scheduler: rework
                job destruction</div>
              <div>&gt;&gt;&gt;&gt;&gt; Regards,</div>
              <div>&gt;&gt;&gt;&gt;&gt; Christian.</div>
              <div>&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt; Am 08.11.19 um 11:11 schrieb
                Deng, Emily:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; Hi Christian,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;         Please refer to
                follow log, when it enter to</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; amdgpu_device_gpu_recover</div>
              <div>&gt;&gt;&gt;&gt;&gt; function, the bad job
                000000005086879e is freeing in function</div>
              <div>&gt;&gt;&gt;&gt;&gt; amdgpu_job_free_cb  at the same
                time, because of the hardware fence</div>
              <div>&gt;&gt;&gt; signal.</div>
              <div>&gt;&gt;&gt;&gt;&gt; But amdgpu_device_gpu_recover
                goes faster, at this case, the</div>
              <div>&gt;&gt;&gt;&gt;&gt; s_fence is already freed, but
                job is not freed in time. Then this issue</div>
              <div>&gt;occurs.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [  449.792189]
                [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring</div>
              <div>&gt;&gt;&gt; sdma0</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; timeout, signaled seq=2481,
                emitted seq=2483 [  449.793202]</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [drm:amdgpu_job_timedout
                [amdgpu]] *ERROR* Process information:</div>
              <div>&gt;&gt;&gt;&gt;&gt; process  pid 0 thread  pid 0,
                s_job:000000005086879e [  449.794163]</div>
              <div>&gt;&gt;&gt;&gt;&gt; amdgpu</div>
              <div>&gt;&gt;&gt;&gt;&gt; 0000:00:08.0: GPU reset begin!</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [  449.794175]
                Emily:amdgpu_job_free_cb,Process information:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; process pid 0 thread  pid 0,
                s_job:000000005086879e [  449.794221]</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;
                Emily:amdgpu_job_free_cb,Process information: process 
                pid 0</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; thread pid 0,
                s_job:0000000066eb74ab [  449.794222]</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;
                Emily:amdgpu_job_free_cb,Process information: process 
                pid 0</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; thread pid 0,
                s_job:00000000d4438ad9 [  449.794255]</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;
                Emily:amdgpu_job_free_cb,Process information: process 
                pid 0</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; thread pid 0,
                s_job:00000000b6d69c65 [  449.794257]</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;
                Emily:amdgpu_job_free_cb,Process information: process 
                pid 0</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; thread pid 0,</div>
              <div>&gt;&gt;&gt;&gt;&gt; s_job:00000000ea85e922 [ 
                449.794287]</div>
              <div>&gt;&gt;&gt;&gt;&gt; Emily:amdgpu_job_free_cb,Process</div>
              <div>&gt;&gt;&gt;&gt;&gt; information: process  pid 0
                thread  pid 0, s_job:00000000ed3a5ac6 [</div>
              <div>&gt;&gt;&gt;&gt;&gt; 449.794366] BUG: unable to
                handle kernel NULL pointer dereference</div>
              <div>&gt;&gt;&gt;&gt;&gt; at</div>
              <div>&gt;&gt;&gt;&gt;&gt; 00000000000000c0 [  449.800818]
                PGD 0 P4D 0 [  449.801040] Oops:</div>
              <div>&gt;&gt;&gt;&gt;&gt; 0000 [#1] SMP PTI</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [  449.801338] CPU: 3 PID:
                55 Comm: kworker/3:1 Tainted: G           OE</div>
              <div>&gt;&gt;&gt;&gt;&gt; 4.18.0-15-generic
                #16~18.04.1-Ubuntu</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [  449.802157] Hardware
                name: QEMU Standard PC (i440FX + PIIX,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 1996), BIOS
                Ubuntu-1.8.2-1ubuntu1 04/01/2014 [  449.802944]</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; Workqueue: events
                drm_sched_job_timedout [amd_sched] [</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.803488]</div>
              <div>&gt;&gt;&gt; RIP:</div>
              <div>&gt;&gt;&gt;&gt;&gt;
                0010:amdgpu_device_gpu_recover+0x1da/0xb60 [amdgpu]</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [  449.804020] Code: dd ff
                ff 49 39 c5 48 89 55 a8 0f 85 56 ff ff</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; ff</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 45 85 e4 0f</div>
              <div>&gt;&gt;&gt;&gt;&gt; 85 a1 00 00 00 48 8b 45 b0 48 85
                c0 0f 84 60 01 00 00 48 8b 40 10</div>
              <div>&gt;&gt;&gt;&gt;&gt; &lt;48&gt; 8b</div>
              <div>&gt;&gt;&gt; 98</div>
              <div>&gt;&gt;&gt;&gt;&gt; c0 00         00 00 48 85 db 0f
                84 4c 01 00 00 48 8b 43 48 a8 01</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [  449.805593] RSP:
                0018:ffffb4c7c08f7d68 EFLAGS: 00010286 [</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.806032] RAX:
                0000000000000000 RBX: 0000000000000000 RCX:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000000000000 [ 
                449.806625] RDX: ffffb4c7c08f5ac0 RSI:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000fffffffe0 RDI:
                0000000000000246 [  449.807224] RBP:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; ffffb4c7c08f7de0 R08:
                00000068b9d54000 R09: 0000000000000000 [</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.807818] R10:
                0000000000000000 R11: 0000000000000148 R12:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000000000000 [ 
                449.808411] R13: ffffb4c7c08f7da0 R14:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; ffff8d82b8525d40 R15:
                ffff8d82b8525d40 [  449.809004] FS:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000000000000(0000)
                GS:ffff8d82bfd80000(0000)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; knlGS:0000000000000000 [ 
                449.809674] CS:  0010 DS: 0000 ES: 0000</div>
              <div>&gt;CR0:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 0000000080050033 [ 
                449.810153] CR2: 00000000000000c0 CR3:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 000000003cc0a001 CR4:
                00000000003606e0 [  449.810747] DR0:</div>
              <div>&gt;&gt;&gt;&gt;&gt; 0000000000000000 DR1:
                0000000000000000 DR2: 0000000000000000 [</div>
              <div>&gt;&gt;&gt;&gt;&gt; 449.811344] DR3:
                0000000000000000 DR6: 00000000fffe0ff0 DR7:</div>
              <div>&gt;&gt;&gt;&gt;&gt; 0000000000000400 [  449.811937]
                Call Trace:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [  449.812206] 
                amdgpu_job_timedout+0x114/0x140 [amdgpu] [</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.812635] 
                drm_sched_job_timedout+0x44/0x90 [amd_sched] [</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.813139]  ?
                amdgpu_cgs_destroy_device+0x10/0x10 [amdgpu] [</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.813609]  ?
                drm_sched_job_timedout+0x44/0x90 [amd_sched] [</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.814077] 
                process_one_work+0x1fd/0x3f0 [  449.814417]</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; worker_thread+0x34/0x410 [ 
                449.814728]  kthread+0x121/0x140 [</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; 449.815004]  ?
                process_one_work+0x3f0/0x3f0 [  449.815374]  ?</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;
                kthread_create_worker_on_cpu+0x70/0x70</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt; [  449.815799] 
                ret_from_fork+0x35/0x40</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; -----Original
                Message-----</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Koenig, Christian
                <a class="moz-txt-link-rfc2396E"
                  href="mailto:Christian.Koenig@amd.com"
                  moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent: Friday, November
                8, 2019 5:43 PM</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; To: Deng, Emily <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Emily.Deng@amd.com"
                  moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a>;
                amd-</div>
              <div>&gt;&gt;&gt; <a class="moz-txt-link-abbreviated"
                  href="mailto:gfx@lists.freedesktop.org"
                  moz-do-not-send="true">gfx@lists.freedesktop.org</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re: [PATCH]
                drm/amdgpu: Fix the null pointer issue for</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; tdr</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 08.11.19 um 10:39
                schrieb Deng, Emily:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sorry, please take
                your time.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Have you seen my other
                response a bit below?</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; I can't follow how it
                would be possible for job-&gt;s_fence to be</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; NULL without the job
                also being freed.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; So it looks like this
                patch is just papering over some bigger issues.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Regards,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; Christian.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Best wishes</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Emily Deng</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; -----Original
                Message-----</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: Koenig,
                Christian <a class="moz-txt-link-rfc2396E"
                  href="mailto:Christian.Koenig@amd.com"
                  moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent: Friday,
                November 8, 2019 5:08 PM</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To: Deng, Emily
                <a class="moz-txt-link-rfc2396E"
                  href="mailto:Emily.Deng@amd.com"
                  moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a>;
                amd-</div>
              <div>&gt;&gt;&gt;&gt;&gt; <a
                  class="moz-txt-link-abbreviated"
                  href="mailto:gfx@lists.freedesktop.org"
                  moz-do-not-send="true">gfx@lists.freedesktop.org</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject: Re:
                [PATCH] drm/amdgpu: Fix the null pointer issue for</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; tdr</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am 08.11.19 um
                09:52 schrieb Deng, Emily:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Ping.....</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; You need to give
                me at least enough time to wake up :)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Best wishes</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Emily Deng</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -----Original Message-----</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; From:
                amd-gfx <a class="moz-txt-link-rfc2396E"
                  href="mailto:amd-gfx-bounces@lists.freedesktop.org"
                  moz-do-not-send="true">&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a>
                On</div>
              <div>&gt;&gt;&gt; Behalf</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Of Deng,
                Emily</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Sent:
                Friday, November 8, 2019 10:56 AM</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To:
                Koenig, Christian <a class="moz-txt-link-rfc2396E"
                  href="mailto:Christian.Koenig@amd.com"
                  moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>;
                amd-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a
                  class="moz-txt-link-abbreviated"
                  href="mailto:gfx@lists.freedesktop.org"
                  moz-do-not-send="true">gfx@lists.freedesktop.org</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Subject:
                RE: [PATCH] drm/amdgpu: Fix the null pointer issue</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for tdr</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -----Original Message-----</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                From: Christian König <a class="moz-txt-link-rfc2396E"
                  href="mailto:ckoenig.leichtzumerken@gmail.com"
                  moz-do-not-send="true">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                Sent: Thursday, November 7, 2019 7:28 PM</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; To:
                Deng, Emily <a class="moz-txt-link-rfc2396E"
                  href="mailto:Emily.Deng@amd.com"
                  moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a>;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a
                  class="moz-txt-link-abbreviated"
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                Subject: Re: [PATCH] drm/amdgpu: Fix the null pointer
                issue</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; for
                tdr</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Am
                07.11.19 um 11:25 schrieb Emily Deng:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                When the job is already signaled, the s_fence is freed.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                Then it will has null pointer in
                amdgpu_device_gpu_recover.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; NAK,
                the s_fence is only set to NULL when the job is
                destroyed.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; See
                drm_sched_job_cleanup().</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I know
                it is set to NULL in drm_sched_job_cleanup. But in one</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; case,
                when it enter into the amdgpu_device_gpu_recover, it</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; already
                in drm_sched_job_cleanup, and at this time, it will</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; go to
                free</div>
              <div>&gt;&gt;&gt;&gt;&gt; job.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; But the
                amdgpu_device_gpu_recover sometimes is faster. At</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; that
                time, job is not freed, but s_fence is already NULL.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; No, that case
                can't happen. See here:</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                drm_sched_job_cleanup(s_job);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                amdgpu_ring_priority_put(ring, s_job-&gt;s_priority);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                dma_fence_put(job-&gt;fence);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                amdgpu_sync_free(&amp;job-&gt;sync);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                amdgpu_sync_free(&amp;job-&gt;sched_sync);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                kfree(job);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; The job itself
                is freed up directly after freeing the reference</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; to the</div>
              <div>&gt;&gt;&gt;&gt;&gt; s_fence.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; So you are just
                papering over a much bigger problem here. This</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; patch is a clear
                NAK.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Regards,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Christian.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; When
                you see a job without an s_fence then that means the</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                problem is somewhere else.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                Regards,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                Christian.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                Signed-off-by: Emily Deng <a
                  class="moz-txt-link-rfc2396E"
                  href="mailto:Emily.Deng@amd.com"
                  moz-do-not-send="true">&lt;Emily.Deng@amd.com&gt;</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                ---</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       
                drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  2 +-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       
                drivers/gpu/drm/scheduler/sched_main.c     | 11
                ++++++---</div>
              <div>&gt;--</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;       
                2 files changed, 7 insertions(+), 6 deletions(-)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                index e6ce949..5a8f08e 100644</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                @@ -4075,7 +4075,7 @@ int</div>
              <div>&gt;&gt;&gt; amdgpu_device_gpu_recover(struct</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                amdgpu_device *adev,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                *</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                * job-&gt;base holds a reference to parent fence</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                */</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -  if (job &amp;&amp; job-&gt;base.s_fence-&gt;parent
                &amp;&amp;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +  if (job &amp;&amp; job-&gt;base.s_fence &amp;&amp;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                + job-&gt;base.s_fence-&gt;parent</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; &amp;&amp;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;               
                dma_fence_is_signaled(job-&gt;base.s_fence-&gt;parent))</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                   
                job_signaled = true;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                diff --git a/drivers/gpu/drm/scheduler/sched_main.c</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                b/drivers/gpu/drm/scheduler/sched_main.c</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                index 31809ca..56cc10e 100644</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                --- a/drivers/gpu/drm/scheduler/sched_main.c</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +++ b/drivers/gpu/drm/scheduler/sched_main.c</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                @@ -334,8 +334,8 @@ void</div>
              <div>&gt;drm_sched_increase_karma(struct</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                drm_sched_job</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                *bad)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                           
                spin_lock(&amp;rq-&gt;lock);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                           
                list_for_each_entry_safe(entity,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                tmp,</div>
              <div>&gt;&gt;&gt; &amp;rq-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; entities,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                list) {</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -                          if
                (bad-&gt;s_fence-&gt;scheduled.context</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; ==</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -                              entity-&gt;fence_context)
                {</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +                          if (bad-&gt;s_fence
                &amp;&amp;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                + (bad-&gt;s_fence-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                scheduled.context ==</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +                             
                entity-&gt;fence_context)) {</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                                           
                if</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                (atomic_read(&amp;bad-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; karma) &gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                                               
                bad-&gt;sched-</div>
              <div>&gt;&gt;&gt;&gt; hang_limit)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                                                   
                if</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                (entity-</div>
              <div>&gt;&gt;&gt;&gt; guilty) @@ -376,7 +376,7 @@ void</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                drm_sched_stop(struct</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; drm_gpu_scheduler</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                *sched, struct drm_sched_job *bad)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                * This iteration is thread safe as sched thread</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                is</div>
              <div>&gt;&gt;&gt; stopped.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                */</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;           
                list_for_each_entry_safe_reverse(s_job, tmp,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                &amp;sched- ring_mirror_list, node) {</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -          if (s_job-&gt;s_fence-&gt;parent &amp;&amp;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +          if (s_job-&gt;s_fence &amp;&amp;
                s_job-&gt;s_fence-&gt;parent &amp;&amp;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                       
                dma_fence_remove_callback(s_job-</div>
              <div>&gt;&gt;&gt;&gt; s_fence-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; parent,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                                                 
                &amp;s_job-&gt;cb)) {</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                           
                atomic_dec(&amp;sched-&gt;hw_rq_count);</div>
              <div>&gt;&gt;&gt; @@ -</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; 395,7</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; +395,8
                @@ void</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                drm_sched_stop(struct drm_gpu_scheduler</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                *sched, struct drm_sched_job *bad)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                            
                *</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                            
                * Job is still alive so fence</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                refcount at</div>
              <div>&gt;&gt;&gt; least 1</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                            
                */</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -                 
                dma_fence_wait(&amp;s_job-&gt;s_fence-&gt;finished,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; false);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +                  if (s_job-&gt;s_fence)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +                         
                dma_fence_wait(&amp;s_job-&gt;s_fence-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; finished,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                false);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                           
                /*</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                            
                * We must keep bad job alive</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                for later</div>
              <div>&gt;&gt;&gt; use</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt; during @@</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -438,7</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +439,7 @@ void drm_sched_start(struct drm_gpu_scheduler</div>
              <div>&gt;&gt;&gt;&gt;&gt; *sched,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +bool</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                full_recovery)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                * GPU recovers can't run in parallel.</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;            
                */</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;           
                list_for_each_entry_safe(s_job, tmp,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                &amp;sched-&gt;ring_mirror_list,</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                node)</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; {</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                -          struct dma_fence *fence =
                s_job-&gt;s_fence-&gt;parent;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +          struct dma_fence *fence = s_job-&gt;s_fence ?</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                + s_job-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; s_fence-</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                parent :</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                +NULL;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;                   
                atomic_inc(&amp;sched-&gt;hw_rq_count);</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;
                _______________________________________________</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; amd-gfx
                mailing list</div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a
                  class="moz-txt-link-abbreviated"
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a></div>
              <div>&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a
                  href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
                  moz-do-not-send="true">
                  https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
              <div>&gt;</div>
              <div>&gt;_______________________________________________</div>
              <div>&gt;amd-gfx mailing list</div>
              <div>&gt;<a class="moz-txt-link-abbreviated"
                  href="mailto:amd-gfx@lists.freedesktop.org"
                  moz-do-not-send="true">amd-gfx@lists.freedesktop.org</a></div>
              <div>&gt;<a
                  href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx"
                  moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
              <div><font face="Times New Roman"> </font></div>
            </span></font> </blockquote>
        <br>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a></pre>
    </blockquote>
    <br>
  </body>
</html>

--------------76F2BAA5ED3003DCF53B1335--

--===============0761989273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0761989273==--

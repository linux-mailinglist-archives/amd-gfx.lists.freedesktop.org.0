Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 064663E0438
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Aug 2021 17:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8116EABA;
	Wed,  4 Aug 2021 15:32:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1A116EABA
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Aug 2021 15:32:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 h24-20020a1ccc180000b029022e0571d1a0so1713379wmb.5
 for <amd-gfx@lists.freedesktop.org>; Wed, 04 Aug 2021 08:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=pzCLHax1u6eURHHSt8Utgkr3ejo1XXHb/Q0LJvKlof4=;
 b=h8HrArbuZMfNJcLflwN86VFqveXqqrUkAmYsr4Q/gLPxaWXD/QoyYX4ARP/Pr/hu7w
 t46/o1idfoI7mIQzTl6mGFyOVOuf4U1Hbu1KV6Mc8UVkkWLwghecLszPcVnVT4Kh+6Zd
 U7KxQ1PpqLM2UDGTI3JAM+nNgqO4pWqMQaaeRzEoQvIcWUdWDfjaTc2oGmfMiAeJA7k6
 uLkEBBkOmNMdkirfecDZZ3gx18MVahOnafJhWvx444ZIpMJRvj+0fn6tXqufSaY3t0r8
 Ip9ZlS4sUVG9lUFfHAD16nXRQS1du0JQdioj22saPhiJdSAzZ6E1t0bzuO452TvvK11b
 hWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pzCLHax1u6eURHHSt8Utgkr3ejo1XXHb/Q0LJvKlof4=;
 b=gzzbWakU7pmu/Q2uDVfNisJjvlj7a2QEGTwfcFwuSuS4JhsbDLJq4nJLUxJfgDdija
 K3zYrxgCXcdzLZOHjbnG/xV4m9ID3pnzvRO1t9owZ0ISCeWYXU7n5DUUbOA348uYhMBt
 Qj1QZPIe8RqUHYpg7SoH2A1Z6MQ4NRjeTksDKCPFM7yRru3v/jgfqImzovITqVNe+f3H
 JfRX4y3ro9kVHR9dQ0J1+manpry3PmHNMTfv/uia1fTC4MCcINuRgavMJZrwLShhokTX
 iN5ttYPhYxx/RwukkqXOpBs1tMKKPpST7vNgOMe4ipGtLm6o3vZtpK5fp0n3gsFzKF77
 57Hw==
X-Gm-Message-State: AOAM533C/z8zgZbetH8dSZVSGcjhUWRO4C22nemQVBgGOvlu0I//NWMg
 eTmr9cXHpGzIrKt+UbQ041KQx7MczJs=
X-Google-Smtp-Source: ABdhPJwi5d41tQ0CkpMN4qRDO0qVPD6Qjr/WDchT/GIZG0wPRr7O8BrNGY5nJudX8TsBZkWqVpWp2Q==
X-Received: by 2002:a05:600c:4784:: with SMTP id
 k4mr10702440wmo.166.1628091147128; 
 Wed, 04 Aug 2021 08:32:27 -0700 (PDT)
Received: from [192.168.137.54] (ip-178-202-40-45.hsi09.unitymediagroup.de.
 [178.202.40.45])
 by smtp.gmail.com with ESMTPSA id l41sm2938048wmp.23.2021.08.04.08.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 08:32:26 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: Fix vm free pts race when process exiting
To: philip yang <yangp@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 amd-gfx@lists.freedesktop.org
References: <20210802223308.13076-1-Philip.Yang@amd.com>
 <920b7b04-8f8d-a57a-724e-811a4c7e581c@gmail.com>
 <2c47c381-0c53-47ff-b6a6-75de23d7ff89@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0c7cee4e-dfc9-600d-1cfd-512092f93c5c@gmail.com>
Date: Wed, 4 Aug 2021 17:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2c47c381-0c53-47ff-b6a6-75de23d7ff89@amd.com>
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

Am 04.08.21 um 17:11 schrieb philip yang:
>
> On 2021-08-04 5:01 a.m., Christian König wrote:
>
>> Am 03.08.21 um 00:33 schrieb Philip Yang:
>>> Take vm->invalidated_lock spinlock to remove vm pd and pt bos, to avoid
>>> link list corruption with crash backtrace:
>>>
>>> [ 2290.505111] list_del corruption. next->prev should be
>>>   ffff9b2514ec0018, but was 4e03280211010f04
>>> [ 2290.505154] kernel BUG at lib/list_debug.c:56!
>>> [ 2290.505176] invalid opcode: 0000 [#1] SMP NOPTI
>>> [ 2290.505254] Workqueue: events delayed_fput
>>> [ 2290.505271] RIP: 0010:__list_del_entry_valid.cold.1+0x20/0x4c
>>> [ 2290.505513] Call Trace:
>>> [ 2290.505623]  amdgpu_vm_free_table+0x26/0x80 [amdgpu]
>>> [ 2290.505705]  amdgpu_vm_free_pts+0x7a/0xf0 [amdgpu]
>>> [ 2290.505786]  amdgpu_vm_fini+0x1f0/0x440 [amdgpu]
>>> [ 2290.505864]  amdgpu_driver_postclose_kms+0x172/0x290 [amdgpu]
>>> [ 2290.505893]  drm_file_free.part.10+0x1d4/0x270 [drm]
>>> [ 2290.505916]  drm_release+0xa9/0xe0 [drm]
>>> [ 2290.505930]  __fput+0xb7/0x230
>>> [ 2290.505942]  delayed_fput+0x1c/0x30
>>> [ 2290.505957]  process_one_work+0x1a7/0x360
>>> [ 2290.505971]  worker_thread+0x30/0x390
>>> [ 2290.505985]  ? create_worker+0x1a0/0x1a0
>>> [ 2290.505999]  kthread+0x112/0x130
>>> [ 2290.506011]  ? kthread_flush_work_fn+0x10/0x10
>>> [ 2290.506027]  ret_from_fork+0x22/0x40
>>
>> Wow, well this is a big NAK.
>>
>> The page tables should never ever be on the invalidation list or 
>> otherwise we would try to point PTEs to them which is a huge security 
>> issue.
>>
>> Taking the lock just workaround that. Can you investigate how it 
>> happens that a page table ends up on that list?
>
> I will be off 3 days, I can investigate this further next Monday. From 
> debug, amdgpu_vm_bo_invalidate is called many times. The background: 
> app has 8 processes, running on 8 GPUs, 64 VMs, VRAM usage is around 
> 85% from rocm-info, 1/5 chance this happens (kernel BUG, server die) 
> after application segmentation fault crash (another app issue). It is 
> new issue on rocm release 4.3, never happened before on rocm 4.1 (no 
> app crash on 4.1 either). kernel version is 4.18 on CentOS.
>

It could be a bug in the VM code. I'm on vacation till 16th of August, 
but I will try to take a look when I have time.

Thanks for the notice,
Christian.

> Regards,
>
> Philip
>
>>
>> Thanks in advance,
>> Christian.
>>
>>>
>>> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> index 2a88ed5d983b..5c4c355e7d6b 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>>> @@ -1045,7 +1045,9 @@ static void amdgpu_vm_free_table(struct 
>>> amdgpu_vm_bo_base *entry)
>>>           return;
>>>       shadow = amdgpu_bo_shadowed(entry->bo);
>>>       entry->bo->vm_bo = NULL;
>>> +    spin_lock(&entry->vm->invalidated_lock);
>>>       list_del(&entry->vm_status);
>>> +    spin_unlock(&entry->vm->invalidated_lock);
>>>       amdgpu_bo_unref(&shadow);
>>>       amdgpu_bo_unref(&entry->bo);
>>>   }
>>


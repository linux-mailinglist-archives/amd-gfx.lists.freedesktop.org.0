Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C854DC76B
	for <lists+amd-gfx@lfdr.de>; Thu, 17 Mar 2022 14:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8798910EBBE;
	Thu, 17 Mar 2022 13:19:15 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id DA31510EBBE
 for <amd-gfx@lists.freedesktop.org>; Thu, 17 Mar 2022 13:17:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E60D1515;
 Thu, 17 Mar 2022 06:17:45 -0700 (PDT)
Received: from [10.57.42.204] (unknown [10.57.42.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 151153F766;
 Thu, 17 Mar 2022 06:17:43 -0700 (PDT)
Message-ID: <6f5aaddd-e793-e5f1-17aa-71e7804f035f@arm.com>
Date: Thu, 17 Mar 2022 13:17:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: radeon ring 0 test failed on arm64
Content-Language: en-GB
To: Peter Geis <pgwipeout@gmail.com>
References: <CAMdYzYptw9L=5SECtVkNZruTT-x57+03vj0A+5efvq8cESzLyQ@mail.gmail.com>
 <CADnq5_NXmRr_Q7JuWZxJAjmavVkvJjNcWayQ1x8LhfcX5CS0uA@mail.gmail.com>
 <CAMdYzYoamh-igvBbKaLSJ6bSc3wA29=8mooJDLMJkj9YQ=wj0A@mail.gmail.com>
 <CADnq5_NXFZPA_z6413FDgr8WRObhCB+HdkHE5P=PAAMV4FiWiA@mail.gmail.com>
 <20dffd4d-fa54-5bc3-c13b-f8ffbf0fb593@arm.com>
 <599edb94-8294-c4c5-ff7f-84c7072af3dd@gmail.com>
 <546bf682-565f-8384-ec80-201ce1c747f4@arm.com>
 <8afb06c4-7601-d0d7-feae-ee5abc9c3641@amd.com>
 <CAMdYzYqH57HuqMMydMtQw2Ep2A_Qhjg3N_gTw6GuO6Kuxd9chQ@mail.gmail.com>
 <c3bd7c08-f7e3-153e-8445-8e867916d03c@arm.com>
 <CAMdYzYpt1vOCXiDUHCnuVRKnQ51Qissj9-w75FB6nVrFWS-9iw@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAMdYzYpt1vOCXiDUHCnuVRKnQ51Qissj9-w75FB6nVrFWS-9iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 17 Mar 2022 13:19:14 +0000
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
Cc: "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Shawn Lin <shawn.lin@rock-chips.com>, Kever Yang <kever.yang@rock-chips.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2022-03-17 12:26, Peter Geis wrote:
> On Thu, Mar 17, 2022 at 6:37 AM Robin Murphy <robin.murphy@arm.com> wrote:
>>
>> On 2022-03-17 00:14, Peter Geis wrote:
>>> Good Evening,
>>>
>>> I apologize for raising this email chain from the dead, but there have
>>> been some developments that have introduced even more questions.
>>> I've looped the Rockchip mailing list into this too, as this affects
>>> rk356x, and likely the upcoming rk3588 if [1] is to be believed.
>>>
>>> TLDR for those not familiar: It seems the rk356x series (and possibly
>>> the rk3588) were built without any outer coherent cache.
>>> This means (unless Rockchip wants to clarify here) devices such as the
>>> ITS and PCIe cannot utilize cache snooping.
>>> This is based on the results of the email chain [2].
>>>
>>> The new circumstances are as follows:
>>> The RPi CM4 Adventure Team as I've taken to calling them has been
>>> attempting to get a dGPU working with the very broken Broadcom
>>> controller in the RPi CM4.
>>> Recently they acquired a SoQuartz rk3566 module which is pin
>>> compatible with the CM4, and have taken to trying it out as well.
>>>
>>> This is how I got involved.
>>> It seems they found a trivial way to force the Radeon R600 driver to
>>> use Non-Cached memory for everything.
>>> This single line change, combined with using memset_io instead of
>>> memset, allows the ring tests to pass and the card probes successfully
>>> (minus the DMA limitations of the rk356x due to the 32 bit
>>> interconnect).
>>> I discovered using this method that we start having unaligned io
>>> memory access faults (bus errors) when running glmark2-drm (running
>>> glmark2 directly was impossible, as both X and Wayland crashed too
>>> early).
>>> I traced this to using what I thought at the time was an unsafe memcpy
>>> in the mesa stack.
>>> Rewriting this function to force aligned writes solved the problem and
>>> allows glmark2-drm to run to completion.
>>> With some extensive debugging, I found about half a dozen memcpy
>>> functions in mesa that if forced to be aligned would allow Wayland to
>>> start, but with hilarious display corruption (see [3]. [4]).
>>> The CM4 team is convinced this is an issue with memcpy in glibc, but
>>> I'm not convinced it's that simple.
>>>
>>> On my two hour drive in to work this morning, I got to thinking.
>>> If this was an memcpy fault, this would be universally broken on arm64
>>> which is obviously not the case.
>>> So I started thinking, what is different here than with systems known to work:
>>> 1. No IOMMU for the PCIe controller.
>>> 2. The Outer Cache Issue.
>>>
>>> Robin:
>>> My questions for you, since you're the smartest person I know about
>>> arm64 memory management:
>>> Could cache snooping permit unaligned accesses to IO to be safe?
>>
>> No.
>>
>>> Or
>>> Is it the lack of an IOMMU that's causing the alignment faults to become fatal?
>>
>> No.
>>
>>> Or
>>> Am I insane here?
>>
>> No. (probably)
>>
>> CPU access to PCIe has nothing to do with PCIe's access to memory. From
>> what you've described, my guess is that a GPU BAR gets put in a
>> non-prefetchable window, such that it ends up mapped as Device memory
>> (whereas if it were prefetchable it would be Normal Non-Cacheable).
> 
> Okay, this is perfect and I think you just put me on the right track
> for identifying the exact issue. Thanks!
> 
> I've sliced up the non-prefetchable window and given it a prefetchable window.
> The 256MB BAR now resides in that window.
> However I'm still getting bus errors, so it seems the prefetch isn't
> actually happening.

Note that "prefetchable" really just means "no side-effects on reads", 
i.e. we can map it with a Normal memory type that technically *allows* 
the CPU to make speculative accesses because they will not be harmful, 
but that's not to say the CPU will do so. Just that if it did, you 
wouldn't notice anyway.

It's entirely possible that the PCIe IP itself doesn't like unaligned 
accesses, so changing the memory type just moves you from an alignment 
fault to an external abort.

> The difference is now the GPU realizes that an error has happened and
> initiates recovery, vice before where it seemed to be clueless.
> If I understand everything correctly, that's because before the bus
> error was raised by the CPU due to the memory flag, vice now where
> it's actually the bus raising the alarm.
> 
> My next question, is this something the driver should set and isn't,
> or is it just because of the broken cache coherency?

The general rule for userspace mmap()ing PCIe-attached memory and 
handing it off to glibc or anyone else who might assume it's regular 
system RAM is "don't do that". If it's not access size or alignment that 
falls over, it could be atomic operations, MTE tags, or any other 
new-fangled memory innovation. For the ultimate dream of just plugging 
in a card full of RAM, you either need to look back to ISA or forward to 
CXL ;)

Robin.

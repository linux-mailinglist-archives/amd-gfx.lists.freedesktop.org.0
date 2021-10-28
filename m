Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FC43DE6A
	for <lists+amd-gfx@lfdr.de>; Thu, 28 Oct 2021 12:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52FD6E0A0;
	Thu, 28 Oct 2021 10:07:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5125C6E0A0
 for <amd-gfx@lists.freedesktop.org>; Thu, 28 Oct 2021 10:07:01 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aef59.dynamic.kabel-deutschland.de
 [95.90.239.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id C121261EA191D;
 Thu, 28 Oct 2021 12:06:59 +0200 (CEST)
Message-ID: <731d8a14-5630-23f0-2953-6aeb94e56991@molgen.mpg.de>
Date: Thu, 28 Oct 2021 12:06:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/amdgpu/gmc6: fix DMA mask
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 it+linux-iommu@molgen.mpg.de, Alex Deucher <alexdeucher@gmail.com>
References: <20211027182212.1484689-1-alexander.deucher@amd.com>
 <CADnq5_PzD5h0UmhQko7YE86a1xhm2LnPFhDgwgEhBe7iKNov0A@mail.gmail.com>
 <a0801433-fd70-f15d-3f63-7ca18fbf2244@molgen.mpg.de>
 <b1b2b722-d21e-421a-e8b1-5452d404533d@molgen.mpg.de>
In-Reply-To: <b1b2b722-d21e-421a-e8b1-5452d404533d@molgen.mpg.de>
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

Dear Alex,


On 28.10.21 10:32, Paul Menzel wrote:

> On 28.10.21 00:19, Paul Menzel wrote:
> 
>> On 27.10.21 20:23, Alex Deucher wrote:
>>> On Wed, Oct 27, 2021 at 2:22 PM Alex Deucher wrote:
>>>>
>>>> The DMA mask on SI parts is 40 bits not 44.  Looks like a copy
>>>> paste typo.
>>>
>>> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1762
>>>
>>> Fixed locally.
>>
>> As I have no way to reproduce this, as the ring gfx timeout error is 
>> logged ten seconds after the IO_PAGE_FAULT, is very likely to be related?
>>
>> Hopefully I am going to be able to test this on Friday. Does AMD’s QA 
>> team have the cards to test the `iommu.forcedac=1` case? Is that test 
>> case going to be added to the “test protocol”?
>>
>> Lastly, should a Fixes tag be added, so it’s picked up for the stable 
>> series?
> 
> Does the value of 44 need to be changed to 40 also five lines below?
> 
> -       adev->need_swiotlb = drm_need_swiotlb(44);
> +       adev->need_swiotlb = drm_need_swiotlb(40);

I booted the Dell OptiPlex 5055 with this patch (both hunks) on top of 
commit 1fc596a56b (Merge tag 'trace-v5.15-rc6' of 
git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace) with 
`iommu.forcedac=1`, and did not get any errors.

Tested-by: Paul Menzel <pmenzel@molgen.mpg.de> (AMD OptiPlex 5055, 
Radeon HD 8570 / R7 240/340 OEM, 1002:6611 with `iommu.forcedac=1`)

Maybe in the commit message summary extend: Fix DMA mask from 44 to 40.


Kind regards,

Paul

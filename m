Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8700514A31
	for <lists+amd-gfx@lfdr.de>; Fri, 29 Apr 2022 15:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06A210ECC3;
	Fri, 29 Apr 2022 13:03:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4639110E1C4
 for <amd-gfx@lists.freedesktop.org>; Fri, 29 Apr 2022 11:36:33 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nkOvG-0004nQ-4S; Fri, 29 Apr 2022 13:36:30 +0200
Message-ID: <0b0025c1-107b-8dab-f30a-87b428b45e08@leemhuis.info>
Date: Fri, 29 Apr 2022 13:36:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [REGRESSION] AMD GPU regression in 5.16.18..5.17.4 #forregzbot
Content-Language: en-US
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <YmQi7ajZpZ4W7BJL@itl-email> <YmQkCXZEqp6TKrhJ@itl-email>
 <YmTqYkGEqiz1o2o6@kroah.com>
 <e1950610-ba09-7c42-4a1a-152ad41015b5@leemhuis.info>
 <YmXfqrktdufyYC4r@itl-email>
 <BL1PR12MB5144A5433CD3495A3B74F30AF7F89@BL1PR12MB5144.namprd12.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <BL1PR12MB5144A5433CD3495A3B74F30AF7F89@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1651232193;
 96ead357; 
X-HE-SMSGID: 1nkOvG-0004nQ-4S
X-Mailman-Approved-At: Fri, 29 Apr 2022 13:03:53 +0000
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot fixed-by: 78b12008f20

On 25.04.22 23:29, Deucher, Alexander wrote:
> [Public]
> 
>> -----Original Message-----
>> From: Demi Marie Obenour <demi@invisiblethingslab.com>
>> Sent: Sunday, April 24, 2022 7:39 PM
>> To: Thorsten Leemhuis <regressions@leemhuis.info>; Greg KH 
>> <gregkh@linuxfoundation.org>
>> Cc: amd-gfx@lists.freedesktop.org; regressions@lists.linux.dev; 
>> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian 
>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>
>> Subject: Re: [REGRESSION] AMD GPU regression in 5.16.18..5.17.4
>>
>> On Sun, Apr 24, 2022 at 11:02:43AM +0200, Thorsten Leemhuis wrote:
>>> CCing the amdgpu maintainers
>>>
>>> On 24.04.22 08:12, Greg KH wrote:
>>>> On Sat, Apr 23, 2022 at 12:06:33PM -0400, Demi Marie Obenour wrote:
>>>>> Two Qubes OS users reported that their AMD GPU systems did not 
>>>>> work on 5.17.4, while 5.16.18 worked fine.  Details can be found 
>>>>> on https://github.com/QubesOS/qubes-issues/issues/7462.  The 
>>>>> initial report listed the GPU as “Advanced Micro Devices, Inc. 
>>>>> [AMD/ATI] Renoir [1002:1636} (rev d3) (prog-if 00 [VGA 
>>>>> controller])” and the CPU as “AMD Ryzen 5 PRO 4650U with Radeon Graphics”.
>>>>>
>>>>> #regzbot introduced: v5.16.18..v5.17.4
>>>>
>>>> That's a big range, can you use 'git bisect' to track it down?
>>>
>>> FWIW, in another mail in this thread and
>>> https://github.com/QubesOS/qubes-issues/issues/7462#issuecomment-
>> 11076
>>> 81126 it was clarified that the problem was introduced between 
>>> 5.17.3 and 5.17.4, where a few amdgpu changes were applied. Maybe 
>>> they are the reason.
>>>
>>> Anyway: Yes, as Gregkh said, a bisection really would help. But 
>>> maybe the amdgfx developers might already have an idea what might be 
>>> wrong here? The QubesOS ticket linked above has some more details.
>>
>> The reporter was able to bisect the regression.  I am not surprised 
>> that this commit caused problems for Qubes OS, as dom0 in Qubes OS is 
>> technically a guest of Xen.
>>
>> #regzbot ^introduced: b818a5d374542ccec73dcfe578a081574029820e
> 
> Can you please follow up on the bug ticket:
> https://gitlab.freedesktop.org/drm/amd/-/issues/1985
> It will be easier to track everything there.
> 
> Alex

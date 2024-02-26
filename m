Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E71867C5F
	for <lists+amd-gfx@lfdr.de>; Mon, 26 Feb 2024 17:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F0F10E7A5;
	Mon, 26 Feb 2024 16:46:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC5810E7A5;
 Mon, 26 Feb 2024 16:46:29 +0000 (UTC)
Received: from [192.168.1.137] ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202402261746266351; Mon, 26 Feb 2024 17:46:26 +0100
Message-ID: <9e2f788e-7e74-4c71-ab45-7f72c230152f@daenzer.net>
Date: Mon, 26 Feb 2024 17:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/amdgpu: Refuse to create a KMS FB for non-P2P
 exported dma-bufs
Content-Language: de-CH-frami, en-CA
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240222172821.16901-1-michel@daenzer.net>
 <3156ea34-0655-4b0f-9438-9113fb714373@amd.com>
 <2d7632f0-0783-4d82-9d81-dd6bd52d5db6@daenzer.net>
 <84fa5bc1-6b4d-4d82-844a-8070d4bd78eb@amd.com>
 <b08c2c14-5a99-49cf-ba79-b89f86487f15@daenzer.net>
 <7dd49c00-8d5e-4492-801c-f1b6db5e1737@daenzer.net>
 <d1528a0e-6dd3-497a-972c-3b86efd46313@amd.com>
 <298c5ccd-d39c-4036-8ad6-624f635bc08c@daenzer.net>
 <4253f207-23af-4510-aa0c-a7509546917a@amd.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Autocrypt: addr=michel@daenzer.net; keydata=
 xsDiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPM0jTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD7CXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkLOwE0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpcJGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAnjICalDn2zB1
 fXqoOkGsTwElvKa5AJ9FhyKJpysFRcejfdZwrwl9xb4oOg==
In-Reply-To: <4253f207-23af-4510-aa0c-a7509546917a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F24.65DCC063.0050,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
 Spam="Unknown"; VOD="Unknown"
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

On 2024-02-26 17:34, Christian König wrote:
> Am 26.02.24 um 17:27 schrieb Michel Dänzer:
>> On 2024-02-26 16:58, Christian König wrote:
>>> Am 23.02.24 um 17:43 schrieb Michel Dänzer:
>>>> On 2024-02-23 11:04, Michel Dänzer wrote:
>>>>> On 2024-02-23 10:34, Christian König wrote:
>>>>>> Am 23.02.24 um 09:11 schrieb Michel Dänzer:
>>>>>>> On 2024-02-23 08:06, Christian König wrote:
>>>>>>>> Am 22.02.24 um 18:28 schrieb Michel Dänzer:
>>>>>>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>>>>>>
>>>>>>>>> Pinning the BO storage to VRAM for scanout would make it inaccessible
>>>>>>>>> to non-P2P dma-buf importers.
>>>>>>>> Thinking more about it I don't think we can do this.
>>>>>>>>
>>>>>>>> Using the BO in a ping/pong fashion for scanout and DMA-buf is actually valid, you just can't do both at the same time.
>>>>>>>>
>>>>>>>> And if I'm not completely mistaken we actually have use cases for this at the moment,
>>>>>>> Those use cases don't have P2P & CONFIG_DMABUF_MOVE_NOTIFY?
>>>>>> Nope, we are basically talking about unit tests and examples for inter device operations.
>>>>> Sounds like the "no user-space regressions" rule might not apply then.
>>>> To clarify what I mean by that:
>>>>
>>>> "We can't fix this issue, because it would break some unit tests and examples" is similar to saying "We can't fix this KMS bug, because there are IGT tests expecting the buggy behaviour". In practice, the latter do get fixed, along with the IGT tests.
>>> The problem here is that this is not a bug, but intentional behavior. Exporting BOs and using them in scanout in a ping/pong fashion is perfectly valid.
>> The problem with the status quo is that it requires amdgpu-specific knowledge and worst-case pessimization in user space.
> 
> Yeah, I'm perfectly aware of that. But that approach here really doesn't seems to be valid.

It's the only known sane approach at this point. There's no other proposal which allows using both BO sharing and scanout without pessimizing or hitting seemingly random CS ioctl failures.


>>> We have use cases which depend on this behavior and I'm not going to break those to fix your use case.
>> It's not "my" use case, it's a Wayland compositor trying to make use of BO sharing and scanout without always pessimizing for the worst case.
>>
>> That's surely more of a real-world use case than unit tests and examples.
> 
> I've looked a bit deeper into this and we have told customers for the last ~10 years or so that this is how it is supposed to work and that they can use this approach.
> 
> So this is much more than unit tests and examples, we are changing existing behavior which is clearly not a bug but intentional and have a very high chance to break valid use cases.

"Very high chance" sounds like you still don't know of any actual real-world use case relying on it though?


> My question is why has it worked so far? I mean we are not doing this since yesterday and the problem only shows up now?

Yes, Wayland compositors are only starting to try and make use of this now.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer


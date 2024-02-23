Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83920860EE0
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Feb 2024 11:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC2B10EB64;
	Fri, 23 Feb 2024 10:04:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6803510EB62;
 Fri, 23 Feb 2024 10:04:38 +0000 (UTC)
Received: from [192.168.1.137] ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202402231104335773; Fri, 23 Feb 2024 11:04:33 +0100
Message-ID: <b08c2c14-5a99-49cf-ba79-b89f86487f15@daenzer.net>
Date: Fri, 23 Feb 2024 11:04:27 +0100
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
In-Reply-To: <84fa5bc1-6b4d-4d82-844a-8070d4bd78eb@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F23.65D86DB2.0077,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
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

On 2024-02-23 10:34, Christian König wrote:
> Am 23.02.24 um 09:11 schrieb Michel Dänzer:
>> On 2024-02-23 08:06, Christian König wrote:
>>> Am 22.02.24 um 18:28 schrieb Michel Dänzer:
>>>> From: Michel Dänzer <mdaenzer@redhat.com>
>>>>
>>>> Pinning the BO storage to VRAM for scanout would make it inaccessible
>>>> to non-P2P dma-buf importers.
>>> Thinking more about it I don't think we can do this.
>>>
>>> Using the BO in a ping/pong fashion for scanout and DMA-buf is actually valid, you just can't do both at the same time.
>>>
>>> And if I'm not completely mistaken we actually have use cases for this at the moment,
>> Those use cases don't have P2P & CONFIG_DMABUF_MOVE_NOTIFY?
> 
> Nope, we are basically talking about unit tests and examples for inter device operations.

Sounds like the "no user-space regressions" rule might not apply then.


> Those render into a shared buffer and then display it to check if the content was rendered/transferred correctly.

That can be fixed by dropping the dma-buf attachments from other GPUs before creating the KMS FB.

Conversely, tests / examples which do scanout first can be fixed by destroying KMS FBs before sharing the BO with another GPU.


> I'm not sure if we still do those test cases, the last time I looked into it was before P2P was even supported, but I also can't rule it out.

Sounds too vague to block this series.


>>> So rejecting things during CS and atomic commit is the best thing we can do.
>> It's problematic for a Wayland compositor:
>>
>> The CS ioctl failing is awkward. With GL, I'm pretty sure it means the compositor would have to destroy the context and create a new one. Not sure about Vulkan, but I suspect it's painful there as well.
>>
>> Similarly for the KMS atomic commit ioctl. The compositor can't know why exactly it failed, all it gets is an error code.
> 
> Yeah, but that is not because the kernel is doing anything wrong.
> 
> Sharing, rendering and then doing an atomic commit is a perfectly valid use case.
> 
> You just can't do scanout and sharing at the same time.

Per my later follow-up, Xwayland can't really avoid it.


>> And there's no other way for the compositor to detect when both things can actually work concurrently.
> 
> That I totally agree with. And IIRC we already have at least a query for the buffer placement. E.g. you can already check if the BO is in GTT or VRAM and shared.
> 
> What's missing is exposing if the device can scanout from GTT or not.

Requiring Wayland compositors to have driver-specific knowledge like that baked in isn't great either.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer


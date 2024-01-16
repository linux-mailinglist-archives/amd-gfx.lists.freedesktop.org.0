Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643D982F1CA
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jan 2024 16:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501B110E586;
	Tue, 16 Jan 2024 15:49:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from ms7.webland.ch (ms7.webland.ch [92.43.217.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E965310E5F0
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jan 2024 15:49:07 +0000 (UTC)
Received: from [192.168.1.137] ([213.144.156.170])
 by ms7.webland.ch (12.3.0 build 2 x64) with ASMTP (SSL) id
 01202401161648562987; Tue, 16 Jan 2024 16:48:56 +0100
Message-ID: <429b1f4e-140f-4997-9f8b-bafd85780160@daenzer.net>
Date: Tue, 16 Jan 2024 16:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Mark ctx as guilty in ring_soft_recovery
 path
Content-Language: de-CH-frami, en-CA
To: Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20240113140206.2383133-1-joshua@froggi.es>
 <5ff32f43-46ea-4e74-8db4-c23e0b03b429@daenzer.net>
 <8e5cd59e-075a-480e-8452-87924580122d@froggi.es>
 <1dbe811f-64a0-4ccd-88cf-3fd30f79f7bc@daenzer.net>
 <c36400bd-b8f2-4026-b989-f4e1854b05ca@gmx.de>
 <7194a09a-afe8-4eae-8288-c72e2ac7d0a6@daenzer.net>
 <51b9ffc3-9ab3-4a06-9307-6b2a343f6bc6@gmx.de>
 <CAP+8YyGg91f_z2ktrd7HQMtOSHn34F-8x7O2iRv=TTrXo2NNoA@mail.gmail.com>
 <81a82ffc-c2e6-4ce6-9cc0-4f01dc8b9891@froggi.es>
 <bff749b8-5531-46bd-8e21-97d094e6b4c2@amd.com>
 <9e6fec7b-3786-4221-8024-6b949efd08e7@froggi.es>
 <bfe79411-7f77-48ab-8cfd-4727704739e8@amd.com>
 <3e284517-0372-4c75-9902-7039c09b73e9@froggi.es>
 <baa54077-cf89-4fb7-b505-a41716e66a23@gmail.com>
 <CAAxE2A5v_RkZ9ex4=7jiBSKVb22_1FAj0AANBcmKtETt5c3gVA@mail.gmail.com>
 <de47a17b-3d19-4c74-b77a-e08b0e94cc69@gmail.com>
 <2a9a1a92-a074-456e-8190-3ba0a30d3f30@froggi.es>
 <f6409b43-88f7-4a44-a007-d6686cf11a50@froggi.es>
 <4bfbb2e3-962f-4a74-ba52-0277205c6bfd@froggi.es>
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
In-Reply-To: <4bfbb2e3-962f-4a74-ba52-0277205c6bfd@froggi.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CTCH: RefID="str=0001.0A782F25.65A6A56A.000D,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0";
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
Cc: Friedrich Vock <friedrich.vock@gmx.de>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 2024-01-16 14:44, Joshua Ashton wrote:
> On 1/16/24 13:41, Joshua Ashton wrote:
>> On 1/16/24 12:24, Joshua Ashton wrote:
>>> On 1/16/24 07:47, Christian König wrote:
>>>> Am 16.01.24 um 01:05 schrieb Marek Olšák:
>>>>> On Mon, Jan 15, 2024 at 3:06 PM Christian König
>>>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>>>> Am 15.01.24 um 20:30 schrieb Joshua Ashton:
>>>>>>> On 1/15/24 19:19, Christian König wrote:
>>>>>>>> Am 15.01.24 um 20:13 schrieb Joshua Ashton:
>>>>>>>>> On 1/15/24 18:53, Christian König wrote:
>>>>>>>>>> Am 15.01.24 um 19:35 schrieb Joshua Ashton:
>>>>>>>>>>> On 1/15/24 18:30, Bas Nieuwenhuizen wrote:
>>>>>>>>>>>> On Mon, Jan 15, 2024 at 7:14 PM Friedrich Vock
>>>>>>>>>>>> <friedrich.vock@gmx.de <mailto:friedrich.vock@gmx.de>> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>>      Re-sending as plaintext, sorry about that
>>>>>>>>>>>>
>>>>>>>>>>>>      On 15.01.24 18:54, Michel Dänzer wrote:
>>>>>>>>>>>>       > On 2024-01-15 18:26, Friedrich Vock wrote:
>>>>>>>>>>>>       >> [snip]
>>>>>>>>>>>>       >> The fundamental problem here is that not telling
>>>>>>>>>>>> applications that
>>>>>>>>>>>>       >> something went wrong when you just canceled their work
>>>>>>>>>>>> midway is an
>>>>>>>>>>>>       >> out-of-spec hack.
>>>>>>>>>>>>       >> When there is a report of real-world apps breaking
>>>>>>>>>>>> because of
>>>>>>>>>>>>      that hack,
>>>>>>>>>>>>       >> reports of different apps working (even if it's
>>>>>>>>>>>> convenient that they
>>>>>>>>>>>>       >> work) doesn't justify keeping the broken code.
>>>>>>>>>>>>       > If the breaking apps hit multiple soft resets in a row,
>>>>>>>>>>>> I've laid
>>>>>>>>>>>>      out a pragmatic solution which covers both cases.
>>>>>>>>>>>>      Hitting soft reset every time is the lucky path. Once GPU
>>>>>>>>>>>> work is
>>>>>>>>>>>>      interrupted out of nowhere, all bets are off and it might as
>>>>>>>>>>>> well
>>>>>>>>>>>>      trigger a full system hang next time. No hang recovery should
>>>>>>>>>>>> be able to
>>>>>>>>>>>>      cause that under any circumstance.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> I think the more insidious situation is no further hangs but
>>>>>>>>>>>> wrong results because we skipped some work. That we skipped work
>>>>>>>>>>>> may e.g. result in some texture not being uploaded or some GPGPU
>>>>>>>>>>>> work not being done and causing further errors downstream (say if
>>>>>>>>>>>> a game is doing AI/physics on the GPU not to say anything of
>>>>>>>>>>>> actual GPGPU work one might be doing like AI)
>>>>>>>>>>> Even worse if this is compute on eg. OpenCL for something
>>>>>>>>>>> science/math/whatever related, or training a model.
>>>>>>>>>>>
>>>>>>>>>>> You could randomly just get invalid/wrong results without even
>>>>>>>>>>> knowing!
>>>>>>>>>> Well on the kernel side we do provide an API to query the result of
>>>>>>>>>> a submission. That includes canceling submissions with a soft
>>>>>>>>>> recovery.
>>>>>>>>>>
>>>>>>>>>> What we just doesn't do is to prevent further submissions from this
>>>>>>>>>> application. E.g. enforcing that the application is punished for
>>>>>>>>>> bad behavior.
>>>>>>>>> You do prevent future submissions for regular resets though: Those
>>>>>>>>> increase karma which sets ctx->guilty, and if ctx->guilty then
>>>>>>>>> -ECANCELED is returned for a submission.
>>>>>>>>>
>>>>>>>>> ctx->guilty is never true for soft recovery though, as it doesn't
>>>>>>>>> increase karma, which is the problem this patch is trying to solve.
>>>>>>>>>
>>>>>>>>> By the submission result query API, I you assume you mean checking
>>>>>>>>> the submission fence error somehow? That doesn't seem very ergonomic
>>>>>>>>> for a Vulkan driver compared to the simple solution which is to just
>>>>>>>>> mark it as guilty with what already exists...
>>>>>>>> Well as I said the guilty handling is broken for quite a number of
>>>>>>>> reasons.
>>>>>>>>
>>>>>>>> What we can do rather trivially is changing this code in
>>>>>>>> amdgpu_job_prepare_job():
>>>>>>>>
>>>>>>>>           /* Ignore soft recovered fences here */
>>>>>>>>           r = drm_sched_entity_error(s_entity);
>>>>>>>>           if (r && r != -ENODATA)
>>>>>>>>                   goto error;
>>>>>>>>
>>>>>>>> This will bubble up errors from soft recoveries into the entity as
>>>>>>>> well and makes sure that further submissions are rejected.
>>>>>>> That makes sense to do, but at least for GL_EXT_robustness, that will
>>>>>>> not tell the app that it was guilty.
>>>>>> No, it clearly gets that signaled. We should probably replace the guilty
>>>>>> atomic with a calls to drm_sched_entity_error().
>>>>>>
>>>>>> It's just that this isn't what Marek and I had in mind for this,
>>>>>> basically completely forget about AMDGPU_CTX_OP_QUERY_STATE or
>>>>>> AMDGPU_CTX_OP_QUERY_STATE2.
>>>>>>
>>>>>> Instead just look at the return value of the CS or query fence result IOCTL.
>>>>>>
>>>>>> When you get an -ENODATA you have been guilty of causing a soft
>>>>>> recovery, when you get an -ETIME you are guilty of causing a timeout
>>>>>> which had to be hard recovered. When you get an -ECANCELED you are an
>>>>>> innocent victim of a hard recovery somebody else caused.
>>>>>>
>>>>>> What we haven't defined yet is an error code for loosing VRAM, but that
>>>>>> should be trivial to do.
>>>>> So far we have implemented the GPU reset and soft reset, but we
>>>>> haven't done anything to have a robust system recovery. Under the
>>>>> current system, things can easily keep hanging indefinitely because
>>>>> nothing prevents that.
>>>>>
>>>>> The reset status query should stay. Robust apps will use it to tell
>>>>> when they should recreate their context and resources even if they
>>>>> don't submit anything. Let's fully trust robust apps here. In the
>>>>> future we might change our mind about that, but for now, let's just
>>>>> focus on API conformance, and later we can change it as long as we
>>>>> stay API conformant.
>>>>>
>>>>> Non-robust apps must be terminated when they hang or are innocent but
>>>>> affected. Their existence is a security and usability problem and a
>>>>> source of frustrations for users. 100% guaranteed system recovery is
>>>>> impossible if they continue to live.
>>>>>
>>>>> IBs should be rejected for all guilty and affected innocent contexts
>>>>> unconditionally, both robust and non-robust ones, by the kernel.
>>>>> Userspace only forwards the reset status to apps for robust contexts
>>>>> and doesn't do anything else, but userspace may decide to terminate
>>>>> the process if any non-robust context is affected.
>>>>
>>>> Yeah, that absolutely works for me.
>>>>
>>>> Going to adjust the implementation accordingly.
>>>
>>> Awesome, please CC me know when you have something.
>>>
>>> In the short-term I have changed if (r && r != -ENODATA) to if (r) and that seems to work nicely for me.
>>
>> One problem with solely relying on the CS submission return value from userspace is cancelled syncobj waits.
>>
>> For example, if we have an application with one thread that makes a submission, and then kicks off a vkWaitSemaphores to wait on a semaphore on another thread and that submission hangs, the syncobj relating to the vkWaitSemaphores should be signalled which is fine, but we need to return VK_ERROR_DEVICE_LOST if the context loss resulted in the signal for the VkSemaphore.
>>
>> The way this was previously integrated was with the query thing, which as we have established does not provide correct information regarding soft recovery at the moment.
>>
>> Unless you have an alternative for us to get some error out of the syncobj (eg. -ENODATA), then right now we still require the query.
>>
>> I think fixing the -ENODATA reporting back for submit is a good step, but I believe we still need the query to report the same information as we would have gotten from that here.
> 
> Hmmm, actually the spec states that VK_SUCCESS is valid in this situation:
> 
> Commands that wait indefinitely for device execution (namely vkDeviceWaitIdle, vkQueueWaitIdle, vkWaitForFences with a maximum timeout, and vkGetQueryPoolResults with the VK_QUERY_RESULT_WAIT_BIT bit set in flags) must return in finite time even in the case of a lost device, and return either VK_SUCCESS or VK_ERROR_DEVICE_LOST.

That could be read as "Return VK_SUCCESS on success, VK_ERROR_DEVICE_LOST on device lost", couldn't it?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer


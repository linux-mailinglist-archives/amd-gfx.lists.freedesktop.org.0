Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3227082EFDD
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jan 2024 14:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9FB910E539;
	Tue, 16 Jan 2024 13:42:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA90F10E539
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jan 2024 13:42:26 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-40e86a9fc4bso2852585e9.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jan 2024 05:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1705412484; x=1706017284; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5+NpIUf1etwRaZ4QFfjD6Kw9a2UqeUsLSlswDUkHkEo=;
 b=FxILGhjstyP79VB9e3+ZgLU/jWW1AG+rseeTbNXeO5q+9PCsfHkpBD5lxqHI0feFE1
 YJCmhkef1ixy2WTm4yQI2COQzt4WYUKbLwtNLu/5dmpwNFBTbD9oEtGvvP+FrzSerTto
 4WFQ2TxcdfpeiOi3AvNUsqcShU6SpoH8/U45pNFF+C8EN+xJI377ubnL+3WsbN4rdCPu
 uCvr03yMlv5C82UF3Fm3wOqeHnEHlosRjJ1S5z3jWtTwswkc7/F9cO0Mcqt0ZpZG9SBG
 VxaBMjvXg5Z+7hvGPyAE4HJEY7+cDkt6Sd4px78FtA3AOL4wRDmaH4h48tUgB5v+wfe6
 O+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705412484; x=1706017284;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5+NpIUf1etwRaZ4QFfjD6Kw9a2UqeUsLSlswDUkHkEo=;
 b=hKpEIPZ0Pp20RugTv8iNplUiQ9evaNWh62zlGYWvnaT8PcesMebjYRJh3O0d3aGPnz
 B1lLHPT0atVr1lofovmUbg0V5rLTbHbot+HRF9oass/DHmcAmfjcKPpJlwm3PB1e/S0o
 peIq6duvlC3VtWwMj5NiU6mwuLj7SrVjFxtFiXqniGs2C1V925kzeQaHnI4wCJReinJ1
 AvSc9gr+tj9TFYJtnS8ggSh8JkdlWWcSr7zyxt1AXfc6lGlayYSfeUfoI/soBLKDbf5f
 3pRRDjr6ZACtHigKkGHst3V5u1SxV3xy5b9v6gce7hlY/3xFIo3fydc7d4etZou0dGj+
 A6aw==
X-Gm-Message-State: AOJu0YzJ4GRiDAwQN15yCJai+QLsC6HVU4zi5rqAQcQ8xztLXyqIcH8w
 ZVoBBZTZFdB7teLhC8fCXdvHpI8LFig4uQ==
X-Google-Smtp-Source: AGHT+IEmEGeSj0ItUhWdZ4+rZKrNoNt79ErT5L7ZlfQpFO0iwhAGJbaJLS16ARXT++7hQjKb7rA15w==
X-Received: by 2002:a05:600c:3b23:b0:40e:62d8:3321 with SMTP id
 m35-20020a05600c3b2300b0040e62d83321mr3916930wms.34.1705412484443; 
 Tue, 16 Jan 2024 05:41:24 -0800 (PST)
Received: from [192.168.0.89]
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b0040e7306f655sm9122228wmo.22.2024.01.16.05.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jan 2024 05:41:24 -0800 (PST)
Message-ID: <f6409b43-88f7-4a44-a007-d6686cf11a50@froggi.es>
Date: Tue, 16 Jan 2024 13:41:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Mark ctx as guilty in ring_soft_recovery
 path
Content-Language: en-US
From: Joshua Ashton <joshua@froggi.es>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <20240113140206.2383133-1-joshua@froggi.es>
 <f2153219-e791-4e97-96eb-26094d7acf87@froggi.es>
 <5c99ec8c-142d-4877-9624-c8ce0373fccd@gmx.de>
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
In-Reply-To: <2a9a1a92-a074-456e-8190-3ba0a30d3f30@froggi.es>
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
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Friedrich Vock <friedrich.vock@gmx.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx@lists.freedesktop.org, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>



On 1/16/24 12:24, Joshua Ashton wrote:
> 
> 
> On 1/16/24 07:47, Christian König wrote:
>> Am 16.01.24 um 01:05 schrieb Marek Olšák:
>>> On Mon, Jan 15, 2024 at 3:06 PM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> Am 15.01.24 um 20:30 schrieb Joshua Ashton:
>>>>> On 1/15/24 19:19, Christian König wrote:
>>>>>> Am 15.01.24 um 20:13 schrieb Joshua Ashton:
>>>>>>> On 1/15/24 18:53, Christian König wrote:
>>>>>>>> Am 15.01.24 um 19:35 schrieb Joshua Ashton:
>>>>>>>>> On 1/15/24 18:30, Bas Nieuwenhuizen wrote:
>>>>>>>>>> On Mon, Jan 15, 2024 at 7:14 PM Friedrich Vock
>>>>>>>>>> <friedrich.vock@gmx.de <mailto:friedrich.vock@gmx.de>> wrote:
>>>>>>>>>>
>>>>>>>>>>      Re-sending as plaintext, sorry about that
>>>>>>>>>>
>>>>>>>>>>      On 15.01.24 18:54, Michel Dänzer wrote:
>>>>>>>>>>       > On 2024-01-15 18:26, Friedrich Vock wrote:
>>>>>>>>>>       >> [snip]
>>>>>>>>>>       >> The fundamental problem here is that not telling
>>>>>>>>>> applications that
>>>>>>>>>>       >> something went wrong when you just canceled their work
>>>>>>>>>> midway is an
>>>>>>>>>>       >> out-of-spec hack.
>>>>>>>>>>       >> When there is a report of real-world apps breaking
>>>>>>>>>> because of
>>>>>>>>>>      that hack,
>>>>>>>>>>       >> reports of different apps working (even if it's
>>>>>>>>>> convenient that they
>>>>>>>>>>       >> work) doesn't justify keeping the broken code.
>>>>>>>>>>       > If the breaking apps hit multiple soft resets in a row,
>>>>>>>>>> I've laid
>>>>>>>>>>      out a pragmatic solution which covers both cases.
>>>>>>>>>>      Hitting soft reset every time is the lucky path. Once GPU
>>>>>>>>>> work is
>>>>>>>>>>      interrupted out of nowhere, all bets are off and it might as
>>>>>>>>>> well
>>>>>>>>>>      trigger a full system hang next time. No hang recovery 
>>>>>>>>>> should
>>>>>>>>>> be able to
>>>>>>>>>>      cause that under any circumstance.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I think the more insidious situation is no further hangs but
>>>>>>>>>> wrong results because we skipped some work. That we skipped work
>>>>>>>>>> may e.g. result in some texture not being uploaded or some GPGPU
>>>>>>>>>> work not being done and causing further errors downstream (say if
>>>>>>>>>> a game is doing AI/physics on the GPU not to say anything of
>>>>>>>>>> actual GPGPU work one might be doing like AI)
>>>>>>>>> Even worse if this is compute on eg. OpenCL for something
>>>>>>>>> science/math/whatever related, or training a model.
>>>>>>>>>
>>>>>>>>> You could randomly just get invalid/wrong results without even
>>>>>>>>> knowing!
>>>>>>>> Well on the kernel side we do provide an API to query the result of
>>>>>>>> a submission. That includes canceling submissions with a soft
>>>>>>>> recovery.
>>>>>>>>
>>>>>>>> What we just doesn't do is to prevent further submissions from this
>>>>>>>> application. E.g. enforcing that the application is punished for
>>>>>>>> bad behavior.
>>>>>>> You do prevent future submissions for regular resets though: Those
>>>>>>> increase karma which sets ctx->guilty, and if ctx->guilty then
>>>>>>> -ECANCELED is returned for a submission.
>>>>>>>
>>>>>>> ctx->guilty is never true for soft recovery though, as it doesn't
>>>>>>> increase karma, which is the problem this patch is trying to solve.
>>>>>>>
>>>>>>> By the submission result query API, I you assume you mean checking
>>>>>>> the submission fence error somehow? That doesn't seem very ergonomic
>>>>>>> for a Vulkan driver compared to the simple solution which is to just
>>>>>>> mark it as guilty with what already exists...
>>>>>> Well as I said the guilty handling is broken for quite a number of
>>>>>> reasons.
>>>>>>
>>>>>> What we can do rather trivially is changing this code in
>>>>>> amdgpu_job_prepare_job():
>>>>>>
>>>>>>           /* Ignore soft recovered fences here */
>>>>>>           r = drm_sched_entity_error(s_entity);
>>>>>>           if (r && r != -ENODATA)
>>>>>>                   goto error;
>>>>>>
>>>>>> This will bubble up errors from soft recoveries into the entity as
>>>>>> well and makes sure that further submissions are rejected.
>>>>> That makes sense to do, but at least for GL_EXT_robustness, that will
>>>>> not tell the app that it was guilty.
>>>> No, it clearly gets that signaled. We should probably replace the 
>>>> guilty
>>>> atomic with a calls to drm_sched_entity_error().
>>>>
>>>> It's just that this isn't what Marek and I had in mind for this,
>>>> basically completely forget about AMDGPU_CTX_OP_QUERY_STATE or
>>>> AMDGPU_CTX_OP_QUERY_STATE2.
>>>>
>>>> Instead just look at the return value of the CS or query fence 
>>>> result IOCTL.
>>>>
>>>> When you get an -ENODATA you have been guilty of causing a soft
>>>> recovery, when you get an -ETIME you are guilty of causing a timeout
>>>> which had to be hard recovered. When you get an -ECANCELED you are an
>>>> innocent victim of a hard recovery somebody else caused.
>>>>
>>>> What we haven't defined yet is an error code for loosing VRAM, but that
>>>> should be trivial to do.
>>> So far we have implemented the GPU reset and soft reset, but we
>>> haven't done anything to have a robust system recovery. Under the
>>> current system, things can easily keep hanging indefinitely because
>>> nothing prevents that.
>>>
>>> The reset status query should stay. Robust apps will use it to tell
>>> when they should recreate their context and resources even if they
>>> don't submit anything. Let's fully trust robust apps here. In the
>>> future we might change our mind about that, but for now, let's just
>>> focus on API conformance, and later we can change it as long as we
>>> stay API conformant.
>>>
>>> Non-robust apps must be terminated when they hang or are innocent but
>>> affected. Their existence is a security and usability problem and a
>>> source of frustrations for users. 100% guaranteed system recovery is
>>> impossible if they continue to live.
>>>
>>> IBs should be rejected for all guilty and affected innocent contexts
>>> unconditionally, both robust and non-robust ones, by the kernel.
>>> Userspace only forwards the reset status to apps for robust contexts
>>> and doesn't do anything else, but userspace may decide to terminate
>>> the process if any non-robust context is affected.
>>
>> Yeah, that absolutely works for me.
>>
>> Going to adjust the implementation accordingly.
> 
> Awesome, please CC me know when you have something.
> 
> In the short-term I have changed if (r && r != -ENODATA) to if (r) and 
> that seems to work nicely for me.

One problem with solely relying on the CS submission return value from 
userspace is cancelled syncobj waits.

For example, if we have an application with one thread that makes a 
submission, and then kicks off a vkWaitSemaphores to wait on a semaphore 
on another thread and that submission hangs, the syncobj relating to the 
vkWaitSemaphores should be signalled which is fine, but we need to 
return VK_ERROR_DEVICE_LOST if the context loss resulted in the signal 
for the VkSemaphore.

The way this was previously integrated was with the query thing, which 
as we have established does not provide correct information regarding 
soft recovery at the moment.

Unless you have an alternative for us to get some error out of the 
syncobj (eg. -ENODATA), then right now we still require the query.

I think fixing the -ENODATA reporting back for submit is a good step, 
but I believe we still need the query to report the same information as 
we would have gotten from that here.

Thanks

- Joshie 🐸✨

> 
> - Joshie 🐸✨
> 
>>
>> Christian.
>>
>>>
>>>
>>> Marek
>>
> 

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362164D847
	for <lists+amd-gfx@lfdr.de>; Thu, 15 Dec 2022 10:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3921710E4FF;
	Thu, 15 Dec 2022 09:08:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E8A10E4FF;
 Thu, 15 Dec 2022 09:08:18 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4NXmbF61npz9sVN;
 Thu, 15 Dec 2022 10:07:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1671095257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=clPqPGH3Mpkmc5cVbcyPVBCf2xurUheya+4+qFsCCu8=;
 b=Bb6Ax0JJW3gpm0NsU57H+HZMhXQTm4U7yZZHUsjRGQd4t9Apa7Yz3V+QM59yYI6+gjAr4G
 R28mbnclvSYtCtkrQZOmPPE0i/mgh5uJnIHwZqnLANeuY7aamL0qdiFAFbOirEmMj259DI
 K85b0HwnG5QFqXGhmQYkXlw/Id6Kuh6GkdMsVsxKIED0uUiet0pJhh2qsfurpJpm1yKrjR
 iqR9LgO3Ovx6QonQ+B5hPG6JVcffiRutGmYZvvmevZN0NmdagptLtwxKRvpkl1f/FRQERX
 wn+J8S8y8DET/PGkIEJGgsHjIbomQRow71z/OL0/o5FTmFVsO1hyYq3iFB1zFQ==
Message-ID: <57d2c440-a622-bcff-c3b5-e22404ef7eb6@mailbox.org>
Date: Thu, 15 Dec 2022 10:07:32 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 16/16] drm/amd/display: Don't restrict bpc to 8 bpc
Content-Language: en-CA
To: Alex Deucher <alexdeucher@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20221212182137.374625-1-harry.wentland@amd.com>
 <20221212182137.374625-17-harry.wentland@amd.com>
 <114c2e02-41c8-8576-f88d-1c50f41deb9e@mailbox.org>
 <20221214110128.1cd58dea@eldfell>
 <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CADnq5_M8Z2QRze60AFtmF6jTw8zpTpM-MPPmgejoUCb7Rv1ZrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e104b0be0292e2ada20
X-MBO-RS-META: fra61ypmxrqzc9fsgtoz8dacotosba7a
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 Uma Shankar <uma.shankar@intel.com>, amd-gfx@lists.freedesktop.org,
 Joshua Ashton <joshua@froggi.es>, Vitaly.Prosyak@amd.com
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On 12/14/22 16:46, Alex Deucher wrote:
> On Wed, Dec 14, 2022 at 4:01 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>> On Tue, 13 Dec 2022 18:20:59 +0100
>> Michel Dänzer <michel.daenzer@mailbox.org> wrote:
>>> On 12/12/22 19:21, Harry Wentland wrote:
>>>> This will let us pass kms_hdr.bpc_switch.
>>>>
>>>> I don't see any good reasons why we still need to
>>>> limit bpc to 8 bpc and doing so is problematic when
>>>> we enable HDR.
>>>>
>>>> If I remember correctly there might have been some
>>>> displays out there where the advertised link bandwidth
>>>> was not large enough to drive the default timing at
>>>> max bpc. This would leave to an atomic commit/check
>>>> failure which should really be handled in compositors
>>>> with some sort of fallback mechanism.
>>>>
>>>> If this somehow turns out to still be an issue I
>>>> suggest we add a module parameter to allow users to
>>>> limit the max_bpc to a desired value.
>>>
>>> While leaving the fallback for user space to handle makes some sense
>>> in theory, in practice most KMS display servers likely won't handle
>>> it.
>>>
>>> Another issue is that if mode validation is based on the maximum bpc
>>> value, it may reject modes which would work with lower bpc.
>>>
>>>
>>> What Ville (CC'd) suggested before instead (and what i915 seems to be
>>> doing already) is that the driver should do mode validation based on
>>> the *minimum* bpc, and automatically make the effective bpc lower
>>> than the maximum as needed to make the rest of the atomic state work.
>>
>> A driver is always allowed to choose a bpc lower than max_bpc, so it
>> very well should do so when necessary due to *known* hardware etc.
>> limitations.
>>
> 
> In the amdgpu case, it's more of a preference thing.  The driver would
> enable higher bpcs at the expense of refresh rate and it seemed most
> users want higher refresh rates than higher bpc. 

I wrote the above because I thought that this patch might result in some modes getting pruned because they can't work with the max bpc. However, I see now that cbd14ae7ea93 ("drm/amd/display: Fix incorrectly pruned modes with deep color") should prevent that AFAICT.

The question then is: What happens if user space tries to use a mode which doesn't work with the max bpc? Does the driver automatically lower the effective bpc as needed, or does the atomic commit (check) fail? The latter would seem bad.


> I guess the driver can select a lower bpc at its discretion to produce
> what it thinks is the best default, but what about users that don't want
> the default?

They can choose the lower refresh rate?


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer


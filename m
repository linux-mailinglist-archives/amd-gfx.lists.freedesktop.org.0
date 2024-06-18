Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6446D90D8E9
	for <lists+amd-gfx@lfdr.de>; Tue, 18 Jun 2024 18:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE99710E713;
	Tue, 18 Jun 2024 16:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Kjh5TorH";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E29B10E710;
 Tue, 18 Jun 2024 16:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YJvIf2DDEFs4F7cl6mRoHHDrlRyogLF3aAA6llHTpMM=; b=Kjh5TorHWywtTOKU3DR8seE9DT
 J1P6eLTtgK4qTlj1CMVS13+GAY70esJ3ef2HogKsoiqh3fri7T5xblTJ/6SecVCjcr0bF/SjgDtju
 mxpYCRqVNrSUd8SSb6v3+tn/mh1qzT/vKLbemhu3EWRPIz37DRBDDYNopMWKboku066wF+ZC7lBNH
 /AHAcfHPHXVhRQfCBcsGUxBlUTKyi06lubS4wwy70jCElT81E0XG/+099c4XI1INCXVveu/9F0r0K
 iGa6noh+fZQ0JkimLwpUbtwmoYweHKBhmvzpkKar/2LYRsAfAk+5LzuHq/IW5d5vvZew3yNanZZKG
 b4isgE7A==;
Received: from [177.172.122.99] (helo=[192.168.15.100])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sJbXI-004na1-TW; Tue, 18 Jun 2024 18:18:21 +0200
Message-ID: <fc67b552-6f61-4f30-9e34-dd6b2364d155@igalia.com>
Date: Tue, 18 Jun 2024 13:18:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm: Support per-plane async flip configuration
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Melissa Wen <mwen@igalia.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20240618030024.500532-1-andrealmeid@igalia.com>
 <20240618030024.500532-3-andrealmeid@igalia.com> <878qz2h9pp.fsf@intel.com>
 <CAA8EJpqM4iaG3PKM5c0Op7Y7c1SRDrOCk_oOnwG8YfdCxC8w6g@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CAA8EJpqM4iaG3PKM5c0Op7Y7c1SRDrOCk_oOnwG8YfdCxC8w6g@mail.gmail.com>
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

Em 18/06/2024 07:07, Dmitry Baryshkov escreveu:
> On Tue, 18 Jun 2024 at 12:38, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Tue, 18 Jun 2024, André Almeida <andrealmeid@igalia.com> wrote:
>>> Drivers have different capabilities on what plane types they can or
>>> cannot perform async flips. Create a plane::async_flip field so each
>>> driver can choose which planes they allow doing async flips.
>>>
>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>> ---
>>>   include/drm/drm_plane.h | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
>>> index 9507542121fa..0bebc72af5c3 100644
>>> --- a/include/drm/drm_plane.h
>>> +++ b/include/drm/drm_plane.h
>>> @@ -786,6 +786,11 @@ struct drm_plane {
>>>         * @kmsg_panic: Used to register a panic notifier for this plane
>>>         */
>>>        struct kmsg_dumper kmsg_panic;
>>> +
>>> +     /**
>>> +      * @async_flip: indicates if a plane can do async flips
>>> +      */
>>
>> When is it okay to set or change the value of this member?
>>
>> If you don't document it, people will find creative uses for this.
> 
> Maybe it's better to have a callback instead of a static field? This
> way it becomes clear that it's only relevant at the time of the
> atomic_check().
> 

So we would have something like bool (*async_flip) for struct 
drm_plane_funcs I suppose. Then each driver will implement this function 
and check on runtime if it should flip or not, right?

I agree that it makes more clear, but as far as I can see this is not 
something that is subject to being changed at runtime at all, so it 
seems a bit overkill to me to encapsulate a static information like 
that. I prefer to improve the documentation on the struct member to see 
if this solves the problem. What do you think of the following comment:

/**
  * @async_flip: indicates if a plane can perform async flips. The
  * driver should set this true only for planes that the hardware
  * supports flipping asynchronously. It may not be changed during
  * runtime. This field is checked inside drm_mode_atomic_ioctl() to
  * allow only the correct planes to go with DRM_MODE_PAGE_FLIP_ASYNC.
  */

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C947829B12
	for <lists+amd-gfx@lfdr.de>; Wed, 10 Jan 2024 14:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E6610E0E1;
	Wed, 10 Jan 2024 13:18:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F5C10E0E1;
 Wed, 10 Jan 2024 13:18:01 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 1C8582FC0057;
 Wed, 10 Jan 2024 14:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1704892153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RjmCj0ca8jaa062CnfpuGDxA7/7+921oq64gB2rF+Ig=;
 b=bmxA38PGD1K6FPTSKTedfnYmsEGQy/MDis1bHTG7qt2F6Bkt7VAsjrUQ3P0tRW4d7z3+mA
 701MaIPi4w3uhfMbYOG4k1yqcC5vx9SY+iyX3XK+da1Qt7CN7eAM64ikLSjKcTpwXi2SUM
 5t0Zf0znq0run9e7S5M4qnzgEUgapis=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <92e20f9b-2cbf-4efe-b61b-989da0cc1668@tuxedocomputers.com>
Date: Wed, 10 Jan 2024 14:09:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] drm/uAPI: Add "preferred color format" drm property
 as setting for userspace
Content-Language: en-US
To: Andri Yngvason <andri@yngvason.is>, Maxime Ripard <mripard@kernel.org>
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-6-andri@yngvason.is>
 <qdwv7sagqs5nmmsy5lko5hypldanfodafyzamrs3loj3n7jzlr@n5bacxkknkj4>
 <CAFNQBQzijyE4wR34AOLM45m+ryx128igVKO9zPJ5-M3afFQMxQ@mail.gmail.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <CAFNQBQzijyE4wR34AOLM45m+ryx128igVKO9zPJ5-M3afFQMxQ@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Hi,

Am 10.01.24 um 11:11 schrieb Andri Yngvason:
> Hi,
>
> mið., 10. jan. 2024 kl. 09:27 skrifaði Maxime Ripard <mripard@kernel.org>:
>> On Tue, Jan 09, 2024 at 06:11:02PM +0000, Andri Yngvason wrote:
>>> From: Werner Sembach <wse@tuxedocomputers.com>
>>>
>>> Add a new general drm property "preferred color format" which can be used
>>> by userspace to tell the graphic drivers to which color format to use.
>>>
>>> Possible options are:
>>>      - auto (default/current behaviour)
>>>      - rgb
>>>      - ycbcr444
>>>      - ycbcr422 (not supported by both amdgpu and i915)
>>>      - ycbcr420
>>>
>>> In theory the auto option should choose the best available option for the
>>> current setup, but because of bad internal conversion some monitors look
>>> better with rgb and some with ycbcr444.
>> I looked at the patch and I couldn't find what is supposed to happen if
>> you set it to something else than auto, and the driver can't match that.
>> Are we supposed to fallback to the "auto" behaviour, or are we suppose
>> to reject the mode entirely?
>>
>> The combination with the active output format property suggests the
>> former, but we should document it explicitly.
> It is also my understanding that it should fall back to the "auto"
> behaviour. I will add this to the documentation.

Yes, that was the intention, and then userspace can check, but it wasn't well 
received: https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_964530

Actually a lot of the thoughts that went into the original patch set can be 
found in that topic.

There was another iteration of the patch set that I never finished and sent to 
the LKML because I got discouraged by this: 
https://lore.kernel.org/dri-devel/20210623102923.70877c1a@eldfell/

I can try to dig it up, but it is completely untested and I don't think I still 
have the respective TODO list anymore, so I don't know if it is a better or 
worst starting point than the last iteration I sent to the LKML.

Greetings

Werner

>
> Thanks,
> Andri

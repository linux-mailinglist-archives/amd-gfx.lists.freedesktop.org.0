Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 863092EE930
	for <lists+amd-gfx@lfdr.de>; Thu,  7 Jan 2021 23:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180E86E55E;
	Thu,  7 Jan 2021 22:51:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8C16E55E
 for <amd-gfx@lists.freedesktop.org>; Thu,  7 Jan 2021 22:51:32 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id d8so7937686otq.6
 for <amd-gfx@lists.freedesktop.org>; Thu, 07 Jan 2021 14:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8etBVdqy1PU3Fg+6000Dt+bWabsA9eDlA9n8Xkn/Rps=;
 b=XTxkClgeozn0L0W8Sg6U+YPhEL9rW/XdzJW6Fu4RPbjzApFUaQTCVZRb8y6QLIHZ9B
 Jnpbc7ymuBNgeV875mu0Re5wsTLKTVJzNeNocTdK/ArCWfX7Li/UtCu8XwNublFIdiCl
 ZzJoHgQvi3Suxx4Yd7bDBMt3KD/mXFo57el3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8etBVdqy1PU3Fg+6000Dt+bWabsA9eDlA9n8Xkn/Rps=;
 b=I6yZHjYNKAaCfnrjCv6vtXmbkPLghr45VZeSmmVaEgyFL1D+UjT/p1ifWv0FTjSCgx
 86utUsdFb/mocmbf5Wm8FJ//QYrl82qql3wupGLiLAYb6QS6YLO8X1L3vjHAjLqy/ruC
 f9YP2c7H/n0sx5rP6x07/CbiM6VYqtQEU4Gt3poKKAnmwPS/+2BOLIC/Ta2DybirDkJR
 yWNZncvt/N4oieTWWqROTAEZQOASb2RxYZGYxGVDBtcIcEiH73lDSsrH8U9r2W0KUOmO
 h0iCZFqVx9dLWbQ5eKCzQ/Ey6FIxpspUb/9VL3U8NmABkvlZrbaLUnLdxtfMC2SkA/eZ
 R18g==
X-Gm-Message-State: AOAM533CtGT5HOb9CU8wE5T37snO1+qXclBeEzwXMf1I4InjoqFezbhT
 Bu9z/ZgvQWm9QQ+RnS6TzXgnzqWi5l0BYpX9VBqDtA==
X-Google-Smtp-Source: ABdhPJxBWS+nqRGEj4vO/ZNbUmmmfTauQr9D5dWuWNwolRfJ0+JaKeaqs7kbb3FYEbNQ6qYv49uNiVaVBM46CqJqF8A=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr561915otb.281.1610059891724; 
 Thu, 07 Jan 2021 14:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
 <X/dLdN1z6/Viqy9v@phenom.ffwll.local>
 <CAEsyxyjaYkBzp_nPifhUpUJ=7vJO7MbeimeZM5H13Cta7bj9Ew@mail.gmail.com>
 <CAKMK7uFBrkQhV=-Hqr3EfqAPn2Vu+hM9PVKh290fw2jQJ5TPCA@mail.gmail.com>
 <CAEsyxyihZQNf-_UXeQQ+8XHad226XPMFqoJ9hFfoDae9NVi6pg@mail.gmail.com>
In-Reply-To: <CAEsyxyihZQNf-_UXeQQ+8XHad226XPMFqoJ9hFfoDae9NVi6pg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 7 Jan 2021 23:51:20 +0100
Message-ID: <CAKMK7uGz9pJs+StfaHaxzqrEO3mQdLSrvpZK8ocx1jRUqCMmww@mail.gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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
Cc: zhan.liu@amd.com, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jan 7, 2021 at 7:16 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
>
> On Thu, Jan 7, 2021 at 7:04 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>>
>> On Thu, Jan 7, 2021 at 7:00 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
>> >
>> > On Thu, Jan 7, 2021 at 6:57 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>> >>
>> >> On Sat, Jan 02, 2021 at 04:31:36PM +0100, Mario Kleiner wrote:
>> >> > On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
>> >> > <bas@basnieuwenhuizen.nl> wrote:
>> >> > >
>> >> > > With modifiers one can actually have different format_info structs
>> >> > > for the same format, which now matters for AMDGPU since we convert
>> >> > > implicit modifiers to explicit modifiers with multiple planes.
>> >> > >
>> >> > > I checked other drivers and it doesn't look like they end up triggering
>> >> > > this case so I think this is safe to relax.
>> >> > >
>> >> > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>> >> > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
>> >> > > ---
>> >> > >  drivers/gpu/drm/drm_plane.c | 2 +-
>> >> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> > >
>> >> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
>> >> > > index e6231947f987..f5085990cfac 100644
>> >> > > --- a/drivers/gpu/drm/drm_plane.c
>> >> > > +++ b/drivers/gpu/drm/drm_plane.c
>> >> > > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>> >> > >         if (ret)
>> >> > >                 goto out;
>> >> > >
>> >> > > -       if (old_fb->format != fb->format) {
>> >> > > +       if (old_fb->format->format != fb->format->format) {
>> >> >
>> >> > This was btw. the original way before Ville made it more strict about
>> >> > 4 years ago, to catch issues related to tiling, and more complex
>> >> > layouts, like the dcc tiling/retiling introduced by your modifier
>> >> > patches. That's why I hope my alternative patch is a good solution for
>> >> > atomic drivers while keeping the strictness for potential legacy
>> >> > drivers.
>> >>
>> >> Yeah this doesn't work in full generality, because hw might need to do a
>> >> full modeset to do a full modeset to reallocate resources (like scanout
>> >> fifo space) if the format changes.
>> >>
>> >> But for atomic drivers that should be caught in ->atomic_check, which
>> >> should result in -EINVAL, so should do the right thing. So it should be
>> >> all good, but imo needs a comment to explain what's going on:
>> >>
>> >>         /*
>> >>          * Only check the FOURCC format code, excluding modifiers. This is
>> >>          * enough for all legacy drivers. Atomic drivers have their own
>> >>          * checks in their ->atomic_check implementation, which will
>> >>          * return -EINVAL if any hw or driver constraint is violated due
>> >>          * to modifier changes.
>> >>          */
>> >>
>> >> Also can you pls cc: intel-gfx to get this vetted by the intel-gfx ci?
>> >>
>> >> With that:
>> >>
>> >> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> >>
>> >
>> > Ah, my "atomic expert", posting simultaneously with myself :). Happy new year. Opinions on my variant, just replied a minute ago?
>>
>> Full disclosure, Ville wanted to do something similar since forever
>> I'm not a huge fan of removing limitations of legacy ioctls. Worst
>> case we break something, best case no gain in features since why don't
>> you just use atomic. Since this (amdgpu modifiers) broke something we
>> have to fix it, hence I'd go with the more minimal version from Bas
>> here.
>>
>
> Fair point. Means though that somebody will have to convert many user-space clients, e.g., all OSS Vulkan drivers. And XOrg could not do that, as the kernel uabi even blocks use of atomic drmSetClientCap(...ATOMIC...) for any process whose taskname starts with 'X', as a workaround for a modesetting-ddx with broken atomic implementation. So at least for (pun ahead) "X" applications, atomic modesetting is not an option.

If you ask for atomic v2 in the setclientcap ioctl you'll get atomic
even if you're X. The issue is no one's caring enough to fix it up
Xorg atomic support to make that happen.

And yes the vulkan drivers should attempt at least some atomic, the
reason for that was that amdgpu didn't have atomic back when the
original code was typed. Maybe it'll happen with more modifier use,
now that both amdgpu and i915 support them.
-Daniel

> For my use cases, X11/XOrg native is still the only display server capable enough to fulfill the needs, although I'm mixing in a bit of Vulkan/WSI/DirectDisplay for direct DRM/KMS access to work around some limitations, e.g., to get HDR or fp16 support.
>
>> But in general your patch should be correct too.
>> -Daniel
>>
>
> Thanks for the feedback. I rest my case.
> -mario
>
>>
>> >
>> > thanks,
>> > -mario
>> >
>> >> >
>> >> > -mario
>> >> >
>> >> > >                 DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
>> >> > >                 ret = -EINVAL;
>> >> > >                 goto out;
>> >> > > --
>> >> > > 2.29.2
>> >> > >
>> >>
>> >> --
>> >> Daniel Vetter
>> >> Software Engineer, Intel Corporation
>> >> http://blog.ffwll.ch
>>
>>
>>
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBB063D78F
	for <lists+amd-gfx@lfdr.de>; Wed, 30 Nov 2022 15:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38E510E46C;
	Wed, 30 Nov 2022 14:06:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B0F10E46A
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Nov 2022 14:06:15 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id k7so16753962pll.6
 for <amd-gfx@lists.freedesktop.org>; Wed, 30 Nov 2022 06:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+w1CB5xGwRz+sGqhDvoeBpotJLJv3AvOhdkFgNyxWw=;
 b=MD5v08Ibj5XNOKlKXscF8lS0TL4Amkkm0ESrPONzMB7T7EefzMF8nPzvfw10V8JfHL
 0CtMsriBCkR4v6Qult+ueTCvoBGhmw+xEBqjOqTaPht1S9JrQ8XYAWWMIlqe8UooRrYJ
 Z1nwazl7vUaqagUTf2w90722cXkh3p83UyiZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+w1CB5xGwRz+sGqhDvoeBpotJLJv3AvOhdkFgNyxWw=;
 b=xtbZvn449IFilUzjZz5OSMWRCLfdl4aq99YPCefiNvb8qPueDL+uy80a5zhZ12PGIb
 uLZuEbluigixGoki5bp0LaHLFeQeWA/5FBAQTjOU5NFgib392hNVgyEL7Tva4SUEuC/r
 icOlW94FoWMSkwNiGwtGpuCEooR91OlwS7ZAXy0zNsfo6oaXXJr3oXHiGFWoBEVMDk0M
 w/VnIPWTtcThVX32mesRoP0ykRGWZaibSY2IUkS3MuqOF7dSIaWWtQ8meD1CaH+xSkq8
 td3/HfnBuVJjMeJjRoYvBBtki5X9m96V403iYKG9YuG7n11ayOiuVt1T9TkUCIyjcfRR
 wvDw==
X-Gm-Message-State: ANoB5pkYTmKHBZk8Fm6892ikNa4m18XngdZRhIS7VL9yCF8H+1VLu6ji
 hNZdlMKMhKBGaxZz7ACmBtahvGqkyNWeOJUrBu2n/A==
X-Google-Smtp-Source: AA0mqf6Cge/4u+9gze2KtWfVZZyLFzbW2NVD+mbREm2cL/+UzrqplcEE41lrFeXbYJn9cZjDjnXT/j+9vxjPiXW1DwQ=
X-Received: by 2002:a17:902:820c:b0:189:505b:73dd with SMTP id
 x12-20020a170902820c00b00189505b73ddmr35150355pln.143.1669817175110; Wed, 30
 Nov 2022 06:06:15 -0800 (PST)
MIME-Version: 1.0
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-7-christian.koenig@amd.com>
 <d92312af-3c84-8bd9-108b-719fb1ec3a6b@linux.intel.com>
 <CAM0jSHMKBb3orp8Ez4sC8TNcjPZF9y-4e12Jy6SPqbJonhYVhw@mail.gmail.com>
 <d03545c9-d0cb-5bdb-24e8-9eadcda51b83@linux.intel.com>
In-Reply-To: <d03545c9-d0cb-5bdb-24e8-9eadcda51b83@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Nov 2022 15:06:03 +0100
Message-ID: <CAKMK7uHf1yvpS5JWzF2JASkXuZwyvpzWw66w9sYe19_+VqMHeA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/9] drm/i915: stop using ttm_bo_wait
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.william.auld@gmail.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 14:03, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
> On 29/11/2022 18:05, Matthew Auld wrote:
> > On Fri, 25 Nov 2022 at 11:14, Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> + Matt
> >>
> >> On 25/11/2022 10:21, Christian K=C3=B6nig wrote:
> >>> TTM is just wrapping core DMA functionality here, remove the mid-laye=
r.
> >>> No functional change.
> >>>
> >>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 9 ++++++---
> >>>    1 file changed, 6 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/dr=
m/i915/gem/i915_gem_ttm.c
> >>> index 5247d88b3c13..d409a77449a3 100644
> >>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> >>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> >>> @@ -599,13 +599,16 @@ i915_ttm_resource_get_st(struct drm_i915_gem_ob=
ject *obj,
> >>>    static int i915_ttm_truncate(struct drm_i915_gem_object *obj)
> >>>    {
> >>>        struct ttm_buffer_object *bo =3D i915_gem_to_ttm(obj);
> >>> -     int err;
> >>> +     long err;
> >>>
> >>>        WARN_ON_ONCE(obj->mm.madv =3D=3D I915_MADV_WILLNEED);
> >>>
> >>> -     err =3D ttm_bo_wait(bo, true, false);
> >>> -     if (err)
> >>> +     err =3D dma_resv_wait_timeout(bo->base.resv, DMA_RESV_USAGE_BOO=
KKEEP,
> >>> +                                 true, 15 * HZ);
> >>
> >> This 15 second stuck out a bit for me and then on a slightly deeper lo=
ok
> >> it seems this timeout will "leak" into a few of i915 code paths. If we
> >> look at the difference between the legacy shmem and ttm backend I am n=
ot
> >> sure if the legacy one is blocking or not - but if it can block I don'=
t
> >> think it would have an arbitrary timeout like this. Matt your thoughts=
?
> >
> > Not sure what is meant by leak here, but the legacy shmem must also
> > wait/block when unbinding each VMA, before calling truncate. It's the
>
> By "leak" I meant if 15s timeout propagates into some code paths visible
> from userspace which with a legacy backend instead have an indefinite
> wait. If we have that it's probably not very good to have this
> inconsistency, or to apply an arbitrary timeout to those path to start wi=
th.
>
> > same story for the ttm backend, except slightly more complicated in
> > that there might be no currently bound VMA, and yet the GPU could
> > still be accessing the pages due to async unbinds, kernel moves etc,
> > which the wait here (and in i915_ttm_shrink) is meant to protect
> > against. If the wait times out it should just fail gracefully. I guess
> > we could just use MAX_SCHEDULE_TIMEOUT here? Not sure if it really
> > matters though.
>
> Right, depends if it can leak or not to userspace and diverge between
> backends.

Generally lock_timeout() is a design bug. It's either
lock_interruptible (or maybe lock_killable) or try_lock, but
lock_timeout is just duct-tape. I haven't dug in to figure out what
should be here, but it smells fishy.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

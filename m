Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D752B9F77E9
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Dec 2024 10:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E7B10ECDB;
	Thu, 19 Dec 2024 09:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="RsZB7YuI";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B045310E48B
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Dec 2024 09:02:39 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id
 d75a77b69052e-467a6ecaa54so4069461cf.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Dec 2024 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1734598958; x=1735203758;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UGBdkHbHWWx6tKPaqlp7YEXq9bf4pzV6475SXaqFuWM=;
 b=RsZB7YuITCJZJJVZBnA1ISJ2ra/UPvM0uJNCl6Qbnds0GYnjBhi9xfMhrk33llH3eK
 0VXQb7VZErldf6iHL53QjP9U5h3fO8qDU2mbCjQFMJzvHh0Hz9Hic6yvQi40UJYf/Whi
 G2awr7Tb0GrvDMnLg58Qkj7BZNU4eDSco9eQJf6B8m8Zc8zz37Vr3on0YZKQzh8dyqWn
 uhXrsqy1el8HKjVUY6V4mfDh2nTTzsQIddEno/Ew7XMPkn4N/WPqKgmweGFpMlbkUJf/
 vYjc84UJmL3FjH9urYMSaj3ENgphfnCX5HTT3L/P1TDfHU8P/RXX2t0jWJRG+SOwZA9g
 dZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734598958; x=1735203758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UGBdkHbHWWx6tKPaqlp7YEXq9bf4pzV6475SXaqFuWM=;
 b=frMnOSuUTl/rwIiLSNaU4irls68F+Xrde2B5/aPy6+28XfGQ1vcV387F3y6heS6PCl
 Bme2kb4OIxSfW58erzAptCsWVeNGVcOcoE1XCtViw0wJTyUmb/Nw6M4VTSYn8LQtl8IU
 iqnRT48T9Y/k+7Y/GZAZMe8lhyhftIodVLyJsv4rT2oBMVSs0F3CXalB0UzDA638kJRt
 HaKgQK21ZMA8/pxohZFgF57HAqrJPQcz67c7MADPOisBze7z7EKQewq+vHnaGJLe30qW
 DZ5JUrp2TzjRAB9EJWQyDNZW17/J7fUIDy74pVoop3BG3KEi3/wl6ZtF/6X0ogxtZssK
 NfkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKwsacx9q3khro38inw7jjar54ZJ6Llg4otkfmfMimMrLH59fcM5G/BqGSh0FhER/XRKxxo39N@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9rrwJI6cSXwN/hgjQvwR33lhjTU6W4pcoCYoyY//PKsp/In6T
 5S0csZi604t6eLo5zV6aZbisw68dCXFbeKF7F7FG6HkgZV6bGKUHLJE5NMqMfyysBecf/fHUM9z
 eznEOZfx+L2IrHx+SOuDBUEq13RISIvTV0+MrcA==
X-Gm-Gg: ASbGnct5IQ88+5pov718zyvXu4uCQOeGn4Fp4UbUwgpI44Yd/eDHp3pHkLIbj2+b39i
 8aD8yE54tGRXYybpXYPq0b3pvXfXZ++MzLPs=
X-Google-Smtp-Source: AGHT+IGBFH/WiWhnDSZ8nrPyrhHhIli8uuLNHFDSBoIGUMDGKPtAAXcL9e93BYBuu4PB7YVCweVDNItdaZqXDAXTifc=
X-Received: by 2002:a05:622a:2291:b0:46a:3579:d137 with SMTP id
 d75a77b69052e-46a3579d38bmr63001361cf.43.1734598958286; Thu, 19 Dec 2024
 01:02:38 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
In-Reply-To: <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 19 Dec 2024 09:02:27 +0000
Message-ID: <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Brian Starkey <brian.starkey@arm.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 18 Dec 2024 at 10:32, Brian Starkey <brian.starkey@arm.com> wrote:
> On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
> > For that reason I think linear modifiers with explicit pitch/size
> > alignment constraints is a sound concept and fits into how modifiers work
> > overall.
>
> Could we make it (more) clear that pitch alignment is a "special"
> constraint (in that it's really a description of the buffer layout),
> and that constraints in-general shouldn't be exposed via modifiers?

It's still worryingly common to see requirements for contiguous
allocation, if for no other reason than we'll all be stuck with
Freescale/NXP i.MX6 for a long time to come. Would that be in scope
for expressing constraints via modifiers as well, and if so, should we
be trying to use feature bits to express this?

How this would be used in practice is also way too underdocumented. We
need to document that exact-round-up 64b is more restrictive than
any-multiple-of 64b is more restrictive than 'classic' linear. We need
to document what people should advertise - if we were starting from
scratch, the clear answer would be that anything which doesn't care
should advertise all three, anything advertising any-multiple-of
should also advertise exact-round-up, etc.

But we're not starting from scratch, and since linear is 'special',
userspace already has explicit knowledge of it. So AMD is going to
have to advertise LINEAR forever, because media frameworks know about
DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
that the buffer is linear. That and not breaking older userspace
running in containers or as part of a bisect or whatever.

There's also the question of what e.g. gbm_bo_get_modifier() should
return. Again, if we were starting from scratch, most restrictive
would make sense. But we're not, so I think it has to return LINEAR
for maximum compatibility (because modifiers can't be morphed into
other ones for fun), which further cements that we're not removing
LINEAR.

And how should allocators determine what to go for? Given that, I
think the only sensible semantics are, when only LINEAR has been
passed, to pick the most restrictive set possible; when LINEAR
variants have been passed as well as LINEAR, to act as if LINEAR were
not passed at all.

Cheers,
Daniel

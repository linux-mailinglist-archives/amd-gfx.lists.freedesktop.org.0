Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D1027D20B
	for <lists+amd-gfx@lfdr.de>; Tue, 29 Sep 2020 17:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB0F6E1BB;
	Tue, 29 Sep 2020 15:02:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0A06E1BB
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 15:02:26 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v12so5160457wmh.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 29 Sep 2020 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pgg6DxwE1I4JGt+70HP+j3/vuk+X/RQqY6HpLPNPtc0=;
 b=S0a/7kP2016HZhMm/5HbSr+FOJxdCd9LB/vmy6H77cz8ZjsTCJaXtu4tG++ATi9BxC
 3/4ZrC21xU2X64hSlNTUSMMEf9VHOyRmqjHtMau368tviop/tPrnoldUA/9XtI/94FzZ
 FEJ8DmzmYqBY32aEB6creDrSFQVjFAN7vqDTvifpIJkmeJ65NQNZHia07f9PsurSlnhx
 ngKpIozbTDQDY1ToHN6tBrj5ZygLOfqOdQxRUp0Yjr1lHkJvtx6nCqNYX2r1AgWn0M4u
 T42d1cc9VdItq0/Rz8sRgOVxVaffGBZeD6z3Fq3U6+/V8tMmmcaynnk5suUtSPOb2DoW
 y3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pgg6DxwE1I4JGt+70HP+j3/vuk+X/RQqY6HpLPNPtc0=;
 b=o+S2bzAr+XyIa3SVGHhiXFSedQSy1QInyeo2558pqU4khR496aldFOhqvkV1Eaun8+
 LOtEM7BXhjP5B7BoIhQkktmXebn6STh4acXmS12UNjxYg2kMTc80hIYYrwDCJGRz88uH
 hQSIHWVlKMlXGwyioQzXrbgqabCpRIy2Ao48wR+Mv2YshSw9akX2QyDCwNyV8k+1j8xg
 szZ/4OyH4CP5+Rzi0dd+ZuPIWT4apfLIeq2uSS+euAxToGXG7qs8JHJdWAR+S09BAB3U
 SDUcGCcy1MBrf7aahKSq6RuFDtIASseAW6DiVvtsp3Ydouv5pgJJun6q3kLtwoXeKXxW
 vPcQ==
X-Gm-Message-State: AOAM5304w7/WCgRJmxaKCuGHiuj8kjEe+J5h6EINGsvOlnBpLpcikXQR
 y5zWlLUB2ideMo0nWRrHgYHSji3GE1aokFZny/E=
X-Google-Smtp-Source: ABdhPJxSOob8yfkHs48u737EYpupnlS84SA0+hxm/GNyFKvdvKo2G49ZUXzcW+yItY34wnTayLdCSowYkBDwqIuJODA=
X-Received: by 2002:a7b:c090:: with SMTP id r16mr5164971wmh.56.1601391745572; 
 Tue, 29 Sep 2020 08:02:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200925201029.1738724-1-alexander.deucher@amd.com>
 <20200925201029.1738724-9-alexander.deucher@amd.com>
 <3623dc99-c36d-d585-d5c7-6ddfe45005f0@amd.com>
In-Reply-To: <3623dc99-c36d-d585-d5c7-6ddfe45005f0@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 29 Sep 2020 11:02:14 -0400
Message-ID: <CADnq5_P42Fo_hVOYJOE-pooYBLi5uD3iVYG4h7vhLAKER9Udfw@mail.gmail.com>
Subject: Re: [PATCH 09/45] drm/amdgpu: use gpu virtual address for interrupt
 packet write space for vangogh
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 4:57 PM Luben Tuikov <luben.tuikov@amd.com> wrote:
>
> On 2020-09-25 4:09 p.m., Alex Deucher wrote:
> > From: Huang Rui <ray.huang@amd.com>
> >
> > The interrupts are not stable while uses guest physical address (GPA)
> > for interrupt packet write space even on direct loading case.
> >
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/navi10_ih.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> > index ce4a974ab777..b66414998c90 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
> > @@ -661,7 +661,10 @@ static int navi10_ih_sw_init(void *handle)
> >       /* use gpu virtual address for ih ring
> >        * until ih_checken is programmed to allow
> >        * use bus address for ih ring by psp bl */
> > -     use_bus_addr =
> > +     if (adev->flags & AMD_IS_APU)
> > +             use_bus_addr = false;
> > +     else
> > +             use_bus_addr =
> >               (adev->firmware.load_type == AMDGPU_FW_LOAD_PSP) ? false : true;
>
> Previously to this patch, as a one-liner, it made sense to use a ternary expression,
> but adding the if-conditional, perhaps a more readable way would be:
>
> if (adev->flags & AMD_IS_APU ||
>     adev->firmware.load_type == AMDGPU_FW_LOAD_PSP)
>         use_bus_addr = false;
> else
>         use_bus_addr = true;
>

Updated.  Thanks!

Alex


> Regards,
> Luben
>
> >       r = amdgpu_ih_ring_init(adev, &adev->irq.ih, 256 * 1024, use_bus_addr);
> >       if (r)
> >
>
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

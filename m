Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3751295266
	for <lists+amd-gfx@lfdr.de>; Wed, 21 Oct 2020 20:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0EE56F49F;
	Wed, 21 Oct 2020 18:46:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625D46F49F
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Oct 2020 18:46:57 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id o70so2673666ybc.1
 for <amd-gfx@lists.freedesktop.org>; Wed, 21 Oct 2020 11:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q5yXkYMCEngCv9aH73zDP/f8vAlktYMSygvVDoymIZk=;
 b=mSUFRvsRuCPebJ459Z1JK3aJPCep5j79YVTNRUl8pPsAB///XdcsjyAWFkwfqELZOz
 +SBrcEi4bt8E650YrJYgCRHiamA3chHr9NtA2En/XvxZU+lQLwQ7dWttpx/VeOv8Eg+c
 +K8Hvf/0mIWhLsZULNlF2yI1KY2OvtVV8btnPw7arbvqFDOHJDaQ7Hb5efWaLIpkmptV
 RKQ4+ay3vwaoQzQs+9TkZchZqYiXPBSTj2SHbkNrS7ehmAyu7x+KsJ1IORCkgh58NzJr
 O7A2ui3zKHDNtNXnNqwR2UD+InaWYO8ev8RcBfYrBgjWFED3wxMvVGHrUrZAnjtldY4f
 uWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q5yXkYMCEngCv9aH73zDP/f8vAlktYMSygvVDoymIZk=;
 b=WjYaomv9K0t9TsPuP8RWijWDIWBqL2Np22w7URK6xzoSKDc2Cqx7CJLkmx1LPsL8B6
 4SDbdq5IKftFDzhBVZtwEdZ61I8uDIiXV4lq3Um4J3/dBAyDdz3iRNVsbo71JXrn+J5K
 hRN5mc+CqldXbTE7WknYhW/5p4/Q3H2nklgtHDQllHpHlZbOGjPswyPUf/JvBl+sdS46
 YbZ3hQfESFiuj5zIG34mNy/c3AKcmK6zK49zs4uL+OUBrzk553FoX87YY1s962MBImgK
 AaSgyF1zo/EOYAL6nvcQlAtY26C0h1phB2QmWgthr9qHEm73JjoT/o+E5vndLrutzf9e
 Kw/g==
X-Gm-Message-State: AOAM533zsBSRw+R/wzdwR43QUvMm0bT5ZW7BQtjuJ1smeZ1WpIsY57oH
 QxIOKqU6P1rJh2mM3CDeaz2XSQOO4l4LpCidUSE=
X-Google-Smtp-Source: ABdhPJzgE+1YoCIDhjTE6WC0XNIpcv0Wne2t1TToTvrQaKxKypOwUQfUcVXnUD2/G3ZXx1e5gR9m4EiTP7VdbkMdeD0=
X-Received: by 2002:a25:511:: with SMTP id 17mr7618801ybf.296.1603306016610;
 Wed, 21 Oct 2020 11:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201021064455.14935-1-kenneth.feng@amd.com>
 <CADnq5_PdS8M3i9uQ3JTUE-idGJxVCk_k5N=Sgvsj4VJGFKn_vA@mail.gmail.com>
 <CADnq5_NLyQ2jOW0ZkYMXcAX-snqHvUzNRYtrDRZbhN7qe0_5Zg@mail.gmail.com>
In-Reply-To: <CADnq5_NLyQ2jOW0ZkYMXcAX-snqHvUzNRYtrDRZbhN7qe0_5Zg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Oct 2020 14:46:45 -0400
Message-ID: <CADnq5_M_ry9EHp2b1ycBzD4oTsfVJxFtSGoRvq2EfJiN6Qczmg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix the wrong fan speed in fan1_input
To: Kenneth Feng <kenneth.feng@amd.com>
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
Cc: Likun Gao <likun.gao@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 9:40 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Wed, Oct 21, 2020 at 9:01 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Wed, Oct 21, 2020 at 2:45 AM Kenneth Feng <kenneth.feng@amd.com> wrote:
> > >
> > > fix the wrong fan speed in fan1_input when the fan control mode is manual.
> > > the fan speed value is not correct when we set manual mode to fan1_enalbe - 1.
> > > since the fan speed in the metrics table always reflects the real fan speed,we
> > > can fetch the fan speed for both auto and manual mode.
> > >
> > > Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
> >
> > NACK.  At least on the navi boards I have, the metrics table fan speed
> > reads back 0 when the fan is in manual mode.  That's why I changed
> > this in the first place.
>
> Nevermind, I was thinking about navi1x.  If this is working correctly
> on sienna cichlid, please ignore me.

That said, I don't see why the current code should not work.  Maybe a
bug elsewhere?  Is smu_v11_0_get_fan_speed_rpm() incorrect for sienna
cichlid?

Alex

>
> Alex
>
>
> >
> > Alex
> >
> >
> > > ---
> > >  .../gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 11 +++--------
> > >  1 file changed, 3 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> > > index 496abc31b07e..27b6cade9ade 100644
> > > --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> > > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
> > > @@ -1171,14 +1171,9 @@ static int sienna_cichlid_get_fan_speed_rpm(struct smu_context *smu,
> > >         if (!speed)
> > >                 return -EINVAL;
> > >
> > > -       switch (smu_v11_0_get_fan_control_mode(smu)) {
> > > -       case AMD_FAN_CTRL_AUTO:
> > > -               return sienna_cichlid_get_smu_metrics_data(smu,
> > > -                                                          METRICS_CURR_FANSPEED,
> > > -                                                          speed);
> > > -       default:
> > > -               return smu_v11_0_get_fan_speed_rpm(smu, speed);
> > > -       }
> > > +       return sienna_cichlid_get_smu_metrics_data(smu,
> > > +                                               METRICS_CURR_FANSPEED,
> > > +                                               speed);
> > >  }
> > >
> > >  static int sienna_cichlid_get_fan_parameters(struct smu_context *smu)
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > amd-gfx mailing list
> > > amd-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

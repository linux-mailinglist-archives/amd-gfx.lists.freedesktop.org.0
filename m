Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C5830254
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Jan 2024 10:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9089B10E1AF;
	Wed, 17 Jan 2024 09:31:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A463310E541
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jan 2024 14:13:20 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc21d7a7042so1139943276.2
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jan 2024 06:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yngvason.is; s=google; t=1705414340; x=1706019140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9gCKsoJIp890TMevRWkiJ5yhUQIvz900NU/IXPPBb5k=;
 b=YK51VzxMkCLspaYYG0vg0ThRHcW9FozC5/1XxiRakTlYeddN1cbqaPw8sT/XWf1Kla
 b5ttDr328QJOmH9sulXFgJEk9MA+iDnM8pFOoK/ydpayif2gJGEp+LENuwRzPnMShuql
 oPmtyA/XGs8v594YaMxsF1qtic8Y5uBkOUFyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705414340; x=1706019140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gCKsoJIp890TMevRWkiJ5yhUQIvz900NU/IXPPBb5k=;
 b=xJHA6k9OEf2aWDhUhFaIaSxRl2yKb48OEBhLO5vnwd2I8agp5Kq3W2H4Ee4dg4DMhE
 I0IOC+2jaYMKxmcSJQUqm1A8omtTrRg9wPYvbBhkXFaoZXfRTIIoPzNIVDIjVXpDCSH5
 KmOT3h0YAt67XgHiZ5Of2iwUrZSo9S+kXjNlmSaEKEZMJbUOCOLPhT9EtYql3B3GSC0m
 0xW5Nka4XB7ZdviB850hbiN7WPVICV7RiMqEBaK8TQaWYKeqJUQaOavGJGO4WHkyQJ2m
 wnqO9AF7iCX/1zhL8FgVq5SvqqUHaTFTirSTDt6Xan2DRmuDisWhdlMbm/Ii6EIDdYmN
 AGYg==
X-Gm-Message-State: AOJu0YyF8mzaOFhFc33+/fqUcciI39RcbmgsM3LRdngyH54Ni/wA3u9s
 0r1FYUq5eMevwvCH2RnPOle570XU8orL9Mm42JFuZpY6RxIAAw==
X-Google-Smtp-Source: AGHT+IE41A58zXOP4mN6YBTW2CozoInidfluxDAZAPGf3XWYIJx5iW5A7pw47X0/O2DADgCiiAJSZrcdEWBROikbKfY=
X-Received: by 2002:a05:6902:511:b0:dbd:231:1d67 with SMTP id
 x17-20020a056902051100b00dbd02311d67mr3842729ybs.104.1705414339805; Tue, 16
 Jan 2024 06:12:19 -0800 (PST)
MIME-Version: 1.0
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
 <20240116114235.GA311990@toolbox>
 <CAFNQBQz3TNj_7BSmFw4CFMNuR4B+1d+y3f058s+rzTuzdYogqA@mail.gmail.com>
 <20240116132918.GB311990@toolbox>
In-Reply-To: <20240116132918.GB311990@toolbox>
From: Andri Yngvason <andri@yngvason.is>
Date: Tue, 16 Jan 2024 14:11:43 +0000
Message-ID: <CAFNQBQyfWmfu5T7bgZDZFGfyhsxQi7YXmY_wPc9Y+mm5iSspXQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property as
 setting for userspace
To: Sebastian Wick <sebastian.wick@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 17 Jan 2024 09:31:07 +0000
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
Cc: dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Werner Sembach <wse@tuxedocomputers.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@gmail.com>, intel-gfx@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

=C3=BEri., 16. jan. 2024 kl. 13:29 skrifa=C3=B0i Sebastian Wick
<sebastian.wick@redhat.com>:
>
> On Tue, Jan 16, 2024 at 01:13:13PM +0000, Andri Yngvason wrote:
[...]
> > =C5=9Fri., 16. jan. 2024 kl. 11:42 skrifa=C4=9Fi Sebastian Wick
> > <sebastian.wick@redhat.com>:
> > >
> > > On Mon, Jan 15, 2024 at 04:05:52PM +0000, Andri Yngvason wrote:
> > > > From: Werner Sembach <wse@tuxedocomputers.com>
> > > >
> > > > Add a new general drm property "force color format" which can be us=
ed
> > > > by userspace to tell the graphics driver which color format to use.
> > >
> > > I don't like the "force" in the name. This just selects the color
> > > format, let's just call it "color format" then.
> > >
> >
> > In previous revisions, this was "preferred color format" and "actual
> > color format", of which the latter has been dropped. I recommend
> > reading the discussion for previous revisions.
>
> Please don't imply that I didn't read the thread I'm answering to.
>
> > There are arguments for adding "actual color format" later and if it
> > is added later, we'd end up with "color format" and "actual color
> > format", which might be confusing, and it is why I chose to call it
> > "force color format" because it clearly communicates intent and
> > disambiguates it from "actual color format".
>
> There is no such thing as "actual color format" in upstream though.
> Basing your naming on discarded ideas is not useful. The thing that sets
> the color space for example is called "Colorspace", not "force
> colorspace".
>

Sure, I'm happy with calling it whatever people want. Maybe we can
have a vote on it?

> > [...]
> > > > @@ -1396,6 +1404,15 @@ static const u32 dp_colorspaces =3D
> > > >   *   drm_connector_attach_max_bpc_property() to create and attach =
the
> > > >   *   property to the connector during initialization.
> > > >   *
> > > > + * force color format:
> > > > + *   This property is used by userspace to change the used color f=
ormat. When
> > > > + *   used the driver will use the selected format if valid for the=
 hardware,
> > >
> > > All properties are always "used", they just can have different values=
.
> > > You probably want to talk about the auto mode here.
> >
> > Maybe we can say something like: If userspace does not set the
> > property or if it is explicitly set to zero, the driver will select
> > the appropriate color format based on other constraints.
>
> The property can be in any state without involvement from user space.
> Don't talk about setting it, talk about the state it is in:
>
>   When the color format is auto, the driver will select a format.
>

Ok.

> > >
> > > > + *   sink, and current resolution and refresh rate combination. Dr=
ivers to
> > >
> > > If valid? So when a value is not actually supported user space can st=
ill
> > > set it? What happens then? How should user space figure out if the
> > > driver and the sink support the format?
> >
> > The kernel does not expose this property unless it's implemented in the=
 driver.
>
> If the driver simply doesn't support *one format*, the enum value for
> that format should not be exposed, period. This isn't about the property
> on its own.

Right, understood. You mean that enum should only contain values that
are supported by the driver.

>
> > This was originally "preferred color format". Perhaps the
> > documentation should better reflect that it is now a mandatory
> > constraint which fails the modeset if not satisfied.
>
> That would definitely help.
>
> > >
> > > For the Colorspace prop, the kernel just exposes all formats it suppo=
rts
> > > (independent of the sink) and then makes it the job of user space to
> > > figure out if the sink supports it.
> > >
> > > The same could be done here. Property value is exposed if the driver
> > > supports it in general, commits can fail if the driver can't support =
it
> > > for a specific commit because e.g. the resolution or refresh rate. Us=
er
> > > space must look at the EDID/DisplayID/mode to figure out the supporte=
d
> > > format for the sink.
> >
> > Yes, we can make it possible for userspace to discover which modes are
> > supported by the monitor, but there are other constraints that need to
> > be satisfied. This was discussed in the previous revision.
>
> I mean, yes, that's what I said. User space would then only be
> responsible for checking the sink capabilities and the atomic check
> would take into account other (non-sink) constraints.

Since we need to probe using TEST_ONLY anyway, we'll end up with two
mechanisms to do the same thing where one of them depends on the other
for completeness.

>
> > In any case, these things can be added later and need not be a part of
> > this change set.
>
> No, this is the contract between the kernel and user space and has to be
> figured out before we can merge new uAPI.
>
> >
> > [...]
> >

Thanks,
Andri

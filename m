Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CDFBF2A8D
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Oct 2025 19:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B45610E0ED;
	Mon, 20 Oct 2025 17:15:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nHc3dbIv";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB74B10E0E7
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Oct 2025 17:15:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ABC0748DEA
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Oct 2025 17:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4A4C4CEF9
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Oct 2025 17:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760980544;
 bh=/Bo/w1IWbEdCpFqdwJJwvlPplSNhRb4GDvaPtHIqS2g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nHc3dbIvnlHbK7ZAppgVog5WwvJKdAazmoIWifi15l+mDRzKJpi0KlBJiH1SGt8lt
 s0NeCU0/LxE1Sjll4pc2MWoc8wFPPgZilDEWz/L9O+lX37FT6d+H5rwwMXSDYodmfs
 FWxP5W3j5W3WazmizDUU7YNQ5+OyOHBCmj+hivaZ4Kgx6jCz6nzYLgLhoMw3d4r/1B
 8SIq1GnmnXKWqQW+8pF/q95iJgURGYqtzvwp4TgMvS5h5NRzswWLl/tX8UoJ2bvYVF
 yzm++abYlAGpsZB39vBrEJrvvpr1yOjxdYKqqN/KwZlR3xKTItOhukxBQAOTKFaxVt
 VQWyOmQSxBYEg==
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-444d3df546bso1023552b6e.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Oct 2025 10:15:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXFlY+kC1r+p02JV0u40wPO9lE9KIaD0NrURk+Qh7ZO63+Q6XUfxV3LmKx1qEAB5b95wbTp7pZ1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAoQxI33vmWprukAvUfTedxtJYsikldZ/Vsz3Mn1Y32xzQo2zg
 T95YkzAzYrQ5IFN04VSnHaaU80mHz6DVTDo3Oz5JC3T9/Hm9mBHHGzT+WxbczB1rqjTK885G44F
 Zz8zweg+reoicy1H8+SCEldmhCs3V77k=
X-Google-Smtp-Source: AGHT+IFfB91PdM3JAdN1gbGd5x2R0NfKffZhpjnLvP2/4hItmtoOjnqFQsirY6tJdehIacGcQfZbbL8vCtBlKgLWvxY=
X-Received: by 2002:a05:6808:181e:b0:438:430b:3dce with SMTP id
 5614622812f47-443a2dfa130mr6084442b6e.10.1760980543788; Mon, 20 Oct 2025
 10:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-2-superm1@kernel.org>
 <c93821d6-2e59-481a-8119-1c00a3fdcd5e@collabora.com>
In-Reply-To: <c93821d6-2e59-481a-8119-1c00a3fdcd5e@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Oct 2025 19:15:32 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ioc=b0Z5oofvtcmJ=Mb2aBF2bzvZM71tGpa0L6k+FR_w@mail.gmail.com>
X-Gm-Features: AS18NWBmz6ZVP5RNm5vs0CgcHlNudUd7W1UYMEtj6Z5bUAS6AC0XVTH8twLSOrc
Message-ID: <CAJZ5v0ioc=b0Z5oofvtcmJ=Mb2aBF2bzvZM71tGpa0L6k+FR_w@mail.gmail.com>
Subject: Re: [RFC 1/3] PM: Mark device as suspended if it failed to resume
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>, mario.limonciello@amd.com,
 airlied@gmail.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, dakr@kernel.org, 
 gregkh@linuxfoundation.org, lenb@kernel.org, pavel@kernel.org, 
 rafael@kernel.org, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
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
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Oct 20, 2025 at 6:59=E2=80=AFPM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
>
> On 10/20/25 9:50 PM, Mario Limonciello (AMD) wrote:
> > From: Mario Limonciello <mario.limonciello@amd.com>
> >
> > If a device failed to resume the PM core treats it as though it
> > succeeded.  This could cause state machine problems.

You need to be very specific here as this is a significant change in behavi=
or.

> >
> > Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> > Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>
> > ---
> >  drivers/base/power/main.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > index e83503bdc1fdb..bf9c3d79c455f 100644
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -1104,6 +1104,9 @@ static void device_resume(struct device *dev, pm_=
message_t state, bool async)
> >       device_unlock(dev);
> >       dpm_watchdog_clear(&wd);
> >
> > +     if (error)
> > +             dev->power.is_suspended =3D true;
> > +
> >   Complete:
> >       complete_all(&dev->power.completion);
> >
>
>
> --
> ---
> Thanks,
> Usama

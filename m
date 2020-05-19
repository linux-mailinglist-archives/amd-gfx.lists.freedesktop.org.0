Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745041DA12F
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2020 21:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F68589CDF;
	Tue, 19 May 2020 19:44:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE3F89CDF
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 19:44:45 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id x23so846364oic.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 12:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jm59VePbhXNTxV66+UdLe3ZIhgh62bCyUKP107j8oaw=;
 b=TjnAVgm6QxuhHUMn90B4ohalPoZDjDUUMN/cPWEKHjQ1a62iCQeAdM/FRnLgGp2PnX
 MrhrszgTpwHQqtd36bbRZ7SURC/71UJl9DJYwPcWvjnymj75VudtWsU8kgMVflqpOq86
 f1bKuX3+F3XiYtRcw4tfYM8vRyKSCKaXW6i+9xY1nBGPZD8SywZOX0wEidTzqbXQjnRS
 gzdHL+QW4ACILg/t4BSlpgmcp+LYtvASLUtDGPjNGKG3i7Okxg/2Hu6FFn9KkPyOJEFJ
 SY23T4wAgHkd5SdtDakSA8SgcU0FCecsrOjOILStvE90dYqWsfVZnqvF4+kr8iqySHBa
 pM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jm59VePbhXNTxV66+UdLe3ZIhgh62bCyUKP107j8oaw=;
 b=bg4WRDAfYhcnpWYBPaIgnx1KT4j5VrBYISGXjdCbSy25cpdt+Y5I440H42GftVwXNR
 tg+cPffzkdTY5R/yB3L/DrPeQvMAeOfhDCOpPDiDwqWMZXHDcb6yIfzw03SEdgn9yZ50
 4+vDQaxMGR/Jbd4es0G5DCtzZNFMzYJ8rPwklOQrUSsHU6MOCDfqmUXdFUesGxwSKgYh
 J87vSDk9SB4aPCjhHRWGZvvyjBPfn0wdxnaaLrtk2eRW0KPQyvH0tKZsN7vmy202OnER
 +qV8/ZPwEgdy1ascLI84bdZLKn2TzgFXjNMaKZdFfB46n7Jc6ZFzFD/309YK2cBenIpp
 HTvQ==
X-Gm-Message-State: AOAM5335T4L6f/a4qwAguQ3DsCtUFuhDzkEZ03EAXQk/KgRkH5DGS64j
 OlO0QyW3Dj54fxSDasTh8SjfPb3mO7rtyvLCWhE=
X-Google-Smtp-Source: ABdhPJyBCjvSouikbv0aj1ouvtBEBJvUj/WEDFSap3xfasPn5iwG9+ZlM8jKYnlownPMJTHrd8gWm3QasITr/bd2BkQ=
X-Received: by 2002:a54:418f:: with SMTP id 15mr784155oiy.109.1589917484332;
 Tue, 19 May 2020 12:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAEOHGOm=g_VGa5939Qi_HEXAfuUKuy3tXURx9TKg+n==dUDqPQ@mail.gmail.com>
 <CADnq5_N-vLuyqo_rqjy44nwdKPWyiO8cpAJN9pFk79wjwKi7gw@mail.gmail.com>
 <CAEOHGOkbu5jy_1_bUD4H0U89YEc_9zOxsSdyZqmtqZNsdOyDkg@mail.gmail.com>
In-Reply-To: <CAEOHGOkbu5jy_1_bUD4H0U89YEc_9zOxsSdyZqmtqZNsdOyDkg@mail.gmail.com>
From: Javad Karabi <karabijavad@gmail.com>
Date: Tue, 19 May 2020 14:44:33 -0500
Message-ID: <CAEOHGOkRYXZWN-20VagBEFFywRT=26xphP3JQeQD4AJuxxzg+Q@mail.gmail.com>
Subject: Re: slow rx 5600 xt fps
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

just a couple more questions:

- based on what you are aware of, the technical details such as
"shared buffers go through system memory", and all that, do you see
any issues that might exist that i might be missing in my setup? i
cant imagine this being the case because the card works great in
windows, unless the windows driver does something different?

- as far as kernel config, is there anything in particular which
_should_ or _should not_ be enabled/disabled?

- does the vendor matter? for instance, this is an xfx card. when it
comes to different vendors, are there interface changes that might
make one vendor work better for linux than another? i dont really
understand the differences in vendors, but i imagine that the vbios
differs between vendors, and as such, the linux compatibility would
maybe change?

- is the pcie bandwidth possible an issue? the pcie_bw file changes
between values like this:
18446683600662707640 18446744071581623085 128
and sometimes i see this:
4096 0 128
as you can see, the second value seems significantly lower. is that
possibly an issue? possibly due to aspm?

On Tue, May 19, 2020 at 2:20 PM Javad Karabi <karabijavad@gmail.com> wrote:
>
> im using Driver "amdgpu" in my xorg conf
>
> how does one verify which gpu is the primary? im assuming my intel
> card is the primary, since i have not done anything to change that.
>
> also, if all shared buffers have to go through system memory, then
> that means an eGPU amdgpu wont work very well in general right?
> because going through system memory for the egpu means going over the
> thunderbolt connection
>
> and what are the shared buffers youre referring to? for example, if an
> application is drawing to a buffer, is that an example of a shared
> buffer that has to go through system memory? if so, thats fine, right?
> because the application's memory is in system memory, so that copy
> wouldnt be an issue.
>
> in general, do you think the "copy buffer across system memory might
> be a hindrance for thunderbolt? im trying to figure out which
> directions to go to debug and im totally lost, so maybe i can do some
> testing that direction?
>
> and for what its worth, when i turn the display "off" via the gnome
> display settings, its the same issue as when the laptop lid is closed,
> so unless the motherboard reads the "closed lid" the same as "display
> off", then im not sure if its thermal issues.
>
> On Tue, May 19, 2020 at 2:14 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Tue, May 19, 2020 at 2:59 PM Javad Karabi <karabijavad@gmail.com> wrote:
> > >
> > > given this setup:
> > > laptop -thunderbolt-> razer core x -> xfx rx 5600 xt raw 2 -hdmi-> monitor
> > > DRI_PRIME=1 glxgears gears gives me ~300fps
> > >
> > > given this setup:
> > > laptop -thunderbolt-> razer core x -> xfx rx 5600 xt raw 2
> > > laptop -hdmi-> monitor
> > >
> > > glx gears gives me ~1800fps
> > >
> > > this doesnt make sense to me because i thought that having the monitor
> > > plugged directly into the card should give best performance.
> > >
> >
> > Do you have displays connected to both GPUs?  If you are using X which
> > ddx are you using?  xf86-video-modesetting or xf86-video-amdgpu?
> > IIRC, xf86-video-amdgpu has some optimizations for prime which are not
> > yet in xf86-video-modesetting.  Which GPU is set up as the primary?
> > Note that the GPU which does the rendering is not necessarily the one
> > that the displays are attached to.  The render GPU renders to it's
> > render buffer and then that data may end up being copied other GPUs
> > for display.  Also, at this point, all shared buffers have to go
> > through system memory (this will be changing eventually now that we
> > support device memory via dma-buf), so there is often an extra copy
> > involved.
> >
> > > theres another really weird issue...
> > >
> > > given setup 1, where the monitor is plugged in to the card:
> > > when i close the laptop lid, my monitor is "active" and whatnot, and i
> > > can "use it" in a sense
> > >
> > > however, heres the weirdness:
> > > the mouse cursor will move along the monitor perfectly smooth and
> > > fine, but all the other updates to the screen are delayed by about 2
> > > or 3 seconds.
> > > that is to say, its as if the laptop is doing everything (e.g. if i
> > > open a terminal, the terminal will open, but it will take 2 seconds
> > > for me to see it)
> > >
> > > its almost as if all the frames and everything are being drawn, and
> > > the laptop is running fine and everything, but i simply just dont get
> > > to see it on the monitor, except for one time every 2 seconds.
> > >
> > > its hard to articulate, because its so bizarre. its not like, a "low
> > > fps" per se, because the cursor is totally smooth. but its that
> > > _everything else_ is only updated once every couple seconds.
> >
> > This might also be related to which GPU is the primary.  It still may
> > be the integrated GPU since that is what is attached to the laptop
> > panel.  Also the platform and some drivers may do certain things when
> > the lid is closed.  E.g., for thermal reasons, the integrated GPU or
> > CPU may have a more limited TDP because the laptop cannot cool as
> > efficiently.
> >
> > Alex
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

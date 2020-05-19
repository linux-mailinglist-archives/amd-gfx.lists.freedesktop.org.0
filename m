Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8507C1DA005
	for <lists+amd-gfx@lfdr.de>; Tue, 19 May 2020 20:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0456E45F;
	Tue, 19 May 2020 18:52:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632A66E45E
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 18:52:43 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id j145so684590oib.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 19 May 2020 11:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N6hWi/vfg1RgxtHegIaeBgytEJ20fzahffTkR3n6Xog=;
 b=fYhZfKSDLHMCVp11oS8hnnbT3bKrK1FPpyoNMegau2MAOOrxiRF8fGKPFJ7XKShGbT
 uxz/FY2TPDQvpEJXQk+D6famo7nrXqvp7zxxHIGEa7sRT6VT9q8o1G7vEvnPe+owbr+t
 pGoNjEl3us+3d+l4+zf3/w+dAparCso+uXB2t1AOVxmYIXs9CrDI8jpCGCLY0TY3cpo8
 1D180bipbxOgzHmzuX9hOx9fQsRUCb5qBtLw9+q/4sbgzuTZWC9qi0Jd7NslP1qIh4n6
 bWhIATN36XFHaIS3APfedYCs8JruexPiON2IgWeEvlbci3USSUYqAXafVZBj4OufOw5b
 aiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N6hWi/vfg1RgxtHegIaeBgytEJ20fzahffTkR3n6Xog=;
 b=kDp7iqJa/MN+kYFg/rloFOwPM7VudDZlnEbPXkdDBbJVdjR13CvGe0fT+av34gyfVk
 pnwJT3Vsx5qMvuVhFn2SjPDaVS8T+9alStbKXWOx9EUwPY3Sw4vZX72AUgP3vM77Oey5
 kA7c+krhlpyWstUdjfFaNEXdGONFBUqRxIylEoix8N88xRMl4JspNcViJQwz8n8/R3aZ
 xJyYMx+Z14CmhZfi4erpbQBa1Sp2TeP7au8NyQbT414uQraHTxIrGjTSqVw0aVZyKBLA
 5LtK4JQmzJa9i8Z2hHAWHRZ1OuVh9pwIpn8BUGhhEPnN1p5Z4J6o/ZydnVqAYGgBYe8w
 A6YQ==
X-Gm-Message-State: AOAM531QeD3UM9OC5V2Qg9LcuXKFG1l6xO6z11FCixjnGKnlPs/0fK+R
 c6BcXyQX/GCb2kQzguoNuKTAHEmaPQ/HnjxqEPlmGa/F
X-Google-Smtp-Source: ABdhPJyBIZoTmuGsPz7z3Z5fw6ezSw/hNhSloj9JkagZNZZXFWM816jFOkPCqeVxM4dD0sLG6iu/2ysmOH9FXX+a9eg=
X-Received: by 2002:aca:3008:: with SMTP id w8mr600715oiw.157.1589914362508;
 Tue, 19 May 2020 11:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAEOHGO=uKYs0YQyG5K2BGd=_83j_m6nfompstAF-znRfus69Hw@mail.gmail.com>
 <CADnq5_NUhVDhoQEJPQ-Lr=zTR9rWUyvhtCk15=drtDnB+De+zg@mail.gmail.com>
In-Reply-To: <CADnq5_NUhVDhoQEJPQ-Lr=zTR9rWUyvhtCk15=drtDnB+De+zg@mail.gmail.com>
From: Javad Karabi <karabijavad@gmail.com>
Date: Tue, 19 May 2020 13:52:31 -0500
Message-ID: <CAEOHGOmOa8MewMiDX+nCrC5fx4O0T+srjj0e-rGFNSiZTMY49Q@mail.gmail.com>
Subject: Re: regarding vcn
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

thanks alex. i guess all the little things that i think are the
problem, are really red herrings lol. i keep finding little things
that i think might fix the 5600 issues im having but i guess theyre
unrelated. ill make another post which simply defines the issues im
having

On Tue, May 19, 2020 at 1:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, May 19, 2020 at 2:45 PM Javad Karabi <karabijavad@gmail.com> wrote:
> >
> > for a rx 5600 xt graphics card, is VCN supposed to be set to disabled?
> >
> > if i understand correctly, 5600 is navi10, which has vcn
> >
> > but i currently see VCN: disabled
> >
> > $ sudo grep VCN /sys/kernel/debug/dri/1/amdgpu_pm_info
> > VCN: Disabled
>
> amdgpu_pm_info shows power information.  When the VCN block is not in
> use, the driver disables it to save power.  If you read back the
> amdgpu_pm_info while VCN is in use, it will show up as enabled.
>
> Alex
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E0F2E87A8
	for <lists+amd-gfx@lfdr.de>; Sat,  2 Jan 2021 16:05:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32FD898D9;
	Sat,  2 Jan 2021 15:05:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5638D898C7;
 Sat,  2 Jan 2021 15:05:48 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a12so26534586wrv.8;
 Sat, 02 Jan 2021 07:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TGNHEPkZ9sn/4vEpzXOy2AT+6QjBQhThk4tGa0m88ac=;
 b=SflU35VlzEmPrm+o2A38WEssV0awi84cx8iQ2cOFynuVBtYvEzox5tyCZWGyGLc0Zf
 FFzEyAg0hETwHdqNAgF0xgaPfpP843+YszD4woKeF1Kxx5bFp7bdTSrH3drBqXqhTtED
 6VTB41M0aNh7mypa8+hscZHsEL+mekqlfVNCSZfxC+0AQh/UtH6/taAlUE6i3YpnB9Q2
 qMfNmMCkUFSz2c9OVOjrzgadT60+PMDpmfOZV3Fg/RvHctqOaOL9osYPJ7abMb1+XOSJ
 WUgu5IsC+tO4/96Pg7BYRRAMkN3HYPddH/KQr2hJrWYlwUMbujJrKQxZsIIyMux21Ivl
 TvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TGNHEPkZ9sn/4vEpzXOy2AT+6QjBQhThk4tGa0m88ac=;
 b=LCcZhrgxe/iDi3nyT7SUndtpo3HW3UyZpNRTM+eQqm6l2TvoCNQC9ZQg3puTYftg/f
 NCh/0M+W1thXDESfl68+d8FIvEq9K5Kk80sUvzL+TaMgaAjjUoLBKcMAWACy2il00p2p
 yTvjAnx5dZeowUrIAa2rwlnywnMoLRev6D6R2YA/11GAW3ei0DFJasZ+2+ml99BcEzCR
 LBBev5Gd2YfKQIrfHyem01VLV6xhkAFEO0CyaFrcmaaceN91f6q1fIywe9Mt8G4AvhzA
 fW/PD2ZKI3CZtN/TYXNfChw0KJ+qoHf+2WQpDFjKpQAod4Q6QVejhzQ/eudb0IXhJVep
 1pSA==
X-Gm-Message-State: AOAM532722ngTlfacWKGqZmgQ01X1FVN/ht/SaKzqRvuNPCiNglTkItZ
 HZ6e1M6SE6i+YVv8tVr7RLzQq0rKnsISRjm4ndCad1+EyiM=
X-Google-Smtp-Source: ABdhPJwcNX0AUikZpA0X4CSO+XgZ4qD+C4VmDT5NZYv3uyBQ5SZBR6+VCIbscDIC3nBFds7tyLT8Szo0VSpo9gBOQE4=
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr71769035wrn.107.1609599946947; 
 Sat, 02 Jan 2021 07:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20201231205136.11422-1-mario.kleiner.de@gmail.com>
 <CAP+8YyE4H5mL3uj-T4uG0nz75XmgaZ6etXX6YxxdtO4-rL=5qA@mail.gmail.com>
In-Reply-To: <CAP+8YyE4H5mL3uj-T4uG0nz75XmgaZ6etXX6YxxdtO4-rL=5qA@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Sat, 2 Jan 2021 16:05:35 +0100
Message-ID: <CAEsyxyiLrpB872LdAW8-HMVC-rxf7YF8K+B51Ae9nyEvGaG1Sw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pageflipping for XOrg in Linux 5.11+
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Dave Airlie <airlied@redhat.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Sat, Jan 2, 2021 at 3:05 PM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> I think the problem here is that application A can set the FB and then
> application B can use getfb2 (say ffmpeg).


Yes. That, and also the check for 'X' won't get us far, because if i
use my own software Psychtoolbox under Vulkan in direct display mode
(leased RandR outputs), e.g., under radv or amdvlk, then the ->comm
name will be "PTB mainthread" and 'P' != 'X'. But the Vulkan drivers
all use legacy pageflips as well in der WSI/drm, so if Vulkan gets
framebuffers with DCC modifiers, it would just fail the same way.

Neither would it work to check for atomic client, as they sometimes
use atomic commit ioctl only for certain use cases, e.g., setting HDR
metadata, but still use the legacy pageflip ioctl for flipping.

So that patch of mine is not the proper solution for anything non-X.

>
> https://lists.freedesktop.org/archives/dri-devel/2021-January/292761.html
> would be my alternative patch.
>

I also produced and tested hopefully better alternative to my original
one yesterday, but was too tired to send it. I just sent it out to
you:
https://lists.freedesktop.org/archives/dri-devel/2021-January/292763.html

This one keeps the format_info check as is for non-atomic drivers, but
no longer rejects pageflip if the underlying kms driver is atomic. I
checked, and current atomic drivers use the drm_atomic... helper for
implementing legacy pageflips, and that helper just wraps the pageflip
into a "set new fb on plane" + atomic check + atomic commit.

My understanding is that one can do these format changes safely under
atomic commit, so i hope this would be safe and future proof.

> (I'm not good at detecting the effects of tearing  apparently but
> tested this avoids the pageflip failure by debug-prints)


XOrg log (e.g., ~/.local/share/xorg/XOrg0.log on current Ubuntu's) is
a good place on native XOrg, where the amdgpu-ddx was flooding the log
with present flip failures. Or drm.debug=4 for the kernel log.

Piglit has the OML_sync_control tests for timing correctness, although
they are mostly pointless if not run in fullscreen mode, which they
are not by default.

I can also highly recommend (sudo apt install octave-psychtoolbox-3)
on Debian/Ubutu based systems for X11. It is used for neuroscience and
medical research and critically depends on properly working pageflips
and timestamping on native X11/GLX under OpenGL and recently also
under Vulkan/WSI (radv,anv,amdvlk) in direct display mode. Working
FOSS AMD and Intel are especially critical for this research, so far
under X11+Mesa/OpenGL, but lately also under Vulkan direct display
mode. It has many built-in correctness tests and will shout angrily if
something software-detectable is broken wrt. pageflipping or timing.
E.g., octave-cli --eval PerceptualVBLSyncTest
PerceptualVBLSyncTest creates a flicker pattern that will tear like
crazy under Mesa if pageflipping isn't used. Also good to test
synchronization on dual-display setups, e.g., for udal-display stereo
presentation.

I was actually surprised that this patch made it through the various
test suites and into drm-next. I thought page-flipping was covered
well enough somewhere.

Happy new year!
-mario

>
> On Thu, Dec 31, 2020 at 9:52 PM Mario Kleiner
> <mario.kleiner.de@gmail.com> wrote:
> >
> > Commit 816853f9dc4057b6c7ee3c45ca9bd5905 ("drm/amd/display: Set new
> > format info for converted metadata.") may fix the getfb2 ioctl, but
> > in exchange it completely breaks all pageflipping for classic user
> > space, e.g., XOrg, as tested with both amdgpu-ddx and modesetting-ddx.
> > This leads to massive tearing, broken visual timing/timestamping etc.
> >
> > Reason is that the classic pageflip ioctl doesn't allow a fb format
> > change during flip, and at least X uses classic pageflip ioctl and no
> > atomic modesetting api at all.
> >
> > As one attempted workaround, only set the new format info for converted
> > metadata if the calling client isn't X. Not sure if this is the best
> > way, or if a better check would not be "not all atomic clients" or
> > similar? In any case it works for XOrg X-Server. Checking the ddx
> > code of intel-ddx/modesetting-ddx/amdgpu-ddx as well as grepping over
> > Mesa doesn't show any users of the getfb2 ioctl(), so the need for this
> > format info assignment seems to be more the exception than the rule?
> >
> > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
> > Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > index f764803c53a4..cb414b3d327a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > @@ -828,7 +828,8 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
> >                         if (!format_info)
> >                                 return -EINVAL;
> >
> > -                       afb->base.format = format_info;
> > +                       if (afb->base.comm[0] != 'X')
> > +                               afb->base.format = format_info;
> >                 }
> >         }
> >
> > --
> > 2.25.1
> >
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

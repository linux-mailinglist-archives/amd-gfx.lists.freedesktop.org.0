Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102719F829
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Apr 2020 16:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0656B6E2DE;
	Mon,  6 Apr 2020 14:44:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E606E3E5
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Apr 2020 14:44:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w10so17861620wrm.4
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Apr 2020 07:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUnYamvY5KilZzgALZ1QkawZhAraH/GUL/YCKajpu+0=;
 b=cBCLGymfRfmsJV7y7JM/MUzsRTaAd0q6KgHwHgKKxvnI/HweE9oG79J5pqzXs9g522
 +dZwnA91dj8Wq8dLzr3P8fojuiHMh0H0WpxxFW4ynDTygHtY/pte2vlVZzxiFQVepMjk
 yucbIciC4/tWcu8dLvMc7RNf2qLIMUtWizP84pxmWp0st4d4aFgXf0viZ/e1y5oPCJOr
 t7HpeZDHJ8k8Wt+rtAIVDnhUAW4jN/HutnHzl07lpomjahFTOMxdf4l4sY9HPCMW0ZUu
 JTPtRCd1bta1NPyWwTA0ZhqZU/KXYZjyyRCbDmp7VcN1WKaq2jx17XxpY9tc5QlS17g+
 uCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUnYamvY5KilZzgALZ1QkawZhAraH/GUL/YCKajpu+0=;
 b=NvdolTAmiIIu2XesFak85h+y0Qa6CuKXD11QclnCtWlOV2CHQQbfIBVwcpODyTJYUB
 l0P/aIEGO2rVPy8sFPaJ4U7N5AYBsON30ZG29xWK/hducKdIKAK6QStM4gVMGwuOBE8X
 YUWoZntdIae2Q35DGkTfsrunvSVSspD9BcYTcKEV9s1mEht4u10JqGufers21J9FBmpe
 F3aVS58AtVE2aEdHuvKieiwh+UMAPjZqwoWbW/W1uU1t2lz05pHYa0vt8XpnRWcbbm81
 CsRVrw1ZGhuU4YNfkapeDB4p9TbhW5FAXvv5u4lQsuWRM5zR0Z7+qE5JyWWaejMpY/WR
 XPhg==
X-Gm-Message-State: AGi0PuZ8clOnZnONP2ROWhpAp7fjkaMi0xMizYBKwHOBqo4vDr7oIjJh
 KA/We4zbVfP8YTpvIlWmwDTAxj4t6EhUK5rg6Qrziw==
X-Google-Smtp-Source: APiQypIqJlCEUAk6YkfZ8buqzQ7h9PHHIiUNXYyMHnA/WTsOVbhyLK3Gfh++4Hzeau7+N2tlfPqGqlNTIETJ4hLoXuw=
X-Received: by 2002:a5d:6742:: with SMTP id l2mr25782126wrw.124.1586184282380; 
 Mon, 06 Apr 2020 07:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200110201110.117166-1-alexander.deucher@amd.com>
 <CADnq5_PqWGUjn06jvxXfr=qQa45WJCK1aKgJ-b+VJRkVj9z4Yg@mail.gmail.com>
 <07041392-d18f-821e-4271-c94008818399@amd.com>
 <CADnq5_PZTSqWfctAjXwveMwj+5zGwvsPptx+oWUvtjJ3aWRe=Q@mail.gmail.com>
In-Reply-To: <CADnq5_PZTSqWfctAjXwveMwj+5zGwvsPptx+oWUvtjJ3aWRe=Q@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Apr 2020 10:44:31 -0400
Message-ID: <CADnq5_NZ0e28xzyEGFVbUZo4g46TQ8FVK1U5LHT8XybWmSMWag@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: fix logic inversion in
 program_timing_sync()
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ping again?

Alex

On Thu, Feb 20, 2020 at 8:27 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Feb 4, 2020 at 9:06 AM Kazlauskas, Nicholas
> <nicholas.kazlauskas@amd.com> wrote:
> >
> > Comments inline.
> >
> > On 2020-02-03 4:07 p.m., Alex Deucher wrote:
> > > Ping?
> > >
> > > On Fri, Jan 10, 2020 at 3:11 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >>
> > >> It looks like we should be reducing the group size when we don't
> > >> have a plane rather than when we do.
> > >>
> > >> Bug: https://gitlab.freedesktop.org/drm/amd/issues/781
> > >> Fixes: 5fc0cbfad45648 ("drm/amd/display: determine if a pipe is synced by plane state")
> > >> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > >> ---
> > >>   drivers/gpu/drm/amd/display/dc/core/dc.c | 4 ++--
> > >>   1 file changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > >> index 3d89904003f0..01b27726d9c5 100644
> > >> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> > >> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> > >> @@ -1003,9 +1003,9 @@ static void program_timing_sync(
> > >>                                  status->timing_sync_info.master = false;
> > >>
> > >>                  }
> > >> -               /* remove any other pipes with plane as they have already been synced */
> > >> +               /* remove any other pipes without plane as they have already been synced */
> >
> > This took a while to wrap my head around but I think I understand what
> > this was originally trying to do.
> >
> > The original logic seems to have been checking for blanked streams and
> > trying to remove anything that was blanked from the group to try and
> > avoid having to enable timing synchronization.
> >
> > However, the logic for blanked is *not* the same as having a
> > plane_state. Technically you can drive an OTG without anything connected
> > in the front end and it'll just draw out the back color - which is
> > distinct from having the OTG be blanked.
> >
> > The problem is really this iteration below:
> >
> > >>                  for (j = j + 1; j < group_size; j++) {
> >
> > There could still be pipes in here (depending on the ordering) that have
> > planes and could be synchronized with the master OTG. I think starting
> > at j + 1 is a mistake for this logic as well.
> >
> > I wonder if we can just drop this loop altogether. If we add planes or
> > unblank the OTG later then we'll still want the synchronization.
> >
> > Dymtro, Wenjing - feel free to correct my understanding if I'm mistaken
> > about this.
>
> Ping?  Any thoughts on this?  It would be nice to get this fixed.
>
> Alex
>
>
> >
> > Regards,
> > Nicholas Kazlauskas
> >
> > >> -                       if (pipe_set[j]->plane_state) {
> > >> +                       if (!pipe_set[j]->plane_state) {
> > >>                                  group_size--;
> > >>                                  pipe_set[j] = pipe_set[group_size];
> > >>                                  j--;
> > >> --
> > >> 2.24.1
> > >>
> > > _______________________________________________
> > > amd-gfx mailing list
> > > amd-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> > >
> >
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

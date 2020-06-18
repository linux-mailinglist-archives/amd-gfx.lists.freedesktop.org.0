Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4DF1FE9E1
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jun 2020 06:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA406EA0E;
	Thu, 18 Jun 2020 04:20:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8156EA0E
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jun 2020 04:20:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x6so4491798wrm.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Jun 2020 21:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QDMKAL4YYrHOQv6gr1qvgsMt73oZnm+IZ1w2cFA4xzQ=;
 b=vgBWQObr2W5HHB/D7zJnaLjSBLxRHsTkPn8yv609k7xoUjjlvWF6yXhNanFuxs0pD0
 6Zfsg/XAGRYuyewEr+Iy2wqSsQ3W2l1iwYaXAuYov+rEgMdo/+aPE+Y/S3k/W1nxk6PJ
 sCFA8ek5LhtVP++cfGxC5dU9KG0NbubvPuEyq9SpmW+33mjmut2xN7ds8z6d7Zlf3npl
 1FzFS1org5VJC8rxKfnajq8PONWruNBCUVG14zv/4iVReoKoc0GnOIzpFcdeJ4aBBInT
 eIGYkfA+LDHfBbYHZny3aWu79B4U4IzFGGLynqbJP/JdICCRm0iDTyRXTZl7tRqRpTcg
 MW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QDMKAL4YYrHOQv6gr1qvgsMt73oZnm+IZ1w2cFA4xzQ=;
 b=O1c89o87u2eeZqGYJ+UhjxuUgTC1LTJJnzQOybYH7pNjpWjg47q132fEZ8ENqR5erj
 lC6sJ9+6DBW6SvTk/5elXuzP5XeRSebPE/MQSKLjKnGmftf9BiX5AVPNkaFriLaMUYiP
 jVGWhM58MjRVxuushtQ5F7/GUAGETbIRVUNvvAcAuanBkN+y3E9tL9Uk6Y89185sgpO8
 auCvyeOvT+VleYCXTBZXz9Of7rJwFLeCOC8ijX29MR/TgmMEc2Ok/Vml98tyvbBapbwk
 ROc2nq8lfE2UpmzikDn2KM54AcyAomq+9PtNvmIcwVOvomKsDr1OBgOwwwgzaYdfZ9l1
 F1vg==
X-Gm-Message-State: AOAM531tMPJnqnXLdgpfYPDhgHPYcoMw3UUALAlWqPecOCWRfCykmZNL
 561pdUnb0yEyErEaCt1IUHPm2dxxK49YtVR/xZaCJMjG
X-Google-Smtp-Source: ABdhPJzR6P1lvvGMptoD1lJ5bERNj8Cl3tgbsGmJBPOpwOATtMzZVWF0OYC8ariCyS0ee7r//D5A4PjKUTD4IalL+3o=
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr2432973wrq.362.1592454053698; 
 Wed, 17 Jun 2020 21:20:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200617094431.11411-1-evan.quan@amd.com>
 <CADnq5_OjBoiO9jOcHLccs8wdSvVWz9rWA=tfm_9p3Ctye_6Nhg@mail.gmail.com>
 <DM6PR12MB2619647D47307D7A2B215608E49B0@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2619647D47307D7A2B215608E49B0@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 18 Jun 2020 00:20:42 -0400
Message-ID: <CADnq5_PA=AjyjorypbSgPp0_Jsj7R460OzpdLkNKbFEhmN99FQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: declare driver if version mismatch as
 "warning" explicitly
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kumar,
 Pramendra" <Pramendra.Kumar@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 12:10 AM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> Hi Alex,
>
> This was raised by Pramendra. He got plenty of questions from customer about this.
> The customer saw these mismatch messages and did not know whether it's an indication of some critical error.
> The mismatch messages were update to be prefixed with "warning". So that it get customer reminded but not scared.
> Any better idea?

If the idea is not to raise concerns, then why change from dev_info to
dev_warn?  I warning is generally seen as more critical than info.
I'd suggest making them both dev_info and instead of saying "warning:
SMU driver if version not matched", maybe say something like "SMU
driver if version not matched, consider updating your firmware".

Alex

>
> BR,
> Evan
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Thursday, June 18, 2020 5:15 AM
> To: Quan, Evan <Evan.Quan@amd.com>
> Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Deucher, Alexander <Alexander.Deucher@amd.com>; Kumar, Pramendra <Pramendra.Kumar@amd.com>
> Subject: Re: [PATCH] drm/amd/powerplay: declare driver if version mismatch as "warning" explicitly
>
> On Wed, Jun 17, 2020 at 5:45 AM Evan Quan <evan.quan@amd.com> wrote:
> >
> > So that user knows it's just a warning and can be safely ignored.
>
> I'm not sure I follow this logic.  I think a warning would cause more concern than just printing it as info.  Why would you ignore a warning?
>
> Alex
>
> >
> > Change-Id: Ic518ec3eb68c6bd6682e6131e32cfe90843341ff
> > Signed-off-by: Evan Quan <evan.quan@amd.com>
> > ---
> >  drivers/gpu/drm/amd/powerplay/smu_v11_0.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> > b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> > index 2bcb8d16f1b7..22eabc10ea8e 100644
> > --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> > +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> > @@ -318,11 +318,11 @@ int smu_v11_0_check_fw_version(struct smu_context *smu)
> >          * of halt driver loading.
> >          */
> >         if (if_version != smu->smc_driver_if_version) {
> > -               dev_info(smu->adev->dev, "smu driver if version = 0x%08x, smu fw if version = 0x%08x, "
> > +               dev_warn(smu->adev->dev, "warning: smu driver if version = 0x%08x, smu fw if version = 0x%08x, "
> >                         "smu fw version = 0x%08x (%d.%d.%d)\n",
> >                         smu->smc_driver_if_version, if_version,
> >                         smu_version, smu_major, smu_minor, smu_debug);
> > -               dev_warn(smu->adev->dev, "SMU driver if version not matched\n");
> > +               dev_warn(smu->adev->dev, "warning: SMU driver if
> > + version not matched\n");
> >         }
> >
> >         return ret;
> > --
> > 2.27.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flist
> > s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Cev
> > an.quan%40amd.com%7Cefaab1a492c9408cacf208d8130393ca%7C3dd8961fe4884e6
> > 08e11a82d994e183d%7C0%7C0%7C637280253365573223&amp;sdata=REs2QnFT0V1gX
> > yti8Ws4wn4hhcpMDvpd4mf8WEVUEk4%3D&amp;reserved=0
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

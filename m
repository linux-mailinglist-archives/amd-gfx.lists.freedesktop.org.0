Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6A952EE3A
	for <lists+amd-gfx@lfdr.de>; Fri, 20 May 2022 16:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B4210E094;
	Fri, 20 May 2022 14:32:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDDC10E094
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 May 2022 14:32:45 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-edf3b6b0f2so10473994fac.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 20 May 2022 07:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=r1XPiBOZ1czqTk0nzoc5qxmamSySBBzG3KjKEnFfBEg=;
 b=IEkFCTaTcZxHPU4SVoLp528j0PutyXcIzKWYtzbCregJyq8hAcGjb1mm8BetpkplNh
 sZ2CfdgVKLOV6Y2rH9KbSE0CkzrOfs0IUYFUL9d8dYllrEQ5CSoM2INMf5uwb6WZZVFQ
 bSxOa7GbB+aEVIkzMcrcpoC1h4BKN3RseGPjGdXJrs8dIrxjKkEN1Atmk+ZrTQ0wSLKD
 Wj6foYgsHOH5c8rRUNq4ENqXXTe4THIDFYGpNN/hgurF8wxw/Yzdzw9P6miYwGiUiwlB
 zKq/o5Fu73oZ+ru4C5kfebHoi5iVrebSuu6Z26PcjtFU7s/tPF8cet1pp/loPF4C+UiY
 P0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=r1XPiBOZ1czqTk0nzoc5qxmamSySBBzG3KjKEnFfBEg=;
 b=LqP3pmNWuch28i+Z9rdz1mFV8D9D+UXN+Q8plxtMKhoyYMVJoUgxxO1kLPKDL6jur6
 lpAnVT6Ehsbb11raMHv2QnppLKPLnLJMgpzhJmwXy9r8AgsbPnlsFRDR6Hd9jbWAcK4S
 wfTyyFwTo06UuwL/lTaF+XkPwfNLypxVpjuxheIlrzZGClyPFIXoey/EsMyBZ9AKF6iZ
 1Z000lgTeJfOVX8P7LaCCqZj79gF7PYi+g/VqfvsJK6fd2Ux+OytNe7jvfmFBbLUx0jF
 dm+dZBwtGYr7ZIx8CcNxzqd846SI1xtdrCYwSU4pM+rSE2s0wx7HUjNRSI7Lnd198z1h
 fZWw==
X-Gm-Message-State: AOAM5339I7SP7fK8TmMStcCyCrAK1FT4PZ7gU1QkKuEBXqcFnTgoenH7
 0z/qxgEyQMGElwsG2BpBMzWAh6Q3RiG1GhpFV94wOvwI
X-Google-Smtp-Source: ABdhPJxD67E2ZNL0ZkZORj56Pre3ixgSJlYZBBLYjUmKnlm49mtMROSKS20o8vvd/aJp68KFN+jZzo+eEBacjlJHfkI=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr6041763oap.253.1653057165114; Fri, 20
 May 2022 07:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220520075932.186691-1-danijel.slivka@amd.com>
 <CADnq5_P8p5zKiW20xek0M0DVs+YRDX6qcy+b01NWXP_NUs9O5Q@mail.gmail.com>
 <BYAPR12MB3094F87BED21F64FE5BD4C4798D39@BYAPR12MB3094.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB3094F87BED21F64FE5BD4C4798D39@BYAPR12MB3094.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 May 2022 10:32:34 -0400
Message-ID: <CADnq5_PArQi9FdOufwO7XnHXf85euPN_H_3hvqyJYUW47nHFCg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Skip init fbdev if virtual_display is enabled
To: "Slivka, Danijel" <Danijel.Slivka@amd.com>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Fri, May 20, 2022 at 10:12 AM Slivka, Danijel <Danijel.Slivka@amd.com> w=
rote:
>
> [AMD Official Use Only - General]
>
> Hi,
>
> Based on the code we shouldn't init the fbdev on hw without DCE:

That comment means don't init fbdev on chips without display hardware
(either real or virtual).  E.g., iceland or MI100.

Alex

>
>         /*
>          * 1. don't init fbdev on hw without DCE
>          * 2. don't init fbdev if there are no connectors
>          */
>         if (adev->mode_info.mode_config_initialized &&
>             !list_empty(&adev_to_drm(adev)->mode_config.connector_list)) =
{
>                 /* select 8 bpp console on low vram cards */
>                 if (adev->gmc.real_vram_size <=3D (32*1024*1024))
>                         drm_fbdev_generic_setup(adev_to_drm(adev), 8);
>                 else
>                         drm_fbdev_generic_setup(adev_to_drm(adev), 32);
>         }
>
> For virtualization we always use virtual_display and doesn=E2=80=99t have=
 the hw DCE for that reason setting up fbdev should be skipped.
>
>
> BR,
> Danijel Slivka
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Friday, May 20, 2022 3:30 PM
> To: Slivka, Danijel <Danijel.Slivka@amd.com>
> Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
> Subject: Re: [PATCH] drm/amdgpu: Skip init fbdev if virtual_display is en=
abled
>
> On Fri, May 20, 2022 at 3:59 AM Danijel Slivka <danijel.slivka@amd.com> w=
rote:
> >
> > In case virtaul_display is enabled there is no hw DCE so need to skip
> > setting up fbdev.
>
> Wouldn't you theoretically still want fbdev even if it is virtual?
>
> Alex
>
> >
> > Signed-off-by: Danijel Slivka <danijel.slivka@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 3b9dc1803be9..8d03eec49eef 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -2095,6 +2095,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >          * 2. don't init fbdev if there are no connectors
> >          */
> >         if (adev->mode_info.mode_config_initialized &&
> > +           !adev->enable_virtual_display &&
> >             !list_empty(&adev_to_drm(adev)->mode_config.connector_list)=
) {
> >                 /* select 8 bpp console on low vram cards */
> >                 if (adev->gmc.real_vram_size <=3D (32*1024*1024))
> > --
> > 2.25.1
> >

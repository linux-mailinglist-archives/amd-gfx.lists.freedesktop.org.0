Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EAF6CF906
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Mar 2023 04:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E116710E02E;
	Thu, 30 Mar 2023 02:08:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BF410EC94
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Mar 2023 00:49:19 +0000 (UTC)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E978D3F232
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Mar 2023 00:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1680137355;
 bh=2bTlOOOOVa4/gjv3TZ+YFUjSIkiCAUcO1Pmm7DLw2W0=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=dZEacsKwjLH0zgb3fn8r5d/1HPLLgVDGckyVJESEXw8VBiI4kUQFzYjjEop2DMlFj
 F3qb8G1LuErfOH23eumY10OBgCL92O4CDDqcnp+u50cADWVEA9NpxeuWsyah5cFBAN
 dvcMUoUtBoJorDMV2FboqF6uaSj2pjt5A1NJ/v/iqTGsm1av6jAnslPSG3pZoxMrW3
 ykP/QCsK86e6WjmKO68azH4efExRPi2pw0Jw2D3NK+SJOqUgOaeKht1ti8Rmv2laew
 oGhRbqa88VvCe8uYVqHwk05dV0UIYwGByQKUEdtQKKG+YA/TkcpFbWj+9SXsRkF8bN
 vZ8X73wcH7WZg==
Received: by mail-pg1-f198.google.com with SMTP id
 t12-20020a65608c000000b005091ec4f2d4so4881257pgu.20
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Mar 2023 17:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680137354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2bTlOOOOVa4/gjv3TZ+YFUjSIkiCAUcO1Pmm7DLw2W0=;
 b=MCE6TDv+8cnqewxFMHfdOho/Q3r3H6Yl5Nzg6SbOFO4ilTztsG/GgCmqMnTOhirMWg
 DQ0h8G7tpFuaDF4IrrOB3YJeFMFa+jLMXRyVOsB1ckFppCl+wAu7/0+GmSGsKnq8OBUP
 vuXDcpHUM6YOvJ637kb1wcNbFV7eA77vECkmUsr811J4rKZ6Gg6QY2fgI48fllU29SLT
 mRXenDMNunTqTlERX+5JSLUZaJWw2QAF6GMeHSpiIfxfBj/EX4Taz4ENXimNFfl9kLQo
 84QqdZkt9S/rGK4X2szJD/tveemyXGd3PI6IA4wl9LVsw9MSX+93mG7Im6vPW94DwU65
 Ea8A==
X-Gm-Message-State: AAQBX9fzjDHIhVaGhJEzTL8CYXU3vVT3Bqh3WOiVSFVRDCDZuW2NQFo7
 Kpb8kRKdfGrykbMpTTEwuP3bwotXp5S8tw7TC3gpaC+M3krs6POp6kJckmMSdjprL4hdZl1NP9D
 pydkJYjIKK5qUBOerAdq2I/3+qEAafBnkBdKcRNTP+LkJ/LccmgM8TGPbUms=
X-Received: by 2002:a17:902:ea0c:b0:1a0:527b:9189 with SMTP id
 s12-20020a170902ea0c00b001a0527b9189mr7876940plg.11.1680137354466; 
 Wed, 29 Mar 2023 17:49:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350bveMH01s7+yH455+SdTj3dQe+mfSCF727NIqTHZ2zVZXUcA2FnI/LaSBhxpMsA8Pcm1zN+9zySOov6rVuVADo=
X-Received: by 2002:a17:902:ea0c:b0:1a0:527b:9189 with SMTP id
 s12-20020a170902ea0c00b001a0527b9189mr7876926plg.11.1680137354120; Wed, 29
 Mar 2023 17:49:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
 <CADnq5_MMg4XD3QK72ZfLYvq02hYrX2aApNT2JUEAvQGvBP+NeQ@mail.gmail.com>
In-Reply-To: <CADnq5_MMg4XD3QK72ZfLYvq02hYrX2aApNT2JUEAvQGvBP+NeQ@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 30 Mar 2023 08:49:02 +0800
Message-ID: <CAAd53p5A4Rxs0FHXzkgP9sXe=5_mWjfkDeROBT2k71PYKVKTwQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Reset GPU on S0ix when device supports
 BOCO
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Mar 2023 02:08:42 +0000
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Tim Huang <tim.huang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Guchun Chen <guchun.chen@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, Jiansong Chen <Jiansong.Chen@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Evan Quan <evan.quan@amd.com>,
 Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 9:21=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Wed, Mar 29, 2023 at 6:00=E2=80=AFAM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > When the power is lost due to ACPI power resources being turned off, th=
e
> > driver should reset the GPU so it can work anew.
> >
> > First, _PR3 support of the hierarchy needs to be found correctly. Since
> > the GPU on some discrete GFX cards is behind a PCIe switch, checking th=
e
> > _PR3 on downstream port alone is not enough, as the _PR3 can associate
> > to the root port above the PCIe switch.
> >
> > Once the _PR3 is found and BOCO support is correctly marked, use that
> > information to inform the GPU should be reset. This solves an issue tha=
t
> > system freeze on a Intel ADL desktop that uses S0ix for sleep and D3col=
d
> > is supported for the GFX slot.
>
> I don't think we need to reset the GPU.  If the power is turned off, a
> reset shouldn't be necessary. The reset is only necessary when the
> power is not turned off to put the GPU into a known good state.  It
> should be in that state already if the power is turn off.  It sounds
> like the device is not actually getting powered off.

I had the impression that the GPU gets reset because S3 turned the
power rail off.

So the actual intention for GPU reset is because S3 doesn't guarantee
the power is being turned off?

Kai-Heng

>
> Alex
>
> >
> > Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  3 +++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  7 ++++++-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 12 +++++-------
> >  3 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_acpi.c
> > index 60b1857f469e..407456ac0e84 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > @@ -987,6 +987,9 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_dev=
ice *adev)
> >         if (amdgpu_sriov_vf(adev))
> >                 return false;
> >
> > +       if (amdgpu_device_supports_boco(adev_to_drm(adev)))
> > +               return true;
> > +
> >  #if IS_ENABLED(CONFIG_SUSPEND)
> >         return pm_suspend_target_state !=3D PM_SUSPEND_TO_IDLE;
> >  #else
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index f5658359ff5c..d56b7a2bafa6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2181,7 +2181,12 @@ static int amdgpu_device_ip_early_init(struct am=
dgpu_device *adev)
> >
> >         if (!(adev->flags & AMD_IS_APU)) {
> >                 parent =3D pci_upstream_bridge(adev->pdev);
> > -               adev->has_pr3 =3D parent ? pci_pr3_present(parent) : fa=
lse;
> > +               do {
> > +                       if (pci_pr3_present(parent)) {
> > +                               adev->has_pr3 =3D true;
> > +                               break;
> > +                       }
> > +               } while ((parent =3D pci_upstream_bridge(parent)));
> >         }
> >
> >         amdgpu_amdkfd_device_probe(adev);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_drv.c
> > index ba5def374368..5d81fcac4b0a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -2415,10 +2415,11 @@ static int amdgpu_pmops_suspend(struct device *=
dev)
> >         struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> >         struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
> >
> > -       if (amdgpu_acpi_is_s0ix_active(adev))
> > -               adev->in_s0ix =3D true;
> > -       else if (amdgpu_acpi_is_s3_active(adev))
> > +       if (amdgpu_acpi_is_s3_active(adev) ||
> > +           amdgpu_device_supports_boco(drm_dev))
> >                 adev->in_s3 =3D true;
> > +       else if (amdgpu_acpi_is_s0ix_active(adev))
> > +               adev->in_s0ix =3D true;
> >         if (!adev->in_s0ix && !adev->in_s3)
> >                 return 0;
> >         return amdgpu_device_suspend(drm_dev, true);
> > @@ -2449,10 +2450,7 @@ static int amdgpu_pmops_resume(struct device *de=
v)
> >                 adev->no_hw_access =3D true;
> >
> >         r =3D amdgpu_device_resume(drm_dev, true);
> > -       if (amdgpu_acpi_is_s0ix_active(adev))
> > -               adev->in_s0ix =3D false;
> > -       else
> > -               adev->in_s3 =3D false;
> > +       adev->in_s0ix =3D adev->in_s3 =3D false;
> >         return r;
> >  }
> >
> > --
> > 2.34.1
> >

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374A6CFDA8
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Mar 2023 10:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE9210ED23;
	Thu, 30 Mar 2023 08:03:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA79A10ECBD
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Mar 2023 03:36:33 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 53FC23F235
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Mar 2023 03:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1680147390;
 bh=WVv3t+Pvx7XOKT30ywqnnbhHTlBPQeWR9Rwxzm5MrhU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=WMg0xioAA20OBa6QjziKxn78H/GLCsj+Axsu5X44d9c646/icWWQByNG+fM1mol6b
 y/DQyHbe4bZgdMSSW01/sXw/LHo1N4oacDGOnMosytnBj06yWiUUaLjpdDayTdsizU
 /Zy3AFGMvd/NPaJzozmjFiEZjYP+VSWBe+USpXVHGMqi3PWvS9MFrckFxdSYGZLU/e
 2VYYTwiOROAQhaWQ5y23aoR12ChDfaInzw7isOe6JR0oDSuz1Ka2Zz86kdUHbei+UW
 zAMwYZ1OJYdPTSZwdpSV3eTyytDJ492wSVz2AjSNVVjnKIiHFZmrfDw299Gu83Z76W
 yF++Z2hw+s03w==
Received: by mail-pj1-f72.google.com with SMTP id
 j7-20020a17090aeb0700b0023d19dfe884so4824881pjz.4
 for <amd-gfx@lists.freedesktop.org>; Wed, 29 Mar 2023 20:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680147389;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WVv3t+Pvx7XOKT30ywqnnbhHTlBPQeWR9Rwxzm5MrhU=;
 b=W1DSSaS49yDkgcR8yjhbPZUGYBVjXJ6QuUpmH3vZf0j4Oq+v2hLeyYFT1ZF2X4CZGt
 jVjai2iP/xi5RQ2moLFN0ehouKC0ewnyiSpSlap/gzwPwRHxZUZbNub51VPvh5R8LEik
 0b+tCGaxQp9VZj+33rhx/nHQHYo/zuM+LaBbJHIASZ63eoYJNMxJ5epNPpoViPGGez1V
 pnWo/S+xdwNCUQ/H4IJ99VNt1+1bCO+nq7HbXv03iOLlDrfLEZlX2MWm0cpk65Z5AmwU
 x7y+2fbHidy0aNuMZb7Fcycrgt6961dLsBNFzhWGxPJsVyJb0L7ZX2Et8aagvt2nxcr3
 3euA==
X-Gm-Message-State: AAQBX9eGNZ8ujWZLNRZ3vXCxQA5cSq55OMC+o0+c9fI+xNLO21JlwjJa
 2OIg+7u/Xj+vrnVGQIUFcdQFRRL0/M1YabvJ4y3x5qtvUjAkz1s2Upj6xdI84AB5rNLJKbff88t
 66PypslZqTyZd2RgHV2W0djNkI9rHTmRuLLIwmzts3/+UcZEzLdgQL9t0U3M=
X-Received: by 2002:a65:520a:0:b0:513:a748:c7d5 with SMTP id
 o10-20020a65520a000000b00513a748c7d5mr36838pgp.3.1680147388558; 
 Wed, 29 Mar 2023 20:36:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7qcCrhgzUIomVjQN3NEsrGYThLydsbmh01I40JAf6r1o0KpqQ5jtvkohqYXO0KmVyfFwrKfX/56O0UesHOG8=
X-Received: by 2002:a65:520a:0:b0:513:a748:c7d5 with SMTP id
 o10-20020a65520a000000b00513a748c7d5mr36812pgp.3.1680147388176; Wed, 29 Mar
 2023 20:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230329095933.1203559-1-kai.heng.feng@canonical.com>
 <76853776-ddfd-2fbc-a209-ca4f77faa481@amd.com>
In-Reply-To: <76853776-ddfd-2fbc-a209-ca4f77faa481@amd.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 30 Mar 2023 11:36:15 +0800
Message-ID: <CAAd53p7sgowhaFS1b7MM0F0kf14sWf6jbF9T__=4BAMM8bnz3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Reset GPU on S0ix when device supports
 BOCO
To: Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 30 Mar 2023 08:03:39 +0000
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, Xinhui.Pan@amd.com,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, David Airlie <airlied@gmail.com>,
 Guchun Chen <guchun.chen@amd.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 amd-gfx@lists.freedesktop.org, Jiansong Chen <Jiansong.Chen@amd.com>,
 Kenneth Feng <kenneth.feng@amd.com>, Tim Huang <tim.huang@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Evan Quan <evan.quan@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Wed, Mar 29, 2023 at 9:23=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
> On 3/29/23 04:59, Kai-Heng Feng wrote:
> > When the power is lost due to ACPI power resources being turned off, th=
e
> > driver should reset the GPU so it can work anew.
> >
> > First, _PR3 support of the hierarchy needs to be found correctly. Since
> > the GPU on some discrete GFX cards is behind a PCIe switch, checking th=
e
> > _PR3 on downstream port alone is not enough, as the _PR3 can associate
> > to the root port above the PCIe switch.
>
> I think this should be split into two commits:
>
> * One of them to look at _PR3 further up in hierarchy to fix indication
> for BOCO support.

Yes, this part can be split up.

>
> * One to adjust policy for whether to reset

IIUC, the GPU only needs to be reset when the power status isn't certain?

Assuming power resources in _PR3 are really disabled, GPU is already
reset by itself. That means reset shouldn't be necessary for D3cold,
am I understanding it correctly?

However, this is a desktop plugged with GFX card that has external
power, does that assumption still stand? Perform resetting on D3cold
can cover this scenario.

>
>
> > Once the _PR3 is found and BOCO support is correctly marked, use that
> > information to inform the GPU should be reset. This solves an issue tha=
t
> > system freeze on a Intel ADL desktop that uses S0ix for sleep and D3col=
d
> > is supported for the GFX slot.
>
> I'm worried this is still papering over an underlying issue with L0s
> handling on ALD + Navi1x/Navi2x.

Is it possible to get the ASIC's ASPM parameter under Windows? Knowing
the difference can be useful.

>
> Also, what about runtime suspend?  If you unplug the monitor from this
> dGPU and interact with it over SSH it should go into runtime suspend.
>
> Is it working properly for that case now?

Thanks for the tip. Runtime resume doesn't work at all:
[ 1087.601631] pcieport 0000:00:01.0: power state changed by ACPI to D0
[ 1087.613820] pcieport 0000:00:01.0: restoring config space at offset
0x2c (was 0x43, writing 0x43)
[ 1087.613835] pcieport 0000:00:01.0: restoring config space at offset
0x28 (was 0x41, writing 0x41)
[ 1087.613841] pcieport 0000:00:01.0: restoring config space at offset
0x24 (was 0xfff10001, writing 0xfff10001)
[ 1087.613978] pcieport 0000:00:01.0: PME# disabled
[ 1087.613984] pcieport 0000:00:01.0: waiting 100 ms for downstream
link, after activation
[ 1089.330956] pcieport 0000:01:00.0: not ready 1023ms after resume; giving=
 up
[ 1089.373036] pcieport 0000:01:00.0: Unable to change power state
from D3cold to D0, device inaccessible

After a short while the whole system froze.

So the upstream port of GFX's PCIe switch cannot be powered on again.

Kai-Heng

>
> >
> > Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2458
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |  3 +++
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  7 ++++++-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 12 +++++-------
> >   3 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_acpi.c
> > index 60b1857f469e..407456ac0e84 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> > @@ -987,6 +987,9 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_dev=
ice *adev)
> >       if (amdgpu_sriov_vf(adev))
> >               return false;
> >
> > +     if (amdgpu_device_supports_boco(adev_to_drm(adev)))
> > +             return true;
> > +
> >   #if IS_ENABLED(CONFIG_SUSPEND)
> >       return pm_suspend_target_state !=3D PM_SUSPEND_TO_IDLE;
> >   #else
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index f5658359ff5c..d56b7a2bafa6 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2181,7 +2181,12 @@ static int amdgpu_device_ip_early_init(struct am=
dgpu_device *adev)
> >
> >       if (!(adev->flags & AMD_IS_APU)) {
> >               parent =3D pci_upstream_bridge(adev->pdev);
> > -             adev->has_pr3 =3D parent ? pci_pr3_present(parent) : fals=
e;
> > +             do {
> > +                     if (pci_pr3_present(parent)) {
> > +                             adev->has_pr3 =3D true;
> > +                             break;
> > +                     }
> > +             } while ((parent =3D pci_upstream_bridge(parent)));
> >       }
> >
> >       amdgpu_amdkfd_device_probe(adev);
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_drv.c
> > index ba5def374368..5d81fcac4b0a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -2415,10 +2415,11 @@ static int amdgpu_pmops_suspend(struct device *=
dev)
> >       struct drm_device *drm_dev =3D dev_get_drvdata(dev);
> >       struct amdgpu_device *adev =3D drm_to_adev(drm_dev);
> >
> > -     if (amdgpu_acpi_is_s0ix_active(adev))
> > -             adev->in_s0ix =3D true;
> > -     else if (amdgpu_acpi_is_s3_active(adev))
> > +     if (amdgpu_acpi_is_s3_active(adev) ||
> > +         amdgpu_device_supports_boco(drm_dev))
> >               adev->in_s3 =3D true;
> > +     else if (amdgpu_acpi_is_s0ix_active(adev))
> > +             adev->in_s0ix =3D true;
> >       if (!adev->in_s0ix && !adev->in_s3)
> >               return 0;
> >       return amdgpu_device_suspend(drm_dev, true);
> > @@ -2449,10 +2450,7 @@ static int amdgpu_pmops_resume(struct device *de=
v)
> >               adev->no_hw_access =3D true;
> >
> >       r =3D amdgpu_device_resume(drm_dev, true);
> > -     if (amdgpu_acpi_is_s0ix_active(adev))
> > -             adev->in_s0ix =3D false;
> > -     else
> > -             adev->in_s3 =3D false;
> > +     adev->in_s0ix =3D adev->in_s3 =3D false;
> >       return r;
> >   }
> >

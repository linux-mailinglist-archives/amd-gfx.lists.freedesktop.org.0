Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB6A585E8
	for <lists+amd-gfx@lfdr.de>; Sun,  9 Mar 2025 17:51:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6668A10E2D0;
	Sun,  9 Mar 2025 16:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J+cKlRvT";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57BD610E2D0
 for <amd-gfx@lists.freedesktop.org>; Sun,  9 Mar 2025 16:51:31 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-8670d630d2dso1256882241.1
 for <amd-gfx@lists.freedesktop.org>; Sun, 09 Mar 2025 09:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741539090; x=1742143890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLtzkQvVe3W4CN92XU/C3QtEPlj28rqj91AQ+LD5wkU=;
 b=J+cKlRvT2SjgiLUexd4UApxj/PG9lVzcUSYaLlMP3f6D8WwFE28IaICCC/eT1pe/vB
 mzuKfQiGOO58bRj2pwXYh+4xuJQy3J3zI4BG3LfQo3IHZqIjqK7bTMzqC63VHQ4L2FDL
 o4AnrgOOF/Aefbj3WOXEx6o7wHo3dXRlG7IUqDB1vSJkccTE0th83FdF6rgv+j5jHoqx
 PXlSBlqptdIH+kkp9Hzqw4jmlOVT/FFEsupljUI6Oqkg/vMMGpkaen7Pgjzd+R2cPaSH
 BYRscWh6+qTew476j0STBXg93aN8AmrTu2+biTGmA7Zw9ZwOS5wLI7k9ZbXYShSrbfBN
 h9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741539090; x=1742143890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WLtzkQvVe3W4CN92XU/C3QtEPlj28rqj91AQ+LD5wkU=;
 b=X1w/rmpm3W6yVXi6HKdaq4UJRfuIKrLXsY1Jr1A2hcsvlo3dJZem9AazKz9jxqNVBI
 R028YYanAW1bfhs5DxbHItU7Ezt0/SBsB3jooex8djaqUvyBB0Sf7eOu/SdpJ/nZ3nbT
 8E0H//jD5SOoTwQkZyBqSEtxb9YFQQkSVY1BZdo/bdGGSjuAFUSqpMi5zHH69QYFEG6c
 Xk0GoH2YC8+Mzwb2L/1Sy8PSv0gYZekgWQmngcE9Wq3MmWPT+XWUTFe97bj6nUpyNvkd
 yOzMb9seBLgS3kEdqlIJvESyr7gzIUCaRZmavh5B0E8A22FJKE/q93um1UV7qD+BLnOq
 /HSA==
X-Gm-Message-State: AOJu0Yxb+IE2tN0LTxl6SsPNjSEeYte+LpAB+y1Bi0MI5YN3OTGkf6ac
 waxsobYKmnYPed4/VjJnObcdABGs9cFWp8LLYucbARzPdMrlOZ+wyVSIwJ5usBAUeaJoegII+hj
 HXJMF8f3lOJrl2jGxB590Y+Ld1Tg=
X-Gm-Gg: ASbGncsmG14UiquwBuhTI5/2Dg8T68F7/bkuKyOrUi+nGMPgK+3Qa1G0LcZrHdaN4i8
 7/envB69liulojOCCuJIPggqbsF8K3lFaQfVl5E5oOkcIjDnIUNZU5av7vD5jvyfxrIcyV9wHEA
 ryy3B6ZFn7uNkbcnHd7JgzmU6S
X-Google-Smtp-Source: AGHT+IE7t8+LEes8b58y6WgAaFxO4ZMppxrpdiSWTA4ivqVkcW65RD9YtHFGYsbhhgCASsUS6W+UDpKBjlnD/rzdOA4=
X-Received: by 2002:a05:6102:41a8:b0:4bb:e5bf:9c7d with SMTP id
 ada2fe7eead31-4c30a680960mr6138782137.17.1741539090179; Sun, 09 Mar 2025
 09:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250306014958.785021-1-alexandre.f.demers@gmail.com>
 <20250306014958.785021-2-alexandre.f.demers@gmail.com>
 <CADnq5_O65aDEgaVkzZ1xZyqEgqHr4nR1WDWPJ94jKRtu629o9w@mail.gmail.com>
 <CAPEhTTGxA_owpgD6=4XUCcyVXRjBxRJveYdbaVqjbug9Digusg@mail.gmail.com>
In-Reply-To: <CAPEhTTGxA_owpgD6=4XUCcyVXRjBxRJveYdbaVqjbug9Digusg@mail.gmail.com>
From: Alexandre Demers <alexandre.f.demers@gmail.com>
Date: Sun, 9 Mar 2025 12:51:19 -0400
X-Gm-Features: AQ5f1JoWRpphOH_65Qd2q3L_7d_d-GXLgWqyxEjPAwZcrbMJdlziPLjeNNyococ
Message-ID: <CAPEhTTEhee5_1w9+XRnAtqNKndXYksV7Ryxqh3WnPL+sQxpW-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/amdgpu: add or move defines for DCE6 in sid.h
To: Alex Deucher <alexdeucher@gmail.com>
Cc: amd-gfx@lists.freedesktop.org
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

On Sat, Mar 8, 2025 at 7:32=E2=80=AFPM Alexandre Demers
<alexandre.f.demers@gmail.com> wrote:
>
> On Thu, Mar 6, 2025 at 10:19=E2=80=AFAM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Wed, Mar 5, 2025 at 9:08=E2=80=AFPM Alexandre Demers
> > <alexandre.f.demers@gmail.com> wrote:
> > >
> > > For coherence with DCE8 et DCE10, add or move some values under sid.h=
.
> > >
> > > Signed-off-by: Alexandre Demers <alexandre.f.demers@gmail.com>
> >
> > This change doesn't build.  Please adjust the order of the patches as
> > needed to make sure they all build.
> >
> > Alex
>
> Yeah, adding sid.h should probably be at the end, once all changes are
> made. I'll look at it.
>
> Thanks for noticing.
> Alexandre

V4 is sent, it compiles at each commit. I did not include the DCE8
patch (4/4) since it was accepted in V3 and applied.

Alexandre
> >
> > > ---
> > >  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 63 ++++++++++++++-----------=
--
> > >  drivers/gpu/drm/amd/amdgpu/si_enums.h |  7 ---
> > >  drivers/gpu/drm/amd/amdgpu/sid.h      | 29 +++++++++---
> > >  3 files changed, 55 insertions(+), 44 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/=
amd/amdgpu/dce_v6_0.c
> > > index a72fd7220081..185401d66961 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> > > @@ -32,6 +32,7 @@
> > >  #include "amdgpu.h"
> > >  #include "amdgpu_pm.h"
> > >  #include "amdgpu_i2c.h"
> > > +#include "sid.h"
> > >  #include "atom.h"
> > >  #include "amdgpu_atombios.h"
> > >  #include "atombios_crtc.h"
> > > @@ -59,31 +60,31 @@ static void dce_v6_0_set_irq_funcs(struct amdgpu_=
device *adev);
> > >
> > >  static const u32 crtc_offsets[6] =3D
> > >  {
> > > -       SI_CRTC0_REGISTER_OFFSET,
> > > -       SI_CRTC1_REGISTER_OFFSET,
> > > -       SI_CRTC2_REGISTER_OFFSET,
> > > -       SI_CRTC3_REGISTER_OFFSET,
> > > -       SI_CRTC4_REGISTER_OFFSET,
> > > -       SI_CRTC5_REGISTER_OFFSET
> > > +       CRTC0_REGISTER_OFFSET,
> > > +       CRTC1_REGISTER_OFFSET,
> > > +       CRTC2_REGISTER_OFFSET,
> > > +       CRTC3_REGISTER_OFFSET,
> > > +       CRTC4_REGISTER_OFFSET,
> > > +       CRTC5_REGISTER_OFFSET
> > >  };
> > >
> > >  static const u32 hpd_offsets[] =3D
> > >  {
> > > -       mmDC_HPD1_INT_STATUS - mmDC_HPD1_INT_STATUS,
> > > -       mmDC_HPD2_INT_STATUS - mmDC_HPD1_INT_STATUS,
> > > -       mmDC_HPD3_INT_STATUS - mmDC_HPD1_INT_STATUS,
> > > -       mmDC_HPD4_INT_STATUS - mmDC_HPD1_INT_STATUS,
> > > -       mmDC_HPD5_INT_STATUS - mmDC_HPD1_INT_STATUS,
> > > -       mmDC_HPD6_INT_STATUS - mmDC_HPD1_INT_STATUS,
> > > +       HPD0_REGISTER_OFFSET,
> > > +       HPD1_REGISTER_OFFSET,
> > > +       HPD2_REGISTER_OFFSET,
> > > +       HPD3_REGISTER_OFFSET,
> > > +       HPD4_REGISTER_OFFSET,
> > > +       HPD5_REGISTER_OFFSET
> > >  };
> > >
> > >  static const uint32_t dig_offsets[] =3D {
> > > -       SI_CRTC0_REGISTER_OFFSET,
> > > -       SI_CRTC1_REGISTER_OFFSET,
> > > -       SI_CRTC2_REGISTER_OFFSET,
> > > -       SI_CRTC3_REGISTER_OFFSET,
> > > -       SI_CRTC4_REGISTER_OFFSET,
> > > -       SI_CRTC5_REGISTER_OFFSET,
> > > +       CRTC0_REGISTER_OFFSET,
> > > +       CRTC1_REGISTER_OFFSET,
> > > +       CRTC2_REGISTER_OFFSET,
> > > +       CRTC3_REGISTER_OFFSET,
> > > +       CRTC4_REGISTER_OFFSET,
> > > +       CRTC5_REGISTER_OFFSET,
> > >         (0x13830 - 0x7030) >> 2,
> > >  };
> > >
> > > @@ -1359,13 +1360,13 @@ static void dce_v6_0_audio_enable(struct amdg=
pu_device *adev,
> > >
> > >  static const u32 pin_offsets[7] =3D
> > >  {
> > > -       (0x1780 - 0x1780),
> > > -       (0x1786 - 0x1780),
> > > -       (0x178c - 0x1780),
> > > -       (0x1792 - 0x1780),
> > > -       (0x1798 - 0x1780),
> > > -       (0x179d - 0x1780),
> > > -       (0x17a4 - 0x1780),
> > > +       AUD0_REGISTER_OFFSET,
> > > +       AUD1_REGISTER_OFFSET,
> > > +       AUD2_REGISTER_OFFSET,
> > > +       AUD3_REGISTER_OFFSET,
> > > +       AUD4_REGISTER_OFFSET,
> > > +       AUD5_REGISTER_OFFSET,
> > > +       AUD6_REGISTER_OFFSET,
> > >  };
> > >
> > >  static int dce_v6_0_audio_init(struct amdgpu_device *adev)
> > > @@ -2876,22 +2877,22 @@ static void dce_v6_0_set_crtc_vblank_interrup=
t_state(struct amdgpu_device *adev,
> > >
> > >         switch (crtc) {
> > >         case 0:
> > > -               reg_block =3D SI_CRTC0_REGISTER_OFFSET;
> > > +               reg_block =3D CRTC0_REGISTER_OFFSET;
> > >                 break;
> > >         case 1:
> > > -               reg_block =3D SI_CRTC1_REGISTER_OFFSET;
> > > +               reg_block =3D CRTC1_REGISTER_OFFSET;
> > >                 break;
> > >         case 2:
> > > -               reg_block =3D SI_CRTC2_REGISTER_OFFSET;
> > > +               reg_block =3D CRTC2_REGISTER_OFFSET;
> > >                 break;
> > >         case 3:
> > > -               reg_block =3D SI_CRTC3_REGISTER_OFFSET;
> > > +               reg_block =3D CRTC3_REGISTER_OFFSET;
> > >                 break;
> > >         case 4:
> > > -               reg_block =3D SI_CRTC4_REGISTER_OFFSET;
> > > +               reg_block =3D CRTC4_REGISTER_OFFSET;
> > >                 break;
> > >         case 5:
> > > -               reg_block =3D SI_CRTC5_REGISTER_OFFSET;
> > > +               reg_block =3D CRTC5_REGISTER_OFFSET;
> > >                 break;
> > >         default:
> > >                 DRM_DEBUG("invalid crtc %d\n", crtc);
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/si_enums.h b/drivers/gpu/drm/=
amd/amdgpu/si_enums.h
> > > index 4e935baa7b91..cdf8eebaa392 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/si_enums.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/si_enums.h
> > > @@ -121,13 +121,6 @@
> > >  #define CURSOR_UPDATE_LOCK             (1 << 16)
> > >  #define CURSOR_DISABLE_MULTIPLE_UPDATE (1 << 24)
> > >
> > > -#define SI_CRTC0_REGISTER_OFFSET                0
> > > -#define SI_CRTC1_REGISTER_OFFSET                0x300
> > > -#define SI_CRTC2_REGISTER_OFFSET                0x2600
> > > -#define SI_CRTC3_REGISTER_OFFSET                0x2900
> > > -#define SI_CRTC4_REGISTER_OFFSET                0x2c00
> > > -#define SI_CRTC5_REGISTER_OFFSET                0x2f00
> > > -
> > >  #define DMA0_REGISTER_OFFSET 0x000
> > >  #define DMA1_REGISTER_OFFSET 0x200
> > >  #define ES_AND_GS_AUTO       3
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/sid.h b/drivers/gpu/drm/amd/a=
mdgpu/sid.h
> > > index 9a39cbfe6db9..32a4e7d450c6 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/sid.h
> > > +++ b/drivers/gpu/drm/amd/amdgpu/sid.h
> > > @@ -1991,12 +1991,29 @@
> > >
> > >  //#dce stupp
> > >  /* display controller offsets used for crtc/cur/lut/grph/viewport/et=
c. */
> > > -#define SI_CRTC0_REGISTER_OFFSET                0 //(0x6df0 - 0x6df0=
)/4
> > > -#define SI_CRTC1_REGISTER_OFFSET                0x300 //(0x79f0 - 0x=
6df0)/4
> > > -#define SI_CRTC2_REGISTER_OFFSET                0x2600 //(0x105f0 - =
0x6df0)/4
> > > -#define SI_CRTC3_REGISTER_OFFSET                0x2900 //(0x111f0 - =
0x6df0)/4
> > > -#define SI_CRTC4_REGISTER_OFFSET                0x2c00 //(0x11df0 - =
0x6df0)/4
> > > -#define SI_CRTC5_REGISTER_OFFSET                0x2f00 //(0x129f0 - =
0x6df0)/4
> > > +#define CRTC0_REGISTER_OFFSET                 (0x1b7c - 0x1b7c) //(0=
x6df0 - 0x6df0)/4
> > > +#define CRTC1_REGISTER_OFFSET                 (0x1e7c - 0x1b7c) //(0=
x79f0 - 0x6df0)/4
> > > +#define CRTC2_REGISTER_OFFSET                 (0x417c - 0x1b7c) //(0=
x105f0 - 0x6df0)/4
> > > +#define CRTC3_REGISTER_OFFSET                 (0x447c - 0x1b7c) //(0=
x111f0 - 0x6df0)/4
> > > +#define CRTC4_REGISTER_OFFSET                 (0x477c - 0x1b7c) //(0=
x11df0 - 0x6df0)/4
> > > +#define CRTC5_REGISTER_OFFSET                 (0x4a7c - 0x1b7c) //(0=
x129f0 - 0x6df0)/4
> > > +
> > > +/* hpd instance offsets */
> > > +#define HPD0_REGISTER_OFFSET                 (0x1807 - 0x1807)
> > > +#define HPD1_REGISTER_OFFSET                 (0x180a - 0x1807)
> > > +#define HPD2_REGISTER_OFFSET                 (0x180d - 0x1807)
> > > +#define HPD3_REGISTER_OFFSET                 (0x1810 - 0x1807)
> > > +#define HPD4_REGISTER_OFFSET                 (0x1813 - 0x1807)
> > > +#define HPD5_REGISTER_OFFSET                 (0x1816 - 0x1807)
> > > +
> > > +/* audio endpt instance offsets */
> > > +#define AUD0_REGISTER_OFFSET                 (0x1780 - 0x1780)
> > > +#define AUD1_REGISTER_OFFSET                 (0x1786 - 0x1780)
> > > +#define AUD2_REGISTER_OFFSET                 (0x178c - 0x1780)
> > > +#define AUD3_REGISTER_OFFSET                 (0x1792 - 0x1780)
> > > +#define AUD4_REGISTER_OFFSET                 (0x1798 - 0x1780)
> > > +#define AUD5_REGISTER_OFFSET                 (0x179d - 0x1780)
> > > +#define AUD6_REGISTER_OFFSET                 (0x17a4 - 0x1780)
> > >
> > >  #define CURSOR_WIDTH 64
> > >  #define CURSOR_HEIGHT 64
> > > --
> > > 2.48.1
> > >

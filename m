Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DF8AFE82
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Apr 2024 04:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9D510F1A3;
	Wed, 24 Apr 2024 02:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a6q6BcoL";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E8310F1A3
 for <amd-gfx@lists.freedesktop.org>; Wed, 24 Apr 2024 02:33:37 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2ab1ddfded1so5305419a91.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Apr 2024 19:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713926017; x=1714530817; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7342SgRYLMtnUdxiFQwR1HuTZGgvfOVp22SVT+jECSw=;
 b=a6q6BcoL0SdtRrm8XQQqDF3a+WP/ew2Bip2FJ7trKIxAOrvU332oRX/k8qCB05bQN8
 Ns5LeC8ZrrbEYkv4XdstmQDtI5vm3qDpd1gKVhysmL3EctYngArqTMBWeRdUCb+tc5rd
 IfphP4EtBRdThvy0s9q7R3bg+rhYxM5Fpz2aSOt43oNlZvmQ59pV+jSTDTAxVeRbbxN1
 fTZ1gBqc+3OxcvjmsnYvdtU429vIZ6KHGU6KnHwgWWDGidvAAbomBk+4/5bnHEC7nDW3
 AJRXEdNaZJco0H40LPULbrO5kAQGWSraXP7Ha7bxHg9a1ovBwWSn/B+SAtk286+gEHBq
 GAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713926017; x=1714530817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7342SgRYLMtnUdxiFQwR1HuTZGgvfOVp22SVT+jECSw=;
 b=eWhJ6Ge+nF/AtP+e2JkoFqj+k39MznlBPR1769AoG391RLktKaEXMNRSNRmWjR9q0C
 wQtxt4qa84jFDGd8gSFQpZMmvYVub7NNCP9gV0rbKH6tuxYprfPJzZ3+w0pMQK2x59bL
 he5BKeT1aLYcHwEgBhjNrb4j0Y/z08ksLict/uGAwINs/dL1nuWNE5OJL2ePqDhiSj0Z
 1NlZUPcunbOpO/sb4+owJHz2KnQUZ4ozZShQLmp5u85eglBRt2MCeQVZPu+yQ4zvmwQp
 M6xbKsEpE4k2w1y2ruKRDP9cocgnbyRUn/r/1ualg/jmmkeeBsVmeVyZcznPTol/xV3W
 bVEg==
X-Gm-Message-State: AOJu0Yyax3+jg12TkTCs96GUy+bODbFCrMSFxpXaJyrrl/5UxUqYp9nZ
 eKLKP6V3TSW2Xctere1ANYCwWe6UXzzi6a2dthfbc1OQpghV+Ce4VBjhMDVthrprpq1HwXZ8Bbw
 9KlBlvo5tA2uFSfj7zdEeWo8yfDaDNA==
X-Google-Smtp-Source: AGHT+IF/ercTT75OPTuz8ye+5H5aHjiOUKmmKR+EnClsAdO4U89LPp2D4gG1CuqAFN/zrMx6FBh2qrwhPwVZNG2JWxw=
X-Received: by 2002:a17:90a:d486:b0:2a2:7a00:f101 with SMTP id
 s6-20020a17090ad48600b002a27a00f101mr1039041pju.47.1713926016672; Tue, 23 Apr
 2024 19:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240424011940.723906-1-jesse.zhang@amd.com>
 <CADnq5_MZeCg3dUnkCmKXu-m1Kp01yR0h1uz2htKoWaQdbj-+_A@mail.gmail.com>
 <DM4PR12MB5152BC1A6ECE3A5F86B55667E3102@DM4PR12MB5152.namprd12.prod.outlook.com>
In-Reply-To: <DM4PR12MB5152BC1A6ECE3A5F86B55667E3102@DM4PR12MB5152.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Apr 2024 22:33:24 -0400
Message-ID: <CADnq5_Pw+-jhwOMt0346aE6SFK=Wg6N=cFYGkYcFU7vx_nnkow@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix some uninitialized variables
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>, Leo Liu <leo.liiu@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Huang, Tim" <Tim.Huang@amd.com>
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

On Tue, Apr 23, 2024 at 10:04=E2=80=AFPM Zhang, Jesse(Jie) <Jesse.Zhang@amd=
.com> wrote:
>
> [AMD Official Use Only - General]
>
> Hi Alex,
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Wednesday, April 24, 2024 9:46 AM
> To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; Deucher, Alexander <Alexander.Deucher@=
amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Huang, Tim <Tim.Hua=
ng@amd.com>
> Subject: Re: [PATCH] drm/amdgpu: fix some uninitialized variables
>
> On Tue, Apr 23, 2024 at 9:27=E2=80=AFPM Jesse Zhang <jesse.zhang@amd.com>=
 wrote:
> >
> > Fix some variables not initialized before use.
> > Scan them out using Synopsys tools.
> >
> > Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 2 +-
> > drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 5 +++++
> >  drivers/gpu/drm/amd/amdgpu/atom.c       | 1 +
> >  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c  | 3 ++-
> > drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c  | 3 ++-
> > drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c  | 3 ++-
>
> Please split out the SDMA changes into a separate patch.
>
> More comments below on the other hunks.
>
> >  6 files changed, 13 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> > index 59acf424a078..60d97cd14855 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> > @@ -742,7 +742,7 @@ int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parse=
r *p,
> >         uint32_t destroyed =3D 0;
> >         uint32_t created =3D 0;
> >         uint32_t allocated =3D 0;
> > -       uint32_t tmp, handle =3D 0;
> > +       uint32_t tmp =3D 0, handle =3D 0;
>
> Can you elaborate on what the issue is here?  Presumably it's warning abo=
ut size being passed as a parameter in the function?
> [Zhang, Jesse(Jie)]  Using uninitialized value *size when calling amdgpu_=
vce_cs_reloc for case 0x03000001. Because uint32_t *size =3D &tmp;
>                 I'm not sure if other commands initialize the size before=
 running case 0x03000001.

Yeah, I don't really see a cleaner way to handle this.  Maybe Leo has
a better idea?

Alex

>
> >         uint32_t *size =3D &tmp;
> >         unsigned int idx;
> >         int i, r =3D 0;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> > index 677eb141554e..13125ddd5e86 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
> > @@ -410,6 +410,11 @@ static void amdgpu_vcn_idle_work_handler(struct wo=
rk_struct *work)
> >                         else
> >                                 new_state.fw_based =3D
> > VCN_DPG_STATE__UNPAUSE;
> >
> > +                       if (amdgpu_fence_count_emitted(adev->jpeg.inst-=
>ring_dec))
> > +                               new_state.jpeg =3D VCN_DPG_STATE__PAUSE=
;
> > +                       else
> > +                               new_state.jpeg =3D
> > + VCN_DPG_STATE__UNPAUSE;
> > +
> >                         adev->vcn.pause_dpg_mode(adev, j, &new_state);
> >                 }
> >
>
> This should be a separate patch as well.
>  Thanks for your reminder, Alex, I will.
>
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c
> > b/drivers/gpu/drm/amd/amdgpu/atom.c
> > index 72362df352f6..d552e013354c 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> > @@ -1243,6 +1243,7 @@ static int amdgpu_atom_execute_table_locked(struc=
t atom_context *ctx, int index,
> >         ectx.ps_size =3D params_size;
> >         ectx.abort =3D false;
> >         ectx.last_jump =3D 0;
> > +       ectx.last_jump_jiffies =3D 0;
> >         if (ws) {
> >                 ectx.ws =3D kcalloc(4, ws, GFP_KERNEL);
> >                 ectx.ws_size =3D ws;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> > b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> > index 45a2d0a5a2d7..b7d33d78bce0 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> > @@ -999,7 +999,8 @@ static int sdma_v5_0_ring_test_ring(struct amdgpu_r=
ing *ring)
> >         r =3D amdgpu_ring_alloc(ring, 20);
> >         if (r) {
> >                 DRM_ERROR("amdgpu: dma failed to lock ring %d (%d).\n",=
 ring->idx, r);
> > -               amdgpu_device_wb_free(adev, index);
> > +               if (!ring->is_mes_queue)
> > +                       amdgpu_device_wb_free(adev, index);
> >                 return r;
> >         }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> > b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> > index 43e64b2da575..cc9e961f0078 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> > @@ -839,7 +839,8 @@ static int sdma_v5_2_ring_test_ring(struct amdgpu_r=
ing *ring)
> >         r =3D amdgpu_ring_alloc(ring, 20);
> >         if (r) {
> >                 DRM_ERROR("amdgpu: dma failed to lock ring %d (%d).\n",=
 ring->idx, r);
> > -               amdgpu_device_wb_free(adev, index);
> > +               if (!ring->is_mes_queue)
> > +                       amdgpu_device_wb_free(adev, index);
> >                 return r;
> >         }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> > b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> > index 1f4877195213..c833b6b8373b 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> > @@ -861,7 +861,8 @@ static int sdma_v6_0_ring_test_ring(struct amdgpu_r=
ing *ring)
> >         r =3D amdgpu_ring_alloc(ring, 5);
> >         if (r) {
> >                 DRM_ERROR("amdgpu: dma failed to lock ring %d (%d).\n",=
 ring->idx, r);
> > -               amdgpu_device_wb_free(adev, index);
> > +               if (!ring->is_mes_queue)
> > +                       amdgpu_device_wb_free(adev, index);
> >                 return r;
> >         }
> >
> > --
> > 2.25.1
> >

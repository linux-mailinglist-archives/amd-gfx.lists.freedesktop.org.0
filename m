Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE27D899F
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Oct 2023 22:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F16DE10E898;
	Thu, 26 Oct 2023 20:19:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173B410E898
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Oct 2023 20:19:43 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1e0ee4e777bso867589fac.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Oct 2023 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698351582; x=1698956382; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UYy9twOouI7FxmKjBgKK6LnsKTLbQ7u0lo7814Lnwpo=;
 b=RAz1ozB0PIWRqqsMjJYwZkrBo+W1h1BjVSL27yuN9iEEARUqfVXqn+mzyejsxJPYbk
 EfAEc1OGn0H1FoHhAeUkQsKf/+zRa/OtPskA2YV1VJVtHXIL7a3e76QX7+x0W4F06M/Y
 5qdOYVdi+lehnlo1Fy1f6tNWhcTp4MJcq+KAqxGOxMbd7z12IHZYowHkN9oQn12fF2qs
 pGQhAvz3YvhS3zAC5AZuayMWSPEVSQLJRVeywUxFp7ZZ3G6udl6G/8zs/oPm+RdVzusZ
 DYWTYNemK31bskrANFFrIDUwnDAB7JWqst618HfHXHXhkCgmceWDUpw95rfZ96T4OBSw
 0lCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698351582; x=1698956382;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYy9twOouI7FxmKjBgKK6LnsKTLbQ7u0lo7814Lnwpo=;
 b=hv4eCK5ZSEFgXdhtYDAN3mxMIbdh76UoZDT94X5iTVta3+VfBnpeJW+CLTI2wyI6WJ
 Vmnc8P2MuiZQC635/KbhkyaImXoX2NeG9kavKS+VqAGgEx22mTFBuUkh4WT3ORji8KM3
 Rrn1Gq8M3Nb16jV5a1uQufmyQTgmIyfSmVTK3RjIqzk3zrvEN2o4H76r2PZN3PYEj+7K
 cMhJ9JWsc7rwaCWUTdYki+BAInHFKwwciKJowOh3bSGAQmnVe5hIMloWXRku047gqJ4E
 2VAcj9Q0KkTNvGcZvxwwKrEt8qFQof/OEYysDKvcMSNg40FGEyMkI/0QqfqRs8A9Kgm1
 F0/g==
X-Gm-Message-State: AOJu0YygoT7XhtneDQHWm84jrjR2qmwLmyq822k0AjEyl7j2cC57Ncd0
 cRIta0bzvu2AVnil9tDdroA2CRkvH5G6Qi6bkAOYh+Om
X-Google-Smtp-Source: AGHT+IHS+JBVrywWudWa4AizsXWWl6d2MmNdZ+5P3g3VjxWbTocdwA/1+KJwtEbg6GUfPgRd9wf+Pn5KfvIsOPsa+24=
X-Received: by 2002:a05:6870:d8cf:b0:1d6:5b09:1584 with SMTP id
 of15-20020a056870d8cf00b001d65b091584mr1005117oac.5.1698351582177; Thu, 26
 Oct 2023 13:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231025171928.3318505-1-alexander.deucher@amd.com>
 <96db9e3d-4636-4da4-b4d1-ca3f5fd8d887@gmail.com>
 <CADnq5_ORyv9MDfUd3NPDw+APUunDjkTW4Bx4z0FoCiK+s_i+uw@mail.gmail.com>
 <04db543c-7aec-4550-878f-a9753142130e@gmail.com>
 <a8a0eb47-3aca-4c87-b5f7-dc54e5667944@gmail.com>
In-Reply-To: <a8a0eb47-3aca-4c87-b5f7-dc54e5667944@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Oct 2023 16:19:31 -0400
Message-ID: <CADnq5_M2WoWmqbgOu5NVh4npb+taentR8wySVDEToRC5UOoN7w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: move buffer funcs setting up a level
To: Luben Tuikov <ltuikov89@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Luben Tuikov <luben.tuikov@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Thanks!

On Thu, Oct 26, 2023 at 4:17=E2=80=AFPM Luben Tuikov <ltuikov89@gmail.com> =
wrote:
>
> Pushed to drm-misc-next.
>
> Regards,
> Luben
>
> On 2023-10-26 15:52, Luben Tuikov wrote:
> > On 2023-10-26 15:32, Alex Deucher wrote:
> >> On Thu, Oct 26, 2023 at 2:22=E2=80=AFAM Christian K=C3=B6nig
> >> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>
> >>> Am 25.10.23 um 19:19 schrieb Alex Deucher:
> >>>> Rather than doing this in the IP code for the SDMA paging
> >>>> engine, move it up to the core device level init level.
> >>>> This should fix the scheduler init ordering.
> >>>>
> >>>> v2: drop extra parens
> >>>> v3: drop SDMA helpers
> >>>>
> >>>> Tested-by: Luben Tuikov <luben.tuikov@amd.com>
> >>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>>
> >>> I don't know of hand if the high level function really cover everythi=
ng,
> >>> so only Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com> for=
 now.
> >>>
> >>
> >> Luben,
> >>
> >> Was this needed for some of the scheduler stuff that is pending?  If
> >> you would rather take it via drm-misc to align with the scheduler
> >> changes, that works for me, otherwise I can take it via the amdgpu
> >> tree.
> >
> > Hi Alex,
> >
> > Yes, it does.
> >
> > I can take it via drm-misc-next as that where the scheduler changes lan=
ded.
> >
> > I'll add Christian's Acked-by.
> >
> > I'll add a Fixes tag because ideally it should've gone before the dynam=
ic
> > sched_rq commit.
> >
> > Thanks for the heads-up!
> >
> > Regards,
> > Luben
> >
> >
> >
> >>
> >> Thanks,
> >>
> >> Alex
> >>
> >>
> >>> Christian.
> >>>
> >>>> ---
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 15 +++++++++++++++
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c   | 21 ------------------=
---
> >>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h   |  1 -
> >>>>   drivers/gpu/drm/amd/amdgpu/cik_sdma.c      |  5 -----
> >>>>   drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c     |  5 -----
> >>>>   drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c     |  5 -----
> >>>>   drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c     | 16 +---------------
> >>>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c     | 10 +---------
> >>>>   drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c     | 10 +---------
> >>>>   drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c     | 10 +---------
> >>>>   drivers/gpu/drm/amd/amdgpu/si_dma.c        |  5 -----
> >>>>   11 files changed, 19 insertions(+), 84 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_device.c
> >>>> index 2031a467b721..5c90080e93ba 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>> @@ -2662,6 +2662,9 @@ static int amdgpu_device_ip_init(struct amdgpu=
_device *adev)
> >>>>       if (r)
> >>>>               goto init_failed;
> >>>>
> >>>> +     if (adev->mman.buffer_funcs_ring->sched.ready)
> >>>> +             amdgpu_ttm_set_buffer_funcs_status(adev, true);
> >>>> +
> >>>>       /* Don't init kfd if whole hive need to be reset during init *=
/
> >>>>       if (!adev->gmc.xgmi.pending_reset) {
> >>>>               kgd2kfd_init_zone_device(adev);
> >>>> @@ -3260,6 +3263,8 @@ int amdgpu_device_ip_suspend(struct amdgpu_dev=
ice *adev)
> >>>>               amdgpu_virt_request_full_gpu(adev, false);
> >>>>       }
> >>>>
> >>>> +     amdgpu_ttm_set_buffer_funcs_status(adev, false);
> >>>> +
> >>>>       r =3D amdgpu_device_ip_suspend_phase1(adev);
> >>>>       if (r)
> >>>>               return r;
> >>>> @@ -3449,6 +3454,9 @@ static int amdgpu_device_ip_resume(struct amdg=
pu_device *adev)
> >>>>
> >>>>       r =3D amdgpu_device_ip_resume_phase2(adev);
> >>>>
> >>>> +     if (adev->mman.buffer_funcs_ring->sched.ready)
> >>>> +             amdgpu_ttm_set_buffer_funcs_status(adev, true);
> >>>> +
> >>>>       return r;
> >>>>   }
> >>>>
> >>>> @@ -4236,6 +4244,8 @@ void amdgpu_device_fini_hw(struct amdgpu_devic=
e *adev)
> >>>>       /* disable ras feature must before hw fini */
> >>>>       amdgpu_ras_pre_fini(adev);
> >>>>
> >>>> +     amdgpu_ttm_set_buffer_funcs_status(adev, false);
> >>>> +
> >>>>       amdgpu_device_ip_fini_early(adev);
> >>>>
> >>>>       amdgpu_irq_fini_hw(adev);
> >>>> @@ -4407,6 +4417,8 @@ int amdgpu_device_suspend(struct drm_device *d=
ev, bool fbcon)
> >>>>
> >>>>       amdgpu_ras_suspend(adev);
> >>>>
> >>>> +     amdgpu_ttm_set_buffer_funcs_status(adev, false);
> >>>> +
> >>>>       amdgpu_device_ip_suspend_phase1(adev);
> >>>>
> >>>>       if (!adev->in_s0ix)
> >>>> @@ -5178,6 +5190,9 @@ int amdgpu_do_asic_reset(struct list_head *dev=
ice_list_handle,
> >>>>                               if (r)
> >>>>                                       goto out;
> >>>>
> >>>> +                             if (tmp_adev->mman.buffer_funcs_ring->=
sched.ready)
> >>>> +                                     amdgpu_ttm_set_buffer_funcs_st=
atus(tmp_adev, true);
> >>>> +
> >>>>                               if (vram_lost)
> >>>>                                       amdgpu_device_fill_reset_magic=
(tmp_adev);
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_sdma.c
> >>>> index e8cbc4142d80..1d9d187de6ee 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c
> >>>> @@ -292,27 +292,6 @@ int amdgpu_sdma_init_microcode(struct amdgpu_de=
vice *adev,
> >>>>       return err;
> >>>>   }
> >>>>
> >>>> -void amdgpu_sdma_unset_buffer_funcs_helper(struct amdgpu_device *ad=
ev)
> >>>> -{
> >>>> -     struct amdgpu_ring *sdma;
> >>>> -     int i;
> >>>> -
> >>>> -     for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>> -             if (adev->sdma.has_page_queue) {
> >>>> -                     sdma =3D &adev->sdma.instance[i].page;
> >>>> -                     if (adev->mman.buffer_funcs_ring =3D=3D sdma) =
{
> >>>> -                             amdgpu_ttm_set_buffer_funcs_status(ade=
v, false);
> >>>> -                             break;
> >>>> -                     }
> >>>> -             }
> >>>> -             sdma =3D &adev->sdma.instance[i].ring;
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D sdma) {
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, false=
);
> >>>> -                     break;
> >>>> -             }
> >>>> -     }
> >>>> -}
> >>>> -
> >>>>   int amdgpu_sdma_ras_sw_init(struct amdgpu_device *adev)
> >>>>   {
> >>>>       int err =3D 0;
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_sdma.h
> >>>> index 513ac22120c1..173a2a308078 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h
> >>>> @@ -169,7 +169,6 @@ int amdgpu_sdma_init_microcode(struct amdgpu_dev=
ice *adev, u32 instance,
> >>>>                              bool duplicate);
> >>>>   void amdgpu_sdma_destroy_inst_ctx(struct amdgpu_device *adev,
> >>>>           bool duplicate);
> >>>> -void amdgpu_sdma_unset_buffer_funcs_helper(struct amdgpu_device *ad=
ev);
> >>>>   int amdgpu_sdma_ras_sw_init(struct amdgpu_device *adev);
> >>>>
> >>>>   #endif
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm=
/amd/amdgpu/cik_sdma.c
> >>>> index ee5dce6f6043..a3fccc4c1f43 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> >>>> @@ -308,8 +308,6 @@ static void cik_sdma_gfx_stop(struct amdgpu_devi=
ce *adev)
> >>>>       u32 rb_cntl;
> >>>>       int i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               rb_cntl =3D RREG32(mmSDMA0_GFX_RB_CNTL + sdma_offsets[=
i]);
> >>>>               rb_cntl &=3D ~SDMA0_GFX_RB_CNTL__RB_ENABLE_MASK;
> >>>> @@ -498,9 +496,6 @@ static int cik_sdma_gfx_resume(struct amdgpu_dev=
ice *adev)
> >>>>               r =3D amdgpu_ring_test_helper(ring);
> >>>>               if (r)
> >>>>                       return r;
> >>>> -
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D ring)
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, true)=
;
> >>>>       }
> >>>>
> >>>>       return 0;
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/dr=
m/amd/amdgpu/sdma_v2_4.c
> >>>> index b58a13bd75db..45377a175250 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> >>>> @@ -339,8 +339,6 @@ static void sdma_v2_4_gfx_stop(struct amdgpu_dev=
ice *adev)
> >>>>       u32 rb_cntl, ib_cntl;
> >>>>       int i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               rb_cntl =3D RREG32(mmSDMA0_GFX_RB_CNTL + sdma_offsets[=
i]);
> >>>>               rb_cntl =3D REG_SET_FIELD(rb_cntl, SDMA0_GFX_RB_CNTL, =
RB_ENABLE, 0);
> >>>> @@ -474,9 +472,6 @@ static int sdma_v2_4_gfx_resume(struct amdgpu_de=
vice *adev)
> >>>>               r =3D amdgpu_ring_test_helper(ring);
> >>>>               if (r)
> >>>>                       return r;
> >>>> -
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D ring)
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, true)=
;
> >>>>       }
> >>>>
> >>>>       return 0;
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/dr=
m/amd/amdgpu/sdma_v3_0.c
> >>>> index c5ea32687eb5..2ad615be4bb3 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> >>>> @@ -513,8 +513,6 @@ static void sdma_v3_0_gfx_stop(struct amdgpu_dev=
ice *adev)
> >>>>       u32 rb_cntl, ib_cntl;
> >>>>       int i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               rb_cntl =3D RREG32(mmSDMA0_GFX_RB_CNTL + sdma_offsets[=
i]);
> >>>>               rb_cntl =3D REG_SET_FIELD(rb_cntl, SDMA0_GFX_RB_CNTL, =
RB_ENABLE, 0);
> >>>> @@ -746,9 +744,6 @@ static int sdma_v3_0_gfx_resume(struct amdgpu_de=
vice *adev)
> >>>>               r =3D amdgpu_ring_test_helper(ring);
> >>>>               if (r)
> >>>>                       return r;
> >>>> -
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D ring)
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, true)=
;
> >>>>       }
> >>>>
> >>>>       return 0;
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/dr=
m/amd/amdgpu/sdma_v4_0.c
> >>>> index 683d51ae4bf1..3d68dd5523c6 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> >>>> @@ -877,8 +877,6 @@ static void sdma_v4_0_gfx_enable(struct amdgpu_d=
evice *adev, bool enable)
> >>>>       u32 rb_cntl, ib_cntl;
> >>>>       int i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               rb_cntl =3D RREG32_SDMA(i, mmSDMA0_GFX_RB_CNTL);
> >>>>               rb_cntl =3D REG_SET_FIELD(rb_cntl, SDMA0_GFX_RB_CNTL, =
RB_ENABLE, enable ? 1 : 0);
> >>>> @@ -913,8 +911,6 @@ static void sdma_v4_0_page_stop(struct amdgpu_de=
vice *adev)
> >>>>       u32 rb_cntl, ib_cntl;
> >>>>       int i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               rb_cntl =3D RREG32_SDMA(i, mmSDMA0_PAGE_RB_CNTL);
> >>>>               rb_cntl =3D REG_SET_FIELD(rb_cntl, SDMA0_PAGE_RB_CNTL,
> >>>> @@ -1402,13 +1398,7 @@ static int sdma_v4_0_start(struct amdgpu_devi=
ce *adev)
> >>>>                       r =3D amdgpu_ring_test_helper(page);
> >>>>                       if (r)
> >>>>                               return r;
> >>>> -
> >>>> -                     if (adev->mman.buffer_funcs_ring =3D=3D page)
> >>>> -                             amdgpu_ttm_set_buffer_funcs_status(ade=
v, true);
> >>>>               }
> >>>> -
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D ring)
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, true)=
;
> >>>>       }
> >>>>
> >>>>       return r;
> >>>> @@ -1921,11 +1911,8 @@ static int sdma_v4_0_hw_fini(void *handle)
> >>>>       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> >>>>       int i;
> >>>>
> >>>> -     if (amdgpu_sriov_vf(adev)) {
> >>>> -             /* disable the scheduler for SDMA */
> >>>> -             amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> +     if (amdgpu_sriov_vf(adev))
> >>>>               return 0;
> >>>> -     }
> >>>>
> >>>>       if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__SDMA)) {
> >>>>               for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>> @@ -1964,7 +1951,6 @@ static int sdma_v4_0_resume(void *handle)
> >>>>       if (adev->in_s0ix) {
> >>>>               sdma_v4_0_enable(adev, true);
> >>>>               sdma_v4_0_gfx_enable(adev, true);
> >>>> -             amdgpu_ttm_set_buffer_funcs_status(adev, true);
> >>>>               return 0;
> >>>>       }
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/dr=
m/amd/amdgpu/sdma_v5_0.c
> >>>> index be5d099c9898..c78027ebdcb9 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> >>>> @@ -559,8 +559,6 @@ static void sdma_v5_0_gfx_stop(struct amdgpu_dev=
ice *adev)
> >>>>       u32 rb_cntl, ib_cntl;
> >>>>       int i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               rb_cntl =3D RREG32_SOC15_IP(GC, sdma_v5_0_get_reg_offs=
et(adev, i, mmSDMA0_GFX_RB_CNTL));
> >>>>               rb_cntl =3D REG_SET_FIELD(rb_cntl, SDMA0_GFX_RB_CNTL, =
RB_ENABLE, 0);
> >>>> @@ -825,9 +823,6 @@ static int sdma_v5_0_gfx_resume(struct amdgpu_de=
vice *adev)
> >>>>               r =3D amdgpu_ring_test_helper(ring);
> >>>>               if (r)
> >>>>                       return r;
> >>>> -
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D ring)
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, true)=
;
> >>>>       }
> >>>>
> >>>>       return 0;
> >>>> @@ -1426,11 +1421,8 @@ static int sdma_v5_0_hw_fini(void *handle)
> >>>>   {
> >>>>       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> >>>>
> >>>> -     if (amdgpu_sriov_vf(adev)) {
> >>>> -             /* disable the scheduler for SDMA */
> >>>> -             amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> +     if (amdgpu_sriov_vf(adev))
> >>>>               return 0;
> >>>> -     }
> >>>>
> >>>>       sdma_v5_0_ctx_switch_enable(adev, false);
> >>>>       sdma_v5_0_enable(adev, false);
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/dr=
m/amd/amdgpu/sdma_v5_2.c
> >>>> index a3e8b10c071c..2e35f3571774 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> >>>> @@ -364,8 +364,6 @@ static void sdma_v5_2_gfx_stop(struct amdgpu_dev=
ice *adev)
> >>>>       u32 rb_cntl, ib_cntl;
> >>>>       int i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               rb_cntl =3D RREG32_SOC15_IP(GC, sdma_v5_2_get_reg_offs=
et(adev, i, mmSDMA0_GFX_RB_CNTL));
> >>>>               rb_cntl =3D REG_SET_FIELD(rb_cntl, SDMA0_GFX_RB_CNTL, =
RB_ENABLE, 0);
> >>>> @@ -625,9 +623,6 @@ static int sdma_v5_2_gfx_resume(struct amdgpu_de=
vice *adev)
> >>>>               r =3D amdgpu_ring_test_helper(ring);
> >>>>               if (r)
> >>>>                       return r;
> >>>> -
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D ring)
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, true)=
;
> >>>>       }
> >>>>
> >>>>       return 0;
> >>>> @@ -1284,11 +1279,8 @@ static int sdma_v5_2_hw_fini(void *handle)
> >>>>   {
> >>>>       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> >>>>
> >>>> -     if (amdgpu_sriov_vf(adev)) {
> >>>> -             /* disable the scheduler for SDMA */
> >>>> -             amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> +     if (amdgpu_sriov_vf(adev))
> >>>>               return 0;
> >>>> -     }
> >>>>
> >>>>       sdma_v5_2_ctx_switch_enable(adev, false);
> >>>>       sdma_v5_2_enable(adev, false);
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/dr=
m/amd/amdgpu/sdma_v6_0.c
> >>>> index 445a34549d2c..1c6ff511f501 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> >>>> @@ -348,8 +348,6 @@ static void sdma_v6_0_gfx_stop(struct amdgpu_dev=
ice *adev)
> >>>>       u32 rb_cntl, ib_cntl;
> >>>>       int i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               rb_cntl =3D RREG32_SOC15_IP(GC, sdma_v6_0_get_reg_offs=
et(adev, i, regSDMA0_QUEUE0_RB_CNTL));
> >>>>               rb_cntl =3D REG_SET_FIELD(rb_cntl, SDMA0_QUEUE0_RB_CNT=
L, RB_ENABLE, 0);
> >>>> @@ -561,9 +559,6 @@ static int sdma_v6_0_gfx_resume(struct amdgpu_de=
vice *adev)
> >>>>               r =3D amdgpu_ring_test_helper(ring);
> >>>>               if (r)
> >>>>                       return r;
> >>>> -
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D ring)
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, true)=
;
> >>>>       }
> >>>>
> >>>>       return 0;
> >>>> @@ -1308,11 +1303,8 @@ static int sdma_v6_0_hw_fini(void *handle)
> >>>>   {
> >>>>       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> >>>>
> >>>> -     if (amdgpu_sriov_vf(adev)) {
> >>>> -             /* disable the scheduler for SDMA */
> >>>> -             amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> +     if (amdgpu_sriov_vf(adev))
> >>>>               return 0;
> >>>> -     }
> >>>>
> >>>>       sdma_v6_0_ctxempty_int_enable(adev, false);
> >>>>       sdma_v6_0_enable(adev, false);
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/a=
md/amdgpu/si_dma.c
> >>>> index 42c4547f32ec..9aa0e11ee673 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> >>>> @@ -115,8 +115,6 @@ static void si_dma_stop(struct amdgpu_device *ad=
ev)
> >>>>       u32 rb_cntl;
> >>>>       unsigned i;
> >>>>
> >>>> -     amdgpu_sdma_unset_buffer_funcs_helper(adev);
> >>>> -
> >>>>       for (i =3D 0; i < adev->sdma.num_instances; i++) {
> >>>>               /* dma0 */
> >>>>               rb_cntl =3D RREG32(DMA_RB_CNTL + sdma_offsets[i]);
> >>>> @@ -177,9 +175,6 @@ static int si_dma_start(struct amdgpu_device *ad=
ev)
> >>>>               r =3D amdgpu_ring_test_helper(ring);
> >>>>               if (r)
> >>>>                       return r;
> >>>> -
> >>>> -             if (adev->mman.buffer_funcs_ring =3D=3D ring)
> >>>> -                     amdgpu_ttm_set_buffer_funcs_status(adev, true)=
;
> >>>>       }
> >>>>
> >>>>       return 0;
> >>>

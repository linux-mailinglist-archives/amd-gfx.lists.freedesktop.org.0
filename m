Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010C6D0604
	for <lists+amd-gfx@lfdr.de>; Thu, 30 Mar 2023 15:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0788A10E322;
	Thu, 30 Mar 2023 13:10:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D804B10E322
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Mar 2023 13:10:16 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 o15-20020a4ae58f000000b00538c0ec9567so2952869oov.1
 for <amd-gfx@lists.freedesktop.org>; Thu, 30 Mar 2023 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680181816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tFunI9aoc/FkXnbFYtr+IsxMGZAAZ4kIPuEp8Vt9vcQ=;
 b=ZK/iWPDx9/mZ51DjHXIQG9hkroJrmPJ7zBqgKWegtKr9OghJyWshWZLd/hlA4NLyjf
 uaJKEF5r7r2pGIAsWwFYa1kA8tzd8VHsyWUb8ODMMrEUgbijCQ5eeQV+s/qBxbsN3ugS
 iJn1hH/lzyJL7qBxR58e3WSnEZ5l6q04qmSEPqCxdT+uK6cUxze9La4YGmjkGktBQd/2
 u43aNJJY6dHt0242j/zITHlrwMENreaixR7lZiMnQYEq+A/J5TKG5JFX3pAPmwvT1PST
 /0cQndIxeXctqEHUjbPdoFJH9o0uTzZuoIEotsMlYxdsXEV0UjbTlNeubOn+nk8NlGlv
 0ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680181816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tFunI9aoc/FkXnbFYtr+IsxMGZAAZ4kIPuEp8Vt9vcQ=;
 b=IkiDQjG9gW0d/M4CLUvQTr5Sj33ypoYNEvDQ3YQ9aDLpM5JFvetdwehyOq8z3uz6BN
 f6oXBdqWQ6aWnrFSoA5CVoYGQG9bEwIUPH3St1neF1IfIgWxmuxMC/xqt7o+hw04MA/F
 +Hwpapvuu2n0cjweOuxz+msJjWacRmTtzpdWAJ6oNtvnPqQQgt4usHHvTb6hDuR9WWOx
 TLQCUh/8PqphHRKUvAVAMe7r5TcXzGt1CeckWZheVsEj1I/f4JAbKrf05vxe2/A1Wfkx
 cxpiEjfW7Y7vHmAiunqyfNJw09dh6HhTJWizukD2TSoEP5gChmS/UXRUV8mWJvgqzbNN
 36Kw==
X-Gm-Message-State: AAQBX9djvqndeQTck60rrrOWGfJukIukwqAW3fi9ybHZiQQpMr0oQCr0
 l2SmLm2fESSvKzyfpuZy1ZeSEVeH/XpaqyS1nMNFPIdp
X-Google-Smtp-Source: AKy350ayrb3eQ5Qy10Cv4SYN/cvsGLjzfGz5ITAIP4amunXZ36thQ9uytu7AC5MHBZEu5MOCA7GUVUTsuQIesHYHQUY=
X-Received: by 2002:a4a:a28d:0:b0:53e:22c1:c46f with SMTP id
 h13-20020a4aa28d000000b0053e22c1c46fmr1806294ool.0.1680181815808; Thu, 30 Mar
 2023 06:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230327152028.2939908-1-HaoPing.Liu@amd.com>
 <76206089-39dd-c009-f0a3-415f3c02406a@gmail.com>
 <SN1PR12MB24455388D199AD581AC2FA5CF58E9@SN1PR12MB2445.namprd12.prod.outlook.com>
 <842f5527-6992-f579-8749-c49d4f9f6e28@gmail.com>
In-Reply-To: <842f5527-6992-f579-8749-c49d4f9f6e28@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Mar 2023 09:10:04 -0400
Message-ID: <CADnq5_OJ7_a750rrsncs4HyPK3K8zkE5nYG+oPMcqJQEfAK2aw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix desktop freezed after gpu-reset
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: "Liu, HaoPing \(Alan\)" <HaoPing.Liu@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 6:48=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 30.03.23 um 11:15 schrieb Liu, HaoPing (Alan):
>
> [AMD Official Use Only - General]
>
>
>
> Hi Christian,
>
>
>
> Thanks for the review. Please see inline.
>
>
>
> Best Regards,
>
> Alan
>
>
>
> -----Original Message-----
> From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> Sent: Tuesday, March 28, 2023 7:16 PM
> To: Liu, HaoPing (Alan) <HaoPing.Liu@amd.com>; amd-gfx@lists.freedesktop.=
org
> Cc: Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>
> Subject: Re: [PATCH] drm/amdgpu: Fix desktop freezed after gpu-reset
>
>
>
> Am 27.03.23 um 17:20 schrieb Alan Liu:
>
> > [Why]
>
> > After gpu-reset, sometimes the driver would fail to enable vblank irq,
>
> > causing flip_done timed out and the desktop freezed.
>
> >
>
> > During gpu-reset, we will disable and enable vblank irq in
>
> > dm_suspend() and dm_resume(). Later on in
>
> > amdgpu_irq_gpu_reset_resume_helper(), we will check irqs' refcount and =
decide to enable or disable the irqs again.
>
> >
>
> > However, we have 2 sets of API for controling vblank irq, one is
>
> > dm_vblank_get/put() and another is amdgpu_irq_get/put(). Each API has
>
> > its own refcount and flag to store the state of vblank irq, and they
>
> > are not synchronized.
>
>
>
> This is the source of the problem and you should address this instead.
>
> The change you suggested below would break in some use cases.
>
>
>
> In struct drm_vblank_crtc we have a vblank irq refcount controlled by drm=
 layer, and in struct amdgpu_irq_src we have enabled_types as refcount for =
each irq controlled by the dm.
>
> I think the best solution will be to get rid of the refcount in drm and o=
nly maintain the dm one, and add a crtc function for the drm layer to get t=
he refcount/state of vblank.
>
> But this may be dangerous since it=E2=80=99s a change in drm layer. Do yo=
u have any comments?
>
>
> You don't necessarily need to remove it completely, what you can do as we=
ll is properly chaining of them.
>
> E.g. when the DRM counter goes from 0->1 or 1->0 it calls some function t=
o enable/disable the hw irq. In this situation you call amdgpu_irq_get()/am=
dgpu_irq_put() as appropriate.
>
> The the code in this patch already looks like it goes into the right dire=
ction regarding that. It just seems to be that you have some race issues wh=
en you need to add checks that the IRQ counter doesn't goes below 0.
>

I think the problem is that atomic in general is not GPU reset
compatible.  GPU resets sort of happen outside of the standard atomic
flow.  So the DRM level interrupts will keep their original state, but
internally, the driver has to deal with the fact that we need to
re-enable interrupts as part of the reset sequence.

Alex


>
>
> >
>
> > In drm we use the first API to control vblank irq but in
>
> > amdgpu_irq_gpu_reset_resume_helper() we use the second set of API.
>
> >
>
> > The failure happens when vblank irq was enabled by dm_vblank_get()
>
> > before gpu-reset, we have vblank->enabled true. However, during
>
> > gpu-reset, in amdgpu_irq_gpu_reset_resume_helper(), vblank irq's state
>
> > checked from
>
> > amdgpu_irq_update() is DISABLED. So finally it will disable vblank irq
>
> > again. After gpu-reset, if there is a cursor plane commit, the driver
>
> > will try to enable vblank irq by calling drm_vblank_enable(), but the
>
> > vblank->enabled is still true, so it fails to turn on vblank irq and
>
> > causes flip_done can't be completed in vblank irq handler and desktop
>
> > become freezed.
>
> >
>
> > [How]
>
> > Combining the 2 vblank control APIs by letting drm's API finally calls
>
> > amdgpu_irq's API, so the irq's refcount and state of both APIs can be
>
> > synchronized. Also add a check to prevent refcount from being less
>
> > then
>
> > 0 in amdgpu_irq_put().
>
> >
>
> > Signed-off-by: Alan Liu <HaoPing.Liu@amd.com>
>
> > ---
>
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  3 +++
>
> >   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c | 14 ++++++++++---=
-
>
> >   2 files changed, 13 insertions(+), 4 deletions(-)
>
> >
>
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>
> > index a6aef488a822..1b66003657e2 100644
>
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>
> > @@ -597,6 +597,9 @@ int amdgpu_irq_put(struct amdgpu_device *adev, stru=
ct amdgpu_irq_src *src,
>
> >            if (!src->enabled_types || !src->funcs->set)
>
> >                           return -EINVAL;
>
> >
>
> > +         if (!amdgpu_irq_enabled(adev, src, type))
>
> > +                       return 0;
>
> > +
>
>
>
> That is racy and won't work. The intention of amdgpu_irq_update() is to a=
lways update the irq state, no matter what the status is.
>
>
>
> This is a change to amdgpu_irq_put() to prevent the refcount from being c=
ut to less than 0. Does it break the intention of amdgpu_irq_update()?
>
>
> Yes, exactly that. The reference count can *never* be below 0 or you have=
 a bug in the caller.
>
> What you could do is to add a WARN_ON(!amdgpu_irq_enabled(adev, src, type=
)), but just ignoring the call is an absolute no-go.
>
> Regards,
> Christian.
>
> PS: Please don't use HTML formating when discussing on public mailing lis=
ts.
>
>
>
> Regards,
>
> Christian.
>
>
>
> >            if (atomic_dec_and_test(&src->enabled_types[type]))
>
> >                           return amdgpu_irq_update(adev, src, type);
>
> >
>
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>
> > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>
> > index dc4f37240beb..e04f846b0b19 100644
>
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
>
> > @@ -146,7 +146,7 @@ static void vblank_control_worker(struct
>
> > work_struct *work)
>
> >
>
> >   static inline int dm_set_vblank(struct drm_crtc *crtc, bool enable)
>
> >   {
>
> > -          enum dc_irq_source irq_source;
>
> > +         int irq_type;
>
> >            struct amdgpu_crtc *acrtc =3D to_amdgpu_crtc(crtc);
>
> >            struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
>
> >            struct dm_crtc_state *acrtc_state =3D to_dm_crtc_state(crtc-=
>state);
>
> > @@ -169,10 +169,16 @@ static inline int dm_set_vblank(struct drm_crtc *=
crtc, bool enable)
>
> >            if (rc)
>
> >                           return rc;
>
> >
>
> > -          irq_source =3D IRQ_TYPE_VBLANK + acrtc->otg_inst;
>
> > +         irq_type =3D amdgpu_display_crtc_idx_to_irq_type(adev,
>
> > +acrtc->crtc_id);
>
> > +
>
> > +         if (enable)
>
> > +                       rc =3D amdgpu_irq_get(adev, &adev->crtc_irq, ir=
q_type);
>
> > +
>
> > +         else
>
> > +                       rc =3D amdgpu_irq_put(adev, &adev->crtc_irq, ir=
q_type);
>
> >
>
> > -          if (!dc_interrupt_set(adev->dm.dc, irq_source, enable))
>
> > -                        return -EBUSY;
>
> > +         if (rc)
>
> > +                       return rc;
>
> >
>
> >   skip:
>
> >            if (amdgpu_in_reset(adev))
>
>
>
>

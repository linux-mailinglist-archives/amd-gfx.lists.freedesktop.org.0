Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ED2522AB0
	for <lists+amd-gfx@lfdr.de>; Wed, 11 May 2022 06:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FF6C10EA22;
	Wed, 11 May 2022 04:05:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1087310EB63
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 May 2022 04:05:45 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id m12so698256plb.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 May 2022 21:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bHoq3+GaoBhrDOiOueU6FdJjhp2B8Gy0k88x7KYS4PA=;
 b=P0hWoFaDLdRZfQ9kcuj4O7N3T7aUO706tImosaSDJci+vmw5Hk2cRIVO/4fr1ngzhK
 IMdroAy2lmdeKPL4ZKGAYu7SXsaBemxjHUwdc4I8Wttz6gh2SotWGsm0YTvzqzrGBTP+
 Dh6sflwOv/QwedB/pwUu1fV1zFwoIoGD5vzWUNAGEPAOW5Feb8YEzhVFQb8jLwFgh0D4
 0kAtUrXwvEmfiV899rzoF9IotUWN5GPh6aGCqIMaWm/m/eibQVIVVoJqdyQthwXo00F7
 IkSYfDxxC592YwktbkPawxpInOS590CXnu3e3tCV1d0JcTx4fHgo9FLqrExfj76TDzCF
 yZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bHoq3+GaoBhrDOiOueU6FdJjhp2B8Gy0k88x7KYS4PA=;
 b=tQ6UD9DmKizkqoYyPqcmwdvsyg+oCU/s/hR4SeU/4YijpLttrXKqzxC+6uFR7NP/12
 knLA0ZsxvHOd9v6eS1mfAqGK9N3kNf6BBQfkzJNQFeZNrMqnPOaD5zb0X8al53A8AvCz
 wrc/NGq8xLxbP9Nn4ttrY6bnjbEO+ssWzHWv6ZYBwmGt/1Z+lwEzegvtthlaDNbL/VAK
 UoGlu3/Dm9+6IWdGY+FMwiSG7PKSy5h7iM16ABfBUcskbht0jG+1QbkAykv82mSunrpF
 562fJlbudVZSwZ50B1iZ3nOj0AlMCsDexr5xhbfFLms0jJRYlBk9ffevXRUET/qc2JOj
 G8Vw==
X-Gm-Message-State: AOAM5328KpchQl09L+P+MBKYo2jcKNMzwRuqHxCqIwcGR3p7oCsRMgf4
 nR3O0YO7Af9j2e+iNgz0QnFSXoXyl4XaCOiPy50=
X-Google-Smtp-Source: ABdhPJxAUrvLzQqNl7fpjIm6OVbrv/NvlK8oAg4m2qyeS3uZSYk6KqlFh8bVmtoyQQA1SLx2d/2XvjF/YmP/HMx1aWU=
X-Received: by 2002:a17:902:ea06:b0:15e:d3a0:d443 with SMTP id
 s6-20020a170902ea0600b0015ed3a0d443mr23742052plg.10.1652241944301; Tue, 10
 May 2022 21:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220430073400.2494-1-ricetons@gmail.com>
 <CADnq5_Mq7tCYusk0HNge_4FXLhmT4i3e93Pbjo5Z2GNgJPshnQ@mail.gmail.com>
 <CAHpOOhErddPws33nm_UVL+kL3_kxfjtJUP1gdUWEK-VHbS-50A@mail.gmail.com>
 <CADnq5_ODwSJB_qDuscsJ5YnpjTt91Ly9G_TzP2+b92ytyESJHA@mail.gmail.com>
 <CAHpOOhF2ZacCjYwADfri_Zwkg-mRyu5zYgbjCmN0fOWNE8QHCg@mail.gmail.com>
 <CADnq5_MSEAajNga2J8fSL4vOYdvCX_W4C3_X6n+8tquVqYoYfA@mail.gmail.com>
 <CAHpOOhGuYww6qNzFx8jfYiPJm5SEaxw0p=as3FTVXGcXaxD2hQ@mail.gmail.com>
 <CADnq5_PA+dqMqBDiJ_QOa=6cnevp6etuNC9nomc-N50UgP_L8g@mail.gmail.com>
In-Reply-To: <CADnq5_PA+dqMqBDiJ_QOa=6cnevp6etuNC9nomc-N50UgP_L8g@mail.gmail.com>
From: Haohui Mai <ricetons@gmail.com>
Date: Wed, 11 May 2022 12:05:33 +0800
Message-ID: <CAHpOOhFU4C=j6DwKihnG+bAJxejpH2N-Z4YrqH0HbQApatMAbQ@mail.gmail.com>
Subject: Re: [PATCH v6] drm/amdgpu: Ensure the DMA engine is deactivated
 during set ups
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Yifan Zhang <yifan1.zhang@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Lang Yu <lang.yu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

It should be an identical patch except for the commit message. Do you
want me to send out a new one? Either way is fine with me.

~Haohui

On Tue, May 10, 2022 at 10:14 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, May 10, 2022 at 6:53 AM Haohui Mai <ricetons@gmail.com> wrote:
> >
> > Hi Alex,
> >
> > Is there anything open before it can be merged?
>
> Were you going to send an updated patch?
>
> Alex
>
> >
> > Thanks,
> > Haohui
> >
> > On Mon, May 9, 2022 at 10:48 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Fri, May 6, 2022 at 10:30 PM Haohui Mai <ricetons@gmail.com> wrote:
> > > >
> > > > What about
> > > >
> > > > Setting the HALT bit of SDMA_F32_CNTL in all paths before programming
> > > > the ring buffer of the SDMA engine.
> > > >
> > >
> > > Sounds fine to me.
> > >
> > > Alex
> > >
> > > > No other changes are required in the patch.
> > > >
> > > > ~Haohui
> > > >
> > > > On Fri, May 6, 2022 at 9:36 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > >
> > > > > On Fri, May 6, 2022 at 1:11 AM Haohui Mai <ricetons@gmail.com> wrote:
> > > > > >
> > > > > > The only thing that matters is that the IP should be halted before
> > > > > > programming the ring buffers.
> > > > > >
> > > > > > What about rephrasing the commit messages to highlight the issue a
> > > > > > little bit better?
> > > > >
> > > > > Yeah, that is fine.  Thanks!
> > > > >
> > > > > Alex
> > > > >
> > > > > >
> > > > > > On Fri, May 6, 2022 at 12:33 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> > > > > > >
> > > > > > > On Sat, Apr 30, 2022 at 3:34 AM <ricetons@gmail.com> wrote:
> > > > > > > >
> > > > > > > > From: Haohui Mai <ricetons@gmail.com>
> > > > > > > >
> > > > > > > > The patch fully deactivates the DMA engine before setting up the ring
> > > > > > > > buffer to avoid potential data races and crashes.
> > > > > > >
> > > > > > > Does this actually fix an issue you are seeing?  I don't think it will
> > > > > > > hurt anything, but I also don't think it's strictly necessary.  AFAIK,
> > > > > > > only the HALT bit really matters.  So the commit message might be
> > > > > > > somewhat misleading.
> > > > > > >
> > > > > > > Alex
> > > > > > >
> > > > > > > >
> > > > > > > > Signed-off-by: Haohui Mai <ricetons@gmail.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 109 +++++++++++++++----------
> > > > > > > >  1 file changed, 64 insertions(+), 45 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> > > > > > > > index 013d2dec81d0..1fac9d8e99de 100644
> > > > > > > > --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> > > > > > > > +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> > > > > > > > @@ -459,7 +459,6 @@ static void sdma_v5_2_ring_emit_fence(struct amdgpu_ring *ring, u64 addr, u64 se
> > > > > > > >         }
> > > > > > > >  }
> > > > > > > >
> > > > > > > > -
> > > > > > > >  /**
> > > > > > > >   * sdma_v5_2_gfx_stop - stop the gfx async dma engines
> > > > > > > >   *
> > > > > > > > @@ -505,17 +504,21 @@ static void sdma_v5_2_rlc_stop(struct amdgpu_device *adev)
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > - * sdma_v5_2_ctx_switch_enable - stop the async dma engines context switch
> > > > > > > > + * sdma_v5_2_ctx_switch_enable_for_instance - start the async dma engines
> > > > > > > > + * context switch for an instance
> > > > > > > >   *
> > > > > > > >   * @adev: amdgpu_device pointer
> > > > > > > > - * @enable: enable/disable the DMA MEs context switch.
> > > > > > > > + * @instance_idx: the index of the SDMA instance
> > > > > > > >   *
> > > > > > > > - * Halt or unhalt the async dma engines context switch.
> > > > > > > > + * Unhalt the async dma engines context switch.
> > > > > > > >   */
> > > > > > > > -static void sdma_v5_2_ctx_switch_enable(struct amdgpu_device *adev, bool enable)
> > > > > > > > +static void sdma_v5_2_ctx_switch_enable_for_instance(struct amdgpu_device *adev, int instance_idx)
> > > > > > > >  {
> > > > > > > >         u32 f32_cntl, phase_quantum = 0;
> > > > > > > > -       int i;
> > > > > > > > +
> > > > > > > > +       if (WARN_ON(instance_idx >= adev->sdma.num_instances)) {
> > > > > > > > +               return;
> > > > > > > > +       }
> > > > > > > >
> > > > > > > >         if (amdgpu_sdma_phase_quantum) {
> > > > > > > >                 unsigned value = amdgpu_sdma_phase_quantum;
> > > > > > > > @@ -539,50 +542,68 @@ static void sdma_v5_2_ctx_switch_enable(struct amdgpu_device *adev, bool enable)
> > > > > > > >                 phase_quantum =
> > > > > > > >                         value << SDMA0_PHASE0_QUANTUM__VALUE__SHIFT |
> > > > > > > >                         unit  << SDMA0_PHASE0_QUANTUM__UNIT__SHIFT;
> > > > > > > > -       }
> > > > > > > > -
> > > > > > > > -       for (i = 0; i < adev->sdma.num_instances; i++) {
> > > > > > > > -               if (enable && amdgpu_sdma_phase_quantum) {
> > > > > > > > -                       WREG32_SOC15_IP(GC, sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_PHASE0_QUANTUM),
> > > > > > > > -                              phase_quantum);
> > > > > > > > -                       WREG32_SOC15_IP(GC, sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_PHASE1_QUANTUM),
> > > > > > > > -                              phase_quantum);
> > > > > > > > -                       WREG32_SOC15_IP(GC, sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_PHASE2_QUANTUM),
> > > > > > > > -                              phase_quantum);
> > > > > > > > -               }
> > > > > > > >
> > > > > > > > -               if (!amdgpu_sriov_vf(adev)) {
> > > > > > > > -                       f32_cntl = RREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_CNTL));
> > > > > > > > -                       f32_cntl = REG_SET_FIELD(f32_cntl, SDMA0_CNTL,
> > > > > > > > -                                       AUTO_CTXSW_ENABLE, enable ? 1 : 0);
> > > > > > > > -                       WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_CNTL), f32_cntl);
> > > > > > > > -               }
> > > > > > > > +               WREG32_SOC15_IP(GC,
> > > > > > > > +                       sdma_v5_2_get_reg_offset(adev, instance_idx, mmSDMA0_PHASE0_QUANTUM),
> > > > > > > > +                       phase_quantum);
> > > > > > > > +               WREG32_SOC15_IP(GC,
> > > > > > > > +                       sdma_v5_2_get_reg_offset(adev, instance_idx, mmSDMA0_PHASE1_QUANTUM),
> > > > > > > > +                   phase_quantum);
> > > > > > > > +               WREG32_SOC15_IP(GC,
> > > > > > > > +                       sdma_v5_2_get_reg_offset(adev, instance_idx, mmSDMA0_PHASE2_QUANTUM),
> > > > > > > > +                   phase_quantum);
> > > > > > > >         }
> > > > > > > >
> > > > > > > > +       if (!amdgpu_sriov_vf(adev)) {
> > > > > > > > +               f32_cntl = RREG32(sdma_v5_2_get_reg_offset(adev, instance_idx, mmSDMA0_CNTL));
> > > > > > > > +               f32_cntl = REG_SET_FIELD(f32_cntl, SDMA0_CNTL,
> > > > > > > > +                               AUTO_CTXSW_ENABLE, 1);
> > > > > > > > +               WREG32(sdma_v5_2_get_reg_offset(adev, instance_idx, mmSDMA0_CNTL), f32_cntl);
> > > > > > > > +       }
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > - * sdma_v5_2_enable - stop the async dma engines
> > > > > > > > + * sdma_v5_2_ctx_switch_disable_all - stop the async dma engines context switch
> > > > > > > >   *
> > > > > > > >   * @adev: amdgpu_device pointer
> > > > > > > > - * @enable: enable/disable the DMA MEs.
> > > > > > > >   *
> > > > > > > > - * Halt or unhalt the async dma engines.
> > > > > > > > + * Halt the async dma engines context switch.
> > > > > > > >   */
> > > > > > > > -static void sdma_v5_2_enable(struct amdgpu_device *adev, bool enable)
> > > > > > > > +static void sdma_v5_2_ctx_switch_disable_all(struct amdgpu_device *adev)
> > > > > > > >  {
> > > > > > > >         u32 f32_cntl;
> > > > > > > >         int i;
> > > > > > > >
> > > > > > > > -       if (!enable) {
> > > > > > > > -               sdma_v5_2_gfx_stop(adev);
> > > > > > > > -               sdma_v5_2_rlc_stop(adev);
> > > > > > > > +       if (amdgpu_sriov_vf(adev))
> > > > > > > > +               return;
> > > > > > > > +
> > > > > > > > +       for (i = 0; i < adev->sdma.num_instances; i++) {
> > > > > > > > +               f32_cntl = RREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_CNTL));
> > > > > > > > +               f32_cntl = REG_SET_FIELD(f32_cntl, SDMA0_CNTL,
> > > > > > > > +                               AUTO_CTXSW_ENABLE, 0);
> > > > > > > > +               WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_CNTL), f32_cntl);
> > > > > > > >         }
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * sdma_v5_2_halt - stop the async dma engines
> > > > > > > > + *
> > > > > > > > + * @adev: amdgpu_device pointer
> > > > > > > > + *
> > > > > > > > + * Halt the async dma engines.
> > > > > > > > + */
> > > > > > > > +static void sdma_v5_2_halt(struct amdgpu_device *adev)
> > > > > > > > +{
> > > > > > > > +       int i;
> > > > > > > > +       u32 f32_cntl;
> > > > > > > > +
> > > > > > > > +       sdma_v5_2_gfx_stop(adev);
> > > > > > > > +       sdma_v5_2_rlc_stop(adev);
> > > > > > > >
> > > > > > > >         if (!amdgpu_sriov_vf(adev)) {
> > > > > > > >                 for (i = 0; i < adev->sdma.num_instances; i++) {
> > > > > > > >                         f32_cntl = RREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_F32_CNTL));
> > > > > > > > -                       f32_cntl = REG_SET_FIELD(f32_cntl, SDMA0_F32_CNTL, HALT, enable ? 0 : 1);
> > > > > > > > +                       f32_cntl = REG_SET_FIELD(f32_cntl, SDMA0_F32_CNTL, HALT, 1);
> > > > > > > >                         WREG32(sdma_v5_2_get_reg_offset(adev, i, mmSDMA0_F32_CNTL), f32_cntl);
> > > > > > > >                 }
> > > > > > > >         }
> > > > > > > > @@ -594,6 +615,9 @@ static void sdma_v5_2_enable(struct amdgpu_device *adev, bool enable)
> > > > > > > >   * @adev: amdgpu_device pointer
> > > > > > > >   *
> > > > > > > >   * Set up the gfx DMA ring buffers and enable them.
> > > > > > > > + * It assumes that the dma engine is stopped for each instance.
> > > > > > > > + * The function enables the engine and preemptions sequentially for each instance.
> > > > > > > > + *
> > > > > > > >   * Returns 0 for success, error for failure.
> > > > > > > >   */
> > > > > > > >  static int sdma_v5_2_gfx_resume(struct amdgpu_device *adev)
> > > > > > > > @@ -737,10 +761,7 @@ static int sdma_v5_2_gfx_resume(struct amdgpu_device *adev)
> > > > > > > >
> > > > > > > >                 ring->sched.ready = true;
> > > > > > > >
> > > > > > > > -               if (amdgpu_sriov_vf(adev)) { /* bare-metal sequence doesn't need below to lines */
> > > > > > > > -                       sdma_v5_2_ctx_switch_enable(adev, true);
> > > > > > > > -                       sdma_v5_2_enable(adev, true);
> > > > > > > > -               }
> > > > > > > > +               sdma_v5_2_ctx_switch_enable_for_instance(adev, i);
> > > > > > > >
> > > > > > > >                 r = amdgpu_ring_test_ring(ring);
> > > > > > > >                 if (r) {
> > > > > > > > @@ -784,7 +805,7 @@ static int sdma_v5_2_load_microcode(struct amdgpu_device *adev)
> > > > > > > >         int i, j;
> > > > > > > >
> > > > > > > >         /* halt the MEs */
> > > > > > > > -       sdma_v5_2_enable(adev, false);
> > > > > > > > +       sdma_v5_2_halt(adev);
> > > > > > > >
> > > > > > > >         for (i = 0; i < adev->sdma.num_instances; i++) {
> > > > > > > >                 if (!adev->sdma.instance[i].fw)
> > > > > > > > @@ -856,8 +877,8 @@ static int sdma_v5_2_start(struct amdgpu_device *adev)
> > > > > > > >         int r = 0;
> > > > > > > >
> > > > > > > >         if (amdgpu_sriov_vf(adev)) {
> > > > > > > > -               sdma_v5_2_ctx_switch_enable(adev, false);
> > > > > > > > -               sdma_v5_2_enable(adev, false);
> > > > > > > > +               sdma_v5_2_ctx_switch_disable_all(adev);
> > > > > > > > +               sdma_v5_2_halt(adev);
> > > > > > > >
> > > > > > > >                 /* set RB registers */
> > > > > > > >                 r = sdma_v5_2_gfx_resume(adev);
> > > > > > > > @@ -881,12 +902,10 @@ static int sdma_v5_2_start(struct amdgpu_device *adev)
> > > > > > > >                 amdgpu_gfx_off_ctrl(adev, false);
> > > > > > > >
> > > > > > > >         sdma_v5_2_soft_reset(adev);
> > > > > > > > -       /* unhalt the MEs */
> > > > > > > > -       sdma_v5_2_enable(adev, true);
> > > > > > > > -       /* enable sdma ring preemption */
> > > > > > > > -       sdma_v5_2_ctx_switch_enable(adev, true);
> > > > > > > >
> > > > > > > > -       /* start the gfx rings and rlc compute queues */
> > > > > > > > +       /* Soft reset supposes to disable the dma engine and preemption.
> > > > > > > > +        * Now start the gfx rings and rlc compute queues.
> > > > > > > > +        */
> > > > > > > >         r = sdma_v5_2_gfx_resume(adev);
> > > > > > > >         if (adev->in_s0ix)
> > > > > > > >                 amdgpu_gfx_off_ctrl(adev, true);
> > > > > > > > @@ -1340,8 +1359,8 @@ static int sdma_v5_2_hw_fini(void *handle)
> > > > > > > >         if (amdgpu_sriov_vf(adev))
> > > > > > > >                 return 0;
> > > > > > > >
> > > > > > > > -       sdma_v5_2_ctx_switch_enable(adev, false);
> > > > > > > > -       sdma_v5_2_enable(adev, false);
> > > > > > > > +       sdma_v5_2_ctx_switch_disable_all(adev);
> > > > > > > > +       sdma_v5_2_halt(adev);
> > > > > > > >
> > > > > > > >         return 0;
> > > > > > > >  }
> > > > > > > > --
> > > > > > > > 2.25.1
> > > > > > > >

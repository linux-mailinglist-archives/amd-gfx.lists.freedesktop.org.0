Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA91EECD1
	for <lists+amd-gfx@lfdr.de>; Thu,  4 Jun 2020 23:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A978E6E5C5;
	Thu,  4 Jun 2020 21:10:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CE16E5C5
 for <amd-gfx@lists.freedesktop.org>; Thu,  4 Jun 2020 21:10:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so7589549wrn.11
 for <amd-gfx@lists.freedesktop.org>; Thu, 04 Jun 2020 14:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kgBw9c2FZK8LuDuVxfZyOtYQurB+eys4bLaRZKEXmRU=;
 b=s17M17R5ZOba3wL6T//xNaK1jZA+KMOWMlDFvVUPNcP4MX3uaUd9imvVKL8W4/QqTb
 j+pjjqXCDhC6DSTJWUUjOkZLhn05UtZUe53LYnbQib/3/qQ4wbZDjxUm3ceHqeG1B4vL
 m5E0WE3A1X0cPkpH/H87C+ZXvti1pX50b5GKULx6W4lonQ3HylJ1jnRSVBsM8q/ZELB3
 k0z054eI3aB+d/21nvl2eyJIpbYcLxStmr3pTufBt6G4VtXAAcx8839/gkjexz17BRfl
 Z/wNIZTL/77rztEdJtJQec9eI+NzWh1VGdRndGlLsMUjF7tGVVn9uNKk9IiaAlTQ3tWf
 hMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kgBw9c2FZK8LuDuVxfZyOtYQurB+eys4bLaRZKEXmRU=;
 b=B+t9HeNcv/TcdSu6kge4hCmGK/gC5MshxbFl7mJOuAUsFAzRjp1MUINNEzvy7CR3nD
 7ybOK7RxV3XFuZMJW0cOyJcHKu8wkHQTMZuZBEAN1eJBX5wOlDS84iftCIteBrJ+3KpQ
 DIlzr7Z2Wpgd8UNKEjWqbHYaBLM/mLfhrAeTDWfUHaGm4ayittSsmyw1g4m7QH4YEQKK
 G8wQbqOLdoraOq/eEUzz66En1iApSpF5tbCnhoUNYHljM+2yAOsbIknLljsxU3+cb6Co
 wb4EpmEp7aklBjVYtQz0vdRJoNXuDs4O0+fYjMpiFz0A3JHHQUn3nh/GKJO1AY2uPC1z
 Ht0g==
X-Gm-Message-State: AOAM532PjhUS1cB77auZ80Kad/92qzG+trxIv1KRjtwkgYHMqRob4Djz
 QF9g9jSzLSfut6gxedmsMAdA7L4XXfnKcYTl93k=
X-Google-Smtp-Source: ABdhPJzS1CyWtoWWFFvUsYX+Pk0F08G4/29zxCPBoNSUZd0bSahgUWMEtqDeb55+t1dH4pILMAAKvM0SK/u1F3VRPoc=
X-Received: by 2002:a5d:400f:: with SMTP id n15mr6552466wrp.419.1591304994727; 
 Thu, 04 Jun 2020 14:09:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200604044619.18658-1-evan.quan@amd.com>
 <20200604044619.18658-12-evan.quan@amd.com>
 <CADnq5_OpT1bxmF-F52fN0gTMffRL49m_-Ln28JuLkCmXsdxBsA@mail.gmail.com>
In-Reply-To: <CADnq5_OpT1bxmF-F52fN0gTMffRL49m_-Ln28JuLkCmXsdxBsA@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Jun 2020 17:09:43 -0400
Message-ID: <CADnq5_MU=T4FR++fy7BfPZmUyx7h2jODr5GfK5ZPag5VzcrU6g@mail.gmail.com>
Subject: Re: [PATCH 12/16] drm/amd/powerplay: better namings
To: Evan Quan <evan.quan@amd.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Thu, Jun 4, 2020 at 5:07 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Jun 4, 2020 at 12:47 AM Evan Quan <evan.quan@amd.com> wrote:
> >
> > And some minor changes as dropping unused parameter and label
> > internal used API as static.
> >
> > Change-Id: I0af0aea029dc4fc7d8e150ab6ec984e9a5f1a74a
> > Signed-off-by: Evan Quan <evan.quan@amd.com>
> > ---
> >  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c     | 12 +++++-------
> >  drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h |  2 --
> >  2 files changed, 5 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > index b3410d111316..55ffbf1cf086 100644
> > --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> > @@ -638,7 +638,7 @@ int smu_sys_set_pp_table(struct smu_context *smu,  void *buf, size_t size)
> >         return ret;
> >  }
> >
> > -int smu_feature_init_dpm(struct smu_context *smu)
> > +static int smu_get_driver_allowed_feature_mask(struct smu_context *smu)
> >  {
> >         struct smu_feature *feature = &smu->smu_feature;
> >         int ret = 0;
> > @@ -662,7 +662,6 @@ int smu_feature_init_dpm(struct smu_context *smu)
> >         return ret;
> >  }
> >
> > -
> >  int smu_feature_is_enabled(struct smu_context *smu, enum smu_feature_mask mask)
> >  {
> >         struct smu_feature *feature = &smu->smu_feature;
> > @@ -1115,8 +1114,7 @@ static int smu_sw_fini(void *handle)
> >         return 0;
> >  }
> >
> > -static int smu_smc_table_hw_init(struct smu_context *smu,
> > -                                bool initialize)
> > +static int smu_internal_hw_setup(struct smu_context *smu)
>
> The "internal" in the name made me think this was related to someting
> in smu_internal.h.  Maybe call it smu_smc_hw_setup()?  I guess I could
> go either way.

Nevermind, I see you started using the "internal" naming in the next
patch as well. Either way is fine with me.

>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> >  {
> >         struct amdgpu_device *adev = smu->adev;
> >         int ret;
> > @@ -1287,11 +1285,11 @@ static int smu_hw_init(void *handle)
> >         if (ret)
> >                 return ret;
> >
> > -       ret = smu_feature_init_dpm(smu);
> > +       ret = smu_get_driver_allowed_feature_mask(smu);
> >         if (ret)
> >                 goto failed;
> >
> > -       ret = smu_smc_table_hw_init(smu, true);
> > +       ret = smu_internal_hw_setup(smu);
> >         if (ret)
> >                 goto failed;
> >
> > @@ -1487,7 +1485,7 @@ static int smu_resume(void *handle)
> >                 goto failed;
> >         }
> >
> > -       ret = smu_smc_table_hw_init(smu, false);
> > +       ret = smu_internal_hw_setup(smu);
> >         if (ret)
> >                 goto failed;
> >
> > diff --git a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> > index b2de042493ad..5f5a210668a1 100644
> > --- a/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> > +++ b/drivers/gpu/drm/amd/powerplay/inc/amdgpu_smu.h
> > @@ -656,8 +656,6 @@ extern const struct amd_ip_funcs smu_ip_funcs;
> >  extern const struct amdgpu_ip_block_version smu_v11_0_ip_block;
> >  extern const struct amdgpu_ip_block_version smu_v12_0_ip_block;
> >
> > -extern int smu_feature_init_dpm(struct smu_context *smu);
> > -
> >  extern int smu_feature_is_enabled(struct smu_context *smu,
> >                                   enum smu_feature_mask mask);
> >  extern int smu_feature_set_enabled(struct smu_context *smu,
> > --
> > 2.27.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

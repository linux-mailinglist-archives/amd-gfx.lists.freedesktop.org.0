Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE726C1ACF
	for <lists+amd-gfx@lfdr.de>; Mon, 20 Mar 2023 17:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63F6C10E5E2;
	Mon, 20 Mar 2023 16:02:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD5510E5E2
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Mar 2023 16:02:07 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 x18-20020a4ae792000000b005376d6c9cfeso1924312oov.3
 for <amd-gfx@lists.freedesktop.org>; Mon, 20 Mar 2023 09:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679328126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CJ3/UXa2Waw9ZIowVBtowqjw1BB/4n4jDNWphUmIkk=;
 b=RNrihyKFySffBN44uXiEjeXCUNrxMTROEo7hQRJKCPnHSOejMYaIYVVV62tnzrGnxZ
 0Pxe89p0CirkZRuA1m1Se3py39QDmVSHSP06Yd8O8Hl+vWtdQdMkyJfUEdBuLctJQbbh
 Torre5Ev1K3uHDHd9Sc9CQxqXnn3BTQtIwwxFlVbNDd1rX/HUutto66GMsLgk+16BE6A
 Q5mutlo5r/w4+5lXtFtNZeJX4ucNmM/KE3r7a+30LjJRoDRiyOB38MwD2Db1UkclwtNi
 7wq3/lChYsoxZv5pd9EFxq7LKmVIiMKRec4DXaG2tpRnlkSHQ+6RojruEQ6KwqkmdCGl
 JTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679328126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9CJ3/UXa2Waw9ZIowVBtowqjw1BB/4n4jDNWphUmIkk=;
 b=J2iV15N4TDsap5ZBA3uli13ETVWLKcYoTVhQJYA7o5bLymhK1o40q+sX70MPMgwrA6
 9XLyAqFIy49Ido0PEVpQbtqDwqxhrJ8IwvUmsrUnUPbkx0Om72u2j6ex1VIw3VfVYFTO
 IlGg+pnlrMXpUAfkoj2oAabyX8XTmcErrIVnn5r+oFAAERQQiypRRBkvh17MUS3kR8fH
 O3QUkYffmiZERkjDp5Z5muAEr73Yj4sR/BQrFE3otexUwKFiHyju0j3oUSRvhyB19lFR
 XGCXC1LqpVOXB9Nnxs5TwTSCmKtSnsfNBw19fg7bryns8iHFKKHikTN0fJquIpc8D4ir
 f1HQ==
X-Gm-Message-State: AO0yUKVGfP+3L9PKzG0qxIQmvrrI+qsKKuv4bPZjtMsf2D9H5qnvIjjd
 Ed2VF1Ng+M+oCQdegDDmN/N5nHRJihNa3EEFhW8=
X-Google-Smtp-Source: AK7set/0b2925OY5zVs/Xbppu1SCWbybP2s6eycyJSgPFI+JeWuw+x7ZLC3ptv/S5GQ6CtSw538fdNJIaOy/X4ot2A4=
X-Received: by 2002:a4a:e1ac:0:b0:539:65:92a5 with SMTP id
 12-20020a4ae1ac000000b00539006592a5mr39066ooy.0.1679328126024; 
 Mon, 20 Mar 2023 09:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230317171748.682691-1-alexander.deucher@amd.com>
 <20230317171748.682691-4-alexander.deucher@amd.com>
 <a1b61e2f-d69c-4401-b9d5-46c80c14ae15@amd.com>
 <CADnq5_NenjAzNtjw_LFRQM96j3jXYTRi7MBFOr767v=PVSW+BA@mail.gmail.com>
 <0bb546d2-e208-2250-2eeb-797e8486ef89@amd.com>
In-Reply-To: <0bb546d2-e208-2250-2eeb-797e8486ef89@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 Mar 2023 12:01:54 -0400
Message-ID: <CADnq5_NPdkg_69LjC7NrGk8OgeAceVo6O2oRtzmgZm-GXXSRUQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] drm/amdgpu: add gfx shadow CS IOCTL support
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

On Mon, Mar 20, 2023 at 11:55=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 20.03.23 um 16:49 schrieb Alex Deucher:
> > On Mon, Mar 20, 2023 at 11:46=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 17.03.23 um 18:17 schrieb Alex Deucher:
> >>> From: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>>
> >>> Add support for submitting the shadow update packet
> >>> when submitting an IB.  Needed for MCBP on GFX11.
> >>>
> >>> v2: update API for CSA (Alex)
> >>> v3: fix ordering; SET_Q_PREEMPTION_MODE most come before COND_EXEC
> >>>       Add missing check for AMDGPU_CHUNK_ID_CP_GFX_SHADOW in
> >>>       amdgpu_cs_pass1()
> >>>       Only initialize shadow on first use
> >>>       (Alex)
> >>>
> >>> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   | 24 ++++++++++++++++++++=
++++
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h  |  1 +
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c   |  4 ++++
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.h  |  6 ++++++
> >>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  2 ++
> >>>    5 files changed, 37 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_cs.c
> >>> index f6144b378617..9bdda246b09c 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >>> @@ -280,6 +280,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parse=
r *p,
> >>>                case AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES:
> >>>                case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT:
> >>>                case AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL:
> >>> +             case AMDGPU_CHUNK_ID_CP_GFX_SHADOW:
> >>>                        break;
> >>>
> >>>                default:
> >>> @@ -587,6 +588,26 @@ static int amdgpu_cs_p2_syncobj_timeline_signal(=
struct amdgpu_cs_parser *p,
> >>>        return 0;
> >>>    }
> >>>
> >>> +static void amdgpu_cs_p2_shadow(struct amdgpu_cs_parser *p,
> >>> +                             struct amdgpu_cs_chunk *chunk)
> >>> +{
> >>> +     struct drm_amdgpu_cs_chunk_cp_gfx_shadow *shadow =3D chunk->kda=
ta;
> >>> +     bool shadow_initialized =3D false;
> >>> +     int i;
> >>> +
> >>> +     for (i =3D 0; i < p->gang_size; ++i) {
> >>> +             p->jobs[i]->shadow_va =3D shadow->shadow_va;
> >>> +             p->jobs[i]->csa_va =3D shadow->csa_va;
> >>> +             p->jobs[i]->gds_va =3D shadow->gds_va;
> >> Do we really need all three VAs separately?
> >>
> >>> +             if (!p->ctx->shadow_initialized) {
> >>> +                     p->jobs[i]->init_shadow =3D true;
> >>> +                     shadow_initialized =3D true;
> >>> +             }
> >>> +     }
> >>> +     if (shadow_initialized)
> >>> +             p->ctx->shadow_initialized =3D true;
> >> This is a really bad idea since the IOCTL can be interrupted later on.
> >>
> >> Why do we need that?
> > Yes.  We have to only initial the buffer the first time it's used.
> > Doing it again will overwrite whatever userspace has done with it
> > since then.
>
> I don't get what you mean with that? This here doesn't make any sense at
> all.
>
> The shadow buffer addresses must be given with every CS and updated over
> and over again. Otherwise this solution won't work correctly.

The shadow replaces the old SET/LOAD model.  When the UMD uses the
shadow buffer, they no longer have to send all of their state anymore
in the IB.  The CP FW will automatically load whatever was saved when
it processes this packet.  However, the shadow needs to be initialized
by the CP FW the first time it is used.  All subsequent times, it will
just be a save/restore by the FW.  I guess the alternative would be
for the UMD to specify if it wants initialization or not, but tracking
it in the kernel aligns better with the user mode queue model where
this is handled by the MQD and is initialized the first time the queue
is loaded.

Alex

>
> Christian.
>
> >
> > Alex
> >
> >> Regards,
> >> Christian.
> >>
> >>
> >>> +}
> >>> +
> >>>    static int amdgpu_cs_pass2(struct amdgpu_cs_parser *p)
> >>>    {
> >>>        unsigned int ce_preempt =3D 0, de_preempt =3D 0;
> >>> @@ -629,6 +650,9 @@ static int amdgpu_cs_pass2(struct amdgpu_cs_parse=
r *p)
> >>>                        if (r)
> >>>                                return r;
> >>>                        break;
> >>> +             case AMDGPU_CHUNK_ID_CP_GFX_SHADOW:
> >>> +                     amdgpu_cs_p2_shadow(p, chunk);
> >>> +                     break;
> >>>                }
> >>>        }
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_ctx.h
> >>> index 0fa0e56daf67..909d188c41f2 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> >>> @@ -57,6 +57,7 @@ struct amdgpu_ctx {
> >>>        unsigned long                   ras_counter_ce;
> >>>        unsigned long                   ras_counter_ue;
> >>>        uint32_t                        stable_pstate;
> >>> +     bool                            shadow_initialized;
> >>>    };
> >>>
> >>>    struct amdgpu_ctx_mgr {
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ib.c
> >>> index bcccc348dbe2..d88964b9407f 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
> >>> @@ -212,6 +212,10 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring,=
 unsigned num_ibs,
> >>>        }
> >>>
> >>>        amdgpu_ring_ib_begin(ring);
> >>> +
> >>> +     if (job && ring->funcs->emit_gfx_shadow)
> >>> +             amdgpu_ring_emit_gfx_shadow(ring, job);
> >>> +
> >>>        if (job && ring->funcs->init_cond_exec)
> >>>                patch_offset =3D amdgpu_ring_init_cond_exec(ring);
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_job.h
> >>> index 9790def34815..b470808fa40e 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> >>> @@ -68,6 +68,12 @@ struct amdgpu_job {
> >>>        uint64_t                uf_addr;
> >>>        uint64_t                uf_sequence;
> >>>
> >>> +     /* virtual addresses for shadow/GDS/CSA */
> >>> +     uint64_t                shadow_va;
> >>> +     uint64_t                csa_va;
> >>> +     uint64_t                gds_va;
> >>> +     bool                    init_shadow;
> >>> +
> >>>        /* job_run_counter >=3D 1 means a resubmit job */
> >>>        uint32_t                job_run_counter;
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_ring.h
> >>> index 3989e755a5b4..8643d4a92c27 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> >>> @@ -212,6 +212,7 @@ struct amdgpu_ring_funcs {
> >>>        void (*end_use)(struct amdgpu_ring *ring);
> >>>        void (*emit_switch_buffer) (struct amdgpu_ring *ring);
> >>>        void (*emit_cntxcntl) (struct amdgpu_ring *ring, uint32_t flag=
s);
> >>> +     void (*emit_gfx_shadow)(struct amdgpu_ring *ring, struct amdgpu=
_job *job);
> >>>        void (*emit_rreg)(struct amdgpu_ring *ring, uint32_t reg,
> >>>                          uint32_t reg_val_offs);
> >>>        void (*emit_wreg)(struct amdgpu_ring *ring, uint32_t reg, uint=
32_t val);
> >>> @@ -307,6 +308,7 @@ struct amdgpu_ring {
> >>>    #define amdgpu_ring_emit_hdp_flush(r) (r)->funcs->emit_hdp_flush((=
r))
> >>>    #define amdgpu_ring_emit_switch_buffer(r) (r)->funcs->emit_switch_=
buffer((r))
> >>>    #define amdgpu_ring_emit_cntxcntl(r, d) (r)->funcs->emit_cntxcntl(=
(r), (d))
> >>> +#define amdgpu_ring_emit_gfx_shadow(r, j) (r)->funcs->emit_gfx_shado=
w((r), (j))
> >>>    #define amdgpu_ring_emit_rreg(r, d, o) (r)->funcs->emit_rreg((r), =
(d), (o))
> >>>    #define amdgpu_ring_emit_wreg(r, d, v) (r)->funcs->emit_wreg((r), =
(d), (v))
> >>>    #define amdgpu_ring_emit_reg_wait(r, d, v, m) (r)->funcs->emit_reg=
_wait((r), (d), (v), (m))
>

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7A2A56BD7
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Mar 2025 16:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D8310EBCB;
	Fri,  7 Mar 2025 15:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PXR1G+wk";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29A210EBCB
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Mar 2025 15:22:50 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2ff5544af03so515715a91.1
 for <amd-gfx@lists.freedesktop.org>; Fri, 07 Mar 2025 07:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741360969; x=1741965769; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wkXNlPbx8hXKie7xfGVOWs0iLMncvUTx8ZKR1N0r398=;
 b=PXR1G+wklutn4SOuZPCkBu7BHqf7cOKVnEFOrWIpW1kaKlogsNmy0e5WmvDPgsHoPE
 Ddkk5djj6iFQ4yofHTXh/bfGahRnO/s+J0LMIV9h9MLENJjzj7xJcdwZVkhhJVV70cIt
 AuEDCbUTdUEs3VQpKqgaVsE2O76ntPuBK/6ED2BTa7PB/JxJ1QOdQ3IMlDzZ6tNSx8id
 5E0GdC7XUqeLtWzOIvd34U8OIqQYKsMs7lgdNq2647wfFntQB2N389Gvc9JHAz9XTW+s
 6t6NzcalP30K0peec76Lf08yyyQz67ltD56jBK87sheiYwODal4nD7Sw32LtBlRHOHqe
 lMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741360969; x=1741965769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wkXNlPbx8hXKie7xfGVOWs0iLMncvUTx8ZKR1N0r398=;
 b=xTnXOPlqomVH9IEybezTv0hEYabfDPMeFrk3OMZ/Euk81XZqq/lHTnwkkSS0iN6KoT
 dSYF5LARaWm+9tyDPTdUlh0SbWuT7Ul+QnjpVNAc5XWoEJnrHWuxA/igHjCgFlHziZdH
 cVUd7Th+mJX0BacXoOpotJ4pdQzg5CzF1RDGb08j4ILsump7PqXVOLAlhuitOZyejlwz
 FCb96DpVaOnyr3ePGyTT+nd/rJRKAOGzfjXp8aGWPVYjsZrisw9Bo0T2txQynLYpqtOM
 TqXGuM+bXx5NkIdojAQAgs5qZhfFRbhafEFI+9WG7gGHncWSlmuVg8uZSDSH4dzNnHnY
 itgQ==
X-Gm-Message-State: AOJu0YwqWfLxNgdbfeobiXytvXjALHL8zqise5yCGXz40XBGNY77lXje
 RqmCtPQK2pY4pTzFVdTDC16YiGnzrWacZNve2wBmySOX3DGMx47Y5coN6T5f/11wCYxqDzBXaim
 I/dlMufcptiVL+ZJG8sA3q/kotBs=
X-Gm-Gg: ASbGncuwizqLuJm2MF0vo8m29wCyCy4W905dPA/mXZkSW17y//TKW2TYzXsUOvFocri
 Yk0IVnN/IAbgdz3w+o1/XEwZfK59RMmBQjWpGU5NQHsJXNNzUy4c08aQXEsbtbed/Hvn1dnM16r
 4cC0q5U9pYrMUxmMM3B1qfGykALg==
X-Google-Smtp-Source: AGHT+IES3pqTWzMNWsNMadzuxOJB4mV1Cs29IBQ9TLi9JuGNw9ElNGy/pfdkeaYJu/EBjG726ViQKIcuqzeQZnSO0Nc=
X-Received: by 2002:a17:90b:3a8d:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-2ff8f91d607mr6516a91.7.1741360969436; Fri, 07 Mar 2025 07:22:49
 -0800 (PST)
MIME-Version: 1.0
References: <20250305191756.1132583-1-alexander.deucher@amd.com>
 <CADnq5_P87L_tMvKaRgE9Mj70BYLtao=6QJRSUpqiyJUVyvLP=w@mail.gmail.com>
In-Reply-To: <CADnq5_P87L_tMvKaRgE9Mj70BYLtao=6QJRSUpqiyJUVyvLP=w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Mar 2025 10:22:37 -0500
X-Gm-Features: AQ5f1JpEmkRtN5ardBEdKeiohdvys5amtUpTkqAJEp6jXQ2G35WgqlEEL-s2ftA
Message-ID: <CADnq5_MeeSipF4Khr36n=qDLa3z0MtFxyqmD0cxfs2eBKUPqQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/vcn: fix idle work handler for VCN 2.5
To: Alex Deucher <alexander.deucher@amd.com>
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

Ping?  This fixes a regression on VCN 2.5.

Thanks,

Alex

On Thu, Mar 6, 2025 at 10:05=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> Ping?
>
> Thanks,
>
> Alex
>
> On Wed, Mar 5, 2025 at 2:42=E2=80=AFPM Alex Deucher <alexander.deucher@am=
d.com> wrote:
> >
> > VCN 2.5 uses the PG callback to enable VCN DPM which is
> > a global state.  As such, we need to make sure all instances
> > are in the same state.
> >
> > v2: switch to a ref count (Lijo)
> > v3: switch to its own idle work handler
> > v4: fix logic in DPG handling
> >
> > Fixes: 4ce4fe27205c ("drm/amdgpu/vcn: use per instance callbacks for id=
le work handler")
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c | 120 +++++++++++++++++++++++++-
> >  1 file changed, 116 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c b/drivers/gpu/drm/am=
d/amdgpu/vcn_v2_5.c
> > index dff1a88590363..ff03436698a4f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c
> > @@ -107,6 +107,115 @@ static int amdgpu_ih_clientid_vcns[] =3D {
> >         SOC15_IH_CLIENTID_VCN1
> >  };
> >
> > +static void vcn_v2_5_idle_work_handler(struct work_struct *work)
> > +{
> > +       struct amdgpu_vcn_inst *vcn_inst =3D
> > +               container_of(work, struct amdgpu_vcn_inst, idle_work.wo=
rk);
> > +       struct amdgpu_device *adev =3D vcn_inst->adev;
> > +       unsigned int fences =3D 0, fence[AMDGPU_MAX_VCN_INSTANCES] =3D =
{0};
> > +       unsigned int i, j;
> > +       int r =3D 0;
> > +
> > +       for (i =3D 0; i < adev->vcn.num_vcn_inst; ++i) {
> > +               struct amdgpu_vcn_inst *v =3D &adev->vcn.inst[i];
> > +
> > +               if (adev->vcn.harvest_config & (1 << i))
> > +                       continue;
> > +
> > +               for (j =3D 0; j < v->num_enc_rings; ++j)
> > +                       fence[i] +=3D amdgpu_fence_count_emitted(&v->ri=
ng_enc[j]);
> > +
> > +               /* Only set DPG pause for VCN3 or below, VCN4 and above=
 will be handled by FW */
> > +               if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG &&
> > +                   !v->using_unified_queue) {
> > +                       struct dpg_pause_state new_state;
> > +
> > +                       if (fence[i] ||
> > +                           unlikely(atomic_read(&v->dpg_enc_submission=
_cnt)))
> > +                               new_state.fw_based =3D VCN_DPG_STATE__P=
AUSE;
> > +                       else
> > +                               new_state.fw_based =3D VCN_DPG_STATE__U=
NPAUSE;
> > +
> > +                       v->pause_dpg_mode(v, &new_state);
> > +               }
> > +
> > +               fence[i] +=3D amdgpu_fence_count_emitted(&v->ring_dec);
> > +               fences +=3D fence[i];
> > +
> > +       }
> > +
> > +       if (!fences && !atomic_read(&adev->vcn.inst[0].total_submission=
_cnt)) {
> > +               amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLO=
CK_TYPE_VCN,
> > +                                                      AMD_PG_STATE_GAT=
E);
> > +               r =3D amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWE=
R_PROFILE_VIDEO,
> > +                                                   false);
> > +               if (r)
> > +                       dev_warn(adev->dev, "(%d) failed to disable vid=
eo power profile mode\n", r);
> > +       } else {
> > +               schedule_delayed_work(&adev->vcn.inst[0].idle_work, VCN=
_IDLE_TIMEOUT);
> > +       }
> > +}
> > +
> > +static void vcn_v2_5_ring_begin_use(struct amdgpu_ring *ring)
> > +{
> > +       struct amdgpu_device *adev =3D ring->adev;
> > +       struct amdgpu_vcn_inst *v =3D &adev->vcn.inst[ring->me];
> > +       int r =3D 0;
> > +
> > +       atomic_inc(&adev->vcn.inst[0].total_submission_cnt);
> > +
> > +       if (!cancel_delayed_work_sync(&adev->vcn.inst[0].idle_work)) {
> > +               r =3D amdgpu_dpm_switch_power_profile(adev, PP_SMC_POWE=
R_PROFILE_VIDEO,
> > +                                                   true);
> > +               if (r)
> > +                       dev_warn(adev->dev, "(%d) failed to switch to v=
ideo power profile mode\n", r);
> > +       }
> > +
> > +       mutex_lock(&adev->vcn.inst[0].vcn_pg_lock);
> > +       amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_=
VCN,
> > +                                              AMD_PG_STATE_UNGATE);
> > +
> > +       /* Only set DPG pause for VCN3 or below, VCN4 and above will be=
 handled by FW */
> > +       if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG &&
> > +           !v->using_unified_queue) {
> > +               struct dpg_pause_state new_state;
> > +
> > +               if (ring->funcs->type =3D=3D AMDGPU_RING_TYPE_VCN_ENC) =
{
> > +                       atomic_inc(&v->dpg_enc_submission_cnt);
> > +                       new_state.fw_based =3D VCN_DPG_STATE__PAUSE;
> > +               } else {
> > +                       unsigned int fences =3D 0;
> > +                       unsigned int i;
> > +
> > +                       for (i =3D 0; i < v->num_enc_rings; ++i)
> > +                               fences +=3D amdgpu_fence_count_emitted(=
&v->ring_enc[i]);
> > +
> > +                       if (fences || atomic_read(&v->dpg_enc_submissio=
n_cnt))
> > +                               new_state.fw_based =3D VCN_DPG_STATE__P=
AUSE;
> > +                       else
> > +                               new_state.fw_based =3D VCN_DPG_STATE__U=
NPAUSE;
> > +               }
> > +               v->pause_dpg_mode(v, &new_state);
> > +       }
> > +       mutex_unlock(&adev->vcn.inst[0].vcn_pg_lock);
> > +}
> > +
> > +static void vcn_v2_5_ring_end_use(struct amdgpu_ring *ring)
> > +{
> > +       struct amdgpu_device *adev =3D ring->adev;
> > +
> > +       /* Only set DPG pause for VCN3 or below, VCN4 and above will be=
 handled by FW */
> > +       if (ring->adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG &&
> > +           ring->funcs->type =3D=3D AMDGPU_RING_TYPE_VCN_ENC &&
> > +           !adev->vcn.inst[ring->me].using_unified_queue)
> > +               atomic_dec(&adev->vcn.inst[ring->me].dpg_enc_submission=
_cnt);
> > +
> > +       atomic_dec(&adev->vcn.inst[0].total_submission_cnt);
> > +
> > +       schedule_delayed_work(&adev->vcn.inst[0].idle_work,
> > +                             VCN_IDLE_TIMEOUT);
> > +}
> > +
> >  /**
> >   * vcn_v2_5_early_init - set function pointers and load microcode
> >   *
> > @@ -201,6 +310,9 @@ static int vcn_v2_5_sw_init(struct amdgpu_ip_block =
*ip_block)
> >                 if (r)
> >                         return r;
> >
> > +               /* Override the work func */
> > +               adev->vcn.inst[j].idle_work.work.func =3D vcn_v2_5_idle=
_work_handler;
> > +
> >                 amdgpu_vcn_setup_ucode(adev, j);
> >
> >                 r =3D amdgpu_vcn_resume(adev, j);
> > @@ -1661,8 +1773,8 @@ static const struct amdgpu_ring_funcs vcn_v2_5_de=
c_ring_vm_funcs =3D {
> >         .insert_start =3D vcn_v2_0_dec_ring_insert_start,
> >         .insert_end =3D vcn_v2_0_dec_ring_insert_end,
> >         .pad_ib =3D amdgpu_ring_generic_pad_ib,
> > -       .begin_use =3D amdgpu_vcn_ring_begin_use,
> > -       .end_use =3D amdgpu_vcn_ring_end_use,
> > +       .begin_use =3D vcn_v2_5_ring_begin_use,
> > +       .end_use =3D vcn_v2_5_ring_end_use,
> >         .emit_wreg =3D vcn_v2_0_dec_ring_emit_wreg,
> >         .emit_reg_wait =3D vcn_v2_0_dec_ring_emit_reg_wait,
> >         .emit_reg_write_reg_wait =3D amdgpu_ring_emit_reg_write_reg_wai=
t_helper,
> > @@ -1759,8 +1871,8 @@ static const struct amdgpu_ring_funcs vcn_v2_5_en=
c_ring_vm_funcs =3D {
> >         .insert_nop =3D amdgpu_ring_insert_nop,
> >         .insert_end =3D vcn_v2_0_enc_ring_insert_end,
> >         .pad_ib =3D amdgpu_ring_generic_pad_ib,
> > -       .begin_use =3D amdgpu_vcn_ring_begin_use,
> > -       .end_use =3D amdgpu_vcn_ring_end_use,
> > +       .begin_use =3D vcn_v2_5_ring_begin_use,
> > +       .end_use =3D vcn_v2_5_ring_end_use,
> >         .emit_wreg =3D vcn_v2_0_enc_ring_emit_wreg,
> >         .emit_reg_wait =3D vcn_v2_0_enc_ring_emit_reg_wait,
> >         .emit_reg_write_reg_wait =3D amdgpu_ring_emit_reg_write_reg_wai=
t_helper,
> > --
> > 2.48.1
> >

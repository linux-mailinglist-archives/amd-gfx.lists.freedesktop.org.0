Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2341C250AEB
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Aug 2020 23:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D206E5CA;
	Mon, 24 Aug 2020 21:32:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29C6E5CA
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Aug 2020 21:32:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id t2so360095wma.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Aug 2020 14:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M4E5TBF8BU2Y18XlwYB3hr1Pi4tUZQ1rcQagDOIcY0Q=;
 b=dWX+62EsQMKQ/TXEfi1iqDggCgS+nb7z/p9MZrjP6FCkSYEAkFQld8dGH+EQeiQQgh
 jSSg0i+Hak3lTMNPUjXQOLvPv+76Y0wbePVkiOLBEJIkTjEwp1ALw5wWuEPCoEBUWA7p
 LoELIe7I5gxQbTxsjb1rP2DRL8YQgdPAQuY6nvS42vtTLtiLfQbNhoTylQSSiLsBHzSj
 z+vbLC1+fZpo1sCUnwDozQy84SZH8p+2FSmOyYReI6J9QQtgqWJjJ7P2YUTwMRwCFiZK
 HTpQHiNF+vhv3WJOpFzu8vH1augU9uzdzmLwehX2dOOm3wAL4QF1EfzsEhoQXNrIeC8O
 3ECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M4E5TBF8BU2Y18XlwYB3hr1Pi4tUZQ1rcQagDOIcY0Q=;
 b=pdboB/WSWpdN+Ceg8QA3/hrNOhouM7Mo7dlJOZDfCIaHSGZH1+bHZd5zoKbFNzyR94
 /Op/dL3lZFyMYx/DmO9GsVDyFTgNOxQ0L50XMgMpT08VmxL6Bu+Ta0h6P2s/OinP7rcG
 c0hF238JcMG94vQrTCeilowEAMkGbssXn6dqCXWe/gG6PUOP51W0G8/yj8/+zHR0ueP0
 NCW1aOGthTgddEBf0BjF22wYq+b4sQxnUryovKwkDeTss70hV0AFgMOZEwia6dA1XXKX
 zgGKj7HlU1fJ/rs9PdgXoO5tO0IQETCMhJNep8GWjaYN5j5/PnAhB7gHij/E2JnEhN4n
 /Akw==
X-Gm-Message-State: AOAM530AR5am1R9NFCvHAnzXYn6DN/ZfGuKkRlGX9IQlK3WT0jos1Zv0
 sCfquBvQGGEGcNegVLqvJn3dRDtE3FFmi5JCZQQ=
X-Google-Smtp-Source: ABdhPJwaK1zq4Who4UyFfByUg5TvTHVuwyb5kmbD9F25VciSlCwjgKoGC2wdLVGixt4Y/dZ0p01j9C/2PIFsiHwuBhA=
X-Received: by 2002:a1c:f70a:: with SMTP id v10mr1092978wmh.39.1598304768737; 
 Mon, 24 Aug 2020 14:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200824114916.11808-1-samuel.pitoiset@gmail.com>
 <CADnq5_NVpA7VJU09==zmK4K-O1+mUWZAGxW7PFuCnpmiFO_18w@mail.gmail.com>
In-Reply-To: <CADnq5_NVpA7VJU09==zmK4K-O1+mUWZAGxW7PFuCnpmiFO_18w@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Aug 2020 17:32:36 -0400
Message-ID: <CADnq5_NFwAbj-rcM0C8_6EwuOpf9mHF8hkYWfUuArP3nMyQ=HA@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/amdgpu: add support for user trap handlers
To: Samuel Pitoiset <samuel.pitoiset@gmail.com>
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

On Mon, Aug 24, 2020 at 2:33 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Mon, Aug 24, 2020 at 7:57 AM Samuel Pitoiset
> <samuel.pitoiset@gmail.com> wrote:
> >
> > A trap handler can be used by userspace to catch shader exceptions
> > like divide by zero, memory violations etc.
> >
> > On GFX6-GFX8, the registers used to configure TBA/TMA aren't
> > privileged while on GFX9+ they are per VMID and privileged,
> > so that only the KMD can configure them.
> >
> > This introduces a new CS chunk that can be used to set the
> > TBA/TMA virtual address at submit time.
> >
> > TODO:
> > - add GFX 6,7 and 10 support
> > - rebase on top of amd-staging-drm-next (this branch currently
> > hangs my GPU at boot)
> >
> > Signed-off-by: Samuel Pitoiset <samuel.pitoiset@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   | 31 +++++++++++++++++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  3 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h  |  4 +++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h  |  4 +++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h |  4 +++
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 15 ++++++++-
> >  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c    | 42 ++++++++++++++++++++++--
> >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c    | 19 +++++++++++
> >  include/uapi/drm/amdgpu_drm.h            |  8 +++++
> >  9 files changed, 126 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > index a512ccbc4dea..6ca5c4912e3a 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -104,6 +104,19 @@ static int amdgpu_cs_bo_handles_chunk(struct amdgpu_cs_parser *p,
> >         return r;
> >  }
> >
> > +static int amdgpu_cs_user_trap_chunk(struct amdgpu_cs_parser *p,
> > +                                    struct drm_amdgpu_cs_chunk_trap *data,
> > +                                    uint64_t *tba_addr, uint64_t *tma_addr)
> > +{
> > +       if (!data->tba_addr || !data->tma_addr)
> > +               return -EINVAL;
> > +
> > +       *tba_addr = data->tba_addr;
> > +       *tma_addr = data->tma_addr;
> > +
> > +       return 0;
> > +}
> > +
> >  static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs *cs)
> >  {
> >         struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
> > @@ -112,6 +125,7 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
> >         uint64_t *chunk_array;
> >         unsigned size, num_ibs = 0;
> >         uint32_t uf_offset = 0;
> > +       uint64_t tba_addr = 0, tma_addr = 0;
> >         int i;
> >         int ret;
> >
> > @@ -214,6 +228,19 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
> >
> >                         break;
> >
> > +               case AMDGPU_CHUNK_ID_TRAP:
> > +                       size = sizeof(struct drm_amdgpu_cs_chunk_trap);
> > +                       if (p->chunks[i].length_dw * sizeof(uint32_t) < size) {
> > +                               ret = -EINVAL;
> > +                               goto free_partial_kdata;
> > +                       }
> > +
> > +                       ret = amdgpu_cs_user_trap_chunk(p, p->chunks[i].kdata,
> > +                                                       &tba_addr, &tma_addr);
> > +                       if (ret)
> > +                               goto free_partial_kdata;
> > +                       break;
> > +
> >                 case AMDGPU_CHUNK_ID_DEPENDENCIES:
> >                 case AMDGPU_CHUNK_ID_SYNCOBJ_IN:
> >                 case AMDGPU_CHUNK_ID_SYNCOBJ_OUT:
> > @@ -239,6 +266,10 @@ static int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, union drm_amdgpu_cs
> >
> >         if (p->uf_entry.tv.bo)
> >                 p->job->uf_addr = uf_offset;
> > +
> > +       p->job->tba_addr = tba_addr;
> > +       p->job->tma_addr = tma_addr;
> > +
> >         kfree(chunk_array);
> >
> >         /* Use this opportunity to fill in task info for the vm */
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index 26127c7d2f32..1e703119e4c2 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -88,9 +88,10 @@
> >   * - 3.37.0 - L2 is invalidated before SDMA IBs, needed for correctness
> >   * - 3.38.0 - Add AMDGPU_IB_FLAG_EMIT_MEM_SYNC
> >   * - 3.39.0 - DMABUF implicit sync does a full pipeline sync
> > + * - 3.40.0 - Add AMDGPU_CHUNK_ID_TRAP
> >   */
> >  #define KMS_DRIVER_MAJOR       3
> > -#define KMS_DRIVER_MINOR       39
> > +#define KMS_DRIVER_MINOR       40
> >  #define KMS_DRIVER_PATCHLEVEL  0
> >
> >  int amdgpu_vram_limit = 0;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
> > index 8e58325bbca2..fd0d56724b4d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
> > @@ -58,6 +58,10 @@ struct amdgpu_vmid {
> >         uint32_t                oa_base;
> >         uint32_t                oa_size;
> >
> > +       /* user trap */
> > +       uint64_t                tba_addr;
> > +       uint64_t                tma_addr;
> > +
> >         unsigned                pasid;
> >         struct dma_fence        *pasid_mapping;
> >  };
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > index 81caac9b958a..b8ed5b13ea44 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
> > @@ -62,6 +62,10 @@ struct amdgpu_job {
> >         /* user fence handling */
> >         uint64_t                uf_addr;
> >         uint64_t                uf_sequence;
> > +
> > +       /* user trap handling */
> > +       uint64_t                tba_addr;
> > +       uint64_t                tma_addr;
> >  };
> >
> >  int amdgpu_job_alloc(struct amdgpu_device *adev, unsigned num_ibs,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > index da871d84b742..1f165a6295d9 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> > @@ -197,6 +197,9 @@ struct amdgpu_ring_funcs {
> >         void (*soft_recovery)(struct amdgpu_ring *ring, unsigned vmid);
> >         int (*preempt_ib)(struct amdgpu_ring *ring);
> >         void (*emit_mem_sync)(struct amdgpu_ring *ring);
> > +       void (*emit_trap_handler)(struct amdgpu_ring *ring,
> > +                                 uint32_t vmid,
> > +                                 uint64_t tba_addr, uint64_t tma_addr);
> >  };
> >
> >  struct amdgpu_ring {
> > @@ -265,6 +268,7 @@ struct amdgpu_ring {
> >  #define amdgpu_ring_emit_vm_flush(r, vmid, addr) (r)->funcs->emit_vm_flush((r), (vmid), (addr))
> >  #define amdgpu_ring_emit_fence(r, addr, seq, flags) (r)->funcs->emit_fence((r), (addr), (seq), (flags))
> >  #define amdgpu_ring_emit_gds_switch(r, v, db, ds, wb, ws, ab, as) (r)->funcs->emit_gds_switch((r), (v), (db), (ds), (wb), (ws), (ab), (as))
> > +#define amdgpu_ring_emit_trap_handler(r, v, tba, tma) (r)->funcs->emit_trap_handler((r), (v), (tba), (tma))
> >  #define amdgpu_ring_emit_hdp_flush(r) (r)->funcs->emit_hdp_flush((r))
> >  #define amdgpu_ring_emit_switch_buffer(r) (r)->funcs->emit_switch_buffer((r))
> >  #define amdgpu_ring_emit_cntxcntl(r, d) (r)->funcs->emit_cntxcntl((r), (d))
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > index 71e005cf2952..24916082de0b 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> > @@ -1076,6 +1076,9 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
> >                 id->gws_size != job->gws_size ||
> >                 id->oa_base != job->oa_base ||
> >                 id->oa_size != job->oa_size);
> > +       bool trap_handler_needed = ring->funcs->emit_trap_handler && (
> > +               id->tba_addr != job->tba_addr ||
> > +               id->tma_addr != job->tma_addr);
> >         bool vm_flush_needed = job->vm_needs_flush;
> >         struct dma_fence *fence = NULL;
> >         bool pasid_mapping_needed = false;
> > @@ -1088,6 +1091,7 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
> >
> >         if (amdgpu_vmid_had_gpu_reset(adev, id)) {
> >                 gds_switch_needed = true;
> > +               trap_handler_needed = true;
> >                 vm_flush_needed = true;
> >                 pasid_mapping_needed = true;
> >         }
> > @@ -1099,12 +1103,14 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
> >         mutex_unlock(&id_mgr->lock);
> >
> >         gds_switch_needed &= !!ring->funcs->emit_gds_switch;
> > +       trap_handler_needed &= !!ring->funcs->emit_trap_handler;
> >         vm_flush_needed &= !!ring->funcs->emit_vm_flush  &&
> >                         job->vm_pd_addr != AMDGPU_BO_INVALID_OFFSET;
> >         pasid_mapping_needed &= adev->gmc.gmc_funcs->emit_pasid_mapping &&
> >                 ring->funcs->emit_wreg;
> >
> > -       if (!vm_flush_needed && !gds_switch_needed && !need_pipe_sync)
> > +       if (!vm_flush_needed && !gds_switch_needed &&
> > +           !trap_handler_needed && !need_pipe_sync)
> >                 return 0;
> >
> >         if (ring->funcs->init_cond_exec)
> > @@ -1158,6 +1164,13 @@ int amdgpu_vm_flush(struct amdgpu_ring *ring, struct amdgpu_job *job,
> >                                             job->oa_size);
> >         }
> >
> > +       if (ring->funcs->emit_trap_handler && trap_handler_needed) {
> > +               id->tba_addr = job->tba_addr;
> > +               id->tma_addr = job->tma_addr;
> > +               amdgpu_ring_emit_trap_handler(ring, job->vmid, job->tba_addr,
> > +                                             job->tma_addr);
> > +       }
> > +
> >         if (ring->funcs->patch_cond_exec)
> >                 amdgpu_ring_patch_cond_exec(ring, patch_offset);
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > index 33f1c4a46ebe..59db577e8c8f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c
> > @@ -5222,6 +5222,40 @@ static void gfx_v8_0_ring_emit_gds_switch(struct amdgpu_ring *ring,
> >         amdgpu_ring_write(ring, (1 << (oa_size + oa_base)) - (1 << oa_base));
> >  }
> >
> > +static void gfx_v8_0_ring_emit_trap_handler(struct amdgpu_ring *ring,
> > +                                           uint32_t vmid,
> > +                                           uint64_t tba_addr,
> > +                                           uint64_t tma_addr)
> > +{
> > +       if (ring->funcs->type == AMDGPU_RING_TYPE_GFX) {
> > +               static const u32 regs[] = {
> > +                       mmSPI_SHADER_TBA_LO_PS,
> > +                       mmSPI_SHADER_TBA_LO_VS,
> > +                       mmSPI_SHADER_TBA_LO_GS,
> > +                       mmSPI_SHADER_TBA_LO_ES,
> > +                       mmSPI_SHADER_TBA_LO_HS,
> > +                       mmSPI_SHADER_TBA_LO_LS,
> > +               };
> > +               int i;
> > +
> > +               for (i = 0; i < ARRAY_SIZE(regs); i++) {
> > +                       amdgpu_ring_write(ring, PACKET3(PACKET3_SET_SH_REG, 4));
> > +                       amdgpu_ring_write(ring, regs[i] - PACKET3_SET_SH_REG_START);
> > +                       amdgpu_ring_write(ring, lower_32_bits(tba_addr >> 8));
> > +                       amdgpu_ring_write(ring, upper_32_bits(tba_addr >> 8));
> > +                       amdgpu_ring_write(ring, lower_32_bits(tma_addr >> 8));
> > +                       amdgpu_ring_write(ring, upper_32_bits(tma_addr >> 8));
> > +               }
> > +       } else {
> > +               amdgpu_ring_write(ring, PACKET3(PACKET3_SET_SH_REG, 4));
> > +               amdgpu_ring_write(ring, mmCOMPUTE_TBA_LO - PACKET3_SET_SH_REG_START);
> > +               amdgpu_ring_write(ring, lower_32_bits(tba_addr >> 8));
> > +               amdgpu_ring_write(ring, upper_32_bits(tba_addr >> 8));
> > +               amdgpu_ring_write(ring, lower_32_bits(tma_addr >> 8));
> > +               amdgpu_ring_write(ring, upper_32_bits(tma_addr >> 8));
> > +       }
> > +}
> > +
> >  static uint32_t wave_read_ind(struct amdgpu_device *adev, uint32_t simd, uint32_t wave, uint32_t address)
> >  {
> >         WREG32(mmSQ_IND_INDEX,
> > @@ -6890,7 +6924,8 @@ static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_gfx = {
> >                 5 + /* HDP_INVL */
> >                 12 + 12 + /* FENCE x2 */
> >                 2 + /* SWITCH_BUFFER */
> > -               5, /* SURFACE_SYNC */
> > +               5 + /* SURFACE_SYNC */
> > +               36, /* gfx_v8_0_ring_emit_trap_handler */
> >         .emit_ib_size = 4, /* gfx_v8_0_ring_emit_ib_gfx */
> >         .emit_ib = gfx_v8_0_ring_emit_ib_gfx,
> >         .emit_fence = gfx_v8_0_ring_emit_fence_gfx,
> > @@ -6909,6 +6944,7 @@ static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_gfx = {
> >         .emit_wreg = gfx_v8_0_ring_emit_wreg,
> >         .soft_recovery = gfx_v8_0_ring_soft_recovery,
> >         .emit_mem_sync = gfx_v8_0_emit_mem_sync,
> > +       .emit_trap_handler = gfx_v8_0_ring_emit_trap_handler,
> >  };
> >
> >  static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_compute = {
> > @@ -6926,7 +6962,8 @@ static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_compute = {
> >                 7 + /* gfx_v8_0_ring_emit_pipeline_sync */
> >                 VI_FLUSH_GPU_TLB_NUM_WREG * 5 + 7 + /* gfx_v8_0_ring_emit_vm_flush */
> >                 7 + 7 + 7 + /* gfx_v8_0_ring_emit_fence_compute x3 for user fence, vm fence */
> > -               7, /* gfx_v8_0_emit_mem_sync_compute */
> > +               7 + /* gfx_v8_0_emit_mem_sync_compute */
> > +               6, /* gfx_v8_0_emit_trap_handler */
> >         .emit_ib_size = 7, /* gfx_v8_0_ring_emit_ib_compute */
> >         .emit_ib = gfx_v8_0_ring_emit_ib_compute,
> >         .emit_fence = gfx_v8_0_ring_emit_fence_compute,
> > @@ -6940,6 +6977,7 @@ static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_compute = {
> >         .pad_ib = amdgpu_ring_generic_pad_ib,
> >         .emit_wreg = gfx_v8_0_ring_emit_wreg,
> >         .emit_mem_sync = gfx_v8_0_emit_mem_sync_compute,
> > +       .emit_trap_handler = gfx_v8_0_ring_emit_trap_handler,
> >  };
> >
> >  static const struct amdgpu_ring_funcs gfx_v8_0_ring_funcs_kiq = {
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > index cb9d60a4e05e..4fc00f196085 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > @@ -4162,6 +4162,23 @@ static void gfx_v9_0_ring_emit_gds_switch(struct amdgpu_ring *ring,
> >                                    (1 << (oa_size + oa_base)) - (1 << oa_base));
> >  }
> >
> > +static void gfx_v9_0_ring_emit_trap_handler(struct amdgpu_ring *ring,
> > +                                           uint32_t vmid,
> > +                                           uint64_t tba_addr,
> > +                                           uint64_t tma_addr)
> > +{
> > +       struct amdgpu_device *adev = ring->adev;
> > +
> > +       mutex_lock(&adev->srbm_mutex);
> > +       soc15_grbm_select(adev, 0, 0, 0, vmid);
> > +       WREG32_SOC15_RLC(GC, 0, mmSQ_SHADER_TBA_LO, lower_32_bits(tba_addr >> 8));
> > +       WREG32_SOC15_RLC(GC, 0, mmSQ_SHADER_TBA_HI, upper_32_bits(tba_addr >> 8));
> > +       WREG32_SOC15_RLC(GC, 0, mmSQ_SHADER_TMA_LO, lower_32_bits(tma_addr >> 8));
> > +       WREG32_SOC15_RLC(GC, 0, mmSQ_SHADER_TMA_HI, upper_32_bits(tma_addr >> 8));
> > +       soc15_grbm_select(adev, 0, 0, 0, 0);
> > +       mutex_unlock(&adev->srbm_mutex);
>
> This won't work.  This updates registers via MMIO using the CPU.  We
> need to have the registers updated asynchronously via the CP so they
> get updated when the specific jobs are executed by the engine.  vmid's
> are shared resources and are assigned dynamically via the kernel
> driver.  If you update via MMIO the changes take effect immediately
> rather than when the actual work is scheduled on the engine.
> Unfortunately, at the moment, I don't see a way to do this with the CP
> with the packets that are currently available.

One option might be to do this via MMIO, but only support it when
using a reserved vmid.

Alex


>
> Alex
>
>
> > +}
> > +
> >  static const u32 vgpr_init_compute_shader[] =
> >  {
> >         0xb07c0000, 0xbe8000ff,
> > @@ -6720,6 +6737,7 @@ static const struct amdgpu_ring_funcs gfx_v9_0_ring_funcs_gfx = {
> >         .emit_reg_write_reg_wait = gfx_v9_0_ring_emit_reg_write_reg_wait,
> >         .soft_recovery = gfx_v9_0_ring_soft_recovery,
> >         .emit_mem_sync = gfx_v9_0_emit_mem_sync,
> > +       .emit_trap_handler = gfx_v9_0_ring_emit_trap_handler,
> >  };
> >
> >  static const struct amdgpu_ring_funcs gfx_v9_0_ring_funcs_compute = {
> > @@ -6756,6 +6774,7 @@ static const struct amdgpu_ring_funcs gfx_v9_0_ring_funcs_compute = {
> >         .emit_reg_wait = gfx_v9_0_ring_emit_reg_wait,
> >         .emit_reg_write_reg_wait = gfx_v9_0_ring_emit_reg_write_reg_wait,
> >         .emit_mem_sync = gfx_v9_0_emit_mem_sync,
> > +       .emit_trap_handler = gfx_v9_0_ring_emit_trap_handler,
> >  };
> >
> >  static const struct amdgpu_ring_funcs gfx_v9_0_ring_funcs_kiq = {
> > diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> > index 3218576e109d..7eae264adb5d 100644
> > --- a/include/uapi/drm/amdgpu_drm.h
> > +++ b/include/uapi/drm/amdgpu_drm.h
> > @@ -551,6 +551,7 @@ struct drm_amdgpu_gem_va {
> >  #define AMDGPU_CHUNK_ID_SCHEDULED_DEPENDENCIES 0x07
> >  #define AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_WAIT    0x08
> >  #define AMDGPU_CHUNK_ID_SYNCOBJ_TIMELINE_SIGNAL  0x09
> > +#define AMDGPU_CHUNK_ID_TRAP            0x0a
> >
> >  struct drm_amdgpu_cs_chunk {
> >         __u32           chunk_id;
> > @@ -645,6 +646,13 @@ struct drm_amdgpu_cs_chunk_syncobj {
> >         __u64 point;
> >  };
> >
> > +struct drm_amdgpu_cs_chunk_trap {
> > +       /** Trap Base Address */
> > +       __u64 tba_addr;
> > +       /** Trap Memory Address */
> > +       __u64 tma_addr;
> > +};
> > +
> >  #define AMDGPU_FENCE_TO_HANDLE_GET_SYNCOBJ     0
> >  #define AMDGPU_FENCE_TO_HANDLE_GET_SYNCOBJ_FD  1
> >  #define AMDGPU_FENCE_TO_HANDLE_GET_SYNC_FILE_FD        2
> > --
> > 2.28.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

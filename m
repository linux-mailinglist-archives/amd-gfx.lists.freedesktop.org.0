Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFF38A3E91
	for <lists+amd-gfx@lfdr.de>; Sat, 13 Apr 2024 23:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EDC10E4E0;
	Sat, 13 Apr 2024 21:03:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nbf8fWc5";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6CB10E4E0
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Apr 2024 21:02:54 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2a2d248a2e1so1996707a91.0
 for <amd-gfx@lists.freedesktop.org>; Sat, 13 Apr 2024 14:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713042174; x=1713646974; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ifc6LrRzPQFykavYXK4lEfZrMMTbm5e1S3+ycr8xoIk=;
 b=nbf8fWc5N3bE5bhZ+ZUgQN8buXTSGgHmtmoHzyFOi3kdiTZscY2VqAQHO5MTnJcii5
 Kwm2y+OKMIsNe7qv26TVLPmQOlD8qdb5yII1RpsRCSWVhnhw04rwsoVhllLNifxVdSqa
 zJ2dvMbR6r+jGqsy52vd4sZEavsqBCCH1DwtXDwXF+LVrYtnWPh8lTiQUfwyXabbfzvN
 JrJTaMMulKUkwS69JFd0qgkPC10p+EA2KFuJ6LoZxHiT8OdFYgHu9zFVweJOZ4G4lxwO
 +734t09QWtSXBtKyOjsfg6L6H4qEf6BpOu+AAnsdvZmQxCbgTVYPr0rhtr+FGlgNv5Oy
 +4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713042174; x=1713646974;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ifc6LrRzPQFykavYXK4lEfZrMMTbm5e1S3+ycr8xoIk=;
 b=EqQTEaUkxsphCHChHPB5fonBaiWhAc/ZgMFODJzeDJu/i20iDFuVBkJZJbiniaB19M
 fLbuYJFVGmy03sdRXprnvv71NHIVAsJuM763J7qiEyoV0ekKKdexsTh2ZG8fDXdKdBUj
 MhRDtEbJ+LVzl4pChrVwmzT7yKSRAx4loxYeN50lCKikTvyt707DDvB+U2DGaD81dadB
 X1WeDKxGo7eiD2jlOCmG1v0tY/VzpK8KcVtsaE1s9deLxzAfsiNpRDL0t5CtbusN7Vxx
 ldSSCOTVXeeluUBbSj0mtIjIjYy9akbSeEB5mHlPO4jSQzhFIJbcwC7fyf3dLeoB/pyR
 t9Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwbZBoFbOACx6j6OfxS8E/1UieeRyThqNfR1oydbT6ZdMwdF/2PXJdjEP7Ffj7fxtrGOmEkF2CsOhSd7YLQ9Fm4AC5iJQG6qIFBUwx9Q==
X-Gm-Message-State: AOJu0YzUcJV+T5Ww6Z2nduFZhcoLTo9L9FQzM14wUCEPZ9DB5ErTnYfi
 4zXJSUfw1sAel7YKoNjMqf594ZcRyR+R7/N15nNEzY5EFEMLxdsuxExkhKHxtHcTY2cGk+ip9CK
 ZAa2o0uv8gc3h8g3N8gwpLvn4IwA=
X-Google-Smtp-Source: AGHT+IEDg6H/yQlcX8d5xTH0Jt7EdRr4b8J1AfM7ouuMYLYZAmLxqgv+j0rm2oziD3pFeF1iB23lE7bOOaypzwYkIco=
X-Received: by 2002:a17:90a:d341:b0:2a0:7895:f356 with SMTP id
 i1-20020a17090ad34100b002a07895f356mr12589236pjx.12.1713042173489; Sat, 13
 Apr 2024 14:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240412140034.65565-1-sunil.khatri@amd.com>
 <20240412140034.65565-2-sunil.khatri@amd.com>
 <CADnq5_OY3Kkad2JQz99qRVX3Xh4tk4CBvGPC2FYu4RmQ9yXORg@mail.gmail.com>
 <f7e75379-34eb-4733-b489-c76a2fb8f26e@amd.com>
 <CADnq5_Ow3YOBZMAWofCAyeX+TvDnGAAj=izPU5jZLsy=w1ZY0g@mail.gmail.com>
 <4be19b73-fe80-4803-b97d-2c9995699e01@amd.com>
 <CADnq5_Mu6MesrLoCaaG1yG4BQTDfnXJ9CWo=N45Qgc7uuA4zig@mail.gmail.com>
 <PH7PR12MB5596110814B700F003E613CD930B2@PH7PR12MB5596.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB5596110814B700F003E613CD930B2@PH7PR12MB5596.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 13 Apr 2024 17:02:41 -0400
Message-ID: <CADnq5_OqXpKxqdE-GtTmyWxPCm3OezX4f5P8S30M3T7WbgELKg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Add support of gfx10 register dump
To: "Khatri, Sunil" <Sunil.Khatri@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
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

On Sat, Apr 13, 2024 at 12:35=E2=80=AFAM Khatri, Sunil <Sunil.Khatri@amd.co=
m> wrote:
>
> [AMD Official Use Only - General]
>
> -----Original Message-----
> From: Alex Deucher <alexdeucher@gmail.com>
> Sent: Saturday, April 13, 2024 1:56 AM
> To: Khatri, Sunil <Sunil.Khatri@amd.com>
> Cc: Khatri, Sunil <Sunil.Khatri@amd.com>; Deucher, Alexander <Alexander.D=
eucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; amd-gfx@list=
s.freedesktop.org
> Subject: Re: [PATCH v2 2/2] drm/amdgpu: Add support of gfx10 register dum=
p
>
> On Fri, Apr 12, 2024 at 1:31=E2=80=AFPM Khatri, Sunil <sukhatri@amd.com> =
wrote:
> >
> >
> > On 4/12/2024 10:42 PM, Alex Deucher wrote:
> >
> > On Fri, Apr 12, 2024 at 1:05=E2=80=AFPM Khatri, Sunil <sukhatri@amd.com=
> wrote:
> >
> > On 4/12/2024 8:50 PM, Alex Deucher wrote:
> >
> > On Fri, Apr 12, 2024 at 10:00=E2=80=AFAM Sunil Khatri <sunil.khatri@amd=
.com> wrote:
> >
> > Adding initial set of registers for ipdump during devcoredump starting
> > with gfx10 gc registers.
> >
> > ip dump is triggered when gpu reset happens via devcoredump and the
> > memory is allocated by each ip and is freed once the dump is complete
> > by devcoredump.
> >
> > Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  16 +++
> >   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  |  22 +++
> >
> > I would split this into two patches, one to add the core
> > infrastructure in devcoredump and one to add gfx10 support.  The core
> > support could be squashed into patch 1 as well.
> >
> > Sure
> >
> >   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 127 +++++++++++++++++=
-
> >   .../include/asic_reg/gc/gc_10_1_0_offset.h    |  12 ++
> >   4 files changed, 176 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index 65c17c59c152..e173ad86a241 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -139,6 +139,18 @@ enum amdgpu_ss {
> >          AMDGPU_SS_DRV_UNLOAD
> >   };
> >
> > +struct hwip_reg_entry {
> > +       u32     hwip;
> > +       u32     inst;
> > +       u32     seg;
> > +       u32     reg_offset;
> > +};
> > +
> > +struct reg_pair {
> > +       u32     offset;
> > +       u32     value;
> > +};
> > +
> >   struct amdgpu_watchdog_timer {
> >          bool timeout_fatal_disable;
> >          uint32_t period; /* maxCycles =3D (1 << period), the number of
> > cycles before a timeout */ @@ -1152,6 +1164,10 @@ struct amdgpu_device =
{
> >          bool                            debug_largebar;
> >          bool                            debug_disable_soft_recovery;
> >          bool                            debug_use_vram_fw_buf;
> > +
> > +       /* IP register dump */
> > +       struct reg_pair                 *ip_dump;
> > +       uint32_t                        num_regs;
> >   };
> >
> >   static inline uint32_t amdgpu_ip_version(const struct amdgpu_device
> > *adev, diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> > index 1129e5e5fb42..2079f67c9fac 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
> > @@ -261,6 +261,18 @@ amdgpu_devcoredump_read(char *buffer, loff_t offse=
t, size_t count,
> >          drm_printf(&p, "Faulty page starting at address: 0x%016llx\n",=
 fault_info->addr);
> >          drm_printf(&p, "Protection fault status register: 0x%x\n\n",
> > fault_info->status);
> >
> > +       /* Add IP dump for each ip */
> > +       if (coredump->adev->ip_dump !=3D NULL) {
> > +               struct reg_pair *pair;
> > +
> > +               pair =3D (struct reg_pair *)coredump->adev->ip_dump;
> > +               drm_printf(&p, "IP register dump\n");
> > +               drm_printf(&p, "Offset \t Value\n");
> > +               for (int i =3D 0; i < coredump->adev->num_regs; i++)
> > +                       drm_printf(&p, "0x%04x \t 0x%08x\n", pair[i].of=
fset, pair[i].value);
> > +               drm_printf(&p, "\n");
> > +       }
> > +
> >          /* Add ring buffer information */
> >          drm_printf(&p, "Ring buffer information\n");
> >          for (int i =3D 0; i < coredump->adev->num_rings; i++) { @@
> > -299,6 +311,11 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset,
> > size_t count,
> >
> >   static void amdgpu_devcoredump_free(void *data)
> >   {
> > +       struct amdgpu_coredump_info *temp =3D data;
> > +
> > +       kfree(temp->adev->ip_dump);
> > +       temp->adev->ip_dump =3D NULL;
> > +       temp->adev->num_regs =3D 0;
> >          kfree(data);
> >   }
> >
> > @@ -337,6 +354,11 @@ void amdgpu_coredump(struct amdgpu_device *adev,
> > bool vram_lost,
> >
> >          coredump->adev =3D adev;
> >
> > +       /* Trigger ip dump here to capture the value of registers */
> > +       for (int i =3D 0; i < adev->num_ip_blocks; i++)
> > +               if (adev->ip_blocks[i].version->funcs->dump_ip_state)
> > +
> > + adev->ip_blocks[i].version->funcs->dump_ip_state((void *)adev);
> > +
> >
> > This seems too complicated. I think it would be easier to
> >
> > This is how all other per IP functions are called. What do you suggest =
?
> >
> >          ktime_get_ts64(&coredump->reset_time);
> >
> >          dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > index a0bc4196ff8b..66e2915a8b4d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > @@ -276,6 +276,99 @@ MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec.bin");
> >   MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec2.bin");
> >   MODULE_FIRMWARE("amdgpu/gc_10_3_7_rlc.bin");
> >
> > +static const struct hwip_reg_entry gc_reg_list_10_1[] =3D {
> > +       { SOC15_REG_ENTRY(GC, 0, mmGRBM_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmGRBM_STATUS2) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmGRBM_STATUS3) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_STALLED_STAT1) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_STALLED_STAT2) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CPC_STALLED_STAT1) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CPF_STALLED_STAT1) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_BUSY_STAT) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CPC_BUSY_STAT) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CPF_BUSY_STAT) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CPC_BUSY_STAT2) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CPF_BUSY_STAT2) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CPF_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_GFX_ERROR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_GFX_HPD_STATUS0) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB_BASE) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB_RPTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB_WPTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB0_BASE) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB0_RPTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB0_WPTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB1_BASE) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB1_RPTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB1_WPTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB2_BASE) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB2_WPTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_RB2_WPTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_IB1_CMD_BUFSZ) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_IB2_CMD_BUFSZ) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_IB1_CMD_BUFSZ) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_IB2_CMD_BUFSZ) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_IB1_BASE_LO) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_IB1_BASE_HI) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_IB1_BUFSZ) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_IB2_BASE_LO) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_IB2_BASE_HI) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_IB2_BUFSZ) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_IB1_BASE_LO) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_IB1_BASE_HI) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_IB1_BUFSZ) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_IB2_BASE_LO) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_IB2_BASE_HI) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_IB2_BUFSZ) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCPF_UTCL1_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCPC_UTCL1_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCPG_UTCL1_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmGDS_PROTECTION_FAULT) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmGDS_VM_PROTECTION_FAULT) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmIA_UTCL1_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmIA_UTCL1_STATUS_2) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmPA_CL_CNTL_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_UTCL1_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRMI_UTCL1_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmSQC_DCACHE_UTCL0_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmSQC_ICACHE_UTCL0_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmSQG_UTCL0_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmTCP_UTCL0_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmWD_UTCL1_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmGCVM_L2_PROTECTION_FAULT_CNTL) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmGCVM_L2_PROTECTION_FAULT_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_DEBUG) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_MEC_CNTL) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_MES_CNTL) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CE_INSTR_PNTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_MEC1_INSTR_PNTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_MEC2_INSTR_PNTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_MES_DEBUG_INTERRUPT_INSTR_PNTR) }=
,
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_MES_INSTR_PNTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_ME_INSTR_PNTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_PFP_INSTR_PNTR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmCP_CPC_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_STAT) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SMU_COMMAND) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SMU_MESSAGE) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SMU_ARGUMENT_1) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SMU_ARGUMENT_2) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SMU_ARGUMENT_3) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SMU_ARGUMENT_4) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmSMU_RLC_RESPONSE) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SAFE_MODE) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SMU_SAFE_MODE) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_RLCS_GPM_STAT_2) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_SPP_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_RLCS_BOOTLOAD_STATUS) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_INT_STAT) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_GPM_GENERAL_6) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_GPM_DEBUG_INST_A) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_GPM_DEBUG_INST_B) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_GPM_DEBUG_INST_ADDR) },
> > +       { SOC15_REG_ENTRY(GC, 0, mmRLC_LX6_CORE_PDEBUG_INST) } };

Might also be nice to store a string with the register name so we can
print the names rather than the offsets in the devcoredump.  Would be
easier to read.

Alex

> > +
> >   static const struct soc15_reg_golden golden_settings_gc_10_1[] =3D {
> >          SOC15_REG_GOLDEN_VALUE(GC, 0, mmCB_HW_CONTROL_4, 0xffffffff, 0=
x00400014),
> >          SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_CPF_CLK_CTRL,
> > 0xfcff8fff, 0xf8000100), @@ -9154,6 +9247,38 @@ static void gfx_v10_0_e=
mit_mem_sync(struct amdgpu_ring *ring)
> >          amdgpu_ring_write(ring, gcr_cntl); /* GCR_CNTL */
> >   }
> >
> > +static void gfx_v10_ip_dump(void *handle) {
> > +       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> > +       uint32_t reg_count =3D ARRAY_SIZE(gc_reg_list_10_1);
> > +       struct reg_pair *ptr, *gfx10_pair;
> > +       uint32_t new_count;
> > +
> > +       /*
> > +        * Allocate memory based on the no of registers for each block.
> > +        * Since adev->ip_dump is common pointer and we add more
> > +        * memory to it as we move through different IP's of the ASIC.
> > +        *
> > +        * This memory needs to be freed after gpu reset once the ip
> > +        * dump is done in the devcoredump.
> > +        */
> > +       new_count =3D adev->num_regs + reg_count;
> > +       ptr =3D krealloc_array(adev->ip_dump, new_count, sizeof(struct =
reg_pair), GFP_KERNEL);
> > +       if (ptr) {
> > +               adev->ip_dump =3D ptr;
> > +               gfx10_pair =3D &ptr[adev->num_regs];
> > +               adev->num_regs =3D new_count;
> > +       } else {
> > +               DRM_ERROR("Failed to allocate memory for IP Dump\n");
> > +               return;
> > +       }
> > +
> > +       for (uint32_t i =3D 0; i < reg_count; i++) {
> >
> > Some compilers don't like variables defined within code.
> >
> > Sure
> >
> >
> > +               gfx10_pair[i].offset =3D gc_reg_list_10_1[i].reg_offset=
;
> > +               gfx10_pair[i].value =3D RREG32(SOC15_REG_ENTRY_OFFSET(g=
c_reg_list_10_1[i]));
> > +       }
> > +}
> >
> > This seems too complicated.  Just pass drm_printer to the ip_dump
> > callbacks and let each IP dump their state directly.  E.g.,
> >
> >         for (i =3D 0; i < adev->num_ip_blocks; i++) {
> >                 if (adev->ip_blocks[i].version->funcs->dump_ip_state) {
> >                         drm_printf(&p, "$s IP state\n",
> > adev->ip_blocks[i].version->funcs->name);
> >
> > adev->ip_blocks[i].version->funcs->dump_ip_state((void *)adev, &p);
> >                }
> >         }
> >
> > I did try this but there is a problem in that approach. drm_printer is
> > created on the buffer which is provided by "amdgpu_devcoredump_read"
> > and "amdgpu_devcoredump_read" is only called when the user opens the
> > file
> >
> > cat /sys/class/devcoredump/devcd1/data and by that time gpu is reset
> > and registers dont hold the value of interest. I tried this approach
> > first and got all FFFF or reset values of the registers.
> > We need to capture the values in "amdgpu_coredump" which is
> > immediately called after GPU reset and values are what we need for debu=
gging.
> >
> > Crux is we need to capture data after gpu reset but read depends on
> > when user open the file which is too late and hence we need to capture
> > all the data in advance immediately after reset before recovery.
> >
> > Ah, ok.  I would suggest pre-allocating the memory to store the dump
> > state in each IP block in sw_init().  I guess we'd probably need two
> > IP callbacks, dump_state() and print_state().  Then call the
> > ip->dump_state() in the GPU recovery sequence before we try soft
> > resets, then in devcore dump you can call the ip->print_state()
> > callback to print the state to the devcore dump output.
> >
> > The problem is there is no standard size to proallocate memory statical=
ly. Each IP hold different set of registers and every time i add a new regi=
ster set i have to update the memory size and allocate dynamically but this=
 can be handled. Another problem i see with this approach is where to store=
 the memory ptr of each IP. One way is to Directly have ptrs for each IP in=
 amdgpu_device global struct or other way is to add ptr in IP specific stru=
ct withing amdgpu_device which are to be traversed in a hardcode way as the=
y arent in an array or list.
> >
> > For eg: we have to access each of these in a hardcode way in code as th=
ese structures arent in a list/array form to traverse for each ip.
> >
> > /* nbio */
> >         struct amdgpu_nbio              nbio;
> >         /* hdp */
> >         struct amdgpu_hdp               hdp;
> >         /* smuio */
> >         struct amdgpu_smuio             smuio;
> >         /* mmhub */
> >         struct amdgpu_mmhub             mmhub;
> >         /* gfxhub */
> >         struct amdgpu_gfxhub            gfxhub;
> >         /* gfx */
> >         struct amdgpu_gfx               gfx;
> >         /* sdma */
> >         struct amdgpu_sdma              sdma;
> >         /* lsdma */
> >         struct amdgpu_lsdma             lsdma;
> >         /* uvd */
> >         struct amdgpu_uvd               uvd;
> >         /* vce */
> >         struct amdgpu_vce               vce;
> >
> > In current code the approach is to add memory based on need for each IP=
 in the same ptr and keep adding registers to it and we can search with off=
set value in the devcoredump to debug.
> >
>
> Each IP can store the data however they want.  E.g., in the gfx code, we =
can do:
>
> gfx_v10_0_sw_init()
> {
> ...
> adev->gfx.ip_state =3D kcalloc(2, gc_reg_list_10_1, GFP_KERNEL);
> ...
> }
>
> gfx_v10_0_dump_state()
> {
> for (i =3D 0; i < ARRAY_SIZE(gc_reg_list_10_1); i +=3D 2)
>     adev->gfx.ip_state[i] =3D gc_reg_list_10_1[i];
>     adev->gfx.ip_state[i+1] =3D RREG32(gc_reg_list_10_1[i]); } }
>
> gfx_v10_0_print_state()
> {
> for (i =3D 0; i < ARRAY_SIZE(gc_reg_list_10_1); i +=3D 2)
>           drm_printf(&p, "0x%08x \t 0x%08x\n", adev->gfx.ip_state[i],
> adev->gfx.ip_state[i+1]);
> }
>
> gfx_v10_0_sw_fini()
> {
> ...
> kfree(adev->gfx.ip_state);
> ...
> }
>
> Then call dumps_state() in gpu_recover() before we actually reset the GPU=
.  The driver will then have the state cached and then you call
> print_state() in amdgpu_devcoredump_read() to read out the cached state.
>
> Sure Alex. Will update the patches as per this approach.
>
> Regards
> Sunil Khatri
> Alex
>
> > Regards
> > Sunil
> >
> > Alex
> >
> > Regards
> >
> > Sunil Khatri
> >
> > Alex
> >
> > +
> >   static const struct amd_ip_funcs gfx_v10_0_ip_funcs =3D {
> >          .name =3D "gfx_v10_0",
> >          .early_init =3D gfx_v10_0_early_init, @@ -9170,7 +9295,7 @@
> > static const struct amd_ip_funcs gfx_v10_0_ip_funcs =3D {
> >          .set_clockgating_state =3D gfx_v10_0_set_clockgating_state,
> >          .set_powergating_state =3D gfx_v10_0_set_powergating_state,
> >          .get_clockgating_state =3D gfx_v10_0_get_clockgating_state,
> > -       .dump_ip_state =3D NULL,
> > +       .dump_ip_state =3D gfx_v10_ip_dump,
> >   };
> >
> >   static const struct amdgpu_ring_funcs gfx_v10_0_ring_funcs_gfx =3D {
> > diff --git
> > a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> > b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> > index 4908044f7409..4c8e7fdb6976 100644
> > --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> > +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> > @@ -4830,6 +4830,8 @@
> >   #define mmCP_ECC_FIRSTOCCURRENCE_RING2_BASE_IDX                      =
                                  0
> >   #define mmGB_EDC_MODE                                                =
                                  0x1e1e
> >   #define mmGB_EDC_MODE_BASE_IDX                                       =
                                  0
> > +#define mmCP_DEBUG                                                    =
                                 0x1e1f
> > +#define mmCP_DEBUG_BASE_IDX                                           =
                                 0
> >   #define mmCP_FETCHER_SOURCE                                          =
                                  0x1e22
> >   #define mmCP_FETCHER_SOURCE_BASE_IDX                                 =
                                  0
> >   #define mmCP_PQ_WPTR_POLL_CNTL                                       =
                                  0x1e23
> > @@ -7778,6 +7780,8 @@
> >   #define mmCP_MES_DOORBELL_CONTROL5_BASE_IDX                          =
                                  1
> >   #define mmCP_MES_DOORBELL_CONTROL6                                   =
                                  0x2841
> >   #define mmCP_MES_DOORBELL_CONTROL6_BASE_IDX                          =
                                  1
> > +#define mmCP_MES_DEBUG_INTERRUPT_INSTR_PNTR                           =
                                 0x2842
> > +#define mmCP_MES_DEBUG_INTERRUPT_INSTR_PNTR_BASE_IDX                  =
                                 1
> >   #define mmCP_MES_GP0_LO                                              =
                                  0x2843
> >   #define mmCP_MES_GP0_LO_BASE_IDX                                     =
                                  1
> >   #define mmCP_MES_GP0_HI                                              =
                                  0x2844
> > @@ -9332,10 +9336,16 @@
> >   #define mmRLC_LB_CNTR_INIT_1_BASE_IDX                                =
                                  1
> >   #define mmRLC_LB_CNTR_1                                              =
                                  0x4c1c
> >   #define mmRLC_LB_CNTR_1_BASE_IDX                                     =
                                  1
> > +#define mmRLC_GPM_DEBUG_INST_ADDR                                     =
                                 0x4c1d
> > +#define mmRLC_GPM_DEBUG_INST_ADDR_BASE_IDX                            =
                                 1
> >   #define mmRLC_JUMP_TABLE_RESTORE                                     =
                                  0x4c1e
> >   #define mmRLC_JUMP_TABLE_RESTORE_BASE_IDX                            =
                                  1
> >   #define mmRLC_PG_DELAY_2                                             =
                                  0x4c1f
> >   #define mmRLC_PG_DELAY_2_BASE_IDX                                    =
                                  1
> > +#define mmRLC_GPM_DEBUG_INST_A                                        =
                                 0x4c22
> > +#define mmRLC_GPM_DEBUG_INST_A_BASE_IDX                               =
                                 1
> > +#define mmRLC_GPM_DEBUG_INST_B                                        =
                                 0x4c23
> > +#define mmRLC_GPM_DEBUG_INST_B_BASE_IDX                               =
                                 1
> >   #define mmRLC_GPU_CLOCK_COUNT_LSB                                    =
                                  0x4c24
> >   #define mmRLC_GPU_CLOCK_COUNT_LSB_BASE_IDX                           =
                                  1
> >   #define mmRLC_GPU_CLOCK_COUNT_MSB                                    =
                                  0x4c25
> > @@ -9720,6 +9730,8 @@
> >   #define mmRLC_SPM_THREAD_TRACE_CTRL_BASE_IDX                         =
                                  1
> >   #define mmRLC_LB_CNTR_2                                              =
                                  0x4de7
> >   #define mmRLC_LB_CNTR_2_BASE_IDX                                     =
                                  1
> > +#define mmRLC_LX6_CORE_PDEBUG_INST                                    =
                                 0x4deb
> > +#define mmRLC_LX6_CORE_PDEBUG_INST_BASE_IDX                           =
                                 1
> >   #define mmRLC_CPAXI_DOORBELL_MON_CTRL                                =
                                  0x4df1
> >   #define mmRLC_CPAXI_DOORBELL_MON_CTRL_BASE_IDX                       =
                                  1
> >   #define mmRLC_CPAXI_DOORBELL_MON_STAT                                =
                                  0x4df2
> > --
> > 2.34.1
> >

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E749D8A8821
	for <lists+amd-gfx@lfdr.de>; Wed, 17 Apr 2024 17:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D59113656;
	Wed, 17 Apr 2024 15:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SJHNz0HO";
	dkim-atps=neutral
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD307113656
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Apr 2024 15:51:49 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2a5215314a4so3575939a91.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 17 Apr 2024 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713369109; x=1713973909; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vv9k3VjzmVKZeNfJwtlbZLVZqyxxbNOYbk0zFKG0aeY=;
 b=SJHNz0HOcep+AO1yZOO9DL8cUv2bZMzLP27QYpA9lgFz2LzoHGh2HI8cbxN1c17Tl8
 DadkjV1qU8vX7eVqtNDYhswE1Uj/7VBDeS6FY7MigJnN7YGNz1MXDbt+Yf2qnFjlb3XI
 NZOYdbHpM7oFz+1rRguG+k4YNpWjUY2hoghSqCPHqwI7HTHOtz4jrVBdOqQKt21wR1Nh
 tk/l5w7+arMNSLOTEuVdAVBhZjU+1E5NjTOv3dTbS8dmmSfalJAsHT9/dluiOJ2cwY2V
 +qTnCL/ZUqsk2fh+vFZhBJIgxkyc5qsRKLYPAua/vdwmtjWyAiW5Fe4rM5qeOlAE3bFr
 Lebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713369109; x=1713973909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vv9k3VjzmVKZeNfJwtlbZLVZqyxxbNOYbk0zFKG0aeY=;
 b=OUBtAJgHlC2Ym42Z4bh6xJ6cEHhJ9w0txzIBEEK0PQNK8WmG5573qppofEVHLX4Ag5
 VX/6v+67Yg2JC3lPbsJP8+khnRP1AMl2SpUqMXJzhRJa6XtexQahB/2OVkiL77osgPyz
 1nSaAfR9vAGNlKDEFmPml6+EPo+VMN+E75ROodcFmkpr1Z1EKNuyw4yZ/KqSEso83BYN
 T0Hw7ODtjffSm9czX/Y4FiPOQtlopwWdtqAN5Uq3qbEXpZjSE4s/sUNBlNB7rl8klkKQ
 sppLaJquLzgXt7/7ct5UmvInhCs4WMCtoZFjNciSomt+NLlO0sbAoqeUypW+oth5HpIY
 y2gQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVoqAULOW6s4Th71nQGtmTzpOAV5pyJjWnnJj52pvcFSyjgZY+Ai3fHYsdPzAUjWeRGHCIrQZVu/hUQxK1udqKw56bYhWeqcGQRExDKQ==
X-Gm-Message-State: AOJu0Yw974cABsqCeYmKIQ0aK7hnXGVZqAbuTtlJMNy4xLZAY0WsRzaB
 ttHUAPLUFM9l+NFXb5MyF7bgVMwRiZRqqsKDKO1r/VICNC3BjyR2pw2Bb3JQq7S3RV2wrbjwmsh
 bx1JsJajrHjLujljA/+p/h6wYNmo=
X-Google-Smtp-Source: AGHT+IHiGH9u81mggHtXg1gIGg9jHEOdZbn5MQaCVG1P8AjLHAbrlyJS2xdetjgVwUbtr1xK40v8DvbpqXT5WQNL6uE=
X-Received: by 2002:a17:90a:e57:b0:2a5:badb:2f6b with SMTP id
 p23-20020a17090a0e5700b002a5badb2f6bmr17016780pja.26.1713369108702; Wed, 17
 Apr 2024 08:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240417093809.168002-1-sunil.khatri@amd.com>
 <20240417093809.168002-2-sunil.khatri@amd.com>
In-Reply-To: <20240417093809.168002-2-sunil.khatri@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 Apr 2024 11:51:37 -0400
Message-ID: <CADnq5_MkYKO5Z3LBRdJsTO0+Wf+YWVgUONTt5Y1Lrm+6SXJfTQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] drm/amdgpu: add support of gfx10 register dump
To: Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 amd-gfx@lists.freedesktop.org
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

On Wed, Apr 17, 2024 at 5:38=E2=80=AFAM Sunil Khatri <sunil.khatri@amd.com>=
 wrote:
>
> Adding gfx10 gc registers to be used for register
> dump via devcoredump during a gpu reset.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   8 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h       |   4 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c        | 130 +++++++++++++++++-
>  drivers/gpu/drm/amd/amdgpu/soc15.h            |   2 +
>  .../include/asic_reg/gc/gc_10_1_0_offset.h    |  12 ++
>  5 files changed, 155 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index e0d7f4ee7e16..cac0ca64367b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -139,6 +139,14 @@ enum amdgpu_ss {
>         AMDGPU_SS_DRV_UNLOAD
>  };
>
> +struct amdgpu_hwip_reg_entry {
> +       u32             hwip;
> +       u32             inst;
> +       u32             seg;
> +       u32             reg_offset;
> +       const char      *reg_name;
> +};
> +
>  struct amdgpu_watchdog_timer {
>         bool timeout_fatal_disable;
>         uint32_t period; /* maxCycles =3D (1 << period), the number of cy=
cles before a timeout */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gfx.h
> index 04a86dff71e6..64f197bbc866 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
> @@ -433,6 +433,10 @@ struct amdgpu_gfx {
>         uint32_t                        num_xcc_per_xcp;
>         struct mutex                    partition_mutex;
>         bool                            mcbp; /* mid command buffer preem=
ption */
> +
> +       /* IP reg dump */
> +       uint32_t                        *ip_dump;
> +       uint32_t                        reg_count;
>  };
>
>  struct amdgpu_gfx_ras_reg_entry {
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd=
/amdgpu/gfx_v10_0.c
> index a0bc4196ff8b..4a54161f4837 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -276,6 +276,99 @@ MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec.bin");
>  MODULE_FIRMWARE("amdgpu/gc_10_3_7_mec2.bin");
>  MODULE_FIRMWARE("amdgpu/gc_10_3_7_rlc.bin");
>
> +static const struct amdgpu_hwip_reg_entry gc_reg_list_10_1[] =3D {
> +       SOC15_REG_ENTRY_STR(GC, 0, mmGRBM_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmGRBM_STATUS2),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmGRBM_STATUS3),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_STALLED_STAT1),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_STALLED_STAT2),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CPC_STALLED_STAT1),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CPF_STALLED_STAT1),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_BUSY_STAT),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CPC_BUSY_STAT),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CPF_BUSY_STAT),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CPC_BUSY_STAT2),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CPF_BUSY_STAT2),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CPF_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_ERROR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_GFX_HPD_STATUS0),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB_BASE),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB_RPTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB_WPTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB0_BASE),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB0_RPTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB0_WPTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB1_BASE),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB1_RPTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB1_WPTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB2_BASE),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB2_WPTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_RB2_WPTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_IB1_CMD_BUFSZ),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_IB2_CMD_BUFSZ),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_IB1_CMD_BUFSZ),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_IB2_CMD_BUFSZ),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_IB1_BASE_LO),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_IB1_BASE_HI),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_IB1_BUFSZ),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_IB2_BASE_LO),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_IB2_BASE_HI),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_IB2_BUFSZ),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_IB1_BASE_LO),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_IB1_BASE_HI),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_IB1_BUFSZ),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_IB2_BASE_LO),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_IB2_BASE_HI),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_IB2_BUFSZ),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCPF_UTCL1_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCPC_UTCL1_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCPG_UTCL1_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmGDS_PROTECTION_FAULT),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmGDS_VM_PROTECTION_FAULT),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmIA_UTCL1_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmIA_UTCL1_STATUS_2),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmPA_CL_CNTL_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_UTCL1_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRMI_UTCL1_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmSQC_DCACHE_UTCL0_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmSQC_ICACHE_UTCL0_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmSQG_UTCL0_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmTCP_UTCL0_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmWD_UTCL1_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmGCVM_L2_PROTECTION_FAULT_CNTL),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmGCVM_L2_PROTECTION_FAULT_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_DEBUG),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_MEC_CNTL),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_MES_CNTL),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CE_INSTR_PNTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_MEC1_INSTR_PNTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_MEC2_INSTR_PNTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_MES_DEBUG_INTERRUPT_INSTR_PNTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_MES_INSTR_PNTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_ME_INSTR_PNTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_PFP_INSTR_PNTR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmCP_CPC_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_STAT),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SMU_COMMAND),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SMU_MESSAGE),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SMU_ARGUMENT_1),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SMU_ARGUMENT_2),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SMU_ARGUMENT_3),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SMU_ARGUMENT_4),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmSMU_RLC_RESPONSE),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SAFE_MODE),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SMU_SAFE_MODE),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_RLCS_GPM_STAT_2),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_SPP_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_RLCS_BOOTLOAD_STATUS),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_INT_STAT),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_GPM_GENERAL_6),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_GPM_DEBUG_INST_A),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_GPM_DEBUG_INST_B),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_GPM_DEBUG_INST_ADDR),
> +       SOC15_REG_ENTRY_STR(GC, 0, mmRLC_LX6_CORE_PDEBUG_INST)
> +};
> +
>  static const struct soc15_reg_golden golden_settings_gc_10_1[] =3D {
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmCB_HW_CONTROL_4, 0xffffffff, 0x00=
400014),
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmCGTT_CPF_CLK_CTRL, 0xfcff8fff, 0x=
f8000100),
> @@ -4490,6 +4583,22 @@ static int gfx_v10_0_compute_ring_init(struct amdg=
pu_device *adev, int ring_id,
>                              hw_prio, NULL);
>  }
>
> +static void gfx_v10_0_alloc_dump_mem(struct amdgpu_device *adev)
> +{
> +       uint32_t reg_count =3D ARRAY_SIZE(gc_reg_list_10_1);
> +       uint32_t *ptr;
> +
> +       ptr =3D kcalloc(reg_count, sizeof(uint32_t), GFP_KERNEL);
> +       if (ptr =3D=3D NULL) {
> +               DRM_ERROR("Failed to allocate memory for IP Dump\n");
> +               adev->gfx.ip_dump =3D NULL;
> +               adev->gfx.reg_count =3D 0;
> +       } else {
> +               adev->gfx.ip_dump =3D ptr;
> +               adev->gfx.reg_count =3D reg_count;
> +       }
> +}
> +
>  static int gfx_v10_0_sw_init(void *handle)
>  {
>         int i, j, k, r, ring_id =3D 0;
> @@ -4642,6 +4751,8 @@ static int gfx_v10_0_sw_init(void *handle)
>
>         gfx_v10_0_gpu_early_init(adev);
>
> +       gfx_v10_0_alloc_dump_mem(adev);
> +
>         return 0;
>  }
>
> @@ -4694,6 +4805,8 @@ static int gfx_v10_0_sw_fini(void *handle)
>
>         gfx_v10_0_free_microcode(adev);
>
> +       kfree(adev->gfx.ip_dump);
> +
>         return 0;
>  }
>
> @@ -9154,6 +9267,21 @@ static void gfx_v10_0_emit_mem_sync(struct amdgpu_=
ring *ring)
>         amdgpu_ring_write(ring, gcr_cntl); /* GCR_CNTL */
>  }
>
> +static void gfx_v10_ip_dump(void *handle)
> +{
> +       struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +       uint32_t i;
> +       uint32_t reg_count =3D ARRAY_SIZE(gc_reg_list_10_1);
> +
> +       if (!adev->gfx.ip_dump)
> +               return;
> +
> +       amdgpu_gfx_off_ctrl(adev, false);
> +       for (i =3D 0; i < reg_count; i++)
> +               adev->gfx.ip_dump[i] =3D RREG32(SOC15_REG_ENTRY_OFFSET(gc=
_reg_list_10_1[i]));
> +       amdgpu_gfx_off_ctrl(adev, true);
> +}
> +
>  static const struct amd_ip_funcs gfx_v10_0_ip_funcs =3D {
>         .name =3D "gfx_v10_0",
>         .early_init =3D gfx_v10_0_early_init,
> @@ -9170,7 +9298,7 @@ static const struct amd_ip_funcs gfx_v10_0_ip_funcs=
 =3D {
>         .set_clockgating_state =3D gfx_v10_0_set_clockgating_state,
>         .set_powergating_state =3D gfx_v10_0_set_powergating_state,
>         .get_clockgating_state =3D gfx_v10_0_get_clockgating_state,
> -       .dump_ip_state =3D NULL,
> +       .dump_ip_state =3D gfx_v10_ip_dump,
>  };
>
>  static const struct amdgpu_ring_funcs gfx_v10_0_ring_funcs_gfx =3D {
> diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.h b/drivers/gpu/drm/amd/amd=
gpu/soc15.h
> index 1444b7765e4b..282584a48be0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/soc15.h
> +++ b/drivers/gpu/drm/amd/amdgpu/soc15.h
> @@ -88,6 +88,8 @@ struct soc15_ras_field_entry {
>  };
>
>  #define SOC15_REG_ENTRY(ip, inst, reg) ip##_HWIP, inst, reg##_BASE_IDX, =
reg
> +#define SOC15_REG_ENTRY_STR(ip, inst, reg) \
> +       { ip##_HWIP, inst, reg##_BASE_IDX, reg, #reg }
>
>  #define SOC15_REG_ENTRY_OFFSET(entry)  (adev->reg_offset[entry.hwip][ent=
ry.inst][entry.seg] + entry.reg_offset)
>
> diff --git a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h b=
/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> index 4908044f7409..4c8e7fdb6976 100644
> --- a/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> +++ b/drivers/gpu/drm/amd/include/asic_reg/gc/gc_10_1_0_offset.h
> @@ -4830,6 +4830,8 @@
>  #define mmCP_ECC_FIRSTOCCURRENCE_RING2_BASE_IDX                         =
                               0
>  #define mmGB_EDC_MODE                                                   =
                               0x1e1e
>  #define mmGB_EDC_MODE_BASE_IDX                                          =
                               0
> +#define mmCP_DEBUG                                                      =
                               0x1e1f
> +#define mmCP_DEBUG_BASE_IDX                                             =
                               0
>  #define mmCP_FETCHER_SOURCE                                             =
                               0x1e22
>  #define mmCP_FETCHER_SOURCE_BASE_IDX                                    =
                               0
>  #define mmCP_PQ_WPTR_POLL_CNTL                                          =
                               0x1e23
> @@ -7778,6 +7780,8 @@
>  #define mmCP_MES_DOORBELL_CONTROL5_BASE_IDX                             =
                               1
>  #define mmCP_MES_DOORBELL_CONTROL6                                      =
                               0x2841
>  #define mmCP_MES_DOORBELL_CONTROL6_BASE_IDX                             =
                               1
> +#define mmCP_MES_DEBUG_INTERRUPT_INSTR_PNTR                             =
                               0x2842
> +#define mmCP_MES_DEBUG_INTERRUPT_INSTR_PNTR_BASE_IDX                    =
                               1
>  #define mmCP_MES_GP0_LO                                                 =
                               0x2843
>  #define mmCP_MES_GP0_LO_BASE_IDX                                        =
                               1
>  #define mmCP_MES_GP0_HI                                                 =
                               0x2844
> @@ -9332,10 +9336,16 @@
>  #define mmRLC_LB_CNTR_INIT_1_BASE_IDX                                   =
                               1
>  #define mmRLC_LB_CNTR_1                                                 =
                               0x4c1c
>  #define mmRLC_LB_CNTR_1_BASE_IDX                                        =
                               1
> +#define mmRLC_GPM_DEBUG_INST_ADDR                                       =
                               0x4c1d
> +#define mmRLC_GPM_DEBUG_INST_ADDR_BASE_IDX                              =
                               1
>  #define mmRLC_JUMP_TABLE_RESTORE                                        =
                               0x4c1e
>  #define mmRLC_JUMP_TABLE_RESTORE_BASE_IDX                               =
                               1
>  #define mmRLC_PG_DELAY_2                                                =
                               0x4c1f
>  #define mmRLC_PG_DELAY_2_BASE_IDX                                       =
                               1
> +#define mmRLC_GPM_DEBUG_INST_A                                          =
                               0x4c22
> +#define mmRLC_GPM_DEBUG_INST_A_BASE_IDX                                 =
                               1
> +#define mmRLC_GPM_DEBUG_INST_B                                          =
                               0x4c23
> +#define mmRLC_GPM_DEBUG_INST_B_BASE_IDX                                 =
                               1
>  #define mmRLC_GPU_CLOCK_COUNT_LSB                                       =
                               0x4c24
>  #define mmRLC_GPU_CLOCK_COUNT_LSB_BASE_IDX                              =
                               1
>  #define mmRLC_GPU_CLOCK_COUNT_MSB                                       =
                               0x4c25
> @@ -9720,6 +9730,8 @@
>  #define mmRLC_SPM_THREAD_TRACE_CTRL_BASE_IDX                            =
                               1
>  #define mmRLC_LB_CNTR_2                                                 =
                               0x4de7
>  #define mmRLC_LB_CNTR_2_BASE_IDX                                        =
                               1
> +#define mmRLC_LX6_CORE_PDEBUG_INST                                      =
                               0x4deb
> +#define mmRLC_LX6_CORE_PDEBUG_INST_BASE_IDX                             =
                               1
>  #define mmRLC_CPAXI_DOORBELL_MON_CTRL                                   =
                               0x4df1
>  #define mmRLC_CPAXI_DOORBELL_MON_CTRL_BASE_IDX                          =
                               1
>  #define mmRLC_CPAXI_DOORBELL_MON_STAT                                   =
                               0x4df2
> --
> 2.34.1
>

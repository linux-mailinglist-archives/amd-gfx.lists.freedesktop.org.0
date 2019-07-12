Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A06674D4
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 20:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0848C6E30C;
	Fri, 12 Jul 2019 18:00:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AEB6E30C
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 18:00:14 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id o9so22270104iom.3
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 11:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OaBoC1ASkuYHQC7Tg9Bi2DIM91jDnrPG1FFSq0zvflE=;
 b=B4x58leKB8X4OjS2qk7XN0e9TNYM01cw2XC1OjOnJwA5h/WJK3ucKXWGrntpiyU52F
 BD/nJASRVr019ZxQV9dd2ELFvFYBD/2/AYHLDGxBCbBpJ4p8eO9IiZi33TzV1YSycozc
 P+BBGYabm6rtmmpmdMFBR4r4vbwvz+FIFyRloBOj7F4xmRbRrLKBvwHzt2ExQ8bnovr5
 0AmGAn54x0LMgw2y6ieNbRJc72mVOUteNQxvh9t1HjHuJE4ZnFJJeBN4G7l125YIJ0xI
 xruIgd2LXT9Q+OU/Wn+aRrJY2uZlEUXE9D5P0S9NTlv/NeXWjE3hfuwSbj1GTsRFi6GH
 0YiQ==
X-Gm-Message-State: APjAAAW+N94ITeq5lyvcyC2lyjFW7o67E5K/UBzp1S0lkA30V9UG8M2h
 th/r50722l5HTynrLPtG/jBLY0lQv5gYBfDC5cU=
X-Google-Smtp-Source: APXvYqwcunY+WfV5QTd558l6g4nt5JSWaW6yBijmli9taVs7flE3pBe0J9ro9onuqv+1rRCSKAA6JPyNjff2DWKo0jk=
X-Received: by 2002:a6b:ed01:: with SMTP id n1mr8883269iog.255.1562954414084; 
 Fri, 12 Jul 2019 11:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190712134642.68650-1-nicolai.haehnle@amd.com>
In-Reply-To: <20190712134642.68650-1-nicolai.haehnle@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 12 Jul 2019 13:59:36 -0400
Message-ID: <CAAxE2A4eTWQgVkm0=xsqowgta3oEP8ptnCGSuRdPFC0vhGf2LQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx10: set SH_MEM_CONFIG.INITIAL_INST_PREFETCH
To: "Haehnle, Nicolai" <Nicolai.Haehnle@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=OaBoC1ASkuYHQC7Tg9Bi2DIM91jDnrPG1FFSq0zvflE=;
 b=MQHG+yl4BhAHhbQWMyGOaeR6FEVDPLUGOsaQLMhDPZCVMdkdn6xacADWMVWrprGanz
 ggchXB70qTkx5NAiEkyN2adR6dXDd7Cl16nAe+pxjoGxrriXuJbekB2u0bWQK8AvwwkW
 pcT0OfYJ+SU6/2zH+S9G78GailooPhR01K6lrkrZzweoqjb+XpeH2ZPDv2YPIhaPYEQi
 Apc/wTRVAgy+YF+G8hyLT5Kj9SkO0gF6NUuw4DFU+Fa7BiaeKUhteKmZOv6UFvEsO0lz
 3Y6h6dQFTzh44t78xUUEV5hAr7NPnvBRIqATP5a5xmSPCuJOmxYpaOvSnCG84JsDKcfz
 Skpw==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0225936218=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0225936218==
Content-Type: multipart/alternative; boundary="000000000000a6d786058d7faed7"

--000000000000a6d786058d7faed7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>

Marek

On Fri, Jul 12, 2019 at 9:47 AM Haehnle, Nicolai <Nicolai.Haehnle@amd.com>
wrote:

> Prefetch mode 0 is not supported and can lead to hangs with certain very
> specific code patterns. Set a sound prefetch mode for all VMIDs rather
> than forcing all shaders to set the prefetch mode at the beginning.
>
> Reduce code duplication a bit while we're at it. Note that the 64-bit
> address mode enum and the retry all enum are both 0, so the only
> functional change is in the INITIAL_INST_PREFETCH field.
>
> Signed-off-by: Nicolai H=C3=A4hnle <nicolai.haehnle@amd.com>
> --
> I haven't been able to properly test this yet, but it is the right thing
> to be doing in principle.
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 27 ++++++++++----------------
>  1 file changed, 10 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 0d94c812df1b..b8498c359191 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -157,20 +157,27 @@ static const struct soc15_reg_golden
> golden_settings_gc_10_1_1[] =3D
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmTA_CNTL_AUX, 0xfff7ffff,
> 0x01030000),
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmTCP_CNTL, 0x60000010, 0x479c0010)=
,
>         SOC15_REG_GOLDEN_VALUE(GC, 0, mmUTCL1_CTRL, 0x00800000,
> 0x00800000),
>  };
>
>  static const struct soc15_reg_golden golden_settings_gc_10_1_nv14[] =3D
>  {
>         /* Pending on emulation bring up */
>  };
>
> +#define DEFAULT_SH_MEM_CONFIG \
> +       ((SH_MEM_ADDRESS_MODE_64 << SH_MEM_CONFIG__ADDRESS_MODE__SHIFT) |=
 \
> +        (SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
> SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT) | \
> +        (SH_MEM_RETRY_MODE_ALL << SH_MEM_CONFIG__RETRY_MODE__SHIFT) | \
> +        (3 << SH_MEM_CONFIG__INITIAL_INST_PREFETCH__SHIFT))
> +
> +
>  static void gfx_v10_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void gfx_v10_0_set_irq_funcs(struct amdgpu_device *adev);
>  static void gfx_v10_0_set_gds_init(struct amdgpu_device *adev);
>  static void gfx_v10_0_set_rlc_funcs(struct amdgpu_device *adev);
>  static int gfx_v10_0_get_cu_info(struct amdgpu_device *adev,
>                                   struct amdgpu_cu_info *cu_info);
>  static uint64_t gfx_v10_0_get_gpu_clock_counter(struct amdgpu_device
> *adev);
>  static void gfx_v10_0_select_se_sh(struct amdgpu_device *adev, u32 se_nu=
m,
>                                    u32 sh_num, u32 instance);
>  static u32 gfx_v10_0_get_wgp_active_bitmap_per_sh(struct amdgpu_device
> *adev);
> @@ -1476,40 +1483,35 @@ static u32
> gfx_v10_0_init_pa_sc_tile_steering_override(struct amdgpu_device *ade
>         return pa_sc_tile_steering_override;
>  }
>
>  #define DEFAULT_SH_MEM_BASES   (0x6000)
>  #define FIRST_COMPUTE_VMID     (8)
>  #define LAST_COMPUTE_VMID      (16)
>
>  static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)
>  {
>         int i;
> -       uint32_t sh_mem_config;
>         uint32_t sh_mem_bases;
>
>         /*
>          * Configure apertures:
>          * LDS:         0x60000000'00000000 - 0x60000001'00000000 (4GB)
>          * Scratch:     0x60000001'00000000 - 0x60000002'00000000 (4GB)
>          * GPUVM:       0x60010000'00000000 - 0x60020000'00000000 (1TB)
>          */
>         sh_mem_bases =3D DEFAULT_SH_MEM_BASES | (DEFAULT_SH_MEM_BASES << =
16);
>
> -       sh_mem_config =3D SH_MEM_ADDRESS_MODE_64 |
> -                       SH_MEM_ALIGNMENT_MODE_UNALIGNED <<
> -                       SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT;
> -
>         mutex_lock(&adev->srbm_mutex);
>         for (i =3D FIRST_COMPUTE_VMID; i < LAST_COMPUTE_VMID; i++) {
>                 nv_grbm_select(adev, 0, 0, 0, i);
>                 /* CP and shaders */
> -               WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG, sh_mem_config);
> +               WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG,
> DEFAULT_SH_MEM_CONFIG);
>                 WREG32_SOC15(GC, 0, mmSH_MEM_BASES, sh_mem_bases);
>         }
>         nv_grbm_select(adev, 0, 0, 0, 0);
>         mutex_unlock(&adev->srbm_mutex);
>  }
>
>  static void gfx_v10_0_tcp_harvest(struct amdgpu_device *adev)
>  {
>         int i, j, k;
>         int max_wgp_per_sh =3D adev->gfx.config.max_cu_per_sh >> 1;
> @@ -1590,31 +1592,22 @@ static void gfx_v10_0_constants_init(struct
> amdgpu_device *adev)
>         gfx_v10_0_get_cu_info(adev, &adev->gfx.cu_info);
>         adev->gfx.config.pa_sc_tile_steering_override =3D
>                 gfx_v10_0_init_pa_sc_tile_steering_override(adev);
>
>         /* XXX SH_MEM regs */
>         /* where to put LDS, scratch, GPUVM in FSA64 space */
>         mutex_lock(&adev->srbm_mutex);
>         for (i =3D 0; i < adev->vm_manager.id_mgr[AMDGPU_GFXHUB].num_ids;
> i++) {
>                 nv_grbm_select(adev, 0, 0, 0, i);
>                 /* CP and shaders */
> -               if (i =3D=3D 0) {
> -                       tmp =3D REG_SET_FIELD(0, SH_MEM_CONFIG,
> ALIGNMENT_MODE,
> -
>  SH_MEM_ALIGNMENT_MODE_UNALIGNED);
> -                       tmp =3D REG_SET_FIELD(tmp, SH_MEM_CONFIG,
> RETRY_MODE, 0);
> -                       WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG, tmp);
> -                       WREG32_SOC15(GC, 0, mmSH_MEM_BASES, 0);
> -               } else {
> -                       tmp =3D REG_SET_FIELD(0, SH_MEM_CONFIG,
> ALIGNMENT_MODE,
> -
>  SH_MEM_ALIGNMENT_MODE_UNALIGNED);
> -                       tmp =3D REG_SET_FIELD(tmp, SH_MEM_CONFIG,
> RETRY_MODE, 0);
> -                       WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG, tmp);
> +               WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG,
> DEFAULT_SH_MEM_CONFIG);
> +               if (i !=3D 0) {
>                         tmp =3D REG_SET_FIELD(0, SH_MEM_BASES, PRIVATE_BA=
SE,
>                                 (adev->gmc.private_aperture_start >> 48))=
;
>                         tmp =3D REG_SET_FIELD(tmp, SH_MEM_BASES, SHARED_B=
ASE,
>                                 (adev->gmc.shared_aperture_start >> 48));
>                         WREG32_SOC15(GC, 0, mmSH_MEM_BASES, tmp);
>                 }
>         }
>         nv_grbm_select(adev, 0, 0, 0, 0);
>
>         mutex_unlock(&adev->srbm_mutex);
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--000000000000a6d786058d7faed7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mai=
lto:marek.olsak@amd.com">marek.olsak@amd.com</a>&gt;</div><div><br></div><d=
iv>Marek<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Jul 12, 2019 at 9:47 AM Haehnle, Nicolai &lt;<a h=
ref=3D"mailto:Nicolai.Haehnle@amd.com">Nicolai.Haehnle@amd.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Prefetch mode=
 0 is not supported and can lead to hangs with certain very<br>
specific code patterns. Set a sound prefetch mode for all VMIDs rather<br>
than forcing all shaders to set the prefetch mode at the beginning.<br>
<br>
Reduce code duplication a bit while we&#39;re at it. Note that the 64-bit<b=
r>
address mode enum and the retry all enum are both 0, so the only<br>
functional change is in the INITIAL_INST_PREFETCH field.<br>
<br>
Signed-off-by: Nicolai H=C3=A4hnle &lt;<a href=3D"mailto:nicolai.haehnle@am=
d.com" target=3D"_blank">nicolai.haehnle@amd.com</a>&gt;<br>
--<br>
I haven&#39;t been able to properly test this yet, but it is the right thin=
g<br>
to be doing in principle.<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 27 ++++++++++---------------=
-<br>
=C2=A01 file changed, 10 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c<br>
index 0d94c812df1b..b8498c359191 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
@@ -157,20 +157,27 @@ static const struct soc15_reg_golden golden_settings_=
gc_10_1_1[] =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC15_REG_GOLDEN_VALUE(GC, 0, mmTA_CNTL_AUX, 0x=
fff7ffff, 0x01030000),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC15_REG_GOLDEN_VALUE(GC, 0, mmTCP_CNTL, 0x600=
00010, 0x479c0010),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 SOC15_REG_GOLDEN_VALUE(GC, 0, mmUTCL1_CTRL, 0x0=
0800000, 0x00800000),<br>
=C2=A0};<br>
<br>
=C2=A0static const struct soc15_reg_golden golden_settings_gc_10_1_nv14[] =
=3D<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Pending on emulation bring up */<br>
=C2=A0};<br>
<br>
+#define DEFAULT_SH_MEM_CONFIG \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0((SH_MEM_ADDRESS_MODE_64 &lt;&lt; SH_MEM_CONFIG=
__ADDRESS_MODE__SHIFT) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (SH_MEM_ALIGNMENT_MODE_UNALIGNED &lt;&lt; SH_M=
EM_CONFIG__ALIGNMENT_MODE__SHIFT) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (SH_MEM_RETRY_MODE_ALL &lt;&lt; SH_MEM_CONFIG_=
_RETRY_MODE__SHIFT) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (3 &lt;&lt; SH_MEM_CONFIG__INITIAL_INST_PREFET=
CH__SHIFT))<br>
+<br>
+<br>
=C2=A0static void gfx_v10_0_set_ring_funcs(struct amdgpu_device *adev);<br>
=C2=A0static void gfx_v10_0_set_irq_funcs(struct amdgpu_device *adev);<br>
=C2=A0static void gfx_v10_0_set_gds_init(struct amdgpu_device *adev);<br>
=C2=A0static void gfx_v10_0_set_rlc_funcs(struct amdgpu_device *adev);<br>
=C2=A0static int gfx_v10_0_get_cu_info(struct amdgpu_device *adev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct amdgpu_cu_info *cu_inf=
o);<br>
=C2=A0static uint64_t gfx_v10_0_get_gpu_clock_counter(struct amdgpu_device =
*adev);<br>
=C2=A0static void gfx_v10_0_select_se_sh(struct amdgpu_device *adev, u32 se=
_num,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 sh_num, u32 instanc=
e);<br>
=C2=A0static u32 gfx_v10_0_get_wgp_active_bitmap_per_sh(struct amdgpu_devic=
e *adev);<br>
@@ -1476,40 +1483,35 @@ static u32 gfx_v10_0_init_pa_sc_tile_steering_overr=
ide(struct amdgpu_device *ade<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return pa_sc_tile_steering_override;<br>
=C2=A0}<br>
<br>
=C2=A0#define DEFAULT_SH_MEM_BASES=C2=A0 =C2=A0(0x6000)<br>
=C2=A0#define FIRST_COMPUTE_VMID=C2=A0 =C2=A0 =C2=A0(8)<br>
=C2=A0#define LAST_COMPUTE_VMID=C2=A0 =C2=A0 =C2=A0 (16)<br>
<br>
=C2=A0static void gfx_v10_0_init_compute_vmid(struct amdgpu_device *adev)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t sh_mem_config;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t sh_mem_bases;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Configure apertures:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* LDS:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=
x60000000&#39;00000000 - 0x60000001&#39;00000000 (4GB)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Scratch:=C2=A0 =C2=A0 =C2=A00x60000001&=
#39;00000000 - 0x60000002&#39;00000000 (4GB)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* GPUVM:=C2=A0 =C2=A0 =C2=A0 =C2=A00x6001=
0000&#39;00000000 - 0x60020000&#39;00000000 (1TB)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sh_mem_bases =3D DEFAULT_SH_MEM_BASES | (DEFAUL=
T_SH_MEM_BASES &lt;&lt; 16);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sh_mem_config =3D SH_MEM_ADDRESS_MODE_64 |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SH_MEM_ALIGNMENT_MODE_UNALIGNED &lt;&lt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0SH_MEM_CONFIG__ALIGNMENT_MODE__SHIFT;<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&amp;adev-&gt;srbm_mutex);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D FIRST_COMPUTE_VMID; i &lt; LAST_COMP=
UTE_VMID; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nv_grbm_select(adev=
, 0, 0, 0, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CP and shaders *=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WREG32_SOC15(GC, 0,=
 mmSH_MEM_CONFIG, sh_mem_config);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WREG32_SOC15(GC, 0,=
 mmSH_MEM_CONFIG, DEFAULT_SH_MEM_CONFIG);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WREG32_SOC15(GC, 0,=
 mmSH_MEM_BASES, sh_mem_bases);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nv_grbm_select(adev, 0, 0, 0, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
=C2=A0}<br>
<br>
=C2=A0static void gfx_v10_0_tcp_harvest(struct amdgpu_device *adev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i, j, k;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int max_wgp_per_sh =3D adev-&gt;gfx.config.max_=
cu_per_sh &gt;&gt; 1;<br>
@@ -1590,31 +1592,22 @@ static void gfx_v10_0_constants_init(struct amdgpu_=
device *adev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gfx_v10_0_get_cu_info(adev, &amp;adev-&gt;gfx.c=
u_info);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;gfx.config.pa_sc_tile_steering_overrid=
e =3D<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gfx_v10_0_init_pa_s=
c_tile_steering_override(adev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* XXX SH_MEM regs */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* where to put LDS, scratch, GPUVM in FSA64 sp=
ace */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_lock(&amp;adev-&gt;srbm_mutex);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; adev-&gt;vm_manager.id_mgr=
[AMDGPU_GFXHUB].num_ids; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nv_grbm_select(adev=
, 0, 0, 0, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* CP and shaders *=
/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i =3D=3D 0) {<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmp =3D REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SH_MEM_ALIGNMENT_MODE_UNALIGNED);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmp =3D REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_MODE, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG, tmp);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WREG32_SOC15(GC, 0, mmSH_MEM_BASES, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmp =3D REG_SET_FIELD(0, SH_MEM_CONFIG, ALIGNMENT_MODE,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0SH_MEM_ALIGNMENT_MODE_UNALIGNED);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tmp =3D REG_SET_FIELD(tmp, SH_MEM_CONFIG, RETRY_MODE, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WREG32_SOC15(GC, 0, mmSH_MEM_CONFIG, tmp);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WREG32_SOC15(GC, 0,=
 mmSH_MEM_CONFIG, DEFAULT_SH_MEM_CONFIG);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (i !=3D 0) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tmp =3D REG_SET_FIELD(0, SH_MEM_BASES, PRIVATE_BASE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (adev-&gt;gmc.private_aperture_start=
 &gt;&gt; 48));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tmp =3D REG_SET_FIELD(tmp, SH_MEM_BASES, SHARED_BASE,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (adev-&gt;gmc.shared_aperture_start =
&gt;&gt; 48));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 WREG32_SOC15(GC, 0, mmSH_MEM_BASES, tmp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nv_grbm_select(adev, 0, 0, 0, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mutex_unlock(&amp;adev-&gt;srbm_mutex);<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a></blockquote></div>

--000000000000a6d786058d7faed7--

--===============0225936218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0225936218==--

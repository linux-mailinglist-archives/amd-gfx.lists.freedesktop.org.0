Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A87DCEB6A
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Oct 2019 20:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7B76E0E6;
	Mon,  7 Oct 2019 18:05:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571DB6E0E6
 for <amd-gfx@lists.freedesktop.org>; Mon,  7 Oct 2019 18:05:56 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id n26so30591672ioj.8
 for <amd-gfx@lists.freedesktop.org>; Mon, 07 Oct 2019 11:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=oA1rjXXK+zTWrjinAV/kFqq9e9WFnX3tVpZxzMxIUVs=;
 b=JnTcoMFUZ05ZjdAhbNdj6kiEwXoHWqetHv7pj4Y1Z7hc98XVFhIeNhhYaUfk1WobdZ
 D00gG2rv1ot4OsCrbVsLCg61L4KPGdP0Igtc1neWpKEhSUbZ/Jl8sORLhe1ldhIW/EDr
 rDYjzilvUOfYN95PrY5Sj6u4Kl0/St936PuJhXAbT8kbomcsq8NRsMozQGDESeNefvxP
 QrGRdUVqVnwX8QFxnHEBwxe8fXZQBibVaEOO01ywQC6MNywSbroY5s3Zc9QgmLcRHu94
 lOXNgZgoIoyxAzWQqsiYL6Gm4LDjEMYlWxxizzpe6Ie+k1Xf3Wh1EubLCZDMSjz6tA4z
 a6TA==
X-Gm-Message-State: APjAAAX5WbzGjO2gKNDBBwJZAgXKrV7cL1ms3dRtLrULrI5hbnojZJe6
 s3LwdXXdz2Y8Lp9R5nXNJIpnCboTDh1Bg8VU1FKBkA==
X-Google-Smtp-Source: APXvYqw3r45UuaOp4EM1OQUUUv2bTyQCpmL+UlWOZACF1zeU/R6Jao/SjiZbZDzuzfgM8iR0OTwa6OurVPC8S6PDsus=
X-Received: by 2002:a92:dd87:: with SMTP id g7mr17809087iln.274.1570471555279; 
 Mon, 07 Oct 2019 11:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190925203502.30996-1-maraeo@gmail.com>
In-Reply-To: <20190925203502.30996-1-maraeo@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 7 Oct 2019 14:05:18 -0400
Message-ID: <CAAxE2A7rOodqyZVWCQYcbx6Xsc=XQ_EsVCF+G_tFOWcB7omMmA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: simplify gds_compute_max_wave_id computation
To: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=oA1rjXXK+zTWrjinAV/kFqq9e9WFnX3tVpZxzMxIUVs=;
 b=JzU/goRY7rBIC3UxzITLQoSKbsDD0DoxsyI/Z7OVQk5D6X8e0+LBjbZh04T/Bdo9QB
 AXeYulSJIGM7gBVfza/ilhCdB+OIywpqitEfInlrlzWCqYhDTpCgcBYVDUd9tzMkt5e4
 lh4Rtl2xN2GAqHX50y4rv2M5KbNaqPBwoI2kfUWHH+JE9EAgzbyvHdA07PK32x4HHAq5
 e9O6yaQAZ++w39rRM8rK5V16WN9G2Vas7tkxHCDyx5w0Cpi7EvuhjGR+fwaODLdD4zHr
 1mmuJRHpmrGx7RqvONVi0/T1sK1ydUGDDjskBzg+nH645b7n0wPP/hpOw50J1Z4jUuW/
 ikHA==
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
Content-Type: multipart/mixed; boundary="===============0695047305=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0695047305==
Content-Type: multipart/alternative; boundary="0000000000002eb187059455e735"

--0000000000002eb187059455e735
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Wed, Sep 25, 2019 at 4:35 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wr=
ote:

> From: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
>
> Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index ca01643fa0c8..73cd254449b3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -5275,29 +5275,26 @@ static void gfx_v10_0_set_rlc_funcs(struct
> amdgpu_device *adev)
>         case CHIP_NAVI12:
>                 adev->gfx.rlc.funcs =3D &gfx_v10_0_rlc_funcs;
>                 break;
>         default:
>                 break;
>         }
>  }
>
>  static void gfx_v10_0_set_gds_init(struct amdgpu_device *adev)
>  {
> -       /* init asic gds info */
> -       switch (adev->asic_type) {
> -       case CHIP_NAVI10:
> -       default:
> -               adev->gds.gds_size =3D 0x10000;
> -               adev->gds.gds_compute_max_wave_id =3D 0x4ff;
> -               break;
> -       }
> +       unsigned total_cu =3D adev->gfx.config.max_cu_per_sh *
> +                           adev->gfx.config.max_sh_per_se *
> +                           adev->gfx.config.max_shader_engines;
>
> +       adev->gds.gds_size =3D 0x10000;
> +       adev->gds.gds_compute_max_wave_id =3D total_cu * 32 - 1;
>         adev->gds.gws_size =3D 64;
>         adev->gds.oa_size =3D 16;
>  }
>
>  static void gfx_v10_0_set_user_wgp_inactive_bitmap_per_sh(struct
> amdgpu_device *adev,
>                                                           u32 bitmap)
>  {
>         u32 data;
>
>         if (!bitmap)
> --
> 2.17.1
>
>

--0000000000002eb187059455e735
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Sep 25, 2019 at 4:35 PM Marek Ol=C5=A1=C3=
=A1k &lt;<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Marek Ol=
=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.com" target=3D"_blank">=
marek.olsak@amd.com</a>&gt;<br>
<br>
Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.=
com" target=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 13 +++++--------<br>
=C2=A01 file changed, 5 insertions(+), 8 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c<br>
index ca01643fa0c8..73cd254449b3 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
@@ -5275,29 +5275,26 @@ static void gfx_v10_0_set_rlc_funcs(struct amdgpu_d=
evice *adev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case CHIP_NAVI12:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;gfx.rlc.fu=
ncs =3D &amp;gfx_v10_0_rlc_funcs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0}<br>
<br>
=C2=A0static void gfx_v10_0_set_gds_init(struct amdgpu_device *adev)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* init asic gds info */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (adev-&gt;asic_type) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case CHIP_NAVI10:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.gds_si=
ze =3D 0x10000;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.gds_co=
mpute_max_wave_id =3D 0x4ff;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned total_cu =3D adev-&gt;gfx.config.max_c=
u_per_sh *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gfx.config.max_sh_per_se *<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gfx.config.max_shader_engines;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.gds_size =3D 0x10000;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.gds_compute_max_wave_id =3D total_=
cu * 32 - 1;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;gds.gws_size =3D 64;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;gds.oa_size =3D 16;<br>
=C2=A0}<br>
<br>
=C2=A0static void gfx_v10_0_set_user_wgp_inactive_bitmap_per_sh(struct amdg=
pu_device *adev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 bitmap)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 data;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!bitmap)<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--0000000000002eb187059455e735--

--===============0695047305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0695047305==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9A62735
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 19:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D80A89FDD;
	Mon,  8 Jul 2019 17:32:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CA989FDD
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 17:32:38 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id s7so37073209iob.11
 for <amd-gfx@lists.freedesktop.org>; Mon, 08 Jul 2019 10:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zZUhsg9vfNQlQkNOAfMDSxi63DE6FvJ7zkeAbLJ5yxU=;
 b=YtCiY5yvzj9n6sR6/bHx9obVtnU6srahDLIG2KUHMGdDUv+ELdyB68sYuOvvLMvDX/
 nbJvqXG4R/Uatk36TQOzbaGxf8BIKlOUoaY/ScrJsPnma+tH6HcNwNOlosW0bqYXNmoS
 dvXU4K2MjI2vBav3znIsNbpKDvAiNul0emYmkv6+M8gp4XZ6jneVA/ASD1Cw1+8lPhTb
 GdwtFDhHYUgHdFRbfjjoWrEDM41KJ8JOwfWee/wqoQZ+UDzq4TE5yXeTUUM1DJhZqBh2
 xU9rQ61WW01C1geAj2lxk0t0sL/UnjEi+1Bok9HTIiXvsmVEzPOlE7eVxfa+FwmK49mb
 60nQ==
X-Gm-Message-State: APjAAAUQTCCoe5erBnoj6P6RYWfJT+oEghuLPYBmGbMswGedsbTFqcZ7
 Y7zn3vfOuzQq+eaqoJ5fWqDQw247DDlAsYQpA65MQg==
X-Google-Smtp-Source: APXvYqwmCrKNnPz4S6OtdlyHcxkrHu9xFwieARXMUAP61m5rlMjMMdGTQejm7i2gB5hXuTs7eFSHzYA3bwAOx5T3DnY=
X-Received: by 2002:a5e:924d:: with SMTP id z13mr19255304iop.247.1562607157122; 
 Mon, 08 Jul 2019 10:32:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190702182901.22491-1-maraeo@gmail.com>
In-Reply-To: <20190702182901.22491-1-maraeo@gmail.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 8 Jul 2019 13:31:58 -0400
Message-ID: <CAAxE2A5FUU-TukfWC0-Od9u_deQKV3JZjPXCbwin=ccx-dOx-g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: don't invalidate caches in RELEASE_MEM, only
 do the writeback
To: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zZUhsg9vfNQlQkNOAfMDSxi63DE6FvJ7zkeAbLJ5yxU=;
 b=kc86cdxCkKQBmJa9xudLhEObPAMfHpgPbbOlf9NYN5NEFKvIvmVUSDg6C5rpVC0hYY
 BdgxROHyYneTJmwuD1JGD8z4fOHowHxRaSkvBGmC9o2iBnE691GNF0Dg644OLYq1bZL7
 g0Do06q98IUrJr7GkT0BpyOfeVv7Uaku2cikh4ufSbo295MT8unCqSzGcBVgZ10HXxz1
 LGu+vv76H6oOCRJcD+LcQWXPc5RlYALVrUlTnYA47LzodArwYa/SsjS/VbcN3qpvrZuW
 ullnM23P5trHWHEiGCz9PLsjO2Yc8YQX2FbrJ/MppLsKisjRbk8T++H1DnbX8A/AyWxw
 beeg==
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
Content-Type: multipart/mixed; boundary="===============0794997946=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0794997946==
Content-Type: multipart/alternative; boundary="000000000000862a5f058d2ed4ed"

--000000000000862a5f058d2ed4ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Tue, Jul 2, 2019 at 2:29 PM Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com> wro=
te:

> From: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
>
> This RELEASE_MEM use has the Release semantic, which means we should writ=
e
> back but not invalidate. Invalidations only make sense with the Acquire
> semantic (ACQUIRE_MEM), or when RELEASE_MEM is used to do the combined
> Acquire-Release semantic, which is a barrier, not a fence.
>
> The undesirable side effect of doing invalidations for the Release semant=
ic
> is that it invalidates caches while shaders are running, because the
> Release
> can execute in the middle of the next IB.
>
> UMDs should use ACQUIRE_MEM at the beginning of IBs. Doing cache
> invalidations for a fence (like in this case) doesn't do anything
> for correctness.
>
> Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 210d24511dc6..a30f5d4913b9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -4296,25 +4296,21 @@ static void gfx_v10_0_ring_emit_fence(struct
> amdgpu_ring *ring, u64 addr,
>         bool int_sel =3D flags & AMDGPU_FENCE_FLAG_INT;
>
>         /* Interrupt not work fine on GFX10.1 model yet. Use fallback
> instead */
>         if (adev->pdev->device =3D=3D 0x50)
>                 int_sel =3D false;
>
>         /* RELEASE_MEM - flush caches, send int */
>         amdgpu_ring_write(ring, PACKET3(PACKET3_RELEASE_MEM, 6));
>         amdgpu_ring_write(ring, (PACKET3_RELEASE_MEM_GCR_SEQ |
>                                  PACKET3_RELEASE_MEM_GCR_GL2_WB |
> -                                PACKET3_RELEASE_MEM_GCR_GL2_INV |
> -                                PACKET3_RELEASE_MEM_GCR_GL2_US |
> -                                PACKET3_RELEASE_MEM_GCR_GL1_INV |
> -                                PACKET3_RELEASE_MEM_GCR_GLV_INV |
> -                                PACKET3_RELEASE_MEM_GCR_GLM_INV |
> +                                PACKET3_RELEASE_MEM_GCR_GLM_INV | /* mus=
t
> be set with GLM_WB */
>                                  PACKET3_RELEASE_MEM_GCR_GLM_WB |
>                                  PACKET3_RELEASE_MEM_CACHE_POLICY(3) |
>
>  PACKET3_RELEASE_MEM_EVENT_TYPE(CACHE_FLUSH_AND_INV_TS_EVENT) |
>                                  PACKET3_RELEASE_MEM_EVENT_INDEX(5)));
>         amdgpu_ring_write(ring, (PACKET3_RELEASE_MEM_DATA_SEL(write64bit =
?
> 2 : 1) |
>                                  PACKET3_RELEASE_MEM_INT_SEL(int_sel ? 2 =
:
> 0)));
>
>         /*
>          * the address should be Qword aligned if 64bit write, Dword
>          * aligned if only send 32bit data low (discard data high)
> --
> 2.17.1
>
>

--000000000000862a5f058d2ed4ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Jul 2, 2019 at 2:29 PM Marek Ol=C5=A1=C3=
=A1k &lt;<a href=3D"mailto:maraeo@gmail.com">maraeo@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Marek Ol=
=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.com" target=3D"_blank">=
marek.olsak@amd.com</a>&gt;<br>
<br>
This RELEASE_MEM use has the Release semantic, which means we should write<=
br>
back but not invalidate. Invalidations only make sense with the Acquire<br>
semantic (ACQUIRE_MEM), or when RELEASE_MEM is used to do the combined<br>
Acquire-Release semantic, which is a barrier, not a fence.<br>
<br>
The undesirable side effect of doing invalidations for the Release semantic=
<br>
is that it invalidates caches while shaders are running, because the Releas=
e<br>
can execute in the middle of the next IB.<br>
<br>
UMDs should use ACQUIRE_MEM at the beginning of IBs. Doing cache<br>
invalidations for a fence (like in this case) doesn&#39;t do anything<br>
for correctness.<br>
<br>
Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.=
com" target=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 6 +-----<br>
=C2=A01 file changed, 1 insertion(+), 5 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c<br>
index 210d24511dc6..a30f5d4913b9 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
@@ -4296,25 +4296,21 @@ static void gfx_v10_0_ring_emit_fence(struct amdgpu=
_ring *ring, u64 addr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool int_sel =3D flags &amp; AMDGPU_FENCE_FLAG_=
INT;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Interrupt not work fine on GFX10.1 model yet=
. Use fallback instead */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (adev-&gt;pdev-&gt;device =3D=3D 0x50)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int_sel =3D false;<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* RELEASE_MEM - flush caches, send int */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 amdgpu_ring_write(ring, PACKET3(PACKET3_RELEASE=
_MEM, 6));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 amdgpu_ring_write(ring, (PACKET3_RELEASE_MEM_GC=
R_SEQ |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKET3_RELEASE_MEM_GCR_GL2_WB=
 |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKET3_RELEASE_MEM_GCR_GL2_INV |<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKET3_RELEASE_MEM_GCR_GL2_US |<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKET3_RELEASE_MEM_GCR_GL1_INV |<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKET3_RELEASE_MEM_GCR_GLV_INV |<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKET3_RELEASE_MEM_GCR_GLM_INV |<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PACKET3_RELEASE_MEM_GCR_GLM_INV | /*=
 must be set with GLM_WB */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKET3_RELEASE_MEM_GCR_GLM_WB=
 |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKET3_RELEASE_MEM_CACHE_POLI=
CY(3) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKET3_RELEASE_MEM_EVENT_TYPE=
(CACHE_FLUSH_AND_INV_TS_EVENT) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKET3_RELEASE_MEM_EVENT_INDE=
X(5)));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 amdgpu_ring_write(ring, (PACKET3_RELEASE_MEM_DA=
TA_SEL(write64bit ? 2 : 1) |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PACKET3_RELEASE_MEM_INT_SEL(in=
t_sel ? 2 : 0)));<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the address should be Qword aligned if =
64bit write, Dword<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* aligned if only send 32bit data low (di=
scard data high)<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--000000000000862a5f058d2ed4ed--

--===============0794997946==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0794997946==--

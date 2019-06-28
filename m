Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D8C5A5F5
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 22:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 108DD6E8C4;
	Fri, 28 Jun 2019 20:36:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479F26E8C4
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 20:36:01 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id s7so15158906iob.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 13:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5BTgN3Fd1aOydco92Er9dH5IWG+8FFeEzKi0hlIbtpM=;
 b=c2Hoba8mEjXcpA/HhQxiZEk3MZIGCA4wpWPYOagfxq0zDDTPmem9Zi+d4ahlwOrlCs
 swo8IGhoLlvX9EnQJp2QIU4YYWu7dFUxi/NWWyMUHv1dL1JZbvfLLWd8EwFok/KNZqhP
 mSiJdfvkkC3I4A5DqhrXkCcCuKRiFiOsClVUDSnWwsesSdNTXrHbz8628J+GQJbznjco
 J9II/8HBlXI9uIVotGVzC6xPSeFMNIQjvdiCbIL0M1qJWXgPFjxPU8To8tmTCL6OQKYh
 VJ6Ky/Y7kxPa+VM9CsC15b6dM34NlK3BjqW68WOmQG02lIFMiZKEju2NvtNFOzUFG+Qj
 mPaw==
X-Gm-Message-State: APjAAAXUzyfbzBagFJmRaeHrqKmsTZzS5OJ8U3k7jAW4HbfZHYNuSmha
 U5dasSKLhGT/oRWdAYjLLq8w3rgaKJSn9kh77R8icQ==
X-Google-Smtp-Source: APXvYqy1JXbITbIDkP4ieOG0JZxqGIoWIwFcoMLpotkZSvHLdCQRMMS40XUb3zgddQ/Cj0hh1PmUjqA7/ap4bfjwGcU=
X-Received: by 2002:a5d:9e48:: with SMTP id i8mr2302712ioi.51.1561754160394;
 Fri, 28 Jun 2019 13:36:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190626223521.14347-1-maraeo@gmail.com>
 <20190626223521.14347-2-maraeo@gmail.com>
 <b789da4a-2e31-31eb-4706-ea9b6fbc45c1@amd.com>
In-Reply-To: <b789da4a-2e31-31eb-4706-ea9b6fbc45c1@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 28 Jun 2019 16:35:23 -0400
Message-ID: <CAAxE2A6+wQ+ZGE5TLO7Ed8dPxgHaNdGdx54-GeLU2z5hdTTz2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: handle
 AMDGPU_IB_FLAG_RESET_GDS_MAX_WAVE_ID on gfx10
To: zhoucm1 <zhoucm1@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5BTgN3Fd1aOydco92Er9dH5IWG+8FFeEzKi0hlIbtpM=;
 b=ll6I1gfmHnBDJvBwuueWjRDwpKqOmx+/q0lLXng5CT8MaUuLtve8NlgnOlsnImCefc
 gwL0L5MqHzqsy8LB3dOodMzb7p9iUjp/siByT4ffeBLWDPJbw6ZwUU7gSljnN5XghIz2
 gHriJTdn2jJlSbw7kEvytiZmqb2kE7oGAfCCc/WLeNFyVQtc30ZLm43t05eYU+QCfpYH
 5JnN/Bwc22qkUR7qMssccc6i8tHC8lIK4XsvLcbxxu+h866+jynNutcQxRdCMx9zA3GB
 i5K8vW3QdxOEhebIZGwWbCEBQ4XS26hxAsLEv9UoHy3yqbQGbWv2kLV3jTp07WaC63Dp
 lL/w==
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0683580359=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0683580359==
Content-Type: multipart/alternative; boundary="000000000000f4f95e058c683937"

--000000000000f4f95e058c683937
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. I'll push both patches with emit_ib_size updated for this patch.

Marek

On Thu, Jun 27, 2019 at 3:50 AM zhoucm1 <zhoucm1@amd.com> wrote:

> any reason for not care .emit_ib_size in this one?
>
> -David
>
>
> On 2019=E5=B9=B406=E6=9C=8827=E6=97=A5 06:35, Marek Ol=C5=A1=C3=A1k wrote=
:
> > From: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> >
> > Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 17 +++++++++++++++++
> >   1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > index 6baaa65a1daa..5b807a19bbbf 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > @@ -4257,20 +4257,36 @@ static void gfx_v10_0_ring_emit_ib_gfx(struct
> amdgpu_ring *ring,
> >   }
> >
> >   static void gfx_v10_0_ring_emit_ib_compute(struct amdgpu_ring *ring,
> >                                          struct amdgpu_job *job,
> >                                          struct amdgpu_ib *ib,
> >                                          uint32_t flags)
> >   {
> >       unsigned vmid =3D AMDGPU_JOB_GET_VMID(job);
> >       u32 control =3D INDIRECT_BUFFER_VALID | ib->length_dw | (vmid << =
24);
> >
> > +     /* Currently, there is a high possibility to get wave ID mismatch
> > +      * between ME and GDS, leading to a hw deadlock, because ME
> generates
> > +      * different wave IDs than the GDS expects. This situation happen=
s
> > +      * randomly when at least 5 compute pipes use GDS ordered append.
> > +      * The wave IDs generated by ME are also wrong after
> suspend/resume.
> > +      * Those are probably bugs somewhere else in the kernel driver.
> > +      *
> > +      * Writing GDS_COMPUTE_MAX_WAVE_ID resets wave ID counters in ME
> and
> > +      * GDS to 0 for this ring (me/pipe).
> > +      */
> > +     if (ib->flags & AMDGPU_IB_FLAG_RESET_GDS_MAX_WAVE_ID) {
> > +             amdgpu_ring_write(ring, PACKET3(PACKET3_SET_CONFIG_REG,
> 1));
> > +             amdgpu_ring_write(ring, mmGDS_COMPUTE_MAX_WAVE_ID);
> > +             amdgpu_ring_write(ring,
> ring->adev->gds.gds_compute_max_wave_id);
> > +     }
> > +
> >       amdgpu_ring_write(ring, PACKET3(PACKET3_INDIRECT_BUFFER, 2));
> >       BUG_ON(ib->gpu_addr & 0x3); /* Dword align */
> >       amdgpu_ring_write(ring,
> >   #ifdef __BIG_ENDIAN
> >                               (2 << 0) |
> >   #endif
> >                               lower_32_bits(ib->gpu_addr));
> >       amdgpu_ring_write(ring, upper_32_bits(ib->gpu_addr));
> >       amdgpu_ring_write(ring, control);
> >   }
> > @@ -5103,20 +5119,21 @@ static void gfx_v10_0_set_rlc_funcs(struct
> amdgpu_device *adev)
> >       }
> >   }
> >
> >   static void gfx_v10_0_set_gds_init(struct amdgpu_device *adev)
> >   {
> >       /* init asic gds info */
> >       switch (adev->asic_type) {
> >       case CHIP_NAVI10:
> >       default:
> >               adev->gds.gds_size =3D 0x10000;
> > +             adev->gds.gds_compute_max_wave_id =3D 0x4ff;
> >               adev->gds.vgt_gs_max_wave_id =3D 0x3ff;
> >               break;
> >       }
> >
> >       adev->gds.gws_size =3D 64;
> >       adev->gds.oa_size =3D 16;
> >   }
> >
> >   static void gfx_v10_0_set_user_wgp_inactive_bitmap_per_sh(struct
> amdgpu_device *adev,
> >                                                         u32 bitmap)
>
>

--000000000000f4f95e058c683937
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks. I&#39;ll push both patches with emit_ib_size =
updated for this patch.<br></div><div><br></div><div>Marek<br></div><div><b=
r></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Thu, Jun 27, 2019 at 3:50 AM zhoucm1 &lt;<a href=3D"mailto:zhoucm1@amd.com=
">zhoucm1@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">any reason for not care .emit_ib_size in this one?<br>
<br>
-David<br>
<br>
<br>
On 2019=E5=B9=B406=E6=9C=8827=E6=97=A5 06:35, Marek Ol=C5=A1=C3=A1k wrote:<=
br>
&gt; From: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.com"=
 target=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak=
@amd.com" target=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 17 ++++++++++++++=
+++<br>
&gt;=C2=A0 =C2=A01 file changed, 17 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/=
amd/amdgpu/gfx_v10_0.c<br>
&gt; index 6baaa65a1daa..5b807a19bbbf 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&gt; @@ -4257,20 +4257,36 @@ static void gfx_v10_0_ring_emit_ib_gfx(struct =
amdgpu_ring *ring,<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void gfx_v10_0_ring_emit_ib_compute(struct amdgpu_r=
ing *ring,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct amdgpu_job *job,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 struct amdgpu_ib *ib,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 uint32_t flags)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned vmid =3D AMDGPU_JOB_GET_VMID(job);<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 control =3D INDIRECT_BUFFER_VALID | ib-&=
gt;length_dw | (vmid &lt;&lt; 24);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Currently, there is a high possibility to get =
wave ID mismatch<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * between ME and GDS, leading to a hw deadlock, =
because ME generates<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * different wave IDs than the GDS expects. This =
situation happens<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * randomly when at least 5 compute pipes use GDS=
 ordered append.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * The wave IDs generated by ME are also wrong af=
ter suspend/resume.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Those are probably bugs somewhere else in the =
kernel driver.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Writing GDS_COMPUTE_MAX_WAVE_ID resets wave ID=
 counters in ME and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * GDS to 0 for this ring (me/pipe).<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ib-&gt;flags &amp; AMDGPU_IB_FLAG_RESET_GDS_M=
AX_WAVE_ID) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ring_write(rin=
g, PACKET3(PACKET3_SET_CONFIG_REG, 1));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ring_write(rin=
g, mmGDS_COMPUTE_MAX_WAVE_ID);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ring_write(rin=
g, ring-&gt;adev-&gt;gds.gds_compute_max_wave_id);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ring_write(ring, PACKET3(PACKET3_INDI=
RECT_BUFFER, 2));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0BUG_ON(ib-&gt;gpu_addr &amp; 0x3); /* Dword =
align */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ring_write(ring,<br>
&gt;=C2=A0 =C2=A0#ifdef __BIG_ENDIAN<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(2 &lt;&lt; 0) |<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lower_32_bits(ib-&gt;gpu_addr));<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ring_write(ring, upper_32_bits(ib-&gt=
;gpu_addr));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_ring_write(ring, control);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; @@ -5103,20 +5119,21 @@ static void gfx_v10_0_set_rlc_funcs(struct amd=
gpu_device *adev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void gfx_v10_0_set_gds_init(struct amdgpu_device *a=
dev)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* init asic gds info */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (adev-&gt;asic_type) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case CHIP_NAVI10:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.gds=
_size =3D 0x10000;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.gds_comp=
ute_max_wave_id =3D 0x4ff;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.vgt=
_gs_max_wave_id =3D 0x3ff;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.gws_size =3D 64;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0adev-&gt;gds.oa_size =3D 16;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void gfx_v10_0_set_user_wgp_inactive_bitmap_per_sh(=
struct amdgpu_device *adev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u32 bitmap)<br>
<br>
</blockquote></div></div>

--000000000000f4f95e058c683937--

--===============0683580359==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0683580359==--

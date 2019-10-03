Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2692CAB7C
	for <lists+amd-gfx@lfdr.de>; Thu,  3 Oct 2019 19:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4196EA31;
	Thu,  3 Oct 2019 17:33:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A4D6EA31
 for <amd-gfx@lists.freedesktop.org>; Thu,  3 Oct 2019 17:33:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a22so3725043ljd.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 03 Oct 2019 10:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vQRVTDcfkzNK0y53HsVIKYHi3y1xEaaLBWWkoxuxAAI=;
 b=FImYBKIWIRkogxRehDbhZf0x+AIGVY8U0L1wSYiFyVbNdC8LfOtzmHgMikglvs6oIX
 lMG6zA4oub/FC6bvYm9dZAruGTK2mxUTDQOgJU6pkMGMgh4OOh4vspbmbaKoFs+9uUfC
 3DSyrCTGw4+h9fXUX4SpPsn8f00szHGuGp/MUFQlMs/oRCwHi2wSfrHUQ7pJ6Kn+t9UD
 Ovpwlc4zt5Sh3QuGJHJcBajfQCj50i61i7ZsGtt/jlJ8MnMMX2ls0PRrSkZOVi2F3biS
 S0cxRfMtmqkcUnz+ZBQvzmUBzzLAaBDBq8j22GSW9flr6F+teVPeBGHEw5iwh0lQXS/9
 uNFQ==
X-Gm-Message-State: APjAAAVzL3/UsfJqijpyL/CVekemLQRBnFRvcHtkZfPWgeEkGoz/Ot1h
 pJi9qZ7e3GE3LSsSj83uhzIYZepIPCv5d/tMxf0=
X-Google-Smtp-Source: APXvYqzGxMkN/W1gCv+qh41N5gloI8TaDTPG8tJIE15GgOVKXzqYRGxMm2D9vbmQRByW0e7HslTa+nAcuzl1y/pR0z0=
X-Received: by 2002:a2e:8857:: with SMTP id z23mr6802247ljj.19.1570124031278; 
 Thu, 03 Oct 2019 10:33:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191003172951.15866-1-alexander.deucher@amd.com>
In-Reply-To: <20191003172951.15866-1-alexander.deucher@amd.com>
From: Tom St Denis <tstdenis82@gmail.com>
Date: Thu, 3 Oct 2019 13:33:40 -0400
Message-ID: <CAAzXoRKMd2gSrK5GE2Y6UDkbjLifZ5UuAvpTS06eeqB7zJP_Aw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: improve MSI-X handling (v3)
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=vQRVTDcfkzNK0y53HsVIKYHi3y1xEaaLBWWkoxuxAAI=;
 b=W84aQp8x+cNovLHc5U6jBfk/mA4DvtFj3gqyJP2yNKuevuaGiz0XDtryjwWfZcyxOa
 1YlgYhviNofyfOQLb77ahnnmznZweFTYVMSCAhegsLnZYdKUWFWrzJp0Upco2ETZbTUN
 cr3/juyyKl7KCt1ZBn0MdIOFHuUXTdC/IFtO4XSFhZjF8GSN0dcsJCTNDrLiZKAs9sEM
 H7gTyV6dlk5EtebKfaJQWUyP6M6F6KRIOzGqyagCDk1+BmZxj1S+aiOAdEh2xHeKARb3
 jckldPKMsYs2mrMN0qQIP1Yz/COialgYtAFQINjq0rkbsGgd1kpoUcvmM/V46xXv3zw8
 1r/Q==
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0569022426=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0569022426==
Content-Type: multipart/alternative; boundary="00000000000023423b059404fdb1"

--00000000000023423b059404fdb1
Content-Type: text/plain; charset="UTF-8"

Tested-by: Tom St Denis <tom.stdenis@amd.com>

Cheers,
Tom

On Thu, Oct 3, 2019 at 1:30 PM Alex Deucher <alexdeucher@gmail.com> wrote:

> Check the number of supported vectors and fall back to MSI if
> we return or error or 0 MSI-X vectors.
>
> v2: only allocate one vector.  We can't currently use more than
> one anyway.
>
> v3: install the irq on vector 0.
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 50771b2757dc..6f3b03f6224f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -245,11 +245,19 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>         adev->irq.msi_enabled = false;
>
>         if (amdgpu_msi_ok(adev)) {
> -               int nvec = pci_alloc_irq_vectors(adev->pdev, 1,
> pci_msix_vec_count(adev->pdev),
> -                                       PCI_IRQ_MSI | PCI_IRQ_MSIX);
> +               int nvec = pci_msix_vec_count(adev->pdev);
> +               unsigned int flags;
> +
> +               if (nvec <= 0) {
> +                       flags = PCI_IRQ_MSI;
> +               } else {
> +                       flags = PCI_IRQ_MSI | PCI_IRQ_MSIX;
> +               }
> +               /* we only need one vector */
> +               nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1, flags);
>                 if (nvec > 0) {
>                         adev->irq.msi_enabled = true;
> -                       dev_dbg(adev->dev, "amdgpu: using MSI.\n");
> +                       dev_dbg(adev->dev, "amdgpu: using MSI/MSI-X.\n");
>                 }
>         }
>
> @@ -272,7 +280,8 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>         INIT_WORK(&adev->irq.ih2_work, amdgpu_irq_handle_ih2);
>
>         adev->irq.installed = true;
> -       r = drm_irq_install(adev->ddev, adev->ddev->pdev->irq);
> +       /* Use vector 0 for MSI-X */
> +       r = drm_irq_install(adev->ddev, pci_irq_vector(adev->pdev, 0));
>         if (r) {
>                 adev->irq.installed = false;
>                 if (!amdgpu_device_has_dc_support(adev))
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--00000000000023423b059404fdb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tested-by: Tom St Denis &lt;<a href=3D"mailto:tom.stdenis@=
amd.com">tom.stdenis@amd.com</a>&gt;<div><br></div><div>Cheers,</div><div>T=
om</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, Oct 3, 2019 at 1:30 PM Alex Deucher &lt;<a href=3D"mailto:a=
lexdeucher@gmail.com">alexdeucher@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Check the number of supported ve=
ctors and fall back to MSI if<br>
we return or error or 0 MSI-X vectors.<br>
<br>
v2: only allocate one vector.=C2=A0 We can&#39;t currently use more than<br=
>
one anyway.<br>
<br>
v3: install the irq on vector 0.<br>
<br>
Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com=
" target=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 17 +++++++++++++----<br>
=C2=A01 file changed, 13 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_irq.c<br>
index 50771b2757dc..6f3b03f6224f 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c<br>
@@ -245,11 +245,19 @@ int amdgpu_irq_init(struct amdgpu_device *adev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;irq.msi_enabled =3D false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (amdgpu_msi_ok(adev)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int nvec =3D pci_al=
loc_irq_vectors(adev-&gt;pdev, 1, pci_msix_vec_count(adev-&gt;pdev),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PCI_IRQ_M=
SI | PCI_IRQ_MSIX);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int nvec =3D pci_ms=
ix_vec_count(adev-&gt;pdev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int flags;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvec &lt;=3D 0)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0flags =3D PCI_IRQ_MSI;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0flags =3D PCI_IRQ_MSI | PCI_IRQ_MSIX;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* we only need one=
 vector */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvec =3D pci_alloc_=
irq_vectors(adev-&gt;pdev, 1, 1, flags);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (nvec &gt; 0) {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 adev-&gt;irq.msi_enabled =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_dbg(adev-&gt;dev, &quot;amdgpu: using MSI.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_dbg(adev-&gt;dev, &quot;amdgpu: using MSI/MSI-X.\n&quot;);<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -272,7 +280,8 @@ int amdgpu_irq_init(struct amdgpu_device *adev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT_WORK(&amp;adev-&gt;irq.ih2_work, amdgpu_ir=
q_handle_ih2);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;irq.installed =3D true;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D drm_irq_install(adev-&gt;ddev, adev-&gt;d=
dev-&gt;pdev-&gt;irq);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Use vector 0 for MSI-X */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D drm_irq_install(adev-&gt;ddev, pci_irq_ve=
ctor(adev-&gt;pdev, 0));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 adev-&gt;irq.instal=
led =3D false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!amdgpu_device_=
has_dc_support(adev))<br>
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

--00000000000023423b059404fdb1--

--===============0569022426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0569022426==--

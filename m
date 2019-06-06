Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8902A371AD
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 12:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9EF8933C;
	Thu,  6 Jun 2019 10:28:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0AA8933C
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 10:28:43 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id u10so382577lfm.12
 for <amd-gfx@lists.freedesktop.org>; Thu, 06 Jun 2019 03:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=ZANtfUXFxY4XjEeI6Ikpjad88CFibKGZDVSXyYHOt1w=;
 b=FyjvbTxQz/9hzO62PvwuSj0loQOXNFRuZai3Gg3nT8EncJB3jOdW5rfo/KC5p74C0X
 kzC7CIBqGqAy3+D6eVT3A2Zu8wlTEJjw3E8djffTFkS8Li8u2pJdg9Ac6w6c0XGw7l8w
 RoxTWj0evjDQ7jJHuw+N84djshQ5Fp86y9Otxl/YfeX9B46bq2tFTm1d6j8Rw/W8FUpV
 2mBvyyDqf1hcx6PCV2N4gKFZZDHTn2VfSfILBFPPJOMomSmJbLVR2m9DuQbHrlGRU98O
 LLWD975YYATHrdajy2Ci4wrd7Rt4abqfjO+HP0foDlnhoJ9KZt8VyQgUZUSV2eEAsjwf
 Qpxw==
X-Gm-Message-State: APjAAAVER0yO+evuJ3obykbwFffJk1P6pLtrSeFJ/GYRp8d6+A/wHFLW
 hvPR+npHCHzIM0nUpZ2uWZCTBtaUeXtvFjnkf8J/T95E
X-Google-Smtp-Source: APXvYqzIvnerb43VBY9WokQ6WC6JeP+a/OUGmRhSQXK6Ubj0Q22ZmVA1zRHFYtmUX9ZO7hzkXRvcSKb1HuOlsGhgRmw=
X-Received: by 2002:ac2:59c9:: with SMTP id x9mr23053033lfn.52.1559816921523; 
 Thu, 06 Jun 2019 03:28:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190604171532.17816-1-tom.stdenis@amd.com>
In-Reply-To: <20190604171532.17816-1-tom.stdenis@amd.com>
From: Tom St Denis <tstdenis82@gmail.com>
Date: Thu, 6 Jun 2019 06:28:30 -0400
Message-ID: <CAAzXoRLGKMT81H2J3t0MLix0RgWsshd74aiC=ABRP3P54b3LXA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/amdgpu: remove vram_page_split kernel option (v2)
To: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=ZANtfUXFxY4XjEeI6Ikpjad88CFibKGZDVSXyYHOt1w=;
 b=Fw1aIE8piyuQuzB76k4/UlDJs9yC9MfLDT54ve9SPBPEbApqEWXRE4uDoL9fbEZYAb
 lriB89MZHS/tjufFe5vviO7WLn+LxtZ7EUK9Xezu8FA1zPPsCGVv68U6/Iv5AXGF2Aes
 FFZgRjPE5j0OwngMm9xkBMr3k6fNvwAGpo/e9/ZRyAw7Lg6qqxc8UUfPxDjAjE4rNZHc
 mTqyHlRnZJxDlPOWknOuhNQ1y+Ui7DKHzphFnN8HHx+P5eCNG3pKKIIWllInhCpeZNi1
 LlJGjHb644GZyxKj0Sw50Rc4KKrsCPpfO/y0yJD6uXMs1zCJ/XWAiMfEtvEOMCx2cImH
 StMA==
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
Content-Type: multipart/mixed; boundary="===============2065059091=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2065059091==
Content-Type: multipart/alternative; boundary="00000000000085ad0c058aa52d31"

--00000000000085ad0c058aa52d31
Content-Type: text/plain; charset="UTF-8"

ping?

On Tue, Jun 4, 2019 at 1:15 PM StDenis, Tom <Tom.StDenis@amd.com> wrote:

> This option is no longer needed.  The default code paths
> are now the only option.
>
> v2: Add HPAGE support and a default for non contiguous maps
>
> Signed-off-by: Tom St Denis <tom.stdenis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h          |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  7 -------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c      |  8 --------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 14 +++++++++-----
>  4 files changed, 9 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 19a00282e34c..e54f31865f60 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -142,7 +142,6 @@ extern uint amdgpu_sdma_phase_quantum;
>  extern char *amdgpu_disable_cu;
>  extern char *amdgpu_virtual_display;
>  extern uint amdgpu_pp_feature_mask;
> -extern int amdgpu_vram_page_split;
>  extern int amdgpu_ngg;
>  extern int amdgpu_prim_buf_per_se;
>  extern int amdgpu_pos_buf_per_se;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index d00fd5dd307a..ef7d99ebe92d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -973,13 +973,6 @@ static int amdgpu_device_check_arguments(struct
> amdgpu_device *adev)
>
>         amdgpu_device_check_block_size(adev);
>
> -       if (amdgpu_vram_page_split != -1 && (amdgpu_vram_page_split < 16 ||
> -           !is_power_of_2(amdgpu_vram_page_split))) {
> -               dev_warn(adev->dev, "invalid VRAM page split (%d)\n",
> -                        amdgpu_vram_page_split);
> -               amdgpu_vram_page_split = 1024;
> -       }
> -
>         ret = amdgpu_device_get_job_timeout_settings(adev);
>         if (ret) {
>                 dev_err(adev->dev, "invalid lockup_timeout parameter
> syntax\n");
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 1f38d6fc1fe3..ef22a2a25448 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -108,7 +108,6 @@ int amdgpu_vm_fragment_size = -1;
>  int amdgpu_vm_block_size = -1;
>  int amdgpu_vm_fault_stop = 0;
>  int amdgpu_vm_debug = 0;
> -int amdgpu_vram_page_split = 512;
>  int amdgpu_vm_update_mode = -1;
>  int amdgpu_exp_hw_support = 0;
>  int amdgpu_dc = -1;
> @@ -342,13 +341,6 @@ module_param_named(vm_debug, amdgpu_vm_debug, int,
> 0644);
>  MODULE_PARM_DESC(vm_update_mode, "VM update using CPU (0 = never (default
> except for large BAR(LB)), 1 = Graphics only, 2 = Compute only (default for
> LB), 3 = Both");
>  module_param_named(vm_update_mode, amdgpu_vm_update_mode, int, 0444);
>
> -/**
> - * DOC: vram_page_split (int)
> - * Override the number of pages after we split VRAM allocations (default
> 512, -1 = disable). The default is 512.
> - */
> -MODULE_PARM_DESC(vram_page_split, "Number of pages after we split VRAM
> allocations (default 512, -1 = disable)");
> -module_param_named(vram_page_split, amdgpu_vram_page_split, int, 0444);
> -
>  /**
>   * DOC: exp_hw_support (int)
>   * Enable experimental hw support (1 = enable). The default is 0
> (disabled).
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index ec9ea3fdbb4a..0bc01e25a0b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -284,17 +284,21 @@ static int amdgpu_vram_mgr_new(struct
> ttm_mem_type_manager *man,
>         if (!lpfn)
>                 lpfn = man->size;
>
> -       if (place->flags & TTM_PL_FLAG_CONTIGUOUS ||
> -           amdgpu_vram_page_split == -1) {
> +       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>                 pages_per_node = ~0ul;
>                 num_nodes = 1;
>         } else {
> -               pages_per_node = max((uint32_t)amdgpu_vram_page_split,
> -                                    mem->page_alignment);
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +               pages_per_node = HPAGE_PMD_NR;
> +#else
> +               /* default to 512MB */
> +               pages_per_node = (512UL << (20UL - PAGE_SHIFT));
> +#endif
> +               pages_per_node = max((uint32_t)pages_per_node,
> mem->page_alignment);
>                 num_nodes = DIV_ROUND_UP(mem->num_pages, pages_per_node);
>         }
>
> -       nodes = kvmalloc_array(num_nodes, sizeof(*nodes),
> +       nodes = kvmalloc_array((uint32_t)num_nodes, sizeof(*nodes),
>                                GFP_KERNEL | __GFP_ZERO);
>         if (!nodes)
>                 return -ENOMEM;
> --
> 2.21.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--00000000000085ad0c058aa52d31
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Jun 4, 2019 at 1:15 PM StDenis, Tom &lt;<a hr=
ef=3D"mailto:Tom.StDenis@amd.com">Tom.StDenis@amd.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">This option is no long=
er needed.=C2=A0 The default code paths<br>
are now the only option.<br>
<br>
v2: Add HPAGE support and a default for non contiguous maps<br>
<br>
Signed-off-by: Tom St Denis &lt;<a href=3D"mailto:tom.stdenis@amd.com" targ=
et=3D"_blank">tom.stdenis@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 1 -<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=C2=A0 =C2=A0|=C2=A0 7 ----=
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 8=
 --------<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 14 +++++++++-----<br>
=C2=A04 files changed, 9 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index 19a00282e34c..e54f31865f60 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -142,7 +142,6 @@ extern uint amdgpu_sdma_phase_quantum;<br>
=C2=A0extern char *amdgpu_disable_cu;<br>
=C2=A0extern char *amdgpu_virtual_display;<br>
=C2=A0extern uint amdgpu_pp_feature_mask;<br>
-extern int amdgpu_vram_page_split;<br>
=C2=A0extern int amdgpu_ngg;<br>
=C2=A0extern int amdgpu_prim_buf_per_se;<br>
=C2=A0extern int amdgpu_pos_buf_per_se;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_device.c<br>
index d00fd5dd307a..ef7d99ebe92d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
@@ -973,13 +973,6 @@ static int amdgpu_device_check_arguments(struct amdgpu=
_device *adev)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 amdgpu_device_check_block_size(adev);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (amdgpu_vram_page_split !=3D -1 &amp;&amp; (=
amdgpu_vram_page_split &lt; 16 ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!is_power_of_2(amdgpu_vram_page_s=
plit))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_warn(adev-&gt;d=
ev, &quot;invalid VRAM page split (%d)\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 amdgpu_vram_page_split);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vram_page_sp=
lit =3D 1024;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D amdgpu_device_get_job_timeout_settings(=
adev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(adev-&gt;de=
v, &quot;invalid lockup_timeout parameter syntax\n&quot;);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 1f38d6fc1fe3..ef22a2a25448 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -108,7 +108,6 @@ int amdgpu_vm_fragment_size =3D -1;<br>
=C2=A0int amdgpu_vm_block_size =3D -1;<br>
=C2=A0int amdgpu_vm_fault_stop =3D 0;<br>
=C2=A0int amdgpu_vm_debug =3D 0;<br>
-int amdgpu_vram_page_split =3D 512;<br>
=C2=A0int amdgpu_vm_update_mode =3D -1;<br>
=C2=A0int amdgpu_exp_hw_support =3D 0;<br>
=C2=A0int amdgpu_dc =3D -1;<br>
@@ -342,13 +341,6 @@ module_param_named(vm_debug, amdgpu_vm_debug, int, 064=
4);<br>
=C2=A0MODULE_PARM_DESC(vm_update_mode, &quot;VM update using CPU (0 =3D nev=
er (default except for large BAR(LB)), 1 =3D Graphics only, 2 =3D Compute o=
nly (default for LB), 3 =3D Both&quot;);<br>
=C2=A0module_param_named(vm_update_mode, amdgpu_vm_update_mode, int, 0444);=
<br>
<br>
-/**<br>
- * DOC: vram_page_split (int)<br>
- * Override the number of pages after we split VRAM allocations (default 5=
12, -1 =3D disable). The default is 512.<br>
- */<br>
-MODULE_PARM_DESC(vram_page_split, &quot;Number of pages after we split VRA=
M allocations (default 512, -1 =3D disable)&quot;);<br>
-module_param_named(vram_page_split, amdgpu_vram_page_split, int, 0444);<br=
>
-<br>
=C2=A0/**<br>
=C2=A0 * DOC: exp_hw_support (int)<br>
=C2=A0 * Enable experimental hw support (1 =3D enable). The default is 0 (d=
isabled).<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_vram_mgr.c<br>
index ec9ea3fdbb4a..0bc01e25a0b4 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c<br>
@@ -284,17 +284,21 @@ static int amdgpu_vram_mgr_new(struct ttm_mem_type_ma=
nager *man,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!lpfn)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lpfn =3D man-&gt;si=
ze;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (place-&gt;flags &amp; TTM_PL_FLAG_CONTIGUOU=
S ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_vram_page_split =3D=3D -1)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (place-&gt;flags &amp; TTM_PL_FLAG_CONTIGUOU=
S) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pages_per_node =3D =
~0ul;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_nodes =3D 1;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pages_per_node =3D =
max((uint32_t)amdgpu_vram_page_split,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem-&gt;page_alignment=
);<br>
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pages_per_node =3D =
HPAGE_PMD_NR;<br>
+#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* default to 512MB=
 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pages_per_node =3D =
(512UL &lt;&lt; (20UL - PAGE_SHIFT));<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pages_per_node =3D =
max((uint32_t)pages_per_node, mem-&gt;page_alignment);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num_nodes =3D DIV_R=
OUND_UP(mem-&gt;num_pages, pages_per_node);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0nodes =3D kvmalloc_array(num_nodes, sizeof(*nod=
es),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nodes =3D kvmalloc_array((uint32_t)num_nodes, s=
izeof(*nodes),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL | __GFP_ZERO);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!nodes)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;<br>
-- <br>
2.21.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a></blockquote></div>

--00000000000085ad0c058aa52d31--

--===============2065059091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2065059091==--

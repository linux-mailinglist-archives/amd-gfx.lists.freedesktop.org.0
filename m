Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4E9AC564
	for <lists+amd-gfx@lfdr.de>; Sat,  7 Sep 2019 10:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C74B889E7B;
	Sat,  7 Sep 2019 08:53:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD4989E7B
 for <amd-gfx@lists.freedesktop.org>; Sat,  7 Sep 2019 08:53:19 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id b2so8017105otq.10
 for <amd-gfx@lists.freedesktop.org>; Sat, 07 Sep 2019 01:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2wXFaEAHJiWW0GyguDVpab0NBr9k6h6ReE6GHCliEj4=;
 b=N7slR96UFE5PmoNjVSw0YT2a8jGqWRvgAzWcRNw7Eq33LoUB5BHiYxAfstOtwNa6C9
 N05ZUBraTfca0ny70DQKY/OxQ8iKfcBJ7szDBHfzaeDEkZgxS9VBllx3vRc8CUqp+9je
 59Dsb659xaIr07UWcgtUL/D1yoO+OodShqZmOUbPBiBm0s/NeuyXhTMSY/rovVtdsVfK
 ecc4nC2ekhJDD+SFnJZN7lmSlwdedwwYRLD8jOztrficpcD3bqmJ0Yda/Xmj+8g4zxd0
 eFn0HZjdrkAwbtQavMeg2j0Mt+ubaIvrA1fX/urhtp1SaA/EQ4gUi7UN7hkxFlSWQ4me
 zHRw==
X-Gm-Message-State: APjAAAXAHCf/IlhmZgTR0Auz2+JyVSzMZiQP+Gbf2gRJIlLB+oR+NBSG
 n7KB+7Vzx7aEVuigdpFERVVL6LZud71BzlFgGvQ=
X-Google-Smtp-Source: APXvYqyOMFER5Ogk6YQf7hPrcmc4fxjZDInPWYgeiM3BoJWtM4bSh/d3zKpXaDY5TpCti6kS4EDANvnBPvcisKx4zfA=
X-Received: by 2002:a05:6830:1bd8:: with SMTP id
 v24mr11012317ota.63.1567846398245; 
 Sat, 07 Sep 2019 01:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <1567782810-22378-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1567782810-22378-1-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Nils_Wallm=C3=A9nius?= <nils.wallmenius@gmail.com>
Date: Sat, 7 Sep 2019 10:53:05 +0200
Message-ID: <CA+nq7DtM7uSx3n_pMp==SqxjcBc0TGKcYQnidi7hvY47wkOfWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Allow to reset to EERPOM table.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=2wXFaEAHJiWW0GyguDVpab0NBr9k6h6ReE6GHCliEj4=;
 b=uR6t01xS8pQ9E42t1mqtJBdIlVAQOruLeEiSL8Ngxtb8xdop/+xHMwytm2vu2XikrV
 NHXNglviS1D2Us1QwbWuJMZ+ZLvXIbVGJj49lTihAVYg9Ln2KHn9jV/8xv3udnF7GM/L
 jlI8rsvo7OA5zhBnJqYVpN1qHXD0lzmyJ1XC3T348xNeXC5DRVlV8TleCzhMI9CLDh81
 KSCx0FqKdHgbEZZeOlR1OwUukE//XX0FWjckcexfoqwVwPhX1GzsG0jIL6X+0c4SAKmh
 P5ILcjZ6nUF/oiqClcsS9l6qCdx7UFWvzOzKC0es/PsPcVBGNi8vNDby1+cJkZT51Qny
 HV7g==
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
Cc: Tao.Zhou1@amd.com, Guchun.Chen@amd.com, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1255588425=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1255588425==
Content-Type: multipart/alternative; boundary="000000000000a13dff0591f2af71"

--000000000000a13dff0591f2af71
Content-Type: text/plain; charset="UTF-8"

Hi Andrey, spotted a typo below, also typo in the title s/EERPOM/EEPROM/

Regards
Nils

Den fre 6 sep. 2019 17:13Andrey Grodzovsky <andrey.grodzovsky@amd.com>
skrev:

> The table grows quickly during debug/development effort when
> multiple RAS errors are injected. Allow to avoid this by setting
> table header back to empty if needed.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h            | 1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c        | 8 ++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 3 ++-
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 0d11aa8..405c55a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -169,6 +169,7 @@ extern int amdgpu_discovery;
>  extern int amdgpu_mes;
>  extern int amdgpu_noretry;
>  extern int amdgpu_force_asic_type;
> +extern int amdgpu_ras_eeprom_reset;
>
>  #ifdef CONFIG_DRM_AMDGPU_SI
>  extern int amdgpu_si_support;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 5a7f929..6e101a5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -145,6 +145,7 @@ int amdgpu_discovery = -1;
>  int amdgpu_mes = 0;
>  int amdgpu_noretry = 1;
>  int amdgpu_force_asic_type = -1;
> +int amdgpu_ras_eeprom_reset = -1;
>
>  struct amdgpu_mgpu_info mgpu_info = {
>         .mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
> @@ -530,6 +531,13 @@ MODULE_PARM_DESC(ras_mask, "Mask of RAS features to
> enable (default 0xffffffff),
>  module_param_named(ras_mask, amdgpu_ras_mask, uint, 0444);
>
>  /**
> + * DOC: ras_eeprom_reset (int)
> + * Reset EEPROM table to zerro entries.
> + */
> +MODULE_PARM_DESC(ras_eeprom_reset, "Reset RAS EEPROM table to zerro
> entries (1 = reset, -1 = auto (default - don't reset)");
>

s/zerro/zero/ in two places

+module_param_named(ras_eeprom_reset, amdgpu_ras_eeprom_reset, int, 0444);
> +
> +/**
>   * DOC: si_support (int)
>   * Set SI support driver. This parameter works after set config
> CONFIG_DRM_AMDGPU_SI. For SI asic, when radeon driver is enabled,
>   * set value 0 to use radeon driver, while set value 1 to use amdgpu
> driver. The default is using radeon driver when it available,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> index 43dd4ab..75c6fc0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c
> @@ -140,7 +140,8 @@ int amdgpu_ras_eeprom_init(struct
> amdgpu_ras_eeprom_control *control)
>
>         __decode_table_header_from_buff(hdr, &buff[2]);
>
> -       if (hdr->header == EEPROM_TABLE_HDR_VAL) {
> +       if (amdgpu_ras_eeprom_reset != 1 &&
> +           hdr->header == EEPROM_TABLE_HDR_VAL) {
>                 control->num_recs = (hdr->tbl_size -
> EEPROM_TABLE_HEADER_SIZE) /
>                                     EEPROM_TABLE_RECORD_SIZE;
>                 DRM_DEBUG_DRIVER("Found existing EEPROM table with %d
> records",
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--000000000000a13dff0591f2af71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Andrey, spotted a typo below, also typo in the ti=
tle s/EERPOM/EEPROM/</div><div dir=3D"auto"><br></div><div dir=3D"auto">Reg=
ards</div><div dir=3D"auto">Nils<br><br><div class=3D"gmail_quote" dir=3D"a=
uto"><div dir=3D"ltr" class=3D"gmail_attr">Den fre 6 sep. 2019 17:13Andrey =
Grodzovsky &lt;<a href=3D"mailto:andrey.grodzovsky@amd.com">andrey.grodzovs=
ky@amd.com</a>&gt; skrev:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The tabl=
e grows quickly during debug/development effort when<br>
multiple RAS errors are injected. Allow to avoid this by setting<br>
table header back to empty if needed.<br>
<br>
Signed-off-by: Andrey Grodzovsky &lt;<a href=3D"mailto:andrey.grodzovsky@am=
d.com" target=3D"_blank" rel=3D"noreferrer">andrey.grodzovsky@amd.com</a>&g=
t;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 1 +<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
8 ++++++++<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c | 3 ++-<br>
=C2=A03 files changed, 11 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index 0d11aa8..405c55a 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -169,6 +169,7 @@ extern int amdgpu_discovery;<br>
=C2=A0extern int amdgpu_mes;<br>
=C2=A0extern int amdgpu_noretry;<br>
=C2=A0extern int amdgpu_force_asic_type;<br>
+extern int amdgpu_ras_eeprom_reset;<br>
<br>
=C2=A0#ifdef CONFIG_DRM_AMDGPU_SI<br>
=C2=A0extern int amdgpu_si_support;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 5a7f929..6e101a5 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -145,6 +145,7 @@ int amdgpu_discovery =3D -1;<br>
=C2=A0int amdgpu_mes =3D 0;<br>
=C2=A0int amdgpu_noretry =3D 1;<br>
=C2=A0int amdgpu_force_asic_type =3D -1;<br>
+int amdgpu_ras_eeprom_reset =3D -1;<br>
<br>
=C2=A0struct amdgpu_mgpu_info mgpu_info =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mutex =3D __MUTEX_INITIALIZER(mgpu_info.mutex)=
,<br>
@@ -530,6 +531,13 @@ MODULE_PARM_DESC(ras_mask, &quot;Mask of RAS features =
to enable (default 0xffffffff),<br>
=C2=A0module_param_named(ras_mask, amdgpu_ras_mask, uint, 0444);<br>
<br>
=C2=A0/**<br>
+ * DOC: ras_eeprom_reset (int)<br>
+ * Reset EEPROM table to zerro entries.<br>
+ */<br>
+MODULE_PARM_DESC(ras_eeprom_reset, &quot;Reset RAS EEPROM table to zerro e=
ntries (1 =3D reset, -1 =3D auto (default - don&#39;t reset)&quot;);<br></b=
lockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">s/zerro=
/zero/ in two places</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+module_param_named(ras_eeprom_reset, amdgpu_ras_eeprom_reset, int, 0444);<=
br>
+<br>
+/**<br>
=C2=A0 * DOC: si_support (int)<br>
=C2=A0 * Set SI support driver. This parameter works after set config CONFI=
G_DRM_AMDGPU_SI. For SI asic, when radeon driver is enabled,<br>
=C2=A0 * set value 0 to use radeon driver, while set value 1 to use amdgpu =
driver. The default is using radeon driver when it available,<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_ras_eeprom.c<br>
index 43dd4ab..75c6fc0 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c<br>
@@ -140,7 +140,8 @@ int amdgpu_ras_eeprom_init(struct amdgpu_ras_eeprom_con=
trol *control)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __decode_table_header_from_buff(hdr, &amp;buff[=
2]);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hdr-&gt;header =3D=3D EEPROM_TABLE_HDR_VAL)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (amdgpu_ras_eeprom_reset !=3D 1 &amp;&amp;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hdr-&gt;header =3D=3D EEPROM_TABL=
E_HDR_VAL) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 control-&gt;num_rec=
s =3D (hdr-&gt;tbl_size - EEPROM_TABLE_HEADER_SIZE) /<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EEPROM_TABLE_RECORD_SI=
ZE;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG_DRIVER(&q=
uot;Found existing EEPROM table with %d records&quot;,<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank" rel=3D"n=
oreferrer">amd-gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailm=
an/listinfo/amd-gfx</a></blockquote></div></div></div>

--000000000000a13dff0591f2af71--

--===============1255588425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1255588425==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 429DBCFE85
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 18:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C95076E84A;
	Tue,  8 Oct 2019 16:06:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE066E846
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 16:06:54 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id d192so6627430ywa.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 09:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Pv1pTOE6zMWmeqzMgeSuh/tpLPChi0rpI4E40WTA+po=;
 b=WgWU/9A/Panv3+erFfGr1NvCsSi/1LECztjWm91if8vpLkN15S1gdTlCl5KRZ0TxtU
 JQdg+3q4P2O9bd/Cipt5v1emDLiX91hnOZN2TdGpYLwdeOem70XfGb9/2nY1oYkwvmUj
 5jzL7+OO0XqksOf2gfq8XN6wDPTg0bS4Jy1ijSIhoLxkkhRN1eouyf3Lbx9xStGm+PTa
 bUXEDx9KNYpioQcT9v5MupxT4dEfGcW8bLBNmkxfY95Q6XvIchWLn/AmMnkqUNxv/Dq4
 sdiv0MXIGizrxEKoZrCJRWDd8ejLNHTRVLtBhBcsEeAZWFDMS7vxiB4TSlR2dP09pUgT
 RY1w==
X-Gm-Message-State: APjAAAX5Tv+OtFMLShltEm7H33f8UHzaB+LPbkmrxJyJTrD+XDopLTkc
 jNE7WIEDi/4V0UgkCRL96pw8kP/0oATyALkcEoEjInCq
X-Google-Smtp-Source: APXvYqxodVnqK/p5bXvnn5H2d/s81nb1rbGypB6g9H23Nab2lZ/Zxmk4cdJyNOCCkRzDAYrS5JrAoIftb7A3smikjMY=
X-Received: by 2002:a0d:e6d3:: with SMTP id
 p202mr25350902ywe.368.1570550813046; 
 Tue, 08 Oct 2019 09:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191001222123.2392-1-jisorce@oblong.com>
In-Reply-To: <20191001222123.2392-1-jisorce@oblong.com>
From: Julien Isorce <julien.isorce@gmail.com>
Date: Tue, 8 Oct 2019 09:06:40 -0700
Message-ID: <CAHWPjbWcdhnewEN8OEUgDu5aBpYBW5tUggA_KJ_BUR8JLvCsQw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use pixel encoding 444 for dongle usb-c
 to hdmi
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Pv1pTOE6zMWmeqzMgeSuh/tpLPChi0rpI4E40WTA+po=;
 b=ax2iQgyijtuNHlu3KD1pFCxnndh+naiRkMiQ4OkrJOpO0CYGLnDkBcn0BPsZlRYOAM
 6K3rLuHDRXzDZLsrImHJ/vgl8nkuI2Go1K9raPhb2XbRSuoy5hE2oX5+tq3OZEnqIn/9
 RMF2/cd27MNYbwQBRabexoOPSo6Fg33TCIrhoIBLJ/kWYt9lsMzUdJd6F7i4Um3uF7et
 rzLuUz4jOfTN5U4bGdH3iP8Kb0nQds4sZSo/NEuyT1TKqrhHw5h7bb9JtT39tk+lyUBl
 KEgvsOZMkF9vwj/i6J0+e2uAX2yykiMYryGwfBYgnPKxBLVO6UlPiBBtkjvAJnK19tKa
 pXqQ==
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
Content-Type: multipart/mixed; boundary="===============1622347671=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1622347671==
Content-Type: multipart/alternative; boundary="000000000000503e320594685bfa"

--000000000000503e320594685bfa
Content-Type: text/plain; charset="UTF-8"

Hi,

Gentle ping ?

Thx
Julien

On Tue, Oct 1, 2019 at 3:21 PM Julien Isorce <julien.isorce@gmail.com>
wrote:

> Fix pinkish color issue around grey areas. This also happens
> when not using any dongle so directly with a usb-c to Display
> Port cable. Meaning there is something wrong when using pixel
> encoding RGB with amd driver in the general case. In the meantime
> just use the same pixel encoding as when using HDMI without dongle.
> This way users will see the same thing on 2 identical screens when
> one is connected with hdmi-to-hdmi and the other is connected with
> usb-c-to-hdmi.
>
> Signed-off-by: Julien Isorce <jisorce@oblong.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index d3f404f097eb..8139dcc0bfba 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3313,6 +3313,7 @@ static void
> fill_stream_properties_from_drm_display_mode(
>  {
>         struct dc_crtc_timing *timing_out = &stream->timing;
>         const struct drm_display_info *info = &connector->display_info;
> +       const struct dc_link *link = stream->sink->link;
>
>         memset(timing_out, 0, sizeof(struct dc_crtc_timing));
>
> @@ -3327,6 +3328,10 @@ static void
> fill_stream_properties_from_drm_display_mode(
>         else if ((connector->display_info.color_formats &
> DRM_COLOR_FORMAT_YCRCB444)
>                         && stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
>                 timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
> +       else if ((connector->display_info.color_formats &
> DRM_COLOR_FORMAT_YCRCB444)
> +                       && stream->sink->sink_signal ==
> SIGNAL_TYPE_DISPLAY_PORT
> +                       && link->dpcd_caps.dongle_type ==
> DISPLAY_DONGLE_DP_HDMI_CONVERTER)
> +               timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
>         else
>                 timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
>
> --
> 2.17.1
>
>

--000000000000503e320594685bfa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Gentle ping ?</div><div>=
<br></div><div>Thx</div><div>Julien</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 1, 2019 at 3:21 PM Julien Is=
orce &lt;<a href=3D"mailto:julien.isorce@gmail.com">julien.isorce@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Fix pinkish color issue around grey areas. This also happens<br>
when not using any dongle so directly with a usb-c to Display<br>
Port cable. Meaning there is something wrong when using pixel<br>
encoding RGB with amd driver in the general case. In the meantime<br>
just use the same pixel encoding as when using HDMI without dongle.<br>
This way users will see the same thing on 2 identical screens when<br>
one is connected with hdmi-to-hdmi and the other is connected with<br>
usb-c-to-hdmi.<br>
<br>
Signed-off-by: Julien Isorce &lt;<a href=3D"mailto:jisorce@oblong.com" targ=
et=3D"_blank">jisorce@oblong.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index d3f404f097eb..8139dcc0bfba 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -3313,6 +3313,7 @@ static void fill_stream_properties_from_drm_display_m=
ode(<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dc_crtc_timing *timing_out =3D &amp;stre=
am-&gt;timing;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_display_info *info =3D &amp;co=
nnector-&gt;display_info;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dc_link *link =3D stream-&gt;sink-=
&gt;link;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(timing_out, 0, sizeof(struct dc_crtc_tim=
ing));<br>
<br>
@@ -3327,6 +3328,10 @@ static void fill_stream_properties_from_drm_display_=
mode(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if ((connector-&gt;display_info.color_form=
ats &amp; DRM_COLOR_FORMAT_YCRCB444)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;&amp; stream-&gt;signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timing_out-&gt;pixe=
l_encoding =3D PIXEL_ENCODING_YCBCR444;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if ((connector-&gt;display_info.color_form=
ats &amp; DRM_COLOR_FORMAT_YCRCB444)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;&amp; stream-&gt;sink-&gt;sink_signal =3D=3D SIGNAL_TYPE_DIS=
PLAY_PORT<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&amp;&amp; link-&gt;dpcd_caps.dongle_type =3D=3D DISPLAY_DONGLE_D=
P_HDMI_CONVERTER)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timing_out-&gt;pixe=
l_encoding =3D PIXEL_ENCODING_YCBCR444;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timing_out-&gt;pixe=
l_encoding =3D PIXEL_ENCODING_RGB;<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000503e320594685bfa--

--===============1622347671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1622347671==--

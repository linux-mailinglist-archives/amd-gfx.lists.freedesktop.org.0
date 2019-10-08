Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC2AD0097
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 20:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2B76E1A4;
	Tue,  8 Oct 2019 18:15:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9986E1A4
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 18:15:53 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id r68so315795ybf.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Oct 2019 11:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bIrUe7JNw83kZRunP6//s9rLppVz7bwKNzsjB1VQD24=;
 b=BPDz99tkbxgYRYXmGJ7wlULz9wqbApPrMSyagP50hfntmmreL3NwwaCSEbbc+5bX6d
 ZTqm09ft2AZyOLBHEoffGjPaaOG0Qkn27L53HrzsCf9FCSst9iKvbTzZN4MpyBVouzrc
 XbUBQ+NVFw6yAFRQ2+f7tynMHUOgDb1fpkeNPHzD03uI94GgKmIFX0enpY0vKTdbmq6s
 vxrCHD/MpM+BT3OvgABHtk0lNHdRnZbK4S1KPkZN1QggE2xGx84zdjKYY1EIE786h8sL
 W9UvJ2PNmUBm03EtJdq/c0taECtwE4mtMWdxsZ2rRYD4laCPGcMePtnIDhVGwKWZ2y4f
 BfHg==
X-Gm-Message-State: APjAAAXHOcQbLkzoSJdoaWIIqncKtdRxAWnZZhd0YZBdQaxDimD/OGx/
 pJAhf/WJTgJj6x8VNcp5DzoRnQIH7ikzvvHKbAs8Hd5eAPo=
X-Google-Smtp-Source: APXvYqz6knTBBrIJp8IYj6uw5FcyD2UttnrrWBALW6W6hT0URg7SaBxThq1oSBZdLer0jiYg1k1elrqs0VwkpcDB4oc=
X-Received: by 2002:a5b:501:: with SMTP id o1mr15828093ybp.378.1570558552398; 
 Tue, 08 Oct 2019 11:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20191001222123.2392-1-jisorce@oblong.com>
 <CAHWPjbWcdhnewEN8OEUgDu5aBpYBW5tUggA_KJ_BUR8JLvCsQw@mail.gmail.com>
 <4610d814-6c54-982e-ecc6-716cc42b5e68@amd.com>
In-Reply-To: <4610d814-6c54-982e-ecc6-716cc42b5e68@amd.com>
From: Julien Isorce <julien.isorce@gmail.com>
Date: Tue, 8 Oct 2019 11:15:41 -0700
Message-ID: <CAHWPjbXPL9NsT0yXb8_wkodT18TEBcgf81tY49GP+U=SGZ26YQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use pixel encoding 444 for dongle usb-c
 to hdmi
To: Harry Wentland <hwentlan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=bIrUe7JNw83kZRunP6//s9rLppVz7bwKNzsjB1VQD24=;
 b=E4P1KQhZtFS+YX/x2DL+5HylpM4oZANNHiloWPAinZPRt+k4miYQeUyDVp3yUTWfiL
 mXvvVcKqco2evF8qhN8XCB8WMvIElRUJtVrei0g6KpI/DkC6gQhGEObFRRkOgMN1xykZ
 a7ZIGuW+b7n0ZvXgoOG4YMCWIB6NtOS4bjTyVWljEBwML0SBBk3U9UwgHPOlm0HnEK8L
 G08BHMwFwyim96E3CMG9WsXZXoy8NkaGnl34EUYZGpgiwTJ6EVnj9EE8z+by4YYMiANk
 8U7ItH8UpvC9a2ofCCioSUFYdMkKazwoX7bGdoHefvQnzcrnRI3zGgsNmbT3LH9+nQHC
 GjxA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1243935637=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1243935637==
Content-Type: multipart/alternative; boundary="0000000000009d60d105946a281a"

--0000000000009d60d105946a281a
Content-Type: text/plain; charset="UTF-8"

Hi Harry,

I can reproduce on LG, Samsung and NEC monitors.

"Have you checked whether the driver picks RGB or YCBCR420 without your
patch?" -> it was selecting RGB .

For example on https://commons.wikimedia.org/wiki/File:Gray_scale.jpg , the
second band from the left, will be entirely pinkish.
Since the issue also happens without dongle, so with a direct cable from
the miniDP from the graphic card to DisplayPort on the screen I think there
is more serious issue with RGB output in amdgpu. But it is not easy to
reproduce, you should try on above image.

In any case, the goal with the patch is just to get the same output when
using 2 screens at the same time, one connected to hdmi output of the
graphic card and one connected  to usb-c to graphic card (hdmi cable with
dongle). So prior this patch, the first one would use YCbCr 444 and the
second would use RGB.
After this patch, both will use YCbCr 444 (both are hdmi).
The patch does not change the case for miniDP to DisplayPort, the driver
will still use RGB. Because maybe the RGB issue is also specific to that
graphic card which
is VEGA"M". So that is why the patch only tries to match hdmi cases
together, whether it is direct connection or through usb-c.

-
Julien



On Tue, Oct 8, 2019 at 10:44 AM Harry Wentland <hwentlan@amd.com> wrote:

> Hi Julien,
>
> curious which monitor you're using.
>
> Have you checked whether the driver picks RGB or YCBCR420 without your
> patch?
>
> I'm not sure I understand how the pinkish color issue looks. Do you see
> a pinkish color at the transition from grey to another color? Or is the
> entire grey area pinkish?
>
> Thanks,
> Harry
>
> On 2019-10-08 12:06 p.m., Julien Isorce wrote:
> > Hi,
> >
> > Gentle ping ?
> >
> > Thx
> > Julien
> >
> > On Tue, Oct 1, 2019 at 3:21 PM Julien Isorce <julien.isorce@gmail.com
> > <mailto:julien.isorce@gmail.com>> wrote:
> >
> >     Fix pinkish color issue around grey areas. This also happens
> >     when not using any dongle so directly with a usb-c to Display
> >     Port cable. Meaning there is something wrong when using pixel
> >     encoding RGB with amd driver in the general case. In the meantime
> >     just use the same pixel encoding as when using HDMI without dongle.
> >     This way users will see the same thing on 2 identical screens when
> >     one is connected with hdmi-to-hdmi and the other is connected with
> >     usb-c-to-hdmi.
> >
> >     Signed-off-by: Julien Isorce <jisorce@oblong.com
> >     <mailto:jisorce@oblong.com>>
> >     ---
> >      drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++++
> >      1 file changed, 5 insertions(+)
> >
> >     diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >     b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >     index d3f404f097eb..8139dcc0bfba 100644
> >     --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >     +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> >     @@ -3313,6 +3313,7 @@ static void
> >     fill_stream_properties_from_drm_display_mode(
> >      {
> >             struct dc_crtc_timing *timing_out = &stream->timing;
> >             const struct drm_display_info *info =
> &connector->display_info;
> >     +       const struct dc_link *link = stream->sink->link;
> >
> >             memset(timing_out, 0, sizeof(struct dc_crtc_timing));
> >
> >     @@ -3327,6 +3328,10 @@ static void
> >     fill_stream_properties_from_drm_display_mode(
> >             else if ((connector->display_info.color_formats &
> >     DRM_COLOR_FORMAT_YCRCB444)
> >                             && stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
> >                     timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
> >     +       else if ((connector->display_info.color_formats &
> >     DRM_COLOR_FORMAT_YCRCB444)
> >     +                       && stream->sink->sink_signal ==
> >     SIGNAL_TYPE_DISPLAY_PORT
> >     +                       && link->dpcd_caps.dongle_type ==
> >     DISPLAY_DONGLE_DP_HDMI_CONVERTER)
> >     +               timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR444;
> >             else
> >                     timing_out->pixel_encoding = PIXEL_ENCODING_RGB;
> >
> >     --
> >     2.17.1
> >
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> >
>

--0000000000009d60d105946a281a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Harry,<div><br></div><div>I can reproduce on LG, Samsun=
g and NEC monitors.</div><div><br></div><div>&quot;Have you checked whether=
 the driver picks RGB or YCBCR420 without your<br>patch?&quot; -&gt; it was=
 selecting RGB .<br></div><div><br></div><div>For example on <a href=3D"htt=
ps://commons.wikimedia.org/wiki/File:Gray_scale.jpg">https://commons.wikime=
dia.org/wiki/File:Gray_scale.jpg</a> , the second band from the left, will =
be entirely pinkish.<br></div><div>Since the issue also happens without don=
gle, so with a direct cable from the miniDP from the graphic card to Displa=
yPort on the screen I think there is more serious issue with RGB output in =
amdgpu. But it is not easy to reproduce, you should try on above image.</di=
v><div><br></div><div>In any case, the goal with the patch is just to get t=
he same output when using 2 screens at the same time, one connected to hdmi=
 output of the graphic card and one connected=C2=A0 to usb-c to graphic car=
d (hdmi cable with dongle). So prior this patch, the first one would use YC=
bCr 444 and the second would use RGB.</div><div>After this patch, both will=
 use=C2=A0YCbCr 444 (both are hdmi).</div><div>The patch does not change th=
e case for miniDP to DisplayPort, the driver will still use RGB. Because ma=
ybe the RGB issue is also specific to that graphic card which</div><div>is=
=C2=A0VEGA&quot;M&quot;. So that is why the patch only tries to match hdmi =
cases together, whether it is direct connection or through usb-c.</div><div=
><br></div><div>-</div><div>Julien</div><div><br></div><div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, Oct 8, 2019 at 10:44 AM Harry Wentland &lt;<a href=3D"mailto:hwentlan@am=
d.com">hwentlan@amd.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Hi Julien,<br>
<br>
curious which monitor you&#39;re using.<br>
<br>
Have you checked whether the driver picks RGB or YCBCR420 without your<br>
patch?<br>
<br>
I&#39;m not sure I understand how the pinkish color issue looks. Do you see=
<br>
a pinkish color at the transition from grey to another color? Or is the<br>
entire grey area pinkish?<br>
<br>
Thanks,<br>
Harry<br>
<br>
On 2019-10-08 12:06 p.m., Julien Isorce wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Gentle ping ?<br>
&gt; <br>
&gt; Thx<br>
&gt; Julien<br>
&gt; <br>
&gt; On Tue, Oct 1, 2019 at 3:21 PM Julien Isorce &lt;<a href=3D"mailto:jul=
ien.isorce@gmail.com" target=3D"_blank">julien.isorce@gmail.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:julien.isorce@gmail.com" target=3D"_blank=
">julien.isorce@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Fix pinkish color issue around grey areas. This als=
o happens<br>
&gt;=C2=A0 =C2=A0 =C2=A0when not using any dongle so directly with a usb-c =
to Display<br>
&gt;=C2=A0 =C2=A0 =C2=A0Port cable. Meaning there is something wrong when u=
sing pixel<br>
&gt;=C2=A0 =C2=A0 =C2=A0encoding RGB with amd driver in the general case. I=
n the meantime<br>
&gt;=C2=A0 =C2=A0 =C2=A0just use the same pixel encoding as when using HDMI=
 without dongle.<br>
&gt;=C2=A0 =C2=A0 =C2=A0This way users will see the same thing on 2 identic=
al screens when<br>
&gt;=C2=A0 =C2=A0 =C2=A0one is connected with hdmi-to-hdmi and the other is=
 connected with<br>
&gt;=C2=A0 =C2=A0 =C2=A0usb-c-to-hdmi.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Julien Isorce &lt;<a href=3D"mailto:=
jisorce@oblong.com" target=3D"_blank">jisorce@oblong.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jisorce@oblong.com" ta=
rget=3D"_blank">jisorce@oblong.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_=
dm.c | 5 +++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 5 insertions(+)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/=
amdgpu_dm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0index d3f404f097eb..8139dcc0bfba 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_=
dm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_=
dm.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -3313,6 +3313,7 @@ static void<br>
&gt;=C2=A0 =C2=A0 =C2=A0fill_stream_properties_from_drm_display_mode(<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct dc_crtc_timing *=
timing_out =3D &amp;stream-&gt;timing;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct drm_displa=
y_info *info =3D &amp;connector-&gt;display_info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct dc_link *l=
ink =3D stream-&gt;sink-&gt;link;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(timing_out, 0, s=
izeof(struct dc_crtc_timing));<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -3327,6 +3328,10 @@ static void<br>
&gt;=C2=A0 =C2=A0 =C2=A0fill_stream_properties_from_drm_display_mode(<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if ((connector-&gt=
;display_info.color_formats &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_COLOR_FORMAT_YCRCB444)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; stream-&gt;signal =3D=3D SIGN=
AL_TYPE_HDMI_TYPE_A)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 timing_out-&gt;pixel_encoding =3D PIXEL_ENCODING_YCBCR444;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if ((connector-&gt=
;display_info.color_formats &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_COLOR_FORMAT_YCRCB444)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; stream-&gt;sink-&gt;sink_signa=
l =3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0SIGNAL_TYPE_DISPLAY_PORT<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; link-&gt;dpcd_caps.dongle_type=
 =3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0DISPLAY_DONGLE_DP_HDMI_CONVERTER)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0timing_out-&gt;pixel_encoding =3D PIXEL_ENCODING_YCBCR444;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 timing_out-&gt;pixel_encoding =3D PIXEL_ENCODING_RGB;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.17.1<br>
&gt; <br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; <a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd=
-gfx@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/lis=
tinfo/amd-gfx</a><br>
&gt; <br>
</blockquote></div>

--0000000000009d60d105946a281a--

--===============1243935637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1243935637==--

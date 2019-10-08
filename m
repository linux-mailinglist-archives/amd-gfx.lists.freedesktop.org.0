Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919ECFFD9
	for <lists+amd-gfx@lfdr.de>; Tue,  8 Oct 2019 19:28:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03B26E87C;
	Tue,  8 Oct 2019 17:28:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710086.outbound.protection.outlook.com [40.107.71.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55126E87C
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Oct 2019 17:28:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5juHP3NdHokWIr8YANm/d0zzwB9ZO5j7zYcJgOIc7okMgBHe6t9nrvbeaw1YWcvzzKs1rMcbewLPN58/ar6KgwcwMNHHzn/3ivpeBNpZxignswxqXhDuNucMmOQawCDD1xQZhoB76d+Epu67dplPQgPqGzXqVMH9hfuK2HQOOPwtEu7YQ2jKpbn07dbtr3JNt++ps3TjmqMSCcDAIRvOLaYDBulwNiD6GaIEbmkc8bvWujlYk0lNVARUtagk7feIvTqU7viyx6sLUET2XRsYT7Xl6lLVEYnRdM7Vemenp9bv3CwoENmVHAHeZVnndAIMHHLTrswSkOXA0jftKNMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJbBVnuUJA4sRHF0KGcvDMrk9O/IPsrH5lzDQVej1Ik=;
 b=VD5xclhPWy7PfnZPO1RWv+0YHkVbZYJMxB8/MMPwEUGF/wwt1u0nXMdzcksRCcorKyq2a39EdjsPcqAfFru+QxZpmF53fIX2d522UQo+5f+UNIKfIguoWn3vudie3u0jzQP8ls6sU+hhb2sBuoH8h6XskiKt1XjSjDVP1zdvglobVfMzQCjhoaezEKk7dl/5Z8JZLXONnp0teTgVLGi4QNWT+behUgCC0FondyhMYj1HG3B2NO1+NoZmgAm/wyEhHr1MlEYpcBWdhgbWiT8IfojvWTzKcs9TJ+PEh9B5nDi4K/PFN2a4v/IrN62Yn5TPMEWdxf6vZfMgEpt7kM8isA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1820.namprd12.prod.outlook.com (10.175.88.143) by
 DM5PR12MB1452.namprd12.prod.outlook.com (10.172.37.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 17:28:44 +0000
Received: from DM5PR12MB1820.namprd12.prod.outlook.com
 ([fe80::cdcf:e46c:3b50:5e68]) by DM5PR12MB1820.namprd12.prod.outlook.com
 ([fe80::cdcf:e46c:3b50:5e68%5]) with mapi id 15.20.2305.023; Tue, 8 Oct 2019
 17:28:44 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Julien Isorce <julien.isorce@gmail.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>
Subject: Re: [PATCH] drm/amd/display: Use pixel encoding 444 for dongle usb-c
 to hdmi
Thread-Topic: [PATCH] drm/amd/display: Use pixel encoding 444 for dongle usb-c
 to hdmi
Thread-Index: AQHVeKaYGN2IZujZNEKIZrxXDBubsqdQ83AAgAAWzOI=
Date: Tue, 8 Oct 2019 17:28:44 +0000
Message-ID: <DM5PR12MB1820556F9855FDC376F4B6DDF79A0@DM5PR12MB1820.namprd12.prod.outlook.com>
References: <20191001222123.2392-1-jisorce@oblong.com>,
 <CAHWPjbWcdhnewEN8OEUgDu5aBpYBW5tUggA_KJ_BUR8JLvCsQw@mail.gmail.com>
In-Reply-To: <CAHWPjbWcdhnewEN8OEUgDu5aBpYBW5tUggA_KJ_BUR8JLvCsQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.171.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61241b61-b9fc-4595-372a-08d74c14f85c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1452:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1452E9299B17489169F54564F79A0@DM5PR12MB1452.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(189003)(199004)(55674003)(6246003)(54896002)(55016002)(11346002)(71190400001)(71200400001)(7696005)(99286004)(446003)(476003)(229853002)(19627405001)(6636002)(486006)(236005)(9686003)(8936002)(25786009)(76176011)(76116006)(256004)(6436002)(102836004)(5660300002)(2906002)(6116002)(66946007)(33656002)(110136005)(7736002)(316002)(66476007)(64756008)(66556008)(66446008)(6506007)(52536014)(81166006)(81156014)(26005)(8676002)(105004)(14454004)(186003)(3846002)(74316002)(478600001)(86362001)(66066001)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1452;
 H:DM5PR12MB1820.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rUwjrTPqcFRHjEIHRQ5LFwSUqR/0pvgfvmE6OPSeWMIJ9GGxrj5jErnX494scx3RfVzWrSoSXdf/4CF2j//wvI9OctQOTFyfjiI0Ppk8uavNzr+WWVuyQZ0IJz2RW85W1rOutSxpFFy2q9GWXqIBu7AMc04iaIXKb40z677ajzhOkgj+RmRo5gVwKN+icZgSCTN+mlzdch3IAv7rL30vv7PNN2ArAAhaSub5gehU7ezARCPt38JOzFuTRTU8im8JRQBLl3ZG5Smym1u3wyKcCBrUCjijScj8gB9M6sbLJH+jdS+dOcGIZzmIMTNCEsdHWIp3jcKP/TkHoIdi/M5aoWSNxXRgk/efTDM8bFubSwLxM59KnSmp9iMePFLknySEFiLZk93elr//HTkbD6CLrVQWg3X+8pvoWt8Pyr2EaoA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61241b61-b9fc-4595-372a-08d74c14f85c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 17:28:44.3185 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZDvJWz5o8uN9xkOKGXC1hrne0uYD3d3FN/8ZOkiX3kXluADx/H0amzyPnaGD95x7TInVqWXun1Hh9QeeJtNY/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1452
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJbBVnuUJA4sRHF0KGcvDMrk9O/IPsrH5lzDQVej1Ik=;
 b=iJI+4O6XQCTsu1n932taXYjKcjxWC4W1DlvU/VUr5uFLDJWhr1wJXDLTJep3mx1ahul6wMt0w6+5CIU+8BpO9lGGd4j6VmU74HAihMnerbKcOYfAKSelzITmZJ1JznvGprGCjyp2phqqFK6kMfNq+IAm0jjWtmE7JC0TOpDyV1U=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0510463134=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0510463134==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB1820556F9855FDC376F4B6DDF79A0DM5PR12MB1820namp_"

--_000_DM5PR12MB1820556F9855FDC376F4B6DDF79A0DM5PR12MB1820namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

+ some display folks.
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Julien I=
sorce <julien.isorce@gmail.com>
Sent: Tuesday, October 8, 2019 12:06 PM
To: amd-gfx list <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Use pixel encoding 444 for dongle usb=
-c to hdmi

Hi,

Gentle ping ?

Thx
Julien

On Tue, Oct 1, 2019 at 3:21 PM Julien Isorce <julien.isorce@gmail.com<mailt=
o:julien.isorce@gmail.com>> wrote:
Fix pinkish color issue around grey areas. This also happens
when not using any dongle so directly with a usb-c to Display
Port cable. Meaning there is something wrong when using pixel
encoding RGB with amd driver in the general case. In the meantime
just use the same pixel encoding as when using HDMI without dongle.
This way users will see the same thing on 2 identical screens when
one is connected with hdmi-to-hdmi and the other is connected with
usb-c-to-hdmi.

Signed-off-by: Julien Isorce <jisorce@oblong.com<mailto:jisorce@oblong.com>=
>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d3f404f097eb..8139dcc0bfba 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3313,6 +3313,7 @@ static void fill_stream_properties_from_drm_display_m=
ode(
 {
        struct dc_crtc_timing *timing_out =3D &stream->timing;
        const struct drm_display_info *info =3D &connector->display_info;
+       const struct dc_link *link =3D stream->sink->link;

        memset(timing_out, 0, sizeof(struct dc_crtc_timing));

@@ -3327,6 +3328,10 @@ static void fill_stream_properties_from_drm_display_=
mode(
        else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_=
YCRCB444)
                        && stream->signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A)
                timing_out->pixel_encoding =3D PIXEL_ENCODING_YCBCR444;
+       else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_=
YCRCB444)
+                       && stream->sink->sink_signal =3D=3D SIGNAL_TYPE_DIS=
PLAY_PORT
+                       && link->dpcd_caps.dongle_type =3D=3D DISPLAY_DONGL=
E_DP_HDMI_CONVERTER)
+               timing_out->pixel_encoding =3D PIXEL_ENCODING_YCBCR444;
        else
                timing_out->pixel_encoding =3D PIXEL_ENCODING_RGB;

--
2.17.1


--_000_DM5PR12MB1820556F9855FDC376F4B6DDF79A0DM5PR12MB1820namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&#43; some display folks.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Julien Isorce &lt;julien.isor=
ce@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, October 8, 2019 12:06 PM<br>
<b>To:</b> amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/display: Use pixel encoding 444 for don=
gle usb-c to hdmi</font>
<div>&nbsp;</div>
</div>
<div>
<div dir=3D"ltr">
<div>Hi,</div>
<div><br>
</div>
<div>Gentle ping ?</div>
<div><br>
</div>
<div>Thx</div>
<div>Julien</div>
<br>
<div class=3D"x_gmail_quote">
<div dir=3D"ltr" class=3D"x_gmail_attr">On Tue, Oct 1, 2019 at 3:21 PM Juli=
en Isorce &lt;<a href=3D"mailto:julien.isorce@gmail.com">julien.isorce@gmai=
l.com</a>&gt; wrote:<br>
</div>
<blockquote class=3D"x_gmail_quote" style=3D"margin:0px 0px 0px 0.8ex; bord=
er-left:1px solid rgb(204,204,204); padding-left:1ex">
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
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 5 &#43;&#43;&#43;=
&#43;&#43;<br>
&nbsp;1 file changed, 5 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index d3f404f097eb..8139dcc0bfba 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -3313,6 &#43;3313,7 @@ static void fill_stream_properties_from_drm_displ=
ay_mode(<br>
&nbsp;{<br>
&nbsp; &nbsp; &nbsp; &nbsp; struct dc_crtc_timing *timing_out =3D &amp;stre=
am-&gt;timing;<br>
&nbsp; &nbsp; &nbsp; &nbsp; const struct drm_display_info *info =3D &amp;co=
nnector-&gt;display_info;<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;const struct dc_link *link =3D stream-&gt;s=
ink-&gt;link;<br>
<br>
&nbsp; &nbsp; &nbsp; &nbsp; memset(timing_out, 0, sizeof(struct dc_crtc_tim=
ing));<br>
<br>
@@ -3327,6 &#43;3328,10 @@ static void fill_stream_properties_from_drm_disp=
lay_mode(<br>
&nbsp; &nbsp; &nbsp; &nbsp; else if ((connector-&gt;display_info.color_form=
ats &amp; DRM_COLOR_FORMAT_YCRCB444)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &amp;&amp; stream-&gt;signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A)<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; timing_out-&gt;pixe=
l_encoding =3D PIXEL_ENCODING_YCBCR444;<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp;else if ((connector-&gt;display_info.color_=
formats &amp; DRM_COLOR_FORMAT_YCRCB444)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&amp;&amp; stream-&gt;sink-&gt;sink_signal =3D=3D SIGNAL_TYPE_=
DISPLAY_PORT<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&amp;&amp; link-&gt;dpcd_caps.dongle_type =3D=3D DISPLAY_DONGL=
E_DP_HDMI_CONVERTER)<br>
&#43;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;timing_out-&gt;=
pixel_encoding =3D PIXEL_ENCODING_YCBCR444;<br>
&nbsp; &nbsp; &nbsp; &nbsp; else<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; timing_out-&gt;pixe=
l_encoding =3D PIXEL_ENCODING_RGB;<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB1820556F9855FDC376F4B6DDF79A0DM5PR12MB1820namp_--

--===============0510463134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0510463134==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF00D45E57
	for <lists+amd-gfx@lfdr.de>; Fri, 14 Jun 2019 15:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FCB898B7;
	Fri, 14 Jun 2019 13:37:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770070.outbound.protection.outlook.com [40.107.77.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5643E8989A
 for <amd-gfx@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:18 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1540.namprd12.prod.outlook.com (10.172.17.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Fri, 14 Jun 2019 13:37:16 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1987.012; Fri, 14 Jun 2019
 13:37:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH xf86-video-ati 3/3] Remove dri2_drawable_crtc parameter
 consider_disabled
Thread-Topic: [PATCH xf86-video-ati 3/3] Remove dri2_drawable_crtc parameter
 consider_disabled
Thread-Index: AQHVIpNxGPIG25FotUGXuGNDQamfi6abJ1e/
Date: Fri, 14 Jun 2019 13:37:16 +0000
Message-ID: <BN6PR12MB1809A51AC1ED562BDED9AEAEF7EE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190614092745.4488-1-michel@daenzer.net>,
 <20190614092745.4488-3-michel@daenzer.net>
In-Reply-To: <20190614092745.4488-3-michel@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0dddc70c-e3ae-45d8-8fd9-08d6f0cd6aa2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1540; 
x-ms-traffictypediagnostic: BN6PR12MB1540:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1540D4F096DD0ADB03ED223AF7EE0@BN6PR12MB1540.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:69;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(396003)(376002)(366004)(189003)(199004)(2501003)(66446008)(14444005)(256004)(6246003)(53936002)(8936002)(74316002)(26005)(186003)(81166006)(81156014)(8676002)(73956011)(7696005)(53546011)(25786009)(66946007)(76116006)(71200400001)(102836004)(66476007)(66556008)(64756008)(6506007)(19627405001)(316002)(76176011)(33656002)(66066001)(7736002)(71190400001)(68736007)(99286004)(606006)(66574012)(86362001)(2906002)(72206003)(110136005)(966005)(14454004)(5660300002)(446003)(476003)(486006)(11346002)(52536014)(6436002)(229853002)(478600001)(55016002)(6306002)(9686003)(54896002)(105004)(236005)(3846002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1540;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tUZoCjeUkAxLj5cQ61IieccxEvmZjlureC//FMPtFB6Ljt+1zE5Rj/abiypY9clHGxM6FLo7smhSgcBrsU6PwpqRfYnvzgBqEBiBLdGW7t+JptnLeGKq0ESorHFQyPVLoDOOci5HSpVJPCGruJo+KJ9ADtEPVDRxJeFeExpXPj+9kvhdaokTv0mO5FFEFtBYjkiSmIVejPhKqDAJVFA1wnhIl8zkD3P7pH5FAtK8hKRPjxFk3vFMENJrYmogV8UB3x3wQ1T6zzUSxo0hguy0JJyJbJUZD7e+6KL5StOpj0GNSKpsUx3PWBgJdmukOaTSYOnpyXqpLYLrS0i6SvCcBPV0y0hkahT4Eo0o5eX1j3IANqQxkT1rp1jVjAAVL3yZiHirDRx4FTvoe9m3vLXmlsu1tOEcFZLlC0wK8Qo4tcQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dddc70c-e3ae-45d8-8fd9-08d6f0cd6aa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 13:37:16.5832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1540
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqFvQ8VsOE0Ofi1FBLGS6iYmU6TwTNInLdbULrOabwA=;
 b=pFxMmP1hx+gr2HTIic1Kse8Od4Ouv+YAAff7YipAq3DVha2EGs32yroJfssBC56gfu5iJ8UmGn2/Q/SMEkprZtNyjI7MVpl54A4xb3/G5RAoCG0TVXMXjN4WWY/QshSuNHt3j7f6bawfhfVVkSshfGfJojnR2OgIZgfJPuVNbK8=
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
Content-Type: multipart/mixed; boundary="===============1876992852=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1876992852==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809A51AC1ED562BDED9AEAEF7EE0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809A51AC1ED562BDED9AEAEF7EE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Michel D=
=E4nzer <michel@daenzer.net>
Sent: Friday, June 14, 2019 5:27 AM
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH xf86-video-ati 3/3] Remove dri2_drawable_crtc parameter con=
sider_disabled

From: Michel D=E4nzer <michel.daenzer@amd.com>

All callers were passing TRUE.

(Ported from amdgpu commit ea19a5207054bb159fc7fb6d88e0ceb10c3da010)

Signed-off-by: Michel D=E4nzer <michel.daenzer@amd.com>
---
 src/radeon_dri2.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/radeon_dri2.c b/src/radeon_dri2.c
index c59d799ff..66a223d87 100644
--- a/src/radeon_dri2.c
+++ b/src/radeon_dri2.c
@@ -509,11 +509,11 @@ static Bool radeon_dri2_get_crtc_msc(xf86CrtcPtr crtc=
, CARD64 *ust, CARD64 *msc)
 }

 static
-xf86CrtcPtr radeon_dri2_drawable_crtc(DrawablePtr pDraw, Bool consider_dis=
abled)
+xf86CrtcPtr radeon_dri2_drawable_crtc(DrawablePtr pDraw)
 {
     ScreenPtr pScreen =3D pDraw->pScreen;
     ScrnInfoPtr pScrn =3D xf86ScreenToScrn(pScreen);
-    xf86CrtcPtr crtc =3D radeon_pick_best_crtc(pScrn, consider_disabled,
+    xf86CrtcPtr crtc =3D radeon_pick_best_crtc(pScrn, TRUE,
                                               pDraw->x, pDraw->x + pDraw->=
width,
                                               pDraw->y, pDraw->y + pDraw->=
height);

@@ -928,7 +928,7 @@ CARD32 radeon_dri2_extrapolate_msc_delay(xf86CrtcPtr cr=
tc, CARD64 *target_msc,
  */
 static int radeon_dri2_get_msc(DrawablePtr draw, CARD64 *ust, CARD64 *msc)
 {
-    xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw, TRUE);
+    xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw);

     /* Drawable not displayed, make up a value */
     if (!crtc) {
@@ -1043,7 +1043,7 @@ static int radeon_dri2_schedule_wait_msc(ClientPtr cl=
ient, DrawablePtr draw,
     ScrnInfoPtr scrn =3D xf86ScreenToScrn(screen);
     DRI2FrameEventPtr wait_info =3D NULL;
     uintptr_t drm_queue_seq =3D 0;
-    xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw, TRUE);
+    xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw);
     uint32_t msc_delta;
     uint32_t seq;
     CARD64 current_msc;
@@ -1192,7 +1192,7 @@ static int radeon_dri2_schedule_swap(ClientPtr client=
, DrawablePtr draw,
 {
     ScreenPtr screen =3D draw->pScreen;
     ScrnInfoPtr scrn =3D xf86ScreenToScrn(screen);
-    xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw, TRUE);
+    xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw);
     uint32_t msc_delta;
     drmVBlankSeqType type;
     uint32_t seq;
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809A51AC1ED562BDED9AEAEF7EE0BN6PR12MB1809namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Michel D=E4nzer &lt;michel@da=
enzer.net&gt;<br>
<b>Sent:</b> Friday, June 14, 2019 5:27 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Subject:</b> [PATCH xf86-video-ati 3/3] Remove dri2_drawable_crtc parame=
ter consider_disabled</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Michel D=E4nzer &lt;michel.daenzer@amd.com&g=
t;<br>
<br>
All callers were passing TRUE.<br>
<br>
(Ported from amdgpu commit ea19a5207054bb159fc7fb6d88e0ceb10c3da010)<br>
<br>
Signed-off-by: Michel D=E4nzer &lt;michel.daenzer@amd.com&gt;<br>
---<br>
&nbsp;src/radeon_dri2.c | 10 &#43;&#43;&#43;&#43;&#43;-----<br>
&nbsp;1 file changed, 5 insertions(&#43;), 5 deletions(-)<br>
<br>
diff --git a/src/radeon_dri2.c b/src/radeon_dri2.c<br>
index c59d799ff..66a223d87 100644<br>
--- a/src/radeon_dri2.c<br>
&#43;&#43;&#43; b/src/radeon_dri2.c<br>
@@ -509,11 &#43;509,11 @@ static Bool radeon_dri2_get_crtc_msc(xf86CrtcPtr =
crtc, CARD64 *ust, CARD64 *msc)<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;static<br>
-xf86CrtcPtr radeon_dri2_drawable_crtc(DrawablePtr pDraw, Bool consider_dis=
abled)<br>
&#43;xf86CrtcPtr radeon_dri2_drawable_crtc(DrawablePtr pDraw)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; ScreenPtr pScreen =3D pDraw-&gt;pScreen;<br>
&nbsp;&nbsp;&nbsp;&nbsp; ScrnInfoPtr pScrn =3D xf86ScreenToScrn(pScreen);<b=
r>
-&nbsp;&nbsp;&nbsp; xf86CrtcPtr crtc =3D radeon_pick_best_crtc(pScrn, consi=
der_disabled,<br>
&#43;&nbsp;&nbsp;&nbsp; xf86CrtcPtr crtc =3D radeon_pick_best_crtc(pScrn, T=
RUE,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pDraw-&gt;x, pDraw-&gt;=
x &#43; pDraw-&gt;width,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pDraw-&gt;y, pDraw-&gt;=
y &#43; pDraw-&gt;height);<br>
&nbsp;<br>
@@ -928,7 &#43;928,7 @@ CARD32 radeon_dri2_extrapolate_msc_delay(xf86CrtcPt=
r crtc, CARD64 *target_msc,<br>
&nbsp; */<br>
&nbsp;static int radeon_dri2_get_msc(DrawablePtr draw, CARD64 *ust, CARD64 =
*msc)<br>
&nbsp;{<br>
-&nbsp;&nbsp;&nbsp; xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw, TR=
UE);<br>
&#43;&nbsp;&nbsp;&nbsp; xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw=
);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; /* Drawable not displayed, make up a value */<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (!crtc) {<br>
@@ -1043,7 &#43;1043,7 @@ static int radeon_dri2_schedule_wait_msc(ClientPt=
r client, DrawablePtr draw,<br>
&nbsp;&nbsp;&nbsp;&nbsp; ScrnInfoPtr scrn =3D xf86ScreenToScrn(screen);<br>
&nbsp;&nbsp;&nbsp;&nbsp; DRI2FrameEventPtr wait_info =3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp; uintptr_t drm_queue_seq =3D 0;<br>
-&nbsp;&nbsp;&nbsp; xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw, TR=
UE);<br>
&#43;&nbsp;&nbsp;&nbsp; xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint32_t msc_delta;<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint32_t seq;<br>
&nbsp;&nbsp;&nbsp;&nbsp; CARD64 current_msc;<br>
@@ -1192,7 &#43;1192,7 @@ static int radeon_dri2_schedule_swap(ClientPtr cl=
ient, DrawablePtr draw,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp; ScreenPtr screen =3D draw-&gt;pScreen;<br>
&nbsp;&nbsp;&nbsp;&nbsp; ScrnInfoPtr scrn =3D xf86ScreenToScrn(screen);<br>
-&nbsp;&nbsp;&nbsp; xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw, TR=
UE);<br>
&#43;&nbsp;&nbsp;&nbsp; xf86CrtcPtr crtc =3D radeon_dri2_drawable_crtc(draw=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint32_t msc_delta;<br>
&nbsp;&nbsp;&nbsp;&nbsp; drmVBlankSeqType type;<br>
&nbsp;&nbsp;&nbsp;&nbsp; uint32_t seq;<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809A51AC1ED562BDED9AEAEF7EE0BN6PR12MB1809namp_--

--===============1876992852==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1876992852==--

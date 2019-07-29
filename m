Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3392790AD
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Jul 2019 18:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802356E0C2;
	Mon, 29 Jul 2019 16:21:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680052.outbound.protection.outlook.com [40.107.68.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CA46E0BA
 for <amd-gfx@lists.freedesktop.org>; Mon, 29 Jul 2019 16:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VwuanEBASharaiUFKNiH1alLos6Ut/vfYpTck7xdibmxsjPp9gEq76tSurOHZkhb01yLVD1TDxT3IVQVTCjJhUOtPkug6eoCJs80+naQsSLvQHEHCmPNfOfw95GRT2CVy3cv1KCGj6EHx5DXxF+YZK64IKNlUc1QzpOEtA9zlsZ+xCJjNPeqAsm9c96VFxOEnca7ErNYNJF7lL90qdxClkC8pbxGSw5P6Z4d0FxOOcfZehZUo7orng4gku9kycRf7yJ355ft1YO9zo7/RI4RXcoR7SyNZAqm5zc/XSIu3CGnMv7Xt+wksTSgR5DlFba1yOIrUgdfnOFBO4TuwopvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hEJk1Zq5QfsLN6ztusjRyUshp3MQSi71+ZxPW2iqj4=;
 b=Rta54E+AkPjYc53w4BGxOGgmfxKL32J02/Wk6O7LbYMdGI3BbvUUl7vuJacatFD15QN6tn609855VHIuwGX/m1Z9SXbXwLrFvBzkvChdVPJNLn1l/2QxE+Yjll8snQZAY7bAfjNeNMRhaExAdgt0u0kCAh8OZLayBdED9dhkpFxFys1SOMOwIycYawE0I9iOAdh0/ZvYpkz57LTotU4soLAbSw/zd6Qm7+U+MjhxbeVyzhsmdiAphWo0fL+ZFrkl8XvHSzQP8qgHAYszCKPOMDr2f6cV4LbFPrsMXMmjysN2IdOJ/5u6FOIZ42pi8gNGWXB3v5lliUMiR+l/WHBc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1491.namprd12.prod.outlook.com (10.172.18.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Mon, 29 Jul 2019 16:21:33 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.013; Mon, 29 Jul
 2019 16:21:33 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?iso-8859-1?Q?Michel_D=E4nzer?= <michel@daenzer.net>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Update pitch on page flips without DC as well
Thread-Topic: [PATCH] drm/amdgpu: Update pitch on page flips without DC as well
Thread-Index: AQHVRimE9rRzfaZnlkK8azQWkuQ7VabhxvcU
Date: Mon, 29 Jul 2019 16:21:33 +0000
Message-ID: <BN6PR12MB180983B728C323E624827F6BF7DD0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190729162014.9476-1-michel@daenzer.net>
In-Reply-To: <20190729162014.9476-1-michel@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.222.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad9bacc8-9aa8-4291-4109-08d71440d25f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1491; 
x-ms-traffictypediagnostic: BN6PR12MB1491:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR12MB14913F2E0F54B95BE485AB47F7DD0@BN6PR12MB1491.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01136D2D90
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(189003)(199004)(186003)(5660300002)(86362001)(110136005)(55016002)(6436002)(3846002)(52536014)(102836004)(76176011)(6246003)(66574012)(446003)(14454004)(15650500001)(6116002)(105004)(71190400001)(7696005)(71200400001)(229853002)(54896002)(26005)(6306002)(9686003)(53546011)(2906002)(53936002)(6506007)(236005)(316002)(25786009)(64756008)(66476007)(8676002)(81156014)(81166006)(74316002)(99286004)(7736002)(606006)(76116006)(66946007)(8936002)(66556008)(66446008)(19627405001)(68736007)(66066001)(966005)(2501003)(14444005)(476003)(256004)(478600001)(11346002)(486006)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1491;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h7Robb3qk9wzWp93IyFoCCd0c6ot3Kl82gPdG00fBRYp2EMLlQjOwXzGKON/S8t+yPr+GcwULO1CC99AoBYQC5qLAfpG3A6BsUkGoKJnETJVvckeePzTIqEBGXAlcvdpz2uhbaixmW/3fb9sRWELYmannrVG9KTAtZVrUiXIAPFZ3YEt0Cj/17zXBVVJnzF6DyWw66bzOtxmlq1BzsO/P57paNnWeTU5VasSSjFnIHhj9U4L6y6CLOwPUcMnN9VKBSJpBRa1OxHr7BZyYvOGaWlxjBUGE/4Rkru4iwRWBBitthrreLdPI2FOmJOFmKfVw3ehJOW1jw5USFLRFg40KzhE4eB7Lg9NV8nWJ6IndVM9aeo8p3fXtl/tswHz8/9UCS8/w6POXLNYwDqaCnce54WkmS14Th8riCmoPPX/Rj0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9bacc8-9aa8-4291-4109-08d71440d25f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2019 16:21:33.4635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1491
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hEJk1Zq5QfsLN6ztusjRyUshp3MQSi71+ZxPW2iqj4=;
 b=I5IKVYsRrSDjVmhrmsS1ck2uhnin7PLahTQ55CR5szceOHpWwqSsaVTtbh3Hfb7jKC3LKiM24OwNivDwtul06+Cn6IgZA+BC8U1GV5h+xWyZcQz5a0/Mhns9GKKzyf+Yq0+pp1sHcy/GefPA6cxGNKmXGBzHngbYpbl3CrLOwLk=
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
Content-Type: multipart/mixed; boundary="===============1384198737=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1384198737==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180983B728C323E624827F6BF7DD0BN6PR12MB1809namp_"

--_000_BN6PR12MB180983B728C323E624827F6BF7DD0BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Michel D=
=E4nzer <michel@daenzer.net>
Sent: Monday, July 29, 2019 12:20 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: Update pitch on page flips without DC as well

From: Michel D=E4nzer <michel.daenzer@amd.com>

DC already handles this correctly since amdgpu minor version 31. Bump
the minor version again so that xf86-video-amdgpu can take advantage of
this working without DC as well now.

Signed-off-by: Michel D=E4nzer <michel.daenzer@amd.com>
---

See https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/merge_requ=
ests/39
for the corresponding xf86-video-amdgpu change.

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c  | 4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c  | 4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c   | 4 ++++
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c   | 4 ++++
 5 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 800d0ceb14b4..cf334c465805 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -77,9 +77,10 @@
  * - 3.31.0 - Add support for per-flip tiling attribute changes with DC
  * - 3.32.0 - Add syncobj timeline support to AMDGPU_CS.
  * - 3.33.0 - Fixes for GDS ENOMEM failures in AMDGPU_CS.
+ * - 3.34.0 - Non-DC can flip correctly between buffers with different pit=
ches
  */
 #define KMS_DRIVER_MAJOR        3
-#define KMS_DRIVER_MINOR       33
+#define KMS_DRIVER_MINOR       34
 #define KMS_DRIVER_PATCHLEVEL   0

 #define AMDGPU_MAX_TIMEOUT_PARAM_LENTH  256
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/dce_v10_0.c
index 1f0426d2fc2a..c609b7af0b6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -233,6 +233,7 @@ static void dce_v10_0_page_flip(struct amdgpu_device *a=
dev,
                                 int crtc_id, u64 crtc_base, bool async)
 {
         struct amdgpu_crtc *amdgpu_crtc =3D adev->mode_info.crtcs[crtc_id]=
;
+       struct drm_framebuffer *fb =3D amdgpu_crtc->base.primary->fb;
         u32 tmp;

         /* flip at hsync for async, default is vsync */
@@ -240,6 +241,9 @@ static void dce_v10_0_page_flip(struct amdgpu_device *a=
dev,
         tmp =3D REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
                             GRPH_SURFACE_UPDATE_H_RETRACE_EN, async ? 1 : =
0);
         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
+       /* update pitch */
+       WREG32(mmGRPH_PITCH + amdgpu_crtc->crtc_offset,
+              fb->pitches[0] / fb->format->cpp[0]);
         /* update the primary scanout address */
         WREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_off=
set,
                upper_32_bits(crtc_base));
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/dce_v11_0.c
index 2280b971d758..719db058b306 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -251,6 +251,7 @@ static void dce_v11_0_page_flip(struct amdgpu_device *a=
dev,
                                 int crtc_id, u64 crtc_base, bool async)
 {
         struct amdgpu_crtc *amdgpu_crtc =3D adev->mode_info.crtcs[crtc_id]=
;
+       struct drm_framebuffer *fb =3D amdgpu_crtc->base.primary->fb;
         u32 tmp;

         /* flip immediate for async, default is vsync */
@@ -258,6 +259,9 @@ static void dce_v11_0_page_flip(struct amdgpu_device *a=
dev,
         tmp =3D REG_SET_FIELD(tmp, GRPH_FLIP_CONTROL,
                             GRPH_SURFACE_UPDATE_IMMEDIATE_EN, async ? 1 : =
0);
         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, tmp);
+       /* update pitch */
+       WREG32(mmGRPH_PITCH + amdgpu_crtc->crtc_offset,
+              fb->pitches[0] / fb->format->cpp[0]);
         /* update the scanout addresses */
         WREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_off=
set,
                upper_32_bits(crtc_base));
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/am=
dgpu/dce_v6_0.c
index bea32f076b91..8ee99651d01a 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -186,10 +186,14 @@ static void dce_v6_0_page_flip(struct amdgpu_device *=
adev,
                                int crtc_id, u64 crtc_base, bool async)
 {
         struct amdgpu_crtc *amdgpu_crtc =3D adev->mode_info.crtcs[crtc_id]=
;
+       struct drm_framebuffer *fb =3D amdgpu_crtc->base.primary->fb;

         /* flip at hsync for async, default is vsync */
         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, async ?
                GRPH_FLIP_CONTROL__GRPH_SURFACE_UPDATE_H_RETRACE_EN_MASK : =
0);
+       /* update pitch */
+       WREG32(mmGRPH_PITCH + amdgpu_crtc->crtc_offset,
+              fb->pitches[0] / fb->format->cpp[0]);
         /* update the scanout addresses */
         WREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_off=
set,
                upper_32_bits(crtc_base));
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/am=
dgpu/dce_v8_0.c
index 13da915991dd..7037e016493c 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -181,10 +181,14 @@ static void dce_v8_0_page_flip(struct amdgpu_device *=
adev,
                                int crtc_id, u64 crtc_base, bool async)
 {
         struct amdgpu_crtc *amdgpu_crtc =3D adev->mode_info.crtcs[crtc_id]=
;
+       struct drm_framebuffer *fb =3D amdgpu_crtc->base.primary->fb;

         /* flip at hsync for async, default is vsync */
         WREG32(mmGRPH_FLIP_CONTROL + amdgpu_crtc->crtc_offset, async ?
                GRPH_FLIP_CONTROL__GRPH_SURFACE_UPDATE_H_RETRACE_EN_MASK : =
0);
+       /* update pitch */
+       WREG32(mmGRPH_PITCH + amdgpu_crtc->crtc_offset,
+              fb->pitches[0] / fb->format->cpp[0]);
         /* update the primary scanout addresses */
         WREG32(mmGRPH_PRIMARY_SURFACE_ADDRESS_HIGH + amdgpu_crtc->crtc_off=
set,
                upper_32_bits(crtc_base));
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180983B728C323E624827F6BF7DD0BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Michel D=E4nzer &lt;michel@da=
enzer.net&gt;<br>
<b>Sent:</b> Monday, July 29, 2019 12:20 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Update pitch on page flips without DC a=
s well</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Michel D=E4nzer &lt;michel.daenzer@amd.com&g=
t;<br>
<br>
DC already handles this correctly since amdgpu minor version 31. Bump<br>
the minor version again so that xf86-video-amdgpu can take advantage of<br>
this working without DC as well now.<br>
<br>
Signed-off-by: Michel D=E4nzer &lt;michel.daenzer@amd.com&gt;<br>
---<br>
<br>
See <a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu=
/merge_requests/39">
https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/merge_requests=
/39</a><br>
for the corresponding xf86-video-amdgpu change.<br>
<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 &#43;&#43;-<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/dce_v10_0.c&nbsp; | 4 &#43;&#43;&#43;&#43;=
<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/dce_v11_0.c&nbsp; | 4 &#43;&#43;&#43;&#43;=
<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/dce_v6_0.c&nbsp;&nbsp; | 4 &#43;&#43;&#43;=
&#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/dce_v8_0.c&nbsp;&nbsp; | 4 &#43;&#43;&#43;=
&#43;<br>
&nbsp;5 files changed, 18 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 800d0ceb14b4..cf334c465805 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -77,9 &#43;77,10 @@<br>
&nbsp; * - 3.31.0 - Add support for per-flip tiling attribute changes with =
DC<br>
&nbsp; * - 3.32.0 - Add syncobj timeline support to AMDGPU_CS.<br>
&nbsp; * - 3.33.0 - Fixes for GDS ENOMEM failures in AMDGPU_CS.<br>
&#43; * - 3.34.0 - Non-DC can flip correctly between buffers with different=
 pitches<br>
&nbsp; */<br>
&nbsp;#define KMS_DRIVER_MAJOR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3<=
br>
-#define KMS_DRIVER_MINOR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33<br>
&#43;#define KMS_DRIVER_MINOR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 34<br>
&nbsp;#define KMS_DRIVER_PATCHLEVEL&nbsp;&nbsp; 0<br>
&nbsp;<br>
&nbsp;#define AMDGPU_MAX_TIMEOUT_PARAM_LENTH&nbsp; 256<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/dce_v10_0.c<br>
index 1f0426d2fc2a..c609b7af0b6b 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c<br>
@@ -233,6 &#43;233,7 @@ static void dce_v10_0_page_flip(struct amdgpu_devic=
e *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int crtc_id, u64 crtc_base, bool=
 async)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_crtc *amdgpu=
_crtc =3D adev-&gt;mode_info.crtcs[crtc_id];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_framebuffer *fb =3D am=
dgpu_crtc-&gt;base.primary-&gt;fb;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 tmp;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* flip at hsync for async=
, default is vsync */<br>
@@ -240,6 &#43;241,9 @@ static void dce_v10_0_page_flip(struct amdgpu_devic=
e *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D REG_SET_FIELD(tmp,=
 GRPH_FLIP_CONTROL,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; GRPH_SURFACE_UPDATE_H_RETRACE_EN, async ? 1 : 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_FLIP_CONTROL=
 &#43; amdgpu_crtc-&gt;crtc_offset, tmp);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* update pitch */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_PITCH &#43; amdgpu_=
crtc-&gt;crtc_offset,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; fb-&gt;pitches[0] / fb-&gt;format-&gt;cpp[0]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* update the primary scan=
out address */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_PRIMARY_SURF=
ACE_ADDRESS_HIGH &#43; amdgpu_crtc-&gt;crtc_offset,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; upper_32_bits(crtc_base));<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/dce_v11_0.c<br>
index 2280b971d758..719db058b306 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c<br>
@@ -251,6 &#43;251,7 @@ static void dce_v11_0_page_flip(struct amdgpu_devic=
e *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int crtc_id, u64 crtc_base, bool=
 async)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_crtc *amdgpu=
_crtc =3D adev-&gt;mode_info.crtcs[crtc_id];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_framebuffer *fb =3D am=
dgpu_crtc-&gt;base.primary-&gt;fb;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 tmp;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* flip immediate for asyn=
c, default is vsync */<br>
@@ -258,6 &#43;259,9 @@ static void dce_v11_0_page_flip(struct amdgpu_devic=
e *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D REG_SET_FIELD(tmp,=
 GRPH_FLIP_CONTROL,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; GRPH_SURFACE_UPDATE_IMMEDIATE_EN, async ? 1 : 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_FLIP_CONTROL=
 &#43; amdgpu_crtc-&gt;crtc_offset, tmp);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* update pitch */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_PITCH &#43; amdgpu_=
crtc-&gt;crtc_offset,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; fb-&gt;pitches[0] / fb-&gt;format-&gt;cpp[0]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* update the scanout addr=
esses */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_PRIMARY_SURF=
ACE_ADDRESS_HIGH &#43; amdgpu_crtc-&gt;crtc_offset,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; upper_32_bits(crtc_base));<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/am=
dgpu/dce_v6_0.c<br>
index bea32f076b91..8ee99651d01a 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c<br>
@@ -186,10 &#43;186,14 @@ static void dce_v6_0_page_flip(struct amdgpu_devi=
ce *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int crtc_id, u64 crtc_base, bool async=
)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_crtc *amdgpu=
_crtc =3D adev-&gt;mode_info.crtcs[crtc_id];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_framebuffer *fb =3D am=
dgpu_crtc-&gt;base.primary-&gt;fb;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* flip at hsync for async=
, default is vsync */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_FLIP_CONTROL=
 &#43; amdgpu_crtc-&gt;crtc_offset, async ?<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; GRPH_FLIP_CONTROL__GRPH_SURFACE_UPDATE_H_RETRACE_EN_MASK : =
0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* update pitch */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_PITCH &#43; amdgpu_=
crtc-&gt;crtc_offset,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; fb-&gt;pitches[0] / fb-&gt;format-&gt;cpp[0]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* update the scanout addr=
esses */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_PRIMARY_SURF=
ACE_ADDRESS_HIGH &#43; amdgpu_crtc-&gt;crtc_offset,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; upper_32_bits(crtc_base));<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/am=
dgpu/dce_v8_0.c<br>
index 13da915991dd..7037e016493c 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c<br>
@@ -181,10 &#43;181,14 @@ static void dce_v8_0_page_flip(struct amdgpu_devi=
ce *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int crtc_id, u64 crtc_base, bool async=
)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_crtc *amdgpu=
_crtc =3D adev-&gt;mode_info.crtcs[crtc_id];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_framebuffer *fb =3D am=
dgpu_crtc-&gt;base.primary-&gt;fb;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* flip at hsync for async=
, default is vsync */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_FLIP_CONTROL=
 &#43; amdgpu_crtc-&gt;crtc_offset, async ?<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; GRPH_FLIP_CONTROL__GRPH_SURFACE_UPDATE_H_RETRACE_EN_MASK : =
0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* update pitch */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_PITCH &#43; amdgpu_=
crtc-&gt;crtc_offset,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; fb-&gt;pitches[0] / fb-&gt;format-&gt;cpp[0]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* update the primary scan=
out addresses */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32(mmGRPH_PRIMARY_SURF=
ACE_ADDRESS_HIGH &#43; amdgpu_crtc-&gt;crtc_offset,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; upper_32_bits(crtc_base));<br>
-- <br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB180983B728C323E624827F6BF7DD0BN6PR12MB1809namp_--

--===============1384198737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1384198737==--

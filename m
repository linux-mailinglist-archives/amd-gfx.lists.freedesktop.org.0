Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A338F7A
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Jun 2019 17:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40BF789AE6;
	Fri,  7 Jun 2019 15:42:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780052.outbound.protection.outlook.com [40.107.78.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B040289AE6
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Jun 2019 15:42:16 +0000 (UTC)
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.65.149) by
 BN8PR12MB3153.namprd12.prod.outlook.com (20.178.223.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.21; Fri, 7 Jun 2019 15:42:14 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::e504:4ec4:c1c3:a9f8]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::e504:4ec4:c1c3:a9f8%5]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 15:42:14 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true
Thread-Topic: [PATCH] drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true
Thread-Index: AQHVHUQQPA9ZJUHFFUOJlOai6yaEFKaQVGqb
Date: Fri, 7 Jun 2019 15:42:14 +0000
Message-ID: <BN8PR12MB32175DF8FD6509F800439BF3EF100@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190607151655.7991-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190607151655.7991-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db35484c-f2e3-4460-ee34-08d6eb5eb6bd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3153; 
x-ms-traffictypediagnostic: BN8PR12MB3153:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB31532255DD9D73BCB06EC71CEF100@BN8PR12MB3153.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(136003)(366004)(396003)(376002)(199004)(189003)(64756008)(53936002)(76116006)(73956011)(316002)(486006)(606006)(55016002)(6246003)(66066001)(26005)(5660300002)(72206003)(9686003)(3846002)(6436002)(66946007)(236005)(8676002)(102836004)(66476007)(110136005)(11346002)(186003)(2501003)(6606003)(54896002)(99286004)(14444005)(229853002)(6116002)(446003)(6306002)(71200400001)(74316002)(8936002)(6506007)(81156014)(66556008)(66446008)(25786009)(2906002)(81166006)(53546011)(7736002)(966005)(33656002)(15650500001)(71190400001)(68736007)(52536014)(476003)(76176011)(4326008)(19627405001)(7696005)(14454004)(478600001)(91956017)(86362001)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3153;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dkl0OIUXbYi4fGFoYYxP1FX42xTgbJjD4+1gF0l2kTj/vDPd8uhwhU/M4xdn+m4jrbBX/9/Rug/61pGOx4QnWep75P3lX4nWrh0Ub9nTHHZ6qSwe2IMJbzuEj6LTgTnPexONscPK1fMuWfGcvfC5eKpI0z1PKsm9ovXMfeRk5cJN/LGf0tvI5PjL3RvlYdY+6rH5uKhZfF0//IBl0M0ejBwdD7whm+zEYVELUsOpGBMQUklfHOrWkTJuOYrdewVt1HSa+WTpGuNJGNJQMOFNzaRojn987c7fyfldNC9yZ359TZLp2CK6SnhypOZOd4Lg7MN2sp/xXyZivhrjZntjB6Y7Ii9iQhg8i2jI2S2jotBAa9ljA2cB5vkZYnV2+91rcuZoTiUjbyHc++5A7anrei5TE68YKXZga2OD4nHobVo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db35484c-f2e3-4460-ee34-08d6eb5eb6bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 15:42:14.4507 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdavid@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3153
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIxsfujgGNqYWAQg25e+gsr5SGOyaRJifnjUT2D6Zek=;
 b=FhLOlkS1KU0//HEzm8PDN9CAjlblXDM9Ua4xmdRCvJ6uzDHfaKS8NpiCvIzsi6pNLV5aMJprOpGlMBEvzQOCQs0CeBlGz9siGmaT74q9Qktj3QEXLzeKBGWtXYp55VRYup8u2o00DAkoSBbedoHrZsVbqk3GGqwVRvyKXCp0Gf0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David.Francis@amd.com; 
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
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>
Content-Type: multipart/mixed; boundary="===============1016457185=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1016457185==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB32175DF8FD6509F800439BF3EF100BN8PR12MB3217namp_"

--_000_BN8PR12MB32175DF8FD6509F800439BF3EF100BN8PR12MB3217namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Patch is

Reviewed-by: David Francis <David.Francis@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: June 7, 2019 11:16:55 AM
To: amd-gfx@lists.freedesktop.org
Cc: Francis, David; Wentland, Harry; Kazlauskas, Nicholas
Subject: [PATCH] drm/amd/display: Enable fast plane updates when state->all=
ow_modeset =3D true

[Why]
Whenever the a modeset is allowed (but not neccessarily required) we
currently recreate all the planes in the state. Most IGT tests and
legacy IOCTLs create atomic commits with this flag set, so the pipes
are often unnecessarily reprogrammed.

Poor performance and stuttering can occur when many of these commits
are frequently issued.

This flag was needed when the appropriate conditions for checking
whether the planes needed a reset were not in place, but
should_reset_plane should cover everything needed now.

[How]
Drop the check for state->allow_modeset in should_reset_plane.

All planes on a CRTC should reset in the following conditions:
- The CRTC needs a modeset
- The CRTC degamma changes
- Planes are added or removed to the CRTC

These conditions are all covered in should_reset_plane.

We still can't drop the format change check in should_reset_plane since
fill_dc_plane_info_and_addr isn't called when validating the state, so
we can't tell if a FULL update is needed or not.

Cc: David Francis <david.francis@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a698c8f272ed..45f0d5b6c468 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6446,14 +6446,6 @@ static bool should_reset_plane(struct drm_atomic_sta=
te *state,
         struct drm_crtc_state *new_crtc_state;
         int i;

-       /*
-        * TODO: Remove this hack once the checks below are sufficient
-        * enough to determine when we need to reset all the planes on
-        * the stream.
-        */
-       if (state->allow_modeset)
-               return true;
-
         /* Exit early if we know that we're adding or removing the plane. =
*/
         if (old_plane_state->crtc !=3D new_plane_state->crtc)
                 return true;
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB32175DF8FD6509F800439BF3EF100BN8PR12MB3217namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Patch is</p>
<p style=3D"margin-top:0;margin-bottom:0">Reviewed-by: David Francis &lt;Da=
vid.Francis@amd.com&gt;</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nicho=
las.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> June 7, 2019 11:16:55 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Francis, David; Wentland, Harry; Kazlauskas, Nicholas<br>
<b>Subject:</b> [PATCH] drm/amd/display: Enable fast plane updates when sta=
te-&gt;allow_modeset =3D true</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Why]<br>
Whenever the a modeset is allowed (but not neccessarily required) we<br>
currently recreate all the planes in the state. Most IGT tests and<br>
legacy IOCTLs create atomic commits with this flag set, so the pipes<br>
are often unnecessarily reprogrammed.<br>
<br>
Poor performance and stuttering can occur when many of these commits<br>
are frequently issued.<br>
<br>
This flag was needed when the appropriate conditions for checking<br>
whether the planes needed a reset were not in place, but<br>
should_reset_plane should cover everything needed now.<br>
<br>
[How]<br>
Drop the check for state-&gt;allow_modeset in should_reset_plane.<br>
<br>
All planes on a CRTC should reset in the following conditions:<br>
- The CRTC needs a modeset<br>
- The CRTC degamma changes<br>
- Planes are added or removed to the CRTC<br>
<br>
These conditions are all covered in should_reset_plane.<br>
<br>
We still can't drop the format change check in should_reset_plane since<br>
fill_dc_plane_info_and_addr isn't called when validating the state, so<br>
we can't tell if a FULL update is needed or not.<br>
<br>
Cc: David Francis &lt;david.francis@amd.com&gt;<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 --------<br>
&nbsp;1 file changed, 8 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index a698c8f272ed..45f0d5b6c468 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -6446,14 &#43;6446,6 @@ static bool should_reset_plane(struct drm_atomic=
_state *state,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc_state *new=
_crtc_state;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * TODO: Remove this hack once t=
he checks below are sufficient<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * enough to determine when we n=
eed to reset all the planes on<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the stream.<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (state-&gt;allow_modeset)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return true;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Exit early if we know t=
hat we're adding or removing the plane. */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (old_plane_state-&gt;cr=
tc !=3D new_plane_state-&gt;crtc)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return true;<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB32175DF8FD6509F800439BF3EF100BN8PR12MB3217namp_--

--===============1016457185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1016457185==--

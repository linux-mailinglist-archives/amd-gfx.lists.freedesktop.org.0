Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7AF4D074
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 16:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75006E5A0;
	Thu, 20 Jun 2019 14:35:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720043.outbound.protection.outlook.com [40.107.72.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B8226E5A0
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 14:35:08 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1361.namprd12.prod.outlook.com (10.168.225.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 14:35:06 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 14:35:06 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Francis, David" <David.Francis@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] Revert "drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true"
Thread-Topic: [PATCH] Revert "drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true"
Thread-Index: AQHVJ2R459vqs5VHE0aCzrdKMVLq06akjYeAgAAOUDw=
Date: Thu, 20 Jun 2019 14:35:06 +0000
Message-ID: <BN6PR12MB1809A334E8D4AB00D4BCB178F7E40@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190620123403.10252-1-nicholas.kazlauskas@amd.com>,
 <BN8PR12MB3217FE6149291E3A7D053139EFE40@BN8PR12MB3217.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3217FE6149291E3A7D053139EFE40@BN8PR12MB3217.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a665f70f-ea9f-4999-3d59-08d6f58c7d22
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1361; 
x-ms-traffictypediagnostic: BN6PR12MB1361:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB13617EEF23FD784F1B898259F7E40@BN6PR12MB1361.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:381;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(366004)(376002)(136003)(346002)(189003)(199004)(33656002)(74316002)(229853002)(66066001)(6436002)(68736007)(14454004)(606006)(486006)(55016002)(53936002)(478600001)(105004)(54896002)(25786009)(476003)(4326008)(72206003)(6246003)(2501003)(316002)(15650500001)(66556008)(446003)(71190400001)(966005)(66446008)(9686003)(236005)(86362001)(6306002)(11346002)(76116006)(66946007)(73956011)(71200400001)(52536014)(5660300002)(2906002)(53546011)(64756008)(66476007)(6506007)(186003)(99286004)(110136005)(256004)(76176011)(26005)(102836004)(19627405001)(7696005)(7736002)(3846002)(8936002)(8676002)(6116002)(81166006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1361;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DT660Wdl3B4PC6bG0tzxmDbL8nMHe77EGw31C70hB1CnZHpFSt2ChBTSg/lLGUvz5xbatW4VzMw1/IzAB/TUpJN7OiCK0+Jvw0XWN3PhdpPfcOrojpC2V2HkouuPVqfSSLFgnCq2zajL2CqwRH88yg75w4fcxdCwc+uQ20jYQ3/RpiyfIy+ny0D2d2fhu9dfTvyxQM2f+kKYOMq31yTH9HVELwTP4n3n68Xh8VGjN90kpQrceuF/QYsTJaYGHmvyF0PEdu5St9NR316mmys+IcDnZ7JEBVoB9bLdOCtXYoSW3Xk+nhBsAM/a2oUjCBM3Nh3Me8/kBteRWqOmvwxXRR3gJaqvuSH35yibAvPDlqGJ18xvujs9jruv8s/pjJp1axBAB7Ilrphw19Irh3WreR3KlOTXHNhDCnjzbFoOEoM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a665f70f-ea9f-4999-3d59-08d6f58c7d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 14:35:06.1755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1361
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE2pIGkjL8oVQ85dMw7T+OpL0oDQJwGiIX0mK/Rx9p4=;
 b=AdEU6I1AdRh7CkgjwfEdkpDnt103Z+2f8IlBESdVMJvUaVtRsGpuBvPHW143bDpFxmp6kzbYgIQAybSFkXCVP/i1UrHvpDrRuiuLwLbgOwWrdGZoLTAPJOEPlTh/W1J74gcxhzzUDPly/wPpwYvnTXoz26HFnJf7VljzDIp/9Gk=
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
Cc: "Wentland, Harry" <Harry.Wentland@amd.com>
Content-Type: multipart/mixed; boundary="===============0426642754=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0426642754==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809A334E8D4AB00D4BCB178F7E40BN6PR12MB1809namp_"

--_000_BN6PR12MB1809A334E8D4AB00D4BCB178F7E40BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there a bugzilla this fixes?  If so, can you add a link?

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Francis,=
 David <David.Francis@amd.com>
Sent: Thursday, June 20, 2019 9:43 AM
To: Kazlauskas, Nicholas; amd-gfx@lists.freedesktop.org
Cc: Wentland, Harry
Subject: Re: [PATCH] Revert "drm/amd/display: Enable fast plane updates whe=
n state->allow_modeset =3D true"


Reviewed-by: David Francis <david.francis@amd.com>



________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: June 20, 2019 8:34:03 AM
To: amd-gfx@lists.freedesktop.org
Cc: Francis, David; Wentland, Harry; Kazlauskas, Nicholas
Subject: [PATCH] Revert "drm/amd/display: Enable fast plane updates when st=
ate->allow_modeset =3D true"

This reverts commit ebc8c6f18322ad54275997a888ca1731d74b711f.

There are still missing corner cases with cursor interaction and these
fast plane updates on Picasso and Raven2 leading to endless PSTATE
warnings for typical desktop usage depending on the userspace.

This change should be reverted until these issues have been resolved.

Cc: David Francis <david.francis@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 33dcd4187157..d6acbcfa570c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6471,6 +6471,14 @@ static bool should_reset_plane(struct drm_atomic_sta=
te *state,
         struct drm_crtc_state *new_crtc_state;
         int i;

+       /*
+        * TODO: Remove this hack once the checks below are sufficient
+        * enough to determine when we need to reset all the planes on
+        * the stream.
+        */
+       if (state->allow_modeset)
+               return true;
+
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

--_000_BN6PR12MB1809A334E8D4AB00D4BCB178F7E40BN6PR12MB1809namp_
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
Is there a bugzilla this fixes?&nbsp; If so, can you add a link?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Francis, David &lt;David.Fran=
cis@amd.com&gt;<br>
<b>Sent:</b> Thursday, June 20, 2019 9:43 AM<br>
<b>To:</b> Kazlauskas, Nicholas; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Wentland, Harry<br>
<b>Subject:</b> Re: [PATCH] Revert &quot;drm/amd/display: Enable fast plane=
 updates when state-&gt;allow_modeset =3D true&quot;</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0; margin-bottom:0">Reviewed-by: David Francis &lt;d=
avid.francis@amd.com&gt;</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nic=
holas.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> June 20, 2019 8:34:03 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Francis, David; Wentland, Harry; Kazlauskas, Nicholas<br>
<b>Subject:</b> [PATCH] Revert &quot;drm/amd/display: Enable fast plane upd=
ates when state-&gt;allow_modeset =3D true&quot;</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">This reverts commit ebc8c6f18322ad54275997a888ca=
1731d74b711f.<br>
<br>
There are still missing corner cases with cursor interaction and these<br>
fast plane updates on Picasso and Raven2 leading to endless PSTATE<br>
warnings for typical desktop usage depending on the userspace.<br>
<br>
This change should be reverted until these issues have been resolved.<br>
<br>
Cc: David Francis &lt;david.francis@amd.com&gt;<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 &#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 8 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index 33dcd4187157..d6acbcfa570c 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -6471,6 &#43;6471,14 @@ static bool should_reset_plane(struct drm_atomic=
_state *state,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc_state *new=
_crtc_state;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * TODO: Remove this hack on=
ce the checks below are sufficient<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * enough to determine when =
we need to reset all the planes on<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the stream.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (state-&gt;allow_modeset)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return true;<br>
&#43;<br>
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
</div>
</body>
</html>

--_000_BN6PR12MB1809A334E8D4AB00D4BCB178F7E40BN6PR12MB1809namp_--

--===============0426642754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0426642754==--

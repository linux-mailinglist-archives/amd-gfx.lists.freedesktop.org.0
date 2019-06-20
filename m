Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C44CF36
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 15:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F2C6E57A;
	Thu, 20 Jun 2019 13:43:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on062d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEA96E586
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 13:43:37 +0000 (UTC)
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.65.149) by
 BN8PR12MB3059.namprd12.prod.outlook.com (20.178.209.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 20 Jun 2019 13:43:35 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::e504:4ec4:c1c3:a9f8]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::e504:4ec4:c1c3:a9f8%5]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 13:43:35 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] Revert "drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true"
Thread-Topic: [PATCH] Revert "drm/amd/display: Enable fast plane updates when
 state->allow_modeset = true"
Thread-Index: AQHVJ2R4mWiPERyIOESjWTCvJZhLRaakjU9l
Date: Thu, 20 Jun 2019 13:43:35 +0000
Message-ID: <BN8PR12MB3217FE6149291E3A7D053139EFE40@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190620123403.10252-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190620123403.10252-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ddc0f717-d0af-4370-a20b-08d6f5854af7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3059; 
x-ms-traffictypediagnostic: BN8PR12MB3059:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB3059956C85F2128E89AAC412EFE40@BN8PR12MB3059.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:352;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(136003)(346002)(396003)(199004)(189003)(966005)(86362001)(81166006)(6116002)(66476007)(66556008)(55016002)(102836004)(8936002)(186003)(33656002)(5660300002)(478600001)(486006)(71200400001)(7736002)(76176011)(52536014)(476003)(64756008)(72206003)(316002)(81156014)(71190400001)(229853002)(14454004)(6506007)(11346002)(66446008)(76116006)(606006)(110136005)(53546011)(19627405001)(73956011)(25786009)(66066001)(4326008)(53936002)(3846002)(7696005)(66946007)(446003)(8676002)(99286004)(74316002)(91956017)(256004)(54896002)(15650500001)(26005)(6436002)(6606003)(236005)(68736007)(9686003)(6246003)(2906002)(2501003)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3059;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: us1i07ZL+6r6eN6SqG0axv87XrZvGqp7+nkLfBKpTUms6XVUpAzQZGYmwP7Gjg0+q1va92qFceJwZJ3zS6MZyVuoIOmZKotCPyLgwJXmdUW0HqduHlrrVYClOFeqqpnTP5NVkM/Vr4zqM+Knqs4jA94WUfj7bkEIkMZJ/ZkQkaSJ7Vy+U/SOMP5/OPk0mAx1CQFZ165P1CLIG6q8Kt4zqQmTF4DkeaLY4bqDPHUcWpZ0KyGGlwMvfe9+++kvuxumqQXpbJMncNp+PRiKVu+QbmW7vbPnKuahg+21nd0ZDii7tQ3rhL7BpQ+eq8VobndOlMZZ9OqQvHtQjlmCCcieM6OlIGrSUf1sVusmuXqhIvJmdwIWk9xw5Sr6fTAvQIzknzstyP+LRkxc6gNr2dZAweAPt5AdYMfAF79K++FcLpw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc0f717-d0af-4370-a20b-08d6f5854af7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 13:43:35.5243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdavid@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3059
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xc/uLHYd2Wk87YxC0CDiYF1mMBiCoTbxK7GOnIhYxr0=;
 b=gX6TdwahhLHs3SFz+lIc6BfP2hPz4ex+F3hRWb5Gdmki//w5f3ipvgJaEhOn+b2KMuJbmD78/jb0UJuaDAioHKgofgLQTZmlvll209Def7P1YKJZUK26afF77ZIoKrleFhSp0+OVOW6TS8dvyssnp/uGTN9ZZTlVmiM+gjI1Pn0=
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
Content-Type: multipart/mixed; boundary="===============1444593519=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1444593519==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3217FE6149291E3A7D053139EFE40BN8PR12MB3217namp_"

--_000_BN8PR12MB3217FE6149291E3A7D053139EFE40BN8PR12MB3217namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_BN8PR12MB3217FE6149291E3A7D053139EFE40BN8PR12MB3217namp_
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
<p style=3D"margin-top:0;margin-bottom:0">Reviewed-by: David Francis &lt;da=
vid.francis@amd.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nicho=
las.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> June 20, 2019 8:34:03 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Francis, David; Wentland, Harry; Kazlauskas, Nicholas<br>
<b>Subject:</b> [PATCH] Revert &quot;drm/amd/display: Enable fast plane upd=
ates when state-&gt;allow_modeset =3D true&quot;</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This reverts commit ebc8c6f18322ad54275997a888ca17=
31d74b711f.<br>
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
</body>
</html>

--_000_BN8PR12MB3217FE6149291E3A7D053139EFE40BN8PR12MB3217namp_--

--===============1444593519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1444593519==--

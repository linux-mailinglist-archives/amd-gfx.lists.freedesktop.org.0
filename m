Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 042893786F
	for <lists+amd-gfx@lfdr.de>; Thu,  6 Jun 2019 17:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9858589805;
	Thu,  6 Jun 2019 15:46:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720082.outbound.protection.outlook.com [40.107.72.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B4489805
 for <amd-gfx@lists.freedesktop.org>; Thu,  6 Jun 2019 15:46:39 +0000 (UTC)
Received: from BN8PR12MB3217.namprd12.prod.outlook.com (20.179.65.149) by
 BN8PR12MB3107.namprd12.prod.outlook.com (20.178.210.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.13; Thu, 6 Jun 2019 15:46:37 +0000
Received: from BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::e504:4ec4:c1c3:a9f8]) by BN8PR12MB3217.namprd12.prod.outlook.com
 ([fe80::e504:4ec4:c1c3:a9f8%5]) with mapi id 15.20.1965.011; Thu, 6 Jun 2019
 15:46:37 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/display: Set default ABM level to module
 parameter
Thread-Topic: [PATCH 2/2] drm/amd/display: Set default ABM level to module
 parameter
Thread-Index: AQHVHGgwPxBA2akei0ecBqhWQyQh9aaOxRwC
Date: Thu, 6 Jun 2019 15:46:36 +0000
Message-ID: <BN8PR12MB3217258D94A399DCB6A52536EF170@BN8PR12MB3217.namprd12.prod.outlook.com>
References: <20190606130213.29249-1-nicholas.kazlauskas@amd.com>,
 <20190606130213.29249-2-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190606130213.29249-2-nicholas.kazlauskas@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17c69daa-5d0f-4a7b-863d-08d6ea9628df
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3107; 
x-ms-traffictypediagnostic: BN8PR12MB3107:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB31076D3F253EC36B586576A3EF170@BN8PR12MB3107.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(366004)(136003)(396003)(189003)(199004)(8936002)(66446008)(76116006)(99286004)(102836004)(446003)(486006)(476003)(11346002)(2501003)(91956017)(66476007)(53936002)(33656002)(81156014)(76176011)(5660300002)(66066001)(68736007)(7696005)(2906002)(7736002)(110136005)(6246003)(81166006)(66556008)(73956011)(66946007)(316002)(186003)(64756008)(6506007)(53546011)(8676002)(26005)(4326008)(74316002)(606006)(14454004)(86362001)(6606003)(52536014)(229853002)(3846002)(6436002)(6116002)(25786009)(236005)(55016002)(72206003)(966005)(9686003)(478600001)(54896002)(6306002)(71200400001)(71190400001)(256004)(14444005)(19627405001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3107;
 H:BN8PR12MB3217.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EjTp4ZUecJrewMws8qNt02c0fJKtsI0OqNV4vlcv6NRfAWnvvkKt0btzfrFpJlIqLZ0F5NIT4o6E9GZAQNjNhl5KGVnCmRg59YsiOk0SgnXU+eRuneARlM5Zr802RrwDIrCb/4yvYwY90neU+WRCAtNsCbPxv3hbaEVbNApoIWTLirCCdX0MWU85u9Gr2giXfjBAcC4bl0dzimijHaMmj0tjkKgiT3wsun83vu6GNrW+H1bfH+w0wsQNBcA9kVIokWIkgk8E6xUWSbNU6A1L7tMShC2ESuRlfhmGXPNJUcREY2xXxAjn9GBkVKJwDni+VGl2OoVA7mMcMvRu0HSl1XGc7h5kRzHkNpN8yfxZQULQ/udipTIfkTJZfMHxC0HV88X/J+jYCuWmCMVcEbJgCfkbhRQ5sp9UXmZNfio6hds=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c69daa-5d0f-4a7b-863d-08d6ea9628df
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 15:46:36.9786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdavid@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3107
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmJoigExOMDvFFK2MJMUitxdhgyqhEkZuTQNBmVmSZY=;
 b=FF+rWcx/H0l/zPKhpNm/5qqbu8Vm+moxgVzJNfuPbvCNGhA/B9mMDF1MWXy5jG4o8+892rcm6MlPBtTnW/c535xQYCGRHaeC5vtd61EX1RnE7zKjgVqO/mNmYGoK9PBqiOYqqygLjblqq78Fcir3/kiIBnR1l3ObAZYx3aR6E4k=
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
Content-Type: multipart/mixed; boundary="===============1388970173=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1388970173==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3217258D94A399DCB6A52536EF170BN8PR12MB3217namp_"

--_000_BN8PR12MB3217258D94A399DCB6A52536EF170BN8PR12MB3217namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is

Reviewed-by: David Francis <David.Francis@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: June 6, 2019 9:02:13 AM
To: amd-gfx@lists.freedesktop.org
Cc: Francis, David; Wentland, Harry; Kazlauskas, Nicholas
Subject: [PATCH 2/2] drm/amd/display: Set default ABM level to module param=
eter

[Why]
The module parameter to specify the default ABM level is now defined,
so hook it up in DM.

[How]
On connector reset specify the default level. DC will program this as
part of the modeset since it gets passed onto the stream in
dm_update_crtc_state.

It's only set for eDP connectors, but it doesn't matter if this is
specified for connectors or hardware that doesn't support ABM.

It's DC's responsibility to check that ABM can be set or adjusted, and
DC does check that the DMCU firmware is running and if there's backlight
control available.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: David Francis <david.francis@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a698c8f272ed..f0c216d78a07 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3821,6 +3821,9 @@ void amdgpu_dm_connector_funcs_reset(struct drm_conne=
ctor *connector)
                 state->underscan_hborder =3D 0;
                 state->underscan_vborder =3D 0;

+               if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP=
)
+                       state->abm_level =3D amdgpu_dm_abm_level;
+
                 __drm_atomic_helper_connector_reset(connector, &state->bas=
e);
         }
 }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB3217258D94A399DCB6A52536EF170BN8PR12MB3217namp_
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
<p style=3D"margin-top:0;margin-bottom:0">Series is</p>
<p style=3D"margin-top:0;margin-bottom:0">Reviewed-by: David Francis &lt;Da=
vid.Francis@amd.com&gt;</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nicho=
las.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> June 6, 2019 9:02:13 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Francis, David; Wentland, Harry; Kazlauskas, Nicholas<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/display: Set default ABM level to modul=
e parameter</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Why]<br>
The module parameter to specify the default ABM level is now defined,<br>
so hook it up in DM.<br>
<br>
[How]<br>
On connector reset specify the default level. DC will program this as<br>
part of the modeset since it gets passed onto the stream in<br>
dm_update_crtc_state.<br>
<br>
It's only set for eDP connectors, but it doesn't matter if this is<br>
specified for connectors or hardware that doesn't support ABM.<br>
<br>
It's DC's responsibility to check that ABM can be set or adjusted, and<br>
DC does check that the DMCU firmware is running and if there's backlight<br=
>
control available.<br>
<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Cc: David Francis &lt;david.francis@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 &#43;&#43;&#43;=
<br>
&nbsp;1 file changed, 3 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index a698c8f272ed..f0c216d78a07 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -3821,6 &#43;3821,9 @@ void amdgpu_dm_connector_funcs_reset(struct drm_c=
onnector *connector)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; state-&gt;underscan_hborder =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; state-&gt;underscan_vborder =3D 0;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (connector-&gt;connector_type =3D=3D DRM_MODE_CONNECTOR_e=
DP)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;ab=
m_level =3D amdgpu_dm_abm_level;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; __drm_atomic_helper_connector_reset(connector, &amp;s=
tate-&gt;base);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;}<br>
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

--_000_BN8PR12MB3217258D94A399DCB6A52536EF170BN8PR12MB3217namp_--

--===============1388970173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1388970173==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FCF36298
	for <lists+amd-gfx@lfdr.de>; Wed,  5 Jun 2019 19:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB3689580;
	Wed,  5 Jun 2019 17:30:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1972C89580
 for <amd-gfx@lists.freedesktop.org>; Wed,  5 Jun 2019 17:30:28 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1492.namprd12.prod.outlook.com (10.172.24.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 17:30:26 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 17:30:26 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Use current connector state if NULL when
 checking bpc
Thread-Topic: [PATCH] drm/amd/display: Use current connector state if NULL
 when checking bpc
Thread-Index: AQHVG7yCzZijsekvp0K2Cn4a3FIcG6aNUPql
Date: Wed, 5 Jun 2019 17:30:26 +0000
Message-ID: <BN6PR12MB1809805E1DE3D37B38E23F92F7160@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190605163359.19422-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190605163359.19422-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.161.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38aeb6f8-057c-4550-6ca2-08d6e9db7f94
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1492; 
x-ms-traffictypediagnostic: BN6PR12MB1492:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1492BD21ECE62C66A3E6AEFEF7160@BN6PR12MB1492.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(376002)(346002)(366004)(199004)(189003)(186003)(74316002)(256004)(105004)(71190400001)(6246003)(66066001)(19627405001)(606006)(229853002)(478600001)(25786009)(14454004)(76116006)(53546011)(66556008)(68736007)(2906002)(110136005)(54906003)(316002)(33656002)(81166006)(7696005)(486006)(9686003)(54896002)(6306002)(2501003)(966005)(71200400001)(53936002)(11346002)(3846002)(446003)(476003)(73956011)(81156014)(4326008)(76176011)(72206003)(6116002)(66946007)(6506007)(8936002)(8676002)(66446008)(86362001)(6436002)(64756008)(7736002)(52536014)(5660300002)(102836004)(26005)(99286004)(55016002)(66476007)(236005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1492;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SnjlnqJ1FP5yKkNTabxqTtiBLVY3DG61dusIWRvwZiX3CY7r/sL+s7TsL3rQ6fBN3NuAYdfGh3c8ymhJlPwi+4NjHfp8BBSZFQtHJanpXexwmYTviCSJfEPOvpFSg5ilzqpxDtuiU10v73pk8hU5anyQa9Qm32+GqExkEz+w+qvjyGEc3HQi7l4z71pd29sa0BwHZwCKtevytZ35ukzITlBQ0YZ5m297nDcrafWzn8XX+DuaYH5vyEjJe4FMZpiJdFpUyNrSgd+UgwarwISEoVojxvNKiibXKfPO6PgjPXM32au/eXph7cfXfy/biQ0jJLnmpIdORGXjpv+IL9RX4KeOfX3Xpl1SE//mQ2Gu5WuX3TX6QJn0lUqQ5thtMgl99sOeSGKocuGXT9cTqhQTP0lsfWGXop0ZNCz6SMFJ6ug=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38aeb6f8-057c-4550-6ca2-08d6e9db7f94
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 17:30:26.5615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1492
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+EI6shsL2jXd0mYpdOhJiEmDhTTR+RH8SaTNDPXxqg=;
 b=YWuATRkFJb/GuOQTBbDlSRsjckPgMHEhrTImZZm/WiySTX9BiS5SkCFW3zp3Edj3yfjR7oGR8JkasrTSKgEQ5b2nviqi+S6Wk5AB/irtZBfn9BOwMQg0DZUj3OfR3V2ePnW8WMArObuYz95ldvZM/VodXUoF0D6oH8V2CdJGfqA=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Wentland,
 Harry" <Harry.Wentland@amd.com>
Content-Type: multipart/mixed; boundary="===============0004345180=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0004345180==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809805E1DE3D37B38E23F92F7160BN6PR12MB1809namp_"

--_000_BN6PR12MB1809805E1DE3D37B38E23F92F7160BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Maybe add a reference to the bug report?
Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: Wednesday, June 5, 2019 12:33 PM
To: amd-gfx@lists.freedesktop.org
Cc: Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas
Subject: [PATCH] drm/amd/display: Use current connector state if NULL when =
checking bpc

[Why]
The old logic for checking which output depth to use relied on using
the current connector state rather than the new proposed state. This
was a problem when performing atomic commits since we weren't verifying
it against the incoming max_requested_bpc.

But switching this to only use the new state and not the current state
breaks filtering modes - it'll always assume that the maximum bpc
supported by the display is in use, which will cause certain modes
like 1440p@144Hz to be filtered even when using 8bpc.

[How]
Still use the connector->state if we aren't passed an explicit state.
This will respect the max_bpc the user currently has when filtering
modes.

Also remember to reset the default max_requested_bpc to 8 whenever
connector reset is called to retain old behavior when using the new
property.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a698c8f272ed..f627c17a1039 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3046,6 +3046,9 @@ convert_color_depth_from_display_info(const struct dr=
m_connector *connector,
 {
         uint32_t bpc =3D connector->display_info.bpc;

+       if (!state)
+               state =3D connector->state;
+
         if (state) {
                 bpc =3D state->max_bpc;
                 /* Round down to the nearest even number. */
@@ -3820,6 +3823,7 @@ void amdgpu_dm_connector_funcs_reset(struct drm_conne=
ctor *connector)
                 state->underscan_enable =3D false;
                 state->underscan_hborder =3D 0;
                 state->underscan_vborder =3D 0;
+               state->base.max_requested_bpc =3D 8;

                 __drm_atomic_helper_connector_reset(connector, &state->bas=
e);
         }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809805E1DE3D37B38E23F92F7160BN6PR12MB1809namp_
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
Maybe add a reference to the bug report?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nicho=
las.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> Wednesday, June 5, 2019 12:33 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas<br>
<b>Subject:</b> [PATCH] drm/amd/display: Use current connector state if NUL=
L when checking bpc</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[Why]<br>
The old logic for checking which output depth to use relied on using<br>
the current connector state rather than the new proposed state. This<br>
was a problem when performing atomic commits since we weren't verifying<br>
it against the incoming max_requested_bpc.<br>
<br>
But switching this to only use the new state and not the current state<br>
breaks filtering modes - it'll always assume that the maximum bpc<br>
supported by the display is in use, which will cause certain modes<br>
like 1440p@144Hz to be filtered even when using 8bpc.<br>
<br>
[How]<br>
Still use the connector-&gt;state if we aren't passed an explicit state.<br=
>
This will respect the max_bpc the user currently has when filtering<br>
modes.<br>
<br>
Also remember to reset the default max_requested_bpc to 8 whenever<br>
connector reset is called to retain old behavior when using the new<br>
property.<br>
<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Cc: Leo Li &lt;sunpeng.li@amd.com&gt;<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 &#43;&#43;&#43;=
&#43;<br>
&nbsp;1 file changed, 4 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index a698c8f272ed..f627c17a1039 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -3046,6 &#43;3046,9 @@ convert_color_depth_from_display_info(const struc=
t drm_connector *connector,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t bpc =3D connector=
-&gt;display_info.bpc;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!state)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; state =3D connector-&gt;state;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (state) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; bpc =3D state-&gt;max_bpc;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Round down to the nearest even number. */<br>
@@ -3820,6 &#43;3823,7 @@ void amdgpu_dm_connector_funcs_reset(struct drm_c=
onnector *connector)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; state-&gt;underscan_enable =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; state-&gt;underscan_hborder =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; state-&gt;underscan_vborder =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; state-&gt;base.max_requested_bpc =3D 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; __drm_atomic_helper_connector_reset(connector, &amp;s=
tate-&gt;base);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
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

--_000_BN6PR12MB1809805E1DE3D37B38E23F92F7160BN6PR12MB1809namp_--

--===============0004345180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0004345180==--

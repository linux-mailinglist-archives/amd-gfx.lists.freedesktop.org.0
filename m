Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4CB51C98
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 22:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F25789DDD;
	Mon, 24 Jun 2019 20:50:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700057.outbound.protection.outlook.com [40.107.70.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5137689DDD
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 20:50:25 +0000 (UTC)
Received: from MW2PR12MB2588.namprd12.prod.outlook.com (52.132.181.19) by
 MW2PR12MB2476.namprd12.prod.outlook.com (52.132.180.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 20:50:19 +0000
Received: from MW2PR12MB2588.namprd12.prod.outlook.com
 ([fe80::c1ee:9e63:73d5:e3c8]) by MW2PR12MB2588.namprd12.prod.outlook.com
 ([fe80::c1ee:9e63:73d5:e3c8%6]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 20:50:19 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amd/display: update infoframe after dig fe is
 turned on (v2)
Thread-Topic: [PATCH v2] drm/amd/display: update infoframe after dig fe is
 turned on (v2)
Thread-Index: AQHVKrZ+BEDxPvMLNU6kORHBiB7DkqarF/OAgAAve4A=
Date: Mon, 24 Jun 2019 20:50:19 +0000
Message-ID: <7aee30c2-f90d-8bc4-3fe3-10c0ff2d8b12@amd.com>
References: <20190624175847.26253-1-nicholas.kazlauskas@amd.com>
 <BN6PR12MB18091CE5FB4DD0A59853D849F7E00@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB18091CE5FB4DD0A59853D849F7E00@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::46) To MW2PR12MB2588.namprd12.prod.outlook.com
 (2603:10b6:907:a::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efe0ab15-3924-4d7f-4da8-08d6f8e591a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MW2PR12MB2476; 
x-ms-traffictypediagnostic: MW2PR12MB2476:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MW2PR12MB2476EA9F6770C70A5C6847D8F9E00@MW2PR12MB2476.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(366004)(136003)(376002)(199004)(189003)(52116002)(25786009)(2906002)(31696002)(2351001)(76176011)(31686004)(2501003)(36756003)(53936002)(478600001)(99286004)(54896002)(11346002)(446003)(236005)(105004)(6436002)(316002)(6306002)(5640700003)(14454004)(6246003)(66066001)(68736007)(6916009)(3846002)(15650500001)(606006)(966005)(14444005)(72206003)(26005)(486006)(2616005)(476003)(8936002)(256004)(73956011)(81156014)(81166006)(6116002)(86362001)(19627405001)(66476007)(5660300002)(7736002)(66946007)(186003)(71200400001)(6486002)(229853002)(386003)(6506007)(53546011)(8676002)(66446008)(71190400001)(66556008)(64756008)(102836004)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2476;
 H:MW2PR12MB2588.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3IiJM/pr46J/38/SXhk7rKw+u4qGd0ii3701OB0a7FB+jioAuqi6nsJ5VAiEHGSF7Tgw++ReWS6KgOBiPG5qmnaxzejESsnelnRip3OWBfJYlIMQjxcBeXNZ8iCU2bGY7dzRfKW61/4Ayc/NTgkB1xvbLKjTs8FXIyii8737mD3uTQDMMcxVfdTOKZ8pyZaLXM9M9C14IE38p+Nv5CV7a1nrrmyvFHEDTNhL9DpTa9tHk0OW9KGR/qUVbpm0vwK5kvlrbRVMl7OYZZqIOAfp+XzBfBVMj3goynUuNML58spSblNTz6FWB8HYjP3Hv606Z3uui3/quQLjGkly2CeZmA57zbYN0KWeonkr0S6iEaSALxvIB1xCA/EBl5L7xjXApUV4xQ3+v5nMjRznrlwZp0RTcovLvPQ/yS/9jNKvZME=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe0ab15-3924-4d7f-4da8-08d6f8e591a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 20:50:19.7787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: blakha@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2476
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPD2gD9IE2nf5Kb3iRoccQLmHSCqHezoaMDjjhpHEl0=;
 b=clGxM0Nk3SUSR8psqq3dJjOqgZay8SBqWwQmjiNE06JcYN6lpMrA6h+urT7+0gyr/53DmPX4Dvb4bx9qmz62goU0PKPyNBNJpMWcprdC3VIcv0hbwHjQ63aUYM29a+3+/7W2sWkrLda8PInXl0m/okfsNmc5kPCJyoVBJxO17yI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0922563419=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0922563419==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_7aee30c2f90d8bc43fe310c0ff2d8b12amdcom_"

--_000_7aee30c2f90d8bc43fe310c0ff2d8b12amdcom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com><mailto:Bhawanpre=
et.Lakha@amd.com>



On 2019-06-24 2:00 p.m., Deucher, Alexander wrote:
Acked-by: Alex Deucher <alexander.deucher@amd.com><mailto:alexander.deucher=
@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org><mailto:amd-gfx-bounce=
s@lists.freedesktop.org> on behalf of Nicholas Kazlauskas <nicholas.kazlaus=
kas@amd.com><mailto:nicholas.kazlauskas@amd.com>
Sent: Monday, June 24, 2019 1:58 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas; Li, Roman
Subject: [PATCH v2] drm/amd/display: update infoframe after dig fe is turne=
d on (v2)

[Why]
The AVI infoframe is incorrectly programmed on DCN1/2 when enabling a
stream - causing the wrong pixel encoding to be used for display.

This is because the AVI infoframe is programmed before the DIG BE is
connected to the FE and turned on, so enabling the AFMT block doesn't
actually work and the registers subsequently can't be written to.

[How]
Program the infoframe *after* turning on the DIG FE. This was the
behavior previously used but it was incorrectly reverted
when adding the DCN2 HW sequencer code.

v2: Don't call update_info_frame twice

Fixes: 54ff35915948 ("drm/amd/display: Add DCN2 HW Sequencer and Resource")

Cc: Harry Wentland <harry.wentland@amd.com><mailto:harry.wentland@amd.com>
Cc: Roman Li <roman.li@amd.com><mailto:roman.li@amd.com>
Cc: Leo Li <sunpeng.li@amd.com><mailto:sunpeng.li@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com><mailto:nic=
holas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/=
drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
index 940e74b7d2c6..84d90b475e2a 100644
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
+++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c
@@ -686,6 +686,7 @@ void dce110_enable_stream(struct pipe_ctx *pipe_ctx)
                                                         dmdata_dp : dmdata=
_hdmi);
         }
 #endif
+       dce110_update_info_frame(pipe_ctx);

         /* enable early control to avoid corruption on DP monitor*/
         active_total_with_borders =3D
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx



_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_7aee30c2f90d8bc43fe310c0ff2d8b12amdcom_
Content-Type: text/html; charset="Windows-1252"
Content-ID: <E120798005CE384294B9CCC5380A05F3@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body text=3D"#000000" bgcolor=3D"#FFFFFF">
<p>Reviewed-by: Bhawanpreet Lakha <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:Bhawanpreet.Lakha@amd.com">
&lt;Bhawanpreet.Lakha@amd.com&gt;</a></p>
<p><br>
</p>
<p><br>
</p>
<div class=3D"moz-cite-prefix">On 2019-06-24 2:00 p.m., Deucher, Alexander =
wrote:<br>
</div>
<blockquote type=3D"cite" cite=3D"mid:BN6PR12MB18091CE5FB4DD0A59853D849F7E0=
0@BN6PR12MB1809.namprd12.prod.outlook.com">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:al=
exander.deucher@amd.com">
&lt;alexander.deucher@amd.com&gt;</a><br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;
        font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:amd-gfx-bounces@lists.fre=
edesktop.org">
&lt;amd-gfx-bounces@lists.freedesktop.org&gt;</a> on behalf of Nicholas Kaz=
lauskas <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:nicholas.kazlausk=
as@amd.com">
&lt;nicholas.kazlauskas@amd.com&gt;</a><br>
<b>Sent:</b> Monday, June 24, 2019 1:58 PM<br>
<b>To:</b> <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lis=
ts.freedesktop.org">
amd-gfx@lists.freedesktop.org</a><br>
<b>Cc:</b> Li, Sun peng (Leo); Wentland, Harry; Kazlauskas, Nicholas; Li, R=
oman<br>
<b>Subject:</b> [PATCH v2] drm/amd/display: update infoframe after dig fe i=
s turned on (v2)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">[Why]<br>
The AVI infoframe is incorrectly programmed on DCN1/2 when enabling a<br>
stream - causing the wrong pixel encoding to be used for display.<br>
<br>
This is because the AVI infoframe is programmed before the DIG BE is<br>
connected to the FE and turned on, so enabling the AFMT block doesn't<br>
actually work and the registers subsequently can't be written to.<br>
<br>
[How]<br>
Program the infoframe *after* turning on the DIG FE. This was the<br>
behavior previously used but it was incorrectly reverted<br>
when adding the DCN2 HW sequencer code.<br>
<br>
v2: Don't call update_info_frame twice<br>
<br>
Fixes: 54ff35915948 (&quot;drm/amd/display: Add DCN2 HW Sequencer and Resou=
rce&quot;)<br>
<br>
Cc: Harry Wentland <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:harry.=
wentland@amd.com">
&lt;harry.wentland@amd.com&gt;</a><br>
Cc: Roman Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:roman.li@amd=
.com">&lt;roman.li@amd.com&gt;</a><br>
Cc: Leo Li <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sunpeng.li@amd=
.com">&lt;sunpeng.li@amd.com&gt;</a><br>
Signed-off-by: Nicholas Kazlauskas <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:nicholas.kazlauskas@amd.com">
&lt;nicholas.kazlauskas@amd.com&gt;</a><br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 1 &#43;=
<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c b/=
drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c<br>
index 940e74b7d2c6..84d90b475e2a 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer=
.c<br>
@@ -686,6 &#43;686,7 @@ void dce110_enable_stream(struct pipe_ctx *pipe_ctx=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dmdata_dp : dmdata_hdmi);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;#endif<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce110_update_info_frame(pipe_ctx=
);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* enable early control to=
 avoid corruption on DP monitor*/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; active_total_with_borders =
=3D<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freedesk=
top.org">amd-gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" moz-do-n=
ot-send=3D"true">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>=
</div>
</span></font></div>
<br>
<fieldset class=3D"mimeAttachmentHeader"></fieldset>
<pre class=3D"moz-quote-pre" wrap=3D"">____________________________________=
___________
amd-gfx mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freedesk=
top.org">amd-gfx@lists.freedesktop.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.freedesktop.org/ma=
ilman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-=
gfx</a></pre>
</blockquote>
</body>
</html>

--_000_7aee30c2f90d8bc43fe310c0ff2d8b12amdcom_--

--===============0922563419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0922563419==--

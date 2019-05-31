Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300993128B
	for <lists+amd-gfx@lfdr.de>; Fri, 31 May 2019 18:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB4F893EB;
	Fri, 31 May 2019 16:39:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790081.outbound.protection.outlook.com [40.107.79.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C2F893EB
 for <amd-gfx@lists.freedesktop.org>; Fri, 31 May 2019 16:39:11 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1219.namprd12.prod.outlook.com (10.168.227.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.23; Fri, 31 May 2019 16:39:09 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1922.021; Fri, 31 May 2019
 16:39:09 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/display: Add back missing hw translate init for
 DCN1_01
Thread-Topic: [PATCH] drm/amd/display: Add back missing hw translate init for
 DCN1_01
Thread-Index: AQHVF8qwrrQ0vloLv0iulSPDthg9gKaFbxJ0
Date: Fri, 31 May 2019 16:39:09 +0000
Message-ID: <BN6PR12MB1809798F052B0D47409C4E05F7190@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190531160526.28279-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190531160526.28279-1-nicholas.kazlauskas@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.72.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bef9d599-1046-4aa7-053a-08d6e5e6817e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1219; 
x-ms-traffictypediagnostic: BN6PR12MB1219:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB121996B4EEE9B8600431AABDF7190@BN6PR12MB1219.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(346002)(136003)(396003)(376002)(199004)(189003)(478600001)(2501003)(66066001)(110136005)(72206003)(71190400001)(186003)(6506007)(6246003)(26005)(53936002)(71200400001)(5660300002)(7736002)(102836004)(9686003)(316002)(52536014)(54896002)(6306002)(68736007)(53546011)(966005)(55016002)(86362001)(66556008)(66946007)(446003)(66446008)(4326008)(229853002)(14454004)(476003)(256004)(8676002)(105004)(2906002)(99286004)(19627405001)(76176011)(8936002)(3846002)(606006)(6436002)(73956011)(25786009)(66476007)(6116002)(74316002)(33656002)(76116006)(81166006)(64756008)(7696005)(11346002)(236005)(81156014)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1219;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iPzMqx1i7h8OA/YLbM8nG4w/1TxtBFlALpQox/330MUbueBpw/OrVnmobdKhgn9dYjXbetEhysQ6zypJeb/HbQyF4+V7kozP2aCnLj267CBQoy/thR84m/wRLCghbmYNbuDznfTdAJBGi3jUH8gYYkAEcPWI/HzadoiqKuK+CKIx+bqOYs2upNPsGr3Q4AD0dEz/rCI2Tsa1pYrMLFmHKQqXpoHOE5UQCVQhQNHxShBBw+x1Joc0yCQRIKCKJvpeps+P4q6DVYAhVfvUTjmm34+ZFUHio2qlaHj1b+iXfboaBTSSK1GmDBIdcT30YpYvIL/ARLRZfPuiyHK2V5ERHv1dzFYKG9SDNqMFw4VCnL/C8ptKGFdnBeci4Co2Z/o+2X4hegmA/OL/eiLTQyI2dt/2iQA5oVSqWhE8Y58GfJI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef9d599-1046-4aa7-053a-08d6e5e6817e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 16:39:09.5630 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1219
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWu1UYAYp0SIkrB6HRwRiOv2DOknBBLI/sFhlChWjWk=;
 b=e/LVQKY0R1W3a1RFhwZfrEAsWHREkpmcuJDb5GLr/aDfeTxqomD1687UTL7dicghBNxIq6SF/8zlOoa8TQxns35lSRvSpclKq44fqrzv0z/TaRnS1/IpLQXDECHROuTgSZ2GyA4KOG5N8flbdCNxiH0udRgM4Z8AMeuZ3atYPnQ=
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
Content-Type: multipart/mixed; boundary="===============0653380804=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0653380804==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809798F052B0D47409C4E05F7190BN6PR12MB1809namp_"

--_000_BN6PR12MB1809798F052B0D47409C4E05F7190BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Nicholas=
 Kazlauskas <nicholas.kazlauskas@amd.com>
Sent: Friday, May 31, 2019 12:05 PM
To: amd-gfx@lists.freedesktop.org
Cc: Wentland, Harry; Kazlauskas, Nicholas
Subject: [PATCH] drm/amd/display: Add back missing hw translate init for DC=
N1_01

[Why]
DCN_VERSION_1_01 is no longer handled in the dal_hw_translate_init
switch since it was inadvertently dropped in the patch that removed the
unnecessary DCN1_01 guards.

This caused numerous regressions on DCN1_01 when loading the driver.

[How]
Add it back.

Cc: Harry Wentland <harry.wentland@amd.com>
Fixes: 97df424fe7a7 ("drm/amd/display: Drop DCN1_01 guards")
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c b/drivers/g=
pu/drm/amd/display/dc/gpio/hw_translate.c
index 77615146b96e..1f9833dc8cfe 100644
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
+++ b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c
@@ -81,6 +81,7 @@ bool dal_hw_translate_init(
                 return true;
 #if defined(CONFIG_DRM_AMD_DC_DCN1_0)
         case DCN_VERSION_1_0:
+       case DCN_VERSION_1_01:
                 dal_hw_translate_dcn10_init(translate);
                 return true;
 #endif
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809798F052B0D47409C4E05F7190BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Nicholas Kazlauskas &lt;nic=
holas.kazlauskas@amd.com&gt;<br>
<b>Sent:</b> Friday, May 31, 2019 12:05 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Wentland, Harry; Kazlauskas, Nicholas<br>
<b>Subject:</b> [PATCH] drm/amd/display: Add back missing hw translate init=
 for DCN1_01</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">[Why]<br>
DCN_VERSION_1_01 is no longer handled in the dal_hw_translate_init<br>
switch since it was inadvertently dropped in the patch that removed the<br>
unnecessary DCN1_01 guards.<br>
<br>
This caused numerous regressions on DCN1_01 when loading the driver.<br>
<br>
[How]<br>
Add it back.<br>
<br>
Cc: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
Fixes: 97df424fe7a7 (&quot;drm/amd/display: Drop DCN1_01 guards&quot;)<br>
Signed-off-by: Nicholas Kazlauskas &lt;nicholas.kazlauskas@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c b/drivers/g=
pu/drm/amd/display/dc/gpio/hw_translate.c<br>
index 77615146b96e..1f9833dc8cfe 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/dc/gpio/hw_translate.c<br>
@@ -81,6 &#43;81,7 @@ bool dal_hw_translate_init(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return true;<br>
&nbsp;#if defined(CONFIG_DRM_AMD_DC_DCN1_0)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DCN_VERSION_1_0:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case DCN_VERSION_1_01:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; dal_hw_translate_dcn10_init(translate);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return true;<br>
&nbsp;#endif<br>
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

--_000_BN6PR12MB1809798F052B0D47409C4E05F7190BN6PR12MB1809namp_--

--===============0653380804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0653380804==--

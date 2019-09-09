Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB4AD9D1
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 15:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084FC89B12;
	Mon,  9 Sep 2019 13:17:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800078.outbound.protection.outlook.com [40.107.80.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E84689B12
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 13:17:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtgyuAl2yxeCfPaRtJ+9iAgCyrWKOqJgFWenUXacSVdrfNv8/CmKmdOipTMZUNU20FtVGKzyM5ti4bgN7Q4GrFM3PXlUmhHhDAyScISLImWQeqnQnQ3eT/oxg5MKGPcnsnkHPRv9+mBmTWj7/nYwvhmd066Zhr6GjDEmotTkpPWuQbhAjJo0P27N3QTBqi5tfi20Q27PGXBcA1VQGgWO+69TQE4u0EgytkewPMxD0rSSe+dJ013PCMNYF3vaRKbNqVyUyV8oAwZOjS8lhFAyirbmkQcUAHEFtLKPzA4EU7Nw28oGkGTPpdigNAp1uNtQ8KFP4WB36cEWJwHnNbpFEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE6lIW47cvB9D9u2jmLLENdnB9RoeCm3KJ2rFd9rxRQ=;
 b=lftuDJrH1teYak5OctdEoXS8kAFq3u5bj6E3POeI2dLZPP/KwfL0xTKr360LsefEJ7tyDKr9cP1DpFAIo9z17qJH9VN2A6boO3xo7idwsvWynzjPyKPKM+e5x4a9ERNiVTcSVmCymlLqh2CAof+RzCeMxmGHl8qsj2GZ6dZetdCJcXlZUuVcMZIB8TeRPi4XVOycg51zw9QcENXpeBQ558EPUHdp4+uDHA+yNelVR8j9GJrsxGeeIi+P6akne2VKK72MkhjgI0twstpBOKXET46E71mh2zfCxXaINFVYoT7toLrFhMo6qLiX3whOqGium1ruSQevZGgkSgUL2FdOKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3056.namprd12.prod.outlook.com (20.178.242.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 13:17:41 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 13:17:41 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_arcturus.h
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_arcturus.h
Thread-Index: AQHVZwJ1j09z2CsVZEWI7bvhRum5A6cjU8PC
Date: Mon, 9 Sep 2019 13:17:40 +0000
Message-ID: <MN2PR12MB329671D3DA7398FB0610418CA2B70@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190909113311.28497-1-evan.quan@amd.com>,
 <20190909113311.28497-2-evan.quan@amd.com>
In-Reply-To: <20190909113311.28497-2-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.141.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b358034-37e3-496f-f269-08d7352817e7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3056; 
x-ms-traffictypediagnostic: MN2PR12MB3056:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3056C2A9ADBDDD35B1B4000EA2B70@MN2PR12MB3056.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(199004)(189003)(2906002)(66556008)(66066001)(81156014)(5660300002)(7696005)(7736002)(74316002)(66946007)(66476007)(81166006)(8936002)(8676002)(102836004)(229853002)(6506007)(53546011)(26005)(6436002)(186003)(76116006)(76176011)(105004)(486006)(476003)(446003)(11346002)(53936002)(6246003)(236005)(9686003)(54896002)(6306002)(55016002)(316002)(110136005)(4326008)(256004)(54906003)(2501003)(25786009)(64756008)(66446008)(91956017)(33656002)(52536014)(6116002)(19627405001)(15650500001)(3846002)(478600001)(14454004)(966005)(14444005)(86362001)(606006)(71200400001)(99286004)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3056;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6qci0XSDi0v2xOIDNr5OE7X1+wPC4jgx7vLIef1eMh4ogPMoVahOKDpuAk+8hnd5hpP7RUKukwKjtbdytVpfzd7xWL/fOpTc1Lj84y+aQYyrz84fLK3GsV0WnTECiratV3FnTrrLnc+JGV7rvqiBR32fmgnf2wAqPkbVcC1WoAK7ko6JcsbvvlyD1+9VktY7elIgD2DlR/1Uq8gGSyeZHLaP0CzbAstgegO9mxhYSuPa85pYdRMo06fp7CxJLW1uOacBXBd2A3WRgWMthqyEnoBiWTyHPKz1LEJzIHx/gmYlONSzlqAu7H+KiO1GxZCIq4aaXICR89hdVDQkGOCYJyGLgagaifgQK7/h9VJXe8fV94ENxNF6Cw+7VVD3tStKAvFpCoinQwFwSxVa/9fywWpI72ets/h8KJ38AGAc410=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b358034-37e3-496f-f269-08d7352817e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 13:17:40.9776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O5NrzkngiYgFvST1z1iHkdFN+roZx3B4SzD+Ezs4HAyPXAnzeGhZJU0cYMSyvUYq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3056
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LE6lIW47cvB9D9u2jmLLENdnB9RoeCm3KJ2rFd9rxRQ=;
 b=m/i0uJyUlFeO8JXFUJW2tOtUjABqJDYcxRHD7mxXpUDXra405GHwWXRn+JgY9C34pLfrsDmrrIPocfaxV2QDQmqfqeOq/xB7/yFfM0YyHfb3FV8u/zUK938zsEDBOAuGPaDGBYJOKrJ8/PHUDe4cpamrqKImJYdKqP/VFazOl4A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Cc: "Li, Candice" <Candice.Li@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>
Content-Type: multipart/mixed; boundary="===============0371146703=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0371146703==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329671D3DA7398FB0610418CA2B70MN2PR12MB3296namp_"

--_000_MN2PR12MB329671D3DA7398FB0610418CA2B70MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Quan, Ev=
an <Evan.Quan@amd.com>
Sent: Monday, September 9, 2019 7:33 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Li, Candice <Candice.Li@amd.com>; Gui, Jack <Jack.Gui@amd.com>; Quan, E=
van <Evan.Quan@amd.com>
Subject: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_arcturus.h

Also bump the SMU11_DRIVER_IF_VERSION_ARCT.

Change-Id: I786047d93bf4e1f0905069e2c742479740778fe6
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 .../gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h    | 6 +++++-
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h               | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h b=
/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
index e02950b505fa..40a51a141336 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
@@ -696,7 +696,11 @@ typedef struct {
   uint8_t      GpioI2cSda;          // Serial Data
   uint16_t     GpioPadding;

-  uint32_t     BoardReserved[9];
+  // Platform input telemetry voltage coefficient
+  uint32_t     BoardVoltageCoeffA;    // decode by /1000
+  uint32_t     BoardVoltageCoeffB;    // decode by /1000
+
+  uint32_t     BoardReserved[7];

   // Padding for MMHUB - do not modify this
   uint32_t     MmHubPadding[8]; // SMU internal use
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h
index b1e370e19d22..3b9e3a277ded 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -27,7 +27,7 @@

 #define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF
 #define SMU11_DRIVER_IF_VERSION_VG20 0x13
-#define SMU11_DRIVER_IF_VERSION_ARCT 0x09
+#define SMU11_DRIVER_IF_VERSION_ARCT 0x0A
 #define SMU11_DRIVER_IF_VERSION_NV10 0x33
 #define SMU11_DRIVER_IF_VERSION_NV12 0x33
 #define SMU11_DRIVER_IF_VERSION_NV14 0x34
--
2.23.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB329671D3DA7398FB0610418CA2B70MN2PR12MB3296namp_
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
<div id=3D"appendonsend" style=3D"font-family: Calibri, Arial, Helvetica, s=
ans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Quan, Evan &lt;Evan.Quan@amd.=
com&gt;<br>
<b>Sent:</b> Monday, September 9, 2019 7:33 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Li, Candice &lt;Candice.Li@amd.com&gt;; Gui, Jack &lt;Jack.Gui@a=
md.com&gt;; Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_arctu=
rus.h</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Also bump the SMU11_DRIVER_IF_VERSION_ARCT.<br>
<br>
Change-Id: I786047d93bf4e1f0905069e2c742479740778fe6<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;.../gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h&nbsp;&nbsp;&=
nbsp; | 6 &#43;&#43;&#43;&#43;&#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 &#43;-<br>
&nbsp;2 files changed, 6 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h b=
/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h<br>
index e02950b505fa..40a51a141336 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturu=
s.h<br>
@@ -696,7 &#43;696,11 @@ typedef struct {<br>
&nbsp;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GpioI2cSda;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Serial Data<br>
&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp; GpioPadding;<br>
&nbsp;<br>
-&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; BoardReserved[9];<br>
&#43;&nbsp; // Platform input telemetry voltage coefficient<br>
&#43;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; BoardVoltageCoeffA;&nbsp;&nbsp=
;&nbsp; // decode by /1000<br>
&#43;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; BoardVoltageCoeffB;&nbsp;&nbsp=
;&nbsp; // decode by /1000<br>
&#43;<br>
&#43;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; BoardReserved[7];<br>
&nbsp;<br>
&nbsp;&nbsp; // Padding for MMHUB - do not modify this<br>
&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MmHubPadding[8]; // SMU inter=
nal use<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h<br>
index b1e370e19d22..3b9e3a277ded 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
@@ -27,7 &#43;27,7 @@<br>
&nbsp;<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_VG20 0x13<br>
-#define SMU11_DRIVER_IF_VERSION_ARCT 0x09<br>
&#43;#define SMU11_DRIVER_IF_VERSION_ARCT 0x0A<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_NV10 0x33<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_NV12 0x33<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_NV14 0x34<br>
-- <br>
2.23.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB329671D3DA7398FB0610418CA2B70MN2PR12MB3296namp_--

--===============0371146703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0371146703==--

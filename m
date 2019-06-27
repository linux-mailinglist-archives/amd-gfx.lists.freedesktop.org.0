Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B29F58606
	for <lists+amd-gfx@lfdr.de>; Thu, 27 Jun 2019 17:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C18E6E5BE;
	Thu, 27 Jun 2019 15:38:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710056.outbound.protection.outlook.com [40.107.71.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F816E5BE
 for <amd-gfx@lists.freedesktop.org>; Thu, 27 Jun 2019 15:38:09 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1923.namprd12.prod.outlook.com (10.175.101.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 15:38:08 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 15:38:08 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h
Thread-Topic: [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h
Thread-Index: AQHVLLSICwiypx9jZUWqZlYxOVXI4qavoyko
Date: Thu, 27 Jun 2019 15:38:07 +0000
Message-ID: <BN6PR12MB18093E64A4289711D31BCED8F7FD0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1561618176-27968-1-git-send-email-tianci.yin@amd.com>
In-Reply-To: <1561618176-27968-1-git-send-email-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7997c80-feaa-484f-defd-08d6fb157420
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1923; 
x-ms-traffictypediagnostic: BN6PR12MB1923:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB19238F979E30E0A9096AC49FF7FD0@BN6PR12MB1923.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(136003)(346002)(366004)(199004)(189003)(64756008)(66556008)(478600001)(2906002)(99286004)(19627405001)(229853002)(316002)(606006)(6506007)(5660300002)(71190400001)(71200400001)(7696005)(105004)(446003)(66476007)(66066001)(86362001)(236005)(73956011)(11346002)(476003)(54906003)(76116006)(6436002)(110136005)(186003)(26005)(76176011)(66446008)(55016002)(54896002)(6306002)(486006)(9686003)(66946007)(7736002)(72206003)(52536014)(102836004)(14444005)(966005)(256004)(81166006)(81156014)(33656002)(25786009)(53936002)(14454004)(15650500001)(2501003)(68736007)(6116002)(3846002)(4326008)(8936002)(6246003)(74316002)(53546011)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1923;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nWCUG+s+5Td0OntDH7HC7AhYw7AMK64u5oVYQ6h14AhpyKJ80Dn1Meeio9GeMfCQ6lb/ybsPm6NqCmpy9PdQkBmbGMY/lerEMoY/I+0r33mK1NGUZkGRxSbujPbBrRV6VXwHIjq7UHoMvnZgvEMBXBl96SaShQB7zj8sMkzVbQcehGqCOeYe1la8/DZ6gJrDYACMCryi7AHIhOn8iVhw4ULh00PLY5sjjpbq2jD73y5roQhkU2NqTWw4U+Nqv2WKWW8JGh5Mh7Qeo6pW0IOtb+flwHSzoxB7D47gAw2d83r1MsvL9PdO5IMAGqy4fumRmDNyR2cKly17vqJGVBE3lHqDC2z3oeM5fdJaPt/eC1kZPgrF6JFRPVt03iqH618Rze6b+9T8/Vc/Ewtass55IMRbiziEvVG3n2J1aCx6cjo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7997c80-feaa-484f-defd-08d6fb157420
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 15:38:07.9298 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1923
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=equO+wGBOvmNO85Ao4hsWFOLiAO5VouWGiFUG+/Ib3I=;
 b=YS7JBtGVbopAK5ihKzvzmMbRkvkqD2houP/sVzkL3CbdqRFj/EoYR9+PXXclTATqgw1mal/Iq62S0K6D84833RXeIFHdme4MwR7jswf0nuwD8IvGrAmqew+1UnhvPVD2K0a4YOHPO5SZQCyzhMlAy1Fa8eY0nGkLVasRIgHIcj4=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0121678408=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0121678408==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18093E64A4289711D31BCED8F7FD0BN6PR12MB1809namp_"

--_000_BN6PR12MB18093E64A4289711D31BCED8F7FD0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Tianci Y=
in <tianci.yin@amd.com>
Sent: Thursday, June 27, 2019 2:49 AM
To: amd-gfx@lists.freedesktop.org
Cc: Xiao, Jack; Yin, Tianci (Rico); Zhang, Hawking
Subject: [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h

From: tiancyin <tianci.yin@amd.com>

update the smu11_driver_if_navi10.h since navi10 smu fw
update to 42.28

Signed-off-by: tiancyin <tianci.yin@amd.com>
---
 drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h | 6 +++---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c                 | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h b/d=
rivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
index a8b31bc..adbbfeb 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
@@ -26,7 +26,7 @@
 // *** IMPORTANT ***
 // SMU TEAM: Always increment the interface version if
 // any structure is changed in this file
-#define SMU11_DRIVER_IF_VERSION 0x32
+#define SMU11_DRIVER_IF_VERSION 0x33

 #define PPTABLE_NV10_SMU_VERSION 8

@@ -813,8 +813,8 @@ typedef struct {
   uint16_t     UclkAverageLpfTau;
   uint16_t     GfxActivityLpfTau;
   uint16_t     UclkActivityLpfTau;
+  uint16_t     SocketPowerLpfTau;

-  uint16_t     Padding;
   // Padding - ignore
   uint32_t     MmHubPadding[8]; // SMU internal use
 } DriverSmuConfig_t;
@@ -853,7 +853,7 @@ typedef struct {
   uint8_t  CurrGfxVoltageOffset  ;
   uint8_t  CurrMemVidOffset      ;
   uint8_t  Padding8              ;
-  uint16_t CurrSocketPower       ;
+  uint16_t AverageSocketPower    ;
   uint16_t TemperatureEdge       ;
   uint16_t TemperatureHotspot    ;
   uint16_t TemperatureMem        ;
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 99566de..373aeba 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -863,7 +863,7 @@ static int navi10_get_gpu_power(struct smu_context *smu=
, uint32_t *value)
         if (ret)
                 return ret;

-       *value =3D metrics.CurrSocketPower << 8;
+       *value =3D metrics.AverageSocketPower << 8;

         return 0;
 }
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18093E64A4289711D31BCED8F7FD0BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Tianci Yin &lt;tianci.yin@amd=
.com&gt;<br>
<b>Sent:</b> Thursday, June 27, 2019 2:49 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Xiao, Jack; Yin, Tianci (Rico); Zhang, Hawking<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: tiancyin &lt;tianci.yin@amd.com&gt;<br>
<br>
update the smu11_driver_if_navi10.h since navi10 smu fw<br>
update to 42.28<br>
<br>
Signed-off-by: tiancyin &lt;tianci.yin@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h | 6 &#43;&=
#43;&#43;---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 &=
#43;-<br>
&nbsp;2 files changed, 4 insertions(&#43;), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h b/d=
rivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h<br>
index a8b31bc..adbbfeb 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.=
h<br>
@@ -26,7 &#43;26,7 @@<br>
&nbsp;// *** IMPORTANT ***<br>
&nbsp;// SMU TEAM: Always increment the interface version if <br>
&nbsp;// any structure is changed in this file<br>
-#define SMU11_DRIVER_IF_VERSION 0x32<br>
&#43;#define SMU11_DRIVER_IF_VERSION 0x33<br>
&nbsp;<br>
&nbsp;#define PPTABLE_NV10_SMU_VERSION 8<br>
&nbsp;<br>
@@ -813,8 &#43;813,8 @@ typedef struct {<br>
&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp; UclkAverageLpfTau;<br>
&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp; GfxActivityLpfTau;<br>
&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp; UclkActivityLpfTau;<br>
&#43;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp; SocketPowerLpfTau;<br>
&nbsp;<br>
-&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp; Padding;&nbsp; <br>
&nbsp;&nbsp; // Padding - ignore<br>
&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MmHubPadding[8]; // SMU inter=
nal use<br>
&nbsp;} DriverSmuConfig_t;<br>
@@ -853,7 &#43;853,7 @@ typedef struct {<br>
&nbsp;&nbsp; uint8_t&nbsp; CurrGfxVoltageOffset&nbsp; ;<br>
&nbsp;&nbsp; uint8_t&nbsp; CurrMemVidOffset&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;=
<br>
&nbsp;&nbsp; uint8_t&nbsp; Padding8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;<br>
-&nbsp; uint16_t CurrSocketPower&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;<br>
&#43;&nbsp; uint16_t AverageSocketPower&nbsp;&nbsp;&nbsp; ;<br>
&nbsp;&nbsp; uint16_t TemperatureEdge&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;=
<br>
&nbsp;&nbsp; uint16_t TemperatureHotspot&nbsp;&nbsp;&nbsp; ;<br>
&nbsp;&nbsp; uint16_t TemperatureMem&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 99566de..373aeba 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -863,7 &#43;863,7 @@ static int navi10_get_gpu_power(struct smu_context =
*smu, uint32_t *value)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value =3D metrics.CurrSocketPower &l=
t;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value =3D metrics.AverageSocketP=
ower &lt;&lt; 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18093E64A4289711D31BCED8F7FD0BN6PR12MB1809namp_--

--===============0121678408==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0121678408==--

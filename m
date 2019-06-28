Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129259487
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 09:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29786E889;
	Fri, 28 Jun 2019 07:01:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780041.outbound.protection.outlook.com [40.107.78.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9E76E889
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 07:01:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=B0dIAiVkltXh2bx3Ejc3NQkD0cl895fLT3fQK1Hoz3cq34YUw1OJW1GoYaT61JbNASvtqGVKUXkO7aWWuqCD7R+tzd8PWsICkW3Sf4yAHpjwGZtFl8Nj0shx53lkr+a40VawDYbhV+EpaWzyRVa1HjF4lMauW1uToQJSG7Mpmz8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSFbBtCw2p3umy977sN8FiQA6b+jhDkv79p4z1yE9EY=;
 b=YELVp+VlTwjxUIXqsy/tE+Cwq4Oh41D7t9gx+CCGQCOdtBAln8qZ5la4mSL8e7Ckg+S6hYTcRHOBIABqzM9Pesin34G/SV1ujlB8QEK7Mf251Otc9XPRTFBdvyoHWB6WQCDVjLjloZwSmYnLd/K1cFrdWJ+4zXND+LI5lGNwVew=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from MN2PR12MB2974.namprd12.prod.outlook.com (20.178.240.140) by
 MN2PR12MB3053.namprd12.prod.outlook.com (20.178.241.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 07:01:44 +0000
Received: from MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::18c9:4b9:2b9e:2c62]) by MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::18c9:4b9:2b9e:2c62%7]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 07:01:43 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h
Thread-Topic: [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h
Thread-Index: AQHVLLSM74SXTH7Ez0y0WUEu0soRwqavoziAgAEB7sk=
Date: Fri, 28 Jun 2019 07:01:43 +0000
Message-ID: <MN2PR12MB29749635290092A031CB5A4C95FC0@MN2PR12MB2974.namprd12.prod.outlook.com>
References: <1561618176-27968-1-git-send-email-tianci.yin@amd.com>,
 <BN6PR12MB18093E64A4289711D31BCED8F7FD0@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB18093E64A4289711D31BCED8F7FD0@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 84a605a5-8ddf-4292-31d9-08d6fb967a91
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3053; 
x-ms-traffictypediagnostic: MN2PR12MB3053:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB30532EBE297FE576C1712C1B95FC0@MN2PR12MB3053.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(39860400002)(396003)(376002)(366004)(199004)(189003)(11346002)(55016002)(2501003)(236005)(229853002)(446003)(68736007)(6436002)(53936002)(486006)(105004)(54896002)(14444005)(256004)(6116002)(25786009)(19627405001)(9686003)(6306002)(8936002)(33656002)(81156014)(7696005)(81166006)(476003)(76176011)(3846002)(2906002)(8676002)(73956011)(316002)(4326008)(66446008)(102836004)(66476007)(66946007)(64756008)(66556008)(186003)(52536014)(72206003)(14454004)(99286004)(71190400001)(71200400001)(6506007)(76116006)(26005)(91956017)(606006)(86362001)(478600001)(54906003)(15650500001)(66066001)(966005)(6246003)(74316002)(7736002)(53546011)(110136005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3053;
 H:MN2PR12MB2974.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j5DocZJP5iEUMLCZnFmHir6uD3LdjulfVh/sypaXQdypbGDBgJSgv6K0xcgSrwdM5/Apd6z05kqwG4dVrm/8EH8zIrbW9T7gKdAY33KKENUxDArOf3dYXW7Wyr+Jc5P0HKI/ymsxkQKIN6S/4Vj6qX4k3n3nXrG7urtsQN26VR0r5+X5SRF0txMIBNPPTWPulTIXLUPWTT+n6hFdberrDAxVd3er2GEa0bl7CLrCaiw4qgoK1jEgCND4b3f4ZTkbuwzJ2c5jtm4ea01zS+A9j3VQMc6Jvz+SoGkuOXDVN+JJ3CB7aTPHCgj9tZh2iWAonRyS+ok6n4shmLDWjhY6tW/UVpMBlhpzLZa8qt245am61c7ewCMiw2Kw00MkR4R2syqw8g9JIWAfqjXp6oiZn2cvtXlac6t862WunlU08ng=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a605a5-8ddf-4292-31d9-08d6fb967a91
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 07:01:43.8166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiancyin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3053
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSFbBtCw2p3umy977sN8FiQA6b+jhDkv79p4z1yE9EY=;
 b=f0cDycQIQgE7UI8u5t17ZC6xJskPgOhYO6ax+gAdA6A1+uU5Jhqll7z6qi/6tzF5GmVq96FbaF2b3fNMOqFZns2U+OB0uByRurjijUFghdyQjH7mndDUVKslgvGFFzIDh2Za/J5NkMy7T0y2iTG8SlJTJ8eCuuqZexTxBVzi4z0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0514965742=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0514965742==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB29749635290092A031CB5A4C95FC0MN2PR12MB2974namp_"

--_000_MN2PR12MB29749635290092A031CB5A4C95FC0MN2PR12MB2974namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Alex!
________________________________
From: Deucher, Alexander
Sent: Thursday, June 27, 2019 23:38
To: Yin, Tianci (Rico); amd-gfx@lists.freedesktop.org
Cc: Xiao, Jack; Zhang, Hawking
Subject: Re: [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h

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

--_000_MN2PR12MB29749635290092A031CB5A4C95FC0MN2PR12MB2974namp_
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
Thanks&nbsp;Alex!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Deucher, Alexander<br=
>
<b>Sent:</b> Thursday, June 27, 2019 23:38<br>
<b>To:</b> Yin, Tianci (Rico); amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Xiao, Jack; Zhang, Hawking<br>
<b>Subject:</b> Re: [PATCH] drm/amd/powerplay: update smu11_driver_if_navi1=
0.h</font>
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Tianci Yin &lt;tianci.yin@a=
md.com&gt;<br>
<b>Sent:</b> Thursday, June 27, 2019 2:49 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Xiao, Jack; Yin, Tianci (Rico); Zhang, Hawking<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: update smu11_driver_if_navi10.h<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">From: tiancyin &lt;tianci.yin@amd.com&gt;<br>
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
</div>
</body>
</html>

--_000_MN2PR12MB29749635290092A031CB5A4C95FC0MN2PR12MB2974namp_--

--===============0514965742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0514965742==--

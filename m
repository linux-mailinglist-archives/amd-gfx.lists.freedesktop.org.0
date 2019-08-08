Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D94C85B2C
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 09:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7466E78E;
	Thu,  8 Aug 2019 07:01:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741536E45B
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 07:01:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5efwGcyfz0imFdZGuXECwZ5hSKtHJtgLCRyM7B29TgcVVJRkByUsx84M8KIGwUiJqK3nQvK+aG0xnin88ZlMkPejQYG8aoETWc1XlY5e2kS6Wifwxqx3qQFZMMkvsyPNLTV7wfWn47UBnzSLhlwTFuez3SvmMjOvnrLqp5EbTqIIDjxoCOJA2ezgeTRadZ+ou9Jx9G+QQjgCo+g+0xbRO0t93Qg+hkpfCncU7Cuyt8OMlElfab8u4yeILt5ldq+y9M0S3SQjtqEWGuqyWrDDKzEw3LWKpHmchzloYMEft5YujjJHIufdzEUpV7eIrs6HP+iuNxrt5ysZ6vQob54JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8qmWF1XTxlJHnckLdoz/wtrL6AcQSbpcyRKcqJgd9g=;
 b=DaSgqFzQ1XhjWGgEjxZcBkqtmiTHqe0C0eG6QFnAxbb/NZv2oWMaMFshmP8s42FfKZVS9mOH3JInkLrPj+Bb36aGoA7rdIalVaAPyxGkMhEYGqW7Ik2faUfehVnk1mFoxVY12A3qZvweulJXB74g7N0vDADtVcRKN4GibKDu+LcyS7jvFWb08894IsPT+JV3EbpwaaqBkGjYHLQWQ07szEJTnSIwGoabYSycg8coE3iksIsNFWZUjCpRJ8DtyicfK3UCIHlclwYMOeuYDbODfySfaXpOrw3l96Qp+6xB0agXYrJ27LzyQ9JGEX+tnnr4sEKnTm2QXMCEbzBJ2S9h4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2974.namprd12.prod.outlook.com (20.178.240.140) by
 MN2PR12MB3213.namprd12.prod.outlook.com (20.179.81.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Thu, 8 Aug 2019 07:01:25 +0000
Received: from MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::d97d:73f6:5f7b:b10]) by MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::d97d:73f6:5f7b:b10%5]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:01:25 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h
Thread-Index: AQHVTa0PCY4c/lG8zEm2kuz7KbFnIKbwzgoAgAAEwJU=
Date: Thu, 8 Aug 2019 07:01:25 +0000
Message-ID: <MN2PR12MB2974DC04D999BE7C1BF5385C95D70@MN2PR12MB2974.namprd12.prod.outlook.com>
References: <1565243343-7561-1-git-send-email-tianci.yin@amd.com>
 <1565243343-7561-2-git-send-email-tianci.yin@amd.com>,
 <DM5PR12MB1418CBD425F639C429DFED25FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB1418CBD425F639C429DFED25FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3efcbf40-a62e-4aee-e0b6-08d71bce3a50
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3213; 
x-ms-traffictypediagnostic: MN2PR12MB3213:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3213842E3894279C7B1BE0DD95D70@MN2PR12MB3213.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(136003)(376002)(346002)(199004)(189003)(13464003)(66556008)(76116006)(2501003)(5660300002)(66446008)(64756008)(606006)(91956017)(66476007)(86362001)(66946007)(25786009)(105004)(476003)(186003)(8676002)(54896002)(7696005)(4326008)(6436002)(15650500001)(71190400001)(71200400001)(52536014)(66066001)(110136005)(3846002)(6116002)(316002)(478600001)(7736002)(33656002)(99286004)(14454004)(54906003)(14444005)(256004)(966005)(8936002)(53936002)(19627405001)(55016002)(229853002)(2906002)(74316002)(11346002)(81156014)(446003)(486006)(236005)(9686003)(6306002)(81166006)(26005)(76176011)(102836004)(6246003)(6506007)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3213;
 H:MN2PR12MB2974.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4AMRdU6Jdov4hbo+Pmh4Tlq/w3JAOOGIEvTMFCUCpGDk5O4WBE1iiuyo49ukZ8Xmvfa4sHpEX9WC1FsLcHOBf1oAZmM8sSGkcIfQjlHYWVGOxrZPRGyoFFZcLVUvbcYutbUQ3lMk94X2KJ2T5ZRLZOVJCHIf2ihfm7+npeMFVpnilVUvk7VuiRincHEmIOXZwzfs+BIdyLP8nsqfwh/tQYro1JGkwx5MSOB/dO04L9omrM2H21GazV+/k6dHdcV6jiKvxX0UE7s7tzm6qHq3zuTTojlFdqW0eK2ePmCOpD6+Ik/JstBFcsBESzBpnaY07DWxzVIeolhiBLsz+OQePlGW7GJswXevyJT9tJiAfOZ3doDljVYy0r3LskOqC2svVrpSFJ3ut7AW6NoUeeck4uQJ71chX3h/8I4806dRZQA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efcbf40-a62e-4aee-e0b6-08d71bce3a50
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:01:25.0707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JbT/RejDrrS4onEyPowLkruXXbgXeDSTS59DkCuCPkGOTOwZyP8jj0bAtYwok7ClwwccxIdL3qjcFd68o9vR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3213
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8qmWF1XTxlJHnckLdoz/wtrL6AcQSbpcyRKcqJgd9g=;
 b=GAf6PNZ/aAmsEr8Eov+2zXYDW6moRqcYGLqc+DJFdG4B9djiblNLjVO14sdt/Yi650D9IPO1SkVyF5Uf6+1GD0SMUJgAY+LcGzp28Uvd/U2gEkMNNYDMfMdDqzkTiCAxhxBQLpTMBSmyOeC5UNWOkMQm+dZ7jb8AJQJnbQHpGmw=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============1521494017=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1521494017==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2974DC04D999BE7C1BF5385C95D70MN2PR12MB2974namp_"

--_000_MN2PR12MB2974DC04D999BE7C1BF5385C95D70MN2PR12MB2974namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Thanks Hawking!
________________________________
From: Zhang, Hawking <Hawking.Zhang@amd.com>
Sent: Thursday, August 8, 2019 14:44
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>=
; Yin, Tianci (Rico) <Tianci.Yin@amd.com>; Quan, Evan <Evan.Quan@amd.com>; =
Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h

Series is Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>

Regards,
Hawking
-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Tianci Y=
in
Sent: 2019=1B$BG/=1B(B8=1B$B7n=1B(B8=1B$BF|=1B(B 13:49
To: amd-gfx@lists.freedesktop.org
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>=
; Yin, Tianci (Rico) <Tianci.Yin@amd.com>; Zhang, Hawking <Hawking.Zhang@am=
d.com>; Quan, Evan <Evan.Quan@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com=
>
Subject: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h

From: tiancyin <tianci.yin@amd.com>

update the smu11_driver_if_navi10.h since navi14 smu fw update to 53.12

Change-Id: If0f729ec87c98f24e1794f0847eac5ba23671e34
Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: tiancyin <tianci.yin@amd.com>
---
 .../drm/amd/powerplay/inc/smu11_driver_if_navi10.h | 25 +++++++++++++++++-=
----
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h      |  2 +-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h b/d=
rivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
index 6d9e79e..ac0120e 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
@@ -506,10 +506,11 @@ typedef struct {
   uint32_t Status;

   uint16_t DieTemperature;
-  uint16_t MemoryTemperature;
+  uint16_t CurrentMemoryTemperature;

-  uint16_t SelectedCardPower;
-  uint16_t Reserved4;
+  uint16_t MemoryTemperature;
+  uint8_t MemoryHotspotPosition;
+  uint8_t Reserved4;

   uint32_t BoardLevelEnergyAccumulator;  } OutOfBandMonitor_t; @@ -801,7 +=
802,12 @@ typedef struct {
   // Mvdd Svi2 Div Ratio Setting
   uint32_t     MvddRatio; // This is used for MVDD Vid workaround. It has =
16 fractional bits (Q16.16)

-  uint32_t     BoardReserved[9];
+  uint8_t      RenesesLoadLineEnabled;
+  uint8_t      GfxLoadlineResistance;
+  uint8_t      SocLoadlineResistance;
+  uint8_t      Padding8_Loadline;
+
+  uint32_t     BoardReserved[8];

   // Padding for MMHUB - do not modify this
   uint32_t     MmHubPadding[8]; // SMU internal use
@@ -905,13 +911,22 @@ typedef struct {
 } Watermarks_t;

 typedef struct {
+  uint16_t avgPsmCount[28];
+  uint16_t minPsmCount[28];
+  float    avgPsmVoltage[28];
+  float    minPsmVoltage[28];
+
+  uint32_t     MmHubPadding[32]; // SMU internal use
+} AvfsDebugTable_t_NV14;
+
+typedef struct {
   uint16_t avgPsmCount[36];
   uint16_t minPsmCount[36];
   float    avgPsmVoltage[36];
   float    minPsmVoltage[36];

   uint32_t     MmHubPadding[8]; // SMU internal use
-} AvfsDebugTable_t;
+} AvfsDebugTable_t_NV10;

 typedef struct {
   uint8_t  AvfsVersion;
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h
index 97605e9..ee8542d 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -28,7 +28,7 @@
 #define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF  #define SMU11_DRIVER_IF_VE=
RSION_VG20 0x13  #define SMU11_DRIVER_IF_VERSION_NV10 0x33 -#define SMU11_D=
RIVER_IF_VERSION_NV14 0x33
+#define SMU11_DRIVER_IF_VERSION_NV14 0x34

 /* MP Apertures */
 #define MP0_Public                      0x03800000
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB2974DC04D999BE7C1BF5385C95D70MN2PR12MB2974namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks Hawking!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zhang, Hawking &lt;Ha=
wking.Zhang@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 8, 2019 14:44<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevi=
n1.Wang@amd.com&gt;; Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; Quan, E=
van &lt;Evan.Quan@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<b=
r>
<b>Subject:</b> RE: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_n=
avi10.h</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Series is Reviewed-by: Hawking Zhang &lt;Hawking.Z=
hang@amd.com&gt;<br>
<br>
Regards,<br>
Hawking<br>
-----Original Message-----<br>
From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf Of Ti=
anci Yin<br>
Sent: 2019=1B$BG/=1B(B8=1B$B7n=1B(B8=1B$BF|=1B(B 13:49<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang=
@amd.com&gt;; Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; Zhang, Hawking=
 &lt;Hawking.Zhang@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.com&gt;; Yuan,=
 Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
Subject: [PATCH 2/2] drm/amd/powerplay: update smu11_driver_if_navi10.h<br>
<br>
From: tiancyin &lt;tianci.yin@amd.com&gt;<br>
<br>
update the smu11_driver_if_navi10.h since navi14 smu fw update to 53.12<br>
<br>
Change-Id: If0f729ec87c98f24e1794f0847eac5ba23671e34<br>
Reviewed-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
Signed-off-by: tiancyin &lt;tianci.yin@amd.com&gt;<br>
---<br>
&nbsp;.../drm/amd/powerplay/inc/smu11_driver_if_navi10.h | 25 &#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---=
--<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 2 &#43;-<br>
&nbsp;2 files changed, 21 insertions(&#43;), 6 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h b/d=
rivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h<br>
index 6d9e79e..ac0120e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.=
h<br>
@@ -506,10 &#43;506,11 @@ typedef struct {<br>
&nbsp;&nbsp; uint32_t Status;<br>
&nbsp;<br>
&nbsp;&nbsp; uint16_t DieTemperature;<br>
-&nbsp; uint16_t MemoryTemperature;<br>
&#43;&nbsp; uint16_t CurrentMemoryTemperature;<br>
&nbsp;<br>
-&nbsp; uint16_t SelectedCardPower;<br>
-&nbsp; uint16_t Reserved4; <br>
&#43;&nbsp; uint16_t MemoryTemperature;<br>
&#43;&nbsp; uint8_t MemoryHotspotPosition;<br>
&#43;&nbsp; uint8_t Reserved4;<br>
&nbsp;<br>
&nbsp;&nbsp; uint32_t BoardLevelEnergyAccumulator;&nbsp; } OutOfBandMonitor=
_t; @@ -801,7 &#43;802,12 @@ typedef struct {<br>
&nbsp;&nbsp; // Mvdd Svi2 Div Ratio Setting<br>
&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MvddRatio; // This is used fo=
r MVDD Vid workaround. It has 16 fractional bits (Q16.16)<br>
&nbsp;<br>
-&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; BoardReserved[9];<br>
&#43;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RenesesLoadLineEnabled;<b=
r>
&#43;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GfxLoadlineResistance;<br=
>
&#43;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SocLoadlineResistance;<br=
>
&#43;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Padding8_Loadline;<br>
&#43;<br>
&#43;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; BoardReserved[8];<br>
&nbsp;<br>
&nbsp;&nbsp; // Padding for MMHUB - do not modify this<br>
&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MmHubPadding[8]; // SMU inter=
nal use<br>
@@ -905,13 &#43;911,22 @@ typedef struct {<br>
&nbsp;} Watermarks_t;<br>
&nbsp;<br>
&nbsp;typedef struct {<br>
&#43;&nbsp; uint16_t avgPsmCount[28];<br>
&#43;&nbsp; uint16_t minPsmCount[28];<br>
&#43;&nbsp; float&nbsp;&nbsp;&nbsp; avgPsmVoltage[28];<br>
&#43;&nbsp; float&nbsp;&nbsp;&nbsp; minPsmVoltage[28];<br>
&#43;<br>
&#43;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MmHubPadding[32]; // SMU inter=
nal use<br>
&#43;} AvfsDebugTable_t_NV14;<br>
&#43;<br>
&#43;typedef struct {<br>
&nbsp;&nbsp; uint16_t avgPsmCount[36];<br>
&nbsp;&nbsp; uint16_t minPsmCount[36];<br>
&nbsp;&nbsp; float&nbsp;&nbsp;&nbsp; avgPsmVoltage[36]; <br>
&nbsp;&nbsp; float&nbsp;&nbsp;&nbsp; minPsmVoltage[36];<br>
&nbsp;<br>
&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MmHubPadding[8]; // SMU inter=
nal use<br>
-} AvfsDebugTable_t;<br>
&#43;} AvfsDebugTable_t_NV10;<br>
&nbsp;<br>
&nbsp;typedef struct {<br>
&nbsp;&nbsp; uint8_t&nbsp; AvfsVersion;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h<br>
index 97605e9..ee8542d 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
@@ -28,7 &#43;28,7 @@<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF&nbsp; #define SMU11_DR=
IVER_IF_VERSION_VG20 0x13&nbsp; #define SMU11_DRIVER_IF_VERSION_NV10 0x33 -=
#define SMU11_DRIVER_IF_VERSION_NV14 0x33<br>
&#43;#define SMU11_DRIVER_IF_VERSION_NV14 0x34<br>
&nbsp;<br>
&nbsp;/* MP Apertures */<br>
&nbsp;#define MP0_Public&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0x03800000<br>
--<br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB2974DC04D999BE7C1BF5385C95D70MN2PR12MB2974namp_--

--===============1521494017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1521494017==--

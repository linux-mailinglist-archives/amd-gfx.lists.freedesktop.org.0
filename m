Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B768FB6B
	for <lists+amd-gfx@lfdr.de>; Fri, 16 Aug 2019 08:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946156E13C;
	Fri, 16 Aug 2019 06:51:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740055.outbound.protection.outlook.com [40.107.74.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDD86E13C
 for <amd-gfx@lists.freedesktop.org>; Fri, 16 Aug 2019 06:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMNTgpAF+oA57XSzfedK03KWMsJ9DMQbpvv2tFJPWxo1KZ8K/6aEBrYLIHs+qPMyz8DwYbzHE66TNPIs58oJ9lNI5nkHU/yZG7o5DmL0Vt2mSMOqeoZiR4N985wffElaudSXyLzB61IVXIZ7qBR8M55EZExPPOtiu9kRoITR1iqfN/lLtotuMU/2FfK7IwtIL/noKdy1wtFcY/ferLGBhe6mbsw2BVHVZcAjLgV6yk/PclcxC1/9dWYEM7mDQSoDj69h/Kc3dYu8EIvkychydMjlJ5yxIZKxkRmaHoXsITvKWPYjMBvCBKTfhlyjFkbhAZjn2H/1QRcgCOCdl0+JBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dGw1PbaZpHjQ6dgODZ5jLEhC6zqPrdNCZHm+z+3wR4=;
 b=SlQFQNMIb3ETuou9LoDk/sXbohfVGerh6xV2tnAcZYZ8Go5EP//gwoRzRCuU/iSAzHyoMePFqG+tgQypk30DdiMpnIwxq5lYzl/KgBrq2i3rZx3TSBrtA8/AlQD9zK6OGBQd6+1qbjOfP3i8CVy2J1vKNt7mh1LhiTVnYjj63Sp0WXWbkX/UtIfZRx0dCNFQQnQYSq8huNsDu2OV7kMXlP09ATxy3BnhBv/M76U9lkotSq6wfUZve7j4MxQRRTgY7X5qNNCeWS/PeuHRqXiibbfzPQ22+Sy0+fJUv8TvgrxQwIaxXlK5sK+/XnsTMLBB8SEJrrLcP9wgcRV5yvurqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3901.namprd12.prod.outlook.com (10.255.238.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 06:50:59 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Fri, 16 Aug 2019
 06:50:59 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/amd/powerplay: update Arcturus smc fw and driver
 interface header
Thread-Topic: [PATCH 1/4] drm/amd/powerplay: update Arcturus smc fw and driver
 interface header
Thread-Index: AQHVU/kG1mvuuSkv6ECjfTbYTNrWQqb9VeXA
Date: Fri, 16 Aug 2019 06:50:58 +0000
Message-ID: <MN2PR12MB329670F40D0517DF8A983D29A2AF0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190816060807.11922-1-evan.quan@amd.com>
In-Reply-To: <20190816060807.11922-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd3203ce-142a-4b08-41a0-08d722161874
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3901; 
x-ms-traffictypediagnostic: MN2PR12MB3901:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB390128C050E21FEE9B741D66A2AF0@MN2PR12MB3901.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(189003)(199004)(25786009)(81156014)(5660300002)(229853002)(8676002)(81166006)(53546011)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(66946007)(8936002)(6506007)(66066001)(52536014)(102836004)(26005)(186003)(6306002)(54896002)(110136005)(316002)(19627405001)(6436002)(99286004)(236005)(55016002)(9686003)(71200400001)(86362001)(53936002)(71190400001)(486006)(476003)(105004)(446003)(11346002)(6246003)(7736002)(74316002)(478600001)(2501003)(76176011)(7696005)(606006)(33656002)(15650500001)(2906002)(3846002)(6116002)(14454004)(256004)(14444005)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3901;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PCaaG2amrNq0GKfHieRGgddSufqy2pu0JgStlui6p2DTOV/PVu91tcIZ4n8Joq2zIaGwrw4765xL0GQdLq3u9o1XDEZ9KO+bBbf2PcrpI5nqalfBYxqSj+SD5pc2dbq+7wDTzMzF9QrInohjnv07x0iXwdlR41HCJYzDSX0NnsTNp87e9RxvAyuOk0uPxEr8oYqhfrCInXM3oI5Lpz0xiZicpEZZb2J0ykWQ12xutQdmDZwCxwc7eNFzxiRUEVPugmtlhE0mapgxxuEtSciPAKQ3zlfUAHoJ+2jdufhwj+24+lCtwEtiKiezYVkzYFRg0GwwWP3PKwfu28oZlQLgboWmHf2+gXkwkCnJJq+5tLxS3sWAdUCAjXplfHpp0+YbMODWTCY/oJrFZXM2N5DyhOKTDmQmGVzx6d73Si/RGyI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3203ce-142a-4b08-41a0-08d722161874
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 06:50:58.9892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ya5tNe/HumzXxwKGOq9wsti5lkNJMtsra/IvrH/ABJunqZpOpfTqGzFuv1HJ4udy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dGw1PbaZpHjQ6dgODZ5jLEhC6zqPrdNCZHm+z+3wR4=;
 b=R3/FY0PnUDJsphpmPWTgzphR5bNv4U0LCqc7igDlLptjhYyocBfVWbUDi2gm9pSjjJtkSJlo60AKO3PWkI11UhzaOfl9xmHXEsIphrvIZB4A2pNZVPLNSPFiRl9VBBEo1x+nBui5jZAOknDiEIjvPQJ9t94hdqUl2qQ6zQ57Edo=
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
Content-Type: multipart/mixed; boundary="===============2021937462=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2021937462==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329670F40D0517DF8A983D29A2AF0MN2PR12MB3296namp_"

--_000_MN2PR12MB329670F40D0517DF8A983D29A2AF0MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Friday, August 16, 2019 2:08 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH 1/4] drm/amd/powerplay: update Arcturus smc fw and driver i=
nterface header

Update smc fw and driver interface header.

Change-Id: If4ac09c41b1309f746b757f78880fffb491d50f8
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 .../powerplay/inc/smu11_driver_if_arcturus.h    | 17 +++++++++++------
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h   |  2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h b=
/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
index b99e98c40720..e02950b505fa 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
@@ -27,7 +27,7 @@
 // *** IMPORTANT ***
 // SMU TEAM: Always increment the interface version if
 // any structure is changed in this file
-//#define SMU11_DRIVER_IF_VERSION 0x08
+//#define SMU11_DRIVER_IF_VERSION 0x09

 #define PPTABLE_ARCTURUS_SMU_VERSION 4

@@ -691,7 +691,12 @@ typedef struct {
   uint16_t          XgmiFclkFreq    [NUM_XGMI_PSTATE_LEVELS];
   uint16_t          XgmiSocVoltage  [NUM_XGMI_PSTATE_LEVELS];

-  uint32_t     BoardReserved[10];
+  // GPIO pins for I2C communications with 2nd controller for Input Teleme=
try Sequence
+  uint8_t      GpioI2cScl;          // Serial Clock
+  uint8_t      GpioI2cSda;          // Serial Data
+  uint16_t     GpioPadding;
+
+  uint32_t     BoardReserved[9];

   // Padding for MMHUB - do not modify this
   uint32_t     MmHubPadding[8]; // SMU internal use
@@ -738,7 +743,7 @@ typedef struct {
   uint32_t Padding[4];

   // Padding - ignore
-  uint32_t     MmHubPadding[7]; // SMU internal use
+  uint32_t     MmHubPadding[8]; // SMU internal use
 } SmuMetrics_t;


@@ -748,7 +753,7 @@ typedef struct {
   float    avgPsmVoltage[75];
   float    minPsmVoltage[75];

-  uint32_t MmHubPadding[3]; // SMU internal use
+  uint32_t MmHubPadding[8]; // SMU internal use
 } AvfsDebugTable_t;

 typedef struct {
@@ -797,9 +802,9 @@ typedef struct {

   uint32_t P2VCharzFreq[AVFS_VOLTAGE_COUNT]; // in 10KHz units

-  uint32_t EnabledAvfsModules;
+  uint32_t EnabledAvfsModules[2];

-  uint32_t MmHubPadding[7]; // SMU internal use
+  uint32_t MmHubPadding[8]; // SMU internal use
 } AvfsFuseOverride_t;

 /* NOT CURRENTLY USED
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h
index 5fbf082be091..0a22fa48ff5a 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -27,7 +27,7 @@

 #define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF
 #define SMU11_DRIVER_IF_VERSION_VG20 0x13
-#define SMU11_DRIVER_IF_VERSION_ARCT 0x08
+#define SMU11_DRIVER_IF_VERSION_ARCT 0x09
 #define SMU11_DRIVER_IF_VERSION_NV10 0x33
 #define SMU11_DRIVER_IF_VERSION_NV12 0x33
 #define SMU11_DRIVER_IF_VERSION_NV14 0x33
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB329670F40D0517DF8A983D29A2AF0MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Friday, August 16, 2019 2:08 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/4] drm/amd/powerplay: update Arcturus smc fw and d=
river interface header</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Update smc fw and driver interface header.<br>
<br>
Change-Id: If4ac09c41b1309f746b757f78880fffb491d50f8<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;.../powerplay/inc/smu11_driver_if_arcturus.h&nbsp;&nbsp;&nbsp; | 17 &=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h&nbsp;&nbsp; |&nbsp; 2 &=
#43;-<br>
&nbsp;2 files changed, 12 insertions(&#43;), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h b=
/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h<br>
index b99e98c40720..e02950b505fa 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturu=
s.h<br>
@@ -27,7 &#43;27,7 @@<br>
&nbsp;// *** IMPORTANT ***<br>
&nbsp;// SMU TEAM: Always increment the interface version if<br>
&nbsp;// any structure is changed in this file<br>
-//#define SMU11_DRIVER_IF_VERSION 0x08<br>
&#43;//#define SMU11_DRIVER_IF_VERSION 0x09<br>
&nbsp;<br>
&nbsp;#define PPTABLE_ARCTURUS_SMU_VERSION 4<br>
&nbsp;<br>
@@ -691,7 &#43;691,12 @@ typedef struct {<br>
&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 XgmiFclkFreq&nbsp;&nbsp;&nbsp; [NUM_XGMI_PSTATE_LEVELS];<br>
&nbsp;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 XgmiSocVoltage&nbsp; [NUM_XGMI_PSTATE_LEVELS];<br>
&nbsp;<br>
-&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; BoardReserved[10];<br>
&#43;&nbsp; // GPIO pins for I2C communications with 2nd controller for Inp=
ut Telemetry Sequence<br>
&#43;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GpioI2cScl;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Serial Clock<br>
&#43;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GpioI2cSda;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Serial Data<br>
&#43;&nbsp; uint16_t&nbsp;&nbsp;&nbsp;&nbsp; GpioPadding;<br>
&#43;<br>
&#43;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; BoardReserved[9];<br>
&nbsp;<br>
&nbsp;&nbsp; // Padding for MMHUB - do not modify this<br>
&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MmHubPadding[8]; // SMU inter=
nal use<br>
@@ -738,7 &#43;743,7 @@ typedef struct {<br>
&nbsp;&nbsp; uint32_t Padding[4];<br>
&nbsp;<br>
&nbsp;&nbsp; // Padding - ignore<br>
-&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MmHubPadding[7]; // SMU internal u=
se<br>
&#43;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp; MmHubPadding[8]; // SMU intern=
al use<br>
&nbsp;} SmuMetrics_t;<br>
&nbsp;<br>
&nbsp;<br>
@@ -748,7 &#43;753,7 @@ typedef struct {<br>
&nbsp;&nbsp; float&nbsp;&nbsp;&nbsp; avgPsmVoltage[75];<br>
&nbsp;&nbsp; float&nbsp;&nbsp;&nbsp; minPsmVoltage[75];<br>
&nbsp;<br>
-&nbsp; uint32_t MmHubPadding[3]; // SMU internal use<br>
&#43;&nbsp; uint32_t MmHubPadding[8]; // SMU internal use<br>
&nbsp;} AvfsDebugTable_t;<br>
&nbsp;<br>
&nbsp;typedef struct {<br>
@@ -797,9 &#43;802,9 @@ typedef struct {<br>
&nbsp;<br>
&nbsp;&nbsp; uint32_t P2VCharzFreq[AVFS_VOLTAGE_COUNT]; // in 10KHz units<b=
r>
&nbsp;<br>
-&nbsp; uint32_t EnabledAvfsModules;<br>
&#43;&nbsp; uint32_t EnabledAvfsModules[2];<br>
&nbsp;<br>
-&nbsp; uint32_t MmHubPadding[7]; // SMU internal use<br>
&#43;&nbsp; uint32_t MmHubPadding[8]; // SMU internal use<br>
&nbsp;} AvfsFuseOverride_t;<br>
&nbsp;<br>
&nbsp;/* NOT CURRENTLY USED<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h<br>
index 5fbf082be091..0a22fa48ff5a 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
@@ -27,7 &#43;27,7 @@<br>
&nbsp;<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_VG20 0x13<br>
-#define SMU11_DRIVER_IF_VERSION_ARCT 0x08<br>
&#43;#define SMU11_DRIVER_IF_VERSION_ARCT 0x09<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_NV10 0x33<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_NV12 0x33<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_NV14 0x33<br>
-- <br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB329670F40D0517DF8A983D29A2AF0MN2PR12MB3296namp_--

--===============2021937462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2021937462==--

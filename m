Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE787863
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12736ED9F;
	Fri,  9 Aug 2019 11:29:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810053.outbound.protection.outlook.com [40.107.81.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A356ED9F
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:29:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDfgskKTBbFo3UkjspzE26V3TFJmbxElh69tSV0ltnDHyXcNMVhIVjV2CBj22NYjzO+aqSkATjNJrO7RRaOroLK1yOcSvK2bMkmhxvSbhoi2qgiihthu0+8xBS+37xTBaoQFHiunovldMlVhPGIbuSxWzK1MdUFqWjC7XtX6wp8J1TMbCuwZcbMPm6PklCxJ5Hv1/Invb1UBQKtr/6AoePVPedGK7KfiWwAtLqkdHF/s0uKHbJg56pUNSsn7YBQI1ueaSMcsTgk+cDw8gSiRYWigbEW0lI43UWZ/znZQLWPgbvEkFRErhgMVzxciY6+T7dOhtZqIYh7VnZ6EI3YqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAStWTeGe3rM2VtQWdiV74EOv16JSTyS5/NwO6m2r1I=;
 b=NKJwa9IWBdg9rqO7foXk/ESXA2wPWfH9TLdcZEQ88p2XlKkMxhqxwtCIzm4AnasF7wscPiutXA2ZskNx4MZU8KED2+SriVBCcHiJXAcH0M/yNltr6772IYeRIfdFDHPdnRdtnUbmP+SuH0/Z4WF3sFfF15Q3Vb4oe95Na2jdLbWuAGph6tTTn3BIlfD5VFIe6+oiooPY7SzODBjqu4yTlhmQ8P9ydSX7ixL/2rcI2Bm/M27PgE1bHys4iDfBHLiXk8kevokETfHYDHP99bJUHrphMQVxrSqoQmsUZAgNDyLMvH1eVXHtqozDgiQTPU9TfNyBLYOSA3LNeaAB3PuQBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 11:29:04 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.011; Fri, 9 Aug 2019
 11:29:04 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/amdgpu/powerplay: update Arcturus smu version in
 new place
Thread-Topic: [PATCH 1/1] drm/amdgpu/powerplay: update Arcturus smu version in
 new place
Thread-Index: AQHVTqVwMsATHeEn60q8EgrfG3fi16byrehY
Date: Fri, 9 Aug 2019 11:29:03 +0000
Message-ID: <MN2PR12MB32969CB86F6926508B5B8FBDA2D60@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1565350043-7146-1-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350043-7146-1-git-send-email-le.ma@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4763758-c3ab-4062-73f7-08d71cbcc8bf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2911AC7E527ABEB01D37C6F6A2D60@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(189003)(199004)(81156014)(15650500001)(53936002)(486006)(6306002)(86362001)(9686003)(236005)(54896002)(105004)(6116002)(966005)(52536014)(5660300002)(8676002)(81166006)(8936002)(14454004)(19627405001)(446003)(11346002)(2501003)(476003)(33656002)(66066001)(102836004)(14444005)(186003)(55016002)(2906002)(256004)(26005)(6246003)(7736002)(6506007)(76176011)(478600001)(7696005)(74316002)(99286004)(25786009)(71200400001)(71190400001)(53546011)(606006)(110136005)(316002)(3846002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(6436002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: l360luY1hBCG0TieXll7NJChkWaFrr2JXXtIIvWq3JQB746gT6cjmpkcRvko6t3ybxsNDi9ElMFiDQkEdBSC2SeDC2kyuiTj8bdhumpjMwFU5ULK98zEUHHFymYanHDA7TlTjKEEHo9TXVBsgNq6rqhfJNrowhxzsmjQTAdwsOAJvcLVSM70mi0nuStTtZ+ztgzN49QI8UU3bC2Lwit2s/983HaQ0enJ9R2wp1QZAexCWx83Y755UugzXnHeWJTH7KeucpMftSKd3J1+hCmWwSDo4Eq9Tot4oD6f98VJnHOPMcsZ3KRJ707DMqTsmGIXJdEBXapMoefY/Sf3hjvOuDPxpKscSprNcBzwCHBUyLlU869KhbADl58EyL37N2MQBRhjImBYdZApP8SNc12Ojta743dUCsQDqWWny7x4OBk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4763758-c3ab-4062-73f7-08d71cbcc8bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 11:29:03.8427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: frJc87hprJFaiu1bWSV5+3u3DKzruKGzBgKDmYT9kpKm6Aok3h1TZH4dk6CwOv5d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAStWTeGe3rM2VtQWdiV74EOv16JSTyS5/NwO6m2r1I=;
 b=Wr1E4zmm5UEBD/rrOLoVOgYh12Jyx2mI1ebP4qqEnARz/LZmVkFxWvbpUch/gRF3Wla+OS25NQKJ/96kHIUCx/S1d0EhAFA1Wfny31IRWquvngiJjMyfy6uIwiSMkNxlAc5i6vT0QVqi0ss4YUsCCL9EFdF0prZd+N0gr717c3E=
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
Content-Type: multipart/mixed; boundary="===============0164662370=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0164662370==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32969CB86F6926508B5B8FBDA2D60MN2PR12MB3296namp_"

--_000_MN2PR12MB32969CB86F6926508B5B8FBDA2D60MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Le Ma <l=
e.ma@amd.com>
Sent: Friday, August 9, 2019 7:27 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Ma, Le <Le.Ma@amd.com>
Subject: [PATCH 1/1] drm/amdgpu/powerplay: update Arcturus smu version in n=
ew place

Follow patch below:
    drm/amd/powerplay: re-define smu interface version for smu v11

Change-Id: Id78651209adc7a094f4c19ba965dcded37dd3ba7
Signed-off-by: Le Ma <le.ma@amd.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c                 | 1 -
 drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h | 2 +-
 drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h                | 1 +
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c                    | 3 +++
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c
index cff3777..e6fcbdf 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -1918,6 +1918,5 @@ void arcturus_set_ppt_funcs(struct smu_context *smu)
         struct smu_table_context *smu_table =3D &smu->smu_table;

         smu->ppt_funcs =3D &arcturus_ppt_funcs;
-       smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION;
         smu_table->table_count =3D TABLE_COUNT;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h b=
/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
index c7a7953..b99e98c 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h
@@ -27,7 +27,7 @@
 // *** IMPORTANT ***
 // SMU TEAM: Always increment the interface version if
 // any structure is changed in this file
-#define SMU11_DRIVER_IF_VERSION 0x08
+//#define SMU11_DRIVER_IF_VERSION 0x08

 #define PPTABLE_ARCTURUS_SMU_VERSION 4

diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h
index ee8542d..acbb83d 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
@@ -27,6 +27,7 @@

 #define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF
 #define SMU11_DRIVER_IF_VERSION_VG20 0x13
+#define SMU11_DRIVER_IF_VERSION_ARCT 0x08
 #define SMU11_DRIVER_IF_VERSION_NV10 0x33
 #define SMU11_DRIVER_IF_VERSION_NV14 0x34

diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index 91dfae1..3b8e58e 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -275,6 +275,9 @@ static int smu_v11_0_check_fw_version(struct smu_contex=
t *smu)
         case CHIP_VEGA20:
                 smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION_VG20;
                 break;
+       case CHIP_ARCTURUS:
+               smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION_ARCT;
+               break;
         case CHIP_NAVI10:
                 smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION_NV10;
                 break;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32969CB86F6926508B5B8FBDA2D60MN2PR12MB3296namp_
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
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Le Ma &lt;le.ma@amd.com&gt;<b=
r>
<b>Sent:</b> Friday, August 9, 2019 7:27 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Ma, Le &lt;Le.Ma@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/1] drm/amdgpu/powerplay: update Arcturus smu versi=
on in new place</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Follow patch below:<br>
&nbsp;&nbsp;&nbsp; drm/amd/powerplay: re-define smu interface version for s=
mu v11<br>
<br>
Change-Id: Id78651209adc7a094f4c19ba965dcded37dd3ba7<br>
Signed-off-by: Le Ma &lt;le.ma@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/arcturus_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1=
 -<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h | 2 &#43=
;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 &#43=
;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 3 &#43;&#43;&#43;<br>
&nbsp;4 files changed, 5 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c<br>
index cff3777..e6fcbdf 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
@@ -1918,6 &#43;1918,5 @@ void arcturus_set_ppt_funcs(struct smu_context *s=
mu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *=
smu_table =3D &amp;smu-&gt;smu_table;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;ppt_funcs =3D &amp=
;arcturus_ppt_funcs;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11_DRIV=
ER_IF_VERSION;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;table_count =
=3D TABLE_COUNT;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h b=
/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h<br>
index c7a7953..b99e98c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturus.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_arcturu=
s.h<br>
@@ -27,7 &#43;27,7 @@<br>
&nbsp;// *** IMPORTANT ***<br>
&nbsp;// SMU TEAM: Always increment the interface version if<br>
&nbsp;// any structure is changed in this file<br>
-#define SMU11_DRIVER_IF_VERSION 0x08<br>
&#43;//#define SMU11_DRIVER_IF_VERSION 0x08<br>
&nbsp;<br>
&nbsp;#define PPTABLE_ARCTURUS_SMU_VERSION 4<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/dr=
m/amd/powerplay/inc/smu_v11_0.h<br>
index ee8542d..acbb83d 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
@@ -27,6 &#43;27,7 @@<br>
&nbsp;<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_VG20 0x13<br>
&#43;#define SMU11_DRIVER_IF_VERSION_ARCT 0x08<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_NV10 0x33<br>
&nbsp;#define SMU11_DRIVER_IF_VERSION_NV14 0x34<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index 91dfae1..3b8e58e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -275,6 &#43;275,9 @@ static int smu_v11_0_check_fw_version(struct smu_co=
ntext *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VEGA20:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11_DRIVER_IF_VERSION_VG=
20;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_ARCTURUS:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11_DRIVER_IF_VERSION_ARCT;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11_DRIVER_IF_VERSION_NV=
10;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
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

--_000_MN2PR12MB32969CB86F6926508B5B8FBDA2D60MN2PR12MB3296namp_--

--===============0164662370==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0164662370==--

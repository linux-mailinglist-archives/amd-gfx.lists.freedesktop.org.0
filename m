Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD26D411D
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 15:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B2589C54;
	Fri, 11 Oct 2019 13:27:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690079.outbound.protection.outlook.com [40.107.69.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A61A89C54
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 13:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1j44aJfZL2HedKuCJ9tsv3RUXdyQr1jtx+3e/IS1z83TGgbdxAL+qsyrCp494wCxkZRt5e9TBQliaTLDIDfTpEEo+aPm3SOUFg/DT7hGMMYHP888aEsWDTHdEbVAhPb68jRd8T7/6ITWPY3YxVny+o8v+prEB5pdMQAnuLbQYzTBYMrYTmDzC7e/AhCd8dpPicE0prYSY0Ne203RGGePJi96pdZazwBru5nuxzHLyf+4cyfUg561jAsr2hebFxEs7gqWVdm++TvYboYW2/dpk8GC9iK5jvvhlnn3RvHsLrvKkNotg7b5epE1g0pXWlQNGk8UUuC4rmNO0Uv0cSLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBO1NVurUA7YkY1YrIDAV475S/a2RI6sESIcR1Uw+3w=;
 b=SY2ilN8Uiafuzn798gECq2HkaJGduqydoqpAPBEKUPMUOozVqMqT4RMqdfevMq+R+yZd2yipL5+Ej+jFuNm2+l/+M5mSs8ikJGEhRAztJD1QkB3o0ZK9AnKZ4t3X76OzhGKggr76vGQkOWa90Xg6W8MdiUNrisDxSFP7VTURhny2YAoMz8ZvCVY07O0JMGUDW+3giJj4T/CjtSRLNiUzi7EV0Z9gVZEeBcNCjBTatdmHUSvOKkAhVlzctu12Frpj1FtLRa/n1PM2Mpsj8I2sGBUOEtG2g2cyLbe0n8hmaElo+Qe70zFMioVc7YirjlDT+QnV5gz3NfepZ/H6804Gfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1475.namprd12.prod.outlook.com (10.172.18.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 11 Oct 2019 13:27:28 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.021; Fri, 11 Oct
 2019 13:27:28 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu/discovery: reserve discovery data at the
 top of VRAM
Thread-Topic: [PATCH v2] drm/amdgpu/discovery: reserve discovery data at the
 top of VRAM
Thread-Index: AQHVf+m9qyz+Oz/xWEityn09HHvF2qdVb1wm
Date: Fri, 11 Oct 2019 13:27:28 +0000
Message-ID: <BN6PR12MB18094FEA0A552BAF11F6B742F7970@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20191011040942.13931-1-xiaojie.yuan@amd.com>
In-Reply-To: <20191011040942.13931-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.171.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 200cf2c3-3ed6-4bff-38d1-08d74e4ec36c
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1475:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB14757AD09B119C5FB5E9143EF7970@BN6PR12MB1475.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(189003)(199004)(110136005)(54906003)(186003)(2906002)(53546011)(6506007)(26005)(33656002)(316002)(102836004)(476003)(19627405001)(105004)(486006)(76176011)(52536014)(6116002)(99286004)(7696005)(3846002)(5660300002)(81156014)(86362001)(7736002)(25786009)(446003)(74316002)(2501003)(11346002)(8936002)(81166006)(8676002)(606006)(66476007)(64756008)(66556008)(66446008)(66946007)(4326008)(76116006)(14454004)(478600001)(966005)(229853002)(236005)(9686003)(6306002)(6246003)(55016002)(54896002)(6436002)(256004)(71200400001)(66066001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1475;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3KnF26DM6/2QoXpNZDkMKtzsQNYAlYt3luwUoRatrgaiRjReWcL250NpHCViJ4vs0PUJltEfFkAA9tsrdnK1mNRcjwJBCLD5PGXN1MqPotk4kCzwqBbaJQw6DFsCL5Smyfg3HkvGapB5Vu32dY87iYGXSTug3wHTCYyzOqRdU/euTH3vVafWlMAbIlV7tie82cI3j7ufhE4ltmexfz895ZhCaG+6ruIgbxGf8mgWw/d5r0ckcQwhQt2E/0pB7LPIGHkQUL02JhWJJxsm3fm2QweJiRGGZ1a1FDh7Pi+KJV8Nojhgx3NjxfakgaHtcivHJ3Vz9lurU3ZRedFihnhYDp74yj/fsFvL9dINVtygaGljicj0/JpX4ohh2Gimvdl+kbuST7mKkjsIIFzTAkD2jPzBBSC0ABDrebU++DltIkx3wEY32V90Rdb7enaF/Fn8l5nGn8aa27ZphQ+04tmCDA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200cf2c3-3ed6-4bff-38d1-08d74e4ec36c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 13:27:28.7720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGg9C42VGSfi8dbj4APdSBbxddCj7XYcyQJbhDdpGRLjTQ7QyGJl/MRlQCbSaFAvh9nb+KLQ9GGMQpBmkTB5Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1475
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBO1NVurUA7YkY1YrIDAV475S/a2RI6sESIcR1Uw+3w=;
 b=g+RR+KoS0GJRlru/PJBY6ER9fQNxIEAvkXNWwKFRf5pnzoqIVy2V3r/sWqi10oRH1s29PWBvrgxFz28Kw2P5ytea4z8q0dwYYCWwCnQ7V6pyW9g1AL9wChoUS9V/fwI5LDiSLUf1VyyGmOCdVrnuwuur20LDLC9jpB3+diQLupQ=
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "Xiao,
 Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0350833438=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0350833438==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18094FEA0A552BAF11F6B742F7970BN6PR12MB1809namp_"

--_000_BN6PR12MB18094FEA0A552BAF11F6B742F7970BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Yuan, Xi=
aojie <Xiaojie.Yuan@amd.com>
Sent: Friday, October 11, 2019 12:09 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: alexdeucher@gmail.com <alexdeucher@gmail.com>; Xiao, Jack <Jack.Xiao@am=
d.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Zhang, Hawking <Hawking.Zhang=
@amd.com>
Subject: [PATCH v2] drm/amdgpu/discovery: reserve discovery data at the top=
 of VRAM

IP Discovery data is TMR fenced by the latest PSP BL,
so we need to reserve this region.

Tested on navi10/12/14 with VBIOS integrated with latest PSP BL.

v2: use DISCOVERY_TMR_SIZE macro as bo size
    use amdgpu_bo_create_kernel_at() to allocate bo

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 17 +++++++++++++++++
 drivers/gpu/drm/amd/include/discovery.h       |  1 -
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h
index be0b2c69c223..6775647f0ba5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -812,6 +812,7 @@ struct amdgpu_device {
         uint8_t                         *bios;
         uint32_t                        bios_size;
         struct amdgpu_bo                *stolen_vga_memory;
+       struct amdgpu_bo                *discovery_memory;
         uint32_t                        bios_scratch_reg_offset;
         uint32_t                        bios_scratch[AMDGPU_BIOS_NUM_SCRAT=
CH];

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_discovery.c
index 1481899f86c1..71198c5318e1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -136,7 +136,7 @@ static int amdgpu_discovery_read_binary(struct amdgpu_d=
evice *adev, uint8_t *bin
 {
         uint32_t *p =3D (uint32_t *)binary;
         uint64_t vram_size =3D (uint64_t)RREG32(mmRCC_CONFIG_MEMSIZE) << 2=
0;
-       uint64_t pos =3D vram_size - BINARY_MAX_SIZE;
+       uint64_t pos =3D vram_size - DISCOVERY_TMR_SIZE;
         unsigned long flags;

         while (pos < vram_size) {
@@ -179,7 +179,7 @@ int amdgpu_discovery_init(struct amdgpu_device *adev)
         uint16_t checksum;
         int r;

-       adev->discovery =3D kzalloc(BINARY_MAX_SIZE, GFP_KERNEL);
+       adev->discovery =3D kzalloc(DISCOVERY_TMR_SIZE, GFP_KERNEL);
         if (!adev->discovery)
                 return -ENOMEM;

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_discovery.h
index 85b8c4d4d576..5a6693d7d269 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
@@ -24,6 +24,8 @@
 #ifndef __AMDGPU_DISCOVERY__
 #define __AMDGPU_DISCOVERY__

+#define DISCOVERY_TMR_SIZE  (64 << 10)
+
 int amdgpu_discovery_init(struct amdgpu_device *adev);
 void amdgpu_discovery_fini(struct amdgpu_device *adev);
 int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c
index edffc883549a..ed7b10e0848d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1955,6 +1955,20 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
                                     NULL, &stolen_vga_buf);
         if (r)
                 return r;
+
+       /*
+        * reserve one TMR (64K) memory at the top of VRAM which holds
+        * IP Discovery data and is protected by PSP.
+        */
+       r =3D amdgpu_bo_create_kernel_at(adev,
+                                      adev->gmc.real_vram_size - DISCOVERY=
_TMR_SIZE,
+                                      DISCOVERY_TMR_SIZE,
+                                      AMDGPU_GEM_DOMAIN_VRAM,
+                                      &adev->discovery_memory,
+                                      NULL);
+       if (r)
+               return r;
+
         DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
                  (unsigned) (adev->gmc.real_vram_size / (1024 * 1024)));

@@ -2024,6 +2038,9 @@ void amdgpu_ttm_late_init(struct amdgpu_device *adev)
         void *stolen_vga_buf;
         /* return the VGA stolen memory (if any) back to VRAM */
         amdgpu_bo_free_kernel(&adev->stolen_vga_memory, NULL, &stolen_vga_=
buf);
+
+       /* return the IP Discovery TMR memory back to VRAM */
+       amdgpu_bo_free_kernel(&adev->discovery_memory, NULL, NULL);
 }

 /**
diff --git a/drivers/gpu/drm/amd/include/discovery.h b/drivers/gpu/drm/amd/=
include/discovery.h
index 5dcb776548d8..7ec4331e67f2 100644
--- a/drivers/gpu/drm/amd/include/discovery.h
+++ b/drivers/gpu/drm/amd/include/discovery.h
@@ -25,7 +25,6 @@
 #define _DISCOVERY_H_

 #define PSP_HEADER_SIZE                 256
-#define BINARY_MAX_SIZE                 (64 << 10)
 #define BINARY_SIGNATURE                0x28211407
 #define DISCOVERY_TABLE_SIGNATURE       0x53445049

--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18094FEA0A552BAF11F6B742F7970BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Yuan, Xiaojie &lt;Xiaojie.Yua=
n@amd.com&gt;<br>
<b>Sent:</b> Friday, October 11, 2019 12:09 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> alexdeucher@gmail.com &lt;alexdeucher@gmail.com&gt;; Xiao, Jack =
&lt;Jack.Xiao@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; Zhan=
g, Hawking &lt;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH v2] drm/amdgpu/discovery: reserve discovery data at =
the top of VRAM</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">IP Discovery data is TMR fenced by the latest PSP =
BL,<br>
so we need to reserve this region.<br>
<br>
Tested on navi10/12/14 with VBIOS integrated with latest PSP BL.<br>
<br>
v2: use DISCOVERY_TMR_SIZE macro as bo size<br>
&nbsp;&nbsp;&nbsp; use amdgpu_bo_create_kernel_at() to allocate bo<br>
<br>
Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
Reviewed-by: Hawking Zhang &lt;Hawking.Zhang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c |&nbsp; 4 &#43;&#43;--<=
br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h |&nbsp; 2 &#43;&#43;<br=
>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/include/discovery.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 1 -<br>
&nbsp;5 files changed, 22 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdg=
pu/amdgpu.h<br>
index be0b2c69c223..6775647f0ba5 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
@@ -812,6 &#43;812,7 @@ struct amdgpu_device {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *bios;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bios_size;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; *stolen_vga_memory;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
discovery_memory;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bios_scratch_reg_offset;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bios_scratch[AMDGPU_BIOS_NUM_=
SCRATCH];<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_discovery.c<br>
index 1481899f86c1..71198c5318e1 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
@@ -136,7 &#43;136,7 @@ static int amdgpu_discovery_read_binary(struct amdg=
pu_device *adev, uint8_t *bin<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *p =3D (uint32_t =
*)binary;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t vram_size =3D (ui=
nt64_t)RREG32(mmRCC_CONFIG_MEMSIZE) &lt;&lt; 20;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t pos =3D vram_size - BINARY_M=
AX_SIZE;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t pos =3D vram_size - DISC=
OVERY_TMR_SIZE;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (pos &lt; vram_size)=
 {<br>
@@ -179,7 &#43;179,7 @@ int amdgpu_discovery_init(struct amdgpu_device *ade=
v)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint16_t checksum;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;discovery =3D kzalloc(BINARY=
_MAX_SIZE, GFP_KERNEL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;discovery =3D kzalloc(DI=
SCOVERY_TMR_SIZE, GFP_KERNEL);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;discovery)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_discovery.h<br>
index 85b8c4d4d576..5a6693d7d269 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h<br>
@@ -24,6 &#43;24,8 @@<br>
&nbsp;#ifndef __AMDGPU_DISCOVERY__<br>
&nbsp;#define __AMDGPU_DISCOVERY__<br>
&nbsp;<br>
&#43;#define DISCOVERY_TMR_SIZE&nbsp; (64 &lt;&lt; 10)<br>
&#43;<br>
&nbsp;int amdgpu_discovery_init(struct amdgpu_device *adev);<br>
&nbsp;void amdgpu_discovery_fini(struct amdgpu_device *adev);<br>
&nbsp;int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ttm.c<br>
index edffc883549a..ed7b10e0848d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
@@ -1955,6 &#43;1955,20 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, &a=
mp;stolen_vga_buf);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return r;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * reserve one TMR (64K) mem=
ory at the top of VRAM which holds<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * IP Discovery data and is =
protected by PSP.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_create_kernel_at(=
adev,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; adev-&gt;gmc.real_vram_size - DISCOVERY_TMR_SIZE,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; DISCOVERY_TMR_SIZE,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; AMDGPU_GEM_DOMAIN_VRAM,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &amp;adev-&gt;discovery_memory,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; NULL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return r;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_INFO(&quot;amdgpu: %uM=
 of VRAM memory ready\n&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; (unsigned) (adev-&gt;gmc.real_vram_size / (1024=
 * 1024)));<br>
&nbsp;<br>
@@ -2024,6 &#43;2038,9 @@ void amdgpu_ttm_late_init(struct amdgpu_device *a=
dev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *stolen_vga_buf;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* return the VGA stolen m=
emory (if any) back to VRAM */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp=
;adev-&gt;stolen_vga_memory, NULL, &amp;stolen_vga_buf);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* return the IP Discovery TMR me=
mory back to VRAM */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;adev-&=
gt;discovery_memory, NULL, NULL);<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;/**<br>
diff --git a/drivers/gpu/drm/amd/include/discovery.h b/drivers/gpu/drm/amd/=
include/discovery.h<br>
index 5dcb776548d8..7ec4331e67f2 100644<br>
--- a/drivers/gpu/drm/amd/include/discovery.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/include/discovery.h<br>
@@ -25,7 &#43;25,6 @@<br>
&nbsp;#define _DISCOVERY_H_<br>
&nbsp;<br>
&nbsp;#define PSP_HEADER_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 256<br>
-#define BINARY_MAX_SIZE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (64 &lt;&lt; 10)<br>
&nbsp;#define BINARY_SIGNATURE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x28211407<br>
&nbsp;#define DISCOVERY_TABLE_SIGNATURE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0x53445049<br>
&nbsp;<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18094FEA0A552BAF11F6B742F7970BN6PR12MB1809namp_--

--===============0350833438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0350833438==--

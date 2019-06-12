Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3088426F6
	for <lists+amd-gfx@lfdr.de>; Wed, 12 Jun 2019 15:06:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8D189394;
	Wed, 12 Jun 2019 13:06:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800078.outbound.protection.outlook.com [40.107.80.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC3389394
 for <amd-gfx@lists.freedesktop.org>; Wed, 12 Jun 2019 13:06:56 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1588.namprd12.prod.outlook.com (10.172.19.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Wed, 12 Jun 2019 13:06:55 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1965.011; Wed, 12 Jun 2019
 13:06:55 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhu, James" <James.Zhu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
Thread-Topic: [PATCH v2] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0
Thread-Index: AQHVIR6zoTkmmgpzEUmM006dXJOzDqaX/P57
Date: Wed, 12 Jun 2019 13:06:55 +0000
Message-ID: <BN6PR12MB1809EE94C9B9B31DB0EC04BAF7EC0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1560187603-16238-1-git-send-email-James.Zhu@amd.com>,
 <1560344364-20059-1-git-send-email-James.Zhu@amd.com>
In-Reply-To: <1560344364-20059-1-git-send-email-James.Zhu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33039f3f-7380-471c-25a6-08d6ef36d819
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1588; 
x-ms-traffictypediagnostic: BN6PR12MB1588:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB15886A59C1DCB567913ADCF6F7EC0@BN6PR12MB1588.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:79;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(346002)(39860400002)(376002)(189003)(199004)(71190400001)(55016002)(5660300002)(9686003)(71200400001)(54896002)(6436002)(14454004)(236005)(4326008)(256004)(110136005)(14444005)(6306002)(74316002)(53936002)(81166006)(81156014)(186003)(25786009)(316002)(8676002)(26005)(54906003)(2906002)(102836004)(66556008)(2501003)(66066001)(478600001)(66476007)(486006)(66446008)(8936002)(105004)(73956011)(76116006)(72206003)(11346002)(66946007)(6506007)(53546011)(6116002)(3846002)(86362001)(966005)(33656002)(6246003)(99286004)(476003)(19627405001)(446003)(606006)(7736002)(52536014)(64756008)(76176011)(229853002)(68736007)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1588;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HgWen+hArtC53I9O2JpgpADYlxnk1hG4iDf6nokiGQSm2CwSy/awkllWFSQq19i/pSpwQEF8SrZxoExXLE9lNLhITtiRSkLHLdRJXprC5YPpWmwrWL+WSBTYYwxJRX2VTw4gJyksxh2A6PJuX/O//zHpHQBP2g5ooTDFf01QK7HJ5aIobTlZWiYfCAYlBAFGGP42oRPQGr8ohwQbU7/Bh9WUV4sqWbFq5mEcJUujsnJNPFsNeXmBheto3SZvdjZUym2z6AoSCPvfC/eRcqH61WHBl7+vxr/4KOF9fcYjT27YYD80Vt7M6riNA0rj9Q08Bdf5V26vZ6knCLeqDIpjF7MLcuwJN9SsI+3HtZGOJNXxF2KR9PLrH52hQHoLw4cAsyMjsxFEN4G7lhGXGX3Ut6lt+EzgbO7YU14JwBfbshg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33039f3f-7380-471c-25a6-08d6ef36d819
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 13:06:55.1252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1588
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqBdZMZTr0y5Kj0iFX+hzGB7XoHkr4adXZBR4fzz/Xg=;
 b=vzlBuldBfqSOD1Vl+roaU04qiqGcuBzvVkfHn/sMcouJodmgW2FpOdxyXJqFYjubYO1hLLLI9O00BKKkOEMbKHMCtvvYmOMH+FeFx0UYfSvljAUkQw9oeVUMgblZg/ENKW23Sds4xuTy3+x7TXGmR7iFpkiB815ceJTkdC7nIAc=
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
Cc: "Shamis, Leonid" <Leonid.Shamis@amd.com>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Content-Type: multipart/mixed; boundary="===============1451175038=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1451175038==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809EE94C9B9B31DB0EC04BAF7EC0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809EE94C9B9B31DB0EC04BAF7EC0BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Please use udelay directly rather than DRM_UDELAY() those old macros are de=
precated and going away.

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Zhu, Jam=
es <James.Zhu@amd.com>
Sent: Wednesday, June 12, 2019 8:59 AM
To: amd-gfx@lists.freedesktop.org
Cc: Shamis, Leonid; ckoenig.leichtzumerken@gmail.com; Zhu, James
Subject: [PATCH v2] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0

Explicitly set mmGDS_VMID0_BASE to 0. Also update
GDS_VMID0_BASE/_SIZE with direct register writes.

Signed-off-by: James Zhu <James.Zhu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 35 +++++++++++++++++--------------=
----
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gfx_v9_0.c
index ba36a28..2e058bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -305,6 +305,7 @@ static int gfx_v9_0_get_cu_info(struct amdgpu_device *a=
dev,
 static uint64_t gfx_v9_0_get_gpu_clock_counter(struct amdgpu_device *adev)=
;
 static void gfx_v9_0_select_se_sh(struct amdgpu_device *adev, u32 se_num, =
u32 sh_num, u32 instance);
 static void gfx_v9_0_ring_emit_de_meta(struct amdgpu_ring *ring);
+static u64 gfx_v9_0_ring_get_rptr_compute(struct amdgpu_ring *ring);

 static void gfx_v9_0_init_golden_registers(struct amdgpu_device *adev)
 {
@@ -3630,25 +3631,20 @@ static const struct soc15_reg_entry sec_ded_counter=
_registers[] =3D {
    { SOC15_REG_ENTRY(GC, 0, mmSQC_EDC_CNT3), 0, 4, 6},
 };

-
 static int gfx_v9_0_do_edc_gds_workarounds(struct amdgpu_device *adev)
 {
         struct amdgpu_ring *ring =3D &adev->gfx.compute_ring[0];
-       int r;
+       int i, r;

-       r =3D amdgpu_ring_alloc(ring, 17);
+       r =3D amdgpu_ring_alloc(ring, 7);
         if (r) {
                 DRM_ERROR("amdgpu: GDS workarounds failed to lock ring %s =
(%d).\n",
                         ring->name, r);
                 return r;
         }

-       amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
-       amdgpu_ring_write(ring, WRITE_DATA_ENGINE_SEL(0) |
-                               WRITE_DATA_DST_SEL(0));
-       amdgpu_ring_write(ring, SOC15_REG_OFFSET(GC, 0, mmGDS_VMID0_SIZE));
-       amdgpu_ring_write(ring, 0);
-       amdgpu_ring_write(ring, adev->gds.gds_size);
+       WREG32_SOC15(GC, 0, mmGDS_VMID0_BASE, 0x00000000);
+       WREG32_SOC15(GC, 0, mmGDS_VMID0_SIZE, adev->gds.gds_size);

         amdgpu_ring_write(ring, PACKET3(PACKET3_DMA_DATA, 5));
         amdgpu_ring_write(ring, (PACKET3_DMA_DATA_CP_SYNC |
@@ -3662,18 +3658,21 @@ static int gfx_v9_0_do_edc_gds_workarounds(struct a=
mdgpu_device *adev)
         amdgpu_ring_write(ring, PACKET3_DMA_DATA_CMD_RAW_WAIT |
                                 adev->gds.gds_size);

-       amdgpu_ring_write(ring, PACKET3(PACKET3_WRITE_DATA, 3));
-       amdgpu_ring_write(ring, WRITE_DATA_ENGINE_SEL(0) |
-                               WRITE_DATA_DST_SEL(0));
-       amdgpu_ring_write(ring, SOC15_REG_OFFSET(GC, 0, mmGDS_VMID0_SIZE));
-       amdgpu_ring_write(ring, 0);
-       amdgpu_ring_write(ring, 0x0);
-
         amdgpu_ring_commit(ring);

-       return 0;
-}
+       for (i =3D 0; i < adev->usec_timeout; i++) {
+               if (ring->wptr =3D=3D gfx_v9_0_ring_get_rptr_compute(ring))
+                       break;
+               DRM_UDELAY(1);
+       }
+
+       if (i >=3D adev->usec_timeout)
+               r =3D -ETIMEDOUT;
+
+       WREG32_SOC15(GC, 0, mmGDS_VMID0_SIZE, 0x00000000);

+       return r;
+}

 static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev)
 {
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809EE94C9B9B31DB0EC04BAF7EC0BN6PR12MB1809namp_
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
Please use udelay directly rather than DRM_UDELAY() those old macros are de=
precated and going away.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Zhu, James &lt;James.Zhu@am=
d.com&gt;<br>
<b>Sent:</b> Wednesday, June 12, 2019 8:59 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Shamis, Leonid; ckoenig.leichtzumerken@gmail.com; Zhu, James<br>
<b>Subject:</b> [PATCH v2] drm/amdgpu: explicitly set mmGDS_VMID0_BASE to 0=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Explicitly set mmGDS_VMID0_BASE to 0. Also update<=
br>
GDS_VMID0_BASE/_SIZE with direct register writes.<br>
<br>
Signed-off-by: James Zhu &lt;James.Zhu@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 35 &#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----------------=
--<br>
&nbsp;1 file changed, 17 insertions(&#43;), 18 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gfx_v9_0.c<br>
index ba36a28..2e058bf 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
@@ -305,6 &#43;305,7 @@ static int gfx_v9_0_get_cu_info(struct amdgpu_devic=
e *adev,<br>
&nbsp;static uint64_t gfx_v9_0_get_gpu_clock_counter(struct amdgpu_device *=
adev);<br>
&nbsp;static void gfx_v9_0_select_se_sh(struct amdgpu_device *adev, u32 se_=
num, u32 sh_num, u32 instance);<br>
&nbsp;static void gfx_v9_0_ring_emit_de_meta(struct amdgpu_ring *ring);<br>
&#43;static u64 gfx_v9_0_ring_get_rptr_compute(struct amdgpu_ring *ring);<b=
r>
&nbsp;<br>
&nbsp;static void gfx_v9_0_init_golden_registers(struct amdgpu_device *adev=
)<br>
&nbsp;{<br>
@@ -3630,25 &#43;3631,20 @@ static const struct soc15_reg_entry sec_ded_cou=
nter_registers[] =3D {<br>
&nbsp;&nbsp;&nbsp; { SOC15_REG_ENTRY(GC, 0, mmSQC_EDC_CNT3), 0, 4, 6},<br>
&nbsp;};<br>
&nbsp;<br>
-<br>
&nbsp;static int gfx_v9_0_do_edc_gds_workarounds(struct amdgpu_device *adev=
)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring *ring =
=3D &amp;adev-&gt;gfx.compute_ring[0];<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, r;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ring_alloc(ring, 17);<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ring_alloc(ring, 7);=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;amdgpu: GDS workarounds failed to loc=
k ring %s (%d).\n&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-=
&gt;name, r);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return r;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACKET3(PACKE=
T3_WRITE_DATA, 3));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, WRITE_DATA_EN=
GINE_SEL(0) |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(0));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, SOC15_REG_OFF=
SET(GC, 0, mmGDS_VMID0_SIZE));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, adev-&gt;gds.=
gds_size);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(GC, 0, mmGDS_VMID0_B=
ASE, 0x00000000);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(GC, 0, mmGDS_VMID0_S=
IZE, adev-&gt;gds.gds_size);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET3(PACKET3_DMA_DATA, 5));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, (P=
ACKET3_DMA_DATA_CP_SYNC |<br>
@@ -3662,18 &#43;3658,21 @@ static int gfx_v9_0_do_edc_gds_workarounds(stru=
ct amdgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PA=
CKET3_DMA_DATA_CMD_RAW_WAIT |<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gds.gds_size);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, PACKET3(PACKE=
T3_WRITE_DATA, 3));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, WRITE_DATA_EN=
GINE_SEL(0) |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WRITE_DATA_DST_SEL(0));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, SOC15_REG_OFF=
SET(GC, 0, mmGDS_VMID0_SIZE));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_write(ring, 0x0);<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_commit(ring);<=
br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
-}<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; adev-&gt;use=
c_timeout; i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ring-&gt;wptr =3D=3D gfx_v9_0_ring_get_rptr_compute(ring=
))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_UDELAY(1);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (i &gt;=3D adev-&gt;usec_timeo=
ut)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; r =3D -ETIMEDOUT;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(GC, 0, mmGDS_VMID0_S=
IZE, 0x00000000);<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&#43;}<br>
&nbsp;<br>
&nbsp;static int gfx_v9_0_do_edc_gpr_workarounds(struct amdgpu_device *adev=
)<br>
&nbsp;{<br>
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

--_000_BN6PR12MB1809EE94C9B9B31DB0EC04BAF7EC0BN6PR12MB1809namp_--

--===============1451175038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1451175038==--

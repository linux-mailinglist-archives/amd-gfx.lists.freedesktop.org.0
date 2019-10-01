Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66512C35A1
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 15:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD426E79B;
	Tue,  1 Oct 2019 13:28:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740080.outbound.protection.outlook.com [40.107.74.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6226E79B
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 13:28:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glC500cZkE7jk2qyjFYO5ml5L1Ne3imhaPHosCH5GTkX/Q26hA2QOmCF3ICnV7/gE8cme9PEcxKGERbolm567yrU8+mTGINr8j8AaeCMHvIRww/bH2ixo5XOz3mqqhKJFUbolDdmCJf/s0B8k8DzqmbXppmHAclC1M33ajxhNQ7aU8pq2rZCnesQ1//tmbezDEcPhwzQ+n9nb8nOtr6rdloQV3Y4UlpfhQcZaT+r3YKmwZrtwgX+28m1kcCjb2QZTCj3ejhbIZrswCm0jWe31Kga+qlnAp9mKtLIKxN+4UnJhkPTC3cpZ4Ui+9e4aQwL3IjZ9fn4yYWCNZldqIJyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDkyyY8ES4mJpnBHHhidupI2tSO3tpCSo5PiUAy9cGM=;
 b=BAoU7JY+UJnIasI6zcII467gnDDkRzMW/mg7J2fOa/fmk2Erh+G7ZnGu1aIzc0hfyA/nKvUp2G9CZbcApnpV65LY26cLk5+yo4TPCDAmZ4p/SnKVyMg0b6kYHoIHM2fGNtB6C6o73dTeCy/BHtketQ7Ybz4R3X5L4dq/vggx9I9NjthdkEBN+ebOmUuPstrHLAbPkphDel0xHxQoG5NJ0lXyzVpLKKAAAtmUiQN8joO4ziIoMdbfWedwSgt7bD+CRIx9lAWQF9BnwKDe0P8Jarkba01AA8Vu+dsy5RZVOOW07Bz4w6iDLNtLvbmwGjvLa5o9s9nk6RBhmEn1dr2Dag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1780.namprd12.prod.outlook.com (10.175.101.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 13:28:15 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961%10]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 13:28:15 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/amdgpu/sriov ip block setting of Arcturus
Thread-Topic: [PATCH] drm/amd/amdgpu/sriov ip block setting of Arcturus
Thread-Index: AQHVd0v4LVAzBv55vUubCjoiOvUhvKdFyWPP
Date: Tue, 1 Oct 2019 13:28:14 +0000
Message-ID: <BN6PR12MB180981B2A3F072C4D43C0CD5F79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190930050010.7437-1-Jack.Zhang1@amd.com>
In-Reply-To: <20190930050010.7437-1-Jack.Zhang1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69dfefce-c132-4a61-d115-08d7467336d5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1780:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1780D63AE465ECA09B4A7436F79D0@BN6PR12MB1780.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(376002)(39860400002)(396003)(199004)(189003)(229853002)(2501003)(55016002)(606006)(9686003)(54896002)(6436002)(476003)(8676002)(86362001)(236005)(6246003)(6306002)(81166006)(7736002)(105004)(478600001)(186003)(26005)(74316002)(81156014)(14444005)(256004)(966005)(446003)(486006)(99286004)(8936002)(11346002)(7696005)(102836004)(76176011)(53546011)(6506007)(316002)(110136005)(19627405001)(52536014)(2906002)(6116002)(3846002)(71200400001)(71190400001)(66946007)(66476007)(66556008)(64756008)(66446008)(25786009)(66066001)(33656002)(76116006)(14454004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1780;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hFROmVvofdpt4ZTMPp+ykR175RvKGW8PcFLoM8xiQWlGq079r7wWeNBKeQrVP+8kkZBG+EIviWUKZaVkhaz09WOwJlIMcWF6trA2PMAgom0dTaosCTQ6AC2dDZ5MmJgQ5czMnpU5BbMfRbMukX4N2k6mt3HVomROaXnj45siBBMmjcrH6f8OAVrPxqQq/6U7Qp9X5AxjERuclx9Um4pxhVPLTceNx0pq8e8LLs73AQviU2VCg1GV+kfxdxt2ZTWqNd/+g1abSTYBzIoxgQKf2A7M8I91KCJHayVN7MI6N0WVNIMyypAgwbBYXHu2DjNyE5IbV5Adqp3GqEG9N0gorYhDWEaCBhU+Rw8Slo6EuB1gfbT1jDZdIRxMvMbip/YRKM5VnzW+bh+KyXA0MI1shUKTNhH2ZW+VEzEY/ZhiQyGXT3mvDrruxUWdcq+nz6nN
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69dfefce-c132-4a61-d115-08d7467336d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 13:28:14.9840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BEAEsiOK8J/Vl1yJEI+1joXyR1zKZwZSB8ihm84zpSAqiCufbF4uXKNmJL0wpaWv256JC8HcJ568Ef74a68tnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1780
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDkyyY8ES4mJpnBHHhidupI2tSO3tpCSo5PiUAy9cGM=;
 b=d3OMb7m4a1nHN6XdQ5C8GfND5lOH6XVn56+Tg5HH3048FU6kCt0soBlYgJdKYx5BlBhuctIdr6PBGSrMrqC0Ad9f4EJYzCrks/5u+To8OIoj//9tl5s+Zytxi5GN/6n2Rqbc0KiGbi7bTPJ5ejgHUHLrOOIaxWXeOPHrbybsnQc=
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
Content-Type: multipart/mixed; boundary="===============0766393995=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0766393995==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180981B2A3F072C4D43C0CD5F79D0BN6PR12MB1809namp_"

--_000_BN6PR12MB180981B2A3F072C4D43C0CD5F79D0BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Jack Zha=
ng <Jack.Zhang1@amd.com>
Sent: Monday, September 30, 2019 1:00 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
Subject: [PATCH] drm/amd/amdgpu/sriov ip block setting of Arcturus

Add ip block setting for Arcturus SRIOV

1.PSP need to be initialized before IH.
2.SMU doesn't need to be initialized at kmd driver.
3.Arcturus doesn't support DCE hardware,it needs to skip
  register access to DCE.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 10 ++++++----
 drivers/gpu/drm/amd/amdgpu/soc15.c    | 19 +++++++++++++++----
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c
index 95a9a5f5..44023bd 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1330,11 +1330,13 @@ static int gmc_v9_0_hw_init(void *handle)
         gmc_v9_0_init_golden_registers(adev);

         if (adev->mode_info.num_crtc) {
-               /* Lockout access through VGA aperture*/
-               WREG32_FIELD15(DCE, 0, VGA_HDP_CONTROL, VGA_MEMORY_DISABLE,=
 1);
+               if (adev->asic_type !=3D CHIP_ARCTURUS) {
+                       /* Lockout access through VGA aperture*/
+                       WREG32_FIELD15(DCE, 0, VGA_HDP_CONTROL, VGA_MEMORY_=
DISABLE, 1);

-               /* disable VGA render */
-               WREG32_FIELD15(DCE, 0, VGA_RENDER_CONTROL, VGA_VSTATUS_CNTL=
, 0);
+                       /* disable VGA render */
+                       WREG32_FIELD15(DCE, 0, VGA_RENDER_CONTROL, VGA_VSTA=
TUS_CNTL, 0);
+               }
         }

This is a general bug fix and should be split out into a separate patch.

Alex

         r =3D gmc_v9_0_gart_enable(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index dbd790e..ac181e3 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -754,14 +754,25 @@ int soc15_set_ip_blocks(struct amdgpu_device *adev)
         case CHIP_ARCTURUS:
                 amdgpu_device_ip_block_add(adev, &vega10_common_ip_block);
                 amdgpu_device_ip_block_add(adev, &gmc_v9_0_ip_block);
-               amdgpu_device_ip_block_add(adev, &vega10_ih_ip_block);
-               if (likely(adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_P=
SP))
-                       amdgpu_device_ip_block_add(adev, &psp_v11_0_ip_bloc=
k);
+
+               /* For MI100 SR-IOV, PSP need to be initialized before IH *=
/
+               if (amdgpu_sriov_vf(adev)) {
+                       if (likely(adev->firmware.load_type =3D=3D AMDGPU_F=
W_LOAD_PSP))
+                               amdgpu_device_ip_block_add(adev, &psp_v11_0=
_ip_block);
+                       amdgpu_device_ip_block_add(adev, &vega10_ih_ip_bloc=
k);
+               } else {
+                       amdgpu_device_ip_block_add(adev, &vega10_ih_ip_bloc=
k);
+                       if (likely(adev->firmware.load_type =3D=3D AMDGPU_F=
W_LOAD_PSP))
+                               amdgpu_device_ip_block_add(adev, &psp_v11_0=
_ip_block);
+               }
+
                 if (adev->enable_virtual_display || amdgpu_sriov_vf(adev))
                         amdgpu_device_ip_block_add(adev, &dce_virtual_ip_b=
lock);
                 amdgpu_device_ip_block_add(adev, &gfx_v9_0_ip_block);
                 amdgpu_device_ip_block_add(adev, &sdma_v4_0_ip_block);
-               amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_block);
+               if (!amdgpu_sriov_vf(adev))
+                       amdgpu_device_ip_block_add(adev, &smu_v11_0_ip_bloc=
k);
+
                 if (unlikely(adev->firmware.load_type =3D=3D AMDGPU_FW_LOA=
D_DIRECT))
                         amdgpu_device_ip_block_add(adev, &vcn_v2_5_ip_bloc=
k);
                 break;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180981B2A3F072C4D43C0CD5F79D0BN6PR12MB1809namp_
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
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Jack Zhang &lt;Jack.Zhang1@=
amd.com&gt;<br>
<b>Sent:</b> Monday, September 30, 2019 1:00 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhang, Jack (Jian) &lt;Jack.Zhang1@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/amdgpu/sriov ip block setting of Arcturus</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Add ip block setting for Arcturus SRIOV<br>
<br>
1.PSP need to be initialized before IH.<br>
2.SMU doesn't need to be initialized at kmd driver.<br>
3.Arcturus doesn't support DCE hardware,it needs to skip<br>
&nbsp; register access to DCE.<br>
<br>
Signed-off-by: Jack Zhang &lt;Jack.Zhang1@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 10 &#43;&#43;&#43;&#43;&#43;&=
#43;----<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c&nbsp;&nbsp;&nbsp; | 19 &#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----<br>
&nbsp;2 files changed, 21 insertions(&#43;), 8 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gmc_v9_0.c<br>
index 95a9a5f5..44023bd 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
@@ -1330,11 &#43;1330,13 @@ static int gmc_v9_0_hw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gmc_v9_0_init_golden_regis=
ters(adev);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;mode_info.num=
_crtc) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* Lockout access through VGA aperture*/<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32_FIELD15(DCE, 0, VGA_HDP_CONTROL, VGA_MEMORY_DISABLE, 1);<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;asic_type !=3D CHIP_ARCTURUS) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Lockout a=
ccess through VGA aperture*/<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_FIELD=
15(DCE, 0, VGA_HDP_CONTROL, VGA_MEMORY_DISABLE, 1);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* disable VGA render */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; WREG32_FIELD15(DCE, 0, VGA_RENDER_CONTROL, VGA_VSTATUS_CNTL, 0);=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* disable V=
GA render */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_FIELD=
15(DCE, 0, VGA_RENDER_CONTROL, VGA_VSTATUS_CNTL, 0);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp; <br>
</div>
<div class=3D"PlainText"><span style=3D"color: rgb(111, 192, 64);">This is =
a general bug fix and should be split out into a separate patch.</span></di=
v>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><span style=3D"color: rgb(111, 192, 64);">Alex</sp=
an><br>
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
 =3D gmc_v9_0_gart_enable(adev);<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index dbd790e..ac181e3 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -754,14 &#43;754,25 @@ int soc15_set_ip_blocks(struct amdgpu_device *ade=
v)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_ARCTURUS:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;vega10_common_i=
p_block);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;gmc_v9_0_ip_blo=
ck);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;vega10_ih_ip_block);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (likely(adev-&gt;firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP=
))<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip=
_block_add(adev, &amp;psp_v11_0_ip_block);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; /* For MI100 SR-IOV, PSP need to be initialized before IH */=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (amdgpu_sriov_vf(adev)) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (likely(a=
dev-&gt;firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;p=
sp_v11_0_ip_block);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devic=
e_ip_block_add(adev, &amp;vega10_ih_ip_block);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; } else {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devic=
e_ip_block_add(adev, &amp;vega10_ih_ip_block);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (likely(a=
dev-&gt;firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;p=
sp_v11_0_ip_block);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (adev-&gt;enable_virtual_display || amdgpu_sriov_v=
f(adev))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgp=
u_device_ip_block_add(adev, &amp;dce_virtual_ip_block);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;gfx_v9_0_ip_blo=
ck);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;sdma_v4_0_ip_bl=
ock);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; amdgpu_device_ip_block_add(adev, &amp;smu_v11_0_ip_block);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_devic=
e_ip_block_add(adev, &amp;smu_v11_0_ip_block);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (unlikely(adev-&gt;firmware.load_type =3D=3D AMDGP=
U_FW_LOAD_DIRECT))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgp=
u_device_ip_block_add(adev, &amp;vcn_v2_5_ip_block);<br>
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

--_000_BN6PR12MB180981B2A3F072C4D43C0CD5F79D0BN6PR12MB1809namp_--

--===============0766393995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0766393995==--

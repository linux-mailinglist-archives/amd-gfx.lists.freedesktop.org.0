Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE4A14D63
	for <lists+amd-gfx@lfdr.de>; Mon,  6 May 2019 16:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771B0899F3;
	Mon,  6 May 2019 14:51:50 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780058.outbound.protection.outlook.com [40.107.78.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B90789950
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 May 2019 14:51:48 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1380.namprd12.prod.outlook.com (10.168.228.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Mon, 6 May 2019 14:51:47 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::bc5b:de68:25b7:d853%12]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 14:51:47 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Huang, Trigger" <Trigger.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Use FW addr returned by PSP for VF MM
Thread-Topic: [PATCH] drm/amdgpu: Use FW addr returned by PSP for VF MM
Thread-Index: AQHVAOaApbtd92TlxUajYfd0c+kW6aZeNFnj
Date: Mon, 6 May 2019 14:51:46 +0000
Message-ID: <BN6PR12MB180932785D60B6BFAD3E2DD6F7300@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1556801791-8460-1-git-send-email-Trigger.Huang@amd.com>
In-Reply-To: <1556801791-8460-1-git-send-email-Trigger.Huang@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.84.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fcd0999b-8887-41af-8161-08d6d2325d14
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1380; 
x-ms-traffictypediagnostic: BN6PR12MB1380:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1380369A5555BD4F8533BB65F7300@BN6PR12MB1380.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:241;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(39860400002)(396003)(136003)(199004)(189003)(3846002)(6116002)(66066001)(5660300002)(966005)(72206003)(81166006)(81156014)(478600001)(71190400001)(19627405001)(55016002)(316002)(6506007)(11346002)(2501003)(53546011)(52536014)(8936002)(606006)(68736007)(14454004)(86362001)(66446008)(64756008)(66556008)(66476007)(73956011)(66946007)(76116006)(76176011)(446003)(33656002)(476003)(256004)(74316002)(229853002)(71200400001)(6436002)(2906002)(8676002)(486006)(25786009)(53936002)(26005)(7696005)(186003)(6306002)(54896002)(110136005)(105004)(7736002)(99286004)(6246003)(236005)(102836004)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1380;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8BC4ga/ZrroNV1iy5fD03QUDLnJqaskb+6r1+hyffmQawPY8rZkNALsrfFrWm3VT69y1CXXUzKWw6/RCW4nlL65hsTr2o7N4ysPJ1EaFxwbBMP5YvvCOkZCWGaAt5GDGfIl+CaMWbByEdS5f/x2ywxaK3Eg3qCK7iReTz4FBXi3jojv2oYAP1bfe17qEYDZj8m05PCQwnQu4hJrhDJJ/9Ac9S3xjyg7+Uw9wRp9mJPiE9iw7xBx9addPbtBQhBVC8kZKh8zh2RrkTFDglajL5Hu+VEvEOcFTz2By0k09BjsS3r9VIOzx4iiBX71kMtIGodLwFsIL5FHTGibtAftSP1MFeD46xMgDQ/GjvtznGHIXFuJRUU7JpyvswicAJPj6ZePoCwZNBEPOO9Yu9Ckpy7TZ2U/0T6/fJxJhdvZAkrI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd0999b-8887-41af-8161-08d6d2325d14
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 14:51:46.9014 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1380
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EogpWNTGffiffXQOnEYrhKSYK3SxDemlrlto6B+LxFY=;
 b=V7bp9kNngD66fKCA+RClgbA2LEK1Rvw/nUVr5nP7j9mB3vukSS7TiWbS4R8YID9wjx5lbQo0tCLh1jPRIIROQlvsEXDLhNy+FZyDlBSK9g8PrihRv+8jmanl/c4DNtdrQ+Z8oDug0L5AO5Wu0SLKB8RGTrtyuyUZs5iR2payjzE=
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
Content-Type: multipart/mixed; boundary="===============1788300712=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1788300712==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180932785D60B6BFAD3E2DD6F7300BN6PR12MB1809namp_"

--_000_BN6PR12MB180932785D60B6BFAD3E2DD6F7300BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

As long as this doesn't break bare metal, I'm ok with it.
Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Trigger =
Huang <Trigger.Huang@amd.com>
Sent: Thursday, May 2, 2019 8:56 AM
To: amd-gfx@lists.freedesktop.org
Cc: Huang, Trigger
Subject: [PATCH] drm/amdgpu: Use FW addr returned by PSP for VF MM

[CAUTION: External Email]

One Vega10 SR-IOV VF, the FW address returned by PSP should be
set into the init table, while not the original BO mc address.
otherwise, UVD and VCE IB test will fail under Vega10 SR-IOV

reference:
        commit bfcea5204287 ("drm/amdgpu:change VEGA booting with firmware =
loaded by PSP")
        commit aa5873dca463 ("drm/amdgpu: Change VCE booting with firmware =
loaded by PSP")

Signed-off-by: Trigger Huang <Trigger.Huang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c | 16 ++++++++++------
 drivers/gpu/drm/amd/amdgpu/vce_v4_0.c | 17 +++++++++++------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/am=
dgpu/uvd_v7_0.c
index dc461df..2191d3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c
@@ -787,10 +787,13 @@ static int uvd_v7_0_sriov_start(struct amdgpu_device =
*adev)
                                                           0xFFFFFFFF, 0x00=
000004);
                        /* mc resume*/
                        if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_=
PSP) {
-                               MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
-                                                           lower_32_bits(a=
dev->firmware.ucode[AMDGPU_UCODE_ID_UVD].mc_addr));
-                               MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
-                                                           upper_32_bits(a=
dev->firmware.ucode[AMDGPU_UCODE_ID_UVD].mc_addr));
+                               MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, i,
+                                                       mmUVD_LMI_VCPU_CACH=
E_64BIT_BAR_LOW),
+                                                       adev->firmware.ucod=
e[AMDGPU_UCODE_ID_UVD].tmr_mc_addr_lo);
+                               MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, i,
+                                                       mmUVD_LMI_VCPU_CACH=
E_64BIT_BAR_HIGH),
+                                                       adev->firmware.ucod=
e[AMDGPU_UCODE_ID_UVD].tmr_mc_addr_hi);
+                               MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, 0, mmUVD_VCPU_CACHE_OFFSET0), 0);
                                offset =3D 0;
                        } else {
                                MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),
@@ -798,10 +801,11 @@ static int uvd_v7_0_sriov_start(struct amdgpu_device =
*adev)
                                MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),
                                                            upper_32_bits(a=
dev->uvd.inst[i].gpu_addr));
                                offset =3D size;
+                               MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, 0, mmUVD_VCPU_CACHE_OFFSET0),
+                                                       AMDGPU_UVD_FIRMWARE=
_OFFSET >> 3);
+
                        }

-                       MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(UVD, i=
, mmUVD_VCPU_CACHE_OFFSET0),
-                                                   AMDGPU_UVD_FIRMWARE_OFF=
SET >> 3);
                        MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(UVD, i=
, mmUVD_VCPU_CACHE_SIZE0), size);

                        MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(UVD, i=
, mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_LOW),
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/am=
dgpu/vce_v4_0.c
index f3f5938..c0ec279 100644
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
@@ -244,13 +244,18 @@ static int vce_v4_0_sriov_start(struct amdgpu_device =
*adev)
                MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_=
LMI_SWAP_CNTL1), 0);
                MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_=
LMI_VM_CTRL), 0);

+               offset =3D AMDGPU_VCE_FIRMWARE_OFFSET;
                if (adev->firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP) {
+                       uint32_t low =3D adev->firmware.ucode[AMDGPU_UCODE_=
ID_VCE].tmr_mc_addr_lo;
+                       uint32_t hi =3D adev->firmware.ucode[AMDGPU_UCODE_I=
D_VCE].tmr_mc_addr_hi;
+                       uint64_t tmr_mc_addr =3D (uint64_t)(hi) << 32 | low=
;
+
                        MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0=
,
-                                               mmVCE_LMI_VCPU_CACHE_40BIT_=
BAR0),
-                                               adev->firmware.ucode[AMDGPU=
_UCODE_ID_VCE].mc_addr >> 8);
+                                               mmVCE_LMI_VCPU_CACHE_40BIT_=
BAR0), tmr_mc_addr >> 8);
                        MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0=
,
                                                mmVCE_LMI_VCPU_CACHE_64BIT_=
BAR0),
-                                               (adev->firmware.ucode[AMDGP=
U_UCODE_ID_VCE].mc_addr >> 40) & 0xff);
+                                               (tmr_mc_addr >> 40) & 0xff)=
;
+                       MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0=
, mmVCE_VCPU_CACHE_OFFSET0), 0);
                } else {
                        MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0=
,
                                                mmVCE_LMI_VCPU_CACHE_40BIT_=
BAR0),
@@ -258,6 +263,9 @@ static int vce_v4_0_sriov_start(struct amdgpu_device *a=
dev)
                        MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0=
,
                                                mmVCE_LMI_VCPU_CACHE_64BIT_=
BAR0),
                                                (adev->vce.gpu_addr >> 40) =
& 0xff);
+                       MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0=
, mmVCE_VCPU_CACHE_OFFSET0),
+                                               offset & ~0x0f000000);
+
                }
                MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0,
                                                mmVCE_LMI_VCPU_CACHE_40BIT_=
BAR1),
@@ -272,10 +280,7 @@ static int vce_v4_0_sriov_start(struct amdgpu_device *=
adev)
                                                mmVCE_LMI_VCPU_CACHE_64BIT_=
BAR2),
                                                (adev->vce.gpu_addr >> 40) =
& 0xff);

-               offset =3D AMDGPU_VCE_FIRMWARE_OFFSET;
                size =3D VCE_V4_0_FW_SIZE;
-               MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_=
VCPU_CACHE_OFFSET0),
-                                       offset & ~0x0f000000);
                MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_=
VCPU_CACHE_SIZE0), size);

                offset =3D (adev->firmware.load_type !=3D AMDGPU_FW_LOAD_PS=
P) ? offset + size : 0;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180932785D60B6BFAD3E2DD6F7300BN6PR12MB1809namp_
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
As long as this doesn't break bare metal, I'm ok with it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Trigger Huang &lt;Trigger.Hua=
ng@amd.com&gt;<br>
<b>Sent:</b> Thursday, May 2, 2019 8:56 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Huang, Trigger<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Use FW addr returned by PSP for VF MM</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
One Vega10 SR-IOV VF, the FW address returned by PSP should be<br>
set into the init table, while not the original BO mc address.<br>
otherwise, UVD and VCE IB test will fail under Vega10 SR-IOV<br>
<br>
reference:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commit bfcea5204287 (&quot;drm/a=
mdgpu:change VEGA booting with firmware loaded by PSP&quot;)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commit aa5873dca463 (&quot;drm/a=
mdgpu: Change VCE booting with firmware loaded by PSP&quot;)<br>
<br>
Signed-off-by: Trigger Huang &lt;Trigger.Huang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c | 16 &#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;------<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vce_v4_0.c | 17 &#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;------<br>
&nbsp;2 files changed, 21 insertions(&#43;), 12 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c b/drivers/gpu/drm/amd/am=
dgpu/uvd_v7_0.c<br>
index dc461df..2191d3d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/uvd_v7_0.c<br>
@@ -787,10 &#43;787,13 @@ static int uvd_v7_0_sriov_start(struct amdgpu_dev=
ice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xFFFFFFFF, 0x00000004);<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* mc resum=
e*/<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&g=
t;firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lower_32_bits(adev-&gt;fi=
rmware.ucode[AMDGPU_UCODE_ID_UVD].mc_addr));<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSE=
T(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upper_32_bits(adev-&gt;fi=
rmware.ucode[AMDGPU_UCODE_ID_UVD].mc_addr));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_O=
FFSET(UVD, i,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;firmware.ucode[AMDGPU_UCODE_ID_UVD].=
tmr_mc_addr_lo);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_O=
FFSET(UVD, i,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;firmware.ucode[AMDGPU_UCODE_ID_UVD].=
tmr_mc_addr_hi);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_O=
FFSET(UVD, 0, mmUVD_VCPU_CACHE_OFFSET0), 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_=
OFFSET(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_LOW),<br>
@@ -798,10 &#43;801,11 @@ static int uvd_v7_0_sriov_start(struct amdgpu_dev=
ice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_=
OFFSET(UVD, i, mmUVD_LMI_VCPU_CACHE_64BIT_BAR_HIGH),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upper_32_bits(adev-&=
gt;uvd.inst[i].gpu_addr));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D size;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_O=
FFSET(UVD, 0, mmUVD_VCPU_CACHE_OFFSET0),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_UVD_FIRMWARE_OFFSET &gt;&gt; 3);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_INSER=
T_DIRECT_WT(SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_OFFSET0),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; AMDGPU_UVD_FIRMWARE_OFFSET &gt;&gt; 3);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_=
INSERT_DIRECT_WT(SOC15_REG_OFFSET(UVD, i, mmUVD_VCPU_CACHE_SIZE0), size);<b=
r>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_=
INSERT_DIRECT_WT(SOC15_REG_OFFSET(UVD, i, mmUVD_LMI_VCPU_CACHE1_64BIT_BAR_L=
OW),<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c b/drivers/gpu/drm/amd/am=
dgpu/vce_v4_0.c<br>
index f3f5938..c0ec279 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c<br>
@@ -244,13 &#43;244,18 @@ static int vce_v4_0_sriov_start(struct amdgpu_dev=
ice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_=
LMI_SWAP_CNTL1), 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_=
LMI_VM_CTRL), 0);<br>
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; offset =3D AMDGPU_VCE_FIRMWARE_OFFSET;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (adev-&gt;firmware.load_type =3D=3D AMDGPU_FW_LOAD_PSP) =
{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t low=
 =3D adev-&gt;firmware.ucode[AMDGPU_UCODE_ID_VCE].tmr_mc_addr_lo;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t hi =
=3D adev-&gt;firmware.ucode[AMDGPU_UCODE_ID_VCE].tmr_mc_addr_hi;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t tmr=
_mc_addr =3D (uint64_t)(hi) &lt;&lt; 32 | low;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_=
INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmVCE_LMI_VCPU_CACHE_4=
0BIT_BAR0),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;firmware.ucod=
e[AMDGPU_UCODE_ID_VCE].mc_addr &gt;&gt; 8);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmVCE_LMI_VCPU_CAC=
HE_40BIT_BAR0), tmr_mc_addr &gt;&gt; 8);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_=
INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmVCE_LMI_VCPU_CA=
CHE_64BIT_BAR0),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;firmware.uco=
de[AMDGPU_UCODE_ID_VCE].mc_addr &gt;&gt; 40) &amp; 0xff);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (tmr_mc_addr &gt;&=
gt; 40) &amp; 0xff);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_I=
NSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_VCPU_CACHE_OFFSET0), 0);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_=
INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmVCE_LMI_VCPU_CA=
CHE_40BIT_BAR0),<br>
@@ -258,6 &#43;263,9 @@ static int vce_v4_0_sriov_start(struct amdgpu_devic=
e *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_=
INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmVCE_LMI_VCPU_CA=
CHE_64BIT_BAR0),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;vce.gpu=
_addr &gt;&gt; 40) &amp; 0xff);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MMSCH_V1_0_I=
NSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_VCPU_CACHE_OFFSET0),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset &amp; ~0x0f=
000000);<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmVCE_LMI_VCPU_CA=
CHE_40BIT_BAR1),<br>
@@ -272,10 &#43;280,7 @@ static int vce_v4_0_sriov_start(struct amdgpu_devi=
ce *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmVCE_LMI_VCPU_CA=
CHE_64BIT_BAR2),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;vce.gpu=
_addr &gt;&gt; 40) &amp; 0xff);<br>
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; offset =3D AMDGPU_VCE_FIRMWARE_OFFSET;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; size =3D VCE_V4_0_FW_SIZE;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_VCPU_=
CACHE_OFFSET0),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; offset &amp; ~0x0f000000);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; MMSCH_V1_0_INSERT_DIRECT_WT(SOC15_REG_OFFSET(VCE, 0, mmVCE_=
VCPU_CACHE_SIZE0), size);<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; offset =3D (adev-&gt;firmware.load_type !=3D AMDGPU_FW_LOAD=
_PSP) ? offset &#43; size : 0;<br>
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

--_000_BN6PR12MB180932785D60B6BFAD3E2DD6F7300BN6PR12MB1809namp_--

--===============1788300712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1788300712==--

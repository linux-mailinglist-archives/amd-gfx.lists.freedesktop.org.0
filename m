Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F79B50A68
	for <lists+amd-gfx@lfdr.de>; Mon, 24 Jun 2019 14:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DEB38981D;
	Mon, 24 Jun 2019 12:08:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710068.outbound.protection.outlook.com [40.107.71.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EC689AEA
 for <amd-gfx@lists.freedesktop.org>; Mon, 24 Jun 2019 12:08:17 +0000 (UTC)
Received: from MN2PR12MB2974.namprd12.prod.outlook.com (20.178.240.140) by
 MN2PR12MB3294.namprd12.prod.outlook.com (20.179.81.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Mon, 24 Jun 2019 12:08:16 +0000
Received: from MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::18c9:4b9:2b9e:2c62]) by MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::18c9:4b9:2b9e:2c62%7]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 12:08:16 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix modprobe failure for uvd_4/5/6
Thread-Topic: [PATCH] drm/amdgpu: fix modprobe failure for uvd_4/5/6
Thread-Index: AQHVKoQtovrYGKiBkkqeFbjDKHxWraaqtdQZ
Date: Mon, 24 Jun 2019 12:08:15 +0000
Message-ID: <MN2PR12MB2974DEB333EFC573700D0B5895E00@MN2PR12MB2974.namprd12.prod.outlook.com>
References: <1561377497-2257-1-git-send-email-Hawking.Zhang@amd.com>
In-Reply-To: <1561377497-2257-1-git-send-email-Hawking.Zhang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ed863e0-6064-4d6a-d880-08d6f89ca383
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3294; 
x-ms-traffictypediagnostic: MN2PR12MB3294:
x-microsoft-antispam-prvs: <MN2PR12MB32941559405F1FC6B2DB086B95E00@MN2PR12MB3294.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(39860400002)(136003)(396003)(189003)(199004)(256004)(478600001)(55016002)(5660300002)(99286004)(3846002)(74316002)(72206003)(25786009)(53936002)(14454004)(19627405001)(7736002)(6436002)(6116002)(81166006)(105004)(76176011)(26005)(102836004)(6506007)(6246003)(81156014)(8936002)(186003)(8676002)(6636002)(53546011)(229853002)(66066001)(446003)(7696005)(66446008)(86362001)(52536014)(33656002)(9686003)(2906002)(54896002)(64756008)(66476007)(66556008)(66946007)(11346002)(68736007)(71200400001)(71190400001)(73956011)(14444005)(316002)(110136005)(91956017)(76116006)(476003)(486006)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3294;
 H:MN2PR12MB2974.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rQ6JWeCjX1pWOfOQt76KDqA3IWAjnV4i/LE/uMYRwLRed64F90dhn7O15MOx4/ITn1tc3BoKrOG5n4+Cumh2EIrs73hFTDrdFUhQbEvgSn9+FnHZ0wFcAGxltGNEyNwhBaflb/xC7M+l7V3Skon5H6JkE/DME3IGqbwPGTpr3cvdP3xZIakBe/3kjpvE2coPD6B1LPab7Ytx/5sAC7VfjWnE0JE322G7+p0Cl9caFANvBkELmlkjAMgD2hREWP0sYld6q0kspjLcIrO2lh1OO24DR1oVjrcEhD4aUOlzBYJAG+jUW5FnhVCgYglE9B5PfOBAyjw2+VDr2DUxkJQ+XWK8YESepw8k+ICMWKKv3AG1r3HFb2G37yunqnYOU0scMO74ztNWE9Y46KPBNW12oMijzmCwAA799XuqKbBmZMU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed863e0-6064-4d6a-d880-08d6f89ca383
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 12:08:15.9848 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiancyin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3294
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n2HuuZXSBqeM2552/bl1tLGm61LhS/ZD6473RrNWAGw=;
 b=F6uCf2GCQrSjGozSGxJ1u2mOCx1AjXZGw7ylGH3dCDhObjmfIhA7YjkkwO5k735h/F4EfTBMhXqzGhedtMIsnzgmd4sDRiTnyZgYk3MA3SLqHs0jkLnAHuqXtBoYGvx5Qk7jJSu4NEJdYNNf852m11nj7vmD+27chGbFjPW/tF4=
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
Content-Type: multipart/mixed; boundary="===============0529045552=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0529045552==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2974DEB333EFC573700D0B5895E00MN2PR12MB2974namp_"

--_000_MN2PR12MB2974DEB333EFC573700D0B5895E00MN2PR12MB2974namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Tianci Yin <tianci.yin@amd.com>
________________________________
From: Hawking Zhang <Hawking.Zhang@amd.com>
Sent: Monday, June 24, 2019 19:58
To: amd-gfx@lists.freedesktop.org; Deucher, Alexander; Yin, Tianci (Rico)
Cc: Zhang, Hawking
Subject: [PATCH] drm/amdgpu: fix modprobe failure for uvd_4/5/6

For uvd_4/5/6, amdgpu driver will only power on them when
there are jobs assigned to decode/enc rings.uvd_4/5/6 dpm was broken
since amdgpu_dpm_set_powergating_by_smu only covers gfx block.

The change would add more IP block support in amdgpu_dpm_set_powergating_by=
_smu
For GFX/UVD/VCN/VCE, if the new SMU driver is supported, invoke new
power gate helper function smu_dpm_set_power_gate, otherwise, fallback to
legacy powerplay helper function pp_set_powergating_by_smu. For other IP bl=
ocks
always invoke legacy powerplay helper function.

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c    | 11 ++++++++++-
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c |  3 +++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_dpm.c
index f54a1ef..357e45f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c
@@ -948,12 +948,21 @@ int amdgpu_dpm_set_powergating_by_smu(struct amdgpu_d=
evice *adev, uint32_t block

         switch (block_type) {
         case AMD_IP_BLOCK_TYPE_GFX:
+       case AMD_IP_BLOCK_TYPE_UVD:
+       case AMD_IP_BLOCK_TYPE_VCN:
+       case AMD_IP_BLOCK_TYPE_VCE:
                 if (swsmu)
-                       ret =3D smu_gfx_off_control(&adev->smu, gate);
+                       ret =3D smu_dpm_set_power_gate(&adev->smu, block_ty=
pe, gate);
                 else
                         ret =3D ((adev)->powerplay.pp_funcs->set_powergati=
ng_by_smu(
                                 (adev)->powerplay.pp_handle, block_type, g=
ate));
                 break;
+       case AMD_IP_BLOCK_TYPE_GMC:
+       case AMD_IP_BLOCK_TYPE_ACP:
+       case AMD_IP_BLOCK_TYPE_SDMA:
+               ret =3D ((adev)->powerplay.pp_funcs->set_powergating_by_smu=
(
+                               (adev)->powerplay.pp_handle, block_type, ga=
te));
+               break;
         default:
                 break;
         }
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index edd1da6..f61ecbf 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -233,6 +233,9 @@ int smu_dpm_set_power_gate(struct smu_context *smu, uin=
t32_t block_type,
         case AMD_IP_BLOCK_TYPE_VCE:
                 ret =3D smu_dpm_set_vce_enable(smu, gate);
                 break;
+       case AMD_IP_BLOCK_TYPE_GFX:
+               ret =3D smu_gfx_off_control(smu, gate);
+               break;
         default:
                 break;
         }
--
2.7.4


--_000_MN2PR12MB2974DEB333EFC573700D0B5895E00MN2PR12MB2974namp_
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
Reviewed-by: Tianci Yin &lt;tianci.yin@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Hawking Zhang &lt;Haw=
king.Zhang@amd.com&gt;<br>
<b>Sent:</b> Monday, June 24, 2019 19:58<br>
<b>To:</b> amd-gfx@lists.freedesktop.org; Deucher, Alexander; Yin, Tianci (=
Rico)<br>
<b>Cc:</b> Zhang, Hawking<br>
<b>Subject:</b> [PATCH] drm/amdgpu: fix modprobe failure for uvd_4/5/6</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">For uvd_4/5/6, amdgpu driver will only power on th=
em when<br>
there are jobs assigned to decode/enc rings.uvd_4/5/6 dpm was broken<br>
since amdgpu_dpm_set_powergating_by_smu only covers gfx block.<br>
<br>
The change would add more IP block support in amdgpu_dpm_set_powergating_by=
_smu<br>
For GFX/UVD/VCN/VCE, if the new SMU driver is supported, invoke new<br>
power gate helper function smu_dpm_set_power_gate, otherwise, fallback to<b=
r>
legacy powerplay helper function pp_set_powergating_by_smu. For other IP bl=
ocks<br>
always invoke legacy powerplay helper function.<br>
<br>
Signed-off-by: Hawking Zhang &lt;Hawking.Zhang@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c&nbsp;&nbsp;&nbsp; | 11 &#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c |&nbsp; 3 &#43;&#43;&#43;<=
br>
&nbsp;2 files changed, 13 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_dpm.c<br>
index f54a1ef..357e45f 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_dpm.c<br>
@@ -948,12 &#43;948,21 @@ int amdgpu_dpm_set_powergating_by_smu(struct amdg=
pu_device *adev, uint32_t block<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (block_type) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_GFX=
:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_UVD:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_VCN:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_VCE:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (swsmu)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_gfx_=
off_control(&amp;adev-&gt;smu, gate);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_=
dpm_set_power_gate(&amp;adev-&gt;smu, block_type, gate);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =
=3D ((adev)-&gt;powerplay.pp_funcs-&gt;set_powergating_by_smu(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev)-&gt;powerplay.pp_handle, =
block_type, gate));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_GMC:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_ACP:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_SDMA:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D ((adev)-&gt;powerplay.pp_funcs-&gt;set_powergating_b=
y_smu(<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev)-&gt;powerplay.pp_handle, block_t=
ype, gate));<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index edd1da6..f61ecbf 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -233,6 &#43;233,9 @@ int smu_dpm_set_power_gate(struct smu_context *smu,=
 uint32_t block_type,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_VCE=
:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ret =3D smu_dpm_set_vce_enable(smu, gate);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_IP_BLOCK_TYPE_GFX:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_gfx_off_control(smu, gate);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-- <br>
2.7.4<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB2974DEB333EFC573700D0B5895E00MN2PR12MB2974namp_--

--===============0529045552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0529045552==--

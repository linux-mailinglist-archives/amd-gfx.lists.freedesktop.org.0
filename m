Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698273CC9B
	for <lists+amd-gfx@lfdr.de>; Tue, 11 Jun 2019 15:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9615E891B7;
	Tue, 11 Jun 2019 13:10:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730041.outbound.protection.outlook.com [40.107.73.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DC0891B7
 for <amd-gfx@lists.freedesktop.org>; Tue, 11 Jun 2019 13:09:59 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1729.namprd12.prod.outlook.com (10.175.102.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Tue, 11 Jun 2019 13:09:57 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1965.011; Tue, 11 Jun 2019
 13:09:57 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Add CHIP_VEGAM to amdgpu_amdkfd_device_probe
Thread-Topic: [PATCH] drm/amdgpu: Add CHIP_VEGAM to amdgpu_amdkfd_device_probe
Thread-Index: AQHVIFNdsGzQn5hl9EmhDQJdDRcv2aaWbTYu
Date: Tue, 11 Jun 2019 13:09:57 +0000
Message-ID: <BN6PR12MB1809C2E7BFCAA3068E0B7A45F7ED0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190611124400.13823-1-kent.russell@amd.com>
In-Reply-To: <20190611124400.13823-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.161.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ff937c5-ccd2-492f-a39b-08d6ee6e1a92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1729; 
x-ms-traffictypediagnostic: BN6PR12MB1729:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1729C721B3C6FF400B739A02F7ED0@BN6PR12MB1729.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 006546F32A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(346002)(366004)(376002)(199004)(189003)(316002)(53546011)(66946007)(229853002)(6246003)(102836004)(5660300002)(71190400001)(6306002)(76116006)(74316002)(966005)(54896002)(236005)(73956011)(66556008)(14454004)(66476007)(64756008)(71200400001)(72206003)(68736007)(52536014)(606006)(66066001)(33656002)(53936002)(9686003)(86362001)(6116002)(76176011)(3846002)(486006)(99286004)(7696005)(25786009)(11346002)(446003)(8936002)(105004)(26005)(478600001)(2906002)(81156014)(81166006)(55016002)(8676002)(186003)(6506007)(2501003)(110136005)(6436002)(19627405001)(66446008)(476003)(256004)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1729;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /lGRozoLCZDUwwPU+v8CvVQ56XVw/aHkEaPjiK1fb4Ymxa9DnEI0vbi281EIhEdvX6wpF/xd7sh7nJm+sGYvyAFQs3RDwIWUrwd6KIxM4rsk+WRUsNbV8ufAsDsVgTQy0d9rxrrBSPAFJv1uhRGNWbD1EmsZQLTf9+zyGhl7PnTiBdLMTLxOQsVC0hKZoYj6SgmrrR7DEjMTK66L9TtOhNekUf7eTUsFS69isUNZMFp9wvrhFsYPVEObLY4KeXKdvOGS6zrUpNAO5LB3rRWqSxVRbl9MPrsCEaUWD0Q93Jl9om/HItUEA02xWM0HgX/961TiQbcbNgTQwwLzejcpOb9cKoBkzZzpbUKEsQ0VV4rcTiOxmS/j1oFIiN+r5clSXVfDc5F3707yPftGRLE3zfFvVdlrlgER+qqQb5zmlW8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff937c5-ccd2-492f-a39b-08d6ee6e1a92
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2019 13:09:57.7263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1729
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Q1aSamubw971O1VXeKuUeauKnqxB1n4uLt4MHRo/cs=;
 b=0IgT9mVj08B60QA2tCjUtfMicgNN0E4pZmn3i7YUyUsbV5RDe9yLiQQW5MQEqFyN4YKqLiab7fWNxdR0OpqnbXvvGLYVW90iAKSdBDe63UtLdphOmVvrQGYD9xNWqRkyfJAUzwowiIfhnevrhgq3yWdF+YAXwfdhf8qthmomywY=
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
Content-Type: multipart/mixed; boundary="===============0864053958=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0864053958==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809C2E7BFCAA3068E0B7A45F7ED0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809C2E7BFCAA3068E0B7A45F7ED0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Tuesday, June 11, 2019 8:44 AM
To: amd-gfx@lists.freedesktop.org
Cc: Russell, Kent
Subject: [PATCH] drm/amdgpu: Add CHIP_VEGAM to amdgpu_amdkfd_device_probe

We have the rest of the support in the kerne, but we don't actually boot KF=
D
on the device without this change

Change-Id: Ifcc5c5e058d72e33a2f3f945f269ba6d2613b7b0
Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_amdkfd.c
index 4af3989e4a75..b7582b9aa1cd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -78,6 +78,7 @@ void amdgpu_amdkfd_device_probe(struct amdgpu_device *ade=
v)
         case CHIP_POLARIS10:
         case CHIP_POLARIS11:
         case CHIP_POLARIS12:
+       case CHIP_VEGAM:
                 kfd2kgd =3D amdgpu_amdkfd_gfx_8_0_get_functions();
                 break;
         case CHIP_VEGA10:
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809C2E7BFCAA3068E0B7A45F7ED0BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Russell, Kent &lt;Kent.Russel=
l@amd.com&gt;<br>
<b>Sent:</b> Tuesday, June 11, 2019 8:44 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Russell, Kent<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Add CHIP_VEGAM to amdgpu_amdkfd_device_=
probe</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">We have the rest of the support in the kerne, but =
we don't actually boot KFD<br>
on the device without this change<br>
<br>
Change-Id: Ifcc5c5e058d72e33a2f3f945f269ba6d2613b7b0<br>
Signed-off-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_amdkfd.c<br>
index 4af3989e4a75..b7582b9aa1cd 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c<br>
@@ -78,6 &#43;78,7 @@ void amdgpu_amdkfd_device_probe(struct amdgpu_device =
*adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_POLARIS10:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_POLARIS11:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_POLARIS12:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VEGAM:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kfd2kgd =3D amdgpu_amdkfd_gfx_8_0_get_functions();<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VEGA10:<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809C2E7BFCAA3068E0B7A45F7ED0BN6PR12MB1809namp_--

--===============0864053958==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0864053958==--

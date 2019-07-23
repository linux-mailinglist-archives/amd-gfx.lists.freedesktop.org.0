Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB7F71B41
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 17:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4F8C6E2DA;
	Tue, 23 Jul 2019 15:15:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770051.outbound.protection.outlook.com [40.107.77.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECD36E2D8
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 15:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Absz5bYq3pRKHGLJM5B5vzRmS4DbuAfdsVUJOrl01zHzXov2RIGLffSegW3puCwO1wNzWuwcKKLOTps6ILALJPWrWkF+6qRCjesJfajUIWcDDCJbeEPoQ8u9jq12/d+RYbfolXzexmICUVoej97E1OYQ9e301sS/Gt2vN6vDidsFEn8fj9qN4iLw9bzAdcIXB7DYBWss0RB6+BUYCTCf65FG4Y2lZOJEMGgoIVse9uE/ot5XBj6B8khc95i+AgJS92dqsAAOA6lTZUgRY14hItIZTNdnHWg5vYQ+WNbfjPgS6aAor5y1haDKwf4ffUH/Vinmbalb35KsC63TLj9qAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc8ZPfBgJKGeQX75Ehjt8x3f7wkjXlTj8uLHLzAydhw=;
 b=BTkT61v932/Yj/G6DQYNGKtNkGa+WR1gtC9yadVge3T8RJta55G/XjQL0ziziT4Z1tyV/IuDv2smfqZ8SiUfF8NCGPq51IksV+J9c9NesDZwT/ow5pgTpVJNdOxqw6lkSGU8Cbytws0NwAYhXgC9MfxVCpZd9zgTZABWEO9GnjYYppnodS+7NAiSuhjfb7h9i4Y3b2cn8+YfazI4VJD5ZbB2dG7pLDaYXkSMz1Zrc76rOEE7Wk5TkMLKLWSEddABG16cYfIIp1S8wFEwAbls5+1A6n4O2vwfj287XLrCMVS1qPtAQBYWJlagok93JWRhNmIZgNbqmSgO0RcRiiUHDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1651.namprd12.prod.outlook.com (10.172.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 15:15:42 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::b90e:dd82:7384:5b7b%11]) with mapi id 15.20.2094.013; Tue, 23 Jul
 2019 15:15:42 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Topic: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Index: AQHVQWICaYcQd0EK4E+7K31JCWSbdKbYUB9Q
Date: Tue, 23 Jul 2019 15:15:42 +0000
Message-ID: <BN6PR12MB1809AAB2C9A0E7629EF38014F7C70@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190723142156.4863-1-kent.russell@amd.com>
In-Reply-To: <20190723142156.4863-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.160.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7daadea3-8dd9-4d84-c61d-08d70f80a0b4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1651; 
x-ms-traffictypediagnostic: BN6PR12MB1651:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1651E4FEF0D1DD2FCBA0B414F7C70@BN6PR12MB1651.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:350;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(189003)(199004)(7736002)(52536014)(3846002)(5660300002)(66476007)(6116002)(66556008)(64756008)(66446008)(76116006)(966005)(66946007)(14444005)(256004)(8676002)(86362001)(76176011)(81166006)(66066001)(8936002)(26005)(74316002)(606006)(71200400001)(71190400001)(7696005)(99286004)(6246003)(236005)(53936002)(102836004)(25786009)(9686003)(55016002)(6306002)(476003)(68736007)(478600001)(6506007)(19627405001)(229853002)(105004)(53546011)(14454004)(2501003)(11346002)(2906002)(6436002)(54896002)(446003)(186003)(81156014)(486006)(33656002)(316002)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1651;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YPrqGhEvdkbV/iJ5MpEnKHYPfbRd3yoj5HToYalioc0iW3PUi2RkyarS6Dc3TyCQJZ5L9svsbRyBxeDhuWAyjQfYmjEGxuEiI2KZJGYoiTfahg1y9WSeOphkwMZV5/Ypr9WkzRLO4lckNNegWd/HiOH7YrjSYrB6MhsvRtgI/vzqk0OyPbVLVTuQUNqsGfKOUpJaIRi/KJKdQ3zA8Yn8L/XrFfEeCc7GyEkDPVeWOaT8aA8rA8MQdE+ZR2pkbKyZ7nnUn/rdTqzI2z7lv8PIjMAAEaCKa+BTbjtR01qhDd7BSoXmU0TWUMQoRr+hw/cpM2sl8QKkauc/cT7t+QscjbkYbThsPRanTbipCbJ7XvC4COeG0J5rxoz9LLfZiGt3CJEA6/I/gYvJ2JOS5ptggCNXoLz6oL3HVPfTqctub6M=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7daadea3-8dd9-4d84-c61d-08d70f80a0b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 15:15:42.1587 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1651
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zc8ZPfBgJKGeQX75Ehjt8x3f7wkjXlTj8uLHLzAydhw=;
 b=U9w7pjZwxATgx/u1nhpCGqts9bS1YvyxK8AZLZ7drU5N/Vf/ZVXmccc+QSK5Oe+roc5azZnkXEyH9VquYjGGtxKbr945cqLDc120oD/yF5y4zmUhiSLMfnqFHgbbMYBezqW2MAKB9p4NH0i8Cz7H/GypZm7yfef062E+GPy1IEo=
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
Content-Type: multipart/mixed; boundary="===============1420156102=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1420156102==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809AAB2C9A0E7629EF38014F7C70BN6PR12MB1809namp_"

--_000_BN6PR12MB1809AAB2C9A0E7629EF38014F7C70BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Tuesday, July 23, 2019 10:22 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Russell, Kent <Kent.Russell@amd.com>
Subject: [PATCH] drm/amdkfd: Fix byte align on VegaM

This was missed during the addition of VegaM support

Change-Id: I61c8fbbea77338126e3ebdfa74c286b665bdd670
Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index f5ecf28eb37c..3179117ac434 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1139,7 +1139,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
                         adev->asic_type !=3D CHIP_FIJI &&
                         adev->asic_type !=3D CHIP_POLARIS10 &&
                         adev->asic_type !=3D CHIP_POLARIS11 &&
-                       adev->asic_type !=3D CHIP_POLARIS12) ?
+                       adev->asic_type !=3D CHIP_POLARIS12 &&
+                       adev->asic_type !=3D CHIP_VEGAM) ?
                         VI_BO_SIZE_ALIGN : 1;

         mapping_flags =3D AMDGPU_VM_PAGE_READABLE;
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809AAB2C9A0E7629EF38014F7C70BN6PR12MB1809namp_
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
<b>Sent:</b> Tuesday, July 23, 2019 10:22 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Fix byte align on VegaM</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This was missed during the addition of VegaM suppo=
rt<br>
<br>
Change-Id: I61c8fbbea77338126e3ebdfa74c286b665bdd670<br>
Signed-off-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 &#43;&#43;-<br>
&nbsp;1 file changed, 2 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
index f5ecf28eb37c..3179117ac434 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
@@ -1139,7 &#43;1139,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;asic_type !=3D CHIP_FIJI &amp;&amp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;asic_type !=3D CHIP_POLARIS10 &amp;&amp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;asic_type !=3D CHIP_POLARIS11 &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;asic_ty=
pe !=3D CHIP_POLARIS12) ?<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;asi=
c_type !=3D CHIP_POLARIS12 &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;asi=
c_type !=3D CHIP_VEGAM) ?<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VI_BO=
_SIZE_ALIGN : 1;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mapping_flags =3D AMDGPU_V=
M_PAGE_READABLE;<br>
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

--_000_BN6PR12MB1809AAB2C9A0E7629EF38014F7C70BN6PR12MB1809namp_--

--===============1420156102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1420156102==--

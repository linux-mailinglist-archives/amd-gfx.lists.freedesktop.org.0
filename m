Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FC921BA5
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 18:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D19F8987C;
	Fri, 17 May 2019 16:34:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730053.outbound.protection.outlook.com [40.107.73.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF54D8987C
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 16:34:04 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2702.namprd12.prod.outlook.com (52.135.103.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 16:34:03 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 16:34:03 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Abramov, 
 Slava" <Slava.Abramov@amd.com>
Subject: Re: [PATCH] drm/amdgpu: cast to unsigned int for 32-bit portability
Thread-Topic: [PATCH] drm/amdgpu: cast to unsigned int for 32-bit portability
Thread-Index: AQHVDCz2R8rLbwu8F0iCTl4o6PQmvaZvhFKF
Date: Fri, 17 May 2019 16:34:03 +0000
Message-ID: <SN6PR12MB2800C2C55C028B30F948325B870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
References: <BN6PR12MB14097E1091DBF08BEFCB547BFE0A0@BN6PR12MB1409.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB14097E1091DBF08BEFCB547BFE0A0@BN6PR12MB1409.namprd12.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [40.67.186.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d21b781-8bbc-4972-bc05-08d6dae578f7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2702; 
x-ms-traffictypediagnostic: SN6PR12MB2702:
x-microsoft-antispam-prvs: <SN6PR12MB2702A6160AFCB20ACAECB979870B0@SN6PR12MB2702.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(346002)(39860400002)(376002)(199004)(189003)(9686003)(102836004)(19627405001)(6246003)(99286004)(8936002)(486006)(6636002)(71190400001)(74316002)(71200400001)(229853002)(2906002)(33656002)(4326008)(53936002)(11346002)(81166006)(76176011)(6436002)(81156014)(7736002)(446003)(2501003)(316002)(54896002)(7696005)(53546011)(8676002)(55016002)(6506007)(476003)(14444005)(256004)(25786009)(110136005)(3846002)(86362001)(478600001)(14454004)(6116002)(26005)(72206003)(91956017)(66946007)(73956011)(5660300002)(66446008)(76116006)(66476007)(64756008)(66556008)(186003)(66066001)(68736007)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2702;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ej+4nk3jNlH4jbP787fNoMURRV/ymzcg6OwDf/9s4a9grvFVJ6ylenrOFcwUWaiEWnLeJmMVmnHTxybMtj7YFPxqEtGTpaUMyScBjUJyyYTingOjvPO6ebXJYwb+IS0UCGAzdNX7Ep31haLzYS8RSOxG4m2PF0aPyxKtVWfoRpYobjJXu+Dc9E74YUu8r9WODdaILT2tBiUfyu7RwH+hirks4lOFqMbSsGKHy6T0au7P5EcSKdoBNtHLle/khZ/VoQ9BUYZX5C2dQwK7/rhvPV0qH1uuxWKjmDr93ZldwpQryk1cZ+nBLNwFxfTaHq70nQbVzdwyVtuCDr19suxavHpRkrUgu2OMy9rBpkxhespmzp+u6RmMocxNK6r/pXjKCXI446+30uSXfl2BO6QcccIfEmRs79bnHCZHny0Zxfc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d21b781-8bbc-4972-bc05-08d6dae578f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 16:34:03.0581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2702
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VpES4RIxCQ9SX9uxM8URBMgbUlZWS73ymzS6rNa590=;
 b=WsrbMSDI1XHDgc+6ncLBHjHrtbzVfxmQ9yundE7mJGlBauN/p7HV5+9m9iJsSgZDi9PXJcVzyN2dTMtANMCKky02T7WCijX3JsgEYgo3bC03sT+VyjEH6AHjjyehF1wIA0rYqcptIdKHjLHaiSyutu9VGChP4hVwiRLBxT+Ahb0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============0292506670=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0292506670==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR12MB2800C2C55C028B30F948325B870B0SN6PR12MB2800namp_"

--_000_SN6PR12MB2800C2C55C028B30F948325B870B0SN6PR12MB2800namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

better to use div64_ul(x, y) for compatiblity.
________________________________
From: Abramov, Slava
Sent: Friday, May 17, 2019 5:19:54 AM
To: amd-gfx@lists.freedesktop.org
Cc: Pan, Xinhui; Deucher, Alexander
Subject: [PATCH] drm/amdgpu: cast to unsigned int for 32-bit portability


Without casting, 64-bit division is used implicitly causing DEPMOD
failure when building 32-bit kernel.

Signed-off-by: Slava Abramov <slava.abramov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index da1dc40b9b14..0499620ec972 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -764,8 +764,9 @@ static ssize_t amdgpu_ras_sysfs_badpages_read(struct fi=
le *f,
  struct amdgpu_device *adev =3D con->adev;
  const unsigned int element_size =3D
  sizeof("0xabcdabcd : 0x12345678 : R\n") - 1;
- unsigned int start =3D (ppos + element_size - 1) / element_size;
- unsigned int end =3D (ppos + count - 1) / element_size;
+ unsigned int start =3D
+ (unsigned int) (ppos + element_size - 1) / element_size;
+ unsigned int end =3D (unsigned int) (ppos + count - 1) / element_size;
  ssize_t s =3D 0;
  struct ras_badpage *bps =3D NULL;
  unsigned int bps_count =3D 0;
--
2.17.1



--_000_SN6PR12MB2800C2C55C028B30F948325B870B0SN6PR12MB2800namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta content=3D"text/html; charset=3Diso-8859-1">
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
</head>
<body dir=3D"ltr">
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
better to use div64_ul(x, y) for compatiblity.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Abramov, Slava<br>
<b>Sent:</b> Friday, May 17, 2019 5:19:54 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Pan, Xinhui; Deucher, Alexander<br>
<b>Subject:</b> [PATCH] drm/amdgpu: cast to unsigned int for 32-bit portabi=
lity</font>
<div>&nbsp;</div>
</div>
<div>
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; color=
:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0; margin-bottom:0"></p>
<div>Without casting, 64-bit division is used implicitly causing DEPMOD</di=
v>
<div>failure when building 32-bit kernel.</div>
<div><br>
</div>
<div>Signed-off-by: Slava Abramov &lt;slava.abramov@amd.com&gt;</div>
<div>---</div>
<div>&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 5 &#43;&#43;&#43;--</d=
iv>
<div>&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ras.c</div>
<div>index da1dc40b9b14..0499620ec972 100644</div>
<div>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c</div>
<div>&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c</div>
<div>@@ -764,8 &#43;764,9 @@ static ssize_t amdgpu_ras_sysfs_badpages_read(=
struct file *f,</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>struct amdgpu_device *ad=
ev =3D con-&gt;adev;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>const unsigned int eleme=
nt_size =3D</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>sizeof(&quot;0xabcdabcd =
: 0x12345678 : R\n&quot;) - 1;</div>
<div>-<span style=3D"white-space:pre"> </span>unsigned int start =3D (ppos =
&#43; element_size - 1) / element_size;</div>
<div>-<span style=3D"white-space:pre"> </span>unsigned int end =3D (ppos &#=
43; count - 1) / element_size;</div>
<div>&#43;<span style=3D"white-space:pre"> </span>unsigned int start =3D</d=
iv>
<div>&#43;<span style=3D"white-space:pre"> </span>(unsigned int) (ppos &#43=
; element_size - 1) / element_size;</div>
<div>&#43;<span style=3D"white-space:pre"> </span>unsigned int end =3D (uns=
igned int) (ppos &#43; count - 1) / element_size;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>ssize_t s =3D 0;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>struct ras_badpage *bps =
=3D NULL;</div>
<div>&nbsp;<span style=3D"white-space:pre"> </span>unsigned int bps_count =
=3D 0;</div>
<div>--&nbsp;</div>
<div>2.17.1</div>
<div><br>
</div>
<br>
<p></p>
</div>
</div>
</body>
</html>

--_000_SN6PR12MB2800C2C55C028B30F948325B870B0SN6PR12MB2800namp_--

--===============0292506670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0292506670==--

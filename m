Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602D120FF2
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 23:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD24E897D0;
	Thu, 16 May 2019 21:19:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780047.outbound.protection.outlook.com [40.107.78.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D9989780
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 21:19:55 +0000 (UTC)
Received: from BN6PR12MB1409.namprd12.prod.outlook.com (10.168.228.21) by
 BN6PR12MB1251.namprd12.prod.outlook.com (10.168.226.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 16 May 2019 21:19:54 +0000
Received: from BN6PR12MB1409.namprd12.prod.outlook.com
 ([fe80::f8a6:2fe1:735e:694a]) by BN6PR12MB1409.namprd12.prod.outlook.com
 ([fe80::f8a6:2fe1:735e:694a%3]) with mapi id 15.20.1878.022; Thu, 16 May 2019
 21:19:54 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: cast to unsigned int for 32-bit portability
Thread-Topic: [PATCH] drm/amdgpu: cast to unsigned int for 32-bit portability
Thread-Index: AQHVDCz2R8rLbwu8F0iCTl4o6PQmvQ==
Date: Thu, 16 May 2019 21:19:54 +0000
Message-ID: <BN6PR12MB14097E1091DBF08BEFCB547BFE0A0@BN6PR12MB1409.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34c8aa23-a9f4-447b-0dac-08d6da443d67
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1251; 
x-ms-traffictypediagnostic: BN6PR12MB1251:
x-microsoft-antispam-prvs: <BN6PR12MB12513AB899698137BE69B22CFE0A0@BN6PR12MB1251.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:296;
x-forefront-prvs: 0039C6E5C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(366004)(136003)(376002)(189003)(199004)(476003)(14444005)(2906002)(256004)(3846002)(486006)(74316002)(71190400001)(66066001)(66946007)(71200400001)(86362001)(76116006)(5660300002)(66476007)(66446008)(6116002)(73956011)(2501003)(66556008)(64756008)(4326008)(53936002)(6916009)(6436002)(6506007)(33656002)(68736007)(53336002)(26005)(81156014)(8936002)(72206003)(9686003)(102836004)(5640700003)(7736002)(55016002)(316002)(478600001)(54906003)(186003)(54896002)(19627405001)(7696005)(52536014)(8676002)(81166006)(14454004)(6606003)(25786009)(2351001)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1251;
 H:BN6PR12MB1409.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UkJPHLgYSNaQg/F/6tXoCLyrzegZs0J3LscrIQhepYhxGxl3uPiGe0H/GTLRbk3co1uAXXk0pJO60WqzVNoxDI0pCUg5RfZvv96BpPaSGZhL4wUYlAQzfvgMqvusNYUnvw6YTMjnIRK13s+A8yfxOoHTQ2ERXF4x2oJhERKUHkWZKLNyCyFu9W/3m/WYMosFYwlvsXCN4dqJTdBecD66KTUfVzysTHePREbpXR9DBsy3jZJmc8Muqa4LUJ2qbH2URHH0f972MUJe3IQORbXh86jqFbogfS+pymxFEllxH/aWsc8R+mW7S6ypi+QDOlyUdpTa2rW+hD3vO9Td8NGqI5mmf2g1zAC3AMqB3CgIUA29Y8yxE4ZC6XZ4dYgC4Dhymd+kWXTYJfqCYVuTbNBCYWP/WF9mOAPEbwYQCjjz5Pc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c8aa23-a9f4-447b-0dac-08d6da443d67
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2019 21:19:54.0677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1251
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJBi0mrg0TbWMt55BXPSLwTB/E14dyzsCSV3n8VJdvY=;
 b=fZxgb/9nPUlETV0G6JWVouAIL0Z38ElrCOK68SuELw5llYhg3hgNGrEXhpAQlu/tJabnMCEL4VaYZkujyrhgOZQmrv5GJ5TuhBSN+8WIE2fuUoFNKpu9sb71raBGHlAzN9dGRN77OrNthTcKJF9Vc5O36nv//xeP/6Gp7btzUSg=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Slava.Abramov@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>
Content-Type: multipart/mixed; boundary="===============0968547537=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0968547537==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB14097E1091DBF08BEFCB547BFE0A0BN6PR12MB1409namp_"

--_000_BN6PR12MB14097E1091DBF08BEFCB547BFE0A0BN6PR12MB1409namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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



--_000_BN6PR12MB14097E1091DBF08BEFCB547BFE0A0BN6PR12MB1409namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"></p>
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
</body>
</html>

--_000_BN6PR12MB14097E1091DBF08BEFCB547BFE0A0BN6PR12MB1409namp_--

--===============0968547537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0968547537==--

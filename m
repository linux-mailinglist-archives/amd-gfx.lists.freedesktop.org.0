Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2421D5A
	for <lists+amd-gfx@lfdr.de>; Fri, 17 May 2019 20:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5DC89971;
	Fri, 17 May 2019 18:34:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700076.outbound.protection.outlook.com [40.107.70.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8FF89971
 for <amd-gfx@lists.freedesktop.org>; Fri, 17 May 2019 18:34:49 +0000 (UTC)
Received: from DM5PR12MB1417.namprd12.prod.outlook.com (10.168.236.147) by
 DM5PR12MB1722.namprd12.prod.outlook.com (10.175.85.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Fri, 17 May 2019 18:34:48 +0000
Received: from DM5PR12MB1417.namprd12.prod.outlook.com
 ([fe80::d12:b7e:d1a7:bb2f]) by DM5PR12MB1417.namprd12.prod.outlook.com
 ([fe80::d12:b7e:d1a7:bb2f%3]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 18:34:48 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amdgpu: use div64_ul for 32-bit compatibility v1
Thread-Topic: [PATCH] drm/amdgpu: use div64_ul for 32-bit compatibility v1
Thread-Index: AQHVDN8jd2kfrA1vo0OLqUa0KgYWLQ==
Date: Fri, 17 May 2019 18:34:48 +0000
Message-ID: <DM5PR12MB14176FD13FDBCDBB309D0301FE0B0@DM5PR12MB1417.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fef98bed-bd3d-4b4a-d148-08d6daf6575d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1722; 
x-ms-traffictypediagnostic: DM5PR12MB1722:
x-microsoft-antispam-prvs: <DM5PR12MB1722A1819D6F73643B0B79EDFE0B0@DM5PR12MB1722.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:361;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(7696005)(316002)(99286004)(54896002)(9686003)(55016002)(2501003)(6116002)(53936002)(72206003)(478600001)(5640700003)(14454004)(3846002)(52536014)(4326008)(7736002)(71190400001)(71200400001)(53336002)(5660300002)(256004)(186003)(25786009)(86362001)(6506007)(26005)(102836004)(74316002)(68736007)(486006)(476003)(2351001)(66066001)(81166006)(2906002)(6436002)(33656002)(8676002)(81156014)(19627405001)(66946007)(6606003)(76116006)(66446008)(64756008)(66556008)(66476007)(73956011)(6916009)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1722;
 H:DM5PR12MB1417.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yUV8mXAGLysy/hMmOBtw1q5sCzo2sl0Y7lNGbTVHOrWeo4MxIkWiPOgdVxwNWzYwyGjxU6ryJd3NUir139oa0oK9MtifoL9gun68DEPfHZitF8Hg3Ckxb8DSLbIMQqA4tW1a3IVOtpRgIpaCFe1yGoosdGWWS9FhPcecKAwwq09c6D5ZGzPRJvW3OrEp480XbpLcuK7+6i93drfq6D+BnyboQtqxSg4/KvzzDRvfNU1/Zc7O4wDHLBqGUohoihcCY4lIWnbcG8RW1a4Sf26xRtP+hQMnKV5+JcV5B2cGGXiC27kDJRrL0AaOxJiDK7T/w4FxpkTcNa9BWDf+9iFYRfGz7T6tC/mQjYerrZgqb4eneI4ttyih4+dvo4ZoqaP8b1Vie7atG2ugPq/9f9OBvaXsjkH3dusjZkubHy/6BnI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fef98bed-bd3d-4b4a-d148-08d6daf6575d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 18:34:48.0688 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1722
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7NH8IVMEvCJGrsj+3npkujPZE1jX8vFP59TtTPtnsQ=;
 b=njHvQMWRquMoi1VO6OcebhjyTqq2HSPLeO71jJXk5wDRAi4TZWI2M/dcrS/lC5Mv9XaRC2vE1Ocr5Ujgq2n2QsyftHJTQL48C2Vfhco+o+3quE4q6aflS9KlguiNldcGQtJeQgFcX0t27p1vG2bNwjs5VbGQkYYpiQou8Yb2cKA=
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Content-Type: multipart/mixed; boundary="===============1301912963=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1301912963==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB14176FD13FDBCDBB309D0301FE0B0DM5PR12MB1417namp_"

--_000_DM5PR12MB14176FD13FDBCDBB309D0301FE0B0DM5PR12MB1417namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

v1: replace casting to unsigned long with div64_ul

Change-Id: Ia48671ed0756bb73c7b4760a800bcb6f600cbef2
Signed-off-by: Slava Abramov <slava.abramov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.c
index da1dc40b9b14..d5719b0fb82c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -764,8 +764,8 @@ static ssize_t amdgpu_ras_sysfs_badpages_read(struct fi=
le *f,
  struct amdgpu_device *adev =3D con->adev;
  const unsigned int element_size =3D
  sizeof("0xabcdabcd : 0x12345678 : R\n") - 1;
- unsigned int start =3D (ppos + element_size - 1) / element_size;
- unsigned int end =3D (ppos + count - 1) / element_size;
+ unsigned int start =3D div64_ul(ppos + element_size - 1, element_size);
+ unsigned int end =3D div64_ul(ppos + count - 1, element_size);
  ssize_t s =3D 0;
  struct ras_badpage *bps =3D NULL;
  unsigned int bps_count =3D 0;
--
2.17.1



--_000_DM5PR12MB14176FD13FDBCDBB309D0301FE0B0DM5PR12MB1417namp_
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
<div>v1: replace casting to unsigned long with div64_ul</div>
<div><br>
</div>
<div>Change-Id: Ia48671ed0756bb73c7b4760a800bcb6f600cbef2</div>
<div>Signed-off-by: Slava Abramov &lt;slava.abramov@amd.com&gt;</div>
<div>---</div>
<div>&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 4 &#43;&#43;--</div>
<div>&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)</div>
<div><br>
</div>
<div>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ras.c</div>
<div>index da1dc40b9b14..d5719b0fb82c 100644</div>
<div>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c</div>
<div>&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c</div>
<div>@@ -764,8 &#43;764,8 @@ static ssize_t amdgpu_ras_sysfs_badpages_read(=
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
<div>&#43;<span style=3D"white-space:pre"> </span>unsigned int start =3D di=
v64_ul(ppos &#43; element_size - 1, element_size);</div>
<div>&#43;<span style=3D"white-space:pre"> </span>unsigned int end =3D div6=
4_ul(ppos &#43; count - 1, element_size);</div>
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

--_000_DM5PR12MB14176FD13FDBCDBB309D0301FE0B0DM5PR12MB1417namp_--

--===============1301912963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1301912963==--

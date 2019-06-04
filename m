Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DFE34BC9
	for <lists+amd-gfx@lfdr.de>; Tue,  4 Jun 2019 17:16:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67ED2891AF;
	Tue,  4 Jun 2019 15:16:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770054.outbound.protection.outlook.com [40.107.77.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A5B891AF
 for <amd-gfx@lists.freedesktop.org>; Tue,  4 Jun 2019 15:16:18 +0000 (UTC)
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (20.178.243.144) by
 MN2PR12MB3119.namprd12.prod.outlook.com (20.178.242.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Tue, 4 Jun 2019 15:16:16 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::74ad:250e:919e:f690]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::74ad:250e:919e:f690%5]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 15:16:16 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIXSBkcm0vYW1kZ3B1OiBubyBuZWVkIGZiY29uIHVuZGVy?=
 =?gb2312?Q?_sriov?=
Thread-Topic: [PATCH] drm/amdgpu: no need fbcon under sriov
Thread-Index: AQHVGtt8D/5fPDqryUKRmD7vex3rFaaLhTeAgAAVJJs=
Date: Tue, 4 Jun 2019 15:16:16 +0000
Message-ID: <MN2PR12MB3039F0DD22910F40A6674546E5150@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <1559655785-30379-1-git-send-email-yttao@amd.com>,
 <1686be7b-ca1c-e43c-3906-e6131e8d25e1@gmail.com>
In-Reply-To: <1686be7b-ca1c-e43c-3906-e6131e8d25e1@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69935c3b-f73d-4206-e972-08d6e8ff9706
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3119; 
x-ms-traffictypediagnostic: MN2PR12MB3119:
x-microsoft-antispam-prvs: <MN2PR12MB3119F02B256872D5641782E9E5150@MN2PR12MB3119.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(346002)(376002)(396003)(199004)(189003)(26005)(71200400001)(33656002)(102836004)(186003)(54896002)(476003)(316002)(81156014)(81166006)(68736007)(8936002)(486006)(74316002)(11346002)(14444005)(446003)(6436002)(256004)(6116002)(2501003)(3846002)(224303003)(99286004)(66066001)(76116006)(76176011)(2906002)(9686003)(55016002)(14454004)(6636002)(52536014)(53936002)(110136005)(7696005)(5660300002)(86362001)(66946007)(71190400001)(66556008)(66476007)(72206003)(66446008)(6606003)(64756008)(73956011)(478600001)(66574012)(91956017)(7736002)(6506007)(19627405001)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3119;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +/bVRnCYn7VKOVEzr42sPBrpozRmhgiZMzUwfNcBucwgTkx5OF2Q8IReeQSn4LJp1P/uWkURFZAVN0SYbP50n7OLo9E/NwWMscV0R6XbW3vWopdf6lhwYLgKxImxRiGvDhuEShu+e8WFrHOEkga8Uhg2bf1zUcpJzVrcgB2qZ6yxQ5jyI5mXDF+0cyzzkfOXFxS6fGdAQ2wNbGXw0U82PPdiZBrHB2tnbZidHJDIsz/f9VKr/TT0TzWmbWiyFaLYBOe8tTcIcTW74E7fRI72FNrMQQxXnrZPAbAeIFLcb41/RToZZLzGgU0ZAK4awy9dpu/XS5jRkJNBt/F6sLo61HluHDDzeF6//iDdXziNo5Gquhd/ZdyUKxyn7BTjqqs+ximcvPZReUPHDJAKeTyWXHBBRNQ0w3ML/Iva2xLcGZg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69935c3b-f73d-4206-e972-08d6e8ff9706
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 15:16:16.6361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yttao@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3119
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/JYyS26VXwgkYvBFcYz3Ha+PZUHbXHYyYsR3AVCgkk=;
 b=zB8hIog+hipH/izubn6f+qsrDqtcCiKe4SjcKYw9V/zU6l6M/HaoD91JIZHJQzi2dlf+KDc8s/ywfBEyL0it82j9UQ+GnncNxQaDg9KWFmznop8Fk6WQkwWTz1fTSRWhkcaWt6IRQzUDG1YRPXmkQPPgjUgtolths+Be1ewh+CU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1218694329=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1218694329==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3039F0DD22910F40A6674546E5150MN2PR12MB3039namp_"

--_000_MN2PR12MB3039F0DD22910F40A6674546E5150MN2PR12MB3039namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgIENocmlzdGlhbg0KDQoNCkJ1dCB3aGVuIGFtZGdwdSBkcml2ZXIgaXMgdW5sb2FkaW5nLCBp
dCB3aWxsIGNhbGwgdGhpcyBmdW5jdGlvbi4NCg0KDQpBbmQgZHJpdmVyIHVubG9hZGluZyBpcyBh
biBsZWdhbCBjYXNlIHVuZGVyIFNSLUlPVi4NCg0KDQpEbyB5b3UgbWVhbiBQQ0llIGRldmljZSBy
ZW1vdmFsIGluZGljYXRlcyB0aGUgdW5wbHVnIHRoZSByZWFsIGRldmljZT8NCg0KDQpCZXN0IFJl
Z2FyZHMNCg0KWWl0bmlhbiBUYW8NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
CreivP7IyzogQ2hyaXN0aWFuIEs/bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNv
bT4NCreiy83KsbzkOiAyMDE5xOo21MI0yNUgMjE6NTc6MzcNCsrVvP7IyzogVGFvLCBZaW50aWFu
OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K1vfM4jogUmU6IFtQQVRDSF0gZHJtL2Ft
ZGdwdTogbm8gbmVlZCBmYmNvbiB1bmRlciBzcmlvdg0KDQpBbSAwNC4wNi4xOSB1bSAxNTo0MyBz
Y2hyaWViIFlpbnRpYW4gVGFvOg0KPiBVbmRlciBTcmlvdiwgdGhlcmUgaXMgbm8gbmVlZCBvZiB0
aGUgc3VwcG9ydCBmb3IgZmJjb24uDQoNCk5BSywgdGhhdCBlcnJvciBtZXNzYWdlIGlzIG5vdCBy
ZWxhdGVkIHRvIGZiY29uIGJ1dCBtZWFucyB0aGF0IFBDSWUNCmRldmljZSByZW1vdmFsIGlzIG5v
dCBzdXBwb3J0ZWQuDQoNCkNocmlzdGlhbi4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZaW50aWFu
IFRhbyA8eXR0YW9AYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jIHwgMyArKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
ZHJ2LmMNCj4gaW5kZXggMWYzOGQ2Zi4uMjhkMDk1YiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiBAQCAtMTAxMiw3ICsxMDEyLDggQEAgYW1kZ3B1X3Bj
aV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICAgew0KPiAgICAgICAgc3RydWN0IGRy
bV9kZXZpY2UgKmRldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4NCj4gLSAgICAgRFJNX0VS
Uk9SKCJEZXZpY2UgcmVtb3ZhbCBpcyBjdXJyZW50bHkgbm90IHN1cHBvcnRlZCBvdXRzaWRlIG9m
IGZiY29uXG4iKTsNCj4gKyAgICAgaWYgKCFhbWRncHVfc3Jpb3ZfdmYoYWRldikpDQo+ICsgICAg
ICAgICAgICAgRFJNX0VSUk9SKCJEZXZpY2UgcmVtb3ZhbCBpcyBjdXJyZW50bHkgbm90IHN1cHBv
cnRlZCBvdXRzaWRlIG9mIGZiY29uXG4iKTsNCj4gICAgICAgIGRybV9kZXZfdW5wbHVnKGRldik7
DQo+ICAgICAgICBkcm1fZGV2X3B1dChkZXYpOw0KPiAgICAgICAgcGNpX2Rpc2FibGVfZGV2aWNl
KHBkZXYpOw0KDQo=

--_000_MN2PR12MB3039F0DD22910F40A6674546E5150MN2PR12MB3039namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Hi&nbsp; Christian</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">But when amdgpu driver is unloadi=
ng, it will call this function.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">And driver unloading is an legal =
case under SR-IOV.</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Do you mean PCIe device removal i=
ndicates the unplug the real device?</p>
<p style=3D"margin-top:0;margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0;margin-bottom:0">Best Regards</p>
<p style=3D"margin-top:0;margin-bottom:0">Yitnian Tao</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>=B7=A2=BC=FE=C8=CB:</b> Christi=
an K&ouml;nig &lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>=B7=A2=CB=CD=CA=B1=BC=E4:</b> 2019=C4=EA6=D4=C24=C8=D5 21:57:37<br>
<b>=CA=D5=BC=FE=C8=CB:</b> Tao, Yintian; amd-gfx@lists.freedesktop.org<br>
<b>=D6=F7=CC=E2:</b> Re: [PATCH] drm/amdgpu: no need fbcon under sriov</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 04.06.19 um 15:43 schrieb Yintian Tao:<br>
&gt; Under Sriov, there is no need of the support for fbcon.<br>
<br>
NAK, that error message is not related to fbcon but means that PCIe <br>
device removal is not supported.<br>
<br>
Christian.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Yintian Tao &lt;yttao@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 &#43;&#43;-<br=
>
&gt;&nbsp;&nbsp; 1 file changed, 2 insertions(&#43;), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_drv.c<br>
&gt; index 1f38d6f..28d095b 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; @@ -1012,7 &#43;1012,8 @@ amdgpu_pci_remove(struct pci_dev *pdev)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D p=
ci_get_drvdata(pdev);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is currently =
not supported outside of fbcon\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DRM_ERROR(&quot;Device removal is currently not supported outside o=
f fbcon\n&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_put(dev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<br=
>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3039F0DD22910F40A6674546E5150MN2PR12MB3039namp_--

--===============1218694329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1218694329==--

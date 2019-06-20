Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D7B4D06A
	for <lists+amd-gfx@lfdr.de>; Thu, 20 Jun 2019 16:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDFB6E595;
	Thu, 20 Jun 2019 14:30:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790072.outbound.protection.outlook.com [40.107.79.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125256E595
 for <amd-gfx@lists.freedesktop.org>; Thu, 20 Jun 2019 14:30:44 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1523.namprd12.prod.outlook.com (10.172.24.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Thu, 20 Jun 2019 14:30:42 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::11ea:d6bc:d2fa:e6d%9]) with mapi id 15.20.1987.014; Thu, 20 Jun 2019
 14:30:42 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: CCXIAOP <664296544@qq.com>, amd-gfx <amd-gfx@lists.freedesktop.org>
Subject: Re: amdgpu vce crash
Thread-Topic: amdgpu vce crash
Thread-Index: AQHVJzjzVNKkpx046ESHs/KYuJFk1aakmh6i
Date: Thu, 20 Jun 2019 14:30:42 +0000
Message-ID: <BN6PR12MB18093551FEFE5590951747C8F7E40@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <tencent_969412320833AB29CB6FA2732FC516257905@qq.com>
In-Reply-To: <tencent_969412320833AB29CB6FA2732FC516257905@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.5.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abb08eea-40d3-45cb-4aa9-08d6f58bdff7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1523; 
x-ms-traffictypediagnostic: BN6PR12MB1523:
x-microsoft-antispam-prvs: <BN6PR12MB152372BEB4AC901B2FD740E3F7E40@BN6PR12MB1523.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0074BBE012
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(376002)(346002)(39860400002)(189003)(199004)(76176011)(25786009)(8676002)(7116003)(81156014)(6116002)(8936002)(11346002)(19627405001)(102836004)(86362001)(81166006)(6246003)(7696005)(6506007)(2906002)(53936002)(53546011)(52536014)(14444005)(256004)(99286004)(229853002)(3846002)(316002)(105004)(7736002)(186003)(478600001)(71200400001)(110136005)(54896002)(33656002)(6436002)(71190400001)(55016002)(74316002)(26005)(446003)(72206003)(73956011)(66946007)(5660300002)(66476007)(66556008)(64756008)(68736007)(66066001)(486006)(3480700005)(76116006)(66446008)(476003)(9686003)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1523;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 61IJt6LeybXVQybWmEjeJWiDGiQZRv0roA8oZwCy/8xJkVZ+nyZpQWVcBZR39yVi65qMVwqJR16sSNx9o08IFvhTeLWvyx3EhAK0CLuVsO462V2EvwB/ne6B7yd1reXH4/pgBAiFyAeQjtVq7wCqJ1pi5RTfuVzyLlhg/BKDWwQpZmUK/PEt93TbIuEfOOcDddCZZWX1iFI2pNOKMk3/MqpOtlOWz4RD240xh/6Hhq2YyWBX6qlQB1csr53JrfzrVz0r6pjPCyacaYdU3Eew8YVIxu7rhxgVPjPzk7yF6wdWTX0rQnWMZCGQ7G4JpyPh+l75MmTqrWvfmJVjuzA1YGFdhEZkZlJrn5QVmkXgri4Thp7vuW63fDnPlcTSFcA+9DKT2KpU6ngVto/zwQqC/C1DLtVcT1V0Lokd+BazxCE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb08eea-40d3-45cb-4aa9-08d6f58bdff7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2019 14:30:42.5117 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1523
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KogKn6LmR+IUJN3HD60nAUaPBlxgu7K0iTfsfsY+Puc=;
 b=iX9OJadM4+rB+sX23gL5PubYh7xXA3X9OOg5vn1/VnV8E7sNJNOkQaOrbBK+eVIlww8CZrVBG4fCtUzcM0U2yilVt7GTohETYdqatTHNtyqBcrM+gpBif6ApUqCSFYVUg20wOznnRAlXuUT9kX3GZyJWHQTYNS5h1K4msCp3jhw=
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
Content-Type: multipart/mixed; boundary="===============1771031347=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1771031347==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18093551FEFE5590951747C8F7E40BN6PR12MB1809namp_"

--_000_BN6PR12MB18093551FEFE5590951747C8F7E40BN6PR12MB1809namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

If any of the engines hang, you can end up with a deadlock if you schedule =
dependencies across rings since one of the engines is hung.  If you try a n=
ewer kernel, GPU reset is enabled and you should be able to recover after a=
 hang.  At that point, you can either restart your applications or use a re=
levant robustness API to properly handle a reset.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of CCXIAOP =
<664296544@qq.com>
Sent: Wednesday, June 19, 2019 5:28 AM
To: amd-gfx
Subject: amdgpu vce crash

We are using wx5100 for rendering and encoding operations, but sometimes we=
 encounter vce timeout and crash.
Is vce not a independent module in gpu?Why does it affect the rendering mod=
ule?
We hope that vce will not affect the rendering module when crashing.
Can I prevent the use of the rendering module from being affected?

linux kernel :4.19.34
mesa: 18.3.5
llvm: 7.0
firmware:18.50


As logs=1B$B!'=1B(B

2019-06-15T15:33:32.133842+08:00|err|kernel[-]|[315248.172603] [drm:amdgpu_=
job_timedout [amdgpu]] *ERROR* ring vce0 timeout, signaled seq=3D1173730, e=
mitted seq=3D1173732
2019-06-15T15:33:32.133939+08:00|info|kernel[-]|[315248.172607] [drm] GPU r=
ecovery disabled.


--_000_BN6PR12MB18093551FEFE5590951747C8F7E40BN6PR12MB1809namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
If any of the engines hang, you can end up with a deadlock if you schedule =
dependencies across rings since one of the engines is hung.&nbsp; If you tr=
y a newer kernel, GPU reset is enabled and you should be able to recover af=
ter a hang.&nbsp; At that point, you can either
 restart your applications or use a relevant robustness API to properly han=
dle a reset.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of CCXIAOP &lt;664296544@qq.com&=
gt;<br>
<b>Sent:</b> Wednesday, June 19, 2019 5:28 AM<br>
<b>To:</b> amd-gfx<br>
<b>Subject:</b> amdgpu vce crash</font>
<div>&nbsp;</div>
</div>
<div>
<div>We are using wx5100 for rendering and encoding operations, but sometim=
es we encounter vce timeout and crash.</div>
<div>Is vce not a independent module in gpu?Why does it affect the renderin=
g module?<br>
</div>
We hope that vce will not affect the rendering module when crashing.<br>
<div>Can I prevent the use of the rendering module from being affected?</di=
v>
<div><br>
</div>
<div>linux kernel :4.19.34</div>
<div>mesa: 18.3.5</div>
<div>llvm: 7.0</div>
<div>firmware:18.50<br>
</div>
<div><br>
</div>
<br>
As logs=1B$B!'=1B(B<br>
<br>
2019-06-15T15:33:32.133842&#43;08:00|err|kernel[-]|[315248.172603] [drm:amd=
gpu_job_timedout [amdgpu]] *ERROR* ring vce0 timeout, signaled seq=3D117373=
0, emitted seq=3D1173732<br>
2019-06-15T15:33:32.133939&#43;08:00|info|kernel[-]|[315248.172607] [drm] G=
PU recovery disabled.<br>
<br>
</div>
</body>
</html>

--_000_BN6PR12MB18093551FEFE5590951747C8F7E40BN6PR12MB1809namp_--

--===============1771031347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1771031347==--

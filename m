Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE9AF425
	for <lists+amd-gfx@lfdr.de>; Wed, 11 Sep 2019 04:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716866E0AA;
	Wed, 11 Sep 2019 02:09:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720071.outbound.protection.outlook.com [40.107.72.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3621A6E0AA
 for <amd-gfx@lists.freedesktop.org>; Wed, 11 Sep 2019 02:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3++ZhHpCID+Hgu+efdacJFdNuvxNOysqcaO6uGsN8UmealkRokUyBSnRwfohFZzQdwKhPRIJHcZmG1P5wXo03psR0q25w0yqpqo5pZMWKGNkRM+vX2ZUNl4IJWrdMI0GOyKWU1pBcNYnaa/lztaTRPtLxXzqlu27Emng/7wKwVjuzZ17fBAn/6LA3qMoVCCERe1XteXVop9TipZzRlFbiBYfiBala1xitYGRtDbEfRPj+6cDvCIYQW7Uy3oG97J2KnmtFzcYK5KoXNC0oxkeXZ+5SwJto7p+J7kgEG4xfF7M6Q90a15ePT9T2MZBDmK161Qg/WskjYZ3xg3sPh7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYJSNMpulEKuLee6wnMGTRnotNwPEwiF1iVZBRRVJFI=;
 b=QukbNzvJCUyl9q8gcyY5MXJS/fKt8eHR+P5IlyPCgAKM7SzVFZeZYyJ8JLZ68anud46rLLjKNoC3YToB7O/FSnfU9OnmJbscVZ9HmJG4b2L9FqkIjpmHALdCy4YPXhRoO/vse5WnYZ8EP9Nk7HBHCngxXuzSS+3HF3QVBXavDHZ5pNnfj3bBbr/i5LAzdZ8wE0voafkgJvAWrvGkmG1cf0qgqzhwwmQTf51957Z/knf0/hwS3pqD/iSU/cgyqbB0UrH/JdwyEDW3aeAaD7aoMUExNmvnRAU9nl5G9IX6KQgF/j6mnyU8RMROwH59qDFsB6COvwFuGvM9vzJ2WRNsrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB2519.namprd12.prod.outlook.com (52.132.141.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Wed, 11 Sep 2019 02:09:47 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2263.015; Wed, 11 Sep 2019
 02:09:47 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA10
Thread-Topic: [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA10
Thread-Index: AQHVZ7Wzp+URZjuAJk27+/Puv7xiX6cktGKAgAEIH+c=
Date: Wed, 11 Sep 2019 02:09:47 +0000
Message-ID: <DM5PR12MB2535330973BC7ABB4C30439F95B10@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <DM5PR12MB2535E7983EAD797B4349F96995B60@DM5PR12MB2535.namprd12.prod.outlook.com>,
 <MN2PR12MB30544FD3CC5E6B46216E6EF4B0B60@MN2PR12MB3054.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB30544FD3CC5E6B46216E6EF4B0B60@MN2PR12MB3054.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8047c49f-105d-4c1f-4962-08d7365d1ec8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2519; 
x-ms-traffictypediagnostic: DM5PR12MB2519:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB251908E9C86213ED359A58E195B10@DM5PR12MB2519.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(366004)(39860400002)(396003)(376002)(189003)(199004)(19627235002)(53936002)(66556008)(64756008)(7696005)(25786009)(71190400001)(71200400001)(478600001)(74316002)(52536014)(7736002)(19627405001)(110136005)(4744005)(11346002)(3846002)(5660300002)(33656002)(6116002)(66066001)(105004)(76116006)(66946007)(9686003)(54896002)(91956017)(66476007)(2501003)(316002)(446003)(14454004)(6246003)(54906003)(256004)(102836004)(81166006)(53546011)(26005)(6506007)(6436002)(86362001)(8676002)(76176011)(66446008)(186003)(55016002)(486006)(8936002)(476003)(99286004)(4326008)(236005)(229853002)(2906002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2519;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nSMwxgYZGMaHm81dUPpc3eL+6wJ0A66y+oKL7SM2w0IHAgeIELlNks72mcdEqsUSwkgjU5HUrrMaam3WHIZFguRCZsiaAH8I/oztgXjTkxbgt0d/6Wbnw6f+j07dvUbSuZslnX2IkiiKnLbn94tCLh8PwRh9gxgnZMJOJtV3gC7/JlPFFyny0Je1VfbSTfXX06VfeJB36z24xHhSC8aDA7BR3m3If8nIDNw37sEPw6KDCTnPFbDTfi+eTdJxOF9mehthXLn9fl//sSM9IDeOzqTpSqYiSpjPIxR79oOSfHwAXhScEifuud07VbyPyWFg9IZYtKwYX4wLu0htKSe0VUFrYN4WA+p1G+XZCAuLyl+AvXSe+5yotFPoAqd50jsZoYyYnNs3qymjOsJaI9FkFh8ZHgTHvwbwWHsAW3wfSY8=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8047c49f-105d-4c1f-4962-08d7365d1ec8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 02:09:47.0606 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CSJfWprFVo6uWtjlRbuNANXdDIlKBZxsauYJdTIk5ipPa9TjO3/jt5jo8gk/nJyt1HnxKAZwAaF00CE0jrZ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2519
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYJSNMpulEKuLee6wnMGTRnotNwPEwiF1iVZBRRVJFI=;
 b=vH3lAs1/ZfzOgiVseHifNR//L8RT+QVUoXdLN/Q6xP/16HoqhBi/hXUEIRvstzhPkIfnp2wmZ8DpMa/t2gPwHzQaxkbqX4ZI688iTGGmZ+/5u09wq7kSSn70mphPTmItArq8NaLvvN/HQaIYBnuB7pljTuPHynUsSL1VQJCqObw=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Long, Gang" <Gang.Long@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============2135689028=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2135689028==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2535330973BC7ABB4C30439F95B10DM5PR12MB2535namp_"

--_000_DM5PR12MB2535330973BC7ABB4C30439F95B10DM5PR12MB2535namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

VGhhbmtzIFRhbyENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQpGcm9tOiBaaG91
MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4NClNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAxMCwg
MjAxOSAxODoyNA0KVG86IFlpbiwgVGlhbmNpIChSaWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPjsg
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPg0KQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBYdSwgRmVp
ZmVpIDxGZWlmZWkuWHVAYW1kLmNvbT47IExvbmcsIEdhbmcgPEdhbmcuTG9uZ0BhbWQuY29tPg0K
U3ViamVjdDogUkU6IFtQYXRjaF0gZHJtL2FtZGdwdTogZml4IENQRE1BIGhhbmcgaW4gUFJUIG1v
ZGUgZm9yIFZFR0ExMA0KDQoNClJldmlld2VkLWJ5OiBUYW8gWmhvdSA8dGFvLnpob3UxQGFtZC5j
b208bWFpbHRvOnRhby56aG91MUBhbWQuY29tPj4NCg0KDQoNCkZyb206IFlpbiwgVGlhbmNpIChS
aWNvKSA8VGlhbmNpLllpbkBhbWQuY29tPg0KU2VudDogMjAxOcTqOdTCMTDI1SAxNjo1OQ0KVG86
IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogWmhhbmcsIEhhd2tpbmcgPEhhd2tp
bmcuWmhhbmdAYW1kLmNvbT47IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgWHUsIEZl
aWZlaSA8RmVpZmVpLlh1QGFtZC5jb20+OyBMb25nLCBHYW5nIDxHYW5nLkxvbmdAYW1kLmNvbT4N
ClN1YmplY3Q6IFtQYXRjaF0gZHJtL2FtZGdwdTogZml4IENQRE1BIGhhbmcgaW4gUFJUIG1vZGUg
Zm9yIFZFR0ExMA0KDQoNCg0KDQo=

--_000_DM5PR12MB2535330973BC7ABB4C30439F95B10DM5PR12MB2535namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks Tao!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Zhou1, Tao &lt;Tao.Zh=
ou1@amd.com&gt;<br>
<b>Sent:</b> Tuesday, September 10, 2019 18:24<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Xu, Feifei &lt;Fei=
fei.Xu@amd.com&gt;; Long, Gang &lt;Gang.Long@amd.com&gt;<br>
<b>Subject:</b> RE: [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA=
10</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:DengXian}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:"Microsoft YaHei"}
@font-face
	{font-family:"Microsoft YaHei"}
@font-face
	{font-family:DengXian}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:#0563C1;
	text-decoration:underline}
a:visited, span.x_MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline}
p.x_MsoPlainText, li.x_MsoPlainText, div.x_MsoPlainText
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
p.x_msonormal0, li.x_msonormal0, div.x_msonormal0
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
span.x_EmailStyle19
	{font-family:"Calibri",sans-serif;
	color:windowtext}
span.x_PlainTextChar
	{font-family:"Calibri",sans-serif}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:72.0pt 90.0pt 72.0pt 90.0pt}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoPlainText">Reviewed-by: Tao Zhou &lt;<a href=3D"mailto:tao=
.zhou1@amd.com">tao.zhou1@amd.com</a>&gt;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div style=3D"border:none; border-left:solid blue 1.5pt; padding:0cm 0cm 0c=
m 4.0pt">
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0c=
m 0cm 0cm">
<p class=3D"x_MsoNormal"><b>From:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd=
.com&gt; <br>
<b>Sent:</b> 2019<span lang=3D"ZH-CN" style=3D"font-family:&quot;=CE=A2=C8=
=ED=D1=C5=BA=DA&quot;,sans-serif">=C4=EA</span>9<span lang=3D"ZH-CN" style=
=3D"font-family:&quot;=CE=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif">=D4=C2</sp=
an>10<span lang=3D"ZH-CN" style=3D"font-family:&quot;=CE=A2=C8=ED=D1=C5=BA=
=DA&quot;,sans-serif">=C8=D5</span> 16:59<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Zhou1, Tao &lt;Tao=
.Zhou1@amd.com&gt;; Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Long, Gang &lt;Ga=
ng.Long@amd.com&gt;<br>
<b>Subject:</b> [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA10</=
p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB2535330973BC7ABB4C30439F95B10DM5PR12MB2535namp_--

--===============2135689028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2135689028==--

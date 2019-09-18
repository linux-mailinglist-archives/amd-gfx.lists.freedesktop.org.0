Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F1B639C
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 14:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9B06EF2E;
	Wed, 18 Sep 2019 12:55:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750088.outbound.protection.outlook.com [40.107.75.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394146EF2E
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 12:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfB3g1lAY6K+9qWYF8L822xz+PSouQeRpPUwmmhwd+8+Kux6Sw9En8YShx82S8QET9esP0V/v1+prP8KVDiAeQUfFrZvuyt5DTfMT1fWIXkgsIKk6yr/9m8jzhAvZZK8RSfcdltBGA9Me3S0RDWOirVgLvF/XS+g0CpfwLnVOsT0PWOVO53pwzMYcjiCswqyOTuuntp2CMmRXC5MkrxxJ5MfEvrTPqHasPPOn4e1mjeduneGcQNB4qLlzozsPPiU52cdiX+iN/g59IrOG5Y0/+/Y1SeJvXwGltrKQDllB7nQDqrz5/ofuwqEIKgTZBKL0hgh6sv1Y6ePBGxGDRrX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT+taVe6H2lHucCWsOwEj0f9bxv9rJgAaWSS7fE2bKc=;
 b=kXF46b0sFHHJPBZZoyLvlYd7bFJ2mib6sKqC1dxO1To0IUIvOEzi6LpWd7LbBvVqlOlWq2D7yovarI2gZNVs+ESwqZFFWutduA8ry3oo24+jGzFV/KlmqPQWj4TH2tFLC+2/2D1Dwe1b6DCyjBqbBT6nhUJAnoMp2V+dXRfJm01IW6BqvCnnFMuVYbkIsn+O7KDdYR96QKKE74SY3c6qe3xMXeWSDmjLAsWW14adLkeIefMozcqqe29wKNNpU60chbnkFJrjnZApV0l2Oag2BefhJPZOOM+MPqJgayug2wVzgDPE7NwRfibsIf9ZAtDDtRilh1uZ1AkooETlRDq70w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1651.namprd12.prod.outlook.com (10.172.18.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Wed, 18 Sep 2019 12:55:27 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.023; Wed, 18 Sep
 2019 12:55:27 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>
Subject: Re: libdrm patch merge request
Thread-Topic: libdrm patch merge request
Thread-Index: AdVuBQURfgwadeR7Tfmgj5ATijg5KAAG09vh
Date: Wed, 18 Sep 2019 12:55:27 +0000
Message-ID: <BN6PR12MB1809C92D191B63264A83B33BF78E0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0@BN8PR12MB3057.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0@BN8PR12MB3057.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.56.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15b33f14-56e9-4fca-a75d-08d73c377ace
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1651; 
x-ms-traffictypediagnostic: BN6PR12MB1651:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB16514EE92027D49963EF1871F78E0@BN6PR12MB1651.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:110;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(376002)(136003)(396003)(199004)(189003)(8936002)(105004)(19627235002)(81166006)(81156014)(8676002)(4326008)(26005)(3480700005)(5660300002)(316002)(6436002)(446003)(11346002)(52536014)(3846002)(229853002)(74316002)(186003)(14444005)(6116002)(256004)(606006)(19627405001)(478600001)(66066001)(2906002)(54896002)(4744005)(6306002)(53546011)(6506007)(236005)(486006)(7696005)(14454004)(33656002)(6246003)(9686003)(7736002)(966005)(102836004)(99286004)(6636002)(66556008)(66446008)(66476007)(86362001)(76116006)(66946007)(71190400001)(76176011)(64756008)(71200400001)(6862004)(476003)(25786009)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1651;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pOfaZ2DVDazzObgxRGUW9P5guivIqv+Z/n/ciiWPslp6eA1vSd5sIXJoSOny7bdOf7m+RQFARQFuYG4Xu046kEuCXQPvL3tsLMhOaZyFXlhEMwXkrbPcz2Z0Mpw1rFXiBqfiDJiSZYH5hvsz1pQOrt+mRUVHCJ/n9xazujI5G+5nyZGQwCyJFnuRhwKvmORwBePaCyQTg9H7bc95/NR5rvc9YzFrybEafOcHhZoE9SZkQOrfDODWOaqFnrdnmTpmpzOfZ4nHFQmoBmPQiiMR4MejfLHaGLK1SLiGQbJZo2nCsAb7dzR/EyII7TRDF6nvFXsafPN5mbHqh7S58/uzsyPR2mf5CkyMn7RjLu/y4BYUwE+AB5ikooK1P3GFO+MU+HAJTCwSKcP7QGskPAIIwPP0+k6OnvEJo9G+aMtxQys=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b33f14-56e9-4fca-a75d-08d73c377ace
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 12:55:27.6066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oHxRj+diTD6GsygW0xM3whG9U90NsS5WMZD0s4ph53SYaF77qbpTcz6TdoMrGcd4bcy6Ic48XSURfpNyWYXLYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1651
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT+taVe6H2lHucCWsOwEj0f9bxv9rJgAaWSS7fE2bKc=;
 b=ikBtEuvjwkUerfctETx9BndO46sLtq6wi3/Llt2OzCEAfxCXjc99H7Mshu735mEvmTFbyelG+qaoEh9JbplFermL6ocX6QnmKN5h9NEgHfHp7YmtImeS19oiAH/MfWcf+vsruW9kqEEgRh2C+dbSsrRP1Eoc8T5PnSE1Zor+apA=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0383256935=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0383256935==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809C92D191B63264A83B33BF78E0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809C92D191B63264A83B33BF78E0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Done.

Alex
________________________________
From: Ma, Le <Le.Ma@amd.com>
Sent: Wednesday, September 18, 2019 5:40 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: libdrm patch merge request


Hi Alex,



Could you help to merge patch https://gitlab.freedesktop.org/lema1/drm/comm=
it/51f3e80716578d0bf1590286e32f00f4c09c726d into drm master branch ?



Thanks.



Regards,

Ma Le

--_000_BN6PR12MB1809C92D191B63264A83B33BF78E0BN6PR12MB1809namp_
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
Done.&nbsp; <br>
</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ma, Le &lt;Le.Ma@amd.=
com&gt;<br>
<b>Sent:</b> Wednesday, September 18, 2019 5:40 AM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Subject:</b> libdrm patch merge request</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:\5B8B\4F53}
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
@font-face
	{}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:#0563C1;
	text-decoration:underline}
a:visited, span.x_MsoHyperlinkFollowed
	{color:#954F72;
	text-decoration:underline}
span.x_EmailStyle17
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-family:"Calibri",sans-serif}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">Hi Alex,</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Could you help to merge patch <a href=3D"https://g=
itlab.freedesktop.org/lema1/drm/commit/51f3e80716578d0bf1590286e32f00f4c09c=
726d">
https://gitlab.freedesktop.org/lema1/drm/commit/51f3e80716578d0bf1590286e32=
f00f4c09c726d</a> into drm master branch ?</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Thanks.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Regards,</p>
<p class=3D"x_MsoNormal">Ma Le</p>
</div>
</div>
</body>
</html>

--_000_BN6PR12MB1809C92D191B63264A83B33BF78E0BN6PR12MB1809namp_--

--===============0383256935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0383256935==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DE5AD718
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 12:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC43F899FF;
	Mon,  9 Sep 2019 10:43:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700064.outbound.protection.outlook.com [40.107.70.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003F4899FF
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 10:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMTPXsidEiPIAyBsFytFQxDqleHtHmsjxVaIJyhb0tPZNM2KzpLJik+8132gdizeSE5VMw5n00CqRBXJlan8o8iVyteQjoaEREfWK2kmKZGsWPEJ+eBdPF9tc6E7/AzxbBUEKekYpUBxzQ+JDEtJCkLWNY95WxepFARRXZVBj/k7YGoQkYAKdkAjtdXzrDU0HRZsrYOUbyWQvimh/SXCGM8jBrDKrqt4wFrsSSac0tZUIBBbveUyXm8q1J2Vih3OCruQEtuCvbT2ieXKDiD4xfvpnAn8Iswrk33QuaJhYIhweDEYysbfUWfthdY1JNKxB3PLnqkiA/gc9APPg6PBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0qcI8zo2UHWdCM0yE6U4ZCJVwe9NX2gU2/opUcgDLc=;
 b=RKs5RfXq1k1XIGvJM2t3qVKwe9ccHtSaNxWnGS98nc7gMG1UP1nIaDrtUQdmkRK4dzOU94trHlnGdYHj1Y6mtN00qwywseXMJArqeB8MmF7uX//GOMeDcAGFZCQsyomh7m8wgtTsEkzAyEfeH+K1jXoko7QtpP5UP30DiIqwPz34+k26f5empIngRIXY0UHE4ekRLyaPIoEApXfGOM1YAcNi0uNS4EPTFx6x7aWsbHH1Vh7J2Yvvhbo+hpE+PJrP9lI+ZPdDekE2URPK3te3CFbkMvbliF6u20+RySEmI736/+BoMWZyz1bSfFSf2LJbo6Ct5Vy9wueQwAZLiAt04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1866.namprd12.prod.outlook.com (10.175.88.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.15; Mon, 9 Sep 2019 10:43:41 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 10:43:41 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Xu, Feifei" <Feifei.Xu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU
Thread-Topic: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU
Thread-Index: AQHVZIXVf5W6w4NLO0uoylXwixghUacjLazQgAAAIgc=
Date: Mon, 9 Sep 2019 10:43:41 +0000
Message-ID: <DM5PR12MB2535F7DCBF9285FDE5571FDA95B70@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <DM5PR12MB25355C78839E9472D67F354995BA0@DM5PR12MB2535.namprd12.prod.outlook.com>,
 <CH2PR12MB3767862582DB359BF4A64799FEB70@CH2PR12MB3767.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3767862582DB359BF4A64799FEB70@CH2PR12MB3767.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71b26f14-88cb-4f4e-7448-08d735129491
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1866; 
x-ms-traffictypediagnostic: DM5PR12MB1866:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1866F5FD32B8B6042305A30995B70@DM5PR12MB1866.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(189003)(199004)(19627235002)(7696005)(11346002)(446003)(71190400001)(71200400001)(110136005)(52536014)(74316002)(7736002)(19627405001)(478600001)(4744005)(316002)(2501003)(14454004)(66066001)(3846002)(6116002)(5660300002)(33656002)(2906002)(66476007)(76116006)(91956017)(66446008)(9686003)(105004)(66946007)(54896002)(53936002)(256004)(54906003)(6246003)(229853002)(66556008)(8676002)(6436002)(86362001)(76176011)(6506007)(53546011)(26005)(102836004)(99286004)(8936002)(486006)(476003)(186003)(81156014)(81166006)(55016002)(4326008)(64756008)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1866;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lwq64FHY1DmKqp7mEoIa4hpv68whv7YnmA4u7351pcHKs688EXvqAbf7/N+Z1VSQEOrnz7hgCo8BitpS+A1S8ydKRXiqIperAjguz+eKxwDkBds3Fkh8EsWl/sXvFso4549GkcKxGywtEsAD6Mi+gMNpl1YEhI8ORsxwmXQlm0KbT7VX4ZtJ1vkcx5gRSieLWt0Ddf+eyxsg07qhTQ2XfltSjAiF39DfVFRUoEDsQFl11IxZvuE6kMiEkPE7iZXWj0zqPydrtIHIxdB8jeJizjeNovf6OBt+0fpxFdSSnurQIzKHXx9pzNk4ftxkjVvURRwf15S6vB3itUTIZ1RwYqUUob/W0tSg0NGdplIAR/T5l1DIuch/ONTDR8DkLsheXyW8Y+8WuOKXqGztAaR2bTk5cjlteroxC3fXAYv6fNQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b26f14-88cb-4f4e-7448-08d735129491
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 10:43:41.2979 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LK82jsyXdgAEsG71cJkk4/MtvKm0WdA1PEsBLFu5wMj702FrfV6D8EcTz/CJo4tK4Ba/5oo4bB7KzBBUvoETNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1866
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0qcI8zo2UHWdCM0yE6U4ZCJVwe9NX2gU2/opUcgDLc=;
 b=19ZTwVNZ34s8nSQUN+IhdL6Tdw9M6HI5W6g7Of8auMNm9f+LfH1EcigpyxcXnVJ+cvkPgfPT0OXZMVzarT5SMbwqZx8lDk5fW3YyARwt1uwN0nMtfJd7KVgMe8Lq/TDsT53X1rjMD8hgu9HVsh99N04WRyNkA93y/Uwe5tWSVmA=
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
Cc: "Long, Gang" <Gang.Long@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0598037862=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0598037862==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2535F7DCBF9285FDE5571FDA95B70DM5PR12MB2535namp_"

--_000_DM5PR12MB2535F7DCBF9285FDE5571FDA95B70DM5PR12MB2535namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Feifei!
________________________________
From: Xu, Feifei <Feifei.Xu@amd.com>
Sent: Monday, September 9, 2019 18:43
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Xiao, Jack <Jack.Xiao@amd.com>;=
 Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Long, Gang <Gang.Long@amd.com>
Subject: RE: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU






Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>



From: Yin, Tianci (Rico) <Tianci.Yin@amd.com>
Sent: Friday, September 6, 2019 3:37 PM
To: amd-gfx@lists.freedesktop.org
Cc: Xu, Feifei <Feifei.Xu@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>;=
 Xiao, Jack <Jack.Xiao@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Long=
, Gang <Gang.Long@amd.com>
Subject: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU





--_000_DM5PR12MB2535F7DCBF9285FDE5571FDA95B70DM5PR12MB2535namp_
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
Thanks Feifei!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Xu, Feifei &lt;Feifei=
.Xu@amd.com&gt;<br>
<b>Sent:</b> Monday, September 9, 2019 18:43<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Xiao, Jack &lt;Jac=
k.Xiao@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; Long, Gang =
&lt;Gang.Long@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu: add navi14 PCI ID for work station =
SKU</font>
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
p.x_msonormal0, li.x_msonormal0, div.x_msonormal0
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
span.x_EmailStyle19
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_MsoNormal">Reviewed-by: Feifei Xu &lt;Feifei.Xu@amd.com&gt;</=
p>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd=
.com&gt; <br>
<b>Sent:</b> Friday, September 6, 2019 3:37 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Zhang, Hawking &lt;Hawking=
.Zhang@amd.com&gt;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Yuan, Xiaojie &lt=
;Xiaojie.Yuan@amd.com&gt;; Long, Gang &lt;Gang.Long@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU<=
/p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">&nbs=
p;</span></p>
</div>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB2535F7DCBF9285FDE5571FDA95B70DM5PR12MB2535namp_--

--===============0598037862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0598037862==--

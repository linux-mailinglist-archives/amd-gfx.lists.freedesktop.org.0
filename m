Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC53AD714
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 12:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0542E898F0;
	Mon,  9 Sep 2019 10:43:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780074.outbound.protection.outlook.com [40.107.78.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5ED898F0
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 10:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3DeSysEnRCGIlSEVySBsM7/zDJNl+yAMHW085KzyaB20NxsE2JkAsjrlppLo/ytEiv4YLbhfEUBqqZguC3o4Sb4mLus3kjb95O/QYt6ytz2FoUKmdORm9qa/8eTfu4rQqTm4Gl8KDOIcekvp/wDluLaBGRJbtlrXf/402pTC+tYzWUYxVNvyusDpmUrsAR36uMWeux940PYUvXrmdQT1GeJ+dTACwabTTQN2jNKqFinFvQ5z/5rYcnUlTnJvLOuj7YKxuoDpSHgGMOF8Oi4sVtKIqjetI/flUlLi3EcHIXgTS3QH2Dc2sGBDkpyUg10MOCxJofzrFbRbgV77IbAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woJl5b0VvZptxWKNXSFYuLby+O8nUuz1UVFjufqaeUA=;
 b=oX+MWvn+9PXRW3bsOeylddMtW6L2xcjDw5CvTUe1kvqKM1SU25fep7n4ossGa0Xd9zxdDskRGGN/Apc43U46gjBev/5ydxXXq4bGs9+FhTYFBBbv9RVH0jlhGimPJLYEh/Guw01qw87jW1klZs9NZwkciYzmOkki+nX/PtpTntOE3wpKuHuJAnyt3yncar8MzhyCrHcoFuc0+DtuGWrn3itKMFh73mQdzR3yZq5mak1/FoafQlPfF57YjGkc3d+8H0qzYjecQoQW/34E4d1O4pJeBX0AH8YE7vLSZKhvWu5/hx36jVKT4yDekVNUsdr12nOioK0QHNR8PHGsqWd7Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CH2PR12MB3767.namprd12.prod.outlook.com (52.132.244.213) by
 CH2PR12MB3975.namprd12.prod.outlook.com (52.132.247.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 10:43:13 +0000
Received: from CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5]) by CH2PR12MB3767.namprd12.prod.outlook.com
 ([fe80::dc49:bed0:febe:4f5%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 10:43:13 +0000
From: "Xu, Feifei" <Feifei.Xu@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU
Thread-Topic: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU
Thread-Index: AQHVZIXVf5W6w4NLO0uoylXwixghUacjLazQ
Date: Mon, 9 Sep 2019 10:43:13 +0000
Message-ID: <CH2PR12MB3767862582DB359BF4A64799FEB70@CH2PR12MB3767.namprd12.prod.outlook.com>
References: <DM5PR12MB25355C78839E9472D67F354995BA0@DM5PR12MB2535.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB25355C78839E9472D67F354995BA0@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11cf404b-ec93-4413-abcb-08d73512842c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:CH2PR12MB3975; 
x-ms-traffictypediagnostic: CH2PR12MB3975:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB397506A29F2C5FD1B8FE2ACFFEB70@CH2PR12MB3975.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(486006)(66446008)(64756008)(66556008)(54906003)(6436002)(6246003)(7696005)(229853002)(76176011)(86362001)(11346002)(54896002)(99286004)(9686003)(4326008)(14454004)(55016002)(2906002)(6306002)(53936002)(4744005)(33656002)(446003)(102836004)(6506007)(81166006)(74316002)(25786009)(476003)(790700001)(81156014)(6116002)(53546011)(3846002)(76116006)(8676002)(5660300002)(2501003)(7736002)(186003)(71200400001)(26005)(110136005)(478600001)(66476007)(66946007)(52536014)(71190400001)(66066001)(8936002)(256004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB3975;
 H:CH2PR12MB3767.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kEFKqXhUzGWR89eWaCp6u/7U6AUSP8KKfGXXRwqN055SvsyGlFYIRrYOSKCDnXHOAyPnkDWGwjkGFqrZ2q0gUIoPZhzgIDeJ8LF7OKjMt0AUFrU1AjUsIEW17tYI7pwtaiozHSUF9l9lGIW0tyLtwCspS8ulrCL7V78krPeNJk0aAeIrITuAUVL4bQ0jLOcgfcG1Fg5QQC1cK/WKUgLfElSXHHQGq2x9k/Lj+QOtrm/xgEekMNB4aSRO7rpHI09GxYSnJz0pl0LQyhaaFyjKcrdAHv2+1hprilT5XgEj0ReYpOSVTCKdiYr4ahrxvixI+WngNOJXZRll4CmQSIup+sJSTstjMog2lJOyka0Is4vKUyxMgbrbGunawpy6fxZ1tYSjA/o0sS5NC/65sc1M3oIZC9l0Odpaltm0ZHNq2JA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cf404b-ec93-4413-abcb-08d73512842c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 10:43:13.7079 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: atKLG45W4OON9XP68cLzXpAx50hvu0dZCrL1iJXDxAW5MuLbpSbdemZeiT8Yq2eg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3975
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=woJl5b0VvZptxWKNXSFYuLby+O8nUuz1UVFjufqaeUA=;
 b=vJLoi0pTuDILakfhZ7PIOQmmuZpfxjrcqy/4tnsFsinjGF8Su1WIvAi3AhJly6goCzGEI6/67zHl3gJqQVIDL6kzGsGSloiOrPdEeimNM4j5hWWkSC3zORE2wEHV1nxMMVKgh0NvGM4sXE4Egh7FZCIMsKRtoliJK96MOU7R91k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Feifei.Xu@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0547837021=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0547837021==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB3767862582DB359BF4A64799FEB70CH2PR12MB3767namp_"

--_000_CH2PR12MB3767862582DB359BF4A64799FEB70CH2PR12MB3767namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>

From: Yin, Tianci (Rico) <Tianci.Yin@amd.com>
Sent: Friday, September 6, 2019 3:37 PM
To: amd-gfx@lists.freedesktop.org
Cc: Xu, Feifei <Feifei.Xu@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>;=
 Xiao, Jack <Jack.Xiao@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Long=
, Gang <Gang.Long@amd.com>
Subject: [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU



--_000_CH2PR12MB3767862582DB359BF4A64799FEB70CH2PR12MB3767namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Reviewed-by: Feifei Xu &lt;Feifei.Xu@amd.com&gt;<o:p=
></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.c=
om&gt; <br>
<b>Sent:</b> Friday, September 6, 2019 3:37 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Zhang, Hawking &lt;Hawking=
.Zhang@amd.com&gt;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Yuan, Xiaojie &lt=
;Xiaojie.Yuan@amd.com&gt;; Long, Gang &lt;Gang.Long@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu: add navi14 PCI ID for work station SKU<=
o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_CH2PR12MB3767862582DB359BF4A64799FEB70CH2PR12MB3767namp_--

--===============0547837021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0547837021==--

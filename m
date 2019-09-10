Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B07AE7FB
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 12:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4F88913E;
	Tue, 10 Sep 2019 10:24:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750083.outbound.protection.outlook.com [40.107.75.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9518913E
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 10:24:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxNCuAzCN0ArdbbzU3Nt3gl6XowN2b04i2L5rsImxomjX+dsvza7ScpcluSgSc+cM/hhTtEDPtij8IyDqDeVg3/N9RWwJ/oszzYUiaruzGRZN4PDuaYL53ZpQydtKekhQZDKIiNe+adWeMtsOiGoZ+HuCC2TXJ1Iu+ZU07ocEeuQ50GQYf9PSzmy/mdioS0QM4pB9+hGQvOTNZ1DPPXkqogSqNr9vp7uK+4LOrBUwHLDW+wv5PMUx4rmJGpouJE9GwdiVCLJTEHvm4gOBzTtV7dk3ZhE64/x0ZQwr5oTnTY42rNmuWXNFxZtirQGbrBN/ydjY4D6K1snLViZBk3gyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRVPkuBBNM+3DFdnTV/vI96RHYNjrBw3oWSPLh/Zjq0=;
 b=PnoyZMWmTPHCmV5XzIRRBqeVQXOZtRSQpRQmEIIfXWeKQaWPPzSgP4t6/YinFqBKnrVzJp/Gu3VbQwUsm/SlJU7s1Fyn4GDvmVe0eBzAYQCG0K8YE0Y6caPaY+blyELFClAS86WlWu4Pt2vovIAqIUPyZcjs0OUwGY8Onoyd9qfGbwO+XI4MVHBZR2LAudPUctaqkK+smXaj1NCfybCmrM3HpyjJxAsxR7Uvr6v3HDNxzn4F2dH//QjvtwzxJgM/jFwQ643SBQy9Po1ecrCNFjbhyri7XfSAjpjjGiIiDRELoSuwKpUZmG9gosJ6WxmFKjfUOJZdBs7w2Du4JsLTog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) by
 MN2PR12MB4336.namprd12.prod.outlook.com (52.135.51.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 10:24:50 +0000
Received: from MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0]) by MN2PR12MB3054.namprd12.prod.outlook.com
 ([fe80::f8cf:7a84:723c:27d0%3]) with mapi id 15.20.2241.018; Tue, 10 Sep 2019
 10:24:50 +0000
From: "Zhou1, Tao" <Tao.Zhou1@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA10
Thread-Topic: [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA10
Thread-Index: AQHVZ7Wzp+URZjuAJk27+/Puv7xiX6cktGKA
Date: Tue, 10 Sep 2019 10:24:49 +0000
Message-ID: <MN2PR12MB30544FD3CC5E6B46216E6EF4B0B60@MN2PR12MB3054.namprd12.prod.outlook.com>
References: <DM5PR12MB2535E7983EAD797B4349F96995B60@DM5PR12MB2535.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2535E7983EAD797B4349F96995B60@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f19cc02-6571-4e27-e726-08d735d91cac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4336; 
x-ms-traffictypediagnostic: MN2PR12MB4336:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4336CE16933E339FEFE718D8B0B60@MN2PR12MB4336.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(189003)(199004)(25786009)(81166006)(71190400001)(6246003)(6506007)(256004)(8936002)(53936002)(102836004)(6436002)(53546011)(14454004)(476003)(229853002)(54906003)(81156014)(4326008)(486006)(26005)(316002)(33656002)(99286004)(186003)(3846002)(74316002)(446003)(7736002)(76176011)(11346002)(5660300002)(55016002)(790700001)(2501003)(6116002)(110136005)(8676002)(76116006)(2906002)(236005)(9686003)(478600001)(66556008)(66446008)(54896002)(4744005)(6306002)(52536014)(66946007)(66476007)(64756008)(86362001)(7696005)(71200400001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4336;
 H:MN2PR12MB3054.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3xlphnXMh0rz+LpmsJ6ydm+bYEFmM5GG7xBIXXmzyR++DrpBO959/er7imho8ZlPtO6+aU9Wy1eB02hs7PB9Ea3sDjD8NZFwPUlEesBrjQIFqegEEFYpKzHR3ITqsq0cBTk23nefP6NnMzgHve8Kr5PA0nfQiFFQsSh3+ZWgAZbRhI9sRek4SrYHJiu+QOEJk1KjBJvsrsH0ODwUBTkO91HfXfpNNgBtY5JwpoVKE7GyrQS2yhx0wjjsyvpKZ2cYqPNhv4uSpP5e7ZzUQ5197hgSpPvXG8I2VrW/R/Sjz4gbvXjaFd9IeZbt1HzMcp5JqeehnNB/zA3Y8T/fMdHnnsKG4uoLK9gtunfcYdXu9fuffGwRUBGjXLR/qGYLp1cp12iEpsyaQuyqUc+oGMF1cCYDvWCvZcsp+aD+rEOLE5g=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f19cc02-6571-4e27-e726-08d735d91cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 10:24:49.9714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NEPYO+9Jp/WYOW9XWMuWTb0EkeX8+B7SzNhm3ZbLDd219EmavMAeM/JoYwYqK7V3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4336
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRVPkuBBNM+3DFdnTV/vI96RHYNjrBw3oWSPLh/Zjq0=;
 b=kTIHmK/FK0haN+wMLou9eX95gyOwxktNv9yUJzN8B88PhanbFjWPVQPreBpmpdzK54vltHlXwBXbD6zmNWzHoaI0gE9Pyvq9HFeqeBxPtLEuZNqABSs+vEGlgAnxmkeS9EU+5dCyUZ0/F+ffHr/iTmeg140rKXQHASu7BMLKbMA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tao.Zhou1@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1083068883=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1083068883==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB30544FD3CC5E6B46216E6EF4B0B60MN2PR12MB3054namp_"

--_000_MN2PR12MB30544FD3CC5E6B46216E6EF4B0B60MN2PR12MB3054namp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UmV2aWV3ZWQtYnk6IFRhbyBaaG91IDx0YW8uemhvdTFAYW1kLmNvbTxtYWlsdG86dGFvLnpob3Ux
QGFtZC5jb20+Pg0KDQpGcm9tOiBZaW4sIFRpYW5jaSAoUmljbykgPFRpYW5jaS5ZaW5AYW1kLmNv
bT4NClNlbnQ6IDIwMTnE6jnUwjEwyNUgMTY6NTkNClRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KQ2M6IFpoYW5nLCBIYXdraW5nIDxIYXdraW5nLlpoYW5nQGFtZC5jb20+OyBaaG91
MSwgVGFvIDxUYW8uWmhvdTFAYW1kLmNvbT47IFh1LCBGZWlmZWkgPEZlaWZlaS5YdUBhbWQuY29t
PjsgTG9uZywgR2FuZyA8R2FuZy5Mb25nQGFtZC5jb20+DQpTdWJqZWN0OiBbUGF0Y2hdIGRybS9h
bWRncHU6IGZpeCBDUERNQSBoYW5nIGluIFBSVCBtb2RlIGZvciBWRUdBMTANCg0KDQo=

--_000_MN2PR12MB30544FD3CC5E6B46216E6EF4B0B60MN2PR12MB3054namp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
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
	{font-family:"Microsoft YaHei";
	panose-1:2 11 5 3 2 2 4 2 2 4;}
@font-face
	{font-family:"Microsoft YaHei";}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
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
<p class=3D"MsoPlainText">Reviewed-by: Tao Zhou &lt;<a href=3D"mailto:tao.z=
hou1@amd.com">tao.zhou1@amd.com</a>&gt;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b>From:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.c=
om&gt; <br>
<b>Sent:</b> 2019<span lang=3D"ZH-CN" style=3D"font-family:&quot;=CE=A2=C8=
=ED=D1=C5=BA=DA&quot;,sans-serif">=C4=EA</span>9<span lang=3D"ZH-CN" style=
=3D"font-family:&quot;=CE=A2=C8=ED=D1=C5=BA=DA&quot;,sans-serif">=D4=C2</sp=
an>10<span lang=3D"ZH-CN" style=3D"font-family:&quot;=CE=A2=C8=ED=D1=C5=BA=
=DA&quot;,sans-serif">=C8=D5</span> 16:59<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Zhou1, Tao &lt;Tao=
.Zhou1@amd.com&gt;; Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Long, Gang &lt;Ga=
ng.Long@amd.com&gt;<br>
<b>Subject:</b> [Patch] drm/amdgpu: fix CPDMA hang in PRT mode for VEGA10<o=
:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB30544FD3CC5E6B46216E6EF4B0B60MN2PR12MB3054namp_--

--===============1083068883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1083068883==--

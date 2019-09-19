Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A1AB71AB
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 04:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836C06FAF3;
	Thu, 19 Sep 2019 02:56:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680072.outbound.protection.outlook.com [40.107.68.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561F96FAF3
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 02:56:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAJBL5IROa+aqmqRLD/AHeXqqZVpvU/5301hapKkmt4q/81APg4RKF20QVqD/UnDODhcu0gA8qIGbU4KS+fRS+Pjj9PKI7FL+e3yXKdInfVq8nYV/xx4cUwSPywsvKEXUOsO+4BYxsGDDS4B0E3HQOAWjVKGM63YhIfTqsrZqVMZ9/zXEDtjNq2IEyzjfOd0wAdklJkqTk9U6fAaMtzShZw1fzSF1GEy+lvbSsHN9vNcoWBahP7jOY320BUIeKcOWAC60H0+2DgChtrANQZBeC8u6OwWUVd5e7JDwQH0DzJNmE+cvb/u6k6/H2wHXtEuq6xy4BgHcOj3rV6OFAVjUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/FgtShvDiG/bEReCSXUMqN65bsu6DghsVS2nA8oSK8=;
 b=MDMcPwM4J+pGR+jKKju77+gbMHSu6OrIIncZF7qgjYeUaD74+iOdpZa4uoYWopIAovjNM+QDX6+VvM5FUOB3rRL11aUVYgGggG9uxoHhAMh/hcOy3CGrpvvS8auHceKo7KzLw31jbO0oJStMu6GwS/LXMol3Ik33Xyn9sJ1zB+2b49wOsW04YHyGDx7hELUrnxDx8BTXYOLWUUSEA3yETyFe2ak06GuUiDRwqJ6JDmfV11UJV0AllSLpPAlcsiqVPB679cKn2fcsdo7oUy9yyAmo78z6fIOaAntNrdVgt30GfZCKVHmz9/G0Xwku07wNb59eMUOOeCemZn3xlrq5/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3057.namprd12.prod.outlook.com (20.178.209.23) by
 BN8PR12MB2914.namprd12.prod.outlook.com (20.178.223.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.15; Thu, 19 Sep 2019 02:56:33 +0000
Received: from BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::ec3e:8e66:6501:2f48]) by BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::ec3e:8e66:6501:2f48%5]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 02:56:33 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: libdrm patch merge request
Thread-Topic: libdrm patch merge request
Thread-Index: AdVuBQURfgwadeR7Tfmgj5ATijg5KAAG09vhAB1eddA=
Date: Thu, 19 Sep 2019 02:56:32 +0000
Message-ID: <BN8PR12MB30579B6F51F169D42E84DE08F6890@BN8PR12MB3057.namprd12.prod.outlook.com>
References: <BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0@BN8PR12MB3057.namprd12.prod.outlook.com>
 <BN6PR12MB1809C92D191B63264A83B33BF78E0@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809C92D191B63264A83B33BF78E0@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07c8e3a6-fef5-4235-9853-08d73cacfa7f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB2914; 
x-ms-traffictypediagnostic: BN8PR12MB2914:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB2914E536991B511D844D09A9F6890@BN8PR12MB2914.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:110;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(189003)(199004)(6306002)(3846002)(55016002)(66066001)(4326008)(66556008)(4744005)(53546011)(11346002)(606006)(76116006)(2906002)(478600001)(14454004)(476003)(966005)(229853002)(6436002)(6506007)(81156014)(64756008)(5660300002)(446003)(66446008)(102836004)(66476007)(6636002)(486006)(3480700005)(8936002)(74316002)(6246003)(316002)(33656002)(81166006)(52536014)(9686003)(8676002)(790700001)(66946007)(6116002)(6862004)(7696005)(99286004)(256004)(86362001)(236005)(7736002)(186003)(71200400001)(54896002)(25786009)(14444005)(71190400001)(76176011)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2914;
 H:BN8PR12MB3057.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fkRDdSdNbvUOEQvUHgiSZgJZ7a95TApKcEd+r97qM73N399OnaMgQ0L8DisQE+7TYjLx42446cMn3P+y+0k9dhMosyrwltwMNF5IgwTjsTOn4ICnM2dqgp+vPQVzqmDZVYy/glN+uqrVJ8bkXbCc0LSDCwdsmj4jEwOcvbnAgqgKZdJihgUmD1S34zSEIN1NItlDM6ux4apVdtP3C3WSgh7J0TpfG2rx954PDI0GTuOjFGXzwsmZBYJUdHEx4yRMCUS3qw141jZFhmZi74Y4TuV1WgqAnUnNQaIHLa6FG2EiuP3fww/ZeN0u31VIKrAZ0XDCQLJpA5IHnPZZflJIN8/W/uWt1yYJiC6ulw2MLr+LFti3xC1FuYTMxTWX5ugILKnVdBFs9JBKt8k9Fhw9lEkYqkIxiz5ndCBD7kkuXSE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c8e3a6-fef5-4235-9853-08d73cacfa7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 02:56:32.9832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtjI6WeqME7PN214pQB1yoF8UizQgsEIp/Y2f/8NF6BTHxVp3QJuXMjaYQl1Vmi6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2914
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/FgtShvDiG/bEReCSXUMqN65bsu6DghsVS2nA8oSK8=;
 b=C55gy9gMZ6wQSzMbiZtdVKV0N1/Dt+F3F0/BSmK0W3BbjbEljyJ1yhP7/eevRMxxiTCJ5nMSriJQK3KuAhtKDNDOxF7ZzdhdGWsT0qCtb5CgsYuPsrFzzyATAwu5bP/xIZbAdos6Npn0VdY1k0bGBhcO5RGJwxZdWzRSJUI4eB0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Le.Ma@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0507981260=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0507981260==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB30579B6F51F169D42E84DE08F6890BN8PR12MB3057namp_"

--_000_BN8PR12MB30579B6F51F169D42E84DE08F6890BN8PR12MB3057namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Alex.

Regards,
Ma Le

From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Wednesday, September 18, 2019 8:55 PM
To: Ma, Le <Le.Ma@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Subject: Re: libdrm patch merge request

Done.

Alex
________________________________
From: Ma, Le <Le.Ma@amd.com<mailto:Le.Ma@amd.com>>
Sent: Wednesday, September 18, 2019 5:40 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>
Cc: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Subject: libdrm patch merge request


Hi Alex,



Could you help to merge patch https://gitlab.freedesktop.org/lema1/drm/comm=
it/51f3e80716578d0bf1590286e32f00f4c09c726d into drm master branch ?



Thanks.



Regards,

Ma Le

--_000_BN8PR12MB30579B6F51F169D42E84DE08F6890BN8PR12MB3057namp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
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
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.xmsochpdefault, li.xmsochpdefault, div.xmsochpdefault
	{mso-style-name:x_msochpdefault;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.xmsohyperlink
	{mso-style-name:x_msohyperlink;
	color:#0563C1;
	text-decoration:underline;}
span.xmsohyperlinkfollowed
	{mso-style-name:x_msohyperlinkfollowed;
	color:#954F72;
	text-decoration:underline;}
span.xemailstyle17
	{mso-style-name:x_emailstyle17;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle25
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
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
<p class=3D"MsoNormal">Thanks Alex.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ma Le<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuche=
r@amd.com&gt; <br>
<b>Sent:</b> Wednesday, September 18, 2019 8:55 PM<br>
<b>To:</b> Ma, Le &lt;Le.Ma@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org<br>
<b>Subject:</b> Re: libdrm patch merge request<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Done.&n=
bsp; <o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Alex<o:=
p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Ma, Le &lt;<a href=3D"mailto:Le.Ma@amd.com">Le.Ma@a=
md.com</a>&gt;<br>
<b>Sent:</b> Wednesday, September 18, 2019 5:40 AM<br>
<b>To:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om">Alexander.Deucher@amd.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Subject:</b> libdrm patch merge request</span> <o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsonormal">Hi Alex,<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Could you help to merge patch <a href=3D"https://gi=
tlab.freedesktop.org/lema1/drm/commit/51f3e80716578d0bf1590286e32f00f4c09c7=
26d">
https://gitlab.freedesktop.org/lema1/drm/commit/51f3e80716578d0bf1590286e32=
f00f4c09c726d</a> into drm master branch ?<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Thanks.<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Regards,<o:p></o:p></p>
<p class=3D"xmsonormal">Ma Le<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_BN8PR12MB30579B6F51F169D42E84DE08F6890BN8PR12MB3057namp_--

--===============0507981260==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0507981260==--

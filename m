Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC717B818
	for <lists+amd-gfx@lfdr.de>; Wed, 31 Jul 2019 04:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F776E661;
	Wed, 31 Jul 2019 02:58:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720049.outbound.protection.outlook.com [40.107.72.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167EB6E661
 for <amd-gfx@lists.freedesktop.org>; Wed, 31 Jul 2019 02:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W7+ApaSIPvyVIjhdyFnbWUkv772JXhe9Jw8PKA4XS4h9vIOs1kfUiYZ6X/dHJ9GnZsnQ6Qp+4Y0vw/VLRRJ878YBy2iHt5oJHZy/9Jaut21OYvsZ6RFu1qstB73qrV5nelYTHiKay5VsCpqReW8zNbaxXc/Kv8Nu5omY3dWqz/pO0QZ/ulNiNpCE3VJblYFDq7BlUOukqBg1j6AKnWcvsVbfkrDoZv7Oy/+IgQpGaPhHjne/TV/uJiQhRWduGqardOGSwsoOigonaWL6oDYPk23/GDqdvRsJ5NL3GFZooOe9z34qG//P9uvT7ERmq93aiXsb/bYFwHaPU51CEF7MGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnuK2ngCpC5/36ZZRFrXCdvVHCtgquvCXxNr7/ta3Y8=;
 b=HshbB/WpotDCZm3I+rL2R5J5NjgWVGAfZDoYPB2GDAee4ervi/gMiaQMdabJJfVTn0tuBNePU4m59BksceFtgPiY3ro1FB3WW/G/qwYk9jqr3rCewuA2hjCYwfHQkgHHrbx8Et/hMzfsSzajWwLB2dc2kSKEprE5EA2UWfQZhtHcUPbStkCq/udx7tRj7PSsdqFp3WmlPgUaI0iCkWYN0+KXmpmckL3ZP0OY+4EREOgF3CoLusavB6M+y9lbn1+LsO9r0SxOB/FAbKcHJJmp8hjBJ73qN6/LXqKLJaL8HdVu867hc1UijEXkAiDyHR23U9gJJ8YxWz7+zTEEe6cVmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3057.namprd12.prod.outlook.com (20.178.209.144) by
 BN8PR12MB3057.namprd12.prod.outlook.com (20.178.209.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Wed, 31 Jul 2019 02:58:23 +0000
Received: from BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::2540:58c6:899e:f502]) by BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::2540:58c6:899e:f502%7]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 02:58:23 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: libdrm patch merge request
Thread-Topic: libdrm patch merge request
Thread-Index: AdVHS4zoPOoLx9/ZRFKbDXre88g3/w==
Date: Wed, 31 Jul 2019 02:58:23 +0000
Message-ID: <BN8PR12MB30575C1E9879A42284CB5CFEF6DF0@BN8PR12MB3057.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aeb386ad-dac1-41de-273b-08d71562f39c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3057; 
x-ms-traffictypediagnostic: BN8PR12MB3057:
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <BN8PR12MB3057CD52597C864B6D5BFFF6F6DF0@BN8PR12MB3057.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(189003)(199004)(66446008)(66476007)(64756008)(66556008)(76116006)(66946007)(71190400001)(71200400001)(3480700005)(790700001)(6116002)(3846002)(6862004)(68736007)(4326008)(558084003)(25786009)(478600001)(966005)(14454004)(86362001)(606006)(81166006)(8676002)(6636002)(9326002)(81156014)(8936002)(7736002)(9686003)(236005)(6436002)(6306002)(54896002)(55016002)(53936002)(5660300002)(52536014)(316002)(256004)(33656002)(74316002)(486006)(476003)(66066001)(2906002)(6506007)(102836004)(26005)(186003)(7696005)(99286004)(54906003)(158833001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3057;
 H:BN8PR12MB3057.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RqGC8eBxludKgtfprGgTmK5N1IbbSVEjKw9LkKBFw5kl8h+w4iA1hO1aBsSl5yM/QdVYhSEgm74QMWmJ7hbsaZ+bNnUIAEOewiNipc5czuMaYICnqCOHfDfV57vPyWw3C8KhsqFh6vP/7DdAsb0seUa/90g2sOYGetTrHLXpdbvXQsE2nGBrZo/dN8aGB95VPV2hbQo9kgQAkuenIjVsexQwa2X9z1kRB1+N2viv/wbGcwjhWF7IWiRVa4IihqfVKnsYBJfC80Y5460xu71aDca00RLqAyXsuuL4KBUR+4NVfc13NmLsAuOmX57xoRPBJV/M2nzt6vaLer5TOAuJJER8+rQkKka1z51yXHosP7TLCRnvzLaKTfIgkMrHHPZwfM9Mg86jqac3xb+0Aef9S5qW+8A0u3tkbMI5RqzkIWs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb386ad-dac1-41de-273b-08d71562f39c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 02:58:23.2231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lema1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3057
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZnuK2ngCpC5/36ZZRFrXCdvVHCtgquvCXxNr7/ta3Y8=;
 b=Q2EGCyEzBqiAfvaSb4RQyeIAAmXja5Q91zNg3ln1+Z/Ebq9E+KsnkoAW9ydI7ioljLn7Lk4p9zkVmREV9Lo2PW3ngXVeULA9b6SR7R6oLHLsKkdtv8XrcFI/OqbOoTImbVpoYEesqZR7CA4ROZ6/urvgCdDQcpCAwWdYYEjiCaw=
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0401228540=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0401228540==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB30575C1E9879A42284CB5CFEF6DF0BN8PR12MB3057namp_"

--_000_BN8PR12MB30575C1E9879A42284CB5CFEF6DF0BN8PR12MB3057namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Could you help to merge following 2 reviewed patches on https://gitlab.free=
desktop.org/lema1/drm/commits/lema1/drm into drm master branch ?

  1.  tests/amdgpu: disable reset test for now<https://gitlab.freedesktop.o=
rg/lema1/drm/commit/97c8dca664c00864778a042ba2f69d41405e63a3>
  2.  tests/amdgpu: divide dispatch test into compute and gfx<https://gitla=
b.freedesktop.org/lema1/drm/commit/c02cb80241ba041485837488925f3e0fc864cf1f=
>

Thanks.

Regards,
Ma Le

--_000_BN8PR12MB30575C1E9879A42284CB5CFEF6DF0BN8PR12MB3057namp_
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
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@\5B8B\4F53";
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:580724786;
	mso-list-type:hybrid;
	mso-list-template-ids:1918673100 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Alex,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Could you help to merge following 2 reviewed patches=
 on <a href=3D"https://gitlab.freedesktop.org/lema1/drm/commits/lema1/drm">
https://gitlab.freedesktop.org/lema1/drm/commits/lema1/drm</a> into drm mas=
ter branch ?<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1"><a href=3D"https://gitlab.freedesktop.org/lema1/drm/commit/97c8dca664=
c00864778a042ba2f69d41405e63a3"><b><span style=3D"font-size:10.5pt;font-fam=
ily:&quot;Segoe UI&quot;,sans-serif;color:#2E2E2E;background:white">tests/a=
mdgpu:
 disable reset test for now</span></b></a><o:p></o:p></li><li class=3D"MsoL=
istParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1"><a href=3D"=
https://gitlab.freedesktop.org/lema1/drm/commit/c02cb80241ba041485837488925=
f3e0fc864cf1f"><b><span style=3D"font-size:10.5pt;font-family:&quot;Segoe U=
I&quot;,sans-serif;color:#2E2E2E;background:white">tests/amdgpu:
 divide dispatch test into compute and gfx</span></b></a><span style=3D"fon=
t-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#2E2E2E;bac=
kground:white">&nbsp;</span><o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ma Le<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN8PR12MB30575C1E9879A42284CB5CFEF6DF0BN8PR12MB3057namp_--

--===============0401228540==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0401228540==--

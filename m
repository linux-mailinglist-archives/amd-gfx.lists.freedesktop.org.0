Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F0116C56
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Dec 2019 12:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305006E3D2;
	Mon,  9 Dec 2019 11:34:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721616E3D2
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Dec 2019 11:34:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgfzIM4bUntRsTv/1wLN16z8sVNYMWiQh8v8IWsqaa386Y8INvrN/1wFpzp5Arfcd80xlt3fmx+zwSWhgzIuapQisfQgjcPZ8yBwGmnI6cs/Lx9Hieo0XcelEcAT7zzP1jLusYLcp84DJL2UVcfZ7WbyQtQsh82tGhwWAiMy5POnhai1rPT9HUxMl0xb1VzEOiWm+jpKQ2hgGPPQsLpMpugcheGrwA0IOgmdMtYi5tPjfx7stkJFH+k7aN0ztAX3pNI9yYTYEyAU4z79ZZhxcaTFgWn/x0pwDvOvnjycTgkM2p+Hp7ua+kqPThqd29R0+dPhTqUt0pxTfriGmYs+Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYd3Edo5ghbo1d3Oiiw3Wp4jW7Ri+ecnSk+7ihW+0lk=;
 b=W/75Cy7nPVjWZA82l4Z9QHI+2D09uGeeBafp7IEQUb9wzDQ8L+jGpbzTEZTpaGjtbRUUxxko25hHzrJ4TWfvu+idQcRwGNzbT8gTraEr1CynCcyCEbg/iGG9sku6Zn3jxzirvgVO2u0oKRFCUeZqMUuh9irQtSNSXAqsQ9OrhukA6hPC4Z4onqem+zpmg9jvZtJDigoJSgTFgJL+I250GaUOCFTW7Tx+YdJncZRUo18IJ77yCVAsQxyl0pSC4XItb5i9R53XH2vU2aSs8WzpRZHNS8fvAbhgbE9KeeV9kdaT2R5YDaPg7Bm8BmaHNqvNF0mKbOeQcMZ8zWy26+sPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4285.namprd12.prod.outlook.com (52.135.49.140) by
 MN2PR12MB3135.namprd12.prod.outlook.com (20.178.241.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Mon, 9 Dec 2019 11:34:22 +0000
Received: from MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::b4d9:8cb3:3876:ed5]) by MN2PR12MB4285.namprd12.prod.outlook.com
 ([fe80::b4d9:8cb3:3876:ed5%6]) with mapi id 15.20.2516.018; Mon, 9 Dec 2019
 11:34:22 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou1, Tao"
 <Tao.Zhou1@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Li,
 Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Subject: RE: [PATCH 07/10] drm/amdgpu: add concurrent baco reset support for
 XGMI
Thread-Topic: [PATCH 07/10] drm/amdgpu: add concurrent baco reset support for
 XGMI
Thread-Index: AQHVpQNJI33CWgVjAUaqRB+BX0VW26efKZkAgAETysCAAhrWgIAEZr3QgACwIQCAAMiIcIAAkXkAgACckSCAAMmfAIAAsiLwgALS/QCAA/l1oA==
Date: Mon, 9 Dec 2019 11:34:21 +0000
Message-ID: <MN2PR12MB428581A895E0C2B26542CC1DF6580@MN2PR12MB4285.namprd12.prod.outlook.com>
References: <1574846129-4826-1-git-send-email-le.ma@amd.com>
 <1574846129-4826-6-git-send-email-le.ma@amd.com>
 <c09d7928-f864-3a80-40e2-b6116abe044c@amd.com>
 <MN2PR12MB42859443EA78D08B295AFE0DF6470@MN2PR12MB4285.namprd12.prod.outlook.com>
 <157d7671-803c-4f6e-f77c-9738f32905e3@amd.com>
 <MN2PR12MB428532FA663C99770AA71263F6430@MN2PR12MB4285.namprd12.prod.outlook.com>
 <5b505116-17aa-383d-5cdf-246663a1f4f9@amd.com>
 <MN2PR12MB42855B198BB4064A0D311845F6420@MN2PR12MB4285.namprd12.prod.outlook.com>
 <2c4dd3f3-e2ce-9843-312b-1e5c05a51521@amd.com>
 <CH2PR12MB4278F9759EF24F29A85D7D23F65D0@CH2PR12MB4278.namprd12.prod.outlook.com>
 <0cf9f58a-3ce4-2a9c-cb1a-db3cb13760b9@amd.com>
 <MN2PR12MB42855296AE5C7EDA968AA442F65C0@MN2PR12MB4285.namprd12.prod.outlook.com>
 <a38e95ac-ca7e-20fd-0c2a-4d4310e8599a@amd.com>
In-Reply-To: <a38e95ac-ca7e-20fd-0c2a-4d4310e8599a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-09T11:34:12Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=3a390199-b1eb-49a8-9a97-000078dcba3e;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-09T11:34:12Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 5b2e8574-6a24-42ad-bca4-00004e6d3efb
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3e24f5e8-a881-4da5-efd5-08d77c9bbc7e
x-ms-traffictypediagnostic: MN2PR12MB3135:|MN2PR12MB3135:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3135EAF607F84F18E11D920AF6580@MN2PR12MB3135.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02462830BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(189003)(52314003)(199004)(71190400001)(71200400001)(66476007)(8676002)(316002)(26005)(76116006)(66556008)(66446008)(64756008)(9686003)(478600001)(55016002)(8936002)(81156014)(81166006)(66946007)(4326008)(790700001)(6506007)(86362001)(53546011)(229853002)(2906002)(110136005)(52536014)(33656002)(7696005)(186003)(6636002)(5660300002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3135;
 H:MN2PR12MB4285.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p5KpfFacO0N78EiIhOKrmfDvI1llzaP4RJ+fPmYZqoonQxhck3UryIYpRiiDUubUpt94kUlXu0rV1cPIMBzT+MNGw5bYVTMMEPxXA/wAyW6H28iSYtv64et4J/PDWE21a3ztSg+GRXnIwTmX5lCmnzpDiJ/ugRNj9QBhK2tZDqoDP+oRdGPlm7oXiOedxD6gY1tQ/VOgHmufWnaeBo3yaobEQ983N3evKqL496xx4nIagRQG/oMHPEvQUlQ2UV4UBfWPypX0kfUIuyXHmELQ+M4QjwQy5ZbAFFmz4pNTcBuievAkN917zugtmIfNbU1xXBc0spSD9MbH9/jpkOn1cnkyMD0P8sxHRD1Qzp8dE/URQMqZJYeADOTUYFlWm8sO09wF0UDpkI55WTU741LynQbkx1mrehzN9h21NNmkApwlveFMjDjvSAJzn5WqbyhXtG9zhj7n5BfhWhTZ3SAxVcgDcd3ctbWV2/7NvSSrcR7R+gQVeoW1XQ8+Pbwdf3tPgHgej/sTiyjQVv1L2R3W6A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e24f5e8-a881-4da5-efd5-08d77c9bbc7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2019 11:34:21.9031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n6QtJrkAp//+oo8ANfWeqR75pEBo1WHbN7JANvPIqRi3LtpBje7GY7nOS0CU4tFv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3135
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mYd3Edo5ghbo1d3Oiiw3Wp4jW7Ri+ecnSk+7ihW+0lk=;
 b=XtmEOUoLs36qKZ39IcL5RBF8btECy5tIlACyFWqc6p6kBiKnIDTHEYAxawPRUwUsjzeOG5sa16vTrRgDipCAg6eQB08ufLgCQ2AXXDoEC7NFb1B1t4nBNRYkvaQ8Wd78DMUfF8w1KslNOyOd8ItpUXKXPH77B/bzThRwtuS3mIw=
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
Cc: "Chen, Guchun" <Guchun.Chen@amd.com>
Content-Type: multipart/mixed; boundary="===============2047346439=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2047346439==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB428581A895E0C2B26542CC1DF6580MN2PR12MB4285namp_"

--_000_MN2PR12MB428581A895E0C2B26542CC1DF6580MN2PR12MB4285namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Hi Andrey,

I tried your patches on my 2P XGMI platform. The baco can work at most time=
, and randomly got following error:
[ 1701.542298] amdgpu: [powerplay] Failed to send message 0x25, response 0x=
0

This error usually means some sync issue exist for xgmi baco case. Feel fre=
e to debug your patches on my XGMI platform.

Regards,
Ma Le

From: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
Sent: Saturday, December 7, 2019 5:51 AM
To: Ma, Le <Le.Ma@amd.com>; amd-gfx@lists.freedesktop.org; Zhou1, Tao <Tao.=
Zhou1@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Li, Dennis =
<Dennis.Li@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Cc: Chen, Guchun <Guchun.Chen@amd.com>
Subject: Re: [PATCH 07/10] drm/amdgpu: add concurrent baco reset support fo=
r XGMI


Hey Ma, attached a solution - it's just compiled as I still can't make my X=
GMI setup work (with bridge connected only one device is visible to the sys=
tem while the other is not). Please try it on your system if you have a cha=
nce.

Andrey
On 12/4/19 10:14 PM, Ma, Le wrote:

AFAIK it's enough for even single one node in the hive to to fail the enter=
 the BACO state on time to fail the entire hive reset procedure, no ?
[Le]: Yeah, agree that. I've been thinking that make all nodes entering bac=
o simultaneously can reduce the possibility of node failure to enter/exit B=
ACO risk. For example, in an XGMI hive with 8 nodes, the total time interva=
l of 8 nodes enter/exit BACO on 8 CPUs is less than the interval that 8 nod=
es enter BACO serially and exit BACO serially depending on one CPU with yie=
ld capability. This interval is usually strict for BACO feature itself. Any=
way, we need more looping test later on any method we will choose.

Any way - I see our discussion blocks your entire patch set - I think you c=
an go ahead and commit yours way (I think you got an RB from Hawking) and I=
 will look then and see if I can implement my method and if it works will j=
ust revert your patch.

[Le]: OK, fine.

Andrey

--_000_MN2PR12MB428581A895E0C2B26542CC1DF6580MN2PR12MB4285namp_
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
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
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
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	color:black;}
span.EmailStyle18
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
<body bgcolor=3D"white" lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<p class=3D"msipheadera92e061b" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Arial;color:#0078D7">[AMD Official Use O=
nly - Internal Distribution Only]</span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext">Hi=
 Andrey,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext"><o=
:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext">I =
tried your patches on my 2P XGMI platform. The baco can work at most time, =
and randomly got following error:<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-size:=
12.0pt;color:windowtext">[ 1701.542298] amdgpu: [powerplay] Failed to send =
message 0x25, response 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext"><o=
:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext">Th=
is error usually means some sync issue exist for xgmi baco case. Feel free =
to debug your patches on my XGMI platform.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext"><o=
:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext">Re=
gards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext">Ma=
 Le<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:windowtext"><o=
:p>&nbsp;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"color:windowtext">From:</span></b>=
<span style=3D"color:windowtext"> Grodzovsky, Andrey &lt;Andrey.Grodzovsky@=
amd.com&gt;
<br>
<b>Sent:</b> Saturday, December 7, 2019 5:51 AM<br>
<b>To:</b> Ma, Le &lt;Le.Ma@amd.com&gt;; amd-gfx@lists.freedesktop.org; Zho=
u1, Tao &lt;Tao.Zhou1@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher=
@amd.com&gt;; Li, Dennis &lt;Dennis.Li@amd.com&gt;; Zhang, Hawking &lt;Hawk=
ing.Zhang@amd.com&gt;<br>
<b>Cc:</b> Chen, Guchun &lt;Guchun.Chen@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 07/10] drm/amdgpu: add concurrent baco reset sup=
port for XGMI<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p>Hey Ma, attached a solution - it's just compiled as I still can't make m=
y XGMI setup work (with bridge connected only one device is visible to the =
system while the other is not). Please try it on your system if you have a =
chance.
<o:p></o:p></p>
<p>Andrey<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">On 12/4/19 10:14 PM, Ma, Le wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p>AFAIK it's enough for even single one node in the hive to to fail the en=
ter the BACO state on time to fail the entire hive reset procedure, no ?<o:=
p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:12.0pt;color:#203864">[Le]: Yeah, agree t=
hat. I&#8217;ve been thinking that make all nodes entering baco simultaneou=
sly can reduce the possibility of node failure
 to enter/exit BACO risk. For example, in an XGMI hive with 8 nodes, the to=
tal time interval of 8 nodes enter/exit BACO on 8 CPUs is less than the int=
erval that 8 nodes enter BACO serially and exit BACO serially depending on =
one CPU with yield capability. This
 interval is usually strict for BACO feature itself. Anyway, we need more l=
ooping test later on any method we will choose.</span><o:p></o:p></p>
<p>Any way - I see our discussion blocks your entire patch set - I think yo=
u can go ahead and commit yours way (I think you got an RB from Hawking) an=
d I will look then and see if I can implement my method and if it works wil=
l just revert your patch.<o:p></o:p></p>
<p><span style=3D"font-size:12.0pt;color:#203864">[Le]: OK, fine.</span><o:=
p></o:p></p>
<p>Andrey<o:p></o:p></p>
</blockquote>
</div>
</body>
</html>

--_000_MN2PR12MB428581A895E0C2B26542CC1DF6580MN2PR12MB4285namp_--

--===============2047346439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2047346439==--

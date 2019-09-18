Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B59BDB6086
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 11:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496C66EE8D;
	Wed, 18 Sep 2019 09:40:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790073.outbound.protection.outlook.com [40.107.79.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832416EE8D
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 09:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Di28AEJiAsz6ir54qW+deAdbPDX8vAHktzFDy6+nD9xCPy514AM4lBJqLEBhHdvPoGXOZ/6WGNvKQ9Ie25zxad8xMiHdpGJyJ9zQKsrQ+4bhm0KrfHDe6vza7lhg69M4SPPU/dmZNaKf5uKjLxIaEP5EgzcW8UCEk3UuWX8EEVYUSi0EGbnfdt6eRYPSGkypRhJ8Y3Qr6P0toOPtmoczlYRSzoNtNx0iPWLLrAB4A+HBX+yqXPCUNjKQMkfG7UrBckWFaqQyS/hh4eNgq5MKiFDqw/dg2mxAiV4k/fPf/qsCKsTJ2v9DDYpOlf89SSFKKiVzzllxsv4LMxsm85uDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eN++Wton9sb0M1ntmN80muFN+Ly5uKbt5OrRPpQCqc=;
 b=YzQb6vRLWWlZOqcSA768DLTUh783hMwbFY2EGsLjQNXzBQ9tiSHHfPG3SY/aBwp5qFyjFE29f+1QUg3Ptk8MfhnJZgk4tOMemPOuxodqFk0OmMzKh+tK8hFAJoAX2zGElZX/hR5Fk/M9ZnrGVt1n/r/BTxq2/l7Z4kgdZac7sDCLw7XgBIo+wWeyuRamJlGbvpzU1fhA8oGVldofndLpqdz3zFqWx77Zf5gqADd9STAPmyXZ0i2r3oOvS0WwKFHGNX0YQin1VYoCdjBPGApMkoH6dtyxR83IatdAF62AFW5jhoK1FzQVeHxVnGFqtFaagUerrCgUzcn/M+nx2xsKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3057.namprd12.prod.outlook.com (20.178.209.23) by
 BN8PR12MB3617.namprd12.prod.outlook.com (20.178.211.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.26; Wed, 18 Sep 2019 09:40:39 +0000
Received: from BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::ec3e:8e66:6501:2f48]) by BN8PR12MB3057.namprd12.prod.outlook.com
 ([fe80::ec3e:8e66:6501:2f48%5]) with mapi id 15.20.2284.009; Wed, 18 Sep 2019
 09:40:39 +0000
From: "Ma, Le" <Le.Ma@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: libdrm patch merge request
Thread-Topic: libdrm patch merge request
Thread-Index: AdVuBQURfgwadeR7Tfmgj5ATijg5KA==
Date: Wed, 18 Sep 2019 09:40:39 +0000
Message-ID: <BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0@BN8PR12MB3057.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d3627ed-bd11-474c-e462-08d73c1c444a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR12MB3617; 
x-ms-traffictypediagnostic: BN8PR12MB3617:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB36179BD370BCE8AB4417D362F68E0@BN8PR12MB3617.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:206;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(189003)(199004)(102836004)(26005)(7696005)(66946007)(66446008)(790700001)(64756008)(6116002)(3846002)(66476007)(236005)(54896002)(6436002)(9686003)(66556008)(256004)(2906002)(6636002)(316002)(71200400001)(3480700005)(606006)(52536014)(71190400001)(76116006)(6506007)(55016002)(5660300002)(33656002)(66066001)(4326008)(81166006)(7736002)(86362001)(74316002)(558084003)(25786009)(6306002)(476003)(486006)(6862004)(81156014)(478600001)(966005)(8676002)(186003)(8936002)(14454004)(9326002)(99286004)(158833001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3617;
 H:BN8PR12MB3057.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uU1x7lM/NYojIzE8gTzhDFrk02UWgMUwQ+QeIctPNrTuRnzBPyFGC2kSaTp83xvWFYW5wvHzi6SK2wBs2v9WdWxEFIIdqg6F6ZdHsB6YR8JgGe1lfb7bL/rTuXr8Wv8QstNAvpDEt6bXzB8ZiknrxeV64+Wxdsw8T+Mq4ChQVE8exYw5DJhAQyTrw+xuPcYKlt/3KrJGtBQiLVmUuQN8lqg7K7hnJFzP4f9jb6beKS77ItxOSvOXvp5Plz3tRlD+cbAZyyLPFjPw5qmgshQeT386ccAitHLEyvCFNCqw+mDMAYkHKHu2cL/D80P2zVmbAVVjkcVPH8A071ckR+BAYNwQjwBuefcfpRfQSyIEtjUaf/cd4LNlBh3xesePFqG+fjJeyNyVbQ2Lqkj7TyfTeHX/EGzsujHf7XKRPCtkXGs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3627ed-bd11-474c-e462-08d73c1c444a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 09:40:39.6555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: as0HGpCZ9xJOH03Eof4uAseGB05ABCnu9jdtUnUnXJ10mfmqKSPf46/1BpC19BM4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3617
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eN++Wton9sb0M1ntmN80muFN+Ly5uKbt5OrRPpQCqc=;
 b=Clo8nsrJr4tR/BxCJkheg8F9Urz/3cDPrEZH+oLHy3dTe8RsYfONchz2HuXjOoSeahpx/D+C0neWtKOh+DN2JzRMZ1fwZQrFWt+clVs8EgSj20OhjzHmBp4SyxWYUGImw2vFITXr1Zko6SKLtjzE/+3zee94o9AiCH7mSvOShtg=
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
Content-Type: multipart/mixed; boundary="===============2070367452=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2070367452==
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0BN8PR12MB3057namp_"

--_000_BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0BN8PR12MB3057namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Could you help to merge patch https://gitlab.freedesktop.org/lema1/drm/comm=
it/51f3e80716578d0bf1590286e32f00f4c09c726d into drm master branch ?

Thanks.

Regards,
Ma Le

--_000_BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0BN8PR12MB3057namp_
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
<p class=3D"MsoNormal">Could you help to merge patch <a href=3D"https://git=
lab.freedesktop.org/lema1/drm/commit/51f3e80716578d0bf1590286e32f00f4c09c72=
6d">
https://gitlab.freedesktop.org/lema1/drm/commit/51f3e80716578d0bf1590286e32=
f00f4c09c726d</a> into drm master branch ?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ma Le<o:p></o:p></p>
</div>
</body>
</html>

--_000_BN8PR12MB305760FE5322B3C6DD2E8DB3F68E0BN8PR12MB3057namp_--

--===============2070367452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2070367452==--

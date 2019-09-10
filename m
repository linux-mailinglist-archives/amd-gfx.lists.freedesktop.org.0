Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD23AE350
	for <lists+amd-gfx@lfdr.de>; Tue, 10 Sep 2019 07:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD75E89091;
	Tue, 10 Sep 2019 05:44:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 649FF89091
 for <amd-gfx@lists.freedesktop.org>; Tue, 10 Sep 2019 05:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIZRRww8zNQ1Xc6adithybW5/JCQKspr9NWKGljnSnPP5PFALMM/kx0MXWlJdKK1LTcdpY6C27yiBto5KE6VHHOz4i96uO/cuXpyRiSXfKFox+DXq4RAovZogbWJ5jIZVww1nI8Bf8Hpo46BbrtvVz4qSNy/IbKoaagyCkxmTSuZ0u2AhohC698Jl0QHxmjuKCeCn7M9V/n+317AKbaK2NQ1n3MYAXw5gQfCJ/WOyCPBqqRt+41RO9fTNyGrVcLgzucpaWG9rEKQtImkQxiGVUIrVOZx3wUVvWidoRFdBFSgKJMQzBBtLgH+ukEej6UU+xmDz6UHfKgsHjhisIAdOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzbCz0DZJVNWmP7Ev1ewQP2GU9j6mAGHpj+MnSsy3lM=;
 b=fk4Hdv5bzXYjDw5Cva7OqIOwnbMBmwomM0xg9FvqmFm5OifIYBY/mOR6vYTOxUuyd0gdMBHf2DsoduBpkWhCTskUKU/jk82vdRq4laM5wX8eyclDRtLLJdiqvgu/vqyH2tFy/3/epNU8JVBVDKT4J06BpnF5NqmwQsks3gWPIajamn74VTk6DjRIIUqOFNmNLqGaviaNMByffl2BB3rZuGevX3oMlWCGeM/vP5LkVjj7+LDqs/W/UnfS5x6iNCm4rhklNq4f//ytkKYz7hJdw4OuZ+VszRYQ07cGdWb1pUk/rnY5z/nFaNrGGFNTXfiUmln+mMrgbQNg7n1Jz0IJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB2501.namprd12.prod.outlook.com (52.132.141.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Tue, 10 Sep 2019 05:44:44 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2263.005; Tue, 10 Sep 2019
 05:44:44 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM
Thread-Topic: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM
Thread-Index: AQHVZ5jeZt+o1h+qz0qIlXBBwo+cS6ckZkKL
Date: Tue, 10 Sep 2019 05:44:44 +0000
Message-ID: <DM5PR12MB25351DBFD7B9B4E14B33C70695B60@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <DM5PR12MB2535F6A20F1C26184A2DCDC695B60@DM5PR12MB2535.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2535F6A20F1C26184A2DCDC695B60@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9baa33e7-c01e-439a-45a4-08d735b1fbf1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2501; 
x-ms-traffictypediagnostic: DM5PR12MB2501:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB25016E543943F04143A2D70095B60@DM5PR12MB2501.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(102836004)(105004)(52536014)(606006)(54896002)(2501003)(71200400001)(316002)(2351001)(486006)(476003)(99286004)(54906003)(4744005)(7696005)(76116006)(91956017)(33656002)(2940100002)(76176011)(19627405001)(5660300002)(6916009)(6306002)(55016002)(236005)(26005)(6436002)(11346002)(6246003)(256004)(53936002)(5640700003)(9686003)(81156014)(186003)(229853002)(71190400001)(66066001)(14454004)(53546011)(6506007)(8676002)(478600001)(8936002)(74316002)(2906002)(66556008)(66476007)(3846002)(64756008)(66946007)(4326008)(25786009)(66446008)(446003)(86362001)(7736002)(6116002)(81166006)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2501;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LIi2qI38IKuFWtZJz0axLa1dvR3AxahOTyMMccXr/PYvSKuRUxiWwjHqC6Rv2Cp0oPdSd6DTOhr1A46LgZHL5XuFCspVA9m0cV0070r9isHB2tGc72/ZkZ45Eo3tf3QPhAbLeqQKHrljrQ2I9PwD0CuF+XhON56OmOilFoxNz9iKhIQSQEcCRaoxAwarJw6SsmCdV0S+FLL8buoYs4Y4WS1i8XD16tEI+NFcNmMbAQmN0aKBIkea/TpazEph9U62WHAeXxqu84tc8JwIN3rshASKXeGU11bswbpSkStz3Xv8utyCP/cV5MHiYlyUFklFRqZ1Ouip1gf6bwD1/qrB1IlsKegUQMr2JAgPwwBCYzu9CjNTMEJLLTtsj/KlwRo8a68InzJWqqFzPEufzIfnRxm7gPecuBvqeBHpzJZ8HLs=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9baa33e7-c01e-439a-45a4-08d735b1fbf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 05:44:44.7731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JmM2vSv162rUNBUi5070r94iXaxUjZUQF2bhJ0UBiwSRTdZDOtYH/mdvY1C85HDglHZz6Pqu/kc+TooJkQMCpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2501
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzbCz0DZJVNWmP7Ev1ewQP2GU9j6mAGHpj+MnSsy3lM=;
 b=G4RWVfLCYcSG5VFIRUXcThPekiMpjZndLSKglqG8md7HYds9PmOacczn2Ez6dI05lYpJk4tYnQqJuGOiXSR4zTlDNLheD1WBvK5EAN/2c0i4xxJIIEq522zpNOADYU58zg9/Mx+hzoeVqTVLU/IYhm/1c/BZAdJZHAKFgX0zlDQ=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Xu,
 Feifei" <Feifei.Xu@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Long,
 Gang" <Gang.Long@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1918864872=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1918864872==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB25351DBFD7B9B4E14B33C70695B60DM5PR12MB2535namp_"

--_000_DM5PR12MB25351DBFD7B9B4E14B33C70695B60DM5PR12MB2535namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok, Sorry.
________________________________
From: Yin, Tianci (Rico)
Sent: Tuesday, September 10, 2019 13:37
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Xu, Feifei <Feifei.Xu@a=
md.com>; Xiao, Jack <Jack.Xiao@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.=
com>; Long, Gang <Gang.Long@amd.com>
Subject: [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM

Hi,

NV14 add a new workstation SKU DID, please help review.

http://ontrack-internal.amd.com/browse/SWDEV-202589

Thanks!

Rico

--_000_DM5PR12MB25351DBFD7B9B4E14B33C70695B60DM5PR12MB2535namp_
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
<span id=3D"smartReply149813">Ok, Sorry.</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yin, Tianci (Rico)<br=
>
<b>Sent:</b> Tuesday, September 10, 2019 13:37<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Xu, Feifei=
 &lt;Feifei.Xu@amd.com&gt;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Zhang, Ha=
wking &lt;Hawking.Zhang@amd.com&gt;; Long, Gang &lt;Gang.Long@amd.com&gt;<b=
r>
<b>Subject:</b> [Patch] drm/amdgpu: add navi14 PCI ID for WKS SKU Pro-XLM</=
font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Hi,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
NV14 add a new workstation SKU DID, please help review.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<a href=3D"http://ontrack-internal.amd.com/browse/SWDEV-202589" id=3D"LPlnk=
799997">http://ontrack-internal.amd.com/browse/SWDEV-202589</a></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks!</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Rico<br>
</div>
</div>
</body>
</html>

--_000_DM5PR12MB25351DBFD7B9B4E14B33C70695B60DM5PR12MB2535namp_--

--===============1918864872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1918864872==--

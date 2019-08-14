Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E598DF4E
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 22:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4B46E847;
	Wed, 14 Aug 2019 20:51:14 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820041.outbound.protection.outlook.com [40.107.82.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C8C6E847
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 20:51:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH+peHGe40Rm2z5FlC37AFZhYA0Qu8rsI4rdmNmmFpS4HuZtHiz6MiOmeUhCJfDmS+pv09Z1OeUTHgENMeTgLgh0z0B856CgtOvbYsDBTEtum2iUyhHAor/DCrpts5s0QSCfgvyJ7cICYSj349MVTY1f0WVujzUuMgY9wIzI21Jh4Fa9wTf/RokV3irrFe67Fmq3CmNZJ/A+2ask+QPgQ4IVacTVkiYSKMa8LOlx1HpnoFgWNoOvoqbud2cs94pzuVneiaMZG/lESQ51imw+77lDBb+oUKkPzEtc7nbqeFPPoCSSUpjjWhdzWA8H23WHrH9dXJNPByPPMPeYnoQHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1+3RK7b0Z5DbWdryCgbWGKryGTgSjJnBCnYFbZgNBY=;
 b=mEANiqumcCCQs7V+95dVuTB0pBM1NuoLL+GubWrLIOywvgQppHUD+G9dxBHNcaG3LjeLf9UrlfKj1nB9xmeEN2VFHAiztHt/cc8pmSSJEXzZhGVPutPyQVRUYZD7rAcjT9T9STpl66J8VlfOCop3HU0/r3b1h40Th6qnyuzM0qDlSdlZyRL5m2+UVhIs97P0Op6V7UK08g4XWHsEsJOAQojDvHuvxVU6L5Iq0XoBRlh9vc4ggJHyEalN0Nfsq4v6VjXAbeKc5BY7kab/NB0wkz9xbZw/8yuDKMX+smOUBUjFrTK3ACVbYckvuEfBvrJb5jpRYgFhqNpQBrvHbkRw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1794.namprd12.prod.outlook.com (10.175.98.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Wed, 14 Aug 2019 20:51:10 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 20:51:10 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/5] Add mode 2 GPU reset for RV2/Picasso
Thread-Topic: [PATCH v2 0/5] Add mode 2 GPU reset for RV2/Picasso
Thread-Index: AQHVUuCF7fcosWy90EaFUZ2ESGqDU6b7Hgkq
Date: Wed, 14 Aug 2019 20:51:10 +0000
Message-ID: <BN6PR12MB1809EB3B93ED7046B4F8710DF7AD0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
In-Reply-To: <1565815217-9533-1-git-send-email-andrey.grodzovsky@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.219.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58b9bb4f-2cf5-4a84-db8a-08d720f92315
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1794; 
x-ms-traffictypediagnostic: BN6PR12MB1794:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1794BAB02F2F5294F342C655F7AD0@BN6PR12MB1794.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(189003)(199004)(66446008)(74316002)(99286004)(66476007)(66556008)(606006)(2501003)(66946007)(486006)(8936002)(64756008)(76116006)(14454004)(11346002)(446003)(476003)(86362001)(316002)(52536014)(236005)(6246003)(7696005)(6436002)(71200400001)(5660300002)(53546011)(55016002)(966005)(105004)(3846002)(71190400001)(4326008)(478600001)(229853002)(76176011)(54906003)(186003)(26005)(66066001)(19627405001)(2906002)(9686003)(6306002)(54896002)(7736002)(110136005)(6116002)(33656002)(81156014)(8676002)(81166006)(53936002)(256004)(6506007)(25786009)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1794;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qq93VUciw0aAffTGBzbeoCu+Yf6EPU5BHPndOOsDuecvX1Piw5vbkZEl2RBbudpOkrg/yuqr4rp9bLKpGDnNZBKjRWGoJMKSg3ce/Tvt1ntUVOE0c50B0RaBCLRrfuRSwZNJ8rL4XvCe/dY9LxdkKV7VWP8JTUde/TDD5MWh5rg62ClyLtiOaVVn8rXynRAjaR8748gNdIg+439t836EBbiRrRDjPItnLn6Me7BwJqbb5unUz2hhFqjAc/DQNhial7QYCAknX48H81ABgKNWAAA8bceu2s3YFbfJwOcucUH4DQbzHn/3qo8XxXp84i1Vg6SKZ8gJUO3jaBi22eUcFYIHRRxz8aFqahGuzfik1tE1rnobmqWq4QdlKClzMtAZ4YZkYtV4du3HtZjeyUTbo8izdoFD6hXdF06WrQP46JQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b9bb4f-2cf5-4a84-db8a-08d720f92315
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 20:51:10.3045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFy8eB+RXuVBQH10Nxnq9Zvg+OKNrfijx2iqQKplJ04RUPQLtw+skOfnxegsN6kSGzc/XB0NX/0s6zd3GWMReA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1794
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1+3RK7b0Z5DbWdryCgbWGKryGTgSjJnBCnYFbZgNBY=;
 b=avXwy36H3imI00AIIuvVtjHX2Z8Ofj/j5H3YjbixD8pQSq9RhjlCK6f3EJ3IXlngt9LfPMZbVYKXFY0Bw1AIVuHhp4do75cuWE3CXWLDHkyRash/ELYm/facJl3/n7XmuV3rqAmLoWW94/NDN+LjrcE4AJV2gzyv2DugA+Dtp7g=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "S, Shirish" <Shirish.S@amd.com>
Content-Type: multipart/mixed; boundary="===============1885713873=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1885713873==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809EB3B93ED7046B4F8710DF7AD0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809EB3B93ED7046B4F8710DF7AD0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please add patch descriptions for patches 3, 4, 5.  With that fixed, series=
 is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Andrey G=
rodzovsky <andrey.grodzovsky@amd.com>
Sent: Wednesday, August 14, 2019 4:40 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Grodzovsky, Andrey <And=
rey.Grodzovsky@amd.com>; Quan, Evan <Evan.Quan@amd.com>; S, Shirish <Shiris=
h.S@amd.com>
Subject: [PATCH v2 0/5] Add mode 2 GPU reset for RV2/Picasso

This patchset adds mode 2 reset through SMU for RV2 and Picasso.

v2:
Split into more patches per functional unit.
Add some NULL checks and fix typos.

Andrey Grodzovsky (5):
  drm/amd/powerplay: Fix meaning of 0x1E PPSMC_MSG
  drm/amd/powerplay: add mode2 reset callback for pp_smu_mgr
  drm/amd/powerpay: Implement mode2 reset callback for SMU10
  drm/amd/poweplay: Add amd_pm_funcs callback for mode 2
  drm/amdgpu: Use new mode2 reset interface for RV.

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        |  1 +
 drivers/gpu/drm/amd/amdgpu/soc15.c                | 25 +++++++++++++++----=
----
 drivers/gpu/drm/amd/include/kgd_pp_interface.h    |  1 +
 drivers/gpu/drm/amd/powerplay/amd_powerplay.c     | 21 +++++++++++++++++++
 drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c |  7 +++++++
 drivers/gpu/drm/amd/powerplay/inc/hwmgr.h         |  9 ++++++++
 drivers/gpu/drm/amd/powerplay/inc/rv_ppsmc.h      |  2 +-
 7 files changed, 57 insertions(+), 9 deletions(-)

--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809EB3B93ED7046B4F8710DF7AD0BN6PR12MB1809namp_
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
Please add patch descriptions for patches 3, 4, 5.&nbsp; With that fixed, s=
eries is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Andrey Grodzovsky &lt;andrey.=
grodzovsky@amd.com&gt;<br>
<b>Sent:</b> Wednesday, August 14, 2019 4:40 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Grodzovsky=
, Andrey &lt;Andrey.Grodzovsky@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.co=
m&gt;; S, Shirish &lt;Shirish.S@amd.com&gt;<br>
<b>Subject:</b> [PATCH v2 0/5] Add mode 2 GPU reset for RV2/Picasso</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This patchset adds mode 2 reset through SMU for RV=
2 and Picasso.<br>
<br>
v2:<br>
Split into more patches per functional unit.<br>
Add some NULL checks and fix typos.<br>
<br>
Andrey Grodzovsky (5):<br>
&nbsp; drm/amd/powerplay: Fix meaning of 0x1E PPSMC_MSG<br>
&nbsp; drm/amd/powerplay: add mode2 reset callback for pp_smu_mgr<br>
&nbsp; drm/amd/powerpay: Implement mode2 reset callback for SMU10<br>
&nbsp; drm/amd/poweplay: Add amd_pm_funcs callback for mode 2<br>
&nbsp; drm/amdgpu: Use new mode2 reset interface for RV.<br>
<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_device.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp; 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 25 &#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------<br>
&nbsp;drivers/gpu/drm/amd/include/kgd_pp_interface.h&nbsp;&nbsp;&nbsp; |&nb=
sp; 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amd_powerplay.c&nbsp;&nbsp;&nbsp;&nbsp;=
 | 21 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c |&nbsp; 7 &#43;&#43=
;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/hwmgr.h&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; |&nbsp; 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/rv_ppsmc.h&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; |&nbsp; 2 &#43;-<br>
&nbsp;7 files changed, 57 insertions(&#43;), 9 deletions(-)<br>
<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809EB3B93ED7046B4F8710DF7AD0BN6PR12MB1809namp_--

--===============1885713873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1885713873==--

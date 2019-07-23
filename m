Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28371FED
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 21:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECE06E39E;
	Tue, 23 Jul 2019 19:11:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790074.outbound.protection.outlook.com [40.107.79.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D066E39E
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 19:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwcQsTaZR8la+DYj03kAJp8Vax7hZvhAwA8/xCh7Heom+oJdyeKibl20LxeEsA6tfLXVikKVuFyd/K42kPOs9CRimwqC8rcezJfyfd4NW/MQ2KO8409xlg25yOvFdi/C1bXZYDdHAXePtIBXXYEYwIBCRlpdL/mMZJqjqYdZYpkRS8Y5NrLaLSusAYYExFH9AbcO33pHQX9lYLjmS9IwE3p2jfWwXS5lx8TzRBZ6zJFDklQBhJ/Sc5iy+qqTQzwmFkT7g74LarVMMBOpRGwa2gUGwQRi3ryA28m0myOHr4vHX04rL1nOYvdIZV4vi6wmz6iMQSxrTjAUtHEyyvQiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbSY39qHqLVLoIjBgdZLVmNgf6Q88J99HSnyRjuzSa0=;
 b=L4YPhvzV7VldmC+pd+L1Nt6grxt/wi7v2jKjXUUpiA+b5lBb+k4sKdOIT8Mqyu/M3jNo+J0KMpXDlFLlGITrHYRf8H8258R7CjnDUlbtVxT38kBcX/cKMg2bj6XfYl8VgmgaVfUE5z/xkGkP7JuzG11GAzUWKNLVc8sRMPBjFEg90qFWvu3vvw80AKgNEuCD/0DT6GxODHQSp7TImcU1uYzp5+rEb0d501wREXyVQfY2wACgPcm+1ZreDbq9Z6/aVwQTU7+tjxagaslIy9bQ6Tl/P9oycLjwpIwlay2e9IiERwpof+7CQGB2pXRWaR2f6rCKkw8H/86NLQ6p7emqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1875.namprd12.prod.outlook.com (10.175.99.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 19:11:24 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 19:11:24 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Topic: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Index: AQHVQWICaYcQd0EK4E+7K31JCWSbdKbYUB9QgAAAXiCAADsT5YAABmoQ
Date: Tue, 23 Jul 2019 19:11:24 +0000
Message-ID: <BN6PR12MB16189FD5DFCE30EA3BB0808E85C70@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190723142156.4863-1-kent.russell@amd.com>
 <BN6PR12MB1809AAB2C9A0E7629EF38014F7C70@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <BN6PR12MB16185BFAE98F2679F0B134CA85C70@BN6PR12MB1618.namprd12.prod.outlook.com>
 <DM6PR12MB39476BEB358FA1C7FA5734C992C70@DM6PR12MB3947.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB39476BEB358FA1C7FA5734C992C70@DM6PR12MB3947.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1ca0:3f2:9d6f:eb5c:5991:9000]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2fc9bddb-da2b-4cc7-f1e9-08d70fa18e3f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1875; 
x-ms-traffictypediagnostic: BN6PR12MB1875:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BN6PR12MB1875B7A10A236F92B90863C885C70@BN6PR12MB1875.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(51444003)(199004)(189003)(606006)(11346002)(8936002)(2501003)(76176011)(99286004)(14454004)(476003)(81156014)(81166006)(33656002)(229853002)(2906002)(6436002)(6506007)(478600001)(446003)(102836004)(71200400001)(71190400001)(53546011)(186003)(5660300002)(110136005)(86362001)(54896002)(486006)(8676002)(7696005)(55016002)(316002)(9686003)(966005)(236005)(14444005)(68736007)(6306002)(256004)(64756008)(7736002)(52536014)(6116002)(6246003)(66476007)(74316002)(66946007)(66556008)(790700001)(66446008)(76116006)(53936002)(25786009)(46003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1875;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mj8VVT6hI0DcYFqbTFxcbhmU+6IBIMMg1YzAdg2FDexrUzE6b9e7vLRRB3fb4KoVoeyQGpkzYQo4WXjWLw9f7qPNH2HfI53TUVI0Pj41Y72KtG79A0xoBnVtOg/GDDx6dvzWgsWY4iRj+mGQYgY3fRWWcVtzFaKRkDoSqFLdTdbSnQ0s4g47a69aYSoQ7Mbs89ln9JoPzfqbFFaHx+8xgCaXYPxQHyY4m7+GpaaZAIzAAvfw0o4IB0O8VoADir8telpeoQu7COYJtmjePW4iqkrU6gT5H12Bol/Jt/sNTGmEuH1xsTt0CMZGSsxEA/MfoMoxdg6HQP6mBJlKRz78V79NUag5TOKFyODvZLTYWdZYc3VQQqE/fwaqOg4xCx0VSXgwPHkQMfNwP+XmzBXenb+cG0rRampdd5Imcx6SEzw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc9bddb-da2b-4cc7-f1e9-08d70fa18e3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 19:11:24.4942 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1875
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sbSY39qHqLVLoIjBgdZLVmNgf6Q88J99HSnyRjuzSa0=;
 b=bvXwGsQYUMWovqQBemyvDsSGWmslNoOTnXxqv5Q0Blc70uKBUtDgztu8ma+ll9AqUn3N6GGtFpWa1ntwvEgj4G4y4kBydT2aEO7z1QOWIZhgePzNDjKDLptBHAcTJ/w+z8FcO4iUsV8WxZmeXOlcZ77u2SxtyXCCD22xSD0gAlk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kent.Russell@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0049773666=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0049773666==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB16189FD5DFCE30EA3BB0808E85C70BN6PR12MB1618namp_"

--_000_BN6PR12MB16189FD5DFCE30EA3BB0808E85C70BN6PR12MB1618namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That was my thought too. I'll do that as a future patch.

Kent

From: Kuehling, Felix <Felix.Kuehling@amd.com>
Sent: Tuesday, July 23, 2019 2:51 PM
To: Russell, Kent <Kent.Russell@amd.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH] drm/amdkfd: Fix byte align on VegaM

This was needed for VI chips before Fiji. I think that means Tonga, Topaz a=
nd Carrizo. As the list of supported ASICs keeps growing, we should change =
the condition to list only the chips that need the workaround, instead of a=
dding every future chip to the list that don't.

Regards,
  Felix

--
F e l i x   K u e h l i n g
PMTS Software Development Engineer | Linux Compute Kernel
1 Commerce Valley Dr. East, Markham, ON L3T 7X6 Canada
(O) +1(289)695-1597
    _     _   _   _____   _____
   / \   | \ / | |  _  \  \ _  |
  / A \  | \M/ | | |D) )  /|_| |
/_/ \_\ |_| |_| |_____/ |__/ \|   facebook.com/AMD | amd.com
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Russell, Kent <Kent.Russell@amd.com<m=
ailto:Kent.Russell@amd.com>>
Sent: Tuesday, July 23, 2019 11:18:52 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.o=
rg> <amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Subject: RE: [PATCH] drm/amdkfd: Fix byte align on VegaM


I'll push this, I was just wondering if Felix could confirm if the TLB work=
around was only for Tonga/Topaz, in which case we could check for that inst=
ead of having to expand the list in situations like this, to say "if FAMILY=
_VI && (TOPAZ || TONGA) then". That way it's explicitly applying the workar=
ound to the affected ASICs instead of implicitly not-applying the workaroun=
d to unaffected ASICs.



Kent



From: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deuche=
r@amd.com>>
Sent: Tuesday, July 23, 2019 11:16 AM
To: Russell, Kent <Kent.Russell@amd.com<mailto:Kent.Russell@amd.com>>; amd-=
gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Fix byte align on VegaM



Reviewed-by: Alex Deucher <alexander.deucher@amd.com<mailto:alexander.deuch=
er@amd.com>>

________________________________

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Russell, Kent <Kent.Russell@amd.com<m=
ailto:Kent.Russell@amd.com>>
Sent: Tuesday, July 23, 2019 10:22 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Russell, Kent <Kent.Russell@amd.com<mailto:Kent.Russell@amd.com>>
Subject: [PATCH] drm/amdkfd: Fix byte align on VegaM



This was missed during the addition of VegaM support

Change-Id: I61c8fbbea77338126e3ebdfa74c286b665bdd670
Signed-off-by: Kent Russell <kent.russell@amd.com<mailto:kent.russell@amd.c=
om>>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index f5ecf28eb37c..3179117ac434 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1139,7 +1139,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
                         adev->asic_type !=3D CHIP_FIJI &&
                         adev->asic_type !=3D CHIP_POLARIS10 &&
                         adev->asic_type !=3D CHIP_POLARIS11 &&
-                       adev->asic_type !=3D CHIP_POLARIS12) ?
+                       adev->asic_type !=3D CHIP_POLARIS12 &&
+                       adev->asic_type !=3D CHIP_VEGAM) ?
                         VI_BO_SIZE_ALIGN : 1;

         mapping_flags =3D AMDGPU_VM_PAGE_READABLE;
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB16189FD5DFCE30EA3BB0808E85C70BN6PR12MB1618namp_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.xmsonormal0, li.xmsonormal0, div.xmsonormal0
	{mso-style-name:x_msonormal0;
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
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
span.xmsohyperlink
	{mso-style-name:x_msohyperlink;
	color:blue;
	text-decoration:underline;}
span.xmsohyperlinkfollowed
	{mso-style-name:x_msohyperlinkfollowed;
	color:purple;
	text-decoration:underline;}
span.xemailstyle20
	{mso-style-name:x_emailstyle20;
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">That was my thought too. I&#8217;ll do that as a fut=
ure patch.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kent<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Kuehling, Felix &lt;Felix.Kuehling@amd.=
com&gt; <br>
<b>Sent:</b> Tuesday, July 23, 2019 2:51 PM<br>
<b>To:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;; amd-gfx@lists.freedesktop.org<br>
<b>Subject:</b> Re: [PATCH] drm/amdkfd: Fix byte align on VegaM<o:p></o:p><=
/p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This was needed for VI chips before Fiji. I think th=
at means Tonga, Topaz and Carrizo. As the list of supported ASICs keeps gro=
wing, we should change the condition to list only the chips that need the w=
orkaround, instead of adding every
 future chip to the list that don't.<br>
<br>
Regards,<br>
&nbsp; Felix<br>
<br>
--<br>
F e l i x&nbsp;&nbsp; K u e h l i n g<br>
PMTS Software Development Engineer | Linux Compute Kernel<br>
1 Commerce Valley Dr. East, Markham, ON L3T 7X6 Canada<br>
(O) &#43;1(289)695-1597<br>
&nbsp;&nbsp;&nbsp; _&nbsp;&nbsp;&nbsp;&nbsp; _&nbsp;&nbsp; _&nbsp;&nbsp; __=
___&nbsp;&nbsp; _____<br>
&nbsp;&nbsp; / \&nbsp;&nbsp; | \ / | |&nbsp; _&nbsp; \&nbsp; \ _&nbsp; |<br=
>
&nbsp; / A \&nbsp; | \M/ | | |D) )&nbsp; /|_| |<br>
/_/ \_\ |_| |_| |_____/ |__/ \|&nbsp;&nbsp; facebook.com/AMD | amd.com<o:p>=
</o:p></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.Russell@am=
d.com</a>&gt;<br>
<b>Sent:</b> Tuesday, July 23, 2019 11:18:52 AM<br>
<b>To:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om">Alexander.Deucher@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdkfd: Fix byte align on VegaM</span> <o:p=
></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsonormal">I&#8217;ll push this, I was just wondering if Felix=
 could confirm if the TLB workaround was only for Tonga/Topaz, in which cas=
e we could check for that instead of having to expand the list in situation=
s like this, to say &#8220;if FAMILY_VI &amp;&amp; (TOPAZ
 || TONGA) then&#8221;. That way it&#8217;s explicitly applying the workaro=
und to the affected ASICs instead of implicitly not-applying the workaround=
 to unaffected ASICs.<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Kent<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"xmsonormal"><b>From:</b> Deucher, Alexander &lt;<a href=3D"mail=
to:Alexander.Deucher@amd.com">Alexander.Deucher@amd.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, July 23, 2019 11:16 AM<br>
<b>To:</b> Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.R=
ussell@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<b>Subject:</b> Re: [PATCH] drm/amdkfd: Fix byte align on VegaM<o:p></o:p><=
/p>
</div>
</div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<div>
<p class=3D"xmsonormal"><span style=3D"font-size:12.0pt;color:black">Review=
ed-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com">alexan=
der.deucher@amd.com</a>&gt;</span><o:p></o:p></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"1" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"xmsonormal"><b><span style=3D"color:black">From:</span></b><spa=
n style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@list=
s.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf =
of Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.Russell@a=
md.com</a>&gt;<br>
<b>Sent:</b> Tuesday, July 23, 2019 10:22 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.R=
ussell@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Fix byte align on VegaM</span> <o:p></o=
:p></p>
<div>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"xmsonormal">This was missed during the addition of VegaM suppor=
t<br>
<br>
Change-Id: I61c8fbbea77338126e3ebdfa74c286b665bdd670<br>
Signed-off-by: Kent Russell &lt;<a href=3D"mailto:kent.russell@amd.com">ken=
t.russell@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 3 &#43;&#43;-<br>
&nbsp;1 file changed, 2 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
index f5ecf28eb37c..3179117ac434 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c<br>
@@ -1139,7 &#43;1139,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;asic_type !=3D CHIP_FIJI &amp;&amp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;asic_type !=3D CHIP_POLARIS10 &amp;&amp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;asic_type !=3D CHIP_POLARIS11 &amp;&amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;asic_ty=
pe !=3D CHIP_POLARIS12) ?<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;asi=
c_type !=3D CHIP_POLARIS12 &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;asi=
c_type !=3D CHIP_VEGAM) ?<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VI_BO=
_SIZE_ALIGN : 1;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mapping_flags =3D AMDGPU_V=
M_PAGE_READABLE;<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BN6PR12MB16189FD5DFCE30EA3BB0808E85C70BN6PR12MB1618namp_--

--===============0049773666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0049773666==--

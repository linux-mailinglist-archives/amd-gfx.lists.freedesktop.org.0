Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A743571B65
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 17:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF3F6E2E1;
	Tue, 23 Jul 2019 15:18:56 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690087.outbound.protection.outlook.com [40.107.69.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C90256E2E1
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 15:18:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcRIbVJWxTtsV7t3UVuZRERDRkiQPNwd4x0LBJ8MZ83Ga1OpgiuAREhprgSvoLUTP+8+tKs3JiC36VqD60nwVZqnMLsNRLLmCc+j2eGjbsGTf7/x91eGSgKYuicBqZuMo4XV+0M0/UcHy89B36iVAEtfbiCwjRrvCNszPRlF5fqTEuhhkDoqS2zuyQrsZmRrGKrl5PUxRHn4dc8nYD8sGkxEcnifjSl6CKbKcU42HHw+A08d3qiloKeNsdHibVglC03rhgd+AcpQd8IZ6cLiczKL9VGOkMRRCW8eaugvBT6YlWJDdJbrw0HALp8LenmjW0Z/gm9PcK6/BDunOJ8e4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NL6lp2BQ1hZLEWArJeekvBQeyBoE5yHQE/xOA/zq1Q=;
 b=OVRwmMpKQwIa3wYdV+yx+AuzB1Cl4r9ShqFAFrboDsu8CYRKPSLTg1GvgLLcNLezrtxR4xj4zQ2B4py13ch5j1xwKDrU2Gr9afEIbKXv/64Kat/UFc6AvkQZphROsDJujolmc3zv02M/yuM3VQ1cKThMBlo60jgxhnm0HDYaXPTxXzt9TOQfrT22y0pYFht68Gd+4+/17MMqbDSfa7HBcZeKcIKqzTe+ZHpZ2wqCU0SQjFpE6h+s2CB/rlFaqj0SsmSvRnQWP+EdAEWQuD/XrxnFUknaOUI3/C9/1XT3vtuGKIvo3uO33y8B7x/mStJNbl1RGhXTlbH38xfVGSdC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) by
 BN6PR12MB1537.namprd12.prod.outlook.com (10.172.18.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 15:18:53 +0000
Received: from BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483]) by BN6PR12MB1618.namprd12.prod.outlook.com
 ([fe80::9134:e36a:9204:a483%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 15:18:53 +0000
From: "Russell, Kent" <Kent.Russell@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Topic: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Index: AQHVQWICaYcQd0EK4E+7K31JCWSbdKbYUB9QgAAAXiA=
Date: Tue, 23 Jul 2019 15:18:52 +0000
Message-ID: <BN6PR12MB16185BFAE98F2679F0B134CA85C70@BN6PR12MB1618.namprd12.prod.outlook.com>
References: <20190723142156.4863-1-kent.russell@amd.com>
 <BN6PR12MB1809AAB2C9A0E7629EF38014F7C70@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809AAB2C9A0E7629EF38014F7C70@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:1ca0:3f2:9d6f:eb5c:5991:9000]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47f1b3fa-9e51-4ab8-c47f-08d70f811270
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1537; 
x-ms-traffictypediagnostic: BN6PR12MB1537:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BN6PR12MB15372559A626DA125E38075285C70@BN6PR12MB1537.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(199004)(189003)(256004)(6116002)(14444005)(790700001)(33656002)(8936002)(74316002)(86362001)(11346002)(7736002)(81156014)(81166006)(446003)(476003)(110136005)(68736007)(53546011)(316002)(8676002)(71200400001)(46003)(71190400001)(2501003)(66446008)(186003)(5660300002)(606006)(2906002)(6506007)(54896002)(6306002)(66556008)(55016002)(102836004)(66946007)(64756008)(6436002)(9686003)(66476007)(6246003)(76116006)(486006)(53936002)(229853002)(14454004)(7696005)(25786009)(99286004)(52536014)(478600001)(76176011)(236005)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1537;
 H:BN6PR12MB1618.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CJtAF3rQQFP7JEq/pTZ6Bx1ncrBVSKqGDy8y2aveq39sV9K668j0AMkaHsMZ1Gc3BcKEdmcDvbmYgBD+rpdsgiZjsB2fzjpzNJODp/qcIL0BQTqw4PaPMiLasEFOMIodLejHKKY83yAJP0HZh8mLs4WhxsYdD4zkYgEDXeuaP42EyyZ0vyLjALwXaiO97DNWQ6SBItBoPczh/5usUoTtaTRsCSE09jcl5kkxwGPVpIZE6XyybZQ3r+8Q1GDTn1coYu1Puo5iXrg8nTrZ8mwePhpRu+58aouu6RITY8mjdjsnr2QhnCjUK4GuTDU3Ugf2RZwYcQrH4+9z+dHVqSpS8Pw0WLC38oFJywtThD7LBhYekTCwVdwx6clWb3AGAIpml0HXSLFiE7HgnIVLwz8eZp/vRGVDAHCNQV1vfYG+cT0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f1b3fa-9e51-4ab8-c47f-08d70f811270
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 15:18:52.9643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: krussell@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1537
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+NL6lp2BQ1hZLEWArJeekvBQeyBoE5yHQE/xOA/zq1Q=;
 b=XD9hE5S51HS9tXNY5kwFy5UCtvXDexuMgIhnTNBEbbnr9g2fcUdgYZIOFS9+a5OF17pnRzx9NmMPbe8VQVPwGzl+/U5pbTefhaco1KjKSftJARdFjjBmhFoWy6HSx6BkL46jYiOc4BZXaAMjVVhebe3lWlXB/YvtT4AOJVdAmXA=
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
Content-Type: multipart/mixed; boundary="===============1998819258=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1998819258==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB16185BFAE98F2679F0B134CA85C70BN6PR12MB1618namp_"

--_000_BN6PR12MB16185BFAE98F2679F0B134CA85C70BN6PR12MB1618namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'll push this, I was just wondering if Felix could confirm if the TLB work=
around was only for Tonga/Topaz, in which case we could check for that inst=
ead of having to expand the list in situations like this, to say "if FAMILY=
_VI && (TOPAZ || TONGA) then". That way it's explicitly applying the workar=
ound to the affected ASICs instead of implicitly not-applying the workaroun=
d to unaffected ASICs.

Kent

From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Tuesday, July 23, 2019 11:16 AM
To: Russell, Kent <Kent.Russell@amd.com>; amd-gfx@lists.freedesktop.org
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

--_000_BN6PR12MB16185BFAE98F2679F0B134CA85C70BN6PR12MB1618namp_
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
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
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
<p class=3D"MsoNormal">I&#8217;ll push this, I was just wondering if Felix =
could confirm if the TLB workaround was only for Tonga/Topaz, in which case=
 we could check for that instead of having to expand the list in situations=
 like this, to say &#8220;if FAMILY_VI &amp;&amp; (TOPAZ
 || TONGA) then&#8221;. That way it&#8217;s explicitly applying the workaro=
und to the affected ASICs instead of implicitly not-applying the workaround=
 to unaffected ASICs.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Kent<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuche=
r@amd.com&gt; <br>
<b>Sent:</b> Tuesday, July 23, 2019 11:16 AM<br>
<b>To:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;; amd-gfx@lists.freede=
sktop.org<br>
<b>Subject:</b> Re: [PATCH] drm/amdkfd: Fix byte align on VegaM<o:p></o:p><=
/p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Reviewe=
d-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com">alexand=
er.deucher@amd.com</a>&gt;<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.Russell@am=
d.com</a>&gt;<br>
<b>Sent:</b> Tuesday, July 23, 2019 10:22 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.R=
ussell@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Fix byte align on VegaM</span> <o:p></o=
:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">This was missed during the addition of VegaM support=
<br>
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
</body>
</html>

--_000_BN6PR12MB16185BFAE98F2679F0B134CA85C70BN6PR12MB1618namp_--

--===============1998819258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1998819258==--

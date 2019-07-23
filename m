Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB5E71F9D
	for <lists+amd-gfx@lfdr.de>; Tue, 23 Jul 2019 20:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7116D6E397;
	Tue, 23 Jul 2019 18:51:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 342126E397
 for <amd-gfx@lists.freedesktop.org>; Tue, 23 Jul 2019 18:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOgcjd8VQ9ceBWxQZyZWF72SMb7KA5ox75ZmaMooTI8Qww/gnUgRZ/8UVveH6qdl0m6yXnjJYmUlxfq1nr+G57/cb8JpN/faxc8yrYQPJ/81JAsRXgGH+vn/ruBJ3TBuTmxwPZZoRKuocld7Jc6BzAXCxR8NBcnuWYgmh9iNT5uVTnLi4kT+OYYw88AGkOqkB3ZF2prIGl5qlHKn8iR6rP2SbrjM5C5p1qrZb+2aPgKDphEXyi9qmUA2VVWcJBUwQ+AGNFj2g+jhdsa4cJycYSpaV2xJ6VVFJX8NCiBZ2Ckeu9zYjBoNJ4J9qN5R+sXD20wc1QFDj5AtbU95pPYQsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7W6w8Y8ubp+8anWK2QYp3YN4IXkJhiTYX8B1K8RMbU=;
 b=GOqpYXVhowIacJaYaI7P9zChe+jw2Zj0eUJA3JMwIAvgGANMDrhg24f04drJi/xUStJ+6iGAbCY/Gl+mxULdLolr23tnDp9gWHaNdq6c+D6VWq5zpj68bGLdudKob6cbHhSOWv8B3tjo0005570+ZsZ9LZi7ClDiZynxiVlfxpbZPZLXAjlrri4lrdBOGQ8kjLFVAbByPO1aeb+LHol8m2jOckqKu/ACL4yp8Qa/Tb5RmvuISerD4OBSYogenLK6P/s/MaiieHCyuW/VFVFQHqTGqZxbjuBeNx0NukZ6yikP0q4dFFLyAnL+/Icdrxh2PxEuWQXtzqrfUwbWmWpCLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2761.namprd12.prod.outlook.com (20.176.118.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 18:51:00 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 18:51:00 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Topic: [PATCH] drm/amdkfd: Fix byte align on VegaM
Thread-Index: AQHVQWICaYcQd0EK4E+7K31JCWSbdKbYUB9QgAAAXiCAADsT5Q==
Date: Tue, 23 Jul 2019 18:51:00 +0000
Message-ID: <DM6PR12MB39476BEB358FA1C7FA5734C992C70@DM6PR12MB3947.namprd12.prod.outlook.com>
References: <20190723142156.4863-1-kent.russell@amd.com>
 <BN6PR12MB1809AAB2C9A0E7629EF38014F7C70@BN6PR12MB1809.namprd12.prod.outlook.com>,
 <BN6PR12MB16185BFAE98F2679F0B134CA85C70@BN6PR12MB1618.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB16185BFAE98F2679F0B134CA85C70@BN6PR12MB1618.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.214.139.107]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eb87eb1-d5d6-40b2-37d1-08d70f9eb4a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB2761; 
x-ms-traffictypediagnostic: DM6PR12MB2761:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB2761C0352D9D9F8D4E48E7B492C70@DM6PR12MB2761.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(51444003)(199004)(189003)(7696005)(966005)(76176011)(478600001)(99286004)(7736002)(229853002)(2906002)(53546011)(110136005)(316002)(71200400001)(86362001)(6506007)(14454004)(66066001)(102836004)(14444005)(26005)(8676002)(476003)(81156014)(2501003)(8936002)(81166006)(6306002)(54896002)(74316002)(33656002)(55016002)(6246003)(71190400001)(256004)(68736007)(3846002)(6116002)(66556008)(66476007)(186003)(446003)(6436002)(53936002)(5660300002)(9686003)(64756008)(11346002)(236005)(486006)(19627235002)(606006)(52536014)(25786009)(66946007)(76116006)(91956017)(66446008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2761;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vDuCuTZdpogJM9IIQa4TG7JgK53RkgWUQXlYAVUMXArFL4/9n15pru5Kfg23ehqOZdEK904mgCCcAgjNP0JCbBjWKKOtjep0ptcIqTXxKrEgTs2ZffwYltwxBs/PrshNsPuxnXJZectstxsBh3p/JZXGMcBc7AcA2FfyE2aBB/W90gq1f/+NYG3L5ar4/v6QsWJmcPaxMFIe1ci0IjK8gQcD4M1Nfafj0At6npQ9mtLaxc5QsxU2Gi2TvjZho2trNuEg1tn0GOLnaESYL7C6evFDo4tbRFyVGZuX4GtJpm+g2QOwNw9vPhXLk/DzX2UvV4cOVG4qA/N8TXmCJ9L6Gf4E6KqMOY1pnASh/WUa0z5a7FIOn1o+U56CIRGc7QGZowt6cFrsie/fWg9yqW0J7gSJV7AHmoakpJKDGGaiCNg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb87eb1-d5d6-40b2-37d1-08d70f9eb4a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 18:51:00.4710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2761
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7W6w8Y8ubp+8anWK2QYp3YN4IXkJhiTYX8B1K8RMbU=;
 b=KpZNTD4eaHyOYE78Qel7B3C8xqQejOYekQpxPKEQozCYZlsHRLo0RIYyxK8n307VvsWZEc0mIIoZYaqGEhhIuglBG6ceBByE5G4CeOlHLYIkoML+YoWJ3Oi/9Te/lTe4qgwU9pfKBwQaK1fzvt9Xp89G9eey2DQWiAlqD5zZaJE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0686382377=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0686382377==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB39476BEB358FA1C7FA5734C992C70DM6PR12MB3947namp_"

--_000_DM6PR12MB39476BEB358FA1C7FA5734C992C70DM6PR12MB3947namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

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
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Tuesday, July 23, 2019 11:18:52 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-gfx@lists.freedeskt=
op.org <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdkfd: Fix byte align on VegaM


I=92ll push this, I was just wondering if Felix could confirm if the TLB wo=
rkaround was only for Tonga/Topaz, in which case we could check for that in=
stead of having to expand the list in situations like this, to say =93if FA=
MILY_VI && (TOPAZ || TONGA) then=94. That way it=92s explicitly applying th=
e workaround to the affected ASICs instead of implicitly not-applying the w=
orkaround to unaffected ASICs.



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

--_000_DM6PR12MB39476BEB358FA1C7FA5734C992C70DM6PR12MB3947namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
This was needed for VI chips before Fiji. I think that means Tonga, Topaz a=
nd Carrizo. As the list of supported ASICs keeps growing, we should change =
the condition to list only the chips that need the workaround, instead of a=
dding every future chip to the list
 that don't.<br>
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
/_/ \_\ |_| |_| |_____/ |__/ \|&nbsp;&nbsp; facebook.com/AMD | amd.com<br>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Russell, Kent &lt;Kent.Russel=
l@amd.com&gt;<br>
<b>Sent:</b> Tuesday, July 23, 2019 11:18:52 AM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; amd-gfx@li=
sts.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdkfd: Fix byte align on VegaM</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
a:link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.x_MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
p.x_msonormal0, li.x_msonormal0, div.x_msonormal0
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif}
span.x_EmailStyle20
	{font-family:"Calibri",sans-serif;
	color:windowtext}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal">I=92ll push this, I was just wondering if Felix co=
uld confirm if the TLB workaround was only for Tonga/Topaz, in which case w=
e could check for that instead of having to expand the list in situations l=
ike this, to say =93if FAMILY_VI &amp;&amp; (TOPAZ
 || TONGA) then=94. That way it=92s explicitly applying the workaround to t=
he affected ASICs instead of implicitly not-applying the workaround to unaf=
fected ASICs.</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<p class=3D"x_MsoNormal">Kent</p>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b>From:</b> Deucher, Alexander &lt;Alexander.Deuc=
her@amd.com&gt;
<br>
<b>Sent:</b> Tuesday, July 23, 2019 11:16 AM<br>
<b>To:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;; amd-gfx@lists.freede=
sktop.org<br>
<b>Subject:</b> Re: [PATCH] drm/amdkfd: Fix byte align on VegaM</p>
</div>
</div>
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:12.0pt; color:black">Revi=
ewed-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com">alex=
ander.deucher@amd.com</a>&gt;</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"color:black">From:</span></b><sp=
an style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lis=
ts.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf=
 of Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.Russell@=
amd.com</a>&gt;<br>
<b>Sent:</b> Tuesday, July 23, 2019 10:22 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Russell, Kent &lt;<a href=3D"mailto:Kent.Russell@amd.com">Kent.R=
ussell@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH] drm/amdkfd: Fix byte align on VegaM</span> </p>
<div>
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal">This was missed during the addition of VegaM suppo=
rt<br>
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
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM6PR12MB39476BEB358FA1C7FA5734C992C70DM6PR12MB3947namp_--

--===============0686382377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0686382377==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA27692D5
	for <lists+amd-gfx@lfdr.de>; Mon, 15 Jul 2019 16:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A74089919;
	Mon, 15 Jul 2019 14:40:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800080.outbound.protection.outlook.com [40.107.80.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B09589919
 for <amd-gfx@lists.freedesktop.org>; Mon, 15 Jul 2019 14:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bPJBo5kRPSglr+KONa9Zs7Xv6BFc4swnZJm+a41CNCn+uTlltOZpI3Avsc1Xgp1GjRBMt7yMpTa45Z5+CFsRtesS60OK6rq7DyjEKBNBggoGgft7+youNtQJDNn4BdNVDWJ4UpEhqR7iql1oUHp4Zos3KXfFwfJQtl6fB+LNbBsotNFKSYcCfWvwqmWjDdYfmuYcwUvyIaw+eGkGeVPIhwauMRgDhAcSogA+k/3dvd0tcKd5v9J1reoxlIDyr+uvmiJWa+9zMcTqNBse8XXc9kKna9KcURA3NtfzmXPHAn43MZNazYRbu0d3G7AYGo7gKLlD/04nnKEutVW7Qi6AuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfYktkw2creDWQDpziZgf7hu0Q7R7UnwhrFV8PKakpg=;
 b=b4YLGhEy/LGO31ZIWDxoGVM+09/t+2BPcjzA2icrUjPocoMefe3+vXwNfkAviL/JvrCLXg7UXkmv8ElkaMeRPsDAsOQeOYIVVT0F5ayT5yhVuEN67zYC4jbUpeHfiJLjPYkUFNZDSIJxd4NYk9EEdYO0oBWQsKmm48VHdNel72uz/qu9XTyNY+uth3Tg9Ges5WhjPiadnRU7sjTc2XUtM/0cmsy4FnsZqqH0MZP0XPAvnk1D4nH3Aw6OGNdwBgwEpvvbTKijVfF/Ar69maULBKNsNo2lTyNr7srITaZ6vm6kvnneuMJEdZxjlfoo9lUeVGiu/U79ADf4BawUFNzsUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1315.namprd12.prod.outlook.com (10.168.228.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 14:40:25 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 14:40:25 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix Vega20 Perf counter for pcie_bw
Thread-Topic: [PATCH] drm/amdgpu: Fix Vega20 Perf counter for pcie_bw
Thread-Index: AQHVOwx95KoFcK6U40SzCiGlQLiCGabLwE2k
Date: Mon, 15 Jul 2019 14:40:25 +0000
Message-ID: <BN6PR12MB1809FE31C670FE490CDCE46FF7CF0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190715125423.30613-1-kent.russell@amd.com>
In-Reply-To: <20190715125423.30613-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.21.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8315721-8d10-4949-47cf-08d709325fce
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1315; 
x-ms-traffictypediagnostic: BN6PR12MB1315:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1315FA18E21D3E86C1801F3EF7CF0@BN6PR12MB1315.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(8936002)(53936002)(71200400001)(76176011)(71190400001)(476003)(7696005)(606006)(102836004)(186003)(486006)(256004)(2906002)(52536014)(8676002)(6506007)(66066001)(53546011)(99286004)(6246003)(25786009)(316002)(446003)(6436002)(14454004)(86362001)(229853002)(19627405001)(74316002)(5660300002)(110136005)(26005)(54896002)(6306002)(6116002)(66446008)(66476007)(66556008)(64756008)(9686003)(2501003)(11346002)(3846002)(55016002)(236005)(76116006)(66946007)(7736002)(68736007)(33656002)(81156014)(81166006)(966005)(478600001)(105004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1315;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tWXgXx48PLn73HP/9rEPMe3u3m4wdj5l8bB0zjOVudu+RYdjeDaeS7Ew9O7mUZFv/BhlJ+74vPw9WcHDkuuZxyD2cgxMedjPqXd8wjPW0L3dz5rl+gnWoo7ggGNjraScnx3Ei8wE9aFXqBP7S0oWcGX8lKGsYZzyrOk8Jm0nbtwfSsQYIM+z6C/Rge5gNp5y+Bjy67hct3VK9ln6StQYiCWYmpLPX54msfrtjtgkc46TPBSoGrzQm/g7L3A6pSIApzzef/095FMhAKMqf7DUCKoNOKr71Sr8VKAYRSYYcjhDZTr+b5oOqKuwb2sYuXu4d3htY+4McK5r5ghAzNhAd1sItPlpoV3Cp9Y4KS+xwPyvuGomWeBNoUuRlgFWTlARYfKztubFRl70yR61mVOLeBfliyj3phWy4zbAeBTqCSA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8315721-8d10-4949-47cf-08d709325fce
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 14:40:25.4914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1315
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfYktkw2creDWQDpziZgf7hu0Q7R7UnwhrFV8PKakpg=;
 b=y7qK5kJKKZ6HTsXYPEAuztJzqbJKVU0hkLQV07AYSDRP6pQ/BrNk0sjoiD5Grw4XLBDLbB0C89lsPI7cAxGagFPbqtbTm7ZuFWoUZZAGknzuluuriFENiFMOykLIjgzH8OBTyEopyotpusY6QkZqnGRVd29OVotRMCH6wx/+q5g=
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
Content-Type: multipart/mixed; boundary="===============1709233919=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1709233919==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809FE31C670FE490CDCE46FF7CF0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809FE31C670FE490CDCE46FF7CF0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Monday, July 15, 2019 8:54 AM
To: amd-gfx@lists.freedesktop.org
Cc: Russell, Kent
Subject: [PATCH] drm/amdgpu: Fix Vega20 Perf counter for pcie_bw

The perf counter for Vega20 is 108, instead of 104 which it was on all
previous GPUs, so add a check to use the appropriate value.

Change-Id: Id5b5026a03b09d8b9d52dda85e17ed5acd818912
Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c
index 1e424d918334..852ad0a07995 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -716,9 +716,15 @@ static void soc15_get_pcie_usage(struct amdgpu_device =
*adev, uint64_t *count0,
                 return;

         /* Set the 2 events that we wish to watch, defined above */
-       /* Reg 40 is # received msgs, Reg 104 is # of posted requests sent =
*/
+       /* Reg 40 is # received msgs */
         perfctr =3D REG_SET_FIELD(perfctr, PCIE_PERF_CNTL_TXCLK, EVENT0_SE=
L, 40);
-       perfctr =3D REG_SET_FIELD(perfctr, PCIE_PERF_CNTL_TXCLK, EVENT1_SEL=
, 104);
+       /* Pre-VG20, Reg 104 is # of posted requests sent. On VG20 it's 108=
 */
+       if (adev->asic_type =3D=3D CHIP_VEGA20)
+               perfctr =3D REG_SET_FIELD(perfctr, PCIE_PERF_CNTL_TXCLK,
+                                       EVENT1_SEL, 108);
+       else
+               perfctr =3D REG_SET_FIELD(perfctr, PCIE_PERF_CNTL_TXCLK,
+                                       EVENT1_SEL, 104);

         /* Write to enable desired perf counters */
         WREG32_PCIE(smnPCIE_PERF_CNTL_TXCLK, perfctr);
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809FE31C670FE490CDCE46FF7CF0BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Russell, Kent &lt;Kent.Russel=
l@amd.com&gt;<br>
<b>Sent:</b> Monday, July 15, 2019 8:54 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Russell, Kent<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Fix Vega20 Perf counter for pcie_bw</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The perf counter for Vega20 is 108, instead of 104=
 which it was on all<br>
previous GPUs, so add a check to use the appropriate value.<br>
<br>
Change-Id: Id5b5026a03b09d8b9d52dda85e17ed5acd818912<br>
Signed-off-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/soc15.c | 10 &#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;--<br>
&nbsp;1 file changed, 8 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgp=
u/soc15.c<br>
index 1e424d918334..852ad0a07995 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/soc15.c<br>
@@ -716,9 &#43;716,15 @@ static void soc15_get_pcie_usage(struct amdgpu_dev=
ice *adev, uint64_t *count0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Set the 2 events that w=
e wish to watch, defined above */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Reg 40 is # received msgs, Reg 104=
 is # of posted requests sent */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Reg 40 is # received msgs */<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perfctr =3D REG_SET_FIELD(=
perfctr, PCIE_PERF_CNTL_TXCLK, EVENT0_SEL, 40);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; perfctr =3D REG_SET_FIELD(perfctr, PC=
IE_PERF_CNTL_TXCLK, EVENT1_SEL, 104);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Pre-VG20, Reg 104 is # of post=
ed requests sent. On VG20 it's 108 */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;asic_type =3D=3D CHI=
P_VEGA20)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; perfctr =3D REG_SET_FIELD(perfctr, PCIE_PERF_CNTL_TXCLK,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; EVENT1_SEL, 108);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; perfctr =3D REG_SET_FIELD(perfctr, PCIE_PERF_CNTL_TXCLK,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; EVENT1_SEL, 104);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Write to enable desired=
 perf counters */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_PCIE(smnPCIE_PERF_C=
NTL_TXCLK, perfctr);<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809FE31C670FE490CDCE46FF7CF0BN6PR12MB1809namp_--

--===============1709233919==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1709233919==--

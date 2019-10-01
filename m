Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F17CC41C3
	for <lists+amd-gfx@lfdr.de>; Tue,  1 Oct 2019 22:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76CE89CB2;
	Tue,  1 Oct 2019 20:25:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820047.outbound.protection.outlook.com [40.107.82.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746AC89CB2
 for <amd-gfx@lists.freedesktop.org>; Tue,  1 Oct 2019 20:25:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9NGZW80WSOYFll7+MRwlFBzL8JeiQo2sWdoYJk5eW6MYzAAQ5Ge9SkosLRCtzLszO3F9ab6dpHCXZBzbzbe9xc73340XccXiKMDr5t/UeWJTGLreLd4p6B/spu0uDDXRwd7jF+y9jPXh8btqmnn9VfVFnJemTbyY9jfKj9ic5VvSVoOvQbGaiWCOmh104N9eXtWq3aPeVgTyxX+vBb2utsFS8mWyvxz/JPr021TFMziQixMY297ODc4BGtW8zzWtCtMqAsAvhARMh5YMAT/856NKVnbr35K978jhmjvx37t8BDdhN5Y7IYWAwN6N8kUyoHdkCf1XVLGaD+m8en10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvG4TuQUsaCk3XjT005BV74I+fdPNesz4ljWkYkrKhA=;
 b=hIxgAVqPSr8mE2PF+JITen0FbTuPTy9jYc5Zm0ZM6jPRoh8rCEdO8PoJ+PZaWGsQfuihw/89YmXtU+AuPxERfVv+V8uUaeMwuwoGIXvGstzNLvmKfmRavOtWSNhg3bp3N5T1NYKKyK0zPpSwil21Xs8RYILWpgvfaWCXbb1S2iSicgTgDtIru7kokyQfcw5O6oHAT0K8arx4f+wWL82BbthWQENZWcNcV4M3IzSpwAay3kZqVwKvDMmyVxAh0zTAC+IR7D8sHUGiUIbxVjDC7Z6+iGOC5jKcndqhWBVS/FV6/6FQ5Hq1kppVi9mXAI+jc4fw4tCTvuZUd2L941T2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1457.namprd12.prod.outlook.com (10.172.24.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 20:24:59 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::418d:e764:3c12:f961%10]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 20:24:58 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu : enable msix for amdgpu driver
Thread-Topic: [PATCH] drm/amdgpu : enable msix for amdgpu driver
Thread-Index: AQHVeJNW+96010Eq9kiByGXCjqQfoadGO17n
Date: Tue, 1 Oct 2019 20:24:58 +0000
Message-ID: <BN6PR12MB1809EFEDE8D0FAB3355BF49FF79D0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1569960219-8027-1-git-send-email-shaoyun.liu@amd.com>
In-Reply-To: <1569960219-8027-1-git-send-email-shaoyun.liu@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af449810-0e18-496b-4983-08d746ad6e47
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1457:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB145728E371CF892DE589B8BEF79D0@BN6PR12MB1457.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(105004)(6246003)(110136005)(256004)(2906002)(486006)(316002)(186003)(26005)(966005)(476003)(5660300002)(478600001)(446003)(11346002)(14454004)(71190400001)(71200400001)(606006)(2501003)(6306002)(229853002)(74316002)(7736002)(55016002)(54896002)(236005)(8936002)(76176011)(81166006)(81156014)(102836004)(9686003)(6506007)(33656002)(53546011)(6436002)(8676002)(99286004)(66066001)(19627405001)(7696005)(86362001)(66946007)(66446008)(66476007)(66556008)(6116002)(3846002)(25786009)(52536014)(76116006)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1457;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FaCDpbzdBDPqIxF0788KXbHv7kjKA4/+DK73JgBYOJ4q2JzgFEnTxA18Bn5hAqC+yU2I97J1v2iYoMR50IKOccqKfhoU519bRCnGv9f6Q3oEhMASWjajQKOt4+leou7Fl3RC7akBSHTkmfO6bDj098KTdgfE9/8t3b8TKOt/QcUf6zfmL+c3GQxkhoTaPWDSH32/dbhLJOz8os2AFNWiSCJdy3FGl/V8UJs4D1l2m2lA0SBeVD30RcqnF4Nco8MyYTZkkxOU8ppc1UqDhLJHFWylys5d3FVfpo6l+KgLjkXa556TGm+7ywKbfoxp7cOd3j5x1PkB4ibT69kCgzYaQ1vW5RRAV2iQ5nWtti5rWeVZ/TiXpkEIugysJ6ZEIdLtLId+KKs8jKTnS57m0mzyv7RLX9Yr1cVpjM6RI3WOk/2Ruljff379jn62yKL1xJC0q8+cTwk+NU0iYp4TR6Tg6A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af449810-0e18-496b-4983-08d746ad6e47
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 20:24:58.7477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 048pdzT75kQeUZSBEWto7O+ALdhpXJIVaQQ9u4zTjfTIihmRQBPOnAE97NjHIQjRYXn66RkzQp6en5mcGZilZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1457
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvG4TuQUsaCk3XjT005BV74I+fdPNesz4ljWkYkrKhA=;
 b=37FaVHk3e6Qm0ahYmbtpfmG+PS4Z4c3GmvcSTW3T3ZZlceFXrD7LixJ2YKeM7BYyuZMRqTVScOkFyaCnuMgJyAMbpuVFZDaoj5TgQcdylrx9dpVbgfHpMC29nxXDZczKr5d1SnetaOPIIXvyh/RIJw7UdEOSg9q28ERFcoNsP44=
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
Content-Type: multipart/mixed; boundary="===============0895834953=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0895834953==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809EFEDE8D0FAB3355BF49FF79D0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809EFEDE8D0FAB3355BF49FF79D0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liu, Sha=
oyun <Shaoyun.Liu@amd.com>
Sent: Tuesday, October 1, 2019 4:03 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liu, Shaoyun <Shaoyun.Liu@amd.com>
Subject: [PATCH] drm/amdgpu : enable msix for amdgpu driver

We might used out of the msi resources in some cloud project
which have a lot gpu devices(including PF and VF), msix can
provide enough resources from system level view

Change-Id: I9f03762074ac416c07f27b8f00c052ca93c7d6cb
Signed-off-by: shaoyunl <shaoyun.liu@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_irq.c
index d1d5e7f..1bd27ea 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -245,8 +245,9 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
         adev->irq.msi_enabled =3D false;

         if (amdgpu_msi_ok(adev)) {
-               int ret =3D pci_enable_msi(adev->pdev);
-               if (!ret) {
+               int nvec =3D pci_alloc_irq_vectors(adev->pdev, 1, pci_msix_=
vec_count(adev->pdev),
+                                       PCI_IRQ_MSI | PCI_IRQ_MSIX)
+               if (nvec > 0) {
                         adev->irq.msi_enabled =3D true;
                         dev_dbg(adev->dev, "amdgpu: using MSI.\n");
                 }
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809EFEDE8D0FAB3355BF49FF79D0BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liu, Shaoyun &lt;Shaoyun.Liu@=
amd.com&gt;<br>
<b>Sent:</b> Tuesday, October 1, 2019 4:03 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Liu, Shaoyun &lt;Shaoyun.Liu@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu : enable msix for amdgpu driver</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">We might used out of the msi resources in some clo=
ud project<br>
which have a lot gpu devices(including PF and VF), msix can<br>
provide enough resources from system level view<br>
<br>
Change-Id: I9f03762074ac416c07f27b8f00c052ca93c7d6cb<br>
Signed-off-by: shaoyunl &lt;shaoyun.liu@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 5 &#43;&#43;&#43;--<br>
&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_irq.c<br>
index d1d5e7f..1bd27ea 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c<br>
@@ -245,8 &#43;245,9 @@ int amdgpu_irq_init(struct amdgpu_device *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;irq.msi_enabled =
=3D false;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_msi_ok(adev)) {=
<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int ret =3D pci_enable_msi(adev-&gt;pdev);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!ret) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; int nvec =3D pci_alloc_irq_vectors(adev-&gt;pdev, 1, pci_msi=
x_vec_count(adev-&gt;pdev),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; PCI_IRQ_MSI | PCI_IRQ_MSIX)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (nvec &gt; 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-=
&gt;irq.msi_enabled =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_d=
bg(adev-&gt;dev, &quot;amdgpu: using MSI.\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
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

--_000_BN6PR12MB1809EFEDE8D0FAB3355BF49FF79D0BN6PR12MB1809namp_--

--===============0895834953==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0895834953==--

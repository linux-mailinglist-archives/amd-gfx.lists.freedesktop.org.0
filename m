Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2301DBED0B
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 10:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A02F36EE47;
	Thu, 26 Sep 2019 08:09:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780044.outbound.protection.outlook.com [40.107.78.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3D76EE47
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 08:09:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuIWuMpZF2o/NrGIY6U1osQ42VzOIsMX2IsxaHQV+lsOeJyvets41dvZYQtw3BQqNxU+VvkbCP/uNFxo2nlEDXDBXkeSwjZ7LPGVAno0opnZwNExiKKwDngoj/zS2lFkD/+6jz9hGQh2N0flgNLtujWf6n0nIYu4v7WPYER0rNb3Q4dC4Zpy6mr71R6O8C6a87UFIeOurEDLXX8xJdeDkJsE/0Ev73jxcjN3tE8h1fjy1zFQHzJVNeTtJYVyaA4gmkZBdZYD3Zc4HBcbEWAYHO4BD2/R1oAXhgMJXyPG6vgs6o3NtVhmPkHDv26Tc2NE8WZXjIIKdRyzyMUCkYZa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dB0SQfVWjWDqfjysVGkpCxsBDH+x9nzp1sYEzuQDShk=;
 b=f4cq3kCYOIZYboNcYqrBx/9sCWsWiLe/l7OHFJXzsWbt3vCEQHglAEnsNYKdYpDaMBWNKcNcnWit1hT/moalZuGxffXAlInjpmQn9diQCuMg/VAnXmIOmwpLzs4g0h5e/N0BDEMUnaaY7sH2qEvL4yHj8gDew9sMoEiI6siRf/HDFQ0jGtgVmPMgcfGWomacjkKKwpQvAcoZRxcYx2UGQZUHJ7ZBYGIW/rp/GZsArGrfzTUgICS7uG9OFOzenumHVjXmyXH7mItKfd4a/zz35zpf9B5ktfN4P54vfDQbJ6+tIAoGN2V97epS3P0ejpvFraTLTT8Yawiyod6CY20BeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3572.namprd12.prod.outlook.com (20.178.211.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Thu, 26 Sep 2019 08:09:25 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::55d8:90a7:d1dc:e9e3%7]) with mapi id 15.20.2305.016; Thu, 26 Sep 2019
 08:09:25 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Index: AQHVdEGHm0iocdCUOEuYheblhNg2q6c9mpfz
Date: Thu, 26 Sep 2019 08:09:24 +0000
Message-ID: <BN8PR12MB36027CA5662543E7F956657589860@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20190926080746.20765-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190926080746.20765-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 946b1b6f-d841-49ba-0c3d-08d74258d868
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3572; 
x-ms-traffictypediagnostic: BN8PR12MB3572:
x-microsoft-antispam-prvs: <BN8PR12MB3572445AC1ADA5848454D09489860@BN8PR12MB3572.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(189003)(199004)(478600001)(2906002)(14444005)(7736002)(316002)(25786009)(66066001)(256004)(2501003)(99286004)(6916009)(52536014)(26005)(7696005)(76176011)(102836004)(4326008)(14454004)(186003)(5660300002)(6116002)(3846002)(53546011)(33656002)(6506007)(476003)(19627405001)(105004)(8936002)(446003)(11346002)(71200400001)(6246003)(55016002)(66556008)(66476007)(64756008)(9686003)(54896002)(486006)(2351001)(66446008)(66946007)(5640700003)(91956017)(76116006)(6436002)(86362001)(229853002)(8676002)(74316002)(81156014)(81166006)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3572;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JOjfZ2+mNVbHkqGYpygJ10DdfgL6nciqoBPUHEAUuYTR6y4ld1EbfEozsz1eitvUoFKtfYHWwfK1/uIo2M500oTocieZhIBZqMBQgL9il1be5h0nzlj6+VZGZ7H4dZuw+Kzm3B46b/27XNaLId1dD5+7SJHkLe7RgVTYjHJfX2xWUBeMxwShfZjQKrd+YM5vu6GiOjoqtSpjiUfaY2jbm0F3RkSkoQ3jFYB+Ot3IiC4W+61qIOZDa6L3HPD/VlLYesovnV/yAp1WS69mdJRKXSG2UvC/wZygncSlzynHRiVrqT0vaEqNIsj05PsJ1RiB4ebppSHz58diQ4nhpJh4YduE+Fi6xmHyPGJyNn238GTnqljhDBPtwxIVKxWiKs8wCea9x+u80XS61AG9Z+klHXoLPL+X9quAYYx1D9nVzmg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946b1b6f-d841-49ba-0c3d-08d74258d868
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 08:09:24.9748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uiPQ4HkfbEfqci2goBO7rxvQ+CoSAzlqTII3Ri+9ccHHtMSPIEmyMOFfmZ3iXhuo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3572
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dB0SQfVWjWDqfjysVGkpCxsBDH+x9nzp1sYEzuQDShk=;
 b=QFpjefWt6gkreZrhH3sikOFq2/4yb/c9AQIgMTPkb+ALV2KZwVpUUNqPTkeR53Gq09+uC2ksYPjE3+wFsSc+fImkgi8e/CV+bBBrBFHK1qZNBLNDTiAb/6FR5PBKGpBx/NfHhfU/lsv33INTVWrF0hqBp6JDswxH1oisMG17Vbk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>
Content-Type: multipart/mixed; boundary="===============1863776100=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1863776100==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB36027CA5662543E7F956657589860BN8PR12MB3602namp_"

--_000_BN8PR12MB36027CA5662543E7F956657589860BN8PR12MB3602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

This patch is to add the asic_type check which is missing after drm-next br=
anch rebase.

BR,
Xiaojie
________________________________
From: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Sent: Thursday, September 26, 2019 4:08 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: alexdeucher@gmail.com <alexdeucher@gmail.com>; Yuan, Xiaojie <Xiaojie.Y=
uan@amd.com>
Subject: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma' worka=
round for navi

Fixes: 767acabdac81 ("drm/amd/powerplay: add baco smu reset function for sm=
u11")
Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gmc_v10_0.c
index cb3f61873baa..dc2e68e019eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c
@@ -292,6 +292,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_devic=
e *adev, uint32_t vmid,

         if (!adev->mman.buffer_funcs_enabled ||
             !adev->ib_pool_ready ||
+           !(adev->asic_type >=3D CHIP_NAVI10 && adev->asic_type <=3D CHIP=
_NAVI12) ||
             adev->in_gpu_reset) {
                 gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, 0);
                 mutex_unlock(&adev->mman.gtt_window_lock);
--
2.20.1


--_000_BN8PR12MB36027CA5662543E7F956657589860BN8PR12MB3602namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Hi Alex,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
This patch is to add the asic_type check which is missing after drm-next br=
anch rebase.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
BR,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Xiaojie<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yuan, Xiaojie &lt;Xia=
ojie.Yuan@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 4:08 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> alexdeucher@gmail.com &lt;alexdeucher@gmail.com&gt;; Yuan, Xiaoj=
ie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma=
' workaround for navi</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Fixes: 767acabdac81 (&quot;drm/amd/powerplay: add =
baco smu reset function for smu11&quot;)<br>
Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c | 1 &#43;<br>
&nbsp;1 file changed, 1 insertion(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gmc_v10_0.c<br>
index cb3f61873baa..dc2e68e019eb 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c<br>
@@ -292,6 &#43;292,7 @@ static void gmc_v10_0_flush_gpu_tlb(struct amdgpu_d=
evice *adev, uint32_t vmid,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;mman.buffer_=
funcs_enabled ||<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !a=
dev-&gt;ib_pool_ready ||<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !(adev-&g=
t;asic_type &gt;=3D CHIP_NAVI10 &amp;&amp; adev-&gt;asic_type &lt;=3D CHIP_=
NAVI12) ||<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ad=
ev-&gt;in_gpu_reset) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; gmc_v10_0_flush_vm_hub(adev, vmid, AMDGPU_GFXHUB_0, 0=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;adev-&gt;mman.gtt_window_lock);<br>
-- <br>
2.20.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB36027CA5662543E7F956657589860BN8PR12MB3602namp_--

--===============1863776100==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1863776100==--

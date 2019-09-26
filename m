Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C172BF2E3
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 14:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FE16ED00;
	Thu, 26 Sep 2019 12:26:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-cys01nam02on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe45::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DA06ECFE
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 12:26:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggfVU/xuIOCiSHtpqFBpHXA54F4OuIVQKwf97WSiLEL4fihPTHkZe2fhOoOOeM1DMaHYw+Xtyd6LlxRv9VRiWg8RvkroEsa8Qgo47q4pANBbXP447l0APYl1J0EYGHUkJYFXgsaTxnW10aWsl6QtKmlrnZ2YMC6XyKuMORA69yxfn/yXFzdgUJb1c+le+B2YUitCVZhIlaMwTXromuDQvPM44vvpMgUzOO7gO+gV35In7vyuT51eIj1vRomgp61NHDHtFfnI7Ccfr7iy5GCD/RH+eoT6mY45ECmTFIV7V6FvcgVxOb74abf6U7QQdSZ1AsJi0/sjY0ngwC/oUlhkOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiFaeIDLh79VwPqJZ6Bg3Yz97YwIqucHSzCwcrPkdWs=;
 b=fjxKzCzB0UJLLXCEltkot+yh69D5eeMi9FEYx8IGgGSRqnTHAI5IsxsBKmVnK6kJfAk99J72le3rG+4Y5uIFbZ40J8KU/Hexz43DimaTEkzHgvr7hhsmCTeHm8SF6CFth8ujgx5qcLHK1wGPRJOh6rBfvh37U0ZAByl5odlL5m2qaVlk6c2aEGjEB130YswIA5rbLN/pDsIWOK6Mr4SW1EdrQAwbFOQ/a0Mwted6DIzWRLfjyf72DUayW6X/KFH+SHyHebNjaJGnjx3D7qNNDDNDm0pjWJHAsnNg9pMHIlTYGGkZ5VVaRLtqppTSG3twOoKDsKmVOvh+88wrVnygjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1635.namprd12.prod.outlook.com (10.172.17.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Thu, 26 Sep 2019 12:26:02 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2284.023; Thu, 26 Sep
 2019 12:26:02 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Topic: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma'
 workaround for navi
Thread-Index: AQHVdEGHm0iocdCUOEuYheblhNg2q6c9mpfzgABH1KQ=
Date: Thu, 26 Sep 2019 12:26:01 +0000
Message-ID: <BN6PR12MB1809591CB4102B70BEC82E93F7860@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190926080746.20765-1-xiaojie.yuan@amd.com>,
 <BN8PR12MB36027CA5662543E7F956657589860@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB36027CA5662543E7F956657589860@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0706414-ec25-41a2-ec74-08d7427cb1b0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1635; 
x-ms-traffictypediagnostic: BN6PR12MB1635:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1635E8A47559F51653850317F7860@BN6PR12MB1635.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(199004)(189003)(99286004)(26005)(76176011)(110136005)(7696005)(5660300002)(186003)(4326008)(25786009)(102836004)(7736002)(53546011)(6506007)(74316002)(229853002)(478600001)(14444005)(86362001)(256004)(71190400001)(71200400001)(66446008)(33656002)(8936002)(76116006)(64756008)(66556008)(66476007)(476003)(66946007)(486006)(105004)(9686003)(66066001)(19627405001)(55016002)(446003)(11346002)(81166006)(14454004)(6116002)(52536014)(3846002)(316002)(6246003)(81156014)(8676002)(6436002)(2906002)(2501003)(54896002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1635;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1iVhc3l6Ze7GLWGYsRsO4Qe2tqthFNwcWXIMQ3Hi1qaedE57LKwbbQsza1/Gja3hEKcMCfw1uHzSvXv6F4AcdCY2BhqJVvjYPtzslAKYswH9XmYUsukCDmBpk+FoXGgYp//im3dtuJJa31KaadQ53//fJLfjfv0PQ6EeoCErpVGsiy7W1TpOYeZ7jkEW+irnLzHDj+JN2pniDenBxypnuKgLop/fCcuFAJQ3Sjhx4sAioj/dFRx5TGyCpOBJBRmukD7Ud5a0M5fpxMV19a/XSyQNieh2LMCWtju/FgtDngO2Y1k+VMzVQmtZQT5LXkdkH3t316Smvga8SfOFSW9Tu/lNo+jIL95ZTTknpiv/REr3OU+rrMSIuJXBmYXg96oWaOvBP9vGcJriR5K32zvfYC0GpFsMlmz40nmTtAqTAXM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0706414-ec25-41a2-ec74-08d7427cb1b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 12:26:01.9215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EO+YCZzgkZgqk9yb6PwKHgoAfa7ayhbxvcrXp+tYrJHClcsY9RP+DBTXT3asDyn4yOmdMarp/B2sPv+visMbiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1635
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiFaeIDLh79VwPqJZ6Bg3Yz97YwIqucHSzCwcrPkdWs=;
 b=u9GmYGN1Y9Js4cvkEs596ummHhm2/tPNe7paohXu9rT6BzNNGM3LWHdh+5QCFNZEN1/uZTLP3xKWdpNOHtcFumTs3YoCvgVooxV/qFVB1F6tmHWAKnkHmx/NZrRFJ5e1wfrAufxHmHOVleyWJi+suGWwuZYEPxQeBkhE965I218=
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
Cc: "alexdeucher@gmail.com" <alexdeucher@gmail.com>
Content-Type: multipart/mixed; boundary="===============0577031306=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0577031306==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809591CB4102B70BEC82E93F7860BN6PR12MB1809namp_"

--_000_BN6PR12MB1809591CB4102B70BEC82E93F7860BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please add a patch description.  With that fixed:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Yuan, Xi=
aojie <Xiaojie.Yuan@amd.com>
Sent: Thursday, September 26, 2019 4:09 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: alexdeucher@gmail.com <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma' w=
orkaround for navi

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


--_000_BN6PR12MB1809591CB4102B70BEC82E93F7860BN6PR12MB1809namp_
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
Please add a patch description.&nbsp; With that fixed:<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Yuan, Xiaojie &lt;Xiaojie.Yua=
n@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 4:09 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> alexdeucher@gmail.com &lt;alexdeucher@gmail.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from =
sdma' workaround for navi</font>
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
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
Hi Alex,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
This patch is to add the asic_type check which is missing after drm-next br=
anch rebase.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
BR,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
Xiaojie<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Yuan, Xiaojie &lt;X=
iaojie.Yuan@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 4:08 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> alexdeucher@gmail.com &lt;alexdeucher@gmail.com&gt;; Yuan, Xiaoj=
ie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amdgpu/gmc10: apply the 'invalidation from sdma=
' workaround for navi</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Fixes: 767acabdac81 (&quot;drm/amd/powerplay: ad=
d baco smu reset function for smu11&quot;)<br>
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
</div>
</body>
</html>

--_000_BN6PR12MB1809591CB4102B70BEC82E93F7860BN6PR12MB1809namp_--

--===============0577031306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0577031306==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DCBB63BE
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 14:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7953E6EF2F;
	Wed, 18 Sep 2019 12:56:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam05on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe52::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 062246EF31
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 12:56:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jl7FoZm+Xc4OBMaj0II14iI4S306yiY1ManXnJ4nsIBPWCMtdiX68QuxvymgxUe011DJRz+egjsE/D3kt9XaBoyziX1wgf2IOFKEbASImasZbFLrVWwZyzWVrtoBqxdXMIaQP2F7FoHfn43rPxlkFrxdvg/YiNu0kVMgZoIW3l2svFtgpbR2U7SEj/G02XzR9kDAK444y13Dz+7N3J/CGL8PfsYQM4M85ooqFJXjluDUjWv3LrQCQYZzDkTnDk7yjWR0OWmq1zDxbi3UhTZxq/qEVppkz0WAkE8DbM6GvS7wb5QlEo5+sCXdhmF8XLas97jeO69Gf18+s8LJaRVJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADZKTJZkjIniwytAuamSSGi9p0xKNX2aItpxrGT2KOM=;
 b=d8JiKmzwsFI78bVUd09qL+4d57Bnn/RqxIl4EglU0Zb9jlN/3s7SJJSVQ/QouTgg7f9zVfTgoHScGosiZFSsvetwJaprkwIPq1eRW62SDZYsUSjderHxduxsrphBm+FWkt9RzGFrqiy4l83SD2yoe1EsKUr2m8Q5vR0Z/joed5YMufUlVU6vWw/xtIGdo/UJLgBThUjhYYb2RXUt3cCTtDWgDjIonM46DGfzN5YrY7viip2nnOhZi1IwqfW2lWUuBpbphhNn/tFXnecX9ri7pZ2QeEX3XCJJFXafiDKMPBcak5MCoYenBCCfFJt3p+vg/pspgT/qC6/LrPg3s0AqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1713.namprd12.prod.outlook.com (10.175.101.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Wed, 18 Sep 2019 12:56:56 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.023; Wed, 18 Sep
 2019 12:56:56 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu/gfx10: update gfx golden settings for
 navi14
Thread-Topic: [PATCH 2/2] drm/amdgpu/gfx10: update gfx golden settings for
 navi14
Thread-Index: AQHVbgwP02Nxb16JH0uk2WG8d+bez6cxZO29
Date: Wed, 18 Sep 2019 12:56:56 +0000
Message-ID: <BN6PR12MB18094B6AC15AC808B26A3503F78E0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190918103000.5606-1-tianci.yin@amd.com>,
 <20190918103000.5606-2-tianci.yin@amd.com>
In-Reply-To: <20190918103000.5606-2-tianci.yin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.56.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0103dd0-c8a6-4d93-6b8b-08d73c37afbe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1713; 
x-ms-traffictypediagnostic: BN6PR12MB1713:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB171323CC40BE38C280B4102AF78E0@BN6PR12MB1713.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:475;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(199004)(189003)(2906002)(8676002)(66066001)(606006)(6246003)(110136005)(316002)(33656002)(6436002)(55016002)(6306002)(54896002)(86362001)(9686003)(236005)(229853002)(4326008)(2501003)(66476007)(74316002)(25786009)(64756008)(478600001)(19627405001)(66946007)(66446008)(81156014)(8936002)(81166006)(966005)(14454004)(3846002)(6116002)(53546011)(7696005)(76176011)(186003)(26005)(76116006)(486006)(6506007)(11346002)(446003)(476003)(7736002)(66556008)(15650500001)(102836004)(71200400001)(5660300002)(99286004)(52536014)(105004)(14444005)(256004)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1713;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Rdpk7V2UqQSz8NOVHNuVbPQRuNIZeAIHAQSvkSksD9e0/4z4HmdpkAfRMjEifmaFC9pFIOM4E4NzSFh47XN3K3oBmmPG3mFu+S/2fBsU/fnEc8ZKSvuwMkaqYGB05txj2MER6CqGRWABp8umgoeafaFRmNtFXuNGwexjgrRqF6T8b1Nci2CMTIkeRlPNPaS5xbMruSrh42WmyIPADA4CZHv9PsOoc0eA5cV2Yci0FKNcRNGLCocUmJvi1O+05YuB8ghBGxKRirxShZCyade4qA1sHFCX9jnYJTleoQZ4++eyAAFcuz3M/NGeobgKUSJTBF0qpPwdfXc/V8+1G+cSrSvj7NVOoiY5NyhMSYVaIdsA9CcZ8PfJ6O6T3NQM8yyr7Qd6prCZ+AE/jE29T1/qNwOZT6K5nQv7fNOphOB4rAA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0103dd0-c8a6-4d93-6b8b-08d73c37afbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 12:56:56.4455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQKwH2/cUxegOduoXFPOe2otXYXbhaNSM9/Bd8XRd/GitSHAUMuf5yIC5DgKtJfuF+0Jdk1pyJ241xSUzg1eBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1713
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADZKTJZkjIniwytAuamSSGi9p0xKNX2aItpxrGT2KOM=;
 b=kjQcFbFD3Is3qi39jDZ61lYLgS5CVR1TStcsw89hhipDPcQ7/x3G1iCh2BItlzXYEM452peBg+XLYBRukl0Y+/gpIvD/wRKTP9QP0iFjmRCKF0UZKAyMhh9HgrMxoCzfVhMtP5epdPbWZ9yDiUsY6qN5wQboekFRB7Xt2zvsJHA=
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
Cc: "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0318857600=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0318857600==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18094B6AC15AC808B26A3503F78E0BN6PR12MB1809namp_"

--_000_BN6PR12MB18094B6AC15AC808B26A3503F78E0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Tianci Y=
in <tianci.yin@amd.com>
Sent: Wednesday, September 18, 2019 6:30 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; Zhang, Hawking <Hawking.Zhang@=
amd.com>
Subject: [PATCH 2/2] drm/amdgpu/gfx10: update gfx golden settings for navi1=
4

From: "Tianci.Yin" <tianci.yin@amd.com>

update registers: mmUTCL1_CTRL

Change-Id: I6df12555b72ba6faa926af8155b3f079e422a500
Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c
index 7901530d07f0..121824b47d02 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -161,7 +161,7 @@ static const struct soc15_reg_golden golden_settings_gc=
_10_1_1[] =3D
         SOC15_REG_GOLDEN_VALUE(GC, 0, mmSQ_LDS_CLK_CTRL, 0xffffffff, 0xfff=
fffff),
         SOC15_REG_GOLDEN_VALUE(GC, 0, mmTA_CNTL_AUX, 0xfff7ffff, 0x0103000=
0),
         SOC15_REG_GOLDEN_VALUE(GC, 0, mmTCP_CNTL, 0x60000010, 0x479c0010),
-       SOC15_REG_GOLDEN_VALUE(GC, 0, mmUTCL1_CTRL, 0x00800000, 0x00800000)=
,
+       SOC15_REG_GOLDEN_VALUE(GC, 0, mmUTCL1_CTRL, 0x00c00000, 0x00c00000)=
,
 };

 static const struct soc15_reg_golden golden_settings_gc_10_1_nv14[] =3D
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18094B6AC15AC808B26A3503F78E0BN6PR12MB1809namp_
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
Series is:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Tianci Yin &lt;tianci.yin@amd=
.com&gt;<br>
<b>Sent:</b> Wednesday, September 18, 2019 6:30 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; Zhang, Hawking &l=
t;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amdgpu/gfx10: update gfx golden settings fo=
r navi14</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.co=
m&gt;<br>
<br>
update registers: mmUTCL1_CTRL<br>
<br>
Change-Id: I6df12555b72ba6faa926af8155b3f079e422a500<br>
Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c<br>
index 7901530d07f0..121824b47d02 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
@@ -161,7 &#43;161,7 @@ static const struct soc15_reg_golden golden_setting=
s_gc_10_1_1[] =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOC15_REG_GOLDEN_VALUE(GC,=
 0, mmSQ_LDS_CLK_CTRL, 0xffffffff, 0xffffffff),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOC15_REG_GOLDEN_VALUE(GC,=
 0, mmTA_CNTL_AUX, 0xfff7ffff, 0x01030000),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOC15_REG_GOLDEN_VALUE(GC,=
 0, mmTCP_CNTL, 0x60000010, 0x479c0010),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOC15_REG_GOLDEN_VALUE(GC, 0, mmUTCL1=
_CTRL, 0x00800000, 0x00800000),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOC15_REG_GOLDEN_VALUE(GC, 0, mmU=
TCL1_CTRL, 0x00c00000, 0x00c00000),<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;static const struct soc15_reg_golden golden_settings_gc_10_1_nv14[] =
=3D<br>
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

--_000_BN6PR12MB18094B6AC15AC808B26A3503F78E0BN6PR12MB1809namp_--

--===============0318857600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0318857600==--

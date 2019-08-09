Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0D87881
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 13:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAA56ED9E;
	Fri,  9 Aug 2019 11:29:53 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810088.outbound.protection.outlook.com [40.107.81.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598766EDAD
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 11:29:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwzvsyUAxpSewowZuGg/Kt3ZKopjEIFDPbQ0KQIUvPrTjXbuGPPrbheXd/f/NG9QgQiYoymdAIX3MndDNtOtM9X5icwWyqxlRRikzNzdkKLko4ifdIHmw7Yl/QQsckbMQpl80Q/+yGMnMMXUH1Iu6jmmESptoVwpgEkAeY7Zq3rzQ2DCSV0cneGeYBd/dc099ivVKHMdQIv2t2TzZFlPGpzgV6/5Nyaz4cgVCSP3+MxyJhBOWv+TFGfRwGRVjjDudfGybP3k84+62BRoVlCi+hWo2k8kxfHY+/eVEVMvAMVEZ/VauEkLMogh+t9KwtQ39SZrsJvYMeCtkCuUfORMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myLygoYg4Ty6zOUEYqj8E0CbYUJzsXTJuo1IiHZSvho=;
 b=h1b7/7AMGrpiFYvDzTzo6nGa0VymYVfNvmMSI2RN95+vCu7HtwCKRmbZnvKscj1g/QAytdGCkwgc/8/Z0e6XIAgWD1oxjnUwmd0T9jcJ4hmFWChfLV+2C+a7+mJYRrF3QLT2AwkIDeud3AS7x1pePkyaoloj3DbFAj9Na/XQz3IQ5mGN8AZOmSRhh8i785sYoqTtpwT6yq0xTWj2N7IOa4MnVyWuA8fppfzMpXeoe5SryHqzYflCnoVE3ouQIxWaS/unbX2qRU4K4F4zm3yribfMhGLvoww3C5+w/ZePUoqNA86v9WS3J051ePW08pejgLSCo5hZUTIEr5zQdwTF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB2911.namprd12.prod.outlook.com (20.179.80.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 9 Aug 2019 11:29:50 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.011; Fri, 9 Aug 2019
 11:29:50 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Ma, Le" <Le.Ma@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/amdgpu: increase CGCG gfx idle threshold for
 Arcturus
Thread-Topic: [PATCH 2/4] drm/amdgpu: increase CGCG gfx idle threshold for
 Arcturus
Thread-Index: AQHVTqVs0kmYsHE9FU+iWDXfgYYThKbyrjLS
Date: Fri, 9 Aug 2019 11:29:50 +0000
Message-ID: <MN2PR12MB32966EB4702ACF4053F7ED31A2D60@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1565350016-7071-1-git-send-email-le.ma@amd.com>,
 <1565350016-7071-2-git-send-email-le.ma@amd.com>
In-Reply-To: <1565350016-7071-2-git-send-email-le.ma@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cd756d0-f0ab-4f9b-2bc8-08d71cbce486
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2911; 
x-ms-traffictypediagnostic: MN2PR12MB2911:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2911F9D4B3FD63062B65A084A2D60@MN2PR12MB2911.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 01244308DF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(189003)(199004)(81156014)(53936002)(486006)(6306002)(86362001)(9686003)(236005)(54896002)(105004)(6116002)(966005)(52536014)(5660300002)(8676002)(81166006)(8936002)(14454004)(19627405001)(446003)(11346002)(2501003)(476003)(33656002)(66066001)(102836004)(14444005)(186003)(55016002)(2906002)(256004)(26005)(6246003)(7736002)(6506007)(76176011)(478600001)(7696005)(74316002)(99286004)(25786009)(71200400001)(71190400001)(53546011)(606006)(110136005)(316002)(3846002)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(6436002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2911;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BvsjB4fIFLfrzu4+K63T0QolUVzf5vOvcMSq+u5GdqZSkpMGXzZ5N2PI6/7tdKaiD07U7AxOKH4ctWDhcPDYgrBGZVpWP3Ai666VJRZJZQK5+T6Q3QJMMo16GN+MEJD/FXxM/2vmJmsDnfuZ4xmA7kmvGs/nFGj2RrLrK4Di2JYf/Y05LZP5kz4fEYo3vKTVOdSFonZdpCnG1nxCJgK8Jy6xmn9i8bb8zBXVV/ZY730a/JuaT+obrfE2HUvAOeqSbcToGvktrNWzqbulGSisSydLO5ChItJZH2JFDvaPXJ2d4IJ8QbJmM2rM0nkHYuRXske9QaRWJLDSVm3i2008PN4yXGPH5MpUdFroTw1uUtAVfQVzzobxGzzrToWVMwLZtNIaZ/O9ADo9VaeZcBsvH+PzI+EISCU3Nn0SnkfayX4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cd756d0-f0ab-4f9b-2bc8-08d71cbce486
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2019 11:29:50.8003 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tjv810eKuiMeA3+/rxtExVizirHpgml++QAlcwd9N/e3HTGIMGmTXBunfcpLRC/H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2911
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myLygoYg4Ty6zOUEYqj8E0CbYUJzsXTJuo1IiHZSvho=;
 b=EbdkvviiGtoG8vGKoLfkT0wflVztrwyu9J48psRFClITRRt85PBwXE+TnSP8eikucOaVpUad9jiOMIi5qUBN+TAVIUjfmTlpgQsT403BMWa2ZoMcecmPKaaAgFhAt0Gus12pZNW5NJqM1zLiFdwpXgzZL/Jw2AZdvCveCa4/unI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1789143881=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1789143881==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32966EB4702ACF4053F7ED31A2D60MN2PR12MB3296namp_"

--_000_MN2PR12MB32966EB4702ACF4053F7ED31A2D60MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Le Ma <l=
e.ma@amd.com>
Sent: Friday, August 9, 2019 7:26 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Ma, Le <Le.Ma@amd.com>
Subject: [PATCH 2/4] drm/amdgpu: increase CGCG gfx idle threshold for Arctu=
rus

Follow the hw spec, and no need to consider gfxoff on Arcturus

Change-Id: Ib9cad79b1b9c096014447fc0a7d29cdb594e15e3
Signed-off-by: Le Ma <le.ma@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gfx_v9_0.c
index 78150ff..9b85a73 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -4677,8 +4677,12 @@ static void gfx_v9_0_update_coarse_grain_clock_gatin=
g(struct amdgpu_device *adev
                 /* enable cgcg FSM(0x0000363F) */
                 def =3D RREG32_SOC15(GC, 0, mmRLC_CGCG_CGLS_CTRL);

-               data =3D (0x36 << RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESHO=
LD__SHIFT) |
-                       RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;
+               if (adev->asic_type =3D=3D CHIP_ARCTURUS)
+                       data =3D (0x2000 << RLC_CGCG_CGLS_CTRL__CGCG_GFX_ID=
LE_THRESHOLD__SHIFT) |
+                               RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;
+               else
+                       data =3D (0x36 << RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE=
_THRESHOLD__SHIFT) |
+                               RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;
                 if (adev->cg_flags & AMD_CG_SUPPORT_GFX_CGLS)
                         data |=3D (0x000F << RLC_CGCG_CGLS_CTRL__CGLS_REP_=
COMPANSAT_DELAY__SHIFT) |
                                 RLC_CGCG_CGLS_CTRL__CGLS_EN_MASK;
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32966EB4702ACF4053F7ED31A2D60MN2PR12MB3296namp_
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
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgb(255, 255, 255); display: inline !important">Reviewed-by: Kevi=
n Wang &lt;kevin1.wang@amd.com&gt;</span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Le Ma &lt;le.ma@amd.com&gt;<b=
r>
<b>Sent:</b> Friday, August 9, 2019 7:26 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Ma, Le &lt;Le.Ma@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/4] drm/amdgpu: increase CGCG gfx idle threshold fo=
r Arcturus</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Follow the hw spec, and no need to consider gfxoff=
 on Arcturus<br>
<br>
Change-Id: Ib9cad79b1b9c096014447fc0a7d29cdb594e15e3<br>
Signed-off-by: Le Ma &lt;le.ma@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 8 &#43;&#43;&#43;&#43;&#43;&#=
43;--<br>
&nbsp;1 file changed, 6 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/am=
dgpu/gfx_v9_0.c<br>
index 78150ff..9b85a73 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c<br>
@@ -4677,8 &#43;4677,12 @@ static void gfx_v9_0_update_coarse_grain_clock_g=
ating(struct amdgpu_device *adev<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* enable cgcg FSM(0x0000363F) */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; def =3D RREG32_SOC15(GC, 0, mmRLC_CGCG_CGLS_CTRL);<br=
>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; data =3D (0x36 &lt;&lt; RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESH=
OLD__SHIFT) |<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RLC_CGCG_CGLS_CT=
RL__CGCG_EN_MASK;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;asic_type =3D=3D CHIP_ARCTURUS)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D (0x=
2000 &lt;&lt; RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESHOLD__SHIFT) |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D (0x=
36 &lt;&lt; RLC_CGCG_CGLS_CTRL__CGCG_GFX_IDLE_THRESHOLD__SHIFT) |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RLC_CGCG_CGLS_CTRL__CGCG_EN_MASK;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (adev-&gt;cg_flags &amp; AMD_CG_SUPPORT_GFX_CGLS)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =
|=3D (0x000F &lt;&lt; RLC_CGCG_CGLS_CTRL__CGLS_REP_COMPANSAT_DELAY__SHIFT) =
|<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RLC_CGCG_CGLS_CTRL__CGLS_EN_MASK=
;<br>
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

--_000_MN2PR12MB32966EB4702ACF4053F7ED31A2D60MN2PR12MB3296namp_--

--===============1789143881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1789143881==--

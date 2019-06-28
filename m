Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C8759D3D
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 15:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535DE6E925;
	Fri, 28 Jun 2019 13:53:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790059.outbound.protection.outlook.com [40.107.79.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F056E925
 for <amd-gfx@lists.freedesktop.org>; Fri, 28 Jun 2019 13:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=V3orLZvi8/3F5iGD4zWkyy8VGigL+2pgXaAOQbAG0hCkaWm9aK9DjxrXLQCOaV/Je2D9p0gZ0lGpoJrlOO/cJYmlpYGjDHx6ilZ18uOPbCzs8orIJVUDgjacUad7hgBuD3gizukguw8uc6Zh33LlKRp2e2973aDdxWfghXVJfoE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2O60gycGmIjzU4eEqM6px65uKzS9AXXp9r3teumHVOU=;
 b=qEGIPhcK6DdK7hbpLxMzXFno4NHxhU1Ir3FQDsDchGmukUxSErQcnFdt/VDENoK+o6O3qbL1LkdnZLBoZf++o+k2BV0zag7Oo2kM5v+3ChmMwdFvexqUGMgvrk3oe8o2Zqpg21QyhO2fuxmNddoHW89RXARbpIPM/oapCZdM9RA=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) by
 DM6PR12MB3163.namprd12.prod.outlook.com (20.179.104.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 13:53:00 +0000
Received: from DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25]) by DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25%2]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 13:53:00 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: use hardware fan control if no
 powerplay fan table
Thread-Topic: [PATCH] drm/amd/powerplay: use hardware fan control if no
 powerplay fan table
Thread-Index: AQHVLV/EOLZuOzbE1UaPtftH/CU+TKaxFrbQ
Date: Fri, 28 Jun 2019 13:53:00 +0000
Message-ID: <DM6PR12MB3209FB0AAB01FA130E94FDE2FEFC0@DM6PR12MB3209.namprd12.prod.outlook.com>
References: <20190628031529.12017-1-evan.quan@amd.com>
In-Reply-To: <20190628031529.12017-1-evan.quan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 768e9142-f9f0-4494-15b3-08d6fbcfeede
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3163; 
x-ms-traffictypediagnostic: DM6PR12MB3163:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB31638E8D3001B04A131029D4FEFC0@DM6PR12MB3163.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:419;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(366004)(136003)(376002)(199004)(189003)(102836004)(33656002)(53936002)(8676002)(8936002)(66066001)(81156014)(6246003)(81166006)(316002)(68736007)(99286004)(76176011)(7696005)(5660300002)(6436002)(71190400001)(71200400001)(25786009)(7736002)(256004)(14444005)(76116006)(110136005)(66476007)(66946007)(236005)(73956011)(91956017)(64756008)(74316002)(478600001)(66446008)(66556008)(86362001)(55016002)(2501003)(3846002)(11346002)(476003)(446003)(54896002)(6306002)(53546011)(186003)(486006)(2906002)(6506007)(14454004)(72206003)(26005)(229853002)(966005)(606006)(52536014)(6606003)(19627405001)(9686003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3163;
 H:DM6PR12MB3209.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +Ka7HMFoPQlLF2jEnutG49pajVhNuT+GaBb4cYbHbA6TTayCrMUu0AKEzB33iikTodP5ToPGBtTn1htygqIG9wTeYLCk9W15zwZZk2B0uyPrILPuMC/sU5o64oAXu4p2XDmxX+yw7D85TKicndxIpY6bOtJy3NrRtkhk2AB+OB0W9Vf2R/RE66YC2FRlfBidPqF5fZJqTtidrQNPTRYDNd6EFiuEFOaZaOXb7j/lPH5p/b8lY1hVrp5/wsmLRZdSubeER//UIkXGqXlh1R2Va3AmssrzQMYzShdbx8cEbAaTkqQvE0ra+c9LE7UEiLRugC/DYpyUgzeRym5ky/ZemX3a3sepiZe9CaiUtvIfxwvSR48XCUg3cbUfc+QgkKmZFo77mhxiQtM8hwr3fjSCZ3Ufi2b/e7jSHOfgKoVWjUo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768e9142-f9f0-4494-15b3-08d6fbcfeede
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 13:53:00.1829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3163
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2O60gycGmIjzU4eEqM6px65uKzS9AXXp9r3teumHVOU=;
 b=Hrwx4GVe+dkiMWnrQ8zOBjffJ91jKrU1phxICGuGZx/WP+o/NO0TI1Y1q8t5Png1aR4stF3kmqNM7NqGqNscD4htru0zolGU383ihbek0D1Rb6GoFxvvzzIuk9mh/wSK4ZrCksS72FLjfe/MdCPlbmzaCmu6rps5nlnqzOTldN4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Slava.Abramov@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============2082301117=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2082301117==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB3209FB0AAB01FA130E94FDE2FEFC0DM6PR12MB3209namp_"

--_000_DM6PR12MB3209FB0AAB01FA130E94FDE2FEFC0DM6PR12MB3209namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Tested-by: Slava Abramov <slava.abramov@amd.com>

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Thursday, June 27, 2019 11:15:29 PM
To: amd-gfx@lists.freedesktop.org
Cc: Quan, Evan
Subject: [PATCH] drm/amd/powerplay: use hardware fan control if no powerpla=
y fan table

Use SMC default fan table if no external powerplay fan table.

Change-Id: Icd7467a7fc5287a92945ba0fcc19699192b1683a
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c | 4 +++-
 drivers/gpu/drm/amd/powerplay/inc/hwmgr.h                   | 1 +
 drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c     | 4 ++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c b/=
drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c
index ae64ff7153d6..1cd5a8b5cdc1 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c
@@ -916,8 +916,10 @@ static int init_thermal_controller(
                         PHM_PlatformCaps_ThermalController
                   );

-       if (0 =3D=3D powerplay_table->usFanTableOffset)
+       if (0 =3D=3D powerplay_table->usFanTableOffset) {
+               hwmgr->thermal_controller.use_hw_fan_control =3D 1;
                 return 0;
+       }

         fan_table =3D (const PPTable_Generic_SubTable_Header *)
                 (((unsigned long)powerplay_table) +
diff --git a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h b/drivers/gpu/drm/am=
d/powerplay/inc/hwmgr.h
index 2f186fcbdfc5..ec53bf24396e 100644
--- a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
+++ b/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h
@@ -697,6 +697,7 @@ struct pp_thermal_controller_info {
         uint8_t ucType;
         uint8_t ucI2cLine;
         uint8_t ucI2cAddress;
+       uint8_t use_hw_fan_control;
         struct pp_fan_info fanInfo;
         struct pp_advance_fan_control_parameters advanceFanControlParamete=
rs;
 };
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c b/driv=
ers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
index fbac2d3326b5..a1a9f6196009 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c
@@ -2092,6 +2092,10 @@ static int polaris10_thermal_setup_fan_table(struct =
pp_hwmgr *hwmgr)
                 return 0;
         }

+       /* use hardware fan control */
+       if (hwmgr->thermal_controller.use_hw_fan_control)
+               return 0;
+
         tmp64 =3D hwmgr->thermal_controller.advanceFanControlParameters.
                         usPWMMin * duty100;
         do_div(tmp64, 10000);
--
2.21.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB3209FB0AAB01FA130E94FDE2FEFC0DM6PR12MB3209namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0">Tested-by: Slava Abramov &lt;slav=
a.abramov@amd.com&gt;</p>
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;=
Segoe UI Emoji&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;An=
droid Emoji&quot;, EmojiSymbols; font-size: 16px;">Acked-by: Slava Abramov =
&lt;slava.abramov@amd.com&gt;</span><br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Thursday, June 27, 2019 11:15:29 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Quan, Evan<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: use hardware fan control if no p=
owerplay fan table</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Use SMC default fan table if no external powerplay=
 fan table.<br>
<br>
Change-Id: Icd7467a7fc5287a92945ba0fcc19699192b1683a<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c | 4 &#43;=
&#43;&#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/inc/hwmgr.h&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c&nbsp;&nbsp;&n=
bsp;&nbsp; | 4 &#43;&#43;&#43;&#43;<br>
&nbsp;3 files changed, 8 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c b/=
drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c<br>
index ae64ff7153d6..1cd5a8b5cdc1 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/process_pptables_v1_0=
.c<br>
@@ -916,8 &#43;916,10 @@ static int init_thermal_controller(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PHM_P=
latformCaps_ThermalController<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; );<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (0 =3D=3D powerplay_table-&gt;usFa=
nTableOffset)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (0 =3D=3D powerplay_table-&gt;=
usFanTableOffset) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; hwmgr-&gt;thermal_controller.use_hw_fan_control =3D 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fan_table =3D (const PPTab=
le_Generic_SubTable_Header *)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; (((unsigned long)powerplay_table) &#43;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h b/drivers/gpu/drm/am=
d/powerplay/inc/hwmgr.h<br>
index 2f186fcbdfc5..ec53bf24396e 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/hwmgr.h<br>
@@ -697,6 &#43;697,7 @@ struct pp_thermal_controller_info {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t ucType;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t ucI2cLine;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t ucI2cAddress;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t use_hw_fan_control;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pp_fan_info fanInfo=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pp_advance_fan_cont=
rol_parameters advanceFanControlParameters;<br>
&nbsp;};<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c b/driv=
ers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c<br>
index fbac2d3326b5..a1a9f6196009 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smumgr/polaris10_smumgr.c<b=
r>
@@ -2092,6 &#43;2092,10 @@ static int polaris10_thermal_setup_fan_table(str=
uct pp_hwmgr *hwmgr)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* use hardware fan control */<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hwmgr-&gt;thermal_controller.=
use_hw_fan_control)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return 0;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp64 =3D hwmgr-&gt;therma=
l_controller.advanceFanControlParameters.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; usPWM=
Min * duty100;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_div(tmp64, 10000);<br>
-- <br>
2.21.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB3209FB0AAB01FA130E94FDE2FEFC0DM6PR12MB3209namp_--

--===============2082301117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2082301117==--

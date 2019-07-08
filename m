Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCCB623BF
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 17:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E33A89E1A;
	Mon,  8 Jul 2019 15:38:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9058189E1A
 for <amd-gfx@lists.freedesktop.org>; Mon,  8 Jul 2019 15:38:34 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1476.namprd12.prod.outlook.com (10.172.24.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Mon, 8 Jul 2019 15:38:30 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 15:38:30 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Thread-Topic: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi
Thread-Index: AQHVMbHtZ500r20vQEyS1Hly2nkk36bA4QiAgAABVsA=
Date: Mon, 8 Jul 2019 15:38:29 +0000
Message-ID: <BN6PR12MB180928A19CDDBF2845F07BA7F7F60@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190703151341.5916-1-alexander.deucher@amd.com>,
 <20190703151341.5916-2-alexander.deucher@amd.com>,
 <BN8PR12MB36027C3FF20B1FAD06119E2D89F60@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB36027C3FF20B1FAD06119E2D89F60@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.77.97]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b275825-bf6b-4d3e-43b8-08d703ba53c3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1476; 
x-ms-traffictypediagnostic: BN6PR12MB1476:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1476BA116D76604539885CCAF7F60@BN6PR12MB1476.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(199004)(189003)(53936002)(66556008)(52536014)(54896002)(74316002)(2906002)(6306002)(236005)(6246003)(5660300002)(9686003)(66066001)(71200400001)(72206003)(606006)(966005)(81156014)(81166006)(68736007)(25786009)(71190400001)(8936002)(478600001)(8676002)(64756008)(53546011)(76116006)(256004)(11346002)(55016002)(66946007)(476003)(486006)(6436002)(73956011)(446003)(66446008)(3846002)(6116002)(229853002)(14444005)(66476007)(186003)(26005)(2501003)(86362001)(105004)(316002)(110136005)(102836004)(7736002)(7696005)(6506007)(99286004)(76176011)(14454004)(19627405001)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1476;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tecwvlvIjmCTsnQAcVjyQpgWfQtN0DMC2TSDP4gTjJMFFRlDgiXhgw7rr7OQwooKNiQC0pqZVyvBQv0HYSKcdVGxDC90vQPbC7zdx5HbxFR1d7Z/xBIC4lK9gLbtC9XDEl/PYKZ/zjQlzwZSGJhYvcnr9cV7iu7SfilWKbhj/kVYeyjBOCDaMlG/yfwSJu87KuiOeTfdcdgvBalG3hvDSMC3b36I5GISsU/Fjs1GWLHMGJu3tTJkWuvSLNzoRStiKGR0J6seYH+YdjiRS3JiQcFnOfFwblyUyw8bplu4csonPvQfYQqT+ILDzEchIsBni5ZzYty+4yzUlO6PGvh98ZOgJAks2dTNiycNtEAYYA2N0hb+y7IKKHCz7Evgiy69BDcwv5BDHHLPkUzOd73vcSOxg7INN8/VeG+2bTt+clw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b275825-bf6b-4d3e-43b8-08d703ba53c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 15:38:29.9141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1476
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvC+Uo3Tc4uzsC83RkFq17Ptpy74P7S8+Nt1wUTTrF8=;
 b=fCSMFkXAHFTIW8xSzGvQPcjce3INEl9IVv6afI2/lIDVnAZBcJ32+NJ9Bd/yLVPIdruZDrwYwyb04bDZLi9UUP8ImER2wuaMQJBPiYT53QI9YZSI1tklPZ7pfryr5QeIX0NQtfemPOXPIwlXdj/F5+Aumj6StxFBZRzIaSvQ8/M=
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
Content-Type: multipart/mixed; boundary="===============0800446377=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0800446377==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB180928A19CDDBF2845F07BA7F7F60BN6PR12MB1809namp_"

--_000_BN6PR12MB180928A19CDDBF2845F07BA7F7F60BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

auto just means do the right thing for each asic.  For example, if there is=
 a new asic program and the discovery tables are not available yet, for tha=
t program, auto means don't use the discovery table.  For other programs wh=
ere the table is available (e.g., navi10 and 14), then auto means use the t=
able.

Alex
________________________________
From: Yuan, Xiaojie
Sent: Monday, July 8, 2019 11:31 AM
To: Alex Deucher; amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander
Subject: Re: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi

Hi Alex,

I see there are many 'auto' module params for amdgpu, could you please expl=
ain about the historical intention of using value '-1'?
and shall we check 'amdgpu_discovery' against '-1' for all the code paths i=
n amdgpu_device.c and navi10_reg_init.c?

BR,
Xiaojie

________________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Alex Deu=
cher <alexdeucher@gmail.com>
Sent: Wednesday, July 3, 2019 11:13 PM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander
Subject: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi

Use the IP discovery table rather than hardcoding the
settings in the driver.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 7941a5368fb5..6f7772eeeb78 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -140,7 +140,7 @@ uint amdgpu_smu_memory_pool_size =3D 0;
 uint amdgpu_dc_feature_mask =3D 0;
 int amdgpu_async_gfx_ring =3D 1;
 int amdgpu_mcbp =3D 0;
-int amdgpu_discovery =3D 0;
+int amdgpu_discovery =3D -1;
 int amdgpu_mes =3D 0;

 struct amdgpu_mgpu_info mgpu_info =3D {
@@ -592,6 +592,7 @@ module_param_named(mcbp, amdgpu_mcbp, int, 0444);
 /**
  * DOC: discovery (int)
  * Allow driver to discover hardware IP information from IP Discovery tabl=
e at the top of VRAM.
+ * (-1 =3D auto (default), 0 =3D disabled, 1 =3D enabled)
  */
 MODULE_PARM_DESC(discovery,
        "Allow driver to discover hardware IPs from IP Discovery table at t=
he top of VRAM");
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB180928A19CDDBF2845F07BA7F7F60BN6PR12MB1809namp_
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
auto just means do the right thing for each asic.&nbsp; For example, if the=
re is a new asic program and the discovery tables are not available yet, fo=
r that program, auto means don't use the discovery table.&nbsp; For other p=
rograms where the table is available (e.g.,
 navi10 and 14), then auto means use the table.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yuan, Xiaojie<br>
<b>Sent:</b> Monday, July 8, 2019 11:31 AM<br>
<b>To:</b> Alex Deucher; amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Deucher, Alexander<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amdgpu: enable IP discovery by default =
on navi</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Alex,<br>
<br>
I see there are many 'auto' module params for amdgpu, could you please expl=
ain about the historical intention of using value '-1'?<br>
and shall we check 'amdgpu_discovery' against '-1' for all the code paths i=
n amdgpu_device.c and navi10_reg_init.c?<br>
<br>
BR,<br>
Xiaojie<br>
<br>
________________________________________<br>
From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; on behalf of Al=
ex Deucher &lt;alexdeucher@gmail.com&gt;<br>
Sent: Wednesday, July 3, 2019 11:13 PM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Deucher, Alexander<br>
Subject: [PATCH 2/2] drm/amdgpu: enable IP discovery by default on navi<br>
<br>
Use the IP discovery table rather than hardcoding the<br>
settings in the driver.<br>
<br>
Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 &#43;&#43;-<br>
&nbsp;1 file changed, 2 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 7941a5368fb5..6f7772eeeb78 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -140,7 &#43;140,7 @@ uint amdgpu_smu_memory_pool_size =3D 0;<br>
&nbsp;uint amdgpu_dc_feature_mask =3D 0;<br>
&nbsp;int amdgpu_async_gfx_ring =3D 1;<br>
&nbsp;int amdgpu_mcbp =3D 0;<br>
-int amdgpu_discovery =3D 0;<br>
&#43;int amdgpu_discovery =3D -1;<br>
&nbsp;int amdgpu_mes =3D 0;<br>
<br>
&nbsp;struct amdgpu_mgpu_info mgpu_info =3D {<br>
@@ -592,6 &#43;592,7 @@ module_param_named(mcbp, amdgpu_mcbp, int, 0444);<b=
r>
&nbsp;/**<br>
&nbsp; * DOC: discovery (int)<br>
&nbsp; * Allow driver to discover hardware IP information from IP Discovery=
 table at the top of VRAM.<br>
&#43; * (-1 =3D auto (default), 0 =3D disabled, 1 =3D enabled)<br>
&nbsp; */<br>
&nbsp;MODULE_PARM_DESC(discovery,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Allow driver to discover h=
ardware IPs from IP Discovery table at the top of VRAM&quot;);<br>
--<br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB180928A19CDDBF2845F07BA7F7F60BN6PR12MB1809namp_--

--===============0800446377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0800446377==--

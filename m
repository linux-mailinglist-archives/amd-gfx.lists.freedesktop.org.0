Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2875DEC
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 06:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762D36E87C;
	Fri, 26 Jul 2019 04:46:39 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690083.outbound.protection.outlook.com [40.107.69.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313326E87C
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 04:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEz0t2Fj5K9OMRTqeM2u/HxfE6S4/w6KkOzdD1btpUVH4vRjHUnulOeA1SWiPtCo0nokRpYKRqicAiNahqQw349iAK2PZJ+KxBqrQ7yFmX13yRsamY5d2OdrBEhnT6q2g/03oAodp19jeWth5SqrtJNZWc5jxaNgV/lF+0aiqxgHYW+LPVS1th0Goniym5eZlKRtF/W/dzqSl4S5tWoHe0NCgPN2xCFNpisQGSBCQoTviOA3zA8nZ6xSWBV7vrvqCQf/K3EGb4XQBT0nFYcGGYzt15tcdeVA1rnhdvxP0HRwutzMPcn5qXdEr3ujVnNupemNbIwESeFqa1OpERe/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6WZ7AQKlt8jgj3kCEFWC8H3Q7ZEMZHr96Mg3dc8opY=;
 b=lO9j2YYcElzgItFk0XDAIfYeZyKqvLL2LDQ6llqWJbgklCez3FNsnIWbKvKDjTHpKWtttlawehyWYSvD0MvK+gUWZ/6/7xhRWk9AIVHFA5b9Lo8V4s1DTDKor15WGk1LP9GZWAturqGZyZBWY7gvn0ZXyBlS17mZdnbfq7nC3cUmDcxQ/yb9vxUq/kvHs+/GkXa+CkXUliYFFA2hDTelxL20O+dURPESR/MN2Ze29oiJh/OGXoG5jOo+0OvOFFBaqXkP1hdLx1iATXKBhMf7Tk48A3DHZCyZ19iVCenyvdDALWlPAfz8OBQ9u3bTVyYcY6tsTSlMh5TeqmBVHzc46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4221.namprd12.prod.outlook.com (52.135.48.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 04:46:35 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::ad59:f055:2417:660f%6]) with mapi id 15.20.2094.013; Fri, 26 Jul 2019
 04:46:35 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Xu, Feifei" <Feifei.Xu@amd.com>, Alex Deucher <alexdeucher@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi
Thread-Topic: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi
Thread-Index: AQHVQ2gh9Sn+u6T1fE+haA+DxSiht6bcTDOAgAAHHUs=
Date: Fri, 26 Jul 2019 04:46:35 +0000
Message-ID: <MN2PR12MB32969739658CAE0B4E8E3DBCA2C00@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190726041041.4023-1-alexander.deucher@amd.com>,
 <MN2PR12MB3775A0024DE6CC275E1AA4AFFEC00@MN2PR12MB3775.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3775A0024DE6CC275E1AA4AFFEC00@MN2PR12MB3775.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac9a32fd-ed66-4cef-b65c-08d711843d16
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4221; 
x-ms-traffictypediagnostic: MN2PR12MB4221:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB4221407A42E8712ABA191004A2C00@MN2PR12MB4221.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(376002)(136003)(39860400002)(13464003)(189003)(199004)(8676002)(19627405001)(2906002)(7736002)(74316002)(6246003)(53936002)(76176011)(25786009)(7696005)(11346002)(105004)(68736007)(86362001)(99286004)(446003)(3846002)(486006)(9686003)(6436002)(478600001)(476003)(33656002)(66066001)(14454004)(14444005)(53546011)(71200400001)(966005)(76116006)(6116002)(6506007)(102836004)(229853002)(4326008)(6306002)(236005)(54896002)(5660300002)(66946007)(66476007)(316002)(55016002)(8936002)(81156014)(81166006)(66446008)(110136005)(64756008)(66556008)(606006)(186003)(71190400001)(2501003)(52536014)(26005)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4221;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0FoE6mlWadp5tGupFoWJtf+lu9G/h2oSIfVxdeuOU2BLnBN7A+ZJfiVOJuaTBR8JJZF+5OZMa8ymTvFHgxJqptS3itc0uTXe8aS5UJ3TmbgaWyPTeIpYFRDUOaNJVf8Hp1rx+oAU4HamKNN0VBSMnlNf1EILUQ/gSBOCcK70A4qQA1Kav79gOEAsHxBO4x67TwQCetNED8LyjGgDrzSNgsgykThgwzIuYcR56gvitQsCDzhSbpiXAMZubBAV6xehGpuwPvZ8iS7nyMbTNx6vwsxJajb0VhDy27grmBRsyrIgSoTWqJzFwBwqDTijONuIaV8Db9JCO5PchOmKHDY/AnnYqNgl+3vOHhfwZPZe80SaS3Wdq8z0UBvBqpN9o9jfthYWlK/Fz++qQ3hzn9YbDMHq0/evxPu0P0cDzeGqaro=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac9a32fd-ed66-4cef-b65c-08d711843d16
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 04:46:35.2129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4221
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6WZ7AQKlt8jgj3kCEFWC8H3Q7ZEMZHr96Mg3dc8opY=;
 b=gZmLV7E3YVi/7uUL7Ekp8oqmEl1kbiPEUrFRr36HYVguihu5IABsJ7xm5JPDo7mSbgZnzhzJ53UL35JD0PaQ6NR5tWqFjxkHEeINfvBorVLNYGnIUz/XXoJI34lRuHb3Qrig/V2QO5T9qRKdNGuV6Aa1/r6S59OCNyIEXuzDDLI=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============1779956784=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1779956784==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32969739658CAE0B4E8E3DBCA2C00MN2PR12MB3296namp_"

--_000_MN2PR12MB32969739658CAE0B4E8E3DBCA2C00MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Xu, Feif=
ei <Feifei.Xu@amd.com>
Sent: Friday, July 26, 2019 12:20 PM
To: Alex Deucher <alexdeucher@gmail.com>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi


Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex Deu=
cher
Sent: Friday, July 26, 2019 12:11 PM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi

The PCI revision id determines the sku.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index c873228bf05f..dbac24e44174 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1592,7 +1592,7 @@ static int navi10_set_peak_clock_by_device(struct smu=
_context *smu)
         uint32_t sclk_freq =3D 0, uclk_freq =3D 0;
         uint32_t uclk_level =3D 0;

-       switch (adev->rev_id) {
+       switch (adev->pdev->revision) {
         case 0xf0: /* XTX */
         case 0xc0:
                 sclk_freq =3D NAVI10_PEAK_SCLK_XTX;
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32969739658CAE0B4E8E3DBCA2C00MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Xu, Feifei &lt;Feifei.Xu@amd.=
com&gt;<br>
<b>Sent:</b> Friday, July 26, 2019 12:20 PM<br>
<b>To:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/powerplay: use proper revision id fo=
r navi</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
Reviewed-by: Feifei Xu &lt;Feifei.Xu@amd.com&gt;<br>
<br>
-----Original Message-----<br>
From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf Of Al=
ex Deucher<br>
Sent: Friday, July 26, 2019 12:11 PM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
Subject: [PATCH] drm/amdgpu/powerplay: use proper revision id for navi<br>
<br>
The PCI revision id determines the sku.<br>
<br>
Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index c873228bf05f..dbac24e44174 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1592,7 &#43;1592,7 @@ static int navi10_set_peak_clock_by_device(struct=
 smu_context *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t sclk_freq =3D 0, =
uclk_freq =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t uclk_level =3D 0;=
<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;rev_id) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;pdev-&gt;revisio=
n) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0xf0: /* XTX */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case 0xc0:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; sclk_freq =3D NAVI10_PEAK_SCLK_XTX;<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32969739658CAE0B4E8E3DBCA2C00MN2PR12MB3296namp_--

--===============1779956784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1779956784==--

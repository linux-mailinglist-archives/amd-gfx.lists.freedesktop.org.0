Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B0B995C7
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 16:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001FE6EB45;
	Thu, 22 Aug 2019 14:04:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690072.outbound.protection.outlook.com [40.107.69.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25ABF6EB45
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 14:04:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoNczMpzAfxHV5omdOsa8wMPdoTyCaKXLmoJ1BsJ3fHfBEWloY+D/pbhCa1c6XXdliNYHluKR0Qi2xirTPtpqcUzUaJaZfvo+SHKB+mr8G0xxO9vMVA2BzmZGU9Ok+AlcHydEZWsArtTJ/O2OxCi5Zt/8y2qtqIMR8kQ/8dCXf/aixEqAHSwk5eC7Ie0qKMCm4EPqKUkR4wjqSlvghxA1AlqjTSjXJLxrY62701GaQBbDM7e7161iyGxrLlWl6mg7db/hsbz0rX5T8dizDm/ME+oL5mYVWZLIKrnwH2WOD4lyvQARfQwF7uzy9B8EFJSFXTPA1rL4kEJzDRDwK/X/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owI7Ppg2R0ZOuAC2+oicI0XTH1exPM9gjAzVlL1eurk=;
 b=AZGIzZfy/W4vaHHbz8/FCXXxRJ8rgBRsUsWIQOApfJtR+V1kp7EOeD6gul8RLdLIpCcO8AVL0j4MJrrAII2G78Tyj5DidA6kjiNScC8qWGoGYGq9QahgUPjym7xFQ4HMQeGBirZydNauCQ8WU0P0OCg60HYyt9+kSv9+1bUVweME90YTq3Rty6xa9k9qCk1sO+iJoKLd/ET3pgzOrJGl+uL/kwS1ZmRWaiml/CukP680/Wrv8Rr1zEYWPqyelzYbGM/Pk+eoSo0QMidPjdc4q/cfcJXHR44j/XEVfYmZVgvchf+DnMuKb4yKybEYb1yRqacc7m5zcrTIkSNeTZILsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3998.namprd12.prod.outlook.com (10.255.239.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 14:04:22 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.018; Thu, 22 Aug 2019
 14:04:22 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Russell, Kent"
 <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/powerplay: Fix Vega20 Average Power value v4
Thread-Topic: [PATCH] drm/powerplay: Fix Vega20 Average Power value v4
Thread-Index: AQHVWO4iK1FgZ8+TXUCJhIUCZ5x5KacHK0zigAAHtqI=
Date: Thu, 22 Aug 2019 14:04:22 +0000
Message-ID: <MN2PR12MB3296EBE6F789A24DFEC8664CA2A50@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190822133259.6241-1-kent.russell@amd.com>,
 <BN6PR12MB1809E604A003C351E0239E49F7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
In-Reply-To: <BN6PR12MB1809E604A003C351E0239E49F7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.143.216]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e64aaaea-458c-49df-61b1-08d72709a261
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3998; 
x-ms-traffictypediagnostic: MN2PR12MB3998:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3998458BFE1E8D7AFB022CE6A2A50@MN2PR12MB3998.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(189003)(199004)(966005)(2906002)(3846002)(5660300002)(52536014)(110136005)(8676002)(316002)(606006)(2501003)(25786009)(71200400001)(81156014)(6506007)(81166006)(186003)(26005)(102836004)(53546011)(8936002)(54896002)(86362001)(55016002)(71190400001)(486006)(6306002)(14454004)(236005)(256004)(6246003)(446003)(229853002)(105004)(19627405001)(476003)(9686003)(53936002)(33656002)(7696005)(11346002)(74316002)(76176011)(6436002)(66066001)(66476007)(66556008)(64756008)(66946007)(478600001)(7736002)(76116006)(99286004)(66446008)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3998;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PfSGjsN+oHuARjYbqjIiK+HpdADHDMm8noe6NZx5tGOBOHG54cKLrXZuYGHrmLx7W3cZswIXUozRgVImgNuHyPJfpKCSFxBATZpEmpBqBXxhkl+qJ89skz2Rjd6fd4fInsDrshcESfZOP92z1E8saZixnLxtvzxhwtnVFOHd1YhiPpvjq6rayQzMU8WvHOtIzmn+mPb/0H/5vV6hyvPyLSF+2J+NR9oMtphvghkfHFKuBx8OUXV9n8sqBU637I+InkLyZC3c3joQKucmorP9h0TIPU+79LEA2pbyWDB4pe+hrka5R2a5B8V2sLlz3hC8e9fHIOifPEbGcRqJZ4nwSUSKodZ0j3WETuEdB/T1rxRgmXP5kXsIdBVQKGGh9J0JmPas3eoM/rWDBqkJy36RVgz1s1vaXDmQBNCh4k+Mzdo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64aaaea-458c-49df-61b1-08d72709a261
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 14:04:22.6565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I5lOf45BVuEdNWPGoqGejL2cYiJF/QXme9zeXCM+0VG5WSYzGoyy+TxC7ibozwIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owI7Ppg2R0ZOuAC2+oicI0XTH1exPM9gjAzVlL1eurk=;
 b=hz3BZRpvV2Kfn0bDVhG6hIPlHOWvwGmikkUf5qFPOWM37RCKrYL9wKGt31gf61YUdoL8VkgUiWCuH5gYpdhKNZtAbMho9bBw+NZ/ngOV2kZLrX17ZrQ6WKCW6YS65iO2wWZqdqysNlLClmVgT0I4D0vWw+SB6H+MXaQqCKuQRLI=
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
Content-Type: multipart/mixed; boundary="===============1019193913=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1019193913==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296EBE6F789A24DFEC8664CA2A50MN2PR12MB3296namp_"

--_000_MN2PR12MB3296EBE6F789A24DFEC8664CA2A50MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Deucher,=
 Alexander <Alexander.Deucher@amd.com>
Sent: Thursday, August 22, 2019 9:36 PM
To: Russell, Kent <Kent.Russell@amd.com>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/powerplay: Fix Vega20 Average Power value v4

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Thursday, August 22, 2019 9:33 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Russell, Kent <Kent.Russell@amd.com>
Subject: [PATCH] drm/powerplay: Fix Vega20 Average Power value v4

The SMU changed reading from CurrSocketPower to AverageSocketPower, so
reflect this accordingly. This fixes the issue where Average Power
Consumption was being reported as 0 from SMU 40.46-onward

v2: Fixed headline prefix
v3: Add check for SMU version for proper compatibility
v4: Style fix

Change-Id: I471f93316820f1401cb497eefe29da68376a4bb9
Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c |  5 ++++-
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         | 10 +++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
index 0516c294b377..9f50a12f5c03 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
@@ -2101,7 +2101,10 @@ static int vega20_get_gpu_power(struct pp_hwmgr *hwm=
gr,
         if (ret)
                 return ret;

-       *query =3D metrics_table.CurrSocketPower << 8;
+       if (hwmgr->smu_version < 0x282e00)
+               *query =3D metrics_table.CurrSocketPower << 8;
+       else
+               *query =3D metrics_table.AverageSocketPower << 8;

         return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index e14363182691..0fac824490d7 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -2917,6 +2917,7 @@ static int vega20_get_fan_speed_percent(struct smu_co=
ntext *smu,

 static int vega20_get_gpu_power(struct smu_context *smu, uint32_t *value)
 {
+       uint32_t smu_version;
         int ret =3D 0;
         SmuMetrics_t metrics;

@@ -2927,7 +2928,14 @@ static int vega20_get_gpu_power(struct smu_context *=
smu, uint32_t *value)
         if (ret)
                 return ret;

-       *value =3D metrics.CurrSocketPower << 8;
+       ret =3D smu_get_smc_version(smu, NULL, &smu_version);
+       if (ret)
+               return ret;
+
+       if (smu_version < 0x282e00)
+               *value =3D metrics.CurrSocketPower << 8;
+       else
+               *value =3D metrics.AverageSocketPower << 8;

         return 0;
 }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296EBE6F789A24DFEC8664CA2A50MN2PR12MB3296namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Deucher, Alexander &lt;Alexan=
der.Deucher@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 9:36 PM<br>
<b>To:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/powerplay: Fix Vega20 Average Power value v=
4</font>
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
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Russell, Kent &lt;Kent.Russ=
ell@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 9:33 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/powerplay: Fix Vega20 Average Power value v4</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">The SMU changed reading from CurrSocketPower to =
AverageSocketPower, so<br>
reflect this accordingly. This fixes the issue where Average Power<br>
Consumption was being reported as 0 from SMU 40.46-onward<br>
<br>
v2: Fixed headline prefix<br>
v3: Add check for SMU version for proper compatibility<br>
v4: Style fix<br>
<br>
Change-Id: I471f93316820f1401cb497eefe29da68376a4bb9<br>
Signed-off-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c |&nbsp; 5 &#43;&#4=
3;&#43;&#43;-<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 10 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<b=
r>
&nbsp;2 files changed, 13 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
index 0516c294b377..9f50a12f5c03 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
@@ -2101,7 &#43;2101,10 @@ static int vega20_get_gpu_power(struct pp_hwmgr =
*hwmgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *query =3D metrics_table.CurrSocketPo=
wer &lt;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hwmgr-&gt;smu_version &lt; 0x=
282e00)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *query =3D metrics_table.CurrSocketPower &lt;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *query =3D metrics_table.AverageSocketPower &lt;&lt; 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index e14363182691..0fac824490d7 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -2917,6 &#43;2917,7 @@ static int vega20_get_fan_speed_percent(struct sm=
u_context *smu,<br>
&nbsp;<br>
&nbsp;static int vega20_get_gpu_power(struct smu_context *smu, uint32_t *va=
lue)<br>
&nbsp;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t smu_version;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SmuMetrics_t metrics;<br>
&nbsp;<br>
@@ -2927,7 &#43;2928,14 @@ static int vega20_get_gpu_power(struct smu_conte=
xt *smu, uint32_t *value)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *value =3D metrics.CurrSocketPower &l=
t;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_smc_version(smu, =
NULL, &amp;smu_version);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_version &lt; 0x282e00)<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D metrics.CurrSocketPower &lt;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D metrics.AverageSocketPower &lt;&lt; 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB3296EBE6F789A24DFEC8664CA2A50MN2PR12MB3296namp_--

--===============1019193913==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1019193913==--

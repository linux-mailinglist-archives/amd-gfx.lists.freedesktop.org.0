Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800599533
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 15:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202C56EB49;
	Thu, 22 Aug 2019 13:36:47 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010926EB34
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 13:36:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnaLptzjcoVdS+1chNuSXROXO2XhO81axIXvIBfiE6n4F9FjhiMjQ4z9+rKmOSKpOEeZrSKJ86WWV0qhsLI2Gw9CyVJVfltEGHIMoXZh/8ZRMHlYJUWf/UEaQAuIZDI/rgE7oW9NLT/nJyoSkLArYaBVco52EG7Wh6K78NYEwBkLlmf0iulcTFBeHNdfWxLIpWSlKWuoFhjQSQ9fPrH0gWhzWPRU5UdwdcojwooJcb8Aq0zxJwvohgD2Xf+tOpk6Z9m/iJLRLvP8vaKZE8WLUIMhg/lIBqKH49fCjbciuCzT/th47uUUQrTI6GNSAJxudOkJJoapzYiA05+DFdsBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/Nzg5E9JnBu8EVPXnBgSt624ed5aK62KHqQam1/hH0=;
 b=RAI1F6BlF8pY0kdUarZB5IL86JuW6E8C6vc6hUTuxtBpZ+1EhlHvYMMoZaEUaS8f/siQ5SEJVkQQuUaA8HtBNkrSbaFojLofwK/QBmupwWgkJUswC8QSn+E15/OcVOvvVjapd7pauTZD0v2P07JVbJDh4PL2eo/mnLBptdonYE1cFu+Dy0lM9JtNM6owZfSLnm0nyV734Wvo8q4ZjT15wSJrMObsYnhKao+9cjEB1Tgt4MTG7XEE+aRHpnKE/ms5PI4eCxToWuwG7a3mjgg1cSmLhyAdSmEFo/4ugL5eElNaX1t0gKRw8R3FFpvBJlF+pKtcN5OJWT7Y27q6J+SbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1490.namprd12.prod.outlook.com (10.172.23.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 13:36:32 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 13:36:32 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/powerplay: Fix Vega20 Average Power value v4
Thread-Topic: [PATCH] drm/powerplay: Fix Vega20 Average Power value v4
Thread-Index: AQHVWO4iK1FgZ8+TXUCJhIUCZ5x5KacHK0zi
Date: Thu, 22 Aug 2019 13:36:32 +0000
Message-ID: <BN6PR12MB1809E604A003C351E0239E49F7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190822133259.6241-1-kent.russell@amd.com>
In-Reply-To: <20190822133259.6241-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8af882a2-760e-43b0-9e77-08d72705bede
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1490; 
x-ms-traffictypediagnostic: BN6PR12MB1490:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1490E210FE9D4EB25ED2C1AEF7A50@BN6PR12MB1490.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(189003)(199004)(6306002)(66476007)(236005)(76176011)(105004)(9686003)(606006)(316002)(76116006)(2906002)(6436002)(6246003)(66946007)(66556008)(64756008)(74316002)(54896002)(6116002)(7736002)(3846002)(229853002)(66446008)(25786009)(53936002)(110136005)(99286004)(81156014)(102836004)(81166006)(7696005)(8936002)(66066001)(6506007)(53546011)(966005)(14454004)(19627405001)(2501003)(33656002)(52536014)(71200400001)(5660300002)(478600001)(476003)(256004)(446003)(26005)(486006)(8676002)(86362001)(71190400001)(11346002)(55016002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1490;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZoKGMpAESZnV4ch2Te8Mihgz3DAFQjkTSzjpH3he4rqo93o8062zTVc9ueQcvOsu+BP4P3zUWb0rqAPbHRLI5wauE9RKxPS8grmWUlKUzKMK8fRbPyG7fni8agojg/r8xXBIP/pE28vjTfChZsRWZvoxeLwKaUOZnwipjwps/qitAW86EGJFAgcKszGkuCZ7VxRPwS2wkUGXWGUO8+FmO+LOCo21VYoTfQWiZFADPnhWR3+4SFkpgOrEsK32jeaSbcPSvMYEa04P9jWylq93JL3SmKKUHlfQYgDQegyobw+LMPO8DStQCNu/5j6uJ21m2nGGmCejeXLWm+rgZPJjeqNCi18YK5YBNFCbUXMqZeBpJtKK/p2o6JhdNW9XO3KwDld4DsdrhIkdO7z4vTiZPZVlCQcrak0RrMzeGsvA2w4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af882a2-760e-43b0-9e77-08d72705bede
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 13:36:32.5045 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nM+BAc90ElO43ih2ubHIae11CPXhn88yhFfZ5+uIh7gT+bWlAHAxYQmE2Z7QQ4cMKrAU8jLrrWbtZi2hToJbww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1490
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/Nzg5E9JnBu8EVPXnBgSt624ed5aK62KHqQam1/hH0=;
 b=XNe8VFJSsQ0QTvzrk4TNBrz11X8prD+XYu/9gSYzbZZsSLN8cxIlkDAz5QCJLGK9ZcQpWtG3v8LrvWS13nIgjgVX5g91glIwjMIN2dz5gS5172XEcHvYLJmt7Txnk91AEeyaj8ebJHbxyUAPY5ieqGvM8hLPKLnR+c/Dmnw2WPM=
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
Content-Type: multipart/mixed; boundary="===============1135604385=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1135604385==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809E604A003C351E0239E49F7A50BN6PR12MB1809namp_"

--_000_BN6PR12MB1809E604A003C351E0239E49F7A50BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

--_000_BN6PR12MB1809E604A003C351E0239E49F7A50BN6PR12MB1809namp_
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
ounces@lists.freedesktop.org&gt; on behalf of Russell, Kent &lt;Kent.Russel=
l@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 9:33 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/powerplay: Fix Vega20 Average Power value v4</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The SMU changed reading from CurrSocketPower to Av=
erageSocketPower, so<br>
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
</body>
</html>

--_000_BN6PR12MB1809E604A003C351E0239E49F7A50BN6PR12MB1809namp_--

--===============1135604385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1135604385==--

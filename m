Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A39B216
	for <lists+amd-gfx@lfdr.de>; Fri, 23 Aug 2019 16:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB956ECAE;
	Fri, 23 Aug 2019 14:35:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750087.outbound.protection.outlook.com [40.107.75.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2A76ECAE
 for <amd-gfx@lists.freedesktop.org>; Fri, 23 Aug 2019 14:35:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CI4TqJejbyV64mMuCHyVdjy9arUAzTauU7H/QhCnZqdnrrthpE0+owCb/yqCvQj2OJSyIubntS8XvsZ9cMCr47lfmh8V6nbTSh6PvzZb2CfhkvRNEAqLgsrrj5YXC6eK7Bvt5So6h2i2UQVv3d5Rc0NmvuyWc8gfGUh8AlGy4Jo7Ltg0ZRK51RPfeO1SW3KPmjHZGooAo6NB4A17atoo5wCpEoSjTBWZonqB4sO4mDOgwr7uwbaQbPuCEsYsKm1zNXQBSwe/IWjL1hbwiH8ZC1VclorgKfhhVjj75SiXdHJcbgu8uT3KbbKSvfSWZcWwVyoCC5x0+N+FXpCq4xNcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vygj33+fWS/5SgqJHnC4N4NtycP9HPcEpaN/s7YVoiQ=;
 b=U3te+p26S/gosOV8mzJl2kCleSSz6Aya27RTh8vMLr/DJsGVaWMwG2xdoxbfGGsLIl8KWa4uq+U4KPPmbOtOyjfHeah/FaxZ9yuhZV34Hv6V0cvJApYEKtJxJw8zF1EXFp+0PpLNchhodWHm6Dd7TyiX1sD01EA7jVFnQhwSL0zfLgqnKk8p8KWKDZwaCP3Nhl6NrMsWHGAMoWObrryxfZYLYITl5dniUgaMS9rGghLDP14/8xQLm50LOW2GnOtHSacZZHd75dHm+yyBd1Yy2MTXR/fF1G7sqavxPFLcPpdpCkkqfUYgIaSMVQj484/smdYOr7uiVIUn6fETHh//yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1620.namprd12.prod.outlook.com (10.172.24.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Fri, 23 Aug 2019 14:35:01 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 14:35:01 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Russell, Kent" <Kent.Russell@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/powerplay: Fix Vega20 power reading again
Thread-Topic: [PATCH] drm/powerplay: Fix Vega20 power reading again
Thread-Index: AQHVWbfcVzHz3YyhgEiNFpFyEd6YVacIzGIh
Date: Fri, 23 Aug 2019 14:35:00 +0000
Message-ID: <BN6PR12MB18093000064D627498B66814F7A40@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190823133652.31774-1-kent.russell@amd.com>
In-Reply-To: <20190823133652.31774-1-kent.russell@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df0885eb-525e-4ec1-60c5-08d727d71472
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1620; 
x-ms-traffictypediagnostic: BN6PR12MB1620:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB162005DE3A6078AE69C0CA2EF7A40@BN6PR12MB1620.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(189003)(199004)(86362001)(6246003)(53936002)(5660300002)(14454004)(7736002)(606006)(99286004)(25786009)(256004)(2501003)(2906002)(110136005)(76176011)(7696005)(52536014)(3846002)(66066001)(6116002)(478600001)(6306002)(105004)(229853002)(102836004)(55016002)(236005)(966005)(6506007)(53546011)(6436002)(316002)(74316002)(66946007)(81156014)(26005)(11346002)(8676002)(446003)(8936002)(476003)(186003)(81166006)(66556008)(64756008)(66446008)(66476007)(486006)(76116006)(19627405001)(33656002)(71190400001)(71200400001)(54896002)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1620;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GtWdEUFljSTB/uOo1w0BUkWnS6Tv+WKcAuOqwYjbMg39gABo8B6Hf7RfGrYIKAIc7tSIjhXlP8H3kGMtEDoflK/va5RqTBmrxPfyQ2/PVfu0Wv27s83+qRxAZ8fwU/nr+7SHpxXfz2femB9pozsIWmkshERuEz21lUd+UCuNASVpdgZJpm3bltA5LIyqQo3PYQPtWIBm6J4DGk89wB6A14D4EeIpoEneCbMlThOWFcgSfGm6DGt4Mv9AC/S8li7XX4zCsgkOqZ18VRM/yW7fJvAHumLkQXaKE2SHll3CUKNEee3ghqsNuwFt2GuzhCgSS9gdjq+RaebWycp/EFk71lUc/rcBU2W/lX5v4eoynY7PxuioU4RfCcjJL7bYNLNOY9/8Hyt70SNoe3q6MFsTti2KjF3u/XOVqDZ69MlQOuc=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0885eb-525e-4ec1-60c5-08d727d71472
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 14:35:00.8857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZ7ZeDVeBkl8MWi4r17Ha3vX94AWDwH4n194/kJbb+fHJa2dUkG8auQClDXA0vAOc8ny2pE/jSvs+t36PTM1Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1620
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vygj33+fWS/5SgqJHnC4N4NtycP9HPcEpaN/s7YVoiQ=;
 b=KYAB+0YUaQlh4dd2EvBqjOFHFKpLp4ccdsyCyhucnvcv1G4ILIA5yw0c7j02ipu8cyoHgblAz1iN7inuF3WdE+nBTAgfpKZWEaFxzwzKWzGcbUJn1K430fXwmHr08ZNEz1TM7ICkzTn8zd4vQB/TZzdrT+z83tEq6VMjKfZSJw4=
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
Content-Type: multipart/mixed; boundary="===============1652161932=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1652161932==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18093000064D627498B66814F7A40BN6PR12MB1809namp_"

--_000_BN6PR12MB18093000064D627498B66814F7A40BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Russell,=
 Kent <Kent.Russell@amd.com>
Sent: Friday, August 23, 2019 9:37 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Russell, Kent <Kent.Russell@amd.com>
Subject: [PATCH] drm/powerplay: Fix Vega20 power reading again

For the 40.46 SMU release, they changed CurrSocketPower to
AverageSocketPower, but this was changed back in 40.47 so just check if
it's 40.46 and make the appropriate change

Tested with 40.45, 40.46 and 40.47 successfully

Change-Id: Icbbe6fd3381b8ad6298c2d0852a726ffac98f93a
Signed-off-by: Kent Russell <kent.russell@amd.com>
---
 drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 7 ++++---
 drivers/gpu/drm/amd/powerplay/vega20_ppt.c         | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
index 9f50a12f5c03..98a6f5305974 100644
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
+++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
@@ -2101,10 +2101,11 @@ static int vega20_get_gpu_power(struct pp_hwmgr *hw=
mgr,
         if (ret)
                 return ret;

-       if (hwmgr->smu_version < 0x282e00)
-               *query =3D metrics_table.CurrSocketPower << 8;
-       else
+       /* For the 40.46 release, they changed the value name */
+       if (hwmgr->smu_version =3D=3D 0x282e00)
                 *query =3D metrics_table.AverageSocketPower << 8;
+       else
+               *query =3D metrics_table.CurrSocketPower << 8;

         return ret;
 }
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c
index 0fac824490d7..899bf96b23e1 100644
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
@@ -2932,10 +2932,11 @@ static int vega20_get_gpu_power(struct smu_context =
*smu, uint32_t *value)
         if (ret)
                 return ret;

-       if (smu_version < 0x282e00)
-               *value =3D metrics.CurrSocketPower << 8;
-       else
+       /* For the 40.46 release, they changed the value name */
+       if (smu_version =3D=3D 0x282e00)
                 *value =3D metrics.AverageSocketPower << 8;
+       else
+               *value =3D metrics.CurrSocketPower << 8;

         return 0;
 }
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18093000064D627498B66814F7A40BN6PR12MB1809namp_
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
<b>Sent:</b> Friday, August 23, 2019 9:37 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Russell, Kent &lt;Kent.Russell@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/powerplay: Fix Vega20 power reading again</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">For the 40.46 SMU release, they changed CurrSocket=
Power to<br>
AverageSocketPower, but this was changed back in 40.47 so just check if<br>
it's 40.46 and make the appropriate change<br>
<br>
Tested with 40.45, 40.46 and 40.47 successfully<br>
<br>
Change-Id: Icbbe6fd3381b8ad6298c2d0852a726ffac98f93a<br>
Signed-off-by: Kent Russell &lt;kent.russell@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c | 7 &#43;&#43;&#43=
;&#43;---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 7 &#43;&#43;&#43;&#43;---<br>
&nbsp;2 files changed, 8 insertions(&#43;), 6 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c b/drivers/g=
pu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
index 9f50a12f5c03..98a6f5305974 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
@@ -2101,10 &#43;2101,11 @@ static int vega20_get_gpu_power(struct pp_hwmgr=
 *hwmgr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hwmgr-&gt;smu_version &lt; 0x282e=
00)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *query =3D metrics_table.CurrSocketPower &lt;&lt; 8;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For the 40.46 release, they ch=
anged the value name */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (hwmgr-&gt;smu_version =3D=3D =
0x282e00)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *query =3D metrics_table.AverageSocketPower &lt;&lt; =
8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *query =3D metrics_table.CurrSocketPower &lt;&lt; 8;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm/a=
md/powerplay/vega20_ppt.c<br>
index 0fac824490d7..899bf96b23e1 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
@@ -2932,10 &#43;2932,11 @@ static int vega20_get_gpu_power(struct smu_cont=
ext *smu, uint32_t *value)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_version &lt; 0x282e00)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *value =3D metrics.CurrSocketPower &lt;&lt; 8;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For the 40.46 release, they ch=
anged the value name */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu_version =3D=3D 0x282e00)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *value =3D metrics.AverageSocketPower &lt;&lt; 8;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; *value =3D metrics.CurrSocketPower &lt;&lt; 8;<br>
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

--_000_BN6PR12MB18093000064D627498B66814F7A40BN6PR12MB1809namp_--

--===============1652161932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1652161932==--

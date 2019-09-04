Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C70EA7BB7
	for <lists+amd-gfx@lfdr.de>; Wed,  4 Sep 2019 08:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36B489204;
	Wed,  4 Sep 2019 06:32:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800058.outbound.protection.outlook.com [40.107.80.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC4289204
 for <amd-gfx@lists.freedesktop.org>; Wed,  4 Sep 2019 06:32:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Emyusu9yE3VwNVP9mHZ+570J9pxRfdvbPmxRHL9h4WCS5VbJ1Y6zVZz13PWWngSVJNt14KwBbFrCXx6DlpuYK24tHcCwXYkz+8C6jc2m+F6gJcMAO6SKLQyrwB9KCCeG+oa1Y/z4SQc4h/caCyd6vtBAD1CAH0NS3TJHi4PbTM4qUHqiMkyNyt1v89Dsv5Cejp7L6R1hkhvOSUUVuuPO49m//Kri8CaD9DgGGG94pPQYG/7LgfnGaMSnJCf+KmgHJORYptIrakiD0UbuFy0wr9CC+R5YJSPZ8W8csrvqfHmEMk2mMI+d9yNUl9Ec1gVd6De9s2G2ooOp+L3bAOVQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a0mqMPIOF9/Dq/1i/a8PqHwFEivUCst9HMKzW/NHiU=;
 b=Y5U4Gq94rS4axi+i1qfONF32d+oZs8MILe/ZDK/3kf3bJBhnjMAYvkf/+4rD9Oxuhg9D4DfGBQHc0m6nNVvShz0qt5svtKbJwlm1uR63jIgS0VVoLTpQvmvxc0oiiSpoT5nj//NPOgSpoKcoLF6d5v2twRZU0aeUG7SmLb0OX0Zzypv7v57WL6/yCg1ewa8/d9UbRSnllRvw4geUT1bvjZDa2como7kxP2d0PMXzMICfWzgaljrAZWLMXSGro+7zVAKX1f27Qzy0fGyAS4uq1jFgQC6ctiaj3qGX/6X9JASNUqxy6kz5+bkisY6DTj29tZ2gXZTkoDuCNli4swkA2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3630.namprd12.prod.outlook.com (20.178.243.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Wed, 4 Sep 2019 06:32:03 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2220.021; Wed, 4 Sep 2019
 06:32:03 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg
 Parameters
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg
 Parameters
Thread-Index: AQHVYuY1zl6E+ns+R0GkmmmDplyMYKcbDjsC
Date: Wed, 4 Sep 2019 06:32:02 +0000
Message-ID: <MN2PR12MB3296B324AFCAABE3E7E63ECEA2B80@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1567576882-13685-1-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1567576882-13685-1-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a792fbb-26fe-4f18-9f16-08d731019927
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3630; 
x-ms-traffictypediagnostic: MN2PR12MB3630:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3630E3B6803D44D50719B1BAA2B80@MN2PR12MB3630.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(199004)(189003)(71190400001)(71200400001)(26005)(6246003)(229853002)(186003)(102836004)(66066001)(446003)(478600001)(53936002)(6306002)(54896002)(52536014)(9686003)(7696005)(81166006)(55016002)(33656002)(476003)(236005)(606006)(25786009)(105004)(8936002)(2501003)(81156014)(2906002)(86362001)(76116006)(91956017)(19627405001)(6116002)(3846002)(99286004)(66446008)(14444005)(6436002)(66946007)(64756008)(66476007)(66556008)(7736002)(966005)(110136005)(6506007)(4326008)(316002)(14454004)(76176011)(11346002)(53546011)(486006)(74316002)(256004)(5660300002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3630;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rtz8CP/2vcporzXR3uslv5OM42yWU14+YHueHhe5lTeuixfjBdUoa1pI02MlxOxiFDNigCxgcu0WnVdQ9z5urFFHHozQ5E7SU34ydReZ3vsApCICOSZG7EkcVs7YMxyaVU/JrwIr2tlZJiam5YYodkPmrUvGWDhe2zAeiRlVvhzy7RAUe9f7zwcg/XdcZlk8Nhu2OsJG35upKTaZqkwLChIPzTnmY2ND88O32xNitT2jxdsCna8gyIQM/PeDwu/dvQAHgYc3N2AT7GL4PPDlikJBK9rqmszMG11v5ocjKnC/aReUjBeHQamtpsncun1YMsFMeUjwknOu3+jX1DXbWAQk2eCG5xIZz/cuPHg8PDzM+AeFHzyR4U0l/qUWrlEAwuEwAumxEFxFS9E5al8ma3OTfNMNmTlqu8dVcjh4Iqo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a792fbb-26fe-4f18-9f16-08d731019927
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 06:32:02.9853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vm+UYP8VLtHAXchTLnG3jQ0ISI8he6KrEkBUjRh+L2njs9+r60Nq7AoDGOkvfpQu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3630
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a0mqMPIOF9/Dq/1i/a8PqHwFEivUCst9HMKzW/NHiU=;
 b=kO9NFUWH9hyxFCGzgSCc9ly9K0+XPSOCAUy4Ur1xq5c/nUZ96CxWf+I+rVook8MsmlOw76mHcDlJCBMuWrQdwUlxM0OmRfptFyxQTAqfI1T/Gw/HQECqsFvHJLtRiux+EYztG9K5+GSYf4dC4oDqM580Q2lNlUZU1xtsKv6hsPc=
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
Content-Type: multipart/mixed; boundary="===============1759956886=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1759956886==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296B324AFCAABE3E7E63ECEA2B80MN2PR12MB3296namp_"

--_000_MN2PR12MB3296B324AFCAABE3E7E63ECEA2B80MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

i think it's better to merge these two patches into one patch.
after fixed: Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Wednesday, September 4, 2019 2:01 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Liang, Prike <Prike.Lia=
ng@amd.com>
Subject: [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg Parameter=
s

Add UMD PState macro definition for PState update.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
reviewed-by: Evan Quan <evan.quan@amd.com>
[Kevin]: change "reviewed-by" to "Reviewed-by"
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.h b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.h
index e9b7237..a017a47 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.h
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.h
@@ -25,4 +25,9 @@

 extern void renoir_set_ppt_funcs(struct smu_context *smu);

+//UMD PState Renoir Msg Parameters in MHz
+#define RENOIR_UMD_PSTATE_GFXCLK       700
+#define RENOIR_UMD_PSTATE_SOCCLK       678
+#define RENOIR_UMD_PSTATE_FCLK         800
+
 #endif
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296B324AFCAABE3E7E63ECEA2B80MN2PR12MB3296namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>i think it's better to merge these two patches into one patch.</span>=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>after fixed: Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</spa=
n></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Best Regards,<br>
Kevin</span><span></span></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liang, Prike &lt;Prike.Liang@=
amd.com&gt;<br>
<b>Sent:</b> Wednesday, September 4, 2019 2:01 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Liang, Pri=
ke &lt;Prike.Liang@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/2] drm/amd/powerplay: Add UMD PState Renoir Msg Pa=
rameters</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Add UMD PState macro definition for PState update.=
<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
reviewed-by: Evan Quan &lt;evan.quan@amd.com&gt;</div>
<div class=3D"PlainText"><b><i>[Kevin]: change &quot;reviewed-by&quot; to &=
quot;Reviewed-by&quot;</i></b></div>
<div class=3D"PlainText">---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.h | 5 &#43;&#43;&#43;&#43;&#=
43;<br>
&nbsp;1 file changed, 5 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.h b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.h<br>
index e9b7237..a017a47 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.h<br>
@@ -25,4 &#43;25,9 @@<br>
&nbsp;<br>
&nbsp;extern void renoir_set_ppt_funcs(struct smu_context *smu);<br>
&nbsp;<br>
&#43;//UMD PState Renoir Msg Parameters in MHz<br>
&#43;#define RENOIR_UMD_PSTATE_GFXCLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7=
00<br>
&#43;#define RENOIR_UMD_PSTATE_SOCCLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6=
78<br>
&#43;#define RENOIR_UMD_PSTATE_FCLK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 800<br>
&#43;<br>
&nbsp;#endif<br>
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

--_000_MN2PR12MB3296B324AFCAABE3E7E63ECEA2B80MN2PR12MB3296namp_--

--===============1759956886==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1759956886==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48449562D
	for <lists+amd-gfx@lfdr.de>; Tue, 20 Aug 2019 06:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65FF36E5CB;
	Tue, 20 Aug 2019 04:39:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710082.outbound.protection.outlook.com [40.107.71.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 596116E5CA
 for <amd-gfx@lists.freedesktop.org>; Tue, 20 Aug 2019 04:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxQo7OFlw9pJCiMZLZM+/ZjXS+ThMwCXsuqhOtpCXtWDeNzSIy1PNssbRdbpe53yr3bA+IevLkgjpW+5GmpFTYl5KPEt5NTWnZuqchM7YNPkSXw1UWkxGNbDP19gnfWPmEOitLlD6O+t8UatM9CdUqAul0EWOntheH/FTuK+UoXFKndReiwmm8m8NCwwGHx/F2Nn3USSNVeiCYOqy0pkuw356mgRcSflqOBoDUlicvLcJaWHNWqQ7N/FbJS93XrA0QObDMjtWulvgSUbkoEO/1Zwvm6PmbIDGvGbnjEyblTB4eWUgr7j6tJ3MFDoS61Sl22I82XYOatxlOK7MtB3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/iDVmtoAqooJUyUqyTBOs42Zu8Px1XYk9DAY3C1V2I=;
 b=LcLAJ60eKhbHuL5rnQdDY7BXjbl1a12b9BBG6t7fFVVnfQZQjiZV9w1tq4y6epNhHhj8mlpoBfsy1nD+FfGl94SIG7pV39y8cwLTt8wfh49AZzT378jUttqHb458Xxn2CkreiZOHLKUJa4tSt0dRhoNTv1aUeIvZkw5Dbwo06c1i6CixBMupDgnWuvmPzo+vpDqau2X+0BIB7EYNGZRgfvlIvius2xwqiTW24CWWy/XI4wq7Csmr8okarnNK45dxi7c9Llwri37Pva/kiTzZNFc+kHtIWBSQY5BSmd5eMN6+ZywTfh2ZmirA+Mq5Dnr4Nhzt/0ahQVeok67MsLHYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3887.namprd12.prod.outlook.com (10.255.237.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 04:39:16 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2178.016; Tue, 20 Aug 2019
 04:39:16 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: correct typo
Thread-Topic: [PATCH] drm/amd/powerplay: correct typo
Thread-Index: AQHVVw8ZXmA2dNHw5E+WMvaYwUoYZacDdBqi
Date: Tue, 20 Aug 2019 04:39:16 +0000
Message-ID: <MN2PR12MB3296851C1C7B795BFBFC1B2AA2AB0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190820042350.2697-1-evan.quan@amd.com>
In-Reply-To: <20190820042350.2697-1-evan.quan@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1270dec2-75c5-4960-765d-08d725285b9b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3887; 
x-ms-traffictypediagnostic: MN2PR12MB3887:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB38879733F3E9D4186657E65AA2AB0@MN2PR12MB3887.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:486;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(39860400002)(366004)(136003)(189003)(199004)(2906002)(33656002)(110136005)(3846002)(6116002)(316002)(71190400001)(71200400001)(256004)(14444005)(19627405001)(66066001)(2501003)(86362001)(6506007)(5660300002)(53546011)(66946007)(55016002)(105004)(8676002)(7736002)(81166006)(81156014)(52536014)(8936002)(6436002)(606006)(7696005)(236005)(14454004)(26005)(76176011)(6246003)(74316002)(6306002)(54896002)(9686003)(25786009)(11346002)(99286004)(486006)(476003)(91956017)(76116006)(229853002)(53936002)(966005)(186003)(446003)(66476007)(66556008)(64756008)(66446008)(478600001)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3887;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rjY1gCHGu00oFrKDZm1RbdLnRwUQV80xWpTUPLyvyUejZRkdgnTsr4ZB+slhZ82AUtq5YYxHjpVykLXHOhP+krF1rSn32coRVLJeTZzwn4eZ8mCKds4a7+Jkw3HJhzq7azX/b6drmZdDL2vXiZKGJ8puYjpC62hUzMVdVcKbGMt2AzdD1NDi0Ie9yYRQa8/JFZCrjTUh2izsIsDrKtVR1Gz6xHjj0UtrZ9cO5tJg4OKr+NdjfWccvjr/I0xCVurHT+dLuFFwSaP/0HKBw2h8Bzb3nMjxaiFVZwJhvGaysAMOakJ/6YH6JfYKIYyUQogYtmVxwsLPHplKNW5pNKwhZDWW9VaACbbqzZJAfy1NWGriXzFB7hLRQc+dIVYFATLLBlCLWcXSnUECm8cZ6keie2wOX1GrFqAc2SCFWxDtZQo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1270dec2-75c5-4960-765d-08d725285b9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 04:39:16.1059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4A4h04dZWcYYDVzrY9j5t0Fq3lKoLLv9ERrFgFH8s6dvI3uUK8qtHY5dLkRWR0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/iDVmtoAqooJUyUqyTBOs42Zu8Px1XYk9DAY3C1V2I=;
 b=LbhzPkciHIdbrpHg0Pv/EDrh/HS/Nvd3uiRHplJbFFwuaLlyXk3qpLHSdcjt0vD1B4B4zgNBgSjE0UNAKCsQp+Ra/yj2wMZ37JnPNhgMaAnsGLU6KyIvjjg/011jrt4SFxab9oj1W5QoB6tYsPlYaawiwco7ZGKNu3pE/pux20I=
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
Content-Type: multipart/mixed; boundary="===============1713809790=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1713809790==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296851C1C7B795BFBFC1B2AA2AB0MN2PR12MB3296namp_"

--_000_MN2PR12MB3296851C1C7B795BFBFC1B2AA2AB0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Evan Qua=
n <evan.quan@amd.com>
Sent: Tuesday, August 20, 2019 12:23 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Quan, Evan <Evan.Quan@amd.com>
Subject: [PATCH] drm/amd/powerplay: correct typo

"COMPUTE" was wrongly spelled as "CUSTOM".

Change-Id: I11693c0e55c2ce5c889d57bb7411fdf9795a8739
Signed-off-by: Evan Quan <evan.quan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c
index b3d4cdc387c8..6f9dab1db2c2 100644
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
@@ -181,7 +181,7 @@ static struct smu_11_0_cmn2aisc_mapping arcturus_worklo=
ad_map[PP_SMC_POWER_PROFI
         WORKLOAD_MAP(PP_SMC_POWER_PROFILE_BOOTUP_DEFAULT,       WORKLOAD_P=
PLIB_DEFAULT_BIT),
         WORKLOAD_MAP(PP_SMC_POWER_PROFILE_POWERSAVING,          WORKLOAD_P=
PLIB_POWER_SAVING_BIT),
         WORKLOAD_MAP(PP_SMC_POWER_PROFILE_VIDEO,                WORKLOAD_P=
PLIB_VIDEO_BIT),
-       WORKLOAD_MAP(PP_SMC_POWER_PROFILE_COMPUTE,              WORKLOAD_PP=
LIB_CUSTOM_BIT),
+       WORKLOAD_MAP(PP_SMC_POWER_PROFILE_COMPUTE,              WORKLOAD_PP=
LIB_COMPUTE_BIT),
         WORKLOAD_MAP(PP_SMC_POWER_PROFILE_CUSTOM,               WORKLOAD_P=
PLIB_CUSTOM_BIT),
 };

--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296851C1C7B795BFBFC1B2AA2AB0MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Evan Quan &lt;evan.quan@amd.c=
om&gt;<br>
<b>Sent:</b> Tuesday, August 20, 2019 12:23 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: correct typo</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">&quot;COMPUTE&quot; was wrongly spelled as &quot;C=
USTOM&quot;.<br>
<br>
Change-Id: I11693c0e55c2ce5c889d57bb7411fdf9795a8739<br>
Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c b/drivers/gpu/drm=
/amd/powerplay/arcturus_ppt.c<br>
index b3d4cdc387c8..6f9dab1db2c2 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
@@ -181,7 &#43;181,7 @@ static struct smu_11_0_cmn2aisc_mapping arcturus_wo=
rkload_map[PP_SMC_POWER_PROFI<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_MAP(PP_SMC_POWER_=
PROFILE_BOOTUP_DEFAULT,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_PPLIB_=
DEFAULT_BIT),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_MAP(PP_SMC_POWER_=
PROFILE_POWERSAVING,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
WORKLOAD_PPLIB_POWER_SAVING_BIT),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_MAP(PP_SMC_POWER_=
PROFILE_VIDEO,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_PPLIB_VIDEO_BIT),<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_MAP(PP_SMC_POWER_PROFILE_COM=
PUTE,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; WORKLOAD_PPLIB_CUSTOM_BIT),<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_MAP(PP_SMC_POWER_PROFILE=
_COMPUTE,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; WORKLOAD_PPLIB_COMPUTE_BIT),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_MAP(PP_SMC_POWER_=
PROFILE_CUSTOM,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; WORKLOAD_PPLIB_CUSTOM_BIT),<br>
&nbsp;};<br>
&nbsp;<br>
-- <br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296851C1C7B795BFBFC1B2AA2AB0MN2PR12MB3296namp_--

--===============1713809790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1713809790==--

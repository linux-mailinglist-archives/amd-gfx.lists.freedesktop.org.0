Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B650ED4148
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 15:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420146E459;
	Fri, 11 Oct 2019 13:31:45 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21786E459
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 13:31:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UoXdsJPvW5TluU1I12rDGbADlK8laIiooLDd8L+BvKhlyvhGHRcUP8i39motRJRBdE+AGYWnCQkfkNOCaE2F83PAmb0Uwyl38YwVmlzVxse5KyaK2qv1CY+NfCr/pOYt595u2fuuhLPJvI8vdu3q9YkKiSoWt9FgVqvGqUCB+7j5kAdTBC5fTbsllI3OD06RzJT770rj4cz9exvAu7iHph9xK8D2XsD2+z0T0ZVa/2yIqJkMBfIHEuF8a5XnmlNPfX6VklduWluTBOMpEWEgZfegrbJ26t0V8QXLY2k1wqEoJP64IwG/aLEHqh63XR2+d0QP8fFbmguSifEHcENNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo5CfTCWgAYg+fUFXZi7+peWvvCJcMFD1jYRmQdhTnI=;
 b=EwxT6yxtZLMcpUXM8LfakiiLnYWb1fBrD3rVPm77f6axfskq0hE03gHvu4rNwwXj0TwxtKiP0SqMG3h+L6CIwKcWLsdv+4rihPb18BCBOsN7hIUVcBiWNgU+1cJViBapGj1jFxCTsZ8SCJOGpbLYH2TJ3AN288Y0IuyF0/Jmmp9YEcHzdii4p5zTbV5b6lvL417K9yv59uXfFufyPWVvcrb2KfYj6LXGs5k/8uWsvOTPj7+cAgkBn7KGlQHQYM1MxmNP1yM2UZnbJtlWCGEWMjgkXqva4CchyhceN10uhUoquCZcoW1LBZD4dup11JQxPXKguC434ooIsKqVfHD/EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1252.namprd12.prod.outlook.com (10.168.223.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 11 Oct 2019 13:31:42 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f16d:2fda:9e18:a554%12]) with mapi id 15.20.2347.021; Fri, 11 Oct
 2019 13:31:42 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "Feng, Kenneth"
 <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Index: AQHVfpHgjN+I+dxtnkiCYzAfaU+0WKdST50agAA91ACAAOZJAIAAWUsxgAFPQwCAAFazNQ==
Date: Fri, 11 Oct 2019 13:31:42 +0000
Message-ID: <BN6PR12MB1809DF05179210CEE97C7059F7970@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>,
 <20191009110757.30995-2-xiaojie.yuan@amd.com>,
 <DM5PR12MB182077A0796BED759991002EF7950@DM5PR12MB1820.namprd12.prod.outlook.com>
 <BN8PR12MB3602F6E7A20C0F1FE3997FF589950@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <MN2PR12MB3598AD3DF5A31DF503C03EAE8E940@MN2PR12MB3598.namprd12.prod.outlook.com>,
 <CY4PR12MB181316A0DC0FC83741C2D887F7940@CY4PR12MB1813.namprd12.prod.outlook.com>,
 <BN8PR12MB3602CDCC1180499A29B4F7A389970@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3602CDCC1180499A29B4F7A389970@BN8PR12MB3602.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.171.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c200acc6-afee-4f0d-d8f1-08d74e4f5a60
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1252:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB12525F5B3C9950A47ECDEF23F7970@BN6PR12MB1252.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(199004)(189003)(76116006)(19627235002)(66556008)(66446008)(5660300002)(64756008)(19627405001)(478600001)(54906003)(229853002)(66946007)(86362001)(110136005)(66476007)(4326008)(14454004)(8676002)(256004)(316002)(14444005)(966005)(54896002)(236005)(81156014)(81166006)(9686003)(74316002)(6116002)(3846002)(102836004)(7736002)(6306002)(53546011)(6506007)(55016002)(2501003)(26005)(2906002)(25786009)(52536014)(99286004)(76176011)(7696005)(71190400001)(476003)(6246003)(486006)(71200400001)(446003)(33656002)(8936002)(105004)(11346002)(186003)(606006)(66066001)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1252;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z8lItu8lxGyiGSCXNFL5qrghKp6Ox1nsZMgZakSVHuR4iOHEPOWL/OJQvmvVE3V/05r+Ml4pYel0m2g7sq9EW/bsbxA9TNwCaxTSKR5RdprYLg6HvjuLAJmdxMejuHRV6LJOYSjoCOxNrT4g0Fxpp1pP045GrHachzN/3/j8TGusRkUr50H6dy5KIzbLLUFcuzhoHiKgdLajeibh1XMz3upE5OfDcSYCApXBsCI5z1kZuO02ATJkku1ZiFryPoQ5lSPme2VPEorddkvO03XCav4+qJ5FwjdPuCOMD2xD4/wtag42iAFQ/2C1oH+X0UsGPq39E97aYwahz9nXMhIgAdgyy3dF63gyVPY02dQLtAC3mKCvlSe3Tr635QWRzpW98Ddyd00WHcfOlTLIC73Xo+HY0CBewuAXR7S1YiSF1iNyXBPi1NoxeOror3NbWH9Fj8e03An41mbrrjIxObex1g==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c200acc6-afee-4f0d-d8f1-08d74e4f5a60
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 13:31:42.0494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bNmecXc+wcirBRn0S2zviLQVrh2Jl0ndzU5M+7RxdjthbJhi08DcTBzUCM2DSV6T+FDcj4aaJxHLcZPNLN9KOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1252
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo5CfTCWgAYg+fUFXZi7+peWvvCJcMFD1jYRmQdhTnI=;
 b=jA6P8S2+oX+879p+nQbHTVQ6XQt18cqLW439KT+y8dwL7Hmdq80e/zghVlXo/SSfFveQsJRPnUTUGRJwmeRaO4V7ve6BizZDTp8bcFjMtcijS3kZ6v+0AaBhvo2UZITR0h7GZIlrP5L/K9V34ty0AdzpAyluAjyO+ni7BxNN3kY=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1213279325=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1213279325==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809DF05179210CEE97C7059F7970BN6PR12MB1809namp_"

--_000_BN6PR12MB1809DF05179210CEE97C7059F7970BN6PR12MB1809namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Sent: Friday, October 11, 2019 4:20 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Feng, Kenneth <Kenneth.=
Feng@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org=
>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>=
; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit

Hi there,

Could someone give an RB or ACK? This patch has been verified on both navi1=
2 and navi14.
Thanks.

BR,
Xiaojie
________________________________
From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Thursday, October 10, 2019 8:20 PM
To: Feng, Kenneth <Kenneth.Feng@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.c=
om>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>=
; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit

Great.  thanks!

Alex
________________________________
From: Feng, Kenneth <Kenneth.Feng@amd.com>
Sent: Thursday, October 10, 2019 3:00 AM
To: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org=
>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>=
; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit


Hi Alex,

This issue was navi10 specific and was found in May, 2019.

It was early after the asic back, then since gfxoff was removed from navi10=
, we didn=92t really verify which firmware version started to have a fix.

For navi14/navi12, there=92s no such issue at all.

Sorry for losing the track of it.





From: Yuan, Xiaojie
Sent: Thursday, October 10, 2019 1:17 AM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-gfx@lists.freedeskt=
op.org
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>=
; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; F=
eng, Kenneth <Kenneth.Feng@amd.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit



Hi Alex,



For now, gfxoff for navi10 is disabled by default, and I also verified on n=
avi14 with both GFXOFF and FW_DSTATE feature bits toggled on.



Hi Kenneth / Jack,



Could you help to confirm the firmware version?



BR,

Xiaojie

________________________________

From: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deuche=
r@amd.com>>
Sent: Wednesday, October 9, 2019 9:35 PM
To: Yuan, Xiaojie <Xiaojie.Yuan@amd.com<mailto:Xiaojie.Yuan@amd.com>>; amd-=
gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@li=
sts.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Xiao, Jack <Jack.Xiao@amd.com<mailto:Jack.Xiao@amd.com>>; Wang, Kevin(Y=
ang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>; Zhang, Hawking <Haw=
king.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>; Quan, Evan <Evan.Quan@am=
d.com<mailto:Evan.Quan@amd.com>>; Feng, Kenneth <Kenneth.Feng@amd.com<mailt=
o:Kenneth.Feng@amd.com>>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit



What version of firmware has the fix?  Was it recently fixed?  We should ch=
eck the version if the old one may be out in the wild.



Alex

________________________________

From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Yuan, Xiaojie <Xiaojie.Yuan@amd.com<m=
ailto:Xiaojie.Yuan@amd.com>>
Sent: Wednesday, October 9, 2019 7:08 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Xiao, Jack <Jack.Xiao@amd.com<mailto:Jack.Xiao@amd.com>>; Wang, Kevin(Y=
ang) <Kevin1.Wang@amd.com<mailto:Kevin1.Wang@amd.com>>; Zhang, Hawking <Haw=
king.Zhang@amd.com<mailto:Hawking.Zhang@amd.com>>; Quan, Evan <Evan.Quan@am=
d.com<mailto:Evan.Quan@amd.com>>; Feng, Kenneth <Kenneth.Feng@amd.com<mailt=
o:Kenneth.Feng@amd.com>>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com<mailto:Xiaoji=
e.Yuan@amd.com>>
Subject: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit



SMU firmware has fix the bug, so remove this workaround.

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com<mailto:xiaojie.yuan@amd.c=
om>>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 44152c1f01c7..3628295469c4 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -359,11 +359,8 @@ navi10_get_allowed_feature_mask(struct smu_context *sm=
u,
                                 | FEATURE_MASK(FEATURE_MEM_VDDCI_SCALING_B=
IT)
                                 | FEATURE_MASK(FEATURE_MEM_MVDD_SCALING_BI=
T);

-       if (adev->pm.pp_feature & PP_GFXOFF_MASK) {
+       if (adev->pm.pp_feature & PP_GFXOFF_MASK)
                 *(uint64_t *)feature_mask |=3D FEATURE_MASK(FEATURE_GFXOFF=
_BIT);
-               /* TODO: remove it once fw fix the bug */
-               *(uint64_t *)feature_mask &=3D ~FEATURE_MASK(FEATURE_FW_DST=
ATE_BIT);
-       }

         if (smu->adev->pg_flags & AMD_PG_SUPPORT_MMHUB)
                 *(uint64_t *)feature_mask |=3D FEATURE_MASK(FEATURE_MMHUB_=
PG_BIT);
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809DF05179210CEE97C7059F7970BN6PR12MB1809namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yuan, Xiaojie &lt;Xia=
ojie.Yuan@amd.com&gt;<br>
<b>Sent:</b> Friday, October 11, 2019 4:20 AM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Feng, Kenn=
eth &lt;Kenneth.Feng@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx=
@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevi=
n1.Wang@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Ev=
an &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feat=
ure bit</font>
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
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
Hi there,<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
Could someone give an RB or ACK? This patch has been verified on both navi1=
2 and navi14.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
Thanks.<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
BR,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
Xiaojie<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Deucher, Alexander =
&lt;Alexander.Deucher@amd.com&gt;<br>
<b>Sent:</b> Thursday, October 10, 2019 8:20 PM<br>
<b>To:</b> Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Yuan, Xiaojie &lt;Xi=
aojie.Yuan@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.fre=
edesktop.org&gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevi=
n1.Wang@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Ev=
an &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feat=
ure bit</font>
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
Great.&nbsp; thanks!</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Alex<br>
</div>
<div id=3D"x_x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Feng, Kenneth &lt=
;Kenneth.Feng@amd.com&gt;<br>
<b>Sent:</b> Thursday, October 10, 2019 3:00 AM<br>
<b>To:</b> Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; Deucher, Alexander &=
lt;Alexander.Deucher@amd.com&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx=
@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevi=
n1.Wang@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Ev=
an &lt;Evan.Quan@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feat=
ure bit</font>
<div>&nbsp;</div>
</div>
<style>
<!--
@font-face
	{font-family:SimSun}
@font-face
	{font-family:"Cambria Math"}
@font-face
	{font-family:Calibri}
@font-face
	{font-family:SimSun}
p.x_x_x_MsoNormal, li.x_x_x_MsoNormal, div.x_x_x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif}
a:link, span.x_x_x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.x_x_x_MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
p
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif}
span.x_x_x_EmailStyle18
	{font-family:"Calibri",sans-serif;
	color:#1F497D}
.x_x_x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
-->
</style>
<div lang=3D"EN-US">
<div class=3D"x_x_x_WordSection1">
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:#1F497D">Hi Alex,</span></p>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:#1F497D">This issue was navi10 specifi=
c and was found in May, 2019.</span></p>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:#1F497D">It was early after the asic b=
ack, then since gfxoff was removed from navi10, we didn=92t really verify w=
hich firmware version started to have a fix.</span></p>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:#1F497D">For navi14/navi12, there=92s =
no such issue at all.</span></p>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:#1F497D">Sorry for losing the track of=
 it.</span></p>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:#1F497D">&nbsp;</span></p>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:#1F497D">&nbsp;</span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_x_x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-famil=
y:&quot;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:=
11.0pt; font-family:&quot;Calibri&quot;,sans-serif"> Yuan, Xiaojie
<br>
<b>Sent:</b> Thursday, October 10, 2019 1:17 AM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; amd-gfx@li=
sts.freedesktop.org<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevi=
n1.Wang@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Ev=
an &lt;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br=
>
<b>Subject:</b> Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feat=
ure bit</span></p>
</div>
</div>
<p class=3D"x_x_x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">Hi Alex,</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">For now, gfxoff for navi10 is d=
isabled by default, and I also verified on navi14 with both GFXOFF and FW_D=
STATE feature bits toggled on.</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">Hi Kenneth / Jack,</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">Could you help to confirm the f=
irmware version?</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">BR,</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&=
quot;Calibri&quot;,sans-serif; color:black">Xiaojie</span></p>
</div>
<div class=3D"x_x_x_MsoNormal" align=3D"center" style=3D"text-align:center"=
>
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_x_divRplyFwdMsg">
<p class=3D"x_x_x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-famil=
y:&quot;Calibri&quot;,sans-serif; color:black">From:</span></b><span style=
=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:bla=
ck"> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">Al=
exander.Deucher@amd.com</a>&gt;<br>
<b>Sent:</b> Wednesday, October 9, 2019 9:35 PM<br>
<b>To:</b> Yuan, Xiaojie &lt;<a href=3D"mailto:Xiaojie.Yuan@amd.com">Xiaoji=
e.Yuan@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;<br>
<b>Cc:</b> Xiao, Jack &lt;<a href=3D"mailto:Jack.Xiao@amd.com">Jack.Xiao@am=
d.com</a>&gt;; Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com"=
>Kevin1.Wang@amd.com</a>&gt;; Zhang, Hawking &lt;<a href=3D"mailto:Hawking.=
Zhang@amd.com">Hawking.Zhang@amd.com</a>&gt;; Quan, Evan
 &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&gt;; Feng, =
Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kenneth.Feng@amd.com</a=
>&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feat=
ure bit</span>
</p>
<div>
<p class=3D"x_x_x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;=
,sans-serif; color:black">What version of firmware has the fix?&nbsp; Was i=
t recently fixed?&nbsp; We should check the version if the old one may be o=
ut in the wild.</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;=
,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;=
,sans-serif; color:black">Alex</span></p>
</div>
<div class=3D"x_x_x_MsoNormal" align=3D"center" style=3D"text-align:center"=
>
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_x_x_divRplyFwdMsg">
<p class=3D"x_x_x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-famil=
y:&quot;Calibri&quot;,sans-serif; color:black">From:</span></b><span style=
=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:bla=
ck"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists.freedesktop.org">a=
md-gfx-bounces@lists.freedesktop.org</a>&gt;
 on behalf of Yuan, Xiaojie &lt;<a href=3D"mailto:Xiaojie.Yuan@amd.com">Xia=
ojie.Yuan@amd.com</a>&gt;<br>
<b>Sent:</b> Wednesday, October 9, 2019 7:08 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Xiao, Jack &lt;<a href=3D"mailto:Jack.Xiao@amd.com">Jack.Xiao@am=
d.com</a>&gt;; Wang, Kevin(Yang) &lt;<a href=3D"mailto:Kevin1.Wang@amd.com"=
>Kevin1.Wang@amd.com</a>&gt;; Zhang, Hawking &lt;<a href=3D"mailto:Hawking.=
Zhang@amd.com">Hawking.Zhang@amd.com</a>&gt;; Quan, Evan
 &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&gt;; Feng, =
Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kenneth.Feng@amd.com</a=
>&gt;; Yuan, Xiaojie &lt;<a href=3D"mailto:Xiaojie.Yuan@amd.com">Xiaojie.Yu=
an@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature =
bit</span>
</p>
<div>
<p class=3D"x_x_x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_x_x_MsoNormal"><span style=3D"font-size:11.0pt">SMU firmware =
has fix the bug, so remove this workaround.<br>
<br>
Signed-off-by: Xiaojie Yuan &lt;<a href=3D"mailto:xiaojie.yuan@amd.com">xia=
ojie.yuan@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 5 &#43;----<br>
&nbsp;1 file changed, 1 insertion(&#43;), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 44152c1f01c7..3628295469c4 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -359,11 &#43;359,8 @@ navi10_get_allowed_feature_mask(struct smu_context=
 *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_MEM_VDDCI=
_SCALING_BIT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_MEM_MVDD_=
SCALING_BIT);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.pp_feature &amp; PP_G=
FXOFF_MASK) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.pp_feature &amp; =
PP_GFXOFF_MASK)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *(uint64_t *)feature_mask |=3D FEATURE_MASK(FEATURE_G=
FXOFF_BIT);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* TODO: remove it once fw fix the bug */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *(uint64_t *)feature_mask &amp;=3D ~FEATURE_MASK(FEATURE_FW_DSTA=
TE_BIT);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (smu-&gt;adev-&gt;pg_fl=
ags &amp; AMD_PG_SUPPORT_MMHUB)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *(uint64_t *)feature_mask |=3D FEATURE_MASK(FEATURE_M=
MHUB_PG_BIT);<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BN6PR12MB1809DF05179210CEE97C7059F7970BN6PR12MB1809namp_--

--===============1213279325==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1213279325==--

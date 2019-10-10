Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E8D2963
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 14:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482E789180;
	Thu, 10 Oct 2019 12:20:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730051.outbound.protection.outlook.com [40.107.73.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1748D89180
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 12:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHKrSvlnu4W3d86OrtiN5F2+h5dVL4o2RgHtZVx9Zzkw+oXZEGPWDBGTFOtutEICoVGJ2rc+HuxSnACdSPch+SOV8+4SigQRiHRcff2Fras1WMUPWjoUbeAYhsrq9qef4N2IvgWY74rN7VCBNmNQVecfqkokPpgaREUR8JwJAWJ52Z+8a7Ahg7GXKOvxyExXm4k8tvWw2MayZUocrNhgYdDYyTuwOhMchYuS6LsDMnMBYvtNK3fHZdgsPbAQ//Yq/MbbbFHJ+u4gUm+c1Xnzvl4llPmw34ctvPQmzwcCWfM16DlAjTSZbqzc536Tn89kQxeon/o2qdH/5GoUpB1mwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt3Nn446oOXKLzcXLfYpSor74bTdQt4NVaspC4yKIjo=;
 b=HzDRwfKP++ykh8o59RmQ5sHZOOFiQ5Nu34f0HXRlcy3Gb5K9dsdgBWv4CO9HkgaCapbqnSNZryHAii5qwoS84HEnKmQvAYJ/515ZnuaUrcP+DZL3fCutVbQAjd/NrK8v/wC4/6tjx+2p7aCgDqGuXxo0yGoZQtghokB20UOgImwBCgBn2RkVsmour0F8oof3BtwIXz5kT1A0a+2MGrtAo1lf1IHW+K58X/i42xcNIoDcOhcmG8abVtQsKJ46VHciiQC4o2vcQjwNTuDAYAWDnf0vn10AvHg3gNjoP13/MBO3WDdFA7cfxuMhwzYHG1fZJLL3OnQ7eSM/RE4UITvlHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR12MB1813.namprd12.prod.outlook.com (10.175.80.21) by
 CY4PR12MB1925.namprd12.prod.outlook.com (10.175.62.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Thu, 10 Oct 2019 12:20:32 +0000
Received: from CY4PR12MB1813.namprd12.prod.outlook.com
 ([fe80::1c60:9f35:598a:e3e0]) by CY4PR12MB1813.namprd12.prod.outlook.com
 ([fe80::1c60:9f35:598a:e3e0%10]) with mapi id 15.20.2347.016; Thu, 10 Oct
 2019 12:20:32 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Yuan, Xiaojie"
 <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Index: AQHVfpHgjN+I+dxtnkiCYzAfaU+0WKdST50agAA91ACAAOZJAIAAWUsx
Date: Thu, 10 Oct 2019 12:20:32 +0000
Message-ID: <CY4PR12MB181316A0DC0FC83741C2D887F7940@CY4PR12MB1813.namprd12.prod.outlook.com>
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>,
 <20191009110757.30995-2-xiaojie.yuan@amd.com>,
 <DM5PR12MB182077A0796BED759991002EF7950@DM5PR12MB1820.namprd12.prod.outlook.com>
 <BN8PR12MB3602F6E7A20C0F1FE3997FF589950@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <MN2PR12MB3598AD3DF5A31DF503C03EAE8E940@MN2PR12MB3598.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3598AD3DF5A31DF503C03EAE8E940@MN2PR12MB3598.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.51.171.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 455224d3-a937-450f-45d3-08d74d7c3f0a
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: CY4PR12MB1925:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR12MB192574821365AE7A2A44E5D9F7940@CY4PR12MB1925.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(189003)(199004)(11346002)(236005)(25786009)(6306002)(6506007)(76176011)(55016002)(7696005)(9686003)(54896002)(19627235002)(86362001)(105004)(478600001)(71190400001)(446003)(52536014)(71200400001)(256004)(14444005)(53546011)(76116006)(6436002)(2501003)(5660300002)(102836004)(54906003)(66476007)(8936002)(966005)(6246003)(14454004)(110136005)(316002)(8676002)(26005)(66946007)(186003)(66556008)(486006)(606006)(64756008)(66446008)(66066001)(99286004)(2906002)(476003)(33656002)(229853002)(3846002)(81156014)(7736002)(19627405001)(81166006)(6116002)(4326008)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1925;
 H:CY4PR12MB1813.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cmhgETlx9TnsFSqyTXWX9NbflVZajJOc8ih+hUSbW1eh87et3JRmEZahH+hwFImiwpYkaUO0xhHuQJ7I2zG4WCTDID6v0wWEjlfIA8q7aHaZbOfm+6qDONZTgcIgTXuV4qJc4sgSw951X5t4DT+flar0JCm2uHkowi2DlOTinwaXr2pq0hWPkRQI3nU3lZvuz0CGMVaWKfxx9YU0zVfbOb9aipbUl1mycBJHW26YPPq57znqnzN71CO3E24TzTN7m6qkSa0iCY6ljw34yZGHn0geG2Hnppdn3jsfxRmKEZ3oHdd5mZISlukcdRreCTFOFVe+5BkSlqXzyyPhcY8bB1KT64DGzmDXZsAYMtXdsIYnNbWPY2xjST5aNhOXA4QAm1JsqRLJftqZlN1qS2nGVoqybxOeDG8kRYwRRIa8/uU5LU9Czj5k9k7jaLOfMFPHV4o+s0eWCF5rJd82/jz88Q==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455224d3-a937-450f-45d3-08d74d7c3f0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 12:20:32.3136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pX4oLATO8gsYjGnvfWs3KcevUxJAoL1p53j3t/cpk414ar+lmRwtCAVje6X9q7FY1cqE/iPOUjuzMlCRiLgVeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt3Nn446oOXKLzcXLfYpSor74bTdQt4NVaspC4yKIjo=;
 b=YBtO2kSEkS17VG/8q5vLmIAJh+BL7G4Y4lvf2lIfxSN7FcgLN0cscOpMPJpL+xmR+xddyw6O604sbnWoK5JFDqTEI648wt1l1HWLhqUmJuk4wlcMvsR3kkucPoQelpQUdLt3OuU58RbFrA4lY7hU/xR3J1Lt5Glr4kz1xvna2Fs=
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
Content-Type: multipart/mixed; boundary="===============0922403181=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0922403181==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR12MB181316A0DC0FC83741C2D887F7940CY4PR12MB1813namp_"

--_000_CY4PR12MB181316A0DC0FC83741C2D887F7940CY4PR12MB1813namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

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

--_000_CY4PR12MB181316A0DC0FC83741C2D887F7940CY4PR12MB1813namp_
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
Great.&nbsp; thanks!</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Feng, Kenneth &lt;Ken=
neth.Feng@amd.com&gt;<br>
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
p.x_MsoNormal, li.x_MsoNormal, div.x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif}
a:link, span.x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.x_MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
p
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif}
span.x_EmailStyle18
	{font-family:"Calibri",sans-serif;
	color:#1F497D}
.x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
div.x_WordSection1
	{}
-->
</style>
<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:#1F497D">Hi Alex,</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:#1F497D">This issue was navi10 specific an=
d was found in May, 2019.</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:#1F497D">It was early after the asic back,=
 then since gfxoff was removed from navi10, we didn=92t really verify which=
 firmware version started to have a fix.</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:#1F497D">For navi14/navi12, there=92s no s=
uch issue at all.</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:#1F497D">Sorry for losing the track of it.=
</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:#1F497D">&nbsp;</span></p>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:#1F497D">&nbsp;</span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-family:&q=
uot;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0=
pt; font-family:&quot;Calibri&quot;,sans-serif"> Yuan, Xiaojie
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
<p class=3D"x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">Hi Alex,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">For now, gfxoff for navi10 is disab=
led by default, and I also verified on navi14 with both GFXOFF and FW_DSTAT=
E feature bits toggled on.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">Hi Kenneth / Jack,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">Could you help to confirm the firmw=
are version?</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">BR,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&quot=
;Calibri&quot;,sans-serif; color:black">Xiaojie</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-family:&q=
uot;Calibri&quot;,sans-serif; color:black">From:</span></b><span style=3D"f=
ont-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:black"> =
Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">Alexand=
er.Deucher@amd.com</a>&gt;<br>
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
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,san=
s-serif; color:black">What version of firmware has the fix?&nbsp; Was it re=
cently fixed?&nbsp; We should check the version if the old one may be out i=
n the wild.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,san=
s-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,san=
s-serif; color:black">Alex</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-family:&q=
uot;Calibri&quot;,sans-serif; color:black">From:</span></b><span style=3D"f=
ont-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:black"> =
amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists.freedesktop.org">amd-gf=
x-bounces@lists.freedesktop.org</a>&gt;
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
<p class=3D"x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal"><span style=3D"font-size:11.0pt">SMU firmware has =
fix the bug, so remove this workaround.<br>
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
</body>
</html>

--_000_CY4PR12MB181316A0DC0FC83741C2D887F7940CY4PR12MB1813namp_--

--===============0922403181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0922403181==--

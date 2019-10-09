Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4701BD154C
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 19:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDFD6E116;
	Wed,  9 Oct 2019 17:16:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800057.outbound.protection.outlook.com [40.107.80.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF35D6E116
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 17:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PnNIoahdeHYBUpW21gfXfrpTrvUCVYorXHsgTxw3TtMTDOnNnF4Mp8ZjmblOB8vTHAU6+tfrs1z5L5QFe2GgJ+AkEzGRAoPUlK0W0XarHEu/+nmhTkZ7NQO71w/p3L0SxpZBCxN1ZBofL6uCzIJV8hMFZ086Uf6Ulpjg4OuZm4R26yacGC6JuXwjtITRgIzE/h1JaYW79vCfEwYnXR6nm9pNlKAub/x6p+jNhej1MsEDKKCAV5LARwIAo8684lYpxMvEx2vnHoI0yQEbUeuW0+OXWYKLu5s/wfFtEBusLMs5Au1baFWWqR97qWamL09pH4DTqW3YkSlSPaRYldUm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5WlF5NrFO5JcygZcK7NIfwuLMnkTnmE4duymmS1Sg4=;
 b=kjPVLA0Quw3j6NWPbzFgTVL06LC1bY6yVI7hDNAG4L8TfS0eVK8JtMc/c2qReUjGuziMUSZx6kFTzo3DuhLheLCW2CahbGvRX+A9FS2azqLDFUdX5gCZ4je8g390cD53k1hyNlyaC3FKM4KTF0XwVPqjKr79szARRx7lBciRJeY4owfohtep/DqJWPcgWVidpdHWSZEBeTAlIthn1zH7GlDoJIPqyDIEZpCeMpE2utATHwMUQ11bGmzLsFLo6Sf71CeAjpYgFfBkL/UtOSN1GhrAqx3Erwf58I+VbOX4cusyFMg5AEouNHfzCcAkRFXKvcwxCdU50p42i93O7S3/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB2868.namprd12.prod.outlook.com (20.179.65.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Wed, 9 Oct 2019 17:16:30 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 17:16:30 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Index: AQHVfpHdm9nABvnAkEes+Y6Iseje4qdST8kAgAA89mM=
Date: Wed, 9 Oct 2019 17:16:30 +0000
Message-ID: <BN8PR12MB3602F6E7A20C0F1FE3997FF589950@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>,
 <20191009110757.30995-2-xiaojie.yuan@amd.com>,
 <DM5PR12MB182077A0796BED759991002EF7950@DM5PR12MB1820.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB182077A0796BED759991002EF7950@DM5PR12MB1820.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7ed5ae3-86f6-4caf-55b0-08d74cdc6d1e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB2868:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB286811711422DE64DFAC0B0089950@BN8PR12MB2868.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(189003)(199004)(8676002)(229853002)(7736002)(64756008)(66476007)(476003)(8936002)(81156014)(74316002)(33656002)(105004)(6246003)(966005)(4326008)(91956017)(76116006)(6116002)(66946007)(486006)(66446008)(66556008)(55016002)(236005)(6436002)(54896002)(6306002)(52536014)(9686003)(81166006)(25786009)(99286004)(86362001)(66066001)(3846002)(478600001)(53546011)(7696005)(26005)(5660300002)(2906002)(186003)(11346002)(102836004)(446003)(71190400001)(14454004)(14444005)(256004)(2501003)(76176011)(110136005)(71200400001)(54906003)(19627405001)(606006)(316002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2868;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xz9U/Ap98Yvd6v/or821rHFFbpx8hjR5velZuyQYupJfgUKIoNsuXdrJ2HzisUxWxpLxyOsqdsIkLzfo3rdRMfUsJLMLF63y+IbaZpSCGUGwlpfkFUHfB/Z1BPHoygWWEk5QYerleHC5dZpR9tijCEc7bYg7KSUReH3X4zIJSdkEcXL89PiDXoi1TgrCzSdUbxiKkb1Kpc3X8/BGDCgLKaWAFmGvqxwSqEsPchr/gwXzUvBNXvhkyTxfHelM0+WfD25rQnH/nbiDxlnZFPqAlJB0VtXdbEKcBgAdUFhOwtSUAXjdQeRlHGsP/iQ57dDLw3Rwtng29hDfInhcYmP8rJceLdKrWiwvEEBJ7JFFf1LTpJ1BPyjYRWeqgMll4oN3GNDbkpvmHUZzcYnt1stqbSFNJRNohKHe1NRz01q1j4n6+MSB5xS7c8kPTlTVDRB6Y3dibPUB7EidbbdvHa8SHQ==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ed5ae3-86f6-4caf-55b0-08d74cdc6d1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 17:16:30.2395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nOkZKRq4mNghLTjOQt/pgWbDOt/FtXuz09qfvAhw0EfKKVRpfTFd9L7MV1PDrLTR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2868
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5WlF5NrFO5JcygZcK7NIfwuLMnkTnmE4duymmS1Sg4=;
 b=ZQPc+UWaDVcTFPB+dRmvxiZ2WQoUnp+WXLydSzTQQkstAE6AYscqYw6YdYYG1nqgfm7geWo3+E/3/XmWTfgcnholXmHx015Dw6xL2CK0GMldZAge5uSVbResnOxnPPVQ5DtGEHJhcLwJYZIkgDVe8CMcJc+A3FEuIHwH2Gvy4Ps=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1665666184=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1665666184==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3602F6E7A20C0F1FE3997FF589950BN8PR12MB3602namp_"

--_000_BN8PR12MB3602F6E7A20C0F1FE3997FF589950BN8PR12MB3602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

For now, gfxoff for navi10 is disabled by default, and I also verified on n=
avi14 with both GFXOFF and FW_DSTATE feature bits toggled on.

Hi Kenneth / Jack,

Could you help to confirm the firmware version?

BR,
Xiaojie
________________________________
From: Deucher, Alexander <Alexander.Deucher@amd.com>
Sent: Wednesday, October 9, 2019 9:35 PM
To: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>=
; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; F=
eng, Kenneth <Kenneth.Feng@amd.com>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit

What version of firmware has the fix?  Was it recently fixed?  We should ch=
eck the version if the old one may be out in the wild.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Yuan, Xi=
aojie <Xiaojie.Yuan@amd.com>
Sent: Wednesday, October 9, 2019 7:08 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>=
; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; F=
eng, Kenneth <Kenneth.Feng@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Subject: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit

SMU firmware has fix the bug, so remove this workaround.

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
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
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB3602F6E7A20C0F1FE3997FF589950BN8PR12MB3602namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Hi Alex,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
For now, gfxoff for navi10 is disabled by default, and I also verified on n=
avi14 with both GFXOFF and FW_DSTATE feature bits toggled on.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Hi Kenneth / Jack,<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Could you help to confirm the firmware version?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
BR,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Xiaojie<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Deucher, Alexander &l=
t;Alexander.Deucher@amd.com&gt;<br>
<b>Sent:</b> Wednesday, October 9, 2019 9:35 PM<br>
<b>To:</b> Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevi=
n1.Wang@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Ev=
an &lt;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<br=
>
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
What version of firmware has the fix?&nbsp; Was it recently fixed?&nbsp; We=
 should check the version if the old one may be out in the wild.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Alex<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Yuan, Xiaojie &lt;Xiaojie.Y=
uan@amd.com&gt;<br>
<b>Sent:</b> Wednesday, October 9, 2019 7:08 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevi=
n1.Wang@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Ev=
an &lt;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Y=
uan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature =
bit</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">SMU firmware has fix the bug, so remove this wor=
karound.<br>
<br>
Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
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
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</div>
</body>
</html>

--_000_BN8PR12MB3602F6E7A20C0F1FE3997FF589950BN8PR12MB3602namp_--

--===============1665666184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1665666184==--

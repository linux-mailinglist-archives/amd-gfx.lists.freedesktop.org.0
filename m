Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A057BD4157
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 15:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F51E6EC3C;
	Fri, 11 Oct 2019 13:33:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE026EC3C
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 13:33:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJ8qwv1RgLgvWHWogVw1sUU5e/FqEjMIKptkXiupAueUbTuXprmQEgaWX6WxWCcqVfYU19DTXJClaE2m//OD4q+18l2aErsgjOPtWUyvTVhS3oN3CyW8nooR7ztf/n7jHIK009ZHP29Pi9vKWAVqRMQDIyDooWK0jV9PefP9mfZSdpOftAjmUhHrWgVHzFji6bjCL/8bUhvS9aqWoEuHa+aHDPhbXRiGZ7ApX32Zp5coItpYQHscsA9iq9TCRx9elKKrgnPC+mdHlcp7Unt3Bt6wAKASGywhDHZTfuahc1rdvwEidR/Y58Yu4vRjkuQd3J/LmUsC4cuzbpdKOXUAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4xp9++yq1I1POZO9OLY0FKLm6/4p6B3JuF0dP9TDXk=;
 b=JjQMSOF+G6M/10NcUXJVd3zKJd2zjxrQQDO4z3a335ylUnzyvWZgUgVlDWK9KM6giXA7gYwuo6GS9vk+aBn8xVmfmd+tiV63s8aOL93qWJ6wK5omFU4svDuPIpF/YjfmGf8ADcDa2B600pjENILOrazIuJQam1EVjdp8TNxt+sGuSun40v5KyYS7Kz60jJXnZJPM3mflVTQ3EMVBh8X8zTszSqG4nbooOf+izssPsyveP7p5cL49MWg9vIw/9McqhLpbNKeCHfIJu/RF86/bLMAPCETi+e2nR+KAMDcUUzmQK8guizj3DzFOiyrxaLJ0sblw7Q2hPI5qfJpZYy65ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4224.namprd12.prod.outlook.com (52.135.51.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 11 Oct 2019 13:33:24 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2347.016; Fri, 11 Oct 2019
 13:33:24 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Yuan, Xiaojie"
 <Xiaojie.Yuan@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Index: AQHVfpHeU68UM4Ck0UGIcKApH/OBk6dST8kAgAA9qACAAOZJAIAB//Ni
Date: Fri, 11 Oct 2019 13:33:24 +0000
Message-ID: <MN2PR12MB3296D8FFE9B513BEEBBC24B6A2970@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>,
 <20191009110757.30995-2-xiaojie.yuan@amd.com>,
 <DM5PR12MB182077A0796BED759991002EF7950@DM5PR12MB1820.namprd12.prod.outlook.com>
 <BN8PR12MB3602F6E7A20C0F1FE3997FF589950@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <MN2PR12MB3598AD3DF5A31DF503C03EAE8E940@MN2PR12MB3598.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3598AD3DF5A31DF503C03EAE8E940@MN2PR12MB3598.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.141.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c18b7d60-7e8e-45a3-60d3-08d74e4f973e
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4224:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB422498BEB5A1DB41EF42091AA2970@MN2PR12MB4224.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(199004)(189003)(2906002)(8676002)(2501003)(7736002)(6116002)(3846002)(606006)(229853002)(99286004)(478600001)(9686003)(14454004)(316002)(55016002)(236005)(54896002)(6306002)(6246003)(74316002)(6436002)(91956017)(66946007)(66446008)(64756008)(66556008)(66476007)(81156014)(81166006)(76116006)(110136005)(54906003)(71200400001)(71190400001)(86362001)(256004)(66066001)(8936002)(14444005)(966005)(4326008)(5660300002)(52536014)(33656002)(186003)(25786009)(476003)(26005)(486006)(446003)(11346002)(76176011)(7696005)(105004)(53546011)(19627405001)(102836004)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4224;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IbBSs5cUHpHsNwRwl+ZL9YJ7AMi+EPwYkXaQRO3NwbuG7+IspOsLExCcUlvP9tvrro0ovngxh6mupmy1aMqn28ISsjvbtXp5NAQJ/aR4GLgwHZGXiwh++Ed9o9EARYI6369AEVgz/NmrQPi4ZgjNPUEbw0IgPy5wo9ewYWtW68S9sY95LIO1cBVvfFdRibe/k8iKtULjCzsVgpYYEezhUjVl9hB5UcPo5K/R9Fw9k35+JVdyNIdsA6RWUo68C8cpwxaBpW/R7ivrzDogskCdliW3OQCRF+MUOmYhstUfi+nid+HF7zu45i3KQiHY2VHgN7evvNMk+1BlR4qtldtxUXooIOXXyvSN/iYxC0SCnEQCpp1zfALfGZdqu162Aldn71GvNkhaDWQzd5bLiTXH6/UkwDVOF+uWjzaINFG2p7dIMm0aEDy3xd5HVe+/yEUY3d/ZyleYTDalc1y4UX6V9A==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c18b7d60-7e8e-45a3-60d3-08d74e4f973e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 13:33:24.1455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hktOfV9GTitQLAYI3hWg64gGgshL6YCG5elHvEB3u4Gu4WI2Kt4FgsiBxTsyiXp1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4xp9++yq1I1POZO9OLY0FKLm6/4p6B3JuF0dP9TDXk=;
 b=LAM9d2aZMtrkWvQtFIjs169rf01HwO9UENtOrQPlwLbCO4hkbMjJV/HEX7xrQZFx5nAFAGo/zngvI67hLwObbO/4E06esp1CpnCd6JojOVdHrUjq+9n/iX2Y1e+fYQvoHgpXjBKhDza+FSsl8unR8ypsoxm53U/kFGEKzydeYpo=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1790823042=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1790823042==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296D8FFE9B513BEEBBC24B6A2970MN2PR12MB3296namp_"

--_000_MN2PR12MB3296D8FFE9B513BEEBBC24B6A2970MN2PR12MB3296namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

________________________________
From: Feng, Kenneth <Kenneth.Feng@amd.com>
Sent: Thursday, October 10, 2019 3:00 PM
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

--_000_MN2PR12MB3296D8FFE9B513BEEBBC24B6A2970MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Feng, Kenneth &lt;Ken=
neth.Feng@amd.com&gt;<br>
<b>Sent:</b> Thursday, October 10, 2019 3:00 PM<br>
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
<div lang=3D"EN-US">
<div class=3D"x_WordSection1">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:#1F497D">Hi Alex,</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:#1F497D">This issue was navi10 specific and was found in May, 2019.=
</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:#1F497D">It was early after the asic back, then since gfxoff was re=
moved from navi10, we didn=92t really verify which firmware version started=
 to have a fix.</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:#1F497D">For navi14/navi12, there=92s no such issue at all.</span><=
/p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:#1F497D">Sorry for losing the track of it.</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:#1F497D">&nbsp;</span></p>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:#1F497D">&nbsp;</span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<b><span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-se=
rif">From:</span></b><span style=3D"font-size:11.0pt; font-family:&quot;Cal=
ibri&quot;,sans-serif"> Yuan, Xiaojie
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
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
&nbsp;</p>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">Hi Alex,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">For now, gfxoff for navi10 is disabled by default, and I als=
o verified on navi14 with both GFXOFF and FW_DSTATE feature bits toggled on=
.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">Hi Kenneth / Jack,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">Could you help to confirm the firmware version?</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">BR,</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif=
; color:black">Xiaojie</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"margin: 0in 0in 0.0001=
pt; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;text-a=
lign:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_divRplyFwdMsg">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<b><span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-se=
rif; color:black">From:</span></b><span style=3D"font-size:11.0pt; font-fam=
ily:&quot;Calibri&quot;,sans-serif; color:black"> Deucher, Alexander &lt;<a=
 href=3D"mailto:Alexander.Deucher@amd.com">Alexander.Deucher@amd.com</a>&gt=
;<br>
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
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif; color:black">Wha=
t version of firmware has the fix?&nbsp; Was it recently fixed?&nbsp; We sh=
ould check the version if the old one may be out in the wild.</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif; color:black">&nb=
sp;</span></p>
</div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif; color:black">Ale=
x</span></p>
</div>
<div class=3D"x_MsoNormal" align=3D"center" style=3D"margin: 0in 0in 0.0001=
pt; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;text-a=
lign:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<b><span style=3D"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-se=
rif; color:black">From:</span></b><span style=3D"font-size:11.0pt; font-fam=
ily:&quot;Calibri&quot;,sans-serif; color:black"> amd-gfx &lt;<a href=3D"ma=
ilto:amd-gfx-bounces@lists.freedesktop.org">amd-gfx-bounces@lists.freedeskt=
op.org</a>&gt;
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
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_MsoNormal" style=3D"margin: 0in 0in 0.0001pt; font-size: 12pt=
; font-family: &quot;Times New Roman&quot;, serif;margin: 0in 0in 0.0001pt;=
 font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif;">
<span style=3D"font-size:11.0pt">SMU firmware has fix the bug, so remove th=
is workaround.<br>
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

--_000_MN2PR12MB3296D8FFE9B513BEEBBC24B6A2970MN2PR12MB3296namp_--

--===============1790823042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1790823042==--

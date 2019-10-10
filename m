Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5EBD1E6A
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 04:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965FF6EA7C;
	Thu, 10 Oct 2019 02:25:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790042.outbound.protection.outlook.com [40.107.79.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF07F6EA7C
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 02:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kqq60rLy5FtDc5z/wjh4qKdPdvJ7iMXcR2PieN0Mo1OSGPRr0VQ92zbDi4E3db5uGvrCBDhgM/AEdaoOqpZAvNd2rFVxnVyf0eMVUy35IVeoNnz685aAr/x46lTFQ5LxQj3MblECaxkyrV8Ojtr4caaDvWTtH52PFWEMEFQEr7erf4yoJc68vC7n7VX0KPZIVpvC2r68+y7DGD+1qFFyzt+Gozy8iRp4F7KZIor+iX+n45L5Hfnb7xlwfQLd71SZi6szTaKymygRSXemLdUwVXXuxAW2Yn4HO09VQCfhM5k8Q/XTVKxwpowjdewOGB6v7ZnyxfPXCCOMKyHYkCfg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1PdHT+DLxZ8t3Ihi/QIPUNR65iMAFZ9H0IPSqAVVuU=;
 b=N3TSn5mwjMe27Y3BoPUI/Mo3GcQrORcOrTtpXx+fjoty59HKdMv4CFGxD7NY/zrOh5ZPUjqjyrYW9u3pHMNMUhZ++mh1Bp5q8eJHwfDW3L2/C3qm2naV2AmOeFyVY3fDw29xQBy8ITdF9asq867fL7fLJHtBJesjaa/70weDwhS7iResjPMbIPjta1pIE7qzgjwMp5Y3eiQQlHQFV/vGvZfLTDatIS6FJxDEEBb1WQVFPTppo3jYLIVoF2Q1YUX/KElHndav0fFKAaUv19BrolyVZEvjHqePTgAzgeqZG0+rd4egJBrj5eRs9JwSLVx08sQ4ek5WRuyaiDaeLT0HKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3074.namprd12.prod.outlook.com (20.178.209.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Thu, 10 Oct 2019 02:25:54 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 02:25:54 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: add more feature bits
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: add more feature bits
Thread-Index: AQHVfpHYv5oONJ+p/UGt6tWDCreN0KdTJuQ2
Date: Thu, 10 Oct 2019 02:25:54 +0000
Message-ID: <BN8PR12MB3602BB4F482647F07C325E3A89940@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>
In-Reply-To: <20191009110757.30995-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69af9d6c-a5d6-4f66-1b21-08d74d292d1d
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3074:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3074243D4A2C74F3CEF90F2D89940@BN8PR12MB3074.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:189;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(199004)(189003)(8936002)(19627405001)(66066001)(8676002)(6116002)(3846002)(4326008)(81156014)(81166006)(478600001)(6506007)(2351001)(33656002)(53546011)(486006)(476003)(91956017)(64756008)(66946007)(66446008)(76116006)(14454004)(52536014)(2501003)(66476007)(66556008)(76176011)(74316002)(5660300002)(256004)(9686003)(99286004)(71190400001)(71200400001)(14444005)(6916009)(54906003)(316002)(7736002)(7696005)(446003)(26005)(55016002)(6436002)(5640700003)(6246003)(54896002)(105004)(25786009)(186003)(2906002)(86362001)(229853002)(102836004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3074;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WPhw49EZ+auSwVbX4QGW4o/FgBvnkHAnG2m82ytGMyBrYm2idPD1arf5L+dKxd0Xs8aFFeTgSnqrqRtCPSgx21CQ/af9LMl7yPSbSklsJkSMBrGDKREcASdTN92Hij3xv8oMXlZxfEztdiHycEqjWT6X1mTVisev/w3axzif7s3a2fTgv7ReKqi3QPMfD/t3A2+5RlSClVGn1mSvD93y5YU0+xbXqb3aaOEtObFm/Umfvp3me+XhBLE059l5UUeGf5G+k+a4omyxdeTjtSV5v5j1KHrJMcwenbynSlux6K/twkkDM9V+MSRYuo/4IdcZpTONaGQ6QOEXFV3zb6YejHoucCA0H/Gq8mBIvRHJX7pp4WpNHZLmPYmvs1r6jtOsJcLAOhxPg32krr9MvoQKatNJ1UzbnP2qy0jk2b2COGk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69af9d6c-a5d6-4f66-1b21-08d74d292d1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 02:25:54.0335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HH80MTIihZ/qNdgHm0dXFsI76jgKgflw6Wh7qsd2vTBYj1Z3P9cOcIfHEOAcaxi9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3074
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1PdHT+DLxZ8t3Ihi/QIPUNR65iMAFZ9H0IPSqAVVuU=;
 b=ygiQWNuEvDcP7SxVTNFwAW1WeOaSy1cED2oMuBVEo6Z1xvE0xPpjuxV7o34Mr9VMWU/uErA+9pW49ofNzt7EpjIzkDJdCOm60TMPymEc8Kea4JEGnfuIGtbFIpbevHEx+h0Ap6kFof7410xSsqX+ZH5cqjHrbWAI2Xzp8V1cQfc=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>, "Wang, Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0916468140=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0916468140==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3602BB4F482647F07C325E3A89940BN8PR12MB3602namp_"

--_000_BN8PR12MB3602BB4F482647F07C325E3A89940BN8PR12MB3602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping ...

BR,
Xiaojie
________________________________
From: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Sent: Wednesday, October 9, 2019 7:08 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Xiao, Jack <Jack.Xiao@amd.com>;=
 Feng, Kenneth <Kenneth.Feng@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Wang=
, Kevin(Yang) <Kevin1.Wang@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Subject: [PATCH 1/2] drm/amd/powerplay: add more feature bits

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 5a34d01f7f7c..44152c1f01c7 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -337,19 +337,22 @@ navi10_get_allowed_feature_mask(struct smu_context *s=
mu,
                                 | FEATURE_MASK(FEATURE_PPT_BIT)
                                 | FEATURE_MASK(FEATURE_TDC_BIT)
                                 | FEATURE_MASK(FEATURE_GFX_EDC_BIT)
+                               | FEATURE_MASK(FEATURE_APCC_PLUS_BIT)
                                 | FEATURE_MASK(FEATURE_VR0HOT_BIT)
                                 | FEATURE_MASK(FEATURE_FAN_CONTROL_BIT)
                                 | FEATURE_MASK(FEATURE_THERMAL_BIT)
                                 | FEATURE_MASK(FEATURE_LED_DISPLAY_BIT)
                                 | FEATURE_MASK(FEATURE_DPM_DCEFCLK_BIT)
                                 | FEATURE_MASK(FEATURE_DS_GFXCLK_BIT)
+                               | FEATURE_MASK(FEATURE_DS_LCLK_BIT)
                                 | FEATURE_MASK(FEATURE_DS_DCEFCLK_BIT)
                                 | FEATURE_MASK(FEATURE_FW_DSTATE_BIT)
                                 | FEATURE_MASK(FEATURE_BACO_BIT)
                                 | FEATURE_MASK(FEATURE_ACDC_BIT)
                                 | FEATURE_MASK(FEATURE_GFX_SS_BIT)
                                 | FEATURE_MASK(FEATURE_APCC_DFLL_BIT)
-                               | FEATURE_MASK(FEATURE_FW_CTF_BIT);
+                               | FEATURE_MASK(FEATURE_FW_CTF_BIT)
+                               | FEATURE_MASK(FEATURE_OUT_OF_BAND_MONITOR_=
BIT);

         if (adev->pm.pp_feature & PP_MCLK_DPM_MASK)
                 *(uint64_t *)feature_mask |=3D FEATURE_MASK(FEATURE_DPM_UC=
LK_BIT)
--
2.20.1


--_000_BN8PR12MB3602BB4F482647F07C325E3A89940BN8PR12MB3602namp_
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
Ping ...</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yuan, Xiaojie &lt;Xia=
ojie.Yuan@amd.com&gt;<br>
<b>Sent:</b> Wednesday, October 9, 2019 7:08 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Xiao, Jack &lt;Jac=
k.Xiao@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan =
&lt;Evan.Quan@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Y=
uan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/2] drm/amd/powerplay: add more feature bits</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.c=
om&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 5 &#43;&#43;&#43;&#43;-<=
br>
&nbsp;1 file changed, 4 insertions(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 5a34d01f7f7c..44152c1f01c7 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -337,19 &#43;337,22 @@ navi10_get_allowed_feature_mask(struct smu_contex=
t *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_PPT_BIT)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_TDC_BIT)<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_GFX_EDC_B=
IT)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_APCC_PLUS_BIT)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_VR0HOT_BI=
T)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_FAN_CONTR=
OL_BIT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_THERMAL_B=
IT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_LED_DISPL=
AY_BIT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_DPM_DCEFC=
LK_BIT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_DS_GFXCLK=
_BIT)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_DS_LCLK_BIT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_DS_DCEFCL=
K_BIT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_FW_DSTATE=
_BIT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_BACO_BIT)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_ACDC_BIT)=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_GFX_SS_BI=
T)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_APCC_DFLL=
_BIT)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_FW_CTF_BIT);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_FW_CTF_BIT)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_OUT_OF_BAND_MONI=
TOR_BIT);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.pp_feature=
 &amp; PP_MCLK_DPM_MASK)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *(uint64_t *)feature_mask |=3D FEATURE_MASK(FEATURE_D=
PM_UCLK_BIT)<br>
-- <br>
2.20.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB3602BB4F482647F07C325E3A89940BN8PR12MB3602namp_--

--===============0916468140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0916468140==--

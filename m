Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3A9D3AC2
	for <lists+amd-gfx@lfdr.de>; Fri, 11 Oct 2019 10:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AD46EBD9;
	Fri, 11 Oct 2019 08:20:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700059.outbound.protection.outlook.com [40.107.70.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 493236EBD9
 for <amd-gfx@lists.freedesktop.org>; Fri, 11 Oct 2019 08:20:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEclQdrDjHE6O8Wf54OOzLN0mRtYKW+D6Uer6urxBhJA5JZUuZWriSQ2rgwrTx807Xc8XYblH8536g6PPxcJl7/xT1Z04IhHNUnj66T1CKGajwl8EAP/Iuu2MRkObPiZ+tc04UIQ0Vovvg6ods0USMkwzmQjHdiqSXwZvQnJtul+fNFPVa14UrVcnsoGgco+btw14SHhUASTwxaEsMZY/tpfaoXWi0Rwn72B6edehiMz6M27Vm6MSnnTllBx6MuTmW6od6mtegNIKtNMuMR2Woor+xPRpaSaoUAuZlb8H6uAjF4sG1J4CafJry6WJ+AZrsgN7zRdfJdx8iD5zfMbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU67q1oVVC8HQB1DZBcS7hz4edQjXbk4in1zDk65tLA=;
 b=P4zxTH5XlnwC3fpgfcIZcFv5sqV+PTP6d08Gqs0ZGdg/NQN/6h2pvUwU09VjS737aXLR/xm21xUOpzts2wgBWPVS92rTNw7jKuUEgMeadqyAZ0iKxO0m8yY/iXvCw4xYCFHyuz3/W5PAovOp7OG7i7F0/ssbFQewLNyivZkAcNYm/lod2PDBZaDs9z+X/PFVml3VI6QNOIz9UxPdGCYUDddf4nunlxIan9Ej0s294WO5yRclo0MXi95kn+ujwOodJ5RntXM498Wztodt5ia65HsVU3hYXPY0q29RHA0qlCDVers4/ZqlWRmuth6ity/7jvzWxeZbEcUpxzlRvv2dNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3331.namprd12.prod.outlook.com (20.178.211.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Fri, 11 Oct 2019 08:20:16 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.021; Fri, 11 Oct 2019
 08:20:16 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Feng, Kenneth"
 <Kenneth.Feng@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: re-enable FW_DSTATE feature bit
Thread-Index: AQHVfpHdm9nABvnAkEes+Y6Iseje4qdST8kAgAA89mOAAOb7AIAAWVoAgAFOs1s=
Date: Fri, 11 Oct 2019 08:20:16 +0000
Message-ID: <BN8PR12MB3602CDCC1180499A29B4F7A389970@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>,
 <20191009110757.30995-2-xiaojie.yuan@amd.com>,
 <DM5PR12MB182077A0796BED759991002EF7950@DM5PR12MB1820.namprd12.prod.outlook.com>
 <BN8PR12MB3602F6E7A20C0F1FE3997FF589950@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <MN2PR12MB3598AD3DF5A31DF503C03EAE8E940@MN2PR12MB3598.namprd12.prod.outlook.com>,
 <CY4PR12MB181316A0DC0FC83741C2D887F7940@CY4PR12MB1813.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB181316A0DC0FC83741C2D887F7940@CY4PR12MB1813.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e469fd35-3c58-4071-2fe8-08d74e23d8a9
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3331:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB33318E20C27AD077323A73B789970@BN8PR12MB3331.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0187F3EA14
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(189003)(199004)(66066001)(99286004)(7696005)(229853002)(966005)(71190400001)(6506007)(102836004)(5660300002)(53546011)(3846002)(6116002)(6436002)(71200400001)(19627235002)(76176011)(4326008)(52536014)(7736002)(25786009)(14444005)(256004)(9686003)(54896002)(6306002)(478600001)(236005)(55016002)(6246003)(33656002)(74316002)(11346002)(66946007)(105004)(2501003)(91956017)(486006)(81156014)(606006)(66556008)(66476007)(81166006)(19627405001)(446003)(64756008)(66446008)(476003)(8676002)(110136005)(76116006)(8936002)(186003)(14454004)(54906003)(2906002)(26005)(316002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3331;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IViGnk6LH9dosQ3IOB66wH64CI51+rwjrnsa8Aed3H6s9H1WUOW/M1kfcS6ncs/xyaz5XyCgElv0fE96JHbWD1i6mdYlVclD5NfHltysBAKYbxCYf2e+DpfGmHlpPYc17hqsjzVd7O+xK1GmSRBz1boHkYPtAEdG62tefI0kEOAJ0h8CfrR4GekSEgEglZ/tCSwIDOrYZ6Wfi6zyvhhhWLJRM3Q+qqEe2xsefu8OtV4dMnDW9T35vWWlZWSpkOLvdbd+D5VSDn77uyMRdv/6fU9fwUPryWHgS4razoYli3XUGfyS4ryjte6d8TTUvq1i+zRGCEUiK45CNmFaziKjxQlqJPIinM/1yiZYdeDlbuBjJx78HVXmC6TANtBxH9IzEHabQGcchgNRaRV1w5VFfpvDAQ6O0OIOwJdkPsWjjZ/YshLclffHEPuq0JOt77En61BGFxFIg6S9t6YZF0q+5w==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e469fd35-3c58-4071-2fe8-08d74e23d8a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2019 08:20:16.0673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a4wY8xz9eUDniw/iOW/VkVi2CgSAf5RAaI2PRV62lQlPbt7oAQofxlP5VHTECLIH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3331
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU67q1oVVC8HQB1DZBcS7hz4edQjXbk4in1zDk65tLA=;
 b=ijQRn+SueIzcAzHskcdb//tuHgouAB2ZoT8UmIaijTeWBgulsXf+K1JsxzdAk7KtxbmxkFHmTnm9Gc1GlMX3xcpp7CPTv+8aI4iKKcs3oLactPcuMe1BTTuRyXCUdchuVD36s/HpKge/yViO6RhqShmGyUJ4L56MxDgDcGDntn0=
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
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0627815518=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0627815518==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3602CDCC1180499A29B4F7A389970BN8PR12MB3602namp_"

--_000_BN8PR12MB3602CDCC1180499A29B4F7A389970BN8PR12MB3602namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

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

--_000_BN8PR12MB3602CDCC1180499A29B4F7A389970BN8PR12MB3602namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Hi there,<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Could someone give an RB or ACK? This patch has been verified on both navi1=
2 and navi14.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Thanks.<br>
</div>
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
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Feng, Kenneth &lt;K=
enneth.Feng@amd.com&gt;<br>
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
p.x_x_MsoNormal, li.x_x_MsoNormal, div.x_x_MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif}
a:link, span.x_x_MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.x_x_MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
p
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif}
span.x_x_EmailStyle18
	{font-family:"Calibri",sans-serif;
	color:#1F497D}
.x_x_MsoChpDefault
	{font-size:10.0pt}
@page WordSection1
	{margin:1.0in 1.25in 1.0in 1.25in}
-->
</style>
<div lang=3D"EN-US">
<div class=3D"x_x_WordSection1">
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:#1F497D">Hi Alex,</span></p>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:#1F497D">This issue was navi10 specific =
and was found in May, 2019.</span></p>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:#1F497D">It was early after the asic bac=
k, then since gfxoff was removed from navi10, we didn=92t really verify whi=
ch firmware version started to have a fix.</span></p>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:#1F497D">For navi14/navi12, there=92s no=
 such issue at all.</span></p>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:#1F497D">Sorry for losing the track of i=
t.</span></p>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:#1F497D">&nbsp;</span></p>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:#1F497D">&nbsp;</span></p>
<div>
<div style=3D"border:none; border-top:solid #E1E1E1 1.0pt; padding:3.0pt 0i=
n 0in 0in">
<p class=3D"x_x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-family:=
&quot;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11=
.0pt; font-family:&quot;Calibri&quot;,sans-serif"> Yuan, Xiaojie
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
<p class=3D"x_x_MsoNormal">&nbsp;</p>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">Hi Alex,</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">For now, gfxoff for navi10 is dis=
abled by default, and I also verified on navi14 with both GFXOFF and FW_DST=
ATE feature bits toggled on.</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">Hi Kenneth / Jack,</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">Could you help to confirm the fir=
mware version?</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">BR,</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt; font-family:&qu=
ot;Calibri&quot;,sans-serif; color:black">Xiaojie</span></p>
</div>
<div class=3D"x_x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_divRplyFwdMsg">
<p class=3D"x_x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-family:=
&quot;Calibri&quot;,sans-serif; color:black">From:</span></b><span style=3D=
"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:black"=
> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">Alexa=
nder.Deucher@amd.com</a>&gt;<br>
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
<p class=3D"x_x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,s=
ans-serif; color:black">What version of firmware has the fix?&nbsp; Was it =
recently fixed?&nbsp; We should check the version if the old one may be out=
 in the wild.</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,s=
ans-serif; color:black">&nbsp;</span></p>
</div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,s=
ans-serif; color:black">Alex</span></p>
</div>
<div class=3D"x_x_MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"x_x_x_divRplyFwdMsg">
<p class=3D"x_x_MsoNormal"><b><span style=3D"font-size:11.0pt; font-family:=
&quot;Calibri&quot;,sans-serif; color:black">From:</span></b><span style=3D=
"font-size:11.0pt; font-family:&quot;Calibri&quot;,sans-serif; color:black"=
> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists.freedesktop.org">amd-=
gfx-bounces@lists.freedesktop.org</a>&gt;
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
<p class=3D"x_x_MsoNormal">&nbsp;</p>
</div>
</div>
<div>
<div>
<p class=3D"x_x_MsoNormal"><span style=3D"font-size:11.0pt">SMU firmware ha=
s fix the bug, so remove this workaround.<br>
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
</body>
</html>

--_000_BN8PR12MB3602CDCC1180499A29B4F7A389970BN8PR12MB3602namp_--

--===============0627815518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0627815518==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC155B730B
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 08:12:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0626F48A;
	Thu, 19 Sep 2019 06:12:18 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820048.outbound.protection.outlook.com [40.107.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207F16F48A
 for <amd-gfx@lists.freedesktop.org>; Thu, 19 Sep 2019 06:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GKDDkKqpY0dagMhnLaMKviv+GQUIWRTgQA6kZLkVuW6FPCltCbvDux2b6BkKNsFlc3c/HS+a5t2ii6tal1J+6oDm3DCcf/VVrNYaCj3HgmAEhQLq3RUQ0YPN5hEwhX5n/7r5Z9Rp9qVAy6DX7+3oXFSR7JRyByyFOh2GdBJ3DYXWdzriFU8IL1erJvaSGVcj3rlAj9Bu7HnTqmNFonmQJKR62HhfwOeAvZlvPVlixGQjf21iW+rvZsK6fvK8p1HxJam7ncFeC1lffiffezw8UbiEZDPNTHPGdgG65Ewo4JQbdv1r5L1N+yEFPqYE47uC5AzCBjpBSdWa9dDLAjoqqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTNmh1vz/OZnbv1+7G19LCLMV3r1XSw8gToevcbMERM=;
 b=GGR/mv2rJpY94D0fTO0n/ZVMU2n7jxnekclvvsZ3vV8bk8SGCJEpyrD+PW/TpLMM/ksvwkWPyWVkX0ANAGQTuSx+pjZoo+aoi3hvY5On/DqYHzy06elLUKb5F6EQ3DOrkcuUQZ8Biipmg5KPK/yaEFABevlgbNoRQatqOG4c9Ovq7nsJtZj9sT54HC/9Dyf/4LHJxlOXHZx+3VPoEwjoH8o6iOc/nx89M4fJOiyRwPV1goTZeBOGup1csXj0neT0H+E1fYRf7W7EK+5BcPAVWN/LuCqFuWBqbn7hlkoMWXWfpjOI3vg0Nf+pIxyVcf5ii7EwHMeeDuDNuyc5VHbVhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1241.namprd12.prod.outlook.com (10.168.236.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 19 Sep 2019 06:12:15 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2284.009; Thu, 19 Sep 2019
 06:12:15 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Xu, Feifei" <Feifei.Xu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading
Thread-Topic: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading
Thread-Index: AQHVbquwjwgi42PZsUmy0MJK8RouUKcygzeAgAABwz4=
Date: Thu, 19 Sep 2019 06:12:15 +0000
Message-ID: <DM5PR12MB253586B329B75BAC8D252CE595890@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <20190919053247.14172-1-tianci.yin@amd.com>,
 <CH2PR12MB37670D6362ADEBD444190252FE890@CH2PR12MB3767.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB37670D6362ADEBD444190252FE890@CH2PR12MB3767.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c6c5f110-3f64-4873-11a5-08d73cc8514b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1241; 
x-ms-traffictypediagnostic: DM5PR12MB1241:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB12415A7E2371DA293FAB57FB95890@DM5PR12MB1241.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:541;
x-forefront-prvs: 016572D96D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(13464003)(53546011)(14444005)(476003)(7696005)(256004)(446003)(76116006)(91956017)(105004)(5660300002)(52536014)(11346002)(66946007)(316002)(8936002)(66556008)(64756008)(66446008)(14454004)(478600001)(110136005)(66476007)(33656002)(66066001)(966005)(25786009)(7736002)(102836004)(74316002)(186003)(55016002)(3846002)(81166006)(6506007)(2501003)(8676002)(19627405001)(9686003)(6436002)(54906003)(229853002)(6246003)(236005)(6116002)(71200400001)(71190400001)(4326008)(86362001)(486006)(81156014)(26005)(606006)(54896002)(76176011)(6306002)(2906002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1241;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OmlVDgidhTcoibodNUgtDjGA/GDI8Ktf0Xwj7wvSjClgwRehEDgfzKFh1fxn/X2M/I7cpUh9yPujD13Ux9Z2Ck26derIaTWbYU3+Dy7wtCW8rDv2tVRyM5sEN/IaBSlz0VQM4iV1OvRuUBLjPBzAmF6QB6ovd1XE6FtUGI5r3A+XdREqtn5YwdeRKGRCUEBzOglhVgasnEnJiAwA7npbqIjco7Ss96Ilpq5UafObFSZEKtgtXUcEAPUfSVdN/DvclpA3z/SeTVFhAawDf/UxYYwxO+pWf4/4fVeyhsftnZlDgUO9gVrp9ctTJ0r7PHPLF2u96sUMwTy+ZW/abtL3KHNBw19FGzvR2XuiVrsQhu1T1o4OkK/xq8xb4exnHuQh3IT+WCysTYWplwCn6cSWw6vMfLLGSOM8rRYKueRhMz0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c5f110-3f64-4873-11a5-08d73cc8514b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2019 06:12:15.0345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B1DqN07KVkWt67IDymT32f23RvTOtUXRPWMi/r4rVM+eDtj/GmMl430tPp/sX9ZeDinloKN0Q5sNithPyyctkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1241
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTNmh1vz/OZnbv1+7G19LCLMV3r1XSw8gToevcbMERM=;
 b=ba3QmE+g8HJcKJO+YcIxbsO66rkkDG5MbQCIV98X7d8JHmntm3PmxBe60G3a2efgYwLA8civGoTOyhN4mr1ds6mVwuxN0i2D0V7WjgRHVvEwJdTL0TEa954Qqpt8FZ9Wn0r0IfsjBUfLFOSVVXD4z64UMX8fGkcekHU5exCP5Ts=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0549686152=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0549686152==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB253586B329B75BAC8D252CE595890DM5PR12MB2535namp_"

--_000_DM5PR12MB253586B329B75BAC8D252CE595890DM5PR12MB2535namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Feifei!
________________________________
From: Xu, Feifei <Feifei.Xu@amd.com>
Sent: Thursday, September 19, 2019 14:05
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Yin, Tianci (Rico) <Tia=
nci.Yin@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: RE: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading



Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Tianci Y=
in
Sent: Thursday, September 19, 2019 1:33 PM
To: amd-gfx@lists.freedesktop.org
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Yin, Tianci (Rico) <Tia=
nci.Yin@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading

From: "Tianci.Yin" <tianci.yin@amd.com>

load different cp firmware according to the DID and RID

Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c
index 082a0b3298a9..65caf404e7d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
@@ -66,6 +66,11 @@ MODULE_FIRMWARE("amdgpu/navi10_mec.bin");
 MODULE_FIRMWARE("amdgpu/navi10_mec2.bin");
 MODULE_FIRMWARE("amdgpu/navi10_rlc.bin");

+MODULE_FIRMWARE("amdgpu/navi14_ce_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_pfp_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_me_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec_wks.bin");
+MODULE_FIRMWARE("amdgpu/navi14_mec2_wks.bin");
 MODULE_FIRMWARE("amdgpu/navi14_ce.bin");
 MODULE_FIRMWARE("amdgpu/navi14_pfp.bin");
 MODULE_FIRMWARE("amdgpu/navi14_me.bin");
@@ -591,7 +596,8 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdgpu_d=
evice *adev)  static int gfx_v10_0_init_microcode(struct amdgpu_device *ade=
v)  {
         const char *chip_name;
-       char fw_name[30];
+       char fw_name[40];
+       char wks[10];
         int err;
         struct amdgpu_firmware_info *info =3D NULL;
         const struct common_firmware_header *header =3D NULL; @@ -604,12 +=
610,16 @@ static int gfx_v10_0_init_microcode(struct amdgpu_device *adev)

         DRM_DEBUG("\n");

+       memset(wks, 0, sizeof(wks));
         switch (adev->asic_type) {
         case CHIP_NAVI10:
                 chip_name =3D "navi10";
                 break;
         case CHIP_NAVI14:
                 chip_name =3D "navi14";
+               if (!(adev->pdev->device =3D=3D 0x7340 &&
+                     adev->pdev->revision !=3D 0x00))
+                       snprintf(wks, sizeof(wks), "_wks");
                 break;
         case CHIP_NAVI12:
                 chip_name =3D "navi12";
@@ -618,7 +628,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_devic=
e *adev)
                 BUG();
         }

-       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp.bin", chip_name);
+       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_pfp%s.bin", chip_name=
,
+wks);
         err =3D request_firmware(&adev->gfx.pfp_fw, fw_name, adev->dev);
         if (err)
                 goto out;
@@ -629,7 +639,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_devic=
e *adev)
         adev->gfx.pfp_fw_version =3D le32_to_cpu(cp_hdr->header.ucode_vers=
ion);
         adev->gfx.pfp_feature_version =3D le32_to_cpu(cp_hdr->ucode_featur=
e_version);

-       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me.bin", chip_name);
+       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_me%s.bin", chip_name,
+wks);
         err =3D request_firmware(&adev->gfx.me_fw, fw_name, adev->dev);
         if (err)
                 goto out;
@@ -640,7 +650,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_devic=
e *adev)
         adev->gfx.me_fw_version =3D le32_to_cpu(cp_hdr->header.ucode_versi=
on);
         adev->gfx.me_feature_version =3D le32_to_cpu(cp_hdr->ucode_feature=
_version);

-       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce.bin", chip_name);
+       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_ce%s.bin", chip_name,
+wks);
         err =3D request_firmware(&adev->gfx.ce_fw, fw_name, adev->dev);
         if (err)
                 goto out;
@@ -705,7 +715,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_devic=
e *adev)
         if (adev->gfx.rlc.is_rlc_v2_1)
                 gfx_v10_0_init_rlc_ext_microcode(adev);

-       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec.bin", chip_name);
+       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec%s.bin", chip_name=
,
+wks);
         err =3D request_firmware(&adev->gfx.mec_fw, fw_name, adev->dev);
         if (err)
                 goto out;
@@ -716,7 +726,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_devic=
e *adev)
         adev->gfx.mec_fw_version =3D le32_to_cpu(cp_hdr->header.ucode_vers=
ion);
         adev->gfx.mec_feature_version =3D le32_to_cpu(cp_hdr->ucode_featur=
e_version);

-       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2.bin", chip_name)=
;
+       snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_mec2%s.bin", chip_nam=
e,
+wks);
         err =3D request_firmware(&adev->gfx.mec2_fw, fw_name, adev->dev);
         if (!err) {
                 err =3D amdgpu_ucode_validate(adev->gfx.mec2_fw);
--
2.17.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM5PR12MB253586B329B75BAC8D252CE595890DM5PR12MB2535namp_
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
Thanks Feifei!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Xu, Feifei &lt;Feifei=
.Xu@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 19, 2019 14:05<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Yin, Tianc=
i (Rico) &lt;Tianci.Yin@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.c=
om&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/gfx10: add support for wks firmware =
loading</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
Reviewed-by: Feifei Xu &lt;Feifei.Xu@amd.com&gt;<br>
<br>
-----Original Message-----<br>
From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf Of Ti=
anci Yin<br>
Sent: Thursday, September 19, 2019 1:33 PM<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Yin, Tianci (Rico=
) &lt;Tianci.Yin@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;<=
br>
Subject: [PATCH] drm/amdgpu/gfx10: add support for wks firmware loading<br>
<br>
From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
<br>
load different cp firmware according to the DID and RID<br>
<br>
Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 22 &#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;------<br>
&nbsp;1 file changed, 16 insertions(&#43;), 6 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/a=
mdgpu/gfx_v10_0.c<br>
index 082a0b3298a9..65caf404e7d1 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c<br>
@@ -66,6 &#43;66,11 @@ MODULE_FIRMWARE(&quot;amdgpu/navi10_mec.bin&quot;);<=
br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/navi10_mec2.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/navi10_rlc.bin&quot;);<br>
&nbsp;<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/navi14_ce_wks.bin&quot;);<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/navi14_pfp_wks.bin&quot;);<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/navi14_me_wks.bin&quot;);<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/navi14_mec_wks.bin&quot;);<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/navi14_mec2_wks.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/navi14_ce.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/navi14_pfp.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/navi14_me.bin&quot;);<br>
@@ -591,7 &#43;596,8 @@ static void gfx_v10_0_check_gfxoff_flag(struct amdg=
pu_device *adev)&nbsp; static int gfx_v10_0_init_microcode(struct amdgpu_de=
vice *adev)&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *chip_name;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char fw_name[30];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char fw_name[40];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char wks[10];<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_firmware_inf=
o *info =3D NULL;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct common_firmwa=
re_header *header =3D NULL; @@ -604,12 &#43;610,16 @@ static int gfx_v10_0_=
init_microcode(struct amdgpu_device *adev)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG(&quot;\n&quot;);=
<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(wks, 0, sizeof(wks));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (adev-&gt;asic_type=
) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; chip_name =3D &quot;navi10&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; chip_name =3D &quot;navi14&quot;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!(adev-&gt;pdev-&gt;device =3D=3D 0x7340 &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pdev-&gt;revisi=
on !=3D 0x00))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(wks=
, sizeof(wks), &quot;_wks&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; chip_name =3D &quot;navi12&quot;;<br>
@@ -618,7 &#43;628,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_d=
evice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; BUG();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &q=
uot;amdgpu/%s_pfp.bin&quot;, chip_name);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name)=
, &quot;amdgpu/%s_pfp%s.bin&quot;, chip_name, <br>
&#43;wks);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D request_firmware(&=
amp;adev-&gt;gfx.pfp_fw, fw_name, adev-&gt;dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto out;<br>
@@ -629,7 &#43;639,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_d=
evice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.pfp_fw_versio=
n =3D le32_to_cpu(cp_hdr-&gt;header.ucode_version);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.pfp_feature_v=
ersion =3D le32_to_cpu(cp_hdr-&gt;ucode_feature_version);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &q=
uot;amdgpu/%s_me.bin&quot;, chip_name);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name)=
, &quot;amdgpu/%s_me%s.bin&quot;, chip_name, <br>
&#43;wks);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D request_firmware(&=
amp;adev-&gt;gfx.me_fw, fw_name, adev-&gt;dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto out;<br>
@@ -640,7 &#43;650,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_d=
evice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.me_fw_version=
 =3D le32_to_cpu(cp_hdr-&gt;header.ucode_version);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.me_feature_ve=
rsion =3D le32_to_cpu(cp_hdr-&gt;ucode_feature_version);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &q=
uot;amdgpu/%s_ce.bin&quot;, chip_name);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name)=
, &quot;amdgpu/%s_ce%s.bin&quot;, chip_name, <br>
&#43;wks);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D request_firmware(&=
amp;adev-&gt;gfx.ce_fw, fw_name, adev-&gt;dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto out;<br>
@@ -705,7 &#43;715,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_d=
evice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;gfx.rlc.is_rl=
c_v2_1)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; gfx_v10_0_init_rlc_ext_microcode(adev);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &q=
uot;amdgpu/%s_mec.bin&quot;, chip_name);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name)=
, &quot;amdgpu/%s_mec%s.bin&quot;, chip_name, <br>
&#43;wks);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D request_firmware(&=
amp;adev-&gt;gfx.mec_fw, fw_name, adev-&gt;dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto out;<br>
@@ -716,7 &#43;726,7 @@ static int gfx_v10_0_init_microcode(struct amdgpu_d=
evice *adev)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.mec_fw_versio=
n =3D le32_to_cpu(cp_hdr-&gt;header.ucode_version);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;gfx.mec_feature_v=
ersion =3D le32_to_cpu(cp_hdr-&gt;ucode_feature_version);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name), &q=
uot;amdgpu/%s_mec2.bin&quot;, chip_name);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(fw_name, sizeof(fw_name)=
, &quot;amdgpu/%s_mec2%s.bin&quot;, chip_name, <br>
&#43;wks);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D request_firmware(&=
amp;adev-&gt;gfx.mec2_fw, fw_name, adev-&gt;dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!err) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; err =3D amdgpu_ucode_validate(adev-&gt;gfx.mec2_fw);<=
br>
--<br>
2.17.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_DM5PR12MB253586B329B75BAC8D252CE595890DM5PR12MB2535namp_--

--===============0549686152==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0549686152==--

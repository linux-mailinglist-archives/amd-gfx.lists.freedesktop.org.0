Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C5F7E7A4
	for <lists+amd-gfx@lfdr.de>; Fri,  2 Aug 2019 03:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501826E85C;
	Fri,  2 Aug 2019 01:47:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750085.outbound.protection.outlook.com [40.107.75.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011196E85C
 for <amd-gfx@lists.freedesktop.org>; Fri,  2 Aug 2019 01:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSIr6WL1CzV5AhDobfKrd6Glokb0dhzqiFD8TJsY77OWiqkYS4gy7aYSAf+44vEoVXRLhPbdHzEnpTC07OVr/O+nzehWWY1JsVz3XjpMEIVKCAdCcowguhCiPmfnd9EHYSVomuSDmYDi9mFP3PspE3QuSvrhqLrloPKValFG3s0W51hnjR7deluOEQRHWvjyjKEnMcGkrXkMYB1RcJ/zYXRlvGsM3iM/GHXbQxydO6klXsP1/qBPE8cvZiJwRym+mLK4n40/ixuauIcu3HjfpZOFZkFbu1p1DGiAJCUsPrDa9kjbGa2hGBD7toocG2oNB0VOCoNLDGvgAhIPfNbXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26C4vvDg99Lw4h0IGjdG1PRDgiLRJ7829k1CTDSwwW0=;
 b=iZVE686yanxGcGF/f3VUqSlBO56U3Kz2MkvDPJh51YOJ49fW5X9gWoB0AaRAxgCMxyJD4ajKhnBoB8h2pp98e8eqUl7bw0QvQCZarax0VNPgqZVz3WLmHc5mHAHYpuH62Il33b5YWW/wkdrr0UEO97KTC7FZzDq7LiRFAAUSLG9HX6m5oqyDiYpfOp63s+EApv/fRmuk0FvQn2hTxoi1iFjkX/miCWrPBRW4UfNYmEKY3oda80CkFV0QPECKZQ80sO1AhN0mUXcLIT2DOHoOfJrEDs70Mb0rKUsA4hFHDUv2jM2KlP29DXkr01Ol95c+aSP2n2rkrht1iJV008JPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) by
 BN8PR12MB3123.namprd12.prod.outlook.com (20.178.210.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 2 Aug 2019 01:47:18 +0000
Received: from BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236]) by BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 01:47:18 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 25/36] drm/amdgpu/smu11: add smu support for navi12
Thread-Topic: [PATCH 25/36] drm/amdgpu/smu11: add smu support for navi12
Thread-Index: AQHVSKf4FyHZiPvH2UqpwcHr9Ii9EKbnFvES
Date: Fri, 2 Aug 2019 01:47:17 +0000
Message-ID: <BN8PR12MB32833822ACBA58C095AE4D0FA2D90@BN8PR12MB3283.namprd12.prod.outlook.com>
References: <20190801202957.29791-1-alexander.deucher@amd.com>,
 <20190801202957.29791-26-alexander.deucher@amd.com>
In-Reply-To: <20190801202957.29791-26-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa999b9e-6a91-463d-b0f3-08d716eb5a10
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3123; 
x-ms-traffictypediagnostic: BN8PR12MB3123:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB31235B2ACFA52541E54500E2A2D90@BN8PR12MB3123.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:660;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(199004)(189003)(105004)(486006)(9686003)(11346002)(7696005)(256004)(102836004)(53546011)(446003)(6506007)(19627405001)(71200400001)(71190400001)(81156014)(81166006)(8936002)(2906002)(99286004)(4326008)(478600001)(14444005)(55016002)(33656002)(25786009)(236005)(7736002)(54896002)(6306002)(8676002)(3846002)(68736007)(6116002)(74316002)(476003)(110136005)(316002)(2501003)(966005)(14454004)(76176011)(66476007)(64756008)(66446008)(54906003)(91956017)(66556008)(66946007)(6246003)(229853002)(86362001)(76116006)(5660300002)(6436002)(52536014)(26005)(53936002)(606006)(186003)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3123;
 H:BN8PR12MB3283.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gR9kaj4QeuFFRUVRvsFus08O0eJInjznQnLr9DEtjq6EGZYVel74lYiPganJTnI1sDQbEet0UeC3sGaa1JN+/M77Yga0SwS9aVGqAymB5dHPxFCyYf4BaCwPJogeTTGJkyzFMBN4FxKa5Zl+T09Dys9Wo3Ofm/M4XqFOkHv3rR4Gl2bLv2QPKASaUfLGhIr+E0KparGFka32vItrLJWrVKNUKjYnTrQE80WnXyw9c4eR3f9pVA5c/Kkbr783i4UYnRVoRWLV5Y/x6jXaM2Orzs3Lg4VNa3+FS5QweJ9motQVhG4ZWzAwJyiR5y6kmsSGUVXEZ3R5vVKBhVhZ6gRitZL4HoqXx2n41vIuFD38U3dRnA7bGWifn6w1edBtd0usub41XETcUYCNlkRecPUbSe0xCgleuNRFgosarCGV4Xo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa999b9e-6a91-463d-b0f3-08d716eb5a10
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 01:47:17.8524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3123
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26C4vvDg99Lw4h0IGjdG1PRDgiLRJ7829k1CTDSwwW0=;
 b=PEAoSn+b3a4iSCnq8kDHHivd7N+3I97r/Celp3E5xp+76obdphpHfVtEOksML+O0C46kEVMuPRJVPPRdX8ESVecyCWNItv9zvMy88h0I2xX1GNtc+yKYSfS9xHsVx061DxG92E194HLDEhQzkIvYPE8Rmh3Lige4IzTjTITL6Ss=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============2079485385=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2079485385==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB32833822ACBA58C095AE4D0FA2D90BN8PR12MB3283namp_"

--_000_BN8PR12MB32833822ACBA58C095AE4D0FA2D90BN8PR12MB3283namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevni1.wang@amd.com>

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Alex Deu=
cher <alexdeucher@gmail.com>
Sent: Friday, August 2, 2019 4:29 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Zhang, Hawking <Hawking=
.Zhang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Yuan, Xiaojie <Xiaojie.Yua=
n@amd.com>
Subject: [PATCH 25/36] drm/amdgpu/smu11: add smu support for navi12

From: Xiaojie Yuan <xiaojie.yuan@amd.com>

Same as other Navi asics.

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 1 +
 drivers/gpu/drm/amd/powerplay/smu_v11_0.c  | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 46976c90843b..5a613df174e6 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -720,6 +720,7 @@ static int smu_set_funcs(struct amdgpu_device *adev)
         case CHIP_VEGA20:
         case CHIP_NAVI10:
         case CHIP_NAVI14:
+       case CHIP_NAVI12:
         case CHIP_ARCTURUS:
                 if (adev->pm.pp_feature & PP_OVERDRIVE_MASK)
                         smu->od_enabled =3D true;
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c
index 43fcbdbba630..84eb14a6650f 100644
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
+++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
@@ -46,6 +46,7 @@ MODULE_FIRMWARE("amdgpu/vega20_smc.bin");
 MODULE_FIRMWARE("amdgpu/arcturus_smc.bin");
 MODULE_FIRMWARE("amdgpu/navi10_smc.bin");
 MODULE_FIRMWARE("amdgpu/navi14_smc.bin");
+MODULE_FIRMWARE("amdgpu/navi12_smc.bin");

 #define SMU11_VOLTAGE_SCALE 4

@@ -163,6 +164,9 @@ static int smu_v11_0_init_microcode(struct smu_context =
*smu)
         case CHIP_NAVI14:
                 chip_name =3D "navi14";
                 break;
+       case CHIP_NAVI12:
+               chip_name =3D "navi12";
+               break;
         default:
                 BUG();
         }
@@ -1331,6 +1335,7 @@ static int smu_v11_0_gfx_off_control(struct smu_conte=
xt *smu, bool enable)
                 break;
         case CHIP_NAVI10:
         case CHIP_NAVI14:
+       case CHIP_NAVI12:
                 if (!(adev->pm.pp_feature & PP_GFXOFF_MASK))
                         return 0;
                 mutex_lock(&smu->mutex);
@@ -1754,6 +1759,7 @@ void smu_v11_0_set_smu_funcs(struct smu_context *smu)
                 break;
         case CHIP_NAVI10:
         case CHIP_NAVI14:
+       case CHIP_NAVI12:
                 navi10_set_ppt_funcs(smu);
                 break;
         default:
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB32833822ACBA58C095AE4D0FA2D90BN8PR12MB3283namp_
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
Reviewed-by: Kevin Wang &lt;kevni1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Alex Deucher &lt;alexdeucher@=
gmail.com&gt;<br>
<b>Sent:</b> Friday, August 2, 2019 4:29 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Zhang, Haw=
king &lt;Hawking.Zhang@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.com&gt;; Y=
uan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Subject:</b> [PATCH 25/36] drm/amdgpu/smu11: add smu support for navi12<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">From: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br=
>
<br>
Same as other Navi asics.<br>
<br>
Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
Reviewed-by: Hawking Zhang &lt;Hawking.Zhang@amd.com&gt;<br>
Reviewed-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
Signed-off-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 1 &#43;<br>
&nbsp;drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp; | 6 &#43;&#43;&#43;&#=
43;&#43;&#43;<br>
&nbsp;2 files changed, 7 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 46976c90843b..5a613df174e6 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -720,6 &#43;720,7 @@ static int smu_set_funcs(struct amdgpu_device *adev=
)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VEGA20:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_ARCTURUS:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.pp_feature &amp; PP_OVERDRIVE_MASK)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&=
gt;od_enabled =3D true;<br>
diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/am=
d/powerplay/smu_v11_0.c<br>
index 43fcbdbba630..84eb14a6650f 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
@@ -46,6 &#43;46,7 @@ MODULE_FIRMWARE(&quot;amdgpu/vega20_smc.bin&quot;);<b=
r>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/arcturus_smc.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/navi10_smc.bin&quot;);<br>
&nbsp;MODULE_FIRMWARE(&quot;amdgpu/navi14_smc.bin&quot;);<br>
&#43;MODULE_FIRMWARE(&quot;amdgpu/navi12_smc.bin&quot;);<br>
&nbsp;<br>
&nbsp;#define SMU11_VOLTAGE_SCALE 4<br>
&nbsp;<br>
@@ -163,6 &#43;164,9 @@ static int smu_v11_0_init_microcode(struct smu_cont=
ext *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; chip_name =3D &quot;navi14&quot;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; chip_name =3D &quot;navi12&quot;;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; BUG();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
@@ -1331,6 &#43;1335,7 @@ static int smu_v11_0_gfx_off_control(struct smu_c=
ontext *smu, bool enable)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;pm.pp_feature &amp; PP_GFXOFF_MASK))<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;smu-&gt;mutex);<br>
@@ -1754,6 &#43;1759,7 @@ void smu_v11_0_set_smu_funcs(struct smu_context *=
smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI12:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; navi10_set_ppt_funcs(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB32833822ACBA58C095AE4D0FA2D90BN8PR12MB3283namp_--

--===============2079485385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2079485385==--

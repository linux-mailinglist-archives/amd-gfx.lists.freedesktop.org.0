Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12106AC6E
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 18:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA0D89F35;
	Tue, 16 Jul 2019 16:03:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680057.outbound.protection.outlook.com [40.107.68.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244FA89F35
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 16:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITkznCmQJrZLdq5WaQlCximwAa9Z8brQ1ili2QcALQlejS36Pz1NAd0JruPXOLpke3pbEPWvI8N6plOr42RAgJNnRAF9WadsUoiLqLPu1N8dEIJzzL2kPZf1RI/XjS8SywvnGelqLkoZNAdiIywtxmdO0ZVw5cnhxGXnWOvIMb9vLnffw/Dzhisv0/pHGKEkFjm0cGGuJW46sS3P/IDIg4FPRhlbBGFWsfr9JAVJ2C373tIyZoDyb181HMwgqir0RFqHaWz7TUNrpRWxEbSS4k1WSEVb/RyuqNHi2Hdf78FP7gLBpPxEosA7HvUJoqnUfZ7WlprJHt1sUVMJDveVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwtYYXM3VuJrXh8ptCOiAkr1AtFMewyvn+Brj7pjK9U=;
 b=RQBS/flGre0pe9uFvSYBx6OtJHtXQ5dXIHVdbTHew1+EOk1ipFpekdM0BP5wBXXXBXvXbrYfgwesjBTPEvFx9LSJ/PX/YxJ9F8xLJUcJ2acC3F6nzvuSDLY6Dkl3dPf4OK4PoSHjEFkXMwLE478YMpeqorr4BHn0Q2ENOKECECpvP6jPavgMpcY3JrKhZw1K6R+DlpS9yiklxHHcaoPdk/mi7hsPBM8VVUXHWzjZ0I5E6NuSRlxmbj02smweF1rv0Dw+eYFbQjQVQWtajAb0T0sPe23stXI0c/mdtgXx9gzTU4hbtvYpACQWzhn2IdjInrftkyu/0HAQjOGiG5Z5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1732.namprd12.prod.outlook.com (10.175.101.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Tue, 16 Jul 2019 16:03:00 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 16:03:00 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/psp11: check if prior to navi10 for sram map
Thread-Topic: [PATCH] drm/amdgpu/psp11: check if prior to navi10 for sram map
Thread-Index: AQHVO+7cMl0QvSNM2Uq8jyBjFUD2H6bNZ/Qs
Date: Tue, 16 Jul 2019 16:03:00 +0000
Message-ID: <BN6PR12MB18096684A232AD7A6564D06EF7CE0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190716155456.11236-1-xiaojie.yuan@amd.com>
In-Reply-To: <20190716155456.11236-1-xiaojie.yuan@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.21.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d84a0068-eca8-4512-ee6a-08d70a07137b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1732; 
x-ms-traffictypediagnostic: BN6PR12MB1732:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1732749A08C4DE54CEC77AD8F7CE0@BN6PR12MB1732.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(199004)(189003)(76116006)(66066001)(66556008)(54906003)(110136005)(74316002)(316002)(66476007)(6506007)(66446008)(64756008)(53546011)(33656002)(9686003)(19627405001)(25786009)(102836004)(236005)(7736002)(2501003)(53936002)(55016002)(2906002)(99286004)(54896002)(66946007)(14454004)(68736007)(486006)(76176011)(105004)(81166006)(81156014)(606006)(5660300002)(26005)(86362001)(966005)(7696005)(71200400001)(71190400001)(186003)(8676002)(478600001)(229853002)(6306002)(6436002)(11346002)(446003)(4326008)(52536014)(6246003)(8936002)(256004)(3846002)(476003)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1732;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: brq1mai44AP1vGkXG2XCFd5UY9R4M2X+7/UBerQ7CW1KXq+45rUuRD2FLYywGjFUjlxKDte9qPhq6BueAxpTuf9PNKQhbWML10kftgnVy1v8YxEFnBKsF9tJVjVqKJlNclc/mToPSjlEKB6JyJtrFQgR0d/keIjdqhe4kd1Y5Lm2gWLUy1XdzDyWtfx35ATuSO8NPqHZSfZZYqEh+/sPxCh6UFHCXoaAg41OTG6oXUC9KXgGPJxMPSYdckPJBRGsjnRfrvQK2qV4gK1C3jo+pw5+YkE3z46obXWV/rl5DUJtbMzE2G8qyajIvRZb9DYm22G+oczMsINo1M0YFL6TtilsuyrS17fFl/kfMawd2tnkS/xzb82VXXEOkPm6nmnPCjONf+giwc7QKq9hcnFQ3dUzxpee6mjsa1YDUGUdi2s=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84a0068-eca8-4512-ee6a-08d70a07137b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 16:03:00.3572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1732
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwtYYXM3VuJrXh8ptCOiAkr1AtFMewyvn+Brj7pjK9U=;
 b=DrJ+96NPKNNyyy3idHCgZmjJq0JJT7X8Pkx+WzTjecRd2hxXWJ9a2bqOIssTJOYk07O8Ca4+vFjeK1Fi4FZzPzqU2BZIlpxYKzcNMX2XYxkqVzZ/in+ZL8oGS/2LwPOLGA8OwObPNih5b9M+gcDHRkzbim/GcuMU2U4aDv5XD5A=
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
Cc: "tao1.zhou@amd.com" <tao1.zhou@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1200469434=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1200469434==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18096684A232AD7A6564D06EF7CE0BN6PR12MB1809namp_"

--_000_BN6PR12MB18096684A232AD7A6564D06EF7CE0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Yuan, Xi=
aojie <Xiaojie.Yuan@amd.com>
Sent: Tuesday, July 16, 2019 11:55 AM
To: amd-gfx@lists.freedesktop.org
Cc: tao1.zhou@amd.com; Xiao, Jack; Yuan, Xiaojie; Zhang, Hawking
Subject: [PATCH] drm/amdgpu/psp11: check if prior to navi10 for sram map

Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/psp_v11_0.c
index 87596c69b235..a8b526dbb6c6 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c
@@ -538,7 +538,7 @@ psp_v11_0_sram_map(struct amdgpu_device *adev,

         case AMDGPU_UCODE_ID_RLC_G:
                 *sram_offset =3D 0x2000;
-               if (adev->asic_type !=3D CHIP_NAVI10) {
+               if (adev->asic_type < CHIP_NAVI10) {
                         *sram_addr_reg_offset =3D SOC15_REG_OFFSET(GC, 0, =
mmRLC_GPM_UCODE_ADDR);
                         *sram_data_reg_offset =3D SOC15_REG_OFFSET(GC, 0, =
mmRLC_GPM_UCODE_DATA);
                 }
@@ -550,7 +550,7 @@ psp_v11_0_sram_map(struct amdgpu_device *adev,

         case AMDGPU_UCODE_ID_SDMA0:
                 *sram_offset =3D 0x0;
-               if (adev->asic_type !=3D CHIP_NAVI10) {
+               if (adev->asic_type < CHIP_NAVI10) {
                         *sram_addr_reg_offset =3D SOC15_REG_OFFSET(SDMA0, =
0, mmSDMA0_UCODE_ADDR);
                         *sram_data_reg_offset =3D SOC15_REG_OFFSET(SDMA0, =
0, mmSDMA0_UCODE_DATA);
                 }
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18096684A232AD7A6564D06EF7CE0BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Yuan, Xiaojie &lt;Xiaojie.Yua=
n@amd.com&gt;<br>
<b>Sent:</b> Tuesday, July 16, 2019 11:55 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> tao1.zhou@amd.com; Xiao, Jack; Yuan, Xiaojie; Zhang, Hawking<br>
<b>Subject:</b> [PATCH] drm/amdgpu/psp11: check if prior to navi10 for sram=
 map</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.c=
om&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/psp_v11_0.c | 4 &#43;&#43;--<br>
&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/psp_v11_0.c<br>
index 87596c69b235..a8b526dbb6c6 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/psp_v11_0.c<br>
@@ -538,7 &#43;538,7 @@ psp_v11_0_sram_map(struct amdgpu_device *adev,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_RLC_G=
:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *sram_offset =3D 0x2000;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;asic_type !=3D CHIP_NAVI10) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;asic_type &lt; CHIP_NAVI10) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sram=
_addr_reg_offset =3D SOC15_REG_OFFSET(GC, 0, mmRLC_GPM_UCODE_ADDR);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sram=
_data_reg_offset =3D SOC15_REG_OFFSET(GC, 0, mmRLC_GPM_UCODE_DATA);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
@@ -550,7 &#43;550,7 @@ psp_v11_0_sram_map(struct amdgpu_device *adev,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_UCODE_ID_SDMA0=
:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *sram_offset =3D 0x0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;asic_type !=3D CHIP_NAVI10) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (adev-&gt;asic_type &lt; CHIP_NAVI10) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sram=
_addr_reg_offset =3D SOC15_REG_OFFSET(SDMA0, 0, mmSDMA0_UCODE_ADDR);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sram=
_data_reg_offset =3D SOC15_REG_OFFSET(SDMA0, 0, mmSDMA0_UCODE_DATA);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
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

--_000_BN6PR12MB18096684A232AD7A6564D06EF7CE0BN6PR12MB1809namp_--

--===============1200469434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1200469434==--

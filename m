Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FD65344
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 10:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61B76E160;
	Thu, 11 Jul 2019 08:37:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790044.outbound.protection.outlook.com [40.107.79.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61DE16E160
 for <amd-gfx@lists.freedesktop.org>; Thu, 11 Jul 2019 08:37:57 +0000 (UTC)
Received: from MN2PR12MB2974.namprd12.prod.outlook.com (20.178.240.140) by
 MN2PR12MB2944.namprd12.prod.outlook.com (20.179.81.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 11 Jul 2019 08:37:55 +0000
Received: from MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::6936:7406:cb91:95c9]) by MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::6936:7406:cb91:95c9%3]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 08:37:55 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Xu, Feifei" <Feifei.Xu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in
 hw_id_map array
Thread-Topic: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in
 hw_id_map array
Thread-Index: AQHVN77Y/66d5guktkaQz+211xHt96bFFcEAgAACe6c=
Date: Thu, 11 Jul 2019 08:37:55 +0000
Message-ID: <MN2PR12MB2974F5A73CFA2BC7106E8C9C95F30@MN2PR12MB2974.namprd12.prod.outlook.com>
References: <1562832050-28203-1-git-send-email-tianci.yin@amd.com>,
 <CH2PR12MB3767908A917424D54CDC6CDAFEF30@CH2PR12MB3767.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB3767908A917424D54CDC6CDAFEF30@CH2PR12MB3767.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 028a2ade-9280-4ba0-e028-08d705db1214
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2944; 
x-ms-traffictypediagnostic: MN2PR12MB2944:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB2944192232A9A2771641CFF395F30@MN2PR12MB2944.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(199004)(13464003)(189003)(229853002)(8936002)(2501003)(54906003)(53936002)(54896002)(68736007)(316002)(3846002)(6436002)(105004)(6116002)(6306002)(11346002)(14444005)(99286004)(478600001)(74316002)(446003)(256004)(7736002)(110136005)(102836004)(71200400001)(33656002)(476003)(66946007)(6246003)(86362001)(8676002)(66446008)(81166006)(966005)(81156014)(4326008)(19627405001)(26005)(76116006)(52536014)(5660300002)(91956017)(14454004)(64756008)(9686003)(186003)(66066001)(71190400001)(55016002)(53546011)(76176011)(486006)(7696005)(236005)(6506007)(66556008)(2906002)(25786009)(66476007)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2944;
 H:MN2PR12MB2974.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9wGoue0oAoydvmtyw9wvLkNUELwCijM08am2IZ13BYT1sjRGxcLSeGi0EXewY1k4yqm+hBHkEukZ4HBVs5mRm6ZSmIg8AXZN4x0W1/CbJ/WT9cM3eNDvMeiOpUxHBdtWDaBQaEltvnmBdSX88t8C8mgdc35FrP9Yg6R/7qE8Vg/Bj/bvF6yPlS50cVoS5rP0m2a/2SAKeMsWCWGhS1ZIB5la7UTD6m6PwyxLAkjRqbDtzQda2zpCDe7Ctp6sjdRI0msi2TMQqLaQ3TYSohUf4n8XHDLYF6xLpysTePZhynAG9sN35iVcPNohFeoyYsmWAAfOOHOmOsUJreG3t3xRY9WIWWyre9ebFqq6ItZv5FPFkdqcx0dgCzS2N77ZTqOn3oaI25fVtW02PJOdiJXp7v9cfkgkEiFvq/ex9nSK1AA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 028a2ade-9280-4ba0-e028-08d705db1214
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 08:37:55.3680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiancyin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2944
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0puilyZir9b9x9TElc6FjRLh1o29yHjIaLRZBeEGdo=;
 b=o4ULQKe0+4n+wHlRjIS+i9bPmNw8GGUiW+QrxBH2JHKMzUL1wuUv9SvjTJ5JCcq4PA4BLVrLYx2Qxo/bxbSJAPWv0yAQ/0bOciPXfsANRMIClWIS89jFY+DUvS317KsfpT20X14yBFSk/GCAkEgrcFHVbclCoBnl82kPWAugTjU=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============0507021710=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0507021710==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2974F5A73CFA2BC7106E8C9C95F30MN2PR12MB2974namp_"

--_000_MN2PR12MB2974F5A73CFA2BC7106E8C9C95F30MN2PR12MB2974namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Thanks Feifei and Xiaojie!
________________________________
From: Xu, Feifei
Sent: Thursday, July 11, 2019 16:28
To: Yin, Tianci (Rico); amd-gfx@lists.freedesktop.org
Cc: Xiao, Jack; Yuan, Xiaojie; Yin, Tianci (Rico); Zhang, Hawking
Subject: RE: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in hw=
_id_map array

Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>

Regards,
Feifei

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Tianci Y=
in
Sent: 2019=1B$BG/=1B(B7=1B$B7n=1B(B11=1B$BF|=1B(B 16:01
To: amd-gfx@lists.freedesktop.org
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Y=
in, Tianci (Rico) <Tianci.Yin@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.c=
om>
Subject: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in hw_id_=
map array

From: tiancyin <tianci.yin@amd.com>

ID of DCE_HWIP from vbios is DMU_HWID,
mismatch cause null pointer crash in navi10 modprobe.

Change-Id: I3be363cf5248de904b3bdae2f34d3bbe0bbbc07d
Signed-off-by: tiancyin <tianci.yin@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_discovery.c
index e049ae6..1481899 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -123,7 +123,7 @@ static int hw_id_map[MAX_HWIP] =3D {
         [UVD_HWIP]      =3D UVD_HWID,
         [VCE_HWIP]      =3D VCE_HWID,
         [DF_HWIP]       =3D DF_HWID,
-       [DCE_HWIP]      =3D DCEAZ_HWID,
+       [DCE_HWIP]      =3D DMU_HWID,
         [OSSSYS_HWIP]   =3D OSSSYS_HWID,
         [SMUIO_HWIP]    =3D SMUIO_HWID,
         [PWR_HWIP]      =3D PWR_HWID,
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB2974F5A73CFA2BC7106E8C9C95F30MN2PR12MB2974namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks Feifei and Xiaojie!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Xu, Feifei<br>
<b>Sent:</b> Thursday, July 11, 2019 16:28<br>
<b>To:</b> Yin, Tianci (Rico); amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Xiao, Jack; Yuan, Xiaojie; Yin, Tianci (Rico); Zhang, Hawking<br=
>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping erro=
r in hw_id_map array</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Reviewed-by: Feifei Xu &lt;Feifei.Xu@amd.com&gt;<b=
r>
<br>
Regards,<br>
Feifei<br>
<br>
-----Original Message-----<br>
From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf Of Ti=
anci Yin<br>
Sent: 2019=1B$BG/=1B(B7=1B$B7n=1B(B11=1B$BF|=1B(B 16:01<br>
To: amd-gfx@lists.freedesktop.org<br>
Cc: Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@am=
d.com&gt;; Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; Zhang, Hawking &l=
t;Hawking.Zhang@amd.com&gt;<br>
Subject: [PATCH] drm/amdgpu/discovery: fix DCE_HWIP mapping error in hw_id_=
map array<br>
<br>
From: tiancyin &lt;tianci.yin@amd.com&gt;<br>
<br>
ID of DCE_HWIP from vbios is DMU_HWID,<br>
mismatch cause null pointer crash in navi10 modprobe.<br>
<br>
Change-Id: I3be363cf5248de904b3bdae2f34d3bbe0bbbc07d<br>
Signed-off-by: tiancyin &lt;tianci.yin@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_discovery.c<br>
index e049ae6..1481899 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
@@ -123,7 &#43;123,7 @@ static int hw_id_map[MAX_HWIP] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [UVD_HWIP]&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =3D UVD_HWID,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [VCE_HWIP]&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =3D VCE_HWID,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DF_HWIP]&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; =3D DF_HWID,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DCE_HWIP]&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; =3D DCEAZ_HWID,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [DCE_HWIP]&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; =3D DMU_HWID,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [OSSSYS_HWIP]&nbsp;&nbsp; =
=3D OSSSYS_HWID,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [SMUIO_HWIP]&nbsp;&nbsp;&n=
bsp; =3D SMUIO_HWID,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [PWR_HWIP]&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; =3D PWR_HWID,<br>
-- <br>
2.7.4<br>
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

--_000_MN2PR12MB2974F5A73CFA2BC7106E8C9C95F30MN2PR12MB2974namp_--

--===============0507021710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0507021710==--

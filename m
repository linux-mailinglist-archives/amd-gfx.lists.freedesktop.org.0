Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78423B5EA8
	for <lists+amd-gfx@lfdr.de>; Wed, 18 Sep 2019 10:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D52B6EE44;
	Wed, 18 Sep 2019 08:08:17 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740059.outbound.protection.outlook.com [40.107.74.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C9746EE44
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 08:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ktoSEQ4UVT22r6tqwpVE8Ebs18PhB7vApWcM6AGNhMicQ6ZAkwOgFaSP2vRr4bbW/RhbL0S3ATkD8XwTpyWIlUNahlEuv9lSqHjgFARoT4tkVp573KVAe84rmSG6IKwCHZ6Ew5P1pGWwqOhOLFXH77i4PRD6Q82HXRT+Br82TW/1U7DDb19moMx2BQpqr8KsbQJjl+/xKmdWC4E5ZnTs3oq3I0GadvyIeMDPBUxRNkcQuhB0ui7/gKpiMrTCC400Z4whNOt/QMQmwcoTyaj8pGgK7RwvdCH9+7W/kb0Arr7ubIrBF+HEpibkX5kwAXqH7w3dMrozNWOuq5MOdp0WzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=060aB7ldD/O+LcYF9XRm+din/zazRZIUYlIMLP8oZl4=;
 b=nGEANXFmYGs/CslaemForK+9fAHHA212hJalE5NLHXgqrIHAR20QGKlIxK5q0MqDvRFnF76g0lIkeZlOSxqvN9nQe87338ZEcWsetj7kSS2Jdp2+hLZfrSKz8MWkqIUsxY1u6ea0bSam/9o2NIWx5XBeErhsuUElIvylbrnokB+FyTYETbVIFVd3B4IToLNn7Aucq8D9hph3ApPcivSWdc2C5GLCzXlq1ZXSGBd7koL9tWoCpu1HHtaYKYAtH05DpHFRHjuE+G0LBpH9G40Kql7QaIDSL75TUX1SytM0UBeAkp55TLVbJy+XLvGLCt0VC5UYCdvGPGoyk4Lvpp3FsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2975.namprd12.prod.outlook.com (20.178.243.142) by
 MN2PR12MB3359.namprd12.prod.outlook.com (20.178.241.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.23; Wed, 18 Sep 2019 08:08:14 +0000
Received: from MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e]) by MN2PR12MB2975.namprd12.prod.outlook.com
 ([fe80::3dbc:12f8:fbba:1e7e%7]) with mapi id 15.20.2263.023; Wed, 18 Sep 2019
 08:08:14 +0000
From: "Deng, Emily" <Emily.Deng@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhang, Jack (Jian)"
 <Jack.Zhang1@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Topic: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or
 passthrough
Thread-Index: AQHVbfIt4A0vWNSxs0uR7HT9TWLKVKcxCnYAgAAF+4CAAAKQQA==
Date: Wed, 18 Sep 2019 08:08:13 +0000
Message-ID: <MN2PR12MB2975F41EE42811399F0016C28F8E0@MN2PR12MB2975.namprd12.prod.outlook.com>
References: <20190918072445.3559-1-Jack.Zhang1@amd.com>,
 <DM6PR12MB367564A4AAC093F841D88018BB8E0@DM6PR12MB3675.namprd12.prod.outlook.com>
 <2a7e5c50-7af0-4af1-a46d-834943ab810c@email.android.com>
In-Reply-To: <2a7e5c50-7af0-4af1-a46d-834943ab810c@email.android.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f32c9b5b-450c-4da3-bd7e-08d73c0f5ab2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3359; 
x-ms-traffictypediagnostic: MN2PR12MB3359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3359B29785FA19A1E67F741A8F8E0@MN2PR12MB3359.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01644DCF4A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(396003)(39860400002)(366004)(376002)(199004)(189003)(13464003)(9686003)(66556008)(6506007)(6636002)(6246003)(81156014)(64756008)(52536014)(26005)(8676002)(99286004)(33656002)(74316002)(8936002)(66066001)(66446008)(76116006)(71190400001)(102836004)(76176011)(66946007)(53546011)(7696005)(54896002)(446003)(476003)(11346002)(5660300002)(86362001)(486006)(256004)(66476007)(236005)(71200400001)(9326002)(81166006)(2906002)(478600001)(7736002)(4326008)(55016002)(6436002)(186003)(6306002)(316002)(790700001)(3846002)(14454004)(229853002)(54906003)(25786009)(110136005)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3359;
 H:MN2PR12MB2975.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bdQFr3dgd2iP0LPKMMTwbAsCTGyahdsX0IFD8lxEzvQOQA/C8coWaPSou+7MECKXA3hO/ISamEVZxi4hUoRluOb8ki1pYo97ch+Eps5n9J9bN3nw6PHwA6ym2QwzDfwoCZ/zqJ/IwSYwgS948t3SuTz3MBtQd85FHSbYejV3W/5YjRWQ7iGw8lZJI3RbYUEA1wPsYr5sqyNLGrz/xbFkO3x8cro/8DOEWLKkFIKDj8MU9cQgpIUBY2LzzZWHwguISzImakOdMehP4BUNmt+iUPWDusTjPNGblgkzwOsNIVsTVrvdnynxYPHQUzEkYA9cZaKsFXnflZ2rRoTt70YPzASdOdLXsr9z0cdR2iYxwWJIJkUCJkQwuzepd8y2ooL/WVihE/S5iQkguj3rd+EphaLhMoT8go6GbD/svdRh9Vo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32c9b5b-450c-4da3-bd7e-08d73c0f5ab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2019 08:08:13.8424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FwpNvoMseeQeWg49ai8YGjJXWgXyiWGQ6NPoO9HRMcYlIZIbGW/EQ+OEq1rcmkm4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3359
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=060aB7ldD/O+LcYF9XRm+din/zazRZIUYlIMLP8oZl4=;
 b=Zx0+NfTFiQfZ7oxiMIS+J908RBXcWOVKstiZYUvHHb+JRK9Z13YaPwTF5uz0BG/MprMeuyx1XaKVgRQVnIdvb0DMOdpgEfw8GqR02FTEUwbAA1RARHz/DyScFelItvo+nmj+0kpaIgwq1dBcLEFL28JkLYQT0NJiqiEnKDUvRd0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Emily.Deng@amd.com; 
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
Cc: "Cui, Flora" <Flora.Cui@amd.com>, "Teng, Rui" <Rui.Teng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1057948386=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1057948386==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2975F41EE42811399F0016C28F8E0MN2PR12MB2975namp_"

--_000_MN2PR12MB2975F41EE42811399F0016C28F8E0MN2PR12MB2975namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Christian,
     Before unloading driver, user must sure there is not any userspace to =
use of amdgpu, if not, it will report driver is in use. And the unloading d=
river is a feature about amdgpu driver which will be easier to replace driv=
er without rebooting VM. Do you think it has any issue about driver unloadi=
ng path?

Best wishes
Emily Deng
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, September 18, 2019 3:54 PM
To: Zhang, Jack (Jian) <Jack.Zhang1@amd.com>
Cc: amd-gfx@lists.freedesktop.org; Teng, Rui <Rui.Teng@amd.com>; Deng, Emil=
y <Emily.Deng@amd.com>; Cui, Flora <Flora.Cui@amd.com>
Subject: RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or pass=
through

Hi Jack,

Well that believe is unfortunately completely wrong.

The point is that ANY use of amdgpu by userspace will prevent correct drive=
r unload, that qxl is used for the fbcon doesn't change anything here.

So the patch is a clear NAK. Driver unload is not supposed to work even und=
er SRIOV.

Regards,
Christian.



Am 18.09.2019 09:32 schrieb "Zhang, Jack (Jian)" <Jack.Zhang1@amd.com<mailt=
o:Jack.Zhang1@amd.com>>:
Hi, Christian and folks,

In virtual machines(such virt-manager), there's always a virtual graphics d=
evice existed like "qxl" as the default gfx device.
So under such condition, we believe it's reasonable to unload amdgpu driver=
 as it is not treated as the default fbcon device.

Would you please help to review this patch?

Best wishes,
Jack

-----Original Message-----
From: Jack Zhang <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Sent: Wednesday, September 18, 2019 3:25 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
Cc: Zhang, Jack (Jian) <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthro=
ugh

In virtual machine, there would be a qxl or cirrus graphics device as the d=
efault master fbcon device.

So for PF(passthrough mode) or SRIOV VF, it is reasonable to unload amdgpu =
driver. Amdgpu doesn't have to be the only fbcon device under this conditio=
n.

Signed-off-by: Jack Zhang <Jack.Zhang1@amd.com<mailto:Jack.Zhang1@amd.com>>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c
index 420888e..ada2b25 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1103,8 +1103,9 @@ static void
 amdgpu_pci_remove(struct pci_dev *pdev)  {
         struct drm_device *dev =3D pci_get_drvdata(pdev);
-
-       DRM_ERROR("Device removal is currently not supported outside of fbc=
on\n");
+       struct amdgpu_device *adev =3D dev->dev_private;
+       if (!amdgpu_sriov_vf(adev) && !amdgpu_passthrough(adev))
+               DRM_ERROR("Device removal is currently not supported outsid=
e of
+fbcon\n");
         drm_dev_unplug(dev);
         drm_dev_put(dev);
         pci_disable_device(pdev);
--
2.7.4

--_000_MN2PR12MB2975F41EE42811399F0016C28F8E0MN2PR12MB2975namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Christian,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; Before unloading driver, us=
er must sure there is not any userspace to use of amdgpu, if not, it will r=
eport driver is in use. And the unloading driver is a feature about amdgpu =
driver which will be easier to replace driver without
 rebooting VM. Do you think it has any issue about driver unloading path?<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best wishes<o:p></o:p></p>
<p class=3D"MsoNormal">Emily Deng<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Koenig, Christian &lt;Christian.Koenig@=
amd.com&gt; <br>
<b>Sent:</b> Wednesday, September 18, 2019 3:54 PM<br>
<b>To:</b> Zhang, Jack (Jian) &lt;Jack.Zhang1@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org; Teng, Rui &lt;Rui.Teng@amd.com&gt=
;; Deng, Emily &lt;Emily.Deng@amd.com&gt;; Cui, Flora &lt;Flora.Cui@amd.com=
&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov =
or passthrough<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Hi Jack,<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Well that believe is unfortunately completely wrong.=
<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">The point is that ANY use of amdgpu by userspace wil=
l prevent correct driver unload, that qxl is used for the fbcon doesn't cha=
nge anything here.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">So the patch is a clear NAK. Driver unload is not su=
pposed to work even under SRIOV.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Christian.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Am 18.09.2019 09:32 schrieb &quot;Zhang, Jack (Jian)=
&quot; &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhang1@amd.com</a>&g=
t;:<o:p></o:p></p>
</div>
</div>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Hi, Christian and fol=
ks,<br>
<br>
In virtual machines(such virt-manager), there's always a virtual graphics d=
evice existed like &quot;qxl&quot; as the default gfx device.<br>
So under such condition, we believe it's reasonable to unload amdgpu driver=
 as it is not treated as the default fbcon device.<br>
<br>
Would you please help to review this patch?<br>
<br>
Best wishes,<br>
Jack<br>
<br>
-----Original Message-----<br>
From: Jack Zhang &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhang1@amd=
.com</a>&gt; <br>
Sent: Wednesday, September 18, 2019 3:25 PM<br>
To: <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesk=
top.org</a><br>
Cc: Zhang, Jack (Jian) &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Zhan=
g1@amd.com</a>&gt;<br>
Subject: [PATCH] drm/amdgpu/sriov: omit fbcon error under sriov or passthro=
ugh<br>
<br>
In virtual machine, there would be a qxl or cirrus graphics device as the d=
efault master fbcon device.<br>
<br>
So for PF(passthrough mode) or SRIOV VF, it is reasonable to unload amdgpu =
driver. Amdgpu doesn't have to be the only fbcon device under this conditio=
n.<br>
<br>
Signed-off-by: Jack Zhang &lt;<a href=3D"mailto:Jack.Zhang1@amd.com">Jack.Z=
hang1@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 &#43;&#43;&#43;--<br>
&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 420888e..ada2b25 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -1103,8 &#43;1103,9 @@ static void<br>
&nbsp;amdgpu_pci_remove(struct pci_dev *pdev)&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D=
 pci_get_drvdata(pdev);<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is cur=
rently not supported outside of fbcon\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D de=
v-&gt;dev_private;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(adev) &amp;&=
amp; !amdgpu_passthrough(adev))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; DRM_ERROR(&quot;Device removal is currently not supported ou=
tside of <br>
&#43;fbcon\n&quot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_unplug(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dev_put(dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pci_disable_device(pdev);<=
br>
--<br>
2.7.4<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB2975F41EE42811399F0016C28F8E0MN2PR12MB2975namp_--

--===============1057948386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1057948386==--

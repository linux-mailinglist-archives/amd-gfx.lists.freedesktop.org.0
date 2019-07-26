Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF1775C66
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 03:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1056E853;
	Fri, 26 Jul 2019 01:03:58 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750073.outbound.protection.outlook.com [40.107.75.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE4096E853
 for <amd-gfx@lists.freedesktop.org>; Fri, 26 Jul 2019 01:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCcbVJzKah91ruIdSz3QfA15V2SuT5QIjav4u46+oFsAxkZEr2qfZwQp5j3SNKSWVcl7L/gtwutJPaYvoGkyS/YPNKLjYmSr5qqfe8rHLFvuvPxkPw+pWuAdOGXZS3JaaM6bpG2i+UN6EB49JkCboCtrK0NUKO0pfTqKrVHuCq5TtJIEVEPi7TBpidTk5TddiN11P9CZq2c8Vmrpt3/rG4qGw174BCu6dA7WtepRO0kNuGF+xfkJ/UWtJspTfeCiORJLQkK8KaoHUC+f2wgnRQIPyduGp2mErDELu3tgUnhDwwhIzEMiNdrkL5+N++G1oiYi0qAI10kR7RKLrk2mhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj5GvzN7SDMdlGyZJnYozPQ3EDSGxAt52eTbiVza/Mc=;
 b=QBR6OiZLs99IMd4vKcO9fRoU8ItImuj5x44suFUxI0/pLikQJA4AYRY518Nj60Wt+l+ZpKr9pIg0HZdl2NI63yrSD1Slm/793xvExRpq1uaXhZ5NDM4E+LwFuBFIHSGVKFt4V1jiuJqufnLh4Q3y9nkfhV4lsSg1+RS9CYlINP0nWm5RwC+cGcpKr7Bi9flYYfCtVAeOxMZ43YwJpNBTvg70WiJptyqBzKIk44hhlYHwepC2aKq9zHEhEJKrusRjk1nNKhHtZ/cweFABoyJmplQuDLTb3XulzTX0CKNIFcd4tAssfRJH/xtyLCf9XSXqLNScc+TXV3qr+qEr347hKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB4224.namprd12.prod.outlook.com (52.135.51.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 01:03:54 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::bd9b:19ce:ef42:ab26%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 01:03:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality
Thread-Index: AQHVQpJCcjst+mw4vEWoenrvNoRTjabbTu6AgADF+qA=
Date: Fri, 26 Jul 2019 01:03:54 +0000
Message-ID: <MN2PR12MB33446FE3CFFC12443A9FFB9CE4C00@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190725023930.22521-1-evan.quan@amd.com>,
 <20190725023930.22521-2-evan.quan@amd.com>
 <MN2PR12MB3296605E0E8E85F415368D46A2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296605E0E8E85F415368D46A2C10@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d50da431-0ae5-4a27-61cf-08d711652191
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4224; 
x-ms-traffictypediagnostic: MN2PR12MB4224:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MN2PR12MB42240420F2F9F00E85E8FDAEE4C00@MN2PR12MB4224.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(136003)(346002)(396003)(39860400002)(199004)(189003)(26005)(2906002)(71190400001)(2501003)(71200400001)(8676002)(64756008)(256004)(6116002)(790700001)(3846002)(52536014)(55016002)(6246003)(76116006)(5660300002)(966005)(76176011)(14454004)(86362001)(478600001)(229853002)(6436002)(110136005)(316002)(102836004)(446003)(74316002)(25786009)(99286004)(53936002)(53546011)(7736002)(7696005)(486006)(66556008)(6506007)(66446008)(476003)(81166006)(186003)(66946007)(81156014)(66476007)(11346002)(66066001)(606006)(9686003)(54896002)(6306002)(68736007)(236005)(8936002)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4224;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fG5H066t+fPuH90lkVUFGjXMpohwuXRA7YEq0d5UtdiK6eDq1dcKRwc0Q8g3+FIw2haMUHP12nceCNWVnaTx/xUnRbJ8ponH32V9IsneR4MMxRwboqL6mEsqMxQ0md7qx7vxDaCVlY8+CsG392JZ5SQcOBHAN3OpjTE3QwjMtdSdu9x6Vdk5eYL1kin1LjqNkWynDiqJZvLuhXQQPcVy01AkimjPcWF845vYpqnPVLyC1xgoQM6yvT9sfS7c83vCU2y7sfG4L0CyUYMhjZTcUpYysDsf1tffHrIr9ooGNKWGR/zM/O7j0f2U6j6lh6IBPz4OGQty1SxiUHLP0VD1oZagnVCoV5ZKL3ApQA7sPz9fh+5mUTTzjt6fCTvhSQ4V63NcA0wMBc/KC48Af0iaGVgltvmAT1sTxkN3b+/gXDg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50da431-0ae5-4a27-61cf-08d711652191
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 01:03:54.6590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: equan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pj5GvzN7SDMdlGyZJnYozPQ3EDSGxAt52eTbiVza/Mc=;
 b=nbzIRQzsSgvCAam4u8dy80GucEH6wVUf3GbXsdGCsAUKMk1VV05IBrFfrHtPumkHzSoGPd2nhf22IlhFHeheeZ1H18Yyis37Q3mxmX0bEE0nyJMmLomZm73nOmm0kWjAOqi8So3pD9gnLr2TSUMp88J7eu/anPYYYGVAD+gaMSk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1116349750=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1116349750==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB33446FE3CFFC12443A9FFB9CE4C00MN2PR12MB3344namp_"

--_000_MN2PR12MB33446FE3CFFC12443A9FFB9CE4C00MN2PR12MB3344namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It's a bug fix for uploading new pptable from sysfs.
And it's not hardware involved. The real hardware operation involved with t=
his is in smu_v11_0_enable_thermal_alert.
And in old powerplay routine, this is also put in sw_init and we do not fin=
d any problem with that until now.

Regards,
Evan
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Thursday, July 25, 2019 9:08 PM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionali=
ty

I don't recommend that, because obviously this is a hardware operation, so =
why need to move it  into sw init?
Is this a workaround solution, or is it specific to which asic?
and set pptable from sysfs and do baco reset operation need to call these f=
unctions, have you test it?
the function in amdgpu_smu.c and smu_v11_0.c need work correctly in all asi=
c,
it needs to be done carefully, unless there is a good reason.

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Evan Quan <evan.quan@amd.com<mailto:e=
van.quan@amd.com>>
Sent: Thursday, July 25, 2019 10:39 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Quan, Evan <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>
Subject: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset functionality

Move SMU irq handler register to sw_init as that's totally
software related. Otherwise, it will prevent SMU reset working.

Change-Id: Ibd3e48ae9a90ab57f42b3f2ddbb736deeebc8715
Signed-off-by: Evan Quan <evan.quan@amd.com<mailto:evan.quan@amd.com>>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 6935a00cd389..a5079b93caa3 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -741,6 +741,12 @@ static int smu_sw_init(void *handle)
                 return ret;
         }

+       ret =3D smu_register_irq_handler(smu);
+       if (ret) {
+               pr_err("Failed to register smc irq handler!\n");
+               return ret;
+       }
+
         return 0;
 }

@@ -750,6 +756,9 @@ static int smu_sw_fini(void *handle)
         struct smu_context *smu =3D &adev->smu;
         int ret;

+       kfree(smu->irq_source);
+       smu->irq_source =3D NULL;
+
         ret =3D smu_smc_table_sw_fini(smu);
         if (ret) {
                 pr_err("Failed to sw fini smc table!\n");
@@ -1061,10 +1070,6 @@ static int smu_hw_init(void *handle)
         if (ret)
                 goto failed;

-       ret =3D smu_register_irq_handler(smu);
-       if (ret)
-               goto failed;
-
         if (!smu->pm_enabled)
                 adev->pm.dpm_enabled =3D false;
         else
@@ -1094,9 +1099,6 @@ static int smu_hw_fini(void *handle)
         kfree(table_context->overdrive_table);
         table_context->overdrive_table =3D NULL;

-       kfree(smu->irq_source);
-       smu->irq_source =3D NULL;
-
         ret =3D smu_fini_fb_allocations(smu);
         if (ret)
                 return ret;
--
2.22.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB33446FE3CFFC12443A9FFB9CE4C00MN2PR12MB3344namp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	margin:0in;
	margin-bottom:.0001pt;
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
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">It&#8217;s a bug fix for uploading new pptable from =
sysfs.<o:p></o:p></p>
<p class=3D"MsoNormal">And it&#8217;s not hardware involved. The real hardw=
are operation involved with this is in smu_v11_0_enable_thermal_alert.<o:p>=
</o:p></p>
<p class=3D"MsoNormal">And in old powerplay routine, this is also put in sw=
_init and we do not find any problem with that until now.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Evan<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.c=
om&gt; <br>
<b>Sent:</b> Thursday, July 25, 2019 9:08 PM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset func=
tionality<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">I don't=
 recommend that, because obviously this is a
<b>hardware</b> <b>operation</b>, so why need to move it&nbsp; into <b>sw</=
b> <b>init</b>?<o:p></o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Is this=
 a workaround solution, or is it specific to which asic?<o:p></o:p></span><=
/p>
</div>
</div>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">and set=
 pptable from sysfs and do baco reset operation need to call these function=
s, have you test it?<o:p></o:p></span></p>
</div>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">the fun=
ction in amdgpu_smu.c and smu_v11_0.c need work correctly in all asic,<o:p>=
</o:p></span></p>
</div>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">it need=
s to be done carefully, unless there is a good reason.<o:p></o:p></span></p=
>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
</div>
<div id=3D"appendonsend">
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Best Re=
gards,<br>
Kevin<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> amd-gfx &lt;<a href=3D"mailto:amd-gfx-bounces@lists=
.freedesktop.org">amd-gfx-bounces@lists.freedesktop.org</a>&gt; on behalf o=
f Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan@amd.com</a>&=
gt;<br>
<b>Sent:</b> Thursday, July 25, 2019 10:39 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@am=
d.com</a>&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amd/powerplay: enable SW SMU reset function=
ality</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Move SMU irq handler register to sw_init as that's t=
otally<br>
software related. Otherwise, it will prevent SMU reset working.<br>
<br>
Change-Id: Ibd3e48ae9a90ab57f42b3f2ddbb736deeebc8715<br>
Signed-off-by: Evan Quan &lt;<a href=3D"mailto:evan.quan@amd.com">evan.quan=
@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 16 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;-------<br>
&nbsp;1 file changed, 9 insertions(&#43;), 7 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 6935a00cd389..a5079b93caa3 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -741,6 &#43;741,12 @@ static int smu_sw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_register_irq_handler(=
smu);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; pr_err(&quot;Failed to register smc irq handler!\n&quot;);<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
@@ -750,6 &#43;756,9 @@ static int smu_sw_fini(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_context *smu =
=3D &amp;adev-&gt;smu;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(smu-&gt;irq_source);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;irq_source =3D NULL;<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_table_sw_f=
ini(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pr_err(&quot;Failed to sw fini smc table!\n&quot;);<b=
r>
@@ -1061,10 &#43;1070,6 @@ static int smu_hw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; goto failed;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_register_irq_handler(smu)=
;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto failed;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled)<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; adev-&gt;pm.dpm_enabled =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
@@ -1094,9 &#43;1099,6 @@ static int smu_hw_fini(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(table_context-&gt;ov=
erdrive_table);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; table_context-&gt;overdriv=
e_table =3D NULL;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(smu-&gt;irq_source);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;irq_source =3D NULL;<br>
-<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_fini_fb_alloca=
tions(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return ret;<br>
-- <br>
2.22.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a><o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_MN2PR12MB33446FE3CFFC12443A9FFB9CE4C00MN2PR12MB3344namp_--

--===============1116349750==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1116349750==--

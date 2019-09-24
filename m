Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E03BC0B7
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 05:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B576B6E9E8;
	Tue, 24 Sep 2019 03:28:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770074.outbound.protection.outlook.com [40.107.77.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73D86E9E8
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 03:28:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAVJkrlLpEUUfICdhjRMF7H+QYQ7wSRDKCTr5qKggV2+dVLz2Mf8omeLBu+r1CPVJchkTiHpHg055PEdmIr6zE8Evzz7hbC4G3jUD5s+PZZQFS/ESmXQV6rGtA9g9Vl0KaEwYZLwjEokpIh1xr8TqA9ITMYXqeAxplyX84aJgJZ1fE893shRkwbmy/qWHSY/L5pGZ8R6t35kOy1D5Qx0pULNkIn5AWcjkaART+xRCjU42Ap/PyzS1nEV/a8VALRn0uMf0N2OEfoTSPiO6eOuz8gBYKkyY+bxpHQ9oTd6G8hCkFy7YB3DhJJAjGuo9HniaxmKH4TQh+RKtG3R4dadww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hBUlOHhaPEMVY3aL6GPpSCfbSca07dzsquMrBsXKjM=;
 b=buVQv5Rg3+NSmK+I7G/q0NKbCCDSva0eIqomWCmtER5dYM0D8valY3Z9D/L0MEkYeGVEdsZgoUc8UX8zTtLi3kaqt4Y1oNn4X4cLmFatuFpW1xNWxe2skJi/uAatkr61/iIHdQkh5E2jXF+QTwYyLSd1B/X7yaS5Io73v117ySSJ4DlEiHKksC7VE34P4e4tRu8WuTgOUVyIg3LGgdDNtjw1lIHNd46RtKgvDujWF1stkXtpNfvOON5vaL+cKGvT4Qk16kYlETfE1EKPsbPFN8u0BOFL/Wsuewqhd6IUSTHSY9wnGPedAIsYd6xRLCORF2AP4iVf9kff0fANgke9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Tue, 24 Sep 2019 03:28:03 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 03:28:03 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer
 check guard for some smu series
Thread-Topic: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer
 check guard for some smu series
Thread-Index: AQHVcerrubVMsKv0tUiXUT/VZyJqC6c4/GsXgAEvZXA=
Date: Tue, 24 Sep 2019 03:28:03 +0000
Message-ID: <MN2PR12MB35362883856A74A2E25C5182FB840@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>
 <MN2PR12MB3296B10F5F4A601EC54B405BA2850@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296B10F5F4A601EC54B405BA2850@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a518970a-6526-45a8-0120-08d7409f3580
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3536; 
x-ms-traffictypediagnostic: MN2PR12MB3536:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3536DC17254898A06502DC4FFB840@MN2PR12MB3536.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(189003)(199004)(71200400001)(478600001)(66556008)(74316002)(99286004)(8676002)(8936002)(790700001)(966005)(6116002)(6436002)(81166006)(316002)(4326008)(71190400001)(7736002)(110136005)(76176011)(229853002)(53546011)(6506007)(2906002)(236005)(52536014)(54896002)(5660300002)(81156014)(3846002)(7696005)(25786009)(2501003)(86362001)(256004)(76116006)(14444005)(26005)(9686003)(6306002)(66066001)(6246003)(54906003)(55016002)(606006)(66476007)(64756008)(66446008)(33656002)(14454004)(186003)(66946007)(446003)(476003)(11346002)(486006)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3536;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: MywR2AVIzbLtKdBjF6YR2eIpub6tADiTnqX/so+5yWaBrKBBE6Gq3Re2zODvR95Kd+2HXFylKJjHu1NXlW52WJEzRPAQN7eNmm7D/p9bMiO1R7ha/CG+HGXmRdhlAzF0wqlPiotK7ExHy9lcBcGLcR+FBCpvMuUDeOS/+0PIW+Vjq4yYgdBVJsixn4fY7d38mz13lgumL3aeVkaO+TNnbfossKYHHWpHMFH8L7qs/KBgweGnLZ9/t/7Brl4Xgl153wox/yz+7ToMOk7Ah6FnK9QkFjQLWPpVk6sx0jjFEczdATfmbtXXbA6aRViEy4TujydJSm1GsyoacrS8uN5hjKXAEqV44d7UVCsjdlRz9lsRgxE9uW2ByjeTvjowatqh1JO4TW4oDbpw7Eex2fTA5xawlPOYm4h8mBMcfZJhOqY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a518970a-6526-45a8-0120-08d7409f3580
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 03:28:03.5285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OTYas3FD+WWA5ZQaSJkBdekCVpG14VXlb47qPDg1fZzk2y+vpEx1zBEKKkjX3NvA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3536
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hBUlOHhaPEMVY3aL6GPpSCfbSca07dzsquMrBsXKjM=;
 b=qf5kHem4nG7LkU/+dkWgP309tc8ksWtdhhr9Q/HYneiSZZzWV1Ops8r2C4DuB+1bOcKhpWRGywzL8ilxZ42HEobDcCJgEFOu4xGuBvk2FdgbxuE62t7sOCSt2w2qklZ/5qalcufA5ogmcyGxOd1ODr1GzRUAeaAj+g62Bvf1p7s=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Prike.Liang@amd.com; 
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
Cc: "arron.liu@amd.com" <arron.liu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>
Content-Type: multipart/mixed; boundary="===============0997460981=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0997460981==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB35362883856A74A2E25C5182FB840MN2PR12MB3536namp_"

--_000_MN2PR12MB35362883856A74A2E25C5182FB840MN2PR12MB3536namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

That's a good point for simplifying  the code and will send another patch f=
or this.

Thanks,
Prike
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Monday, September 23, 2019 5:22 PM
To: Liang, Prike <Prike.Liang@amd.com>; amd-gfx@lists.freedesktop.org
Cc: arron.liu@amd.com; Huang, Ray <Ray.Huang@amd.com>; Quan, Evan <Evan.Qua=
n@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: Re: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer=
 check guard for some smu series

the smu driver many place will use AMD_IS_APU flags,
i think we'd better add a new member "is_apu" in smu_context"

Best Regards,
kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Liang, Prike <Prike.Liang@amd.com<mai=
lto:Prike.Liang@amd.com>>
Sent: Monday, September 23, 2019 4:43 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: arron.liu@amd.com<mailto:arron.liu@amd.com> <arron.liu@amd.com<mailto:a=
rron.liu@amd.com>>; Huang, Ray <Ray.Huang@amd.com<mailto:Ray.Huang@amd.com>=
>; Liang, Prike <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>>; Quan, Ev=
an <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; Feng, Kenneth <Kenneth.Fe=
ng@amd.com<mailto:Kenneth.Feng@amd.com>>
Subject: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null pointer che=
ck guard for some smu series

For now APU has no smu_dpm_context structure for containing default/current=
 related dpm table,
thus will not initialize smu_dpm_context and aviod null pointer check guard=
 for APU.

Signed-off-by: Prike Liang <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>=
>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 90fa444..3afd2cd 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1554,7 +1554,9 @@ static int smu_enable_umd_pstate(void *handle,

         struct smu_context *smu =3D (struct smu_context*)(handle);
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
-       if (!smu->pm_enabled || !smu_dpm_ctx->dpm_context)
+       struct amdgpu_device *adev =3D smu->adev;
+
+       if (!(adev->flags & AMD_IS_APU) && (!smu->pm_enabled || !smu_dpm_ct=
x->dpm_context))
                 return -EINVAL;

         if (!(smu_dpm_ctx->dpm_level & profile_mode_mask)) {
@@ -1751,8 +1753,9 @@ enum amd_dpm_forced_level smu_get_performance_level(s=
truct smu_context *smu)
 {
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
         enum amd_dpm_forced_level level;
+       struct amdgpu_device *adev =3D smu->adev;

-       if (!smu_dpm_ctx->dpm_context)
+       if (!(adev->flags & AMD_IS_APU) && !smu_dpm_ctx->dpm_context)
                 return -EINVAL;

         mutex_lock(&(smu->mutex));
@@ -1766,8 +1769,9 @@ int smu_force_performance_level(struct smu_context *s=
mu, enum amd_dpm_forced_lev
 {
         struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
         int ret =3D 0;
+       struct amdgpu_device *adev =3D smu->adev;

-       if (!smu_dpm_ctx->dpm_context)
+       if (!(adev->flags & AMD_IS_APU) && !smu_dpm_ctx->dpm_context)
                 return -EINVAL;

         ret =3D smu_enable_umd_pstate(smu, &level);
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB35362883856A74A2E25C5182FB840MN2PR12MB3536namp_
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">That&#8217;s a good point for simplifying &nbsp;the =
code and will send another patch for this.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Prike<o:p></o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.c=
om&gt; <br>
<b>Sent:</b> Monday, September 23, 2019 5:22 PM<br>
<b>To:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; amd-gfx@lists.freedesk=
top.org<br>
<b>Cc:</b> arron.liu@amd.com; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Quan, E=
van &lt;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<b=
r>
<b>Subject:</b> Re: [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null =
pointer check guard for some smu series<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">the smu=
 driver many place will use AMD_IS_APU flags,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">i think=
 we'd better add a new member &quot;is_apu&quot; in smu_context&quot;<o:p><=
/o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Best Re=
gards,<br>
kevin<o:p></o:p></span></p>
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
f Liang, Prike &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike.Liang@amd.c=
om</a>&gt;<br>
<b>Sent:</b> Monday, September 23, 2019 4:43 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:arron.liu@amd.com">arron.liu@amd.com</a> &lt;<=
a href=3D"mailto:arron.liu@amd.com">arron.liu@amd.com</a>&gt;; Huang, Ray &=
lt;<a href=3D"mailto:Ray.Huang@amd.com">Ray.Huang@amd.com</a>&gt;; Liang, P=
rike &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike.Liang@amd.com</a>&gt;=
;
 Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Evan.Quan@amd.com</a>&=
gt;; Feng, Kenneth &lt;<a href=3D"mailto:Kenneth.Feng@amd.com">Kenneth.Feng=
@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH 1/5] drm/amd/powerplay: bypass dpm_context null poin=
ter check guard for some smu series</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">For now APU has no smu_dpm_context structure for con=
taining default/current related dpm table,<br>
thus will not initialize smu_dpm_context and aviod null pointer check guard=
 for APU.<br>
<br>
Signed-off-by: Prike Liang &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike=
.Liang@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 10 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;---<br>
&nbsp;1 file changed, 7 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 90fa444..3afd2cd 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -1554,7 &#43;1554,9 @@ static int smu_enable_umd_pstate(void *handle,<br=
>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_context *smu =
=3D (struct smu_context*)(handle);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu-&gt;pm_enabled || !smu_dpm_c=
tx-&gt;dpm_context)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D sm=
u-&gt;adev;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS=
_APU) &amp;&amp; (!smu-&gt;pm_enabled || !smu_dpm_ctx-&gt;dpm_context))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(smu_dpm_ctx-&gt;dpm_=
level &amp; profile_mode_mask)) {<br>
@@ -1751,8 &#43;1753,9 @@ enum amd_dpm_forced_level smu_get_performance_lev=
el(struct smu_context *smu)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_dpm_forced_level =
level;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D sm=
u-&gt;adev;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_dpm_ctx-&gt;dpm_context)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS=
_APU) &amp;&amp; !smu_dpm_ctx-&gt;dpm_context)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;(smu-&gt;m=
utex));<br>
@@ -1766,8 &#43;1769,9 @@ int smu_force_performance_level(struct smu_contex=
t *smu, enum amd_dpm_forced_lev<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *sm=
u_dpm_ctx =3D &amp;(smu-&gt;smu_dpm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =3D sm=
u-&gt;adev;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_dpm_ctx-&gt;dpm_context)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(adev-&gt;flags &amp; AMD_IS=
_APU) &amp;&amp; !smu_dpm_ctx-&gt;dpm_context)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_enable_umd_pst=
ate(smu, &amp;level);<br>
-- <br>
2.7.4<br>
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

--_000_MN2PR12MB35362883856A74A2E25C5182FB840MN2PR12MB3536namp_--

--===============0997460981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0997460981==--

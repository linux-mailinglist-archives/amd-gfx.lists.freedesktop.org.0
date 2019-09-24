Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4873BBC263
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 09:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B439E6E9B8;
	Tue, 24 Sep 2019 07:14:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810058.outbound.protection.outlook.com [40.107.81.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A746E9B8
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 07:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9p96+v9MoQ1SPgR1x08bfN6xCo4XefvV4VrMJUZ2njbSAkUEDhIUbE1rEGWZ0boixHPmIENovmc4zNC593YPldh2h6g2O84TiMsqOB05eT9SY/KF6pSXhGwzW/384iZ76iu6e4ZeYq2CMALeu9u0nO7zlVj4/rj3STVNCjTJaheVT1pIlfk6h4T1vc+P13sVvxJMeOfNMRFvx+GnY+gABZHSrXLdNvQpsjcIgdTDH7+cdk1gxr4Wd91hlfk63cqxlvX8+BIoCN/wgH2JIH9hyrKUC+n/YTw9xybeHWpD6UL+KGiarZtYfxjaRO+aCEcqz9EC34fP27J6bZSpvveyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TMACk2liSs1PArxcCO8wZqXQfAMY3oUau3VvC0KqnA=;
 b=jQnSAplqFT2sjCbyJmvilafB3g7lS5yx8EjJFIg3I9njwxa56FWaQKhLYGJTUZSIB7df1wITZzu/l+UoO5fzaVZ924oitIAqDYEP69Co+EwPv/LOYmbxMe35xNXI3NpOGxLrEhTPR3xfYwulCHydkRU6cq0Xnjq5kku19dNWRZjPNFF3hw6o/Z7XcuT0Vg8i3y7W19PvOiAAI1h8wbcwAXoh496ggOir8dvyjAZH4ZFSFzp/eTQ1zdOdvLQbRkEESeq0c6yNsKB5KUbRR/73u25b22lbcOnyjGY3kaBoW4pGvo4qCb3soONs6Zliin0cBGY+ODlOavKEw3Fh7mTTOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3054.namprd12.prod.outlook.com (20.178.244.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.25; Tue, 24 Sep 2019 07:14:21 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 07:14:21 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting and
 setting profiling dpm clock level
Thread-Topic: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting
 and setting profiling dpm clock level
Thread-Index: AQHVcerwCWCcIVAOT0O0i3oLSqOV2qc4/siAgAFrbxA=
Date: Tue, 24 Sep 2019 07:14:21 +0000
Message-ID: <MN2PR12MB3536861C25D774DDF10B877EFB840@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>,
 <1569228167-3120-4-git-send-email-Prike.Liang@amd.com>
 <MN2PR12MB3296355152137CECE6334B2FA2850@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296355152137CECE6334B2FA2850@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d03193e-8980-476c-52df-08d740bed284
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3054; 
x-ms-traffictypediagnostic: MN2PR12MB3054:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB30541BF9DA7090248E2DF2ECFB840@MN2PR12MB3054.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(189003)(199004)(6246003)(66556008)(66946007)(8936002)(476003)(66476007)(81166006)(74316002)(446003)(76116006)(6436002)(11346002)(2906002)(33656002)(4326008)(256004)(966005)(14454004)(3846002)(14444005)(26005)(7736002)(25786009)(2501003)(86362001)(54906003)(102836004)(6506007)(76176011)(606006)(7696005)(486006)(186003)(5660300002)(790700001)(316002)(6116002)(66066001)(9686003)(54896002)(6306002)(236005)(71190400001)(71200400001)(99286004)(110136005)(53546011)(64756008)(66446008)(229853002)(8676002)(81156014)(52536014)(55016002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3054;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0ZHdlb/ib46XOQN1E3kgjkMtktPzOUFor4Plxk7eld5i8TMBoe933RKgQ3A5CUzF9qONQWUdivZRJpJSdZrtC9vyiBDRNx3PBj9agYoxJ8KPMwpUpvVcS6dSYRlTyj9VHvJ43SxvZgrEs+JbHR3JYGB25/9A/gCMgVfZO92T8jYs9jEr/Slgov1OYPWCZc5of13HPRNuH1Rc8EpX0DasxAtOQzYGMK/lGD704syTRn3LK9tPe+LDIkP0nCKfpmgopY2InPpe7DZgadepPrTDgtED9BxbNNeGEiSwetmeIvbtWLr/MJa/a9cHUo6OHwv8V4A/bVnNKZ6imfPqpxSWXE19bg5w+P2DKFmJWWXYwXJGDdQEj7zB1jUM/RtM1zNaniuScUnQXHLqpn5TJnbPN8td+rvsEvKwM7FEBL16uHU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d03193e-8980-476c-52df-08d740bed284
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 07:14:21.4506 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vaNk5jUmmoNEGuR85sIHSivQ71rAINIRoC4FwjpCATEUo7TH8YnQU5hVVvhNWvmc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3054
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9TMACk2liSs1PArxcCO8wZqXQfAMY3oUau3VvC0KqnA=;
 b=HDy1BUORluONXBKvQaBoaD9U4M/xw8k2nYGcmUGGlkmDLOzV5rT9yDPDgcGkF+qAwV/uPXKkREd5f0qlZx7VnE/LJHplQATSF5ZVovvL2DZYG7H/ZyfVZtMlr1Ax8JnM/FjvTbzVCrWV5xnK8BV3gLfzw9hC0dkHAFf4YqgdQmw=
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
Content-Type: multipart/mixed; boundary="===============1199212270=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1199212270==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3536861C25D774DDF10B877EFB840MN2PR12MB3536namp_"

--_000_MN2PR12MB3536861C25D774DDF10B877EFB840MN2PR12MB3536namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Monday, September 23, 2019 5:29 PM
To: Liang, Prike <Prike.Liang@amd.com>; amd-gfx@lists.freedesktop.org
Cc: arron.liu@amd.com; Huang, Ray <Ray.Huang@amd.com>; Quan, Evan <Evan.Qua=
n@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: Re: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting =
and setting profiling dpm clock level

comment inline.
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
Subject: [PATCH 4/5] drm/amd/powerplay: add the interfaces for getting and =
setting profiling dpm clock level

implement get_profiling_clk_mask and force_clk_levels for forcing dpm clk t=
o limit value.

Signed-off-by: Prike Liang <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>=
>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 83 ++++++++++++++++++++++++++=
++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index f87aa56..c6aae1c 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -392,6 +392,87 @@ static int renoir_get_workload_type(struct smu_context=
 *smu, uint32_t profile)
         return pplib_workload;
 }

+static int renoir_get_profiling_clk_mask(struct smu_context *smu,
+                                        enum amd_dpm_forced_level level,
+                                        uint32_t *sclk_mask,
+                                        uint32_t *mclk_mask,
+                                        uint32_t *soc_mask)
+{
+
+       if (level =3D=3D AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK) {
+               if (sclk_mask)
+                       *sclk_mask =3D 0;
+       } else if (level =3D=3D AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK) {
+               if (mclk_mask)
+                       *mclk_mask =3D 0;
+       } else if (level =3D=3D AMD_DPM_FORCED_LEVEL_PROFILE_PEAK) {
+               if(sclk_mask)
+                       /* The sclk as gfxclk and has three level about max=
/min/current */
+                       *sclk_mask =3D 3 - 1;
[kevin]:
you should return the max level not current level.
[Prike] Yeah, the clause will return max dpm level index.
+
+               if(mclk_mask)
+                       *mclk_mask =3D NUM_MEMCLK_DPM_LEVELS - 1;
+
+               if(soc_mask)
+                       *soc_mask =3D NUM_SOCCLK_DPM_LEVELS - 1;
+       }
+
+       return 0;
+}
+
+static int renoir_force_clk_levels(struct smu_context *smu,
+                                  enum smu_clk_type clk_type, uint32_t mas=
k)
+{
+
+       int ret =3D 0 ;
+       uint32_t soft_min_level =3D 0, soft_max_level =3D 0, min_freq =3D 0=
, max_freq =3D 0;
+       DpmClocks_t *clk_table =3D smu->smu_table.clocks_table;
+
+       soft_min_level =3D mask ? (ffs(mask) - 1) : 0;
+       soft_max_level =3D mask ? (fls(mask) - 1) : 0;
+
+       switch (clk_type) {
+       case SMU_GFXCLK:
+       case SMU_SCLK:
+               ret =3D smu_get_dpm_freq_range(smu, SMU_GFXCLK, &min_freq, =
&max_freq);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMax=
GfxClk, max_freq);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMin=
GfxClk, min_freq);
+               if (ret)
+                       return ret;
+               break;
+       case SMU_SOCCLK:
+               GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_f=
req);
+               GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_f=
req);
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMax=
SocclkByFreq, max_freq);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMin=
SocclkByFreq, min_freq);
+               if (ret)
+                       return ret;
+               break;
+       case SMU_MCLK:
+       case SMU_FCLK:
+               GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_f=
req);
+               GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_f=
req);
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMax=
FclkByFreq, max_freq);
+               if (ret)
+                       return ret;
+               ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMin=
FclkByFreq, min_freq);
+               if (ret)
+                       return ret;
+
[kevin]:
after remove this blank line,
Reviewed-by: Kevin Wang <kevin1.wang@amd.com<mailto:kevin1.wang@amd.com>>
+               break;
+       default:
+               break;
+       }
+
+       return ret;
+}
+
 static const struct pptable_funcs renoir_ppt_funcs =3D {
         .get_smu_msg_index =3D renoir_get_smu_msg_index,
         .get_smu_table_index =3D renoir_get_smu_table_index,
@@ -404,6 +485,8 @@ static const struct pptable_funcs renoir_ppt_funcs =3D =
{
         .force_dpm_limit_value =3D renoir_force_dpm_limit_value,
         .unforce_dpm_levels =3D renoir_unforce_dpm_levels,
         .get_workload_type =3D renoir_get_workload_type,
+       .get_profiling_clk_mask =3D renoir_get_profiling_clk_mask,
+       .force_clk_levels =3D renoir_force_clk_levels,
 };

 void renoir_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3536861C25D774DDF10B877EFB840MN2PR12MB3536namp_
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.c=
om&gt; <br>
<b>Sent:</b> Monday, September 23, 2019 5:29 PM<br>
<b>To:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; amd-gfx@lists.freedesk=
top.org<br>
<b>Cc:</b> arron.liu@amd.com; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Quan, E=
van &lt;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<b=
r>
<b>Subject:</b> Re: [PATCH 4/5] drm/amd/powerplay: add the interfaces for g=
etting and setting profiling dpm clock level<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">comment=
 inline.<o:p></o:p></span></p>
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
<b>Subject:</b> [PATCH 4/5] drm/amd/powerplay: add the interfaces for getti=
ng and setting profiling dpm clock level</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">implement get_profiling_clk_mask and force_clk_level=
s for forcing dpm clk to limit value.<br>
<br>
Signed-off-by: Prike Liang &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike=
.Liang@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 83 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 83 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index f87aa56..c6aae1c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -392,6 &#43;392,87 @@ static int renoir_get_workload_type(struct smu_con=
text *smu, uint32_t profile)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return pplib_workload;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int renoir_get_profiling_clk_mask(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; enum amd_dpm_forced_level level,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; uint32_t *sclk_mask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; uint32_t *mclk_mask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; uint32_t *soc_mask)<br>
&#43;{<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (level =3D=3D AMD_DPM_FORCED_L=
EVEL_PROFILE_MIN_SCLK) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (sclk_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sclk_mask =
=3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (level =3D=3D AMD_DPM_F=
ORCED_LEVEL_PROFILE_MIN_MCLK) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (mclk_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mclk_mask =
=3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (level =3D=3D AMD_DPM_F=
ORCED_LEVEL_PROFILE_PEAK) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if(sclk_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The sclk =
as gfxclk and has three level about max/min/current */<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sclk_mask =
=3D 3 - 1;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">[kevin]:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">you should return the max level not current level.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><b><i>[Prike] Yeah, the clause will return max dpm l=
evel index.</i></b><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if(mclk_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mclk_mask =
=3D NUM_MEMCLK_DPM_LEVELS - 1;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if(soc_mask)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *soc_mask =
=3D NUM_SOCCLK_DPM_LEVELS - 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&#43;}<br>
&#43;<br>
&#43;static int renoir_force_clk_levels(struct smu_context *smu,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clk=
_type, uint32_t mask)<br>
&#43;{<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0 ;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t soft_min_level =3D 0, so=
ft_max_level =3D 0, min_freq =3D 0, max_freq =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DpmClocks_t *clk_table =3D smu-&g=
t;smu_table.clocks_table;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soft_min_level =3D mask ? (ffs(ma=
sk) - 1) : 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; soft_max_level =3D mask ? (fls(ma=
sk) - 1) : 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (clk_type) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_GFXCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_SCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(smu, SMU_GFXCLK, &amp;min_fre=
q, &amp;max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxG=
fxClk, max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinG=
fxClk, min_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_SOCCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_fr=
eq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_fr=
eq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxS=
occlkByFreq, max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinS=
occlkByFreq, min_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_MCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_FCLK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; GET_DPM_CUR_FREQ(clk_table, clk_type, soft_min_level, min_fr=
eq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; GET_DPM_CUR_FREQ(clk_table, clk_type, soft_max_level, max_fr=
eq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetSoftMaxF=
clkByFreq, max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_send_smc_msg_with_param(smu, SMU_MSG_SetHardMinF=
clkByFreq, min_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">[kevin]:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">after remove this blank line,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Reviewed-by: Kevin Wang &lt;<a href=3D"mailto:kevin1=
.wang@amd.com">kevin1.wang@amd.com</a>&gt;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&nbsp;static const struct pptable_funcs renoir_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D ren=
oir_get_smu_msg_index,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_table_index =3D r=
enoir_get_smu_table_index,<br>
@@ -404,6 &#43;485,8 @@ static const struct pptable_funcs renoir_ppt_funcs =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_dpm_limit_value =3D=
 renoir_force_dpm_limit_value,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unforce_dpm_levels =3D re=
noir_unforce_dpm_levels,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_workload_type =3D ren=
oir_get_workload_type,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_profiling_clk_mask =3D renoi=
r_get_profiling_clk_mask,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_clk_levels =3D renoir_forc=
e_clk_levels,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;void renoir_set_ppt_funcs(struct smu_context *smu)<br>
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

--_000_MN2PR12MB3536861C25D774DDF10B877EFB840MN2PR12MB3536namp_--

--===============1199212270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1199212270==--

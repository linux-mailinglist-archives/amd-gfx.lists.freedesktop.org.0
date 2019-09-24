Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0ABC0BD
	for <lists+amd-gfx@lfdr.de>; Tue, 24 Sep 2019 05:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB296E9E9;
	Tue, 24 Sep 2019 03:30:38 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680040.outbound.protection.outlook.com [40.107.68.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FF616E9E9
 for <amd-gfx@lists.freedesktop.org>; Tue, 24 Sep 2019 03:30:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiNRE4LN42TrpsCa6obkIhIRO6jErw/zMM6KVunxQFwOCHSNbkDVYTdfnbpVqiuURo5HQk0NF5/5B2fds9R0cNpk2PCvt2FRpGAdlvp7NDuZ8g5hIkMDuK+iL+/7cb3E66RhrxUfVJRJbJR9f8f8bQijmrJYZCvpZ/BLNcolCMDjnAK4EGtkvQGg5RSBlxSbIlsj9Q6HZ8t2uDR11cxdK56V9EnVcAMXzrWqdtoGNUkzMz1rADAnr3Pwe6kG2aFie0Qdi4eP9iY11szzLXudEocU1EscjXyGE1I/nvuZdESNzfdq9+nlgkMXafHfQ6/FIXq06IXfy/iyt44lcK5qGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XWUTkGHtZ0HH/JpRx+YjyRdPOZzzUllNBlpeq+lcUU=;
 b=jj0+YkI8YR3FoMZnrSVr1/y80wofnK8Lkt2nNOUi8sUpp5FqjyWxzMOktldN1x/Fd7ACu4LzBoZLw8sFJT4DbBGcFyCpgidku3jXGBr+hGSyIYmAmVTOlj1wGuGJs0ZsMs3lv+y/Y0vw+vwvHePw2+saRwniqG9B2SkcMgRAb7wfwfhOmE2l5aDS74IzPTZH18x/+kK29dDRF0CRyBhuxOj0H2M41Z0orytsAE4RJIVW+gQ5WUN3KOvJ1mJSCff+9qUwKJPrqNqpbr35qTBNxLXTCo41Qukjk91crDFML23TrBRntwKInJgNbAc3cIAnhDKrHzjmg0LPDoYuzTSCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB2925.namprd12.prod.outlook.com (20.179.81.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.22; Tue, 24 Sep 2019 03:30:34 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 03:30:34 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and
 unforcing dpm limit value
Thread-Topic: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and
 unforcing dpm limit value
Thread-Index: AQHVcersfkDnOdQw0U2KY3So/ByJ0qc4/aIAgAEuu3A=
Date: Tue, 24 Sep 2019 03:30:34 +0000
Message-ID: <MN2PR12MB353622C8168882E2EF3972D9FB840@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <1569228167-3120-1-git-send-email-Prike.Liang@amd.com>,
 <1569228167-3120-2-git-send-email-Prike.Liang@amd.com>
 <MN2PR12MB3296B07D1B1FD00D1817E2B7A2850@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3296B07D1B1FD00D1817E2B7A2850@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab9ad885-fafb-4748-eb78-08d7409f8f6e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2925; 
x-ms-traffictypediagnostic: MN2PR12MB2925:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2925F280757D32410E7F9B0CFB840@MN2PR12MB2925.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(478600001)(74316002)(9686003)(966005)(99286004)(8936002)(8676002)(81166006)(6436002)(316002)(4326008)(76176011)(71190400001)(2906002)(53546011)(86362001)(236005)(110136005)(54896002)(52536014)(7736002)(81156014)(3846002)(5660300002)(71200400001)(229853002)(6506007)(2501003)(25786009)(790700001)(7696005)(256004)(26005)(14444005)(76116006)(66066001)(6306002)(6116002)(54906003)(55016002)(66476007)(64756008)(606006)(66446008)(33656002)(186003)(14454004)(66946007)(102836004)(476003)(11346002)(446003)(486006)(6246003)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2925;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gMM8mwp9KAtTL8/1dYTqcmLeSwqX6YsMh2rRHlaafw701i/7Q6di0xv2Na76cHCvdYpQ+B8QlSUlaFmo2aWRyDG3LxoFGxjiQp6Qhp0kgxPUmRxdgEDcmyhVVXMPoLydPQNUzs62LoWfn0WatWhMTW4HfFxspxnwvfdRN7wwsCPeed1ehrvr+4E3oS/fnV4W6Y4Tc+6JSusOtxtbZajYM7hoqgGE5UEGphBmzsnmhYru+yK7Uaal10CqFD9Q6Nkmpk15h90iCaDblp4aNucdSlyLyqxYBUT/ffbO/q7W97bvecDImKyG6GIDX/NFb+mstd7UBPnMOWRhcrZcjwHtKq+ozq2C0tlAUEDfmBotLg7YNQM0w3zQwfLj7uw8u7DDQBfow8HbR64mKATeSsIA4SHh+Iit/WHOxSrSq1v+5Vo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9ad885-fafb-4748-eb78-08d7409f8f6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 03:30:34.5454 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rjusZ+GK54y+am8DdOmhpXvqLO+AXsJBLpdrzzs73yW1Sn1FWtFvZ2oFEeTq/SOH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2925
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XWUTkGHtZ0HH/JpRx+YjyRdPOZzzUllNBlpeq+lcUU=;
 b=vLZQDZKIRiA3wDE5YXLzSXpf0dbTOuHChckWgOTJFnIr03bhImchMaDkKFTe9j0gssi1lgFtMJbKPTige0KMUiom/Ow+BUegq0MxTCJJQ5vVvbR1JgKLgA1JIwv/XW3WABuWvwIdO8eqeMx7IQs3gfB6XjAv2ipX12d+b5CZ8R4=
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
Content-Type: multipart/mixed; boundary="===============0457945792=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0457945792==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB353622C8168882E2EF3972D9FB840MN2PR12MB3536namp_"

--_000_MN2PR12MB353622C8168882E2EF3972D9FB840MN2PR12MB3536namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Monday, September 23, 2019 5:25 PM
To: Liang, Prike <Prike.Liang@amd.com>; amd-gfx@lists.freedesktop.org
Cc: arron.liu@amd.com; Huang, Ray <Ray.Huang@amd.com>; Quan, Evan <Evan.Qua=
n@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>
Subject: Re: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and u=
nforcing dpm limit value

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
Subject: [PATCH 2/5] drm/amd/powerplay: add interface for forcing and unfor=
cing dpm limit value

That's base function for forcing and unforcing dpm limit value.

Signed-off-by: Prike Liang <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>=
>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 62 ++++++++++++++++++++++++++=
++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index 9311b6a..4bb7e1c 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -304,6 +304,66 @@ static int renoir_dpm_set_uvd_enable(struct smu_contex=
t *smu, bool enable)
         return ret;
 }

+static int renoir_force_dpm_limit_value(struct smu_context *smu, bool high=
est)
+{
+       int ret =3D 0, i =3D 0;
+       uint32_t min_freq, max_freq, force_freq;
+       enum smu_clk_type clk_type;
+
+       enum smu_clk_type clks[] =3D {
+               SMU_GFXCLK,
+               SMU_MCLK,
+               SMU_SOCCLK,
+       };
+
+       for (i =3D 0; i < ARRAY_SIZE(clks); i++) {
+               clk_type =3D clks[i];
+               ret =3D smu_get_dpm_freq_range(smu, clk_type, &min_freq, &m=
ax_freq);
+               if (ret)
+                       return ret;
+
+               force_freq =3D highest ? max_freq : min_freq;
+               ret =3D smu_set_soft_freq_range(smu, clk_type, force_freq, =
force_freq);
[kevin]:
this api is depend on message "SetSoftMaxByFreq" and "SetSoftMinByFreq".
the apu has this message? and have you verify it?
[Prike]:
Seems APU hasn't export the message and need send the related clock such as=
 PPSMC_MSG_SetSoftMaxGfxClk
for this case.
+               if (ret)
+                       return ret;
+       }
+
+       return ret;
+}
+
+static int renoir_unforce_dpm_levels(struct smu_context *smu) {
+
+       int ret =3D 0, i =3D 0;
+       uint32_t min_freq, max_freq;
+       enum smu_clk_type clk_type;
+
+       struct clk_feature_map {
+               enum smu_clk_type clk_type;
+               uint32_t        feature;
+       } clk_feature_map[] =3D {
+               {SMU_GFXCLK, SMU_FEATURE_DPM_GFXCLK_BIT},
+               {SMU_MCLK,   SMU_FEATURE_DPM_UCLK_BIT},
+               {SMU_SOCCLK, SMU_FEATURE_DPM_SOCCLK_BIT},
+       };
+
+       for (i =3D 0; i < ARRAY_SIZE(clk_feature_map); i++) {
+               if (!smu_feature_is_enabled(smu, clk_feature_map[i].feature=
))
+                   continue;
+
+               clk_type =3D clk_feature_map[i].clk_type;
+
+               ret =3D smu_get_dpm_freq_range(smu, clk_type, &min_freq, &m=
ax_freq);
+               if (ret)
+                       return ret;
+
+               ret =3D smu_set_soft_freq_range(smu, clk_type, min_freq, ma=
x_freq);
+               if (ret)
+                       return ret;
+       }
+
+       return ret;
+}
+
 static const struct pptable_funcs renoir_ppt_funcs =3D {
         .get_smu_msg_index =3D renoir_get_smu_msg_index,
         .get_smu_table_index =3D renoir_get_smu_table_index,
@@ -313,6 +373,8 @@ static const struct pptable_funcs renoir_ppt_funcs =3D =
{
         .print_clk_levels =3D renoir_print_clk_levels,
         .get_current_power_state =3D renoir_get_current_power_state,
         .dpm_set_uvd_enable =3D renoir_dpm_set_uvd_enable,
+       .force_dpm_limit_value =3D renoir_force_dpm_limit_value,
+       .unforce_dpm_levels =3D renoir_unforce_dpm_levels,
 };

 void renoir_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB353622C8168882E2EF3972D9FB840MN2PR12MB3536namp_
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
<b>Sent:</b> Monday, September 23, 2019 5:25 PM<br>
<b>To:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; amd-gfx@lists.freedesk=
top.org<br>
<b>Cc:</b> arron.liu@amd.com; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Quan, E=
van &lt;Evan.Quan@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;<b=
r>
<b>Subject:</b> Re: [PATCH 2/5] drm/amd/powerplay: add interface for forcin=
g and unforcing dpm limit value<o:p></o:p></p>
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
<b>Subject:</b> [PATCH 2/5] drm/amd/powerplay: add interface for forcing an=
d unforcing dpm limit value</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">That's base function for forcing and unforcing dpm l=
imit value.<br>
<br>
Signed-off-by: Prike Liang &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike=
.Liang@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 62 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 62 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index 9311b6a..4bb7e1c 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -304,6 &#43;304,66 @@ static int renoir_dpm_set_uvd_enable(struct smu_co=
ntext *smu, bool enable)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int renoir_force_dpm_limit_value(struct smu_context *smu, bool =
highest)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0, i =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t min_freq, max_freq, forc=
e_freq;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clk_type;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clks[] =3D {<br=
>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_GFXCLK,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_MCLK,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; SMU_SOCCLK,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(c=
lks); i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; clk_type =3D clks[i];<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(smu, clk_type, &amp;min_freq,=
 &amp;max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; force_freq =3D highest ? max_freq : min_freq;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_set_soft_freq_range(smu, clk_type, force_freq, f=
orce_freq);<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">[kevin]:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">this api is depend on message &quot;SetSoftMaxByFreq=
&quot; and &quot;SetSoftMinByFreq&quot;.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">the apu has this message? and have you verify it?<o:=
p></o:p></p>
<p class=3D"MsoNormal">[Prike]:<o:p></o:p></p>
<p class=3D"MsoNormal">Seems APU hasn&#8217;t export the message and need s=
end the related clock such as PPSMC_MSG_SetSoftMaxGfxClk<o:p></o:p></p>
<p class=3D"MsoNormal">for this case.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&#43;static int renoir_unforce_dpm_levels(struct smu_context *smu) {<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0, i =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t min_freq, max_freq;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clk_type;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct clk_feature_map {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; enum smu_clk_type clk_type;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature;<=
br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } clk_feature_map[] =3D {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {SMU_GFXCLK, SMU_FEATURE_DPM_GFXCLK_BIT},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {SMU_MCLK,&nbsp;&nbsp; SMU_FEATURE_DPM_UCLK_BIT},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; {SMU_SOCCLK, SMU_FEATURE_DPM_SOCCLK_BIT},<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(c=
lk_feature_map); i&#43;&#43;) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (!smu_feature_is_enabled(smu, clk_feature_map[i].feature)=
)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; clk_type =3D clk_feature_map[i].clk_type;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(smu, clk_type, &amp;min_freq,=
 &amp;max_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D smu_set_soft_freq_range(smu, clk_type, min_freq, max=
_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<=
br>
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
@@ -313,6 &#43;373,8 @@ static const struct pptable_funcs renoir_ppt_funcs =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .print_clk_levels =3D reno=
ir_print_clk_levels,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_current_power_state =
=3D renoir_get_current_power_state,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dpm_set_uvd_enable =3D re=
noir_dpm_set_uvd_enable,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_dpm_limit_value =3D renoir=
_force_dpm_limit_value,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .unforce_dpm_levels =3D renoir_un=
force_dpm_levels,<br>
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

--_000_MN2PR12MB353622C8168882E2EF3972D9FB840MN2PR12MB3536namp_--

--===============0457945792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0457945792==--

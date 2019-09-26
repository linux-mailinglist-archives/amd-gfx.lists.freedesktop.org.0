Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B82BEDAE
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 10:45:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C988D6ECA1;
	Thu, 26 Sep 2019 08:45:41 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680078.outbound.protection.outlook.com [40.107.68.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1F96ECA1
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 08:45:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY3m78RdhyBaUhFE9DftklxblJvtdhIkI50Am9TYmm0rd1ZDCWPs6ei35TKFkW1Gsi1Nnd/WdXgrPbdHdR+twMuvnmHXF4aTfxv8ozXc3p3YfblVrioErIhXLumqjMYVLEVyk6vNghJ7SMEfuOnvi6lUrZ7sFd571qXpFEnbEsHu9az/MkpRm1V1vCzfthfAT4nPY/Kvk5JmTGiFcmNPeGwiVXycbFGrUswpvCm/KX5MpI4Rl7YX/KvTSiOz0NUpwpBkw0fJA9cu6D7ebALfPdnvMOr0nZEfOJ3J5aNATSixwRAyJrP/lzFdV+fH+GoOl9KnwVqG4dPg5RC93gTiSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so9JHFpOq6pGjMQxN5EUkI353O52PDLludeAXJwoxik=;
 b=It28AE+6cdCft6XoxyeEr5t4cbnGUShLWbBJRnFUyxLNbIO4hKoHivDQzJH822e6XiJw+CPoWm3PVEF3Ohak1GoIjHM0IkoSfkmFQqxw0qOr+aXkoEE3ZT1puvBE6g4JKaywuPt8pTvKKGym3DXhOUgJUFi+WtnASwjJI8YVM1272O5PrpooLIaA2LUvhiLZkMg29Orn0HnkFZq+mlm4dgfVC7tDHkNQhdFK6xNsYWShKs1pycCkenVHgz+ZmW+T74GJ2ee7jpW8j3B4mVDjiqvOncnu+dBoxGvptFL7lUTrthZDg9JZ1IQBE+TSq+Dd4KVAJZqvCkjkIsLH/48ILg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3536.namprd12.prod.outlook.com (20.179.83.19) by
 MN2PR12MB3981.namprd12.prod.outlook.com (10.255.237.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Thu, 26 Sep 2019 08:45:37 +0000
Received: from MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41]) by MN2PR12MB3536.namprd12.prod.outlook.com
 ([fe80::ec87:49b5:712e:7d41%7]) with mapi id 15.20.2305.017; Thu, 26 Sep 2019
 08:45:37 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 7/8] drm/amd/powerplay: implement the interface for
 setting sclk/uclk profile_peak level
Thread-Topic: [PATCH 7/8] drm/amd/powerplay: implement the interface for
 setting sclk/uclk profile_peak level
Thread-Index: AQHVdB2C3p1Ai+NvFkmR8yWJOoIQWac9a7cAgAA4i8A=
Date: Thu, 26 Sep 2019 08:45:36 +0000
Message-ID: <MN2PR12MB35362CA070AD2CE168E74F12FB860@MN2PR12MB3536.namprd12.prod.outlook.com>
References: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>,
 <1569469774-16813-7-git-send-email-Prike.Liang@amd.com>
 <MN2PR12MB32964497FD542294C9664BABA2860@MN2PR12MB3296.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB32964497FD542294C9664BABA2860@MN2PR12MB3296.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70ae75d8-d686-477b-3a14-08d7425de701
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3981:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39818189BD0E636EB4A196FEFB860@MN2PR12MB3981.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(199004)(189003)(71190400001)(6436002)(71200400001)(52536014)(476003)(486006)(33656002)(3846002)(5660300002)(790700001)(6116002)(229853002)(11346002)(606006)(446003)(2906002)(99286004)(102836004)(53546011)(6506007)(74316002)(7696005)(8936002)(7736002)(76176011)(81156014)(8676002)(81166006)(26005)(66446008)(186003)(316002)(4326008)(54906003)(110136005)(66476007)(66556008)(64756008)(25786009)(76116006)(6246003)(256004)(66946007)(966005)(236005)(14454004)(54896002)(6306002)(66066001)(9686003)(478600001)(86362001)(2501003)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3981;
 H:MN2PR12MB3536.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rme0ivMSWLYnG3hHq3mUh/6tO4QqGXhfV6oXQU4YSGI0STQ1gFse2jOJl9h5rdYSGng0o8LBv4qSaeR6TykZEn4dAz/lveJUougIii0NqIS73t0lv+KuRounfj5HtYWOvi/9scMQ+Fy1q5Y+DtxZUjQ7bk3rjRWk3cWZqaqd97l/7r8lowqWXKjJlGM4jDVetW6OOMjk3Qr3SxyEb/2VIFqHn6QB80bK7/2QBQRnGAbTVicQoK29IIpnVqJkvEHal6KQDgwxlNGbDpbuuuzuPcDzCMYft41sszcukvp6dVycQ8Qb7GfPREgEdaaxi3MkCgHFwEQ1ZNnbndBlIJdUrBXS4PCARaWJnXmqUxHjzoLMZkGvcTsHQLQLPSd8Qnl0CZPOb6D1jiLvbk8BK9U/eLajYTkZU7t9PbQdXOJsMzraMO1EqT3DLZwL2I15hpr6venX38sj/mHxOloJNwGETg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ae75d8-d686-477b-3a14-08d7425de701
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 08:45:36.9974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cB2T4Lu3AwdTVEwhGwn2uvbAsIYnOZMpf/wi1CBSHxVSEqsj5Py+hLnEUSdp+oV/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3981
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=so9JHFpOq6pGjMQxN5EUkI353O52PDLludeAXJwoxik=;
 b=R4672oUMr2Qh0BjpWzP4/0uohOoaczWvjDhHEl1SsDXXbyWGiPZwoqnh7NtP9HJkFK2sMKin6b/UsXICw+176nEefrfDAF2PGXKUImrxf05GBw2MrRvFFpTcCIRZgD60+A1dPWzegSfq3HM3gZUhfYuSdUC1aWJaf//6QGxB5+Q=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "keneth.feng@amd.com" <keneth.feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0591068295=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0591068295==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB35362CA070AD2CE168E74F12FB860MN2PR12MB3536namp_"

--_000_MN2PR12MB35362CA070AD2CE168E74F12FB860MN2PR12MB3536namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Yes, the peak profile model just set the max frequency for SCLK/UCLK.
If not implement the interface also will fine and will use the smu_default_=
set_performance_level handle it.

Thanks,
Prike
From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Sent: Thursday, September 26, 2019 1:20 PM
To: Liang, Prike <Prike.Liang@amd.com>; amd-gfx@lists.freedesktop.org
Cc: Quan, Evan <Evan.Quan@amd.com>; Huang, Ray <Ray.Huang@amd.com>; keneth.=
feng@amd.com
Subject: Re: [PATCH 7/8] drm/amd/powerplay: implement the interface for set=
ting sclk/uclk profile_peak level

this patch is not needed for apu.
by default, the smu will use max value as peak value.

refs:smu_default_set_performance_level

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org<mailto:amd-gfx-bounces=
@lists.freedesktop.org>> on behalf of Liang, Prike <Prike.Liang@amd.com<mai=
lto:Prike.Liang@amd.com>>
Sent: Thursday, September 26, 2019 11:50 AM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>
Cc: Liang, Prike <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>>; Quan, E=
van <Evan.Quan@amd.com<mailto:Evan.Quan@amd.com>>; Huang, Ray <Ray.Huang@am=
d.com<mailto:Ray.Huang@amd.com>>; keneth.feng@amd.com<mailto:keneth.feng@am=
d.com> <keneth.feng@amd.com<mailto:keneth.feng@amd.com>>
Subject: [PATCH 7/8] drm/amd/powerplay: implement the interface for setting=
 sclk/uclk profile_peak level

Add the interface for setting sclk and uclk peak frequency.

Signed-off-by: Prike Liang <Prike.Liang@amd.com<mailto:Prike.Liang@amd.com>=
>
---
 drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 40 ++++++++++++++++++++++++++=
++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c
index 151d78e..c63518a 100644
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
@@ -510,6 +510,45 @@ static int renoir_set_power_profile_mode(struct smu_co=
ntext *smu, long *input, u
         return 0;
 }

+static int renoir_set_peak_clock_by_device(struct smu_context *smu)
+{
+       int ret =3D 0;
+       uint32_t sclk_freq =3D 0, uclk_freq =3D 0;
+
+       ret =3D smu_get_dpm_freq_range(smu, SMU_SCLK, NULL, &sclk_freq);
+       if (ret)
+               return ret;
+
+       ret =3D smu_set_soft_freq_range(smu, SMU_SCLK, sclk_freq, sclk_freq=
);
+       if (ret)
+               return ret;
+
+       ret =3D smu_get_dpm_freq_range(smu, SMU_UCLK, NULL, &uclk_freq);
+       if (ret)
+               return ret;
+
+       ret =3D smu_set_soft_freq_range(smu, SMU_UCLK, uclk_freq, uclk_freq=
);
+       if (ret)
+               return ret;
+
+       return ret;
+}
+
+static int renoir_set_performance_level(struct smu_context *smu, enum amd_=
dpm_forced_level level)
+{
+       int ret =3D 0;
+
+       switch (level) {
+       case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
+               ret =3D renoir_set_peak_clock_by_device(smu);
+               break;
+       default:
+               ret =3D -EINVAL;
+               break;
+       }
+
+       return ret;
+}

 static const struct pptable_funcs renoir_ppt_funcs =3D {
         .get_smu_msg_index =3D renoir_get_smu_msg_index,
@@ -526,6 +565,7 @@ static const struct pptable_funcs renoir_ppt_funcs =3D =
{
         .get_profiling_clk_mask =3D renoir_get_profiling_clk_mask,
         .force_clk_levels =3D renoir_force_clk_levels,
         .set_power_profile_mode =3D renoir_set_power_profile_mode,
+       .set_performance_level =3D renoir_set_performance_level,
 };

 void renoir_set_ppt_funcs(struct smu_context *smu)
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB35362CA070AD2CE168E74F12FB860MN2PR12MB3536namp_
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
<p class=3D"MsoNormal">Yes, the peak profile model just set the max frequen=
cy for SCLK/UCLK.<o:p></o:p></p>
<p class=3D"MsoNormal">If not implement the interface also will fine and wi=
ll use the smu_default_set_performance_level handle it.<o:p></o:p></p>
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
<b>Sent:</b> Thursday, September 26, 2019 1:20 PM<br>
<b>To:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; amd-gfx@lists.freedesk=
top.org<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; Huang, Ray &lt;Ray.Huang@a=
md.com&gt;; keneth.feng@amd.com<br>
<b>Subject:</b> Re: [PATCH 7/8] drm/amd/powerplay: implement the interface =
for setting sclk/uclk profile_peak level<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">this pa=
tch is not needed for apu.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">by defa=
ult, the smu will use max value as peak value.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">refs:sm=
u_default_set_performance_level<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Best Re=
gards,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Kevin<o=
:p></o:p></span></p>
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
<b>Sent:</b> Thursday, September 26, 2019 11:50 AM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd=
-gfx@lists.freedesktop.org</a>&gt;<br>
<b>Cc:</b> Liang, Prike &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike.Li=
ang@amd.com</a>&gt;; Quan, Evan &lt;<a href=3D"mailto:Evan.Quan@amd.com">Ev=
an.Quan@amd.com</a>&gt;; Huang, Ray &lt;<a href=3D"mailto:Ray.Huang@amd.com=
">Ray.Huang@amd.com</a>&gt;;
<a href=3D"mailto:keneth.feng@amd.com">keneth.feng@amd.com</a> &lt;<a href=
=3D"mailto:keneth.feng@amd.com">keneth.feng@amd.com</a>&gt;<br>
<b>Subject:</b> [PATCH 7/8] drm/amd/powerplay: implement the interface for =
setting sclk/uclk profile_peak level</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal">Add the interface for setting sclk and uclk peak fre=
quency.<br>
<br>
Signed-off-by: Prike Liang &lt;<a href=3D"mailto:Prike.Liang@amd.com">Prike=
.Liang@amd.com</a>&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 40 &#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&nbsp;1 file changed, 40 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c b/drivers/gpu/drm/a=
md/powerplay/renoir_ppt.c<br>
index 151d78e..c63518a 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
@@ -510,6 &#43;510,45 @@ static int renoir_set_power_profile_mode(struct sm=
u_context *smu, long *input, u<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;}<br>
&nbsp;<br>
&#43;static int renoir_set_peak_clock_by_device(struct smu_context *smu)<br=
>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t sclk_freq =3D 0, uclk_fr=
eq =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(sm=
u, SMU_SCLK, NULL, &amp;sclk_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_set_soft_freq_range(s=
mu, SMU_SCLK, sclk_freq, sclk_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(sm=
u, SMU_UCLK, NULL, &amp;uclk_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_set_soft_freq_range(s=
mu, SMU_UCLK, uclk_freq, uclk_freq);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return ret;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&#43;<br>
&#43;static int renoir_set_performance_level(struct smu_context *smu, enum =
amd_dpm_forced_level level)<br>
&#43;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (level) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMD_DPM_FORCED_LEVEL_PROFILE=
_PEAK:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D renoir_set_peak_clock_by_device(smu);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ret =3D -EINVAL;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; break;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&#43;}<br>
&nbsp;<br>
&nbsp;static const struct pptable_funcs renoir_ppt_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D ren=
oir_get_smu_msg_index,<br>
@@ -526,6 &#43;565,7 @@ static const struct pptable_funcs renoir_ppt_funcs =
=3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_profiling_clk_mask =
=3D renoir_get_profiling_clk_mask,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force_clk_levels =3D reno=
ir_force_clk_levels,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_power_profile_mode =
=3D renoir_set_power_profile_mode,<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_performance_level =3D renoir=
_set_performance_level,<br>
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

--_000_MN2PR12MB35362CA070AD2CE168E74F12FB860MN2PR12MB3536namp_--

--===============0591068295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0591068295==--

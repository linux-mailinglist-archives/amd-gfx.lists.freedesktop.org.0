Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13D2BEB98
	for <lists+amd-gfx@lfdr.de>; Thu, 26 Sep 2019 07:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498156ED70;
	Thu, 26 Sep 2019 05:19:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780070.outbound.protection.outlook.com [40.107.78.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FFA6ED37
 for <amd-gfx@lists.freedesktop.org>; Thu, 26 Sep 2019 05:19:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuHpHa+SJAjOTmBMTa9uXUtik6QDFLjnjOXryTi0ru4pJHGtTLibF1XDy93MWNhz7/MEb2BPWgZ6rNabnFnJpStB9mBRT83//5GYAhZRJ02QhoC/VshjvDwpcaIXSzgCQpU4bIdWbXNpwcoGOAWrRcOMzcM4YNrGaVWbOXuK2D6Ak+jR/4rYzI8wiH7GqEFtJ0j/wXTTS5coPmGGOFXIPg1ae38PQTiOat9w/fvzDegOly4axrj26uqn5kdJTWU+rb5Wv/g40W/EoN1/O1CKGGCdcc8SPJVQ2M/JdKAew89BQqnLzdCBM7zti3qZtN1FjwW2x156srLfJ4hkJDnWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmlhKRXb/7w8E4T6rJ++RcJlnEuecLKmkF7rQq2iibg=;
 b=kQOw7vbUQpZ8eAGU052L6HL75/9JcwYRD8W9sVSHDlwmdj0Gr9Ir4qB50RHNuD4Wp1/eqJeX5PIOZWB9TWMsB5EGJVLgQMxVBCaGO+cqzMaT6+mnZT2WCkuLbAGZ2ig4RufkF2ujCBglhR97qmcq1f/nMv6dFayMhuCHNHPa4UlXsei9MBFHvXSAyXkU5ATnyTbSw9NOjxgi7A5Xcz3nVdbRJvETq4DunXp4EUUXHrV32Tt8W0GWEDhvMrJ4cmNi2vT6MVXJhgYjSDGoG9CFuUhlVEfIN7HOaVN5NE1l7ot39tNuQbBVAfOMhEej/inDhPNCNePYCrplQGHDFLwVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3424.namprd12.prod.outlook.com (20.178.243.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 05:19:31 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 05:19:31 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Liang, Prike" <Prike.Liang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 7/8] drm/amd/powerplay: implement the interface for
 setting sclk/uclk profile_peak level
Thread-Topic: [PATCH 7/8] drm/amd/powerplay: implement the interface for
 setting sclk/uclk profile_peak level
Thread-Index: AQHVdB2GblMeuTlXQ0qvF178KaBz2Kc9a0l4
Date: Thu, 26 Sep 2019 05:19:30 +0000
Message-ID: <MN2PR12MB32964497FD542294C9664BABA2860@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1569469774-16813-1-git-send-email-Prike.Liang@amd.com>,
 <1569469774-16813-7-git-send-email-Prike.Liang@amd.com>
In-Reply-To: <1569469774-16813-7-git-send-email-Prike.Liang@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1aa05dc6-28c0-4846-4792-08d742411c4d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR12MB3424; 
x-ms-traffictypediagnostic: MN2PR12MB3424:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3424AF3FB95CF64B67046B02A2860@MN2PR12MB3424.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1186;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(19627405001)(25786009)(105004)(446003)(52536014)(8936002)(81166006)(8676002)(81156014)(316002)(256004)(71200400001)(71190400001)(110136005)(54906003)(478600001)(74316002)(6306002)(54896002)(86362001)(4326008)(64756008)(2906002)(6506007)(53546011)(66446008)(2501003)(66946007)(91956017)(236005)(66476007)(6436002)(76116006)(66556008)(229853002)(9686003)(33656002)(55016002)(7736002)(606006)(66066001)(5660300002)(486006)(76176011)(7696005)(14454004)(966005)(11346002)(476003)(186003)(102836004)(26005)(99286004)(3846002)(6116002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3424;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kJcu3Tv6sZmadnDOqjCi8dkiWB1lQWEKBhmkOygxKpQclJOWfXZ+j5Sw+OCNeUre+50JfJdSd0Jh+6y5geQPPBukgjcYdXwkZak6is580O4P79xcpiS0JRuTY6nQ6vn2uwNPFoZrf257E6eQ52CWSItgfpZM6xrpwCxzy5k57Fxw0HbhdtOjrBUUnTRH8UGXU0RZQc7KuHaPs4ZqsgCZadBsPWofNuvgh2nDmOZcg0sweVFOhK6g0+5ClWxP4w/NacM/OHYCIycYkFySmObFRLn/M2WoIMER6ma0GGRaPzU5lc5kwsG1/8KMOJCXHYfy1slLHMJp9hxTa5OCi7LNdvb/mekNY3ILc5sa2nSFWlybiodMJTSoB4fVpF0A+f9nXXzB9/py9L0Xus9Sm2PE6HawR4T08rLKGWkZNhC0ebC2tjQVOufDL3oa80MLuUe9Q1MfIblL0WlLIpDQeYKLpg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa05dc6-28c0-4846-4792-08d742411c4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 05:19:30.9789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eo/jF1WGDMmLf+3Ct0d2QqJuKjzHplWFOy5WnYWcbVTCmw2ts0dmYep8gIjWO3NL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3424
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmlhKRXb/7w8E4T6rJ++RcJlnEuecLKmkF7rQq2iibg=;
 b=sZVCoSNl6ZmMpKXt13VrJnm3dF4Yeyt13QCg9GnC42s25KctZy2IJ7iCr32nGVsyqHnVc2S9RiHzvIHKtvMZ8FizX/29BAhjKPjQWcxHaLxSSK1qDlzHLM5TlvK6s5RJ6erp4MLn9pvfWbrXfjSaoBwk6I4URrkwF011viL69lA=
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 "keneth.feng@amd.com" <keneth.feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0627933316=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0627933316==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32964497FD542294C9664BABA2860MN2PR12MB3296namp_"

--_000_MN2PR12MB32964497FD542294C9664BABA2860MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

this patch is not needed for apu.
by default, the smu will use max value as peak value.

refs:smu_default_set_performance_level

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Liang, P=
rike <Prike.Liang@amd.com>
Sent: Thursday, September 26, 2019 11:50 AM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liang, Prike <Prike.Liang@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Hua=
ng, Ray <Ray.Huang@amd.com>; keneth.feng@amd.com <keneth.feng@amd.com>
Subject: [PATCH 7/8] drm/amd/powerplay: implement the interface for setting=
 sclk/uclk profile_peak level

Add the interface for setting sclk and uclk peak frequency.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
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
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB32964497FD542294C9664BABA2860MN2PR12MB3296namp_
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
this patch is not needed for apu.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
by default, the smu will use max value as peak value.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
refs:smu_default_set_performance_level</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Liang, Prike &lt;Prike.Liang@=
amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 11:50 AM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;<br>
<b>Cc:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; Quan, Evan &lt;Evan.Qu=
an@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; keneth.feng@amd.com &=
lt;keneth.feng@amd.com&gt;<br>
<b>Subject:</b> [PATCH 7/8] drm/amd/powerplay: implement the interface for =
setting sclk/uclk profile_peak level</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Add the interface for setting sclk and uclk peak f=
requency.<br>
<br>
Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
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
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32964497FD542294C9664BABA2860MN2PR12MB3296namp_--

--===============0627933316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0627933316==--

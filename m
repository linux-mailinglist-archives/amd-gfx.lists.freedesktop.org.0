Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE83D667AE
	for <lists+amd-gfx@lfdr.de>; Fri, 12 Jul 2019 09:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4383B6E2D4;
	Fri, 12 Jul 2019 07:21:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690064.outbound.protection.outlook.com [40.107.69.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8A56E2D4
 for <amd-gfx@lists.freedesktop.org>; Fri, 12 Jul 2019 07:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iikht2NEiKp91qyRpJDTpGttqAXGCoH1zOwS8SCHhvPm6X44xOAAMF8gFJN1wm76vDjK1dxHDTMKgpCk18S4eKwN0Ptxb1unz1NUHQxrrLoVEi2aLaRiue3J552GASvOhEXyI/utAY0q7489KU+rXWTngJLhv402i+YGw4jVGj3ECIqkcztDzTxt92WzWt7/I8QXl75mh6SrljmV+j5Sev3hj8Exyt2YGFyLDKgEkcaG/YPG6Vc6pKEbk4fUNdSnkzcZZzLp5zT8Cig/aSWy9Cw7y3T+qP3DF858WDPR+3HY1Te6YQ7Zlqs19WCMJELWrpddB9GVrf+KT5Jm2FYXcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/66c0OF8o63kELVOkchyzqFXeemAnEngynlpqTMyALg=;
 b=gToqCOEu5vo8D21ES980ZrkShjqky1IUr4jKKSHq9Q8cNLWtFjslziYiYFD61rZXBI0GfzbxhwnXHf9Z4ar0HmJvXqk35KlrWBSyTWLfreEn/3rOBHkJgDl+7/QXpprKjh7CCphh/yC1sD0cEDyaGvDWfjYmUEpBZ1NOq9bQgqvJ+7QcnqTXTrJGCA2yhJg6e5GHXzQMeK2/wPClHg2yO/6ZlPcGNMU3BaYi+GJGfag1nW6XTu3niW85BmSTbYWVEtiWQxl+ywBhcQouhXznlW3edigoHVA1fkfRHzqZAdQPQW8qIz33SExh3M5UKLdImXyLi/Im7BfoZYi2x1Bheg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3982.namprd12.prod.outlook.com (10.255.238.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Fri, 12 Jul 2019 07:21:17 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::154f:3d2f:d2ca:3a6e%3]) with mapi id 15.20.2052.020; Fri, 12 Jul 2019
 07:21:17 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Topic: [PATCH 3/3] drm/amd/powerplay: avoid double check feature enabled
Thread-Index: AQHVOH9594pgDccm+0C6JiW/yZaPTqbGkJ0AgAAC7I0=
Date: Fri, 12 Jul 2019 07:21:17 +0000
Message-ID: <MN2PR12MB329644EF69227432287703BBA2F20@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20190712065959.25753-1-kevin1.wang@amd.com>
 <20190712065959.25753-3-kevin1.wang@amd.com>,
 <MN2PR12MB33448DDED55CA6C501E4C5A8E4F20@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33448DDED55CA6C501E4C5A8E4F20@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bfbda35-5792-488b-3108-08d7069987a9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3982; 
x-ms-traffictypediagnostic: MN2PR12MB3982:
x-microsoft-antispam-prvs: <MN2PR12MB398204303B9EB37E59D43555A2F20@MN2PR12MB3982.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(189003)(199004)(13464003)(99286004)(102836004)(316002)(4326008)(71200400001)(71190400001)(19627405001)(256004)(8676002)(76176011)(14444005)(6506007)(53546011)(7696005)(110136005)(7736002)(26005)(74316002)(186003)(8936002)(3846002)(6116002)(55016002)(6246003)(86362001)(478600001)(6436002)(2906002)(81166006)(81156014)(66556008)(446003)(229853002)(9686003)(54896002)(11346002)(53936002)(476003)(2501003)(66066001)(66446008)(52536014)(66946007)(76116006)(64756008)(66476007)(68736007)(33656002)(486006)(14454004)(5660300002)(25786009)(6606003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3982;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zEXg4AlrO8bvlTcCRxYrXwayfBTnaa+IJJbfqDH+TXhSVt5aX919NE2PhigiSpgDoSwzu1AtIpE4A0kPZTEdXrLoMK4cOTEn4bDYVbBzFYT3TPEjhketudkA0EFPPP3s7yOH9FfOMfnTKa+8DdAZiY6x7ISHCNFUIFaNiNblLRKKLc24jmK6eyDzzDLNL2A3xPlfX9jXt5N1mW2HTAlOiKeDtqdaOJguyI+IFItNgF62NIETHfCM+5o0JcGpxxQQAuatMK3iFALGZFCRTZX42wj3YVdSuu6vOV6mahUQcBLo+/wWu3CSaiChBdqAr8GncWgvXxlfgoP/nc7495SOQUIX3IQaIccUtJGVNM9eGcvFYQIaBmrEV4kms9unshtBln/yO8GHbm1JU2/4TRJtHjnyTTijo9+Nyzb5HX7w1fg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfbda35-5792-488b-3108-08d7069987a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 07:21:17.0440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3982
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/66c0OF8o63kELVOkchyzqFXeemAnEngynlpqTMyALg=;
 b=XYx91HLkXVE9Nb0EnBOYQkEbAPubqV5brS5PNZLhGEIPdIuYKoPRMB/Za00zXlE49JXWgCeSxbd1CiA/8HIdMWte2RE9YVaN1tYR4C4K0E5D8x/jvAiUg2++ax52yi5eFFyq9r1S+VcAGTMeci8x3sSYn6kjpG1wKgnaBH+Zfe4=
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0821685532=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0821685532==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB329644EF69227432287703BBA2F20MN2PR12MB3296namp_"

--_000_MN2PR12MB329644EF69227432287703BBA2F20MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

thanks,
i will make a new patch to fix this problem.

Best Regards,
Kevin
________________________________
From: Quan, Evan
Sent: Friday, July 12, 2019 3:09:54 PM
To: Wang, Kevin(Yang); amd-gfx@lists.freedesktop.org
Cc: Feng, Kenneth
Subject: RE: [PATCH 3/3] drm/amd/powerplay: avoid double check feature enab=
led

Patch1 & 2 are reviewed-by: Evan Quan <evan.quan@amd.com>

For patch3, for dpm disabled case, "smu_get_dpm_freq_range(smu, clk_type, &=
min_freq,&max_freq)" will not se the min_freq and max_freq.
That will cause some troubles for the succeeding smu_set_soft_freq_range. P=
lease get that handled properly.

Regards,
Evan
> -----Original Message-----
> From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Sent: Friday, July 12, 2019 3:00 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Feng, Kenneth <Kenneth.Feng@amd.com>; Quan, Evan
> <Evan.Quan@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Subject: [PATCH 3/3] drm/amd/powerplay: avoid double check feature
> enabled
>
> the unforce_dpm_levels doesn't need to check feature enable, because the
> smu_get_dpm_freq_range function has check feature logic.
>
> Change-Id: I6ae62b355aa76a00f0f6e164cd9848fb32fc7c12
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 23 ++++++++--------------
>  1 file changed, 8 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index 16a4c1ca98cf..895a4e592d5a 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -833,27 +833,20 @@ static int navi10_force_dpm_limit_value(struct
> smu_context *smu, bool highest)
>        return ret;
>  }
>
> -static int navi10_unforce_dpm_levels(struct smu_context *smu) {
> -
> +static int navi10_unforce_dpm_levels(struct smu_context *smu) {
>        int ret =3D 0, i =3D 0;
>        uint32_t min_freq, max_freq;
>        enum smu_clk_type clk_type;
>
> -     struct clk_feature_map {
> -             enum smu_clk_type clk_type;
> -             uint32_t        feature;
> -     } clk_feature_map[] =3D {
> -             {SMU_GFXCLK, SMU_FEATURE_DPM_GFXCLK_BIT},
> -             {SMU_MCLK,   SMU_FEATURE_DPM_UCLK_BIT},
> -             {SMU_SOCCLK, SMU_FEATURE_DPM_SOCCLK_BIT},
> +     enum smu_clk_type clks[] =3D {
> +             SMU_GFXCLK,
> +             SMU_MCLK,
> +             SMU_SOCCLK,
>        };
>
> -     for (i =3D 0; i < ARRAY_SIZE(clk_feature_map); i++) {
> -             if (!smu_feature_is_enabled(smu,
> clk_feature_map[i].feature))
> -                 continue;
> -
> -             clk_type =3D clk_feature_map[i].clk_type;
> -
> +     for (i =3D 0; i < ARRAY_SIZE(clks); i++) {
> +             clk_type =3D clks[i];
>                ret =3D smu_get_dpm_freq_range(smu, clk_type, &min_freq,
> &max_freq);
>                if (ret)
>                        return ret;
> --
> 2.22.0


--_000_MN2PR12MB329644EF69227432287703BBA2F20MN2PR12MB3296namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
thanks,&nbsp;
<div>i will make a new patch to fix this problem.</div>
<div><br>
</div>
<div>Best Regards,</div>
<div>Kevin</div>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan<br>
<b>Sent:</b> Friday, July 12, 2019 3:09:54 PM<br>
<b>To:</b> Wang, Kevin(Yang); amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Feng, Kenneth<br>
<b>Subject:</b> RE: [PATCH 3/3] drm/amd/powerplay: avoid double check featu=
re enabled</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Patch1 &amp; 2 are reviewed-by: Evan Quan &lt;evan=
.quan@amd.com&gt;<br>
<br>
For patch3, for dpm disabled case, &quot;smu_get_dpm_freq_range(smu, clk_ty=
pe, &amp;min_freq,&amp;max_freq)&quot; will not se the min_freq and max_fre=
q.<br>
That will cause some troubles for the succeeding smu_set_soft_freq_range. P=
lease get that handled properly.<br>
<br>
Regards,<br>
Evan<br>
&gt; -----Original Message-----<br>
&gt; From: Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; Sent: Friday, July 12, 2019 3:00 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan<br>
&gt; &lt;Evan.Quan@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&g=
t;<br>
&gt; Subject: [PATCH 3/3] drm/amd/powerplay: avoid double check feature<br>
&gt; enabled<br>
&gt; <br>
&gt; the unforce_dpm_levels doesn't need to check feature enable, because t=
he<br>
&gt; smu_get_dpm_freq_range function has check feature logic.<br>
&gt; <br>
&gt; Change-Id: I6ae62b355aa76a00f0f6e164cd9848fb32fc7c12<br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 23 &#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;--------------<br>
&gt;&nbsp; 1 file changed, 8 insertions(&#43;), 15 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; index 16a4c1ca98cf..895a4e592d5a 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -833,27 &#43;833,20 @@ static int navi10_force_dpm_limit_value(stru=
ct<br>
&gt; smu_context *smu, bool highest)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp; }<br>
&gt; <br>
&gt; -static int navi10_unforce_dpm_levels(struct smu_context *smu) {<br>
&gt; -<br>
&gt; &#43;static int navi10_unforce_dpm_levels(struct smu_context *smu) {<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0, i =3D 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t min_freq, max_freq;=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clk_type;<=
br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; struct clk_feature_map {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; enum smu_clk_type clk_type;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; uint32_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; feature;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; } clk_feature_map[] =3D {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {SMU_GFXCLK, SMU_FEATURE_DPM_GFXCLK_BIT},<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {SMU_MCLK,&nbsp;&nbsp; SMU_FEATURE_DPM_UCLK_BIT},<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {SMU_SOCCLK, SMU_FEATURE_DPM_SOCCLK_BIT},<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; enum smu_clk_type clks[] =3D {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; SMU_GFXCLK,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; SMU_MCLK,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; SMU_SOCCLK,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(clk_feature_=
map); i&#43;&#43;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!smu_feature_is_enabled(smu,<br>
&gt; clk_feature_map[i].feature))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; clk_type =3D clk_feature_map[i].clk_type;<br>
&gt; -<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(clks); i=
&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; clk_type =3D clks[i];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_range(smu, clk_type, &amp;min_=
freq,<br>
&gt; &amp;max_freq);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret;<br>
&gt; --<br>
&gt; 2.22.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB329644EF69227432287703BBA2F20MN2PR12MB3296namp_--

--===============0821685532==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0821685532==--

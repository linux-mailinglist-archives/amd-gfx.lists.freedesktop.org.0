Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD16CB03
	for <lists+amd-gfx@lfdr.de>; Thu, 18 Jul 2019 10:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889F86E356;
	Thu, 18 Jul 2019 08:41:02 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680050.outbound.protection.outlook.com [40.107.68.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61D96E356
 for <amd-gfx@lists.freedesktop.org>; Thu, 18 Jul 2019 08:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FW+7GF+sg8Ug4i6icHRMjkWn86PHgxVm5hmr42G8c1SwBoUwRgy6Md+56fZOfNXX7fHD9Ww5A3TSHqo0z+N1PRutfV+kJJIeNheEux0PMtxlXQ/hxnnAsR5yO5245T0WAPE45YckNHpqBff8Foz89nUcXvzr7pgkJLbNfykdPAbcQnGLt812tj77btIwLvLYWtN2L3Dl6lv7LYJXaTYy8JH932FtlkV2Fv0BD3+bglajEszmjmMOx60fVbTz/Z8tk7D0lLwkE6AzGNL4MiTpLUsczoGlfoQ33HqxHHk6Q0vDuo15Z71TiLHYKH1rxSRQl1gqYKgqJXAlRW4Zn5UAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln/3csyxL/6G9fO6ADwVZcl9+7T7a8LCRFTdwhabKPA=;
 b=YukmCNEWhif/siQzvzJg9Kl+HQlEROUs3JrLXrOZFlXXPhnqon7GTBLeCJmzSo0HZQAcLMkq1t2vP8X3pBaJUja6YEu26Epvs1yCiPxhNl1sL30sRJVImibPCSlWbCQtTwXkQD5Wij0o4PCEqGfgux3OS9l/1mON7PO/WR5RUDvcQdrpqZe3eaG9sZF7FNGvU0JlRC7IkE6VCcWHT8fxUlliRoTcmbKSjaEldupVLO8o2iKtqM1ntudfWfOzxbLzM7ywrG6+5wbR49GBLL6wzN5Yq4Lpe6bcE1GxgJrRJ4iNH0pTQaG06ZjOwPL7LQ0Hw6WIkcv82qZyAks4plqSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) by
 BN8PR12MB3138.namprd12.prod.outlook.com (20.178.210.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 08:40:58 +0000
Received: from BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236]) by BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 08:40:58 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Topic: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
 navi10
Thread-Index: AQHVPT8WKhf+ENuPuUabqlRp0Ta+YqbQBvDAgAADT8M=
Date: Thu, 18 Jul 2019 08:40:58 +0000
Message-ID: <BN8PR12MB3283E46FC5AFEAFE75E04435A2C80@BN8PR12MB3283.namprd12.prod.outlook.com>
References: <20190718080142.26040-1-kevin1.wang@amd.com>,
 <MN2PR12MB3344E71BF98AB9178B871D00E4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344E71BF98AB9178B871D00E4C80@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37f21caa-5744-42c6-055b-08d70b5ba814
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB3138; 
x-ms-traffictypediagnostic: BN8PR12MB3138:
x-microsoft-antispam-prvs: <BN8PR12MB3138CD40265D5DBFB2025ECCA2C80@BN8PR12MB3138.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1303;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39850400004)(13464003)(199004)(189003)(110136005)(54906003)(25786009)(229853002)(316002)(99286004)(66556008)(66446008)(9686003)(64756008)(55016002)(66476007)(54896002)(91956017)(76116006)(6436002)(7696005)(53546011)(6506007)(66946007)(76176011)(53936002)(4326008)(71200400001)(446003)(486006)(11346002)(476003)(81166006)(81156014)(102836004)(19627405001)(6246003)(6606003)(6116002)(52536014)(186003)(68736007)(26005)(256004)(7736002)(14454004)(478600001)(71190400001)(33656002)(86362001)(66066001)(8676002)(5660300002)(2906002)(3846002)(74316002)(2501003)(8936002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3138;
 H:BN8PR12MB3283.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cwpsel054KNNDjvhKBD5Atb/XZlA5Uj7ZBvUgbYaoqbjoPSlCeeZ5GmBB581w2saRi6vYXk4+131j+DDUi0+1U++3JH7lax5cSrG1eBTH92yxCxeUhaHVdVt/z6W6TVP+58iGlShDme7ZKPM/X3kzfIQacJfY3AovYYSrdiYQTHLlSWxrd8bCYiHEI90oR/Am1h/+Gvj993fuchyMgvMcm8W4Qs2Qje+QvOhRErf/kguWwuEh4RV9LiSWM4Es/BzvntQ8CsCzc0GdnED95tzEZJy/mVR/Z3BR4hvUsHRxHZJ9yWB/JpCOKeGQGjJAIhb4WeS/4iQ5Pluf4/jIkAdnK1rE+mT6BAuJYBFXwVgj4lzbDql95oJS7LxdQW0+X04N44yUINqHclc7hIvI0yTLA8LGEf/Jwnz0FPnDey2EYM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f21caa-5744-42c6-055b-08d70b5ba814
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 08:40:58.4499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ln/3csyxL/6G9fO6ADwVZcl9+7T7a8LCRFTdwhabKPA=;
 b=laFdUMWTafaOB+9044dvKqMFI6FUDlLbj3VKlMEE+dIyFfxTNNelOEq+dxN/X3P/neDJUIwT7Ym3U9qgfjhC95hVghHUn7l10aBOb8SRhKS6KKCnsH0uHNNvn3ZsncxOkGNrUvWckzR4lhMqujO8xb6LJSNgDlf8h2VdZYb1Oao=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>
Content-Type: multipart/mixed; boundary="===============0833817387=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0833817387==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3283E46FC5AFEAFE75E04435A2C80BN8PR12MB3283namp_"

--_000_BN8PR12MB3283E46FC5AFEAFE75E04435A2C80BN8PR12MB3283namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Evan,


1. the other clock type also will check dpm fine grained support.

2. i will change code to v2 to avoid below case

    0: 300M *
    1: 300M
     2: 1800M


Best Regards,

Kevin

________________________________
From: Quan, Evan
Sent: Thursday, July 18, 2019 4:16:22 PM
To: Wang, Kevin(Yang); amd-gfx@lists.freedesktop.org
Cc: Feng, Kenneth; Huang, Ray; Xu, Feifei
Subject: RE: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for =
navi10

1. Please commonilzie a new API e.g. smu_is_fine_grained_dpm which can be s=
hared for other clocks in future.
2. if the current clock is same as min or max, the output will be a little =
strange
    0: 300M *
    1: 300M
     2: 1800M
Please check how raven handle this situation.

Regards,
Evan
> -----Original Message-----
> From: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Sent: Thursday, July 18, 2019 4:02 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Feng, Kenneth <Kenneth.Feng@amd.com>; Quan, Evan
> <Evan.Quan@amd.com>; Huang, Ray <Ray.Huang@amd.com>; Xu, Feifei
> <Feifei.Xu@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
> Subject: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for
> navi10
>
> the navi10 gfxclk (sclk) support fine grained DPM,
> so use level 1 to show current dpm freq in sysfs pp_dpm_xxx
>
> Change-Id: Idae2424f8cc91fe94cebe7f3103e112b4f912fbc
> Signed-off-by: Kevin Wang <kevin1.wang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 41 +++++++++++++++++--
> ---
>  1 file changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index 895a4e592d5a..ef60b92fef6c 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -632,6 +632,10 @@ static int navi10_print_clk_levels(struct smu_contex=
t
> *smu,
>  {
>        int i, size =3D 0, ret =3D 0;
>        uint32_t cur_value =3D 0, value =3D 0, count =3D 0;
> +     uint32_t freq_values[3] =3D {0};
> +     uint32_t clk_index =3D 0, mark_index =3D 0;
> +     PPTable_t *pptable =3D smu->smu_table.driver_pptable;
> +     DpmDescriptor_t *dpm_desc =3D NULL;
>
>        switch (clk_type) {
>        case SMU_GFXCLK:
> @@ -641,25 +645,46 @@ static int navi10_print_clk_levels(struct
> smu_context *smu,
>        case SMU_UCLK:
>        case SMU_FCLK:
>        case SMU_DCEFCLK:
> +             clk_index =3D smu_clk_get_index(smu, clk_type);
> +             dpm_desc =3D &pptable->DpmDescriptor[clk_index];
> +
>                ret =3D smu_get_current_clk_freq(smu, clk_type, &cur_value=
);
>                if (ret)
>                        return size;
> -             /* 10KHz -> MHz */
> -             cur_value =3D cur_value / 100;
> -
> -             size +=3D sprintf(buf, "current clk: %uMhz\n", cur_value);
>
>                ret =3D smu_get_dpm_level_count(smu, clk_type, &count);
>                if (ret)
>                        return size;
>
> -             for (i =3D 0; i < count; i++) {
> -                     ret =3D smu_get_dpm_freq_by_index(smu, clk_type, i,
> &value);
> +             /* 0 - Fine grained DPM, 1 - Discrete DPM */
> +             if (dpm_desc->SnapToDiscrete =3D=3D 1) {
> +                     /* 10KHz -> MHz */
> +                     cur_value =3D cur_value / 100;
> +                     for (i =3D 0; i < count; i++) {
> +                             ret =3D smu_get_dpm_freq_by_index(smu,
> clk_type, i, &value);
> +                             if (ret)
> +                                     return size;
> +
> +                             size +=3D sprintf(buf + size, "%d: %uMhz %s=
\n",
> i, value,
> +                                             cur_value =3D=3D value ? "*=
" : "");
> +                     }
> +             } else {
> +                     ret =3D smu_get_dpm_freq_by_index(smu, clk_type, 0,
> &freq_values[0]);
> +                     if (ret)
> +                             return size;
> +                     ret =3D smu_get_dpm_freq_by_index(smu, clk_type,
> count - 1, &freq_values[2]);
>                        if (ret)
>                                return size;
>
> -                     size +=3D sprintf(buf + size, "%d: %uMhz %s\n", i, =
value,
> -                                     cur_value =3D=3D value ? "*" : "");
> +                     freq_values[1] =3D cur_value / 100;
> +                     mark_index =3D cur_value =3D=3D freq_values[0] ? 0 =
:
> +                                  cur_value =3D=3D freq_values[2] ? 2 : =
1;
> +
> +                     for (i =3D 0; i < 3; i++) {
> +                             size +=3D sprintf(buf + size, "%d: %uMhz %s=
\n",
> i, freq_values[i],
> +                                             i =3D=3D mark_index ? "*" :=
 "");
> +                     }
> +
>                }
>                break;
>        default:
> --
> 2.22.0


--_000_BN8PR12MB3283E46FC5AFEAFE75E04435A2C80BN8PR12MB3283namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size: 12pt; colo=
r: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif, EmojiFont, &q=
uot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &q=
uot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;">
<p style=3D"margin-top:0; margin-bottom:0">Hi Evan,</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt">1=
.</span><span style=3D"font-size:12pt">&nbsp;</span><span style=3D"font-siz=
e:12pt">the other&nbsp;clock type also will check dpm fine grained support.=
</span></p>
<div><span style=3D"font-size:12pt"></span></div>
<p></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt">2=
. i will change code to v2 to avoid below case<span style=3D"color:rgb(33,3=
3,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&q=
uot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:14.6667px"></span><=
/span></p>
<p style=3D"margin-top:0; margin-bottom:0"><span style=3D"font-size:12pt"><=
span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; f=
ont-size:14.6667px">&nbsp; &nbsp; 0: 300M *</span><br style=3D"color:rgb(33=
,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP=
&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:14.6667px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:14.6667px">&nbsp;&nbsp;&nbsp; 1: 300M</span><br style=3D"color:rg=
b(33,33,33); font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Sego=
e WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; font-size:14.6667px">
<span style=3D"color:rgb(33,33,33); font-family:wf_segoe-ui_normal,&quot;Se=
goe UI&quot;,&quot;Segoe WP&quot;,Tahoma,Arial,sans-serif,serif,EmojiFont; =
font-size:14.6667px">&nbsp;&nbsp;&nbsp;&nbsp; 2: 1800M</span></span></p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Best Regards,</p>
<p style=3D"margin-top:0; margin-bottom:0">Kevin</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Quan, Evan<br>
<b>Sent:</b> Thursday, July 18, 2019 4:16:22 PM<br>
<b>To:</b> Wang, Kevin(Yang); amd-gfx@lists.freedesktop.org<br>
<b>Cc:</b> Feng, Kenneth; Huang, Ray; Xu, Feifei<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx form=
at for navi10</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">1. Please commonilzie a new API e.g. smu_is_fine_g=
rained_dpm which can be shared for other clocks in future.<br>
2. if the current clock is same as min or max, the output will be a little =
strange<br>
&nbsp;&nbsp;&nbsp; 0: 300M *<br>
&nbsp;&nbsp;&nbsp; 1: 300M<br>
&nbsp;&nbsp;&nbsp;&nbsp; 2: 1800M<br>
Please check how raven handle this situation.<br>
<br>
Regards,<br>
Evan<br>
&gt; -----Original Message-----<br>
&gt; From: Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
&gt; Sent: Thursday, July 18, 2019 4:02 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan<br>
&gt; &lt;Evan.Quan@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Xu, F=
eifei<br>
&gt; &lt;Feifei.Xu@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&g=
t;<br>
&gt; Subject: [PATCH] drm/amd/powerplay: change sysfs pp_dpm_xxx format for=
<br>
&gt; navi10<br>
&gt; <br>
&gt; the navi10 gfxclk (sclk) support fine grained DPM,<br>
&gt; so use level 1 to show current dpm freq in sysfs pp_dpm_xxx<br>
&gt; <br>
&gt; Change-Id: Idae2424f8cc91fe94cebe7f3103e112b4f912fbc<br>
&gt; Signed-off-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 41 &#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--<br>
&gt; ---<br>
&gt;&nbsp; 1 file changed, 33 insertions(&#43;), 8 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; index 895a4e592d5a..ef60b92fef6c 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -632,6 &#43;632,10 @@ static int navi10_print_clk_levels(struct smu=
_context<br>
&gt; *smu,<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i, size =3D 0, ret =3D 0=
;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t cur_value =3D 0, va=
lue =3D 0, count =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t freq_values[3] =3D {0};<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t clk_index =3D 0, mark_index =3D=
 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; PPTable_t *pptable =3D smu-&gt;smu_table=
.driver_pptable;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; DpmDescriptor_t *dpm_desc =3D NULL;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (clk_type) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_GFXCLK:<br>
&gt; @@ -641,25 &#43;645,46 @@ static int navi10_print_clk_levels(struct<br=
>
&gt; smu_context *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_UCLK:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_FCLK:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_DCEFCLK:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; clk_index =3D smu_clk_get_index(smu, clk_type);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; dpm_desc =3D &amp;pptable-&gt;DpmDescriptor[clk_index];<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D smu_get_current_clk_freq(smu, clk_type, &amp;cu=
r_value);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
size;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* 10KHz -&gt; MHz */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; cur_value =3D cur_value / 100;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; size &#43;=3D sprintf(buf, &quot;current clk: %uMhz\n&quot;, cur_value)=
;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_level_count(smu, clk_type, &amp;cou=
nt);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
size;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; for (i =3D 0; i &lt; count; i&#43;&#43;) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_fre=
q_by_index(smu, clk_type, i,<br>
&gt; &amp;value);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; /* 0 - Fine grained DPM, 1 - Discrete DPM */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (dpm_desc-&gt;SnapToDiscrete =3D=3D 1) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* 10KHz -&gt; MHz =
*/<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cur_value =3D cur_v=
alue / 100;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt=
; count; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm_freq_by_index(smu,<br>
&gt; clk_type, i, &amp;value);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; return size;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; size, &quot;%d=
: %uMhz %s\n&quot;,<br>
&gt; i, value,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cur_value =3D=3D value ? =
&quot;*&quot; : &quot;&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; } else {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm=
_freq_by_index(smu, clk_type, 0,<br>
&gt; &amp;freq_values[0]);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_get_dpm=
_freq_by_index(smu, clk_type,<br>
&gt; count - 1, &amp;freq_values[2]);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(b=
uf &#43; size, &quot;%d: %uMhz %s\n&quot;, i, value,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cu=
r_value =3D=3D value ? &quot;*&quot; : &quot;&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; freq_values[1] =3D =
cur_value / 100;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mark_index =3D cur_=
value =3D=3D freq_values[0] ? 0 :<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cur_value =3D=3D=
 freq_values[2] ? 2 : 1;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt=
; 3; i&#43;&#43;) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; size &#43;=3D sprintf(buf &#43; size, &quot;%d=
: %uMhz %s\n&quot;,<br>
&gt; i, freq_values[i],<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i =3D=3D mark_index ? &qu=
ot;*&quot; : &quot;&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; --<br>
&gt; 2.22.0<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BN8PR12MB3283E46FC5AFEAFE75E04435A2C80BN8PR12MB3283namp_--

--===============0833817387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0833817387==--

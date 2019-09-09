Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA214AD9E2
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Sep 2019 15:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5157389B49;
	Mon,  9 Sep 2019 13:20:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4397D89B49
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Sep 2019 13:20:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdzblgPY+mmyi4UFPCSxQ1ps5075rXiv4rTbK/ZV/Ax0Xrviqx4agfjfB5szZYoF2LxG6wAalxk8fbon4K18smTAGYJu/cCQKvoVmjAbh/goYYrPSE9wsS9Z2VFKbG/P33mGoB5c79GMDaZ3yzyMLaOrtCJALJNcRKC4bmh7m/rcRwbbcWlbKDTtKxmWSnY314jjpPeBV0dGqLm5ZEeaAbVz2KZcJV5ck9o0ljw4kIeTllWylpcaShuTwLwTLkm8d4GOXT5rJwRRxm71p/KMnrYqy8gEkpw2ThTZPdbvEgybw5zj7w7WFrYkwLtZN0ahLK640fNhyt+OzmnU5y0Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoUeMCM2qosO1m0WXJ8795NkBWys2lXqcUbIzi8jqmI=;
 b=BF4XQewVvC9EcZGv4W32xHf32tYIL+0XmyJ+uxxHGwKpYTSmgCIu5ID1NksqdIvY6qZSxFgFIAeCIMTNd9bocHLD0RG/EcmAfUnadObAFOBS7g0Xi/VmIPNLeI7O0zxI1Z1n5nHEjMMuN8ggVFSk8hpKoYkYpYSxN4cMaqApt01x8aPGjym/Br8BRTM1fYfLkBl8pbCc/ghVXhAH6dAp1E60cjseAkCVvKkyXIUQZeHco5PlLD72vf7s8D/A/C/ztkWYUc0QGnHYb0ecYWDc877qjzkMWgTw4Dg4FljYeWAJhm4Thbyp9azzCpW/FP9lT5u+Vd/7dF10p9ai5Hrk9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4270.namprd12.prod.outlook.com (52.135.50.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.18; Mon, 9 Sep 2019 13:20:42 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9929:92fb:f329:a911%7]) with mapi id 15.20.2241.018; Mon, 9 Sep 2019
 13:20:42 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: Add the interface for geting dpm
 current power state
Thread-Topic: [PATCH] drm/amd/powerplay: Add the interface for geting dpm
 current power state
Thread-Index: AQHVZs6L8d1I3BsIPU+IKGq7TQkV7acjBBbggABQZ9Y=
Date: Mon, 9 Sep 2019 13:20:41 +0000
Message-ID: <MN2PR12MB3296DEA8597993E2B2CBDD63A2B70@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1568006521-7471-1-git-send-email-Prike.Liang@amd.com>,
 <MN2PR12MB3344C78FF82CFB5166571091E4B70@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344C78FF82CFB5166571091E4B70@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.141.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e3409da5-1fdf-4f4a-3cb7-08d7352883ac
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4270; 
x-ms-traffictypediagnostic: MN2PR12MB4270:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4270FAA409BB783F563FB897A2B70@MN2PR12MB4270.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(13464003)(189003)(199004)(81166006)(4326008)(25786009)(71190400001)(6246003)(486006)(14454004)(105004)(81156014)(19627405001)(8936002)(102836004)(256004)(53936002)(6506007)(53546011)(606006)(476003)(229853002)(54906003)(8676002)(14444005)(26005)(316002)(6436002)(33656002)(99286004)(186003)(446003)(3846002)(74316002)(7736002)(76176011)(5660300002)(11346002)(2501003)(110136005)(6116002)(2906002)(236005)(478600001)(9686003)(76116006)(91956017)(52536014)(66446008)(54896002)(6306002)(66476007)(66556008)(64756008)(66946007)(71200400001)(966005)(66066001)(7696005)(86362001)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4270;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NKGbSANevKB5PRadia8i8A2QiYk+s1A+ilo4Ra1gOP0e2TtB8j/P2Hr8DU62flOUNXPNrzbthmcl5kItrSRu7jLAGJQD0RzlwosQ32KgYVOHh3RvXfgY/lz7OTnST5sngGyhIxgeoJheYkAPHtrzp6hdRKDlNQ/anHS7H1XY6kk40x8MfqCGkMBkSHLoCIRcj2fQjBcefJraxIgPuaoftwUBUmpmydMNw4ZICARPjaTEjSWSyYH8IL4ZFyEIoKO4EoNNkFy6kdknDOlUUpCzbaX85riAB1w6h45kY5p/MV4pvqP+K40lC4LYNamt8GN1qKVRe7lhDHFwGsycv9WT6iLdDGtd7SdCMubHQwUqQdm62XbZqET2j6iQWF46yMQ1saV18VwrKrMYhZEsqpkNijOTvYLP6fjavuVKbWev2+Q=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3409da5-1fdf-4f4a-3cb7-08d7352883ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 13:20:41.8012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCDb+c8Eri8s1VbVz0dwtjBHRhuauGWCaxUCKP6lMNPaWuSEE3UkMUbp1pXLlD12
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4270
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoUeMCM2qosO1m0WXJ8795NkBWys2lXqcUbIzi8jqmI=;
 b=ZzPgg7ExegijfjcdXLfJIQhVrfPS4JXUQ65s7kfv2NKeHcjQ4APJziVoAJKvBn2BU/jYmBs0baG/F58jJVw8NZk2YIeYDTHte+iCzqzsQesUdEsk8MiMQZbh8Od4sdhxSjpzsassnAoDXhMZs/0bZZ8/9tNxXfaFdA1Ej1MBi+c=
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
Cc: "Huang, Ray" <Ray.Huang@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>,
 "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: multipart/mixed; boundary="===============1888218740=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1888218740==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296DEA8597993E2B2CBDD63A2B70MN2PR12MB3296namp_"

--_000_MN2PR12MB3296DEA8597993E2B2CBDD63A2B70MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

comment inline.
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Quan, Ev=
an <Evan.Quan@amd.com>
Sent: Monday, September 9, 2019 4:31 PM
To: Liang, Prike <Prike.Liang@amd.com>; amd-gfx@lists.freedesktop.org <amd-=
gfx@lists.freedesktop.org>
Cc: Huang, Ray <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; L=
iu, Aaron <Aaron.Liu@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: Add the interface for geting dpm cu=
rrent power state

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: Liang, Prike <Prike.Liang@amd.com>
> Sent: 2019=1B$BG/=1B(B9=1B$B7n=1B(B9=1B$BF|=1B(B 13:22
> To: amd-gfx@lists.freedesktop.org
> Cc: Quan, Evan <Evan.Quan@amd.com>; Feng, Kenneth
> <Kenneth.Feng@amd.com>; Huang, Ray <Ray.Huang@amd.com>; Liu, Aaron
> <Aaron.Liu@amd.com>; Liang, Prike <Prike.Liang@amd.com>
> Subject: [PATCH] drm/amd/powerplay: Add the interface for geting dpm
> current power state
>
> implement the sysfs power_dpm_state
>
> Signed-off-by: Prike Liang <Prike.Liang@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 34
> ++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> index a5cf846..2c22ba4 100644
> --- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c
> @@ -246,6 +246,38 @@ static int renoir_print_clk_levels(struct smu_contex=
t
> *smu,
>        return size;
>  }
>
> +static enum amd_pm_state_type renoir_get_current_power_state(struct
> +smu_context *smu) {
> +     enum amd_pm_state_type pm_type;
> +     struct smu_dpm_context *smu_dpm_ctx =3D &(smu->smu_dpm);
> +
> +     if (!smu_dpm_ctx->dpm_context ||
> +         !smu_dpm_ctx->dpm_current_power_state)
> +             return -EINVAL;
> +
> +     mutex_lock(&(smu->mutex));
> +     switch (smu_dpm_ctx->dpm_current_power_state-
> >classification.ui_label) {
> +     case SMU_STATE_UI_LABEL_BATTERY:
> +             pm_type =3D POWER_STATE_TYPE_BATTERY;
> +             break;
> +     case SMU_STATE_UI_LABEL_BALLANCED:
> +             pm_type =3D POWER_STATE_TYPE_BALANCED;
> +             break;
> +     case SMU_STATE_UI_LABEL_PERFORMANCE:
> +             pm_type =3D POWER_STATE_TYPE_PERFORMANCE;
> +             break;
> +     default:
> +             if (smu_dpm_ctx->dpm_current_power_state-
> >classification.flags & SMU_STATE_CLASSIFICATION_FLAG_BOOT)
> +                     pm_type =3D POWER_STATE_TYPE_INTERNAL_BOOT;
> +             else
> +                     pm_type =3D POWER_STATE_TYPE_DEFAULT;
> +             break;
> +     }
> +     mutex_unlock(&(smu->mutex));
> +
> +     return pm_type;
> +}
> +
>  static const struct pptable_funcs renoir_ppt_funcs =3D {
>        .get_smu_msg_index =3D renoir_get_smu_msg_index,
>        .get_smu_table_index =3D renoir_get_smu_table_index, @@ -253,6
> +285,8 @@ static const struct pptable_funcs renoir_ppt_funcs =3D {
>        .set_power_state =3D NULL,
>        .get_dpm_uclk_limited =3D renoir_get_dpm_uclk_limited,
>        .print_clk_levels =3D renoir_print_clk_levels,
> +     .get_current_power_state =3D renoir_get_current_power_state,
> +
[kevin]:
please remove this blank line.
after fixed:
Reviewed-by: Kevin wang <kevin1.wang@amd.com>
>  };
>
>  void renoir_set_ppt_funcs(struct smu_context *smu)
> --
> 2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296DEA8597993E2B2CBDD63A2B70MN2PR12MB3296namp_
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
comment inline.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Quan, Evan &lt;Evan.Quan@amd.=
com&gt;<br>
<b>Sent:</b> Monday, September 9, 2019 4:31 PM<br>
<b>To:</b> Liang, Prike &lt;Prike.Liang@amd.com&gt;; amd-gfx@lists.freedesk=
top.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Kenneth &lt;Kenneth.=
Feng@amd.com&gt;; Liu, Aaron &lt;Aaron.Liu@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH] drm/amd/powerplay: Add the interface for geting=
 dpm current power state</font>
<div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif; color: rgb(0, 0, 0)">
<br>
</div>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Reviewed-by: Evan Quan &lt;evan.quan@amd.com&gt;<b=
r>
<br>
&gt; -----Original Message-----<br>
&gt; From: Liang, Prike &lt;Prike.Liang@amd.com&gt;<br>
&gt; Sent: 2019=1B$BG/=1B(B9=1B$B7n=1B(B9=1B$BF|=1B(B 13:22<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Quan, Evan &lt;Evan.Quan@amd.com&gt;; Feng, Kenneth<br>
&gt; &lt;Kenneth.Feng@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Li=
u, Aaron<br>
&gt; &lt;Aaron.Liu@amd.com&gt;; Liang, Prike &lt;Prike.Liang@amd.com&gt;<br=
>
&gt; Subject: [PATCH] drm/amd/powerplay: Add the interface for geting dpm<b=
r>
&gt; current power state<br>
&gt; <br>
&gt; implement the sysfs power_dpm_state<br>
&gt; <br>
&gt; Signed-off-by: Prike Liang &lt;Prike.Liang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/renoir_ppt.c | 34<br>
&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;<br>
&gt;&nbsp; 1 file changed, 34 insertions(&#43;)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&gt; index a5cf846..2c22ba4 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/renoir_ppt.c<br>
&gt; @@ -246,6 &#43;246,38 @@ static int renoir_print_clk_levels(struct smu=
_context<br>
&gt; *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return size;<br>
&gt;&nbsp; }<br>
&gt; <br>
&gt; &#43;static enum amd_pm_state_type renoir_get_current_power_state(stru=
ct<br>
&gt; &#43;smu_context *smu) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; enum amd_pm_state_type pm_type;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_dpm_context *smu_dpm_ctx =3D =
&amp;(smu-&gt;smu_dpm);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!smu_dpm_ctx-&gt;dpm_context ||<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !smu_dpm_ctx-&gt=
;dpm_current_power_state)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -EINVAL;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;(smu-&gt;mutex));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; switch (smu_dpm_ctx-&gt;dpm_current_powe=
r_state-<br>
&gt; &gt;classification.ui_label) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_STATE_UI_LABEL_BATTERY:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pm_type =3D POWER_STATE_TYPE_BATTERY;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_STATE_UI_LABEL_BALLANCED:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pm_type =3D POWER_STATE_TYPE_BALANCED;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case SMU_STATE_UI_LABEL_PERFORMANCE:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pm_type =3D POWER_STATE_TYPE_PERFORMANCE;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (smu_dpm_ctx-&gt;dpm_current_power_state-<br>
&gt; &gt;classification.flags &amp; SMU_STATE_CLASSIFICATION_FLAG_BOOT)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pm_type =3D POWER_S=
TATE_TYPE_INTERNAL_BOOT;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; else<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pm_type =3D POWER_S=
TATE_TYPE_DEFAULT;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;(smu-&gt;mutex));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return pm_type;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; static const struct pptable_funcs renoir_ppt_funcs =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D renoi=
r_get_smu_msg_index,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_table_index =3D ren=
oir_get_smu_table_index, @@ -253,6<br>
&gt; &#43;285,8 @@ static const struct pptable_funcs renoir_ppt_funcs =3D {=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_power_state =3D NULL,<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_dpm_uclk_limited =3D re=
noir_get_dpm_uclk_limited,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .print_clk_levels =3D renoir=
_print_clk_levels,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .get_current_power_state =3D renoir_get_=
current_power_state,<br>
&gt; &#43;</div>
<div class=3D"PlainText"><b>[kevin]:</b></div>
<div class=3D"PlainText"><b>please remove this&nbsp;blank line.</b></div>
<div class=3D"PlainText"><b>after fixed:</b></div>
<div class=3D"PlainText"><b>Reviewed-by: Kevin wang &lt;kevin1.wang@amd.com=
&gt;</b></div>
<div class=3D"PlainText">&gt;&nbsp; };<br>
&gt; <br>
&gt;&nbsp; void renoir_set_ppt_funcs(struct smu_context *smu)<br>
&gt; --<br>
&gt; 2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296DEA8597993E2B2CBDD63A2B70MN2PR12MB3296namp_--

--===============1888218740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1888218740==--

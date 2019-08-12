Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A889A77
	for <lists+amd-gfx@lfdr.de>; Mon, 12 Aug 2019 11:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401CD6E40A;
	Mon, 12 Aug 2019 09:52:19 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFC36E40A
 for <amd-gfx@lists.freedesktop.org>; Mon, 12 Aug 2019 09:52:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=corzPas73gNaVow3RicAuz02z/KxK6uwVEjieVEXePWgEeLYqMP49K3/ng/Y9d2f6kDdk2FEgpiFjXNko945+2ZXmBQCoVauh4nNUpv2nnxMxl6L0kVlCYpfOAYTiANAi8XziZo+HOhK90euOq+305X0Oy2nn0rjTecSEturxCxqMieBhvKMcportCbPnCDDc+STUlYK/77IDDeLVZ56hVlugd89fxzMgvp/+dnPAu2mK901x6yCs6pGkP8GghP1PJGc6QuKe2FfVB5HIz11Yo8mS4RAG2VE+W4zXY3qiEaii9p4wWw6AnDHQ5SbOfChD9hQQiKE16WZG3rbqUHb8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FkOdLJA3uH/kexPhSiglLwjYzYOV5atCSraesjozDg=;
 b=G7Cv77uW6T3yug+QfnAiCl2JfsoqGIExQkTrXp46eCe7+8zzLtv1AuyP2BuUIER49nhIQ1ofMDtMnzVbwtBh+KCXO4rMbCkLGPt6YKyxnI2f7zi6zMPSCbKI+qlLycECWRJsM9PTPKjVYeQA/wIIpqwUxpFwK1EMfagCErQjHC/0NAT5nadSsJUmNY2VsmwefwPrH51w3ZsYiTYo5czV4xZL+D2VcZflAVXfdf9cI1c6agpHKaJp5ww1jbwUA8fVY+gYoFzx9YSORBSnI2ROROJ8OyPoU2bEZwXFjnLAXgUNLL7U1qqvvBD5nRdZnlqfHICLkCFuVC4H3tx01CwShg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4222.namprd12.prod.outlook.com (10.255.125.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Mon, 12 Aug 2019 09:52:15 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::7490:549a:479d:f716%6]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 09:52:15 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "Gui, Jack" <Jack.Gui@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Topic: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
 function for arcturus
Thread-Index: AQHVUOcfn4jDEWsNQ0ef3SVSz6eLbKb3QbcAgAABvoQ=
Date: Mon, 12 Aug 2019 09:52:15 +0000
Message-ID: <MN2PR12MB3296807CB0DAC9F94D795E56A2D30@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <1565598138-13844-1-git-send-email-Jack.Gui@amd.com>
 <1565598138-13844-2-git-send-email-Jack.Gui@amd.com>,
 <MN2PR12MB33441DEDEEB00F8F321F72BBE4D30@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33441DEDEEB00F8F321F72BBE4D30@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3576894d-63d2-4087-78cb-08d71f0ac1ba
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4222; 
x-ms-traffictypediagnostic: MN2PR12MB4222:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB422212BC62183644BF8A5577A2D30@MN2PR12MB4222.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(13464003)(199004)(189003)(74316002)(5660300002)(6246003)(256004)(14444005)(66066001)(19627405001)(7736002)(71190400001)(81166006)(66476007)(64756008)(66446008)(76116006)(66556008)(8936002)(71200400001)(81156014)(8676002)(52536014)(25786009)(606006)(7696005)(2906002)(110136005)(229853002)(55016002)(486006)(186003)(446003)(53936002)(26005)(476003)(6506007)(102836004)(53546011)(11346002)(33656002)(105004)(9686003)(316002)(6306002)(54896002)(236005)(6116002)(3846002)(966005)(6436002)(14454004)(99286004)(76176011)(2501003)(86362001)(478600001)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4222;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GoXkhkvUl92SBWvU7gKXD9UpcBLOqPQr7M381vjSGqWB6obiNyvCDWQGPq3CguWkaR4VBJSs52P7/7oh20/kXS2YvqKBY/n/GC2FPmuJhLT52TvyVawnZCcKXGJ09Vqnb3rO8lX5YKXGCEQJP9XStcdmilnK/LrrPkmm+laNXLMKPmRmGfnjeBIxOoeJdES0dWiTfAArudaykEayV3Bt6K3ESZfA6Rmr4I+SMH+clbbR9LovUtRvJ8vNJa4YrF9z/38L4vPtYDkuxGnR26QjlOoJSfETsTrF2RyM9IUpASi+X6x1CPoZ6Iirkg0dqYYBH58t7JCOGVep4I1xsG/8kRsFxmXxaH55c5LA0PzVtPSV/2TkyvTOxKHDbrkxDPH4bFzOWq3uDs8G3e2iEN4K+6DlsbE0eZFM79lJAUiRu0k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3576894d-63d2-4087-78cb-08d71f0ac1ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 09:52:15.5412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pL7jvZYMg7zhy8EO5N7JIMqhg813HEu1L1BH1moIt2bsFRRrnDcesO5cf1UC2rrj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4222
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FkOdLJA3uH/kexPhSiglLwjYzYOV5atCSraesjozDg=;
 b=QMMptNrLvHP5bY2w+DHl9ArWnl2P+jOAOssv5EtuhyyYjVzSlPGzRtUHlRIYnxYWCzSV52FkAZ+Qw/oyQdmAgPtXf3VhLdZtZydrW6e+VCtAeT+1acObdz/tejzI5UvhGya4TtL3upjDttvI7eUFrr6Y8q8ZYMTlYaVFffYwTCk=
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
Content-Type: multipart/mixed; boundary="===============1464525492=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1464525492==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296807CB0DAC9F94D795E56A2D30MN2PR12MB3296namp_"

--_000_MN2PR12MB3296807CB0DAC9F94D795E56A2D30MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

if any DPM feature is enabled, then DPM is running, return true.
if all DPM feature is disabled, the DPM is not running, return false.
so the macro of  "SMC_DPM_FEATURE" should be include all dpm feature, wheth=
er is enabled or supported.
i think the @Gui, Jack<mailto:Jack.Gui@amd.com>'s patch is right.

Best Regards,
Kevin

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Quan, Ev=
an <Evan.Quan@amd.com>
Sent: Monday, August 12, 2019 5:38 PM
To: Gui, Jack <Jack.Gui@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@li=
sts.freedesktop.org>
Cc: Gui, Jack <Jack.Gui@amd.com>
Subject: RE: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running fun=
ction for arcturus

Please set FEATURE_DPM_PREFETCHER_MASK | FEATURE_DPM_GFXCLK_MASK only. For =
now, only these two are enabled on arcturus.

With that fixed, the patch is reviewed-by: Evan Quan <evan.quan@amd.com>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Chengming Gui
> Sent: Monday, August 12, 2019 4:22 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Gui, Jack <Jack.Gui@amd.com>
> Subject: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running
> function for arcturus
>
> add arcturus_is_dpm_running function
>
> Signed-off-by: Chengming Gui <Jack.Gui@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 21
> +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> index 03ce871..9107beb 100644
> --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c
> @@ -51,6 +51,15 @@
>  #define SMU_FEATURES_HIGH_MASK       0xFFFFFFFF00000000
>  #define SMU_FEATURES_HIGH_SHIFT      32
>
> +#define SMC_DPM_FEATURE ( \
> +     FEATURE_DPM_PREFETCHER_MASK | \
> +     FEATURE_DPM_GFXCLK_MASK | \
> +     FEATURE_DPM_UCLK_MASK | \
> +     FEATURE_DPM_SOCCLK_MASK | \
> +     FEATURE_DPM_MP0CLK_MASK | \
> +     FEATURE_DPM_FCLK_MASK | \
> +     FEATURE_DPM_XGMI_MASK)
> +
>  /* possible frequency drift (1Mhz) */
>  #define EPSILON                              1
>
> @@ -1873,6 +1882,17 @@ static void arcturus_dump_pptable(struct
> smu_context *smu)
>
>  }
>
> +static bool arcturus_is_dpm_running(struct smu_context *smu) {
> +     int ret =3D 0;
> +     uint32_t feature_mask[2];
> +     unsigned long feature_enabled;
> +     ret =3D smu_feature_get_enabled_mask(smu, feature_mask, 2);
> +     feature_enabled =3D (unsigned long)((uint64_t)feature_mask[0] |
> +                        ((uint64_t)feature_mask[1] << 32));
> +     return !!(feature_enabled & SMC_DPM_FEATURE); }
> +
>  static const struct pptable_funcs arcturus_ppt_funcs =3D {
>        /* translate smu index into arcturus specific index */
>        .get_smu_msg_index =3D arcturus_get_smu_msg_index, @@ -1910,6
> +1930,7 @@ static const struct pptable_funcs arcturus_ppt_funcs =3D {
>        /* debug (internal used) */
>        .dump_pptable =3D arcturus_dump_pptable,
>        .get_power_limit =3D arcturus_get_power_limit,
> +     .is_dpm_running =3D arcturus_is_dpm_running,
>  };
>
>  void arcturus_set_ppt_funcs(struct smu_context *smu)
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296807CB0DAC9F94D795E56A2D30MN2PR12MB3296namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>if any DPM feature is enabled, then DPM is running, return true.</spa=
n></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>if all DPM feature is disabled, the DPM is not running, return false.=
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">so the macro of&nbsp; &quot;</span><i style=
=3D"font-size: 12pt; font-variant-ligatures: inherit; font-variant-caps: in=
herit; font-weight: inherit;">SMC_DPM_FEATURE</i><span style=3D"color: rgb(=
0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12=
pt;">&quot;
 should be include all dpm feature, whether is enabled or supported.</span>=
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>i think the&nbsp;<a id=3D"OWAAM823302" class=3D"_1OtrSZdhKXVv3Uhaivrd=
J4 mention ms-bgc-nlr ms-fcl-b" href=3D"mailto:Jack.Gui@amd.com">@Gui, Jack=
</a>'s patch is right.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span>Best Regards,<br>
Kevin<br>
</span><span></span><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Quan, Evan &lt;Evan.Quan@amd.=
com&gt;<br>
<b>Sent:</b> Monday, August 12, 2019 5:38 PM<br>
<b>To:</b> Gui, Jack &lt;Jack.Gui@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Gui, Jack &lt;Jack.Gui@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_runn=
ing function for arcturus</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Please set FEATURE_DPM_PREFETCHER_MASK | FEATURE_D=
PM_GFXCLK_MASK only. For now, only these two are enabled on arcturus.<br>
<br>
With that fixed, the patch is reviewed-by: Evan Quan &lt;evan.quan@amd.com&=
gt;<br>
&gt; -----Original Message-----<br>
&gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf =
Of<br>
&gt; Chengming Gui<br>
&gt; Sent: Monday, August 12, 2019 4:22 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Gui, Jack &lt;Jack.Gui@amd.com&gt;<br>
&gt; Subject: [PATCH 2/2] drm/amd/powerplay: add arcturus_is_dpm_running<br=
>
&gt; function for arcturus<br>
&gt; <br>
&gt; add arcturus_is_dpm_running function<br>
&gt; <br>
&gt; Signed-off-by: Chengming Gui &lt;Jack.Gui@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/arcturus_ppt.c | 21<br>
&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 1 file changed, 21 insertions(&#43;)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; index 03ce871..9107beb 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/arcturus_ppt.c<br>
&gt; @@ -51,6 &#43;51,15 @@<br>
&gt;&nbsp; #define SMU_FEATURES_HIGH_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; 0xFFFFFFFF00000000<br>
&gt;&nbsp; #define SMU_FEATURES_HIGH_SHIFT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 32=
<br>
&gt; <br>
&gt; &#43;#define SMC_DPM_FEATURE ( \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_PREFETCHER_MASK | \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_GFXCLK_MASK | \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_UCLK_MASK | \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_SOCCLK_MASK | \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_MP0CLK_MASK | \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_FCLK_MASK | \<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_XGMI_MASK)<br>
&gt; &#43;<br>
&gt;&nbsp; /* possible frequency drift (1Mhz) */<br>
&gt;&nbsp; #define EPSILON&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1<br>
&gt; <br>
&gt; @@ -1873,6 &#43;1882,17 @@ static void arcturus_dump_pptable(struct<br=
>
&gt; smu_context *smu)<br>
&gt; <br>
&gt;&nbsp; }<br>
&gt; <br>
&gt; &#43;static bool arcturus_is_dpm_running(struct smu_context *smu) {<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t feature_mask[2];<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long feature_enabled;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_feature_get_enabled_mask(smu=
, feature_mask, 2);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; feature_enabled =3D (unsigned long)((uin=
t64_t)feature_mask[0] |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (=
(uint64_t)feature_mask[1] &lt;&lt; 32));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return !!(feature_enabled &amp; SMC_DPM_=
FEATURE); }<br>
&gt; &#43;<br>
&gt;&nbsp; static const struct pptable_funcs arcturus_ppt_funcs =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* translate smu index into =
arcturus specific index */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_smu_msg_index =3D arctu=
rus_get_smu_msg_index, @@ -1910,6<br>
&gt; &#43;1930,7 @@ static const struct pptable_funcs arcturus_ppt_funcs =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* debug (internal used) */<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .dump_pptable =3D arcturus_d=
ump_pptable,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_power_limit =3D arcturu=
s_get_power_limit,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .is_dpm_running =3D arcturus_is_dpm_runn=
ing,<br>
&gt;&nbsp; };<br>
&gt; <br>
&gt;&nbsp; void arcturus_set_ppt_funcs(struct smu_context *smu)<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296807CB0DAC9F94D795E56A2D30MN2PR12MB3296namp_--

--===============1464525492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1464525492==--

Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D39942E
	for <lists+amd-gfx@lfdr.de>; Thu, 22 Aug 2019 14:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2716EB17;
	Thu, 22 Aug 2019 12:49:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790043.outbound.protection.outlook.com [40.107.79.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352876EB17
 for <amd-gfx@lists.freedesktop.org>; Thu, 22 Aug 2019 12:49:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oN3gskzdrVGLH+yDNmHOoPEqNeBmI+ZDQaDCbbB27iznN6KBBElp7U6xGhyF0QUKxoEglOiEK92KLkmsb6UPQOzrzNPfB18c1OMBfGctklr6nY70DWC+UvJSdWk1MVvXdtzAAKglmeLJWO2V5ewoZNCqrt522B2EsWciy71UGurIJX+P6pnCKnXs/w1VQ1/Iy3KSFUw/yrmpjzTOJfowDg0MJTp1GqeLfiJX4NHRy46+cv6Xfoy3IlGTyFKf+TPe/HUBtNnxHx4jPlSFUhzX5KoVjnRuLDH4r/xoMnFH92SDgCpDLiTzJxScPklMzFMpjHioEHF07chMtc0fKelwaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz/O0b2XRWJ819TqgBOP0S70jSXj3Vgi12fdvDFMseM=;
 b=BhKG9W9k4jApMJJcrDecue+l5t4Kfrn0aSQLKdkMfscOMvLvOOut2e99cdD15u2sO/ZF/FkppMOFGqQwgvW3kh8J5BxqogmiapzobdQ6OSz/fHnFYejPX1jc0KNyQSDKqFQgItCfkI4yeGe91VSJAwno+MDgG6YPUa/L4e9eQPu/LOtcRKSegs1AFxMZLn1tJ/9+8qboBZscJOO6Jm1nKMIsFDiC6qGEopaudxoktL2a9oeO/Toy81MRadsIHc7QLyF3GuZheTJlLYuSKP6RRTvG7L0dChGoBFE6PEM7zidsR82p9rIB2XN7gtZ/f/5tKy6Lbj9oIR05BsYa5n9vYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1794.namprd12.prod.outlook.com (10.175.98.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 12:49:11 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 12:49:11 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Quan, Evan" <Evan.Quan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level related
 settings
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level related
 settings
Thread-Index: AQHVV/xOJy9/yqM7oUygi6Whz1WjBKcG9qqAgAApTE4=
Date: Thu, 22 Aug 2019 12:49:11 +0000
Message-ID: <BN6PR12MB1809F9E59D061C18B1093ACEF7A50@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190821084143.25713-1-evan.quan@amd.com>,
 <MN2PR12MB3344CC59152485D92985287BE4A50@MN2PR12MB3344.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3344CC59152485D92985287BE4A50@MN2PR12MB3344.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16b2fa14-c42e-43cf-83f6-08d726ff218f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1794; 
x-ms-traffictypediagnostic: BN6PR12MB1794:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB17945964BA781CDA39F5B772F7A50@BN6PR12MB1794.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(13464003)(199004)(189003)(81156014)(86362001)(486006)(99286004)(71190400001)(6436002)(74316002)(66946007)(316002)(2501003)(6246003)(7736002)(25786009)(19627405001)(64756008)(76116006)(81166006)(53936002)(8936002)(66476007)(66446008)(476003)(11346002)(6116002)(3846002)(229853002)(5660300002)(14454004)(110136005)(66556008)(8676002)(105004)(26005)(256004)(33656002)(6506007)(53546011)(186003)(9686003)(66066001)(7696005)(54896002)(76176011)(102836004)(71200400001)(2906002)(478600001)(52536014)(446003)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1794;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: af/ow2A4V1gjervsyHsgd9IopumDyQ4SsbZmg9LzbZidOi60vwUuVZ5my79AGuR3onePJ2joouosAS/Jlg4wcBfYFJo4eYQMy1z2KOmQqNzq5JEoAIk3wllJnS8c6H5KKA1y7FEN2sl0rIZMXBd98WuwmkYB3A1h9WdCYsZA/YCsOD6AXkAGcv2l+6vk7hZNKdU6TO+NCmEp5iV2qkrDLD4+k2DCXoF7f0ftzm3jhC59zmT1I3ebbZ4SL43O6au8XpwAenGJwd0k1JK2JWeYaJcpTSUPAayOvXFjxjvRbbYX/t2ihtxA9kSIxnMK7dyLW7tIMr2jR51fjYrxscyzQtBAFBLuvkdnLCPdbCpw50aUSh49dqziphXFpRb6SWsrPNuw0TOfVvxS/v0Uymn+r/AXfCv/mmx8UjqLwA2mGC4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b2fa14-c42e-43cf-83f6-08d726ff218f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 12:49:11.6534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjnD6D50RXdwwRDD3PLETzCKwnlBuz/3f6e8PW69XEDhwXZxfltE5I0NXD3cfbD5ylhYl4Lf14ufgFbgIK7SCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1794
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zz/O0b2XRWJ819TqgBOP0S70jSXj3Vgi12fdvDFMseM=;
 b=pKhIaI1mUIuBMsP4/Mw4ACRoJhKEeVWzQJSKlV19eafmnxEp6jpVihnR+V4WrHAt0bR5gxuz7/jLGsFltaEesWN+DivqExZ95Yv2FOohJxHq57s55gPBPiW6TNGDw/FEYfy9NNr95mSdvin1VdLVgkP77B1IdCji90cs9BAVLHo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1513642333=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1513642333==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809F9E59D061C18B1093ACEF7A50BN6PR12MB1809namp_"

--_000_BN6PR12MB1809F9E59D061C18B1093ACEF7A50BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Quan, Evan <Evan.Quan@amd.com>
Sent: Thursday, August 22, 2019 6:21 AM
To: Quan, Evan <Evan.Quan@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@=
lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level relate=
d settings

Ping..

> -----Original Message-----
> From: Evan Quan <evan.quan@amd.com>
> Sent: Wednesday, August 21, 2019 4:42 PM
> To: amd-gfx@lists.freedesktop.org
> Cc: Quan, Evan <Evan.Quan@amd.com>
> Subject: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level related
> settings
>
> Correct the settings for auto mode and skip the unnecessary settings for
> dcefclk and fclk.
>
> Change-Id: I7e6ca75ce86b4d5cd44920a9fbc71b6f36ea3c49
> Signed-off-by: Evan Quan <evan.quan@amd.com>
> ---
>  .../drm/amd/powerplay/hwmgr/vega20_hwmgr.c    | 60
> +++++++++++++++++--
>  1 file changed, 54 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
> b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
> index 0516c294b377..cc52d5c8ccf9 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c
> @@ -2349,12 +2349,16 @@ static int vega20_force_dpm_highest(struct
> pp_hwmgr *hwmgr)
>                data->dpm_table.soc_table.dpm_state.soft_max_level =3D
>                data->dpm_table.soc_table.dpm_levels[soft_level].value;
>
> -     ret =3D vega20_upload_dpm_min_level(hwmgr, 0xFFFFFFFF);
> +     ret =3D vega20_upload_dpm_min_level(hwmgr,
> FEATURE_DPM_GFXCLK_MASK |
> +                                              FEATURE_DPM_UCLK_MASK
> |
> +
> FEATURE_DPM_SOCCLK_MASK);
>        PP_ASSERT_WITH_CODE(!ret,
>                        "Failed to upload boot level to highest!",
>                        return ret);
>
> -     ret =3D vega20_upload_dpm_max_level(hwmgr, 0xFFFFFFFF);
> +     ret =3D vega20_upload_dpm_max_level(hwmgr,
> FEATURE_DPM_GFXCLK_MASK |
> +                                              FEATURE_DPM_UCLK_MASK
> |
> +
> FEATURE_DPM_SOCCLK_MASK);
>        PP_ASSERT_WITH_CODE(!ret,
>                        "Failed to upload dpm max level to highest!",
>                        return ret);
> @@ -2387,12 +2391,16 @@ static int vega20_force_dpm_lowest(struct
> pp_hwmgr *hwmgr)
>                data->dpm_table.soc_table.dpm_state.soft_max_level =3D
>                data->dpm_table.soc_table.dpm_levels[soft_level].value;
>
> -     ret =3D vega20_upload_dpm_min_level(hwmgr, 0xFFFFFFFF);
> +     ret =3D vega20_upload_dpm_min_level(hwmgr,
> FEATURE_DPM_GFXCLK_MASK |
> +                                              FEATURE_DPM_UCLK_MASK
> |
> +
> FEATURE_DPM_SOCCLK_MASK);
>        PP_ASSERT_WITH_CODE(!ret,
>                        "Failed to upload boot level to highest!",
>                        return ret);
>
> -     ret =3D vega20_upload_dpm_max_level(hwmgr, 0xFFFFFFFF);
> +     ret =3D vega20_upload_dpm_max_level(hwmgr,
> FEATURE_DPM_GFXCLK_MASK |
> +                                              FEATURE_DPM_UCLK_MASK
> |
> +
> FEATURE_DPM_SOCCLK_MASK);
>        PP_ASSERT_WITH_CODE(!ret,
>                        "Failed to upload dpm max level to highest!",
>                        return ret);
> @@ -2403,14 +2411,54 @@ static int vega20_force_dpm_lowest(struct
> pp_hwmgr *hwmgr)
>
>  static int vega20_unforce_dpm_levels(struct pp_hwmgr *hwmgr)  {
> +     struct vega20_hwmgr *data =3D
> +                     (struct vega20_hwmgr *)(hwmgr->backend);
> +     uint32_t soft_min_level, soft_max_level;
>        int ret =3D 0;
>
> -     ret =3D vega20_upload_dpm_min_level(hwmgr, 0xFFFFFFFF);
> +     /* gfxclk soft min/max settings */
> +     soft_min_level =3D
> +             vega20_find_lowest_dpm_level(&(data-
> >dpm_table.gfx_table));
> +     soft_max_level =3D
> +             vega20_find_highest_dpm_level(&(data-
> >dpm_table.gfx_table));
> +
> +     data->dpm_table.gfx_table.dpm_state.soft_min_level =3D
> +             data-
> >dpm_table.gfx_table.dpm_levels[soft_min_level].value;
> +     data->dpm_table.gfx_table.dpm_state.soft_max_level =3D
> +             data-
> >dpm_table.gfx_table.dpm_levels[soft_max_level].value;
> +
> +     /* uclk soft min/max settings */
> +     soft_min_level =3D
> +             vega20_find_lowest_dpm_level(&(data-
> >dpm_table.mem_table));
> +     soft_max_level =3D
> +             vega20_find_highest_dpm_level(&(data-
> >dpm_table.mem_table));
> +
> +     data->dpm_table.mem_table.dpm_state.soft_min_level =3D
> +             data-
> >dpm_table.mem_table.dpm_levels[soft_min_level].value;
> +     data->dpm_table.mem_table.dpm_state.soft_max_level =3D
> +             data-
> >dpm_table.mem_table.dpm_levels[soft_max_level].value;
> +
> +     /* socclk soft min/max settings */
> +     soft_min_level =3D
> +             vega20_find_lowest_dpm_level(&(data-
> >dpm_table.soc_table));
> +     soft_max_level =3D
> +             vega20_find_highest_dpm_level(&(data-
> >dpm_table.soc_table));
> +
> +     data->dpm_table.soc_table.dpm_state.soft_min_level =3D
> +             data-
> >dpm_table.soc_table.dpm_levels[soft_min_level].value;
> +     data->dpm_table.soc_table.dpm_state.soft_max_level =3D
> +             data-
> >dpm_table.soc_table.dpm_levels[soft_max_level].value;
> +
> +     ret =3D vega20_upload_dpm_min_level(hwmgr,
> FEATURE_DPM_GFXCLK_MASK |
> +                                              FEATURE_DPM_UCLK_MASK
> |
> +
> FEATURE_DPM_SOCCLK_MASK);
>        PP_ASSERT_WITH_CODE(!ret,
>                        "Failed to upload DPM Bootup Levels!",
>                        return ret);
>
> -     ret =3D vega20_upload_dpm_max_level(hwmgr, 0xFFFFFFFF);
> +     ret =3D vega20_upload_dpm_max_level(hwmgr,
> FEATURE_DPM_GFXCLK_MASK |
> +                                              FEATURE_DPM_UCLK_MASK
> |
> +
> FEATURE_DPM_SOCCLK_MASK);
>        PP_ASSERT_WITH_CODE(!ret,
>                        "Failed to upload DPM Max Levels!",
>                        return ret);
> --
> 2.23.0


--_000_BN6PR12MB1809F9E59D061C18B1093ACEF7A50BN6PR12MB1809namp_
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
Acked-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Quan, Evan &lt;Evan.Q=
uan@amd.com&gt;<br>
<b>Sent:</b> Thursday, August 22, 2019 6:21 AM<br>
<b>To:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> RE: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level=
 related settings</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Ping..<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Evan Quan &lt;evan.quan@amd.com&gt;<br>
&gt; Sent: Wednesday, August 21, 2019 4:42 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org<br>
&gt; Cc: Quan, Evan &lt;Evan.Quan@amd.com&gt;<br>
&gt; Subject: [PATCH 1/2] drm/amd/powerplay: correct Vega20 dpm level relat=
ed<br>
&gt; settings<br>
&gt; <br>
&gt; Correct the settings for auto mode and skip the unnecessary settings f=
or<br>
&gt; dcefclk and fclk.<br>
&gt; <br>
&gt; Change-Id: I7e6ca75ce86b4d5cd44920a9fbc71b6f36ea3c49<br>
&gt; Signed-off-by: Evan Quan &lt;evan.quan@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../drm/amd/powerplay/hwmgr/vega20_hwmgr.c&nbsp;&nbsp;&nbsp; | 6=
0<br>
&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;--<br>
&gt;&nbsp; 1 file changed, 54 insertions(&#43;), 6 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&gt; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&gt; index 0516c294b377..cc52d5c8ccf9 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/hwmgr/vega20_hwmgr.c<b=
r>
&gt; @@ -2349,12 &#43;2349,16 @@ static int vega20_force_dpm_highest(struct=
<br>
&gt; pp_hwmgr *hwmgr)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.soc_table.dpm_state.soft_max_level =
=3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.soc_table.dpm_levels[soft_level].val=
ue;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_min_level(hwmgr, 0=
xFFFFFFFF);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_min_level(hwmg=
r,<br>
&gt; FEATURE_DPM_GFXCLK_MASK |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_UCLK_MA=
SK<br>
&gt; |<br>
&gt; &#43;<br>
&gt; FEATURE_DPM_SOCCLK_MASK);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;F=
ailed to upload boot level to highest!&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret);<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_max_level(hwmgr, 0=
xFFFFFFFF);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_max_level(hwmg=
r,<br>
&gt; FEATURE_DPM_GFXCLK_MASK |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_UCLK_MA=
SK<br>
&gt; |<br>
&gt; &#43;<br>
&gt; FEATURE_DPM_SOCCLK_MASK);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;F=
ailed to upload dpm max level to highest!&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret);<br>
&gt; @@ -2387,12 &#43;2391,16 @@ static int vega20_force_dpm_lowest(struct<=
br>
&gt; pp_hwmgr *hwmgr)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.soc_table.dpm_state.soft_max_level =
=3D<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.soc_table.dpm_levels[soft_level].val=
ue;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_min_level(hwmgr, 0=
xFFFFFFFF);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_min_level(hwmg=
r,<br>
&gt; FEATURE_DPM_GFXCLK_MASK |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_UCLK_MA=
SK<br>
&gt; |<br>
&gt; &#43;<br>
&gt; FEATURE_DPM_SOCCLK_MASK);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;F=
ailed to upload boot level to highest!&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret);<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_max_level(hwmgr, 0=
xFFFFFFFF);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_max_level(hwmg=
r,<br>
&gt; FEATURE_DPM_GFXCLK_MASK |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_UCLK_MA=
SK<br>
&gt; |<br>
&gt; &#43;<br>
&gt; FEATURE_DPM_SOCCLK_MASK);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;F=
ailed to upload dpm max level to highest!&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret);<br>
&gt; @@ -2403,14 &#43;2411,54 @@ static int vega20_force_dpm_lowest(struct<=
br>
&gt; pp_hwmgr *hwmgr)<br>
&gt; <br>
&gt;&nbsp; static int vega20_unforce_dpm_levels(struct pp_hwmgr *hwmgr)&nbs=
p; {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct vega20_hwmgr *data =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (struct vega20_hwmg=
r *)(hwmgr-&gt;backend);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t soft_min_level, soft_max_level;=
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_min_level(hwmgr, 0=
xFFFFFFFF);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* gfxclk soft min/max settings */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; soft_min_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vega20_find_lowest_dpm_level(&amp;(data-<br>
&gt; &gt;dpm_table.gfx_table));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; soft_max_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vega20_find_highest_dpm_level(&amp;(data-<br>
&gt; &gt;dpm_table.gfx_table));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.gfx_table.dpm_state.s=
oft_min_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; data-<br>
&gt; &gt;dpm_table.gfx_table.dpm_levels[soft_min_level].value;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.gfx_table.dpm_state.s=
oft_max_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; data-<br>
&gt; &gt;dpm_table.gfx_table.dpm_levels[soft_max_level].value;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* uclk soft min/max settings */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; soft_min_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vega20_find_lowest_dpm_level(&amp;(data-<br>
&gt; &gt;dpm_table.mem_table));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; soft_max_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vega20_find_highest_dpm_level(&amp;(data-<br>
&gt; &gt;dpm_table.mem_table));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.mem_table.dpm_state.s=
oft_min_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; data-<br>
&gt; &gt;dpm_table.mem_table.dpm_levels[soft_min_level].value;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.mem_table.dpm_state.s=
oft_max_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; data-<br>
&gt; &gt;dpm_table.mem_table.dpm_levels[soft_max_level].value;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* socclk soft min/max settings */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; soft_min_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vega20_find_lowest_dpm_level(&amp;(data-<br>
&gt; &gt;dpm_table.soc_table));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; soft_max_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vega20_find_highest_dpm_level(&amp;(data-<br>
&gt; &gt;dpm_table.soc_table));<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.soc_table.dpm_state.s=
oft_min_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; data-<br>
&gt; &gt;dpm_table.soc_table.dpm_levels[soft_min_level].value;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;dpm_table.soc_table.dpm_state.s=
oft_max_level =3D<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; data-<br>
&gt; &gt;dpm_table.soc_table.dpm_levels[soft_max_level].value;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_min_level(hwmg=
r,<br>
&gt; FEATURE_DPM_GFXCLK_MASK |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_UCLK_MA=
SK<br>
&gt; |<br>
&gt; &#43;<br>
&gt; FEATURE_DPM_SOCCLK_MASK);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;F=
ailed to upload DPM Bootup Levels!&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret);<br>
&gt; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_max_level(hwmgr, 0=
xFFFFFFFF);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D vega20_upload_dpm_max_level(hwmg=
r,<br>
&gt; FEATURE_DPM_GFXCLK_MASK |<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEATURE_DPM_UCLK_MA=
SK<br>
&gt; |<br>
&gt; &#43;<br>
&gt; FEATURE_DPM_SOCCLK_MASK);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PP_ASSERT_WITH_CODE(!ret,<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;F=
ailed to upload DPM Max Levels!&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
ret);<br>
&gt; --<br>
&gt; 2.23.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809F9E59D061C18B1093ACEF7A50BN6PR12MB1809namp_--

--===============1513642333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1513642333==--

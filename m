Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602ACD1E92
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 04:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0AA989ABE;
	Thu, 10 Oct 2019 02:40:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820049.outbound.protection.outlook.com [40.107.82.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D85B89ABE
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 02:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DheXfD15SF44AFwx0C6dUWFpaqmZJYjXZjlhVofJcS2Nl7ce0CXJEG3LWLIJuNc72Gw7i0ikZ71pAb7nlWYLLH0GbgKfE8LTzBcC94XPtlF19qqPmjt6Gbf/iqIgWWnJfbYf3sSfVrQPhgylpoDlNi0t4BdYDtMcPqvWCLjvTsONrxOchnofXlfnVgKmgF3YueX237cVJIFtFgJazSaBomGc32LnqS1/FwXAxbBA4OFLSEkcGJC2gxalo2OdIftJwyfD0rSdq0iF6oFLZNB/LDchehErAvLT3HMVwMq+nIWypuwNfwwUS5nq/m/QhWbWUBh+vzMhfn2rYBOHy8c7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CMdm0OUsgObhkMnCNEKE/qBeQlmck3zCo8SglrpZQM=;
 b=Zj1t8K3nKH62FXlxDc8egtG8c8GctNZ9KA2oPTnkzPXmPA9t4EtSXMeqQEEp7CwiuVxr6Qj8kjTCfNQ9hVIDK387Kyb75IZK8POAOlhU1LfSnp1iYx+rl1Fmg/22CaYi4MdF8PoPXWs/8ogLJNHAlklHx3RsCmhCiUnJ90adtIiO3HWmE6aU9/odaCPMx7+CY3dO1tZ0GnlHzdqUmadv2lZla9snO5EwidoOQWRSEGKJNiyla9LsFRLhAeUNmwAGnEstAl7o21aUGh5IOsD1S1r79qOMgut/nwVkwqHvidZwYIEOsvx/tlTv9AZnXVM/qwumrtPOrnyLOOwcw2Ahwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3290.namprd12.prod.outlook.com (20.179.106.78) by
 DM6SPR01MB0023.namprd12.prod.outlook.com (20.176.117.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 02:40:56 +0000
Received: from DM6PR12MB3290.namprd12.prod.outlook.com
 ([fe80::95ce:af42:b4d7:d913]) by DM6PR12MB3290.namprd12.prod.outlook.com
 ([fe80::95ce:af42:b4d7:d913%4]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 02:40:56 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Yuan, Xiaojie"
 <Xiaojie.Yuan@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: add more feature bits
Thread-Topic: [PATCH 1/2] drm/amd/powerplay: add more feature bits
Thread-Index: AQHVfpHYv5oONJ+p/UGt6tWDCreN0KdTJuQ2gAACH4CAAAHE8w==
Date: Thu, 10 Oct 2019 02:40:55 +0000
Message-ID: <DM6PR12MB3290C65962F4DEC69415E0E3A2940@DM6PR12MB3290.namprd12.prod.outlook.com>
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>
 <BN8PR12MB3602BB4F482647F07C325E3A89940@BN8PR12MB3602.namprd12.prod.outlook.com>,
 <CADnq5_MQSOscW5N2TX1jXgWGt4fyoA6-A8QPWreyEOroT_AR6Q@mail.gmail.com>
In-Reply-To: <CADnq5_MQSOscW5N2TX1jXgWGt4fyoA6-A8QPWreyEOroT_AR6Q@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95cd14c3-8992-4449-0909-08d74d2b46b2
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6SPR01MB0023:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6SPR01MB00232097A168347FFAC65B9AA2940@DM6SPR01MB0023.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:132;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(189003)(199004)(6636002)(14444005)(53546011)(19627405001)(6506007)(2906002)(86362001)(33656002)(26005)(71190400001)(71200400001)(966005)(478600001)(229853002)(102836004)(236005)(186003)(99286004)(6436002)(8936002)(81156014)(81166006)(8676002)(105004)(74316002)(66066001)(6116002)(3846002)(76176011)(6306002)(91956017)(9686003)(76116006)(256004)(54896002)(7736002)(66476007)(66556008)(64756008)(66446008)(66946007)(25786009)(7696005)(55016002)(6246003)(52536014)(446003)(316002)(14454004)(54906003)(5660300002)(110136005)(4326008)(11346002)(476003)(486006)(606006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6SPR01MB0023;
 H:DM6PR12MB3290.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7pM0YdY2yhW50AGuFrF5LqdN/MJFf0YzdUBdsbgZwPHtVRVHnQ/pJs469ZJRJl2aT4Es4M/iq+XVQOz2JycWi4tZH2XlaBEm6NvUisPQ35WSLRgRBD5eOrOExgzxZUb+wFIP1dnHAvNZoGZNVvj4RDxzB90t1EM64Pss7szwUVcWr0jF/1v8rQUEWvmue6ZbWRNp9CHT85Kjs6Ajdm3Y9HcLz4q0z05HbKrZbC4RNqM/GKXsTSIkfBflXnqSmfeY20Hs9EJKTKsSTtmE4++SBAPzCkEK7s0QTWpUIwary32+BjZgCIscp8D+P/SbvepjZ67NBybzfRywF7Bvyi07dTcWOQgiWvlb/hZP1pNtvvwFfxx76BwmnaUWyppZ8eWhfgj6z7LkRhMiUTVoLx2mYDK2x7q2wMGAdJaworRJknmbXZt+vkpS7P3XKF20lzGs1JalL/sGIEW7C+n2U7Cq5Q==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95cd14c3-8992-4449-0909-08d74d2b46b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 02:40:55.9700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UmJEyOzYUjjr9AbIzpjKGm/GFC4mgO4LS07NCJYOy0jN96rcm4T6l8XVABKbrQse
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0023
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CMdm0OUsgObhkMnCNEKE/qBeQlmck3zCo8SglrpZQM=;
 b=xo5va52p0vmnvB4OqXCup3RT8VM0dBrVy2TMsVFfT61sknxwt7plIjSPDz8uH/lvIx0xCHps8jLbtO2xRmcZPXO6QXChujE4JXwWtSrya5W0t+PFfghH0/ukS61SSBV5rojcJUbwM3LazpfcO+TGAxjx8Pe2RIkUnlUvDp24s/s=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0967526409=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0967526409==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB3290C65962F4DEC69415E0E3A2940DM6PR12MB3290namp_"

--_000_DM6PR12MB3290C65962F4DEC69415E0E3A2940DM6PR12MB3290namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin

________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Thursday, October 10, 2019 10:33 AM
To: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Xiao, Ja=
ck <Jack.Xiao@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Feng, Kenneth <Kenn=
eth.Feng@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Zhang, Hawking =
<Hawking.Zhang@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: add more feature bits

Acked-by: Alex Deucher <alexander.deucher@amd.com>

On Wed, Oct 9, 2019 at 10:25 PM Yuan, Xiaojie <Xiaojie.Yuan@amd.com> wrote:
>
> Ping ...
>
> BR,
> Xiaojie
> ________________________________
> From: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
> Sent: Wednesday, October 9, 2019 7:08 PM
> To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
> Cc: Zhang, Hawking <Hawking.Zhang@amd.com>; Xiao, Jack <Jack.Xiao@amd.com=
>; Feng, Kenneth <Kenneth.Feng@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Wa=
ng, Kevin(Yang) <Kevin1.Wang@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
> Subject: [PATCH 1/2] drm/amd/powerplay: add more feature bits
>
> Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm=
/amd/powerplay/navi10_ppt.c
> index 5a34d01f7f7c..44152c1f01c7 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -337,19 +337,22 @@ navi10_get_allowed_feature_mask(struct smu_context =
*smu,
>                                  | FEATURE_MASK(FEATURE_PPT_BIT)
>                                  | FEATURE_MASK(FEATURE_TDC_BIT)
>                                  | FEATURE_MASK(FEATURE_GFX_EDC_BIT)
> +                               | FEATURE_MASK(FEATURE_APCC_PLUS_BIT)
>                                  | FEATURE_MASK(FEATURE_VR0HOT_BIT)
>                                  | FEATURE_MASK(FEATURE_FAN_CONTROL_BIT)
>                                  | FEATURE_MASK(FEATURE_THERMAL_BIT)
>                                  | FEATURE_MASK(FEATURE_LED_DISPLAY_BIT)
>                                  | FEATURE_MASK(FEATURE_DPM_DCEFCLK_BIT)
>                                  | FEATURE_MASK(FEATURE_DS_GFXCLK_BIT)
> +                               | FEATURE_MASK(FEATURE_DS_LCLK_BIT)
>                                  | FEATURE_MASK(FEATURE_DS_DCEFCLK_BIT)
>                                  | FEATURE_MASK(FEATURE_FW_DSTATE_BIT)
>                                  | FEATURE_MASK(FEATURE_BACO_BIT)
>                                  | FEATURE_MASK(FEATURE_ACDC_BIT)
>                                  | FEATURE_MASK(FEATURE_GFX_SS_BIT)
>                                  | FEATURE_MASK(FEATURE_APCC_DFLL_BIT)
> -                               | FEATURE_MASK(FEATURE_FW_CTF_BIT);
> +                               | FEATURE_MASK(FEATURE_FW_CTF_BIT)
> +                               | FEATURE_MASK(FEATURE_OUT_OF_BAND_MONITO=
R_BIT);
>
>          if (adev->pm.pp_feature & PP_MCLK_DPM_MASK)
>                  *(uint64_t *)feature_mask |=3D FEATURE_MASK(FEATURE_DPM_=
UCLK_BIT)
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB3290C65962F4DEC69415E0E3A2940DM6PR12MB3290namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Thursday, October 10, 2019 10:33 AM<br>
<b>To:</b> Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.com=
&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Wang, Kevin(Yang) &lt;Kev=
in1.Wang@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/2] drm/amd/powerplay: add more feature bits</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Acked-by: Alex Deucher &lt;alexander.deucher@amd.c=
om&gt;<br>
<br>
On Wed, Oct 9, 2019 at 10:25 PM Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt; =
wrote:<br>
&gt;<br>
&gt; Ping ...<br>
&gt;<br>
&gt; BR,<br>
&gt; Xiaojie<br>
&gt; ________________________________<br>
&gt; From: Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
&gt; Sent: Wednesday, October 9, 2019 7:08 PM<br>
&gt; To: amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;<br>
&gt; Cc: Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Xiao, Jack &lt;Jack.=
Xiao@amd.com&gt;; Feng, Kenneth &lt;Kenneth.Feng@amd.com&gt;; Quan, Evan &l=
t;Evan.Quan@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Yua=
n, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
&gt; Subject: [PATCH 1/2] drm/amd/powerplay: add more feature bits<br>
&gt;<br>
&gt; Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 5 &#43;&#43;&#43;&#=
43;-<br>
&gt;&nbsp; 1 file changed, 4 insertions(&#43;), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/=
drm/amd/powerplay/navi10_ppt.c<br>
&gt; index 5a34d01f7f7c..44152c1f01c7 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -337,19 &#43;337,22 @@ navi10_get_allowed_feature_mask(struct smu_c=
ontext *smu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_PPT_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_TDC_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_GFX_EDC_BIT)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_APCC_PLUS_B=
IT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_VR0HOT_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_FAN_CONTROL_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_THERMAL_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_LED_DISPLAY_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_DPM_DCEFCLK_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_DS_GFXCLK_BIT)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_DS_LCLK_BIT=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_DS_DCEFCLK_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_FW_DSTATE_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_BACO_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_ACDC_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_GFX_SS_BIT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE=
_APCC_DFLL_BIT)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_FW_CTF_BIT);<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_FW_CTF_BIT)=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | FEATURE_MASK(FEATURE_OUT_OF_BAND=
_MONITOR_BIT);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;pm.=
pp_feature &amp; PP_MCLK_DPM_MASK)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(uint64_t *)feature_mask |=3D FEATURE_MASK=
(FEATURE_DPM_UCLK_BIT)<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">htt=
ps://lists.freedesktop.org/mailman/listinfo/amd-gfx</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB3290C65962F4DEC69415E0E3A2940DM6PR12MB3290namp_--

--===============0967526409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0967526409==--

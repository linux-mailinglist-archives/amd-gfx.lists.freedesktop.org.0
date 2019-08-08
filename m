Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449DD859DC
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 07:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BD86E497;
	Thu,  8 Aug 2019 05:41:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740070.outbound.protection.outlook.com [40.107.74.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA206E497
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 05:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3wmhBWaQWjPsP2IqzO5YnzLNDKXhlkNbMI95Kkplqee/sACsgOngJ/jCr5qaQ0hCgcqyvsOLW9Dmosm+1jCZPQKMVJ5Vvz87d3dCT74g5zduRdA1F78jQOIs4S1Pbe6JMmPpPMsVcLNKPprK/aqujhuY6l7Kw02RxBxxWVCjyw1H13EhjMFLi4SSS8lLWDpwYfn/WTE7KDmO4CRp3q3ZQoS+P6hgor5T4KlDtrz2GpDIN5qFs25YSUttLekm2jg2yUcNdOjYL9W1p/bgnihlcGZHRcmeB6joOToGmGtWSHUIZPTqNNT4BUDfFpirDgMRtQVYUSI9wM786kLSUELgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWRwGXOZx/mfl/U0Ns5wOsC8HZ36RUWMB/FrSmu6DEo=;
 b=Lu+avcz3aBQnlyE3U5HA0t2whYCFFL9nLtWa+K4FfOb9vVU/DNTDhciSqOo/bxMEfJEPXNfQ6g77dUeOEAEnwtpEuAEaml2K4Tg4bOC8Epy2ZBO3A+VFQOzy9EUh2axQMvIaPhiKVer4uHj52TxsY3BNFmdVFfTRuj2WPqiEG+cSU0ACFk0VpuZWlaEjjO/w7JY6wsTh8LirfwpPzCpLIbDQEr912koeNyNZvvAqh51HT8zNc2nd5vqdMb0TG5MIE1x+o0Ho5PNFFukz002Z87oCiFy4jwbPSilnUiAX/3990mRy9Wfujc6q61MmGA6/6ijgN+BCFn60ue2cOt9FwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2974.namprd12.prod.outlook.com (20.178.240.140) by
 MN2PR12MB4029.namprd12.prod.outlook.com (10.255.239.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 05:41:33 +0000
Received: from MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::d97d:73f6:5f7b:b10]) by MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::d97d:73f6:5f7b:b10%5]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 05:41:33 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH 1/2] md/powerplay: re-define smu interface version for smu
 v11
Thread-Topic: [PATCH 1/2] md/powerplay: re-define smu interface version for
 smu v11
Thread-Index: AQHVTaoH3mxPlO47ekGLmV1FqQwlE6bwukgAgAAB+Wc=
Date: Thu, 8 Aug 2019 05:41:33 +0000
Message-ID: <MN2PR12MB29744ED8B694F460A72835D395D70@MN2PR12MB2974.namprd12.prod.outlook.com>
References: <1565241947-31011-1-git-send-email-tianci.yin@amd.com>,
 <CADnq5_NTKEkxdFAQU-TEW-KjWP-HWdRrPPXT05460EFc3bGutA@mail.gmail.com>
In-Reply-To: <CADnq5_NTKEkxdFAQU-TEW-KjWP-HWdRrPPXT05460EFc3bGutA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9fdc0228-e195-4a06-5bd1-08d71bc31223
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4029; 
x-ms-traffictypediagnostic: MN2PR12MB4029:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4029E7AB450A821EA75E50F795D70@MN2PR12MB4029.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(199004)(189003)(8676002)(7696005)(105004)(6436002)(186003)(14454004)(76176011)(6116002)(19627405001)(54906003)(486006)(99286004)(81166006)(3846002)(446003)(966005)(81156014)(33656002)(1411001)(6506007)(66946007)(316002)(8936002)(14444005)(256004)(26005)(53546011)(229853002)(2906002)(66446008)(91956017)(66476007)(76116006)(64756008)(66556008)(478600001)(6916009)(102836004)(5660300002)(6246003)(11346002)(7736002)(25786009)(476003)(4326008)(52536014)(606006)(66066001)(54896002)(236005)(53936002)(6306002)(55016002)(86362001)(71200400001)(9686003)(71190400001)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4029;
 H:MN2PR12MB2974.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1ZlMy7zy4p2sAbnE3SGi0J6t8qccKuIq1Bb/c680ugm2+7MI0rPI+ydQXjYtTCsqubF9gK1e1RviL3gSB37Pwx6fR8+2MPQmwRbqI+fbv/oT/SDIu8CGHbCGckMwwLH7TblEGrfOKQlQJOJGZZVVHa8/mAWD20hSoGGB0Xe2T3U1icL/U+/Jy6nMQW8hl6yfTbjzNZfbC+IhC5hbKkEGovMpA/JEIS/HxC7RjGIyBDQJUOCNfbl/4Q1xNKWvHxz3SvlVqz7Uzhs52uNYO1oPOaHOIMBIa3FiWjQH/phgM9dEZERBfSrHX3HvnwD6EGNhtXKgJkHmeDFqqzthAy7rbDIzUS5GKpH2rnXKg5O7YeyZUMOGYgqu2iB1vNJ+ueResMPXoT+IGZ1QId8lfBA51zlN2X4xDzjaqVpqW7p/taw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdc0228-e195-4a06-5bd1-08d71bc31223
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 05:41:33.2144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yN/ZizH3O6BRFkbY5O2Q2hYLdCMbalxX047Piuogr7D32RmTDlE5QsW/ftw85hxiZr0/ocmKNadjDnXp9hBlpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4029
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWRwGXOZx/mfl/U0Ns5wOsC8HZ36RUWMB/FrSmu6DEo=;
 b=IsWsJJlVWSyqiAiG7sgKN8aKykYm1O//D/biD18Y4HyM4Lq8kT1JA1w762N0q4lio5/oJC5J0GVDmx1mKms98GJ2yVqtL7QdrjeBwVYdcWAceoULdG1h3icQyslYeGx9Ep8K+4FRWMPcY24lll5zBf304NKc/4GmZvsa37I7ayU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Tianci.Yin@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Zhang, 
 Hawking" <Hawking.Zhang@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>, "Yuan,
 Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============0790597734=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0790597734==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB29744ED8B694F460A72835D395D70MN2PR12MB2974namp_"

--_000_MN2PR12MB29744ED8B694F460A72835D395D70MN2PR12MB2974namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Alex! I'll fix that.
________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Thursday, August 8, 2019 13:33
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>; Xiao, Jack <Jack.Xiao@amd=
.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Zhang, Hawking <Hawking.Zha=
ng@amd.com>; Quan, Evan <Evan.Quan@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@am=
d.com>
Subject: Re: [PATCH 1/2] md/powerplay: re-define smu interface version for =
smu v11

The a in amd got cut off in your patch title.

Alex

On Thu, Aug 8, 2019 at 1:27 AM Tianci Yin <tianci.yin@amd.com> wrote:
>
> From: tiancyin <tianci.yin@amd.com>
>
> [why]
> navi14 share same defination of smu interface version with navi10,
> anyone of them update the version may break the other one's
> version checking.
>
> [how]
> create different version defination, so that they can
> update their version separately.
>
> Signed-off-by: tiancyin <tianci.yin@amd.com>
> ---
>  drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h      |  4 +++-
>  .../gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h   |  4 +++-
>  drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h            |  5 +++++
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c               |  1 -
>  drivers/gpu/drm/amd/powerplay/smu_v11_0.c                | 16 ++++++++++=
++++++
>  drivers/gpu/drm/amd/powerplay/vega20_ppt.c               |  1 -
>  6 files changed, 27 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h b/driver=
s/gpu/drm/amd/powerplay/inc/smu11_driver_if.h
> index 755d51f..fdc6b7a 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h
> @@ -27,7 +27,9 @@
>  // *** IMPORTANT ***
>  // SMU TEAM: Always increment the interface version if
>  // any structure is changed in this file
> -#define SMU11_DRIVER_IF_VERSION 0x13
> +// Be aware of that the version should be updated in
> +// smu_v11_0.h, rename is also needed.
> +// #define SMU11_DRIVER_IF_VERSION 0x13
>
>  #define PPTABLE_V20_SMU_VERSION 3
>
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h b=
/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
> index adbbfeb..6d9e79e 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h
> @@ -26,7 +26,9 @@
>  // *** IMPORTANT ***
>  // SMU TEAM: Always increment the interface version if
>  // any structure is changed in this file
> -#define SMU11_DRIVER_IF_VERSION 0x33
> +// Be aware of that the version should be updated in
> +// smu_v11_0.h, maybe rename is also needed.
> +// #define SMU11_DRIVER_IF_VERSION 0x33
>
>  #define PPTABLE_NV10_SMU_VERSION 8
>
> diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/gpu/=
drm/amd/powerplay/inc/smu_v11_0.h
> index fcb5801..97605e9 100644
> --- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
> +++ b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h
> @@ -25,6 +25,11 @@
>
>  #include "amdgpu_smu.h"
>
> +#define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF
> +#define SMU11_DRIVER_IF_VERSION_VG20 0x13
> +#define SMU11_DRIVER_IF_VERSION_NV10 0x33
> +#define SMU11_DRIVER_IF_VERSION_NV14 0x33
> +
>  /* MP Apertures */
>  #define MP0_Public                     0x03800000
>  #define MP0_SRAM                       0x03900000
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm=
/amd/powerplay/navi10_ppt.c
> index be88c5d..fdc7db0 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -1630,6 +1630,5 @@ void navi10_set_ppt_funcs(struct smu_context *smu)
>         struct smu_table_context *smu_table =3D &smu->smu_table;
>
>         smu->ppt_funcs =3D &navi10_ppt_funcs;
> -       smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION;
>         smu_table->table_count =3D TABLE_COUNT;
>  }
> diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/drm/=
amd/powerplay/smu_v11_0.c
> index c078bf4..91dfae1 100644
> --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> +++ b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c
> @@ -271,6 +271,22 @@ static int smu_v11_0_check_fw_version(struct smu_con=
text *smu)
>         smu_minor =3D (smu_version >> 8) & 0xff;
>         smu_debug =3D (smu_version >> 0) & 0xff;
>
> +       switch (smu->adev->asic_type) {
> +       case CHIP_VEGA20:
> +               smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION_VG20;
> +               break;
> +       case CHIP_NAVI10:
> +               smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION_NV10;
> +               break;
> +       case CHIP_NAVI14:
> +               smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION_NV14;
> +               break;
> +       default:
> +               pr_err("smu unsuported asic type:%d.\n",smu->adev->asic_t=
ype);
> +               smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION_INV;
> +               break;
> +       }
> +
>         /*
>          * 1. if_version mismatch is not critical as our fw is designed
>          * to be backward compatible.
> diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/drm=
/amd/powerplay/vega20_ppt.c
> index 52c8fc9..e28c004 100644
> --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c
> @@ -3173,6 +3173,5 @@ void vega20_set_ppt_funcs(struct smu_context *smu)
>         struct smu_table_context *smu_table =3D &smu->smu_table;
>
>         smu->ppt_funcs =3D &vega20_ppt_funcs;
> -       smu->smc_if_version =3D SMU11_DRIVER_IF_VERSION;
>         smu_table->table_count =3D TABLE_COUNT;
>  }
> --
> 2.7.4
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB29744ED8B694F460A72835D395D70MN2PR12MB2974namp_
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
Thanks Alex! I'll fix that.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Thursday, August 8, 2019 13:33<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;<br>
<b>Cc:</b> amd-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Xiao, Jack &=
lt;Jack.Xiao@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Zh=
ang, Hawking &lt;Hawking.Zhang@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.co=
m&gt;; Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/2] md/powerplay: re-define smu interface versi=
on for smu v11</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The a in amd got cut off in your patch title.<br>
<br>
Alex<br>
<br>
On Thu, Aug 8, 2019 at 1:27 AM Tianci Yin &lt;tianci.yin@amd.com&gt; wrote:=
<br>
&gt;<br>
&gt; From: tiancyin &lt;tianci.yin@amd.com&gt;<br>
&gt;<br>
&gt; [why]<br>
&gt; navi14 share same defination of smu interface version with navi10,<br>
&gt; anyone of them update the version may break the other one's<br>
&gt; version checking.<br>
&gt;<br>
&gt; [how]<br>
&gt; create different version defination, so that they can<br>
&gt; update their version separately.<br>
&gt;<br>
&gt; Signed-off-by: tiancyin &lt;tianci.yin@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 4 &#43;&#43;&#43;-<br>
&gt;&nbsp; .../gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h&nbsp;&nbs=
p; |&nbsp; 4 &#43;&#43;&#43;-<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 5 &#43;&#43;&#43;&#=
43;&#43;<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/navi10_ppt.c&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 -<=
br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/smu_v11_0.c&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 16 &#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/vega20_ppt.c&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 -<=
br>
&gt;&nbsp; 6 files changed, 27 insertions(&#43;), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h b/dri=
vers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h<br>
&gt; index 755d51f..fdc6b7a 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if.h<=
br>
&gt; @@ -27,7 &#43;27,9 @@<br>
&gt;&nbsp; // *** IMPORTANT ***<br>
&gt;&nbsp; // SMU TEAM: Always increment the interface version if<br>
&gt;&nbsp; // any structure is changed in this file<br>
&gt; -#define SMU11_DRIVER_IF_VERSION 0x13<br>
&gt; &#43;// Be aware of that the version should be updated in<br>
&gt; &#43;// smu_v11_0.h, rename is also needed.<br>
&gt; &#43;// #define SMU11_DRIVER_IF_VERSION 0x13<br>
&gt;<br>
&gt;&nbsp; #define PPTABLE_V20_SMU_VERSION 3<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.=
h b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h<br>
&gt; index adbbfeb..6d9e79e 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_navi10.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu11_driver_if_na=
vi10.h<br>
&gt; @@ -26,7 &#43;26,9 @@<br>
&gt;&nbsp; // *** IMPORTANT ***<br>
&gt;&nbsp; // SMU TEAM: Always increment the interface version if<br>
&gt;&nbsp; // any structure is changed in this file<br>
&gt; -#define SMU11_DRIVER_IF_VERSION 0x33<br>
&gt; &#43;// Be aware of that the version should be updated in<br>
&gt; &#43;// smu_v11_0.h, maybe rename is also needed.<br>
&gt; &#43;// #define SMU11_DRIVER_IF_VERSION 0x33<br>
&gt;<br>
&gt;&nbsp; #define PPTABLE_NV10_SMU_VERSION 8<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h b/drivers/g=
pu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&gt; index fcb5801..97605e9 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/inc/smu_v11_0.h<br>
&gt; @@ -25,6 &#43;25,11 @@<br>
&gt;<br>
&gt;&nbsp; #include &quot;amdgpu_smu.h&quot;<br>
&gt;<br>
&gt; &#43;#define SMU11_DRIVER_IF_VERSION_INV 0xFFFFFFFF<br>
&gt; &#43;#define SMU11_DRIVER_IF_VERSION_VG20 0x13<br>
&gt; &#43;#define SMU11_DRIVER_IF_VERSION_NV10 0x33<br>
&gt; &#43;#define SMU11_DRIVER_IF_VERSION_NV14 0x33<br>
&gt; &#43;<br>
&gt;&nbsp; /* MP Apertures */<br>
&gt;&nbsp; #define MP0_Public&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0x03800000<br>
&gt;&nbsp; #define MP0_SRAM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 0x03900000<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/=
drm/amd/powerplay/navi10_ppt.c<br>
&gt; index be88c5d..fdc7db0 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&gt; @@ -1630,6 &#43;1630,5 @@ void navi10_set_ppt_funcs(struct smu_context=
 *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_conte=
xt *smu_table =3D &amp;smu-&gt;smu_table;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;ppt_funcs =3D =
&amp;navi10_ppt_funcs;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11=
_DRIVER_IF_VERSION;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;table_co=
unt =3D TABLE_COUNT;<br>
&gt;&nbsp; }<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c b/drivers/gpu/d=
rm/amd/powerplay/smu_v11_0.c<br>
&gt; index c078bf4..91dfae1 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/smu_v11_0.c<br>
&gt; @@ -271,6 &#43;271,22 @@ static int smu_v11_0_check_fw_version(struct =
smu_context *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_minor =3D (smu_ver=
sion &gt;&gt; 8) &amp; 0xff;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_debug =3D (smu_ver=
sion &gt;&gt; 0) &amp; 0xff;<br>
&gt;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (smu-&gt;adev-&gt;asi=
c_type) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_VEGA20:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11_DRIVER_IF_VERSION_VG20=
;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI10:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11_DRIVER_IF_VERSION_NV10=
;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case CHIP_NAVI14:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11_DRIVER_IF_VERSION_NV14=
;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; pr_err(&quot;smu unsuported asic type:%d.\n&quot;,smu-&=
gt;adev-&gt;asic_type);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11_DRIVER_IF_VERSION_INV;=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * 1. if_version =
mismatch is not critical as our fw is designed<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to be backward=
 compatible.<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c b/drivers/gpu/=
drm/amd/powerplay/vega20_ppt.c<br>
&gt; index 52c8fc9..e28c004 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/vega20_ppt.c<br>
&gt; @@ -3173,6 &#43;3173,5 @@ void vega20_set_ppt_funcs(struct smu_context=
 *smu)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_conte=
xt *smu_table =3D &amp;smu-&gt;smu_table;<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;ppt_funcs =3D =
&amp;vega20_ppt_funcs;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu-&gt;smc_if_version =3D SMU11=
_DRIVER_IF_VERSION;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smu_table-&gt;table_co=
unt =3D TABLE_COUNT;<br>
&gt;&nbsp; }<br>
&gt; --<br>
&gt; 2.7.4<br>
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

--_000_MN2PR12MB29744ED8B694F460A72835D395D70MN2PR12MB2974namp_--

--===============0790597734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0790597734==--

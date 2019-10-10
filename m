Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D62D2A2D
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 14:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214016EB23;
	Thu, 10 Oct 2019 12:59:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680050.outbound.protection.outlook.com [40.107.68.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C3E6EB23
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 12:59:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgmNZXvGRCKbQAu5dri1zZ9UUY9++dNe5f17Y9fPNMVpUpb4KppeYGKTUnZ32bGHq6uOEc63WTfoxOdjG8qbPx/AtvH+RR2Ekf5FtaMdZ7dudzYRBsn/hvJO4n5oRBX4NFRAbean62DN+ZCgzzQO2dYj5NRxAxUdZmYzbg4WeV9AZvTx8ZYRSR0GP+Etj9jGC57SA7o0qmNUPOUFNlIgPJmk0wTkknbyUPNegjDBQjreJ/NiAcBTWWzfCSW4NHNUUycVzazdJj043zOLVej6RQk6/sAWJGYiZEpRxU/6prKHRe7ebFPl3grEsHXfr5xBYmLn3KKGqIlCdp8oRXgrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoRHsprq+j16Pbx+kjlY/q5+vKrQKC6QtTTAf2KqiCI=;
 b=hwR6X7PQ3pcLrkS9/8grLgdHd2ubXhy3nxzUJmiwNSkcAZJHIS74fLBaSBn35IGT87kmtpPKoT6BcpspUn72tUPhC748kClmXgbJuAWPrfkJdryf17n7QYdrnQOiA96D2lCTh28GK5v0maQTsDpQrLx6W5H5+PfOPEIaSYIcX6Lws/dRB/k6C90mhhHzoN3hUJe/E2Ts1TNXVlRoZ3HwNuYn6vm6cWfpOc8MdBRW13iBqqadxA7HIJA5maHxmfMuadjBjnxx+KigCZUJ4qWcqbyEi9qHZWmiw4uQfnTwajg6tU/vQVSy7bz75vk8Zg27iDxdP1Zk+jYKYlEi1p1dnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN8PR12MB3602.namprd12.prod.outlook.com (20.178.212.86) by
 BN8PR12MB3250.namprd12.prod.outlook.com (20.179.64.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 10 Oct 2019 12:59:05 +0000
Received: from BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c]) by BN8PR12MB3602.namprd12.prod.outlook.com
 ([fe80::e9c9:6668:28ac:821c%7]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 12:59:05 +0000
From: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/amdgpu/discovery: reserve discovery data at the top
 of VRAM
Thread-Topic: [PATCH] drm/amdgpu/discovery: reserve discovery data at the top
 of VRAM
Thread-Index: AQHVf2j9PPq8LK37v0ODkpqUDKo3+adT1cEAgAAAPn0=
Date: Thu, 10 Oct 2019 12:59:05 +0000
Message-ID: <BN8PR12MB360282C2972F0C781AC23C4889940@BN8PR12MB3602.namprd12.prod.outlook.com>
References: <20191010124757.17427-1-xiaojie.yuan@amd.com>,
 <CADnq5_Mz7SDUs4MWKzhZp3toc0x0guRJjA+JyFb7CcChtBAixw@mail.gmail.com>
In-Reply-To: <CADnq5_Mz7SDUs4MWKzhZp3toc0x0guRJjA+JyFb7CcChtBAixw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7922c30-bced-46de-ae99-08d74d81a17b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN8PR12MB3250:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN8PR12MB3250AA1595D92D5F46D7934D89940@BN8PR12MB3250.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(189003)(199004)(476003)(229853002)(33656002)(91956017)(6246003)(8676002)(5660300002)(102836004)(6436002)(71200400001)(81166006)(81156014)(71190400001)(478600001)(4326008)(99286004)(76116006)(19627405001)(186003)(26005)(486006)(256004)(52536014)(66066001)(606006)(25786009)(86362001)(14454004)(7696005)(966005)(76176011)(11346002)(53546011)(8936002)(446003)(6506007)(2906002)(74316002)(105004)(55016002)(316002)(6116002)(3846002)(54906003)(7736002)(1411001)(236005)(66556008)(64756008)(54896002)(66476007)(66446008)(66946007)(6306002)(9686003)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB3250;
 H:BN8PR12MB3602.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vX5H0yPrZGZoe/RA2QTNtp1u3luEbzWXT22NrFswLjSl/kT5RWAvZ217eppawPGS9iz+NU65OaHpC/t4a8Rxe5eipCAwbYzqDW1kdX3Xz23pR/+OSYw27tio5wAuH8sFdN3TDPHO1PvF1qHiPiUdiuvfGBoeEgp20uxKlzn37NmO3q1hG5scm1Fs0tERFNW/AqZcspGsEn+dDfIzMDl+HmGRg5WDmYbMEbmCPrSdYkWulqCnLJrW/NPR9adzZs+9eRm0FeKjT1iis+jqzj32HSwf4k32GwZQVkOMi1J0EnlLfwIgHzSAmzETFWkae0v/aAywPeQ/R/lrg1OcyIy+3Ugm/ZJhRiZ5XfG2xzVlztUWbI/yyYSKFS89FtEE3V5ruHza7lXzHKhvQ/1NXngfkQhBxP0UiIOQygzZyX5Nypt3kW5JFWMc68cBU5soaZLt9sMuTjGJquKd9gYV4D4YZg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7922c30-bced-46de-ae99-08d74d81a17b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 12:59:05.0132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j0jwGAny9s+IA9TnTC0MP8rbujMo6KANx3jBlbIqMXYq6xYJAxCBW+AKWNSuxNMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3250
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoRHsprq+j16Pbx+kjlY/q5+vKrQKC6QtTTAf2KqiCI=;
 b=FqaBSE3JWNCObCL3L9weqAmbOtDTxAEQbrrbmmjV3y1/+XOjP9oNI0vya9MXn30Z1BK1aKicMKvHH+Z02cyo7KNhtgvfeneIYpQQAzmw5aGCqd5gmvzIL1Y7bsBHpGIe4dsva0N/Rtndayq9CiIMK8t2vsarrQQUJeI1Iyp2kQM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xiaojie.Yuan@amd.com; 
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============0111906881=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0111906881==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB360282C2972F0C781AC23C4889940BN8PR12MB3602namp_"

--_000_BN8PR12MB360282C2972F0C781AC23C4889940BN8PR12MB3602namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Alex. I'll try to use the new api and send v2 patch.

BR,
Xiaojie
________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Thursday, October 10, 2019 8:57 PM
To: Yuan, Xiaojie <Xiaojie.Yuan@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Xiao, Ja=
ck <Jack.Xiao@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu/discovery: reserve discovery data at the to=
p of VRAM

On Thu, Oct 10, 2019 at 8:48 AM Yuan, Xiaojie <Xiaojie.Yuan@amd.com> wrote:
>
> IP Discovery data is TMR fenced by the latest PSP BL,
> so we need to reserve this region.
>
> Signed-off-by: Xiaojie Yuan <xiaojie.yuan@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index be0b2c69c223..6775647f0ba5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -812,6 +812,7 @@ struct amdgpu_device {
>         uint8_t                         *bios;
>         uint32_t                        bios_size;
>         struct amdgpu_bo                *stolen_vga_memory;
> +       struct amdgpu_bo                *discovery_memory;
>         uint32_t                        bios_scratch_reg_offset;
>         uint32_t                        bios_scratch[AMDGPU_BIOS_NUM_SCRA=
TCH];
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index edffc883549a..c3d7eb685a23 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1955,6 +1955,18 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>                                     NULL, &stolen_vga_buf);
>         if (r)
>                 return r;
> +
> +       /*
> +        * reserve one TMR (64K) memory at the top of VRAM which holds
> +        * IP Discovery data and is protected by PSP.
> +        */
> +       r =3D amdgpu_bo_create_kernel(adev, 64 << 10, PAGE_SIZE,
> +                                   AMDGPU_GEM_DOMAIN_VRAM,
> +                                   &adev->discovery_memory,
> +                                   NULL, NULL);
> +       if (r)
> +               return r;
> +

I think we should use amdgpu_bo_create_kernel_at() for both this and
stolen_vga_memory so that we make sure we end up reserving the right
location since both of these buffers are created by firmware at fixed
locations.

Alex

>         DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
>                  (unsigned) (adev->gmc.real_vram_size / (1024 * 1024)));
>
> @@ -2024,6 +2036,9 @@ void amdgpu_ttm_late_init(struct amdgpu_device *ade=
v)
>         void *stolen_vga_buf;
>         /* return the VGA stolen memory (if any) back to VRAM */
>         amdgpu_bo_free_kernel(&adev->stolen_vga_memory, NULL, &stolen_vga=
_buf);
> +
> +       /* return the IP Discovery TMR memory back to VRAM */
> +       amdgpu_bo_free_kernel(&adev->discovery_memory, NULL, NULL);
>  }
>
>  /**
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN8PR12MB360282C2972F0C781AC23C4889940BN8PR12MB3602namp_
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
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Thanks Alex. I'll try to use the new api and send v2 patch.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
BR,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Xiaojie<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Thursday, October 10, 2019 8:57 PM<br>
<b>To:</b> Yuan, Xiaojie &lt;Xiaojie.Yuan@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang=
@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/discovery: reserve discovery data at=
 the top of VRAM</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, Oct 10, 2019 at 8:48 AM Yuan, Xiaojie &lt;=
Xiaojie.Yuan@amd.com&gt; wrote:<br>
&gt;<br>
&gt; IP Discovery data is TMR fenced by the latest PSP BL,<br>
&gt; so we need to reserve this region.<br>
&gt;<br>
&gt; Signed-off-by: Xiaojie Yuan &lt;xiaojie.yuan@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp; |&nb=
sp; 1 &#43;<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 15 &#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 2 files changed, 16 insertions(&#43;)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu.h<br>
&gt; index be0b2c69c223..6775647f0ba5 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; @@ -812,6 &#43;812,7 @@ struct amdgpu_device {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *bios;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bios_size;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; *stolen_vga_memory;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; *discovery_memory;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bios_scratch_reg_offset;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bios_scratch[AMDGPU_BIOS_=
NUM_SCRATCH];<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c<br>
&gt; index edffc883549a..c3d7eb685a23 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; @@ -1955,6 &#43;1955,18 @@ int amdgpu_ttm_init(struct amdgpu_device *a=
dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL=
, &amp;stolen_vga_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * reserve one TMR (64K=
) memory at the top of VRAM which holds<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * IP Discovery data an=
d is protected by PSP.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_create_kerne=
l(adev, 64 &lt;&lt; 10, PAGE_SIZE,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_GEM=
_DOMAIN_VRAM,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;adev-=
&gt;discovery_memory,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL=
);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &#43;<br>
<br>
I think we should use amdgpu_bo_create_kernel_at() for both this and<br>
stolen_vga_memory so that we make sure we end up reserving the right<br>
location since both of these buffers are created by firmware at fixed<br>
locations.<br>
<br>
Alex<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_INFO(&quot;amdgpu:=
 %uM of VRAM memory ready\n&quot;,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (unsigned) (adev-&gt;gmc.real_vram_size / (=
1024 * 1024)));<br>
&gt;<br>
&gt; @@ -2024,6 &#43;2036,9 @@ void amdgpu_ttm_late_init(struct amdgpu_devi=
ce *adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *stolen_vga_buf;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* return the VGA stol=
en memory (if any) back to VRAM */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(=
&amp;adev-&gt;stolen_vga_memory, NULL, &amp;stolen_vga_buf);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* return the IP Discovery T=
MR memory back to VRAM */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;a=
dev-&gt;discovery_memory, NULL, NULL);<br>
&gt;&nbsp; }<br>
&gt;<br>
&gt;&nbsp; /**<br>
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

--_000_BN8PR12MB360282C2972F0C781AC23C4889940BN8PR12MB3602namp_--

--===============0111906881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0111906881==--

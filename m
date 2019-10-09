Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CCCD0DF9
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 13:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9323C89C88;
	Wed,  9 Oct 2019 11:50:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810055.outbound.protection.outlook.com [40.107.81.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C638A89C88
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 11:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZ/jyUKrzAbRVFUS/umIxt8S++kJZbIdWJ3Oz0uRwHpmlyS3uqIjy1Wdu1FGf75GbX9pwCdhJwcfwrotAF5uxWwEgrCIEYW1uixWIPIV5+x8UVlI6ez8STb5La+HtxBceTiyTkxAg4DdCNFJmrA5Bw18UzO0VmCUTmXFhzX38PtekaG5aN+rzkRthICFXvGKgUgZlOwIi1jyWJpnFbLZJ3gJbn+uKah4I3xWMa3jVSI8IZb+vWFEVdVbTFNr9R+84wlRS/5CYSyGfBiG3kmpE3b+H8OZwdlMiQlcfVgIT0LNIY9Q+5hToM+/lGzk1W5eeojPEspQz/VV6+fT8Pdw7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3xguB9C+Yr/jZvT6JAN5RpDcDj7RExjXBnqHwgx69I=;
 b=Hns1RIdXB80DNbZtM7lkIG/uLPnNqOQ9TE3VvkJOllEtEBYG67bX9A/kh7ZKuOmGDkJE0CkXltky9E5xGrkEH3jasZ2CigwRo3pSVc7dZn5VWTXrYU1PocXVo2s02ds4hKcgg9MqfqG/Cz1sm0qx847gJ5A+oT6yoC3ll50Ih6I3XuqD4PBgvRsUIz8bl3aAVs51m4O50Lg45IPA610CX8HQcmVUTfVY2V5sYTesz7WiiB4XbkqHUfnYFAYluoHGJMv8WxIODS4KVY5MUw5r8enHvMeP7aYQ1RYwBx9dEU6RU+vgjAnwcLsIpKUo915RfpOql7oVaOp1DC5Cnm8BDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN1PR12MB2544.namprd12.prod.outlook.com (52.132.197.144) by
 SN1PR12MB2478.namprd12.prod.outlook.com (52.132.196.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Wed, 9 Oct 2019 11:50:41 +0000
Received: from SN1PR12MB2544.namprd12.prod.outlook.com
 ([fe80::d06a:add5:ae4b:5121]) by SN1PR12MB2544.namprd12.prod.outlook.com
 ([fe80::d06a:add5:ae4b:5121%7]) with mapi id 15.20.2327.025; Wed, 9 Oct 2019
 11:50:41 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Topic: [PATCH 7/8] drm/amdgpu: reserve vram for memory training
Thread-Index: AQHVfg7B59IgT+eWn0KeLGbqrFJlEqdRq6YAgAB7k9iAAAlhgIAAAiEr
Date: Wed, 9 Oct 2019 11:50:41 +0000
Message-ID: <SN1PR12MB25441A10207659068DC1745095950@SN1PR12MB2544.namprd12.prod.outlook.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
 <20191008192934.5481-8-alexander.deucher@amd.com>
 <a9d04519-0ec0-41f6-289f-be156caccf76@amd.com>
 <SN1PR12MB2544F1BE7D37DEC4721AF95D95950@SN1PR12MB2544.namprd12.prod.outlook.com>,
 <045b7cfd-989f-7cff-310f-92d9780e73fe@gmail.com>
In-Reply-To: <045b7cfd-989f-7cff-310f-92d9780e73fe@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b471766-94a1-4233-b978-08d74caee8f6
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: SN1PR12MB2478:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2478019A91FA6C729A32948795950@SN1PR12MB2478.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:291;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(6116002)(33656002)(3846002)(53546011)(81166006)(256004)(8936002)(6506007)(8676002)(76176011)(7696005)(476003)(19627405001)(446003)(14444005)(486006)(966005)(316002)(478600001)(81156014)(26005)(74316002)(6636002)(102836004)(14454004)(2906002)(229853002)(6246003)(4326008)(9686003)(54896002)(71200400001)(6306002)(71190400001)(86362001)(25786009)(52536014)(99286004)(2501003)(55016002)(66556008)(66446008)(64756008)(7736002)(66476007)(110136005)(66066001)(236005)(91956017)(66574012)(6436002)(66946007)(76116006)(186003)(105004)(606006)(11346002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2478;
 H:SN1PR12MB2544.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B7T7rRn3BMowtWWcrX+yaMA7GHmvTmkE41sF0GaCyM3x4ik5441A0bqOpQs/yDSZc77V45+vkyHxIeSEUks44U1t+OiWNUA+nqkSzw456FGzTeczeDz+MZ3XoOYJvdyt1M67SLbV9ZmKo/b7j3P8WgziAiM/Fg9/z2P+ds5fqRFoawl8XJu+0nS8F5LrFqOQmRG//C6kEJdpKazx5Tly+NPx9JdR/0WgKqxYQ8B7g5vLugJ9Ydv650dHqZi0ZRoS+78N3md+SsO2CxAhq2J9vsvF13rLRuSCC1rG3O4fyXY8P5eRNy07Gpnsbk6k+q28kR0Digd52/wp8I4HHtD5YDb7c/BN/aDlvJ8OgMFSlAGJejbKM3H52wV5cX0ZfOzVvjY8lqWZu7smiuL+a7vEuxi0eG/9ZVkXFbFpev62JLJg2FLtu1wzrVAQgqVuAen0QRiiRZxy4rPx3TYTU0e6BA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b471766-94a1-4233-b978-08d74caee8f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 11:50:41.1858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jBjbyYbF2WIGQYyY8P/apJJgVrYfjeQ/30dhFj9tvkob2z/JW3k9yNHkcrMY7vj/GO49V+73RKOmKh7Gc6FJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2478
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3xguB9C+Yr/jZvT6JAN5RpDcDj7RExjXBnqHwgx69I=;
 b=Q4A4TCQEomwUv8TlCJds63BH7F+/UrXcV3h0JfhLppRHdDkipgDnlth0KwF6pU7e1XKQJwUij4dpzwewrZRwetWyZXuGGxNKEsNj+mF7J0qJGyIcFhyE4F4KUsXTv4VcUPpDEy75vqk6htByJAq+tGnJY1BUPjGN45Mcedum4u8=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: multipart/mixed; boundary="===============2137536261=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============2137536261==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN1PR12MB25441A10207659068DC1745095950SN1PR12MB2544namp_"

--_000_SN1PR12MB25441A10207659068DC1745095950SN1PR12MB2544namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Oh, I see, I thought we should eliminate warning, but it's a wrong idea, ac=
tually we need it.

Thanks!

Rico
________________________________
From: Christian K?nig <ckoenig.leichtzumerken@gmail.com>
Sent: Wednesday, October 9, 2019 19:40
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; Tuikov, Luben <Luben.Tuikov@am=
d.com>; Alex Deucher <alexdeucher@gmail.com>; amd-gfx@lists.freedesktop.org=
 <amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training

Am 09.10.19 um 13:12 schrieb Yin, Tianci (Rico):
Here is where you definitively set "ret" so DO NOT preinitialize it to 0,
just to avoid "pesky compiler unininitialized variable warnings"--those
are helpful to make the code more secure: a variable should be intentionall=
y
initialized in all paths.

Rico: Still in confusion, pre-initialization can avoid "uninitialized varia=
ble", why should we can't pre-initialize?

Because it avoids the uninitialized variable warning :)

See we really want the warning because it means that we have a bug in the c=
ode somewhere.

Regards,
Christian.

________________________________
From: Tuikov, Luben <Luben.Tuikov@amd.com><mailto:Luben.Tuikov@amd.com>
Sent: Wednesday, October 9, 2019 11:44
To: Alex Deucher <alexdeucher@gmail.com><mailto:alexdeucher@gmail.com>; amd=
-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@l=
ists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com><mailto:Alexander.Deucher=
@amd.com>; Yin, Tianci (Rico) <Tianci.Yin@amd.com><mailto:Tianci.Yin@amd.co=
m>
Subject: Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory training

On 2019-10-08 3:29 p.m., Alex Deucher wrote:
> From: "Tianci.Yin" <tianci.yin@amd.com><mailto:tianci.yin@amd.com>
>
> memory training using specific fixed vram segment, reserve these
> segments before anyone may allocate it.
>
> Change-Id: I1436755813a565608a2857a683f535377620a637
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com><mailto:alexander.de=
ucher@amd.com>
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com><mailto:tianci.yin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 96 +++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 74a9bd94f10c..0819721af16e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1667,6 +1667,93 @@ static int amdgpu_ttm_fw_reserve_vram_init(struct =
amdgpu_device *adev)
>                                          &adev->fw_vram_usage.va);
>  }
>
> +/*
> + * Memoy training reservation functions
> + */

Include an empty line between the two comments, just as you would
a paragraph in written text.

> +/**
> + * amdgpu_ttm_training_reserve_vram_fini - free memory training reserved=
 vram
> + *
> + * @adev: amdgpu_device pointer
> + *
> + * free memory training reserved vram if it has been reserved.
> + */
> +static int amdgpu_ttm_training_reserve_vram_fini(struct amdgpu_device *a=
dev)
> +{
> +     int ret =3D 0;
> +     struct psp_memory_training_context *ctx =3D &adev->psp.mem_train_ct=
x;
> +
> +     ctx->init =3D PSP_MEM_TRAIN_NOT_SUPPORT;
> +     if(ctx->c2p_bo) {

Space after keywords, according to LKCS:
if (...)

> +             amdgpu_bo_free_kernel(&ctx->c2p_bo, NULL, NULL);
> +             ctx->c2p_bo =3D NULL;
> +     }
> +     if(ctx->p2c_bo) {

Space after keywords, according to LKCS:
if (...)

> +             amdgpu_bo_free_kernel(&ctx->p2c_bo, NULL, NULL);
> +             ctx->p2c_bo =3D NULL;
> +     }
> +
> +     return ret;
> +}

Get rid of "ret" variable altogether as it is not used in this function.

> +
> +/**
> + * amdgpu_ttm_training_reserve_vram_init - create bo vram reservation fr=
om memory training
> + *
> + * @adev: amdgpu_device pointer
> + *
> + * create bo vram reservation from memory training.
> + */
> +static int amdgpu_ttm_training_reserve_vram_init(struct amdgpu_device *a=
dev)
> +{
> +     int ret =3D 0;

DO NOT preinitialize ret.

> +     struct psp_memory_training_context *ctx =3D &adev->psp.mem_train_ct=
x;
> +
> +     memset(ctx, 0, sizeof(*ctx));
> +     if(!adev->fw_vram_usage.mem_train_support) {

Space after keywords: "if (".

> +             DRM_DEBUG("memory training does not support!\n");
> +             return 0;
> +     }
> +
> +     ctx->c2p_train_data_offset =3D adev->fw_vram_usage.mem_train_fb_loc=
;
> +     ctx->p2c_train_data_offset =3D (adev->gmc.mc_vram_size - GDDR6_MEM_=
TRAINING_OFFSET);
> +     ctx->train_data_size =3D GDDR6_MEM_TRAINING_DATA_SIZE_IN_BYTES;
> +
> +     DRM_DEBUG("train_data_size:%llx,p2c_train_data_offset:%llx,c2p_trai=
n_data_offset:%llx.\n",
> +               ctx->train_data_size,
> +               ctx->p2c_train_data_offset,
> +               ctx->c2p_train_data_offset);
> +
> +     ret =3D amdgpu_bo_create_kernel_at(adev,

Here is where you definitively set "ret" so DO NOT preinitialize it to 0,
just to avoid "pesky compiler unininitialized variable warnings"--those
are helpful to make the code more secure: a variable should be intentionall=
y
initialized in all paths.

> +                                      ctx->p2c_train_data_offset,
> +                                      ctx->train_data_size,
> +                                      AMDGPU_GEM_DOMAIN_VRAM,
> +                                      &ctx->p2c_bo,
> +                                      NULL);
> +     if(ret) {

Space after keywords "if (".

> +             DRM_ERROR("alloc p2c_bo failed(%d)!\n", ret);
> +             ret =3D -ENOMEM;
> +             goto err_out;
> +     }
> +
> +     ret =3D amdgpu_bo_create_kernel_at(adev,
> +                                      ctx->c2p_train_data_offset,
> +                                      ctx->train_data_size,
> +                                      AMDGPU_GEM_DOMAIN_VRAM,
> +                                      &ctx->c2p_bo,
> +                                      NULL);
> +     if(ret) {

Space after keywords: "if (", according to LKCS.

Regards,
Luben

> +             DRM_ERROR("alloc c2p_bo failed(%d)!\n", ret);
> +             ret =3D -ENOMEM;
> +             goto err_out;
> +     }
> +
> +     ctx->init =3D PSP_MEM_TRAIN_RESERVE_SUCCESS;
> +     return 0;
> +
> +err_out:
> +     amdgpu_ttm_training_reserve_vram_fini(adev);
> +     return ret;
> +}
> +
>  /**
>   * amdgpu_ttm_init - Init the memory management (ttm) as well as various
>   * gtt/vram related fields.
> @@ -1740,6 +1827,14 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>                return r;
>        }
>
> +     /*
> +      *The reserved vram for memory training must be pinned to the speci=
fied
> +      *place on the VRAM, so reserve it early.
> +      */
> +     r =3D amdgpu_ttm_training_reserve_vram_init(adev);
> +     if (r)
> +             return r;
> +
>        /* allocate memory as required for VGA
>         * This is used for VGA emulation and pre-OS scanout buffers to
>         * avoid display artifacts while transitioning between pre-OS
> @@ -1825,6 +1920,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>                return;
>
>        amdgpu_ttm_debugfs_fini(adev);
> +     amdgpu_ttm_training_reserve_vram_fini(adev);
>        amdgpu_ttm_fw_reserve_vram_fini(adev);
>        if (adev->mman.aper_base_kaddr)
>                iounmap(adev->mman.aper_base_kaddr);
>




_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--_000_SN1PR12MB25441A10207659068DC1745095950SN1PR12MB2544namp_
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
Oh, I see, I thought we should eliminate warning, but it's a wrong idea, ac=
tually we need it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Rico<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K&ouml;nig =
&lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, October 9, 2019 19:40<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; Tuikov, Luben &lt=
;Luben.Tuikov@amd.com&gt;; Alex Deucher &lt;alexdeucher@gmail.com&gt;; amd-=
gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory trainin=
g</font>
<div>&nbsp;</div>
</div>
<div style=3D"background-color:#FFFFFF">
<div class=3D"x_moz-cite-prefix">Am 09.10.19 um 13:12 schrieb Yin, Tianci (=
Rico):<br>
</div>
<blockquote type=3D"cite"><style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<font size=3D"2"><span style=3D"font-size:11pt">Here is where you definitiv=
ely set &quot;ret&quot; so DO NOT preinitialize it to 0,<br>
</span></font></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<font size=3D"2"><span style=3D"font-size:11pt">just to avoid &quot;pesky c=
ompiler unininitialized variable warnings&quot;--those<br>
are helpful to make the code more secure: a variable should be intentionall=
y<br>
initialized in all paths.</span></font></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"color:rgb(12,100,192)">Rico: Still in confusion, pre-initial=
ization can avoid &quot;uninitialized variable&quot;, why should we can't p=
re-initialize?
</span><br>
</div>
</blockquote>
<br>
Because it avoids the uninitialized variable warning :)<br>
<br>
See we really want the warning because it means that we have a bug in the c=
ode somewhere.<br>
<br>
Regards,<br>
Christian.<br>
<br>
<blockquote type=3D"cite">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Tuikov, Luben
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:Luben.Tuikov@amd.com">&=
lt;Luben.Tuikov@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, October 9, 2019 11:44<br>
<b>To:</b> Alex Deucher <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto=
:alexdeucher@gmail.com">
&lt;alexdeucher@gmail.com&gt;</a>; <a class=3D"x_moz-txt-link-abbreviated" =
href=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a> <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:amd-gfx@lists.freedesktop.org">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Cc:</b> Deucher, Alexander <a class=3D"x_moz-txt-link-rfc2396E" href=3D"=
mailto:Alexander.Deucher@amd.com">
&lt;Alexander.Deucher@amd.com&gt;</a>; Yin, Tianci (Rico) <a class=3D"x_moz=
-txt-link-rfc2396E" href=3D"mailto:Tianci.Yin@amd.com">
&lt;Tianci.Yin@amd.com&gt;</a><br>
<b>Subject:</b> Re: [PATCH 7/8] drm/amdgpu: reserve vram for memory trainin=
g</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On 2019-10-08 3:29 p.m., Alex Deucher wrote:<br>
&gt; From: &quot;Tianci.Yin&quot; <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:tianci.yin@amd.com">
&lt;tianci.yin@amd.com&gt;</a><br>
&gt; <br>
&gt; memory training using specific fixed vram segment, reserve these<br>
&gt; segments before anyone may allocate it.<br>
&gt; <br>
&gt; Change-Id: I1436755813a565608a2857a683f535377620a637<br>
&gt; Reviewed-by: Alex Deucher <a class=3D"x_moz-txt-link-rfc2396E" href=3D=
"mailto:alexander.deucher@amd.com">
&lt;alexander.deucher@amd.com&gt;</a><br>
&gt; Signed-off-by: Tianci.Yin <a class=3D"x_moz-txt-link-rfc2396E" href=3D=
"mailto:tianci.yin@amd.com">
&lt;tianci.yin@amd.com&gt;</a><br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 96 &#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; 1 file changed, 96 insertions(&#43;)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c<br>
&gt; index 74a9bd94f10c..0819721af16e 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; @@ -1667,6 &#43;1667,93 @@ static int amdgpu_ttm_fw_reserve_vram_init(=
struct amdgpu_device *adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &amp;adev-&gt;fw_vram_usage.va);<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; &#43;/*<br>
&gt; &#43; * Memoy training reservation functions<br>
&gt; &#43; */<br>
<br>
Include an empty line between the two comments, just as you would<br>
a paragraph in written text.<br>
<br>
&gt; &#43;/**<br>
&gt; &#43; * amdgpu_ttm_training_reserve_vram_fini - free memory training r=
eserved vram<br>
&gt; &#43; *<br>
&gt; &#43; * @adev: amdgpu_device pointer<br>
&gt; &#43; *<br>
&gt; &#43; * free memory training reserved vram if it has been reserved.<br=
>
&gt; &#43; */<br>
&gt; &#43;static int amdgpu_ttm_training_reserve_vram_fini(struct amdgpu_de=
vice *adev)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct psp_memory_training_context *ctx =
=3D &amp;adev-&gt;psp.mem_train_ctx;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;init =3D PSP_MEM_TRAIN_NOT_SUPPO=
RT;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if(ctx-&gt;c2p_bo) {<br>
<br>
Space after keywords, according to LKCS:<br>
if (...)<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; amdgpu_bo_free_kernel(&amp;ctx-&gt;c2p_bo, NULL, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ctx-&gt;c2p_bo =3D NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if(ctx-&gt;p2c_bo) {<br>
<br>
Space after keywords, according to LKCS:<br>
if (...)<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; amdgpu_bo_free_kernel(&amp;ctx-&gt;p2c_bo, NULL, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ctx-&gt;p2c_bo =3D NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
<br>
Get rid of &quot;ret&quot; variable altogether as it is not used in this fu=
nction.<br>
<br>
&gt; &#43;<br>
&gt; &#43;/**<br>
&gt; &#43; * amdgpu_ttm_training_reserve_vram_init - create bo vram reserva=
tion from memory training<br>
&gt; &#43; *<br>
&gt; &#43; * @adev: amdgpu_device pointer<br>
&gt; &#43; *<br>
&gt; &#43; * create bo vram reservation from memory training.<br>
&gt; &#43; */<br>
&gt; &#43;static int amdgpu_ttm_training_reserve_vram_init(struct amdgpu_de=
vice *adev)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int ret =3D 0;<br>
<br>
DO NOT preinitialize ret.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct psp_memory_training_context *ctx =
=3D &amp;adev-&gt;psp.mem_train_ctx;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; memset(ctx, 0, sizeof(*ctx));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if(!adev-&gt;fw_vram_usage.mem_train_sup=
port) {<br>
<br>
Space after keywords: &quot;if (&quot;.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DRM_DEBUG(&quot;memory training does not support!\n&quot;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;c2p_train_data_offset =3D adev-&=
gt;fw_vram_usage.mem_train_fb_loc;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;p2c_train_data_offset =3D (adev-=
&gt;gmc.mc_vram_size - GDDR6_MEM_TRAINING_OFFSET);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;train_data_size =3D GDDR6_MEM_TR=
AINING_DATA_SIZE_IN_BYTES;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG(&quot;train_data_size:%llx,p2c=
_train_data_offset:%llx,c2p_train_data_offset:%llx.\n&quot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ctx-&gt;train_data_size,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ctx-&gt;p2c_train_data_offset,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ctx-&gt;c2p_train_data_offset);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_bo_create_kernel_at(adev,=
<br>
<br>
Here is where you definitively set &quot;ret&quot; so DO NOT preinitialize =
it to 0,<br>
just to avoid &quot;pesky compiler unininitialized variable warnings&quot;-=
-those<br>
are helpful to make the code more secure: a variable should be intentionall=
y<br>
initialized in all paths.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ctx-&gt;p2c_train_data_offset,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ctx-&gt;train_data_size,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; AMDGPU_GEM_DOMAIN_VRAM,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &amp;ctx-&gt;p2c_bo,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if(ret) {<br>
<br>
Space after keywords &quot;if (&quot;.<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DRM_ERROR(&quot;alloc p2c_bo failed(%d)!\n&quot;, ret);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -ENOMEM;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto err_out;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_bo_create_kernel_at(adev,=
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ctx-&gt;c2p_train_data_offset,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ctx-&gt;train_data_size,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; AMDGPU_GEM_DOMAIN_VRAM,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &amp;ctx-&gt;c2p_bo,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if(ret) {<br>
<br>
Space after keywords: &quot;if (&quot;, according to LKCS.<br>
<br>
Regards,<br>
Luben<br>
<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DRM_ERROR(&quot;alloc c2p_bo failed(%d)!\n&quot;, ret);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D -ENOMEM;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; goto err_out;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;init =3D PSP_MEM_TRAIN_RESERVE_S=
UCCESS;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;<br>
&gt; &#43;err_out:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_training_reserve_vram_fini(ad=
ev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * amdgpu_ttm_init - Init the memory management (ttm) as we=
ll as various<br>
&gt;&nbsp;&nbsp; * gtt/vram related fields.<br>
&gt; @@ -1740,6 &#43;1827,14 @@ int amdgpu_ttm_init(struct amdgpu_device *a=
dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *The reserved vram for memory trai=
ning must be pinned to the specified<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *place on the VRAM, so reserve it =
early.<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ttm_training_reserve_vram_i=
nit(adev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return r;<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* allocate memory as requir=
ed for VGA<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * This is used for VGA=
 emulation and pre-OS scanout buffers to<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * avoid display artifa=
cts while transitioning between pre-OS<br>
&gt; @@ -1825,6 &#43;1920,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *a=
dev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_debugfs_fini(adev=
);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_training_reserve_vram_fini(ad=
ev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ttm_fw_reserve_vram_f=
ini(adev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;mman.aper_base_=
kaddr)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; iounmap(adev-&gt;mman.aper_base_kaddr);<br>
&gt; <br>
<br>
</div>
</span></font></div>
<br>
<fieldset class=3D"x_mimeAttachmentHeader"></fieldset>
<pre class=3D"x_moz-quote-pre">____________________________________________=
___
amd-gfx mailing list
<a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freede=
sktop.org">amd-gfx@lists.freedesktop.org</a>
<a class=3D"x_moz-txt-link-freetext" href=3D"https://lists.freedesktop.org/=
mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/am=
d-gfx</a></pre>
</blockquote>
<br>
</div>
</body>
</html>

--_000_SN1PR12MB25441A10207659068DC1745095950SN1PR12MB2544namp_--

--===============2137536261==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============2137536261==--

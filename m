Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E102ED0D9E
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Oct 2019 13:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC69C6E97E;
	Wed,  9 Oct 2019 11:30:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790055.outbound.protection.outlook.com [40.107.79.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6627A6E97C
 for <amd-gfx@lists.freedesktop.org>; Wed,  9 Oct 2019 11:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYwVAA3HKssO02Hun+hN+dONFDDLRhVYix4hcwXrydVx1Q5MVIlojlkII/LBbDGfn2SAl4wQksarcTQDJEBWDE84mLDbcjw1DjClElcWEkMw52K46d/HXV3gr/7/smoVHzwirgxaqXpiYAEpP5ZXXBTnbBzs11ziowBo4v3msvknJo8xIgB679FxUVW1DiUiDeQ4pebnAFIR7KZmFCt/pOAo3sI3xizHTI5IjyhxyXtQ/Q98mQRzvALa7SmrIEFcIefZ912XN0ceX6okVCN6mE+mqDEE4dgTm/P8b1ObPoZnb8AmcrEicJ1Qw49mew0246nyR5yH2eq54l12XQeppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRj8LPXgkIImJqCvRFUMvKUbdQfP1tC8MtcyvqE06ng=;
 b=Q+XsCkCXedDizmjGJTptpe8+yFFlRI3M4LZdPt7BbW9xnGG+kVLUo62UTT6KgiPWj7d4vnYaRT/g5Mrqw+EU0wl1FI2dRzFn+ov7uNWV6c31P8wC3VJW8vO8POp8jA4o9tf/epZICQlUZdYBiJPVnNjTPlijJ3ARpfPQGHDbwlxeyZN+GJ6dJqnh/10maaw6OoT3rYugvzyFu7j2rEmcL2MQ9dFuj7kBG3xcsicys95U0W8SIPAlz2/+hfEzcGirLYUGk/cIRofa2qbxm80RxBDOpaU/k1hy4oHkKEgAAKc364ox15a1MChuuHCGbPRYdQz78KWLarqNzkaH7Yrhng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from SN1PR12MB2544.namprd12.prod.outlook.com (52.132.197.144) by
 SN1PR12MB2461.namprd12.prod.outlook.com (52.132.195.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Wed, 9 Oct 2019 11:30:09 +0000
Received: from SN1PR12MB2544.namprd12.prod.outlook.com
 ([fe80::d06a:add5:ae4b:5121]) by SN1PR12MB2544.namprd12.prod.outlook.com
 ([fe80::d06a:add5:ae4b:5121%7]) with mapi id 15.20.2327.025; Wed, 9 Oct 2019
 11:30:09 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH 2/8] drm/amdgpu: add a generic fb accessing helper function
Thread-Topic: [PATCH 2/8] drm/amdgpu: add a generic fb accessing helper
 function
Thread-Index: AQHVfg6+dFCqjk5vcEakA9zxSE7YJ6dR+iOAgAAzajQ=
Date: Wed, 9 Oct 2019 11:30:09 +0000
Message-ID: <SN1PR12MB2544ECC6BB4C073BCA587E1195950@SN1PR12MB2544.namprd12.prod.outlook.com>
References: <20191008192934.5481-1-alexander.deucher@amd.com>
 <20191008192934.5481-3-alexander.deucher@amd.com>,
 <0edeab78-992c-89b2-f2c2-41db101bc5b7@gmail.com>
In-Reply-To: <0edeab78-992c-89b2-f2c2-41db101bc5b7@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2f6bead-5f73-4a17-1ee7-08d74cac0a9b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: SN1PR12MB2461:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB24619F8C31EC4481A09B0F7B95950@SN1PR12MB2461.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(189003)(199004)(6436002)(4326008)(99286004)(6636002)(66556008)(66476007)(66446008)(64756008)(74316002)(91956017)(76116006)(66946007)(66066001)(2501003)(52536014)(2906002)(8936002)(229853002)(316002)(110136005)(3846002)(6116002)(66574012)(86362001)(7736002)(81156014)(81166006)(5660300002)(486006)(446003)(33656002)(54896002)(105004)(9686003)(8676002)(102836004)(71190400001)(6506007)(71200400001)(53546011)(26005)(186003)(14444005)(6246003)(7696005)(76176011)(14454004)(25786009)(11346002)(478600001)(256004)(19627405001)(476003)(55016002)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2461;
 H:SN1PR12MB2544.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FR6XxSYFAJa1sLyKekgcbNagkgJmNbEannlLUYEb4UAaD03akcYiB222WMLl8j3xrhUDv/vY6WEnYlde8dBpTW+IneVI3e4tejt6a7tKAtWUqaqZFKW067Wnauom6nTeMjMrKqr/stB0jM+9V8yzcdLhW7hR5qU/Opctbzjm4EBOJs4oNZNF+quEu4MkicgrXOrnRjDw12Nb1Uv1cVLmn0JGqTQ95y9VdE1n7rcEty7V5v5uodhW7EUzVytFRI4yEI2YmG4pxtFbJo+QUj2gzN8p3xOaW5tIns3WhCxpulQP4Yu/kLhvtnEX3sb6LcTxUBHyuQMqdglBXh5QgwThLfAP8QNNiL1j9CSFpde3qHi2zegWzqk0k7jLseyq9p3tos2WdOSx8hpt9kCsHcz3cJP+f4L/VxCJomjEgt3lv18=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2f6bead-5f73-4a17-1ee7-08d74cac0a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 11:30:09.1149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9jDcqBb7PdnJM4U/nqlzQ9wE7/ZQ0t1Mjw0mhpiS1VCs3fOLV/jr5C7iw2Y2lo5Et78g0+HGmuuYNvosv/ZyTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2461
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRj8LPXgkIImJqCvRFUMvKUbdQfP1tC8MtcyvqE06ng=;
 b=Xj8chDXhI42JZU6zGR3tFk93SOKeQntenRWHBeiGOhunUMgPkOg4vnqhwNuVED3Vz3Rr4ti7QLzSKIViwHWx6SknECnD9cxKHA7/QbbJg5xM9SrVtisIEA4yTMwWKr/Qh/ggZ1MCu47LY+UOAqpZwx7IS4rdk4udcisX+kh2mtg=
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
Content-Type: multipart/mixed; boundary="===============0005012269=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0005012269==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN1PR12MB2544ECC6BB4C073BCA587E1195950SN1PR12MB2544namp_"

--_000_SN1PR12MB2544ECC6BB4C073BCA587E1195950SN1PR12MB2544namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ok,

Thanks for your reviewing!

Rico
________________________________
From: Christian K?nig <ckoenig.leichtzumerken@gmail.com>
Sent: Wednesday, October 9, 2019 16:25
To: Alex Deucher <alexdeucher@gmail.com>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Yin, Tianci (Rico) <Tia=
nci.Yin@amd.com>
Subject: Re: [PATCH 2/8] drm/amdgpu: add a generic fb accessing helper func=
tion

Am 08.10.19 um 21:29 schrieb Alex Deucher:
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> add a generic helper function for accessing framebuffer via MMIO
>
> Change-Id: I4baa0aa53c93a94c2eff98c6211a61f369239982
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 42 +++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 13 +-----
>   3 files changed, 45 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 17ccb9015141..0d60c2e6c592 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -985,6 +985,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>   void amdgpu_device_fini(struct amdgpu_device *adev);
>   int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);
>
> +int amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
> +                    uint32_t *buf, size_t size, bool write);
>   uint32_t amdgpu_mm_rreg(struct amdgpu_device *adev, uint32_t reg,
>                        uint32_t acc_flags);
>   void amdgpu_mm_wreg(struct amdgpu_device *adev, uint32_t reg, uint32_t =
v,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_device.c
> index f25275abf408..53ce227f759c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -153,6 +153,48 @@ bool amdgpu_device_is_px(struct drm_device *dev)
>        return false;
>   }
>
> +/**
> + * VRAM access helper functions.
> + *
> + * amdgpu_device_vram_access - read/write a buffer in vram
> + *
> + * @adev: amdgpu_device pointer
> + * @pos: offset of the buffer in vram
> + * @buf: virtual address of the buffer in system memory
> + * @size: read/write size, sizeof(@buf) must > @size
> + * @write: true - write to vram, otherwise - read from vram
> + *
> + * Returns 0 on success or an -error on failure.
> + */
> +int amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
> +                    uint32_t *buf, size_t size, bool write)

Indentation seems to be incorrect here.

> +{
> +     uint64_t end =3D pos + size;
> +     unsigned long flags;
> +
> +     if (IS_ERR_OR_NULL(buf) ||
> +         (adev->gmc.mc_vram_size > 0 &&
> +          end > adev->gmc.mc_vram_size)) {
> +             DRM_ERROR("parameter error! pos:%llx, buf:%llx, size:%zx.\n=
",
> +                       pos, (u64)buf, size);
> +             return -EINVAL;
> +     }

Please drop that, this is a purely internal functions and parameter
checking like this doesn't really make sense.

Regards,
Christian.

> +
> +     while (pos < end) {
> +             spin_lock_irqsave(&adev->mmio_idx_lock, flags);
> +             WREG32_NO_KIQ(mmMM_INDEX, ((uint32_t)pos) | 0x80000000);
> +             WREG32_NO_KIQ(mmMM_INDEX_HI, pos >> 31);
> +             if (write)
> +                     WREG32_NO_KIQ(mmMM_DATA, *buf++);
> +             else
> +                     *buf++ =3D RREG32_NO_KIQ(mmMM_DATA);
> +             spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
> +             pos +=3D 4;
> +     }
> +
> +     return 0;
> +}
> +
>   /*
>    * MMIO register access helper functions.
>    */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index db2dab3a6dff..324c2d605f54 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -134,21 +134,10 @@ static int hw_id_map[MAX_HWIP] =3D {
>
>   static int amdgpu_discovery_read_binary(struct amdgpu_device *adev, uin=
t8_t *binary)
>   {
> -     uint32_t *p =3D (uint32_t *)binary;
>        uint64_t vram_size =3D (uint64_t)RREG32(mmRCC_CONFIG_MEMSIZE) << 2=
0;
>        uint64_t pos =3D vram_size - BINARY_MAX_SIZE;
> -     unsigned long flags;
> -
> -     while (pos < vram_size) {
> -             spin_lock_irqsave(&adev->mmio_idx_lock, flags);
> -             WREG32_NO_KIQ(mmMM_INDEX, ((uint32_t)pos) | 0x80000000);
> -             WREG32_NO_KIQ(mmMM_INDEX_HI, pos >> 31);
> -             *p++ =3D RREG32_NO_KIQ(mmMM_DATA);
> -             spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
> -             pos +=3D 4;
> -     }
>
> -     return 0;
> +     return amdgpu_device_vram_access(adev, pos, (uint32_t *)binary, BIN=
ARY_MAX_SIZE, false);
>   }
>
>   static uint16_t amdgpu_discovery_calculate_checksum(uint8_t *data, uint=
32_t size)


--_000_SN1PR12MB2544ECC6BB4C073BCA587E1195950SN1PR12MB2544namp_
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
Ok, <br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for your reviewing!</div>
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
<b>Sent:</b> Wednesday, October 9, 2019 16:25<br>
<b>To:</b> Alex Deucher &lt;alexdeucher@gmail.com&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Yin, Tianc=
i (Rico) &lt;Tianci.Yin@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 2/8] drm/amdgpu: add a generic fb accessing help=
er function</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 08.10.19 um 21:29 schrieb Alex Deucher:<br>
&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt;<br>
&gt; add a generic helper function for accessing framebuffer via MMIO<br>
&gt;<br>
&gt; Change-Id: I4baa0aa53c93a94c2eff98c6211a61f369239982<br>
&gt; Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 &#43;<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_device.c&nbsp;&nbsp;&nbs=
p; | 42 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 13 &#43;--=
---<br>
&gt;&nbsp;&nbsp; 3 files changed, 45 insertions(&#43;), 12 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd=
/amdgpu/amdgpu.h<br>
&gt; index 17ccb9015141..0d60c2e6c592 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; @@ -985,6 &#43;985,8 @@ int amdgpu_device_init(struct amdgpu_device *a=
dev,<br>
&gt;&nbsp;&nbsp; void amdgpu_device_fini(struct amdgpu_device *adev);<br>
&gt;&nbsp;&nbsp; int amdgpu_gpu_wait_for_idle(struct amdgpu_device *adev);<=
br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;int amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t =
pos,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *buf, size_t siz=
e, bool write);<br>
&gt;&nbsp;&nbsp; uint32_t amdgpu_mm_rreg(struct amdgpu_device *adev, uint32=
_t reg,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_=
t acc_flags);<br>
&gt;&nbsp;&nbsp; void amdgpu_mm_wreg(struct amdgpu_device *adev, uint32_t r=
eg, uint32_t v,<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_device.c<br>
&gt; index f25275abf408..53ce227f759c 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt; @@ -153,6 &#43;153,48 @@ bool amdgpu_device_is_px(struct drm_device *d=
ev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;/**<br>
&gt; &#43; * VRAM access helper functions.<br>
&gt; &#43; *<br>
&gt; &#43; * amdgpu_device_vram_access - read/write a buffer in vram<br>
&gt; &#43; *<br>
&gt; &#43; * @adev: amdgpu_device pointer<br>
&gt; &#43; * @pos: offset of the buffer in vram<br>
&gt; &#43; * @buf: virtual address of the buffer in system memory<br>
&gt; &#43; * @size: read/write size, sizeof(@buf) must &gt; @size<br>
&gt; &#43; * @write: true - write to vram, otherwise - read from vram<br>
&gt; &#43; *<br>
&gt; &#43; * Returns 0 on success or an -error on failure.<br>
&gt; &#43; */<br>
&gt; &#43;int amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t =
pos,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *buf, size_t siz=
e, bool write)<br>
<br>
Indentation seems to be incorrect here.<br>
<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t end =3D pos &#43; size;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR_OR_NULL(buf) ||<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (adev-&gt;gmc.mc=
_vram_size &gt; 0 &amp;&amp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end &gt; a=
dev-&gt;gmc.mc_vram_size)) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; DRM_ERROR(&quot;parameter error! pos:%llx, buf:%llx, size:%zx.\n&qu=
ot;,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos, (u=
64)buf, size);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return -EINVAL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
Please drop that, this is a purely internal functions and parameter <br>
checking like this doesn't really make sense.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; while (pos &lt; end) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; spin_lock_irqsave(&amp;adev-&gt;mmio_idx_lock, flags);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; WREG32_NO_KIQ(mmMM_INDEX, ((uint32_t)pos) | 0x80000000);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; WREG32_NO_KIQ(mmMM_INDEX_HI, pos &gt;&gt; 31);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; if (write)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_NO_KIQ(mmMM_=
DATA, *buf&#43;&#43;);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; else<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *buf&#43;&#43; =3D =
RREG32_NO_KIQ(mmMM_DATA);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; spin_unlock_irqrestore(&amp;adev-&gt;mmio_idx_lock, flags);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; pos &#43;=3D 4;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp; * MMIO register access helper functions.<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; index db2dab3a6dff..324c2d605f54 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; @@ -134,21 &#43;134,10 @@ static int hw_id_map[MAX_HWIP] =3D {<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static int amdgpu_discovery_read_binary(struct amdgpu_devi=
ce *adev, uint8_t *binary)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *p =3D (uint32_t *)binary;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t vram_size =3D (uint=
64_t)RREG32(mmRCC_CONFIG_MEMSIZE) &lt;&lt; 20;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t pos =3D vram_size -=
 BINARY_MAX_SIZE;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; while (pos &lt; vram_size) {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; spin_lock_irqsave(&amp;adev-&gt;mmio_idx_lock, flags);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; WREG32_NO_KIQ(mmMM_INDEX, ((uint32_t)pos) | 0x80000000);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; WREG32_NO_KIQ(mmMM_INDEX_HI, pos &gt;&gt; 31);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; *p&#43;&#43; =3D RREG32_NO_KIQ(mmMM_DATA);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; spin_unlock_irqrestore(&amp;adev-&gt;mmio_idx_lock, flags);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pos &#43;=3D 4;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return amdgpu_device_vram_access(adev, p=
os, (uint32_t *)binary, BINARY_MAX_SIZE, false);<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static uint16_t amdgpu_discovery_calculate_checksum(uint8_=
t *data, uint32_t size)<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN1PR12MB2544ECC6BB4C073BCA587E1195950SN1PR12MB2544namp_--

--===============0005012269==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0005012269==--

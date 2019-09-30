Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F84C25EA
	for <lists+amd-gfx@lfdr.de>; Mon, 30 Sep 2019 20:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9263C6E4CD;
	Mon, 30 Sep 2019 18:08:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820087.outbound.protection.outlook.com [40.107.82.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042196E4CD
 for <amd-gfx@lists.freedesktop.org>; Mon, 30 Sep 2019 18:08:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k1t4/qg31OIe8TL5tkt4svnzMMKV9YjdbJuVEOfWIbz+nGbhOIqqaxCwVL9Hno915Q2feocwzD8PtnSm+/OvjTwas4vaPTIw9+IgpnBHXMJuGXqNbad1Elyp6RRQytx44zVqOgfSFo5hSWaclNgOmN60cEgBzJ+zvsToMZ/VGApuKw43R/iFKuYVOiqjIJcrh38ipgrr9E4N0Z46rpDRTMiV4E7tFB9f+kAMzlFR6cZm0X8aMGBbLMnJIzQoTUKPtSVapjeYOtbgNdvBcSipJSTL56jGhnwkeOlJ/Nmn/nvGAWJ2/qG22iBTKF/62GV6M8YW9E0EK+kZlKxq//koEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vewTGd8eIgCHwGNcUE9jb5UdNtts/S3Vz33wFxvFYNc=;
 b=MpBUaMIdvm2h9Tjk/FEz9/PJsH8CnHDyptbyCXqQ8ynx2koW4HRDK3PDBUsbZnOTxcRMH27bpPxH0cla28FZJbT1SeXzUBF6vLWEGnKqr/oBykoim0QgH5wOritG90dVur2MLGbMqO7fs3WdgwXxhn4IGQgzyGUc6ejOv7twi1l9pVa3hnU/4kYHvDFkbx+NWPUI+g/N4JvDQRFOBRNnQQZNodNuXXa1fw5qxNVNG087iXT4KZAs4k3k1GUF1YKkuUpprEWJq64vL72TgYZWK1BFEc7e5G4hpSmhthj2j8N4aLBdYwN1kh1rLPSiSLoKKD6lMGoOdLs3FKTtfmm8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB2778.namprd12.prod.outlook.com (20.176.114.145) by
 DM6PR12MB3499.namprd12.prod.outlook.com (20.178.199.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 18:08:32 +0000
Received: from DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::b411:7d2c:8848:1f6e]) by DM6PR12MB2778.namprd12.prod.outlook.com
 ([fe80::b411:7d2c:8848:1f6e%7]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 18:08:32 +0000
From: "Zhao, Yong" <Yong.Zhao@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/amdgpu: Add the HDP flush support for Navi
Thread-Topic: [PATCH 5/6] drm/amdgpu: Add the HDP flush support for Navi
Thread-Index: AQHVda6nMuaaGGKqQ0611nhju0hSwKdEZBKAgAAkKxk=
Date: Mon, 30 Sep 2019 18:08:31 +0000
Message-ID: <DM6PR12MB2778AF2F9B4220E756B3B982F0820@DM6PR12MB2778.namprd12.prod.outlook.com>
References: <20190928034132.28340-1-Yong.Zhao@amd.com>
 <20190928034132.28340-5-Yong.Zhao@amd.com>,
 <9e4b4889-4937-bb42-d0f9-79766fd87138@amd.com>
In-Reply-To: <9e4b4889-4937-bb42-d0f9-79766fd87138@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2607:fea8:209f:ebca:80e2:c472:bf44:ff10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 002c60ce-fae3-483d-6f1e-08d745d13419
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3499:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB34997ED362154EE8121B6596F0820@DM6PR12MB3499.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(52314003)(199004)(189003)(2501003)(11346002)(33656002)(446003)(52536014)(5660300002)(6436002)(229853002)(55016002)(2906002)(105004)(46003)(19627405001)(316002)(8676002)(25786009)(76176011)(6116002)(7736002)(53546011)(110136005)(8936002)(7696005)(74316002)(102836004)(86362001)(256004)(14444005)(14454004)(64756008)(66446008)(54896002)(66556008)(478600001)(66476007)(71200400001)(81156014)(6246003)(66946007)(76116006)(81166006)(186003)(71190400001)(486006)(9686003)(99286004)(476003)(6506007)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3499;
 H:DM6PR12MB2778.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lJ2sMTeFByu7KowZhcJYw/rJ5TLnqcQIoiZ1GyTtKRo/KiDUdylu7Pc3rJEagawVqBO0UG2ROgtMS8Rk4y/58852V7fk9TS4+8iju4JwM5smAIPJA7elqUS8Gm66DEjb8rHmsSy9dRXRxLWUF9cN2OMpR2a1FOpgQZdpV/ecKgiwzwqtOCyK5eUv4VEVoXf9tLIQJ8HOEJbGoFs9tM/4yfSbm/csqRR60iirJHhN7bFr5/fttAgrp48CKXoLRIZVodOUcx78q18ah7tul1b4xOKOkVaO2fz46aVQy7uSsCXe0Q9JhS5eh0Gwp/dkLxDrHZo+JFOtAxYaWdmBmKKlY5YQrHdBfuv6wWkib920N4R6XsTfbjTlzlVISoH9X8ALPIw2gReFfCLce4xPe2ShXOQsRjtegmkoHGLf7ZwPseI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 002c60ce-fae3-483d-6f1e-08d745d13419
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 18:08:31.9268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Ra0Pb3Q0Mj06HrEbIJeAy8DfD6R17lAwZG/mjd44UWP3Qn2TgcnjqbJRBmTss7W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3499
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vewTGd8eIgCHwGNcUE9jb5UdNtts/S3Vz33wFxvFYNc=;
 b=g5clV9Ej5YbSyAuknLb9oZMGbNpeAMiR6JLFMMBMqdqKdI679CdJ6f4zAs6AT5FK1CIzVaq/LdMACP6QA16i0V3xbrege2ld9hbzBge+IySpdQqxMA/8Yq90POose5GgzrZ21ZKL8lLXUgqMmXiox/y8mOLxsEkQWoFP5YrVoIo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Yong.Zhao@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1462292514=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1462292514==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB2778AF2F9B4220E756B3B982F0820DM6PR12MB2778namp_"

--_000_DM6PR12MB2778AF2F9B4220E756B3B982F0820DM6PR12MB2778namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Not much relationship between them, except that this functional change is t=
o fix a IOCTL error printing.

Yong
________________________________
From: Kuehling, Felix <Felix.Kuehling@amd.com>
Sent: Monday, September 30, 2019 11:57 AM
To: Zhao, Yong <Yong.Zhao@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@=
lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/amdgpu: Add the HDP flush support for Navi

As far as I can tell, this is the only patch with functional changes in
the patch series. The rest are purely clean-up. Any relation I'm missing?

Anyway, patches 2,3,5 are

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

On 2019-09-27 11:41 p.m., Zhao, Yong wrote:
> The HDP flush support code was missing in the nbio and nv files.
>
> Change-Id: I046ff52567676b56bf16dc1728b02481233acb61
> Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c | 16 +++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/nv.c        |  9 +++++++++
>   2 files changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/amd=
/amdgpu/nbio_v2_3.c
> index e7e36fb6113d..c699cbfe015a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c
> @@ -27,11 +27,21 @@
>   #include "nbio/nbio_2_3_default.h"
>   #include "nbio/nbio_2_3_offset.h"
>   #include "nbio/nbio_2_3_sh_mask.h"
> +#include <uapi/linux/kfd_ioctl.h>
>
>   #define smnPCIE_CONFIG_CNTL 0x11180044
>   #define smnCPM_CONTROL              0x11180460
>   #define smnPCIE_CNTL2               0x11180070
>
> +
> +static void nbio_v2_3_remap_hdp_registers(struct amdgpu_device *adev)
> +{
> +     WREG32_SOC15(NBIO, 0, mmREMAP_HDP_MEM_FLUSH_CNTL,
> +             adev->rmmio_remap.reg_offset + KFD_MMIO_REMAP_HDP_MEM_FLUSH=
_CNTL);
> +     WREG32_SOC15(NBIO, 0, mmREMAP_HDP_REG_FLUSH_CNTL,
> +             adev->rmmio_remap.reg_offset + KFD_MMIO_REMAP_HDP_REG_FLUSH=
_CNTL);
> +}
> +
>   static u32 nbio_v2_3_get_rev_id(struct amdgpu_device *adev)
>   {
>        u32 tmp =3D RREG32_SOC15(NBIO, 0, mmRCC_DEV0_EPF0_STRAP0);
> @@ -56,10 +66,9 @@ static void nbio_v2_3_hdp_flush(struct amdgpu_device *=
adev,
>                                struct amdgpu_ring *ring)
>   {
>        if (!ring || !ring->funcs->emit_wreg)
> -             WREG32_SOC15_NO_KIQ(NBIO, 0, mmBIF_BX_PF_HDP_MEM_COHERENCY_=
FLUSH_CNTL, 0);
> +             WREG32_NO_KIQ((adev->rmmio_remap.reg_offset + KFD_MMIO_REMA=
P_HDP_MEM_FLUSH_CNTL) >> 2, 0);
>        else
> -             amdgpu_ring_emit_wreg(ring, SOC15_REG_OFFSET(
> -                     NBIO, 0, mmBIF_BX_PF_HDP_MEM_COHERENCY_FLUSH_CNTL),=
 0);
> +             amdgpu_ring_emit_wreg(ring, (adev->rmmio_remap.reg_offset +=
 KFD_MMIO_REMAP_HDP_MEM_FLUSH_CNTL) >> 2, 0);
>   }
>
>   static u32 nbio_v2_3_get_memsize(struct amdgpu_device *adev)
> @@ -330,4 +339,5 @@ const struct amdgpu_nbio_funcs nbio_v2_3_funcs =3D {
>        .ih_control =3D nbio_v2_3_ih_control,
>        .init_registers =3D nbio_v2_3_init_registers,
>        .detect_hw_virt =3D nbio_v2_3_detect_hw_virt,
> +     .remap_hdp_registers =3D nbio_v7_4_remap_hdp_registers,
>   };
> diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amdgpu=
/nv.c
> index b3e7756fcc4b..6699a45b88ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nv.c
> @@ -587,8 +587,11 @@ static const struct amdgpu_asic_funcs nv_asic_funcs =
=3D
>
>   static int nv_common_early_init(void *handle)
>   {
> +#define MMIO_REG_HOLE_OFFSET (0x80000 - PAGE_SIZE)
>        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>
> +     adev->rmmio_remap.reg_offset =3D MMIO_REG_HOLE_OFFSET;
> +     adev->rmmio_remap.bus_addr =3D adev->rmmio_base + MMIO_REG_HOLE_OFF=
SET;
>        adev->smc_rreg =3D NULL;
>        adev->smc_wreg =3D NULL;
>        adev->pcie_rreg =3D &nv_pcie_rreg;
> @@ -714,6 +717,12 @@ static int nv_common_hw_init(void *handle)
>        nv_program_aspm(adev);
>        /* setup nbio registers */
>        adev->nbio.funcs->init_registers(adev);
> +     /* remap HDP registers to a hole in mmio space,
> +      * for the purpose of expose those registers
> +      * to process space
> +      */
> +     if (adev->nbio.funcs->remap_hdp_registers)
> +             adev->nbio.funcs->remap_hdp_registers(adev);
>        /* enable the doorbell aperture */
>        nv_enable_doorbell_aperture(adev, true);
>

--_000_DM6PR12MB2778AF2F9B4220E756B3B982F0820DM6PR12MB2778namp_
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
Not much relationship between them, except that this functional change is t=
o fix a IOCTL error printing.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Yong</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kuehling, Felix &lt;F=
elix.Kuehling@amd.com&gt;<br>
<b>Sent:</b> Monday, September 30, 2019 11:57 AM<br>
<b>To:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 5/6] drm/amdgpu: Add the HDP flush support for N=
avi</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">As far as I can tell, this is the only patch with =
functional changes in
<br>
the patch series. The rest are purely clean-up. Any relation I'm missing?<b=
r>
<br>
Anyway, patches 2,3,5 are<br>
<br>
Reviewed-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
<br>
On 2019-09-27 11:41 p.m., Zhao, Yong wrote:<br>
&gt; The HDP flush support code was missing in the nbio and nv files.<br>
&gt;<br>
&gt; Change-Id: I046ff52567676b56bf16dc1728b02481233acb61<br>
&gt; Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c | 16 &#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/nv.c&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; |&nbsp; 9 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; 2 files changed, 22 insertions(&#43;), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c b/drivers/gpu/drm/=
amd/amdgpu/nbio_v2_3.c<br>
&gt; index e7e36fb6113d..c699cbfe015a 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/nbio_v2_3.c<br>
&gt; @@ -27,11 &#43;27,21 @@<br>
&gt;&nbsp;&nbsp; #include &quot;nbio/nbio_2_3_default.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;nbio/nbio_2_3_offset.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;nbio/nbio_2_3_sh_mask.h&quot;<br>
&gt; &#43;#include &lt;uapi/linux/kfd_ioctl.h&gt;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #define smnPCIE_CONFIG_CNTL 0x11180044<br>
&gt;&nbsp;&nbsp; #define smnCPM_CONTROL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x11180460<br>
&gt;&nbsp;&nbsp; #define smnPCIE_CNTL2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x11180070<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;<br>
&gt; &#43;static void nbio_v2_3_remap_hdp_registers(struct amdgpu_device *a=
dev)<br>
&gt; &#43;{<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(NBIO, 0, mmREMAP_HDP_MEM_FL=
USH_CNTL,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; adev-&gt;rmmio_remap.reg_offset &#43; KFD_MMIO_REMAP_HDP_MEM_FLUSH_=
CNTL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(NBIO, 0, mmREMAP_HDP_REG_FL=
USH_CNTL,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; adev-&gt;rmmio_remap.reg_offset &#43; KFD_MMIO_REMAP_HDP_REG_FLUSH_=
CNTL);<br>
&gt; &#43;}<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp; static u32 nbio_v2_3_get_rev_id(struct amdgpu_device *adev=
)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 tmp =3D RREG32_SOC15(NBI=
O, 0, mmRCC_DEV0_EPF0_STRAP0);<br>
&gt; @@ -56,10 &#43;66,9 @@ static void nbio_v2_3_hdp_flush(struct amdgpu_d=
evice *adev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring *ring)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ring || !ring-&gt;funcs=
-&gt;emit_wreg)<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; WREG32_SOC15_NO_KIQ(NBIO, 0, mmBIF_BX_PF_HDP_MEM_COHERENCY_FLUSH_CNTL, =
0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; WREG32_NO_KIQ((adev-&gt;rmmio_remap.reg_offset &#43; KFD_MMIO_REMAP=
_HDP_MEM_FLUSH_CNTL) &gt;&gt; 2, 0);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; amdgpu_ring_emit_wreg(ring, SOC15_REG_OFFSET(<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NBIO, 0, mmBIF_BX_PF_HD=
P_MEM_COHERENCY_FLUSH_CNTL), 0);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; amdgpu_ring_emit_wreg(ring, (adev-&gt;rmmio_remap.reg_offset &#43; =
KFD_MMIO_REMAP_HDP_MEM_FLUSH_CNTL) &gt;&gt; 2, 0);<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static u32 nbio_v2_3_get_memsize(struct amdgpu_device *ade=
v)<br>
&gt; @@ -330,4 &#43;339,5 @@ const struct amdgpu_nbio_funcs nbio_v2_3_funcs=
 =3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .ih_control =3D nbio_v2_3_ih=
_control,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .init_registers =3D nbio_v2_=
3_init_registers,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .detect_hw_virt =3D nbio_v2_=
3_detect_hw_virt,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; .remap_hdp_registers =3D nbio_v7_4_remap=
_hdp_registers,<br>
&gt;&nbsp;&nbsp; };<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/nv.c b/drivers/gpu/drm/amd/amd=
gpu/nv.c<br>
&gt; index b3e7756fcc4b..6699a45b88ec 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/nv.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/nv.c<br>
&gt; @@ -587,8 &#43;587,11 @@ static const struct amdgpu_asic_funcs nv_asic=
_funcs =3D<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static int nv_common_early_init(void *handle)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; &#43;#define MMIO_REG_HOLE_OFFSET (0x80000 - PAGE_SIZE)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =
=3D (struct amdgpu_device *)handle;<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;rmmio_remap.reg_offset =3D MMIO=
_REG_HOLE_OFFSET;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;rmmio_remap.bus_addr =3D adev-&=
gt;rmmio_base &#43; MMIO_REG_HOLE_OFFSET;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;smc_rreg =3D NULL;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;smc_wreg =3D NULL;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;pcie_rreg =3D &amp;=
nv_pcie_rreg;<br>
&gt; @@ -714,6 &#43;717,12 @@ static int nv_common_hw_init(void *handle)<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nv_program_aspm(adev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* setup nbio registers */<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;nbio.funcs-&gt;init=
_registers(adev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* remap HDP registers to a hole in mmio=
 space,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * for the purpose of expose those =
registers<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to process space<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;nbio.funcs-&gt;remap_hdp_re=
gisters)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; adev-&gt;nbio.funcs-&gt;remap_hdp_registers(adev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* enable the doorbell apert=
ure */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; nv_enable_doorbell_aperture(=
adev, true);<br>
&gt;&nbsp;&nbsp; <br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB2778AF2F9B4220E756B3B982F0820DM6PR12MB2778namp_--

--===============1462292514==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1462292514==--

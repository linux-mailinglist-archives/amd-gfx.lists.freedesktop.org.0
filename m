Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72472C0636
	for <lists+amd-gfx@lfdr.de>; Fri, 27 Sep 2019 15:21:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BF86E063;
	Fri, 27 Sep 2019 13:21:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760043.outbound.protection.outlook.com [40.107.76.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E696E063
 for <amd-gfx@lists.freedesktop.org>; Fri, 27 Sep 2019 13:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqM5F34RTg37wl2f4LLr0+YycS68X09GrV8JpT+iLdNc/fsftPiU+RigiIOCylYb4Vb7r9IM7MnFVGM1sabRaOPQXmUmk7rp9FwW15CahenWM5rLqQjSEsc9fsXIz9seeCjaARowuliFB/KWn8kHYhtuRW3tSzA0c9+nZzIoqTE/uLcAIxiM5F64rp/zaEyMZbAY/GygLeaph7rZIS8h25dn8a+jyKR/+0Vy1f/h2QMh7kA1TAiGwmzJSfDZwMxdATOf7LSsIul6XURgjMCOpnSJkVLwFwVfPuihbkSOR7pWyNV3wmrSkcShbo58seJ/Dc2h/djptsQypGKNWViubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XYPSdcL/87NFj3pvDcl3H+L3csgzjMBnC0Moa4Wk04=;
 b=BzumrmYhXHAuRmOMaAYs/cNUs1uYu0HMxFmBGiN4JeYIxDMxLt6wI87vjUNK48eDzIbFnyhQ5QQir4zcurctLkC8UYnsHQbBa5uZeKdQ4nVrazCUNM0tlEZiEKD/H0kLdQc0QrWZGPEnSAevIqXa/id1nTXcHW2/JdxxBaCaKNgylbZZs4oRsECW4Zk+bdCV4pPXBw+AQjbKlEfgMQ60HbhWvCinRr8SMrDTxif2arQdLQMudVd191ViMden7rWq47y2G5XVtm9oAzZzmDwpke/S7MUoGCHE+0Eg6lg52Z+aZfLTDad0SFyPlyZtlaWcsObisoqYxpP53PiH5M4cIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1330.namprd12.prod.outlook.com (10.168.228.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.21; Fri, 27 Sep 2019 13:21:22 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2284.023; Fri, 27 Sep
 2019 13:21:22 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhao, Yong"
 <Yong.Zhao@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: Export setup_vm_pt_regs() logic for
 gfxhub 2.0
Thread-Topic: [PATCH 1/3] drm/amdgpu: Export setup_vm_pt_regs() logic for
 gfxhub 2.0
Thread-Index: AQHVc8093kQ+hgY+9kmNX+wTQoEqTKc+i1kAgAD5nPU=
Date: Fri, 27 Sep 2019 13:21:22 +0000
Message-ID: <BN6PR12MB18092F889AAB39833EA2210DF7810@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190925181527.17091-1-Yong.Zhao@amd.com>,
 <5d25ca56-6604-c7dc-a669-f0feabd5dc5f@amd.com>
In-Reply-To: <5d25ca56-6604-c7dc-a669-f0feabd5dc5f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42176d59-b10c-4ef2-86b8-08d7434d977c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR12MB1330; 
x-ms-traffictypediagnostic: BN6PR12MB1330:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB13303E53EC8CBFAB61DB3960F7810@BN6PR12MB1330.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:129;
x-forefront-prvs: 0173C6D4D5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(189003)(199004)(6306002)(9686003)(486006)(54896002)(476003)(105004)(66066001)(236005)(66946007)(2501003)(64756008)(66446008)(316002)(74316002)(6436002)(6116002)(966005)(76116006)(66476007)(66556008)(25786009)(11346002)(446003)(7736002)(86362001)(229853002)(55016002)(52536014)(606006)(71200400001)(71190400001)(110136005)(99286004)(19627405001)(478600001)(14454004)(5660300002)(102836004)(8936002)(33656002)(256004)(81166006)(6246003)(3846002)(2906002)(53546011)(81156014)(6506007)(186003)(8676002)(26005)(76176011)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1330;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NUAJZWUTDai6PLa/5LxPygNBMT5I0+2iX1tNaTP6SCs5OSpeCZbPMCPkW2qwvo8P8k/+oUFLNKQhwjFfC3dM1u1cHargMEKsju2LQQkv+s5ZLV7kN97ocl9NpGPbA5ChTj+Lp5ILmDuzlt6uM9zWLEgwCOkxSsEoo+YfeoA/r7uf9g7INvFoRFGICiHmP/eA8NUGpXaWKd6E1nc9A7BoTr6pVyZOf8uzuYiJx2k8ZMX1fxCi7nSvWLQz87KSzm2P7B7KXkRZohyU/OTAiLQRglBbmCyTC/qrh3IrbxppkjEvK8LjSZChmTCb7zrtDnIUC8mAOVM8BOQJ94rjZAwqRZRaTFXsm/HSj2z8s9nPX3Kz3/AukYk6du0qUM5UubGM+zdVMXkKEpdWTyhKozrLR7BzkO5dvLhwwWPtCu6736zPqsUMqJxVkMstTZk1M0Qa5n13qQGoKggwfyomUSntbw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42176d59-b10c-4ef2-86b8-08d7434d977c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2019 13:21:22.8038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cpXN7oWTHe8Vey/7mUfH9pHrYtRjgbIAgsQ6aCD7L3BznK16VYRAw2TGqPt1cmbb/QaBKprJgab+Ug4zCQntA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1330
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XYPSdcL/87NFj3pvDcl3H+L3csgzjMBnC0Moa4Wk04=;
 b=2qIGid0BqtSBF3ZHGUzwJRYIRnIX0f+UK775FWMrkHRjmDBpyUBHOw8UZT9DkMIdpFfcBcz5GNletVFM4DMnyq9G7rN9LwKJ81o8k+k1OsZqTtdogdcMHeQPZT/R/mn13ApxcBRl/KaOpnXFGlx4CIdwAMydpTcXHUyhtY1Cvn0=
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
Content-Type: multipart/mixed; boundary="===============1460370766=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1460370766==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18092F889AAB39833EA2210DF7810BN6PR12MB1809namp_"

--_000_BN6PR12MB18092F889AAB39833EA2210DF7810BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Kuehling=
, Felix <Felix.Kuehling@amd.com>
Sent: Thursday, September 26, 2019 6:26 PM
To: Zhao, Yong <Yong.Zhao@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@=
lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: Export setup_vm_pt_regs() logic for gf=
xhub 2.0

For GFXv9 you made an equivalent change for both GFXHub and MMHub
("drm/amdgpu: Expose *_setup_vm_pt_regs for kfd to use"). Your GFXv9
commit was also reviewed by Alex and Christian. You should get at least
one of them to Ack or Review this change.

For GFXv10 you're only changing the GFXHub. I suspect that's because KFD
doesn't care about MMHub on GFXv10. That's fine with me.

You can add
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>

Thanks,
   Felix

On 2019-09-25 2:15 p.m., Zhao, Yong wrote:
> The KFD code will call this function later.
>
> Change-Id: I88a53368cdee719b2c75393e5cdbd8290584548e
> Signed-off-by: Yong Zhao <Yong.Zhao@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c | 20 ++++++++++++--------
>   drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h |  2 ++
>   2 files changed, 14 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c b/drivers/gpu/drm/a=
md/amdgpu/gfxhub_v2_0.c
> index a9238735d361..b601c6740ef5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c
> @@ -46,21 +46,25 @@ u64 gfxhub_v2_0_get_mc_fb_offset(struct amdgpu_device=
 *adev)
>        return (u64)RREG32_SOC15(GC, 0, mmGCMC_VM_FB_OFFSET) << 24;
>   }
>
> -static void gfxhub_v2_0_init_gart_pt_regs(struct amdgpu_device *adev)
> +void gfxhub_v2_0_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t v=
mid,
> +                             uint64_t page_table_base)
>   {
> -     uint64_t value =3D amdgpu_gmc_pd_addr(adev->gart.bo);
> +     /* two registers distance between mmGCVM_CONTEXT0_* to mmGCVM_CONTE=
XT1_* */
> +     int offset =3D mmGCVM_CONTEXT1_PAGE_TABLE_BASE_ADDR_LO32
> +                     - mmGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32;
>
> +     WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO3=
2,
> +                             offset * vmid, lower_32_bits(page_table_bas=
e));
>
> -     WREG32_SOC15(GC, 0, mmGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_LO32,
> -                  lower_32_bits(value));
> -
> -     WREG32_SOC15(GC, 0, mmGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI32,
> -                  upper_32_bits(value));
> +     WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEXT0_PAGE_TABLE_BASE_ADDR_HI3=
2,
> +                             offset * vmid, upper_32_bits(page_table_bas=
e));
>   }
>
>   static void gfxhub_v2_0_init_gart_aperture_regs(struct amdgpu_device *a=
dev)
>   {
> -     gfxhub_v2_0_init_gart_pt_regs(adev);
> +     uint64_t pt_base =3D amdgpu_gmc_pd_addr(adev->gart.bo);
> +
> +     gfxhub_v2_0_setup_vm_pt_regs(adev, 0, pt_base);
>
>        WREG32_SOC15(GC, 0, mmGCVM_CONTEXT0_PAGE_TABLE_START_ADDR_LO32,
>                     (u32)(adev->gmc.gart_start >> 12));
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h b/drivers/gpu/drm/a=
md/amdgpu/gfxhub_v2_0.h
> index 06807940748b..392b8cd94fc0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h
> +++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h
> @@ -31,5 +31,7 @@ void gfxhub_v2_0_set_fault_enable_default(struct amdgpu=
_device *adev,
>                                          bool value);
>   void gfxhub_v2_0_init(struct amdgpu_device *adev);
>   u64 gfxhub_v2_0_get_mc_fb_offset(struct amdgpu_device *adev);
> +void gfxhub_v2_0_setup_vm_pt_regs(struct amdgpu_device *adev, uint32_t v=
mid,
> +                             uint64_t page_table_base);
>
>   #endif
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB18092F889AAB39833EA2210DF7810BN6PR12MB1809namp_
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
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Kuehling, Felix &lt;Felix.Kue=
hling@amd.com&gt;<br>
<b>Sent:</b> Thursday, September 26, 2019 6:26 PM<br>
<b>To:</b> Zhao, Yong &lt;Yong.Zhao@amd.com&gt;; amd-gfx@lists.freedesktop.=
org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 1/3] drm/amdgpu: Export setup_vm_pt_regs() logic=
 for gfxhub 2.0</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">For GFXv9 you made an equivalent change for both G=
FXHub and MMHub
<br>
(&quot;drm/amdgpu: Expose *_setup_vm_pt_regs for kfd to use&quot;). Your GF=
Xv9 <br>
commit was also reviewed by Alex and Christian. You should get at least <br=
>
one of them to Ack or Review this change.<br>
<br>
For GFXv10 you're only changing the GFXHub. I suspect that's because KFD <b=
r>
doesn't care about MMHub on GFXv10. That's fine with me.<br>
<br>
You can add<br>
Reviewed-by: Felix Kuehling &lt;Felix.Kuehling@amd.com&gt;<br>
<br>
Thanks,<br>
&nbsp;&nbsp; Felix<br>
<br>
On 2019-09-25 2:15 p.m., Zhao, Yong wrote:<br>
&gt; The KFD code will call this function later.<br>
&gt;<br>
&gt; Change-Id: I88a53368cdee719b2c75393e5cdbd8290584548e<br>
&gt; Signed-off-by: Yong Zhao &lt;Yong.Zhao@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c | 20 &#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h |&nbsp; 2 &#43;&#=
43;<br>
&gt;&nbsp;&nbsp; 2 files changed, 14 insertions(&#43;), 8 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c b/drivers/gpu/dr=
m/amd/amdgpu/gfxhub_v2_0.c<br>
&gt; index a9238735d361..b601c6740ef5 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.c<br>
&gt; @@ -46,21 &#43;46,25 @@ u64 gfxhub_v2_0_get_mc_fb_offset(struct amdgpu=
_device *adev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (u64)RREG32_SOC15(GC,=
 0, mmGCMC_VM_FB_OFFSET) &lt;&lt; 24;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; -static void gfxhub_v2_0_init_gart_pt_regs(struct amdgpu_device *adev)=
<br>
&gt; &#43;void gfxhub_v2_0_setup_vm_pt_regs(struct amdgpu_device *adev, uin=
t32_t vmid,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t page_table_base)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; uint64_t value =3D amdgpu_gmc_pd_addr(adev-&=
gt;gart.bo);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; /* two registers distance between mmGCVM=
_CONTEXT0_* to mmGCVM_CONTEXT1_* */<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; int offset =3D mmGCVM_CONTEXT1_PAGE_TABL=
E_BASE_ADDR_LO32<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - mmGCVM_CONTEXT0_P=
AGE_TABLE_BASE_ADDR_LO32;<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEX=
T0_PAGE_TABLE_BASE_ADDR_LO32,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; offset * vmid, lower_32_bits(page_table_base))=
;<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(GC, 0, mmGCVM_CONTEXT0_PAGE_TAB=
LE_BASE_ADDR_LO32,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lower_32_bits(value));<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(GC, 0, mmGCVM_CONTEXT0_PAGE_TAB=
LE_BASE_ADDR_HI32,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; upper_32_bits(value));<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15_OFFSET(GC, 0, mmGCVM_CONTEX=
T0_PAGE_TABLE_BASE_ADDR_HI32,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; offset * vmid, upper_32_bits(page_table_base))=
;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static void gfxhub_v2_0_init_gart_aperture_regs(struct amd=
gpu_device *adev)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; gfxhub_v2_0_init_gart_pt_regs(adev);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t pt_base =3D amdgpu_gmc_pd_addr(=
adev-&gt;gart.bo);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; gfxhub_v2_0_setup_vm_pt_regs(adev, 0, pt=
_base);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WREG32_SOC15(GC, 0, mmGCVM_C=
ONTEXT0_PAGE_TABLE_START_ADDR_LO32,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (u32)(adev-&gt;gmc.gart_s=
tart &gt;&gt; 12));<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h b/drivers/gpu/dr=
m/amd/amdgpu/gfxhub_v2_0.h<br>
&gt; index 06807940748b..392b8cd94fc0 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gfxhub_v2_0.h<br>
&gt; @@ -31,5 &#43;31,7 @@ void gfxhub_v2_0_set_fault_enable_default(struct=
 amdgpu_device *adev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; bool value);<br>
&gt;&nbsp;&nbsp; void gfxhub_v2_0_init(struct amdgpu_device *adev);<br>
&gt;&nbsp;&nbsp; u64 gfxhub_v2_0_get_mc_fb_offset(struct amdgpu_device *ade=
v);<br>
&gt; &#43;void gfxhub_v2_0_setup_vm_pt_regs(struct amdgpu_device *adev, uin=
t32_t vmid,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t page_table_base);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; #endif<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18092F889AAB39833EA2210DF7810BN6PR12MB1809namp_--

--===============1460370766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1460370766==--

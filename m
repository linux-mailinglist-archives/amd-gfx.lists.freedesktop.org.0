Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 612CD9FFA4
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 12:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADB689A1A;
	Wed, 28 Aug 2019 10:22:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690062.outbound.protection.outlook.com [40.107.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B2789A1A
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 10:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUd6DTI9N7jtClv0g60DuJG2qR15SDR9REJPiEQwPt7dcpaP5hUIXDK4/YSIZiUs+5pKuSUAMbg7dRHZUOI+BbNIKSXbpHCJHMmGw3jD80yUL4AVXfhpZKbnsgG/KavQGn9tXPhQSFMwvJM/pn19Rh0hW43c1nFj/jRFb7lP9nTpakZf5XUVD6ETnRtf1+Aw90jsM1g1TEk4IDmW5jsOSzU9iOUZAJoHcrrFUZhSy3j3ckTN1aiBPIOFpnNSERAKFE+gEo4xE3IUZy72nDSSlpnCmL9k5rBVo0AYKmtJh+TSUhcFhk5KTCm7z3qSGzWSbBajOo8C4Th4tTj5ApGPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC92N+u6vW4u0PBmD5kDfW3GzBfX3N2qTWws+4RXRyE=;
 b=UY6XO2hOZBaI9tZ5rSuRA545yf0QR+Fsvz5yLOtju07z66k/ScRQIISCqRp5rrwM52fROrMfPtCkzfbA6L9CrnWrenUTwiEVdCP8QUmtuPljzIIoMYsyf36XxRvQdALBEJEXU2mTqLF1YaC+g5afU7iLarrAOV6EcYYJvAZeeIMCuPr15FwOSEYjwJRqqOQq3Jae/7UMZdA9j6sTeBbD9UZ7+QKoxXP0zvMXrMpriW77lQJE6wRxpTWU7oM4505VVoWJakJ28AFKr1H5/DinjEGoLEXlYYEHkGBCtlRq/69MYOpzTSreXR8fvH05f0e6XX1ZqGk73MK0vdxiNEBVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 10:21:59 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 10:21:59 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Topic: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Index: AQHVXYKRMbQy1E3cckynw5Xqd+AOmKcQUwkAgAAD6jo=
Date: Wed, 28 Aug 2019 10:21:59 +0000
Message-ID: <DM5PR12MB253547988B61E7D401C6FADC95A30@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <1566984335-14830-1-git-send-email-tianci.yin@amd.com>,
 <45fe6586-a53a-6f02-0e5f-b6224b159e12@gmail.com>
In-Reply-To: <45fe6586-a53a-6f02-0e5f-b6224b159e12@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5afe0767-75ab-41e6-d69d-08d72ba18fa1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1818EC5BBEADBF4F9918899095A30@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(189003)(199004)(2501003)(54906003)(99286004)(8676002)(5660300002)(14444005)(256004)(316002)(478600001)(446003)(11346002)(6436002)(54896002)(86362001)(7696005)(476003)(81156014)(81166006)(9686003)(110136005)(7736002)(53936002)(66066001)(6246003)(8936002)(105004)(55016002)(2906002)(52536014)(91956017)(4326008)(53546011)(6506007)(102836004)(229853002)(486006)(76116006)(66446008)(74316002)(64756008)(66556008)(66476007)(66946007)(33656002)(3846002)(6116002)(66574012)(6636002)(25786009)(71190400001)(26005)(14454004)(19627405001)(71200400001)(76176011)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FBoQrJLfXZ4rx/Vmq7HC0MCHHMh6Am9GsBoNOS9yx9e54HzEk/7vC4TD5zpNVtvQedgFuH+42R0c7aH7ACVA4SHvHYEi8ZnQx2pyeYL9WOR4goOpw3ROkwbcBKE3D3XwZ/0RHGIpjG9fFyb+CLblEGXByrrx5j/qMYu158Gw77PdHrXMgydahMMZhJBYSHkB308VnZ5Y/72PqZS0wWbGfH/Xm73TM9Vl4cetCO7rVh6mboFsvTL/wluCrl5PGlnxBjLlspLBklC0mCsBijENjEoexVb6L45Ejdb9voPXvQRpMECub+u4RwfRRyVckUcd52w7M6y0yyhC3DcStQqDg9f9WhuCE9ilwAbNfmf5zQKf78lcYgodDMG24QId0hYapMXiVgffMUq3klJuL7kLwu7G+1gf6N/lT5WXlUm4kvw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afe0767-75ab-41e6-d69d-08d72ba18fa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 10:21:59.4152 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J0iDDh72bbXHr0RfHbo7PNKlaNvCErTC0ao369U0tGEvjqKu2l7XWEXInV0lm7FdElCj0EetGeNDRlF0jXjkdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JC92N+u6vW4u0PBmD5kDfW3GzBfX3N2qTWws+4RXRyE=;
 b=ctx9PKovTkYYwVTARzCzA+AjU+RsIVZwHp4RmVxoqwK/xxgzI1cBfh3PxJbPCar12Cx2HcRJJcNcmGCKSKENF214aGjFKq8XUdBv7MgKchRrmebd2b41DHSvsmGFuT5jDEGKFlC4ha2Q1PZY59XTBi4PPQY0+9saZTaWnGu+9kw=
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
Cc: "Xu, Feifei" <Feifei.Xu@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>, "Ma, Le" <Le.Ma@amd.com>
Content-Type: multipart/mixed; boundary="===============0853497536=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0853497536==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB253547988B61E7D401C6FADC95A30DM5PR12MB2535namp_"

--_000_DM5PR12MB253547988B61E7D401C6FADC95A30DM5PR12MB2535namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

I have just realized the stolen_vga_memory problem,
I have ever thought that no one really use the stolen_vga_memory BO in KMD =
code, so it should be safe.

It seems we have to add a new parameter for amdgpu_bo_create_kernel() to pa=
ss the prefer region.

Thanks!

Rico
________________________________
From: Christian K?nig <ckoenig.leichtzumerken@gmail.com>
Sent: Wednesday, August 28, 2019 17:57
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Xu, Feifei <Feifei.Xu@amd.com>; Ma, Le <Le.Ma@amd.com>; Xiao, Jack <Jac=
k.Xiao@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SR=
IOV

Am 28.08.19 um 11:25 schrieb Tianci Yin:
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> Fix compute ring test failure in sriov scenario.
>
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 14 ++++++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h |  1 +
>   2 files changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
> index 9f7cc5b..92c68c9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -261,9 +261,15 @@ static int psp_tmr_init(struct psp_context *psp)
>                }
>        }
>
> -     ret =3D amdgpu_bo_create_kernel(psp->adev, tmr_size, PSP_TMR_SIZE,
> -                                   AMDGPU_GEM_DOMAIN_VRAM,
> -                                   &psp->tmr_bo, &psp->tmr_mc_addr, NULL=
);
> +     psp->tmr_buf =3D NULL;
> +     if (!amdgpu_sriov_vf(psp->adev))
> +             ret =3D amdgpu_bo_create_kernel(psp->adev, tmr_size, PSP_TM=
R_SIZE,
> +                                           AMDGPU_GEM_DOMAIN_VRAM,
> +                                           &psp->tmr_bo, &psp->tmr_mc_ad=
dr, NULL);
> +     else
> +             ret =3D amdgpu_bo_create_kernel(psp->adev, tmr_size, PSP_TM=
R_SIZE,
> +                                           AMDGPU_GEM_DOMAIN_VRAM,
> +                                           &psp->tmr_bo, &psp->tmr_mc_ad=
dr, &psp->tmr_buf);

Might be better to use a local variable for the CPU pointer instead of
duplicating the calling parameters.

BTW: How did you solved the stolen_vga_memory problem I pointed out in
the original patch set?

Christian.

>
>        return ret;
>   }
> @@ -1216,7 +1222,7 @@ static int psp_hw_fini(void *handle)
>
>        psp_ring_destroy(psp, PSP_RING_TYPE__KM);
>
> -     amdgpu_bo_free_kernel(&psp->tmr_bo, &psp->tmr_mc_addr, NULL);
> +     amdgpu_bo_free_kernel(&psp->tmr_bo, &psp->tmr_mc_addr, &psp->tmr_bu=
f);
>        amdgpu_bo_free_kernel(&psp->fw_pri_bo,
>                              &psp->fw_pri_mc_addr, &psp->fw_pri_buf);
>        amdgpu_bo_free_kernel(&psp->fence_buf_bo,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.h
> index bc0947f..b73d4aa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> @@ -171,6 +171,7 @@ struct psp_context
>        /* tmr buffer */
>        struct amdgpu_bo                *tmr_bo;
>        uint64_t                        tmr_mc_addr;
> +     void                            *tmr_buf;
>
>        /* asd firmware and buffer */
>        const struct firmware           *asd_fw;


--_000_DM5PR12MB253547988B61E7D401C6FADC95A30DM5PR12MB2535namp_
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
Hi Christian,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have just realized the <font size=3D"2"><span style=3D"font-size:11pt"><s=
pan>stolen_vga_memory</span></span></font> problem,
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I have ever thought that no one really use the <font size=3D"2"><span style=
=3D"font-size:11pt"><span>stolen_vga_memory BO in KMD code, so it should be=
 safe.</span></span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><span><br>
</span></span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><span>It seems we have to a=
dd a new parameter for amdgpu_bo_create_kernel</span></span></font>() to pa=
ss the prefer region.<br>
</div>
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
<b>Sent:</b> Wednesday, August 28, 2019 17:57<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Ma, Le &lt;Le.Ma@amd.com&g=
t;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@=
amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region=
 for SRIOV</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 28.08.19 um 11:25 schrieb Tianci Yin:<br>
&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt;<br>
&gt; Fix compute ring test failure in sriov scenario.<br>
&gt;<br>
&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 14 &#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h |&nbsp; 1 &#43;<br=
>
&gt;&nbsp;&nbsp; 2 files changed, 11 insertions(&#43;), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_psp.c<br>
&gt; index 9f7cc5b..92c68c9 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; @@ -261,9 &#43;261,15 @@ static int psp_tmr_init(struct psp_context *p=
sp)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_bo_create_kernel(psp-&gt;adev=
, tmr_size, PSP_TMR_SIZE,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_GEM_DOM=
AIN_VRAM,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;psp-&gt;t=
mr_bo, &amp;psp-&gt;tmr_mc_addr, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; psp-&gt;tmr_buf =3D NULL;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_sriov_vf(psp-&gt;adev))<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D amdgpu_bo_create_kernel(psp-&gt;adev, tmr_size, PSP_TMR_SIZ=
E,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_GEM_DOMAIN_VRAM,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;psp-&gt;tmr_bo, &amp;psp-&gt;tmr=
_mc_addr, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ret =3D amdgpu_bo_create_kernel(psp-&gt;adev, tmr_size, PSP_TMR_SIZ=
E,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_GEM_DOMAIN_VRAM,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;psp-&gt;tmr_bo, &amp;psp-&gt;tmr=
_mc_addr, &amp;psp-&gt;tmr_buf);<br>
<br>
Might be better to use a local variable for the CPU pointer instead of <br>
duplicating the calling parameters.<br>
<br>
BTW: How did you solved the stolen_vga_memory problem I pointed out in <br>
the original patch set?<br>
<br>
Christian.<br>
<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp;&nbsp; }<br>
&gt; @@ -1216,7 &#43;1222,7 @@ static int psp_hw_fini(void *handle)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp_ring_destroy(psp, PSP_RI=
NG_TYPE__KM);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;psp-&gt;tmr_bo, &=
amp;psp-&gt;tmr_mc_addr, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;psp-&gt;tmr_b=
o, &amp;psp-&gt;tmr_mc_addr, &amp;psp-&gt;tmr_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;p=
sp-&gt;fw_pri_bo,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;psp-&gt;fw_pri_mc_addr, &amp;psp-&gt;fw_p=
ri_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;p=
sp-&gt;fence_buf_bo,<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_psp.h<br>
&gt; index bc0947f..b73d4aa 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h<br>
&gt; @@ -171,6 &#43;171,7 @@ struct psp_context<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* tmr buffer */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; *tmr_bo;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmr_mc_addr;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tmr_buf;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* asd firmware and buffer *=
/<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const struct firmware&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *asd_fw;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM5PR12MB253547988B61E7D401C6FADC95A30DM5PR12MB2535namp_--

--===============0853497536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0853497536==--

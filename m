Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0199991EAC
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 10:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7420489973;
	Mon, 19 Aug 2019 08:16:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710062.outbound.protection.outlook.com [40.107.71.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1720489973
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 08:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgYqwtDLw3Gph7OMPnclL8/wLkNDhIjNZCDG2sCDq2+CuxXDLJ8UnSsBtb1Fna0wiI4ObPWRO3EIZUeNns3IFMQM23MleDzIQzvBPn1CfFqeSmr2DwounwPKKZ5n/jkeMj37w0YRRmUGd0numBGk/CTUi4akDeC7LOMf1z8mR2OezVRijL4ab0eTSkvNZCSOlRZmNMqNwlrdeS7lqjc7KpgX98h+flGgSwW9/XuBfh1/L+xf2WiS5GJv4tcC1oqjFyf2e04XCcDam6vEFhfkhOLAsLWVq+2IATSL2DruyPNROwiZR4I0R1Bde1aZNw4HGWnwrIZ2irrzXpP6w55YVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obawlTtan0c+zwTSjIjNtKBL7Yh12lzPeRL2u9KcXY4=;
 b=BxhUc66lwVoLOOjYLp8+Y/xYyBsf1SkaeAR7ggRBSBXoU/U1+sKfTjD/g9SySco5wrpY2/Sq3srjeZKqn10zfX7AYftLGQdKK0Scyv86yQr1g3yikzqsnfE/dXi+OtB+zQNHUK5So7Xfx9jvqWb9OLVEiTsyt9x0heL5PdhxgBXXzYrtL4KsJSmN5iM13pwMZ4W99f44NNBRjGfdhJ+5uOAQVP7r8orDHknjmhVdKMdK642qv7NWGS2n2wJV0pGecn/klOcMzLgf+ZInfeAltWuWfqJcW6a8SceunRFmgbJsVu/5CJ9gCBFC3Fzl7nZNhqmdXtvOHFADjqFPnlgP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2974.namprd12.prod.outlook.com (20.178.240.140) by
 MN2PR12MB3712.namprd12.prod.outlook.com (10.255.236.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 08:16:28 +0000
Received: from MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::1c46:b908:71b2:79a3]) by MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::1c46:b908:71b2:79a3%6]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 08:16:28 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
Thread-Topic: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
Thread-Index: AQHVVmTwgdUy4jJzNUyYPqX3ojC+DacCHaIAgAAAMwg=
Date: Mon, 19 Aug 2019 08:16:28 +0000
Message-ID: <MN2PR12MB2974D98262E42F1C6FB6644A95A80@MN2PR12MB2974.namprd12.prod.outlook.com>
References: <1566201945-18101-1-git-send-email-tianci.yin@amd.com>,
 <b1b7dd46-8ee5-deaf-1a24-ef152c96dcb6@gmail.com>
In-Reply-To: <b1b7dd46-8ee5-deaf-1a24-ef152c96dcb6@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8b8fcc9-7054-40a7-52ac-08d7247d88f2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3712; 
x-ms-traffictypediagnostic: MN2PR12MB3712:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3712348FFAD0A6EBCA4F046095A80@MN2PR12MB3712.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(199004)(189003)(81166006)(81156014)(66066001)(8676002)(86362001)(8936002)(52536014)(66574012)(6116002)(4326008)(3846002)(5660300002)(478600001)(25786009)(33656002)(19627405001)(256004)(14444005)(6246003)(53936002)(14454004)(7736002)(71200400001)(71190400001)(2906002)(6506007)(76116006)(91956017)(486006)(102836004)(476003)(66946007)(53546011)(6436002)(66556008)(66446008)(66476007)(64756008)(2501003)(99286004)(11346002)(105004)(110136005)(54906003)(55016002)(446003)(26005)(9686003)(186003)(54896002)(316002)(7696005)(76176011)(229853002)(74316002)(6636002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3712;
 H:MN2PR12MB2974.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Trp/n+EslSaXs0WCixmn7/l/SVf0Bans764Z3vOcipi2gr80mNn6vI5MaFNnVcxfvJ2PdSOcJT3juqdVeQFX1PE0tQ3vmrHP7b54Y/+vdW7BQhITn+9PuCc2caLcFHFnaNu13ui6flEVwyLE87W1KvYSuTkeyat1EAY7jpqKLuhNiq9ilb0ozK+2iTr+NkGWeW3wWNwy6vI9fktD3Ccd1pgVEZA9gIZ/IALpowLD1J6sV+GSBlepCle2V+94H79HxK18HT6viVUM1qYgzOFK3yPAHuhdVskjHuTQ6abv8UoiEWCgA6mqX0uYLscrJZpWzjkbmdAUC9iG+2uoHs9PAzycDT19A3v08Iu0iWyyVQ6kqOf8AX8wuAaFetiU9yfJtyfb6jpirjWWJTQXLpdOSH2dpTp4a/nESGWBacnl3ew=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b8fcc9-7054-40a7-52ac-08d7247d88f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 08:16:28.1929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 62LPhQkZxB68QaBYPQHIDwZar3KyLtf2NeLJA9dtSFqqvRB+Ho36+nW1Jal48g0j7nns0q3zHvLYDCkxmvHEUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3712
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obawlTtan0c+zwTSjIjNtKBL7Yh12lzPeRL2u9KcXY4=;
 b=UENRnaw4hZHyTwmKKUTL5b2jOu+NmuTxB8Iel+0uJQCy+gU4HgYQ3j5DJrFXHg93A4T7lLORmmW4gY6LsPE/M6sZ2E0/9ErST5TL3NltFKAzWQGDGXUU2HqT/sj20qBxjrB9MFT7uEV98FP4iIhgWceGslerrj9eMwTU0RkhRJY=
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
Content-Type: multipart/mixed; boundary="===============0057479078=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0057479078==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB2974D98262E42F1C6FB6644A95A80MN2PR12MB2974namp_"

--_000_MN2PR12MB2974D98262E42F1C6FB6644A95A80MN2PR12MB2974namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks very much Christian!

I scanned the whole code, only two functions pass in NULL cpu_addr,
amdgpu_ttm_init() and gfx_v9_0_ngg_create_buf(),
but the related BOs are not further mapped for cpu access.
so I think this change is safe.


________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Monday, August 19, 2019 16:07
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Z=
hang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region

Am 19.08.19 um 10:05 schrieb Tianci Yin:
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> so that more visible vram can be available for umd.
>
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>

Assuming that you checked that we don't have other users who are using
amdgpu_bo_create_kernel() without a CPU pointer this patch is
Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 5 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h    | 1 -
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 1059771..0476790 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -246,8 +246,9 @@ int amdgpu_bo_create_reserved(struct amdgpu_device *a=
dev,
>        bp.size =3D size;
>        bp.byte_align =3D align;
>        bp.domain =3D domain;
> -     bp.flags =3D AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED |
> -             AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
> +     bp.flags =3D cpu_addr ? AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED
> +             : AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
> +     bp.flags |=3D AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
>        bp.type =3D ttm_bo_type_kernel;
>        bp.resv =3D NULL;
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
> index 7715c0d..5e7fbbe 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -264,7 +264,7 @@ static int psp_tmr_init(struct psp_context *psp)
>
>        ret =3D amdgpu_bo_create_kernel(psp->adev, tmr_size, PSP_TMR_SIZE,
>                                      AMDGPU_GEM_DOMAIN_VRAM,
> -                                   &psp->tmr_bo, &psp->tmr_mc_addr, &psp=
->tmr_buf);
> +                                   &psp->tmr_bo, &psp->tmr_mc_addr, NULL=
);
>
>        return ret;
>   }
> @@ -1215,7 +1215,7 @@ static int psp_hw_fini(void *handle)
>
>        psp_ring_destroy(psp, PSP_RING_TYPE__KM);
>
> -     amdgpu_bo_free_kernel(&psp->tmr_bo, &psp->tmr_mc_addr, &psp->tmr_bu=
f);
> +     amdgpu_bo_free_kernel(&psp->tmr_bo, &psp->tmr_mc_addr, NULL);
>        amdgpu_bo_free_kernel(&psp->fw_pri_bo,
>                              &psp->fw_pri_mc_addr, &psp->fw_pri_buf);
>        amdgpu_bo_free_kernel(&psp->fence_buf_bo,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.h
> index 0029fa2..48b057d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h
> @@ -172,7 +172,6 @@ struct psp_context
>        /* tmr buffer */
>        struct amdgpu_bo                *tmr_bo;
>        uint64_t                        tmr_mc_addr;
> -     void                            *tmr_buf;
>
>        /* asd firmware and buffer */
>        const struct firmware           *asd_fw;


--_000_MN2PR12MB2974D98262E42F1C6FB6644A95A80MN2PR12MB2974namp_
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
Thanks very much Christian!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I scanned the whole code, only two functions pass in NULL cpu_addr,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
amdgpu_ttm_init() and gfx_v9_0_ngg_create_buf(),</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
but the related BOs are not further mapped for cpu access.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
so I think this change is safe.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Monday, August 19, 2019 16:07<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Yuan, Xiaojie &lt;Xiaojie.=
Yuan@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram =
region</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 19.08.19 um 10:05 schrieb Tianci Yin:<br>
&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt;<br>
&gt; so that more visible vram can be available for umd.<br>
&gt;<br>
&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
<br>
Assuming that you checked that we don't have other users who are using <br>
amdgpu_bo_create_kernel() without a CPU pointer this patch is <br>
Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;.<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 5 &#43;&#43;&=
#43;--<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c&nbsp;&nbsp;&nbsp; =
| 4 &#43;&#43;--<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h&nbsp;&nbsp;&nbsp; =
| 1 -<br>
&gt;&nbsp;&nbsp; 3 files changed, 5 insertions(&#43;), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_object.c<br>
&gt; index 1059771..0476790 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c<br>
&gt; @@ -246,8 &#43;246,9 @@ int amdgpu_bo_create_reserved(struct amdgpu_de=
vice *adev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bp.size =3D size;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bp.byte_align =3D align;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bp.domain =3D domain;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; bp.flags =3D AMDGPU_GEM_CREATE_CPU_ACCESS_RE=
QUIRED |<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bp.flags =3D cpu_addr ? AMDGPU_GEM_CREAT=
E_CPU_ACCESS_REQUIRED<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; : AMDGPU_GEM_CREATE_NO_CPU_ACCESS;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bp.flags |=3D AMDGPU_GEM_CREATE_VRAM_CON=
TIGUOUS;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bp.type =3D ttm_bo_type_kern=
el;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bp.resv =3D NULL;<br>
&gt;&nbsp;&nbsp; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_psp.c<br>
&gt; index 7715c0d..5e7fbbe 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; @@ -264,7 &#43;264,7 @@ static int psp_tmr_init(struct psp_context *ps=
p)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_bo_create_ker=
nel(psp-&gt;adev, tmr_size, PSP_TMR_SIZE,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; AMDGPU_GEM_DOMAIN_VRAM,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;psp-&gt;t=
mr_bo, &amp;psp-&gt;tmr_mc_addr, &amp;psp-&gt;tmr_buf);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;psp-&=
gt;tmr_bo, &amp;psp-&gt;tmr_mc_addr, NULL);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp;&nbsp; }<br>
&gt; @@ -1215,7 &#43;1215,7 @@ static int psp_hw_fini(void *handle)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp_ring_destroy(psp, PSP_RI=
NG_TYPE__KM);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;psp-&gt;tmr_bo, &=
amp;psp-&gt;tmr_mc_addr, &amp;psp-&gt;tmr_buf);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;psp-&gt;tmr_b=
o, &amp;psp-&gt;tmr_mc_addr, NULL);<br>
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
&gt; index 0029fa2..48b057d 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h<br>
&gt; @@ -172,7 &#43;172,6 @@ struct psp_context<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* tmr buffer */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; *tmr_bo;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmr_mc_addr;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; void&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tmr_buf;<br>
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

--_000_MN2PR12MB2974D98262E42F1C6FB6644A95A80MN2PR12MB2974namp_--

--===============0057479078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0057479078==--

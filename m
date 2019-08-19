Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C2791E3A
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 09:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818E06E0AB;
	Mon, 19 Aug 2019 07:45:01 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800071.outbound.protection.outlook.com [40.107.80.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43D36E0AB
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 07:44:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DrdmBbwKHk7nrVkLR4VYrMJWEx6TWrF0OZ7CNJzaTtiQM9xDuxp4tP78QitQ4x37TDo8BqZzvQhWUKWbX+0WEbP76iseA5Xf/kkn5pW+AdVjyclvwYMDpkko2GQa7wnNVFL4KkNv3p7//arMEcKQggp6Zswu+zfS2rK3fKI4WdLgSVDg3tdJb1z+ZhuRB512tNXfqaBh5W9iJlUA8llAKdXIWVJEqlJ+WHA/q8rAOX3UCYA1dJ6X6EL9r0sKAOrXgs3YlzxqgN21yxI93fRd7UEDPdcun3Jj5m25Rdx1UU7VEFiugHMzrEqrbbQRgVMs4hY+RB5fWjtETEy46FmCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL36cbnIYaZ/DVzAB6lMwVSGtV3wG4x/PUn2HSIRQnQ=;
 b=mpZCXeSwVAdndq6MlMHVEGeOdqGPDk9k8sHFrmmm3XZ9QwUniMf+Kyre5c7rNWONGvq/kmdw89xxZDEa8mAlkr7GYav9CdbAKT9dfBZ58ghutKIxTtY+77v5eoTkZ2xq02a41AyziUxIbVHjfYYbhSKmiUvUC9ua8b23s/mWVnJfoDx/n9D+Gey2y2AvtI/tfuLNzYeNqpNKR5nUPgQuIhDBZeJfNEUAtXUxofbt6aaHkHUI8383bib3aNjXqJmqmaLmQSlL+PUrMAZu0TOVF48krbfyBvlz8imJ49FbWYbshBoFrEAtIAFYlWIh05sC/YWqQl+ZwWUMSdRRUJqdvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB2974.namprd12.prod.outlook.com (20.178.240.140) by
 MN2PR12MB3069.namprd12.prod.outlook.com (20.178.241.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 07:44:58 +0000
Received: from MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::1c46:b908:71b2:79a3]) by MN2PR12MB2974.namprd12.prod.outlook.com
 ([fe80::1c46:b908:71b2:79a3%6]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 07:44:58 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
Thread-Topic: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region
Thread-Index: AQHVVmCj7xZ8VztL802nx+SZqJbxDqcCFbqAgAABRFc=
Date: Mon, 19 Aug 2019 07:44:58 +0000
Message-ID: <MN2PR12MB29745B6EEA52C71B59EBD47C95A80@MN2PR12MB2974.namprd12.prod.outlook.com>
References: <1566200092-17283-1-git-send-email-tianci.yin@amd.com>,
 <8f923347-6255-c663-03fd-fe77aa4e3eff@gmail.com>
In-Reply-To: <8f923347-6255-c663-03fd-fe77aa4e3eff@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3330a8eb-d840-43f7-8ca1-08d724792253
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3069; 
x-ms-traffictypediagnostic: MN2PR12MB3069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3069C16308DB20EE48AA4D7A95A80@MN2PR12MB3069.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(6636002)(229853002)(4326008)(6436002)(81156014)(81166006)(8936002)(25786009)(54896002)(14454004)(55016002)(9686003)(7696005)(8676002)(6246003)(478600001)(53936002)(76176011)(7736002)(2906002)(74316002)(99286004)(316002)(54906003)(110136005)(66066001)(86362001)(71190400001)(3846002)(33656002)(6116002)(14444005)(256004)(186003)(66574012)(71200400001)(486006)(5660300002)(476003)(6506007)(53546011)(26005)(102836004)(64756008)(66446008)(105004)(11346002)(76116006)(66946007)(66556008)(66476007)(446003)(2501003)(52536014)(19627405001)(91956017);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3069;
 H:MN2PR12MB2974.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x6VvJq8ZSLQ3Uvtu7XxzploS/VW0TcJGUwqiBPmXq/dnP4O3Fuvrmqpt0glOsxjWMgIr6o/Wg7sltudSEupcQV9ZRvm78vn5IqkQXOzutAmlEFwzKW6E3nsU0A4jCjjLVoKUPAS4dpv16dUicLxFb/5Nf69gybcw6ycAQBcOK+hDV7EH6rX1PzBG1QV6X4RVi3c2/d0BcqzOGQGWbzusr7N6w7Ds6/MNy7wKQxWPa5E4Z4+qgjVOq7PTGxWuQzDRZImc9zV0thQVw2x3V6RxkeMj+AcnOoMHJeprQFDhhm5A54JUakxlFttEmBKQst7R5noCs5LRgt8voxCtjjbjdG2g21NMRKYWbnSnRQHBJd8nOTQzTbOru9wLcszHVETm6W7RCxHM4j9OdXjRmq4daTLVdCa91scqLkL2H0rnBF0=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3330a8eb-d840-43f7-8ca1-08d724792253
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 07:44:58.1158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KNa/bZSL8jLhJb3wAOJkXQcquvuAUMuRVJYDFjZfMotfFn1Gq5MV6ze7OiUZ/USo1bH8otMG0XtO/xCz029NTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3069
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL36cbnIYaZ/DVzAB6lMwVSGtV3wG4x/PUn2HSIRQnQ=;
 b=g81mBdqWIDh/499yuSOv0kYUrku2c9mP6UAYNZhSbUhKPQgnXFpfZg5UGIF7QCr4/2duZWEPPv3DLXZ3DH65U5qpyZPGcjqrrCPNzWz1cYKuG0ZoNKugz9hetXB7qtezPajjXQz3KY5F0NMea55Q8O54HmZ/jQvVliC9vO3D+lo=
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
Content-Type: multipart/mixed; boundary="===============0874955065=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0874955065==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB29745B6EEA52C71B59EBD47C95A80MN2PR12MB2974namp_"

--_000_MN2PR12MB29745B6EEA52C71B59EBD47C95A80MN2PR12MB2974namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Christian, I'll improve the coding style.
________________________________
From: Christian K?nig <ckoenig.leichtzumerken@gmail.com>
Sent: Monday, August 19, 2019 15:39
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Xiao, Jack <Jack.Xiao@amd.com>; Yuan, Xiaojie <Xiaojie.Yuan@amd.com>; Z=
hang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: move TMR to cpu invisible vram region

Am 19.08.19 um 09:34 schrieb Tianci Yin:
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> so that more visible vram can be available for ocl applications.
>
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 5 +++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c    | 4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h    | 1 -
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index 1059771..ca35869 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -246,8 +246,9 @@ int amdgpu_bo_create_reserved(struct amdgpu_device *a=
dev,
>        bp.size =3D size;
>        bp.byte_align =3D align;
>        bp.domain =3D domain;
> -     bp.flags =3D AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED |
> -             AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
> +     bp.flags =3D (cpu_addr)?AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED
> +             :AMDGPU_GEM_CREATE_NO_CPU_ACCESS;

Coding style: You can drop the "()",  but there should be spaces before
and after the "?" and ":".

And please double check that this change doesn't affect any other user
of amdgpu_bo_create_kernel()/amdgpu_bo_create_reserved().

Apart from that looks good to me and is a nice improvement,
Christian.

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


--_000_MN2PR12MB29745B6EEA52C71B59EBD47C95A80MN2PR12MB2974namp_
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
Thanks Christian, I'll improve the coding style.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K&ouml;nig =
&lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Monday, August 19, 2019 15:39<br>
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
<div class=3D"PlainText">Am 19.08.19 um 09:34 schrieb Tianci Yin:<br>
&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt;<br>
&gt; so that more visible vram can be available for ocl applications.<br>
&gt;<br>
&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
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
&gt; index 1059771..ca35869 100644<br>
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
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; bp.flags =3D (cpu_addr)?AMDGPU_GEM_CREAT=
E_CPU_ACCESS_REQUIRED<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; :AMDGPU_GEM_CREATE_NO_CPU_ACCESS;<br>
<br>
Coding style: You can drop the &quot;()&quot;,&nbsp; but there should be sp=
aces before <br>
and after the &quot;?&quot; and &quot;:&quot;.<br>
<br>
And please double check that this change doesn't affect any other user <br>
of amdgpu_bo_create_kernel()/amdgpu_bo_create_reserved().<br>
<br>
Apart from that looks good to me and is a nice improvement,<br>
Christian.<br>
<br>
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

--_000_MN2PR12MB29745B6EEA52C71B59EBD47C95A80MN2PR12MB2974namp_--

--===============0874955065==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0874955065==--

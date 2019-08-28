Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C2A0074
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 13:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AADD89815;
	Wed, 28 Aug 2019 11:05:52 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740089.outbound.protection.outlook.com [40.107.74.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBFB89815
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 11:05:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8CV9JGy05dfETHgI9QFuj5KzDnYEYpVa4zeYF0JR/VDgO9KMUi5/JAoBPLeLxGgkxyRmieayZBkGqK7DVb5/LP3ZrxK29too44728VX1eE4E6oa3XN9b6n59kCrAvQ64weHMce5A9SaVD6UfowtkGqNrKEX+3CH/GsivktnPM2Csedu5p5n5O5DWNpnRqHTa5FyPE/SAHFsViVdzdt7XCEFngnJEgoMvmBXdPMGPSJ9Q1y0tkjtud3Ytn+HVB+R8vuiznpAInZ4BRGUBXw4fmVejdAwj16u2nOa3LsbBgPS+G19HXWxdHCIwVfWwciyRwxfphKm1z473ktahYgkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s+7vwLJFxaVLfVY8liapBoB7dhwEHG3Bq00lIwQn5E=;
 b=MkTKh88ojTflhJe90ta2UVqdSNINOQgH2OjFFz4jU9CRmp5NaSufw6aQckk3kXuLfflN3CURHW0/UwgFfEafALkdqBoRvI7dPlKpYBvpHd7tA9iOxb8vfYSmqrKfDvjI5Bf31ys3IXB1sUJ57jg502nFeIeoDnmGuWReC0mYw+dQ4zZfJVt1XetWe9mbsI9bY/DLWITEQg2GNNBrHh/I+/5iNLjIGYdhUmeCQAZmcRvp2mC4V9GnIsIhAS9dmF6UwT/3XBBJ+2F/lb3j75LtnFucHJhGz4rv3I/pkyRp29hBjADwT2mEJgmOT29GP67pBaqt+s0hgCGJURYzowk83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1593.namprd12.prod.outlook.com (10.172.40.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Wed, 28 Aug 2019 11:05:49 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 11:05:49 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Topic: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Index: AQHVXYKRMbQy1E3cckynw5Xqd+AOmKcQUwkAgAASBDU=
Date: Wed, 28 Aug 2019 11:05:48 +0000
Message-ID: <DM5PR12MB2535E067922B65112BEECCFA95A30@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <1566984335-14830-1-git-send-email-tianci.yin@amd.com>,
 <45fe6586-a53a-6f02-0e5f-b6224b159e12@gmail.com>
In-Reply-To: <45fe6586-a53a-6f02-0e5f-b6224b159e12@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 105712ec-a90b-4d57-82b6-08d72ba7aef7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1593; 
x-ms-traffictypediagnostic: DM5PR12MB1593:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB15934C47236B7AEE3D92B15895A30@DM5PR12MB1593.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(199004)(189003)(6246003)(8936002)(2906002)(91956017)(53546011)(186003)(25786009)(7696005)(53936002)(4326008)(6506007)(74316002)(102836004)(26005)(446003)(9686003)(11346002)(229853002)(55016002)(54896002)(19627405001)(14454004)(105004)(66066001)(6436002)(76176011)(66446008)(86362001)(71200400001)(52536014)(478600001)(76116006)(81156014)(7736002)(99286004)(81166006)(66556008)(64756008)(54906003)(66574012)(5660300002)(2501003)(8676002)(6636002)(14444005)(256004)(3846002)(6116002)(33656002)(316002)(110136005)(66946007)(71190400001)(66476007)(486006)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1593;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Pu55+WevX1O+6QCiOGAwGv8SYqEH+0betN/CWWM72ivZaUUhwUphcy1Oq+cyvcdSjpJEm0x/QcvsI24USpzik3tLfNnp3YcQ+pL16xb2qNsLhTvc+KYSRSV1aLhRVLQz7tTlag+W2zXDKddwU7YgVrFE6wHr0OewKsBoP/6PHxj3vKUlRyfY6bXZ7deNzmFrP4IeNZuymxHMX/ABUKye2MPV7MHtGlO9W01hj+cXWoTZwQxEIIOy24vREKhVT4pFM2vQCqC4s1ZS0fRM3iKsfu+weEv/Mr0sUgU8vdELko6WVUQMrezuXhzOXMaqmbpTY5zsQJHMd/TyYElPKDcdXdpnuXCXPM2EtBMSOYc5beFuTsvWMRM1p/GJHU6qNRP0+MhTykKGxg5npYFvFsGfuxe7/7c1qpaIi9KGR9uqKIM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 105712ec-a90b-4d57-82b6-08d72ba7aef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 11:05:48.9504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LxjtjDO49pLCRIqI27XgHi73vEIiFIxHPSriuHsE9k7BG30969k639kQD4qr6Ctj5udPptV65uDR3Fi8sCAvAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1593
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s+7vwLJFxaVLfVY8liapBoB7dhwEHG3Bq00lIwQn5E=;
 b=hGHVePc9HP6I1WYCOTS36ftaIzwLSndW5jCMmETq24iXaXYmLFYnpCsIxVYwOJFPMQ5a7+I+joLrW7fZOAv/Efr+gXzLvLEXMrCQ8BOIvRJwXZSZqgI/KjVBmwTh52ltBQ9OhPu2BbGcke3lQXYor4FN9Zackmu74F9oXRS63x0=
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
Content-Type: multipart/mixed; boundary="===============0711923865=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0711923865==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2535E067922B65112BEECCFA95A30DM5PR12MB2535namp_"

--_000_DM5PR12MB2535E067922B65112BEECCFA95A30DM5PR12MB2535namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Might be better to use a local variable for the CPU pointer instead of
duplicating the calling parameters.

Local variable can't be used in cleaner.



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


--_000_DM5PR12MB2535E067922B65112BEECCFA95A30DM5PR12MB2535namp_
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
<blockquote style=3D"border-color: rgb(200, 200, 200); border-left: 3px sol=
id rgb(200, 200, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(10=
2, 102, 102);">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); text-align: left;" dir=3D"ltr">
<font size=3D"2"><span style=3D"font-size:11pt">Might be better to use a lo=
cal variable for the CPU pointer instead of
<br>
</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); text-align: left;" dir=3D"ltr">
<font size=3D"2"><span style=3D"font-size:11pt">duplicating the calling par=
ameters.</span></font></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); text-align: left;" dir=3D"ltr">
<br>
</div>
</blockquote>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); text-align: left;" dir=3D"ltr">
Local variable can't be used in cleaner.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); text-align: left;" dir=3D"ltr">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); text-align: left;" dir=3D"ltr">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); text-align: left;" dir=3D"ltr">
<br>
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

--_000_DM5PR12MB2535E067922B65112BEECCFA95A30DM5PR12MB2535namp_--

--===============0711923865==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0711923865==--

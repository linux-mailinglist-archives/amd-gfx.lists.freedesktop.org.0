Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228FA0FCF
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 05:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D968922E;
	Thu, 29 Aug 2019 03:09:55 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690080.outbound.protection.outlook.com [40.107.69.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185478921E
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 03:09:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPBCF98ne/fF9Z2mEcp9u2Jat95gVTLstZCD7SfLFSjduo/2y9zDCnS5uzd6HBkHjsN+jtUSO9qIlXQNGS0/D0FoTGS2qMRdEcdHleWKnWmj3zIhWKqcbi4b39Bef5z0VZlRAa4JMXw7G1dijKzUvFe/ziVTc9EwSxDdu9LR67epzWB7ObzetAuHYIIQdzV8kOXdWNoBl6H4KkqlFABw5Hx0LfLQ/rExuH10CdqkFrSeVutb0KlX7ZZCybD7wDd0L4Z945NR3fafZze93hIoS83t6DaeWY5eLMyCn7VI4RqPNcpRwTecXXjxk0WRFdxYJG89suMNMWs4oK1VO+2BDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rxOLt7/GF03R68tLoOVjjWgLQH+OADMqoN120zYIIc=;
 b=Hili8NqigDMavfUi72V+GrVemeIvAsCp5xVSTsMZW9mNUctrY+kPKr1DMOWAVtwsN8mbGpTJgy6CKxmRcHZpGabdS66GyLnY3u7OnrZh92wlQqkWmMEpH6WC0qU+T1uPaK5fCIrKi1K8G5qg0H7wQsb+KMNelSvTyjzk5meHL/LfsguaMfBY7jVx/iGPYrjsqgvJd50R3JlRkaB1FZmB46LJfcB+7HXnbt1vaWVw3Tj+f34bMs8InhFLeu321RrYeGMkkYhq4TLivD9xYtg9CC9v6zbLUQbyFk/6u+w45DCY6xyFYh3Ib9SNMumdpqxMLq0qvgcr8XUPknU34Bhw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1897.namprd12.prod.outlook.com (10.175.91.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 29 Aug 2019 03:09:52 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 03:09:52 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu/psp: keep TMR in visible vram region for
 SRIOV
Thread-Topic: [PATCH 1/2] drm/amdgpu/psp: keep TMR in visible vram region for
 SRIOV
Thread-Index: AQHVXZVrmWYNs2+bokWD4UhgK3elW6cQiIeAgADpm3g=
Date: Thu, 29 Aug 2019 03:09:51 +0000
Message-ID: <DM5PR12MB2535CFD460B7C2DF918240B695A20@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <1566992421-30581-1-git-send-email-tianci.yin@amd.com>,
 <9d0b1959-f209-1bf3-e2a0-aabe4bd25f1b@gmail.com>
In-Reply-To: <9d0b1959-f209-1bf3-e2a0-aabe4bd25f1b@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8f95a91-3fae-4d40-aafa-08d72c2e5c11
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1897; 
x-ms-traffictypediagnostic: DM5PR12MB1897:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB18971E7787BBF30FA54E41BB95A20@DM5PR12MB1897.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(199004)(189003)(76116006)(53546011)(6246003)(476003)(316002)(71200400001)(71190400001)(74316002)(66556008)(5660300002)(14444005)(186003)(76176011)(9686003)(99286004)(14454004)(4326008)(52536014)(102836004)(7736002)(3846002)(7696005)(446003)(6506007)(33656002)(8676002)(2501003)(105004)(81166006)(81156014)(54906003)(8936002)(26005)(11346002)(66946007)(91956017)(25786009)(256004)(6636002)(86362001)(478600001)(19627405001)(66446008)(6116002)(6436002)(66574012)(110136005)(229853002)(66066001)(53936002)(64756008)(55016002)(2906002)(486006)(54896002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1897;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ImgOp4gFxkTPHVqZjypWI3xdrfTehTE/576/XaLIq6M+ebPLQANksFz3fRfvAqlfzVUfHJgmcKERtEliIwzCXO2hSihFvBBCbKPHcgr6K3/snUrpV3y5aIYFPwlO/Azm3gJqL+uoCwN/784jomJ3ks++xtD+U/8XelGIlXuvDoE2TxJMzPuWRA1uPU8UucTaMZx9wcCtYxGic7VVWH7viZD3Xs40S+OzsNj+oTjaCxpGPn0jYQHX0b8XWCYMOxU7Fy+NcV+n3MT5JtCknJE+tfvwJgHxs1t1681U7pfoHWUs54jJ5wl5NkXzKe3OUdUqfQFA8oB4n84ELXCCvFbU9+FQBFawMOEpPUzuyxr9IreNqIV0hyRFb/qsE3leJobIE2UO8NVvORKD1GA9b/cwVaQxKd6l2NH+0eW8P8zxYew=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f95a91-3fae-4d40-aafa-08d72c2e5c11
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 03:09:51.9135 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5KLIGPe8pxpk+xGZUbX5/5G06PalZpIS3K2WUQXbUDjzgWmr7xNFGXneDLBSGY0GUuj0SZtw5LXVeqBRWMuk6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1897
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rxOLt7/GF03R68tLoOVjjWgLQH+OADMqoN120zYIIc=;
 b=NvGZxijxH126WP/O1MrJXiY84eIyQoufUbKZ+dupLBAW873MyDR4xGawxoLpOgXBYoYSUSg+l/Hf+fE8gAiTrk6XhvPa+6LqvPGFK+skhunxyUH2oeudviyo8yENYbWIaqYySfpHU52nDkfaVVFVPy7LgvrbO3myrUWHS3HbyI4=
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
Content-Type: multipart/mixed; boundary="===============1667095377=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1667095377==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2535CFD460B7C2DF918240B695A20DM5PR12MB2535namp_"

--_000_DM5PR12MB2535CFD460B7C2DF918240B695A20DM5PR12MB2535namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

Thank you very much for your suggestions!

A little more improvement have made about the patch1, please review again.

BTW, any suggestion about the patch2?

Rico
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Wednesday, August 28, 2019 21:09
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Xu, Feifei <Feifei.Xu@amd.com>; Ma, Le <Le.Ma@amd.com>; Xiao, Jack <Jac=
k.Xiao@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH 1/2] drm/amdgpu/psp: keep TMR in visible vram region fo=
r SRIOV

Am 28.08.19 um 13:40 schrieb Tianci Yin:
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> Fix compute ring test failure in sriov scenario.
>
> Change-Id: I141d3d094e2cba9bcf2f6c96f4d8c4ef43c421c3
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com> for both patches.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_psp.c
> index 9f7cc5b..43fa8b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -239,6 +239,7 @@ static int psp_tmr_init(struct psp_context *psp)
>   {
>        int ret;
>        int tmr_size;
> +     void *tmr_buf;
>
>        /*
>         * According to HW engineer, they prefer the TMR address be "natur=
ally
> @@ -261,9 +262,14 @@ static int psp_tmr_init(struct psp_context *psp)
>                }
>        }
>
> -     ret =3D amdgpu_bo_create_kernel(psp->adev, tmr_size, PSP_TMR_SIZE,
> -                                   AMDGPU_GEM_DOMAIN_VRAM,
> -                                   &psp->tmr_bo, &psp->tmr_mc_addr, NULL=
);
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
dr, &tmr_buf);
>
>        return ret;
>   }
> @@ -1206,6 +1212,7 @@ static int psp_hw_fini(void *handle)
>   {
>        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
>        struct psp_context *psp =3D &adev->psp;
> +     void *tmr_buf;
>
>        if (adev->gmc.xgmi.num_physical_nodes > 1 &&
>            psp->xgmi_context.initialized =3D=3D 1)
> @@ -1216,7 +1223,7 @@ static int psp_hw_fini(void *handle)
>
>        psp_ring_destroy(psp, PSP_RING_TYPE__KM);
>
> -     amdgpu_bo_free_kernel(&psp->tmr_bo, &psp->tmr_mc_addr, NULL);
> +     amdgpu_bo_free_kernel(&psp->tmr_bo, &psp->tmr_mc_addr, &tmr_buf);
>        amdgpu_bo_free_kernel(&psp->fw_pri_bo,
>                              &psp->fw_pri_mc_addr, &psp->fw_pri_buf);
>        amdgpu_bo_free_kernel(&psp->fence_buf_bo,


--_000_DM5PR12MB2535CFD460B7C2DF918240B695A20DM5PR12MB2535namp_
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
Hi Christian,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you very much for your suggestions!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
A little more improvement have made about the patch1, please review again.<=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
BTW, any suggestion about the patch2?</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, August 28, 2019 21:09<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Ma, Le &lt;Le.Ma@amd.com&g=
t;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@=
amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/2] drm/amdgpu/psp: keep TMR in visible vram re=
gion for SRIOV</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 28.08.19 um 13:40 schrieb Tianci Yin:<br>
&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt;<br>
&gt; Fix compute ring test failure in sriov scenario.<br>
&gt;<br>
&gt; Change-Id: I141d3d094e2cba9bcf2f6c96f4d8c4ef43c421c3<br>
&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
<br>
Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt; for both pa=
tches.<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 15 &#43;&#43;&#4=
3;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;----<br>
&gt;&nbsp;&nbsp; 1 file changed, 11 insertions(&#43;), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_psp.c<br>
&gt; index 9f7cc5b..43fa8b7 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c<br>
&gt; @@ -239,6 &#43;239,7 @@ static int psp_tmr_init(struct psp_context *ps=
p)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int tmr_size;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *tmr_buf;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * According to HW engi=
neer, they prefer the TMR address be &quot;naturally<br>
&gt; @@ -261,9 &#43;262,14 @@ static int psp_tmr_init(struct psp_context *p=
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
_mc_addr, &amp;tmr_buf);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt;&nbsp;&nbsp; }<br>
&gt; @@ -1206,6 &#43;1212,7 @@ static int psp_hw_fini(void *handle)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =
=3D (struct amdgpu_device *)handle;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct psp_context *psp =3D =
&amp;adev-&gt;psp;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *tmr_buf;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;gmc.xgmi.num_ph=
ysical_nodes &gt; 1 &amp;&amp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp-=
&gt;xgmi_context.initialized =3D=3D 1)<br>
&gt; @@ -1216,7 &#43;1223,7 @@ static int psp_hw_fini(void *handle)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; psp_ring_destroy(psp, PSP_RI=
NG_TYPE__KM);<br>
&gt;&nbsp;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;psp-&gt;tmr_bo, &=
amp;psp-&gt;tmr_mc_addr, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;psp-&gt;tmr_b=
o, &amp;psp-&gt;tmr_mc_addr, &amp;tmr_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;p=
sp-&gt;fw_pri_bo,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;psp-&gt;fw_pri_mc_addr, &amp;psp-&gt;fw_p=
ri_buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;p=
sp-&gt;fence_buf_bo,<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM5PR12MB2535CFD460B7C2DF918240B695A20DM5PR12MB2535namp_--

--===============1667095377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1667095377==--

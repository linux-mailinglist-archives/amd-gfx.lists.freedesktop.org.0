Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C96A00E8
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 13:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1336389A1F;
	Wed, 28 Aug 2019 11:44:12 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820078.outbound.protection.outlook.com [40.107.82.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17FD89A1F
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 11:44:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2OMuAEcOOFokp+3tvyFJyk/eYvCku5IKeeNos/URugH3afIpB7vJuI/Plmdnt8Acx/QkVprNShCLfuodet2EDln021z62lAZYVoU9KiMBak/VB7kYoFO4J60svhVAVxUDHRn/VBpG/eUkO0AXE3/3eQIUKY8a8gbTXLLLpyQOv99QMt7SlN5PG5AmWCJ4lTqbd9+av75pUOO4sXajQdFx+psgN8v700p1EzVODS9nNsqo5D46khr2EFELfpo4ycggTjfa95RuKG18VHa05yspEcm+sDnMmbl/SBT8NJX+50tQchg7gzQJVgtvynx03Lglq27SrNRGwKFuuGxI+ppA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntJmbYZ2+QDMPwpXXyZVgEGiaGn9R83SL0YdeYSAEOg=;
 b=II+vw7bvZSzbqzxKm7+VxcUCr3bJjm/hn5j4jwnHy2DWCVJVTYE8CO6Qa+Ez3+YsEPi/ZDEndc5JT9PXNOz+MDalCpkzRJkF73cG7bvX9nKjvn+/LvvxBbGx7SvCXD8fpLlTFItMBLNrIj9xQwBC8CuqMCDnpBX7Z6tpiItKoslyed2K3Dwue1sD8s4oUYWSUFuc3W2AaCzVSkBhPJJtP18ICQ/s6kUnBoaFE4uAc95v4TiYlThi3aV+bMYQTieZUJ2x5us/V2SmjAgpqfyGFVduxjRdaZIPHoQDK3WaCb2U3mf7CeqX1gm1QEsvgsFgWcvxYXzS1wN5HgW62m7PwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1578.namprd12.prod.outlook.com (10.172.39.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 28 Aug 2019 11:44:08 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 11:44:08 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Topic: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Index: AQHVXYKRMbQy1E3cckynw5Xqd+AOmKcQUwkAgAASBDWAAAHZvYAACOMa
Date: Wed, 28 Aug 2019 11:44:08 +0000
Message-ID: <DM5PR12MB25358B6465DBA39388482A1995A30@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <1566984335-14830-1-git-send-email-tianci.yin@amd.com>,
 <45fe6586-a53a-6f02-0e5f-b6224b159e12@gmail.com>,
 <DM5PR12MB2535E067922B65112BEECCFA95A30@DM5PR12MB2535.namprd12.prod.outlook.com>,
 <85324125-c6dd-4f93-807f-04ff0ee7c815@email.android.com>
In-Reply-To: <85324125-c6dd-4f93-807f-04ff0ee7c815@email.android.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 434b51c0-d7c5-4adc-f0eb-08d72bad0959
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1578; 
x-ms-traffictypediagnostic: DM5PR12MB1578:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1578B7C4A1566325EB62FB4D95A30@DM5PR12MB1578.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(136003)(39860400002)(396003)(376002)(199004)(189003)(53546011)(486006)(99286004)(54906003)(26005)(71200400001)(256004)(7696005)(76176011)(74316002)(2906002)(14444005)(316002)(81166006)(86362001)(25786009)(66556008)(66066001)(76116006)(6506007)(54896002)(4326008)(476003)(8936002)(5660300002)(66946007)(8676002)(64756008)(66446008)(66476007)(3846002)(446003)(6116002)(186003)(71190400001)(91956017)(6246003)(478600001)(52536014)(102836004)(229853002)(7736002)(105004)(6436002)(14454004)(33656002)(81156014)(66574012)(19627405001)(6636002)(6862004)(53936002)(9686003)(11346002)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1578;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rXiM87FtFivSrttgoFlIaJlraO6vZ0D0rvaIxP/ZgMIraLHUr4FsMCAnJ49A+a+Rk89/bOM+ZxWn/mBsXjyGPDRRUp34nU0cJADBvWadpXsGS2dbl6mBZPPRv7uoVFdJeMVrf5h+SWf0dX2boO2lk+57+EGublYt1TobqzuJAqv7/tbElM9KPkRdj0cbEwVQW8ArA+puI8v5VFSQzeq8o8tHJZxboFrcOMY+PB1/g+7ary13VxaoGgLBLQDrhJTDdl0ll3dM5KZvp/oBNDfQBm7GlrToPuvJ1u590CBtN0DGnsJONiQ5PPYWGRa/X931lo+4yJbXbkRjV2vie9eJr3d3KKSr5vpOMqCtl8PcMgzv9H/dCX72/sQgJ5HOsWA6tz20IPQr3GnXCcEG7MyOQV53e1i/OL0yxceJR8vYJGY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 434b51c0-d7c5-4adc-f0eb-08d72bad0959
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 11:44:08.1021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: biMQG5OomYHPPBtLVOylpQ6ZtTkDH9Dxn1DtxRwhMY/q7j6o1SVw5IVFr7pJ45gYR1L6BtPuHtKfQcr8XQie5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1578
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ntJmbYZ2+QDMPwpXXyZVgEGiaGn9R83SL0YdeYSAEOg=;
 b=kluzuGZC6j28Un7VE4UCKWjMfPH3LGSvNWctfef66TmmH1yP6DJXJDJhKUa7yk85ilvE1eZ6yzUxfriefL4xYjt3NgKR6t/uwzTmgEQ/LEp+TMGJ1KtfdtqyOPgItmKsO72IJL0J5ZDf2o2+cB1lYwgQ2U87BjgRK11lLreHMYc=
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
 Hawking" <Hawking.Zhang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Ma,
 Le" <Le.Ma@amd.com>
Content-Type: multipart/mixed; boundary="===============1943334759=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1943334759==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB25358B6465DBA39388482A1995A30DM5PR12MB2535namp_"

--_000_DM5PR12MB25358B6465DBA39388482A1995A30DM5PR12MB2535namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I checked the code, cpu pointer indeed only used for checking.

Thanks for your suggestions!

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, August 28, 2019 19:08
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; Xu, Feif=
ei <Feifei.Xu@amd.com>; Ma, Le <Le.Ma@amd.com>; Xiao, Jack <Jack.Xiao@amd.c=
om>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SR=
IOV

That's irrelevant in this case. CPU mapping's are destroyed automatically w=
hen the BO is freed.

Giving the CPU pointer to the free function is only for extra checking that=
 we can't access it anymore.

Christian.

Am 28.08.2019 13:05 schrieb "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>:
Might be better to use a local variable for the CPU pointer instead of
duplicating the calling parameters.

Local variable can't be used in cleaner.



________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
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


--_000_DM5PR12MB25358B6465DBA39388482A1995A30DM5PR12MB2535namp_
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
I checked the code, cpu pointer indeed only used for checking.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for your suggestions!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, August 28, 2019 19:08<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Ma, Le &lt;Le.Ma@amd.com&gt;; Xi=
ao, Jack &lt;Jack.Xiao@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@amd.co=
m&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region=
 for SRIOV</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div dir=3D"auto">That's irrelevant in this case. CPU mapping's are destroy=
ed automatically when the BO is freed.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Giving the CPU pointer to the free function is only for e=
xtra checking that we can't access it anymore.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Christian.</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">Am 28.08.2019 13:05 schrieb &quot;Yin, Tianci =
(Rico)&quot; &lt;Tianci.Yin@amd.com&gt;:<br type=3D"attribution">
</div>
</div>
<div>
<blockquote style=3D"border-color:rgb(200,200,200); border-left:3px solid r=
gb(200,200,200); padding-left:1ex; margin-left:0.8ex; color:rgb(102,102,102=
)">
<div dir=3D"ltr" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:12pt; color:rgb(0,0,0); text-align:left">
<font size=3D"2"><span style=3D"font-size:11pt">Might be better to use a lo=
cal variable for the CPU pointer instead of
<br>
</span></font></div>
<div dir=3D"ltr" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:12pt; color:rgb(0,0,0); text-align:left">
<font size=3D"2"><span style=3D"font-size:11pt">duplicating the calling par=
ameters.</span></font></div>
<div dir=3D"ltr" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:12pt; color:rgb(0,0,0); text-align:left">
<br>
</div>
</blockquote>
<div dir=3D"ltr" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:12pt; color:rgb(0,0,0); text-align:left">
Local variable can't be used in cleaner.<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:12pt; color:rgb(0,0,0); text-align:left">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:12pt; color:rgb(0,0,0); text-align:left">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; f=
ont-size:12pt; color:rgb(0,0,0); text-align:left">
<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig &=
lt;ckoenig.leichtzumerken@gmail.com&gt;<br>
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
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Am 28.08.19 um 11:25 schrieb Tianci Yin:<br>
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
</div>
</div>
</body>
</html>

--_000_DM5PR12MB25358B6465DBA39388482A1995A30DM5PR12MB2535namp_--

--===============1943334759==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1943334759==--

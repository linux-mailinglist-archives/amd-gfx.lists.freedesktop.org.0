Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1C09FFD6
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 12:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDD889A56;
	Wed, 28 Aug 2019 10:28:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820082.outbound.protection.outlook.com [40.107.82.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A41689A61
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 10:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH6MkcZsWLMHdfGlLxfJruK6DV7bu1smAzgsJiTE7bR31WJpox0IsE2CUbXfFn9NCzojuldvmzeHJcIvGRAzjpg80NgNV0XyN//fyMnR7WxmAkoXs2VLfK2lRku53nlYhW238GoKsJ3Q2GS4apHWExGusMySNhBEujmYZ3djiLLBV7X3dQhhhH7SiQSOs+Rz9BZ/7SlNM46s0Q9M2ZAauEGRVDnD9yxovxior+qSziBVQIZw1IS0U2OoEM+kc4b/Xs+NXme6o1ryG2k0GFxKP+HmROqfzecY+ePFPsJKRmdb9nD9V0TimlKq0pVQA5mKjUZ1BBlZJDPh/4iOTa6xTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KO0ZvupUOzTIDEgkHYDeZ153CGMG6DUwmdS+tflKvDo=;
 b=Eae7vYEBqIyk+OGSrhw49dH6EKUB6gXJf4HzsibLehMiGegj8ojCScnNuHEgCkyroB121lELsa2tJ6AO+kh86NAPLSpGKCbgy4TSyR6XuQaaWPsZDM4Ti4+AvSXkByVlvMjaAXUAppdogXpSgN1RqEwopSBa1p5WDMhz3J2LIKN6KDrVl6kb5+9jDs/wZjgI1iGSlnDRRPoZa0pILuSLZjmOXpk7exRsgm8+N7l5hlvTvSCcXa/lXep0nxHiuBrbM2CTjXTbnX8W7DbJ5K5z53+jbaD/459gqq/Aj5BrNea8eWf64wCTA1cINHAoULOmY6mRxiESpPvm1QnJGa+ucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1818.namprd12.prod.outlook.com (10.175.92.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 10:28:28 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 10:28:28 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Topic: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Index: AQHVXYKRMbQy1E3cckynw5Xqd+AOmKcQUwkAgAAD6jqAAAP2gIAAAG+f
Date: Wed, 28 Aug 2019 10:28:28 +0000
Message-ID: <DM5PR12MB2535C0A8DC51328616CECEB695A30@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <1566984335-14830-1-git-send-email-tianci.yin@amd.com>
 <45fe6586-a53a-6f02-0e5f-b6224b159e12@gmail.com>
 <DM5PR12MB253547988B61E7D401C6FADC95A30@DM5PR12MB2535.namprd12.prod.outlook.com>,
 <fa875b9d-4bd6-8f6e-110e-19fa6115b254@amd.com>
In-Reply-To: <fa875b9d-4bd6-8f6e-110e-19fa6115b254@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9141a19-e32f-436e-289c-08d72ba27783
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1818; 
x-ms-traffictypediagnostic: DM5PR12MB1818:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1818D28C9AFA53C7FE36BBC195A30@DM5PR12MB1818.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(189003)(199004)(2501003)(54906003)(99286004)(8676002)(236005)(5660300002)(14444005)(256004)(316002)(478600001)(446003)(11346002)(6436002)(54896002)(86362001)(7696005)(476003)(81156014)(81166006)(9686003)(110136005)(7736002)(53936002)(66066001)(6246003)(8936002)(105004)(55016002)(2906002)(52536014)(91956017)(4326008)(53546011)(6506007)(102836004)(229853002)(486006)(76116006)(66446008)(74316002)(64756008)(66556008)(66476007)(66946007)(33656002)(3846002)(6116002)(66574012)(25786009)(71190400001)(26005)(14454004)(19627405001)(71200400001)(76176011)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1818;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T2QM8CQ7SdhcUHfFxKFIhcgQO6Wq1fJVAERlwH9xTDLfEMz3I5ZDvKS53ntLgt0xywgH8JxlFABTmcAthkhOsWbiLhK5iTxlSLo3Gcw9ibJBetmsHwvNYWgxmNDzJBzMMGCSzN8/vgNiVhl3mUbKtsql+GuXiGlWhCA1ct2T8RYe7WPe/aagVxg1DKPNFSQbqUwAvXj/QmVGYBySCJ8qKT3Eobc17827Y9rbkIyb9EmuVL3DMaYWJvPPVNptbzY5z3Gq80S7KKPcZ9S7soXAbAbgXxUHIDDX9YvpCuwBbZPPb8rKfhoONKfDzKwUm1wta1Xe6ZHMYy761Sx+zgpOYAJ9rixJs8m5Y0PbfOGhohsSQ4y6hRjvQgms4iZt10q8Zd9y/KBF9f3Jpl7ES8VwGYV+75Nti/bPAeRLKQm0xMg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9141a19-e32f-436e-289c-08d72ba27783
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 10:28:28.5095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mJ7CydY5vWm5CoGFqNual6qhx+hNjdl7tYB7srdgP2MkbWV8PhZb+kLsWYLefKyt5XgdtT3/sn+Rs7M1+ZArDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KO0ZvupUOzTIDEgkHYDeZ153CGMG6DUwmdS+tflKvDo=;
 b=alG27iy8+05AjV8TgItitKuGyn/VH/WTKXNcJ2lRBdq2VJYTxMKsgxtNa9x9WGhPm+wzQXJJxW0/apaTpcZ4+I2GTuycs2LxzHLvYRp3nJg49bK9YWGulCOJKaIhmkJDC8TJZ85eeqetVGVdrLcvnPZls2BDg62hY6Ci3pPlvns=
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
Content-Type: multipart/mixed; boundary="===============0141680360=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0141680360==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2535C0A8DC51328616CECEB695A30DM5PR12MB2535namp_"

--_000_DM5PR12MB2535C0A8DC51328616CECEB695A30DM5PR12MB2535namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Great! That's good idea!

Thanks!
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, August 28, 2019 18:25
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Xu, Feifei <Feifei.Xu@amd.com>; Ma, Le <Le.Ma@amd.com>; Xiao, Jack <Jac=
k.Xiao@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SR=
IOV

It seems we have to add a new parameter for amdgpu_bo_create_kernel() to pa=
ss the prefer region.

You can also just pass a cpu pointer to the function allocating the stolen_=
vga_memory.

That's probably less work to change all callers and cleaner in general.

Christian.

Am 28.08.19 um 12:21 schrieb Yin, Tianci (Rico):
Hi Christian,

I have just realized the stolen_vga_memory problem,
I have ever thought that no one really use the stolen_vga_memory BO in KMD =
code, so it should be safe.

It seems we have to add a new parameter for amdgpu_bo_create_kernel() to pa=
ss the prefer region.

Thanks!

Rico
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com><mailto:ckoenig.l=
eichtzumerken@gmail.com>
Sent: Wednesday, August 28, 2019 17:57
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com><mailto:Tianci.Yin@amd.com>; amd=
-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@l=
ists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Cc: Xu, Feifei <Feifei.Xu@amd.com><mailto:Feifei.Xu@amd.com>; Ma, Le <Le.Ma=
@amd.com><mailto:Le.Ma@amd.com>; Xiao, Jack <Jack.Xiao@amd.com><mailto:Jack=
.Xiao@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com><mailto:Hawking.Zhang=
@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SR=
IOV

Am 28.08.19 um 11:25 schrieb Tianci Yin:
> From: "Tianci.Yin" <tianci.yin@amd.com><mailto:tianci.yin@amd.com>
>
> Fix compute ring test failure in sriov scenario.
>
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com><mailto:tianci.yin@amd.com>
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



--_000_DM5PR12MB2535C0A8DC51328616CECEB695A30DM5PR12MB2535namp_
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
Great! That's good idea!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, August 28, 2019 18:25<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Ma, Le &lt;Le.Ma@amd.com&g=
t;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@=
amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region=
 for SRIOV</font>
<div>&nbsp;</div>
</div>
<div style=3D"background-color:#FFFFFF">
<div class=3D"x_moz-cite-prefix">
<blockquote type=3D"cite">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<font size=3D"2"><span style=3D"font-size:11pt"><span>It seems we have to a=
dd a new parameter for amdgpu_bo_create_kernel</span></span></font>() to pa=
ss the prefer region.<br>
</div>
</blockquote>
<br>
You can also just pass a cpu pointer to the function allocating the stolen_=
vga_memory.<br>
<br>
That's probably less work to change all callers and cleaner in general.<br>
<br>
Christian.<br>
<br>
Am 28.08.19 um 12:21 schrieb Yin, Tianci (Rico):<br>
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
Hi Christian,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I have just realized the <font size=3D"2"><span style=3D"font-size:11pt"><s=
pan>stolen_vga_memory</span></span></font> problem,
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
I have ever thought that no one really use the <font size=3D"2"><span style=
=3D"font-size:11pt"><span>stolen_vga_memory BO in KMD code, so it should be=
 safe.</span></span></font></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<font size=3D"2"><span style=3D"font-size:11pt"><span><br>
</span></span></font></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<font size=3D"2"><span style=3D"font-size:11pt"><span>It seems we have to a=
dd a new parameter for amdgpu_bo_create_kernel</span></span></font>() to pa=
ss the prefer region.<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks!</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Rico<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:ckoenig.leichtzumerken@=
gmail.com">
&lt;ckoenig.leichtzumerken@gmail.com&gt;</a><br>
<b>Sent:</b> Wednesday, August 28, 2019 17:57<br>
<b>To:</b> Yin, Tianci (Rico) <a class=3D"x_moz-txt-link-rfc2396E" href=3D"=
mailto:Tianci.Yin@amd.com">
&lt;Tianci.Yin@amd.com&gt;</a>; <a class=3D"x_moz-txt-link-abbreviated" hre=
f=3D"mailto:amd-gfx@lists.freedesktop.org">
amd-gfx@lists.freedesktop.org</a> <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:amd-gfx@lists.freedesktop.org">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Cc:</b> Xu, Feifei <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:F=
eifei.Xu@amd.com">
&lt;Feifei.Xu@amd.com&gt;</a>; Ma, Le <a class=3D"x_moz-txt-link-rfc2396E" =
href=3D"mailto:Le.Ma@amd.com">
&lt;Le.Ma@amd.com&gt;</a>; Xiao, Jack <a class=3D"x_moz-txt-link-rfc2396E" =
href=3D"mailto:Jack.Xiao@amd.com">
&lt;Jack.Xiao@amd.com&gt;</a>; Zhang, Hawking <a class=3D"x_moz-txt-link-rf=
c2396E" href=3D"mailto:Hawking.Zhang@amd.com">
&lt;Hawking.Zhang@amd.com&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region=
 for SRIOV</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Am 28.08.19 um 11:25 schrieb Tianci Yin:<br>
&gt; From: &quot;Tianci.Yin&quot; <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:tianci.yin@amd.com">
&lt;tianci.yin@amd.com&gt;</a><br>
&gt;<br>
&gt; Fix compute ring test failure in sriov scenario.<br>
&gt;<br>
&gt; Signed-off-by: Tianci.Yin <a class=3D"x_moz-txt-link-rfc2396E" href=3D=
"mailto:tianci.yin@amd.com">
&lt;tianci.yin@amd.com&gt;</a><br>
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
</blockquote>
<br>
</div>
</body>
</html>

--_000_DM5PR12MB2535C0A8DC51328616CECEB695A30DM5PR12MB2535namp_--

--===============0141680360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0141680360==--

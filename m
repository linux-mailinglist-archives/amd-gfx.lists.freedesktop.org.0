Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C1FA007B
	for <lists+amd-gfx@lfdr.de>; Wed, 28 Aug 2019 13:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8BA89815;
	Wed, 28 Aug 2019 11:08:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790049.outbound.protection.outlook.com [40.107.79.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9234C89815
 for <amd-gfx@lists.freedesktop.org>; Wed, 28 Aug 2019 11:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYdCLdoVU2f//A/qIXRNZE3j4NUAUxoMSD3dyp+csCi3g/qb8msAYN5cav5UjyVjjrEJhhTz9THvORSjlC/JDA2p4VMyEqjVeo2rewmqCwUJ/hIuYrANKi5QiIZej/itc4lCwin4W8+LvyoWbTuDGy4pq6eksZKgFtiJDY2Qe1Cu7pX+Bvb8/8dKLxq/wodsmz3y1jr+jQF/RG5pBsN+AUG0MEn4uM+lsMBFp8crR1zF5kX35BlQlkJzpprz/PFtJrUn1Wh46C/pyXFsAtt2rUvZe9WF4GXcgLVnBaNeGc5I7vksGnQR5n5h81EMXeOzIxKPHZ9UxRUErTbuWj/b8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKSCELwyKhKeJIn5YXzQJeV2tA0D/+phg/mybnSTwuI=;
 b=WbGvtHw97FbJGnWrP67jwWiV7Di++7WWny/znGmJ4PsncM4T4yYAP5Ueoa1rT8YlJ786S4AyBInfGwAVmzSfn2Nakp7y3UKR1nlYFCpxGa5TCP6UyxtKTxs/qb6RWudyoRdrZYbG8MhKAfEim4ld/ApcjNBcqdv/beLuTVwX1Vd53iz/vuKxbNKwszogGvfYK/wDE43Phz8oR9bWSF7FQQ1+I8mIs2z7VeXiSVNk12nP0SNqgQtK1clnv3As95oYFrK5yC9WpCK4SlLCLll0TLHVuEKGUiYRLKbf5G0e4E5mmwUSwcJmnLupX3S+OPnr87VqYDihvo0pbjxLq/Vfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2376.namprd12.prod.outlook.com (52.132.141.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 11:08:46 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 11:08:46 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
Subject: Re: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Topic: [PATCH] drm/amdgpu/psp: keep TMR in visible vram region for SRIOV
Thread-Index: AQHVXYKRMbQy1E3cckynw5Xqd+AOmKcQUwkAgAASBDWAAAHZvQ==
Date: Wed, 28 Aug 2019 11:08:45 +0000
Message-ID: <85324125-c6dd-4f93-807f-04ff0ee7c815@email.android.com>
References: <1566984335-14830-1-git-send-email-tianci.yin@amd.com>,
 <45fe6586-a53a-6f02-0e5f-b6224b159e12@gmail.com>,
 <DM5PR12MB2535E067922B65112BEECCFA95A30@DM5PR12MB2535.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2535E067922B65112BEECCFA95A30@DM5PR12MB2535.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2a02:908:1252:fb60:d541:6f85:76e2:184f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bbac82eb-5a80-4e31-5bff-08d72ba8186d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2376; 
x-ms-traffictypediagnostic: DM5PR12MB2376:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB2376AA190D33994B0777E28A83A30@DM5PR12MB2376.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(76176011)(86362001)(446003)(81156014)(11346002)(6486002)(476003)(102836004)(6506007)(53546011)(6636002)(81166006)(19627405001)(186003)(9686003)(31686004)(46003)(14454004)(8676002)(31696002)(6512007)(7736002)(486006)(99286004)(6436002)(229853002)(25786009)(53936002)(54906003)(64756008)(66446008)(71190400001)(66476007)(66556008)(71200400001)(6862004)(66946007)(4326008)(91956017)(478600001)(54896002)(76116006)(256004)(14444005)(66574012)(6116002)(5660300002)(6246003)(8936002)(2906002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2376;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Bo8+S7KnjkFd0FikMmWVdWin4LarCedBHdL+7Dcy3zCBMrwZEGNl8zacz1L04ycu/GXEIiF89kfCBE78Hdy/PpY/+l6fgG/h+Fj1KtEqNBzsPvf7GsfBC+NBDvF20CQegNG9b8CIEIMhUH7ueplQk5AOX2p3JEawRoRqmUaeFLB15HuXYYtNgynxF9HOL2aa2utHEtrXeINUwyoFCLJPHsXhTaqFvshf9qT+WYiXWkFBwxpIhk1cJwbDBPfhYfPIlYZdyUbXk8yR9ejFFEt2Hwj2eBRjZrJTY5Ltri7XxZWDu0l+hhe4XbxSAdHT5BY0XvWMD3KWn68E6R1Jzz8fJ1uFh9MGy+9qVtIit4fuCsAH2OGksopzNicDkwUMCGNroHlheJY5KqHtH9GeE1aRWk1v7FMqp0EvkfR5f4XMVVI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbac82eb-5a80-4e31-5bff-08d72ba8186d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 11:08:45.8155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fCA1oY5tfNczBWfiOGXkKLFOAcbbAIAUBifWFlvBLLwKuqI3I1ZbqGsWjl5a7V24
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2376
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKSCELwyKhKeJIn5YXzQJeV2tA0D/+phg/mybnSTwuI=;
 b=cPKwse1TuI8Q2ZyH8r1tL3KiuixFqKUmo11lrv2DBbr/gLqxV0FHy8q7rBdIySUvu+jcbKkMF2otF+1OEGGceuH3bMFGr0WeQF0JAVvEM3M5vhJA1jL6bf27cA7LvaBZ15gQ8j1AVa8On5hQ3XQ4UKRFSMSeEWLgIAiJ41Xp9ew=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1195708386=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1195708386==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_85324125c6dd4f93807f04ff0ee7c815emailandroidcom_"

--_000_85324125c6dd4f93807f04ff0ee7c815emailandroidcom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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


--_000_85324125c6dd4f93807f04ff0ee7c815emailandroidcom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta content=3D"text/html; charset=3Dus-ascii">
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
</head>
<body dir=3D"ltr">
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
<div class=3D"gmail_extra"><br>
<div class=3D"gmail_quote">Am 28.08.2019 13:05 schrieb &quot;Yin, Tianci (R=
ico)&quot; &lt;Tianci.Yin@amd.com&gt;:<br type=3D"attribution">
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
<div id=3D"appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
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
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
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
</div>
</body>
</html>

--_000_85324125c6dd4f93807f04ff0ee7c815emailandroidcom_--

--===============1195708386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1195708386==--

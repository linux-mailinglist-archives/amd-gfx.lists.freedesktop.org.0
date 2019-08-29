Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D254A127A
	for <lists+amd-gfx@lfdr.de>; Thu, 29 Aug 2019 09:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2631989FAD;
	Thu, 29 Aug 2019 07:20:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710054.outbound.protection.outlook.com [40.107.71.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC15289FAD
 for <amd-gfx@lists.freedesktop.org>; Thu, 29 Aug 2019 07:20:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VIi2HQ3wltYWt1M6Hl2luQ5/Mp/B3pQtrrqgPegYCIMVbMFkgooj8krcJoqjt7zWRxPaOgYKkbydrfvcrMzAPjYRFuVOe/xm2Brc669c8BbF6i93tg8TJp4il/xPzpneV0WfBp789LFtDmnABZ8u2/oJpHiWwqQlk6WAm3rzUhgjOvTX1y7q8myqKdFBj2Md4x8305/NkbbZWA/3S6PdIMPpPCFHSchVgtHaI+s0eDrRGnGdzzASKqgfYCLhEkMxbl6Nj/YcCzCKzi2GipHohZxPPgPnMxGyaqIRtGvafHaUfPBC/OjY3CnjhkQaIeEcI/YXiR1thvl2rC3jUFeHaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGkEtWtjaXMldudzhzh2JVJomOGeIx7d77peueIp4ew=;
 b=OkgcUVE+ZsRhXpk8HK+freHvJJOGIyFuQF683FEpi0mSt0GUoET5p5/Ii/6LgwJkmepO+DfN3he81z1gKHYVq02JkNCP+Q/u+/PnRsYL0E/wvwcDXpjo6nYj86GDsjf0gSW0fAk6N5aO3lTHCuG8eGsJo6zEmhvuxwvqOHVfbsxEN/yRTnfx/WywvzqJx57JAAUXSQUcYahjvPRnWjIz2/UlZrShFnlloBV+dPp0j0oWyv4yK7ukqEYWt7SHJDxLtsSkDievcLbxE5XNzLyw1oCOj9MAVXd7b2F5PCiEiqGrhUAIzxK64GjYd6UEMed7zb+5UJ1xaj+/eOlIhikJeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1721.namprd12.prod.outlook.com (10.175.88.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 07:20:02 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::e56c:45ad:7bdb:cd11%7]) with mapi id 15.20.2220.013; Thu, 29 Aug 2019
 07:20:02 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: keep the stolen memory in visible vram
 region
Thread-Topic: [PATCH 2/2] drm/amdgpu: keep the stolen memory in visible vram
 region
Thread-Index: AQHVXhaltl8lyLjHKkaBDvPCPU+gY6cRtkOAgAABt/c=
Date: Thu, 29 Aug 2019 07:20:02 +0000
Message-ID: <DM5PR12MB2535A0267ACFB40B0CECBE1895A20@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <1567047930-11912-1-git-send-email-tianci.yin@amd.com>
 <1567047930-11912-2-git-send-email-tianci.yin@amd.com>,
 <5e5b0214-0e50-1a6d-f7f2-54317e5767c4@gmail.com>
In-Reply-To: <5e5b0214-0e50-1a6d-f7f2-54317e5767c4@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51ed1de9-7fc0-4a78-ba6a-08d72c514ee7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1721; 
x-ms-traffictypediagnostic: DM5PR12MB1721:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1721CA189ECD301D2261119495A20@DM5PR12MB1721.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(199004)(189003)(66066001)(26005)(14444005)(8936002)(102836004)(81156014)(81166006)(6436002)(14454004)(8676002)(6506007)(54906003)(186003)(76176011)(52536014)(33656002)(6246003)(110136005)(66574012)(74316002)(99286004)(316002)(7696005)(7736002)(229853002)(86362001)(53546011)(446003)(11346002)(66556008)(6636002)(25786009)(486006)(256004)(76116006)(66476007)(64756008)(91956017)(71200400001)(66446008)(66946007)(55016002)(9686003)(4326008)(478600001)(2906002)(6116002)(476003)(3846002)(53936002)(54896002)(5660300002)(19627405001)(71190400001)(2501003)(105004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1721;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 99n5yYNYnupyYFvNjHolxXCitZRZ/4eWLhQy1HPToTwskyaoWTjnW58pnwQ5WNKtjQlhr9PQTuujQoUqI8rGMztxixsCfuRcDjHz5ULMrAJsb/uMCn6ET3xNk7UZG7IlSP18WidJMTdaSI2XJSIr+6v8xGDFMIGfHmtRChN7SF1wG7rDlpOCZ0AZyr7ERl402DViGN2hs/vhqZ0a9jZVCe/0uPF0T06H9Shln8oKx/FfMV9xqesAK+yiRtrUTVVsjlbe9cGZhqTxNoW92dEMauvJsRUfkrpImKZMMijmkMSBpRQ2EE2ZCK80j/8ONc33QNK9Y9u79nPYzh5h3dhDlw1BQMeFYTGgSZroOflshujFmDtUmql3ecXQs5lRHA+C2LJ6OKhWX73qSmJ1meqBY7iXefOxuR9tEBUD5RoUZ+A=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51ed1de9-7fc0-4a78-ba6a-08d72c514ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 07:20:02.1058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c16PyHAdsXNgMLJSUa0xr8HANTJT/Zk2jpM3yGbZU67q2oZZKAhl2/uYIhXTbsOZl/QCbSCktZ4z6/RM/Mqq9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1721
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGkEtWtjaXMldudzhzh2JVJomOGeIx7d77peueIp4ew=;
 b=UHNPCZUzkNk4YRRDd/Qll3iRxPPwF9ZV4BoYX3V8MnEfSrzDOUyzXzCn54VA4zjbkvKJNxxe9PONTKyeCefbWFzFyD7pYXvO6otbpO77+Uqtd0uEr0YPqsYIGDneZRl1F9v9ANo35XAkuDUKnWRRxOUyZg3yv4fwNg6Kj8gIvt8=
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
Content-Type: multipart/mixed; boundary="===============1446724196=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1446724196==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB2535A0267ACFB40B0CECBE1895A20DM5PR12MB2535namp_"

--_000_DM5PR12MB2535A0267ACFB40B0CECBE1895A20DM5PR12MB2535namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok, I'll fix that, thanks!
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Thursday, August 29, 2019 15:13
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Xu, Feifei <Feifei.Xu@amd.com>; Ma, Le <Le.Ma@amd.com>; Xiao, Jack <Jac=
k.Xiao@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: Re: [PATCH 2/2] drm/amdgpu: keep the stolen memory in visible vram=
 region

Am 29.08.19 um 05:05 schrieb Tianci Yin:
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> stolen memory should be fixed in visible region.
>
> Change-Id: Icbbbd39fd113e93423aad8d2555f4073c08020e5
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 ++++--
>   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   | 3 ++-
>   2 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 801f912..dcd32d0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1733,6 +1733,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>        uint64_t gtt_size;
>        int r;
>        u64 vis_vram_limit;
> +     void *stolen_vga_buf;
>
>        mutex_init(&adev->mman.gtt_window_lock);
>
> @@ -1787,7 +1788,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>        r =3D amdgpu_bo_create_kernel(adev, adev->gmc.stolen_size, PAGE_SI=
ZE,
>                                    AMDGPU_GEM_DOMAIN_VRAM,
>                                    &adev->stolen_vga_memory,
> -                                 NULL, NULL);
> +                                 NULL, &stolen_vga_buf);
>        if (r)
>                return r;
>        DRM_INFO("amdgpu: %uM of VRAM memory ready\n",
> @@ -1851,8 +1852,9 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>    */
>   void amdgpu_ttm_late_init(struct amdgpu_device *adev)
>   {
> +     void *stolen_vga_buf;

Coding style says we should add a new line between declaration and code.

Apart from that the series is Reviewed-by: Christian K=F6nig
<christian.koenig@amd.com>.

>        /* return the VGA stolen memory (if any) back to VRAM */
> -     amdgpu_bo_free_kernel(&adev->stolen_vga_memory, NULL, NULL);
> +     amdgpu_bo_free_kernel(&adev->stolen_vga_memory, NULL, &stolen_vga_b=
uf);
>   }
>
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/=
amdgpu/gmc_v9_0.c
> index f77138b..ab43ae2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
> @@ -1248,6 +1248,7 @@ static int gmc_v9_0_sw_init(void *handle)
>   static int gmc_v9_0_sw_fini(void *handle)
>   {
>        struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +     void *stolen_vga_buf;
>
>        if (amdgpu_ras_is_supported(adev, AMDGPU_RAS_BLOCK__UMC) &&
>                        adev->gmc.umc_ras_if) {
> @@ -1280,7 +1281,7 @@ static int gmc_v9_0_sw_fini(void *handle)
>        amdgpu_vm_manager_fini(adev);
>
>        if (gmc_v9_0_keep_stolen_memory(adev))
> -             amdgpu_bo_free_kernel(&adev->stolen_vga_memory, NULL, NULL)=
;
> +             amdgpu_bo_free_kernel(&adev->stolen_vga_memory, NULL, &stol=
en_vga_buf);
>
>        amdgpu_gart_table_vram_free(adev);
>        amdgpu_bo_fini(adev);


--_000_DM5PR12MB2535A0267ACFB40B0CECBE1895A20DM5PR12MB2535namp_
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
Ok, I'll fix that, thanks!<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Thursday, August 29, 2019 15:13<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Xu, Feifei &lt;Feifei.Xu@amd.com&gt;; Ma, Le &lt;Le.Ma@amd.com&g=
t;; Xiao, Jack &lt;Jack.Xiao@amd.com&gt;; Zhang, Hawking &lt;Hawking.Zhang@=
amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 2/2] drm/amdgpu: keep the stolen memory in visib=
le vram region</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 29.08.19 um 05:05 schrieb Tianci Yin:<br>
&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt;<br>
&gt; stolen memory should be fixed in visible region.<br>
&gt;<br>
&gt; Change-Id: Icbbbd39fd113e93423aad8d2555f4073c08020e5<br>
&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 6 &#43;&#43;&#43=
;&#43;--<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c&nbsp;&nbsp; | 3 &#43=
;&#43;-<br>
&gt;&nbsp;&nbsp; 2 files changed, 6 insertions(&#43;), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c<br>
&gt; index 801f912..dcd32d0 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; @@ -1733,6 &#43;1733,7 @@ int amdgpu_ttm_init(struct amdgpu_device *ad=
ev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t gtt_size;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 vis_vram_limit;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *stolen_vga_buf;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_init(&amp;adev-&gt;mma=
n.gtt_window_lock);<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -1787,7 &#43;1788,7 @@ int amdgpu_ttm_init(struct amdgpu_device *ad=
ev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_create_kerne=
l(adev, adev-&gt;gmc.stolen_size, PAGE_SIZE,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AMDGPU_GEM=
_DOMAIN_VRAM,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;adev-=
&gt;stolen_vga_memory,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, &amp;stolen_vga_=
buf);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_INFO(&quot;amdgpu: %uM o=
f VRAM memory ready\n&quot;,<br>
&gt; @@ -1851,8 &#43;1852,9 @@ int amdgpu_ttm_init(struct amdgpu_device *ad=
ev)<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp; void amdgpu_ttm_late_init(struct amdgpu_device *adev)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *stolen_vga_buf;<br>
<br>
Coding style says we should add a new line between declaration and code.<br=
>
<br>
Apart from that the series is Reviewed-by: Christian K=F6nig <br>
&lt;christian.koenig@amd.com&gt;.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* return the VGA stolen mem=
ory (if any) back to VRAM */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;adev-&gt;stolen_v=
ga_memory, NULL, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;adev-&gt;stol=
en_vga_memory, NULL, &amp;stolen_vga_buf);<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; /**<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/a=
md/amdgpu/gmc_v9_0.c<br>
&gt; index f77138b..ab43ae2 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c<br>
&gt; @@ -1248,6 &#43;1248,7 @@ static int gmc_v9_0_sw_init(void *handle)<br=
>
&gt;&nbsp;&nbsp; static int gmc_v9_0_sw_fini(void *handle)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev =
=3D (struct amdgpu_device *)handle;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; void *stolen_vga_buf;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_ras_is_supported(=
adev, AMDGPU_RAS_BLOCK__UMC) &amp;&amp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&g=
t;gmc.umc_ras_if) {<br>
&gt; @@ -1280,7 &#43;1281,7 @@ static int gmc_v9_0_sw_fini(void *handle)<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vm_manager_fini(adev)=
;<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gmc_v9_0_keep_stolen_mem=
ory(adev))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; amdgpu_bo_free_kernel(&amp;adev-&gt;stolen_vga_memory, NULL, NULL);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; amdgpu_bo_free_kernel(&amp;adev-&gt;stolen_vga_memory, NULL, &amp;s=
tolen_vga_buf);<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_gart_table_vram_free(=
adev);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_fini(adev);<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM5PR12MB2535A0267ACFB40B0CECBE1895A20DM5PR12MB2535namp_--

--===============1446724196==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1446724196==--

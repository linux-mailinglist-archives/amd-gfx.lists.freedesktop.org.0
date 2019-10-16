Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B95D85E2
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 04:24:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16DF6E88C;
	Wed, 16 Oct 2019 02:24:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710079.outbound.protection.outlook.com [40.107.71.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78C06E88C
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 02:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsxyCVAv28EF2Oqga0qnwyn4E2/a7InoASQBvtjrFGBZ3U7WXoMj5u6sJZKjtXQqVmY3l8Eh5oRFU44i8zXFIUL9cwxp7k3ULjZ4eVdX54p6vgp6S2RyL1FVqfkx+ugXThyOcQ/6c3i+lFoJmR38wFuzZaq4TJi6SYPI6OKBDDYWy3AXkJjtdowmX/9sbsItQqXB3QFL2HKv8EThEUEx/rEo/j7UfLq9hl/eivGoz5MEwmR87uKu1BNDRxwEyK8ggiTFrrvY1NvVv5+BHAe4mITljSqF9YxlRXBIYaFL2mQWrFYPrEWT5kRgCHonaSh9F/limZ6I5MJ4e4YVMY/vRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEHKkt/dEbg2oJwtd5QMuwc9CQDhCAWVlze0UIF8uyE=;
 b=KtYLAtU1cQvsaoGbetZ9T7N+8oUhSffF9Y4BF7d0feDkKX2RMBewfiqUZxPobVKfpHv2uCKNreE4gFMuz90RYvbGgbPFduCLXTofc9BEsT6zNDTLr8PFgUh6WpXRUWn2lpvDEr07X6/Yx6jwstz8CAMj3hwjyCkW74Rb1uXCOR2antfiRlKaZG7XAm+mmjNw2iGBzIZOZLr1nfGSwaRcNQFfPkIUO58UVHJMD5S98ZIrOtWZROkFeDcm89MxydAG1D8Hy01Q2MEUN00v4P8ouViANNuM3TWGTcXaMHAMZzE1V3DPsLz+OMFzUdrmEiespJeFz/3Esrc8QVBiQA79Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB2535.namprd12.prod.outlook.com (52.132.141.154) by
 DM5PR12MB1273.namprd12.prod.outlook.com (10.168.238.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Wed, 16 Oct 2019 02:24:40 +0000
Received: from DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::8d85:da2d:2f38:9b87]) by DM5PR12MB2535.namprd12.prod.outlook.com
 ([fe80::8d85:da2d:2f38:9b87%4]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 02:24:40 +0000
From: "Yin, Tianci (Rico)" <Tianci.Yin@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to handle revision
Thread-Topic: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to handle
 revision
Thread-Index: AQHVgj58MvyWFu6TgECJVYvuzuYwG6dcAJWAgACLaJ8=
Date: Wed, 16 Oct 2019 02:24:40 +0000
Message-ID: <DM5PR12MB25351094FEEF76BE2325FB1895920@DM5PR12MB2535.namprd12.prod.outlook.com>
References: <20191014032118.14020-1-tianci.yin@amd.com>,
 <e4b046e5-b91a-997c-e47c-dae0360d3a27@amd.com>
In-Reply-To: <e4b046e5-b91a-997c-e47c-dae0360d3a27@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b52541b7-4279-418c-3898-08d751dfff8f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB1273:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1273B854BD0DC39E634743A795920@DM5PR12MB1273.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(189003)(199004)(7736002)(81156014)(105004)(86362001)(476003)(4001150100001)(2501003)(81166006)(446003)(19627405001)(3846002)(66066001)(11346002)(14454004)(6116002)(8936002)(33656002)(478600001)(486006)(316002)(5660300002)(74316002)(8676002)(186003)(54906003)(2906002)(6246003)(229853002)(52536014)(9686003)(54896002)(110136005)(256004)(25786009)(14444005)(66446008)(26005)(7696005)(99286004)(76116006)(6506007)(64756008)(66556008)(66476007)(91956017)(53546011)(4326008)(71200400001)(6436002)(102836004)(76176011)(15650500001)(71190400001)(55016002)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1273;
 H:DM5PR12MB2535.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vZsFpHD2Y2nQdb4bBh7VSzJu3w66dqVSbKwPWvrbBV+4LyypnkxVqpWnpTSJWkUZ+IgKHUxIvHCCNflutQy3YNOjWs90VqAU1UQ53XXndDY8VWJ4uAKuzZ+CN9wojVRbNHAzRfVdqIyoEzwYYESk2GdFsJ0tT5IAPvqD1aRy219o268Ep9D+ZKiJxBuWq1E1lCvdIvvkJjd/gdGCfMGIyAm1TycgkKOsWTRbcAEtiWuRwdV/GAxaJq1PvHoOjsUCXcixOV5tclVvaT5cFtZJS0zpM6sn6fmL3rdefAKrsiu26umFpX9Nq1qWRMTkBGR+5XxAyQR3V4m27TKicAfdv723JvkblYNl6YPDIXA3jsY6JLlGq6vlskSCojumqIq4Umtld0CiYhu2SO/TAFXIpOQXh5bNz8rGkmM+iVfWW6E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52541b7-4279-418c-3898-08d751dfff8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 02:24:40.1518 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RTDcHTZqXOLXR6QV79u3iN48sDF/dQalvmYbwDOJVPcACfAmQdZUND6KY/QZ0QmVnrN2FeiUJxl/LLTiBemSTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1273
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JEHKkt/dEbg2oJwtd5QMuwc9CQDhCAWVlze0UIF8uyE=;
 b=ie+a/88JzUfxhRKcaiiNXKZnCyY1c2mAh/3GBHUbG/D9kdNYRxeTD6Ydshb/Ce15FQ+vzg/RDXkVhzYcIyJzaSXrKaEWABAAU4XMkaLDywMXJLHEUPHauClQPKd92eOzJyNBklS+0CCtnOlrj/3W+LkQ98kkdCWnWMKm5p3t0I0=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1017752991=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============1017752991==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM5PR12MB25351094FEEF76BE2325FB1895920DM5PR12MB2535namp_"

--_000_DM5PR12MB25351094FEEF76BE2325FB1895920DM5PR12MB2535namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Luben!
Patch 8 v2 has sent out, please review again.
________________________________
From: Tuikov, Luben <Luben.Tuikov@amd.com>
Sent: Wednesday, October 16, 2019 2:01
To: Yin, Tianci (Rico) <Tianci.Yin@amd.com>; amd-gfx@lists.freedesktop.org =
<amd-gfx@lists.freedesktop.org>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>
Subject: Re: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to handle revi=
sion

Patches 1-7: Looks good.
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Patch 8: NAK! for the same exact reason as the previous review. No changes =
to NAK reasoning from previous review.

Regards,
Luben

On 2019-10-13 11:21 p.m., Tianci Yin wrote:
> From: "Tianci.Yin" <tianci.yin@amd.com>
>
> update amdgpu_discovery to get IP revision.
>
> Change-Id: If8152103d03b58e1dc0f32db63625e290f5f08a0
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Tianci.Yin <tianci.yin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 4 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index 71198c5318e1..ddd8364102a2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -333,7 +333,7 @@ int amdgpu_discovery_reg_base_init(struct amdgpu_devi=
ce *adev)
>  }
>
>  int amdgpu_discovery_get_ip_version(struct amdgpu_device *adev, int hw_i=
d,
> -                                 int *major, int *minor)
> +                                 int *major, int *minor, int *revision)
>  {
>        struct binary_header *bhdr;
>        struct ip_discovery_header *ihdr;
> @@ -369,6 +369,8 @@ int amdgpu_discovery_get_ip_version(struct amdgpu_dev=
ice *adev, int hw_id,
>                                        *major =3D ip->major;
>                                if (minor)
>                                        *minor =3D ip->minor;
> +                             if (revision)
> +                                     *revision =3D ip->revision;
>                                return 0;
>                        }
>                        ip_offset +=3D sizeof(*ip) + 4 * (ip->num_base_add=
ress - 1);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.h
> index 5a6693d7d269..ba78e15d9b05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h
> @@ -30,7 +30,7 @@ int amdgpu_discovery_init(struct amdgpu_device *adev);
>  void amdgpu_discovery_fini(struct amdgpu_device *adev);
>  int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev);
>  int amdgpu_discovery_get_ip_version(struct amdgpu_device *adev, int hw_i=
d,
> -                                    int *major, int *minor);
> +                                    int *major, int *minor, int *revisio=
n);
>  int amdgpu_discovery_get_gfx_info(struct amdgpu_device *adev);
>
>  #endif /* __AMDGPU_DISCOVERY__ */
>


--_000_DM5PR12MB25351094FEEF76BE2325FB1895920DM5PR12MB2535namp_
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
Thanks Luben!</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Patch 8 v2 has sent out, please review again.<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tuikov, Luben &lt;Lub=
en.Tuikov@amd.com&gt;<br>
<b>Sent:</b> Wednesday, October 16, 2019 2:01<br>
<b>To:</b> Yin, Tianci (Rico) &lt;Tianci.Yin@amd.com&gt;; amd-gfx@lists.fre=
edesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Ch=
ristian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH 1/8] drm/amdgpu: update amdgpu_discovery to hand=
le revision</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Patches 1-7: Looks good.<br>
Reviewed-by: Luben Tuikov &lt;luben.tuikov@amd.com&gt;<br>
<br>
Patch 8: NAK! for the same exact reason as the previous review. No changes =
to NAK reasoning from previous review.<br>
<br>
Regards,<br>
Luben<br>
<br>
On 2019-10-13 11:21 p.m., Tianci Yin wrote:<br>
&gt; From: &quot;Tianci.Yin&quot; &lt;tianci.yin@amd.com&gt;<br>
&gt; <br>
&gt; update amdgpu_discovery to get IP revision.<br>
&gt; <br>
&gt; Change-Id: If8152103d03b58e1dc0f32db63625e290f5f08a0<br>
&gt; Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
&gt; Signed-off-by: Tianci.Yin &lt;tianci.yin@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 4 &#43;&#43;&#43=
;-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h | 2 &#43;-<br>
&gt;&nbsp; 2 files changed, 4 insertions(&#43;), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; index 71198c5318e1..ddd8364102a2 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c<br>
&gt; @@ -333,7 &#43;333,7 @@ int amdgpu_discovery_reg_base_init(struct amdg=
pu_device *adev)<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp; int amdgpu_discovery_get_ip_version(struct amdgpu_device *adev, =
int hw_id,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *major, int *minor)<br=
>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *major, int *minor=
, int *revision)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct binary_header *bhdr;<=
br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ip_discovery_header *=
ihdr;<br>
&gt; @@ -369,6 &#43;369,8 @@ int amdgpu_discovery_get_ip_version(struct amd=
gpu_device *adev, int hw_id,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; *major =3D ip-&gt;major;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (minor)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; *minor =3D ip-&gt;minor;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; if (revision)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; *revision =3D ip-&gt;revision;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ip_offs=
et &#43;=3D sizeof(*ip) &#43; 4 * (ip-&gt;num_base_address - 1);<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_discovery.h<br>
&gt; index 5a6693d7d269..ba78e15d9b05 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.h<br>
&gt; @@ -30,7 &#43;30,7 @@ int amdgpu_discovery_init(struct amdgpu_device *=
adev);<br>
&gt;&nbsp; void amdgpu_discovery_fini(struct amdgpu_device *adev);<br>
&gt;&nbsp; int amdgpu_discovery_reg_base_init(struct amdgpu_device *adev);<=
br>
&gt;&nbsp; int amdgpu_discovery_get_ip_version(struct amdgpu_device *adev, =
int hw_id,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *maj=
or, int *minor);<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int =
*major, int *minor, int *revision);<br>
&gt;&nbsp; int amdgpu_discovery_get_gfx_info(struct amdgpu_device *adev);<b=
r>
&gt;&nbsp; <br>
&gt;&nbsp; #endif /* __AMDGPU_DISCOVERY__ */<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM5PR12MB25351094FEEF76BE2325FB1895920DM5PR12MB2535namp_--

--===============1017752991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1017752991==--

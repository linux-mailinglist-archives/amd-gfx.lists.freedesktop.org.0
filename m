Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B38C8D6DA
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 17:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E509D6E605;
	Wed, 14 Aug 2019 15:08:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810048.outbound.protection.outlook.com [40.107.81.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21666E605
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 15:08:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JkffWKzPE45lovNArtmvf8eJvJU+qNfGvuvrQIyUPg2CmEheObFYTEdF/Fh/7aGWqnnB9FFX6Oe8BWJLFw1f5vgotuV2HyjkU61euM1zIJg9OHHpNPA00niLWdWzEhBukAwr/FKUsLP3/q+2r70frT/hZkDvpowSgzz79w6bUv72eXSlLaLHKHs+ApiGTS7CLt9zYTPuGY5SocuHJpCDwsG2398w8kKZR0gzi1I2YKnaFKAWLjLwVzGx3SPNjLTINcW1FLs/lWlX3NYwf9fRKbtLroNWHxQhzKvS8Qc107UNpqhua+tlnVg7pKBEiaeeD5981N9MtswsIbsW2qNRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T9QHezCM+I0Wzse0DscVGYciJun2VRaTqSIBO6kwJk=;
 b=mX0ujkzQcoxOExrWKpTiJbztdQOtFoF0iO3qfwN8cbRdsmtf/i4KWGR7oxG4OzGf4uksHIHRPb+N8ArCt3HdR7oqy4W3TPMND0xUwVeqpzIERGEgaL4dk8Htdb/IoNafyG2Eptvu1FfYVXmdfMax3UCofZ2q7+8fx7AiGmhjhINfXx6Rn2u8PZc/7mnO/ybrygm73hSFVJ/sNKrSR+SymcgHTUddAJpuJxD4alXDQ2wE9vNbCUulg88paX296Xhkc459zxHTiT8xmXa3VPh4T0KXZfCIkbUTM/DmfXqCaAU3eXYneR2FttddtupaXSSjCKk+I1qlqHwcIBAc039vLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1876.namprd12.prod.outlook.com (10.175.100.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Wed, 14 Aug 2019 15:08:31 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::8542:935:262c:53d1%10]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 15:08:31 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Ba, Gang" <Gang.Ba@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] Update VM function point when VM state changed.
Thread-Topic: [PATCH] Update VM function point when VM state changed.
Thread-Index: AQHVUrEwRaNojQYwakGNCbMz8tsfiqb6vkoAgAAAflY=
Date: Wed, 14 Aug 2019 15:08:30 +0000
Message-ID: <BN6PR12MB1809DCC56C3DC599C9317270F7AD0@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <1565794853-25275-1-git-send-email-gaba@amd.com>,
 <d21d6399-fe1d-72b1-167a-c117c2a34a6b@gmail.com>
In-Reply-To: <d21d6399-fe1d-72b1-167a-c117c2a34a6b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.58.219.65]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bae42a9-8d4a-42b7-d0e2-08d720c944c1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1876; 
x-ms-traffictypediagnostic: BN6PR12MB1876:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1876976D7815C97F7935AC19F7AD0@BN6PR12MB1876.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(189003)(199004)(606006)(66574012)(9686003)(110136005)(5660300002)(14444005)(19627405001)(2501003)(256004)(7736002)(66476007)(71200400001)(11346002)(99286004)(66556008)(14454004)(229853002)(55016002)(6436002)(33656002)(64756008)(66946007)(6306002)(54896002)(74316002)(6636002)(76116006)(71190400001)(966005)(86362001)(316002)(66066001)(52536014)(81156014)(478600001)(236005)(102836004)(53936002)(476003)(81166006)(186003)(66446008)(486006)(7696005)(25786009)(53546011)(6116002)(8676002)(105004)(6246003)(446003)(26005)(6506007)(76176011)(2906002)(8936002)(15650500001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1876;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LHhQmJZRcsRyIo2KSVkTPp3yrk+qQhkNvLRxeGnQ7JRBBma9asXaCe+J43s4I22uxzJ4FBs6jqgr/+k1Ou1+n0bzBC+cspSMBpvW5ZFI4DcuqKyNCRkkStkMI8FRqQV2gAUbDkG+I43nVOczu67Itwok3thyAUvl5SKQVvfobUWPD68qLi34p6H+m3Kd2mDn9JDxPX0ZzV8UxFVGIHsukulM5QP4dCcW/YSayJ9BUDHVfuTJdAChNArD8rxLa3I+MDwclkSYIqHLOaxbGj3kEV9psVkn8Ups3ReokP0swURkA7+ehKktxMPTMB4u2vlY+mug/OqEwB2oixpC8uqKjZHmd5y5ddr5NDWCDB0TJolY3A13wfZ3dzPuT90/DaPHdtkQWgpB4zhDi2v0RS95fBzs6kFdVYmsChg9NmYLJuI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bae42a9-8d4a-42b7-d0e2-08d720c944c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 15:08:30.9142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LlnEHyQlor3W9u/ef8rZY9ed55klh2rnASZraE4Y7jlGlOcpNJRGgJbyYJ5EMm1YUeSlsIn3oNIX8hlysdCNpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1876
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T9QHezCM+I0Wzse0DscVGYciJun2VRaTqSIBO6kwJk=;
 b=owjjU2SxpYA3c7VXswMmZ8JdvsAB3RcE96IiVDpjRX5/sat0ZOuCf6HYYM1wh+UEriyb9zroVCk2vbJTsVg6mO3AYPMTk087toDDKTD4GdDcBg8mm64H60Akqf44u5peP8jyB3K8t9KQ99OpXnGr3PDIrtBAsIkjMpt3e4GylNk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============0378470546=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--===============0378470546==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809DCC56C3DC599C9317270F7AD0BN6PR12MB1809namp_"

--_000_BN6PR12MB1809DCC56C3DC599C9317270F7AD0BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please also include a patch description so we understand why this change is=
 needed.

Alex
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Christia=
n K?nig <ckoenig.leichtzumerken@gmail.com>
Sent: Wednesday, August 14, 2019 11:06 AM
To: Ba, Gang <Gang.Ba@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@list=
s.freedesktop.org>
Cc: Ba, Gang <Gang.Ba@amd.com>
Subject: Re: [PATCH] Update VM function point when VM state changed.

Am 14.08.19 um 17:01 schrieb Gang Ba:
> Change-Id: Ibcfada560a00c9aeebfd922ae48de920e44a5866
> Signed-off-by: Gang Ba <gaba@amd.com>

Good catch, but there is a problem below.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index c1baf3d..72dd434 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2862,6 +2862,12 @@ int amdgpu_vm_make_compute(struct amdgpu_device *a=
dev, struct amdgpu_vm *vm, uns
>        WARN_ONCE((vm->use_cpu_for_update && !amdgpu_gmc_vram_full_visible=
(&adev->gmc)),
>                  "CPU update of VM recommended only for large BAR system\=
n");
>
> +     if (vm->use_cpu_for_update)
> +             vm->update_funcs =3D &amdgpu_vm_cpu_funcs;
> +     else
> +             vm->update_funcs =3D &amdgpu_vm_sdma_funcs;
> +     vm->last_update =3D NULL;

You can't just set last_update to NULL or your would leak the memory the
fence occupies. So this needs to be:

dma_fence_put(vm->last_update);
vm->last_update =3D NULL;

Regards,
Christian.

> +
>        if (vm->pasid) {
>                unsigned long flags;
>

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809DCC56C3DC599C9317270F7AD0BN6PR12MB1809namp_
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
Please also include a patch description so we understand why this change is=
 needed.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Christian K&ouml;nig &lt;ckoe=
nig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, August 14, 2019 11:06 AM<br>
<b>To:</b> Ba, Gang &lt;Gang.Ba@amd.com&gt;; amd-gfx@lists.freedesktop.org =
&lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Ba, Gang &lt;Gang.Ba@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] Update VM function point when VM state changed.=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 14.08.19 um 17:01 schrieb Gang Ba:<br>
&gt; Change-Id: Ibcfada560a00c9aeebfd922ae48de920e44a5866<br>
&gt; Signed-off-by: Gang Ba &lt;gaba@amd.com&gt;<br>
<br>
Good catch, but there is a problem below.<br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 6 &#43;&#43;&#43;=
&#43;&#43;&#43;<br>
&gt;&nbsp;&nbsp; 1 file changed, 6 insertions(&#43;)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_vm.c<br>
&gt; index c1baf3d..72dd434 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c<br>
&gt; @@ -2862,6 &#43;2862,12 @@ int amdgpu_vm_make_compute(struct amdgpu_de=
vice *adev, struct amdgpu_vm *vm, uns<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ONCE((vm-&gt;use_cpu_fo=
r_update &amp;&amp; !amdgpu_gmc_vram_full_visible(&amp;adev-&gt;gmc)),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;CPU update of VM recommended only for=
 large BAR system\n&quot;);<br>
&gt;&nbsp;&nbsp; <br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; if (vm-&gt;use_cpu_for_update)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vm-&gt;update_funcs =3D &amp;amdgpu_vm_cpu_funcs;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; vm-&gt;update_funcs =3D &amp;amdgpu_vm_sdma_funcs;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; vm-&gt;last_update =3D NULL;<br>
<br>
You can't just set last_update to NULL or your would leak the memory the <b=
r>
fence occupies. So this needs to be:<br>
<br>
dma_fence_put(vm-&gt;last_update);<br>
vm-&gt;last_update =3D NULL;<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; &#43;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vm-&gt;pasid) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&gt;&nbsp;&nbsp; <br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809DCC56C3DC599C9317270F7AD0BN6PR12MB1809namp_--

--===============0378470546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============0378470546==--
